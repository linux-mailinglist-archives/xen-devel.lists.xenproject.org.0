Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOzbKhTEBmpdngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:58:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671554A388
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309638.1580684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmUW-0002Gc-MP; Fri, 15 May 2026 06:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309638.1580684; Fri, 15 May 2026 06:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmUW-0002Ch-Iz; Fri, 15 May 2026 06:57:48 +0000
Received: by outflank-mailman (input) for mailman id 1309638;
 Fri, 15 May 2026 06:57:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNmUV-0002BJ-C6
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:57:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNmUU-00Gy5w-KC
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:57:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c3e8-5cb7-0a2a0a5109dd-0a2a450be51e-2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:57:46 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c3ea-212f-0a2a450b0019-d155802cdc65-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:57:46 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso84636765e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:57:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm11896518f8f.11.2026.05.14.23.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:57:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1778828266; x=1779433066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WHmoPTbeIM3pijhui4YZsDSOFaGZN7lR7UYQxppdUqo=;
        b=Ls5RsRj/D/9UX9Tt8+m2FFaF7hlZ1v4XCB5Pp82KGtcuoboFvArb9GKZ8RVwxNU6vC
         jAGNci4puV2zT8Zdfht9Zd6E8Z4n2DWav5/Q1HN02VY6PWsPG6ycQpGbMbzC6JDdzEZK
         j1CZBXGKZ/myKQOZ+ot5jy2sqs+Ua5xYtoUQC1WXXYto8AZfWamfG6xQZ0LQ6WohRdKO
         IWFha1JkY3Tbu6RvtedxHiBPxocQiCDS4nt2rTg3pddX5zmWoDppR/DrH/LugIJew8yx
         x1bDuVIJWsi+mhWuuHQ/6i0TFmgcFuOd8wlYt4qQg/CHn8AnXyLHeCqcy14Xl3fRiu3i
         SCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828266; x=1779433066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHmoPTbeIM3pijhui4YZsDSOFaGZN7lR7UYQxppdUqo=;
        b=lz7k5sdzgqWRomVBhI5BYRtRO322e6jlCBB/wiWIoZ/U3nNwBkP5dXqU/k9JpsJ3nS
         /0qgkt/WAS5xWZw2KXqrjoY47hi6aLSJyICg57ECNkx6LMrNtuZ89MEEnDCH/EeUOkYZ
         QJ6AKRAOmgj/J/6udPbn45PLDOYGWTrhjKTkkBYvICBdD0csONNqtNpwatYyLTElaFrT
         1zmh3PjertP+R7/0y71A7v41mG/y20nl7pVS9oMiBLMDaeaeWBMVMitGsbo9gvsKtdRj
         RzHUgj5hxNXIkWQngAx2lC9IhgfAiEcthCA8ExQo6OT0mUEdH6MZXLJ4ZP3AyR5dusVA
         4V8g==
X-Gm-Message-State: AOJu0YzEvWV00AFiHYCWId6J+mDPoChoouAP9XMS5u/HDnBKQWTu8ghf
	qUHcd2TNowjMVR+Bx7cFpE50x/4gp3ovb8VTVlLJJnMtM9I0s+cPv8iRTVoTAKviNQ==
X-Gm-Gg: Acq92OHBy1Si12UBgveZoEbdcgryaXX3TINf/FmA/e9oyzjV5eQnj8RRbeZQao/jEWD
	Bte8JApRf10LGHt2DEDZ2uwK86kcfnrameKAXZs3VR3gfJMo0EJh1o2Grg4Xyypfy/qkzsy3tSy
	KDed/1GaTOWPbIhVuZXYK5qirj1T3klCIzvVR06u9+Z9dZ8uy5fQo+99G60TXYhVykMM3DqeQ48
	k0dfbaHAUG29LDRnr8GsFf7ULaUygEFa6dVDyWealWw9u5bdfDtRKIDQ8VHq83Eh7zxRB7RucAk
	4AYq/MmyqpvFdOYlm7VEaAQOK6WV77u7Jcyjf5D8gD0nWhpDFVZGVYTgmLUlk7RZrRilehErGzp
	N9+arvSHIohXYCAxsxSLfH5rqE+BL2xUvt2IdnUOU8kjsdFgZzdeaPd5AOHUjNiOXXew5cE16MQ
	dXDAc8WrHuxjBcadOuiFKZWUyG9GVVe24McEey8AvzDMjwjPW/xXM2zOV/E2E673uZ7RNobbieV
	1tDd8sk7DGJF1Y=
X-Received: by 2002:a05:600c:528c:b0:48f:d612:3c6e with SMTP id 5b1f17b1804b1-48fe60de745mr33433535e9.2.1778828265908;
        Thu, 14 May 2026 23:57:45 -0700 (PDT)
Message-ID: <5fdd68ea-a413-4f8e-a50a-b0d7d821e904@suse.com>
Date: Fri, 15 May 2026 08:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 7/8] x86/mwait-idle: Add cmdline option to
 adjust C-states table
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
 <8c46fedd-f1f3-4cad-91fb-1b3b8d58db50@suse.com>
 <agXns5dpu-X5rspi@macbook.local>
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
In-Reply-To: <agXns5dpu-X5rspi@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1778828266-19F6EF3B-7862A595/0/0
X-purgate-type: clean
X-purgate-size: 6124
X-Rspamd-Queue-Id: 1671554A388
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,msgid.link:url,suse.com:email,suse.com:mid,suse.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 14.05.2026 17:18, Roger Pau Monné wrote:
> On Tue, May 12, 2026 at 05:38:08PM +0200, Jan Beulich wrote:
>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> Add a new module parameter that allows adjusting the C-states table used by
>> the driver.
>>
>> Currently, the C-states table is hardcoded in the driver based on the CPU
>> model. The goal is to have good enough defaults for most users.
>>
>> However, C-state characteristics, such as exit latency and residency, can
>> vary between different variants of the same CPU model and BIOS settings.
>> Moreover, different platform usage models and user preferences may benefit
>> from different C-state target_residency values.
>>
>> Provide a way for users to adjust the C-states table via a module parameter
>> "table". The general format is:
>> "state1:latency1:target_residency1,state2:latency2:target_residency2,..."
>>
>> In other words, represent each C-state by its name, exit latency (in
>> microseconds), and target residency (in microseconds), separated by colons.
>> Separate multiple C-states by commas.
>>
>> For example, suppose a CPU has 3 C-states with the following
>> characteristics:
>>   C1:  exit_latency=1, target_residency=2
>>   C1E: exit_latency=10, target_residency=10
>>   C6:  exit_latency=100, target_residency=500
>>
>> Users can specify a custom C-states table as follows:
>>
>> 1. intel_idle.table="C1:2:2,C1E:5:20,C6:150:600"
>>    Result: C1:  exit_latency=2, target_residency=2
>>            C1E: exit_latency=5, target_residency=20
>>            C6:  exit_latency=150, target_residency=600
>> 2. intel_idle.table="C6::400"
>>    Result: C1:  exit_latency=1, target_residency=2 (unchanged)
>>            C1E: exit_latency=10, target_residency=10 (unchanged)
>>            C6:  exit_latency=100, target_residency=400
>>                 (only target_residency changed)
>>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Link: https://patch.msgid.link/20251216080402.156988-3-dedekind1@gmail.com
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 111f77a23348
>>
>> Add __init to get_cmdline_field(). Put cmdline_table_str[] in .init.data.
>> Other adjustments to fit our env.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> +/**
>> + * cmdline_table_adjust - Adjust the C-states table with data from cmdline.
>> + *
>> + * Adjust the C-states table with data from the 'mwait-idle.table' parameter
>> + * (if specified).
>> + */
>> +static void __init cmdline_table_adjust(void)
>> +{
>> +	char *args = cmdline_table_str;
>> +	struct cpuidle_state *state;
>> +	unsigned int i, state_count;
>> +
>> +	if (args[0] == '\0')
>> +		/* The 'mwait-idle.table' module parameter was not specified */
>> +		return;
>> +
>> +	/* Create a copy of the C-states table */
>> +	for (i = 0;
>> +	     i < ARRAY_SIZE(cmdline_states) && icpu.state_table[i].name[0];
>> +	     i++)
>> +		cmdline_states[i] = icpu.state_table[i];
>> +
>> +	state_count = i;
>> +
>> +	/*
>> +	 * Adjust the C-states table copy with data from the 'mwait-idle.table'
>> +	 * module parameter.
>> +	 */
>> +	while (args) {
>> +		char *fields, *name, *val;
>> +
>> +		/*
>> +		 * Get the next C-state definition, which is expected to be
>> +		 * '<name>:<latency_us>:<target_residency_us>'. Treat "empty"
>> +		 * fields as unchanged. For example,
>> +		 * '<name>::<target_residency_us>' leaves the latency unchanged.
>> +		 */
>> +		args = get_cmdline_field(args, &fields, ',');
>> +
>> +		/* name */
>> +		fields = get_cmdline_field(fields, &name, ':');
>> +		if (!fields)
>> +			goto error;
>> +
>> +		/* Find the C-state by its name */
>> +		state = NULL;
>> +		for (i = 0; i < state_count; i++) {
>> +			if (!strcmp(name, cmdline_states[i].name)) {
>> +				state = &cmdline_states[i];
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!state) {
>> +			printk(XENLOG_ERR PREFIX "C-state '%s' was not found\n",
>> +			       name);
>> +			continue;
>> +		}
>> +
>> +		/* Latency */
>> +		fields = get_cmdline_field(fields, &val, ':');
>> +		if (!fields)
>> +			goto error;
>> +
>> +		if (*val) {
>> +			const char *end;
>> +			unsigned long n = simple_strtoul(val, &end, 0);
>> +
>> +			state->exit_latency = n;
>> +			if (*end || state->exit_latency != n)
>> +				goto error;
>> +		}
>> +
>> +		/* Target residency */
>> +		fields = get_cmdline_field(fields, &val, ':');
>> +
>> +		if (*val) {
>> +			const char *end;
>> +			unsigned long n = simple_strtoul(val, &end, 0);
>> +
>> +			state->target_residency = n;
>> +			if (*end || state->target_residency != n)
>> +				goto error;
>> +		}
>> +
>> +		/*
>> +		 * Allow for 3 more fields, but ignore them. Helps to make
>> +		 * possible future extensions of the cmdline format backward
>> +		 * compatible.
>> +		 */
>> +		for (i = 0; fields && i < 3; i++) {
>> +			fields = get_cmdline_field(fields, &val, ':');
>> +			if (!fields)
>> +				break;
>> +		}
>> +
>> +		if (fields) {
>> +			printk(XENLOG_ERR PREFIX
>> +			       "Too many fields for C-state '%s'\n",
>> +			       state->name);
>> +			goto error;
>> +		}
>> +
>> +		printk(XENLOG_INFO PREFIX
>> +		       "C-state from cmdline: name=%s, latency=%u, residency=%u\n",
>> +		       state->name, state->exit_latency, state->target_residency);
>> +	}
>> +
>> +	/* Copy the adjusted C-states table back */
>> +	for (i = 0; i < state_count; i++)
>> +		icpu.state_table[i] = cmdline_states[i];
>> +
>> +	printk(XENLOG_INFO PREFIX
>> +	       "Adjusted C-states with data from 'mwait-idle.table'\n");
>> +	return;
>> +
>> + error:
>> +	printk(PREFIX
> 
> XENLOG_ERR ahead of the prefix maybe?

I did already raise the level from info to warning, compared to the Linux
original. I didn't want to go yet farther with this, hence why I'd prefer
to leave out XENLOG_* altogether here.

Jan

