Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D07F33B7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638029.994243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TdR-0001yv-Aa; Tue, 21 Nov 2023 16:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638029.994243; Tue, 21 Nov 2023 16:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TdR-0001vk-7n; Tue, 21 Nov 2023 16:30:01 +0000
Received: by outflank-mailman (input) for mailman id 638029;
 Tue, 21 Nov 2023 16:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYOq=HC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r5TdP-0001uW-Fa
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:29:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35733a84-888b-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 17:29:57 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so24861245e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:29:57 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b004064cd71aa8sm17742352wmq.34.2023.11.21.08.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:29:56 -0800 (PST)
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
X-Inumbo-ID: 35733a84-888b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700584196; x=1701188996; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6DJpdM5d9S0E1CiGcKNC375HvkiyrVyxHnhQzk9A3Fw=;
        b=NymCCwEUU2iSjUcap5AlNhSfVDF6FojrCv01Zm8E7rA2Mj4IuIawSy3RJUZWVgcmhc
         sd4Us8tdS3Wn0B96yRWVew61HjHz1aUXr/KW1F0P+CjZagdc3YkC70CgdQp2GFnxi7xK
         mgpPQnjO5WCdQK2qKGgjy1TaUPGq9VyVDXxwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700584196; x=1701188996;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DJpdM5d9S0E1CiGcKNC375HvkiyrVyxHnhQzk9A3Fw=;
        b=CDlSFv+9Uhh3Co8fO5LEu3REc3EmNHuiR5vtinH2nwNSab0Py14lAFllOwyMrcYyeZ
         3X7RDfF63X4kSRsdhzVelhs//bJt40MLcEfXQ+cucBaGRyELx0eMGXv7uJysZ7Hb4CS6
         ssP2Hvyh5R+9hT9tsRJTgXKGJLnEUgLL01o+R3SvIrtZVjjAvudHzE3s9rhd7ZUbh954
         8idjBx9iJX9appLujI+ybWrviKCr+nxAcSNuZfrlO6o6Wfw2/GtABoEd/W8C0h4YdtbW
         gIZGU6sabIygTckDvAISnv2Bd2FQj4PBUS8QSwKubfsXKNK/p02m1SAo+cMHJAwDFd99
         +DEw==
X-Gm-Message-State: AOJu0Yw1V89tnW5XglyGa9U7IlV5HiHKAdkBuhm5spyZD2yhZqXqmSYk
	BBYa6eHwjA9ny/EZN6IR4kefACaC/YE0N/+IhMM=
X-Google-Smtp-Source: AGHT+IHLjZFluaYMo+naLcOHJ2KfwbZ82SxUz8ECDlMZdZuj4g2wk9y99fsxMd3V0F0lQJ52W8fIiQ==
X-Received: by 2002:a05:600c:5247:b0:408:fe93:a2f7 with SMTP id fc7-20020a05600c524700b00408fe93a2f7mr9019712wmb.37.1700584196209;
        Tue, 21 Nov 2023 08:29:56 -0800 (PST)
Message-ID: <655cdb04.050a0220.8c71d.d7e5@mx.google.com>
X-Google-Original-Message-ID: <ZVzbAVeAKqSEiPCB@EMEAENGAAD19049.>
Date: Tue, 21 Nov 2023 16:29:53 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/x86: On x2APIC mode, derive LDR from APIC_ID
References: <20231121162604.19405-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121162604.19405-1-alejandro.vallejo@cloud.com>

On Tue, Nov 21, 2023 at 04:26:04PM +0000, Alejandro Vallejo wrote:
> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> registers are derivable from each other through a fixed formula.
> 
> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> x2APIC_ID and internally derive LDR (or the other way around)


Ugh, forgot about Roger's commit message request
>I would replace the underscore from x2APIC ID with a space instead.
Happy for that to happen on commit if the rest looks ok.

Cheers,
Alejandro

