Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1xUOjK3O2oMbwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:53:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8436BD81D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:53:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RPqRPgIl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344804.1603840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLEI-0007HQ-T9; Wed, 24 Jun 2026 10:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344804.1603840; Wed, 24 Jun 2026 10:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLEI-0007FL-QU; Wed, 24 Jun 2026 10:53:14 +0000
Received: by outflank-mailman (input) for mailman id 1344804;
 Wed, 24 Jun 2026 10:53:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcLEH-0007FF-3o
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:53:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcLEG-00AFAv-92
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:53:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb70d-5cb7-0a2a0a5109dd-0a2a4509a5e6-40
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:53:12 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb717-4999-0a2a45090019-d155dd36cdef-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:53:12 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-46cdc80779bso144093f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 03:53:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840f80sm6414159f8f.6.2026.06.24.03.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 03:53:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1782298391; x=1782903191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BB7y3kkJ1RmSo8DWhty0r/OQY4Eur+XE27WeTdN+Z3o=;
        b=RPqRPgIlMtqFfm+EBLX86/VF6B/ELKVgnEKKWiuQPY5OfZBSrj3GpU6PPhPemL8hK4
         IMNMwF7yc2V7HyIEANGTzQORQyafA8qLpJP4bcr8yqEVfJ0+j/K5W2/FZmOX5LzHZUYf
         sNULSUqsMiJ15sITSq3MPsKB5D47rtjEbaXZcjGBVFT6ZLrTMOLYS0/Wjo8TnAISSOsf
         NgzPHfOjajoaEjeotWkQfExJn3kgqP9gRvJ7c8gAJM+db/f671OxPgZxyhqCFy068mdP
         s7OS6rmaxcqhRivfBT+3OX9RrYzr6GYyEw1w9e977XwhLgXs8JzAhPNi5Vja3aCOaFuz
         +qQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782298391; x=1782903191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB7y3kkJ1RmSo8DWhty0r/OQY4Eur+XE27WeTdN+Z3o=;
        b=GWMJjkdDsOWyaL5FoPkYCsP1FTLNJ1z400f8sHkyliNfwL9/G+1xXKfNJZkqtUPdFL
         nZhpoD5WAFNDhERnffFxjyBQsyodcdo12wXviQXndgmdIQObC6ZFTuMOPDa4KhF+VitM
         0cE8RxmmQrpXVZcPo4ECCmWE6T362aCPJCKzkP9gPW7Gt6O4zPD+WCcory/c15m8UkH3
         MA7Q0NjDc+oBahdJpB4ZwPmCN8puWO5hlCXJW6Xj2xU5Jfkv7uXE7N1zIwCaU3cLrNLq
         yxdDcXr4GS8ezFzsLC0V3ltYaemBNjjq7DzSbb13vQZLexE/DE3I+bsVr1yZ8EQghd0c
         JGXw==
X-Forwarded-Encrypted: i=1; AHgh+RpJCDZLzfizax2RDuoTlK3kNCDGFfJe/VS6qvR6cgOzPVo5w6otQ8rbdIhXX2oefqR2nfn5Nj7Ve9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuY6E2/85X9t4eJ6u09GuIU+FEMWkMWUxPoXo3KCsP4h/SMCpH
	1UiBYJACtsh8ST+l008D00fyn5qBDwpvSJsi22BM76JHaOv9SpMwSMUwErjeOUuAUw==
X-Gm-Gg: AfdE7cnUhCjgs54tCmW4BSy+b2HrRbgWNtGjNKd4px1CESU9Su7srVKJGtI7ABhPy07
	4Fcc5034dv7amou1mmzYj62Y1s6f2toGbxN7V8anMwARFbKIWY0DcpQGw3BBy0v3WoDb4lWooSv
	vJ63TQJF/mf5RPyQPdzCxX0+LnBzTQSWbb5wmFebAIx/r6gUvOgw+HsOi+HFmDk2yxdVpZ5qVwg
	U8vkzWX7q47bn7IwZCFLz11wfngDhE/vkytz8TRoZJ4rOIxU/xHI1EXoHD/3/H/mt/5gqfGc2T5
	v6+N/Kr48HOk+Wc2ZfT5nLGnzbM0BCbBOBJOpuKware5ilyPuAOTeQ22yFIFMYoNCcIHpWwnkys
	uri3dKk2r/fSd/n3jd2mNJJdImwduhZeK8FvWsAJBMVS5xZ1PRAyyApKYbBlmJKBE70YPyrdLn7
	oxE8U2Y2pugabxXeSyO3qy+cE5DbBQ8LXtij+s2nbn0JvGCf+L7uo/hMFfvdHhlCL7GSEqiECBT
	Mdz
X-Received: by 2002:a5d:4e01:0:b0:46a:5c0a:74ed with SMTP id ffacd0b85a97d-46c0bb92b9bmr3214217f8f.42.1782298391515;
        Wed, 24 Jun 2026 03:53:11 -0700 (PDT)
Message-ID: <ed9cf5a8-c3d2-49ae-979a-56d2c474b738@suse.com>
Date: Wed, 24 Jun 2026 12:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260617071206.265599-1-taka@valinux.co.jp>
 <20260617071206.265599-2-taka@valinux.co.jp>
 <0c37c031-cc21-44d2-9ef6-4baf6f24d74b@suse.com>
 <OS9P286MB7222059ECD370CD6137B698982ED2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB7222059ECD370CD6137B698982ED2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782298392-731E3744-1453B10D/0/0
X-purgate-type: clean
X-purgate-size: 2617
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E8436BD81D

On 24.06.2026 11:05, Hirokazu Takahashi wrote:
>>> --- /dev/null
>>> +++ b/xen/common/cpu-topology.c
>>> @@ -0,0 +1,30 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +#include <xen/cpumask.h>
>>> +#include <xen/cpu-topology.h>
>>> +#include <xen/init.h>
>>> +#include <xen/acpi.h>
>>> +
>>> +void __init init_cpu_topology(void)
>>> +{
>>> +    const unsigned int nr_cpus = cpumask_last(&cpu_possible_map) +
>> 1U;
>>> +
>>> +    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpus);
>>
>> cpu_topology exists as a global variable only when DT is in use. I think the
>> definition needs to move here (from common/device-tree/cpu-topology.c).
> 
> Okay
> 
>> As to the size of the array, it's not quite clear to me whether by doing it
>> this way (instead of using nr_cpu_ids) we're not setting ourselves up for
>> trouble.
> 
> On ARM64 Xen, nr_cpu_ids represents the total number of populated/available 
> CPUs, but unfortunately it cannot be relied upon as the maximum CPU ID. 
> 
> For instance, if a CPU node in the Device Tree has an invalid 'enable-method' 
> property, that CPU ID slot is still consumed during the initial parsing, but 
> the CPU is not counted towards nr_cpu_ids. This can result in a sparse CPU ID 
> allocation where the maximum CPU ID actually exceeds. 
> 
> If we were to use nr_cpu_ids as the array size here, we would risk an 
> out-of-bounds access under such faulty Device Tree configurations. This is 
> why I used "cpumask_last(&cpu_possible_map) + 1U" to ensure the array is 
> large enough to cover the highest allocated CPU ID.
> 
> Consequently, there might actually be potential bugs in other parts of Xen 
> where nr_cpu_ids is incorrectly assumed to be the upper bound for CPU ID 
> indexing on ARM.

Specifically cpumask_var_t allocations are dimensioned by nr_cpu_ids, and
all cpumask{,_var}_t accesses (including the cpumask_last() you use above)
also have bounds checks against nr_cpu_ids (sometimes only in debug builds).
IOW if there is an issue as you describe it, and if that can happen in
practice, then this urgently needs fixing on the Arm side. This cannot be an
excuse to not do the sane thing here.

>>> +    if ( !cpu_topology )
>>> +        panic("Failed to allocate memory for cpu_topology array\n");
>>
>> I question such uses of panic(): Surely we can do without any NUMA info,
>> it's only performance which is going to suffer.
> 
> Okay, I will replace the panic() with a XENLOG_WARNING printk.

Which of course you understand isn't all that needs changing then.

Jan

