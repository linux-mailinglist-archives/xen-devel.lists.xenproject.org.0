Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4BA01412
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 12:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865420.1276721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tU26l-00078c-5C; Sat, 04 Jan 2025 11:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865420.1276721; Sat, 04 Jan 2025 11:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tU26l-00075d-2P; Sat, 04 Jan 2025 11:14:19 +0000
Received: by outflank-mailman (input) for mailman id 865420;
 Sat, 04 Jan 2025 11:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaCs=T4=zju.edu.cn=banmengtao@srs-se1.protection.inumbo.net>)
 id 1tU23y-00071M-Eo
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 11:11:26 +0000
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [52.237.72.81]) by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a0179830-ca8c-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 12:11:21 +0100 (CET)
Received: from ban.. (unknown [39.173.141.67])
 by mail-app2 (Coremail) with SMTP id by_KCgC3VpJNF3ln0WAaAQ--.32270S2;
 Sat, 04 Jan 2025 19:11:12 +0800 (CST)
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
X-Inumbo-ID: a0179830-ca8c-11ef-99a4-01e77a169b0f
From: banmengtao <banmengtao@zju.edu.cn>
To: xen-devel@lists.xenproject.org
Cc: banmengtao <jiuxie@outlook.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpu: Support Hygon architecture CPU during NMI initialization.
Date: Sat,  4 Jan 2025 19:11:09 +0800
Message-Id: <20250104111109.2726-1-banmengtao@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:by_KCgC3VpJNF3ln0WAaAQ--.32270S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW8ZF4xtw4rZFWDZr4fZrb_yoWkJFX_Z3
	s0g34kX34Svay8AF1ktw4rZF1I93yF9FW3Gw1FgryYgr10vr1UJr43KFyFvF4xGayxJrWU
	Kay7GrWq9Fy7JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
	xUy3r4UUUUU
X-CM-SenderInfo: 5edqzv5qjwt0o62m3hxhgxhubq/

From: banmengtao <jiuxie@outlook.com>

When I installed Xen on Ubuntu 22.04 and rebooted into the kernel, it kept freezing and threw an exception: "Unsupported processor. Unknown vendor 16."
This patch fixes the issue where the Hygon CPU could not be recognized when entering the Xen kernel.

Signed-off-by: banmengtao <jiuxie@outlook.com>
---
 xen/arch/x86/oprofile/nmi_int.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index fa3071d977..ef7c7b8f69 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -398,6 +398,7 @@ static int __init cf_check nmi_init(void)
 
 	switch (vendor) {
 		case X86_VENDOR_AMD:
+		case X86_VENDOR_HYGON:
 			/* Needs to be at least an Athlon (or hammer in 32bit mode) */
 
 			switch (family) {
@@ -435,6 +436,11 @@ static int __init cf_check nmi_init(void)
 				model = &op_athlon_spec;
 				cpu_type = "x86-64/family16h";
 				break;
+			case 0x18:
+				model = &op_athlon_spec;
+				cpu_type = "x86-64/family18h";
+				break;
+
 			}
 			break;
 
-- 
2.34.1


