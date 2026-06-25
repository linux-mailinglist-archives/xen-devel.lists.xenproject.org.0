Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/ogHHkSPWqMwggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:35:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82766C527F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:35:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LZz7PZDk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345527.1604375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciMS-0005Ui-56; Thu, 25 Jun 2026 11:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345527.1604375; Thu, 25 Jun 2026 11:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciMS-0005Si-1X; Thu, 25 Jun 2026 11:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1345527;
 Thu, 25 Jun 2026 11:35:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wciMQ-0005Sc-Al
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:35:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wciMP-0059DX-Jr
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:35:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d125e-5cb7-0a2a0a5109dd-0a2a4504cd00-38
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:35:09 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d126d-a01d-0a2a45040019-d155dd32a8e0-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:35:09 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4631679f204so449753f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:35:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee01d9csm16810596f8f.12.2026.06.25.04.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:35:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782387309; x=1782992109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CY2/peG0xWnphtHYEOtJxlInVM/Xz/OGPiJbqS+QR6k=;
        b=LZz7PZDkNGD2v5ToGpJhHRcFQsj/PjBX9VJU/j4bNWAdxE+/kuoq9LDlza94sUihxu
         ZIitlVB7uWhloeuN6umWIPlGbKC4zQLHIOfALtCNOucVOPVwz3EgoI5jRq5EMBpPHSOf
         cw/IPxG6qoE0OAGJan9VchLpysLKzuxknGh07BkihQrmhzwMlS4FUV6cpjJidoQysXxk
         RMeqjFa1VF3jfYXDPzR62r7bVB6ZZWEiob4R7PTo3u0PK0lAZ3QrFmOCGr6RUWuDcg0g
         mjN3MsVlGaIdkpcWObthTOtjS0Uk/+QG/8MtiIW9dJJtW0ooY9ZKxI6DaXM9V46z4JEo
         voBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387309; x=1782992109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY2/peG0xWnphtHYEOtJxlInVM/Xz/OGPiJbqS+QR6k=;
        b=AEPyKodmew3Ztk6M2xUrtx9gGmrkB5uPfvOxDuMLjClEAjm+wVvmNOCltdIxwRrTAY
         QJHflu2AiMjM4WEYOlc1We5bg3oNAqC0dbyR3ExBcKCEbMANHoNaE+y3wFZ9nCok5M9P
         40Om3xD91PA/uLBjMwRi4Ko0wo++TvdtqnEyoAyWvDEjAZ4H3ds0s+om9JS+1OZV+AHo
         uTqR3b+T6fLJwdv+M1LnKXxOGzaZubc5qM1W8w9eXu0dD10OWz6yrI2OEQY7fmiZvWjq
         2C69IjWhjB/VQ42BZOIQtmTNQ5N9YlD8zDedKZ7KdzF1tMFf/jNK1Eaejbl5zAqxr99N
         vX7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqotAYyKlLxg78VfUDzdSEitvn1VQsvCyfdy2xbYdsdYh/Kk/W/qaWlcAuXX1DKv3rXtcCFkMPGLS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpW67uRkT0Vyqi0Q9B1Hhd/w7QxOAJO2pLtSpGChbz3a/t0YCK
	FjuQQGUPkNp5FoTLTcUlgz/3jbVHRDkpPnC55Zz0jImaG45qqdyoSYc6
X-Gm-Gg: AfdE7cnJ6Z90/TL6/+6W1GeBuSIDGkkCFMcgXnx5QQ2NsPnPE21ae9sU6ncOf0TQN8D
	VYISgbueEaK+rvt1UNIYsJau15E7Ew1I2EJrt8Vx/+eCaCpBNsWIbeuD7AhXsCDizIA4M/XqJUO
	qozY9ZWfqvahZLFDBTdQ+fr/LQnfUg5b9tI6G/Qs7QHLRO9vWTDG/cFdBvCyvoTejFfd2C9pSLV
	5nMYlSXQXkHf8Ulff0PaTs2PF8jg/HHnVpbpzjbbYlyOoFTYOSdH/oQXoC9EwxiOeczigl5Tr6D
	wbKMxASQUvACDh+RHGy9moc51lhwxo9CfgBz8pL8VEvQDu880SvubZJ3B132GdhelT//T2ECyqw
	VgIcAe7dJCDzXJ9Qsy69DyS1Ux7h7vadVyX56Xnn9ptp/K/awodgyV+0KVpET3fAt7pTgVBdl9N
	x/b5OXXUTCtf6TZQPfotW6uzXH7yTQRy0SWd5uFmPw6rBjWwJ13bAPZLHCreBw0vCSVoMZmOmIb
	8gBKQ==
X-Received: by 2002:adf:e186:0:b0:465:f555:d9ba with SMTP id ffacd0b85a97d-46da95fdf75mr3313052f8f.18.1782387308742;
        Thu, 25 Jun 2026 04:35:08 -0700 (PDT)
Message-ID: <799d66ae-ce4c-4f62-8051-f91cc8f8af88@gmail.com>
Date: Thu, 25 Jun 2026 13:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [4.22?] Re: [PATCH] sched/rtds: refill cur_budget when extratime
 is toggled on a depleted vCPU
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>, Juergen Gross <jgross@suse.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
 <3b09cd9b-f0f1-41d6-a118-d0ea855f27d6@suse.com>
 <4439d1a5-7999-4e8e-b852-ea67e2473208@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4439d1a5-7999-4e8e-b852-ea67e2473208@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782387309-2E5591CC-872A1153/10/73395122804
X-purgate-type: spam
X-purgate-size: 4150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,m:jgross@suse.com,m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C82766C527F



On 6/25/26 8:31 AM, Jan Beulich wrote:
> On 27.05.2026 11:08, Juergen Gross wrote:
>> On 20.05.26 15:57, Oleksii Moisieiev wrote:
>>> XEN_DOMCTL_SCHEDOP_putvcpuinfo can flip the RTDS_extratime bit on a vCPU
>>> that is currently depleted (cur_budget == 0, possibly sitting on the
>>> depleted queue). rt_dom_cntl() touches only svc->flags; cur_budget is
>>> left unchanged. As a result the next code path that calls runq_insert()
>>> on this vCPU - rt_unit_wake() after a domain_unpause(),
>>> rt_context_saved() following a delayed runq add, or repl_timer_handler()
>>> after a replenishment - places the vCPU on the run queue, because
>>> has_extratime(svc) is now true and runq_insert() admits extratime units
>>> regardless of cur_budget:
>>>
>>>       /* add svc to runq if svc still has budget or its extratime is set */
>>>       if ( svc->cur_budget > 0 ||
>>>            has_extratime(svc) )
>>>           deadline_runq_insert(svc, &svc->q_elem, runq);
>>>       else
>>>           list_add(&svc->q_elem, &prv->depletedq);
>>>
>>> The very next rt_schedule() iterates the run queue from runq_pick()
>>> and trips the ASSERT(iter_svc->cur_budget > 0) at the bottom of the
>>> loop, panicking the host. Observed trace:
>>>
>>>       Assertion 'iter_svc->cur_budget > 0' failed at common/sched/rt.c:1035
>>>       ----[ Xen-4.22-unstable  arm64  debug=y ubsan=y  Not tainted ]----
>>>       [<...>] rt.c#rt_schedule+0x1558/0x33e0 (PC)
>>>       [<...>] core.c#do_schedule+0x2e4/0x15b4
>>>       [<...>] core.c#schedule+0xb14/0xe50
>>>       [<...>] softirq.c#__do_softirq+0x20c/0x3d4
>>>       [<...>] do_softirq+0x14/0x1c
>>>       [<...>] domain.c#idle_loop+0x194/0x558
>>>
>>> Minimal reproducer: pin a single-vCPU domU to a pCPU, program RTDS with
>>> extratime off and a low utilisation (e.g. budget = 10ms / period = 100ms)
>>> so the vCPU spends most of its time in the depleted queue, pause the
>>> domain, issue a putvcpuinfo that sets XEN_DOMCTL_SCHEDRT_extra, then
>>> unpause. As soon as the schedule softirq fires on the pCPU, the BUG
>>> hits. The same sequence is reachable without an explicit pause: any
>>> window in which rt_dom_cntl() runs between burn_budget()'s budget
>>> exhaustion and rt_context_saved()'s runq_insert() also closes onto the
>>> same broken state, because the per-scheduler lock is dropped between
>>> those two points.
>>>
>>> The semantics for "extratime gets exhausted budget refilled" already
>>> live in burn_budget():
>>>
>>>       if ( has_extratime(svc) )
>>>       {
>>>           svc->priority_level++;
>>>           svc->cur_budget = svc->budget;
>>>       }
>>>
>>> Apply the same priority-demotion-and-refill in rt_dom_cntl() when the
>>> flag transitions from off to on while the vCPU is depleted, clear
>>> RTDS_depleted to match, and - if the vCPU is currently on the depleted
>>> queue - move it to the run queue using the same q_remove() +
>>> runq_insert() pattern already used by repl_timer_handler(). The vCPU
>>> remains on the replenishment queue throughout, so its normal
>>> replenishment cadence is preserved.
>>>
>>> The complementary transition (on -> off) is already safe: clearing the
>>> flag only narrows the runq_insert() admission condition, so subsequent
>>> depleted insertions correctly route to the depleted queue.
>>>
>>> No other call sites need changes: with cur_budget restored before the
>>> flag is observable to runq_insert(), runq_pick()'s long-standing
>>> invariant (every run-queue entry has cur_budget > 0) is preserved.
>>>
>>
>> This is missing
>>
>> Fixes: 463b95831778 ("xen:rtds: towards work conserving RTDS")
>>
>>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>
>> With the "Fixes:" tag added:
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> And then perhaps wanted in 4.22 right away (rather than later as a backport).
> Oleksii?

Since this issue leads to an ASSERT, I'd prefer to have it fixed now 
rather than rely on a later backport.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

