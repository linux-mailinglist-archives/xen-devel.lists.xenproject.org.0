Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAl5JBbbw2lwuQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:54:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF6325427
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262241.1554829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Nkm-00032m-RW; Wed, 25 Mar 2026 12:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262241.1554829; Wed, 25 Mar 2026 12:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Nkm-0002zy-Os; Wed, 25 Mar 2026 12:54:32 +0000
Received: by outflank-mailman (input) for mailman id 1262241;
 Wed, 25 Mar 2026 12:54:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5Nkl-0002zm-Fg
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:54:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Nkk-009vQn-Rt
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:54:30 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3dafc-e002-0a2a0a5209dd-0a2a450c9200-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:54:30 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3db06-f93d-0a2a450c0019-d1558035bcdc-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:54:30 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486b9675d36so54026355e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 05:54:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487172f916asm30216625e9.5.2026.03.25.05.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 05:54:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774443270; x=1775048070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr58uimG8bI+Ne0+PIoQEbzojsnDffZKHoNOIV+6NWk=;
        b=S9qirmPZ0uSESPmxXwrC6lvjY94O7XFwAHQuM5esE7sIbUCC9sEuV3W9oHtAql/kzR
         GdpmXBrG8ZnzLeLEruvIARu/NBU55rexoghJL2qDS0Lx3ojzcuRUDyukLPAPSMbVQ8d9
         O+QjyPUHDGZMX086pk0x2bzSaIBWS6PGGY+7pulzKn90SedsnS8FrDXcPuVOqQ782QCx
         NqrHZd8lqyBlPADA2EEWTE1TpNr/grPMHUQ/uW3DXn0x45/vFl58tm8rn+pzT+fUjrry
         T7Hjsxg87ygF/wxohxISAyVcH6fyMo5K/6oHL/Bdp/ml4cGnhPuagT9hjWt3dK0uZK/e
         9cCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443270; x=1775048070;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr58uimG8bI+Ne0+PIoQEbzojsnDffZKHoNOIV+6NWk=;
        b=bNw9iRh9tJIDnrRiIx5LcKCEtBXtInRfcyljpvnsWhRNE8p+uahHdYS2atrida160X
         gulZnLhdDyLsqc0OKQMYJ4Y2k3dDw23YuFz23641x6KrDqjjfj9suvBhm/CM/0DWG0Hw
         nNbAgfFmzFIN3JC2wBzVpgEwIk8vpDqyKZ21jHFLntzmvObR+o7P7S9ILXCFv1lhGHID
         4xHeW5G4ot5tTCioknruBISl2x1jxK6LcQk1WSi4Dm+/MkSQsUqC4UAteXTSwkrvsnUe
         huh42PxRmnz2Mzobm87/wO4/LF+VcYN0uzbgX/ZQj6n87zqPsEhxiBRBEPZJSSuAZPEc
         K83A==
X-Gm-Message-State: AOJu0YxOKBPSEuwXA9buucNhtTZnw7louMGK0SEmx84H5DChk95gi7Co
	aP4c5BlQhRnNOFV9gop03OWYVdsLpIfEGa1e7toCdHxCXChL36fvh4Jtjj3VjxWoBr6H6bjPit/
	Ec2Hlyg==
X-Gm-Gg: ATEYQzykOpnhOS8Z/30TJXtdVXOwcGZI6SCc7vXE3vbCAi13daaGTjtXUq3XwQDhOti
	MU3fMtLqcl0CTvzXFmw/1skYiywYME7cFom7PBfvVIHRHWIkzyP7jJ8ZMcNsekZQOq7ThXKoOve
	ML/zHv8K9VBIudy7l0qiprS2XRyGpN+Lqp2Um+chz2ljqgOcxF7A0vbQAzZ+UJDkYmgDeCLB4m2
	MLXAhnXYKkRA14dTFVwoDahVOI8JCbAP7TkLvzr4Rc+1A6djDqJ4pnVHbAI4mvBgLwJ9EcFDT01
	s9JbnUEt5m46aUkvNBwogFJQB+ToJtxtgwP/UH2LeQSyl0cUp+p0xX2smTX3ua0I3SvPaGyyKhr
	UB8UhhNk+5yb8YOJoYXgfZDQMvThr+qqRE39CBvLCyp771i8xcEtLqisv5fAwAJZV3YkBvKtamB
	A8k90AIzSwsy1sG2972ZGeN9EWj1PTUPtBDrK+jEMvUdAKt1pFkFvd/w0MvbAgdkCVhyX/MBg3I
	K0EeKDDzhI6GzQ5eHBQyzgo1g==
X-Received: by 2002:a05:600c:45c4:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-487160717d3mr49116945e9.32.1774443270200;
        Wed, 25 Mar 2026 05:54:30 -0700 (PDT)
Message-ID: <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
Date: Wed, 25 Mar 2026 13:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
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
X-purgate-ID: tlsNG-d25034/1774443270-F5AB5734-4CB8D694/0/0
X-purgate-type: clean
X-purgate-size: 1090
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 00BF6325427
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
And why are they added to all scheduler instances?
---
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
+    if ( is_control_domain(unit->domain) )
     {
         entry = sched_priv->num_schedule_entries;
 


