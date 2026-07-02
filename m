Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id chOYAfT9RWotHgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 07:58:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC86F3A6B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 07:58:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=REAIZwyZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351196.1608432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfAR0-0001Ug-OP; Thu, 02 Jul 2026 05:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351196.1608432; Thu, 02 Jul 2026 05:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfAR0-0001TI-Lk; Thu, 02 Jul 2026 05:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1351196;
 Thu, 02 Jul 2026 05:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfAQy-0001Sm-Mr
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 05:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfAQx-00CPab-HF
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 07:57:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a45fdcc-2eae-0a2a0a5409dd-0a2a45079380-46
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 07:57:59 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a45fde7-9c8e-0a2a45070019-d155dd33d41d-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 07:57:59 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-474303f3c72so908432f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:57:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dde1ac93sm5635845f8f.28.2026.07.01.22.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 22:57:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1782971879; x=1783576679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/NyaO5/jf5biTznVAg/QZEVh5d7siFZRqfaOo28a5FQ=;
        b=REAIZwyZRreMWeL9WSLiQsTCkQVXnavNILNfavc+4oEjKK4+EhNHThMfw0XJapPUBp
         ezjdLewjSZHBwVhE/fygBEbCBgIW6PciNwkfavmrbFf3Q/BVmM6Iu0ci451A4241buav
         BGavKQcorVA9sUAFn0Q5GbPpN/K2UAi0Zpme244Jr22W4vlUNXHTBSmiYV7jQnxS4rvG
         Y6xM6+1T1VLmUbm/UGJ9kz4wTRQvrVRc/Wvtw7B0FmQVf3QcCl7w9d17X0ebTPHnIj9w
         IP1Cq3oHFqxHJ8dk/SCwkyDykDrO8Vwt1nMvBt3N1o0jeuTdfcHJmL+/FUw3dj9Wj9ve
         /vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782971879; x=1783576679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NyaO5/jf5biTznVAg/QZEVh5d7siFZRqfaOo28a5FQ=;
        b=RerCjbNUJIRszgOYW+DtQh9P7vJOZbUX8PgEjImrQEb9nIAdfqmkVS2Q0s0HXOA8TI
         aIMOp7/9p4RFtJaIhXJnQpf9l/EUA0W81aS4LAwA1S4j2Dg94KJmL4m8Y+jzRSLt9ov/
         FS6kDj8AC5/pEstHa6s0UwCVlq7cY8sDUpIdl1WjcVCnn7jncNQlXxca97LY4J2nwVuw
         C06wZzxXFS/mdSSCVDzoDao1CzHDHRf5NYSSjkngfMtzBQJYWCAgiuLkIdcMgWsgvtI4
         lcnUMg/2ZwNylzLGfwZA+SSKxTRtaHtT2FlmKuWTk6RstAgnwL3uPvWFXpaAtzM/h0DZ
         OZ2g==
X-Forwarded-Encrypted: i=1; AHgh+RqCwRBnIISW9wiB84wUy3eOCnIyOgOtPl7SR7bdnhxKn4s7AnFHnBmOei/BMziAuN91sRncXXoI/YY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8Uj3JCCyprW3DmyRqIBkFb40GNDi6RwQodFwCk3zZ4EDHpI0J
	FwJI1SoTOrPKyrH1X2Gf4IhqP2Esi1Q+Y6Eat9T/eXiqTKMMolW6C6NYhhyoMOUpNQ==
X-Gm-Gg: AfdE7ckOpQoMUiMZEu1U8Mf27V3kM4KAH3pIgKQXyt7HQGnwqjZaP9VjHNam2rjCpn5
	hxG3ojwfltd6Ivn50vwS+943ZEFpsuDb5xxu7xtcNRKWgAMYOio7gMKegaiPcnIwWMPOtOHj4xI
	lFzqwrX5ne/iA0dI2myMrfP2hV6SimXfsrQZHPSw65S7iQcyiRxH0CZz7vsMwIKVxhguLb9YfF4
	GpvX4hcDotXgxrbngMc1OMe64sZVg2jpnPftigi93DZi9KcBL4smijcSTKeh+/cow9Q/6FFz9b4
	dXEpC9Q+xMoysbv/E+TCoYZOHm1GJDuZiwHyAmEch/1JlZii03DZMkeqoQxCwUW4Lwr7Op0y0DP
	ON9YKmiq83MpICrS/Nf3sd2pMmdVNdzfzkVlefPIY2kgR3YEagyhDNkhOac/PnGWVMgpWucmpYj
	OZ3fzZxOF3ss8iI0KfwheJqGo69pLODnmYSos9T7/Xya5PLmXn1m8u5d1+TcTsgiAGgcUcP3UHR
	Qp3
X-Received: by 2002:a05:600c:c04f:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493c2b3a9cfmr43439565e9.6.1782971878958;
        Wed, 01 Jul 2026 22:57:58 -0700 (PDT)
Message-ID: <52d1d0b4-6b90-4eb8-a299-7adcc7634f33@suse.com>
Date: Thu, 2 Jul 2026 07:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <20260629215806.11610-2-taka@valinux.co.jp>
 <97dd9fd5-c0de-4125-a40a-b7f6e1aed27d@suse.com>
 <OS9P286MB722293D7D09513349055BA4B82F62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <a69129b1-f16b-4ce4-bf88-971f37eec418@suse.com>
 <TY7P286MB72346237AC47028E012D145382F62@TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <TY7P286MB72346237AC47028E012D145382F62@TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782971879-7ED3C25E-2DE92A09/0/0
X-purgate-type: clean
X-purgate-size: 1427
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 5DBC86F3A6B

On 01.07.2026 22:28, Hirokazu Takahashi wrote:
>> On 01.07.2026 13:11, Hirokazu Takahashi wrote:
>>>>> +#else /* CONFIG_CPU_TOPOLOGY */
>>>>> +
>>>>> +#define cpu_topology ((struct cpu_topology *)NULL)
>>>>
>>>> Why exactly is this needed? It very much looks as if its presence may hide
>> bugs.
>>>
>>> In the current code, the condition if ( cpu_topology ) is used to cover both
>> cases:
>>> when CONFIG_CPU_TOPOLOGY is disabled, and when memory allocation for
>>> topology table fails.
>>>
>>> The next patch uses if ( cpu_topology ).
>>>
>>> static int setup_cpu_sibling_map(int cpu)
>>> {
>>>     if ( !zalloc_cpumask_var(&per_cpu(cpu_sibling_mask, cpu)) ||
>>>          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>>>         return -ENOMEM;
>>>
>>>     if ( cpu_topology )
>>
>>     if ( IS_ENABLED(CONFIG_GENERIC_CPU_TOPOLOGY) )
> 
> This line should be if ( IS_ENABLED(CONFIG_GENERIC_CPU_TOPOLOGY) && cpu_topology )
> because 'cpu_topology' can be NULL even if CONFIG_GENERIC_CPU_TOPOLOGY is on.
> 
> void __init init_cpu_topology(void)
> {
>     unsigned int cpu;
> 
>     cpu_topology = xzalloc_array(struct cpu_topology, nr_cpu_ids);
>     if ( !cpu_topology )
>     {
>         printk(XENLOG_ERR "Failed to allocate memory for cpu_topology table\n");
>         return;
>     }

Ah yes. The odd #define can nevertheless go away, which is the important part.

Jan

