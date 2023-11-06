Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2AE7E2001
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 12:29:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627919.978828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxmo-0001n1-5O; Mon, 06 Nov 2023 11:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627919.978828; Mon, 06 Nov 2023 11:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxmo-0001k7-1k; Mon, 06 Nov 2023 11:28:54 +0000
Received: by outflank-mailman (input) for mailman id 627919;
 Mon, 06 Nov 2023 11:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qzxmm-0001k1-Fd
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 11:28:52 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a84cd4b2-7c97-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 12:28:50 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40837ebba42so27447205e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 03:28:50 -0800 (PST)
Received: from EMEAENGAAD19049. ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 fo15-20020a05600c690f00b0040535648639sm11619729wmb.36.2023.11.06.03.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 03:28:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a84cd4b2-7c97-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699270129; x=1699874929; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VGfc3gfbDRrir/J4QO0JhF4Upc3wwkf6/bLgPGcLt9E=;
        b=kCMuayL5OCWI1Glo2RGSfBHhC9E+7THJ2Y9D6wx3GJSa99Yn1qP66+BIQ1fgtAg1Hj
         D23zFOFHIyafEGEW1mo3EoLLETCJx/59m+MLDzCgrKXjOiMUspRvdOndWzK9gcxtXNuJ
         RF9Jebi3rtqzXO8Dlmg17Hu/DRREb9LSglWf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270129; x=1699874929;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGfc3gfbDRrir/J4QO0JhF4Upc3wwkf6/bLgPGcLt9E=;
        b=pU/7r/fvc5aPDZpTcQ18GuAqnblZ9W9RulpSK2uqt4Hjthq2ZeBPDRLfTBLUQBPlvt
         Cc3+IYWSC2mjbmbcbpY731tyYietHvRTSgXpGy6ZHdmxiXkcPrpFooAh2+weVGqTB2XU
         vhJ6H+NmEL6q/ojDlwtxYZvzdhb5ezYhoc8qOiwYfeuRFR2CyZFqNPxbb6MwbKdwGTqf
         9ismOmoei+LtZ5v82l/Ppeww5DWCJrwUO8Emo2CMZB1niQiNv/4WnU9fTfdbovPi2diA
         1zSnd/jVj2kNU3CcJ+CfCFG16wtSS0R1jwAcCOJow0MWMDukhaMrksDkDO+Oiy0+ggbk
         lJsg==
X-Gm-Message-State: AOJu0YykhD3rK87gMWUzDJLiAuvRcWmeqJx3FquwFiLSGxScST7j1/uF
	tnpzJaaMWAzgnqdLyLJO385GofJz2jPUYpyjn1U=
X-Google-Smtp-Source: AGHT+IFHg8gh/H+5jof+h5bmSgoRADpS8Dhuv4DbRs9yCNYJ6ZEhshlAXQ+7+WN2sJUMowLqi0Gfng==
X-Received: by 2002:a05:600c:3b10:b0:408:492a:8f3 with SMTP id m16-20020a05600c3b1000b00408492a08f3mr18466928wms.5.1699270129683;
        Mon, 06 Nov 2023 03:28:49 -0800 (PST)
Message-ID: <6548cdf1.050a0220.f6f91.6db5@mx.google.com>
X-Google-Original-Message-ID: <ZUjN7hxE7ArSwHpg@EMEAENGAAD19049.>
Date: Mon, 6 Nov 2023 11:28:46 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: Remove all DECLARE_* op macros in xc
References: <20231106081946.1055-1-alejandro.vallejo@cloud.com>
 <20231106115852.31df968d.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106115852.31df968d.olaf@aepfle.de>

Hi,

On Mon, Nov 06, 2023 at 11:58:52AM +0100, Olaf Hering wrote:
> Mon,  6 Nov 2023 08:19:46 +0000 Alejandro Vallejo <alejandro.vallejo@cloud.com>:
> 
> > +    struct xen_sysctl sysctl = {0};
> 
> What is that zero doing here?

Some context:
  https://gcc.gnu.org/legacy-ml/gcc/2019-07/msg00066.html

{0} is the standardized form of zero-initialization. I don't mind terribly
using either, but {} requires an extra extension.

> I think a plain {} will do it as well.
> 
> 
> Olaf

It would, but only on compilers implementing GNU C extensions.

Thanks,
Alejandro

