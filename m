Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKsJIq6T12mGPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:55:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C903C9E99
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277168.1562426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnyX-0006c8-4X; Thu, 09 Apr 2026 11:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277168.1562426; Thu, 09 Apr 2026 11:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnyX-0006ac-1d; Thu, 09 Apr 2026 11:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1277168;
 Thu, 09 Apr 2026 11:55:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAnyV-0006aW-2P
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:55:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnyU-001WDD-8m
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:55:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d7938f-5cb7-0a2a0a5109dd-0a2a45058a62-32
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:55:06 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d7939a-3760-0a2a45050019-d155d030b06c-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:55:06 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-66bb4d4fcb4so1568897a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 04:55:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3c99f80esm728865966b.18.2026.04.09.04.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 04:55:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775735706; x=1776340506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCzgFErE1QM6hPZ6HDtdwDg1YVsG3PZj60BHPPJ3iv4=;
        b=b1DfshcDxRWyrpNJjLuq1kpqYtVHX5dr9KmPMxANwBXyWERyY3y2jcVcok/uAWPFjW
         lXkudA7TrMdMXYo3Trhqck8uifp0FgWdKlMiX+ZL/HZlu2mz/BHL7u6ZVmKyMuJid5UN
         rICKPn47V6m1Q2mjrZrlio82LSIeeeqA5GeNdBSr/YoneSAUFQkRgkMIlU/vkdrJ82pq
         wSum6bvs4kABKi0uqX6EszPqsTTknnJYj1ATTNdqKPihULjSob+5gnAP3C4q/GN/juLN
         +E2KaT4aH42oYCQEsDTV5P5T89U5yottivVWq173C5bH9bJl2/H0eR9rrTSb/RJFnAT9
         3leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775735706; x=1776340506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCzgFErE1QM6hPZ6HDtdwDg1YVsG3PZj60BHPPJ3iv4=;
        b=TsRpAJZd9XYHf897xx6GVTx3YMkPkghaYw9ysQWGiikNcfjAOBKof7++GwMlAJOluD
         pMV+bR+DXVFO5rZqMqwWqWSDpPZmUu6joH8LpFo2qbQb5TRqXy3ldVwN1X5UjllMSd9D
         +x8+OtGvvRidrFSih9Pxh9p62P9l6As+7rC6mFMLnK6F0aAaiuy/hl6igpfKV7AIaohY
         E/5AtRDocD56lkurUmyOy5LwwPlDbucvCbJVZU8REigPMN0v4/E4N8guhkrZMfuUKT3U
         92hhVuGLwqGC7M4M834MjXdenDIQtxo/i6mEmkwd21xiCmvV39FRMizUVp7eMb49OyeG
         HRyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0QTDYXY8f4FvpwKL4E1JgH8r/Q1/p1nR1HF5sEPxl4e4nHHTLSTNwsTmCG2ogwRaLOMa0g7hkf6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHPgEH6r1TGWPORLM8hEfGmsgWOiJ4JgsjV6Db3+Uc/tVrszDB
	Cceldv+C2+PYvR7P5TcMDOUfuXV6S71YPSIHIP1dLmteBInzyJpqK5Ch
X-Gm-Gg: AeBDieu0sIesvBI1gMgqAL77AzDkHPcJZyoINUAnFr11ysfYcmBJOKnV5XEJmxtAEdU
	3zl3v6dLVSc1c2fQgcnnmpJ1RhYunG4nPLQRPo3Ej2KtkrQlmtTr34wThFCqzSWy6fCX92DUnxZ
	inFdps5+kdinIZXatFH4Hw8GoOsNIsrnEEJtzqgYu6cMYvrxojnv6l88dPhVqeN3HZgGUsTIL1i
	F3cLxfOlnsrw5lV7uD2aKHTkTU0XpMtGGHW3xy/ImB3RMOX7qRdZ5FqiFJYpNL2w2BDH7Mwjmto
	U+KGhcXYKAKTzJ8eEwewg77GqRx99ynvi5N+TOIThk7/Vnx/eg7Znhi9kjRyPa/KGodXb5I4pPI
	edUO9AuDZA60D7sKr87fdpAzwHMEYW4rmM9svZUZ0xin1XZ8vga9U9ioAz09TYK1tqSIwhztXwt
	eZexQ+19L//yXw8rsYahO+wWZEfBNi98DUPxkqVdwRQT4hXw+msTLq+l52mY+z67KycVimZqj4G
	zs=
X-Received: by 2002:a17:907:3f90:b0:b9c:2a5f:41c4 with SMTP id a640c23a62f3a-b9c679e1f54mr1303377266b.40.1775735705419;
        Thu, 09 Apr 2026 04:55:05 -0700 (PDT)
Message-ID: <561a1f68-4c5f-447f-99f7-29465fe1bd5c@gmail.com>
Date: Thu, 9 Apr 2026 13:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/27] xen/riscv: implement prerequisites for
 domain_create()
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
 <ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com>
 <2cec4690-b23e-4057-841f-efca4348af5c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2cec4690-b23e-4057-841f-efca4348af5c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775735706-33F2E96F-18B976FB/10/73395122804
X-purgate-type: spam
X-purgate-size: 3519
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: E9C903C9E99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 2:57 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
>> domain_create().
>>
>> arch_sanitise_domain_config() currently returns 0, as there is no specific
>> work required at this stage.
>>
>> arch_domain_create() performs basic initialization, such as setting up the P2M
>> and initializing the domain's virtual timer.
> 
> Does it? I can spot only the former; instead there is ...

Stale comment, I will drop that as vtimer init is called per vCPU.

> 
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -288,6 +288,33 @@ void sync_vcpu_execstate(struct vcpu *v)
>>       /* Nothing to do -- no lazy switching */
>>   }
>>   
>> +int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>> +{
>> +    return 0;
>> +}
>> +
>> +int arch_domain_create(struct domain *d,
>> +                       struct xen_domctl_createdomain *config,
>> +                       unsigned int flags)
>> +{
>> +    int rc = 0;
>> +
>> +    if ( is_idle_domain(d) )
>> +        return 0;
>> +
>> +    if ( (rc = p2m_init(d)) != 0)
>> +        goto fail;
>> +
>> +    d->arch.next_phandle = GUEST_PHANDLE_LAST + 1;
> 
> ... this, which I can't make any sense of. I can't find matching Arm code
> either, which might otherwise have helped.

There are some cases when we are creating a node for guest DTB we should 
know which phandles aren't busy (to avoid the case when some nodes have 
the same phandle) so to track that this struct field was introduced.

I will check Arm code as I expect that phandle should be generated 
somehow on their side too.

> 
>> +    return rc;
>> +
>> + fail:
>> +    d->is_dying = DOMDYING_dead;
>> +    arch_domain_destroy(d);
> 
> (At least) for the use here, that other function would better also move out
> of stubs.c at the same time (and no longer have unconditional BUG_ON() in it).
> 
>> --- a/xen/arch/riscv/stubs.c
>> +++ b/xen/arch/riscv/stubs.c
>> @@ -101,14 +101,7 @@ void dump_pageframe_info(struct domain *d)
>>       BUG_ON("unimplemented");
>>   }
>>   
>> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>> -{
>> -    BUG_ON("unimplemented");
>> -}
>> -
>> -int arch_domain_create(struct domain *d,
>> -                       struct xen_domctl_createdomain *config,
>> -                       unsigned int flags)
>> +void vcpu_switch_to_aarch64_mode(struct vcpu *v)
> 
> What is this? Surely nothing with this name should exist under riscv/.

Good question. I don't know how it appeared here. I will drop it.

> 
>> --- a/xen/include/public/device_tree_defs.h
>> +++ b/xen/include/public/device_tree_defs.h
>> @@ -14,6 +14,7 @@
>>    */
>>   #define GUEST_PHANDLE_GIC (65000)
>>   #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
>> +#define GUEST_PHANDLE_LAST GUEST_PHANDLE_IOMMU
> 
> This, to me, looks like a questionable addition to the public interface.
> Yet I'm not a DT person, so I may simply be missing why something like
> this might be wanted (and how stable it then would be, long term).

I will double check if I have to generate phandle for the node I'm 
creating for guest DTB. It looks like I am confused something and it 
could be just dropped.

Considering that only RISC-V needs that at the moment (if need it all?) 
I will put somewhere in riscv/ this definition.

Thanks.

~ Oleksii.

