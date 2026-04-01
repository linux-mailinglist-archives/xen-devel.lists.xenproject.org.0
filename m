Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLRZE58PzWmMZwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:29:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2F37A766
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270187.1558925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7uh3-0000dj-5o; Wed, 01 Apr 2026 12:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270187.1558925; Wed, 01 Apr 2026 12:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7uh3-0000ae-3M; Wed, 01 Apr 2026 12:29:09 +0000
Received: by outflank-mailman (input) for mailman id 1270187;
 Wed, 01 Apr 2026 12:29:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7uh2-0000aY-AA
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:29:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7uh1-005NjJ-MP
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:29:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd0f8b-5cb7-0a2a0a5109dd-0a2a450a9b3a-24
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:29:07 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd0f93-ee98-0a2a450a0019-d1558036ed79-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:29:07 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48541edecf9so81879485e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:29:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888955d711sm10356895e9.9.2026.04.01.05.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:29:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775046547; x=1775651347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qwg/dNojIcS8dKm6nwTGbFnT48bXea1jlZe4yMFVPgg=;
        b=NfinOVLOjyt5GPPRzi6RqVHCZSHwuomHhD4qARIC4dSNppTEQ2oMKu2FZbLoqMrqFo
         00758wRpVRqwfKXJP62srsHPROqT9KcBv8AGtuq1kDEit8dkhcwuCGSHpTXmDvbmVN0U
         ejocRv2/gJDZI4iP0LEFrpb8AKegGKFdE4B2h7NWd0CQ9seqQOUqgabCSBNQ9h3rZFuG
         GydCwv198aDhsZf8xCKF+Ki7U0cYQXd7FSw9/UVrr0vZoCLV9RLL6IRKEKAGj0Ma7BbC
         f+biCfsSPdwWNvMuAtewfuHaO3Yw/jR1Agm4kLEGS/4OXYm52XSERuaG+8vrL2270rhy
         aJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046547; x=1775651347;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwg/dNojIcS8dKm6nwTGbFnT48bXea1jlZe4yMFVPgg=;
        b=f3GOsmxp32YEyYYSF8Cdd6BFzrUGTBcyXiBhl478J/VW4ZHBIOmPUhareqsIQQWyZJ
         bO4kMgF3vfCiXqoz9bbpP8IVxgk8zkMr6C8eFGP9AIOvsQ29uRwifm+BjYlF4ejdoaZo
         JivQBsPt4XLlG1xSBJ148jetObS8PECPAS6WLNUjFHzY3xezyx/2e72MAA0u8W/uta/X
         VMBm6DGE+bw/gnqDD2y935YAxE7ZOR4rrcvXhxOMciqRnmMMAtFbEmpe9c1ZOQdTGAXb
         ywlRvUcqDc2XO7AJg9BD35TCFjC3hq/gQM/GtrtZOQTt6bFSvNO1OPu5y5Wlu0+AFGvr
         NgmA==
X-Gm-Message-State: AOJu0Yws7hIAYmdevnzfC8XDCeCqCQTcA8ZdWMVt57dDBz6XakwP0X+1
	iobPUZ/R4SfhLWogysV+fVbFgD4/jlB261aIfEa99a16e7DMWP6UXA28M12ZVsCoE8lNPQ7uKb5
	ub3LSZw==
X-Gm-Gg: ATEYQzxb9zCrAc9GIttpnw5hQpSaW+USnSwsiyGushwlrIL+dXmEj8WfTJJII9CqFPV
	3e0MrWks9SoDP48Gu7dm6viac1v7WraIxECbmqZlajA8MAQ3EpMX6nL27GmCicVcDUtan/0LSWM
	b5x3ej2EhoNcWkA/Ympfuidn5Qt7Vm1y6yy9GAgQWI2jo7ZZfINazQhGwWhVXqnJIZfjmNmi9lt
	+IGlkK0VhdoOPNapInpDuVcV5Qz+IWW3t9aECCzu+bTlMSayOuQVYQSJKwTF4+JZXx0O67WCZg7
	qvRqqfA7x78SzRFxzCl7dUU2CVg/2GnwVUWDcBY7YnjemSeIgAU4oA7TExfKn4ZUZzcFq+NAliw
	cE1VvLEXHzmyc1ynp5esRIAjOCUNkmS5+qr8Gf9lH7XfBWl+jhFqO96kl4FXW+4WCdW1aGZWq6g
	EFsKGaZoWwjxh75R7OtwUd9K5KkhTXQKTZ3lKH8w0sXtxAPjLCrl5MC/70Ac0ZSUfDSFwWr4SVd
	5hFl9c67I2ckhg=
X-Received: by 2002:a05:600c:1f11:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-48883569dcamr55333905e9.6.1775046546922;
        Wed, 01 Apr 2026 05:29:06 -0700 (PDT)
Message-ID: <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
Date: Wed, 1 Apr 2026 14:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Juergen Gross <jgross@suse.com>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
Content-Language: en-US
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
In-Reply-To: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775046547-0FB450B1-69CB6168/0/0
X-purgate-type: clean
X-purgate-size: 1116
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B1C2F37A766
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Leaving aside highly disaggregated environments, the control domain is
what will invoke XEN_SYSCTL_SCHEDOP_putinfo. Its vCPU-s therefore need to
be able to run unconditionally, not those of the domain with ID 0 (which
may not exist at all).

Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There being no "else" to the if(), what about other control domain vCPU-s?
---
v3: Don't mistakenly include the idle domain.
v2: New.

--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -411,10 +411,10 @@ a653sched_alloc_udata(const struct sched
     spin_lock_irqsave(&sched_priv->lock, flags);
 
     /*
-     * Add every one of dom0's units to the schedule, as long as there are
-     * slots available.
+     * Add every one of the control domain's units to the schedule, as long as
+     * there are slots available.
      */
-    if ( unit->domain->domain_id == 0 )
+    if ( is_control_domain(unit->domain) && !is_idle_domain(unit->domain) )
     {
         entry = sched_priv->num_schedule_entries;
 

