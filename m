Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060D5B37B8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 14:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404284.646706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWd6J-0001Kb-OB; Fri, 09 Sep 2022 12:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404284.646706; Fri, 09 Sep 2022 12:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWd6J-0001Hu-L3; Fri, 09 Sep 2022 12:27:15 +0000
Received: by outflank-mailman (input) for mailman id 404284;
 Fri, 09 Sep 2022 12:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWd6I-0001Ho-RO
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 12:27:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWd6G-0001Is-5c; Fri, 09 Sep 2022 12:27:12 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWd6F-00015c-V0; Fri, 09 Sep 2022 12:27:12 +0000
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
	bh=m95o/NH+IqGlXihnxCEIEF7pnCRsl1OPHbUnmGLS/9U=; b=Rgnx9X/K/o7nS4dXVgRUa704q5
	pL0W9r78MenWuRta99OWXS/CFyXPuhjpPW198C2Qfjwux1H4SrzA7HGwkTGdgciqALgd3dDEF9gmL
	HIX2ShIv2O8tBlY0+iCOUla4d8ORhnsYIuLHmBYLscUhipH0X0AacCKuLom4aW7KIIas=;
Message-ID: <7eebd88b-f7a5-5dd3-7482-5086cd745940@xen.org>
Date: Fri, 9 Sep 2022 13:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1c23930f-e809-d623-18ec-599a0e983b7a@suse.com>
 <bf0d5470-efce-c7f7-d429-78d7fb9517d1@xen.org>
 <6da822fb-e900-156b-334d-8bc573b74aee@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6da822fb-e900-156b-334d-8bc573b74aee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/09/2022 13:14, Jan Beulich wrote:
> On 09.09.2022 13:00, Julien Grall wrote:
>> On 09/09/2022 11:18, Jan Beulich wrote:
>>> Gcc12 takes issue with core_parking_remove()'s
>>>
>>>       for ( ; i < cur_idle_nums; ++i )
>>>           core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>>>
>>> complaining that the right hand side array access is past the bounds of
>>> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
>>> zero in this case (as the sole CPU cannot be parked).
>>>
>>> Beyond addressing the immediate issue also adjust core_parking_init():
>>> There's no point registering any policy when there's no CPU to park.
>>> Since this still doesn't result in the compiler spotting that
>>> core_parking_policy is never written (and hence is continuously NULL),
>>> also amend core_parking_helper() to avoid eventual similar issues there
>>> (minimizing generated code at the same time).
>>
>> Given that CONFIG_NR_CPUS is a build time option. Wouldn't it be better
>> to set CONFIG_CORE_PARKING=n and provide dummy helper for any function
>> that may be called unconditionally?
> 
> That might be an option, yes; not sure whether that's really better. It's
> likely a more intrusive change ...

I quickly try to implement it (see below) and the result is IHMO a lot 
nicer and make clear the code is not necessary on uni-processor.

This is only compile tested.

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba3c..f9a3daccdc92 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -10,7 +10,7 @@ config X86
         select ALTERNATIVE_CALL
         select ARCH_MAP_DOMAIN_PAGE
         select ARCH_SUPPORTS_INT128
-       select CORE_PARKING
+       select CORE_PARKING if NR_CPUS > 1
         select HAS_ALTERNATIVE
         select HAS_COMPAT
         select HAS_CPUFREQ
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index 41a3b6a0dadf..7baca00be182 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -61,7 +61,15 @@ long cf_check cpu_up_helper(void *data);
  long cf_check cpu_down_helper(void *data);

  long cf_check core_parking_helper(void *data);
+
+#ifdef CONFIG_CORE_PARKING
  bool core_parking_remove(unsigned int cpu);
+#else
+static inline bool core_parking_remove(unsigned int cpu)
+{
+    return false;
+}
+#endif
  uint32_t get_cur_idle_nums(void);

  /*
diff --git a/xen/arch/x86/platform_hypercall.c 
b/xen/arch/x86/platform_hypercall.c
index a7341dc3d7d3..5d13fac41bd4 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -718,6 +718,7 @@ ret_t do_platform_op(
                        op->u.mem_add.pxm);
          break;

+#ifdef CONFIG_CORE_PARKING
      case XENPF_core_parking:
      {
          uint32_t idle_nums;
@@ -743,6 +744,7 @@ ret_t do_platform_op(
          }
      }
      break;
+#endif

      case XENPF_resource_op:
      {

Cheers,

-- 
Julien Grall

