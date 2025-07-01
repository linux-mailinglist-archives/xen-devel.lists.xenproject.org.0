Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8012AEEE1A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 08:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029369.1403110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWU7p-0004Lq-4M; Tue, 01 Jul 2025 06:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029369.1403110; Tue, 01 Jul 2025 06:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWU7p-0004KF-1G; Tue, 01 Jul 2025 06:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1029369;
 Tue, 01 Jul 2025 06:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWU7n-0004K9-Nw
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 06:05:47 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b3ae47b-5641-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 08:05:42 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso2815202f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 23:05:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e4c60sm96885295ad.50.2025.06.30.23.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 23:05:40 -0700 (PDT)
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
X-Inumbo-ID: 6b3ae47b-5641-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751349941; x=1751954741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S1AUvAV06A3zlK75p6RRMgMYWCqMpea3CXoPXxng76Y=;
        b=dj7xqYftq2JCGKTYT7HxNyifzH8y4HmHQwdO/YsHlDxWsQi+Wmwg1kEcpj47POn8EY
         2rHWGuYDx/NTx0FjSTPlkBQKYSF3+TtM09QcOWTZ3ZaNuvtpGcdvsoKMqpMPx9ea+qjx
         8SKV94l99ns7AQIBMYj5W/TrTM+/iLMejkpk/8PgDLFbBSYK/9o+qi3xP5i7W0yC6BB8
         IaAvLOZfSKqMHeZ4LqjUsCU2wI+L0SvzgEAszMVC4nnOo2Xj3shC76JxJR1WGCIfsF6a
         k8E1rymGgyf2RPm+UPJeFSLs7XcFj/EHowzKFwiWevvrQn0PLnp6X2USTUPfzdDqpdtt
         s4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751349941; x=1751954741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1AUvAV06A3zlK75p6RRMgMYWCqMpea3CXoPXxng76Y=;
        b=gjifLogHURdPncltR56bfeveBd3ROM4N/Y0+dQoCOau7TKP2KpkCWbHncGHsf4BXmb
         lh8W6fSO9Clvd3NRgDVQQjkS65nX3TaxPWfBQE9FTyQ0c09UQG4RDs1GAPRpIvUrgNg0
         upNtxtQP9knJEAZWBpVuxmelf8RhJF+R4cw3JC0q5BgwmFu2U50t4lEKLV0J4HQTAcHx
         fHPvnLSQLIIdqd4Eccu/HqwITjHP9wl+K+3xQoBgNMXQUgiedCkLEBzAmb1JsJuO4HhG
         5z9zbpzG+1zGF7g5wrwVXkBsj6vCkk2UA+6fz1kk84mwdubaRoqe/DvHrqUc1Irgb/uF
         MkSQ==
X-Gm-Message-State: AOJu0YwjMldc/hOcWwXOpCyDmF7BFzz5OAZNlAOAhwYm5zEa8zpxOEVd
	x2yp6WEpu3L0DbHsbOZ7BXtTc0PzQgFm1My0g/DRCvTk67/5xDA6+UFC1bjZgKyx+g==
X-Gm-Gg: ASbGnctCXPD4Px305GotwTa8Ql1/4wqSpe8Ch45hWxDXQ4SBv9QGqnxlGGXOkqGLt/e
	I+LLNssyuatG3CXuMGSqM4JC18fmQ0wioTpkW/IF1CE5jAuc5cUqoIs5clcwq4WkokRZLxe0h+8
	wo6DpoCZqK8Gnnfc79N0fHTPe7M12qj0ugJrHY6uA6PoSazFBY5MclLowkkZINkZGirGScTVvQq
	7uM97pERgDIcjgyOBmdXJZoVWdHtVYKf4NCnckT/MpxCLP5KAkVktjenYSOQNJ3AoaY1JZiWJ8c
	nNvkH2u3ciS8C/LHJD+xNG6H+rSQPNfizVTZT8PORhdCJsaMyIzvHHMZmKkYPWGDANk1b7gwUg0
	pOi8LJKxxQrN9RnKncCdOOJ33QvngdLJtnA4CFDEmuBBhQuM=
X-Google-Smtp-Source: AGHT+IH88/BZZAOcUHvNJx+14o4v6gxzvUb7WdPeE5yhfbTbFdJAjifR70nf8dlJmYCroKwfFpaz7g==
X-Received: by 2002:a5d:5f49:0:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a8ffccac13mr14315099f8f.29.1751349941407;
        Mon, 30 Jun 2025 23:05:41 -0700 (PDT)
Message-ID: <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
Date: Tue, 1 Jul 2025 08:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 03:50, Stefano Stabellini wrote:
> On Mon, 30 Jun 2025, Roger Pau Monné wrote:
>> On Fri, Jun 27, 2025 at 07:08:29PM -0700, Stefano Stabellini wrote:
>>> Hi Roger,
>>>
>>> We have an ARM board with the following memory layout:
>>>
>>> 0x0-0x80000000, 0, 2G
>>> 0x800000000,0x880000000, 32GB, 2G
>>> 0x50000000000-0x50080000000 5T, 2GB 
>>> 0x60000000000-0x60080000000 6T, 2GB 
>>> 0x70000000000-0x70080000000 7T, 2GB 
>>
>> With the current PDX mask compression you could compress 4bits AFAICT.
>>
>>> It looks like your PDX series is exactly what we need.  However, I tried
>>> to use it and it doesn't seem to be hooked properly on ARM yet. I spent
>>> some time trying to fix it but I was unsuccessful.
>>
>> Hm, weird.  It shouldn't need any special hooking, unless assumptions
>> about the existing PDX mask compression have leaked into ARM code.
>>
>>> As far as I can tell the following functions need to be adjusted but I
>>> am not sure the list is comprehensive:
>>>
>>> xen/arch/arm/include/asm/mmu/mm.h:maddr_to_virt
>>
>> At least for CONFIG_ARM_64 this seems to be implemented correctly, as
>> it's using maddr_to_directmapoff() which should have the correct
>> translation between paddr -> directmap virt.
>>
>> Also given the memory map above the adjustments done in ARM to remove
>> any initial memory map offset should be no-ops, since I expect
>> base_mfn == 0 in setup_directmap_mappings() in that particular case,
>> and then directmap_mfn_start = directmap_base_pdx = 0 and
>> directmap_virt_start = DIRECTMAP_VIRT_START.  FWIW, if ARM uses offset
>> compression the special casing about removing the initial gap can be
>> removed, as the compression should already take care of that.
>>
>>> xen/arch/arm/mmu/mm.c:setup_frametable_mappings
>>> xen/arch/arm/setup.c:init_pdx
>>
>> I've attempted to adjust init_pdx() myself so it works with the new
>> generic PDX compression setup, it seemed to work fine on the CI, but I
>> don't have any real ARM machines to test myself.
>  
>> Is there a way I could reproduce the issue(s) you are seeing with
>> QEMU?
> 
> Maybe. You can see how we run QEMU from gitlab-ci, but I don't know on
> top of my head how to force QEMU to emulate multiple RAM banks at
> specific addresses.
> 
> 
>> I'm already working on v3, as this version implementation of
>> mfn_valid() is buggy.  Maybe that's what you are hitting?
>>
> 
> This is the error:
> 
> (XEN) [0000000179e5f96b] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
> (XEN) [0000000179e90619] ----[ Xen-4.21-unstable  arm64  debug=y  Not tainted ]----
> (XEN) [0000000179e9ee58] CPU:    0
> (XEN) [0000000179eac907] PC:     00000a00002da5fc setup_mm+0x174/0x200
> (XEN) [0000000179ed3ed0] LR:     00000a00002da580
> (XEN) [0000000179edc486] SP:     00000a0000327e10
> (XEN) [0000000179ee6b3a] CPSR:   00000000200003c9 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN) [0000000179ef5b4f]      X0: 0000050000000000  X1: 0000000050000000  X2: 0000000000080000
> (XEN) [0000000179f05de3]      X3: 0000000000000017  X4: 0000000000000000  X5: 0000000050000000
> (XEN) [0000000179f19396]      X6: 000000004fffffff  X7: 0000000000000000  X8: 0000000000020400
> (XEN) [0000000179f2d797]      X9: 000000000001b808 X10: 0000000000000080 X11: 00000000000186de
> (XEN) [0000000179f3d492]     X12: 000000000001a7df X13: 000000000001214f X14: 0000000000017275
> (XEN) [0000000179f50f4c]     X15: 00000a00002b48bc X16: 00000a0000291478 X17: 0000000000000000
> (XEN) [0000000179f60902]     X18: 000000007be9bbe0 X19: 0000000000000002 X20: 0000000000000000
> (XEN) [0000000179f6fde5]     X21: 0000050080000000 X22: 00000a00002f8008 X23: 00000a00002b5c90
> (XEN) [0000000179f7eeea]     X24: 0000000180000000 X25: 00000a00002b5e90 X26: 0000000000000000
> (XEN) [0000000179f8ee55]     X27: 0000000000000000 X28: 000000007bff2f70  FP: 00000a0000327e10
> (XEN) [0000000179fa6deb] 
> (XEN) [0000000179fadf84]   VTCR_EL2: 0000000000000000
> (XEN) [0000000179fb9994]  VTTBR_EL2: 0000000000000000
> (XEN) [0000000179fc689d] 
> (XEN) [0000000179fcc1a0]  SCTLR_EL2: 0000000030cd183d
> (XEN) [0000000179fd95e3]    HCR_EL2: 0000000000000038
> (XEN) [0000000179fe7082]  TTBR0_EL2: 0000000022148000
> (XEN) [0000000179ff0d00] 
> (XEN) [0000000179ff6d07]    ESR_EL2: 00000000f2000001
> (XEN) [000000017a0003fe]  HPFAR_EL2: 0000000000000000
> (XEN) [000000017a00c8f4]    FAR_EL2: 0000000000000000
> (XEN) [000000017a018511] 
> (XEN) [000000017a01fbe5] Xen stack trace from sp=00000a0000327e10:
> (XEN) [000000017a02aa88]    00000a0000327e60 00000a00002e40c4 0000000022200000 000000000000f000
> (XEN) [000000017a03e578]    00000a0000c0a5c0 00000a0000332000 00000a0000a00000 0000000000000000
> (XEN) [000000017a04e676]    0000000000000000 0000000000000000 000000007be89ea0 00000a00002001a4
> (XEN) [000000017a0636e1]    0000000022000000 fffff60021e00000 0000000022200000 0000000000001710
> (XEN) [000000017a072ae0]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a084bf8]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a097ced]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a0a6829]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a0b8e71]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a0cdb4b]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a0e44b9]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a0f6a2b]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a1074a2]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a1178b3]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a128463]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [000000017a13a015]    0000000000000000 0000000000000000
> (XEN) [000000017a144d66] Xen call trace:
> (XEN) [000000017a14bcee]    [<00000a00002da5fc>] setup_mm+0x174/0x200 (PC)
> (XEN) [000000017a15db0a]    [<00000a00002da580>] setup_mm+0xf8/0x200 (LR)
> (XEN) [000000017a167dbb]    [<00000a00002e40c4>] start_xen+0x118/0x9d0
> (XEN) [000000017a171724]    [<00000a00002001a4>] arch/arm/arm64/head.o#primary_switched+0x4/0x24
> (XEN) [000000017a18abb4] 
> (XEN) [000000017a19a465] 
> (XEN) [000000017a19ffed] ****************************************
> (XEN) [000000017a1aad66] Panic on CPU 0:
> (XEN) [000000017a1b2757] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
> (XEN) [000000017a1daedf] ****************************************
> (XEN) [000000017a1eb0a9] 
> (XEN) [000000017a1f2b27] Reboot in five seconds...
> 
> 
> If I remove the ASSERT:
> 
> (XEN) [00000003bc65c616] parameter "debug" unknown!
> (XEN) [00000003bc70915a] 
> (XEN) [00000003bc70fd14] ****************************************
> (XEN) [00000003bc71afec] Panic on CPU 0:
> (XEN) [00000003bc724d03] The frametable cannot cover the physical region 0000000000000000 - 0x00070080000000
> (XEN) [00000003bc73786c] ****************************************
> (XEN) [00000003bc741a19] 
> (XEN) [00000003bc747833] Reboot in five seconds...
> 
> 
> I think the issue (or one issue) is the implementation of
> setup_frametable_mappings on ARM which is ignoring the pdx_group_valid
> bitmap. I am attaching a work-in-progress patch from Michal to add
> support for it for your reference. Remove commit fe6a12a08 to apply the
> patch without conflict.
> 
> With Michal's patch, I can boot *without* your patches on the
> problematic board.
> 
> I still cannot boot with your patches, even with Michal's patch. I still
> hit the same ASSERT. If I remove the ASSERT I go further and hit:
> 
> (XEN) [00000001bccbd3ab] Panic on CPU 0:
> (XEN) [00000001bccc4c3e] Frametable too small
> 
> I added some debug messages (see
> attached stefano-debug.patch). Something seems to be wrong with the
> pdx_group_valid bitmap after 0x880000, as we start getting MFN ranges
> such as 0x254c0000-0x25500000 which don't make any sense to me.

But in pdx_group_valid it would want to be PDXes.

> (XEN) [00000001563012a8] DEBUG init_pdx 294 start=0 end=80000000
> (XEN) [000000015630d6d9] DEBUG init_pdx 294 start=800000000 end=880000000
> (XEN) [000000015631c73c] DEBUG init_pdx 294 start=50000000000 end=50080000000
> (XEN) [000000015632947b] DEBUG init_pdx 294 start=60000000000 end=60080000000
> (XEN) [00000001563365a8] DEBUG init_pdx 294 start=70000000000 end=70080000000
> (XEN) [000000015637c6aa] DEBUG init_frametable 65 start=0 end=80000
> (XEN) [00000001563898e1] DEBUG init_frametable_chunk 28 virt=a0800000000 base_mfn=7007e000 pfn_start=0 pfn_end=80000
> (XEN) [000000015692ed1f] DEBUG init_frametable 65 start=800000 end=880000
> (XEN) [00000001569399fe] DEBUG init_frametable_chunk 28 virt=a081c000000 base_mfn=7007c000 pfn_start=800000 pfn_end=880000
> (XEN) [00000001573bad45] DEBUG init_frametable 65 start=254c0000 end=25500000
> (XEN) [00000001573dee6a] DEBUG init_frametable_chunk 28 virt=a1028a00000 base_mfn=7007a000 pfn_start=254c0000 pfn_end=25500000
> (XEN) [00000001578ad5c2] DEBUG init_frametable 65 start=25700000 end=257c0000
> (XEN) [00000001578b841d] DEBUG init_frametable_chunk 28 virt=a1030800000 base_mfn=70076000 pfn_start=25700000 pfn_end=257c0000
> (XEN) [000000015853b121] DEBUG init_frametable 65 start=27400000 end=27440000
> (XEN) [00000001585470fe] DEBUG init_frametable_chunk 28 virt=a1096000000 base_mfn=70074000 pfn_start=27400000 pfn_end=27440000
> (XEN) [0000000158880a59] DEBUG init_frametable 65 start=27480000 end=27500000
> (XEN) [000000015888d583] DEBUG init_frametable_chunk 28 virt=a1097c00000 base_mfn=70072000 pfn_start=27480000 pfn_end=27500000
> (XEN) [0000000158eacf55] DEBUG init_frametable 65 start=27580000 end=27a40000
> (XEN) [0000000158eb7f8e] DEBUG init_frametable_chunk 28 virt=a109b400000 base_mfn=70060000 pfn_start=27580000 pfn_end=27a40000
> (XEN) [000000015cac7416] DEBUG init_frametable 65 start=27a80000 end=27ac0000
> (XEN) [000000015cad6818] DEBUG init_frametable_chunk 28 virt=a10acc00000 base_mfn=7005e000 pfn_start=27a80000 pfn_end=27ac0000
> (XEN) [000000015cb26b99] arch/arm/mmu/pt.c:360: Changing MFN for a valid entry is not allowed (0x70071800 -> 0x7005e000).
> (XEN) [000000015cb80f94] Xen WARN at arch/arm/mmu/pt.c:360
> (XEN) [000000015cbabedc] ----[ Xen-4.21-unstable  arm64  debug=y  Not tainted ]----

Sadly from this you omitted the output from the setup of the offsets
arrays. Considering also your later reply, I'd be curious to know what
mfn_to_pdx(0x50000000) is.

Jan

