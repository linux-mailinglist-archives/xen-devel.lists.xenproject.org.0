Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tWbFHVnLPGrssAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:31:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56EC6C30A8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:31:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="XkIJObU/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345285.1604197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdcN-0007zn-HT; Thu, 25 Jun 2026 06:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345285.1604197; Thu, 25 Jun 2026 06:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdcN-0007x0-EH; Thu, 25 Jun 2026 06:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1345285;
 Thu, 25 Jun 2026 06:31:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcdcL-0007wt-BY
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 06:31:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcdcK-00GRLr-3j
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 08:31:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3ccb2e-e002-0a2a0a5209dd-0a2a4509d06c-30
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:31:16 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3ccb33-97e6-0a2a45090019-d155802ced4b-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:31:15 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so16055645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 23:31:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c9f240c3dsm10955600f8f.35.2026.06.24.23.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 23:31:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1782369075; x=1782973875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/4YwqZP05O3D347uZAqWDKDlRxehqrmkg9sz2an6OII=;
        b=XkIJObU/pTIFi/OLB3ggZ+uVEKdvx4eC62y0iXjw275sLJZbHSHRfCoENoCLY9lFD5
         1tB81/vJkh0BqYHOPTbVhaEHxxbqqF/g2JY23OfHry5NgMGvweLqth8kCsllnt7mCyAs
         3P2vV6zz7HDgnwm/vSjTq5BQNjhcq0NSCt2CuAIEYC1BAF8weCHlhVLuECYJ21lT3iAD
         t47ygZGOXF3GkQW6uiNB8mBsSSFDTGLXemnxfNmxMxNgyDdIeQg0mCqJisqIm/uepCgJ
         8vNyd+kdOBfGJCaw7APkxTnVWOEM8qYlrIe+H9/my4dym+b+GDalt7raJJ+7wRW8odU8
         VtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782369075; x=1782973875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4YwqZP05O3D347uZAqWDKDlRxehqrmkg9sz2an6OII=;
        b=kEji/3Jfx6wGJSyAVjpy5vppTOvOhZ3WcDZVrMoGUE6IUs1exgZ3EEeG7nEs+0JOwZ
         09LO4eHswMzk9Bx5TcdJ8xlqhBdctawbfOfNt6wu5tBLKsSRbBglRUq2bzxLQrURLs3y
         Mt7GfF8V+p9GuuwsVQFbUkpEXRVeYR5ZzdY9j7IaLJdrHCQ2mAV6lfCjADcUmhcXDZs0
         2nF/jsZN5EoRdMUz//cY1CF/NU/IiHmd8uSw1G+Ov1NHOAGJ0ipkIPOMtD7aGmYD3l6g
         xRz8hiLgSYUkO201ndWL7E6skOitRr4aZCsUgbBddzfkhrqq057zGalubkwxoljVJcZL
         +HQg==
X-Forwarded-Encrypted: i=1; AFNElJ9DjUj3K4+d2EpOBBwBa/zZPzVtyFAXKxKfPAg68j7zEoI9rjinjpeVSjCLCaP4xPAj0XVNA8XBLcE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpN6uVJwtAzXLk29Kz/3WoRASkwBS+87YBZapGta1ypWlxZ2Bj
	g6p2gY0UL8wdyHR0q7hXklZ/OHbsG3jPf/bwPlaPcGQClJibPhmnWXzfIXObBsg4sg==
X-Gm-Gg: AfdE7cme1h5apsRjxpUMamDVlMtUkOSm9KiEPedgm3PUUuq10bSOAaAu3zukFtGXXeB
	BWejcxKTJLPgg0YMxUaTswb9I8jiaXnA69OhZPtma0RrlShGILprkFWSwRWMD7WZAn7wL/4xLKR
	hQCh8QK3TVfEzXKbWB4b757S4/oLiSJSNQ7Tx4J3KPr8H5hiF5pF21JxDMHWJfamIxouhWJbtq/
	92EIZGXefly7+O6dkoh0WLQ9fZYRDg02LblWL6RUxH2oaEWn/RXXhCD4juP2bBb/iGejdxPjgFD
	VWWc7qtnxBWT/Efd3iGtAgpH21LoBewLjezHr+2Ukf0KD9SFp2GID3LzMoTgDSl4tOmuqFgwWrJ
	vPzCWHdxAuAEygdO/86i8fRZzpWKFpAQIFCFhmdBrK8IyUcUP99+vjU912WLfyLsFhMRx9jf9er
	66GD80x6uaWyeXaIW1M9aT43IdnzV3TiK8lZGJyLJb3CN6TPMqmkdyCxhN4T/wIzZIrqfMKxGDa
	1gs
X-Received: by 2002:a05:600c:1d0e:b0:492:5bf9:cbbe with SMTP id 5b1f17b1804b1-49266899d25mr13095145e9.23.1782369075320;
        Wed, 24 Jun 2026 23:31:15 -0700 (PDT)
Message-ID: <4439d1a5-7999-4e8e-b852-ea67e2473208@suse.com>
Date: Thu, 25 Jun 2026 08:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [4.22?] Re: [PATCH] sched/rtds: refill cur_budget when extratime is
 toggled on a depleted vCPU
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>, Juergen Gross <jgross@suse.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
 <3b09cd9b-f0f1-41d6-a118-d0ea855f27d6@suse.com>
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
In-Reply-To: <3b09cd9b-f0f1-41d6-a118-d0ea855f27d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782369075-44528986-29E41A2F/0/0
X-purgate-type: clean
X-purgate-size: 3811
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,m:jgross@suse.com,m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	SUBJECT_HAS_QUESTION(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C56EC6C30A8

On 27.05.2026 11:08, Juergen Gross wrote:
> On 20.05.26 15:57, Oleksii Moisieiev wrote:
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
>>      /* add svc to runq if svc still has budget or its extratime is set */
>>      if ( svc->cur_budget > 0 ||
>>           has_extratime(svc) )
>>          deadline_runq_insert(svc, &svc->q_elem, runq);
>>      else
>>          list_add(&svc->q_elem, &prv->depletedq);
>>
>> The very next rt_schedule() iterates the run queue from runq_pick()
>> and trips the ASSERT(iter_svc->cur_budget > 0) at the bottom of the
>> loop, panicking the host. Observed trace:
>>
>>      Assertion 'iter_svc->cur_budget > 0' failed at common/sched/rt.c:1035
>>      ----[ Xen-4.22-unstable  arm64  debug=y ubsan=y  Not tainted ]----
>>      [<...>] rt.c#rt_schedule+0x1558/0x33e0 (PC)
>>      [<...>] core.c#do_schedule+0x2e4/0x15b4
>>      [<...>] core.c#schedule+0xb14/0xe50
>>      [<...>] softirq.c#__do_softirq+0x20c/0x3d4
>>      [<...>] do_softirq+0x14/0x1c
>>      [<...>] domain.c#idle_loop+0x194/0x558
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
>>      if ( has_extratime(svc) )
>>      {
>>          svc->priority_level++;
>>          svc->cur_budget = svc->budget;
>>      }
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
> 
> This is missing
> 
> Fixes: 463b95831778 ("xen:rtds: towards work conserving RTDS")
> 
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> 
> With the "Fixes:" tag added:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

And then perhaps wanted in 4.22 right away (rather than later as a backport).
Oleksii?

Jan

