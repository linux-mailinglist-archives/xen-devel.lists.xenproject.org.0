Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C374126F3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 21:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191161.341097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSP2Q-0002GO-Bp; Mon, 20 Sep 2021 19:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191161.341097; Mon, 20 Sep 2021 19:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSP2Q-0002EJ-8P; Mon, 20 Sep 2021 19:33:14 +0000
Received: by outflank-mailman (input) for mailman id 191161;
 Mon, 20 Sep 2021 19:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSP2P-000298-CJ
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 19:33:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 973eb1fe-1a49-11ec-b881-12813bfff9fa;
 Mon, 20 Sep 2021 19:33:11 +0000 (UTC)
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
X-Inumbo-ID: 973eb1fe-1a49-11ec-b881-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632166391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=98GnhCIOxU7shHKzdhEM8QcX53MmCZ5qPUFcPyknb0s=;
  b=DClUa4xBKYFRzapTkkrXOFwvVJUBkiKUlWM7RZuGA1UpN5RClkmUqo97
   j3myFr7uR0FpCVPjDsuhrLYVvMZAMjlpeZcZJ8tLq7NvsXREvMA5UPnb0
   ngWKhs6yuyRkZhCeCCUou75sfAffEHDyeNR+fXIjg4BxBLp1v682XDOnm
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 18ghwp3hTIE02UOptrisiyJXOfrmU4+e1UJkVU82XqzW1YU9fFModr+qxHIBOYp8+ApcJtxoWM
 jsaWhlikkwleIMiRevafQlENT9Gu7RO8Y377Qd/jkaDKVRac06Q0tw7mhHFQz36veMlDzkpWnh
 ZGjZEvI26zynzkQ32EVahDUa5n0dJeHKTf6dcskPNXy5JI0p857LYyRs7uHYjM1uI9Uhc5h37a
 3VXy7AJux8LmHLJ9DBqqA20eMJRBK+/e/gx+eNtM5+7eyS7cLmIf9cysJ7EikN/+k3VWc+7q3w
 T8KlXkfW03cWGBtsG7hmkdBz
X-SBRS: 5.1
X-MesageID: 54949821
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RwOOl6Dip7TyqhVW//Xkw5YqxClBgxIJ4kV8jS/XYbTApDoq0jAGy
 WIdWmjUMquPNGSkKd8gO4Xn9hgFsZHWyoIyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00o7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1hKphNxX+
 ux2n5mRdSQ4Er2Lvso3akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFgGZs15AURJ4yY
 eI2TCReNT7ROCFsHQ42KJAwxNn0tGjgJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMOb4SqI9DSrnOCntSHmXIMfEpWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdxynolaUsxgEQd1SHuYmrgaXxcL8wSyUG2wFRT5pc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBTIlRTQIazk82PPmgb0Qnz7fCfBNOpfg27UZBgrML
 yC2QDkW3utI1J5QhvTjpzgrkBr3+cOYFVddChH/Gzv/t1InPtbNi5mAtACDhcusOrp1WbVoU
 JIsoMGY8OlGJpWEjiXlrA4lTezxuqrt3NExhzdS83gdG9aFoCXLkWN4umgWyKJV3iEsI2SBX
 aMrkVkNjKK/xVPzBUONX25UNyjN5fO6fekJq9iONoYeCnSPXFbfoUmCmnJ8L0iyyRNxwMnTy
 L+wcNq2DGZyNEiU5GPtHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBhVMiq9JQIJrDcSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:XMuYAapEn5Bd2Xji/GtKwiAaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,309,1624334400"; 
   d="scan'208";a="54949821"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH v2.1 15/12] xen/trace: Drop old trace macros
Date: Mon, 20 Sep 2021 20:33:02 +0100
Message-ID: <20210920193302.20275-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

With all users updated to the new API, drop the old API.  This includes all of
asm/hvm/trace.h, which allows us to drop some includes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

v2.1:
 * New
---
 xen/arch/x86/hvm/emulate.c        |   1 -
 xen/arch/x86/hvm/hpet.c           |   1 -
 xen/arch/x86/hvm/hvm.c            |   1 -
 xen/arch/x86/hvm/io.c             |   1 -
 xen/arch/x86/hvm/svm/intr.c       |   1 -
 xen/arch/x86/hvm/svm/svm.c        |   1 -
 xen/arch/x86/hvm/vmx/intr.c       |   1 -
 xen/arch/x86/hvm/vmx/vmx.c        |   1 -
 xen/include/asm-x86/hvm/trace.h   | 114 --------------------------------------
 xen/include/asm-x86/hvm/vmx/vmx.h |   1 -
 xen/include/xen/trace.h           |  35 ------------
 11 files changed, 158 deletions(-)
 delete mode 100644 xen/include/asm-x86/hvm/trace.h

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f863a19df311..a651dd395b56 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -22,7 +22,6 @@
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/monitor.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/iocap.h>
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 5873bb8a506d..1736b8f12583 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -19,7 +19,6 @@
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/trace.h>
 #include <asm/current.h>
 #include <asm/hpet.h>
 #include <asm/mc146818rtc.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index fa211d14afd8..5a81ffe9dc41 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -62,7 +62,6 @@
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/cacheattr.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/viridian.h>
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 046a8eb4ed1b..9be206488043 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -40,7 +40,6 @@
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/emulate.h>
 #include <public/sched.h>
 #include <xen/iocap.h>
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 122c9d7fbf14..154258c8b31f 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -37,7 +37,6 @@
 #include <xen/kernel.h>
 #include <public/hvm/ioreq.h>
 #include <xen/domain_page.h>
-#include <asm/hvm/trace.h>
 
 static void svm_inject_nmi(struct vcpu *v)
 {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b98a2dd71d1e..1f9dadaa173a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -55,7 +55,6 @@
 #include <asm/x86_emulate.h>
 #include <public/sched.h>
 #include <asm/hvm/vpt.h>
-#include <asm/hvm/trace.h>
 #include <asm/hap.h>
 #include <asm/apic.h>
 #include <asm/debugger.h>
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 303d07dc0a3a..ed17c79996c5 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -36,7 +36,6 @@
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/nestedhvm.h>
 #include <public/hvm/ioreq.h>
-#include <asm/hvm/trace.h>
 #include <asm/vm_event.h>
 
 /*
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 47a5df20ebc1..4f99fda8d662 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -48,7 +48,6 @@
 #include <asm/x86_emulate.h>
 #include <asm/hvm/vpt.h>
 #include <public/hvm/save.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/monitor.h>
 #include <asm/xenoprof.h>
 #include <asm/debugger.h>
diff --git a/xen/include/asm-x86/hvm/trace.h b/xen/include/asm-x86/hvm/trace.h
deleted file mode 100644
index 696e42eb9499..000000000000
--- a/xen/include/asm-x86/hvm/trace.h
+++ /dev/null
@@ -1,114 +0,0 @@
-#ifndef __ASM_X86_HVM_TRACE_H__
-#define __ASM_X86_HVM_TRACE_H__
-
-#include <xen/trace.h>
-
-#define DEFAULT_HVM_TRACE_ON  1
-#define DEFAULT_HVM_TRACE_OFF 0
-
-#define DEFAULT_HVM_VMSWITCH   DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_PF         DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_INJECT     DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_IO         DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_REGACCESS  DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_MISC       DEFAULT_HVM_TRACE_ON
-#define DEFAULT_HVM_INTR       DEFAULT_HVM_TRACE_ON
-
-#define DO_TRC_HVM_VMENTRY     DEFAULT_HVM_VMSWITCH
-#define DO_TRC_HVM_VMEXIT      DEFAULT_HVM_VMSWITCH
-#define DO_TRC_HVM_VMEXIT64    DEFAULT_HVM_VMSWITCH
-#define DO_TRC_HVM_PF_XEN      DEFAULT_HVM_PF
-#define DO_TRC_HVM_PF_XEN64    DEFAULT_HVM_PF
-#define DO_TRC_HVM_PF_INJECT   DEFAULT_HVM_PF
-#define DO_TRC_HVM_PF_INJECT64 DEFAULT_HVM_PF
-#define DO_TRC_HVM_INJ_EXC     DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_INJ_VIRQ    DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_REINJ_VIRQ  DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_INTR_WINDOW DEFAULT_HVM_INJECT
-#define DO_TRC_HVM_IO_READ     DEFAULT_HVM_IO
-#define DO_TRC_HVM_IO_WRITE    DEFAULT_HVM_IO
-#define DO_TRC_HVM_CR_READ     DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CR_READ64   DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CR_WRITE    DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CR_WRITE64  DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_DR_READ     DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_DR_WRITE    DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_XCR_READ64  DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_XCR_WRITE64 DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_MSR_READ    DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_MSR_WRITE   DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_RDTSC       DEFAULT_HVM_REGACCESS
-#define DO_TRC_HVM_CPUID       DEFAULT_HVM_MISC
-#define DO_TRC_HVM_INTR        DEFAULT_HVM_INTR
-#define DO_TRC_HVM_NMI         DEFAULT_HVM_INTR
-#define DO_TRC_HVM_MCE         DEFAULT_HVM_INTR
-#define DO_TRC_HVM_SMI         DEFAULT_HVM_INTR
-#define DO_TRC_HVM_VMMCALL     DEFAULT_HVM_MISC
-#define DO_TRC_HVM_HLT         DEFAULT_HVM_MISC
-#define DO_TRC_HVM_INVLPG      DEFAULT_HVM_MISC
-#define DO_TRC_HVM_INVLPG64    DEFAULT_HVM_MISC
-#define DO_TRC_HVM_IO_ASSIST   DEFAULT_HVM_MISC
-#define DO_TRC_HVM_MMIO_ASSIST DEFAULT_HVM_MISC
-#define DO_TRC_HVM_CLTS        DEFAULT_HVM_MISC
-#define DO_TRC_HVM_LMSW        DEFAULT_HVM_MISC
-#define DO_TRC_HVM_LMSW64      DEFAULT_HVM_MISC
-#define DO_TRC_HVM_REALMODE_EMULATE DEFAULT_HVM_MISC
-#define DO_TRC_HVM_TRAP             DEFAULT_HVM_MISC
-#define DO_TRC_HVM_TRAP_DEBUG       DEFAULT_HVM_MISC
-#define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
-
-
-#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
-
-#define TRACE_2_LONG_2D(_e, d1, d2, ...) \
-    TRACE_4D(_e, d1, d2)
-#define TRACE_2_LONG_3D(_e, d1, d2, d3, ...) \
-    TRACE_5D(_e, d1, d2, d3)
-#define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
-    TRACE_6D(_e, d1, d2, d3, d4)
-
-#define HVMTRACE_ND(evt, modifier, cycles, ...)                           \
-    do {                                                                  \
-        if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )               \
-        {                                                                 \
-            uint32_t _d[] = { __VA_ARGS__ };                              \
-            __trace_var(TRC_HVM_ ## evt | (modifier), cycles,             \
-                        sizeof(_d), sizeof(_d) ? _d : NULL);              \
-        }                                                                 \
-    } while(0)
-
-#define HVMTRACE_6D(evt, d1, d2, d3, d4, d5, d6)    \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5, d6)
-#define HVMTRACE_5D(evt, d1, d2, d3, d4, d5)        \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5)
-#define HVMTRACE_4D(evt, d1, d2, d3, d4)            \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4)
-#define HVMTRACE_3D(evt, d1, d2, d3)                \
-    HVMTRACE_ND(evt, 0, 0, d1, d2, d3)
-#define HVMTRACE_2D(evt, d1, d2)                    \
-    HVMTRACE_ND(evt, 0, 0, d1, d2)
-#define HVMTRACE_1D(evt, d1)                        \
-    HVMTRACE_ND(evt, 0, 0, d1)
-#define HVMTRACE_0D(evt)                            \
-    HVMTRACE_ND(evt, 0, 0)
-
-#define HVMTRACE_LONG_1D(evt, d1)                  \
-                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
-#define HVMTRACE_LONG_2D(evt, d1, d2, ...)              \
-                   HVMTRACE_3D(evt ## 64, d1, d2)
-#define HVMTRACE_LONG_3D(evt, d1, d2, d3, ...)      \
-                   HVMTRACE_4D(evt ## 64, d1, d2, d3)
-#define HVMTRACE_LONG_4D(evt, d1, d2, d3, d4, ...)  \
-                   HVMTRACE_5D(evt ## 64, d1, d2, d3, d4)
-
-#endif /* __ASM_X86_HVM_TRACE_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index 85530d2e0e26..2987d5870606 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -25,7 +25,6 @@
 #include <asm/processor.h>
 #include <asm/i387.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/vmx/vmcs.h>
 
 extern int8_t opt_ept_exec_sp;
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index 72c20550f6a6..940be79d7b8e 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -97,39 +97,4 @@ static inline void __trace_hypercall(uint32_t event, unsigned long op,
 /* Create a trace record with no time included. */
 #define TRACE(_e, ...)      TRACE_INTERNAL(_e, false, ##__VA_ARGS__)
 
-
-/* Convenience macros for calling the trace function. */
-#define TRACE_0D(_e)                            \
-    do {                                        \
-        trace_var(_e, 1, 0, NULL);              \
-    } while ( 0 )
-
-/* Common helper for TRACE_{1..6}D() below. */
-#define TRACE_varD(_e, ...)                             \
-    do {                                                \
-        if ( unlikely(tb_init_done) )                   \
-        {                                               \
-            uint32_t _d[] = { __VA_ARGS__ };            \
-            __trace_var(_e, true, sizeof(_d), _d);      \
-        }                                               \
-    } while ( 0 )
-
-#define TRACE_1D(_e, d1) \
-    TRACE_varD(_e, d1)
-
-#define TRACE_2D(_e, d1, d2) \
-    TRACE_varD(_e, d1, d2)
-
-#define TRACE_3D(_e, d1, d2, d3) \
-    TRACE_varD(_e, d1, d2, d3)
-
-#define TRACE_4D(_e, d1, d2, d3, d4) \
-    TRACE_varD(_e, d1, d2, d3, d4)
-
-#define TRACE_5D(_e, d1, d2, d3, d4, d5) \
-    TRACE_varD(_e, d1, d2, d3, d4, d5)
-
-#define TRACE_6D(_e, d1, d2, d3, d4, d5, d6) \
-    TRACE_varD(_e, d1, d2, d3, d4, d5, d6)
-
 #endif /* __XEN_TRACE_H__ */
-- 
2.11.0


