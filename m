Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F2D1EBD1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 13:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203007.1518352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfzxv-0007aj-6S; Wed, 14 Jan 2026 12:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203007.1518352; Wed, 14 Jan 2026 12:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfzxv-0007Xj-3i; Wed, 14 Jan 2026 12:27:11 +0000
Received: by outflank-mailman (input) for mailman id 1203007;
 Wed, 14 Jan 2026 12:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfzxu-0007Xd-8i
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 12:27:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57a54bf2-f144-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 13:27:08 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so1480710a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 04:27:08 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f071e4sm574887566b.66.2026.01.14.04.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 04:27:06 -0800 (PST)
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
X-Inumbo-ID: 57a54bf2-f144-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768393627; x=1768998427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmE0bkPqwySALuVSQ+L8vFyWzA69TauhQLdW5hVuKEw=;
        b=nnFBNgs5GaH1kM7AAwBXMxauFVz3FkbElnY15IRwQcMUFs1vHyO7PGbtGxGkZ0vJM+
         SWpcw2Pz9V3e/HQbboAkmvRMOciYGqr1mIqiFU6lBln2k/GYpv4XGdeAh4ovAAotfkmx
         wVCW+difNeM5n2LaFC+1FaiWyBgnfDhQnPKBz3Z8ngPT4t/u37VdC6+YstMR4/WnUdxk
         JpOTG0lQ3tOsFOhn74fOd4UkQ/PrJSv9UB/N83CieWqHiMDptkGKrdKSOdeNYeAAS376
         1EdKmcfwiXImIAraJ/ksQkPDKRO+yGEQtCQ6OupvDubz64WEjpb5MXhfeoqtoNOq3Rfe
         Fj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768393627; x=1768998427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmE0bkPqwySALuVSQ+L8vFyWzA69TauhQLdW5hVuKEw=;
        b=dPiGnVJzw9gF95PbIm/mQho2UKUzqWc1xeh5UGWBB9l0gfRvG8lVlP4uTcgfzC6Xou
         yYgwxsygMLrFrc3wXgX+FailuEzz2rOoSFfD92hjdWG0osEKEz9XbqVsDciEsnYk17ks
         qFNA2uijNHJ1ZYh/CfBqkhBKUXYtKb7n4q0cpO+xxVwIH975xQ4KlSAU/k4S81cUiskL
         pDp/z+7NFAaBQ/kQgzjUuvrP+aA2/grZheIWoK3Qgs61taQ6pJ6gat9tbju+V4LfPQXv
         LBVDEmbRALSah641+SQG5m2vi3SYYDcEgwDY3ThHz1+apLfVbbWvxcP7E31p7BQgPZ+6
         FUSA==
X-Forwarded-Encrypted: i=1; AJvYcCUorxXrtddM8wDIkbLe87WleIxBwTLhHcKT3WmVZKhlBA7Su8sKSzDtJOH5DeI6WrSNYEwukb+fYaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6wiTLKD/kR7tpkpL3atFoZyDEZG0deQ8XfLNNQiLC7jexi/LC
	B8lZ1K+4qKXNmC4TOtj6aGNAHxRJmi2TunQUOPr1+foMaFwlgDICIjqb
X-Gm-Gg: AY/fxX7awoNBu+QEzuEaNZLc6WyyHQUlaigfh8ApDQSuypZvG8G6GCOM8PQ2hRf8kFT
	QcsCSCBuM4BMN4kysbwPoKJNIhhUx3066ARY4CEfVa/NZKK7oCm/OdcGHt6bFZSu/SA0rrWufDp
	35xpUhbemIuTCFoiQ8VvpgW4kYO7CoCCsw946b/oBXdSGa/aHUTQP7/aeJJhM2FirzdLOEFgzX/
	7UDw/fsWPhmsE5QFrWZ+fukJaDRbzARFnnJzCHiG38gQyCtbc5rZmUFReRjMpckto4w8/0AM7/Q
	H/ld6VrKRR6vXwQEAeON0vpLzLwExUKjND5lgPECvBZcYrWNSJcDWbLhui8TVOfCxcbL5CDCCxA
	8X+fhmTh5MiYOokUJ7Xsho/CShSVw/SvRqsWVPM+Pa9D3VY4NlnkYpQBL8cn06jx+WHO6CMGGgN
	sl1KwsXJLtqJGjwMy8Cfm1I6ah6wgW3wPCfFW7Cy00mzHYMQvx8Qq7Z9wDn7FgrlI=
X-Received: by 2002:a17:906:f597:b0:b87:703c:139d with SMTP id a640c23a62f3a-b87703c1e8fmr72565866b.3.1768393627045;
        Wed, 14 Jan 2026 04:27:07 -0800 (PST)
Message-ID: <b0131e35-3c1b-4e42-9f80-07d246a5df69@gmail.com>
Date: Wed, 14 Jan 2026 13:27:05 +0100
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
 <4e18e4fc-de62-44fc-8ea0-517f6c7ef47f@gmail.com>
 <f7a47af4-6523-4d92-9beb-0daf639f2f36@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f7a47af4-6523-4d92-9beb-0daf639f2f36@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/13/26 4:12 PM, Jan Beulich wrote:
> On 13.01.2026 15:44, Oleksii Kurochko wrote:
>> On 1/8/26 11:28 AM, Jan Beulich wrote:
>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>> +    vcpu_unset_interrupt(t->v, IRQ_VS_TIMER);
>>>> +
>>>> +    /*
>>>> +     * According to the RISC-V sbi spec:
>>>> +     *   If the supervisor wishes to clear the timer interrupt without
>>>> +     *   scheduling the next timer event, it can either request a timer
>>>> +     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
>>>> +     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
>>>> +     *   bit.
>>>> +     */
>>> And SBI is the only way to set the expiry value? No CSR access? (Question
>>> also concerns the unconditional vcpu_unset_interrupt() above.)
>> If we don't have SSTC extension support then I suppose yes, as CSR_MI{E,P} could
>> be accessed only from M-mode:
> How do M-mode CSRs come into play here? My question was rather towards ...

Without SSTC (Supervisor Timer Extension) the current Privileged arch specification
only defines a hardware mechanism for generating machine-mode timer interrupts (based
on the mtime and mtimecmp registers). With the resultant requirement that timer
services for S-mode/HS-mode (and for VS-mode) have to all be provided by M-mode - via
SBI calls from S/HS-mode up to M-mode (or VS-mode calls to HS-mode and then to M-mode).

>
>>    (code from OpenSBI)
>> void sbi_timer_event_start(u64 next_event)
>> {
>> 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
>>
>> 	/**
>> 	 * Update the stimecmp directly if available. This allows
>> 	 * the older software to leverage sstc extension on newer hardware.
>> 	 */
>> 	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC)) {
>> #if __riscv_xlen == 32
>> 		csr_write(CSR_STIMECMP, next_event & 0xFFFFFFFF);
>> 		csr_write(CSR_STIMECMPH, next_event >> 32);
>> #else
>> 		csr_write(CSR_STIMECMP, next_event);
>> #endif
> ... what if a guest did these CSR writes directly. Besides intercepting
> access to them,

These registers are available only when the SSTC extension is present.
When SSTC is available and a guest accesses CSR_STIMECMP{H}, it actually
accesses the corresponding VS aliases, VSTIMECMP{H}. The hardware continuously
compares the value in VSTIMECMP against the guest’s view of time
(time + htimedelta). When the condition is met, the hardware asserts the
virtual supervisor timer interrupt pending bit (VSTIP) in the hypervisor’s
HIP register and guest automatically receives timer interrupt.

Therefore, there is no real need to intercept accesses to these registers.

It is possible that VS-mode software may continue to use the SBI timer call
instead of directly accessing the SSTC CSRs. In that case, VSTIMECMP would
need to be updated manually by the hypervisor when such an SBI call occurs.
However, this is not the case at the moment, as the SSTC extension is not
currently supported.

Technically, the hypervisor could also clear henvcfg.STCE when SSTC is
vailable. In that case, the hypervisor would receive an illegal
instruction trap in HS-mode when the guest attempts to access SSTC-related
registers.
However, I do not see a reason to prevent delegation of SSTC register access
to the guest, since SSTC provides VS-* aliases for these registers, so I don't
consider that as a real case.


> you'd also need to synchronize both paths, I suppose.

I didn't get you what is needed to be synchronized. Could you please explain?


>
>>>> +    {
>>>> +        stop_timer(&t->timer);
>>>> +
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    set_timer(&t->timer, expires);
>>> See the handling of VCPUOP_set_singleshot_timer for what you may want to
>>> do if the expiry asked for is (perhaps just very slightly) into the past.
>> I got an idea why we want to check if "expires" already expired, but ...
>>
>>> There you'll also find a use of migrate_timer(), which you will want to
>>> at least consider using here as well.
>> ... I don't get why we want to migrate timer before set_timer() here.
>> Could you please explain that?
> Didn't I see you use migrate_timer() in other patches (making me assume
> you understand)? Having the timer tied to the pCPU where the vCPU runs
> means the signalling to that vCPU will (commonly) be cheaper.

I thought that migrate_timer() is needed only when a vCPU changes the pCPU
it is running on to ensure that it is running on correct pCPU after migrations,
hotplug events, or scheduling changes. That is why I placed it in
vtimer_restore(), as there is no guarantee that the vCPU will run on the
same pCPU it was running on previously.

So that is why ...

> Whether
> that actually matters depends on what vtimer_expired() will eventually
> contain. Hence why I said "consider using".

... I didn't get why I might need vtimer_expired() in vtimer_set_timer()
before set_timer().

vtimer_expired() will only notify the vCPU that a timer interrupt has
occurred by setting bit in irqs_pending bitmap which then will be synced
with vcpu->hvip, but I still do not understand whether migrate_timer()
is needed before calling set_timer() here.

Considering that vtimer_set_timer() is called from the vCPU while it is
running on the current pCPU, and assuming no pCPU rescheduling has
occurred for this vCPU, we are already on the correct pCPU.
If pCPU rescheduling for the vCPU did occur, then migrate_timer() would
have been called in context_switch(), and at the point where
vtimer_set_timer() is invoked, we would already be running on the
correct pCPU.

~ Oleksii


