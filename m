Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vtQKBs+7Kmq8vwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:44:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B776726BD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:44:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=goiUYblx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335538.1597721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfhV-0001b3-2M; Thu, 11 Jun 2026 13:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335538.1597721; Thu, 11 Jun 2026 13:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfhU-0001Yy-Vi; Thu, 11 Jun 2026 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1335538;
 Thu, 11 Jun 2026 13:44:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXfhT-0001Ys-1r
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 13:44:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXfhS-00CyOC-EU
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:44:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2abb97-5cb7-0a2a0a5109dd-0a2a45019632-34
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:44:02 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2abba2-c1f2-0a2a45010019-d155dd2dcd2b-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:44:02 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso6564091f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 06:44:02 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d046d5sm65839725e9.13.2026.06.11.06.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 06:44:00 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781185441; x=1781790241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2oLsIpt2hMOfn3gNlCBuGP3OxTBlSmMK2Hz+z75rlGc=;
        b=goiUYblxWzytFW2RfVF965nHWrpI2ZCePZxQYV0vDsKnbL2A7ZzoJlIeTWQLN6ooIE
         ys+eTrA/bq/+0rh/SJEiqfLRQzskEsnjhuNTcxi+JZLxY529CgR0dMFaejHLESFiD6tJ
         3zLqWvE4iLkphrj6464vYRYYqX1u2ITA2+vzYqJW12dsWSn97Fli/fPXTG06sOIEyn20
         Y0ObHs73wekWyEldxe2rz/PCCOrPmFy/2WIx5ajjPd1yI+QDOWPNGBDM432fhifgiNKE
         OSuRZnersNKCp5kNiTnRTSM9Fz82rmJt1MrnzJpBbRY10tZ/LrQtQTfe7J1iK8do2MiY
         +jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781185441; x=1781790241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oLsIpt2hMOfn3gNlCBuGP3OxTBlSmMK2Hz+z75rlGc=;
        b=DAP8S4af+sFBoGNgLYhpC5JYonmJd5LfIqKHyM+JdzIOVj6GmEoYsPXtJQ6/ZUqFki
         3KzXQH6XnOYZPz/jdLvUiSK/IoredUQ79ySzMezIw+MTDR65uoObGALXBfd/WZ9MoEmO
         KfC1nPyieD3U1o4aRWvjSfYOJfaFaxjwtzn25k6BfhX3iIXgRdx8Blcawc/aGH6ArfWE
         a3AXNI/O5oh8wY72AzmWlLnoPLdgY5vh3Srmr5NZM0Xo69hQIZLbfLIyAVQ89XH7/7WO
         jJDzHZVfTPbUdTFcXERd0SXCdffF9EYU6bSWoxUcGdwzIhwDZnsuVEsHh7Fmw/xGFaDv
         uzPA==
X-Forwarded-Encrypted: i=1; AFNElJ/2VN8dKoI2o9y+E8b0Bu7DA2YFIXZ2aDWuO1PYoFF4XR5hpsgB1u1vrBkWByPdKIrQoGvg6FFYjNo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxGpaif6xHBeLs+6HxTNkyS9eVYu9HVMNIvfwwBLHJAuii/c52
	/b6fR2ygGbbAwWhh+MlF4y6vTdG0LICo0kfLH4vmk86vL/NZA8tKx/ndpL9hPnTN/Q==
X-Gm-Gg: Acq92OFdAcktGP82cD90rankVPhQNOsjggWWokCLGhVRFv3YVfvnfMo6ogxu7wGY8mC
	qEJ739xjrvFI/iMPBshd3+F09ij8zPyVyp5jjUutUwnubslOlvut/59sYRSfQtu5LGB8qEbAGfe
	Ql8Id/95GWv4BF/G3KORwTGAnEW5cSii+YS0bQGvRBWTHAxGSgChnWn9QS06OCpa/kmgnohFEuP
	f0oDIfKoWnourXt1wOKvK3bdbww34SvJkOIkAs/2HTkcpjBmmUlL+S5OVmyNaKC39VLr/r9iySz
	g6oJs6pzNXzbMXf+IHVYzEn7VdkpSNPhnGx42IIJ35hgSKkrD++zTLvXfjuggEroizJd8UnK6Bl
	wkUusNaCPR13dWLAVluysKfXf18mfb3NCXBJjDY/RoWN4jLmncSmI/Mgz8Q2l6TW6dSAkYhRgoI
	Cj0kx6AHGMi0Y63nRZgY0v2QsuVIkVRqikxSVrBe1yv9AlJSOLJupjCAkBfFoGN+9Tt1368zPeX
	2MH3URuUAUEwPO0guYVXV4sbrhwyCWlaF/DRFvWAUSZsp+32H5dQcqibGEaF4I3uz9KbyU=
X-Received: by 2002:a05:600c:c8c:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-490e560e39fmr43698925e9.14.1781185441387;
        Thu, 11 Jun 2026 06:44:01 -0700 (PDT)
Message-ID: <46ec5166-e147-499a-acbe-d3115551db42@suse.com>
Date: Thu, 11 Jun 2026 15:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/rtds: refill cur_budget when extratime is toggled
 on a depleted vCPU
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <gwd@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
 <cafef621-024f-4c3f-862a-4c61a1ab4293@epam.com>
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
In-Reply-To: <cafef621-024f-4c3f-862a-4c61a1ab4293@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781185442-AEB5EFF4-9E7BB699/0/0
X-purgate-type: clean
X-purgate-size: 7406
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii_moisieiev@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65B776726BD

On 10.06.2026 08:50, Oleksii Moisieiev wrote:
> Gentle Ping.
> 
> I've already got R-b from Juergen. Maybe someone else will have time to review?

Dario,

didn't you mean to submit a patch to ./MAINTAINERS, after which Jürgen's
R-b would suffice for committing?

Jan

> On 20/05/2026 16:57, Oleksii Moisieiev wrote:
>> XEN_DOMCTL_SCHEDOP_putvcpuinfo can flip the RTDS_extratime bit on a vCPU
>> that is currently depleted (cur_budget == 0, possibly sitting on the
>> depleted queue). rt_dom_cntl() touches only svc->flags; cur_budget is
>> left unchanged. As a result the next code path that calls runq_insert()
>> on this vCPU - rt_unit_wake() after a domain_unpause(),
>> rt_context_saved() following a delayed runq add, or repl_timer_handler()
>> after a replenishment - places the vCPU on the run queue, because
>> has_extratime(svc) is now true and runq_insert() admits extratime units
>> regardless of cur_budget:
>>
>>      /* add svc to runq if svc still has budget or its extratime is set */
>>      if ( svc->cur_budget > 0 ||
>>           has_extratime(svc) )
>>          deadline_runq_insert(svc, &svc->q_elem, runq);
>>      else
>>          list_add(&svc->q_elem, &prv->depletedq);
>>
>> The very next rt_schedule() iterates the run queue from runq_pick()
>> and trips the ASSERT(iter_svc->cur_budget > 0) at the bottom of the
>> loop, panicking the host. Observed trace:
>>
>>      Assertion 'iter_svc->cur_budget > 0' failed at common/sched/rt.c:1035
>>      ----[ Xen-4.22-unstable  arm64  debug=y ubsan=y  Not tainted ]----
>>      [<...>] rt.c#rt_schedule+0x1558/0x33e0 (PC)
>>      [<...>] core.c#do_schedule+0x2e4/0x15b4
>>      [<...>] core.c#schedule+0xb14/0xe50
>>      [<...>] softirq.c#__do_softirq+0x20c/0x3d4
>>      [<...>] do_softirq+0x14/0x1c
>>      [<...>] domain.c#idle_loop+0x194/0x558
>>
>> Minimal reproducer: pin a single-vCPU domU to a pCPU, program RTDS with
>> extratime off and a low utilisation (e.g. budget = 10ms / period = 100ms)
>> so the vCPU spends most of its time in the depleted queue, pause the
>> domain, issue a putvcpuinfo that sets XEN_DOMCTL_SCHEDRT_extra, then
>> unpause. As soon as the schedule softirq fires on the pCPU, the BUG
>> hits. The same sequence is reachable without an explicit pause: any
>> window in which rt_dom_cntl() runs between burn_budget()'s budget
>> exhaustion and rt_context_saved()'s runq_insert() also closes onto the
>> same broken state, because the per-scheduler lock is dropped between
>> those two points.
>>
>> The semantics for "extratime gets exhausted budget refilled" already
>> live in burn_budget():
>>
>>      if ( has_extratime(svc) )
>>      {
>>          svc->priority_level++;
>>          svc->cur_budget = svc->budget;
>>      }
>>
>> Apply the same priority-demotion-and-refill in rt_dom_cntl() when the
>> flag transitions from off to on while the vCPU is depleted, clear
>> RTDS_depleted to match, and - if the vCPU is currently on the depleted
>> queue - move it to the run queue using the same q_remove() +
>> runq_insert() pattern already used by repl_timer_handler(). The vCPU
>> remains on the replenishment queue throughout, so its normal
>> replenishment cadence is preserved.
>>
>> The complementary transition (on -> off) is already safe: clearing the
>> flag only narrows the runq_insert() admission condition, so subsequent
>> depleted insertions correctly route to the depleted queue.
>>
>> No other call sites need changes: with cur_budget restored before the
>> flag is observable to runq_insert(), runq_pick()'s long-standing
>> invariant (every run-queue entry has cur_budget > 0) is preserved.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> ---
>>
>>   xen/common/sched/rt.c | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
>> index b156f61afa..18e39977be 100644
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -1465,7 +1465,41 @@ rt_dom_cntl(
>>                   svc->period = period;
>>                   svc->budget = budget;
>>                   if ( local_sched.u.rtds.flags & XEN_DOMCTL_SCHEDRT_extra )
>> +                {
>> +                    /*
>> +                     * Turning extratime on while the vCPU is depleted
>> +                     * (cur_budget <= 0) leaves cur_budget unchanged. The
>> +                     * next runq_insert() on this vCPU - from
>> +                     * rt_unit_wake() after a domain unpause,
>> +                     * rt_context_saved() following a delayed runq add, or
>> +                     * repl_timer_handler() - then places it on the run
>> +                     * queue because has_extratime() is now true, even
>> +                     * though cur_budget is 0. The very next rt_schedule()
>> +                     * iterates the run queue from runq_pick() and trips
>> +                     * the ASSERT(iter_svc->cur_budget > 0).
>> +                     *
>> +                     * Apply the same priority-demotion-and-refill that
>> +                     * burn_budget() would have performed if the flag had
>> +                     * been set when the budget ran out, clear the
>> +                     * depleted state, and - if the vCPU is currently on
>> +                     * the depleted queue - move it to the run queue so
>> +                     * the new extratime allocation is picked up
>> +                     * immediately instead of waiting for the next
>> +                     * replenishment.
>> +                     */
>> +                    if ( !has_extratime(svc) && svc->cur_budget <= 0 )
>> +                    {
>> +                        svc->priority_level++;
>> +                        svc->cur_budget = svc->budget;
>> +                        __clear_bit(__RTDS_depleted, &svc->flags);
>> +                        if ( unit_on_q(svc) )
>> +                        {
>> +                            q_remove(svc);
>> +                            runq_insert(ops, svc);
>> +                        }
>> +                    }
>>                       __set_bit(__RTDS_extratime, &svc->flags);
>> +                }
>>                   else
>>                       __clear_bit(__RTDS_extratime, &svc->flags);
>>                   spin_unlock_irqrestore(&prv->lock, flags);
> 


