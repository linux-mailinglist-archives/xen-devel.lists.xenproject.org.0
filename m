Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF3tF8rc2GnHjAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:19:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C4C3D611B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278773.1563519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9tG-0004b9-61; Fri, 10 Apr 2026 11:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278773.1563519; Fri, 10 Apr 2026 11:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9tG-0004YO-2a; Fri, 10 Apr 2026 11:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1278773;
 Fri, 10 Apr 2026 11:19:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wB9tE-0004YI-7s
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:19:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB9tD-00FQAC-KJ
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:19:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8dca2-5cb7-0a2a0a5109dd-0a2a4504de42-10
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:19:07 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8dcab-bb33-0a2a45040019-d155d02ac84f-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:19:07 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-66bf6aa4858so3409052a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 04:19:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-670703f1104sm526646a12.7.2026.04.10.04.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 04:19:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775819947; x=1776424747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6HXw2j7EFq6emaE5cqcwzAmgBAIXk70U16icM1P35o=;
        b=KKaBzheXEdIVGxLznLRO+TziKv1ggDPJNf6oWU8ne0jVWGt65xyza9uB0gwLP6czZK
         oqUjyg66g8QIB0uvTzBbGIlfqlz/lRNYGPBr3uNb+O2jcJww6hVbISpRUGGKx6igz1nX
         ONFehADS1PqBDfVSea2YuTY50mnZQcMaG0k1dOG+6tN5EkE8jJWqzSFKrGjPh9EEGHuN
         GTJB/3QkGpZiTX37suN9GHyZVgqDeTrRaCa88+S6tLw69uA7TDtJfR8kuf/9xDXe2z3p
         0LNXZK1JETGa8a/zVmyPKml6+C28/sNMF1mMSrIeGO9LbSa5OVTu+T8N7PV3b90hGRAG
         yxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775819947; x=1776424747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6HXw2j7EFq6emaE5cqcwzAmgBAIXk70U16icM1P35o=;
        b=fx8SnChmmeKHCffKsByKMuC97T3XUQrEHhiwXp/3w0ExoB2ZuGDWTlu/GSKo54Zrov
         6x12p2mHDMP7VnSoy3z9gVF0HmyQqWemDJ5Jpl+oEO2eKRYBmlJ8w7M1SQulE/ilcSLf
         3H8+koJ84zgayMH6niVgjid9FyJG9MKon/aLK/FW+bumYOET9lZXjsYeLU8ooKgs+n4c
         skxkbjkkFV93J8b2opTRo/Fc0EFdcl7Og8wmX4yuIXlLlxYbgX0AlshkN+PpJSntogN3
         PV4VqGKQ1B8rGRM6/s8T/Y1p9Qr9oj2Qe5P8tPDkGXDlPehpaf7ssOa75Xtmnb3Xv5QR
         0G1A==
X-Forwarded-Encrypted: i=1; AJvYcCWrZkOdZG0TAMhSnSyZDgeuG+OXqkeYB6YN6xnPEIaHJnSuK0JRn9uPYVzDyBeseJNOftVfALa0R04=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxJTDpDTO0fnIMhve5MpvEscLinj1xzPAW6UyNSjLp3qdOxrYK
	fbXPFk7s0IFinXo6y7n00Ir2Riq8lV7ET/NzQKyKzYN/PQif5zy0PMD0
X-Gm-Gg: AeBDieuue1WLaMt42tLb2eQQ9f8BUTpwL+l/7FJ/Lx6FCLvEBjlQNuMncmgdWHFX6/i
	wlNFExdyogZr3tgtGJwxiiiN5bw/zW0a9ns1krYBohX6jh0ul9YRVJbZpOmC3ZV3SXQPMyfOlHf
	dY2w65AhpKZMuUwSrpEkWnilEkjMi36yvQxPf5wxL/LuCUpBELpxXo/1b8U/7nWbrquCFMEktJe
	lonNHlcuCjFuGu9L/IK9S3wuMEZB/ibGZHbEejQbTi22QwCcl2u6V6UGtVZVDOSQi/4Lhm6wONt
	HmWCqxalUSwbMNmP9J2vYuU492/nQF0PDoBFNYW0DiKKBBwJR0thCjwWVNX5SMIEMuvY5//TJCa
	j5heiEJZFT3WY2RQthKZM2sK7r2mi0PiE5adclA7Rl+RR/+ZvooO6WpF7IbfCqgaAmjSrvNUqtj
	93JmJ50lRJ/g+TucDTIeSGk8+wtblS4gVf3dz+hXEy6EDZHk+km0HyfCbi6eqz1UhjbWLWL/+LJ
	bJntKt45BcqdQ==
X-Received: by 2002:a05:6402:3051:10b0:670:8b30:a6cc with SMTP id 4fb4d7f45d1cf-6708b30a7c1mr910437a12.26.1775819946601;
        Fri, 10 Apr 2026 04:19:06 -0700 (PDT)
Message-ID: <147735e4-cd03-4efa-8981-3f29e15d5e6b@gmail.com>
Date: Fri, 10 Apr 2026 13:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/27] xen/riscv: implement make_cpus_node()
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
 <fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com>
 <7505a281-b481-4f3a-a7df-d8c234f28279@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7505a281-b481-4f3a-a7df-d8c234f28279@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775819947-3353351B-0EDDE945/10/73395122804
X-purgate-type: spam
X-purgate-size: 4313
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url];
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
X-Rspamd-Queue-Id: B4C4C3D611B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 4:11 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -1,6 +1,7 @@
>>   obj-y += aplic.o
>>   obj-y += cpufeature.o
>>   obj-y += domain.o
>> +obj-y += domain-build.o
>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>   obj-y += entry.o
>>   obj-y += guestcopy.o
> 
> Doesn't this belong in patch 02? And then domain-build.init.o?

Yes, it should be part of patch 02. Made a mistake during splitting.

> 
>> --- a/xen/arch/riscv/domain-build.c
>> +++ b/xen/arch/riscv/domain-build.c
>> @@ -3,8 +3,10 @@
>>   #include <xen/fdt-domain-build.h>
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/sched.h>
>>   
>> +#include <asm/cpufeature.h>
>>   #include <asm/current.h>
>>   #include <asm/guest_access.h>
>>   
>> @@ -44,3 +46,109 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>   
>>       return 0;
>>   }
>> +
>> +int __init make_cpus_node(const struct domain *d, void *fdt)
>> +{
>> +    int res;
>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>> +    unsigned int cpu;
>> +    u32 timebase_frequency;
> 
> uint32_t please.
> 
>> +    bool frequency_valid;
>> +    uint32_t *next_phandle = &((struct domain *)d)->arch.next_phandle;
> 
> No casting away of const, please.
> 
>> +    dt_dprintk("Create cpus node\n");
>> +
>> +    if ( !cpus )
>> +    {
>> +        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
>> +        return -ENOENT;
>> +    }
>> +
>> +    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
>> +                                           &timebase_frequency);
>> +
>> +    res = fdt_begin_node(fdt, "cpus");
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "#address-cells", 1);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "#size-cells", 0);
>> +    if ( res )
>> +        return res;
>> +
>> +    if ( frequency_valid )
>> +        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);
> 
> Handing through a property directly makes me wonder how that's going to
> fit with migration. I understand migration may not even be a mid-term
> goal, but still.

Do you mean if I will set timebase-frequency = X for guest cpu node and 
then this guest will migrate to h/w where timebase-frequency is Y, so we 
will have unsynced timebase-frequency?

Migration between hosts with differing timebase-frequency would require 
either (a) restricting migration pools to frequency-matched hosts (for 
example, KVM checks if timebase-frequency isn't different here:
https://elixir.bootlin.com/linux/v6.19.11/source/arch/riscv/kvm/vcpu_timer.c#L200), 
or (b) trap-and-emulate of time CSR reads to scale the virtual timer.

I think so as unlike ARM (which has CNTFRQ_EL0 writable by EL2, letting 
the hypervisor normalize the frequency it presents), RISC-V has no 
hypervisor-controlled frequency register. The guest reads 
timebase-frequency from DT exactly once and trusts it forever. There's 
no in-guest mechanism to update it post-boot. (at least, I don't see now 
how to do that based on the spec)


> 
>> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
>> +    {
>> +        char buf[64];
>> +        uint32_t reg = cpu_to_fdt32(cpu);
>> +
>> +        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
>> +        res = fdt_begin_node(fdt, buf);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property(fdt, "reg", &reg, sizeof(reg));
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "status", "okay");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "compatible", "riscv");
>> +        if ( res )
>> +            return res;
>> +
>> +        BUILD_BUG_ON((sizeof("riscv,") + sizeof_field(struct gstage_mode_desc, name) + 1) >= sizeof(buf));
> 
> Nit: Overlong line. Also, why +1? The name field has to include a nul, or
> else ...
Agree, +1 looks wrong here.

Thanks.

~ Oleksii


