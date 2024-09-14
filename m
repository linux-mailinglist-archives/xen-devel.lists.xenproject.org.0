Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4B978E76
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2024 08:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798577.1208791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spMRK-0002Yz-Ox; Sat, 14 Sep 2024 06:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798577.1208791; Sat, 14 Sep 2024 06:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spMRK-0002WW-MA; Sat, 14 Sep 2024 06:39:26 +0000
Received: by outflank-mailman (input) for mailman id 798577;
 Sat, 14 Sep 2024 06:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spMRJ-0002WQ-H5
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2024 06:39:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 144976e8-7264-11ef-99a2-01e77a169b0f;
 Sat, 14 Sep 2024 08:39:23 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c260b19f71so3147207a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 23:39:23 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb89d69sm344983a12.77.2024.09.13.23.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 23:39:22 -0700 (PDT)
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
X-Inumbo-ID: 144976e8-7264-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726295963; x=1726900763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xd5K3lYp48aFdZVK8qhxvNGBV49IkRhFGyZ627VDgu8=;
        b=JIpv0LSGm4vhptN3Gua91iCVGRgAcPtwS7s+GnuM6lUAKhA9ukQcf/kdhpQc3cHSHi
         KD6uaq444xXRUzYgr2PnByFEsqbVTVcUJpu0h6zp4QesFFDKhvrA9LsxBf4shbufwgzr
         ZkNGoZo628WaB2EhO/gtfVIn6KVC/umF/hMnQ+pj76N8vanZ/BLsh9lQpXZ0FgbNDM9K
         yl69bO9XAZiizE28Cb2l46gj5RLJg6c26F1MwJAcf+kEkQTHxaHZWDfoUytS2fEKs6Ct
         jgWpgG4YSqMubV+H8q35Vl+IIeCWtkpbnBmFeTxVKrNF0Iza9+a+8lVXr7s9xvJfpY2k
         ZStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726295963; x=1726900763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xd5K3lYp48aFdZVK8qhxvNGBV49IkRhFGyZ627VDgu8=;
        b=t5K+lTb7/fFHkaFgvPiFLpfbOorAUUbk2Pzag5QnRPuUEgEDIqysC9adocUpRsdZoZ
         6FzmiRyzAmkqAxqeFGFU9G5UdrFbfFDzizuOczg+qumCoRT0aVTs6Vq4oh2sZvaDwJcp
         b0+6OI5G68qFhVPM44vdxfne3J8gJcXozNzKHfcVUoWtqEbOc/YVv2pOvm2AjQquwGpo
         R7n9ZTgBgMeJZ5KlKTqHrnaGDaM6KC1iOvoFGKB7skAS40ObBS1ebdXJlGT5wVukjgKQ
         uc0urMe7niCHKPUNBfNyvWHJI4RRkm/mtxkuTkGP+/sgIxS934P5kIuADvC9N9CoHqVa
         0GPA==
X-Forwarded-Encrypted: i=1; AJvYcCXGd43SndTmZrXQbduRFrsDKOaa6zqoj0iSsWkNKuXQX6t5qRKpeHkLwshcE4dBzyfu37h82idVHVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiBsaa+0Q9MliuItHWX+GROvaG51YlvYfbwmxV7oZqZoGQxjaG
	OIYXuje8XiyrEp7DrlQ8sk0XsQ4Do4kwSNgTh5aYzZ2iq5LtG4gdtBkHDSMTTw==
X-Google-Smtp-Source: AGHT+IEhp7Hc0b6bcihT9rN08tluyEG/WygXCzgK/AB4Eq9WBqVs0DW7Dn85N6C9sy1EWbnUM4P8gg==
X-Received: by 2002:a50:c94b:0:b0:5c2:4404:a193 with SMTP id 4fb4d7f45d1cf-5c413e53f2emr5191970a12.34.1726295962869;
        Fri, 13 Sep 2024 23:39:22 -0700 (PDT)
Message-ID: <dd3364e4-7f40-4963-a0f1-f743527c9d9d@suse.com>
Date: Sat, 14 Sep 2024 08:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/boot: Avoid relocations in trampoline code to
 physical addresses
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240828091956.127760-1-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240828091956.127760-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 11:19, Frediano Ziglio wrote:
> The trampoline could have "manual" relocation entries (created
> by assembly macros and some code to use them) and (in case of PE)
> normal executable relocations.
> Remove some normal executable ones. In this way we don't have to
> worry about applying both correctly (they need proper order
> which is hard to spot looking at the code).

I don't theink the order of applying relocations matters - the overall
outcome will be the same for any order. What does matter is ...

> Specifically in efi_arch_post_exit_boot trampoline is copied after
> fixing relocations with efi_arch_relocate_image.

... whether they're applied by the time certain operations take place.

> These time dependencies
> between different part of code are hard to spot making hard to change
> code.

Relocation and copying sitting literally next to each other makes it
not really hard to spot, imo.

> In this case the copy is done in a state where code should be run
> at higher locations so it would be better to reduce the code between
> calling efi_arch_relocate_image and jumping to higher location.
> Absolute symbols are defined by linker in order to avoid relocations.
> These symbols use a "_PA" suffix to avoid possible clashes.
> phys_addr macro is used to make more clear the address we want and making
> symbol search easier.

At the price of introducing more absolute symbols, which are often
frowned upon. For example I fear this may (and the 2nd patch will)
get in the way of us (finally) randomizing Xen's virtual position
at load/boot time. Especially with xen.efi (where we already have
the base relocs) this shouldn't be overly difficult to arrange - as
long as there are no absolute symbols to take care of (ones used
only very early are okay of course).

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -870,8 +870,10 @@ cmdline_parse_early:
>  reloc:
>          .incbin "reloc.bin"
>  
> +#include "x86_64.S"
> +
> +        .section .init.text, "ax", @progbits
> +
>  ENTRY(trampoline_start)
>  #include "trampoline.S"
>  ENTRY(trampoline_end)
> -
> -#include "x86_64.S"

I take it that this is superseded by the patch introducing
.init.trampoline?

Jan

