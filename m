Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2XcQGEwPIGoFvQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:26:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE313637048
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RbOvwOOL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326100.1591539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjjM-0003L7-0d; Wed, 03 Jun 2026 11:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326100.1591539; Wed, 03 Jun 2026 11:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjjL-0003Ji-UE; Wed, 03 Jun 2026 11:25:51 +0000
Received: by outflank-mailman (input) for mailman id 1326100;
 Wed, 03 Jun 2026 11:25:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUjjK-0003Ja-LE
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:25:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUjjK-006vsp-1l
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:25:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a200f36-e002-0a2a0a5209dd-0a2a45048a16-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:25:49 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a200f3d-1dec-0a2a45040019-d155dd33ede5-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:25:49 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so4852470f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 04:25:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d40sm6805355f8f.26.2026.06.03.04.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 04:25:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1780485949; x=1781090749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=moFCCAgYhjKweozD1SlfLOc+FWpGyfbnwGe3FzqlL6g=;
        b=RbOvwOOLepYnP/9E0VfTqoUe94G46yYVlAYA0giGddwukC5E5eqEx3Gmur3/OH7iaA
         6jLUZaHnFCKFhqJWLar+trXh5k08XuGZOnptaRq5TfVbybGGYUysJ/5wXYRfTkvOA/NM
         uLr4I2xKAqT5dvWWa/PvVSdnPew1gKzkkzQE/52g+oTm8lVl7nLiCOZP546XADm4K487
         2Qx83vH4OQMsRbksSzDsFYA4Y5z9fiVo1yTFxANo52D+ykJaUprkbXIEQgGCRHoXvY8x
         10/KCXV6SltndGk8geg1N6+zEKm7YlsDgxoUtIvITZV2CQ9Asb175NyaFPnyBT8OUq8J
         RXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485949; x=1781090749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moFCCAgYhjKweozD1SlfLOc+FWpGyfbnwGe3FzqlL6g=;
        b=rxC7EtBmQYbmx10GrsAVaZhYDyZ+adb1Dme4hwB3KaJYB/FA3F0Hw9oD5LcQ0MSCL+
         wUQ2Mh3gQkjwISELcYY/LDYwirDox+XyV9ZhE0pjw3KZHNbUWSwTs17Z4w5RR3tnU6x7
         9TtGXmFUegI20uw5LlOLkvMr7NIxm7LgnubCtshgT5hiq/VLNDw5Ke8xvK/Z4GpZmaw0
         jGCrCjDex2agrNI+fWrWqGvrbjtYy3PxQ/QK3rPEiJIO8186ImoWrolLFDV8sqVroU4U
         cvmzUoQPO1jTbEurn/PtY5EWafk+YcJGP/G1Drt4PgeFhEzjhK7wwpRUeCFbzHm1bW7Y
         498A==
X-Forwarded-Encrypted: i=1; AFNElJ9SWbMhCtS4+jZcHk6ZM2njdwNUnLWHL2EBNPomz/ZFnanLtZt+/vMbGPj+Zhws5l2fQBnXDrxOO5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjZgKPNdMxI2OZ+qE7mmBqoShpmv3fj98Bn4L/tSPJvkYHsJxS
	G4O+ixlZLsgBh0RM8c97m5ND8Bn3HDRH7hsWxABiVnNmfIZayCISx61aHEnW8ELi/Q==
X-Gm-Gg: Acq92OEsTPIGWU4OmYry/F7QcBtBfHOSV+AH9Cy3qsf3TXFoF43JUi+W9+p11k6hAzW
	H3jDERld/oEIZCK8lxgEH2Ks1aXIOmzoKzAn1IsVEJtGIWYq3cBf1euBMmqC0hVTnLmT3wk6Gh3
	BTKM6RRaYk64v5Mz+8IbSFsFSJk33r/jOygWt8x0wSdRZbtahfW1Es//uXnEMl8ULvKpXeN9luP
	FEz63dIsHjohisJBbUA3LGa+/H48+CBjinL1ksHzZZbD5t0Av4Y2esMqJ+nBmP3hOBrQFv1xoKk
	vE/RUACjYSn75EzKxXDMs+m+4YUuPTEntQd56r/sgyTko42jNkANc/i2xuR6Jal/A1oDxb7zoIb
	YfjpqAFdTBi2av0I6FCo38FFIuVAPB08l/1fKzlOJH+du2OwJG0vqK8wX7RiI+OAAYB2HWHm8jG
	KD3QTv++tr1HtyxpRD7UgxAtuyff7+HKgFs90tah/2ZrNjoorWpHqrRg+Bga/E3BcOiew2qkgx+
	o7/KW7OVT7hXNPwrKqgDnbDqGG7JW0P1+1I
X-Received: by 2002:a05:6000:18ab:b0:45e:a0ab:8bcb with SMTP id ffacd0b85a97d-460217de189mr4683743f8f.15.1780485949401;
        Wed, 03 Jun 2026 04:25:49 -0700 (PDT)
Message-ID: <2de402eb-fc62-44ec-bf2d-73db4afbc0f7@suse.com>
Date: Wed, 3 Jun 2026 13:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
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
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-8-taka@valinux.co.jp>
 <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
 <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780485949-2AF653FF-A240A9AB/0/0
X-purgate-type: clean
X-purgate-size: 1205
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: BE313637048

On 03.06.2026 11:59, Hirokazu Takahashi wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/cpu-topology.h
>>> @@ -0,0 +1,42 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef XEN_CPU_TOPOLOGY_H
>>> +#define XEN_CPU_TOPOLOGY_H
>>> +
>>> +#include <xen/types.h>
>>> +#include <xen/device_tree.h>
>>> +
>>> +struct cpu_topology {
>>> +    int thread_id;
>>> +    int core_id;
>>> +    int cluster_id;
>>> +    int package_id;
>>
>> Can any of these go negative? If not, "unsigned int" please. Iirc I said the
>> same elsewhere on v1. Please apply such comments throughout the series.
> 
> These members can actually be '-1' to represent a missing entry when parsing the Device Tree's 
> 'cpu-map' node. 

Yet that sentinel doesn't need to be -1, does it? Any unsigned value greater or
equal to NR_CPUS will do, I suppose.

> Since I imported this directly from Linux kernel 7.0 (specifically from include/linux/arch_topology.h 
> and drivers/base/arch_topology.c), I would lean toward keeping them as 'int' to minimize 
> any divergence from the original Linux implementation. 

Linux is quite a bit more lax though with use of (appropriate) types.

Jan

