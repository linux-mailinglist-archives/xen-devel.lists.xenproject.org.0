Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370D86FC4C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688214.1072143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh41W-0004ZR-1g; Mon, 04 Mar 2024 08:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688214.1072143; Mon, 04 Mar 2024 08:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh41V-0004Wo-VO; Mon, 04 Mar 2024 08:50:13 +0000
Received: by outflank-mailman (input) for mailman id 688214;
 Mon, 04 Mar 2024 08:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0qD=KK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rh41U-0004VW-Hc
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:50:12 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ebb249-da04-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 09:50:10 +0100 (CET)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-68f9e399c91so37368076d6.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 00:50:10 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 oq19-20020a056214461300b0068fda0c74b6sm4850742qvb.27.2024.03.04.00.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 00:50:08 -0800 (PST)
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
X-Inumbo-ID: 34ebb249-da04-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709542209; x=1710147009; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2iQsYgpcJeewpHyRp27DEUfjuH004zf8nf+BLQvLE8=;
        b=I5WYCr7URdUyboS2cfTOUfnQ5mM9otKubei9qr49iUzGVntlV5tmCfQAwCl2qPRO9i
         54DZ09pPhX61dr39PpAH9+23+Cc4me+YGv3dIsnlQEKSuwv7MirORIsazHfP+XxOIChD
         GSdkA7tmHqugJ+rX5VuSQkUsKxSoPDEnIh/KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709542209; x=1710147009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2iQsYgpcJeewpHyRp27DEUfjuH004zf8nf+BLQvLE8=;
        b=oDM5aGBh9E4AWVli5DuQFRnwLcBkmODc5h1P2tKhSWucXa/PaQLfsHn1DGxt9Y8ctb
         z0IrfA4L8JbGoboMDB19lwRmD4vfoI/EXDN1K+0X5kasNXtT4+muwPdBRdLTDU3kJYa+
         JXpbaU5l3DwLqisvm1/KhMkgVQHkO+KRXIxs/GdcTWJhZLHwVyp5D0ZKs3MjUZF8W1Wl
         dvHHyrQGqmm2SZb+lRlfIvGH6USk/XDpjbfY4KGcua88OXmNFlGx3F00PO/W5IyZTH2H
         Ed6bZgllhoXTX6LgQYy9g+A8/rzNoxVvcE9GoHNBOAQ5hQpP6cxa99FJzKp0cfzRj1D5
         yKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF6Nph8F0X8RD5uP+2U8hWeAy8ruRO9aQaA1U6unYBUiCiKLXG56AprmRRZF2rAgTVCDsnmGuZ051Uo6Z8qu7M/YRjUvJ/QqQuhROUERI=
X-Gm-Message-State: AOJu0YymazprKlsLYJ0t7mVByou8gqGgXboRKDD0RrL3ar7/KthPcBpO
	t774z/hQsCJq/lPx3JPfWhJ2foi2GCUYJ8y2ttmaxCtzS/IFmM12VauXatq5rnrue0pBEOstV4R
	1
X-Google-Smtp-Source: AGHT+IEN3+i0FuQtKQ8ctFnLdqGRAZmQjs+Yx+ked9HHTuYCbBj2/G4IO55WntlJkXDgmw+d5gMwgA==
X-Received: by 2002:ad4:5599:0:b0:690:1705:5135 with SMTP id f25-20020ad45599000000b0069017055135mr8487288qvx.30.1709542209298;
        Mon, 04 Mar 2024 00:50:09 -0800 (PST)
Date: Mon, 4 Mar 2024 09:50:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/mm: re-implement get_page_light() using an atomic
 increment
Message-ID: <ZeWLP14w8UUeVncq@macbook>
References: <20240301124228.56123-1-roger.pau@citrix.com>
 <6796aeba-52a2-426b-94e5-1852946dce98@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6796aeba-52a2-426b-94e5-1852946dce98@suse.com>

On Mon, Mar 04, 2024 at 08:54:34AM +0100, Jan Beulich wrote:
> On 01.03.2024 13:42, Roger Pau Monne wrote:
> > The current usage of a cmpxchg loop to increase the value of page count is not
> > optimal on amd64, as there's already an instruction to do an atomic add to a
> > 64bit integer.
> > 
> > Switch the code in get_page_light() to use an atomic increment, as that avoids
> > a loop construct.  This slightly changes the order of the checks, as current
> > code will crash before modifying the page count_info if the conditions are not
> > correct, while with the proposed change the crash will happen immediately
> > after having carried the counter increase.  Since we are crashing anyway, I
> > don't believe the re-ordering to have any meaningful impact.
> 
> While I consider this argument fine for ...
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -2580,16 +2580,10 @@ bool get_page(struct page_info *page, const struct domain *domain)
> >   */
> >  static void get_page_light(struct page_info *page)
> >  {
> > -    unsigned long x, nx, y = page->count_info;
> > +    unsigned long old_pgc = arch_fetch_and_add(&page->count_info, 1);
> >  
> > -    do {
> > -        x  = y;
> > -        nx = x + 1;
> > -        BUG_ON(!(x & PGC_count_mask)); /* Not allocated? */
> 
> ... this check, I'm afraid ...
> 
> > -        BUG_ON(!(nx & PGC_count_mask)); /* Overflow? */
> 
> ... this is a problem unless we discount the possibility of an overflow
> happening in practice: If an overflow was detected only after the fact,
> there would be a window in time where privilege escalation was still
> possible from another CPU. IOW at the very least the description will
> need extending further. Personally I wouldn't chance it and leave this
> as a loop.

So you are worried because this could potentially turn a DoS into an
information leak during the brief period of time where the page
counter has overflowed into the PGC state.

My understating is the BUG_ON() was a mere protection against bad code
that could mess with the counter, but that the counter overflowing is
not a real issue during normal operation.

Thanks, Roger.

