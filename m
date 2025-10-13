Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9EDBD1DBF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 09:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141775.1475937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DDr-0003Vu-LN; Mon, 13 Oct 2025 07:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141775.1475937; Mon, 13 Oct 2025 07:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DDr-0003UA-Ih; Mon, 13 Oct 2025 07:43:59 +0000
Received: by outflank-mailman (input) for mailman id 1141775;
 Mon, 13 Oct 2025 07:43:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmnp=4W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v8DDq-0003U4-1V
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 07:43:58 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5faf728d-a808-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 09:43:56 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b3e234fcd4bso652355266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 00:43:56 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d65ccfe0sm859685766b.25.2025.10.13.00.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 00:43:55 -0700 (PDT)
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
X-Inumbo-ID: 5faf728d-a808-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760341436; x=1760946236; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQsQGxb8aZfQQIujWFogBasr7WOTOj4wJ/pL+aUNnB0=;
        b=EavO/Hu3KsxBy6oW1x5DGwwWvDU9zTrqtLAAGN4jdzY9YuINK6dS/efxwebQ1fgY+V
         lWVfAZYsbns0lCXmnpo+sc1wwMH4IpoRzp+q1ljhMgvAFhR61da3108ot0d3siZxneHd
         nwjB8/PkxECY/r5SKMznKgfghz3UImxvmNytXmnTqn6pVUSm400xFpPNtACq0C4p+4Pl
         QCTW+gKMCRIj3wlC/A6lRmRbFo1RccplxPC/QxLmphNNf4RWUlnS99E9lVWorGS5BDNA
         XT7QYXmeiVaEy+TlDy/Py4iK+EWE9OWFSCAA1IIiJKOZKRABLTkrEyFGFPfHNrZWXZ97
         oWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760341436; x=1760946236;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vQsQGxb8aZfQQIujWFogBasr7WOTOj4wJ/pL+aUNnB0=;
        b=qQ+mqgVR5kzlAHxTCYcxE0qiqE/pYirt6ZIxVE7ywMp5lJPugjBIvqxRu3TaOxibNF
         mMdxkAgTVcGVLsFOb3VYg6LCI8WpeYP5PanZLEqGWamnv77rtMgXeapjJ82jPspUTb39
         sRmir99m+fJiXydPIWQpakB/4yczjMzjYov1wSfDnxpZqvNoFR0l4gZY0LR8+WuPvgd8
         xMRNS61oBa+cE3XBvHZBZbN1m2YjKLc9Yze53RhMU03WPXSbNKSIEIV+BuRR+BtG3x5P
         DE6y4ZHdKKW7bM8+Gi0fYlJuNujHRdNUR2neoP4OuZnOCXVilleyFs73t3iL/5Hbw3SW
         RAIA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ppt2arywcFRebA/VEwgGliX2jf41bscQdHzbxSQwj/Ff0G898izZx2HM3ipml4JuHCcoGQqNqU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwitExTbtyZ1KnN7yvh5ibIl92oF125ZNHmn1XOBD3fzWhsIS75
	e2nTXvuKrq9/xaPnnIZWebDYTloTwR3xU+jOM/9XC/r/2FuZpo/ii53B
X-Gm-Gg: ASbGncvSJ84Vaf+kuuAxYNYSN/5H5w4xhLpJhi6xTEJSpGbQRZNHJzN4iX9t6n+e/cs
	Y32syi3eh8pS2E9smrNN/5350u4/5lm+Dz/X6UgxteqCm8lL2sD5vCN3cT3Nep8uLCVuoZk9Go/
	PT3L6rK512RqBHRM92VoX+2ig9SQoMg09bNtEslqbLbooMdWXBUTUSvv13LQx3RAffspcpxtAiI
	dnAlGD12Jmp9KBPR5LyYkmWHkhISUTXu0MtebMKQorta0eqmud+Ta2YJBRljFWAQc8tZgRIQEJa
	T7N5+ahd97DG/Fw5ep4CBpmcI1QKdelY66xbHShhI0KEvlDz831ulrtrVRu3yta6W81JBH3ZvPn
	RBSXTh7tf56PG+Mxq0wOQaCVTetPObhOFpmXQEYvEWc84BoOHsvEfXIz/JFXTTD/I+7rpnFKKlA
	kGKq3n80wzpLAjIt5K0t+Jzw==
X-Google-Smtp-Source: AGHT+IGO6mlBpUVikyFS9/TWI2Edr+GKv/1WXH6lc/4jkk1Bro4+D2MEjfo5QFygCeozNkr192r4eg==
X-Received: by 2002:a17:907:26c8:b0:b43:3dcf:b6c3 with SMTP id a640c23a62f3a-b50ac7ee211mr1931845566b.49.1760341436023;
        Mon, 13 Oct 2025 00:43:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------b8p8hcLJD5k03bxxeRLyg6Vi"
Message-ID: <2924ffc0-3d8f-4618-9070-f14d1ef2573d@gmail.com>
Date: Mon, 13 Oct 2025 09:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
 <DD733UWP8JVK.SSX8U5ENELIE@amd.com>
 <3715a68a-dc35-42f4-99e2-e1a45ebd1b16@epam.com>
 <ad2818bd-bf36-46b9-89f3-ffa8b9dd364a@suse.com>
 <a80dc58d-a6b7-4de4-be1e-7c2fa03b17aa@epam.com>
 <8c9d8762-b39b-4696-bb6a-23fa05fdc393@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8c9d8762-b39b-4696-bb6a-23fa05fdc393@suse.com>

This is a multi-part message in MIME format.
--------------b8p8hcLJD5k03bxxeRLyg6Vi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/25 5:26 PM, Jan Beulich wrote:
> On 09.10.2025 16:55, Grygorii Strashko wrote:
>> Hi Jan,
>>
>> Thanks for your comments and support.
>>
>> On 07.10.25 18:35, Jan Beulich wrote:
>>> On 03.10.2025 16:04, Grygorii Strashko wrote:
>>>>
>>>> On 01.10.25 18:18, Alejandro Vallejo wrote:
>>>>> On Tue Sep 30, 2025 at 9:05 PM CEST, Grygorii Strashko wrote:
>>>>>> From: Grygorii Strashko<grygorii_strashko@epam.com>
>>>>>>
>>>>>> The LAPIC LVTx registers have two RO bits:
>>>>>> - all: Delivery Status (DS) bit 12
>>>>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>>>>
>>>>>> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
>>>>>> and the IRQ is:
>>>>>> - or accepted at destination and appears as pending
>>>>>>      (vLAPIC Interrupt Request Register (IRR))
>>>>>> - or get rejected immediately.
>>>>>>
>>>>>> The Remote IRR Flag (RIR) behavior emulation is not implemented for
>>>>>> LINT0/LINT1 in Xen for now.
>>>>>>
>>>>>> The current vLAPIC implementations allows guest to write to these RO bits.
>>>>>>
>>>>>> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
>>>>>> to implement "Write ignore" access type for RO bits by applying masks from
>>>>>> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
>>>>>> allows writing to RO fields.
>>>>>>
>>>>>> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
>>>>>> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
>>>>>>
>>>>>> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
>>>>>> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
>>>>>> to reserved bits should cause #GP exception), but contains no statements
>>>>>> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
>>>>>> now uses different masks (than vlapic_reg_write()) for checking LVTx
>>>>>> registers values for "Reserved" bit settings, which include RO bits and
>>>>>> do not cause #GP exception.
>>>>>>
>>>>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>>>>> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - masks fixed in vlapic_lvt_mask[]
>>>>>> - commit msg reworded
>>>>>>
>>>>>> v1:https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/
>>>>>>     xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>>>>>>     1 file changed, 8 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>>>>> index 79697487ba90..2ecba8163f48 100644
>>>>>> --- a/xen/arch/x86/hvm/vlapic.c
>>>>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>>>>> @@ -44,15 +44,17 @@
>>>>>>     static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>>>>>     {
>>>>>>          /* LVTT */
>>>>>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>>>>>> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>>>>>>          /* LVTTHMR */
>>>>>> -     LVT_MASK | APIC_DM_MASK,
>>>>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>>>>>          /* LVTPC */
>>>>>> -     LVT_MASK | APIC_DM_MASK,
>>>>>> -     /* LVT0-1 */
>>>>>> -     LINT_MASK, LINT_MASK,
>>>>>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>>>>> +     /* LVT0 */
>>>>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>>>>> +     /* LVT1 */
>>>>>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>>>>>          /* LVTERR */
>>>>>> -     LVT_MASK
>>>>>> +     LVT_MASK & ~APIC_SEND_PENDING,
>>>>>>     };
>>>>> This is a bit messy. Why not have 2 masks? One for rsvdZ bits, and one
>>>>> for RO?
>>>>>
>>>>> That ought to simplify the logic in both the MSR and MMIO cases.
>>>>>
>>>>> MMIO would do RAZ/WI on the OR of both, while the MSR interface would gate
>>>>> #GP(0) on the mask for rsvd bits only and ensure all RO bits are preserved on
>>>>> writes.
>>>>>
>>>>> Thoughts?
>>>> I've been thinking about the same and It can be done, np.
>>>> I always trying to make "fix" with as small diff as possible
>>>> considering back-porting.
>>>>
>>>> How about "follow up" patch if there is an agreement to proceed this way on the Top level?
>>> Doing it in two steps would be okay with me (I expected it to go that way
>>> anyway), but then it would still be nice to limit churn some. Specifically,
>>> taking LINT_MASK as example, can't we do
>>>
>>> #define LINT_RO_MASK (LVT_RO_MASK | APIC_LVT_REMOTE_IRR)
>>>
>>> #define LINT_WR_MASK \
>>>       (LVT_WR_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY | \
>>>       APIC_LVT_LEVEL_TRIGGER)
>>>
>>> #define LINT_MASK (LINT_WR_MASK | LINT_RO_MASK)
>>>
>>> or some such, and then use *_WR_MASK in the table initializer?
>> Huh. I seems lost a bit, so it's time for ask for more clarifications.
>>
>> I was under impression (seems wrong) that this patch is ok in general, but
>> more improvements need to be done while here [1].
>> My situation is simple - I have a broken safety test with obvious reason "RO bits are writable".
>> And for me fixing a bug (in most simple and fast way) is a high priority.
>> Then whatever optimization/improvements/refactoring (while have time slot).
>>
>> So, what need to be done to get the bug fixed and fix merged? (preferably in 4.21)
> I think what Oleksii said on my series likely applies to this fix too: Has
> been around for a long time, and hence isn't really release critical.

Yes, your understanding is correct. IMO, this change can wait until 4.22.

~ Oleksii

--------------b8p8hcLJD5k03bxxeRLyg6Vi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/9/25 5:26 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8c9d8762-b39b-4696-bb6a-23fa05fdc393@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.10.2025 16:55, Grygorii Strashko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi Jan,

Thanks for your comments and support.

On 07.10.25 18:35, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 03.10.2025 16:04, Grygorii Strashko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">

On 01.10.25 18:18, Alejandro Vallejo wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On Tue Sep 30, 2025 at 9:05 PM CEST, Grygorii Strashko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">From: Grygorii Strashko <a class="moz-txt-link-rfc2396E" href="mailto:grygorii_strashko@epam.com">&lt;grygorii_strashko@epam.com&gt;</a>

The LAPIC LVTx registers have two RO bits:
- all: Delivery Status (DS) bit 12
- LINT0/LINT1: Remote IRR Flag (RIR) bit 14.

The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
and the IRQ is:
- or accepted at destination and appears as pending
    (vLAPIC Interrupt Request Register (IRR))
- or get rejected immediately.

The Remote IRR Flag (RIR) behavior emulation is not implemented for
LINT0/LINT1 in Xen for now.

The current vLAPIC implementations allows guest to write to these RO bits.

The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
to implement "Write ignore" access type for RO bits by applying masks from
vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
allows writing to RO fields.

Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
fix it by fixing LVTx registers masks in vlapic_lvt_mask[].

In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
to reserved bits should cause #GP exception), but contains no statements
for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
now uses different masks (than vlapic_reg_write()) for checking LVTx
registers values for "Reserved" bit settings, which include RO bits and
do not cause #GP exception.

Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
Signed-off-by: Grygorii Strashko <a class="moz-txt-link-rfc2396E" href="mailto:grygorii_strashko@epam.com">&lt;grygorii_strashko@epam.com&gt;</a>
---
Changes in v2:
- masks fixed in vlapic_lvt_mask[]
- commit msg reworded

v1: <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/">https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/</a>
   xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
   1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 79697487ba90..2ecba8163f48 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -44,15 +44,17 @@
   static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
   {
        /* LVTT */
-     LVT_MASK | APIC_TIMER_MODE_MASK,
+     (LVT_MASK | APIC_TIMER_MODE_MASK) &amp; ~APIC_SEND_PENDING,
        /* LVTTHMR */
-     LVT_MASK | APIC_DM_MASK,
+     (LVT_MASK | APIC_DM_MASK) &amp; ~APIC_SEND_PENDING,
        /* LVTPC */
-     LVT_MASK | APIC_DM_MASK,
-     /* LVT0-1 */
-     LINT_MASK, LINT_MASK,
+     (LVT_MASK | APIC_DM_MASK) &amp; ~APIC_SEND_PENDING,
+     /* LVT0 */
+     LINT_MASK &amp; ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
+     /* LVT1 */
+     LINT_MASK &amp; ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
        /* LVTERR */
-     LVT_MASK
+     LVT_MASK &amp; ~APIC_SEND_PENDING,
   };
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">
This is a bit messy. Why not have 2 masks? One for rsvdZ bits, and one
for RO?

That ought to simplify the logic in both the MSR and MMIO cases.

MMIO would do RAZ/WI on the OR of both, while the MSR interface would gate
#GP(0) on the mask for rsvd bits only and ensure all RO bits are preserved on
writes.

Thoughts?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
I've been thinking about the same and It can be done, np.
I always trying to make "fix" with as small diff as possible
considering back-porting.

How about "follow up" patch if there is an agreement to proceed this way on the Top level?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Doing it in two steps would be okay with me (I expected it to go that way
anyway), but then it would still be nice to limit churn some. Specifically,
taking LINT_MASK as example, can't we do

#define LINT_RO_MASK (LVT_RO_MASK | APIC_LVT_REMOTE_IRR)

#define LINT_WR_MASK \
     (LVT_WR_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY | \
     APIC_LVT_LEVEL_TRIGGER)

#define LINT_MASK (LINT_WR_MASK | LINT_RO_MASK)

or some such, and then use *_WR_MASK in the table initializer?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Huh. I seems lost a bit, so it's time for ask for more clarifications.

I was under impression (seems wrong) that this patch is ok in general, but
more improvements need to be done while here [1].
My situation is simple - I have a broken safety test with obvious reason "RO bits are writable".
And for me fixing a bug (in most simple and fast way) is a high priority.
Then whatever optimization/improvements/refactoring (while have time slot).

So, what need to be done to get the bug fixed and fix merged? (preferably in 4.21)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think what Oleksii said on my series likely applies to this fix too: Has
been around for a long time, and hence isn't really release critical.</pre>
    </blockquote>
    <pre>Yes, your understanding is correct. IMO, this change can wait until 4.22.

~ Oleksii</pre>
  </body>
</html>

--------------b8p8hcLJD5k03bxxeRLyg6Vi--

