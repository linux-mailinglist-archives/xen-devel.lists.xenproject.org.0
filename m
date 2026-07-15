Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5mO9Jy8lV2qNFwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:14:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A475AE10
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:14:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CRxlTGSD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1362669.1614434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjsrd-0007YI-Ox; Wed, 15 Jul 2026 06:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362669.1614434; Wed, 15 Jul 2026 06:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjsrd-0007Vr-Lp; Wed, 15 Jul 2026 06:13:01 +0000
Received: by outflank-mailman (input) for mailman id 1362669;
 Wed, 15 Jul 2026 06:12:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjsrb-0007Vl-Lx
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:12:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjsra-00226U-Un
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:12:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5724e4-e002-0a2a0a5209dd-0a2a450bcb60-16
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:12:58 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5724ea-b7e8-0a2a450b0019-d1558034d182-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:12:58 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493f60208a5so42762705e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:12:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a2edd6fsm125291235e9.11.2026.07.14.23.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 23:12:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1784095978; x=1784700778; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJTFbBfr13SbIkACMFxDlZVnlu7ftJbXQQEOl0tOQ6o=;
        b=CRxlTGSDRhObE9Ur4TNVBPkaxK3cZn/R8omRezU0bEd2RUYJHky/EQ0pdV4siyysCR
         BbXpqlYMM9SS0ZyFRpzQFAo/LYdGKB0KLZrRR0maAscVsvL8jYFPjbYDwEyVFCsELhTc
         fczCXQQqf4aY2mQFx9IY6rio4iB3D6MbBJ/2QUv2TA5YuAgXnzO4XL+L7EcUIQIInbT1
         0swUCjcPV62EDa+K0eVRaD+xTxQ3VlWyOgkiPkMpE4r2Apnpty/NykJDWoUxgGeRvBGD
         0GH+XuUjKZ+uMDr5yByvoMARRwWwudddpvO76MvKW9zogAqVeL2sQYdrgMs/aUaea57F
         BEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784095978; x=1784700778;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJTFbBfr13SbIkACMFxDlZVnlu7ftJbXQQEOl0tOQ6o=;
        b=NhBqzwL0aMsO77fYE/85pWTxB/aATcZljwIxWCsfjwYHbDcrvY4KRRWeL468ZsGkeU
         M1hvxypJXGt3mwYiAndkx0/KAOyOJf0HolpeX/mNoPFZAz+/dAfVDNRorVYEaSf/yN8e
         kSOtt26HsLcRjDuOmI1z1ece/Xfmwjodm3paAgMkwJ1AA6QG9xudf67UG//z9aBpAm9B
         pkr+ZHWPAYRP6NhTaQ6F8/bSotQkM3MMa51Z3mfEeThVFa/bojhQH8nM7o0Ar/DnvyOY
         rYa0ia64f21HRIrTfYu+gAyWFnvDnbv/ft4anNBaJDGXfWzkb+7NOWWFRXC37BnX8Oc6
         8a0g==
X-Forwarded-Encrypted: i=1; AHgh+RpoOhnGf6cG/SwnN+kI5H1UML6j905heoLMzbRV3/q5pevE0FSKA4mRKBN/b1zACRuLJ5xzyPU9/7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLWoF9dTXdfDAzOZo034B+0vWpBxuMyK5L+HAcvSyqz+/u1PH0
	0PMgNThLyxpd4ZldPXO9mCkUIRfmSldDdWXUEQ8L4UsUHNzTNfrk1iQgNz7MWY1nWQ==
X-Gm-Gg: AfdE7cke9aio1X8ijZKkZCIcwM5Ep7pp8Qfk59gcZigDXT/zLKY5qKNjwg4BW5DEMFA
	rffRO6s4o/gymHbRWWV85ryieC88k019bRm8kNPXSjY9TBRZhFaZHQSE0pnJrc9dVE0/QVKSGsE
	cKI0bNxFXt87s8LYfMswrfE8VsmVSTIT4vNZ2QDP1acttbPGFLNkewJC87t3erEOAx/iQCkDg7F
	rKVjhsNmWM3c43BIQr8Vz2ljaYcuXGfSnLUli1xofQ8bBliZfc1VmFRlGj9yHUQZE9Vf2Dpf6mu
	b4783Go3igkOI7TX98Qr/ZonprzqjbJdCZj+4OVudU/4De4xenmsz54aZ/nFc13vWC1lKBSTt7P
	hJk1MqF38nGX/5h9oTxdW0/XRjH6hVpjTLBgEwWTjFcUwfbZpAH/mzfTGqPnMKTvwa2s4jBTSTQ
	HZwe1ePtL/Ztj8DjdNEwyYupwWf6r4EaYKXdWHItE2+bCbD1cEjIQoUiGNltosme04pZHP2Oq/t
	E+ocelTn53kDxQ=
X-Received: by 2002:a05:600c:6048:b0:493:e404:3727 with SMTP id 5b1f17b1804b1-4953c27b338mr10343145e9.23.1784095978381;
        Tue, 14 Jul 2026 23:12:58 -0700 (PDT)
Message-ID: <199ad904-79c7-4f7c-b856-44ad68fed49c@suse.com>
Date: Wed, 15 Jul 2026 08:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
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
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-6-taka@valinux.co.jp>
 <OS9P286MB7222D458C3248E908695F2DB82F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <OS9P286MB72222CC8A5C8B0E329F8A9B082F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB72222CC8A5C8B0E329F8A9B082F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1784095978-19EC69EA-75ADD161/0/0
X-purgate-type: clean
X-purgate-size: 941
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: E92A475AE10

On 14.07.2026 23:30, Hirokazu Takahashi wrote:
>>> diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
>>> index 56fcfa4945..e6dea527a6 100644
>>> --- a/xen/drivers/acpi/topology.c
>>> +++ b/xen/drivers/acpi/topology.c
>>
>>
>>>  int __init acpi_init_cpu_topology(void)
>>>  {
>>> +    acpi_status status;
>>> +    struct acpi_table_header *table_header;
>>> +    const struct acpi_table_pptt *pptt;
>>> +    unsigned int num_sockets = 0;
>>> +    unsigned int num_clusters = 0;
>>> +    unsigned int num_cores = 0;
>>> +    unsigned int *socket_map = xmalloc_array(unsigned int, nr_cpu_ids);
>>> +    unsigned int *cluster_map = xmalloc_array(unsigned int, nr_cpu_ids);
>>> +    unsigned int *core_map = xmalloc_array(unsigned int, nr_cpu_ids);
>>
>> These have to be xzmalloc_array().
> 
> xzalloc_array()

xvzalloc_array(). And the others xvmalloc_array(). See the top of xen/xvmalloc.h.

Jan

