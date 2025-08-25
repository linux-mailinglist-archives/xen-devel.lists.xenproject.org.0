Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AFFB343B7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093277.1448809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYC3-0000du-Tj; Mon, 25 Aug 2025 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093277.1448809; Mon, 25 Aug 2025 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYC3-0000am-Pd; Mon, 25 Aug 2025 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 1093277;
 Mon, 25 Aug 2025 14:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYC1-0000ag-MA
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:29:05 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d953fb07-81bf-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 16:29:03 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb7a3ee3cso643650566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 07:29:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fbdb52sm570110366b.33.2025.08.25.07.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 07:29:02 -0700 (PDT)
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
X-Inumbo-ID: d953fb07-81bf-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756132143; x=1756736943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CaYZYHMc8nvfaAWYv+35eikwH2vUQc5t2kU+haPS6Lk=;
        b=WGrItcFFZDbPc+wF2s7c5bCUZ/ERbKP47+31kgyzkdeAz11S1g7JLtgDGtEmo6Rcz5
         hr2foMvILg3nit7XLEolSBO07FZKRmbJLdtjV8qGoZTk+dapGMZIMBWM77VRM0GnKdqt
         mu7XV/BQe1DOsPmb31/LxD19HLtkD10qir44crmP1eL3szg+RLfhKkW8XPpyycAjvR6N
         S0bbl78UpheanC9+/pe3Z9MBjtpAFA49UujTe8geK//mpOuEeU2IxoojdBGK1rLEefcF
         vlYdO1oYVQNfVLzt9WBS3Fg1kl4RQjzVqqNcqm8m1a7yt412UcWONvxr5iLS0JvI/a8m
         /iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132143; x=1756736943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaYZYHMc8nvfaAWYv+35eikwH2vUQc5t2kU+haPS6Lk=;
        b=X7arTLu3JJe1OpcgG8GVcyzGRAcNLMiJgTD9duNs77IFIXbPojdL4UvPN5e301moZB
         0BxHpfKtr3UvDUgEiwXxV2lXeUcFzUR7fQ7zcoYIqki9wMcsXjbIjSN3QlShMrwUZpgw
         dzglnXjM2DCBghyFCOOKak25IjQGlxZ9TXSpoCAGnsR8gtMfqkTA4pfdXUJrn/Ro14IO
         hXNIfbSkrqqYgtwpRK7d679A/Kl7lVSM3R6tZk0n9q8OS1pACMzGjB6B5AMF1p/FGuiY
         GYg8BvLhvbuFMG6vEOF/s1J3mO9EPIlcDFH0BaCe/cTiO2wq9F/0Z8RFw7ZY4FqYdOAM
         kt0A==
X-Forwarded-Encrypted: i=1; AJvYcCWe4Ox2ywT7xO1pO9QVBml/1+JBUdkN0McmAUWh/HkMJ34+9YyteUKVeXOnVVPmPNz8o3G8jJheNIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz54Sa8X7GK0AGuEACk5gf5Om0aNsewtn9YbqN9l+lOlx0P9a0E
	7vif+gpslRmXRSWh7W0A61t1Z2+j80OLa8B5/OjtB5suqcZ/BTny5nQcnbDJnaQz8w==
X-Gm-Gg: ASbGncu/4V1s/qp+ckXCMMZp8dY+TMBLEV9WHA3WcHLuj0oHr6bvrEKRU2vMIxMx6hh
	c+nDOsJ3mUl3ftFqL3LTCpAEEXom7XzWjxo4H/pq+19fPdCS0YvbhNZCHFWWxVWFyopLPhgQGur
	zwLP3WUYswrZuquOxfTKyowMrMgVe9mo/un6R2PqnnK//dvKs6H2JExZYDCrq+UXNzDmC5Xek3m
	cXaXPdAOeDnx8kvMORzPV9SHX2AJ5FW/wOm9Wt38Mn97P3G/FgctUPteqFDwL7dZ1DBsK4sZqEX
	ydNlYVMbq6G1k8bINjJvbq+gw/ge6qeI6jjp7Fvk71sg2Aja2csGdmpPnCIWEFY18H02oyi3uWs
	YoUndl0XGbQNsW5jZ5Zpq9WQpcVsttLbTpjCT7EsDldWYpekbYBPV2Y9qsxut3Wx55rdtewNaxo
	RhKtjLDys=
X-Google-Smtp-Source: AGHT+IHDWIK2NchTCtUEpsB4nzY1RWuCe87k6OPT1krRbC64uQ1EpKwO4K6BGR+S/nytJPwlyB9RAw==
X-Received: by 2002:a17:906:3717:b0:afe:764d:6b31 with SMTP id a640c23a62f3a-afe764d736dmr464579266b.4.1756132142791;
        Mon, 25 Aug 2025 07:29:02 -0700 (PDT)
Message-ID: <9b7b70e5-9b1b-446e-9dcc-310f1c1f4b47@suse.com>
Date: Mon, 25 Aug 2025 16:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: fix xen.efi boot crash from some bootloaders
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724140731.1502774-1-yann.sionneau@vates.tech>
 <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
 <4936cb0d-0898-4171-b8e1-ed3a57bcfc0a@vates.tech>
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
In-Reply-To: <4936cb0d-0898-4171-b8e1-ed3a57bcfc0a@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 16:17, Yann Sionneau wrote:
> On 8/4/25 11:34, Jan Beulich wrote:
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
>>
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
> That sounds great!
> It's clearly better to fix the issue by changing/improving binutils.
> Let's drop my patch in Xen if this gets accepted in binutils!

Luckily I'm in a position where I don't need "acceptance", but merely
"absence of objections". The sole reason for the present delay is with
a colliding MIPS patch, which I'd rather see go in first.

> It would be nice if you could keep us posted in xen-devel of the 
> status/progress of the binutils patches.

I'll try to remember.

> By the number of patches needed for binutils it seems you opened a can 
> of worms/pandora box with this issue ^^

Well, that's been only one of the tinier cans.

> Also, in patch 12/17, you state that the logic would be that if .reloc 
> is generated partly by the code itself instead of solely by the linker 
> this means we want to use the section at runtime.
> While I kind of understand this idea, it also feels a bit as a hack, 
> doesn't it?

Yes and no. Assigning purpose to sections merely from their names is
already a hack. Yet since we need to live with that concept on PE/COFF
(and even ELF is quite far from being free of such), making this small
extra distinction feels quite acceptable to me.

> One could argue that even if .reloc is just generated by the linker, the
> program could still want to access it at runtime.

Not really, no. Ordinary programs hardly have a need to access their
own .reloc. And if so, having a simple, command-line-option-less way
to distinguish both intentions is probably the best we can have for
both worlds.

> I've looked at Xen code to see if it does put something in .reloc itself 
> and it seems so: 
> https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/relocs-dummy.S
> The "code puts data in .reloc section" would just serve as a "hint" for 
> the linker if I understand your patch well, just as well as a 
> `--keep-reloc` command line option would.

And something similar would then be needed for the other two linking
steps, just that there would be no actual data in that .reloc section
"contribution".

Jan

