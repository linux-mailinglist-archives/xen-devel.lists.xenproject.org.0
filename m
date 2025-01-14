Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF80A1081D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 14:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871384.1282392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXhGm-00060T-FR; Tue, 14 Jan 2025 13:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871384.1282392; Tue, 14 Jan 2025 13:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXhGm-0005xo-CD; Tue, 14 Jan 2025 13:47:48 +0000
Received: by outflank-mailman (input) for mailman id 871384;
 Tue, 14 Jan 2025 13:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXhGk-0005xi-HL
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 13:47:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2198f1a4-d27e-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 14:47:44 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so2718681f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 05:47:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89dfesm212000635e9.32.2025.01.14.05.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 05:47:43 -0800 (PST)
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
X-Inumbo-ID: 2198f1a4-d27e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736862464; x=1737467264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BB02OdBh2RZeclLJ1dGmTsGyvu/vw3frzKY2bGEkmb8=;
        b=DW1X2PF2QrF6Zd/Dz42oMZtLPnodROna9gG8U2s9Xv23naSh2X0nYe3T1kcPoybjPf
         agIrvR79dRog8x8IsplbNctaFCXBQ6iruVlJnfvk5Zu2UygQYnEmVbLvlImMEtZgjBR7
         ruP5vPuwlVcAtJFnCIP1ebmgwMMhL0fPlbK3g5PtJoPG+NxZc9ikyGIK4XYwQ7IQr2Mn
         vGuOyoFycBxwmSgUH2N4KkZYemMGgAaSck7b6dfG8eErF71zY74VrCtcleDwUFSxzA1v
         k/6Y9lNXAGSLD0i7FMMb/4SyYzkzfAdF6bBHN3CA/OeECnc1sGmPC5FSa9PQhY3zo6iP
         RFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736862464; x=1737467264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB02OdBh2RZeclLJ1dGmTsGyvu/vw3frzKY2bGEkmb8=;
        b=RZJ6IY6uQKOcZ+RnWg2bMX+kBVanNn5wC6fMj9HdBgOgz2lAdn/uQNyCoWQk2iPLfL
         ODq5i36/Bno2NPogxtVQMSESwCpgsg+r5QO+IyrenVis7XQgWUivMdAVFi1Jm0kwv/AT
         J9//eyAIk87GvYtnOA0bqu47w8YpZLf3+ViI9EhbwXdYXkrCcvFt9JlDF7KhM44HRNvx
         D1fnXp1Uy8H0gNwC+eGUy763h4w86xkih8NkAD3qQzZtmXzlGoHwjb9drEqjLKxFLr9T
         GV/e3urNAl4GOJe11/8rrJSjRsg3muaYYqQMzePbgQGl/dXSjLVuRgjBiCw4E3V51b2c
         nbgg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Ks5BIJmQD/rVEB6BtnXwdHmU0ESWBEYv4/hQCjfYKrJx2JoLITaUOqjq7EhtaB/QwyxYpoTUchg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxckuGbJ9Y6Y0TTVstl+Jxsb1Dni0nxLltwmy4FIt+9+zsRF72f
	9+fyYQOpTQxaOb3TBZ2Lv14TEA47VSYJKMede9xThQ+L+RTlRPu0GPxtWJtukQ==
X-Gm-Gg: ASbGncslOd1Ad414gKudeTg+7/g2sOS8Yleli+/6VTTAUhx1Mr59Ulesxt5mYEBL6My
	Jog1VuByWAkCZNqs5pQqaK06u5xDfxtICNqE9F2F+KS3E5GTzQM0hg9foE0YGiK9myPvcUZ5hhD
	M0WLLIsQAAN7+3KLiz2SuI86pHmdd0aI6cD5l797mbADP0Tad1G/7PylWfYm8Yp6vPQyGqUjzTe
	E8FeLVCf3K1gT5vtAsyBO88HNeXHV/VSbTJSGiw7FBGvwJBUv4WJf8hVM++6pdtTPfd01wwWTz4
	zkrJIgm3sJGXWYiWAObolSxlgWHR/arLRdVuu6JqGg==
X-Google-Smtp-Source: AGHT+IGnCNjNZcCfCKXkLT1oY2ZxzsWSxypl5Ni25bQkh5wLmr63ubUtFKXX5C8niMvlig4uys0sXA==
X-Received: by 2002:a05:6000:144f:b0:386:3b93:6cc6 with SMTP id ffacd0b85a97d-38a87303dd6mr23008089f8f.15.1736862463808;
        Tue, 14 Jan 2025 05:47:43 -0800 (PST)
Message-ID: <520803a3-1aed-40d4-93ab-699d1da9250b@suse.com>
Date: Tue, 14 Jan 2025 14:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
 <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
 <c8ed49b1-ffa3-4a40-a006-ee6e01b64367@suse.com>
 <1622f144-e872-4e3c-8522-2e692f63e8eb@citrix.com>
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
In-Reply-To: <1622f144-e872-4e3c-8522-2e692f63e8eb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.01.2025 14:28, Andrew Cooper wrote:
> On 14/01/2025 1:22 pm, Jan Beulich wrote:
>> On 12.12.2024 02:17, Andrew Cooper wrote:
>>> On 12/12/2024 12:13 am, Volodymyr Babchuk wrote:
>>>> Hello Jan,
>>>>
>>>> Jan Beulich <jbeulich@suse.com> writes:
>>>>
>>>>> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>>>>>> Both GCC and Clang support -fstack-protector feature, which add stack
>>>>>> canaries to functions where stack corruption is possible. This series
>>>>>> makes possible to use this feature in Xen. I tested this on ARM64 and
>>>>>> it is working as intended. Tested both with GCC and Clang.
>>>>>>
>>>>>> It is hard to enable this feature on x86, as GCC stores stack canary
>>>>>> in %fs:40 by default, but Xen can't use %fs for various reasons. It is
>>>>>> possibly to change stack canary location new newer GCC versions, but
>>>>>> this will change minimal GCC requirement, which is also hard due to
>>>>>> various reasons. So, this series focus mostly on ARM and RISCV.
>>>>> Why exactly would it not be possible to offer the feature when new enough
>>>>> gcc is in use?
>>>> It is possible to use this feature with a modern enough GCC, yes. Are
>>>> you suggesting to make HAS_STACK_PROTECTOR dependent on GCC_VERSION for
>>>> x86 platform?
>>> (With the knowledge that this is a disputed Kconfig pattern, and will
>>> need rebasing), the way I want this to work is simply:
>>>
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 0de0101fd0bf..5d0a88fb3c3f 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -434,6 +434,9 @@ endif
>>>  
>>>  ifeq ($(CONFIG_STACK_PROTECTOR),y)
>>>  CFLAGS += -fstack-protector
>>> +ifeq ($(CONFIG_X86),y)
>>> +CFLAGS += -mstack-protector-guard=global
>>> +endif
>>>  else
>>>  CFLAGS += -fno-stack-protector
>>>  endif
>>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>>> index 9cdd04721afa..7951ca908b36 100644
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -28,6 +28,7 @@ config X86
>>>         select HAS_PCI_MSI
>>>         select HAS_PIRQ
>>>         select HAS_SCHED_GRANULARITY
>>> +       select HAS_STACK_PROTECTOR if
>>> $(cc-option,-mstack-protector-guard=global)
>>>         select HAS_UBSAN
>>>         select HAS_VMAP
>>>         select HAS_VPCI if HVM
>>>
>>>
>>>
>>> Sadly, it doesn't build.  I get a handful of:
>>>
>>> prelink.o: in function `cmdline_parse':
>>> /home/andrew/xen.git/xen/common/kernel.c:216:(.init.text+0x20f2): failed
>>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>>> --no-relax
>>> /home/andrew/xen.git/xen/common/kernel.c:230:(.init.text+0x246f): failed
>>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>>> --no-relax
>>>
>>> which is more toolchain-whispering than I feel like doing tonight.
>> For reference:
>> https://sourceware.org/pipermail/binutils/2025-January/138631.html
>>
>> You didn't enter a gcc bug report yet, did you?
> 
> No, not yet.  I'm afraid I've not had the time.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118473

Jan


