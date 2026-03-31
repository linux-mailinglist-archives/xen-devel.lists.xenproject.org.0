Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAECNiPuy2m5MgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:54:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0036C2AC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269149.1558268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bPf-0000d0-0n; Tue, 31 Mar 2026 15:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269149.1558268; Tue, 31 Mar 2026 15:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bPe-0000au-UT; Tue, 31 Mar 2026 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1269149;
 Tue, 31 Mar 2026 15:53:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7bPd-0000ao-5x
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:53:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7bPc-008tDB-I4
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:53:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cbedfb-e002-0a2a0a5209dd-0a2a4502cd5c-22
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:53:52 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cbee10-63bb-0a2a45020019-d155802bd51c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:53:52 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-486fb112c09so54677035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:53:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e967badsm55461665e9.14.2026.03.31.08.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 08:53:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1774972432; x=1775577232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fNRanloXQ19oIIHAgQidmrgH/LvEZVRiIP7N7oI/i3Y=;
        b=WzH81CUDtuf2eLXV1PsT9HjtYiL25t/aBCid7kI6a7mCJzvyB8bvGMprbrvNOpvpXe
         0Je4h5EZ00/tbdeYT2NQR0Tmz0MpupbxY33sK1rc//1UNoTVMKgfziAYwxjktQb3Mt+v
         rg2CY4+anJFOVI81fhZbA9p2J/cvSsLnWomXL+FykSfPbJz9u0ECevkZ1BoFqK4gVqfB
         5n03bDSdn6aVO/fj56s28ThTUXhRy+Yk0GUyXX2xlwuCRxPj0Bug1Koh6MfhITPmGnhk
         dLrCcW4pJTeTLUazh4FQyPfZ8vTWjtpL6uZU0NXa17ZDsjs7W6AoMZ60wyHMAN5zUHuh
         7C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972432; x=1775577232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNRanloXQ19oIIHAgQidmrgH/LvEZVRiIP7N7oI/i3Y=;
        b=mW36lvVUn8+QFHoxjfvJN0EDidVlwQSc5PSZlCHYzE8hp91FYH1Pcpc3WV+R8vyXKk
         1FiyNTjl9U4vUvogCwbsbMWiullAApMrGg6KSuvCs6K8uX0YbJgeJVxv3kHeK5iy/9ws
         RtN/YzU+oN6+dywGtC1VvlXu0afqf8QCGP8wNmA2e9QOcviQBzupDI9YUcuZBfx5qrvB
         9MpEm5nxma8bMEl9ABPg8gn8opPCrA3RRawdXMJff3UrPkJYwy9+yvhUDphZprEsf+74
         kTaX4Em9vNl99nSXWLqR2WFttpGjlkGw/+5axh8+cf19QlCpQhgC1s/hXsYvzamnrsVE
         WksA==
X-Forwarded-Encrypted: i=1; AJvYcCUwLcLKZ0TLw+qm2NLsjdmVB6k9O9x8Whm7BkyL3YRBGT5U9TtpytOTfjSkqjK7vFd3ZykMvITxlG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTvRT3xQgGuYq1Yb5Ul+vh26966opS06SawyF5EkQCaGD0tL1X
	Hh+PWjt2u81uSYvPdXJpL9ym3Q3IIFQEnCld4SPOXmuEEywNqRMcp1SD5PDQ0z81vg==
X-Gm-Gg: ATEYQzxiSOTxgPdmxYC3CB8mZK+08LVllcdSOARsvomrgK8+C32jXXtQP9pt0+3Glja
	AWOhqp4EumqT2weOGuakwq9zdM24WLHJbbF85ZNoYt8T6Jb85GmyGc3RjyiQcRAclHMLOgOpcvp
	JMGUcNi6haH66Yqo8PMyaOAnrnRwiOa9YaGqRQCs66Ds8ImhVsY78MU8h4SGJ/nc1j1wYwjj01X
	19iZjMIo9IiMZIX0q922mN7J+QkZFSAb0QaszQJ0/A+mqqWQoGI2YeHeOVuLmMvg2/gLl7/Utx+
	dEJB8TnqD1N6/Wj9Z5yvNH/r90eTdenXxnWRDoz991f4UkOPEHlGFY+j32CE6NAXpTXSNZnysxU
	s5VmQmbLBrFAHUryILX6bVEil18gSkNMpp9SA0Yhf6iny47OeByAthyW5gPidBeMn6STE2hU9QS
	AWQDjoJcVWp1PcDAFMINJvlO9yC3TPCWJhEPTj+yUlHFBUnphscInQqNzVXL/fpCJAPsXPhsjP6
	GKNcLYP1MlrdHQ=
X-Received: by 2002:a05:600c:4205:b0:488:7784:d06 with SMTP id 5b1f17b1804b1-48877840d50mr46870985e9.31.1774972431809;
        Tue, 31 Mar 2026 08:53:51 -0700 (PDT)
Message-ID: <d1288db4-2001-4914-919f-b613fd607bcc@suse.com>
Date: Tue, 31 Mar 2026 17:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen: move domain_use_host_layout() to common
 code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <533d01db2b36b8357cd87e99a64a6e66dbdd1db4.1774281309.git.oleksii.kurochko@gmail.com>
 <6df9470e-4969-48d1-bf0c-c6569a5e5577@suse.com>
 <57581b7d-cb9f-444c-9321-63b2fc3d09f0@gmail.com>
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
In-Reply-To: <57581b7d-cb9f-444c-9321-63b2fc3d09f0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774972432-4149FDB8-82194609/0/0
X-purgate-type: clean
X-purgate-size: 2582
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4DA0036C2AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 17:20, Oleksii Kurochko wrote:
> On 3/30/26 5:13 PM, Jan Beulich wrote:
>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>> domain_use_host_layout() is not really architecture-specific, so move it
>>> from the Arm header to the common header xen/domain.h and provide a common
>>> implementation in xen/common/domain.c. domain_use_host_layout() potentially
>>> is needed for x86 [1].
>>
>> No matter that this may indeed be true, ...
>>
>>> Turn the macro into a function to avoid header dependency issues.
>>
>> ... this introduces unreachable code on x86, i.e. a Misra rule 2.1 violation.
> 
> Do we have some deviation tag for such cases when the code temporary 
> isn't used?

I'm sorry, but it'll take me about as long as you to find out. I wonder
about "temporary" though: Do you have a clear understanding as to when
that will change?

>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>   
>>>   #endif /* CONFIG_SYSTEM_SUSPEND */
>>>   
>>> +bool domain_use_host_layout(struct domain *d)
>>> +{
>>> +    return is_domain_direct_mapped(d) ||
>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>> +}
>>
>> The placement of paging_mode_translate() doesn't match ...
>>
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>   #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>   #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>   
>>> +/*
>>> + * Is the auto-translated domain using the host memory layout?
>>> + *
>>> + * domain_use_host_layout() is always False for PV guests.
>>
>> ... the description of the function.
> 
> But why the placement should be different?

If you focus on auto-translated, then imo paging_mode_translate()
better would guard everything.

> is_domain_direct_mapped() is false for PV guests (and for other guest 
> types on x86).
> 
> So if domain_use_host_layout() is fully depends on 
> paging_mode_translate(d) && is_hardware_domain(d) and for which 
> paging_mode_translate() is false if it is PV guest.
> Thereby domain_use_host_layout() is false too.
> 
>>
>> Further, the first sentence above suggests the caller has to check
>> paging_mode_translate() before calling, which as per the implementation
>> clearly isn't the intention.
> 
> Sorry, I don't follow you here.

By starting the comment with "Is the auto-translated domain using", you
imply the caller checked for that aspect already. At least the way I
read it.

Jan

