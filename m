Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II+qD5drqWnH7AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 12:40:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A343F210B55
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 12:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246490.1545657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy73d-000353-Tt; Thu, 05 Mar 2026 11:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246490.1545657; Thu, 05 Mar 2026 11:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy73d-000334-Qv; Thu, 05 Mar 2026 11:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1246490;
 Thu, 05 Mar 2026 11:39:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy73c-00032w-3L
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 11:39:56 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 074ddb87-1888-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 12:39:54 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48371119eacso94730885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 03:39:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb33815sm70708765e9.12.2026.03.05.03.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 03:39:53 -0800 (PST)
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
X-Inumbo-ID: 074ddb87-1888-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772710794; x=1773315594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bUMNP0bb2H2lV5/sen2uEfAJ3WmTTIBJ029R1MIX8T4=;
        b=EH+RyDYAUSow31ERwF+WorG76syF0F0Sq0w2jFPsu9wyoKQVhvsHr9Pead5pMa0dgy
         +1Ts65AYaKC0smvPyEpMYkQbYrQDdvPd8w/FhkbARcG6Tb9l1silrW5ceovBYk87U9uD
         5Yv7udmwRicls+o5LLNm2xONg5ysvtzAATxd2IGUDkMKc8IqHP+64BAA5um3pS4ruYLa
         ACjmo/cjVZqipPq/z8aE8HmB7qeSbAj8U2Mqa5cfhHxSzQwr5XF/wOcEDqakPhKWOTvb
         0Yt5xHQGwixwBLZqAJNWi+S6Mp/5K5Ivqxai8Rp3Z/yZJb11XpFaAIdAW8Wc2iHdk7bB
         xJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710794; x=1773315594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUMNP0bb2H2lV5/sen2uEfAJ3WmTTIBJ029R1MIX8T4=;
        b=T7nyd5dtMzgGz1mTGVgiobOoR/7YhAG6VLLGIfIqQajiqp+0uIYrw0H5psuRi8u2jT
         T8DcmFHaDwlRoCciQEpOgQaQTgexDSb8ba5JRTGOh4jrNfT0XPEDjzIBYEC4e72NynxR
         G2JdCzVESao297VfRLpmAlcUnfVIrnHQGcAoHaasxJHQpsHuuqVGVl+TFlTtjKT0I9Qw
         Ws9DBfC2ImmXoFMhD3MPtHC8oODLo8JeAmAe6XThkDYwStEG4fAog6MFg7gVC5XPkp7l
         bL5p1PtbHw79lgQt2Zm0BpTKtp3NV+LM2hUNCF1LObcZTASGhOomjRYFd13g/gobOTL9
         bJmg==
X-Gm-Message-State: AOJu0YxttKZmlFqYgaZOvOrklnutgxqnX78CILAvoyH6M4BhvNW4wFMq
	+lIVvbjgyXZKuPbV0XwhuwouAC68PBcx3KLd1Bq0QAMGVDDzFhBVNPzEwnuKO/UHjw==
X-Gm-Gg: ATEYQzzDPqWfqFCMDntA6/b3xqy3ZuYB2Jg6vir+jfSbP1S/mbg8aYngw0gegfnyDXx
	8QPmZwkeSdw6k0SAE8n5875SjAFDn7WUkAQu8/L5hUJJBRL6vTveQQ1pd1pO9+uNSWBra9jOZye
	w4FbIsR4ewLosoWTdQmE7aoCjdjlg6Zs55+jBrGz7mq3/619fxrUTEEhUA6xJxKfpn8Sjv6ev1j
	e5BVDecEiO57qqxQKrTd47763ERlQya4PV/GzYOHfjFw5tLRbxVkDYLexNfsoXkL8RtfYFi2pD+
	4dpNSpUNHFiooA1zCD2XWpAnM1MHN+RmOrcW1tIa1KqURC579LXjWdVc/63G6VeVM9O9umhXF+c
	yPvFKzk1/ITefqU0GMcGgSGwkUoEiBdt5bEovI+cRUdaDFyOFjGSUFxLvvOTn+P6I1oW/+m9Cb0
	6aQy3PmcUCsXkIq0SLXuBerqwrhaEz2SkCp6h2wuS3I9ll0p4QUrrAEUOE8BT17NtbevB+FE5Nj
	SJDAYZY4bWy+7dT2b0PgP71NA==
X-Received: by 2002:a05:600c:c8a:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-4851989f6e3mr88198745e9.30.1772710793790;
        Thu, 05 Mar 2026 03:39:53 -0800 (PST)
Message-ID: <cf959649-139b-4e9a-84ef-f7548edd7f42@suse.com>
Date: Thu, 5 Mar 2026 12:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
 <aahfgDDNVwJPa-jF@macbook.local>
 <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
 <aalD5VRBBuM16pxN@macbook.local>
 <73dd0000-4044-486a-915d-6381d0820cf6@suse.com>
 <aalYScWQQx_vMqII@macbook.local>
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
In-Reply-To: <aalYScWQQx_vMqII@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A343F210B55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05.03.2026 11:17, Roger Pau Monné wrote:
> On Thu, Mar 05, 2026 at 10:20:02AM +0100, Jan Beulich wrote:
>> On 05.03.2026 09:50, Roger Pau Monné wrote:
>>> Since we have the parsing of the ACPI related data done from dom0 it's
>>> not only Xen that needs to support the feature, but dom0 also needs to
>>> know how to parse it.  Or we just assume the driver in dom0 must
>>> strictly know how to parse data from the features enabled by Xen.
>>>
>>> Maybe Xen supported bits should be & with the dom0 ones?  So dom0
>>> would set what it can parse, and Xen would AND that with what the
>>> cpufreq drivers support?  However that would be an ABI change.
>>
>> What cpufreq drivers are you talking about here?
> 
> I was talking about the Xen cpufreq driver, sorry the context was
> confusing.
> 
>> When Xen handles P-
>> state transitions, the drivers in Dom0 would preferably not even be
>> loaded. That's what the forward-port did. Upstream they may be loaded,
>> but they then can't actually do anything (and they may exit early).
> 
> Well, yes, on FreeBSD I simply overtake the native ACPI Processor
> driver with a Xen specific one that has higher priority.  So the
> native ACPI Processor driver doesn't even attach.  I think Linux is
> slightly different in that it allows the native driver to do the
> fetching of the information, and then the Xen driver only does the
> uploading.
> 
>> Coordination is necessary only with the ACPI driver(s), and that's what
>> this function is about.
> 
> I think Xen also needs coordination with the driver in dom0 that
> fetches the information from ACPI?

That's what I meant with "ACPI driver(s)".

>  It's not only Xen that needs to
> report what the cpufreq driver support, but also dom0 would need to
> expose what it can correctly parse.

Hmm, yes, strictly speaking we should tie setting of respective bits to
Dom0 having uploaded corresponding data. The order of these operations
may, however, be at best undefined (and possibly be well defined in the
unhelpful - for us - order). I don't think I see anything we can do
about this.

Jan

