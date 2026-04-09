Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DuQHgCN12mtPggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:26:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F953C9A8A
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277065.1562335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnX4-00055H-PS; Thu, 09 Apr 2026 11:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277065.1562335; Thu, 09 Apr 2026 11:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnX4-00053E-Mr; Thu, 09 Apr 2026 11:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1277065;
 Thu, 09 Apr 2026 11:26:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAnX3-000536-5A
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnX2-00DPkc-HG
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:26:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d78cec-5cb7-0a2a0a5109dd-0a2a450ad6c8-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:26:44 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d78cf4-ee98-0a2a450a0019-d155d032b430-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:26:44 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-67010289b73so1072551a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 04:26:44 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3cec6c11sm766964566b.30.2026.04.09.04.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 04:26:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775734004; x=1776338804; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXP2uJ7NN/hezCd2/ar0UucHukb/Mjy6CzRam3hhs7Y=;
        b=LHKLKoHt7DRLswtZo64ybUEr4o155C2QzxUtOp+fvEKRvSfU/EABCa+vNo5Zf0upCz
         88i8Z59pkR/uOtW+jpccqq3l6xk/wmTZgvQjvszwJ6eN5JmF5iriE3CeCRfvwirLZ4ad
         XTqcPb7ltMgeIaxn2VTAYcmesx1uOJK584ZglLI8GhLl0L/tMyeqw9xdCUT9ZSDXQYwN
         7BnCQdVr5NR9RL6eCvBwXnI4BA6mqs5Cj9r2FROqm9YrQ1m57ocTIrzoTI6dYzaTuxP0
         wfi0EUM1DrLLQRioJhYIu7NwMYgs95vwf5d/ENBzIWFXjm9VKpYdwPCcFpjufjDSdHBa
         PeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734004; x=1776338804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXP2uJ7NN/hezCd2/ar0UucHukb/Mjy6CzRam3hhs7Y=;
        b=rmcbG9kJp79e5XN0f8DhCZrwZtR7krSVr7K6gRKBKtGHmCpnjz33lEkRIH6u1PI6PB
         rMop2ShnoGu80/f/kyUBEAOCTpAeyV29KtySQVjJW5YDySjoGG71Hmh/9WHy12gbka7m
         BhQqAwJdCD6Yh+V2XT1ifATqfJB6pIrADC7TKu2BWi7AXslpQAmEjRNue64kHioFrUHl
         HZfb2iJA5BhGRoVETBU/t8zfwYd3lkTepnJPjBmHUg9mtiIYKdnTkAsp9qm8cgmoM4aK
         ZBSuM+nvaUwSWQZcIGj01loFe34U+Xhl4CbtKw8jwlWDc+EP7SX4h0Z4rA9ivh1eah5b
         MQnA==
X-Forwarded-Encrypted: i=1; AJvYcCWaJe8vFJL7m1jd2vcWSX46W6Gjd7kP5hmKLtVjATFdWJzMtGS/c5J7LODjm6hjXK+vEhsnBs98KwI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYT7gAO6XUYx6v8ZgDlcfTZlxRFlltojtk0KCvrKjkYrR/EKoQ
	MgjIhsE5yLqwXMy8RlkmlhDNbKGn582dBhGAczREMQv88VdZlpmiCzkp
X-Gm-Gg: AeBDietqQ9mMEGR9APoQ6xydUYVaLxxXjU+Joc8WTNc+4k3irrAbOozOxqUEDgpSTzG
	47yxOfIVpJ1xb0QIVx8PgYRYVrRBAKskcchJfBFDMXsZ7a6tqnTmOHmNEiKIDX8up7uGGtn/+ND
	V0QjBQ2eYi4uhwwCCO3NQRVPUsSWltCZeA8ZGpMkrL/+yI8yMo55nzkQhBHsWSVZcxK74hqxN+E
	SZ0Q18JifadKKDIKmJbn5krFbNAFw7z8qqLa53knxYk3pfFQdwK+UIPw5cZGWAldqKxp/hH/AqQ
	7Qcqkm18DZWNdiGh8WGK1XrHTtZaMStxsjeogqUc7SZIb9mKWug5IzaCnLgax0iMumrQCkVZZ7h
	MyokHOjj1WM33KB8UeU+wVKKjx4kLU4n1V/vD5z7MRS150je+Xve/Xsf54id2qPuR08PflxuA1O
	L+ahymR2s/rxwMhNWjY0o2k7Tk41uZ+9D64HwP5hLIuo49FXIv2c3Qm1jrmRdE0WCpqJdgR+wni
	C8=
X-Received: by 2002:a17:907:8691:b0:b9d:3d63:b913 with SMTP id a640c23a62f3a-b9d3d63be66mr263745766b.26.1775734003560;
        Thu, 09 Apr 2026 04:26:43 -0700 (PDT)
Message-ID: <95fc62d9-cfd4-4b75-a9b0-7e90c9ba1095@gmail.com>
Date: Thu, 9 Apr 2026 13:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/27] xen/riscv: Implement construct_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <3a86599284108e6f2a27488a03145f8dd1b71def.1773157782.git.oleksii.kurochko@gmail.com>
 <cd1fa52a-0ff2-4b7f-9b0b-c33b6a01b6c8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cd1fa52a-0ff2-4b7f-9b0b-c33b6a01b6c8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775734004-0D9540B1-B75FFFB0/10/73395122804
X-purgate-type: spam
X-purgate-size: 3111
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E2F953C9A8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 10:37 AM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/domain-build.c
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/fdt-domain-build.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/init.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/current.h>
>> +#include <asm/guest_access.h>
>> +
>> +int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
> 
> Are you actually altering what kinfo points to?

Not directly in this function, but it could be altered, for example, by 
kernel_image_load() where "info->entry = load_addr" is happening.

> 
>> +{
>> +    struct vcpu *v = d->vcpu[0];
>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
>> +
>> +    BUG_ON(d->vcpu[0] == NULL);
> 
> Why not simply "!v"?

It could work. I'll apply that.

> 
> Also, while in the cover letter you state a dependency on another series,
> this is somewhat unwieldy here. From the titles there I can't deduce which
> of the patches would introduce vcpu_guest_cpu_user_regs(). Yet I would
> have wanted to double check that it doesn't de-reference v already.

It was already merged. It was part of:
  xen/riscv: implement vcpu_csr_init() "02b3a1b0e53c"

> 
>> +    BUG_ON(v->is_initialised);
>> +
>> +    kernel_load(kinfo);
>> +    initrd_load(kinfo, copy_to_guest_phys);
>> +    dtb_load(kinfo, copy_to_guest_phys);
> 
> These all return void, despite this also being used for non-Dom0. Is it
> really fatal to a dom0less system if one out of many domains fail to be
> built?

For a dom0less system, my opinion is that it should not be fatal, it 
should simply ignore a domain that fails to build and continue with the 
rest. However, with the current common dom0less code it will just 
panic(). This is a behavior I would like to change and it is on my TODO 
list.

Regarding the functions returning void, this is because all of them 
currently call panic() on failure, which I expect will need to change in 
order to ignore a domain that fails to build in dom0less mode.

For the current implementation of the common dom0less code this is fine, 
but I agree it should be addressed in a separate patch series.

  Especially when, despite the name, there is a Dom0?

For this case, a failure there should indeed be fatal, so panic() is 
appropriate.

> 
>> +    regs->sepc = kinfo->entry;
>> +
>> +    /* Guest boot cpuid = 0 */
>> +    regs->a0 = 0;
>> +    regs->a1 = kinfo->dtb_paddr;
>> +
>> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
>> +    {
>> +        if ( vcpu_create(d, i) == NULL )
>> +        {
>> +            printk("Failed to allocate %pd v%d\n", d, i);
>> +            break;
> 
> And no error is indicated to the caller?

No, as generally it is enough to have only one vCPU0 to run domain, so 
we have to print that something went wrong with allocation of vCPU1...n 
but it is okay to me to continue domain construction.

Thanks.

~ Oleksii

