Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO9zBVex12kORggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707503CBB52
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277479.1562729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApx6-0006OP-P8; Thu, 09 Apr 2026 14:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277479.1562729; Thu, 09 Apr 2026 14:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApx6-0006LR-Jh; Thu, 09 Apr 2026 14:01:48 +0000
Received: by outflank-mailman (input) for mailman id 1277479;
 Thu, 09 Apr 2026 14:01:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wApx4-0006HP-W3
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApx4-00CXs8-Br
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d7b146-e002-0a2a0a5209dd-0a2a45068fc2-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:46 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d7b14a-0df0-0a2a45060019-d1558035c4d2-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:46 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488c2690057so9604115e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 07:01:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd0f4d7bsm49226945e9.1.2026.04.09.07.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 07:01:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775743306; x=1776348106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CZ0Go1IU1nLejijS21PYpLjHe6D+n3SZcGcqbvp2Uu4=;
        b=cUH3TSQNdAUZVlAI78PNBkxyqZOq5tNbweMdzwzNFUFISSIYlOt7y0NBJ78sEA3AXb
         dL31IPiUnQ03okvAH84GTLECqL+cQ8L5gWZt4qKWplWFJxDD1niEs9EEVXpG6A+msHT4
         ngUjma+b4e6vdVanLbjpq/8cHlayp0yPQDX+xGC9j60q8tKuLXyToLjPhZj1RaHLglGR
         0DAPL2rs3r6BCvHd315u9Ikcje0klnH729h2OdAkklOrEtg4DdnvzJEtiHOu8FNbm49s
         aTQvRJDO3z3tWyBHefAj9yrpM1B/q30wJcQSGMKqrKRtYimOzoUSBBlSk3UiqUZPqrK9
         O2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775743306; x=1776348106;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ0Go1IU1nLejijS21PYpLjHe6D+n3SZcGcqbvp2Uu4=;
        b=T+9DAqXt2ZS57aIietuYBVTMqo4cqM5S7gKQjy0lj3kh4erWlUF0McoVtGnHSVK5h5
         BfJp4Q2YYshr82ulEqfQw8Htsvd/OOmLWiRNXnVN6Oc0r7wPHZgnFH8Iz0lV4q51WYSJ
         suuvzhSzdyC0hKrHv7DHf3e3iBFlVQueGyAbRT3HWA8b5UQCkfHd5oj9rCWE+xO6lOWo
         wu/v/t27CG32dOjFWW/x+7GMWmoif2V1Ho/ygmC8yzWYiuZIbZZfs58zZHZfdli5BtH3
         yR21ILoQFGZx5OGBZdDJMRcaiW6BYiqH4oyJy1GxlFOwtIsxsgiMy5IwBsA2+vvT4wOv
         mwCg==
X-Forwarded-Encrypted: i=1; AJvYcCWDPZjLqhEwmOKJHiwt/jmEmpFExLRGpKGnX0Oeg2jeqLVI6TCo/JkgcAl+bWPjEZxLNV6QvORBrQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpCAk+OaJfn23kZPC/0n0cKbKHtLdDXrFbusngDjIbCp8IQfWv
	gkF0l85DWfaSEWTPI3zf1LWOtfSKqorzLHo00W1ILAX8NXqwmVKcjiZS
X-Gm-Gg: AeBDietDaSke7av1NLkYkBta7t2Wbp6BReM3NPkpJKNk1nJYyPCLa39cXr8T1H6sNBL
	1SnAlUALzEwKErLc5X3BabGhy1ncsaRzdgPaFkiNXtQoeUuT4jB2xXygX2/aELSAPFyt2bS/OOY
	hxndAF57olG2HtAfdvM0o1qeu5N1mvQRDv/kt63erGY2pxK4ksjDj1KB1lVoEhcfSA6gtwiHXx/
	Fed2yVy1iEMBRCsE3wcxATtgWlWgxosybCMcbS2xpjBDweBiDK8pGLvbZXbeAYx9xuXYaRFiue5
	WW2pNGvxckI2Rn1OtttNY/lPZfX6OADwYicjGepNxIijduApdQJ33eEAVc1rCfHje12e+4rPg/m
	9s49soP40LLBbhz6tcR0O9irbnZ/0q3MMS5ukrr75S+ZUvL7tJhSiTjtZHa4oaLW9lzBkQUuJPg
	Ox1vBrGhclwDVVTeFh8YdlNRdb3z8JD7J/W84U42FRAGWgZbE8qvx0HxejuN1otA3jz1SXzM0i0
	ME=
X-Received: by 2002:a05:600c:1f1a:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488ccf63aa9mr53181165e9.8.1775743305103;
        Thu, 09 Apr 2026 07:01:45 -0700 (PDT)
Message-ID: <5dfc8821-6485-4cbc-867a-7146a561aa89@gmail.com>
Date: Thu, 9 Apr 2026 16:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/27] xen/riscv: Implement construct_domain()
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <95fc62d9-cfd4-4b75-a9b0-7e90c9ba1095@gmail.com>
 <c3e20570-6dbf-4dd9-86de-d334e0f71f3a@suse.com>
 <2926ad08-39c8-4559-bb40-7231c69d9a65@gmail.com>
Content-Language: en-US
In-Reply-To: <2926ad08-39c8-4559-bb40-7231c69d9a65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775743306-642483D8-0E2304A8/10/73395122804
X-purgate-type: spam
X-purgate-size: 2043
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 707503CBB52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/26 3:39 PM, Oleksii Kurochko wrote:
>>
>>>>> +    regs->sepc = kinfo->entry;
>>>>> +
>>>>> +    /* Guest boot cpuid = 0 */
>>>>> +    regs->a0 = 0;
>>>>> +    regs->a1 = kinfo->dtb_paddr;
>>>>> +
>>>>> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
>>>>> +    {
>>>>> +        if ( vcpu_create(d, i) == NULL )
>>>>> +        {
>>>>> +            printk("Failed to allocate %pd v%d\n", d, i);
>>>>> +            break;
>>>> And no error is indicated to the caller?
>>> No, as generally it is enough to have only one vCPU0 to run domain, so
>>> we have to print that something went wrong with allocation of vCPU1...n
>>> but it is okay to me to continue domain construction.
>> Hmm, now that I look there, sched_setup_dom0_vcpus() ignores errors
>> and doesn't even emit a log message. Question is why neither Arm nor
>> RISC-V use that function, when we have it.
> 
> I haven't seen this function, I will re-use it and in separate patch 
> suggest to re-use it for Arm.
> 
> One thing I think we want to do then is to drop #ifdef x86 around 
> sched_setup_dom0_vcpus() and rename it to sched_setup_dom_vcpus().
> And maybe add dprintk()'s to provide some information about which vCPUs 
> were created and which not.

Arm doesn't re-use sched_setup_dom0_vcpus() because it has extra if() 
inside:
     for ( i = 1; i < d->max_vcpus; i++ )
     {
         if ( vcpu_create(d, i) == NULL )
         {
             printk("Failed to allocate d%dv%d\n", d->domain_id, i);
             break;
         }

         if ( is_64bit_domain(d) )
             vcpu_switch_to_aarch64_mode(d->vcpu[i]);
     }

     domain_update_node_affinity(d);

sched_setup_dom0_vcpus() still could be re-used but the an extra for() 
loop will be needed for:
         if ( is_64bit_domain(d) )
             vcpu_switch_to_aarch64_mode(d->vcpu[i]);

I think it doesn't then too much sense to re-use 
sched_setup_dom0_vcpus() for Arm.

~ Oleksii

