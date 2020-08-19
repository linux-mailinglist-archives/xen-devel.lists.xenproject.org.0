Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE424A465
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RKM-0003qq-1u; Wed, 19 Aug 2020 16:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RKK-0003kZ-Kn
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:40 +0000
X-Inumbo-ID: 2bf223f3-0ce9-4e2a-9b85-eb2b6b95b286
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bf223f3-0ce9-4e2a-9b85-eb2b6b95b286;
 Wed, 19 Aug 2020 16:52:23 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b14so22211524qkn.4
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=6C+ZIJoI1PsBZMJzrNzQwCmQ7sAP4OyoP8B6cjIdktU=;
 b=n0kFbvpwyM1iYynN6VtyJen+8NqgKEWhuNT3yBk7aQOsUiMYqmBNjsVARL6HtUps+y
 Ge74397hH7J6pU4OXb+LJSWPWTBR3il9BchBTgfOb4RP+PIodWJVT9Al6x3MY5I549nh
 f5a1Y088uEMWBgqw6hssX7nCqTWPE0jICg+VVXCKY6NmlMGjnTiDsAD3yWBY3F7BIYy4
 +DG9X3iLDtuamxhbhqdA7IcDUFMd9Wt1H28AMGZxXkDs5tk1JHD3SEZDyTD5NMvVvcaT
 yECip05DA6ECwyiOLJ7fO0zy6OI2vAnBPReyN7tZ0b9LGL1R0W1tEuFgJFgh067BbPx0
 HOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=6C+ZIJoI1PsBZMJzrNzQwCmQ7sAP4OyoP8B6cjIdktU=;
 b=LtFYqR3lJZzqqw3QBaGZhwt1COTOt7iK6jJmMBrqiBg7wpA7Lwm6bHzwCNncwGFV1I
 97h0XSttaVN5jEvbUrgB2F1fZa9ZgUgRo/Vf5YMt/OCYCieH1yEDNPRdK6m1B1zcqoN6
 ymRRB1C5BfKyHPNLcBZLuvVQvH7VgJxqfiM9s4uOSa+psns5qj7gWBofmMfMVSeDoywt
 2/r9cTOv1c7iPp6wLmJ2Ls2Md6RfWLvdncUyz35mOkDQWVh/PPMKO6IrGv6UMi17KjEY
 oc3dP1fMRKgJ1km/HXHqsrbg8U+QdKN3loM+mCb6o27FQL11zUORxg5Dp6fXqXgtzDSR
 fR6A==
X-Gm-Message-State: AOAM531hqi9agLU9JBaLa8XkrEgVgfn0T8azUSo43Lp4eUYk0K31C7Bg
 77+lHvHw+vver5Z5xaYb2Gf0+NUXx6GFGiCc
X-Google-Smtp-Source: ABdhPJwS8r/9078r661P22XKgOEaRtXY0xrQBs1NCKEuestB5XCPV/oE+kw5qFqW14sOBnTgk7lRjA==
X-Received: by 2002:a37:a655:: with SMTP id p82mr21987290qke.92.1597855943108; 
 Wed, 19 Aug 2020 09:52:23 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:22 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <dslutz@verizon.com>, Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 4/8] vmware: Add VMware provided include
 file.
Date: Wed, 19 Aug 2020 12:51:58 -0400
Message-Id: <ce3e037dc51581629fdb158f71f8f2e9e56d9eae.1597854907.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <c1560bc4cecae1c40de5f5cfc39832394f77c5ed.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
 <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
 <c1560bc4cecae1c40de5f5cfc39832394f77c5ed.1597854907.git.don.slutz@gmail.com>
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <dslutz@verizon.com>

This file: backdoor_def.h comes from:

http://packages.vmware.com/tools/esx/3.5latest/rhel4/SRPMS/index.html
 open-vm-tools-kmod-7.4.8-396269.423167.src.rpm
  open-vm-tools-kmod-7.4.8.tar.gz
   vmhgfs/backdoor_def.h

and is unchanged.

Added the badly named include file includeCheck.h also.  It only has
a comment and is provided so that backdoor_def.h can be used without
change.

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

v11,v12,v13,v14:
  No change

v10:
   Add Acked-by: Andrew Cooper

v9:
    Either the description is wrong, or the patch is stale.
      stale commit message -- fixed.
    I'd say a file with a single comment line in it would suffice.
      Done.

 xen/arch/x86/hvm/vmware/backdoor_def.h | 167 +++++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/vmware/includeCheck.h |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 xen/arch/x86/hvm/vmware/backdoor_def.h
 create mode 100644 xen/arch/x86/hvm/vmware/includeCheck.h

diff --git a/xen/arch/x86/hvm/vmware/backdoor_def.h b/xen/arch/x86/hvm/vmware/backdoor_def.h
new file mode 100644
index 0000000..e76795f
--- /dev/null
+++ b/xen/arch/x86/hvm/vmware/backdoor_def.h
@@ -0,0 +1,167 @@
+/* **********************************************************
+ * Copyright 1998 VMware, Inc.  All rights reserved. 
+ * **********************************************************
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation version 2 and no later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
+ */
+
+/*
+ * backdoor_def.h --
+ *
+ * This contains backdoor defines that can be included from
+ * an assembly language file.
+ */
+
+
+
+#ifndef _BACKDOOR_DEF_H_
+#define _BACKDOOR_DEF_H_
+
+#define INCLUDE_ALLOW_MODULE
+#define INCLUDE_ALLOW_USERLEVEL
+#define INCLUDE_ALLOW_VMMEXT
+#define INCLUDE_ALLOW_VMCORE
+#define INCLUDE_ALLOW_VMKERNEL
+#include "includeCheck.h"
+
+/*
+ * If you want to add a new low-level backdoor call for a guest userland
+ * application, please consider using the GuestRpc mechanism instead. --hpreg
+ */
+
+#define BDOOR_MAGIC 0x564D5868
+
+/* Low-bandwidth backdoor port. --hpreg */
+
+#define BDOOR_PORT 0x5658
+
+#define BDOOR_CMD_GETMHZ      		   1
+/*
+ * BDOOR_CMD_APMFUNCTION is used by:
+ *
+ * o The FrobOS code, which instead should either program the virtual chipset
+ *   (like the new BIOS code does, matthias offered to implement that), or not
+ *   use any VM-specific code (which requires that we correctly implement
+ *   "power off on CLI HLT" for SMP VMs, boris offered to implement that)
+ *
+ * o The old BIOS code, which will soon be jettisoned
+ *
+ *  --hpreg
+ */
+#define BDOOR_CMD_APMFUNCTION 		   2
+#define BDOOR_CMD_GETDISKGEO  		   3
+#define BDOOR_CMD_GETPTRLOCATION	      4
+#define BDOOR_CMD_SETPTRLOCATION	      5
+#define BDOOR_CMD_GETSELLENGTH		   6
+#define BDOOR_CMD_GETNEXTPIECE		   7
+#define BDOOR_CMD_SETSELLENGTH		   8
+#define BDOOR_CMD_SETNEXTPIECE		   9
+#define BDOOR_CMD_GETVERSION		      10
+#define BDOOR_CMD_GETDEVICELISTELEMENT	11
+#define BDOOR_CMD_TOGGLEDEVICE		   12
+#define BDOOR_CMD_GETGUIOPTIONS		   13
+#define BDOOR_CMD_SETGUIOPTIONS		   14
+#define BDOOR_CMD_GETSCREENSIZE		   15
+#define BDOOR_CMD_MONITOR_CONTROL       16
+#define BDOOR_CMD_GETHWVERSION          17
+#define BDOOR_CMD_OSNOTFOUND            18
+#define BDOOR_CMD_GETUUID               19
+#define BDOOR_CMD_GETMEMSIZE            20
+#define BDOOR_CMD_HOSTCOPY              21 /* Devel only */
+/* BDOOR_CMD_GETOS2INTCURSOR, 22, is very old and defunct. Reuse. */
+#define BDOOR_CMD_GETTIME               23 /* Deprecated. Use GETTIMEFULL. */
+#define BDOOR_CMD_STOPCATCHUP           24
+#define BDOOR_CMD_PUTCHR	        25 /* Devel only */
+#define BDOOR_CMD_ENABLE_MSG	        26 /* Devel only */
+#define BDOOR_CMD_GOTO_TCL	        27 /* Devel only */
+#define BDOOR_CMD_INITPCIOPROM		28
+#define BDOOR_CMD_INT13			29
+#define BDOOR_CMD_MESSAGE               30
+#define BDOOR_CMD_RSVD0                 31
+#define BDOOR_CMD_RSVD1                 32
+#define BDOOR_CMD_RSVD2                 33
+#define BDOOR_CMD_ISACPIDISABLED	34
+#define BDOOR_CMD_TOE			35 /* Not in use */
+/* BDOOR_CMD_INITLSIOPROM, 36, was merged with 28. Reuse. */
+#define BDOOR_CMD_PATCH_SMBIOS_STRUCTS  37
+#define BDOOR_CMD_MAPMEM                38 /* Devel only */
+#define BDOOR_CMD_ABSPOINTER_DATA	39
+#define BDOOR_CMD_ABSPOINTER_STATUS	40
+#define BDOOR_CMD_ABSPOINTER_COMMAND	41
+#define BDOOR_CMD_TIMER_SPONGE          42
+#define BDOOR_CMD_PATCH_ACPI_TABLES	43
+/* Catch-all to allow synchronous tests */
+#define BDOOR_CMD_DEVEL_FAKEHARDWARE	44 /* Debug only - needed in beta */
+#define BDOOR_CMD_GETHZ      		45
+#define BDOOR_CMD_GETTIMEFULL           46
+#define BDOOR_CMD_STATELOGGER           47
+#define BDOOR_CMD_CHECKFORCEBIOSSETUP	48
+#define BDOOR_CMD_LAZYTIMEREMULATION    49
+#define BDOOR_CMD_BIOSBBS               50
+#define BDOOR_CMD_MAX                   51
+
+/* 
+ * IMPORTANT NOTE: When modifying the behavior of an existing backdoor command,
+ * you must adhere to the semantics expected by the oldest Tools who use that
+ * command. Specifically, do not alter the way in which the command modifies 
+ * the registers. Otherwise backwards compatibility will suffer.
+ */
+
+/* High-bandwidth backdoor port. --hpreg */
+
+#define BDOORHB_PORT 0x5659
+
+#define BDOORHB_CMD_MESSAGE 0
+#define BDOORHB_CMD_MAX 1
+
+/*
+ * There is another backdoor which allows access to certain TSC-related
+ * values using otherwise illegal PMC indices when the pseudo_perfctr
+ * control flag is set.
+ */
+
+#define BDOOR_PMC_HW_TSC      0x10000
+#define BDOOR_PMC_REAL_NS     0x10001
+#define BDOOR_PMC_APPARENT_NS 0x10002
+
+#define IS_BDOOR_PMC(index)  (((index) | 3) == 0x10003)
+#define BDOOR_CMD(ecx)       ((ecx) & 0xffff)
+
+
+#ifdef VMM
+/*
+ *----------------------------------------------------------------------
+ *
+ * Backdoor_CmdRequiresFullyValidVCPU --
+ *
+ *    A few backdoor commands require the full VCPU to be valid
+ *    (including GDTR, IDTR, TR and LDTR). The rest get read/write
+ *    access to GPRs and read access to Segment registers (selectors).
+ *
+ * Result:
+ *    True iff VECX contains a command that require the full VCPU to
+ *    be valid.
+ *
+ *----------------------------------------------------------------------
+ */
+static INLINE Bool
+Backdoor_CmdRequiresFullyValidVCPU(unsigned cmd)
+{
+   return cmd == BDOOR_CMD_RSVD0 ||
+          cmd == BDOOR_CMD_RSVD1 ||
+          cmd == BDOOR_CMD_RSVD2;
+}
+#endif
+
+#endif
diff --git a/xen/arch/x86/hvm/vmware/includeCheck.h b/xen/arch/x86/hvm/vmware/includeCheck.h
new file mode 100644
index 0000000..3b63fa4
--- /dev/null
+++ b/xen/arch/x86/hvm/vmware/includeCheck.h
@@ -0,0 +1 @@
+/* Nothing here.  Just to use backdoor_def.h without change. */
-- 
1.8.3.1


