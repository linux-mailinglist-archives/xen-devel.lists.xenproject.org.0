Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDDED19917
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201844.1517410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffdR-0006xD-OY; Tue, 13 Jan 2026 14:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201844.1517410; Tue, 13 Jan 2026 14:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffdR-0006uY-LZ; Tue, 13 Jan 2026 14:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1201844;
 Tue, 13 Jan 2026 14:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vffdQ-0006uP-KM
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:44:40 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f29138e-f08e-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 15:44:32 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so1292990666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 06:44:32 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b871b5e60dasm607106666b.63.2026.01.13.06.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 06:44:31 -0800 (PST)
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
X-Inumbo-ID: 5f29138e-f08e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768315472; x=1768920272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1naa2jGZWbm/wr+OPD7p+au0bc4zmtsr95R3a2jp+s=;
        b=gFfOvT9uUaU8hqoQ0gwFCL0/iKfIRH6rPg9Fm9Rc7T60401kUOXO5faLEjfVy9lyZJ
         YMeRYKmzzLS/YkcOQvriCIUdGhA4d9h+zbJgK5icyqFkqjUFsClBamHCeGytbjAe2bbM
         vwz+4voTMd5h8JaAD8TS0+bxsxe1hW+ZRJfF9hhqWVhdo/s+LZhIx+QkbZdvEWEV0mGP
         F5HNWit8RtU0v8E8dR5ElGLhtZGCdjWoLVFWttsmsx8p/TIbHz/usaSSrk3OPg2zN2ZY
         sDnzf0DrNZb3GSrBR+wtAasGe5ebtY4RSGiFL+aBTGxuA5k1unhe71EZC9r1/8do8ilx
         tYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315472; x=1768920272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1naa2jGZWbm/wr+OPD7p+au0bc4zmtsr95R3a2jp+s=;
        b=vcNesyPg+Rp2iJoDSW5y+h1WvOrVlgzC4gSm0skhGQ/vUha6xLtgjRgAyX7DOZ98eV
         I4nWOA2E93fee/GYQGaaJtaW8TsNwmn5XTOeD69rcCdLI2Ax1reAQ2QgmngyFAR5RIam
         xbgKKXJMezB3Cgq+tHTwyL8mjn90MeqZ4KmgjnBCKEapU6lwLksVorqCcKurNqEUGW87
         JnpOJij0R8Toef8TtzYykftYz6SPQVLXQ+zeuxGmrp68RrxQJI98Ma6rmqy2O4wiQGal
         HBPgOwdNWCnoUD6WhVArdwpEPBoYzg/AkOgVHQ7zODJ4nvQjycTHY9mSOZkZA8JFy3ie
         +7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW1k7mJ6h2DD8JLQzrPy+Z6xtZxI2kVwCJKq2sF3ysUZ2Y2H0MNWpliWHvLHG/XwJjUYucipSjD1Z4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm7CCm/HxngReoIGewirVRjkTJAHCvLTZA1w6jwfDLXsJdmfYI
	v+3msd9W7Cbbn8j1g/SsxZ+yYOqMKaVTrETldK1ilJHqudX7WFL/t+FY
X-Gm-Gg: AY/fxX440o3sqU3LQkhsVLp/EyMV6Gk5426UrfNqqKXkhfOKMhM+eVDB2ORmEdFOzAX
	JkPiqzBqzR7tz2ZKY4WDIqyD9ojIKR232/sS7dExF2bptPT6TWcWaNg2IKr2dzWQIE1UUog26S6
	CQbhvvNhrmzXWg7y0D5SUVz6ZDA2gUHcIEOAeeTYG0A0VZBcIjS1Jdk1cMwNsZ8sFRvP5TRG/0o
	vP3UQ13tXCSVRXcdldM6XLKPRg8Q40E6tj/whT5AJ2Du0E9OxggIwfY7hiTofxwlS9Sk72O1z96
	q3FAEXf0BF4DmQE+hlLhm1eLfA+whvMbbUmIVZ1O7EZlkYE0iD0OWq/fvGJ8QzUOM2uYRS+jdkS
	y3sHrNqHfNglSRJ8Om1DMjoiaOyzFubOB2vN2NiFXq0CY8gOA/uBO2SL3fmHlqUeUqfOdBSJ7zI
	9CrPyYG9+IM3i9DL5wY6cY+h1qO1oyIjQrjWnjLt0QJoJcVgdkwK55XYVKJWgpkpDPnoDoWwz1e
	w==
X-Google-Smtp-Source: AGHT+IGP5Nk2fJxTLG8rXR9+J/DTISt2Xo5iTf5uCmw8XZD/WfO9uh+pDyITMpZ15UEAP+146QdmIA==
X-Received: by 2002:a17:907:6d1a:b0:b73:99f7:8134 with SMTP id a640c23a62f3a-b8444fabdc4mr1923017066b.45.1768315471318;
        Tue, 13 Jan 2026 06:44:31 -0800 (PST)
Message-ID: <4e18e4fc-de62-44fc-8ea0-517f6c7ef47f@gmail.com>
Date: Tue, 13 Jan 2026 15:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/15] xen/riscv: introduce vtimer_set_timer() and
 vtimer_expired()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <8cd3efa488b3da2a6751c92d20bbfeb87b3ba39a.1766595589.git.oleksii.kurochko@gmail.com>
 <f8808dd1-d571-49ea-8739-ed06dd6c79d1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f8808dd1-d571-49ea-8739-ed06dd6c79d1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 11:28 AM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/vtimer.h
>> +++ b/xen/arch/riscv/include/asm/vtimer.h
>> @@ -22,4 +22,6 @@ void vcpu_timer_destroy(struct vcpu *v);
>>   
>>   int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config);
>>   
>> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks);
>> +
>>   #endif /* ASM__RISCV__VTIMER_H */
>> diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
>> index 5ba533690bc2..99a0c5986f1d 100644
>> --- a/xen/arch/riscv/vtimer.c
>> +++ b/xen/arch/riscv/vtimer.c
>> @@ -1,6 +1,8 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/domain.h>
> Is this really needed, when ...
>
>>   #include <xen/sched.h>
> ... this is already there?

With the way how includes look in xen/sched.h - no.

>
>> +#include <xen/time.h>
> Don't you mean xen/timer.h here?

You are right, it should be xen/timer.h as set_timer(), stop_timer() and migrate_timer()
are from xen/timer.h.

>
>> @@ -15,7 +17,9 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
>>   
>>   static void vtimer_expired(void *data)
>>   {
>> -    panic("%s: TBD\n", __func__);
>> +    struct vtimer *t = data;
> Pointer-to-const please.
>
>> @@ -37,3 +41,27 @@ void vcpu_timer_destroy(struct vcpu *v)
>>   
>>       kill_timer(&v->arch.vtimer.timer);
>>   }
>> +
>> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
>> +{
>> +    s_time_t expires = ticks_to_ns(ticks - boot_clock_cycles);
> boot_clock_cycles is known to just Xen. If the guest provided input is an
> absolute value, how would that work across migration? Doesn't there need
> to be a guest-specific bias instead?

I think that I don't understand fully your questions, but it sounds like it is a job
for htimedelta register.

>
>> +    vcpu_unset_interrupt(t->v, IRQ_VS_TIMER);
>> +
>> +    /*
>> +     * According to the RISC-V sbi spec:
>> +     *   If the supervisor wishes to clear the timer interrupt without
>> +     *   scheduling the next timer event, it can either request a timer
>> +     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
>> +     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
>> +     *   bit.
>> +     */
> And SBI is the only way to set the expiry value? No CSR access? (Question
> also concerns the unconditional vcpu_unset_interrupt() above.)

If we don't have SSTC extension support then I suppose yes, as CSR_MI{E,P} could
be accessed only from M-mode:
  (code from OpenSBI)
void sbi_timer_event_start(u64 next_event)
{
	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);

	/**
	 * Update the stimecmp directly if available. This allows
	 * the older software to leverage sstc extension on newer hardware.
	 */
	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC)) {
#if __riscv_xlen == 32
		csr_write(CSR_STIMECMP, next_event & 0xFFFFFFFF);
		csr_write(CSR_STIMECMPH, next_event >> 32);
#else
		csr_write(CSR_STIMECMP, next_event);
#endif
	} else if (timer_dev && timer_dev->timer_event_start) {
		timer_dev->timer_event_start(next_event);
		csr_clear(CSR_MIP, MIP_STIP);
	}
	csr_set(CSR_MIE, MIP_MTIP);
}

>
>> +    if ( ticks == ((uint64_t)~0ULL) )
> Nit: With the cast you won't need the ULL suffix.
>
>> +    {
>> +        stop_timer(&t->timer);
>> +
>> +        return;
>> +    }
>> +
>> +    set_timer(&t->timer, expires);
> See the handling of VCPUOP_set_singleshot_timer for what you may want to
> do if the expiry asked for is (perhaps just very slightly) into the past.

I got an idea why we want to check if "expires" already expired, but ...

> There you'll also find a use of migrate_timer(), which you will want to
> at least consider using here as well.

... I don't get why we want to migrate timer before set_timer() here.
Could you please explain that?

Thanks.

~ Oleksii


