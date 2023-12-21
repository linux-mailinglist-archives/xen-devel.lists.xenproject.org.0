Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDEB81B4DA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 12:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658846.1028252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGH9u-0003kW-QO; Thu, 21 Dec 2023 11:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658846.1028252; Thu, 21 Dec 2023 11:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGH9u-0003g2-Mo; Thu, 21 Dec 2023 11:24:10 +0000
Received: by outflank-mailman (input) for mailman id 658846;
 Thu, 21 Dec 2023 11:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGH9t-0003fw-5X
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 11:24:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c2abfe-9ff3-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 12:24:08 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so6795795e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 03:24:08 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 i5-20020a05600c354500b0040d2805d158sm2907884wmq.48.2023.12.21.03.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 03:24:06 -0800 (PST)
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
X-Inumbo-ID: 74c2abfe-9ff3-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703157847; x=1703762647; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlf2+bmiLQ5b85jTu7sVEr4EClQhy1uBqyFSh7q5ri4=;
        b=X/2GMI0vyMyj6K/b/PpG2zCQrK6l7A3rQWel2KUzu1VwOMbvvfOGNGkEmti8YMAG14
         Xw+POv5aeU2xMu+RE4DrstyDZQIxZvnzLmxJN+cvwFT0stFJCzXyx4FQ3/yqSLW6+abW
         7lWpenFtkj8y6ji5byjiKUPJvk80iXov3qnUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703157847; x=1703762647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlf2+bmiLQ5b85jTu7sVEr4EClQhy1uBqyFSh7q5ri4=;
        b=nnOxYtHjK5+GlJ139UJP6/I+/uq+x6/ejd0y/dSrNxISoRmwHvCoROYa1aYgdAnSpw
         G+OmuzRmy2L3FJvhvwDYCiLD4ujnAAnIThu66P9rYkmbdZ3Tc5mRxRUpYwyFejDGpmDJ
         b8Nr8HepJibuXpntNDGDxxTp7LPaZOh0y5S6N1uWCxk/I7HZYbYqYsA5nTu3xbYMDef1
         MZXRWj3dmp/xv9fv0l1/rfEFuto9N6QspmR4lTQVG/+5x4/MLUeQot+mJY9fT2Zgqt9a
         35RBa7ZMv8iSdcNbNiMm06jvsTG6GW7wqVMnKmyIsitoXhz9ohRF16sNiWFHQbuqNtAA
         +SCg==
X-Gm-Message-State: AOJu0YySGx6lLofOw6s+cwYrQ1u2ttHrOUuN4opo/H8s50U18MCg/hPO
	fRi+GpVO8ryiWJf/AJQXmSDORw==
X-Google-Smtp-Source: AGHT+IFH68xEkju2dNuXZ2vblO+osBA3HvQwUmm1OcetADR2uLTahE7nKOg/ckm/CDPiseBpTm+vyw==
X-Received: by 2002:a05:600c:4709:b0:40c:3624:fc40 with SMTP id v9-20020a05600c470900b0040c3624fc40mr638388wmo.15.1703157847574;
        Thu, 21 Dec 2023 03:24:07 -0800 (PST)
Date: Thu, 21 Dec 2023 12:24:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/iommu: add CHANGELOG entry for hwdom setup time
 improvements
Message-ID: <ZYQgVQ-OdMDhYE7y@macbook>
References: <20231220134346.22430-1-roger.pau@citrix.com>
 <20231221101244.25650-1-roger.pau@citrix.com>
 <c4c1d007-1c38-495d-9f1c-ee7e679f57ce@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4c1d007-1c38-495d-9f1c-ee7e679f57ce@suse.com>

On Thu, Dec 21, 2023 at 11:23:49AM +0100, Jan Beulich wrote:
> On 21.12.2023 11:12, Roger Pau Monne wrote:
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  CHANGELOG.md | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 5ee5d41fc933..52484c047bd1 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >  ### Changed
> >   - Changed flexible array definitions in public I/O interface headers to not
> >     use "1" as the number of array elements.
> > + - On x86:
> > +   - Reduce IOMMU setup time for hardware domain.
> >  
> >  ### Added
> >   - On x86:
> 
> I'm a little puzzled: Isn't this more like patch 7/6 of the v4 series
> (or possibly patch 5.5/6), which hasn't gone in yet?

Yes, that's why I've sent it as a reply-to the cover letter.  I
assumed it was clear enough that it's only supposed to go in after the
rest of the series.  Should have been 7/7, but I forgot about it.

Regards, Roger.

