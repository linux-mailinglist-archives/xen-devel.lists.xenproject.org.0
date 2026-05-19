Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMEUBGQtDGq0XwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:29:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F757B4CB
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312658.1582735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGl3-0004h4-HJ; Tue, 19 May 2026 09:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312658.1582735; Tue, 19 May 2026 09:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGl3-0004fU-DY; Tue, 19 May 2026 09:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1312658;
 Tue, 19 May 2026 09:29:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPGl2-0004ev-3P
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:29:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPGl1-00BKXa-FX
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:28:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2d53-5cb7-0a2a0a5109dd-0a2a4502c00e-30
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:28:59 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2d5b-af86-0a2a45020019-d155d035c0ba-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:28:59 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-67e2498f3a7so7372797a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:28:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4dec855sm685143466b.37.2026.05.19.02.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:28:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779182939; x=1779787739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oilnvXpTVqeZORRPfv32DCf56jL3MsGxny/s4Jkcn58=;
        b=F/lt2Ttcfiwwt/ejm1geGSOaQcT2nWHlJKow025K+XAs18fJNB31s8+tPxxMrHY8YE
         kWhoBDMpXuCu4J8UYfbY4AuVhfZ3p+0NTOAQ2AdlWHO8twyOBWOOqzIDXH5120FVbqSq
         rV7tcrJcnhjhBJGQX948raP6P1FYQWA1JzXEzRC4MTlnGrRZWOW4ALCEoH+QhySc5bGO
         Sa14laVqSIF24KEcM4oE/P0ysmIM7AuoELknx3o5fRHUSlxnTTXFHlDWLd2239ft8Coy
         5FIgdvJIKjS3dmcOEssN6VGDd34KWcFdWyjRMoS74GrkA+CavOOYCHeAojbQEG/gkR5v
         qlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182939; x=1779787739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oilnvXpTVqeZORRPfv32DCf56jL3MsGxny/s4Jkcn58=;
        b=snbPZH3dK49evG2p4tTs3JhogpASIoUvX3RC5Erwd2HQ3Y72RO6STxd1cDALhQB6ST
         nwJ0Vg00ZvIC/K/PuYHQvvpqWaQBsErKdTGRAoVEhi/EAo0firMvbLMDLTLWjslGJKak
         DqbPFZvFUG7Lx3mz3nkSWlyJ8Y/3grwkIvaCHhTojYHHUaCmjI+qCRS9/xULOrmP+bca
         eC/xbm5lvjWLTXkETeghwwbr1DKGS03fuHoDsPm46fs7Z0Eczr/kKHSr+JtTO2Tatz7v
         rin7EdhDABv7MYs+rEY7/mqw+rsCsZgBkcUbIOlWCwYSboQ0LkUKJ/fmoR11JLb5SOWs
         hvkw==
X-Forwarded-Encrypted: i=1; AFNElJ++aznIv3cR/H5zzICZaGDE7Hm8w02AQ6rKnA73Gkc/+EKvZhvLUtbX5SjQuNMqr+481ZtjZw29IuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEkk+OtxfGoW7SchjPtGX14SOs8AjeWYcQy4frDcetI/oKjSIE
	oG9WJaAsIq7xw0mx4ge+sPU7gO3PEMA8pmiQZ0vC41cDGaRafdP0OrCE
X-Gm-Gg: Acq92OGPiZYzxjBjC0gh8r9YMdII5ZytkksGbwow97H2w9hhOG3EhL7h/Q96CueSjhv
	tHSSdtddVUaiZyRv/8SKb0ewRxF5OXC0ey4sdmbeabl9WVJd6gx+xDzpjJmkgRxBqUk9ZX3AqoF
	aicMG2B01S2OhXew7DUIY6NgEz77HnVzMtURSlyTCn9RWZe1uJp1NbPI3vw6Lo4z/lakH4xj8Ok
	0DFMbLAY2/JUtIpXz9iJtH9Qm0/bFPKpsyAk2CyWQvoibDxnOJlbYt619Z7G4Ehs9xhzq8IfMCf
	Ff/RQFBcGq4fjaHiC7j3bLZ6UpbnyOO6jjG2nNw/7UqnsiYh0HY4yeDPQc12huHZ+XY4VUw/jSv
	IiDIQq6hDGslX/YJoHF14LuYLFgQbssgYlbwDbVmqmIGMuUVdyMjSqg6aMIk7qiFVHh1WvoaBNW
	G+WeIXryV6c1US33L+lIzafZcZew8Pahul2Q/YzMAhxRQcS/REHwDIIedMyyIEAVgAwa743ljnR
	bOFHPhNVIwGKw==
X-Received: by 2002:a17:907:1c0d:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bd517a99797mr972760566b.35.1779182938736;
        Tue, 19 May 2026 02:28:58 -0700 (PDT)
Message-ID: <7f2a1dcd-482a-4821-bb14-54e804a703e8@gmail.com>
Date: Tue, 19 May 2026 11:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/26] xen/riscv: Implement construct_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <3b1c60095c8a963e7df3ca5025e637e678f5ee71.1778250616.git.oleksii.kurochko@gmail.com>
 <8b076265-8559-40cd-ac65-418e7b3c9e7e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b076265-8559-40cd-ac65-418e7b3c9e7e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1779182939-A9573161-27225067/10/73395122804
X-purgate-type: spam
X-purgate-size: 2114
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 735F757B4CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 5:33 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> Implement construct_domain() function for RISC-V, which performs initial setup
>> for the domain's first vCPU, loads the kernel, initrd, and device tree,
>> and sets up guest CPU registers for boot.
>>
>> It also creates additional vCPUs up to max_vcpus and assigns the device tree
>> address and boot cpuid in registers.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with ...
> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/domain-build.c
>> @@ -0,0 +1,52 @@
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
>> +{
>> +    struct vcpu *v = d->vcpu[0];
>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
>> +
>> +    BUG_ON(v->is_initialised);
>> +
>> +    /*
>> +     * At the moment *_load() don't return value and will just panic()
>> +     * inside.
>> +     * TODO: it will be good to change that.
>> +     */
>> +    kernel_load(kinfo);
>> +    initrd_load(kinfo, copy_to_guest_phys);
>> +    dtb_load(kinfo, copy_to_guest_phys);
>> +
>> +    regs->sepc = kinfo->entry;
>> +
>> +    /* Guest boot cpuid = 0 */
>> +    regs->a0 = 0;
>> +    regs->a1 = kinfo->dtb_paddr;
>> +
>> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
>> +    {
>> +        const struct vcpu *tmp_v = vcpu_create(d, i);
>> +
>> +        if ( !tmp_v )
>> +        {
>> +            printk("Failed to allocate %pd v%d\n", d, i);
> 
> ... %u used here and ...
> 
>> +            break;
>> +        }
>> +
>> +        dprintk(XENLOG_INFO, "Created vcpu %pv\n", tmp_v);
> 
> ... this line preferably dropped. Can do when committing, provided you agree.

I agree with these changes.

Thanks a lot.

~ Oleksii

