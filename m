Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kt6uFgMBRWqu4woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:58:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21036ED067
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:58:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Ji54BCgi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349887.1607521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetad-0004Tr-As; Wed, 01 Jul 2026 11:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349887.1607521; Wed, 01 Jul 2026 11:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetad-0004Rn-7V; Wed, 01 Jul 2026 11:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1349887;
 Wed, 01 Jul 2026 11:58:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wetab-0004Rh-BH
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:58:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetaa-00AiHv-GG
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:58:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4500f1-2eae-0a2a0a5409dd-0a2a4508b5d6-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:58:48 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4500f8-edec-0a2a45080019-d155dd33c89e-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:58:48 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-475417f010dso358136f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 04:58:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636d2cfsm18350828f8f.17.2026.07.01.04.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 04:58:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1782907128; x=1783511928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VCBBlBIZ2fRRtURovQCiNJjBxSs2iUUYs/xeLtP2pSs=;
        b=Ji54BCgi9FyjrWIeSbS78GcgMXzS9dq43gTruqg8EZBxVQ0pW/6QOXkNUYZrWzOC2C
         lAiBIF40cWzOwbhNBLskr/yW8nggf4/UJPz6qTF9xU+pMyaIeiaEzl8FhPeNOKRZ/Suu
         B4hJc4uS1/0mCn0uOjoTXrkKpwWz2Kz5co/cqRr1FnsEsTPHyw9/eUB58GbwGpsVkgkW
         yRAD802iDvKP9rVY5fbJMYG/Y6K8loTaGRGEznP0BmBFhbs48+tAkSVRl3WjrbkW75pF
         TUk+GWNdrfUnBRjOlEON0yzGh+1F8pmi/D4r92V5tLP0XmJ465vWHUYkCAr7GIhOerBk
         fqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907128; x=1783511928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCBBlBIZ2fRRtURovQCiNJjBxSs2iUUYs/xeLtP2pSs=;
        b=BWPcrytAgkt3uTVxofQb8U521+TPERwB3vkubFDoH5+7anLS5I0copAZR5fX/ugNJp
         K0ezPw7/ADhmVnxFQPpCXrQe9BuaQE5K5DLVC2T8c1gt2Cero8p3F5qXmChroBKKywQM
         Cx4BNMB00KLk9dfLaIj1Di/Fe/plvkt+DyBjlit39B3auueSAeY3UklZAfp04fMHYopo
         PAOlGrCp5gQfT0GcESALpuFROZwg7HpqV1mIav89StvT3pf1Q5bUfsZjw5nTNIfRyzWc
         oQuiQ9KvKJyPvunlpZdI7X4+vFO9O4bXsMwEpT6zB7/BDgu++2apVP+9TpYHtY+THlYX
         fMMA==
X-Forwarded-Encrypted: i=1; AHgh+RogWqQUwvIOdvJK14ErAIrjn4yZ9tYxOOFbUAsfi9QuWYxHrvgw1WlSX+Hhi93zooMyyxBMYP3OjTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwktVK0OEEGlojT71TxaXez+Dud0gI7++Ro2ZZd4Uav7JtjIQ3Z
	+guV/JjaeaTNBDrsxDTEFyUCXrgjv8YWt3MEKfyjcu5WIc8JZKoJpHen4zRHI4/BlA==
X-Gm-Gg: AfdE7clmlxEguagdXZhG+cGERqz5NFjOfmrFlQ0EA0GX0iYkx8zjeatZjvPhWEnT259
	LLHKODSGHt6hyt4vz+IbcmFte70oqu34HFOx8algOnR1CclqXK2CoQ2FhJ74MMDhAcr4HM+KwWZ
	5bIR6p4ikfiVBpr8HpKPZL2CVgpZxCPRpJe3hi6NQwgdWfgxL/80VpqXK7tFI3qw5YxCQSWmyJD
	jzUq11VLIsk/ZrUVrd6VmlQ8Ucg732aLQnrnmNkOJQQcjuIBN5F+LLK2UixovDHwhH+UyiZjkwY
	zk/zhGPCHGKrLYu6tK3j+sAVyxaMs4z94H1m9yXKxjrcdIx7MdYi8PVZf77FSRURqTPVSejJpe2
	bdfQMNHiB/oPiIWtFIAL4LE0aALenr8LdaJnNxlDjWMmGiOKcCTJVC5eUiSS4MLQi+LGtXbPk/o
	RsHt70VdPPYiTRs1wEsbp8kZJwpavV/dnwKVvG4knwO+fSoWwgctFRrziQryQaGkvi8leQNdAk+
	CjmPuzOySqLb6w=
X-Received: by 2002:a5d:64c3:0:b0:473:da43:44ba with SMTP id ffacd0b85a97d-47757798020mr2295215f8f.22.1782907127866;
        Wed, 01 Jul 2026 04:58:47 -0700 (PDT)
Message-ID: <be262862-2267-4b96-af5e-0379db5208ff@suse.com>
Date: Wed, 1 Jul 2026 13:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/25] xen/riscv: create APLIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <2bab716741ae436c7b92989d7613dac620166b89.1782487661.git.oleksii.kurochko@gmail.com>
 <76b16195-43a8-40cc-9d22-7b9c21e4c8f1@suse.com>
 <7d007b0d-d246-45aa-8ce2-579f36f6d8bf@gmail.com>
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
In-Reply-To: <7d007b0d-d246-45aa-8ce2-579f36f6d8bf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782907128-4293D3FC-65BDD623/0/0
X-purgate-type: clean
X-purgate-size: 2244
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B21036ED067

On 01.07.2026 13:55, Oleksii Kurochko wrote:
> On 6/29/26 5:26 PM, Jan Beulich wrote:
>> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/vaplic.c
>>> +++ b/xen/arch/riscv/vaplic.c
>>> @@ -9,6 +9,8 @@
>>>    */
>>>   
>>>   #include <xen/errno.h>
>>> +#include <xen/fdt-kernel.h>
>>> +#include <xen/libfdt/libfdt.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/xvmalloc.h>
>>>   
>>> @@ -19,6 +21,11 @@
>>>   
>>>   #include "aplic-priv.h"
>>>   
>>> +#define VAPLIC_COMPATIBLE "riscv,aplic"
>>> +#define VAPLIC_NUM_SOURCES 96
>>
>> So for the IMSIC the host value is relevant, but for the APLIC the count is
>> an arbitrary(?) compile time constant? Why?
> If you are referring to the number of IMSIC interrupt identities, the 
> IMSIC node has separate properties for the host and guest:
> 
> ```yaml
> riscv,num-ids:
>    $ref: /schemas/types.yaml#/definitions/uint32
>    minimum: 63
>    maximum: 2047
>    description:
>      Number of interrupt identities supported by the IMSIC interrupt file.
> 
> riscv,num-guest-ids:
>    $ref: /schemas/types.yaml#/definitions/uint32
>    minimum: 63
>    maximum: 2047
>    description:
>      Number of interrupt identities supported by the IMSIC guest 
> interrupt file. If not specified, it is assumed to be the same as the 
> value of the `riscv,num-ids` property.
> ```
> 
> Therefore, if `riscv,num-guest-ids` is not explicitly specified, the 
> predefined value `GUEST_IMSIC_NUM_IDS` is used.
> 
> No equivalent property exists for APLIC, which is why the value is 
> explicitly hardcoded here. To some extent, the chosen number is 
> arbitrary, but I used the same value that QEMU uses when creating the 
> APLIC node.
> 
> It probably makes sense to limit this value in a similar way to IMSIC, 
> at least for now, since the case where the number of VAPLIC sources 
> exceeds the number of host APLIC sources is not supported (assuming that 
> configuration is even valid). In other words, we could use:
>    min(VAPLIC_NUM_SOURCES, host_num_sources)
> 
> Would that make sense?

Perhaps, yes. Just with the constant again named appropriately for its
purpose (see comments on an earlier patch).

Jan

