Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725987859B1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 15:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589254.921093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoCc-0005HQ-Rh; Wed, 23 Aug 2023 13:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589254.921093; Wed, 23 Aug 2023 13:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoCc-0005FB-On; Wed, 23 Aug 2023 13:47:18 +0000
Received: by outflank-mailman (input) for mailman id 589254;
 Wed, 23 Aug 2023 13:47:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3PRN=EI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qYoCb-0005F5-Bi
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 13:47:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9243064b-41bb-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 15:47:16 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31c479ede21so2919251f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Aug 2023 06:47:16 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v6-20020a7bcb46000000b003fbb25da65bsm19048963wmj.30.2023.08.23.06.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 06:47:15 -0700 (PDT)
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
X-Inumbo-ID: 9243064b-41bb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692798436; x=1693403236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k0aPLN/EaS/YF5ywh2B6zULMXaN4Yrpyic2bVj2iISw=;
        b=hUUjRe96aaonb5z5HnCVJ6+zAclSuiXSdP37lREJIoPbZEwdpXbrWYCP4SqpEMH/kO
         1Mg8Mjc9WRy4aV+tJirtdsC5iuW/296658QQSkxqe3W9YYuGYpuu4FqhR+H5i4OgaWo6
         U3VcWnhgSNUxTPudzcAAvIO9hVvPBOqQ/CIaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692798436; x=1693403236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0aPLN/EaS/YF5ywh2B6zULMXaN4Yrpyic2bVj2iISw=;
        b=NRs+tuNnPjdsa9DOb+nVroiy2hgK6K8HbfcOAH6FqcbPX/gcsZZiVUf4IlKvs+ccBc
         yysB5y2NQIei1WncNc77A9msObGuOW1MQ8y2see1BEgtCSFNTf/iCEfR2opQR9rA8TTB
         ec4XWXPA9zXlPHnDeSqC6XMpRd0ERhZ838WF0Mj2VnpDkASq/glohXbrlRtjvxUakY3N
         8MZ7O7Y1KcaQ1oZv361DPEy5NDSnbVyUhBKcqV4DycdoxI9SiFmZe09jb+4GUxSLfTmc
         lWIgTQ295ddV8Zf7pWeklfvHM05n29lUgoBLbyRPgOHC7Wapi6mIDhOXpcbkWRFZ7DgT
         hyFw==
X-Gm-Message-State: AOJu0YzGswfr/XzyA5zzdod0ab4Bm8PyqhDSwyhr/XWvkaKfBmVp27UD
	HI8fLd4LoSZEjGQChPp2A3PHVJvI/USJym/PXWVGJQ==
X-Google-Smtp-Source: AGHT+IEhQVN+NfCxL6CZOwuqqPxqEgmMKGkvlSlPWx2Klmr2lMN1NVRMqtjk+BA7uXwHszCQkiQwew==
X-Received: by 2002:a5d:4286:0:b0:317:73d3:441a with SMTP id k6-20020a5d4286000000b0031773d3441amr9016488wrq.46.1692798435955;
        Wed, 23 Aug 2023 06:47:15 -0700 (PDT)
Date: Wed, 23 Aug 2023 14:47:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH] stubdom: remove openssl related clean actions
Message-ID: <e7521955-b979-47f3-83b9-1a4095df8b0c@perard>
References: <20230823083219.19517-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823083219.19517-1-jgross@suse.com>

On Wed, Aug 23, 2023 at 10:32:19AM +0200, Juergen Gross wrote:
> When introducing polarssl into stubdom building the clean targets of
> stubdom/Makefile gained actions for removing openssl directories and
> files additional to polarssl ones.
> 
> As those openssl files are never downloaded or created during build,
> the related actions can be dropped.
> 
> Fixes: bdd516dc6b2f ("vtpm/vtpmmgr and required libs to stubdom/Makefile")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

