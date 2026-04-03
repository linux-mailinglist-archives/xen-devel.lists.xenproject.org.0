Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMlLL1VYz2llvQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 08:04:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FCF3914F5
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 08:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272575.1560074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Xcj-0002bS-FO; Fri, 03 Apr 2026 06:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272575.1560074; Fri, 03 Apr 2026 06:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Xcj-0002Xe-CR; Fri, 03 Apr 2026 06:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1272575;
 Fri, 03 Apr 2026 05:33:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pengpeng@iscas.ac.cn>) id 1w8XAJ-0007Zl-7U
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 05:33:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8XAI-00B7EO-Jt
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 07:33:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pengpeng@iscas.ac.cn>)
 id 69cf5134-bab6-0a2a0a5309dd-0a2a450badec-26
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 07:33:53 +0200
Received: from [159.226.251.81] (helo=cstnet.cn)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <pengpeng@iscas.ac.cn>)
 id 69cf513e-bca8-0a2a450b0019-9fe2fb5184e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 07:33:52 +0200
Received: from 0002-arm-xen.resend.eml (unknown [111.196.245.197])
 by APP-03 (Coremail) with SMTP id rQCowACHqeA9Uc9pjEK7DA--.32598S2;
 Fri, 03 Apr 2026 13:33:49 +0800 (CST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 10:42:09 +0800
Message-ID: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: xen: validate hypervisor compatible before parsing its
 version
X-CM-TRANSID:rQCowACHqeA9Uc9pjEK7DA--.32598S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rtFWkCF4rJr1kZF1UKFg_yoW8Zw4fpF
	Zakr9avFWrt3WxWa4IyFyv9Fy5GF4kXrW2qFykZ3Wjyrnrtw1rXrWIvF1SvFn3ArW8W343
	ZrWjyFn5AF47X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjG-e7UUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-purgate-ID: tlsNG-42698a/1775194433-F47D42A1-6AE0A4CF/0/0
X-purgate-type: clean
X-purgate-size: 2060
X-Spamd-Result: default: False [1.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B4FCF3914F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fdt_find_hyper_node() reads the raw compatible property and then
derives hyper_node.version from a prefix match before later printing it
with %s. Flat DT properties are external boot input, and this path does
not prove that the compatible string is NUL-terminated within its
declared bounds.

Fetch the first compatible entry with fdt_stringlist_get() so malformed
unterminated properties are rejected before the version suffix is
parsed.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/xen/enlighten.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 4feed2c2498d..f69290a4c639 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -19,6 +19,7 @@
 #include <asm/efi.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/libfdt.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -218,8 +219,9 @@ static __initdata struct {
 static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	const void *s = NULL;
+	const char *s = NULL;
 	int len;
+	size_t prefix_len = strlen(hyper_node.prefix);
 
 	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
 		return 0;
@@ -227,10 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 	if (of_flat_dt_is_compatible(node, hyper_node.compat))
 		hyper_node.found = true;
 
-	s = of_get_flat_dt_prop(node, "compatible", &len);
-	if (strlen(hyper_node.prefix) + 3  < len &&
-	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
-		hyper_node.version = s + strlen(hyper_node.prefix);
+	s = fdt_stringlist_get(initial_boot_params, node, "compatible", 0, &len);
+	if (s && len > prefix_len + 2 &&
+	    !strncmp(hyper_node.prefix, s, prefix_len))
+		hyper_node.version = s + prefix_len;
 
 	/*
 	 * Check if Xen supports EFI by checking whether there is the
-- 
2.50.1 (Apple Git-155)


