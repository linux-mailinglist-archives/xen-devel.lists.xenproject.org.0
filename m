Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF4A9DCFB
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 21:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969403.1358520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8lce-0006hF-6F; Sat, 26 Apr 2025 19:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969403.1358520; Sat, 26 Apr 2025 19:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8lce-0006f0-2w; Sat, 26 Apr 2025 19:55:36 +0000
Received: by outflank-mailman (input) for mailman id 969403;
 Sat, 26 Apr 2025 19:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGdt=XM=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u8lcc-0006eu-HM
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 19:55:34 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68e49b9f-22d8-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 21:55:32 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so6516495a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 26 Apr 2025 12:55:32 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edb1a48sm338332866b.179.2025.04.26.12.55.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 12:55:29 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso82468866b.3
 for <xen-devel@lists.xenproject.org>; Sat, 26 Apr 2025 12:55:29 -0700 (PDT)
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
X-Inumbo-ID: 68e49b9f-22d8-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745697331; x=1746302131; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aftG49fJm+Fa9LC9HlUDxoFYsWgicnJbWUzkp620LLU=;
        b=Ztq0G3R2LBCi3Bup6FgODQDKKnUiG+ow5AbQbThYSJNQAPx+Oq/mQx/wEh4K/nnD71
         z16w+nLrWTDuu7RiZrUJDLoj3GE/xhk4nY06KIHFc9zQGOE3dfn7hX0fSIvkMrglvSwy
         PQdzBNsP3q5x8QEd4P7gYQq7szPdiGgTyhI8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745697331; x=1746302131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aftG49fJm+Fa9LC9HlUDxoFYsWgicnJbWUzkp620LLU=;
        b=CPLmlkKk/3aB+c//sjOfaJWhlqcYJMAcs/BykGm2Dpg3ZKVhwVOugxSNNQoHkL8vWM
         vzSTFJAY+kT/5WO73nAPU1+K0YYMTcrQxvAXNDxlAWa8iS46Olso65SBVLknN/atML2y
         t99QwjeV64e0324KlfUlG/EVc0ZPXqijx7aAh53iHUXPjlObTvwNXAj+HLqZLu5f4Ora
         m5UHpLF2q+NFNBE3B1HfTzqI2aCsGVU7eKxMaaelsjZHnqzNCPZqRKaaH2I+lnZ1u9qG
         JijSvYCPIo8lyruDBX2q8Tv4hm9hFMYlfiOnLgoylZZcY2QwTFzaoBgcNhDYTj+h4EdG
         6MDA==
X-Forwarded-Encrypted: i=1; AJvYcCXNfuHN97N8SIsr1CxmHcilT+sC/205DVjCgPS7wltnZiNdr/0DqGt2bg1804UOon5PximthpT9XPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3kq3/jyN+2rD1+utT30O0GHlBaghBgGXrCE3y1ziJyFKCThG2
	S5ho5wO0l6oSdByY0TfXo36hdrYJSfgzynBqU6uGVZisd+Emr2xq7dlQJlJq2Roa3U8+XVkFlqe
	cHY4=
X-Gm-Gg: ASbGncsLnfnUrNnKpapi0VfJEX5cUYf2XqPUHlNE/vyBNqaU/YGbpKDW3jkqaxeVNeK
	hsw+imKfqEcFIr+H53GpAVlO5lJ2g88+sSDc+t+r/Tuu6LsqABvYd5BOkUonffXcIlk01jbsUI0
	GJE0bwnclk9GfMENgTD/F+D/8O5E7NoZHOnDJ5N8ASOJ7BzBt6rZPH4x7GGp+gdnKNC56brD5Bs
	9aqqTFBfe2EEVuF+33YTN4nHqJeN4cm5t69+PwPrCJrgfTntv2xic54p+hV7pbfAnE4PvZnwZ8W
	56YpACFrDmylL61fGShJiHEU0UmdlvMCexVBwsQIwktETjrqbPDpPLQzh7bds2KXA7aPIuycYjs
	Kv2ZMutFGADApcPc=
X-Google-Smtp-Source: AGHT+IGPyTo0X5VCre6aOFDd8uCnH1/tGiAkVL1WuYM4oz3cctiozLO3X2prU3TJSSWPm8kiRp9DnQ==
X-Received: by 2002:a17:907:7255:b0:ace:3a72:25e8 with SMTP id a640c23a62f3a-ace713aadefmr594295666b.51.1745697330878;
        Sat, 26 Apr 2025 12:55:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbmj7eWl0P0IJrKncWy24NapNIa1ZvcVB0k4xDB2qp8aQAdfsTJAVCOCl7dkOAjgfmggtTv1UoBJg=@lists.xenproject.org
X-Received: by 2002:a17:906:dc8b:b0:ac3:26ff:11a0 with SMTP id
 a640c23a62f3a-ace7133c83emr662400166b.38.1745697329459; Sat, 26 Apr 2025
 12:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
In-Reply-To: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 12:55:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
X-Gm-Features: ATxdqUHx162ag34plcJL88OxLQAR-HzI_SClvQLeiGcjSBwah8R9mtvrxHJPTzY
Message-ID: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 12:24, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> (And yes, one use in a x86 header file that is pretty questionable
> too: I think the reason for the cmov is actually i486-only behavior
> and we could probably unify the 32-bit and 64-bit implementation)

Actually, what we *should* do is to remove that manual use of 'cmov'
entirely - even if we decide that yes, that undefined zero case is
actually real.

We should probably change it to use CC_SET(), and the compiler will do
a much better job - and probably never use cmov anyway.

And yes, that will generate worse code if you have an old compiler
that doesn't do ASM_FLAG_OUTPUTS, but hey, that's true in general. If
you want good code, you need a good compiler.

And clang needs to learn the CC_SET() pattern anyway.

So I think that manual cmov pattern for x86-32 should be replaced with

        bool zero;

        asm("bsfl %[in],%[out]"
            CC_SET(z)
            : CC_OUT(z) (zero),
              [out]"=r" (r)
            : [in] "rm" (x));

        return zero ? 0 : r+1;

instead (that's ffs(), and fls() would need the same thing except with
bsrl insteadm, of course).

I bet that would actually improve code generation.

And I also bet it doesn't actually matter, of course.

           Linus

