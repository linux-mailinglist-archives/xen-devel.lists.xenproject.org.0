Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ooZdO+rPKmpoxQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:10:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EE6672F53
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:10:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YFZJ+Wd3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335749.1597928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXh2o-0000cS-Bo; Thu, 11 Jun 2026 15:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335749.1597928; Thu, 11 Jun 2026 15:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXh2o-0000b5-8m; Thu, 11 Jun 2026 15:10:10 +0000
Received: by outflank-mailman (input) for mailman id 1335749;
 Thu, 11 Jun 2026 15:10:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXh2m-0000az-NH
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:10:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXh2l-0030mo-V1
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:10:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2acfc8-bab6-0a2a0a5309dd-0a2a450cbf80-36
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:10:07 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2acfcf-62f1-0a2a450c0019-d155dd33e57e-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:10:07 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-46066e640easo621509f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:10:07 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm77851111f8f.18.2026.06.11.08.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:10:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1781190607; x=1781795407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fsRTffEw0V/KK/MnC8W/EPsNaMjzhPcpDui9mnGJ62c=;
        b=YFZJ+Wd35/LKugEHxQPeuHv1T+l/gvbXQ/LlyCi6dboRyC3WgvpzBH2yyB8KtX15el
         iTm1S5G+1voLdE+VVfC1Rj63fW2FA+5gZe1vv0l0gwAquVnr+yped1/atbVlWEzp183z
         NJqx78z5moCncjlypOAlVq1/q1oORyLfaNX1M8nbKBrOS4pzEXm3zjMZybQsyb4J/T+L
         baAHM4zd3xAi90NwnwNzOrdOFi/Wi0f7fJ32oRyKkPrJaWSy+lZmeuZv0hfX/0gELVs/
         sTGQX1YvanIWCWhbwhg5+VAvMllHwYm0aJ3F2XksyXVBvdofWWTHmT9xTo2KaImZijDl
         k5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781190607; x=1781795407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsRTffEw0V/KK/MnC8W/EPsNaMjzhPcpDui9mnGJ62c=;
        b=mMNMD1IrzP2ODjBTPlCORR0xQ10ZP/+oqPE/e1jauNvrJZedb8AqEDqJRQDESAVy+E
         6pK9AdzdbiB70xUqYl3BLVQwi4r6ffGaEf/wcMgd/7J/qJ86ocDiNbG3uM73IK3TbFzC
         WcbV+QJJj3mxaheh8Bw6nnOFrhrz7E0QmQO4HLqiXN4jHH5W6yP3zuPLicmQhSyqpRgV
         z8hNLR3sEN7YchPR9WmBjRjtrTcHEAoLtBq2quF7e3o6WJe/2jcHKseQUYhJ5Dnf3O3j
         kc5poGxJ6mwIPJG00HV9aefmwQQKkNRlQZxSAE9bSRoadFhvnr7jQ2O95J4JyX6OjSrc
         iP+Q==
X-Gm-Message-State: AOJu0YxAp5DcsKG8tujU3SVWfGs8rHwiOfaTGhcQMSD/2J6RxqVCkusG
	SpVaAvan8aopvgmUjnq7p7O2syeVFVaM6YySu4Ji/db+NzirCq0qywf01R3RXi4zqQ==
X-Gm-Gg: Acq92OH9haXZS8md572zb375XmW+o2op1cI/hjDEBp/FiQCIt9iil8Ttkv3vVMCy5k5
	XihTKiFp3uHw3XDZ5U7B88vmADMIc8Za5vWkrbnFDhLqFM6m/uGoib+OBqUMko0Ly8ya1zwtye8
	f1R2C1ZqvZOvuIRiCyx6w3IsM2yshd1sjVSaANbme1q/0wCkj8/WptWoKonQvHGGeqC5Zry/2h2
	8DXzoVY6Xx3t9amejYPsiHz8SfiJUk4buZI3MlqG13JwYny0mGKjWlTD79tx6c0uROSfQ5tegKn
	L70NutckRnpJL9GKym1Z0zDWJz7TW36BJybenxBKU31AA//IGyUmN01NDZ0VuGve7xIVVP4nCU6
	0N40Qf+fQoqn3nAvB28IhqZGjTEBUktfwESjVq7NPLbbv6bVS04Ry+JarUZhjkZl2xH1MYEBVhp
	CZr/LPqQCya+que04J8Wxx95dR1Br2ZT8gMQ21FTIl0sChnFkrS52SWFm23/ysn9/f8FP4npdIE
	zU/uHZCjnc35zMc+Avyzy0C7sCv7ByPMPo2tGPuXosl8IVuVK4nIqPbCbFCakSRirhrHB6jRbfT
	qkrqqg==
X-Received: by 2002:a05:6000:4706:b0:45e:e44b:313e with SMTP id ffacd0b85a97d-460675b7081mr4887449f8f.19.1781190607191;
        Thu, 11 Jun 2026 08:10:07 -0700 (PDT)
Message-ID: <c5fe814a-ed01-447a-8d48-edf832326b34@suse.com>
Date: Thu, 11 Jun 2026 17:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/x86: Change stub page allocation/free
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260609000638.121027-1-jason.andryuk@amd.com>
 <20260609000638.121027-3-jason.andryuk@amd.com>
 <ail8YNrQLZ9bumiH@macbook.local>
 <085ebfb8-d76c-4a13-8b5b-130959b25b51@amd.com>
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
In-Reply-To: <085ebfb8-d76c-4a13-8b5b-130959b25b51@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781190607-D9F6ACF5-24010A98/0/0
X-purgate-type: clean
X-purgate-size: 1261
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57EE6672F53

On 10.06.2026 17:23, Jason Andryuk wrote:
> On 2026-06-10 11:01, Roger Pau Monné wrote:
>> On Mon, Jun 08, 2026 at 08:06:38PM -0400, Jason Andryuk wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -2089,8 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>>         init_idle_domain();
>>>   -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
>>> -                                           &this_cpu(stubs).mfn);
>>> +    this_cpu(stubs.addr) = assign_stub_page(0);
>>
>> Given stub pages is first used quite late in the boot process, the above
>> arrays would better be dynamically allocated using xvmalloc_array().
> 
> Ok.  At some point I intended to dynamically allocate.  But x86 doesn't have num_possible_cpus(), and I thought num_present_cpus() wouldn't have the correct value.  nr_cpu_ids seemed close to the value, but then I convinced myself NR_CPUS would be okay.

Not specific to this patch: Using NR_CPUS is almost never okay. It's a last
resort if you need a static upper bound. But NR_CPUS can be _much_ larger
than nr_cpu_ids, and hence arrays generally want dimensioning (allocating)
by using the latter.

Jan

