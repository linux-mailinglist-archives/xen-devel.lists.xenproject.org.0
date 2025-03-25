Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D09A7028D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 14:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926488.1329331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4cc-0008HL-4Q; Tue, 25 Mar 2025 13:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926488.1329331; Tue, 25 Mar 2025 13:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4cc-0008El-16; Tue, 25 Mar 2025 13:47:14 +0000
Received: by outflank-mailman (input) for mailman id 926488;
 Tue, 25 Mar 2025 13:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx4cb-0008Ef-48
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 13:47:13 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a67b95c0-097f-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 14:47:10 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so587062f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 06:47:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3c90sm14142334f8f.36.2025.03.25.06.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 06:47:09 -0700 (PDT)
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
X-Inumbo-ID: a67b95c0-097f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742910430; x=1743515230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KwkOEWzuNElyqq+rjr0vs4RYciOAnS/XY4KyuY4voak=;
        b=Kh8BXXoal40zi5kmdVBu5p10k9pGAaxfQNWJLyxXZJQwsRR/ucbI+Ix9HivIKD0TiN
         J4Ys+CxhXoQHfDS7FkXU9WUpxvgk257XJXp++YmPn6Luo3d5vBr2HSOSebighQAYzNRn
         bDNA3FVd8Sy6843ZOUhUkGA4eKJWWas5QswOftxNPx2qeXXGem1KE1CRdNiBzdoCsnrz
         Gjm4FvbiXuKD4SmEVp3A674gxRr+0uPFWSF+PlRwRTH596tYH6lGzjI3bciffP48Da//
         3Ph/mmNJ9kG6ZrOCfc6c2BxMRG117xPQ/T9P5G/aHFF+eeXt0GhWJlt3wyaz9ze6Isvy
         0i8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910430; x=1743515230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwkOEWzuNElyqq+rjr0vs4RYciOAnS/XY4KyuY4voak=;
        b=TNn0xOm0UtS7zDOxB8n2eYAeu5tm3Kh+BeZh2RxVEjnRKrOFhPG6YjNJJCXn1OGdtp
         HQyf+VBie4TffEpaaZ29qI6APIQqX6I09bB8VMuVWkeMaDAMe5grTNNkyx21owlLiSpp
         tp63qdk3zJiuN/Er2FYqpS+kcFsP2T4HJ/mEbHfz0FavVsuheObNHufd8d5y1saXbLl5
         3tAYYrASuBbCpciY8tSZgR/B90kNla3WVqbOupbRNvoKwVggydMEoToYK1Dx2zPRd/6c
         VdFibcNqAbGcRabkfjlMCQtaq55HH1inZ0SuvomkoQV09Q52NdiL+KuqoQ5EvsbMLDcm
         GXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL7aYUKUiPhzykLVkxAk8z8xhfMm3iGqwp5+Ju/BObBY+RRYuAJkNqVCUyTHURPxLqvc1eZFPr5S4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZ3BR6INn5bLZfyUXRMDnY7Su7x2mEcuOgm7w+dH+8Q9l6unWS
	6qT5hlbRBcpWYEXNECngGXdPrSDsMG4BKh2CjMIsBpKcHDxCRTM0mnnM9bwm2Q==
X-Gm-Gg: ASbGncu0tOx15fQxz9yO1+ImV7lMhCJLwsdII7pA/Ts45/NAf2GnGfKKgLsE7WMPuCo
	ieDVpWA2S8ta+Kn82qFQrAvUIn8mIZs2kE91Lw3TuGEaOyZqSH0855s3IDk4mEjkngQAbc3NaiZ
	unQ+zlwhJM23n0bfx5YU4K8tqrbwGnR3EAUriTzAMMoXwJOXI49QRJRGEkacYgeP1IhM1YDFH/u
	94FLrm/kgpWQoR9Pi5Um6dv6F8tAW/rznadcszomR4H98wzR77ZirQltV6xNa9ZOFMnyLUHlyob
	7Dlc2ngq19NdsPyAza739kdFVpm44wWQONBm/2GEj0CmyrHUuh+d/FNrk5VwjSvrdu4MtkKR16K
	8H9QGaAnChP0qbDDYm3uzjntASxN/dQ==
X-Google-Smtp-Source: AGHT+IFMC3q4uDMdP+dL7yo4RnDaT/XoKekcb9YjQktz34XE38+UvMbSt1LrhXKNdtYZYaJquWB6Bg==
X-Received: by 2002:a05:6000:1842:b0:391:253b:404a with SMTP id ffacd0b85a97d-3997f8f9ad1mr15190380f8f.8.1742910430046;
        Tue, 25 Mar 2025 06:47:10 -0700 (PDT)
Message-ID: <a6d511ec-38bc-4fad-9e08-462b7c10eac4@suse.com>
Date: Tue, 25 Mar 2025 14:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: add H extenstion to -march
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <0a072ab36b54ea7c4f9a6f94465fb7b79f9f49b2.1742573085.git.oleksii.kurochko@gmail.com>
 <c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com>
 <ee8b8e09-9b0b-4757-989c-b7d81721c325@gmail.com>
 <3d9e8e8c-2e09-43d6-a254-2f081c9e5eb1@suse.com>
 <e6e64e58-a26a-44cc-b708-5bf510b041c8@gmail.com>
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
In-Reply-To: <e6e64e58-a26a-44cc-b708-5bf510b041c8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 14:02, Oleksii Kurochko wrote:
> 
> On 3/25/25 12:52 PM, Jan Beulich wrote:
>> On 25.03.2025 12:48, Oleksii Kurochko wrote:
>>> On 3/24/25 1:31 PM, Jan Beulich wrote:
>>>> On 21.03.2025 17:17, Oleksii Kurochko wrote:
>>>>> H provides additional instructions and CSRs that control the new stage of
>>>>> address translation and support hosting a guest OS in virtual S-mode
>>>>> (VS-mode).
>>>>>
>>>>> According to the Unprivileged Architecture (version 20240411) specification:
>>>>> ```
>>>>> Table 74 summarizes the standardized extension names. The table also defines
>>>>> the canonical order in which extension names must appear in the name string,
>>>>> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
>>>>> RV32IMACV is legal, whereas RV32IMAVC is not.
>>>>> ```
>>>>> According to Table 74, the h extension is placed last in the one-letter
>>>>> extensions name part of the ISA string.
>>>>>
>>>>> `h` is a standalone extension based on the patch [1] but it wasn't so
>>>>> before.
>>>>> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
>>>>> and for that version it will be needed to encode H extensions instructions
>>>>> explicitly by checking if __risv_h is defined.
>>>> Leaving aside the typo, what is this about? There's no use of __riscv_h in
>>>> the patch here, and ...
>>> It is going to be used in future patches:https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32
>> For this and ...
>>
>>>>> @@ -25,10 +24,13 @@ $(eval $(1) := \
>>>>>    	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>>>>    endef
>>>>>    
>>>>> +h-insn := "hfence.gvma"
>>>>> +$(call check-extension,h)
>>>> ... this, if it fails, will not have any effect on the build right now
>>>> afaics.
>>> No, it won't have any affect now as instruction from H extension isn't used now.
>>> But it will be neededforhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/
>>> and for p2m changes mentioned above.
>> ... this both being future work, it might help if it could be made clear
>> right here how things are going to work (with both gcc12 and up-to-date
>> gcc).
> 
> I can update the commit message with the following:
> ```
> If 'H' extension is supported by compiler then __riscv_h will be defined by
> compiler (for gcc version >= 13.1).
> For gcc12 it will be needed to:
> #ifdef __riscv_h
>   asm volatile ("h extension instruction");
> #else
>   asm volatile ("|.insn ..."); #endif ```

Okay, that's what I was concerned about. __riscv_h is a compiler indication.
It means nothing about H extension insns being supported by the assembler
(except perhaps for Clang's integrated one). The check-extension thing in
the Makefile will actually check both in one go. Yet then the hfence.* insns
have been in binutils since 2.38, i.e. pre-dating gcc12.

> Or probably it will be easier not to ifdef-ing 
> everything with __riscv_h but just return back a workaround with the 
> following changes: ``` $ git diff diff --git a/xen/arch/riscv/arch.mk 
> b/xen/arch/riscv/arch.mk index f29ad332c1..3bd64e7e51 100644 --- 
> a/xen/arch/riscv/arch.mk +++ b/xen/arch/riscv/arch.mk @@ -24,13 +24,17 
> @@ $(eval $(1) := \ $(call as-insn,$(CC) 
> $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1))) endef -h-insn := 
> "hfence.gvma" -$(call check-extension,h) + 
> +h-extension-name-$(CONFIG_CC_IS_GCC) := $(call cc-ifversion,-lt,1301, 
> hh, h) +h-extension-name-$(CONFIG_CC_IS_CLANG) := h + 
> +$(h-extension-name-y)-insn := "hfence.gvma" +$(call 
> check-extension,$(h-extension-name-y)) zihintpause-insn := "pause" 
> $(call check-extension,zihintpause) -extensions := $(h) $(zihintpause) 
> _zicsr_zifencei_zbb +extensions := $($(h-extension-name-y)) 
> $(zihintpause) _zicsr_zifencei_zbb extensions := $(subst 
> $(space),,$(extensions)) ``` I prefer more a little bit the second 
> option with having the workaround for GCC version. ~ Oleksii |

I fear this ended up unreadable.

Jan

