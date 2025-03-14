Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A6A60BFC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914066.1319881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0dl-0006th-Hf; Fri, 14 Mar 2025 08:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914066.1319881; Fri, 14 Mar 2025 08:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0dl-0006ry-Ev; Fri, 14 Mar 2025 08:43:37 +0000
Received: by outflank-mailman (input) for mailman id 914066;
 Fri, 14 Mar 2025 08:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt0dj-0006rs-QZ
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:43:35 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a613725-00b0-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:43:34 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so3370954a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:43:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e8169bcdb3sm1728980a12.43.2025.03.14.01.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 01:43:33 -0700 (PDT)
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
X-Inumbo-ID: 6a613725-00b0-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741941814; x=1742546614; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xp0HUMW/0MsQocQnenr8URnOMCrhSMtV61H+QTl49Xw=;
        b=ozdSflCfCaLOk6fTNm9zhCaRzgj0Dl0CLJlog9ay1eN2Lqnhxwv6Zj0KlqPjDJtmIl
         7b62nIHLe/KFMhe1yZzEGhSzQ9HVj2bjS9HY97lwLDylttzTJPkRZYscZYpnGNDBMeG3
         gJcbU6iJbtgyURRhGLJH0+hck7tpf9YZ0TvOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941814; x=1742546614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp0HUMW/0MsQocQnenr8URnOMCrhSMtV61H+QTl49Xw=;
        b=SMt7GACfpIkIguJQ9Y60+2vVED2jBrWxD8/DbIe/JXgQmxNHTEHnWKEkGVjx+2wF7O
         eWm9sY6HT77lpmmBBGoXDxWpkMgB4NPuYRixKOkR88WAl7T1XUfhf+PaIK8bm2fOYg/J
         ioqff2GFzjgHPzpMpYg/7MRzeIOXqAlBHWOQk+zcnpIoX2dyA0g6vmM0L1QJKfiU/blK
         FQELMgYUB72JjbGDcG0WAzuljG6uGvqAlcieEU8EWq/8O7opY6lBDn8ljOQgF7cesMh+
         n3cCx3CS3Kruq+6Yol1BwlAYiTHWmgnDxpdFBNKp0SF+7GsRkkeyQln4KmqCs28kyNYr
         eMLg==
X-Gm-Message-State: AOJu0Yzn0EiO8NSHNK/OqQhVy7kgzchyFnNP5m56x5grKHHA1Bi6STMn
	MBYlj171WAO3Q2XsDnRf6Q8GE/YZzWBOeTCkUCyhbkw6blqHJJqWpk8g4SB5Uhc=
X-Gm-Gg: ASbGncswwrZcCgpRc74rbh9VkhozWDpkDY1lUcyQ9G++k65TVdnDf3CXOSnAvHe//zg
	FWQRI0P7j6Mv5g7P3ICrph5EH4vMED69Z3JvVtvPMRy6lygVJuuHDFy6pemLBYVXcWZ/oRzJLN0
	ruuaRiN9O5kS2R0uKek//godVMaLz6oaQyIssnLETvUqFiZk9KXQsGO938gkKNsIu0gw/AgAeAK
	ufRSnhovyRERY4APZpsH0LBWclYBtCezG4/m0NO1TVe4q9aNzflPXB68zr8MpBxoJNJDlmA0MZE
	30bYO4S/QkOwPSK9SKTjcuRsFUOv7hW7QZusxiMisz0uDIIIqA==
X-Google-Smtp-Source: AGHT+IEkJ4qSqdnPOg/Ewunsh96lkrPGClKXGY3teCwcafWBLW0/oSxH/cITBVVZ5XgJP8fWJhS1MA==
X-Received: by 2002:a05:6402:5251:b0:5e0:9390:f0d2 with SMTP id 4fb4d7f45d1cf-5e8a0228606mr1623118a12.20.1741941814263;
        Fri, 14 Mar 2025 01:43:34 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:43:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 5/7] x86/ioremap: prevent additions against the NULL
 pointer
Message-ID: <Z9PsNVbC4leLFMqO@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-6-roger.pau@citrix.com>
 <ad26bb49-4025-4190-ba69-c03584cf2229@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad26bb49-4025-4190-ba69-c03584cf2229@citrix.com>

On Thu, Mar 13, 2025 at 05:21:13PM +0000, Andrew Cooper wrote:
> On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
> > This was reported by clang UBSAN as:
> >
> > UBSAN: Undefined behaviour in arch/x86/mm.c:6297:40
> > applying zero offset to null pointer
> > [...]
> > Xen call trace:
> >     [<ffff82d040303662>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
> >     [<ffff82d040304aa3>] F __ubsan_handle_pointer_overflow+0xcb/0x100
> >     [<ffff82d0406ebbc0>] F ioremap_wc+0xc8/0xe0
> >     [<ffff82d0406c3728>] F video_init+0xd0/0x180
> >     [<ffff82d0406ab6f5>] F console_init_preirq+0x3d/0x220
> >     [<ffff82d0406f1876>] F __start_xen+0x68e/0x5530
> >     [<ffff82d04020482e>] F __high_start+0x8e/0x90
> >
> > Fix bt_ioremap() and ioremap{,_wc}() to not add the offset if the returned
> > pointer from __vmap() is NULL.
> >
> > Fixes: d0d4635d034f ('implement vmap()')
> > Fixes: f390941a92f1 ('x86/DMI: fix table mapping when one lives above 1Mb')
> > Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with one style fix.
> 
> It's unfortunate, because C23 makes this one case (add 0 to NULL
> pointer) explicitly well defined to avoid corner cases like this.  Oh well.

Interesting, so they added a new type (nullptr_t) that has a single
possible value (nullptr), and hence arithmetic operations against it
always result in nullptr.  That's helpful to prevent this kind of
bugs.

> > diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
> > index 2fcc485295eb..a05492037519 100644
> > --- a/xen/arch/x86/dmi_scan.c
> > +++ b/xen/arch/x86/dmi_scan.c
> > @@ -119,8 +120,10 @@ static const void *__init bt_ioremap(paddr_t addr, unsigned int len)
> >      if ( system_state < SYS_STATE_boot )
> >          return __acpi_map_table(addr, len);
> >  
> > -    return __vmap(&mfn, PFN_UP(offs + len), 1, 1, PAGE_HYPERVISOR_RO,
> > -                  VMAP_DEFAULT) + offs;
> > +    va = __vmap(&mfn, PFN_UP(offs + len), 1, 1, PAGE_HYPERVISOR_RO,
> > +	        VMAP_DEFAULT);
> 
> You've got mixed tabs/spaces here.

Thanks, vim autodetection is a bit confused with this file because it
uses both hard and soft tabs, fixed now.

Roger.

