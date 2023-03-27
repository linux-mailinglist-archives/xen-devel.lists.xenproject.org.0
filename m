Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675B6CADBA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 20:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515416.798296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqf-0000mO-F2; Mon, 27 Mar 2023 18:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515416.798296; Mon, 27 Mar 2023 18:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqf-0000jl-B3; Mon, 27 Mar 2023 18:45:41 +0000
Received: by outflank-mailman (input) for mailman id 515416;
 Mon, 27 Mar 2023 18:45:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgrqd-0000YR-Eo
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 18:45:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqc-0004Ph-0m; Mon, 27 Mar 2023 18:45:38 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqb-00044j-PN; Mon, 27 Mar 2023 18:45:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=8HcbJC+XqqaA7nFlJfe2PeQAu9eLnYEVh/AG6X4EX/o=; b=3mPcLOCxVuWw+L+zoshgZ0DJFv
	jrpjs41IONDOp7lXI+wxUjDosd8yAksFYzE7YoeyESqJbzXO7OsjUzvxH+1u7kV+tCVtvFtiF08PU
	29CUMOtxo8p0qVFd38PcvGUGwEFd0g5w94yozAqztk+DbsHHiExpR0vBB7h9oTqyU/KA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 6/7] xen/x86: Replace GPL v2.0+ license boilerplate with an SPDX tag in *.c
Date: Mon, 27 Mar 2023 19:45:19 +0100
Message-Id: <20230327184520.81828-7-julien@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327184520.81828-1-julien@xen.org>
References: <20230327184520.81828-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is easier to understand the license of a file when using SPDX.

This is replacing the below pattern with the SPDX tag GPL-2.0-or-later
in xen/arch/x86/*.c:

 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - The license is GPLv2.0+ rather than GPLv2.0

42sh> cat gpl-2.0+-pattern-1.txt
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.
42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0+-pattern-1.txt GPL-2.0-or-later {} \;
---
 xen/arch/x86/alternative.c             | 14 +-------------
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c | 14 +-------------
 xen/arch/x86/cpu/mcheck/mce_amd.c      | 14 +-------------
 xen/arch/x86/cpu/mcheck/vmce.c         | 14 +-------------
 xen/arch/x86/guest/hyperv/hyperv.c     | 14 +-------------
 xen/arch/x86/guest/hyperv/tlb.c        | 14 +-------------
 xen/arch/x86/guest/hyperv/util.c       | 14 +-------------
 xen/arch/x86/guest/hypervisor.c        | 14 +-------------
 xen/arch/x86/guest/xen/pvh-boot.c      | 14 +-------------
 xen/arch/x86/guest/xen/xen.c           | 14 +-------------
 xen/arch/x86/hvm/grant_table.c         | 14 +-------------
 xen/arch/x86/hvm/hypercall.c           | 14 +-------------
 xen/arch/x86/hypercall.c               | 14 +-------------
 xen/arch/x86/mm.c                      | 14 +-------------
 xen/arch/x86/mm/guest_walk.c           | 14 +-------------
 xen/arch/x86/mm/hap/hap.c              | 14 +-------------
 xen/arch/x86/mm/hap/nested_hap.c       | 14 +-------------
 xen/arch/x86/mm/mem_access.c           | 14 +-------------
 xen/arch/x86/mm/mem_paging.c           | 14 +-------------
 xen/arch/x86/mm/mem_sharing.c          | 14 +-------------
 xen/arch/x86/mm/nested.c               | 14 +-------------
 xen/arch/x86/mm/p2m-basic.c            | 14 +-------------
 xen/arch/x86/mm/p2m-pod.c              | 14 +-------------
 xen/arch/x86/mm/p2m-pt.c               | 14 +-------------
 xen/arch/x86/mm/p2m.c                  | 14 +-------------
 xen/arch/x86/mm/paging.c               | 14 +-------------
 xen/arch/x86/mm/physmap.c              | 14 +-------------
 xen/arch/x86/mm/shadow/common.c        | 14 +-------------
 xen/arch/x86/mm/shadow/hvm.c           | 14 +-------------
 xen/arch/x86/mm/shadow/multi.c         | 14 +-------------
 xen/arch/x86/mm/shadow/pv.c            | 14 +-------------
 xen/arch/x86/mm/shadow/set.c           | 14 +-------------
 xen/arch/x86/msr.c                     | 14 +-------------
 xen/arch/x86/pv/emul-gate-op.c         | 14 +-------------
 xen/arch/x86/pv/emul-inv-op.c          | 14 +-------------
 xen/arch/x86/pv/emul-priv-op.c         | 14 +-------------
 xen/arch/x86/pv/emulate.c              | 14 +-------------
 xen/arch/x86/pv/hypercall.c            | 14 +-------------
 xen/arch/x86/pv/misc-hypercalls.c      | 14 +-------------
 xen/arch/x86/pv/ro-page-fault.c        | 14 +-------------
 xen/arch/x86/pv/shim.c                 | 14 +-------------
 xen/arch/x86/pv/traps.c                | 14 +-------------
 xen/arch/x86/smpboot.c                 | 14 +-------------
 xen/arch/x86/spec_ctrl.c               | 14 +-------------
 xen/arch/x86/traps.c                   | 14 +-------------
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 +-------------
 46 files changed, 46 insertions(+), 598 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 0c6fc7b4fb0c..2383fa66294c 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -1,18 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * alternative.c
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/delay.h>
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index efb45c931e1f..7d48c9ab5f7a 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * MCA implementation for AMD CPUs
  * Copyright (c) 2007 Advanced Micro Devices, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index d7ae8919df77..3c374fd4e4e9 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * common MCA implementation for AMD CPUs.
  * Copyright (c) 2012-2014 Advanced Micro Devices, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /* K8 common MCA documentation published at
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index af30811afd44..40cc2c5230d7 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * vmce.c - provide software emulated vMCE support to guest
  *
  * Copyright (C) 2010, 2011 Jiang, Yunhong <yunhong.jiang@intel.com>
  * Copyright (C) 2012, 2013 Liu, Jinsong <jinsong.liu@intel.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index b101ba3080b4..aacc7a61670b 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/guest/hyperv/hyperv.c
  *
  * Support for detecting and running under Hyper-V.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2019 Microsoft.
  */
 #include <xen/init.h>
diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
index f249b259253d..ef930efa954b 100644
--- a/xen/arch/x86/guest/hyperv/tlb.c
+++ b/xen/arch/x86/guest/hyperv/tlb.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/guest/hyperv/tlb.c
  *
  * Support for TLB management using hypercalls
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2020 Microsoft.
  */
 
diff --git a/xen/arch/x86/guest/hyperv/util.c b/xen/arch/x86/guest/hyperv/util.c
index 2c5f421b7bd9..a88699e818b7 100644
--- a/xen/arch/x86/guest/hyperv/util.c
+++ b/xen/arch/x86/guest/hyperv/util.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/guest/hyperv/util.c
  *
  * Hyper-V utility functions
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2020 Microsoft.
  */
 
diff --git a/xen/arch/x86/guest/hypervisor.c b/xen/arch/x86/guest/hypervisor.c
index 366af1d65001..b8549a131a5a 100644
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/guest/hypervisor.c
  *
  * Support for detecting and running under a hypervisor.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2019 Microsoft.
  */
 #include <xen/cpumask.h>
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 498625eae0a3..9cbe87b61bdd 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/guest/pvh-boot.c
  *
  * PVH boot time support
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/init.h>
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 9c2defaa6621..f93dfc89f724 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/guest/xen.c
  *
  * Support for detecting and running under Xen.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/event.h>
diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
index b7a896ea5855..30d51d54a949 100644
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/hvm/grant_table.c
  *
  * Grant table interfaces for HVM guests
  *
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 405d0a95afd8..20d266ffd53a 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/hvm/hypercall.c
  *
  * HVM hypercall dispatching routines
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/lib.h>
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 6b73cff9b9ff..cc9a6a9d59a0 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/hypercall.c
  *
  * Common x86 hypercall infrastructure.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2015,2016 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0fe14faa5fa7..daa5fa78d1ac 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm.c
  *
  * Copyright (c) 2002-2005 K A Fraser
  * Copyright (c) 2004 Christian Limpach
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index 76b4e0425887..fe7393334fcb 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/guest_walk.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 16e9c3325f9b..de1b8189d924 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/hap/hap.c
  *
  * hardware assisted paging
  * Copyright (c) 2007 Advanced Micro Devices (Wei Huang)
  * Parts of this code are Copyright (c) 2007 by XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 098e8e5d4ca9..ee78a797d1a4 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/hap/nested_hap.c
  *
  * Code for Nested Virtualization
  * Copyright (c) 2011 Advanced Micro Devices
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index f3aed9fcc966..4b03effaaae7 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/mem_access.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h> /* copy_from_guest() */
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786ee0..2c2b34ccf60a 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/mem_paging.c
  *
  * Memory paging support.
  *
  * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 649d93dc5444..a7f94bced46c 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/mem_sharing.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2011 GridCentric, Inc. (Adin Scannell & Andres Lagar-Cavilla)
  * Copyright (c) 2009 Citrix Systems, Inc. (Grzegorz Milos)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/nested.c b/xen/arch/x86/mm/nested.c
index fab62b2b2dc1..03741ffae441 100644
--- a/xen/arch/x86/mm/nested.c
+++ b/xen/arch/x86/mm/nested.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/nested.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 47b780d6d63a..8599bd15c61a 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/p2m-basic.c
  *
@@ -8,19 +9,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index c75a60c19fba..9969eb45fa8c 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/p2m-pod.c
  *
  * Populate-on-demand p2m entries.
  *
  * Copyright (c) 2009-2011 Citrix Systems, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index cd1af33b6772..6d1bb5daadb9 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/p2m-pt.c
  *
@@ -9,19 +10,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 7e481aec380a..714358f953f2 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/p2m.c
  *
@@ -8,19 +9,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index ff5b480677ca..9ec305730a6d 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/paging.c
  *
  * x86 specific paging support
  * Copyright (c) 2007 Advanced Micro Devices (Wei Huang)
  * Copyright (c) 2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/mm/physmap.c b/xen/arch/x86/mm/physmap.c
index 2d267b42f73b..f1695e456e85 100644
--- a/xen/arch/x86/mm/physmap.c
+++ b/xen/arch/x86/mm/physmap.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/physmap.c
  *
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006-2007 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 1c1b0ad0d827..0f3a369d89c3 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/shadow/common.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index e2ee1c77056f..0bb341c13e0b 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 
 /******************************************************************************
  * arch/x86/mm/shadow/hvm.c
@@ -6,19 +7,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 8699de050127..6fd70cf3f280 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/shadow/multi.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/shadow/pv.c b/xen/arch/x86/mm/shadow/pv.c
index 0ef8e53d1279..345fd5419a13 100644
--- a/xen/arch/x86/mm/shadow/pv.c
+++ b/xen/arch/x86/mm/shadow/pv.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/shadow/pv.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/shadow/set.c b/xen/arch/x86/mm/shadow/set.c
index bd6c68b547c9..8b670b6bb555 100644
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/mm/shadow/set.c
  *
@@ -5,19 +6,6 @@
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #define GUEST_PAGING_LEVELS 0
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 7ddf0078c3a2..639d13992c52 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/msr.c
  *
  * Policy objects for Model-Specific Registers.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 758a20ad9df4..107c58b3485c 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/emul-gate-op.c
  *
  * Emulate gate op for PV guests
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/err.h>
diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index 2c07eed9a092..d89708afe94b 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/emul-inv-op.c
  *
  * Emulate invalid op for PV guests
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/pv/trace.h>
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 5da00e24e4ff..4242456165e9 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/emul-priv-op.c
  *
  * Emulate privileged instructions for PV guests
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 0a7907ec5e84..e763571b38fc 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/emulate.c
  *
  * Common PV emulation code
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 2eedfbfae864..4294e930128b 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/hypercall.c
  *
  * PV hypercall dispatching routines
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index aaaf70eb6330..b11bd718b7de 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/misc-hypercalls.c
  *
  * Misc hypercall handlers
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/hypercall.h>
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 5963f5ee2d51..c15e5971a27c 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/ro-page-fault.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2002-2005 K A Fraser
  * Copyright (c) 2004 Christian Limpach
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <asm/pv/trace.h>
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index ae1a0e6e65af..404408711972 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/shim.c
  *
  * Functionaltiy for PV Shim mode
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 #include <xen/event.h>
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 97fe54b5ee5a..6d330dfe2d1c 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -1,21 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/pv/traps.c
  *
  * PV low level entry points.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b26758c2c89f..cf9bb220f90d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1,22 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * x86 SMP booting functions
  *
  * This inherits a great deal from Linux's SMP boot code:
  *  (c) 1995 Alan Cox, Building #3 <alan@redhat.com>
  *  (c) 1998, 1999, 2000 Ingo Molnar <mingo@redhat.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index e80e2a5ed1a9..f81db2143328 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/spec_ctrl.c
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (c) 2017-2018 Citrix Systems Ltd.
  */
 #include <xen/errno.h>
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8fa..2397ae299552 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1,20 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * arch/x86/traps.c
  *
  * Modifications to Linux original are copyright (c) 2002-2004, K A Fraser
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e38f98b54726..66c0395d1beb 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /******************************************************************************
  * x86_emulate.c
  *
@@ -5,19 +6,6 @@
  *
  * Copyright (c) 2005-2007 Keir Fraser
  * Copyright (c) 2005-2007 XenSource Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
 /* Operand sizes: 8-bit operands or specified/overridden size. */
-- 
2.39.2


