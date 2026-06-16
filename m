Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JTe6H84ZMWqEbgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:39:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8868DA0A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H2TiKCZI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338955.1600048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQFt-0000YS-GL; Tue, 16 Jun 2026 09:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338955.1600048; Tue, 16 Jun 2026 09:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQFt-0000Vu-Cz; Tue, 16 Jun 2026 09:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1338955;
 Tue, 16 Jun 2026 09:38:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZQFs-0000Vm-DK
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:38:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQFr-00EnCh-Q9
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:38:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3119a0-bab6-0a2a0a5309dd-0a2a450490e6-24
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:38:47 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3119a7-1dec-0a2a45040019-d1558031d40e-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:38:47 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so27996235e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:38:47 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa890d8sm72597635e9.10.2026.06.16.02.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:38:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781602727; x=1782207527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGYGYZBBphWtZs5USZkmUwCaaHR3zBgFJ1Wjzt95IU0=;
        b=H2TiKCZI0ebb8usrsbrhDFu1JyGBbVEUIfqgyD8ZD669GuxlVrsdkeoKZHmy6VHQPZ
         ZV8nTZNXLMBWNCsm6958Td0DpLxkHnSXoQFPF/AawbXmWakjUFMENWheFsxBhJ6cPqKK
         Vof95MsMG5DuHbePDDucKjIjCO/ZlXyHTOJxry74wYslZ35ViyxDO19w6FKkgi1HPLZ2
         0Rb9iI2drTL0lBW/hZ/VGEZ2kQ/d+hFszJIeiZ8jKDjO2qCSQg1DlI0w808su4bv30Be
         Naoceqz+ILOsarRAxyfuw3/8Sol+aT44q6yyYe6Y18KMDFe7Yf8s3r2ZUljTy38KELSB
         BcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602727; x=1782207527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGYGYZBBphWtZs5USZkmUwCaaHR3zBgFJ1Wjzt95IU0=;
        b=JOecnltvodHC1nN61nfP20oSpt7OLZCzA4hoytkr88yQZd4Cdha+0ZwTCZBZ9mYE1h
         Rkykhjmdd/y1fL35UQHgoSX3UtUyfP+dvcRAbxhglvbcPKPQzmSd90zq+2Xl7IZAqBWh
         +uZGhXofpTJ+LncHsLxCWx7OKwsxgKHm08pN3qFPrnxzTSQIRh/zIbYohpTwyrLiSlOz
         KdH95D5jyCU8ES13aMx4TRuqTWG+ulIOWMDVmz501nL19teJ6Qdf0TyhGkebk2lNAKYs
         fa8nHnuJk2l6cT80ISgFe+F31L01qeVoiJYv6xx3Zd6v10K4CaNjUznEbfneku7+urr2
         jbTw==
X-Forwarded-Encrypted: i=1; AFNElJ8x5KA2CDMdOc+LMZp5nuzBLDVFiaPHjiN18d78JZ3eC4gzcKm8ah8qBhDB5rAuZJTk8nQI6q9ePOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUTk0mBSdmO4AsWs/o+qQtnL78PnxWIoJbHVTxUn9d9GVXWnEc
	aQ8he+ahRkTlA2vxU6+ZJQLKfpsOT2GECnK/s1GusqljgcvBu+qzKkz/
X-Gm-Gg: Acq92OGyO9QkmlZ+fT973qMPk6jBe5m42ve3K7LaOxp4uVg8ZUOhFUnfE09TJh31l39
	kwA6GjkcMF37hpVPoyCT6pLhEL5Hra9/Hg+nVMfn24EmwMdT2JdVKIgZbdiSatSA5/nnVAplf8W
	ofSaCo2BU5NdMaNzGMRLYTCmzbS01uNyjUGWnAardHPf96CAbpc30KSW8+CYOxThKwLogS5gfDC
	LsO5N5TczMhFcJtviIJvaPPORJN6Sg+vEG9wF4IHz6T/AO7SxFLZEabLHfy/hA9NcWiH3SXgvKU
	hHIintjWPJlhLR2H7MeXKQdGNOOD3aJM8LSwRLzowSdsDL+9IHzAGaDjNRqgdzcsZmVGG6xOMRm
	JQ2SYQDORhNAba6Bfbo/pXjeMpbYyuCxTsajiaL2Ta92Aik5PvUYTvPl4NDK+mVdW3QIRyE5XZs
	AaaTFl+G0x98Bow6uP5UFLAjIKWeUl3ycQLCKpwBE4NBVjjpSA7cTs33I2oVsOZf+Tou9EneMRo
	XPfHQ==
X-Received: by 2002:a7b:c3d1:0:b0:492:323d:20ae with SMTP id 5b1f17b1804b1-492323d2118mr5069095e9.0.1781602726954;
        Tue, 16 Jun 2026 02:38:46 -0700 (PDT)
Message-ID: <ae74fd3a-87d7-43ad-99c4-3e575eb3770b@gmail.com>
Date: Tue, 16 Jun 2026 11:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/26] xen/riscv: add initial dom0less infrastructure
 support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <0b52530fe7287ed8600b1877b573b5cd0168634a.1778250616.git.oleksii.kurochko@gmail.com>
 <386f089a-9e68-428b-bdc4-0d36526f27fc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <386f089a-9e68-428b-bdc4-0d36526f27fc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781602727-4197A3FF-BA8A9C3C/10/73395122804
X-purgate-type: spam
X-purgate-size: 5742
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6A8868DA0A



On 6/15/26 5:36 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
>> providing the minimal architecture hooks required by the common
>> dom0less infrastructure.
>>
>> Add stub implementations for architecture-specific helpers used when
>> building domains from the device tree. These currently perform no
>> additional work but allow the generic dom0less code to build and run
>> on RISC-V.
>>
>> Introduce max_init_domid as a runtime variable rather than a constant
>> so that it can be updated during dom0less domain creation.
>>
>> Provide missing helpers and definitions required by the domain
>> construction code, including domain bitness helpers and the
>> p2m_set_allocation() prototype.
>>
>> Additionally define the guest magic memory region in the public
>> RISC-V interface.
>>
>> As HAS_DOM0LESS is selected for RISC-V now it could be a compilation
>> issue if CONFIG_STATIC_MEMORY=y as guest_physmap_add_pages() isn't
>> yet provided.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - Move declaration of p2m_set_allocation() to p2m-common.h.
>>   - Add __initdata for max_init_domid and drop initalizer for it.
>>   - Add CONFIG_STATIC_MEMORY=n to CI's randconfig to avoid
>>     compilation error because of guest_physmap_add_pages()
>>     isn't provided.
> 
> Yet another trap for people to fall into, and yet another item to clean
> up before the port is really ready to use. Imo there want to be
> HAS_STATIC_MEMORY, which RISC-V simply wouldn't select (for the time
> being).

Sounds good to me. I will do the following then in the separate patch:
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig

index 683ab7d25a1e..d748404e82da 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -22,6 +22,7 @@ config ARM
         select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
         select HAS_SHARED_INFO
         select HAS_STACK_PROTECTOR
+       select HAS_STATIC_MEMORY
         select HAS_UBSAN

  config ARCH_DEFCONFIG
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 8b48d84c79e8..6e24f7f4e43b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -161,6 +161,9 @@ config HAS_SCHED_GRANULARITY
  config HAS_SHARED_INFO
         bool

+config HAS_STATIC_MEMORY
+       bool
+
  config HAS_SOFT_RESET
         bool

@@ -196,7 +199,7 @@ config NUMA

  config STATIC_MEMORY
         bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-       depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
+       depends on HAS_STATIC_MEMORY && DOM0LESS_BOOT && 
HAS_DEVICE_TREE_DISCOVERY
         help
           Static Allocation refers to system or sub-system(domains) for
           which memory areas are pre-defined by configuration using 
physical

> 
>> --- a/xen/arch/riscv/dom0less-build.c
>> +++ b/xen/arch/riscv/dom0less-build.c
>> @@ -102,3 +102,9 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>>   
>>       return 0;
>>   }
>> +
>> +int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
>> +                                        struct dt_device_node *node)
>> +{
>> +    return 0;
>> +}
> 
> No FIXME comment or anything alike? That is, nothing is going to be needed
> here even once pass-through is supported?

At the moment (even in downstream), RISC-V has nothing to do. I can just 
add the comment above return:
  /* Nothing specific to do for now */

> 
>> --- a/xen/arch/riscv/domain-build.c
>> +++ b/xen/arch/riscv/domain-build.c
>> @@ -158,9 +158,22 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>>       return fdt_end_node(fdt);
>>   }
>>   
>> +int __init construct_hwdom(struct kernel_info *kinfo,
>> +                           const struct dt_device_node *node)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>>   int __init make_timer_node(const struct kernel_info *kinfo)
>>   {
>>       /* There is no need for timer node for RISC-V. */
>>   
>>       return 0;
>>   }
>> +
>> +int __init make_hypervisor_node(struct domain *d,
>> +                                const struct kernel_info *kinfo,
>> +                                int addrcells, int sizecells)
> 
> The last two parameters being of plain int type is, I suppose, dictated
> by DT code?

Yes, it is dictated by DT code.

> 
>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>> @@ -24,4 +24,7 @@
>>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>>   
>> +#define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>> +#define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
> 
> Why xen_mk_ullong()? That's needed in the public headers only, iirc.

I didn't know that it is only for public headers.

I can change that to _ULL.

> 
> Also these are again two seemingly arbitrary numbers.

It is pretty arbitrary, I just took what isn't used by QEMU machine for 
its address space. I double checked and it should be changed to 
something else as it falls into PCIE_ECAM range:
     [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
     [VIRT_DRAM] =         { 0x80000000,           0x0 },

I will use 0x79000000 instead.

I will update the commit message that it GUEST_MAGIC_BASE and 
GUEST_MAGIC_SIZE are chosen arbitary and not to overlap with address 
space provided by QEMU for RISC-V machine.

Thanks.

~ Oleksii


