Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C323502C6
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 16:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103986.198389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcDD-0004zH-QH; Wed, 31 Mar 2021 14:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103986.198389; Wed, 31 Mar 2021 14:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcDD-0004ys-N2; Wed, 31 Mar 2021 14:52:51 +0000
Received: by outflank-mailman (input) for mailman id 103986;
 Wed, 31 Mar 2021 14:52:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRcDC-0004yS-LN
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 14:52:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a77c29d7-50b4-40b5-90e7-52b253142f5a;
 Wed, 31 Mar 2021 14:52:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C663B2DA;
 Wed, 31 Mar 2021 14:52:48 +0000 (UTC)
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
X-Inumbo-ID: a77c29d7-50b4-40b5-90e7-52b253142f5a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617202368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A1BHKYM+Ff6UIACv3jUaSS+yjnzq03L0EVefsI+POL8=;
	b=nhm2dtWIkQcnURa33yUyzR/eEteza4bhhDTEddPuLIG3kx0uK4QkKXKRdoYeLqQo8u3UGq
	x3NVAJ49C4mE41GHEP8ANmSxks5fG4Dcxe7ADrFoH9ATkwHBWoLiThJy+I1jWPvvQNV8oD
	tYsB/YeDwpfB0EPCISlwRTi3djK6PWg=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] fix for_each_cpu() again for NR_CPUS=1
Message-ID: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
Date: Wed, 31 Mar 2021 16:52:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Unfortunately aa50f45332f1 ("xen: fix for_each_cpu when NR_CPUS=1") has
caused quite a bit of fallout with gcc10, e.g. (there are at least two
more similar ones, and I didn't bother trying to find them all):

In file included from .../xen/include/xen/config.h:13,
                 from <command-line>:
core_parking.c: In function ‘core_parking_power’:
.../xen/include/asm/percpu.h:12:51: error: array subscript 1 is above array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds]
   12 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
.../xen/include/xen/compiler.h:141:29: note: in definition of macro ‘RELOC_HIDE’
  141 |     (typeof(ptr)) (__ptr + (off)); })
      |                             ^~~
core_parking.c:133:39: note: in expansion of macro ‘per_cpu’
  133 |             core_tmp = cpumask_weight(per_cpu(cpu_core_mask, cpu));
      |                                       ^~~~~~~
In file included from .../xen/include/xen/percpu.h:4,
                 from .../xen/include/asm/msr.h:7,
                 from .../xen/include/asm/time.h:5,
                 from .../xen/include/xen/time.h:76,
                 from .../xen/include/xen/spinlock.h:4,
                 from .../xen/include/xen/cpu.h:5,
                 from core_parking.c:19:
.../xen/include/asm/percpu.h:6:22: note: while referencing ‘__per_cpu_offset’
    6 | extern unsigned long __per_cpu_offset[NR_CPUS];
      |                      ^~~~~~~~~~~~~~~~

One of the further errors even went as far as claiming that an array
index (range) of [0, 0] was outside the bounds of a [1] array, so
something fishy is pretty clearly going on there.

The compiler apparently wants to be able to see that the loop isn't
really a loop in order to avoid triggering such warnings, yet what
exactly makes it consider the loop exit condition constant and within
the [0, 1] range isn't obvious - using ((mask)->bits[0] & 1) instead of
cpumask_test_cpu() for example did _not_ help.

Re-instate a special form of for_each_cpu(), experimentally "proven" to
avoid the diagnostics.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -368,10 +368,15 @@ static inline void free_cpumask_var(cpum
 #define FREE_CPUMASK_VAR(m) free_cpumask_var(m)
 #endif
 
+#if NR_CPUS > 1
 #define for_each_cpu(cpu, mask)			\
 	for ((cpu) = cpumask_first(mask);	\
 	     (cpu) < nr_cpu_ids;		\
 	     (cpu) = cpumask_next(cpu, mask))
+#else /* NR_CPUS == 1 */
+#define for_each_cpu(cpu, mask)			\
+	for ((cpu) = 0; (cpu) < cpumask_test_cpu(0, mask); ++(cpu))
+#endif /* NR_CPUS */
 
 /*
  * The following particular system cpumasks and operations manage

