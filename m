Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TmrnBBLjUGpp7wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 14:18:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BD73AAEB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 14:18:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VRi+Gb2D;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359250.1612916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiAAk-0005bn-I4; Fri, 10 Jul 2026 12:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359250.1612916; Fri, 10 Jul 2026 12:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiAAk-0005aK-EX; Fri, 10 Jul 2026 12:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1359250;
 Fri, 10 Jul 2026 12:17:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wiAAi-0005Xi-HG
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:17:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiAAh-00EoQy-U2
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 14:17:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a50e2d9-bab6-0a2a0a5309dd-0a2a450cd974-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 14:17:35 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a50e2df-e897-0a2a450c0019-d155dd31c0b8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 14:17:35 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4758b2a9e2aso547310f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 05:17:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d91bsm65135404f8f.4.2026.07.10.05.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 05:17:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1783685855; x=1784290655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvL3X7ntCzt2Ukjh6/5LQFSosVpUWEd5AecGCKMMJJ4=;
        b=VRi+Gb2DwAMMZpGbwgktuSHMMiDeUYgZo7T8N9H6M4KBjDxyale9bnZKPwv2qlZO23
         61nSdJFgbZWqq7vbeWQ4fwEzaUR+lwQlJJD6yEahEJnm5UFZCVa7GUiA4zSEKNhLD7Cb
         YMomvHWZqG0OGMfeLXcVaw/j71wZQfpeip2J1AKM7+9S3mKFsJCvjjQf0rHSnE/W4Vcv
         2rzLpEBaSQmm4cmVgh/62hUnSyFH3Z+EpwDVffWD9UpgnyWKrni9aaTL9tFx2/4J4vAO
         0nixiUQHFffzsJlKOgfM50SB4yw9W/r4lFOI4+Xw7zSLzojo5Q2jOBMNDAQ+n0yogqdj
         ZDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685855; x=1784290655;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvL3X7ntCzt2Ukjh6/5LQFSosVpUWEd5AecGCKMMJJ4=;
        b=Z4Hy9fKrMN2bnVeeSLiAWeYP7N3s0iQKk3m4SqfwpWuE6WObEFDizyP4IbwDRfY5Cg
         LvJ/Oeuk1Zl5GQJMT+RQNHPYSg3t6AZQCQDCY6Na+GygkN5rsCDO/7GDv3MwIVw/hnQ0
         K3n2251/5S1H7iHQNrdo5tmOxeuMVHLilItlmBaO+KaGGNx/uB52tjLJNfMc6ao0Mhyq
         /gt/gW3+ALGZf3pkmJqoj3NTf8xhFJs6XDl85MkhwwAFlshB4EwTQC9ElcPoIxIUsV5b
         tDr5CVYshBwTDntcAC2bVc1DoOBVHTwcLUeYBm4ouOY0N7sKX/uL9ZzYAYQdcQGXVTWi
         DD8g==
X-Forwarded-Encrypted: i=1; AHgh+RqDQfIfgdRf91VbNR56xneijjvihcVzsw5Z9n9DanMmP9ZL+fdnk2kriwhoo/ymE5kHg7SG8LcEka0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMv1ALvfyD5sRwXkgdqb2dl5OpVPbhXho9nGdLYirWrXTBPl2U
	njmvNDa8gECsAVfqs+wNNPnrgsw6XdkRLCEXvot7cCvULwGIn2mGEtkycFVYbbbCpQ==
X-Gm-Gg: AfdE7ckNASlBRCwMgL9oZ0/Cjb3yua6/NZjJiXSaaVRMyQxxZJX5zfTp5f7kfa+wAOj
	Sg6C90W5Xgrt/FT6gGDmTExw8t8VcNNiIQ8OyrpGksHhd2cPqgsB/JY58BkvUn+I+nBz5vdIuMd
	a81Y6Mn6lUWZyVtvTLHkbsOVHOrWYdR9JvSf/0JqwzLQ4dgIR5ncHiOqdRDIWM/MBL7f8w3cBk8
	J+jw2jxnQE3idrBCerfCp1YzHDCXbrW254eyiiAQ4Ptq1RaEuh6Y1ArOdmagDrlgsQIKMNcpvO6
	7KI15TrpIAXwX/pTlA/T2ayMpgBSQIEBiFo+gvf8OQub4AJwhLf9Cvx4+BRcVcvPnJR5BnHsLJ3
	ZouRlQan5zzw1xJg5CNvA70tdnLAgxnUfpC9V/KryK0Nl9Qte+6bhRnA+UILRMZCjx2BiNCYS+1
	USZLtblycDzdnnhkfwp3SKUzKjMGs944gWG+6nyw3KSJ+DkmgjhVgNLqADqtIziAdAc0DOME45s
	RSH
X-Received: by 2002:a05:6000:4027:b0:47d:e548:9b2 with SMTP id ffacd0b85a97d-47df071b752mr12095623f8f.2.1783685855288;
        Fri, 10 Jul 2026 05:17:35 -0700 (PDT)
Message-ID: <a3421fa5-e2b5-432b-a40b-23df1d4f1675@suse.com>
Date: Fri, 10 Jul 2026 14:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm/acpi: Parse PPTT to initialize CPU topology
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260709220552.646462-1-taka@valinux.co.jp>
 <20260709220552.646462-5-taka@valinux.co.jp>
 <227bbc38-2d32-47c4-94cd-e80c2574f0b6@suse.com>
 <OS9P286MB7222C86952E041B984DC5F6A82FD2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB7222C86952E041B984DC5F6A82FD2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783685855-466F06B2-99856AB9/0/0
X-purgate-type: clean
X-purgate-size: 2529
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid,xen.org:url];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C5BD73AAEB

On 10.07.2026 13:59, Hirokazu Takahashi wrote:
>>> --- a/xen/drivers/acpi/topology.c
>>> +++ b/xen/drivers/acpi/topology.c
>>> @@ -5,18 +5,90 @@
>>>  #include <xen/cpumask.h>
>>>  #include <xen/init.h>
>>>
>>> -/*
>>> - * TODO: Populate the topology information by scanning the ACPI
>>> - *       PPTT (Processor Properties Topology Table).
>>> - */
>>> -void __init acpi_init_cpu_topology(void)
>>> +uint32_t map_cpu_acpiid[NR_CPUS] __initdata =
>>> +         { [0 ... NR_CPUS - 1] = INVALID_ACPIID };
>>> +uint32_t socket_map[NR_CPUS] __initdata;
>>> +uint32_t cluster_map[NR_CPUS] __initdata;
>>> +uint32_t core_map[NR_CPUS] __initdata;
>>> +uint32_t thread_map[NR_CPUS] __initdata;
>>> +unsigned int __initdata num_sockets;
>>> +unsigned int __initdata num_clusters;
>>> +unsigned int __initdata num_cores;
>>
>> static for almost all of these? And please place __initdata uniformly,
>> between type and identifier.
> 
> Okay.
> 
>> For large NR_CPUS this also looks to be adding quite a bit of data. Is all
>> of this really needed?
> 
> The map_cpu_acpiid[NR_CPUS] array is required. This is because acpi_smp_init_cpus()
> parses the MADT and populates map_cpu_acpiid[] with the discovered CPUs. At the
> point when acpi_smp_init_cpus() is called, the total number of CPUs has not yet been
> determined.
> 
> The memory for socket_map[NR_CPUS], cluster_map[NR_CPUS], and core_map[NR_CPUS]
> is automatically freed after Xen initialization completes, as they are marked as __initdata.

As is map_cpu_acpiid[]'s memory, sure.

> Therefore, I am not sure if there is any clear advantage to switching them to dynamic
> allocation and deallocation.

I wasn't necessarily trying to hint at dynamic allocation, but yes, that may
be an option. The main point is that, as previously indicated, the number of
NR_CPUS-dimensioned arrays we have would better go down, not up. While here
it's memory that's freed post-init, it still grows image size: This isn't
.bss-like data; it's .data-like. You may want to take a look at the BRK
allocator (patches to have it in x86 have been pending for quite a while [1]).
That may be possible to leverage here (requiring it to become generic though,
not x86-specific): No space taken in image, but (almost) arbitrary amounts of
space reservable at build time.

Of course, none of the above eliminates the request to try to get away with
less memory overall.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-11/msg00390.html

