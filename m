Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF59BE718
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830853.1245941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8erS-0000BL-GA; Wed, 06 Nov 2024 12:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830853.1245941; Wed, 06 Nov 2024 12:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8erS-00008B-DU; Wed, 06 Nov 2024 12:10:10 +0000
Received: by outflank-mailman (input) for mailman id 830853;
 Wed, 06 Nov 2024 12:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8erR-000082-1r
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:10:09 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e231b40-9c38-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:10:04 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cebcf96fabso6488966a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:10:04 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6ac1b38sm2638351a12.47.2024.11.06.04.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 04:10:02 -0800 (PST)
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
X-Inumbo-ID: 0e231b40-9c38-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBlMjMxYjQwLTljMzgtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk1MDA0LjI2NzE5Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730895004; x=1731499804; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5sMEMOVjbd1VoD3JYF8f3GkO6OZBBpK8UdgsHcRLSPY=;
        b=E+X1QfYOsBvUylwJnKg+ZI7xHlPfadXZPzEdZ24rAq2cC/TZ0aUInZVb0BPfiIPKKv
         4pZ5WupOdJfD518pk4EcZxn28Sn1eE/XLeCi/B0K3vV4Tl87KTsWdH9Xx/X5WxyBqDl3
         3re7JWgMlsH7ndXmC+zxoHIg9vkvLJ4Fz2Qi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730895004; x=1731499804;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sMEMOVjbd1VoD3JYF8f3GkO6OZBBpK8UdgsHcRLSPY=;
        b=WGWjDWOZ3kRRCK7AEpJSQbl/UOaLp+QZ0jNGqAz6JjLDU6jb5c7NXnNYhQi7F+dMki
         PGb43T8RR0mkg9rOTQilfYUTXWIieOf7hxmmZeizvdUOYSRihy7ZpN6FPioks/Ln4mB6
         y7PXYIZEqpqWagQzzqWlV+9r74oV9z9jG/Ux/l8mhh7Hwhf54Q1H0aZWVb8nS2CFaUG9
         Rj1OR4/v6EwN6xkNOvKOCUkIsZZr5m6jvWAbJ348aMNC0I7ukscoP6jXioq80RjB9n7h
         n/+z7fXslVTq2bpiiu8//DrNTFEfHdLWB+/EHMMO3vz5qXJ+w7q5XXi86GQRGM32S4U2
         nBzw==
X-Forwarded-Encrypted: i=1; AJvYcCXOrICwvlSNZQn2mCSRT4awv0eZw2oZq4Ct7UqtZgUt1IGOQTZMiVYRGPOB/zzHeQMUnX/rIVAlkT4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfD2MIAkAvcJLQWUWJqS5mFQx8uzeaiY4XEoWCi4FzToOnCD91
	aJo0E+VQC1aafOxaorWoTiK1iSRynVv7PHBUpMg4ug4rWueJZj6pQMkTsZh6BNw=
X-Google-Smtp-Source: AGHT+IEmNKBCe71WpvQTYvlekg3l5NddgdV4iBaKRVaMAF+mt/cY6/XOsQKb3E4keVWBe7/8HvuumQ==
X-Received: by 2002:a05:6402:3182:b0:5ce:d491:c0b2 with SMTP id 4fb4d7f45d1cf-5ced491c977mr6799547a12.12.1730895003487;
        Wed, 06 Nov 2024 04:10:03 -0800 (PST)
Message-ID: <d00985af-f692-4f83-9ab0-18183a4a0747@citrix.com>
Date: Wed, 6 Nov 2024 12:10:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/boot: Uses nm command instead of map file to
 get symbols
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
 <20241106114150.1432512-3-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241106114150.1432512-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2024 11:41 am, Frediano Ziglio wrote:
> Map file format is not standard making it code readind it
> not portable and potentially hard to maintain.

I think you want to include a sentence along the lines of
"combine_two_binaries.py only understands GNU LD's format, and does not
work with LLVM's LLD."

That makes it more clear why this this gets a Fixes tag.

I'd also suggest having the following sentence in separate paragraph for
clarity.

> Use nm command instead to get list of symbols; specifically
> BSD format as it does not truncate symbols names like sysv one.
>
> Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/Makefile        |  5 +++--
>  xen/tools/combine_two_binaries.py | 28 ++++++++++++++++++----------
>  2 files changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 777b4befeb..01100a4b72 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -67,7 +67,8 @@ $(obj)/built-in-32.tmp.o: $(obj32)
>  # If possible we use --orphan-handling=error option to make sure we account
>  # for all possible sections from C code.
>  $(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
> -	$(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=map) -o $(@:bin=o) $(filter %.o,$^)
> +	$(LD32) $(orphan-handling-y) -N -T $< -o $(@:bin=o) $(filter %.o,$^)
> +	$(NM) -p --format=bsd $(@:bin=o) > $(@:bin=nm)
>  	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
>  	rm -f $(@:bin=o)
>  
> @@ -79,7 +80,7 @@ cmd_combine = \
>                --script    $(obj)/build32.base.lds \
>                --bin1      $(obj)/built-in-32.base.bin \
>                --bin2      $(obj)/built-in-32.offset.bin \
> -              --map       $(obj)/built-in-32.base.map \
> +              --symbols   $(obj)/built-in-32.base.nm \
>                --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
>                --output    $@
>  
> diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
> index 447c0d3bdb..db02494b28 100755
> --- a/xen/tools/combine_two_binaries.py
> +++ b/xen/tools/combine_two_binaries.py
> @@ -28,8 +28,8 @@ parser.add_argument('--text-diff', dest='text_diff',
>                      help='Difference between code section start')
>  parser.add_argument('--output', dest='output',
>                      help='Output file')
> -parser.add_argument('--map', dest='mapfile',
> -                    help='Map file to read for symbols to export')
> +parser.add_argument('--symbols', dest='symbols_file',
> +                    help='Nm command output to read for symbols to export')

We call the output of $(NM) uniformly .map elsewhere in Xen, even the
top level System.map

I'd suggest retaining the .map extension, and --map argument, and you
can probably just say help='Map file (NM) to ...' for the help text to
make it explicit.

That in turn reduces the churn ...


>  parser.add_argument('--exports', dest='exports',
>                      help='Symbols to export')
>  parser.add_argument('--section-header', dest='section_header',
> @@ -65,15 +65,23 @@ exports = []
>  if args.exports is not None:
>      exports = dict([(name, None) for name in args.exports.split(',')])
>  
> -# Parse mapfile, look for ther symbols we want to export.
> -if args.mapfile is not None:
> -    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> -    for line in open(args.mapfile):
> -        m = symbol_re.match(line)
> -        if not m or m.group(2) not in exports:
> +# Parse symbols file, look for symbols we want to export.
> +if args.symbols_file is not None:

... here.

> +    dummy_start = -1
> +    for line in open(args.symbols_file):
> +        v = line.split()
> +        if len(v) != 3 or v[1].upper() != 'T':
>              continue

A slightly nicer way of doing this is:

    parts = line.split()

    if len(parts) != 3:
        continue

    addr, type, sym = parts

which means you have more legible code blow.


> -        addr = int(m.group(1), 16)
> -        exports[m.group(2)] = addr
> +        addr = int(v[0], 16)
> +        if v[2] == 'dummy_start':
> +            dummy_start = addr
> +            continue
> +        if v[2] not in exports:
> +            continue
> +        exports[v[2]] = addr
> +    if dummy_start != 0:
> +        raise Exception("dummy_start symbol expected to be present and 0")
> +
>  for (name, addr) in exports.items():
>      if addr is None:
>          raise Exception("Required export symbols %s not found" % name)

Something to consider.  Instead of special casing dummy_start in several
ways, you could, insert it into exports to begin with, then check

    if exports["dummy_start"] != 0:
        raise Exception("dummy_start symbol expected to be present and 0")
    del exports["dummy_start"]

after which you're back to just the real --exports in exports[].


All of this said, it definitely looks like a much more robust solution
to the problem.

~Andrew

