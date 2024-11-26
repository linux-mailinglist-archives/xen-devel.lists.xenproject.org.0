Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE99D9E28
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 20:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844010.1259565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG1iD-0008Ff-9o; Tue, 26 Nov 2024 19:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844010.1259565; Tue, 26 Nov 2024 19:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG1iD-0008Dc-6P; Tue, 26 Nov 2024 19:59:05 +0000
Received: by outflank-mailman (input) for mailman id 844010;
 Tue, 26 Nov 2024 19:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdLj=SV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tG1iB-0008DW-LE
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 19:59:03 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id def363e0-ac30-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 20:58:57 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cfaeed515bso7642017a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 11:58:57 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3a3407sm5346435a12.17.2024.11.26.11.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 11:58:56 -0800 (PST)
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
X-Inumbo-ID: def363e0-ac30-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRlZjM2M2UwLWFjMzAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjUxMTM3LjMwMzY4Niwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732651137; x=1733255937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0PfQy8GrbMnN+llPZ0OqVIsl+0sz2hlqufB2LNnRrwI=;
        b=lg+VrP6wdFENACHeAKjdvBPnN2mm2eTbKMv9zEj6hriDeB11KiswICcDiowR6YJneg
         pdJnQ+joI7A3ve81ZcI7guQMZJkeqlAPS+KOYR8VpqjcegAGEs7+RAwTczUPJKJo65SO
         ww96TmXG2DBX8J8B3sfcB7SJFiEtwqGbPHJbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732651137; x=1733255937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PfQy8GrbMnN+llPZ0OqVIsl+0sz2hlqufB2LNnRrwI=;
        b=ESyRUnZC8g5UgrsE0azkhCPbKeewKGthRglRR0bkohqorNkBz3CgpY7YKvo3ZYskvt
         76fa2IrNG2AxYprCeUdXNVPRXs5mFQ1iiA6P2BZPhLUmu3iXgewtEsjE6MMY6IpszXbp
         I3dEW0ebs+vwbGJehOCgEZ59hC8psmyQWdSYyNcHJensGTgpY54FQwhXs5H3QygXOjCV
         Bx1RQQAFbWGR4p0dhyKaxzWkIRi9cFNMephL7Gh3A0zzIoJqsgn+bU60AdtrONP8sEyZ
         97au4nQ7Inix4kcC/4qYqq65LItQ+dAd4ruqc2bkM5vc8CAPySSBUbiv7X+z18pJONIq
         naPA==
X-Forwarded-Encrypted: i=1; AJvYcCXRkYzROtCwyQ+CPcV+hvMIcDhbtXFka6FFUrweORQohBmY0F0Y17YJwGROMEiCQINpZ/EO0mScDM8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQPE6ENotJxRzunwGw6vSHZvcni9+WuZwob0z/sPx6ufMr+FiG
	fILGj+0bLT86ShirEFha07jkDYzcOLoXJ4sLjyzxSZM+6E9blLvS6jR1g0FSib6aSyEx7a57AWX
	Z
X-Gm-Gg: ASbGncvWLsjkW4pz0lIgAI/7fXmJc4UvZuuTl9icqCVu7F3oJ8dV5jGekSRSEUl9tUC
	Rw627v4u+yTd/92nrKfOJgL9C5DYKlBDLHAmqrvXplALm8cuZAhfb/lFzRodpL18bCrhisRBMas
	+HOE7R3ueUrx6rqEiynLaSfUhuGLeYKc6BPLFNOuFvLpHNvMkUWeb1OFma9nR8Qb6rqpQ2AgXCx
	OhzBI5jWJdo8ef3sHqDzgXC1nDdVltNdAJH3ZxvLEsqZFnpet1nMmBC/7t2Vvk=
X-Google-Smtp-Source: AGHT+IFBOEuWsEcx/1RqIsiWcm3RYBcBZYjaTBUPIURzEnBQNCxwn3MHDqCapmmQjrrCvls1e9Tziw==
X-Received: by 2002:a05:6402:13d6:b0:5cf:e4b0:2ee1 with SMTP id 4fb4d7f45d1cf-5d080c49768mr472586a12.25.1732651136601;
        Tue, 26 Nov 2024 11:58:56 -0800 (PST)
Message-ID: <3fa4555a-f66f-47c0-ada2-3a5591536432@citrix.com>
Date: Tue, 26 Nov 2024 19:58:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] x86: control memset() and memcpy() inlining
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <1c935aba-a185-43de-9806-6781b1a7fcf9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1c935aba-a185-43de-9806-6781b1a7fcf9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2024 2:29 pm, Jan Beulich wrote:
> Stop the compiler from inlining non-trivial memset() and memcpy() (for
> memset() see e.g. map_vcpu_info() or kimage_load_segments() for
> examples). This way we even keep the compiler from using REP STOSQ /
> REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
> available).
>
> With gcc10 this yields a modest .text size reduction (release build) of
> around 2k.
>
> Unfortunately these options aren't understood by the clang versions I
> have readily available for testing with; I'm unaware of equivalents.
>
> Note also that using cc-option-add is not an option here, or at least I
> couldn't make things work with it (in case the option was not supported
> by the compiler): The embedded comma in the option looks to be getting
> in the way.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Re-base.
> v2: New.
> ---
> The boundary values are of course up for discussion - I wasn't really
> certain whether to use 16 or 32; I'd be less certain about using yet
> larger values.
>
> Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
> for known size, properly aligned blocks is up for discussion.

I didn't realise there were any options like this.

The result is very different on GCC-12, with the following extremes:

add/remove: 0/0 grow/shrink: 83/71 up/down: 8764/-3913 (4851)
Function                                     old     new   delta
x86_emulate                               136966  139990   +3024
ptwr_emulated_cmpxchg                        555    1058    +503
hvm_emulate_cmpxchg                         1178    1648    +470
hvmemul_do_io                               1605    2059    +454
hvmemul_linear_mmio_access                  1060    1324    +264
hvmemul_write_cache                          655     890    +235
...
do_console_io                               1293    1170    -123
arch_get_info_guest                         2200    2072    -128
avtab_read_item                              821     692    -129
acpi_tb_create_local_fadt                    866     714    -152
xz_dec_lzma2_run                            2573    2272    -301
__hvm_copy                                  1085     737    -348
Total: Before=3902769, After=3907620, chg +0.12%

So there is a mix, but it's in a distinctly upward direction.


As a possibly-related tangent, something I did notice when playing with
-fanalyzer was that even attr(alloc_size/align) helped the code
generation for an inlined memcpy().

e.g. with _xmalloc() only getting
__attribute__((alloc_size(1),alloc_align(2))), functions like
init_domain_cpu_policy() go from:

48 8b 13                 mov    (%rbx),%rdx
48 8d 78 08              lea    0x8(%rax),%rdi
48 89 c1                 mov    %rax,%rcx
48 89 de                 mov    %rbx,%rsi
48 83 e7 f8              and    $0xfffffffffffffff8,%rdi
48 89 10                 mov    %rdx,(%rax)
48 29 f9                 sub    %rdi,%rcx
48 8b 93 b0 07 00 00     mov    0x7b0(%rbx),%rdx
48 29 ce                 sub    %rcx,%rsi
81 c1 b8 07 00 00        add    $0x7b8,%ecx
48 89 90 b0 07 00 00     mov    %rdx,0x7b0(%rax)
c1 e9 03                 shr    $0x3,%ecx
f3 48 a5                 rep movsq %ds:(%rsi),%es:(%rdi)

down to simply

48 89 c7                 mov    %rax,%rdi
b9 f7 00 00 00           mov    $0xf7,%ecx
48 89 ee                 mov    %rbp,%rsi
f3 48 a5                 rep movsq %ds:(%rsi),%es:(%rdi)

which is removing the logic to cope with a misaligned destination pointer.


As a possibly unrelated tangent, even __attribute__((malloc)) seems to
have some code gen changes.

In xenctl_bitmap_to_cpumask(), the change is simply to not align the
-ENOMEM basic block, saving 8 bytes.  This is quite reasonable because
xmalloc() genuinely failing is 0% of the time to many significant figures.

Mostly though, it's just basic block churn, which seems to be giving a
"likely not NULL" on the return value, therefore shuffling the error paths.

~Andrew

