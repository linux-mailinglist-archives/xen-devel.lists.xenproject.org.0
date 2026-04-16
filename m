Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGRpJVHL4GkdmAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:43:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921840D978
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283256.1565533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDL7Y-0007Jz-3Z; Thu, 16 Apr 2026 11:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283256.1565533; Thu, 16 Apr 2026 11:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDL7Y-0007He-0T; Thu, 16 Apr 2026 11:42:56 +0000
Received: by outflank-mailman (input) for mailman id 1283256;
 Thu, 16 Apr 2026 11:42:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDL7W-0007HY-39
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:42:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDL7V-00CywG-8T
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:42:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0cb27-bab6-0a2a0a5309dd-0a2a45069736-44
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:42:53 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0cb3c-7371-0a2a45060019-d1558033f03c-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:42:53 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488d2079582so73607185e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 04:42:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f4d92595sm32097165e9.0.2026.04.16.04.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 04:42:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1776339772; x=1776944572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YYzOnfHsTvz6Oyt/Fh6G2zEZHHKphq4116UI7fduRD8=;
        b=KEwMUWIsEVjWQB0e7elH/h84S3/raMeBSxaqr4UiACvqPc1W3+PQLcfvbVNEwRkxMb
         a1zKQ/4F3dW6hHLaGhdeBvLTCAQL6UuXZXkQp/sk5sjqe2bsoTVFsW3IBnYS6M1/jXGN
         QedJUfrk/ibP4HfYeTlTJoc17RH3AMAZAvMSwAg447I9YM85ED8+rxnoXad150oqBNS/
         /A5K9Rmkcs9nhEHn7kgbbtjVFqdNowbAyU7wXSVpO1PYIPOnptOdVxd7iJ3rwARQ8xBL
         gCYgZQE0yM9qO9xtIpymZbli1/hTiWt9ZJw6BKuh+FM2l9Ux4pzwUIvso43iXKx+gKEs
         g1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339772; x=1776944572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYzOnfHsTvz6Oyt/Fh6G2zEZHHKphq4116UI7fduRD8=;
        b=CL1CtlurgWurJGAlQ7hlSSA2Aul9GY0045/rvOmPL5aIZ8bNWrJYnyhMBmYrnTwkh1
         6SF6dP8Zx2tSkEcitEe0WXoDkfbvh5GNB8PIIg/420MX6PrF6yUtiNV5cxGdsBm6a3Us
         oX/rgOTZL5cQ5OUFcpo16mczEj2ejLIS50YlCPnxnhewtahcurtIcFwHI/vPJrLv7442
         B2at3TZT99aVs06UXnAH2RtrZ4h4GzgvzMWQaH8df3BPdLQoBNnwkiAdRjpKeq2SxUcv
         ZtrMgI8NXWkqc+S08WgitH4FZYO7h+MqpIMjBVSYBNAKgV8TdJhUk8V1zb2EEkhIAidZ
         8kvA==
X-Forwarded-Encrypted: i=1; AFNElJ+EJjNmWb0EWYKKnpJvB1om3bq5E9cGyRxEXAMOXxZLTUNTMOFPd1xww9uQ6Mei/f3LVdXgbKxxxGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN/sIf+BYatdfzIFc68F4vvqGccVxp6nDMLlviBTZ0E/NgVcDx
	t4T3rTPaE0LJRJMgfxzZ0j3Xvs08SESvVFJvMpwmFcoWnRy0Tz7DBvTSrm7BLIML0w==
X-Gm-Gg: AeBDievDH/fXS3RwxnWqWFDyvvERA7gfZE4LwG6MkXTf4d2aD0012de/HTcJf3SOYsW
	eiDAZ3fazOydaiJ9dNQ0JIA0lESiqFepGotUy1LWVHg7zPgB5jb87yuVZO4+QL/pF6/APRyma5R
	JazWPfAjYnnQrfemx0nKFitwftwSUYHaT2n6BuxEhszmWKAPj4mwNya88Gx5V5VD3v2Q4OWV2Pa
	QAuNl4OQs4Gd+ZFO7MMSEMOJ98eR20AJQHyUfDuMDdZB5eiXUPQDT7y/jpAFEjs74nRjFXmV/WA
	wcQv72BESHBPQO6otyYOmlr0cp1k47lqURwLzcpUMZPtk5xQOEIhOMhxQ0FEJcg69NZzW8HDxxL
	3NcnaQgTG62kMcFLVfge5voGxvl742uXG2v2gnuP7Isu7XPCZbifIsvgztYfLXkS+Mrl2HS/lzs
	a2L5CxklOIGBRVTl8lLAFnZJaBorHta7p7q2eOrHjz02pZw+QWk88+9UvM7qXB8kKbFmjxL3gfq
	FKnitfF3WrRMOT9f7if+yd1dg==
X-Received: by 2002:a05:600c:a109:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-488d6843245mr261850735e9.16.1776339772521;
        Thu, 16 Apr 2026 04:42:52 -0700 (PDT)
Message-ID: <953a4d7a-95a0-4a11-b236-efdf21eb125c@suse.com>
Date: Thu, 16 Apr 2026 13:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/27] xen/riscv: generate IMSIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8154eae081d14da89f27bad581270cc5bba6ccfc.1773157782.git.oleksii.kurochko@gmail.com>
 <93e8407e-cff0-42cc-8cfd-2d82f536a886@suse.com>
 <b2c8e859-a91a-469f-b674-0942d240f0d9@gmail.com>
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
In-Reply-To: <b2c8e859-a91a-469f-b674-0942d240f0d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776339773-91079D75-497DC4A3/0/0
X-purgate-type: clean
X-purgate-size: 1873
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0921840D978
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:40, Oleksii Kurochko wrote:
> On 4/1/26 5:05 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> Guests using the IMSIC interrupt controller require a corresponding
>>> Device Tree description. Add support for generating an IMSIC node when
>>> building the guest DT.
>>>
>>> Keep a reference to the host IMSIC DT node and reuse its compatible
>>> property while constructing the guest-visible node.
>>
>> Again raises a migration concern. Presumably a guest would then be able
>> to migrate only to other hosts with the same compatible property.
> 
> Right, but I don't think we can do too much and it is the simplest 
> approach just to migrate to hosts with the same compatible property.
> 
> If you concern is about DTS property then for IMSIC it will be always 
> riscv,imsics according to the RISC-V DT spec. (IIRC, the only other 
> option could be qemu,riscv). Actually, I can just hard code 
> "riscv,imsic" explicitly instead of re-using of host name.
> 
> If your concern is that we will migrate to a host which doesn't support 
> IMSIC at all then we should or (a) don't migrate to such host or (b) 
> provide an emulation of IMSIC. And option (b) would be terrible from at 
> least performance point of view.

That would all be only a secondary concern - in an IMSIC is needed right
now, so be it. My primary concern is with inheriting the host IMSIC's
properties.

>>> +static int __init imsic_set_interrupt_extended_prop(struct domain *d,
>>> +                                                    void *fdt)
>>> +{
>>> +    uint32_t len = 0, pos = 0, cpu, phandle;
>>
>> At least pos and cpu should be of fixed width types.
> 
> I thought that uint32_t is fixed width type, isn't it?

Oh, of course. Problem being: I meant "shouldn't". More generally, see
./CODING_STYLE.

Jan

