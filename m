Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668CA9B103
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 16:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966415.1356629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xeJ-0007vz-91; Thu, 24 Apr 2025 14:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966415.1356629; Thu, 24 Apr 2025 14:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xeJ-0007t9-6K; Thu, 24 Apr 2025 14:33:59 +0000
Received: by outflank-mailman (input) for mailman id 966415;
 Thu, 24 Apr 2025 14:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnO2=XK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7xeH-0007t3-Rl
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 14:33:57 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26487bc4-2119-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 16:33:55 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-736b350a22cso926180b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 07:33:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73e25aa0acfsm1438310b3a.152.2025.04.24.07.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 07:33:53 -0700 (PDT)
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
X-Inumbo-ID: 26487bc4-2119-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745505234; x=1746110034; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ET8TaNJRyGQPpVdpnGRB83icJaR1bGaBpcJoCD/NbGQ=;
        b=Ki3ZA2PhH4/VvqAmn7Ncw6tsQOKQOgWvd1diKKPMKCgVF/EW3VOSBE3W51pKplo+zf
         i31jFsvR/5zTTyU9vXTcyqOfYJFcR7ey2VeLqdrugq47rAIYf8j9SXvN5tNnJE0O7Ahu
         b3J8yJwn6QnoXWnb7zk8fD13xmOqLxyQhEfp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745505234; x=1746110034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ET8TaNJRyGQPpVdpnGRB83icJaR1bGaBpcJoCD/NbGQ=;
        b=xTwEvNBOa63vtrcPygGW1samSHAsnNT0hAX+0f6dm2q0pVy/JNSwPB4eVa8kwq6sel
         /IXm4jDFRi4EiEg1xErEAXTH6RSf6ZCIdfRGfkZLIcVMjCOchgbWvb2NSGcGQcAb0Y4n
         FjA9Duko79S8cdHhPrXJCjqMz4nQPtXe/uTkGp/Zwz98gm5DNWFuq5pdnQqtRimL6fQG
         7yDWfCUpgGN5jgEZsLTTWCkUyyDnY/TshgZS83nmBi0Bwnt6I1iR2ckm1V9pO8cIY9cH
         syAqTRDgxDaDav07tN3h9DhOVbRFCiKX1QYm2ReK0YNXRIqxencde/enAd/0NYY/gnEy
         jGTg==
X-Gm-Message-State: AOJu0YxSWXEzC2g/+nN03f3tgQ4dbnCL/MUVhfbdG2DTdo+ZACPMz31b
	HoXypoVLjkDnw6/3WpAnreJhErdYtYFqQe8zRwXe6jjJzbyE5H/iRCGB1Yuc3aA=
X-Gm-Gg: ASbGnctNOS2jzhhm2CEiYZCU4vT9FLiGIU2jH0+Eo4CBa7htyaUeV2Wowljg1hngGxz
	XPefXjm0DsWidanI7f7LDbxetaW1Gwuskn4rcfpFZGwoJJsS1LTvJEI92MEn/IEn4Bkb2QXVtJT
	JHMkeaZOVnZrXjMWX0p673smmNHPw0HibsyDeRowQNHQ0HTZ98SNaECcL8qgZ9zbLPV8qKopQtO
	xVKcN5NLbB1aG0X781RfBfcPNT4F2ajGedUAYlLK9wyhCPXQMFMDq6n7ABcRmFqVhF+jISZ1OXE
	BR4HzhSrh5JUQc7/0fawIxM7xLvKC7N500+exMP5R7t9vROuUKbc86jI
X-Google-Smtp-Source: AGHT+IHo0Zvt94eAxAJoTWAksNE3j9FkCTvLxH8tY7piYKOTiKs6FPvPQaXPe6B4m13lbkt1VcERSA==
X-Received: by 2002:a05:6a00:2e0e:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-73e24633349mr3908150b3a.14.1745505234260;
        Thu, 24 Apr 2025 07:33:54 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:33:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] x86/hvmloader: fix usage of NULL with cpuid_count()
Message-ID: <aApLzKSC5wnLeShs@macbook.lan>
References: <20250424125813.96449-1-roger.pau@citrix.com>
 <72b6e9b8-8f6a-4495-ac1c-9df5822067a8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72b6e9b8-8f6a-4495-ac1c-9df5822067a8@citrix.com>

On Thu, Apr 24, 2025 at 03:21:05PM +0100, Andrew Cooper wrote:
> On 24/04/2025 1:58 pm, Roger Pau Monne wrote:
> > The commit that added support for retrieving the APIC IDs from the APs
> > introduced several usages of cpuid() with NULL parameters, which is not
> > handled by the underlying implementation.  For GCC I expect this results in
> > writes to the physical address at 0, however for Clang the generated code
> > in smp.o is:
> 
> Oh lovely.  I guess we need full VM testing for the Clang builds too.
> 
> > tools/firmware/hvmloader/smp.o: file format elf32-i386
> >
> > Disassembly of section .text:
> >
> > 00000000 <smp_initialise>:
> >        0: 55                            pushl   %ebp
> >        1: 89 e5                         movl    %esp, %ebp
> >        3: 53                            pushl   %ebx
> >        4: 31 c0                         xorl    %eax, %eax
> >        6: 31 c9                         xorl    %ecx, %ecx
> >        8: 0f a2                         cpuid
> 
> I get the hint that this is the whole file?  But you don't say that
> explicitly.

Yeah, realized later while reading the message myself.  This is indeed
the whole file.

> > Showing the usage of a NULL pointer results in undefined behavior, and
> > clang refusing to generate further code after it.
> >
> > Fix by using a temporary variable in cpuid_count() in place for any NULL
> > parameter.
> >
> > Fixes: 9ad0db58c7e2 ('tools/hvmloader: Retrieve APIC IDs from the APs themselves')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Could also be fixed by using the temporary variable in the call sites,
> > however that's more code in the call sites at the expense of less checking.
> > I don't think the extra NULL check logic in cpuid_count() is that bad.
> >
> > Overall the solution proposed in this patch is safer going forward, as it
> > prevent issues like this from being introduced in the first place.
> > ---
> >  tools/firmware/hvmloader/util.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
> > index 644450c51ceb..765a013ddd9e 100644
> > --- a/tools/firmware/hvmloader/util.h
> > +++ b/tools/firmware/hvmloader/util.h
> > @@ -190,6 +190,17 @@ static inline void cpuid_count(
> >      uint32_t *ecx,
> >      uint32_t *edx)
> >  {
> > +    uint32_t tmp;
> > +
> > +    if ( !eax )
> > +        eax = &tmp;
> > +    if ( !ebx )
> > +        ebx = &tmp;
> > +    if ( !ecx )
> > +        ecx = &tmp;
> > +    if ( !edx )
> > +        edx = &tmp;
> > +
> 
> Personally I dislike this pattern, and some of that is definitely PTSD
> from Xen's original hvm_cpuid() function.
> 
> hvmloader is a small enough codebase that I don't think it matters
> either way.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably with
> clarity over the disassembly.

I've adjusted to:

"""
For GCC I expect this results in writes to the physical address at 0,
however for Clang the generated code in smp.o for the whole file is:

tools/firmware/hvmloader/smp.o: file format elf32-i386
...
"""

Thanks, Roger.

