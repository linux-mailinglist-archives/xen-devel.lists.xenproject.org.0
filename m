Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF8pDFoiwWmTQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:22:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E792F120A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259220.1552527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dLw-00016N-VC; Mon, 23 Mar 2026 11:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259220.1552527; Mon, 23 Mar 2026 11:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dLw-00013q-S9; Mon, 23 Mar 2026 11:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1259220;
 Mon, 23 Mar 2026 11:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HLc=BX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4dLv-00013k-II
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:21:47 +0000
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 796877dc-26aa-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 12:21:45 +0100 (CET)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-439bc14dcf4so3455845f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 04:21:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6cdfdfa9sm19643036f8f.9.2026.03.23.04.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 04:21:43 -0700 (PDT)
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
X-Inumbo-ID: 796877dc-26aa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774264904; x=1774869704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a74I+JkLGusfBhOhvZxoIP68cNb9aOakHdNPfBY6ahQ=;
        b=Qbkc2MlIhAL+YtdHYE6e2226u/JAxDHTtEqpHFIAZN2F+LabJK7ykZTlXycFFpXHFV
         RG2ANS0ct7WLQSutgjjbnXn8kK1q3+r5BINZyFe81l5Q0B9PpHr55Yi7Ln7Ejf5jyRwp
         v5vtYj771ZxMTu4vUWRLCWaYDBiic8c0P/CT6K3WXNEHg0BTHwLIC7a8Fh9lLDSP0Epa
         sjUr3hkoSUit1kQTOEk2K8l77ODbah/Rlryyi7hXSek9I2du6o/Z7kkb6FWanSFmOwOA
         vpbDJ9vCkesH5j3o6oTvcYOTV+Q/g4jK6c92qwSQpsJDcDk8TVYC4WjQaiZOHIxfx0xU
         2j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264904; x=1774869704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a74I+JkLGusfBhOhvZxoIP68cNb9aOakHdNPfBY6ahQ=;
        b=OYonvNhW9gUTLfCJF5jkEAArys5PRMooV+6CHoZBH7ozabPqYFAF3R5eZGz5IqOf5u
         9WmiDJaGaSrPtvQMn+2C1gHI08aED3iS0r32zRc7LngdfxHtaUgmLTNPj4o1lSHbdf2q
         lkKIBJrsqCIMzAlU7lt29C0S9+Kl5iEXhsNi+ijfCddssdkmmGzGShzvwNDU0mdaHbRi
         r5J5GgflvPOqgf7e0P7/9n7hm9Wj1MHRMHfyQ55DULd5Sf7lis2Vd34rUz17CtpzQ5xA
         4u81RHCAjKZRO3NvFUKS0YA25bjpN26SAeY4VziltJjCnK2025+QUPInHeJRGja+jdqP
         fuJA==
X-Gm-Message-State: AOJu0YwLJAjavijCzwTXDxhCpCn8KGlwXvCW2rTC87mZBw9/UUNDEuE0
	Pn4v5ocC7H/eBnc6tLpbnrY4iLtQOPjsR31F7W/g/sQKMnK9SwA+1sCc+U08vwfzGw==
X-Gm-Gg: ATEYQzxyJKGXH8QpyZcMh70z1HpTAjxVGUHXPJoAdUmUjiPtiGAKFo+DiC6Jyf/2XiN
	jHSAdNvBjuA9jNPgiYpI0cNqME9+ZQPGy4HiDPp1dgtaLWA4G1Zt1Wq/U104TxbWhgxFGAK9Mv2
	ts3cAAawcTOKbYkERWjRzTAn2NPrnSvsjOYbeDdjXUMHmNMOlQZBpW1By8vHFuiV3O8CiiVOrNv
	gpFxCPnWzKztfbfRcgcOaEO/xG3qG4+Q0loVvwG6RVU6USbco1CAfjVFOb/o9rGOMmjwOyL8P7q
	Sz+DuI0iQehkqFX30RYMMWim1q/xEBJlLzVyzvGYcwiFG5oZVwmizsIISE1UVpI6uAY5dAMa7Nw
	W9nqFV51buT8VhLT3K6u39lCCMuDmyRUDVz5YJQuatTEPfaiWLK9ogPFlRAqQHXnDX+HQaZY55T
	eIdC5fqxsRcoSGANoqR8xda1b/tcF1ed4CuH699Eu7SBK7Gxd91lRTj8ZcWRpnw2LGmCRElLKrF
	3FPVDujpscST0Y=
X-Received: by 2002:a05:6000:401e:b0:43b:5091:39db with SMTP id ffacd0b85a97d-43b6427249cmr19475056f8f.13.1774264904277;
        Mon, 23 Mar 2026 04:21:44 -0700 (PDT)
Message-ID: <24401de6-eceb-4087-b3e9-05c99cba1d0c@suse.com>
Date: Mon, 23 Mar 2026 12:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
 <aahDX_QvrB1MTLcq@mail-itl> <0c556f7c-6567-43ec-a9cd-eb542fc970b3@suse.com>
 <aahJJdA6ftj3OucN@mail-itl>
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
In-Reply-To: <aahJJdA6ftj3OucN@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 97E792F120A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04.03.2026 16:00, Marek Marczykowski wrote:
> On Wed, Mar 04, 2026 at 03:47:14PM +0100, Jan Beulich wrote:
>> On 04.03.2026 15:36, Marek Marczykowski wrote:
>>> On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
>>>> MCE init for APs was broken when CPU feature re-checking was added. MTRR
>>>> (re)init for the BSP looks to never have been there on the resume path.
>>>>
>>>> Fixes: bb502a8ca592 ("x86: check feature flags after resume")
>>>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Sadly we need to go by CPU number (zero vs non-zero) here. See the call
>>>> site of recheck_cpu_features() in enter_state().
>>>
>>> With this patch, I now see the "Thermal monitoring enabled" on resume
>>> also for AP.
>>> And then, the "Temperature above threshold" + "Running in modulated
>>> clock mode" for AP too. But, I don't see matching "Temperature/speed
>>> normal" for any of them...
>>
>> Which would imply that for each CPU you see at most one such message after
>> resume. Can you confirm this? 
> 
> For the current test, yes. I got the messages for CPUs 16, 6, 18, 4, 2 -
> in this order. Not for 0, 8-15 or 20-21. Not sure about CPU0, but for
> others it kinda looks like I got it for P cores, but not E cores? But
> I'm not sure how to reliably distinguish them - I base it on the holes
> in numbering due to smt=off. Specifically I have online CPUs:
> 0,2,4,6,8-16,18,20-21 (yeah, weird ordering...).

I wonder, btw, if this is good enough to translate into a Tested-by: for
this patch. Thoughts?

Jan

