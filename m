Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44151FAEF
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 13:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324396.546416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no1FX-0001fU-OX; Mon, 09 May 2022 11:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324396.546416; Mon, 09 May 2022 11:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no1FX-0001dK-LG; Mon, 09 May 2022 11:08:23 +0000
Received: by outflank-mailman (input) for mailman id 324396;
 Mon, 09 May 2022 11:08:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no1FW-0001dE-73
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 11:08:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no1FV-0003Q8-Sm; Mon, 09 May 2022 11:08:21 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no1FV-00062d-Mg; Mon, 09 May 2022 11:08:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=jUQCt3/EQTlW/N6YMxfHB2s6esNnhj05x2VWRTuu0jc=; b=R7UuBsLR76vAryHeGx0mU5fs96
	bBdCmS8EJLJTRL/RS04aWEtvKovhJmP80fMiBy76zxR5zr8zDxOjf32Mc61l5kq+0TGSXZI6+AlGt
	New4ScfXJkCJTdFDx3TW3lOuBhjRm3WEr4xERqOOLCeHUJUBapsmAQjbeJU4JwpbV/Dc=;
Message-ID: <1a80d099-6fe4-377b-c3b1-a08c7d8f59cf@xen.org>
Date: Mon, 9 May 2022 12:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
 <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
 <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
 <d8889ee4-7790-ab93-a5d1-708aa541dd1b@xen.org>
 <15DEAB6E-3130-49E8-87BD-AC82C08C7698@arm.com>
 <0ac6d6c0-4f34-ad1e-c473-2278dd7289c9@xen.org>
 <3E6AFDF4-A55B-4C7C-ADFB-A451C478661C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3E6AFDF4-A55B-4C7C-ADFB-A451C478661C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/05/2022 11:49, Bertrand Marquis wrote:
>> On 9 May 2022, at 11:31, Julien Grall <julien@xen.org> wrote:
>> On 09/05/2022 11:08, Bertrand Marquis wrote:
>>>> On 4 May 2022, at 09:06, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 04/05/2022 08:24, Bertrand Marquis wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi Bertrand,
>>>>
>>>>>> On 3 May 2022, at 19:47, Julien Grall <julien@xen.org> wrote:
>>>>>>> A new cpuerrata capability is introduced to enable the alternative
>>>>>>
>>>>>> 'sb' is definitely not an erratum. Errata are for stuff that are meant to be specific to one (or multiple) CPU and they are not part of the architecture.
>>>>>>
>>>>>> This is the first time we introduce a feature in Xen. So we need to add a new array in cpufeature.c that will cover 'SB' for now. In future we could add feature like pointer auth, LSE atomics...
>>>>> I am not quite sure why you would want to do that.
>>>>> Using the sb instruction is definitely something to do to solve erratas, if a CPU is not impacted by those erratas, why would you want to use this ?
>>>>
>>>> I agree that SB is used to solve errata but the instruction itself is not a workaround (it may be part of it though). Instead, this is a more efficient way to prevent speculation and will replace dsb/isb.
>>>>
>>>> Speculation is never going to disappear from processor. So, in the future, there might be valid reason for us to say "We don't want the processor to speculate". This would mean using SB.
>>> If the need arise then we will check depending on that how we can support it but in the current status as there is no use case I don’t think we need that.
>>
>> It is not clear how I should read this answer... If you add SB in cpuerrata.c, then a user will start to see message like:
>>
>> "enabled workaround for Speculation Barrier".
>>
>> Which is completely bogus. Replacing "dsb; isb" with "sb" is mostly an optimization and none of the current use will end up to be architecturaly executed.
> 
> So ultimately something like this is what you are looking for ?
> 
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index e744abe800..7c3e5141a6 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -681,9 +681,12 @@ static const struct arm_cpu_capabilities arm_errata[] = {
>           .capability = ARM64_WORKAROUND_AT_SPECULATE,
>           MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
>       },
> +};
> +
> +static const struct arm_cpu_capabilities arm_features[] = {
>   #ifdef CONFIG_ARM_64
>       {
> -        .desc = "Speculation barrier (SB)",
> +        .desc = "Speculation barrier instruction (SB)",
>           .capability = ARM64_HAS_SB,
>           .matches = has_sb_instruction,
>       },
> @@ -694,6 +697,7 @@ static const struct arm_cpu_capabilities arm_errata[] = {
>   void check_local_cpu_errata(void)
>   {
>       update_cpu_capabilities(arm_errata, "enabled workaround for");
> +    update_cpu_capabilities(arm_features, "enabled support for");
>   }
What I am looking for is two separate arrays: one for workaround and the 
other for features. Something like (untested):

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index a58965f7b9bf..54c10751dba8 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -70,6 +70,20 @@ void __init enable_cpu_capabilities(const struct 
arm_cpu_capabilities *caps)
      }
  }

+static const struct arm_cpu_capabilities arm_features[] = {
+    /* XXX: Add SB */
+    {},
+};
+
+void check_local_cpu_features(void)
+{
+    update_cpu_capabilities(arm_features, "enabled support for");
+}
+
+void __init enable_cpu_features(void)
+{
+    enable_cpu_capabilities(arm_features);
+}
+
  /*
   * Run through the enabled capabilities and enable() them on the 
calling CPU.
   * If enabling of any capability fails the error is returned. After 
enabling a
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed48a..c2cd442844df 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -951,6 +951,7 @@ void __init start_xen(unsigned long boot_phys_offset,
       * (called from smp_init_cpus()).
       */
      check_local_cpu_errata();
+    check_local_cpu_features();

      init_xen_time();

@@ -1021,6 +1022,7 @@ void __init start_xen(unsigned long boot_phys_offset,
       */
      apply_alternatives_all();
      enable_errata_workarounds();
+    enable_cpu_features();

      /* Create initial domain 0. */
      if ( !is_dom0less_mode() )
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7bfd0a73a7d2..d6b8c598df98 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -383,6 +383,7 @@ void start_secondary(void)
      local_abort_enable();

      check_local_cpu_errata();
+    check_local_cpu_features();

      printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());

Cheers,

-- 
Julien Grall

