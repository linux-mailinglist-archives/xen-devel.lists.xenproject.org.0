Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C5B0F581
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054274.1423017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueac1-0003WW-SW; Wed, 23 Jul 2025 14:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054274.1423017; Wed, 23 Jul 2025 14:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueac1-0003TG-Pd; Wed, 23 Jul 2025 14:38:29 +0000
Received: by outflank-mailman (input) for mailman id 1054274;
 Wed, 23 Jul 2025 14:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueac0-0002yr-4R
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:38:28 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b206964b-67d2-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:38:27 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so3630881f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:38:27 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4586919e44esm25616825e9.16.2025.07.23.07.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:38:26 -0700 (PDT)
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
X-Inumbo-ID: b206964b-67d2-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753281507; x=1753886307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f58c+KTaGMFVdZpSC+F2ArJXUREnN0BE+FXX6LDIuEY=;
        b=pQp9pdgzT96Hz8xqCBoyE9eMYRnNTZfo/fGZ+ZArTmmOXMqmkwHvVXCokEMoHgkD6P
         HT7cTCby8fnZh4eEEmdvRJTYuAF8z7d5sNnbChhrFldYiRQvhaTBj6z+Fke7PSKx5yBs
         c7AP1GFE/x3juI4g/WDkMoX77z75b38TL2J9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281507; x=1753886307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f58c+KTaGMFVdZpSC+F2ArJXUREnN0BE+FXX6LDIuEY=;
        b=WJkCv6sILPfUz9WG2yeOZbDXGCfQq3nFClM7gKpO0A1AQiPtt+I4Me/JaV/b85MxOl
         ft54mVoxNevJa7O26+tP9MnvX424WEb58RTWdYwTTkUawBPvZzWSDoafxOmv8awuZMm3
         AkPr/OTg9Tdc8ehFuTOj812XY/mwkZRXkS0gS5UwgkJ0/nLxRc5mkUy+7YSr40R2huU3
         ugcdUMHJMPmjh+BPYRT+int+7Uo+FLxj2a2PkeTXO9pO0682M1mFyF/sZYff1Zya3vkN
         BCRcawwIXFvHR5+rRtgJmDFG4xleSAS9Q7GoeviapdqLC5VtsXSGFnGZWyGw/aQ2Oo5w
         vDmw==
X-Forwarded-Encrypted: i=1; AJvYcCXulrJuO579yzDUQ1KvLCo3JjUx3ogsX4u8Heo/yfh6wo4N0N8MNHLwwmTpCgCvBXLO/bfAkf35Mdk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqQGa86lYSp427f5dRkztR8GaoHo/TADs7zwN6/QNmkaC37nCf
	z6w6cd4NY89TEzP5b8GB6QepfR20WuKHeFKT6y9KWVa2KZnC4uoZG4n2XOXJK0t/0Gw=
X-Gm-Gg: ASbGncugIdcwQBYb0dsYaDuGbmppQ+alYg0r0gzv30II4Uvq44mUvZraMM2h5vz1X3y
	eHjzwwkfNrLSvLrMHuGMNJ+KIANvb4zjhPbxQDNCUXImFk7Mk4YzbwPUBNn4hz38Fc1VgyrC5gM
	npl/akOMVaMzFprTILTOqaDnQGCz/bF3KiyLd26FoMtLyxFJGOZJsPHgxw1KmJFqqS7hA8N8XQI
	zUWBMArtGkRs2lh0lDiKZLY7/NXvQ8xrSSqPd8Q2rKnf7RfsUPmje4f4VboV98IRo1s5y9wn/or
	E/6hbBWw2P6y645YVTuPOBsBukITgvtzqko0kgH/+FK2MAlwsV9r1oTWl8hKL5t4E2OR03DXS96
	DKnWeQgzHbsHpjd0LZYkxXjmgpUQ3A8KAMLf5vNGXMpBfkYMDeckxBfq6j9doSp+t6sMm
X-Google-Smtp-Source: AGHT+IHt/PyjUF+TGkzOLyX3Aq3UH1GlhJgp4COr36rufgA3Rc6fqVnS5x4FTiOfxQqA6JrdvFmXpA==
X-Received: by 2002:a05:6000:2313:b0:3a5:8a68:b839 with SMTP id ffacd0b85a97d-3b768f02e70mr2646270f8f.45.1753281507141;
        Wed, 23 Jul 2025 07:38:27 -0700 (PDT)
Message-ID: <75a98ec2-f88d-471f-a64d-1c702d2d62fd@citrix.com>
Date: Wed, 23 Jul 2025 15:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix xen.efi boot crash from some bootloaders
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <20250723135620.1327914-1-yann.sionneau@vates.tech>
 <fb0cc1f6-bbc0-4413-998a-6fa55192f73a@citrix.com>
 <1f0e94a1-09eb-470f-9eea-af3d4d310cde@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1f0e94a1-09eb-470f-9eea-af3d4d310cde@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2025 3:21 pm, Jan Beulich wrote:
> On 23.07.2025 16:13, Andrew Cooper wrote:
>> On 23/07/2025 2:56 pm, Yann Sionneau wrote:
>>> xen.efi PE does not boot when loaded from shim or some patched
>>> downstream grub2.
>>>
>>> What happens is the bootloader would honour the MEM_DISCARDABLE
>>> flag of the .reloc section meaning it would not load its content
>>> into memory.
>>>
>>> But Xen is parsing the .reloc section content twice at boot:
>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>>
>>> Therefore it would crash with the following message:
>>> "Unsupported relocation type" as reported there:
>>>
>>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>>
>>> This commit adds a small C host tool named keeprelocs
>>> that is called after xen.efi is produced by the build system
>>> in order to remove this bit from its .reloc section header.
>>>
>>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
>>> ---
>>>  xen/Makefile           |   5 +-
>>>  xen/arch/x86/Makefile  |   1 +
>>>  xen/tools/Makefile     |   3 ++
>>>  xen/tools/keeprelocs.c | 119 +++++++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 127 insertions(+), 1 deletion(-)
>>>  create mode 100644 xen/tools/keeprelocs.c
>> I'm sick and tired of the hoops we have to jump through for broken
>> tooling.  This is now rewriting the PE+ metadata because apparently the
>> linker can't do it correctly.
> The linker is doing it correctly. It is us (and very likely just us) who
> have special needs here.
>
>> Either fix the linker (or the way we drive it/etc), or we're doing away
>> with PE+ emulation entirely and writing the MZ/PE headers by hand like
>> literally every other kernel does.
> "Fixing" the linker was suggested, but with my binutils maintainer hat on
> I'm inclined to not accept a Xen-only option into the linker.

Either Xen is doing something wrong, and should be doing it differently,
or Xen is doing something right and the tooling is
wrong/incomplete/whatever.

As a related question, is anyone other than Xen using PE+ emulation in
anger?  Every other kernel/OS level tool I'm aware of writes the MZ/PE
header by hand, and frankly, the list of bugs we've found in PE+
emulation would strongly suggest that noone else is using it.

~Andrew

