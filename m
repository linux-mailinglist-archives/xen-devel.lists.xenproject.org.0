Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D6E756E80
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 22:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564840.882558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLV1g-0007hN-0i; Mon, 17 Jul 2023 20:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564840.882558; Mon, 17 Jul 2023 20:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLV1f-0007e3-Tt; Mon, 17 Jul 2023 20:40:59 +0000
Received: by outflank-mailman (input) for mailman id 564840;
 Mon, 17 Jul 2023 20:40:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLV1e-0007dv-UP
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 20:40:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLV1d-0002hN-WF; Mon, 17 Jul 2023 20:40:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLV1d-0006nj-Pn; Mon, 17 Jul 2023 20:40:57 +0000
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
	bh=xnBMSisHP56m2fXP1o+etHLART964t123ZoOCcxrJqs=; b=ExIA1PtEufi6N7Kgfu7aNzTXqh
	RzEIJOmvFa9EujUWoV3p2D4Xm5m4wmqYic+uJIijSgAFGffvB0XFws/Evzr5EC15/zem5nufuP3QW
	HlMzGVvNDDFjpUZMb9kT9plggCFH4UmkY5jDnbalV8UeP+lZGjxKidicvgsxI6aTzbWs=;
Message-ID: <76cb0f23-ebcb-2c51-2312-c926b0d6d570@xen.org>
Date: Mon, 17 Jul 2023 21:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/07/2023 12:49, Nicola Vetrini wrote:
> The macro 'testop' expands to a function that declares the local
> variable 'oldbit', which is written before being set, but is such a
> way that is not amenable to automatic checking.
> 
> Therefore, a deviation comment, is introduced to document this situation.
> 
> A similar reasoning applies to macro 'guest_testop'.

Would you be able to check if the code below (only compile tested so 
far) would silence Eclair?

diff --git a/xen/arch/arm/arm64/lib/bitops.c 
b/xen/arch/arm/arm64/lib/bitops.c
index 20e3f3d6ceaf..f7a10b790f2a 100644
--- a/xen/arch/arm/arm64/lib/bitops.c
+++ b/xen/arch/arm/arm64/lib/bitops.c
@@ -64,13 +64,15 @@ bool name##_timeout(int nr, volatile void *p, 
unsigned int max_try)         \
  }

  #define testop(name, instr) 
      \
-static always_inline bool int_##name(int nr, volatile void *p, int 
*oldbit, \
-                                     bool timeout, unsigned int 
max_try)    \
+static always_inline int int_##name(int nr, volatile void *p, 
     \
+                                    bool allow_timeout, bool *timeout, 
     \
+                                    unsigned int max_try) 
     \
  { 
      \
      volatile uint32_t *ptr = (uint32_t *)p + BITOP_WORD((unsigned 
int)nr);  \
      unsigned int bit = (unsigned int)nr % BITOP_BITS_PER_WORD; 
      \
      const uint32_t mask = BITOP_MASK(bit); 
      \
      unsigned long res, tmp; 
      \
+    int oldbit; 
     \
 
      \
      do 
      \
      { 
      \
@@ -79,27 +81,30 @@ static always_inline bool int_##name(int nr, 
volatile void *p, int *oldbit, \
          "   lsr     %w1, %w3, %w5 // Save old value of bit\n" 
      \
          "   " __stringify(instr) "  %w3, %w3, %w4 // Toggle bit\n" 
      \
          "   stlxr   %w0, %w3, %2\n" 
      \
-        : "=&r" (res), "=&r" (*oldbit), "+Q" (*ptr), "=&r" (tmp) 
     \
+        : "=&r" (res), "=&r" (oldbit), "+Q" (*ptr), "=&r" (tmp) 
     \
          : "r" (mask), "r" (bit) 
      \
          : "memory"); 
      \
 
      \
          if ( !res ) 
      \
              break; 
      \
-    } while ( !timeout || ((--max_try) > 0) ); 
     \
+    } while ( !allow_timeout || ((--max_try) > 0) ); 
     \
 
      \
      dmb(ish); 
      \
 
      \
-    *oldbit &= 1; 
     \
+    ASSERT(!allow_timeout || timeout); 
     \
+    if ( timeout ) 
     \
+        *timeout = !res; 
     \
+    else if ( !res ) 
     \
+        ASSERT_UNREACHABLE(); 
     \
 
      \
-    return !res; 
     \
+    return (oldbit & 1); 
     \
  } 
      \
 
      \
  int name(int nr, volatile void *p) 
      \
  { 
      \
      int oldbit; 
      \
 
      \
-    if ( !int_##name(nr, p, &oldbit, false, 0) ) 
     \
-        ASSERT_UNREACHABLE(); 
     \
+    oldbit = int_##name(nr, p, false, NULL, 0); 
     \
 
      \

Cheers,

-- 
Julien Grall

