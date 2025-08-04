Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53443B1A085
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 13:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069108.1432950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uitHr-0003cU-VW; Mon, 04 Aug 2025 11:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069108.1432950; Mon, 04 Aug 2025 11:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uitHr-0003ZJ-RP; Mon, 04 Aug 2025 11:23:27 +0000
Received: by outflank-mailman (input) for mailman id 1069108;
 Mon, 04 Aug 2025 11:23:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uitHq-0003ZC-4t
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 11:23:26 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ee00d21-7125-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 13:23:23 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61568fbed16so4744365a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 04:23:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7a83sm6695602a12.32.2025.08.04.04.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 04:23:22 -0700 (PDT)
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
X-Inumbo-ID: 6ee00d21-7125-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754306603; x=1754911403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4H3sVxZQVuJuZBfj6ldymI2bSBltGEycy+PRbU7xvmU=;
        b=E8gXLFfXP+fi6Jd1P6DHa3fd0FfycHHxGQr/AGQ8jlV3AhSqlvKKZ94mO6ag5Uv0aE
         uOq1W2HJXo6e+/BFU2YT+xRsWy/EnQ/meLJNettgXzki2jIwPpM+7dAOXOXcmrlzmW+8
         gFVcUBdzwZ3j2gRrwJLgNqPlYTmVqBq+nZ0DH/JieMwjrI+huZEl3sMKQKMwWhmtpICR
         4RBpXFJKbGH4ftagQwflqJhRG8NpByuYWAnJD59s8N6ATR87968F1cVbU16luO+wqlDk
         JIEKZl+bq+9/ktnGiJOCVXkbdR2RGLmgMWLMhESDH6upYhWCuG/9IR4Aj9JIyoGyDu2Q
         Zs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754306603; x=1754911403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4H3sVxZQVuJuZBfj6ldymI2bSBltGEycy+PRbU7xvmU=;
        b=AF9fFMQrajKo67cSjxoUkE6eePjbvFMVjCvCGDIRXRi6tRfJAdWnME7BeOhPHJHYGm
         j6ByEGv3BQ2MbcncqekMLW2wxBeB7voHPLHpQq1jU5a9gdsl7KDEoKrFp05nF2YS5Smc
         UNL399xMh6wReVkswuB0DFjrJmA5dcikU5v03QzzG86K54zvW43EBNcZuJOpEeuYzm0c
         7UCds6guEZJhs/Ecg9vhvP7mXB1N5KnSKqXpfspDVs2yWc9dyU1K2XOEaJd+ER8izI3y
         b5ZR7gsIc1Rqdu0Wctp4wljUu6/L6zxgYnpKwbffRfSmFbD79Vcmbfz/cxaUoovTnLrg
         amMg==
X-Forwarded-Encrypted: i=1; AJvYcCXXDc6+BVnLQszNfMaw/suUEuUKMS4BGc74tbFON+W9IxzaNUSMt1jzTxlknWySJkFMrYe6UkEAFRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK8BCDmPNYGmNemby9Um8Iag8MngvZu9CfPTmd+DTGuZ2+8lRF
	6uWIzYlmhtCNFLa1g/YMXvqIdsncxPj9rbqGPEEtpKkVyXbQFU+T00o+1mYkELNIAg==
X-Gm-Gg: ASbGncvEzoxEk7SQ+n2iksii2KUkAdojkOhrEE8H7ZHyzWA3NxLc9IwYHHJcoDyKyyM
	+iJglc5JjD1k8DCuhUiXMNx53w1Bhcd9fwd0UEkmt4qVh3zVOpz1fkjMFqGuVTjPzybdep4Be+b
	QwvSVhmXJsDCjiWqUtwiGL4mUb2XunLCsgPTNmDXgBdu2bUPihJSFNnuWLrgPKCTTzdmax7EFJ/
	892cs0TH0Db1NuIZR+BaMW6TdfNzfSjfeQs3GqorR0/yNBKDUJhuuDDVsIA1QMD73Np0+7Wzzsv
	Gu9tUl+6GDeIjlOppbkuhXuDu4yBcXbSkPfEp3pWNGMgxmquPEvrGnXhLkCU6KAEMPuZdxBo8vf
	DXYwaBln8NDB2DDICI/xTOuiHGAfu+xRglMdIHunMeHDR/tzF+AjplU28oHt30+fTXve7VUadgp
	I6qDeNPrw=
X-Google-Smtp-Source: AGHT+IGbRwzSHYFLLlCJgwlrrIsz2Br/dVRqRridgRMorrqRCNbL7GS+qBvw9NNMA0onAxfFQRcnjQ==
X-Received: by 2002:a05:6402:5210:b0:615:860d:7da8 with SMTP id 4fb4d7f45d1cf-615e6f10de3mr8220020a12.14.1754306603025;
        Mon, 04 Aug 2025 04:23:23 -0700 (PDT)
Message-ID: <1e83ed1c-6fa6-4295-9072-d4277f95f2a1@suse.com>
Date: Mon, 4 Aug 2025 13:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: fix xen.efi boot crash from some bootloaders
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yann Sionneau <yann.sionneau@vates.tech>
References: <20250724140731.1502774-1-yann.sionneau@vates.tech>
 <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
 <0f4abbb4-aa7f-4c09-8652-bc9041a25a56@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <0f4abbb4-aa7f-4c09-8652-bc9041a25a56@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2025 13:00, Andrew Cooper wrote:
> On 04/08/2025 10:34 am, Jan Beulich wrote:
>> On 24.07.2025 16:07, Yann Sionneau wrote:
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
>> So I found a way to deal with this at the linker side, without any new command
>> line options. Behavior is solely driven by the attributes of any incoming .reloc
>> sections (of which there would be none by default, retaining original behavior).
>> The important patch is [1], but at least the first patch of the series [2] would
>> in most cases also be wanted/needed (patch 04 is obviously a mechanical prereq
>> for the main patch). Need for other of the prereqs there depends on the scope
>> and purpose of one's binutils build(s).
>>
>> [1] https://sourceware.org/pipermail/binutils/2025-August/143153.html
>> [2] https://sourceware.org/pipermail/binutils/2025-August/143141.html
> 
> That's good to see.  Do we need any matching changes in Xen?

Well, we'll need some (zero-size) contribution to .reloc then. For my
testing I hacked this into the linking rule (which is a mess already
anyway), but I hope / expect to find a cleaner solution for upstreaming.

Jan

