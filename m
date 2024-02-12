Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA5851CF5
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 19:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679696.1057306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZbCM-0007ob-SQ; Mon, 12 Feb 2024 18:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679696.1057306; Mon, 12 Feb 2024 18:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZbCM-0007lf-Po; Mon, 12 Feb 2024 18:38:34 +0000
Received: by outflank-mailman (input) for mailman id 679696;
 Mon, 12 Feb 2024 18:38:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZbCL-0007lZ-N7
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 18:38:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZbCK-0003AO-7F; Mon, 12 Feb 2024 18:38:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZbCJ-0000w0-Tz; Mon, 12 Feb 2024 18:38:32 +0000
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
	bh=wW9OZL67jLnN0yjB6N2SrzdWDC25QQCKYvxPL9HRe+c=; b=Ree2ebO9LjHh/2MtfcGEl2j7A2
	qEGHTKgF16h8PMQSa6cqOYuq8/unUW47PvBdRfmObcBImqabWN45S6AttRgv2/vcxPNX1YIbHY65D
	GNkL9Dj6oivnnxP65HkHU0MqSUrSUo8oa74Q8m3x/pgd2G25y7Rk7oN74UF14FaHxV1M=;
Message-ID: <09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org>
Date: Mon, 12 Feb 2024 18:38:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, Roger Pau
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
 <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
 <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
 <99faac70440a68824a17fcaaea55ef48@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <99faac70440a68824a17fcaaea55ef48@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicola,

On 12/02/2024 14:56, Nicola Vetrini wrote:
> On 2024-02-12 09:26, Jan Beulich wrote:
>> On 10.02.2024 11:17, Julien Grall wrote:
>>> Hi,
>>>
>>> On 09/02/2024 22:02, Stefano Stabellini wrote:
>>>> On Fri, 9 Feb 2024, Nicola Vetrini wrote:
>>>>> Hi all,
>>>>>
>>>>> In the context of violations of MISRA C:2012 Rule 17.7: "The value 
>>>>> returned by
>>>>> a function having non-void return type shall be used", I was 
>>>>> looking at the
>>>>> function "clean_and_invalidate_dcache_va_range". It has the following
>>>>> signature on both arm and x86:
>>>>>
>>>>> static inline int clean_and_invalidate_dcache_va_range
>>>>>      (const void *p, unsigned long size)
>>>>>
>>>>> The commit that introduced it for Arm ~9 years ago (71d64afe3e12: 
>>>>> "arm: return
>>>>> int from *_dcache_va_range") [1] mentions that on Arm it can't 
>>>>> fail, but
>>>>> supposedly it can on x86.
>>>>>
>>>>> However, as far as I can tell, for both arch-es the implementation 
>>>>> now always
>>>>> returns 0 [2][3], so perhaps the mention of -EOPNOTSUPP for x86 is 
>>>>> no longer
>>>>> true (I wasn't able to reconstruct if there was a time at which 
>>>>> this was true,
>>>>> even in the same commit that changed the return type to int).
>>>>>
>>>>> The question is: should the return type be void, since it appears 
>>>>> that every
>>>>> user is ignoring the returned value (violating the rule), except 
>>>>> the one in
>>>>> common/grant_table.c [4]?
>>>>
>>>> Looking at the implementation on both ARM and x86, I am in favor of
>>>> changing the return type to void
>>> I think we need some consistency between all the cache flush helpers
>>> (clean_and_invalidate_dcache_va_range, invalidate_dcache_va_range() and
>>> clean_dcache_va_range()). They should all return a values or not 
>>> return any.
>>
>> +1
>>
> 
> I agree. I took this helper as an example, but e.g. 
> invalidate_dcache_va_range returns -EOPNOTSUPP on x86 and it's only used 
> in common/grant_table.
> Perhaps the signatures should remain as is for consistency, especially 
> given the remark below about the other architectures, and this would 
> entail a deviation.

In general, I am not in favor of adding a deviation if the code can be 
changed. In this case, we could have (untested and just a hack to show 
my point):

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 5721eab22561..ae9ccf5388fc 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3573,7 +3573,13 @@ static int _cache_flush(const 
gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref
      v += cflush->offset;

      if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op & 
GNTTAB_CACHE_CLEAN) )
-        ret = clean_and_invalidate_dcache_va_range(v, cflush->length);
+    {
+#ifdef clean_and_invalidate_dcache_va_range
+        clean_and_invalidate_dcache_va_range(v, cflush->length);
+        ret = 0;
+#else
+        ret = -ENOSYS;
+#endif
      else if ( cflush->op & GNTTAB_CACHE_INVAL )
          ret = invalidate_dcache_va_range(v, cflush->length);
      else if ( cflush->op & GNTTAB_CACHE_CLEAN )

An alternative would be to introduced arch_grant_cache_flush() and move 
the if/else logic there. Something like:

diff --git a/xen/arch/arm/include/asm/page.h 
b/xen/arch/arm/include/asm/page.h
index 69f817d1e68a..4a3de49762a1 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -281,6 +281,19 @@ static inline void write_pte(lpae_t *p, lpae_t pte)
      dsb(sy);
  }

+static inline arch_grant_cache_flush(unsigned int op, const void *p, 
unsigned long size)
+{
+    unsigned int order = get_order_from_bytes(size);
+
+    if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op & 
GNTTAB_CACHE_CLEAN) )
+        clean_and_invalidate_dcache_va_range(v, cflush->length);
+    else if ( cflush->op & GNTTAB_CACHE_INVAL )
+        invalidate_dcache_va_range(v, cflush->length);
+    else if ( cflush->op & GNTTAB_CACHE_CLEAN )
+        clean_dcache_va_range(v, cflush->length);
+
+    return 0;
+}

  /* Flush the dcache for an entire page. */
  void flush_page_to_ram(unsigned long mfn, bool sync_icache);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 424744ad5e1a..647e1522466d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -735,8 +735,7 @@ void asmlinkage __init start_xen(unsigned long 
boot_phys_offset,
                fdt_paddr);

      /* Register Xen's load address as a boot module. */
-    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
-                             virt_to_maddr(_start),
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN, virt_to_maddr(_start),
                               (paddr_t)(uintptr_t)(_end - _start), false);
      BUG_ON(!xen_bootmodule);

diff --git a/xen/arch/x86/include/asm/flushtlb.h 
b/xen/arch/x86/include/asm/flushtlb.h
index bb0ad58db49b..dfe51cddde90 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -182,23 +182,22 @@ void flush_area_mask(const cpumask_t *mask, const 
void *va,
  }

  static inline void flush_page_to_ram(unsigned long mfn, bool 
sync_icache) {}
-static inline int invalidate_dcache_va_range(const void *p,
-                                             unsigned long size)
-{ return -EOPNOTSUPP; }
-static inline int clean_and_invalidate_dcache_va_range(const void *p,
-                                                       unsigned long size)
+
+unsigned int guest_flush_tlb_flags(const struct domain *d);
+void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
+
+static inline arch_grant_cache_flush(unsigned int op, const void *p, 
unsigned long size)
  {
-    unsigned int order = get_order_from_bytes(size);
+    unsigned int order;
+
+    if ( !(cflush->op & GNTTAB_CACHE_CLEAN) )
+        return -EOPNOTSUPP;
+
+    order = get_order_from_bytes(size);
      /* sub-page granularity support needs to be added if necessary */
      flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
+
      return 0;
  }
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
-{
-    return clean_and_invalidate_dcache_va_range(p, size);
-}
-
-unsigned int guest_flush_tlb_flags(const struct domain *d);
-void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);

  #endif /* __FLUSHTLB_H__ */

I have a slight preference for the latter. I would like to hear the 
opinion of the others.

Cheers,

-- 
Julien Grall

