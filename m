Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDFE87CBE1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693784.1082354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Pr-0001MT-V7; Fri, 15 Mar 2024 11:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693784.1082354; Fri, 15 Mar 2024 11:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Pr-0001K2-S6; Fri, 15 Mar 2024 11:07:59 +0000
Received: by outflank-mailman (input) for mailman id 693784;
 Fri, 15 Mar 2024 11:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mWO=KV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rl5Pq-0001J2-Eu
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 11:07:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47868e4a-e2bc-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 12:07:57 +0100 (CET)
Received: from [172.20.10.8] (unknown [78.211.227.3])
 by support.bugseng.com (Postfix) with ESMTPSA id B8FEA4EE073C;
 Fri, 15 Mar 2024 12:07:56 +0100 (CET)
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
X-Inumbo-ID: 47868e4a-e2bc-11ee-afdd-a90da7624cb6
Message-ID: <42d630c9-e311-4e17-9fae-e14ec81a339e@bugseng.com>
Date: Fri, 15 Mar 2024 12:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Subject: x86/bitops and MISRA C:2012 Rule 5.5
Organization: BUGSENG
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

there are violations of Rule 5.5 ("Identifiers shall be distinct
from macro names") in xen/arch/x86/include/asm/bitops.h.
You can see them at [1].

Do you agree to distinguish between function-like macros and
inline functions by adding a suffix to the functions?
I thought about "_unsafe" or "_nocheck" suffixes.
As an example:

@@ -32,14 +32,14 @@ extern void __bitop_bad_size(void);
   * Note that @nr may be almost arbitrarily large; this function is not
   * restricted to acting on a single-word quantity.
   */
-static inline void set_bit(int nr, volatile void *addr)
+static inline void set_bit_unsafe(int nr, volatile void *addr)
  {
      asm volatile ( "lock; btsl %1,%0"
                     : "+m" (ADDR) : "Ir" (nr) : "memory");
  }
  #define set_bit(nr, addr) ({                            \
      if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    set_bit(nr, addr);                                  \
+    set_bit_unsafe(nr, addr);                           \
  })


[1]
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/575/PROJECT.ecd;/by_service/MC3R1.R5.5.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/arch/x86/include/asm/bitops.h"}]}]}}}

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

