Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E88AFC38B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 09:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036011.1408466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2MB-0000qA-3K; Tue, 08 Jul 2025 07:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036011.1408466; Tue, 08 Jul 2025 07:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2MB-0000nx-03; Tue, 08 Jul 2025 07:03:11 +0000
Received: by outflank-mailman (input) for mailman id 1036011;
 Tue, 08 Jul 2025 07:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ2M8-0000nr-Pu
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 07:03:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9887a1a1-5bc9-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 09:03:05 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2073532f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 00:03:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845922b5sm101562515ad.199.2025.07.08.00.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 00:03:04 -0700 (PDT)
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
X-Inumbo-ID: 9887a1a1-5bc9-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751958185; x=1752562985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T38JzTjNx9O+oVMmAaHCYJObRElFCOc0KtQrEq5iyY4=;
        b=PQIavVpLUSTD57Xz3PyKJtzjUiRLkJAiEYRW8pQ/Jk/JjK2AU++Al1hZuk7gUpIq9z
         tqacpopfz/nt1lWGSu5LPCAXX1pW5mqDKwhjdYG6NgmQXNjxhXjV+EYK+8tMTYWUI3Sn
         R7FRONJW5patbAsJUN7fIbtC9KTOQIdWmtWmm2FSGfDKJdCxswrM3aTOG21Wn+apUq1S
         ZR0rfsXpTIpgQcRmvc2Y2iKNgq8J9uVcWrO7QVw8NxJuHdB3eQ4VSx4RYLehW16DXUsO
         O3HvQTJf1WC333q0PYdQikaDx+Y37oWOvbKpBl8yAVkyefLFF1UqHYuH/TO8eooAl0rY
         Cx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751958185; x=1752562985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T38JzTjNx9O+oVMmAaHCYJObRElFCOc0KtQrEq5iyY4=;
        b=HkCtAEgQZCGJGK6V8HX4/KYcyQyhmlXerHjSqahQULsj/E/3BZ5a/G7W8yeCzwtXzI
         J+2pjGs4zphSJoJM6bqn4VE3mSfotTPwI+ElNo7G972R77JZhulGoDGKVQQQIzOxuQtM
         hoyrHvc8B7iqkE+/X74fMj6rgnHo3VLK725Wv5kNDBkL4bM3a4vYB18Wus0jXNw/dhgH
         wQk9dEi+3D3OkbVhLLCAPTfyz98Ur5p6OWEC58mvqVQ/fiQtzrSTO5ZzehykH5zoCdH6
         ghYpGEjN/WIocaw2uJidZVcVrvlaYU0lQBUL/leKMa4flGYCrvmiW0JGYRx9J95DgzgY
         LwzA==
X-Forwarded-Encrypted: i=1; AJvYcCWCAydeIEeE1yANU7iSUJlrow7T/PYbiWZj0mH8whfN5CG95KYtJrSVW0n2Uf/fGociIbA3gEtNJfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4tbB6C3ZCsfkQqCNOari/v661HNxL5JCbl/pq6271CZGLgBG9
	0o6QD2U36rdVojS5tM/bgKP/qyvLr/u26AL/XQEveW4ovKPP7iQkMlnJN4Lqanvgkw==
X-Gm-Gg: ASbGncveeS5oKkGStByx3qKQu1/WVS8u2wmur7rIShHvCG8RUo8u1XAtYj0VTMQ+4ep
	HVCV6RAGZlScwfpyafwwZLwTMQPWS+0gXhdWIzJBfWjSmQmf6ogBQ14BsaRSGNkoimR7Hnf6PMZ
	BPSGkXvWEeOpc9gxEzkgNE+Fkwu9he5DMfn5TeSWWpQtWWcP+VZS+2zg0Rnfj5aJOCkJTBGPQSz
	1d8Hq/jKnVKSFMTcBT4oU9UDFv6F4OtpAMfdRJyOOrGryGTtihuTJ8wCS+IYhRYdtRtPTP8WXcm
	Z+Vx4/LdQLWTRo2PsxX5X/K//Psi9Fs6t6IQBrMCkEIdRmATeG7PDJUN/YaIOaYcl3lA7AwvHPL
	s7Do9rts2HfTt+zY+MsSnpFD3J7cK7zwYFp4xavf3PRTmBf8=
X-Google-Smtp-Source: AGHT+IE2pcP8Keg8jMyuVXzRckJfb1uNWp5FPmGs/OT58D5Gfpey7VJJRZD0N2Q4G5kURylttvYGPg==
X-Received: by 2002:a05:6000:4b0d:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3b5ddee1054mr1141977f8f.29.1751958184738;
        Tue, 08 Jul 2025 00:03:04 -0700 (PDT)
Message-ID: <01fe310f-a19a-4392-9215-8942c2bb9b86@suse.com>
Date: Tue, 8 Jul 2025 09:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/22] x86/boot: add MLE header and Secure Launch entry
 point
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <916c87847457552583f1defb1aced37ea3ff58df.1748611041.git.sergii.dmytruk@3mdeb.com>
 <d9ab3803-c7e0-4a67-93e2-4f32bf9b3ad5@suse.com> <aGxCFFEU9BzLx96O@MjU3Nj>
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
In-Reply-To: <aGxCFFEU9BzLx96O@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 23:54, Sergii Dmytruk wrote:
> On Thu, Jul 03, 2025 at 12:25:27PM +0200, Jan Beulich wrote:
>> On 30.05.2025 15:17, Sergii Dmytruk wrote:
>>> From: Kacper Stojek <kacper.stojek@3mdeb.com>
>>>
>>> Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
>>> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
>>> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
>>
>> Such a change can hardly come without any description. As just one aspect,
>> neither here nor ...
>>
>>> --- a/docs/hypervisor-guide/x86/how-xen-boots.rst
>>> +++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
>>> @@ -55,6 +55,11 @@ If ``CONFIG_PVH_GUEST`` was selected at build time, an Elf note is included
>>>  which indicates the ability to use the PVH boot protocol, and registers
>>>  ``__pvh_start`` as the entrypoint, entered in 32bit mode.
>>>
>>> +A combination of Multiboot 2 and MLE headers is used to implement DRTM for
>>> +legacy (BIOS) boot. The separate entry point is used mainly to differentiate
>>
>> ... here the MLE acronym is being deciphered. Same for DRTM here. There's
>> also no reference anywhere as to some kind of spec (except in the cover
>> letter, but that won't land in the tree).
> 
> Will add more details.
> 
>>> +from other kinds of boots. It moves a magic number to EAX before jumping into
>>> +common startup code.
>>> +
>>>
>>>  xen.gz
>>>  ~~~~~~
>>
>> Any reason the single blank line is converted to a double one? Generally, in
>> particular for patch context to be more meaningful, we'd prefer to not have
>> double blank lines. In documentation they _sometimes_ may be warranted.
> 
> Take a closer look, the patch just preserves double blank lines which
> are used consistently to separate sections within this file.

Oh, indeed. I'm sorry.

>>> +        .long   0x00020002  /* MLE version 2.2 */
>>> +        .long   (slaunch_stub_entry - start)  /* Linear entry point of MLE (SINIT virt. address) */
>>> +        .long   0x00000000  /* First valid page of MLE */
>>> +        .long   0x00000000  /* Offset within binary of first byte of MLE */
>>> +        .long   (_end - start)  /* Offset within binary of last byte + 1 of MLE */
>>
>> Is the data here describing xen.gz or (rather) xen.efi? In the latter case,
>> does data past _end (in particular the .reloc section) not matter here?
> 
> Eventually, both.  EFI case deals with loaded image which, I believe,
> should have all relocations applied at the time of measurement.

But you're aware of the need to apply relocations a 2nd time? See
efi_arch_relocate_image(), which reads .reloc contents. Hence I assume
that section needs to be included in any measurements.

>>> @@ -332,6 +352,38 @@ cs32_switch:
>>>          /* Jump to earlier loaded address. */
>>>          jmp     *%edi
>>>
>>> +        /*
>>> +         * Entry point for TrenchBoot Secure Launch on Intel TXT platforms.
>>> +         *
>>> +         * CPU is in 32b protected mode with paging disabled. On entry:
>>> +         * - %ebx = %eip = MLE entry point,
>>> +         * - stack pointer is undefined,
>>> +         * - CS is flat 4GB code segment,
>>> +         * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
>>> +         *   would make it impossible to initialize GDTR, because GDT base must
>>> +         *   be relocated in the descriptor, which requires write access that
>>> +         *   CS doesn't provide. Instead we have to assume that DS is set by
>>> +         *   SINIT ACM as flat 4GB data segment.
>>
>> Do you really _have to_? At least as plausibly SS might be properly set up,
>> while DS might not be.
> 
> "have to" is referring to the fact that making this assumption is forced
> on the implementation.

But that's not really true. The Xen bits could be changed if needed, e.g. ...

>  LGDT instruction uses DS in the code below, hence it's DS.

... these could be made use SS or even CS.

>>> +         * Additional restrictions:
>>> +         * - some MSRs are partially cleared, among them IA32_MISC_ENABLE, so
>>> +         *   some capabilities might be reported as disabled even if they are
>>> +         *   supported by CPU
>>> +         * - interrupts (including NMIs and SMIs) are disabled and must be
>>> +         *   enabled later
>>> +         * - trying to enter real mode results in reset
>>> +         * - APs must be brought up by MONITOR or GETSEC[WAKEUP], depending on
>>> +         *   which is supported by a given SINIT ACM
>>
>> I'm curious: How would MONITOR allow to bring up an AP? That's not even a
>> memory access.
> 
> See patch #15.  BSP sets up TXT.MLE.JOIN and writes to an address
> monitored by APs, this causes APs to become part of dynamic launch by
> continuing execution at TXT-specific entry point.  It's more of a
> redirection rather than waking up, just another case of bad terminology.

Okay, (just ftaod) then my more general request: Please try to be as accurate
as possible in comments (and similarly patch descriptions). "must be brought
up by" is wording that I interpret to describe the action the "active" party
(i.e. the BSP) needs to take. Whereas MONITOR, as you now clarify, is the
action the AP needs to take (and then apparently is further required to
check for false wakeups).

Jan

