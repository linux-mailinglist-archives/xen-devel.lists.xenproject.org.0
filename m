Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA5642391
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 08:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453197.710873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p25t6-0002oa-KO; Mon, 05 Dec 2022 07:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453197.710873; Mon, 05 Dec 2022 07:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p25t6-0002mc-GF; Mon, 05 Dec 2022 07:27:40 +0000
Received: by outflank-mailman (input) for mailman id 453197;
 Mon, 05 Dec 2022 07:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFyF=4D=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1p25t4-0002UH-IX
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 07:27:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4b044921-746e-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 08:27:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9502523A;
 Sun,  4 Dec 2022 23:27:43 -0800 (PST)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E3C83F73D;
 Sun,  4 Dec 2022 23:27:34 -0800 (PST)
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
X-Inumbo-ID: 4b044921-746e-11ed-91b6-6bf2151ebd3b
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 1/2] xen/arm: vpl011: emulate non-SBSA registers as WI/RAZ
Date: Mon,  5 Dec 2022 15:26:39 +0800
Message-Id: <20221205072640.2092473-2-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205072640.2092473-1-jiamei.xie@arm.com>
References: <20221205072640.2092473-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
Linux SBSA PL011 driver will access PL011 DMACR register in some
functions. As chapter "B Generic UART" in "ARM Server Base System
Architecture"[1] documentation describes, SBSA UART doesn't support
DMA. In current code, when the kernel tries to access DMACR register,
Xen will inject a data abort:
Unhandled fault at 0xffffffc00944d048
Mem abort info:
  ESR = 0x96000000
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x00: ttbr address size fault
Data abort info:
  ISV = 0, ISS = 0x00000000
  CM = 0, WnR = 0
swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
[ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
...
Call trace:
 pl011_stop_rx+0x70/0x80
 tty_port_shutdown+0x7c/0xb4
 tty_port_close+0x60/0xcc
 uart_close+0x34/0x8c
 tty_release+0x144/0x4c0
 __fput+0x78/0x220
 ____fput+0x1c/0x30
 task_work_run+0x88/0xc0
 do_notify_resume+0x8d0/0x123c
 el0_svc+0xa8/0xc0
 el0t_64_sync_handler+0xa4/0x130
 el0t_64_sync+0x1a0/0x1a4
Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
---[ end trace 83dd93df15c3216f ]---
note: bootlogd[132] exited with preempt_count 1
/etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon

As discussed in [2], this commit makes the access to non-SBSA registers
RAZ/WI as an improvement.

[1] https://developer.arm.com/documentation/den0094/c/?lang=en
[2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-desktop/

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
---
v4 -> v5
- no change
v3 -> v4
- remove the size check for unknown registers in the SBSA UART
- remove lock in read_as_zero
v2 -> v3
- emulate non-SBSA registers as WI/RAZ in default case
- update commit message
v1 -> v2
- print a message using XENLOG_G_DEBUG when it's write-ignore
---
 xen/arch/arm/vpl011.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 43522d48fd..f4a5621fab 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -414,11 +414,15 @@ static int vpl011_mmio_read(struct vcpu *v,
     default:
         gprintk(XENLOG_ERR, "vpl011: unhandled read r%d offset %#08x\n",
                 dabt.reg, vpl011_reg);
-        return 0;
+        goto read_as_zero;
     }
 
     return 1;
 
+read_as_zero:
+    *r = 0;
+    return 1;
+
 bad_width:
     gprintk(XENLOG_ERR, "vpl011: bad read width %d r%d offset %#08x\n",
             dabt.size, dabt.reg, vpl011_reg);
@@ -486,7 +490,7 @@ static int vpl011_mmio_write(struct vcpu *v,
     default:
         gprintk(XENLOG_ERR, "vpl011: unhandled write r%d offset %#08x\n",
                 dabt.reg, vpl011_reg);
-        return 0;
+        goto write_ignore;
     }
 
 write_ignore:
-- 
2.25.1


