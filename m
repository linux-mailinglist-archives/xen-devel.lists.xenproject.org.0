Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIqFBlsmwWmbRAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:39:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807982F1533
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259241.1552545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dcO-0004YA-NV; Mon, 23 Mar 2026 11:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259241.1552545; Mon, 23 Mar 2026 11:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dcO-0004Vv-KQ; Mon, 23 Mar 2026 11:38:48 +0000
Received: by outflank-mailman (input) for mailman id 1259241;
 Mon, 23 Mar 2026 11:38:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4dcN-0004Vp-QS
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:38:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4dcM-009EJO-O0
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 12:38:46 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c1262c-2eae-0a2a0a5409dd-0a2a45078a44-42
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:38:46 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c12646-fd74-0a2a45070019-d155802bd9fe-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:38:46 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso24334625e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 04:38:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fd9845a2sm508977385e9.6.2026.03.23.04.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 04:38:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774265926; x=1774870726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J8zngj/nLhIAO9NmIjccQi6D4Htz6v6OOUxei0KNjxA=;
        b=YLffg0L77ASc9+ecbv6kX8Nz6cJRHJJvQ+y97kiHDrDjYqM0YMP3+fZlmvfjz5cZ/X
         qTakSEQPtKDeMWEF0gzTBmYwYQpQ0i9FdLD9w5mvBM4eviY04fuzbfyvmIT9suf9xNWx
         LoNBRJtGubTWXUYN4upqXPJSojiets4m6/KMMmkNEuR8HoctUpHUI8ZNowfRtVUVyKju
         BeDahwNE/Kn+tlQva5S4UslEU8uGWcJUksYxNAuD+VGxyNg8qufxo++dUsf+8Mg50PKZ
         tiB+AVU3fAAA1SJ5SRsGCkcKoi49e+iTNPE3HNr6qRQqknnuRtBDyrgUC/Or+39B2rKd
         UGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265926; x=1774870726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8zngj/nLhIAO9NmIjccQi6D4Htz6v6OOUxei0KNjxA=;
        b=K6eepJDTXFF24uGGfXOhg9ZcPNR179RhDOrtJTskN/8L7WLGt2sMuukW80SNaPd0V0
         fonVowow7CedeEtjyqeeQn1d02H6bQT+76yfpZ0wMcLwXnMIR/Qi4VYsW13RR0VEp4mY
         LQoEpcWERXqnx13C5kl5zRITwNKxd8QS8bcCfmTez47meqw1b8lcQy3m5wEvf3XY5VRx
         w526bVvrbc/VrQPnqvNPC3EvM6cz3/U3jgdJpM0BwDv7ZatkBoH5clUQB1T3+vrUDoOj
         4sw3FAbJaykEXBrg+Joc0YX4MDNcYUouyUiq+xVPogNANWyFyWTU/OCPSplkxgUDG51g
         L5og==
X-Gm-Message-State: AOJu0YxqIGVo16Iy+Vk7/OJjlDZ9L8cy5WFZpnzzOTsgG0pDyGVpgJZJ
	rSMGTvt0+EKRnZtgZxJSSBcX7SvRJS77rycGgIimtoLwh0RmhwVg2Y9YyYVmfRyAJQ==
X-Gm-Gg: ATEYQzwWwHSzpu3mVyTKK0pfYLpU7lMZK03eew4H8hWEDnjHp3s44D+dWt9HUvUR/ac
	VYkeR665OBOUi2KuQIrryhsqJHZXEoJFNUwT3JnZjp894f/P/JpwV2bwcGY2uWR4sUrU7gicI4o
	QnI46a5s5ujgRgfAQmRmifX35AAf8/d6JqHOvf1Dj6Rv8ro3Trv2emtZ614oRlxxsOtK4KRFa5P
	LY1uErPqKsrXz02IpDgp5WdLsnH/04M4HXXsojvU900T64ChSMRgKfU0eP9DzlpPlNOyrQyyzPT
	j0hybW2/nyRoeaz6bQt5fsMcN1U5qSOnEX9RGdxQfdvnfTiSYRYnEDzYbvOZWmLH5v1ICZgno/U
	w9I+nx1jRhMGmg+ahc+vxcyAjfIGGz+q93UDhM7xamhuXav9x5YrjwuhcJ349B2k9PbMAcrUpgR
	kwioSQljx957z/1HfiE/tnRp272cyBTBUc+8ICH7CWHrRA3pPi1pdaC4cQhL1naJbhi7R+tQbsJ
	vGdKIXc4Vu+BxM=
X-Received: by 2002:a05:600c:8718:b0:485:45fb:3472 with SMTP id 5b1f17b1804b1-486fedab438mr173019695e9.7.1774265925824;
        Mon, 23 Mar 2026 04:38:45 -0700 (PDT)
Message-ID: <72f9adbe-6dab-4070-be20-3f40f3a37c2b@suse.com>
Date: Mon, 23 Mar 2026 12:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
 <acEhF0NnlImMHwiO@macbook.local>
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
In-Reply-To: <acEhF0NnlImMHwiO@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774265926-552B9303-82DDE281/0/0
X-purgate-type: clean
X-purgate-size: 1844
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 807982F1533
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 12:16, Roger Pau Monné wrote:
> On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
>> MCE init for APs was broken when CPU feature re-checking was added. MTRR
>> (re)init for the BSP looks to never have been there on the resume path.
> 
> I'm not sure the statement about MTRR init is correct, AFAICT
> mtrr_aps_sync_end() will also re-init the MTRRs on the BSP, and hence
> the added mtrr_ap_init() seems to duplicate what's already done in
> mtrr_aps_sync_end().

Hmm, right you are. Had I been asked, I would have confirmed that I checked
the code past the "enable_cpu" label, but clearly I must not have, or I was
blind at that time. Let me strip that out.

>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -642,16 +642,21 @@ void identify_cpu(struct cpuinfo_x86 *c)
>>  			       smp_processor_id());
>>  	}
>>  
>> -	if (system_state == SYS_STATE_resume)
>> -		return;
>> +	if (system_state == SYS_STATE_resume) {
>> +		unsigned int cpu = smp_processor_id();
>>  
>> +		if (cpu)
>> +			mcheck_init(&cpu_data[cpu], false);
>> +		else /* Yes, the BSP needs to use the AP function here. */
>> +			mtrr_ap_init();
> 
> For symmetry with the BSP path, is it really needed to init MCE so
> early for the BSP by calling it directly in enter_state(), or could it
> also be done here?

To be honest, I would put the question the other way around: Is it really
okay to do it this late for APs (during boot also for the BSP [1])? Iirc
an #MC prior to mcheck_init() is going to be deadly to the system. Moving
it earlier may, however, be a more intrusive change.

Jan

[1] Us crashing (rebooting) during boot is perhaps less of an issue than
us doing so during S3 resume: In that latter case it may mean data loss
(or maybe even data corruption).

Jan

