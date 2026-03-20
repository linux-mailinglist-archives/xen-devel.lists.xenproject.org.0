Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJlPFCX2vGkt5AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 08:24:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A722D68F3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 08:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257820.1552091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3UCz-000810-G4; Fri, 20 Mar 2026 07:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257820.1552091; Fri, 20 Mar 2026 07:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3UCz-0007y9-Cm; Fri, 20 Mar 2026 07:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1257820;
 Fri, 20 Mar 2026 07:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3UCy-0007y3-Ia
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 07:23:48 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bac473a8-242d-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 08:23:45 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so12212025e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 00:23:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644bd0dcsm3477172f8f.11.2026.03.20.00.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 00:23:44 -0700 (PDT)
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
X-Inumbo-ID: bac473a8-242d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773991424; x=1774596224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WWVatIPeJwA8EeG9PIEXf1kkSpNMQx1kioB5xWFi8ns=;
        b=eUY2HGg1FTCwsEuaHqf3e9LiwJ+HpeaWM/01G5yPlvy8tFT3JrMno9F4iYOMoJezFr
         41FWOgyJYpzV73fidEYjqCFbNNlICtRY9P1KnECZ2KMuxLcM3sF4hugmWHbYOX73W8R3
         bqIdVbPyH5jbvYTNHhJn+n/VBT9XH2c7sTpOMa1JD3SAPZwOrRSLt+rzq9YHvllIMm/X
         oOVag9HwU1jEaIRp4oskj4I0/bqo9OxvrhMF+cSG+MMH36BOYDxFNcW2y8tNvOzP0rvL
         pWrNbrOEgfdhMXD2rZxNN4ZSUwwliJ+sqt7+r76RMCCvpYB50/AQ8OwEM/ydiBbzOLcE
         HzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991424; x=1774596224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWVatIPeJwA8EeG9PIEXf1kkSpNMQx1kioB5xWFi8ns=;
        b=R7250y06yvoZaHmuZC3w9G4cdjuR71qEXBS9sTdr/wwSRPl7N0h3KUHsS+7aU/4PPJ
         kO2e19KZV1iPptDtX1MWTPCAcZVRxLlfauL00kkal6IOeQMEHMjneYFJ/ZSawRh5cmXk
         8VOMyiSJvb0+2nymtiIxKnvddfOQwlTFH56cWeM7BLEvQAF+5uNehlpLqGMSHegjrkhx
         BmTLM3X9huu5kZMGHOEKf53KBqWwbWqkicVDSlxMsDk+x1Ra0KGeHRDoTYexMXTJoysh
         mqPUbqnU5Aj/IHGoYCLR8RP7M5sxG5KjT4XEjq7DOrqd2EUkTsgqvP039r21mmb7rNID
         x5sw==
X-Forwarded-Encrypted: i=1; AJvYcCXwaO31pH2gRN1tVMB7D50F8awUT8WeSj8cjBjULwhGYDZaUdD7mY/6/Vktmjsa5IlXC8RCKbFU7Bs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxs6gv8IRcdzRFmqXVByW1lMEstFF05YoKXTUIvc3IEzF2FtRp9
	/mRpS1ttCWeZR/LhKJNCvnub6acrrUWmXFyYt/chGZd9wjtBR+WObk47mL/3FJbX6w==
X-Gm-Gg: ATEYQzwkd3kQZP8RRgH7op6MwZeiVFgplHlgcse33EvuGRay4UWJYIw3zR2gbXG+vrZ
	vTJvhlUsE7UCHVEVpdW5wzxmrXHEsvOTU22sLtUVL9QMTQKEPqJWb8gLFLl8RNCkYlcITFBAxCq
	iNt1NtbYm7DkmDnZnn5o1rx4mzX1Qc8rIZJnfVxov1CbnsLtn05VzA8+WUGY5+AvkdX9mkQdmL7
	7eoh50o+MRsGBqDQxLX8yNU+1aJyZo9BMBPsuWIm3RWrRKrJvCwLbu+xmNyJMbBmP5Aj+djTBOM
	2vueGiWW4HpHi5owr0TowhvWvGeaV8rCDA5PGIAL4ngg3HxO72mIU7RmimfpHVo/PkEAbRpsDAV
	f7qJUKiiL5t2rrGhG4kn6cvQf/LHM3YqSlOXeikhLkdBt9PDm1otZz2YRbaWqrbYWO2/cWbL3Cx
	6chkWu7TWbcODwEPDEoSJ59uoVGRULgzguXA5t8lqkbbEF+BcfHaF5jdQ9w/7A0AsWLKPyBBwsj
	my5HPktn7MPmNc=
X-Received: by 2002:a05:600c:1c0a:b0:485:40c6:f528 with SMTP id 5b1f17b1804b1-486fee2bb38mr25587495e9.30.1773991424380;
        Fri, 20 Mar 2026 00:23:44 -0700 (PDT)
Message-ID: <88d8a49c-035c-4201-855b-7a893c07b538@suse.com>
Date: Fri, 20 Mar 2026 08:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] RTDS scheduler: potential issues found during safety
 analysis
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Cc: dfaggioli@suse.com, mengxu@cis.upenn.edu, gwd@xenproject.org,
 andrew.cooper3@citrix.com, julien@xen.org, tiche@cis.upenn.edu,
 tiche@seas.upenn.edu, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <1c0f5bc3-5e04-4043-b950-bf9af10bf720@epam.com>
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
In-Reply-To: <1c0f5bc3-5e04-4043-b950-bf9af10bf720@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii_moisieiev@epam.com,m:dfaggioli@suse.com,m:mengxu@cis.upenn.edu,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:tiche@cis.upenn.edu,m:tiche@seas.upenn.edu,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7A722D68F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(dropping Dario's duplicate but wrong email; adding Jürgen - see ./MAINTAINERS)

On 19.03.2026 18:49, Oleksii Moisieiev wrote:
> Hi all,
> We have been performing analysis of the RTDS
> scheduler code (xen/common/sched/rt.c) and identified several potential
> issues that we would like to bring to the community's attention. We would
> appreciate your feedback on whether these issues are considered worth
> addressing, and if so, what the preferred approach would be.

The question is a little odd: If you mean to use the scheduler in production,
a goal is going to be to move it out of experimental state. For this, sorting
issues like the ones you enumerate is pretty much a requirement. And yes, the
suggested approaches look plausible to me.

One other aspect: Please don't send HTML mail. I'm leaving everything as reply
context, for you to see how it ends up looking when read as plain text (with
my mail UI at least).

Jan

> Below is a summary of the findings. All references are to the current
> upstream code.
> 1. Inconsistent validation in domain-wide vs per-vCPU parameter update
> ----------------------------------------------------------------------
> In rt_dom_cntl(), the XEN_DOMCTL_SCHEDOP_putinfo path (domain-wide
> parameter update) only validates:
> if ( op->u.rtds.period == 0 || op->u.rtds.budget == 0 )
> In contrast, the XEN_DOMCTL_SCHEDOP_putvcpuinfo path (per-vCPU update)
> enforces stricter checks:
> if ( period > RTDS_MAX_PERIOD || budget < RTDS_MIN_BUDGET ||
> budget > period || period < RTDS_MIN_PERIOD )
> This means the domain-wide path accepts configurations where budget
> exceeds period, or where period/budget fall below the 10 us minimum that
> the per-vCPU path enforces. Such parameters can lead to scheduling
> overhead issues (very short periods) or over-allocation (budget > period).
> Suggested fix: apply identical validation constraints on both paths, i.e.
> add the same bounds checks (budget <= period, period >= RTDS_MIN_PERIOD,
> budget >= RTDS_MIN_BUDGET, period <= RTDS_MAX_PERIOD) to the putinfo path.
> Additionally, the putinfo path does not handle the extratime flag at all,
> unlike the putvcpuinfo path.
> 2. Priority level overflow for extratime vCPUs
> ----------------------------------------------
> In burn_budget(), when an extratime vCPU exhausts its budget:
> svc->priority_level++;
> svc->cur_budget = svc->budget;
> The priority_level field is declared as `unsigned` (32-bit) and there is no
> upper bound check before the increment. While rt_update_deadline() resets
> priority_level to 0 at each period rollover, for a long-running extratime
> vCPU that continuously exhausts its budget within a single period, the
> counter could theoretically wrap from UINT_MAX to 0. Since priority_level 0
> represents the highest scheduling priority, a wraparound would cause the
> extratime vCPU to suddenly preempt vCPUs with active real-time reservations.
> While this scenario requires an extreme number of budget exhaustion cycles
> within a single period, it is a concern for long-running embedded or safety
> systems that operate without reboot for extended durations.
> Suggested fix: saturate priority_level at a safe maximum value (e.g.,
> UINT_MAX - 1) instead of allowing unbounded increment.
> 3. Replenishment timer loss during CPU pool reconfiguration
> -----------------------------------------------------------
> When the last pCPU is removed from an RTDS CPU pool, move_repl_timer()
> kills the replenishment timer via kill_timer(). When a pCPU is later
> re-added, rt_switch_sched() re-initializes the timer object (if status
> is TIMER_STATUS_killed) but does not re-arm it from the existing
> replenishment queue. If the replq already contains pending entries, those
> replenishments will not fire until some other event explicitly calls
> set_timer(), potentially stalling all non-extratime vCPUs.
> We believe this is actually a broader issue that goes beyond the RTDS
> scheduler: the common cpupool infrastructure probably should not allow
> a cpupool that has assigned vCPUs to lose all of its pCPUs. Preventing
> such a state at the cpupool management level would address the root cause
> for all schedulers, not just RTDS.
> Suggested fix (RTDS-specific): when timer ownership is re-established
> in rt_switch_sched(), re-arm the replenishment timer to the earliest
> deadline in the replq if the queue is non-empty.
> Suggested fix (common): the cpupool code should refuse to remove the
> last pCPU from a cpupool that still has domains/vCPUs assigned to it,
> returning an error instead. This would prevent the problematic state
> from arising in the first place.
> 4. Missing scheduling notification on vCPU insertion
> ----------------------------------------------------
> rt_unit_insert() inserts runnable units into the replenishment and run
> queues but does not call runq_tickle(). In contrast, rt_unit_wake() and
> rt_context_saved() both call runq_tickle() after runq_insert(). This
> means a newly inserted vCPU with a higher priority (earlier deadline)
> than currently running vCPUs will not be considered for execution until
> the next natural scheduling event (timer, sleep, budget expiry), which
> can delay scheduling by up to one full period.
> Suggested fix: add a runq_tickle() call after the runq_insert() in
> rt_unit_insert(), following the same pattern used in rt_unit_wake().
> 5. Stale scheduling flags on vCPU removal during context switch
> ---------------------------------------------------------------
> rt_unit_remove() removes queue membership via q_remove()/replq_remove()
> but does not clear the RTDS_delayed_runq_add or RTDS_scheduled flags.
> If a vCPU is removed while it is being context-switched off a pCPU (i.e.,
> RTDS_scheduled is set and RTDS_delayed_runq_add may be set),
> rt_context_saved() will later clear RTDS_scheduled and, finding
> RTDS_delayed_runq_add set, will re-insert the removed vCPU into the run
> queue via runq_insert() + runq_tickle(). This results in a stale vCPU
> reference on the scheduler's run queue, belonging to a domain that may be
> in the process of destruction or migration.
> Suggested fix: in rt_unit_remove(), explicitly clear RTDS_delayed_runq_add
> and RTDS_scheduled flags after removing queue membership, so that
> rt_context_saved() cannot re-insert a removed vCPU.
> We would appreciate any feedback on these findings. We are happy to
> prepare patches for any of the issues the community considers worth
> fixing.
> Best regards,
> Oleksii Moisieiev
> 
> 


