Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eOULIFYARWqL4woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:56:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD32E6ED01C
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:56:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cuk5Kiha;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1349870.1607503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetXd-00036f-Ny; Wed, 01 Jul 2026 11:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349870.1607503; Wed, 01 Jul 2026 11:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetXd-00033u-Kq; Wed, 01 Jul 2026 11:55:45 +0000
Received: by outflank-mailman (input) for mailman id 1349870;
 Wed, 01 Jul 2026 11:55:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wetXc-00033m-3N
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:55:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetXb-00Ahh0-CO
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:55:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a450027-5cb7-0a2a0a5109dd-0a2a4507a2a6-48
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:55:43 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a45003d-9c8e-0a2a45070019-d1558029c1fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:55:42 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493b779003fso2744145e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 04:55:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be810be8sm66929875e9.9.2026.07.01.04.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 04:55:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782906941; x=1783511741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoQ03rLQTdgsOEta0q/3tkgEBYC0ycfrpVzP3Ye92u4=;
        b=cuk5KihaeGk4FnoZCufOPUXjf+BwbZt/ppv6ikSxFtRlAvr7W64c9SU96xU3XrlI9N
         PVgCtMKbTAy/vUOJN/DjGMOng1iYzDxo6p6rmFGkXiaak9WNczxcu9rBs5sOAmHsfBkZ
         dY0RZNCDm8w2wV6YqFy9MKYS6rvwjt4zSYz4u79Al1szkMEK0CdZTP0ed5aKsHom0Mss
         +PvHWzH4Xyx3RgQY/PesLQEO2tPJ6NbHslA0FST1QfFs1ZFmPMKtyoEDNd0R8dLruOU3
         W3S1v9uD+0p+QsC2XIPJXMF3ZOL8P4DKTUWWa80FV5d0r1llGXuRhOmIkBOsae4UaNuq
         BBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906941; x=1783511741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoQ03rLQTdgsOEta0q/3tkgEBYC0ycfrpVzP3Ye92u4=;
        b=YLe7XTZkHPQOT9giXCi/1usSxaeDuG05L+Y0hspslJaTKnxJjD9NGGh2FcknMAWn6b
         6vSnJLrmuUQpLLT6ph5FgmEHq83rqObQv12hqN8kAHnTA2twkAx3Y0bxUsRnrPkt48WJ
         xzJQGuwmFIYnD90cALftximd9h5zjuHjy9KooHrYVW3Ek9b/OddZO1wcxtP/uozUo46n
         //mxwSL8WGy5MAvrTCW4o4A0OzPlq2wc32QTgQqPjQb9SvhR0qR+B8iIsXZTjfiVTQez
         7pzpFT7AdYuYgV+RBWLZK81xnYaLT+oGFdcATHXlqMR/58HLHDc1TQnh98z7LLfwKAVO
         ir3g==
X-Forwarded-Encrypted: i=1; AFNElJ/ciguDN8bSPv9lih1k+ybCPlfRRPgNQ+FyJNvk45ZhqNTCoJ+fuIQ5zZw7POPDkoodG+KkGOZ+ayc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAFuqLURPpM2cLm2z3uzF/QeM9/a82p2MYLzVgYNGP3UAbnVhT
	Tb5t/6qUVK8ugAlXMdrflKUcjaOXq+WreksCBqBIZbOmBc4CDbak1nUs
X-Gm-Gg: AfdE7cksPtXsUQFJ+r44n/ob0iegShqiBc4738LR6usn9xvNlXrThOI0t9IicNLz+H+
	MgxFtXtdDNSo2J/Q8khH08cp8UxqSfXJgqJ8uTa2rUKQD+RbOSdqFMam7dvMat/d1qlTiodA4se
	gVUPo8L2nXeOhCaGLa1H7xkp4jxfVfzpstlKYgqlE2jnjyZzS2aIGVCKbFTo4qXz6/6IFc+tJN1
	RKUX+fBrtQoUGjpZP2uuuARh/nFCPqNDoPOGis1YwkL4fc4/CfR5aC5oMqj5rCwg7TawpKM9t0+
	S7duATrmX+IgtKFspOUt6RH23e2aAHhmKp79+5imsjCPgGgmpnc5E/gXqzlPXHDe/ddCfgUa9T8
	uozwCnoh5U4/OXJJyU0FvBTBmnwUGzMCTUdgjbsraGADqh6QEvrjkQAokD5KkKVj+phR255pYFu
	OLtV7m1XjhJVYfd06UnxW6Rl2Wxor5baYOsEBGWZX+VC5OFR4RbHHjDpC8HMrqnkUJAMI=
X-Received: by 2002:a05:600c:620a:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-493c2b90815mr17550175e9.25.1782906941508;
        Wed, 01 Jul 2026 04:55:41 -0700 (PDT)
Message-ID: <7d007b0d-d246-45aa-8ce2-579f36f6d8bf@gmail.com>
Date: Wed, 1 Jul 2026 13:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/25] xen/riscv: create APLIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <76b16195-43a8-40cc-9d22-7b9c21e4c8f1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782906942-FD12E25E-A0EA1295/10/73395122804
X-purgate-type: spam
X-purgate-size: 3106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD32E6ED01C



On 6/29/26 5:26 PM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/imsic.h
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -78,6 +78,7 @@ struct vimsic_state {
>>   };
>>   
>>   struct dt_device_node;
>> +struct kernel_info;
>>   struct vcpu;
>>   
>>   int imsic_init(const struct dt_device_node *node);
>> @@ -93,4 +94,6 @@ int vcpu_imsic_init(struct vcpu *v);
>>   void vcpu_imsic_deinit(struct vcpu *v);
>>   unsigned int vcpu_guest_file_id(const struct vcpu *v);
>>   
>> +int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
> 
> Doesn't this belong in the earlier patch?

Yes, it should be in the earlier patch. I will move this decl. to prev 
patch.

> 
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -9,6 +9,8 @@
>>    */
>>   
>>   #include <xen/errno.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/sched.h>
>>   #include <xen/xvmalloc.h>
>>   
>> @@ -19,6 +21,11 @@
>>   
>>   #include "aplic-priv.h"
>>   
>> +#define VAPLIC_COMPATIBLE "riscv,aplic"
>> +#define VAPLIC_NUM_SOURCES 96
> 
> So for the IMSIC the host value is relevant, but for the APLIC the count is
> an arbitrary(?) compile time constant? Why?
If you are referring to the number of IMSIC interrupt identities, the 
IMSIC node has separate properties for the host and guest:

```yaml
riscv,num-ids:
   $ref: /schemas/types.yaml#/definitions/uint32
   minimum: 63
   maximum: 2047
   description:
     Number of interrupt identities supported by the IMSIC interrupt file.

riscv,num-guest-ids:
   $ref: /schemas/types.yaml#/definitions/uint32
   minimum: 63
   maximum: 2047
   description:
     Number of interrupt identities supported by the IMSIC guest 
interrupt file. If not specified, it is assumed to be the same as the 
value of the `riscv,num-ids` property.
```

Therefore, if `riscv,num-guest-ids` is not explicitly specified, the 
predefined value `GUEST_IMSIC_NUM_IDS` is used.

No equivalent property exists for APLIC, which is why the value is 
explicitly hardcoded here. To some extent, the chosen number is 
arbitrary, but I used the same value that QEMU uses when creating the 
APLIC node.

It probably makes sense to limit this value in a similar way to IMSIC, 
at least for now, since the case where the number of VAPLIC sources 
exceeds the number of host APLIC sources is not supported (assuming that 
configuration is even valid). In other words, we could use:
   min(VAPLIC_NUM_SOURCES, host_num_sources)

Would that make sense?

> 
>> @@ -29,6 +36,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
>>       return vcpu_imsic_deinit(v);
>>   }
>>   
>> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
>> +{
>> +    struct domain *d = kinfo->bd.d;
>> +    int res = 0;
> 
> I'm pretty sure I did point out this (or a very similar) pointless initializer
> before.
> 

I will drop initializer.

Thanks.

~ Oleksii

