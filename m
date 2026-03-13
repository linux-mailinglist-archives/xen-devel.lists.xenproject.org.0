Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMHoHM48tGk/jgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A92871AE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253911.1549887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Th-0006rM-RZ; Fri, 13 Mar 2026 16:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253911.1549887; Fri, 13 Mar 2026 16:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Th-0006oJ-M4; Fri, 13 Mar 2026 16:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1253911;
 Fri, 13 Mar 2026 16:35:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFLP=BN=bounce.vates.tech=bounce-md_30504962.69b43cb6.v1-a80daf2a6a5d488eb90b6254a9f1b77a@srs-se1.protection.inumbo.net>)
 id 1w15Tg-0006Ek-My
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:08 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95a21f94-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:03 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT21jsdz5QmHBy
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a80daf2a6a5d488eb90b6254a9f1b77a; Fri, 13 Mar 2026 16:35:02 +0000
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
X-Inumbo-ID: 95a21f94-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419702; x=1773689702;
	bh=EZV6VZwcVdA/V+iWTxOZ0DDZfDnD1N74CpP85tJ1xcs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nBTvzgCXtgVPKD443WZh7ijLbsZv+RQ2NglOoLl/d7+/UWjEAbZvpov+QeZGj6Ntj
	 lXsGfAhgbRxLhvQwYTe2fDXufxeOb1hmUGVZTmTmmrAiRmSrt6zNeUwjzKzEx4x3Oc
	 NP7uhuW5V5iVrmGb1fiZAMS+uEq5Kbaf144Owtp3HMaIP20Sqh3HvcstJEGO0YdSxX
	 XdRWmu81ZJfND1bzTQFIJO046ZeGpSGVFC0wYAUaI0PwH5OgQK0SbBg3iQ8gQD2q3/
	 MVzNKU/7V54hIa2nOrPbTagqOikmp9ro8C9duSAkJxEg89QRmOug5forCLuWOwKBFv
	 5308YFMqwVK2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419702; x=1773680202; i=thierry.escande@vates.tech;
	bh=EZV6VZwcVdA/V+iWTxOZ0DDZfDnD1N74CpP85tJ1xcs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Jg01yOHajDuGeiFFDGKRfwE1G1TxOV9qEttlhxL4WQfH0W5HO1giUTnCYHNBRIHBU
	 yIfpSa1SK21cU/52PhYIAzc5HKt6Ukw4t5QIDUelOPeSXEa6m/44A6bg429fXLnqE7
	 CK+1ZSORo2VFCmP+silLs5/2G0qD8gGhDeHJ4jC7F7QKje/Dp3J9hsmBd1fqDywi+T
	 BDsJt7lYDobAyvzmaO970S5tLsSne+J41DB8HMzl5gii7rJG7KZuH0Hwh3SK+CsQfN
	 DrYuZNPAQTpTfuAg+UmFWvuSLa2vSXVkPd/70vfKW1enQSxwne7K3/D+NdIoa4XeLR
	 Y7PTIfAhvIjvw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2003/17]=20hvmloader:=20add=20function=20to=20set=20the=20emulated=20machine=20type=20(i440/Q35)?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419701312
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-4-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a80daf2a6a5d488eb90b6254a9f1b77a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,citrix.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.026];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 289A92871AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds a new function init_pc_machine_type() which allows to
determine and set the emulated chipset type. Possible values are
MACHINE_TYPE_I440 and MACHINE_TYPE_Q35 and stored in the global variable
machine_type.

The machine_type variable will be used from multiple places in following
commits.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/hvmloader.c |  2 ++
 tools/firmware/hvmloader/pci_regs.h  |  4 +++
 tools/firmware/hvmloader/util.c      | 42 ++++++++++++++++++++++++++++
 tools/firmware/hvmloader/util.h      | 11 ++++++++
 4 files changed, 59 insertions(+)

diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index 6d23150fc9..626cc53649 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -332,6 +332,8 @@ int main(void)
 
     init_hypercalls();
 
+    init_pc_machine_type();
+
     memory_map_setup();
 
     xenbus_setup();
diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index 7bf2d873ab..4d4dc0cd01 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -107,6 +107,10 @@
 
 #define PCI_INTEL_OPREGION 0xfc /* 4 bits */
 
+#define PCI_VENDOR_ID_INTEL              0x8086
+#define PCI_DEVICE_ID_INTEL_82441        0x1237
+#define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
+
 #endif /* __HVMLOADER_PCI_REGS_H__ */
 
 /*
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index f1ed1eb48d..f9116bea4d 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -22,6 +22,7 @@
 #include "hypercall.h"
 #include "ctype.h"
 #include "vnuma.h"
+#include "pci_regs.h"
 #include <acpi2_0.h>
 #include <libacpi.h>
 #include <stdint.h>
@@ -648,6 +649,47 @@ void __bug(const char *file, int line)
     crash();
 }
 
+machine_type_t machine_type;
+
+void init_pc_machine_type(void)
+{
+    uint16_t vendor_id;
+    uint16_t device_id;
+
+    if ( machine_type != MACHINE_TYPE_UNDEFINED )
+        return;
+
+    vendor_id = pci_readw(0, PCI_VENDOR_ID);
+    device_id = pci_readw(0, PCI_DEVICE_ID);
+
+    /* only Intel platforms are emulated currently */
+    if ( vendor_id != PCI_VENDOR_ID_INTEL )
+        goto error;
+
+    switch ( device_id )
+    {
+    case PCI_DEVICE_ID_INTEL_82441:
+        machine_type = MACHINE_TYPE_I440;
+        printf("Detected i440 chipset\n");
+        break;
+
+    case PCI_DEVICE_ID_INTEL_Q35_MCH:
+        machine_type = MACHINE_TYPE_Q35;
+        printf("Detected Q35 chipset\n");
+        break;
+
+    default:
+        goto error;
+    }
+
+    return;
+
+error:
+    printf("Unknown emulated chipset encountered, VID=%04Xh, DID=%04Xh\n",
+           vendor_id, device_id);
+    BUG();
+}
+
 static void validate_hvm_info(struct hvm_info_table *t)
 {
     uint8_t *ptr = (uint8_t *)t;
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 3c5eeff5e7..2f37504aca 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -170,6 +170,17 @@ void pci_write(uint32_t devfn, uint32_t reg, uint32_t len, uint32_t val);
 #define pci_writew(devfn, reg, val) pci_write(devfn, reg, 2, (uint16_t)(val))
 #define pci_writel(devfn, reg, val) pci_write(devfn, reg, 4, (uint32_t)(val))
 
+/* Emulated machine types */
+typedef enum {
+    MACHINE_TYPE_UNDEFINED = 0,
+    MACHINE_TYPE_I440,
+    MACHINE_TYPE_Q35,
+} machine_type_t;
+
+extern machine_type_t machine_type;
+
+void init_pc_machine_type(void);
+
 /* Get a pointer to the shared-info page */
 struct shared_info *get_shared_info(void) __attribute__ ((const));
 
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


