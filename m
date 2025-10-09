Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC74BC9C6C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 17:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140750.1475540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6sXU-0002rj-6N; Thu, 09 Oct 2025 15:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140750.1475540; Thu, 09 Oct 2025 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6sXU-0002pD-3T; Thu, 09 Oct 2025 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1140750;
 Thu, 09 Oct 2025 15:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6sXS-0002p7-0W
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 15:26:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58120120-a524-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 17:26:36 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so9600295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 08:26:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3d7df4sm42302045e9.1.2025.10.09.08.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 08:26:35 -0700 (PDT)
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
X-Inumbo-ID: 58120120-a524-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760023596; x=1760628396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOAP6ryJ31nbEz97edctsHJI10QWJPQCklHySLgy7Yg=;
        b=cFjiOW41lK26cJULhsgMWAE2ucFfB9JOAN39H3pwZvDUiCVS7TRDt9DQ82xqY7OUdM
         zKZDmZ7BnGIRWetR/p42XZ6rSKNnVqUdVhuVcaES9XVoHK186HIIhvyarM8o4GYNmJMx
         VRq9QomyoUNGHXaJtQKmIXTXxyZb73rxDQA0hwV1pQMNutWTZl35q5hvjUx630JWmUWG
         U3TqS4SZPNEv/+NrTpYnvEK1BgszCBz8Q/bRN2ic0eP8PzSRZ1GTHj22nCdDjZm5IAGg
         oYNjzSZydG5JXfzkMbhN1kNu7fZSMaaRTz5kxv/vCfyZrLgRRpnOdCurHxagCMnWoNv9
         zQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023596; x=1760628396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOAP6ryJ31nbEz97edctsHJI10QWJPQCklHySLgy7Yg=;
        b=TAwSv6eo2MTNB7OQSY0rCLk1BB2G///5xSZp9yvOlYky3hriOTAJwbHHIOeC+vdIbE
         Ws4Ppl9M3IT5jhHNQVhJkReP0gB57pmw9Nk1Srbn/2dQ9uH3y5H5AOm4+8CND01yA29I
         gEmoHS1LhCirOofmHpZSl18fmrTLcRQf5DPqwtT8NJGbGxV6me5Y6hymm7RTB/yp2x3f
         EmmkwHJMMWduYdBuvLuDQ33b64m2r3obWQP+tZTHFmu/aRfWkILKQtxRYTjhwt8lVb8g
         T15lG00eEwYRW/qhKu1JboOfJwg/noGDX7LYTD0NorAdGX7YmjLbP5CqyjHhh5uZFaeN
         LrNw==
X-Forwarded-Encrypted: i=1; AJvYcCXOlBop+S4rySAcZEifVGe3mzyyKPSlna9MX2I3osAJGvlYKsfzCGgL4dLGMiA8Mo7+XEJ+DFeEbuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaupUT19PT+QEzDvIC0Ibh0pt6t8uSsLXH5F8QeczFZbhy7PvB
	AgWlBFiJhlLBP6SBF56KAFLjvUWdrPdfz/8FQmhgazgTqDi53WfUtkKk4peqjq2wlQ==
X-Gm-Gg: ASbGncuX1qATSPKx+kVNkwa8Dt0QpgzsM4i98SOMWTOy+WRSLLV/fxx98EzPIEs9qeI
	dksPoHNzmFf5AK/SaLj5Bt7hTOHH4Q8NEnO4G2Da6h+s84tOGXxlCmf5zKlj/NRK17NGT8DGA83
	nRgQL6yh7aEG5QfvN8u+g23b1x9NleVZTrFpZYOUl7Ps3+Xi4zsG5raaEqZKub1iRwFjEmfGH/N
	N3byQkQ/lq12fF4AZmzzFYVn5m+75hNArL9ESDzBGXFpwu5mTDQubmdpF0FJqybHK8jWYLApj6i
	1mj/ul1oj9aII+6kt1IhjQkdYVlxebE1Fk3S8WIXWqRxpt9U162jzFdKjTz6PSi/yP+C/Ew/cko
	qvc1rfhdKR+lvRSETpESv7fq3GROxNkmyZTIolq7DmfYYQBfZXdogeml4MWSBs6yqz7h6AF/A+z
	iIIwNzVSfuy/ZwCgBEra+mA5IHBpFR6i/DVoHQy51P3A==
X-Google-Smtp-Source: AGHT+IGsGQYGqorYODavoEjfJcpUe/uxohVNlG58G54wSUz1Kwdtg6GndUP2KXdJjGk1oXSl+QY+JA==
X-Received: by 2002:a05:600c:1552:b0:46e:1c16:7f42 with SMTP id 5b1f17b1804b1-46fa9a9659emr56804715e9.11.1760023595734;
        Thu, 09 Oct 2025 08:26:35 -0700 (PDT)
Message-ID: <8c9d8762-b39b-4696-bb6a-23fa05fdc393@suse.com>
Date: Thu, 9 Oct 2025 17:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
 <DD733UWP8JVK.SSX8U5ENELIE@amd.com>
 <3715a68a-dc35-42f4-99e2-e1a45ebd1b16@epam.com>
 <ad2818bd-bf36-46b9-89f3-ffa8b9dd364a@suse.com>
 <a80dc58d-a6b7-4de4-be1e-7c2fa03b17aa@epam.com>
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
In-Reply-To: <a80dc58d-a6b7-4de4-be1e-7c2fa03b17aa@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2025 16:55, Grygorii Strashko wrote:
> Hi Jan,
> 
> Thanks for your comments and support.
> 
> On 07.10.25 18:35, Jan Beulich wrote:
>> On 03.10.2025 16:04, Grygorii Strashko wrote:
>>>
>>>
>>> On 01.10.25 18:18, Alejandro Vallejo wrote:
>>>> On Tue Sep 30, 2025 at 9:05 PM CEST, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> The LAPIC LVTx registers have two RO bits:
>>>>> - all: Delivery Status (DS) bit 12
>>>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>>>
>>>>> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
>>>>> and the IRQ is:
>>>>> - or accepted at destination and appears as pending
>>>>>     (vLAPIC Interrupt Request Register (IRR))
>>>>> - or get rejected immediately.
>>>>>
>>>>> The Remote IRR Flag (RIR) behavior emulation is not implemented for
>>>>> LINT0/LINT1 in Xen for now.
>>>>>
>>>>> The current vLAPIC implementations allows guest to write to these RO bits.
>>>>>
>>>>> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
>>>>> to implement "Write ignore" access type for RO bits by applying masks from
>>>>> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
>>>>> allows writing to RO fields.
>>>>>
>>>>> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
>>>>> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
>>>>>
>>>>> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
>>>>> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
>>>>> to reserved bits should cause #GP exception), but contains no statements
>>>>> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
>>>>> now uses different masks (than vlapic_reg_write()) for checking LVTx
>>>>> registers values for "Reserved" bit settings, which include RO bits and
>>>>> do not cause #GP exception.
>>>>>
>>>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - masks fixed in vlapic_lvt_mask[]
>>>>> - commit msg reworded
>>>>>
>>>>> v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/
>>>>>    xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>>>>>    1 file changed, 8 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>>>> index 79697487ba90..2ecba8163f48 100644
>>>>> --- a/xen/arch/x86/hvm/vlapic.c
>>>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>>>> @@ -44,15 +44,17 @@
>>>>>    static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>>>>    {
>>>>>         /* LVTT */
>>>>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>>>>> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>>>>>         /* LVTTHMR */
>>>>> -     LVT_MASK | APIC_DM_MASK,
>>>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>>>>         /* LVTPC */
>>>>> -     LVT_MASK | APIC_DM_MASK,
>>>>> -     /* LVT0-1 */
>>>>> -     LINT_MASK, LINT_MASK,
>>>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>>>> +     /* LVT0 */
>>>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>>>> +     /* LVT1 */
>>>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>>>>         /* LVTERR */
>>>>> -     LVT_MASK
>>>>> +     LVT_MASK & ~APIC_SEND_PENDING,
>>>>>    };
>>>>
>>>> This is a bit messy. Why not have 2 masks? One for rsvdZ bits, and one
>>>> for RO?
>>>>
>>>> That ought to simplify the logic in both the MSR and MMIO cases.
>>>>
>>>> MMIO would do RAZ/WI on the OR of both, while the MSR interface would gate
>>>> #GP(0) on the mask for rsvd bits only and ensure all RO bits are preserved on
>>>> writes.
>>>>
>>>> Thoughts?
>>>
>>> I've been thinking about the same and It can be done, np.
>>> I always trying to make "fix" with as small diff as possible
>>> considering back-porting.
>>>
>>> How about "follow up" patch if there is an agreement to proceed this way on the Top level?
>>
>> Doing it in two steps would be okay with me (I expected it to go that way
>> anyway), but then it would still be nice to limit churn some. Specifically,
>> taking LINT_MASK as example, can't we do
>>
>> #define LINT_RO_MASK (LVT_RO_MASK | APIC_LVT_REMOTE_IRR)
>>
>> #define LINT_WR_MASK \
>>      (LVT_WR_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY | \
>>      APIC_LVT_LEVEL_TRIGGER)
>>
>> #define LINT_MASK (LINT_WR_MASK | LINT_RO_MASK)
>>
>> or some such, and then use *_WR_MASK in the table initializer?
> 
> Huh. I seems lost a bit, so it's time for ask for more clarifications.
> 
> I was under impression (seems wrong) that this patch is ok in general, but
> more improvements need to be done while here [1].
> My situation is simple - I have a broken safety test with obvious reason "RO bits are writable".
> And for me fixing a bug (in most simple and fast way) is a high priority.
> Then whatever optimization/improvements/refactoring (while have time slot).
> 
> So, what need to be done to get the bug fixed and fix merged? (preferably in 4.21)

I think what Oleksii said on my series likely applies to this fix too: Has
been around for a long time, and hence isn't really release critical.

Jan

