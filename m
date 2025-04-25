Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78EA9C925
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967934.1357656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IQK-0008BC-VZ; Fri, 25 Apr 2025 12:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967934.1357656; Fri, 25 Apr 2025 12:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IQK-00088g-S6; Fri, 25 Apr 2025 12:44:56 +0000
Received: by outflank-mailman (input) for mailman id 967934;
 Fri, 25 Apr 2025 12:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYju=XL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u8IQJ-00075e-Fn
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:44:55 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 153778b2-21d3-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:44:53 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3035858c687so1781737a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 05:44:53 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-309f7737c88sm1504684a91.1.2025.04.25.05.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 05:44:51 -0700 (PDT)
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
X-Inumbo-ID: 153778b2-21d3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745585092; x=1746189892; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKWuJdgdwuiXZUdy2uBWJ1xIknZ6V8yS60jvADUJi5c=;
        b=YSvLUvH242/xacXx2s2prLc2C+Pz5vm/T8E0jgzJuQrPHpbbJ4iOG6bT4/ez9pKI3B
         KCi/0WbkmAHQsfMjmTQmHY9Ij38/1wbnRITRJIqrTX6wQMHOH5DFpziPS8bESxud9InA
         S6WIZ70IYp804E15r9nMcVGvcbLCj4PpVx/pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585092; x=1746189892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKWuJdgdwuiXZUdy2uBWJ1xIknZ6V8yS60jvADUJi5c=;
        b=KtgkcrouK304SVD5KigP+yZ4BBONuSAPuhxyxOOSNFdB2FZmGjV8CHuBZlM8wo8Tiu
         vlQEbmedPAiRIlQ+FQJYDVHsTC5bJAtlJwObGHo7xwvEkv6p97inOwMaXECgJqRBL48B
         /Uf8ZRKZiY5o0AwoyuFxW1u5OEgekxEAPuld35yWxpTg8AowbcrHuhWns2ZqhiQg+uZa
         LkmJfdzqr0LvbOa3Qc7pB3tEu1zAgIWKYS/eY/+JVFgBjnvACjkU6OE4e+kWjXx/j9hA
         HQ/Icnmu+7mJwxIFdyCYjBnNh7nY4xxo5JzETq8BPZYb/wox4SEQbwuy4CQVoulpIvL8
         Dd8g==
X-Gm-Message-State: AOJu0YyxcVRD7LDEmrFRPuChluT8P1uYXer2mZERXZMK69hx268h824m
	ZrrIXSLyt86xAg5RxNT5FOqnksUVCV7iYZuP8MfsosSewTvBg9GhPyOL2rDpkZg=
X-Gm-Gg: ASbGnctu/UG+qReX789fyd8SbvRRytyB9oLlGHuBNnpSuc10vaybIRndO52GHjh6ane
	IwxzLrgQl7lOQpvOWDQ1F9DFCvRlBxTwxOqm/M2Avfws9hfEuku1kdKEfzb3+DT+hdJgGGR6iIV
	946tA6IoCdWJjy0rKNIIs7m3OZCOZkLTBmb/OpaOMfdXgxPuGIq+Opa935QrdeNf3dUXlTrFjwy
	9tza/v6DwdES1+i6FkbwvasgM9NbdD2mWosqdcbFOAktjO19dd0p2t7W+ooisEDGMWo7as10MUM
	fgwpUDsaw2oLh+5UguusJG137ncCFdtTPOJxnShWWXfHZJhwLvVHwCXD
X-Google-Smtp-Source: AGHT+IF0dgjG9q0Tlityx9nrYaZWOc4MNNmsyttuagE9pv4jpXjrSmjXfXk4eKUd9HMRW8XI69/cHw==
X-Received: by 2002:a17:90b:5246:b0:2fe:e0a9:49d4 with SMTP id 98e67ed59e1d1-309f7d876a2mr3858665a91.2.1745585091947;
        Fri, 25 Apr 2025 05:44:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:44:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvmloader: fix usage of NULL with cpuid_count()
Message-ID: <aAuDvqxihXBI9u2k@macbook.lan>
References: <20250424125813.96449-1-roger.pau@citrix.com>
 <D9FPTG9VXGV2.3OT1N6UFNG2WI@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9FPTG9VXGV2.3OT1N6UFNG2WI@amd.com>

On Fri, Apr 25, 2025 at 01:23:30PM +0100, Alejandro Vallejo wrote:
> On Thu Apr 24, 2025 at 1:58 PM BST, Roger Pau Monne wrote:
> > The commit that added support for retrieving the APIC IDs from the APs
> > introduced several usages of cpuid() with NULL parameters, which is not
> > handled by the underlying implementation.  For GCC I expect this results in
> > writes to the physical address at 0, however for Clang the generated code
> > in smp.o is:
> >
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
> >
> > Showing the usage of a NULL pointer results in undefined behavior, and
> > clang refusing to generate further code after it.
> >
> > Fix by using a temporary variable in cpuid_count() in place for any NULL
> > parameter.
> >
> > Fixes: 9ad0db58c7e2 ('tools/hvmloader: Retrieve APIC IDs from the APs themselves')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Ugh, that's on me. I was sure I saw the pattern in Xen (from where the
> code came from), but clearly I hallucinated.
> 
> > ---
> > Could also be fixed by using the temporary variable in the call sites,
> > however that's more code in the call sites at the expense of less checking.
> > I don't think the extra NULL check logic in cpuid_count() is that bad.
> >
> > Overall the solution proposed in this patch is safer going forward, as it
> > prevent issues like this from being introduced in the first place.
> 
> Might be worth moving this same extra checks onto Xen's cpuid. There's
> no shortage of `junk` variables at the callsites.
> 
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
> A somewhat more compact alternative that doesn't require tmp would be:
> 
>   eax = eax ?: &leaf;
>   ebx = ebx ?: &leaf;
>   ecx = ecx ?: &leaf;
>   edx = edx ?: &leaf;

But that performs the write unconditionally?  It might be more compact
code-wise, but might incur in an unneeded store?

> It clobbers `leaf`, but only after it's no longer relevant.

My preference was to use a explicitly tmp variable, but I could switch
to using leaf if that's the preference.  Given that Andrew has already
Acked the current version I'm tempted to just go with what has already
been Acked.

Thanks, Roger.

