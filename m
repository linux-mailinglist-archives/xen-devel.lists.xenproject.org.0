Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36504A98ABC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964718.1355438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7a0W-0003Ud-51; Wed, 23 Apr 2025 13:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964718.1355438; Wed, 23 Apr 2025 13:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7a0W-0003SG-1z; Wed, 23 Apr 2025 13:19:20 +0000
Received: by outflank-mailman (input) for mailman id 964718;
 Wed, 23 Apr 2025 13:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7a0V-0003S8-6R
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:19:19 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f020927-2045-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 15:19:18 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-22c33e4fdb8so67629145ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 06:19:18 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22c50eb4897sm103505275ad.143.2025.04.23.06.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:19:16 -0700 (PDT)
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
X-Inumbo-ID: 8f020927-2045-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745414356; x=1746019156; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62oQ7K4dy9nrm/vpGwtscxHKxFt+1AkagocS38uxEoo=;
        b=boCmWcBODOtzLVQtP4TOydok6mNjZnuKH8dHyMbw0sbVsJSyOmXxyYWPsR2Vn5P9lr
         JuAbAJ+e8GTdKmgA4xLW4ybWeiUlWZnLzNsPJj6pgolWQQHMTpT4LQSHjt8lknN0Sh+K
         nMVGjlEDvIPtf/UFHmNrkdx4JoMiuC97HQdwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414356; x=1746019156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62oQ7K4dy9nrm/vpGwtscxHKxFt+1AkagocS38uxEoo=;
        b=DywCNpYVKAFYJ62ZVYe/Tkp2VxjCQ4TBXPKLgy9t2SjkBL9CnYWmFnNrWDr5J9vlQ7
         RktkuVuecZ3nZ1pFVhPsBOzJY3MEsF6SUm5dYkjgtFwMdKtFLlFKHxN2jvF9OD3z5kgh
         F3a74/XCKmvxbQOjhrfBt6M9vdz0uuyHqKgkkbdSBBNLvLCD9bul2045aX0E67idN6Lf
         ZGvjMcMHfaYcQl59JNCev9zp2Ui/CxKrzxotzq2clUgxU3pGTVeaVo16TbOCmiPF2EkP
         nsRvzIcYBD+sqtZCiHynmtNpNSGxtmzM/qfWjwu2g6O8KguuMI+xfOXQuGJvNYhxbuIP
         NEAg==
X-Gm-Message-State: AOJu0YyoaDUX641GwswfaecFLWrk/TZt9mhB8NcN/EUlbWgFE4JiQ5A1
	wBCg87Uok9QboIYi/K75DEi3YH7RjUz/SyLpY5p80OX6I2sqIvxyuDTuriC8XNM=
X-Gm-Gg: ASbGncs3gN2b5BUaHsiCqtiPWcO60HzLanBe/ZEjdymWiCYXIJJmpVXPX5aNG/Tvtpf
	bEnZX6OaUDAUhOmRLz7VqJzVbXl7WVvTvvfN8iyUa2ET9n8k9tRCMim27txrxUYcZGJEB+WZkvP
	KWQMpz1jaPCZfxLU5uT3j1Kkhl2mmzBH33CItQju00RIVX6r1U1XuvuPyNG1tdjsvLvdy3mVsN3
	JQPglHQGvu7LgHpkk2OQCM1TyfdE+wStb23+E31n1T6p0p2Ilv66SZ2gnjJnc+KSjRWON96XTvo
	GWV6hhIJyaUVfxNAirT5VMQFoUyjCt1JnwzqRwcvD7CYDQ==
X-Google-Smtp-Source: AGHT+IH3nMAlJnBvAuLxTRoaI6szhLEuC4BfQKel9VaHg4B0sd/BjO5atqoOuUJaIHtD+nlucyLK8w==
X-Received: by 2002:a17:903:1b66:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-22c535738f3mr306397415ad.2.1745414356586;
        Wed, 23 Apr 2025 06:19:16 -0700 (PDT)
Date: Wed, 23 Apr 2025 15:19:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86: constrain sub-page access length in
 mmio_ro_emulated_write()
Message-ID: <aAjoz4BtXykdI9UP@macbook.lan>
References: <570ad3f2-7f3b-4579-a000-c85d27e8bf77@suse.com>
 <aAit4IPZju60KEUz@macbook.lan>
 <7d0afeda-d2c0-4360-bbf6-99a466e8f013@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d0afeda-d2c0-4360-bbf6-99a466e8f013@suse.com>

On Wed, Apr 23, 2025 at 02:58:28PM +0200, Jan Beulich wrote:
> On 23.04.2025 11:07, Roger Pau Monné wrote:
> > On Wed, Apr 23, 2025 at 10:43:56AM +0200, Jan Beulich wrote:
> >> Without doing so we could trigger the ASSERT_UNREACHABLE() in
> >> subpage_mmio_write_emulate(). A comment there actually says this
> >> validation would already have been done ...
> >>
> >> Fixes: 8847d6e23f97 ("x86/mm: add API for marking only part of a MMIO page read only")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Alternatively we could drop comment and assertion from
> >> subpage_mmio_write_emulate().
> > 
> > I think I prefer this as it fits better with my patch to unify the
> > open-coded MMIO accessors, which does have an ASSERT_UNREACHABLE() for
> > unhandled sizes.  The return there is anyway too late IMO, as we have
> > possibly already mapped the page when there's no need for it.
> 
> FTAOD with "this" you mean the patch as is, not the alternative?

Yes, sorry, "this" => "this patch".

> >> --- a/xen/arch/x86/mm.c
> >> +++ b/xen/arch/x86/mm.c
> >> @@ -5195,8 +5195,9 @@ int cf_check mmio_ro_emulated_write(
> >>          return X86EMUL_UNHANDLEABLE;
> >>      }
> >>  
> >> -    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> >> -                               p_data, bytes);
> >> +    if ( bytes <= 8 )
> >> +        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> >> +                                   p_data, bytes);
> > 
> > Should we print a debug message here saying the write is possibly
> > unhandled due to the access size if subpage r/o is enabled?
> > 
> > You might want to re-use the subpage_ro_active() I introduce to limit
> > the printing of the message.
> 
> That would be too broad for my taste. I've used subpage_mmio_find_page()

Hm, yes, that's likely more expensive, but certainly more accurate.
Given the context here the extra logic doesn't matter much.

Thanks, Roger.

