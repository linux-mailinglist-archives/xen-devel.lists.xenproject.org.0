Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 11EqE0oAPGrFiAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 18:05:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953806BFE3B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 18:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IPcXPDtT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345142.1604126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcQ5Z-0002FQ-0O; Wed, 24 Jun 2026 16:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345142.1604126; Wed, 24 Jun 2026 16:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcQ5Y-0002Dz-TL; Wed, 24 Jun 2026 16:04:32 +0000
Received: by outflank-mailman (input) for mailman id 1345142;
 Wed, 24 Jun 2026 16:04:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcQ5X-0002Dt-Ai
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:04:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcQ5W-00GGEE-AU
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 18:04:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bfffa-bab6-0a2a0a5309dd-0a2a4509e352-30
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 18:04:30 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3c000e-97e6-0a2a45090019-d1558031b82c-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 18:04:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b7866869so10640705e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:04:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926404ee91sm2089015e9.14.2026.06.24.09.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 09:04:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782317070; x=1782921870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cuf/EWXoA4hI0VdmyVJvBxRGOWSLEygwgP0e2rBYgys=;
        b=IPcXPDtTkzE2huJrUv8VWDacI9IkSOdmdJHTWq5ol9rTDsBpit2v1agfcEgxGzC7Cz
         2qP1gJn4wbWHS2m5SawU48/udl4omVBv19IsvRb0PZji9XI1yg9CkbFNcMLruK5Ud31t
         FsgNIdsK3GEWb1EZzJspodp2Mt6vv/+eO6WwPPmHZBgcX8Oh+Ws2FBqSdI9PHukd+U9p
         i1gYOjJZgZMhS4xS/gWImzoLbZ8psyALhMv/1my1OQEFXn6G3dLUin/FPkbGXQrOmfQw
         tEkU4LULF/7JRpwVSFjkkFO+5PFHFzbgdKDxTx101ijKy0Zlxh3URY5BOygw2QBiqEXf
         2tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782317070; x=1782921870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuf/EWXoA4hI0VdmyVJvBxRGOWSLEygwgP0e2rBYgys=;
        b=MugZc9XMFYYV+x4RwdNcl2cA95XT/dxoOi3SGIhpvSUfFhnwsE4dCaCc+pCizAhk50
         J5w2gQVGBsdMQHLN2JrpqyEhEPgi4QzFyEPwX+pgbC0R1JeyU1bDyDiAJhCWZCgWtHol
         kZYHBtcOtpoXYFpKWUXVej4v4vpHGvOCwtpL3qNxtd0nDBAH9PKCnSN14Yf/n6q15mVX
         xvTaFZLdT+qMChbblymvNHST3hMe4hsgYyDAFPA3xrY9fNDEdGvhjttjInY9hBz6+1sP
         BDM3ejNkxEqyhTo5QjrFeb5ucNbns8TWjQYOw/3dywX6eB0irxBRZOnTwqyQcRUPkhDb
         duWw==
X-Forwarded-Encrypted: i=1; AFNElJ94UQ3LOVCH3ieD5sYGaJI1IXkfJBGV9auO+gIkUnXE+JsBDUXRXU4k/K6KT/6ENhOSMwtaw2KA1uA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRmdnawKq6mp5/rz/EcFWmg3NyXrT5VptzPx+bwfOKwb3bc+6i
	3THYgfxpg6M+2lnnl88SBePWkjEfng14Ckl6JCeeCFl7qwZX7p8ZBHBp2E3QcA==
X-Gm-Gg: AfdE7cl2Y1OCdkgc6wLxSZMfC3H28TFcARPcCHgmzXny32PsWJWLNHoDZ4d3qSUw0Fa
	vgfTPea6Eig4C4Zer1uFwTk6Oe3Ycnrdv1DXfnZy8DFqDDrIVizl2O+zfensGm6xVCFliSLChO8
	p1rSWaZoGwryA3RtDpzIYT+5p9oQaLgjpfZb3OrIsV700BSmdlf3JV/MjWwlOAzBbw5FRQBNCAx
	kSJihwqVJIEagPLHQ/GQaN2cNtPm6hHyPOWE/AXZzII/dELFtbPz1y+4AzMQek4D47Gp5HT/LQs
	dtQqWPvkATZIgJU9E5WRKC/jm41a7AE3Y+fvcJ5jF8XZzQ0F4ld5Dkp3V6oRTk5ug0q0qz3GgRS
	/XKYtcnbju56BX+F1aWLC9zQRf+L6qfj/Aaalf50u6cwjqpMm6UBmKjjro89MxGXsTFdDjUxQ4t
	JOP1IGFqZ4BTp7HrlnFTs68Qf1tF/lfPk9qqtrLXVTfMW3CHmCq8gCLVqx1CEOvHfK2g1U2C/xw
	A2G2w==
X-Received: by 2002:a05:600c:6207:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-4925b34a37fmr126249785e9.5.1782317069049;
        Wed, 24 Jun 2026 09:04:29 -0700 (PDT)
Message-ID: <d55a9dc3-3ac5-4d05-886b-6f79c120576b@gmail.com>
Date: Wed, 24 Jun 2026 18:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] xen/riscv: add initial dom0less infrastructure
 support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <781214e3cb87a0fe38e210e9b0cefed49d623d52.1781693963.git.oleksii.kurochko@gmail.com>
 <74d47657-2fa2-4f8f-93f6-cdd96c99ce11@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <74d47657-2fa2-4f8f-93f6-cdd96c99ce11@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782317070-56DA8986-0049326C/10/73395122804
X-purgate-type: spam
X-purgate-size: 10014
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 953806BFE3B



On 6/23/26 10:36 AM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
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
>> RISC-V interface. GUEST_MAGIC_BASE is placed at 0x79000000 to avoid
>> overlapping with the QEMU RISC-V virt machine address space.
> 
> No qemu comes into play so far (and likely such also isn't planned).
> Then why would such an overlap be problematic? Plus as before, the
> constraints on such arbitrarily chosen numbers want putting down in
> a code comment next to the respective #define-s.

You're right QEMU isn't used directly, so my wording was misleading.
I used QEMU's RISC-V virt machine memory layout [1] as a reference when
laying out the guest's physical address map, but the value itself is
arbitrary. The only real constraint is that the GUEST_MAGIC_SIZE region
must not overlap guest RAM or the emulated device regions; since the RAM
bank sizes are known, it could equally be placed in a hole after a RAM
bank rather than below GUEST_RAM0_BASE. I'll drop the QEMU mention from
the commit message and document this constraint in a comment next to the
#define-s instead.

/*
  * The guest magic region holds Xen-reserved pages mapped into the guest's
  * physical address space (shared info, grant table, etc.). The only real
  * constraint is that the GUEST_MAGIC_SIZE-byte region must not overlap
  * guest RAM (the GUEST_RAMx banks) or the emulated device regions defined
  * above; the exact base is otherwise arbitrary. Here it is placed in the
  * unused gap below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM
  * bank would work equally well.
  */
#define GUEST_MAGIC_BASE  _ULL(0x79000000)
#define GUEST_MAGIC_SIZE  _ULL(0x01000000)

[1] https://elixir.bootlin.com/qemu/v11.0.1/source/hw/riscv/virt.c#L82

> 
>> --- a/xen/arch/riscv/domain-build.c
>> +++ b/xen/arch/riscv/domain-build.c
>> @@ -156,9 +156,22 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
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
>> +{
>> +    return -EOPNOTSUPP;
>> +}
> 
> In the description you say "to build and run". How come "run" is actually
> true when these two new stubs return an error? For construct_hwdom() this
> may be explained by you not aiming at supporting Dom0 / hwdom (but that
> then still is a limitation to mention, perhaps in a TODO comment), but
> with DOM0LESS_ENHANCED_NO_XS set make_hypervisor_node() failing is going
> to break DomU building as well, afaics.

You're right. I've dropped "run" from the description, since some other 
stuff should be introduced to make dom0less guest domain to be runnable.

Regarding make_hypervisor_node(): it's true that returning an error 
breaks DomU building too, not only Dom0. As you mentioned it's 
acceptable for the moment only because no RISC-V domain currently sets 
DOM0LESS_ENHANCED_NO_XS, so the failing path is never taken in practice. 
I'll add a TODO comment to make this limitation explicit:

     /*
      * TODO: Generating the hypervisor node isn't implemented yet. 
Returning
      * an error here breaks building of any domain (DomU included) whose
      * dom0less_feature has DOM0LESS_ENHANCED_NO_XS set. This is 
harmless for
      * now because Dom0/hwdom construction isn't supported on RISC-V yet
      * either, and no RISC-V DomU sets that flag, so this path is never 
taken.
      * It must be implemented before DOM0LESS_ENHANCED_NO_XS is used.
      */

> 
>> --- a/xen/arch/riscv/include/asm/setup.h
>> +++ b/xen/arch/riscv/include/asm/setup.h
>> @@ -5,7 +5,9 @@
>>   
>>   #include <xen/types.h>
>>   
>> -#define max_init_domid (0)
>> +#include <public/xen.h>
>> +
>> +extern domid_t max_init_domid;
> 
> Shouldn't this be generalized, seeing that dom0less code requires it this
> way on every arch? Same ...
> 
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -33,6 +33,8 @@
>>   #include <asm/traps.h>
>>   #include <asm/vsbi.h>
>>   
>> +domid_t __initdata max_init_domid;
> 
> ... for the placement of this then, obviously.

I tried here to introduce less changes.

Also considering that max_init_domid is used in console.c code after 
init is freed it seems like it is incorrect to use __initdata here. So 
what Arm is using better suites (__read_mostly).

If you think it would be better to do just now instead of later then I 
would suggest something like this:diff --git 
a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 0adfa4993a8f..2af780512540 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -25,8 +25,6 @@ struct map_range_data
      struct rangeset *irq_ranges;
  };

-extern domid_t max_init_domid;
-
  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);

  size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68b6..86532d0a35b6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -62,8 +62,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
  bool __read_mostly acpi_disabled;
  #endif

-domid_t __read_mostly max_init_domid;
-
  static __used void noreturn init_done(void)
  {
      /* Must be done past setting system_state. */
diff --git a/xen/arch/ppc/include/asm/setup.h 
b/xen/arch/ppc/include/asm/setup.h
index e4f64879b68c..956fa6985adb 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -1,6 +1,4 @@
  #ifndef __ASM_PPC_SETUP_H__
  #define __ASM_PPC_SETUP_H__

-#define max_init_domid (0)
-
  #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/riscv/include/asm/setup.h 
b/xen/arch/riscv/include/asm/setup.h
index 678b65ac1e54..73ce2f293348 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,10 +5,6 @@

  #include <xen/types.h>

-#include <public/xen.h>
-
-extern domid_t max_init_domid;
-
  void setup_mm(void);

  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 05708039ab54..e30e4624f882 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -39,8 +39,6 @@
  #include <asm/traps.h>
  #include <asm/vsbi.h>

-domid_t __initdata max_init_domid;
-
  /* Xen stack for bringing up the first CPU. */
  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
      __aligned(STACK_SIZE);
diff --git a/xen/arch/x86/include/asm/setup.h 
b/xen/arch/x86/include/asm/setup.h
index b01e83a8ed9f..5925c5f39cff 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -68,6 +68,4 @@ extern bool opt_dom0_verbose;
  extern bool opt_dom0_cpuid_faulting;
  extern bool opt_dom0_msr_relaxed;

-#define max_init_domid (0)
-
  #endif
diff --git a/xen/common/domid.c b/xen/common/domid.c
index b0258e477c1a..cc5f468a30de 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -9,6 +9,15 @@
   */

  #include <xen/domain.h>
+#include <xen/dom0less-build.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+/*
+ * Highest domain ID assigned to a boot-time (dom0less) domain. Read at 
runtime
+ * by the console serial-input switcher, so it must not be __initdata.
+ */
+domid_t __read_mostly max_init_domid;
+#endif

  static DEFINE_SPINLOCK(domid_lock);
  static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index bcd6d261491b..4c09f4c7a984 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -31,6 +31,7 @@
  #include <xen/warning.h>
  #include <xen/pv_console.h>
  #include <asm/setup.h>
+#include <xen/dom0less-build.h>
  #include <xen/sections.h>
  #include <xen/consoled.h>

diff --git a/xen/include/xen/dom0less-build.h 
b/xen/include/xen/dom0less-build.h
index 4118dec76c0a..8d4da16d1f0a 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -5,6 +5,8 @@

  #include <xen/stdbool.h>

+#include <public/xen.h>
+
  struct domain;

  #ifdef CONFIG_DOM0LESS_BOOT
@@ -13,6 +15,9 @@ struct boot_domain;
  struct dt_device_node;
  struct kernel_info;

+/* Highest domain ID assigned to a boot-time (dom0less) domain. */
+extern domid_t max_init_domid;
+
  /*
   * List of possible features for dom0less domUs
   *
@@ -72,6 +77,8 @@ static inline bool is_dom0less_mode(void)
  }
  static inline void set_xs_domain(struct domain *d) {}

+#define max_init_domid 0
+
  #endif /* CONFIG_DOM0LESS_BOOT */

  #endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */

Thanks.

~ Oleksii

