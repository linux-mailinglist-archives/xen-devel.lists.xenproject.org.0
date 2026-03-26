Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJUdCo0SxWkI6AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:03:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABEA333F8D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263736.1555597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5iUC-0002Gr-Hx; Thu, 26 Mar 2026 11:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263736.1555597; Thu, 26 Mar 2026 11:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5iUC-0002Dp-FF; Thu, 26 Mar 2026 11:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1263736;
 Thu, 26 Mar 2026 11:02:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5iUA-0002Dj-Vv
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:02:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5iUA-003zLr-BU
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:02:46 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c51254-5cb7-0a2a0a5109dd-0a2a4503b2ba-12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:02:46 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c51256-1947-0a2a45030019-d155dd2de5c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:02:46 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43b9144790dso443539f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 04:02:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b9192e533sm8420617f8f.2.2026.03.26.04.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 04:02:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1774522966; x=1775127766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=voxn08RLae975DzsSSC3A2hKJaqjKkKVCQEDoaN7x9A=;
        b=QMmFc6mLdb4PrETLAukBzdwa2tXrrz2Fc60UI/bq1jpIcX+aQkknxXTxmoEONdqdtL
         dx9PAek+YDUiQBEXHcus2sQeojmzAzJoTVANoWxv8bee0agA6IMnqOqEVjkWysblWgNZ
         YaqIQ2PKr71M7x4k4s0xB4BxRSwcaqvYcmDLIjthzs5UCw8YXAqnKwGLIq4/gzohTE9x
         dxqr+VIlkTHcJ9yiaHclC2uAENFXRR9rRbM6JuYW6UqtQlOSIfgWhxo1PEikQ/AFadLz
         eRn0Sa8jBcyLMWJq503yl04Zu3T3Hqdj81eaIzhS+U/454lLfDVuNIN6KM8B2A0GjyIv
         D0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522966; x=1775127766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voxn08RLae975DzsSSC3A2hKJaqjKkKVCQEDoaN7x9A=;
        b=sj4k3Lc2/mGlUxnCvkPSu2st1pqvlZO3OegH7wsQsjDuZbsBNfPXZPNGiz2N2XpAWb
         rBeB1Uk+HFrsP/FK5caiiB+8z40slIxHlPXwT85xl6nNw561kJRoH5+mOJ/FDJ420i9X
         0vXNK3eoa6RtEZsR3uR9qo3w5Aoak1d+KHwiownRc7iDvjv7UKU1T+l9QGusiR57ixUE
         jYwXFdqd4wZBzoUwh47rwSdqLULFELgbDknGFzQkJcV1jWTZPCaLAhfk59lsulCjwnMF
         OkSjyQ8YXQ7DOUZZEF8Y96uXsCNvD0qAdFP8PVauKP8fahmTAnV2FParRzYPJ5p6p1B+
         2stQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtFs+zouooRL2bUaB7gXSfu6WjNwQKqoEG8rTJ0KYeZPzZzKip1/Mkt4n1A0KHnnsFDnbastEiM7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypRdfKB9LrShzhy4+FtAPz7qJtAuPvZkLqo61BvVTGk91cSwRp
	6jfulK1qmReQJlkVxx3quoha7zrgmtVFGWUl+LRsiBNHImz2p8U0Gk8okRqyxfF/XA==
X-Gm-Gg: ATEYQzxCrYeJiMqD80gJAI2IdJhXrkA54NEQiLTcMy/ADJAcrJz7gyF9TwRGJ91gsvt
	c3Z2iUhesx7AzKpS34O7l3cAsBUal6dt9EcwvmXjTLY8KroQ08hw/3EUEjvKzcgcmDgJ5tIASlr
	ygt540wtKtlsclLFC+z3502GE/3wQv/Q1L5nyIbRig98C5SQMhUsTgxPIdTz++omr4aJlcd9Bmk
	cgX+eW4NL0J0keJaR57BuT/3J+7ozQ0gxGGQQgUS+yEr3F2wPCC5slA+Q0+WUokluUCv1oEIdy8
	pJTVNJrue5c8jR9ayoAHsH1D7E/kqnGGf5NDEeB0ksejAmaMBZcVD+MoYHhlyv5G8l4W7MSi/Vj
	BHr3Hos0NHMcELNhCSDv4ZKnQEo5ch/7FEyf8Kd+UBlsRMKU7+Cut4aJKGqG78N97zudeCI05jh
	qf5XGNyQ4JJRAiZdr1V8qtDEyz+Cm0iUx3sbdxrHP85dQrQ1HK/PB8qidGZr8BtxYc90Vy4ugdT
	gTpYacDhy3cOv0=
X-Received: by 2002:a05:6000:288c:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43b88a29212mr11557908f8f.38.1774522965443;
        Thu, 26 Mar 2026 04:02:45 -0700 (PDT)
Message-ID: <1e95cf58-0e40-4cfe-8ac9-cd31d97f8330@suse.com>
Date: Thu, 26 Mar 2026 12:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/intel: Add recent CPU models model-specific LBRs
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <888b0df36c6706de9d7ec1c5c4cc229297699670.1774519884.git.teddy.astie@vates.tech>
 <975b6883-646d-4db4-b931-b21c45d0507b@vates.tech>
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
In-Reply-To: <975b6883-646d-4db4-b931-b21c45d0507b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774522966-4B04472C-CD4C0261/0/0
X-purgate-type: clean
X-purgate-size: 2005
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,xcp-ng.org:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ngoc-tu.dinh@vates.tech,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6ABEA333F8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 11:35, Tu Dinh wrote:
> On 26/03/2026 11:21, Teddy Astie wrote:
>> Add all CPU models that supports these MSR as they are defined in February 2026 SDM.
>> It uses the same list that span from Skylake to latest CPU models as a part of
>>
>>      MSRs in the 6th—13th generation Intel® Core™ processors,
>>      1st—5th generation Intel® Xeon® Scalable processor families,
>>      Intel® Core™ Ultra 7 processors, 8th generation Intel® Core™ i3
>>      processors, Intel® Xeon® E processors, Intel® Xeon® 6 P-Core
>>      processors, Intel® Xeon® 6 E-Core processors, and Intel® Series 2
>>      Core™ Ultra processors
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> Currently, none of these MSR are exposed on these CPUs, leading to BSOD [1]
>> in Windows when it is supposedly trying to debug some program.
>>
>> I guess [2] is also caused by these missing MSRs.
>>
>> [1] https://xcp-ng.org/forum/topic/12008/application-on-vm-causing-bsod
>> [2] https://lore.kernel.org/xen-devel/ced16fca-3b55-40a1-a7e2-ffadd9707394@vates.tech/
>>
>>   xen/arch/x86/hvm/vmx/vmx.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
> 
> I don't think CPU models with architectural LBRs should be stuffed 
> together with the model-specific ones instead of having their own case.

I agree. We want to at least determine (or even enforce) how many LBRs
are accessible. After all we can't be sure the DEPTH field hasn't been
altered before we gained control.

Beyond that, because arch-LBR enabling is a significant effort, I guess
using the existing machinery for the time being might be okay.

> With that said, short of fully implementing arch LBR, it might make 
> sense to at least stub out the LER MSRs to allow Windows to read them 
> without crashing, as certain versions of Windows use LER MSR indexes 
> without checking the arch LBR CPUID bit.

This would be too Windows-centric for my taste.

Jan

