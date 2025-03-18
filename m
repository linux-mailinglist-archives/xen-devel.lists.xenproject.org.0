Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6C1A677FC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919363.1323857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYyS-0004lP-LV; Tue, 18 Mar 2025 15:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919363.1323857; Tue, 18 Mar 2025 15:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYyS-0004jx-IP; Tue, 18 Mar 2025 15:35:24 +0000
Received: by outflank-mailman (input) for mailman id 919363;
 Tue, 18 Mar 2025 15:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuYyR-0004jr-U4
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:35:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b436743-040e-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:35:23 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so10389368a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:35:23 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3147e9ab1sm874281966b.52.2025.03.18.08.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 08:35:21 -0700 (PDT)
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
X-Inumbo-ID: 9b436743-040e-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742312122; x=1742916922; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VbA/TOPKax/2KC9AZ0lOBx+5I41+mJzHDuasx5LoO88=;
        b=GonxgzbcWQJJBgKAsYbdNfiV0o6cSu+NKXjY7Pw+QbP0+GQLAAcaKiASCBhT11vEe4
         yfuUlPf3EgZ6uZ2DIHna8EW/fg8HHEEc/bVgetuqEtCBB9uvxGSsQr8wsXoK1S7swUUI
         JsTUGQLS7fH+hGIrCh5sf1UCXpRgnDmRzEDak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312122; x=1742916922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbA/TOPKax/2KC9AZ0lOBx+5I41+mJzHDuasx5LoO88=;
        b=Eyq3DZwuAuixM5iuIgJJ2tZFAYDul/gPqPqqycSsMBwQ3vguf3L81W6ic0hMSPLAuT
         IFnWlxOaJFW8OQzupnT/SCWzibBiwNH8a7cV3lcr967cBDJIx3K8Pvb1Lg1CTRncxr6O
         eBuvkX2r9QIj9huYeO7SxG+O3+zeiyDdmOHiP4iP3KQrFFJcIdbhPRZN//N1rGuY/K0U
         DF6r12OmGZltFWIuo2vMEzqBDjtc5pr657XLO9HRhZbP4PlWUX4xfVuWvWn56On2f7/I
         ZsRImnMxIQrzI8/9N9uVbqZuYCVVgmSH2/3FcduFF2Zwu4kjM3CdWA9XnXcZ6AdpucHu
         XmbA==
X-Forwarded-Encrypted: i=1; AJvYcCWIXL5dWffbhA4gWq7HehfATsFFXQoi9xB664cYwvUg81VZkFkMrO28I1crVVIfI5xkoTb9DyvYLPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6TH1Zx0+EmKIpGk7RnUrKfKjad2eAzlG+Jc/hsHIua6bH2Ewc
	geEVBKggz7F4MwcRAQJm1LVl4TZF75NMCITOPNaqd2hsDmFdHaZbB3qrde+f7pOGXiMxZgd88Lo
	3
X-Gm-Gg: ASbGncvIhVQJy0u51+gR3gEeuzX5KttiWfqQwP3yFuYCE3r4qEPgShZ5p7B6XjmFrae
	lDG4I8GuTxKJjFjTY1RtO+FEqT/VA/8+ySHdJdhsknkFxPysNpx3LxeHQlEclvhxwdHTJztMMjr
	S8a5cVpE6YO65pYB/RuoC5/bdn8LgvDDrZGffDMnpD+6gA7bQfeDvvTcIKNyGU1+Clw8PxUk5qs
	HCxWD+BmLlniMEkD7p9rIqUy5/7XljOOrrXK8WkH1zU0Izh/KKYQzclDhxQtKgC9riKimQ8XKvq
	Hjbhgqi+5dUumWS3J7l0YV9qCUeUX8GqpD/KSwaAMu8YCueMZZRYQxQ=
X-Google-Smtp-Source: AGHT+IHrhzjwOVCjw0zKLuy+yunJiyB2bcJv9CI8B+CSe1WIwOpGsHhvaeLuoEOK38iOTCNnLUP1vQ==
X-Received: by 2002:a17:906:da8c:b0:ac3:991:a631 with SMTP id a640c23a62f3a-ac38d448f16mr510192966b.34.1742312122199;
        Tue, 18 Mar 2025 08:35:22 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:35:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in
 COMPAT_ARG_XLAT_VIRT_BASE
Message-ID: <Z9mSub1DgzoP71-v@macbook.local>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-4-roger.pau@citrix.com>
 <8ad59d67-02f8-415c-93a0-2361e920c017@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ad59d67-02f8-415c-93a0-2361e920c017@suse.com>

On Tue, Mar 18, 2025 at 03:33:03PM +0100, Jan Beulich wrote:
> On 18.03.2025 10:19, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/x86_64/uaccess.h
> > +++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
> > @@ -9,9 +9,9 @@
> >   * a secondary mapping installed, which needs to be used for such accesses in
> >   * the PV case, and will also be used for HVM to avoid extra conditionals.
> >   */
> > -#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
> > -                                   (PERDOMAIN_ALT_VIRT_START - \
> > -                                    PERDOMAIN_VIRT_START))
> > +#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
> > +                                   (PERDOMAIN_VIRT_START - \
> > +                                    PERDOMAIN_ALT_VIRT_START))
> 
> Aren't we then (still) dependent on ordering between PERDOMAIN_VIRT_START
> and PERDOMAIN_ALT_VIRT_START? Would
> 
> #define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
>                                    PERDOMAIN_VIRT_START + \
>                                    PERDOMAIN_ALT_VIRT_START)
> 
> perhaps be less fragile?

PERDOMAIN_{ALT_,}VIRT_START are unsigned long, so this might work.

Note however that even with your suggestion we are still dependant on
ARG_XLAT_START(v) > PERDOMAIN_ALT_VIRT_START, or else the '-' won't
work.  I think I prefer my proposed version, because it's clear that
PERDOMAIN_VIRT_START, ARG_XLAT_START(current) >
PERDOMAIN_ALT_VIRT_START.  With your suggestion that's not obvious.

Thanks, Roger.

