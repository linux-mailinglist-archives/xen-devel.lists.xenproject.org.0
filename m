Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKGOIxLJw2lKuAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:37:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99D324001
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262075.1554748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5MXb-0002he-7p; Wed, 25 Mar 2026 11:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262075.1554748; Wed, 25 Mar 2026 11:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5MXb-0002gD-4S; Wed, 25 Mar 2026 11:36:51 +0000
Received: by outflank-mailman (input) for mailman id 1262075;
 Wed, 25 Mar 2026 11:36:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5MXZ-0002fg-Um
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:36:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5MXX-00CQB8-NR
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:36:49 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3c8ca-e002-0a2a0a5209dd-0a2a450cd392-18
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:36:49 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3c8d0-f93d-0a2a450c0019-d1558035adac-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:36:49 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48700b1ba53so46527385e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 04:36:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871174f2cesm125888375e9.10.2026.03.25.04.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 04:36:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1774438608; x=1775043408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TrrfqRAHFVWJx37O8Fs32iWyY5wOLEvLspA/JjkjZ4Y=;
        b=b9lMh3i9FRlTAPlbnQrucV6Jjzg/xud4c2f0foPfSlKlClmUL81kJUwpqQp7mpm6r3
         KSLmJfkA+kghOph69DH6DADIAM2z49NIpdMUuZD87ib/Fz7x0H1xo4UD+4DI7WKejOsq
         cdxykaGXVZTMLai2hjFfR8Fv8E3H7zI6rL60Fw35EiaYwgfhmiNMMq3rKS4AzQT1ZD+j
         O2woWqZW4LPhCl63vRKocckRhW4JzbvUHSElAyKsALgn03ZwxXbC7KO6oQGr4NsDZEIE
         VnqvDc7uorJnKyq5/yuY/Jp0DdnaUgBRBgXZQuqWmtTxNa1dBhAYc54BxQ7jrclSEbQS
         ToUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438608; x=1775043408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrrfqRAHFVWJx37O8Fs32iWyY5wOLEvLspA/JjkjZ4Y=;
        b=m5a7A48nRy4KaT9z6cLcJ0Oc/5xkfjRomzMYpYmWBPMn2m8M1qphM3pJP3+Nspv8pF
         TyO9Ye8uBlg2xg1Mm+9dSH+bTC7vrqd0Jf4DoShbaqifAtiaQAsMpCUGDBB2+ZW77/7F
         dLRNXcDgYpFzjRL0Ts/FSDn98vu3tS4T9hnwuFJPNZfHvqhsH/rTq5jd7pEN4uwjCaAK
         fLQDTnSP1TvquurVbRM3N8XqCVp58pB6vCbF3//FEbG9VVlR1B6MpJExeiq8hBHaDz8Z
         6+v8N7BBDyyBu69TQ0jydAq1BJD+HhYUtGji3t+VBPLguXovU99tCraMiUb2j+GTt+SM
         G6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYUU3XZUSsm6ylaWtzheumjAcXnlFTmVzoJN7CRRnaEfKu6gw3WtQjIZGbbAQS7O+A5TOCUrRuuVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvwH+PZhqrNKoxdRuzFkbwmMb7tzOPZjzNRu+c11Dtp7ekyXzq
	PhIH1jV8an52ARA+u6JP+IGiq1YPq9lVrHAilhTqfBHSfbH0o/JzxAvAyqZFRd7VBA==
X-Gm-Gg: ATEYQzxLZkWLu4X/TH+wfNhd61YjPdzzG9wmkqPK3WUpxDpPdxbxRCVXLCvcMVIQ2Zc
	J7hq5q+Oy97Akc3i0V4k+vLGfktuERp4/VFb8R+1WO6XiOYgZiicR5QjSNvfJAnO8L55LtUA7Uo
	Dws3w4vnd1cAZNZMlppeB8K8Vhdp+hyvCMBbK9Jh8XJJclgvQ67hPdO8qSoUecuWa5SHW1Lb+Ie
	11eVTBCeVP/y7C6HMdVuQs7V4MHLAMqpw91QUoxWZNOMHGDnSwf/P/kXRMQ/vtYAHpqV8aELJtd
	IAJOoJuFJ+rIZBlaIoJQ9OIou0gKLbSBmkxBJg1w+rbz/uDf0Hqe4v0xsrscZ4OPxizBQyllSmy
	bWNaYuNYh/1P54CAO3rVp4Zhy6FhTLVRsMxwXKsSXpcPN05/PLCeJgftqaVySW0s9GYobuf8Z0A
	tGHjWElXWEJZx3Ob58VQNMdGN9fmegtd8AnZyh2MDXqCMwq6iuqmOFLhgdjbbwrgftQSUWw3qsX
	UfIvXBipo30kJe9kd5sPWresg==
X-Received: by 2002:a05:600c:c166:b0:485:5812:bb9e with SMTP id 5b1f17b1804b1-48715f0272amr48820525e9.0.1774438608438;
        Wed, 25 Mar 2026 04:36:48 -0700 (PDT)
Message-ID: <bf12cdd9-be5f-4389-ad96-141980707de5@suse.com>
Date: Wed, 25 Mar 2026 12:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/vpmu: Expose PEBS and DS area in PV mode
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech>
 <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
 <d382d9e9-8a3d-4e1f-a437-f15620887078@vates.tech>
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
In-Reply-To: <d382d9e9-8a3d-4e1f-a437-f15620887078@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774438609-FC82D734-2DCA1773/0/0
X-purgate-type: clean
X-purgate-size: 1302
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ED99D324001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 11:16, Teddy Astie wrote:
> Le 24/03/2026 à 10:14, Jan Beulich a écrit :
>> On 10.03.2026 17:44, Teddy Astie wrote:
>>> I don't see any reason for them for not be available, especially
>>> since core2_vpmu_do_wrmsr has PV specific logic for MSR_IA32_DS_AREA.
>>
>> This is really dangerous: You allow PV domains to control whether the area
>> is actually mapped. It lacking a mapping can, iirc, on at least some CPUs
>> result in a complete hang. I do, in fact, have been carrying a patch to
>> completely disallow DS area use for PV, eliminating the misleading code
>> you refer to.
>>
> 
> While PV case is particularly quirky (especially with L1TF), the issues 
> still exists for HVM.
> I suppose things may be a bit better with "EPT-Friendly PEBS" though.
> 
> Regardless, we already say that the feature is potentially unsafe to 
> use, and it still needs to be opted-in, so this patch just allows the 
> guest to use something we advertise (with its eventual quirks).
> 
>> Also note that VPMU_CPU_HAS_DS cannot be set for PV vCPU-s anyway.
>>
> 
> Why is that ?
> 
> `vpmu_set(vpmu, VPMU_CPU_HAS_DS);` made in core2_vpmu_initialise is 
> called in either PV and HVM cases.

Oh, I'm sorry, that's yet again a result of aforementioned patch.

Jan

