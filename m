Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDtlLQ9Ad2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:21:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E6786BB9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213499.1523967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJi8-0003Dl-FX; Mon, 26 Jan 2026 10:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213499.1523967; Mon, 26 Jan 2026 10:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJi8-0003Au-Cc; Mon, 26 Jan 2026 10:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1213499;
 Mon, 26 Jan 2026 10:20:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkJi6-0003Ak-PG
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:20:42 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e9a0a1-faa0-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 11:20:40 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b87f00ec06aso693736166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 02:20:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b416ca5sm620546266b.25.2026.01.26.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:20:38 -0800 (PST)
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
X-Inumbo-ID: a9e9a0a1-faa0-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422840; x=1770027640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4DBoWlEruMs2pDNEz2OByAFQSF3ZJwQPnGJRCR4IRY=;
        b=PZUN3tuKE+YjHFASwXMa78FK53F6jKbKH/ilrWlWFwbwv5uxw4zJRqBZIfnudt5ymN
         MFZpngWMNxlCXijkiXg0zr4YAFUwXs9c7JrWCQcSpj7ylhm/zRzPXuLLla3fvUlEqhzd
         EztYGAF5gnWh45mkp+v4TMz3vJaE1Wk9tMSB3D8Ae6it8SR9xMHAQMxq/mI3zFUQ4JMs
         1IQAIMF1qof9O0BN9cMyfY/VYjnvlcWvdENM37f9UwiDsGNnhKO0dFxjRtnXrFqHlO3f
         w0QfP2EVk+KjReYoJo5dPaY6jL43zBA52hq6fqs+ImgKAvsevDdhQxxtL6adSif+7WPi
         QfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422840; x=1770027640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4DBoWlEruMs2pDNEz2OByAFQSF3ZJwQPnGJRCR4IRY=;
        b=IWxfeBD+ib5owNtsKnWnyw1WNHkQ061bZ6Il7oSTnO/lxyiMOQcNxOVDw/1ww7Tpm2
         5WChLzUmz3153HtZy7tk2D69XyXvOGQ3vWiHt/qtaRqO4Tu+V3gA3ZKC8omcOGKBo4p/
         Ym1mhqeu35ftOPlLL1BVK0BLiCUr0dLVtWS2U/QVzn1rEXB8c8vc37a/z6ftoppzGo9b
         vBgo7uTZEJG3GAcvRvgKs62bz1J7rrJJvdVqitAsyMKR3G2xId+7ZuyUhJpqWucxrUlw
         BK4+B1szDJvTzb1TgEpv0H+DC4K4qZS2n58SrYrPuGC7Bzctudvcl0A5vzQrKq7tagiI
         JX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYL1o4UiQzNRXoyQf/aWIQXTZcvpl+7l3OxbsOVOoqmxPddbHTjtH3DfPia0AnSl6VVGhyWV7lX34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwioUcQJ7rysTPrxVzDTzMpJcSRUtexO4WAb0g+hOl/8cm+UmA/
	d6A9JRbj37mhDsE9ULcwbTz/byjA2aoXrhvXl/OK7fpc2py13dqtYa+f
X-Gm-Gg: AZuq6aIf37dTmAxzL0hYoLIChelG/B+KeHH5Vg5rygYNYw3cqOzEkKi/w8X4s9zsj4m
	h1fa4vFnzKpzIZEwh2Gy+ZPjYi0JlTQQu991hnvNPfU0Wu6HU+1822G1pcGEuuUpb+vMRJeg615
	0SgLtktTR46UMZjaZEYPVf39+Vayb4nX0tsHK+vwZjGZ0YBR20ztFsm7JoWDbQMGaoOkSrw9sQJ
	uRe9O+qic/JQu9LQ6dfGpF5unBh9cogInrcHvXwd0fL26YNNbBFDSxAfB4cZXrMLEXrfL4dW6De
	3SlOf3HtHgXskNX3lm55HX6Xjl9+/D9klT4yYmI8aOo8PfrYPAwFX53YNUDW01m55tiZ6gbucJf
	yRTwelpE2zKgSfTH/0rzkBFGScCIjzCvzWFfRT7uDCbsJrvh2WlGkJUBsVf5KgGkyrcrJuM8u1/
	sX5XKE++I82b6pp2kjKxqCw7/U+o9VI3a6ORroygdTfkAz7k6kayj8vcAdV+VpXRo=
X-Received: by 2002:a17:907:3e8d:b0:b87:fad:442f with SMTP id a640c23a62f3a-b8d2e85c9dcmr277672966b.42.1769422839236;
        Mon, 26 Jan 2026 02:20:39 -0800 (PST)
Message-ID: <287efafc-b76c-456b-b22c-b4c3ed70e12f@gmail.com>
Date: Mon, 26 Jan 2026 11:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] xen/riscv: implement reprogram_timer() via SBI
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <732635f43fb80daec332f78d4442b56bf5dfda98.1769099885.git.oleksii.kurochko@gmail.com>
 <1222e3c6-44c1-434b-974e-04851874c1ca@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1222e3c6-44c1-434b-974e-04851874c1ca@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 19E6786BB9
X-Rspamd-Action: no action


On 1/25/26 12:13 AM, Teddy Astie wrote:
> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>> Implement reprogram_timer() on RISC-V using the standard SBI timer call.
>>
>> The privileged architecture only defines machine-mode timer interrupts
>> (using mtime/mtimecmp). Therefore, timer services for S/HS/VS mode must
>> be provided by M-mode via SBI calls. SSTC (Supervisor-mode Timer Control)
>> is optional and is not supported on the boards available to me, so the
>> only viable approach today is to program the timer through SBI.
>>
>> reprogram_timer() enables/disables the supervisor timer interrupt and
>> programs the next timer deadline using sbi_set_timer(). If the SBI call
>> fails, the code panics, because sbi_set_timer() is expected to return
>> either 0 or -ENOSUPP (this has been stable from early OpenSBI versions to
>> the latest ones). The SBI spec does not define a standard negative error
>> code for this call, and without SSTC there is no alternative method to
>> program the timer, so the SBI timer call must be available.
>>
>> reprogram_timer() currently returns int for compatibility with the
>> existing prototype. While it might be cleaner to return bool, keeping the
>> existing signature avoids premature changes in case sbi_set_timer() ever
>> needs to return other values (based on which we could try to avoid
>> panic-ing) in the future.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>    - Add TODO comment above sbi_set_timer() call.
>>    - Update the commit message.
>> ---
>>    xen/arch/riscv/stubs.c |  5 -----
>>    xen/arch/riscv/time.c  | 43 ++++++++++++++++++++++++++++++++++++++++++
>>    2 files changed, 43 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
>> index 1f0add97b361..cb7546558b8e 100644
>> --- a/xen/arch/riscv/stubs.c
>> +++ b/xen/arch/riscv/stubs.c
>> @@ -21,11 +21,6 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>>    
>>    /* time.c */
>>    
>> -int reprogram_timer(s_time_t timeout)
>> -{
>> -    BUG_ON("unimplemented");
>> -}
>> -
>>    void send_timer_event(struct vcpu *v)
>>    {
>>        BUG_ON("unimplemented");
>> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
>> index 2c7af0a5d63b..f021ceab8ec4 100644
>> --- a/xen/arch/riscv/time.c
>> +++ b/xen/arch/riscv/time.c
>> @@ -7,6 +7,9 @@
>>    #include <xen/time.h>
>>    #include <xen/types.h>
>>    
>> +#include <asm/csr.h>
>> +#include <asm/sbi.h>
>> +
>>    unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>>    uint64_t __ro_after_init boot_clock_cycles;
>>    
>> @@ -40,6 +43,46 @@ static void __init preinit_dt_xen_time(void)
>>        cpu_khz = rate / 1000;
>>    }
>>    
>> +int reprogram_timer(s_time_t timeout)
>> +{
>> +    uint64_t deadline, now;
>> +    int rc;
>> +
>> +    if ( timeout == 0 )
>> +    {
>> +        /* Disable timers */
>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>> +
>> +        return 1;
>> +    }
> Do disabling the timers interrupt actually stops the timer or just
> prevents Xen from receiving the timer interrupt ?

According to OpenSBI spec:
  If the supervisor wishes to clear the timer interrupt without scheduling
  the next timer event, it can either request a timer interrupt infinitely
  far into the future (i.e., (uint64_t)-1), or it can instead mask the timer
  interrupt by clearing sie.STIE CSR bit.
It seems like it never stops it even if to use OpenSBI call with -1 arguemnt.

>
> If it doesn't "stop the timer", we probably would want to swap "enabling
> the timer interrupt" and "setting the timer through SBI" (to avoid
> potentially receiving a timer interrupt between these 2 operations).
>
> Though, it's unclear in SBI specification if the sbi_set_timer touches
> the timer interrupt masking or not (at least it does if you set a timer
> too far in the future).

Considering how it is implemented:
void sbi_timer_event_start(u64 next_event)
{
...
     } else if (timer_dev && timer_dev->timer_event_start) {
         timer_dev->timer_event_start(next_event);
         csr_clear(CSR_MIP, MIP_STIP);
     }
     csr_set(CSR_MIE, MIP_MTIP);
}

It will clear timer pending bit even it was set before. So move this:
+    /* Enable timer */
+    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
after sbi_set_timer() should work.

As an option we could just use sbi_set_timer(UINT64_MAX) instead of
" csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));" to "stop" a timer.
But first one option looks better for me.

~ Oleksii

>
>> +
>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>> +    now = get_cycles();
>> +    if ( deadline <= now )
>> +        return 0;
>> +
>> +    /* Enable timer */
>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>> +
>> +    /*
>> +     * TODO: When the SSTC extension is supported, it would be preferable to
>> +     *       use the supervisor timer registers directly here for better
>> +     *       performance, since an SBI call and context switch would no longer
>> +     *       be required.
>> +     *
>> +     *       This would also reduce reliance on a specific SBI implementation.
>> +     *       For example, it is not ideal to panic() if sbi_set_timer() returns
>> +     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
>> +     *       without SSTC we still need an implementation because only the
>> +     *       M-mode timer is available, and it can only be programmed in
>> +     *       M-mode.
>> +     */
>> +    if ( (rc = sbi_set_timer(deadline)) )
>> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
>> +> +    return 1;
>> +}
>> +
>>    void __init preinit_xen_time(void)
>>    {
>>        if ( acpi_disabled )
>
>
> --
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>
>

