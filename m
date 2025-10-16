Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65ECBE4609
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 17:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144628.1477976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9QKF-0007vU-V4; Thu, 16 Oct 2025 15:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144628.1477976; Thu, 16 Oct 2025 15:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9QKF-0007tc-S6; Thu, 16 Oct 2025 15:55:35 +0000
Received: by outflank-mailman (input) for mailman id 1144628;
 Thu, 16 Oct 2025 15:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9QKE-0007tW-Tn
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 15:55:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bba0216-aaa8-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 17:55:32 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-426fd699c21so408225f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 08:55:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4270539be85sm342656f8f.7.2025.10.16.08.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 08:55:31 -0700 (PDT)
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
X-Inumbo-ID: 8bba0216-aaa8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760630132; x=1761234932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bXN4UddN7ddvDOlgXPoHDSeJQipRme/1nTgsvrsI1FA=;
        b=H4g6U6I6ksB0gVRtZViU8tyA0TxJuuqsbyUrbniNlS1cWYemrjG3DvGYGqFDxePiKm
         kTNr6duG3+ZCK0XyrZyY2lPBhygUt7vVCaHdbkdsKLQzta8KOfqWEl19atPuI1uvbQbB
         Zh/0YOP1OUMyY08CtbOdKETXHqAKpuah7Hi92Vko+aEI2ssuG2LTJv2SpZ/+VGSi1weC
         WWHIYEbqSqBsjBqvoqGFRsV6SoCS1UgYxkDAfj4U3VuzaVdKsUsY68VaTA5d4CBYw5UP
         zha6l5SGnqcw71FR2qUc5hGurNO2k2Dz8Z0wWHW0kf5Ou7qodVY+RVgFWxI7CFc6eZoV
         IS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630132; x=1761234932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXN4UddN7ddvDOlgXPoHDSeJQipRme/1nTgsvrsI1FA=;
        b=uFdbj4w7ISEGxfOZlwEfYTL6ppgxLiCMImyjukad4imvkvcusdjWhf4kpMQtenywTI
         2+drrhXM/lUZbsjXrAwE1q+nS2xTAFgIUTlQiBkaGzWNy2yziXLOEdjVPzqdSvu9DQmV
         o+lFjCCgHxBd2LgyUZqYBPGUeh85dBhxt9MYfgR3nSHepv+jwBA6k6EFBPg6rND4+oWR
         TNTYHnHIdwqVQw4ok44C/62jHofhKuRABBFUTQPrrF/tmQQMbCP7RpTQG7IaqXUxKhzi
         J5NBqWrlHrdM4U9V9rQeDt/gy2nGlPQUqEodPhBl5obhTXqnkIrCycKPTadFpRQTlmdl
         tgAA==
X-Gm-Message-State: AOJu0YzlGq71aiRh3Ccb0l8WLjIBZbFiVEFr7RtIWlhdPAr5D3xYtpsm
	msB4oVNjxjds+3rHsyxV463IKc1SyhcuaE3b0yiika1J20LwJMnB0wnVCDGHqzMKwQ==
X-Gm-Gg: ASbGncsAMoepHE/xMOn70xT2Q+xWtpx0J8U8KaQdJtjFCfDw1ZgXhuSN/P+1gSZGbqQ
	SUnTlMpEQVt6UJd/xUyxcqZP6jo3hIoSYgRflRB3k8XzJyOy4chgPJ0Jx9I4gfY2MfwnetOG3E0
	kRhux32dfBy2FoWo4HoXep0BcSuQdTs/KqxtrWbuM+EgFf0YQ5wroMvx04Vso81vsiQnmVeEyaO
	kcYyK7UcFkc2KPv14dDIcSo1IqvH9uEcfD7L6DgAgv7hmDnFciO4L1U1GGQs700/rlkqYZGLQie
	GvuNOqw3u0y5ni6wxFxDN7iJzVR781/wpoB6geBbDP3qAMxo9ihtn1IL6d2CkQFgb4oWC9QRGJE
	OoY8IYJ/Z8JJCdrP1+d9Mjw9N1EAEQAwBtFNCbXE9VW45BhBhNw6VDv5mpSykvLJzbPHeDPiK/U
	Nreaoowm6BhPxOExMfxjN2fC1ENLVcybLIHWRzf+o0mlxxpDNGF+rTZJiUnJ0P
X-Google-Smtp-Source: AGHT+IH6z20zoy3BdDH2mwRlAz4lhRGDFaauy3NA+8zvdfK76eVKBJkuhT9ApeZlypPt78rk1LAoqw==
X-Received: by 2002:a05:6000:2881:b0:3ee:6fe9:418b with SMTP id ffacd0b85a97d-42704db5ab6mr419688f8f.63.1760630131909;
        Thu, 16 Oct 2025 08:55:31 -0700 (PDT)
Message-ID: <39b3cdbe-636c-4b9d-9134-d42f8a369c4a@suse.com>
Date: Thu, 16 Oct 2025 17:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com> <aPDaIssJOFh00-W7@Mac.lan>
 <bc7467ca-ba06-417c-8583-8de3782a1d83@suse.com> <aPEQmMKYRwPaKxX6@Mac.lan>
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
In-Reply-To: <aPEQmMKYRwPaKxX6@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 17:34, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 01:57:41PM +0200, Jan Beulich wrote:
>> On 16.10.2025 13:42, Roger Pau Monné wrote:
>>> On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
>>>> Keeping channels enabled when they're unused is only causing problems:
>>>> Extra interrupts harm performance, and extra nested interrupts could even
>>>> have caused worse problems.
>>>>
>>>> Note that no explicit "enable" is necessary - that's implicitly done by
>>>> set_channel_irq_affinity() once the channel goes into use again.
>>>>
>>>> Along with disabling the counter, also "clear" the channel's "next event",
>>>> for it to be properly written by whatever the next user is going to want
>>>> (possibly avoiding too early an IRQ).
>>>>
>>>> Further, along the same lines, don't enable channels early when starting
>>>> up an IRQ. This similarly should happen no earlier than from
>>>> set_channel_irq_affinity() (here: once a channel goes into use the very
>>>> first time). This eliminates a single instance of
>>>>
>>>> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
>>>> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
>>>>
>>>> during boot. (Why exactly there's only one instance, when we use multiple
>>>> counters and hence multiple IRQs, I can't tell. My understanding would be
>>>> that this was due to __hpet_setup_msi_irq() being called only after
>>>> request_irq() [and hence the .startup handler], yet that should have
>>>> affected all channels.)
>>>>
>>>> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> A window still remains for IRQs to be caused by stale comparator values:
>>>> hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
>>>> Should we also write the comparator to "far into the future"?
>>>
>>> It might be helpful to reprogram the comparator as far ahead as
>>> possible in hpet_attach_channel() ahead of enabling it, or
>>> alternatively in hpet_detach_channel().
>>
>> The downside is yet another (slow) MMIO access. Hence why I didn't make
>> such a change right away. Plus I wasn't quite sure about the locking there:
>> Imo if we did so, it would be better if the lock wasn't dropped
>> intermediately.
>>
>>>> @@ -542,6 +540,8 @@ static void hpet_detach_channel(unsigned
>>>>          spin_unlock_irq(&ch->lock);
>>>>      else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
>>>>      {
>>>> +        hpet_disable_channel(ch);
>>>> +        ch->next_event = STIME_MAX;
>>>>          ch->cpu = -1;
>>>>          clear_bit(HPET_EVT_USED_BIT, &ch->flags);
>>>>          spin_unlock_irq(&ch->lock);
>>>
>>> I'm a bit confused with what the HPET code does here (don't know
>>> enough about it, and there are no comments).  Why is the timer rotated
>>> to a CPU in ch->cpumask once disabled, instead of just being plain
>>> disabled?
>>
>> Because it will still be needed by the other CPUs that the channel is
>> shared with.
> 
> Yeah, missed that part, the channel is migrated to a different CPU.  I
> wonder however: since an active channel can be migrated around between
> CPUs, isn't there a risk of the timer firing just in the middle of
> migration (when interrupt generation is disabled), and hence Xen
> possibly missing a deadline?
> 
> In hpet_broadcast_exit() we need to check whether the timer has
> expired after the migration, and manually trigger a broadcast if
> needed.  This also risks doing to broadcasts also back-to-back, but
> it's the only option I see to avoid missing a deadline.
> 
> Maybe there's something I'm missing, this is all fairly complex.

set_channel_irq_affinity() invokes handle_hpet_broadcast() to cover that
case.

Jan

