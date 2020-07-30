Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845D233051
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 12:24:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k15jm-0001cl-PW; Thu, 30 Jul 2020 10:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KiB=BJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k15jl-0001cg-2z
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 10:24:33 +0000
X-Inumbo-ID: db3650c2-d24e-11ea-aab3-12813bfff9fa
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db3650c2-d24e-11ea-aab3-12813bfff9fa;
 Thu, 30 Jul 2020 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw+A55Q5XlKPed6CCu/ZU+PndNruUEyCiF4VLgFcMrE=;
 b=GhPVxHNhpnc3e6R0x4ooJXAd71PeFSExA/vcLlfczfVtbbCEVzvSHFkB44AGBNrhIJS64ZgsO5ZcGgMXOQiyophrit4ZcY33R0983g3+rSzlePXU811SGNFnd0HEpKUHCSFVRYT4fMg1Q+SGeUAP/GCi2dO+sx3eEzQDBi/PT8c=
Received: from AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::30)
 by AM5PR0802MB2465.eurprd08.prod.outlook.com (2603:10a6:203:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 30 Jul
 2020 10:24:30 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::e7) by AM0PR10CA0077.outlook.office365.com
 (2603:10a6:208:15::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18 via Frontend
 Transport; Thu, 30 Jul 2020 10:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 10:24:29 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Thu, 30 Jul 2020 10:24:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5eede8b8d4dfd0cf
X-CR-MTA-TID: 64aa7808
Received: from 336425fe908a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 930D3EB0-4A02-4455-8F61-4EBD24AC42A3.1; 
 Thu, 30 Jul 2020 10:24:23 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 336425fe908a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Jul 2020 10:24:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhRRiAjb90mkV+NBc2kqD/7k5IFlfnzKUifqPtOZ4RfW3+/EC1FIYOs+0KuXfcaS1LwqFBkM3qd22PkK0DVyN/epRexZBwKCowqiQtnbrLwQKDet8hn6muZZjAbvHDpQtule6wwEKmsGDJMSjzzDFl7QEkxeGgag+5znurEp2TBI3hNbOHpxnvMsVdnUmSLZUo0fQRPnt8a8g2IkIWJIRLpIuZbY6VxNUyjctmqD/50xYmCkRS32qVD6n6jKCfzQBa0WBQVdX05fvSDgUYtaeXjVFYVHvr7MxrlSmz/pbJ2RSbfwZUYYGhRy0bc09Q69m4X7XwRh0ta0U86NgzrScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw+A55Q5XlKPed6CCu/ZU+PndNruUEyCiF4VLgFcMrE=;
 b=dAnjwFZIcinu5RvoyBsSvvUgUlwiUu/33gQF2cOh2ZcYXtEubL7j8ZD16mAL+v3jvD3Utx6u13rtxqPfQjifXdbYUnZqbBb5jaohOB+rcw9NG6ujHbMWmIMmS9I2z3CvIV1hIa8MaBO+QG/E+CZRbdtrq2ivI18vc/UKVv01J66TDNWDcn9cfzg4yCe9hRFko4D9/RanoCvDz66pjJGBv5zq3TG8TR66xFuvIMtyoWP3oAPORxgG1JdQNm3LCeY8zx5P5nbRrF5zpqOJkxq5Mg/bd1sgNdswSHQ729D1Pm0oQf5rvZPg4DBM7P9CC/0y1bkEsz8ZvwopQ7w3BCouIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw+A55Q5XlKPed6CCu/ZU+PndNruUEyCiF4VLgFcMrE=;
 b=GhPVxHNhpnc3e6R0x4ooJXAd71PeFSExA/vcLlfczfVtbbCEVzvSHFkB44AGBNrhIJS64ZgsO5ZcGgMXOQiyophrit4ZcY33R0983g3+rSzlePXU811SGNFnd0HEpKUHCSFVRYT4fMg1Q+SGeUAP/GCi2dO+sx3eEzQDBi/PT8c=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3514.eurprd08.prod.outlook.com (2603:10a6:10:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 10:24:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 10:24:20 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3] xen/arm: Convert runstate address during hypcall
Date: Thu, 30 Jul 2020 11:24:00 +0100
Message-Id: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::34) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by
 LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.24 via Frontend Transport; Thu, 30 Jul 2020 10:24:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8573940c-e0ab-4b9e-8f1b-08d83472be85
X-MS-TrafficTypeDiagnostic: DB7PR08MB3514:|AM5PR0802MB2465:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2465D00F12FEAF743BA48A7A9D710@AM5PR0802MB2465.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bU92IIZ+OT3abzhCGapjo+0jbHKFUafkYszgOelAa4rIpOTCbsVWYqJhSygjtLfaR4NzRUnvvh/tR0NF8soEPhzPNVwhk7QKPAFWS2q0XisAUr81clT3vcveYwoWqoZfq576VpafiZzwxkC9OaG+i1JMahRR/V4mD+5XJoow1MKA5Myh1mX2x/bqG0BQW3Li0axoXod3CanQllxGBHEUYZnsftDg80inB8sKNypMzGhgn4Qg1/J7G27se1YoYTIhL5OERMuW2/Bv8YXZu480Epm7MclN6uLGzCc4YpWlC0O6kOLE3KAAnrOcQ1GQmeMsLoOohqRjgWkk618oaZMKLOq1TgnN7AjBJwVQIRQl/w8igAy9izNYlvWPVr1POKdB
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(6666004)(6916009)(5660300002)(86362001)(2616005)(7696005)(30864003)(52116002)(54906003)(8936002)(956004)(478600001)(316002)(26005)(66946007)(66476007)(83380400001)(66556008)(8676002)(4326008)(6486002)(7416002)(44832011)(16526019)(2906002)(36756003)(186003)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YFJpA93XmkUbDzHon2G4foi6ho99nqr8cZ8crWufk5kS9FAzJbhBiunPfkfxPUqTQNplbM7hsqGsWErrl9CBYtnD7xOho2vNstcEKWe5mOUIYaGWReJnTw6ROkdIezdj0O8YiBywa2zG7SZJIIzttxEjEEbEcLnI24+CYLr4fCmgAZBcIeMxFLbh3AeJh6k0dYt2VoGi9VkAMWApJT3fywqgpFp49hrs/Wh92vpB0hijnuuwodEfYmJoo/yx0KnZgWCS7HQLLVsNP4yM3iUPZTtP6dr1hOgmE/JBD7gPcgDTGSA3aCqpMsANdcMXUESgzxu7CtN67dpyT33ajVsAYaFaeSuassGtiGrbuEkuKOy7Z1FZbm42fuB7I/OCvVQAAH8O2G9e8I8Kb0ZPYqlNi+YTiVOM0sCCJMmrEI8wcz+Oczyhe9iWQyM2lJ4vK8IkG5NJm3hbNKUYmDtHVd6tI1eaQ7+LlWoY0+N8ILML7VtkhOQGug1KY82w5z1b/hC7icSElcGllQISQ2I2Cp+42mpGVtaHPX0O6ndeSx+C249J+Q8XUrHy7yYmCAb6YDzHb26GmBz13OtBx+mdQq5YfBkWdxl+MbPHxiWAEYohoWJXAshRltYKgCE2SzYd4OdlQ1B+XwDSPl8TuFEezJTAfQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3514
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 547db8e0-8ea7-47d8-7090-08d83472b895
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8saRTYyHHJR/1UZRQ/DVlnVJFcEUBDiEv24ukb5Y/j0HEgISGOUHpv5uVppmDnnI59IIar+47wXSEE9RBHtbQEhtAD7ldmTJA5f8YSx0Rq8c1WonqK7YjtTn5j+BqaWg7Yn1jGmXFKm8vSVwSQplZNUgYC6btN6BFyahLdCHwM4gSqg2mISZaFcxsvvDkSlaAxgEnndoRvckW3839Mu+uskImvB8Xwj7Lc6PACBIZ0cb4AIvm33sAWtugHXMlucAvHUJ920rEQWJHylHTN46/fEcyZ74x+w7CDxmltuTKb5UwSzmBCHz7ujQwnxMUNa/0/sAfMPsFA1m6CUCaXRN+usNLXXr7Q/bc5jdwZXYRaYydQr56Xu9/0QgUhqjB1QfTS2OYCTLP7gw7jba/302BSzZP81/REOfCY22RoNg9YleAr9X89qVVUVU5PtDGh8l
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(186003)(2616005)(16526019)(26005)(30864003)(36756003)(7696005)(356005)(82310400002)(86362001)(47076004)(8676002)(82740400003)(956004)(8936002)(44832011)(81166007)(83380400001)(4326008)(70586007)(316002)(6916009)(478600001)(70206006)(54906003)(5660300002)(2906002)(6666004)(6486002)(36906005)(107886003)(336012)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 10:24:29.9515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8573940c-e0ab-4b9e-8f1b-08d83472be85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2465
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At the moment on Arm, a Linux guest running with KTPI enabled will
cause the following error when a context switch happens in user mode:
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0

The error is caused by the virtual address for the runstate area
registered by the guest only being accessible when the guest is running
in kernel space when KPTI is enabled.

To solve this issue, this patch is doing the translation from virtual
address to physical address during the hypercall and mapping the
required pages using vmap. This is removing the conversion from virtual
to physical address during the context switch which is solving the
problem with KPTI.

This is done only on arm architecture, the behaviour on x86 is not
modified by this patch and the address conversion is done as before
during each context switch.

This is introducing several limitations in comparison to the previous
behaviour (on arm only):
- if the guest is remapping the area at a different physical address Xen
will continue to update the area at the previous physical address. As
the area is in kernel space and usually defined as a global variable this
is something which is believed not to happen. If this is required by a
guest, it will have to call the hypercall with the new area (even if it
is at the same virtual address).
- the area needs to be mapped during the hypercall. For the same reasons
as for the previous case, even if the area is registered for a different
vcpu. It is believed that registering an area using a virtual address
unmapped is not something done.

inline functions in headers could not be used as the architecture
domain.h is included before the global domain.h making it impossible
to use the struct vcpu inside the architecture header.
This should not have any performance impact as the hypercall is only
called once per vcpu usually.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

---
  Changes in v2
    - use vmap to map the pages during the hypercall.
    - reintroduce initial copy during hypercall.

  Changes in v3
    - Fix Coding style
    - Fix vaddr printing on arm32
    - use write_atomic to modify state_entry_time update bit (only
    in guest structure as the bit is not used inside Xen copy)

---
 xen/arch/arm/domain.c        | 161 ++++++++++++++++++++++++++++++-----
 xen/arch/x86/domain.c        |  29 ++++++-
 xen/arch/x86/x86_64/domain.c |   4 +-
 xen/common/domain.c          |  19 ++---
 xen/include/asm-arm/domain.h |   9 ++
 xen/include/asm-x86/domain.h |  16 ++++
 xen/include/xen/domain.h     |   5 ++
 xen/include/xen/sched.h      |  16 +---
 8 files changed, 206 insertions(+), 53 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 31169326b2..8b36946017 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -19,6 +19,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/wait.h>
+#include <xen/vmap.h>
 
 #include <asm/alternative.h>
 #include <asm/cpuerrata.h>
@@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
     virt_timer_restore(n);
 }
 
-/* Update per-VCPU guest runstate shared memory area (if registered). */
-static void update_runstate_area(struct vcpu *v)
+static void cleanup_runstate_vcpu_locked(struct vcpu *v)
 {
-    void __user *guest_handle = NULL;
+    if ( v->arch.runstate_guest )
+    {
+        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MASK));
+
+        put_page(v->arch.runstate_guest_page[0]);
+
+        if ( v->arch.runstate_guest_page[1] )
+            put_page(v->arch.runstate_guest_page[1]);
+
+        v->arch.runstate_guest = NULL;
+    }
+}
+
+void arch_vcpu_cleanup_runstate(struct vcpu *v)
+{
+    spin_lock(&v->arch.runstate_guest_lock);
+
+    cleanup_runstate_vcpu_locked(v);
+
+    spin_unlock(&v->arch.runstate_guest_lock);
+}
+
+static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
+{
+    unsigned int offset;
+    mfn_t mfn[2];
+    struct page_info *page;
+    unsigned int numpages;
     struct vcpu_runstate_info runstate;
+    void *p;
 
-    if ( guest_handle_is_null(runstate_guest(v)) )
-        return;
+    /* user can pass a NULL address to unregister a previous area */
+    if ( vaddr == 0 )
+        return 0;
+
+    offset = vaddr & ~PAGE_MASK;
+
+    /* provided address must be aligned to a 64bit */
+    if ( offset % alignof(struct vcpu_runstate_info) )
+    {
+        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
+                ": Invalid offset\n", vaddr);
+        return -EINVAL;
+    }
+
+    page = get_page_from_gva(v, vaddr, GV2M_WRITE);
+    if ( !page )
+    {
+        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
+                ": Page is not mapped\n", vaddr);
+        return -EINVAL;
+    }
+
+    mfn[0] = page_to_mfn(page);
+    v->arch.runstate_guest_page[0] = page;
+
+    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
+    {
+        /* guest area is crossing pages */
+        page = get_page_from_gva(v, vaddr + PAGE_SIZE, GV2M_WRITE);
+        if ( !page )
+        {
+            put_page(v->arch.runstate_guest_page[0]);
+            gprintk(XENLOG_WARNING,
+                    "Cannot map runstate pointer at 0x%"PRIvaddr
+                    ": 2nd Page is not mapped\n", vaddr);
+            return -EINVAL;
+        }
+        mfn[1] = page_to_mfn(page);
+        v->arch.runstate_guest_page[1] = page;
+        numpages = 2;
+    }
+    else
+    {
+        v->arch.runstate_guest_page[1] = NULL;
+        numpages = 1;
+    }
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
+    p = vmap(mfn, numpages);
+    if ( !p )
+    {
+        put_page(v->arch.runstate_guest_page[0]);
+        if ( numpages == 2 )
+            put_page(v->arch.runstate_guest_page[1]);
 
-    if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
+                ": vmap error\n", vaddr);
+        return -EINVAL;
+    }
+
+    v->arch.runstate_guest = p + offset;
+
+    if (v == current)
+        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
+    else
     {
-        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
-        guest_handle--;
-        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
-        smp_wmb();
+        vcpu_runstate_get(v, &runstate);
+        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate));
     }
 
-    __copy_to_guest(runstate_guest(v), &runstate, 1);
+    return 0;
+}
+
+int arch_vcpu_setup_runstate(struct vcpu *v,
+                             struct vcpu_register_runstate_memory_area area)
+{
+    int rc;
+
+    spin_lock(&v->arch.runstate_guest_lock);
+
+    /* cleanup if we are recalled */
+    cleanup_runstate_vcpu_locked(v);
+
+    rc = setup_runstate_vcpu_locked(v, (vaddr_t)area.addr.v);
+
+    spin_unlock(&v->arch.runstate_guest_lock);
 
-    if ( guest_handle )
+    return rc;
+}
+
+
+/* Update per-VCPU guest runstate shared memory area (if registered). */
+static void update_runstate_area(struct vcpu *v)
+{
+    spin_lock(&v->arch.runstate_guest_lock);
+
+    if ( v->arch.runstate_guest )
     {
-        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
-        smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        {
+            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+            write_atomic(&(v->arch.runstate_guest->state_entry_time),
+                    v->runstate.state_entry_time);
+        }
+
+        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
+
+        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        {
+            /* copy must be done before switching the bit */
+            smp_wmb();
+            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+            write_atomic(&(v->arch.runstate_guest->state_entry_time),
+                    v->runstate.state_entry_time);
+        }
     }
+
+    spin_unlock(&v->arch.runstate_guest_lock);
 }
 
 static void schedule_tail(struct vcpu *prev)
@@ -560,6 +681,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.saved_context.sp = (register_t)v->arch.cpu_info;
     v->arch.saved_context.pc = (register_t)continue_new_vcpu;
 
+    spin_lock_init(&v->arch.runstate_guest_lock);
+
     /* Idle VCPUs don't need the rest of this setup */
     if ( is_idle_vcpu(v) )
         return rc;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fee6c3931a..b9b81e94e5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1642,6 +1642,29 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
 }
 
+int arch_vcpu_setup_runstate(struct vcpu *v,
+                             struct vcpu_register_runstate_memory_area area)
+{
+    struct vcpu_runstate_info runstate;
+
+    runstate_guest(v) = area.addr.h;
+
+    if ( v == current )
+        __copy_to_guest(runstate_guest(v), &v->runstate, 1);
+    else
+    {
+        vcpu_runstate_get(v, &runstate);
+        __copy_to_guest(runstate_guest(v), &runstate, 1);
+    }
+
+    return 0;
+}
+
+void arch_vcpu_cleanup_runstate(struct vcpu *v)
+{
+    set_xen_guest_handle(runstate_guest(v), NULL);
+}
+
 /* Update per-VCPU guest runstate shared memory area (if registered). */
 bool update_runstate_area(struct vcpu *v)
 {
@@ -1660,8 +1683,8 @@ bool update_runstate_area(struct vcpu *v)
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
         guest_handle = has_32bit_shinfo(v->domain)
-            ? &v->runstate_guest.compat.p->state_entry_time + 1
-            : &v->runstate_guest.native.p->state_entry_time + 1;
+            ? &v->arch.runstate_guest.compat.p->state_entry_time + 1
+            : &v->arch.runstate_guest.native.p->state_entry_time + 1;
         guest_handle--;
         runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
         __raw_copy_to_guest(guest_handle,
@@ -1674,7 +1697,7 @@ bool update_runstate_area(struct vcpu *v)
         struct compat_vcpu_runstate_info info;
 
         XLAT_vcpu_runstate_info(&info, &runstate);
-        __copy_to_guest(v->runstate_guest.compat, &info, 1);
+        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
         rc = true;
     }
     else
diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index c46dccc25a..b879e8dd2c 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -36,7 +36,7 @@ arch_compat_vcpu_op(
             break;
 
         rc = 0;
-        guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
+        guest_from_compat_handle(v->arch.runstate_guest.compat, area.addr.h);
 
         if ( v == current )
         {
@@ -49,7 +49,7 @@ arch_compat_vcpu_op(
             vcpu_runstate_get(v, &runstate);
             XLAT_vcpu_runstate_info(&info, &runstate);
         }
-        __copy_to_guest(v->runstate_guest.compat, &info, 1);
+        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
 
         break;
     }
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f0f9c62feb..739c6b7b62 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -727,7 +727,10 @@ int domain_kill(struct domain *d)
         if ( cpupool_move_domain(d, cpupool0) )
             return -ERESTART;
         for_each_vcpu ( d, v )
+        {
+            arch_vcpu_cleanup_runstate(v);
             unmap_vcpu_info(v);
+        }
         d->is_dying = DOMDYING_dead;
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
@@ -1167,7 +1170,7 @@ int domain_soft_reset(struct domain *d)
 
     for_each_vcpu ( d, v )
     {
-        set_xen_guest_handle(runstate_guest(v), NULL);
+        arch_vcpu_cleanup_runstate(v);
         unmap_vcpu_info(v);
     }
 
@@ -1494,7 +1497,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
     case VCPUOP_register_runstate_memory_area:
     {
         struct vcpu_register_runstate_memory_area area;
-        struct vcpu_runstate_info runstate;
 
         rc = -EFAULT;
         if ( copy_from_guest(&area, arg, 1) )
@@ -1503,18 +1505,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !guest_handle_okay(area.addr.h, 1) )
             break;
 
-        rc = 0;
-        runstate_guest(v) = area.addr.h;
-
-        if ( v == current )
-        {
-            __copy_to_guest(runstate_guest(v), &v->runstate, 1);
-        }
-        else
-        {
-            vcpu_runstate_get(v, &runstate);
-            __copy_to_guest(runstate_guest(v), &runstate, 1);
-        }
+        rc = arch_vcpu_setup_runstate(v, area);
 
         break;
     }
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 6819a3bf38..2f62c3e8f5 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -204,6 +204,15 @@ struct arch_vcpu
      */
     bool need_flush_to_ram;
 
+    /* runstate guest lock */
+    spinlock_t runstate_guest_lock;
+
+    /* runstate guest info */
+    struct vcpu_runstate_info *runstate_guest;
+
+    /* runstate pages mapped for runstate_guest */
+    struct page_info *runstate_guest_page[2];
+
 }  __cacheline_aligned;
 
 void vcpu_show_execution_state(struct vcpu *);
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 635335634d..007ccfbf9f 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -11,6 +11,11 @@
 #include <asm/x86_emulate.h>
 #include <public/vcpu.h>
 #include <public/hvm/hvm_info_table.h>
+#ifdef CONFIG_COMPAT
+#include <compat/vcpu.h>
+DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
+#endif
+
 
 #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
 
@@ -638,6 +643,17 @@ struct arch_vcpu
     struct {
         bool next_interrupt_enabled;
     } monitor;
+
+#ifndef CONFIG_COMPAT
+# define runstate_guest(v) ((v)->arch.runstate_guest)
+    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest address */
+#else
+# define runstate_guest(v) ((v)->arch.runstate_guest.native)
+    union {
+        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
+        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
+    } runstate_guest;
+#endif
 };
 
 struct guest_memory_policy
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 7e51d361de..5e8cbba31d 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -5,6 +5,7 @@
 #include <xen/types.h>
 
 #include <public/xen.h>
+#include <public/vcpu.h>
 #include <asm/domain.h>
 #include <asm/numa.h>
 
@@ -63,6 +64,10 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
 void unmap_vcpu_info(struct vcpu *v);
 
+int arch_vcpu_setup_runstate(struct vcpu *v,
+                             struct vcpu_register_runstate_memory_area area);
+void arch_vcpu_cleanup_runstate(struct vcpu *v);
+
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..fac030fb83 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -29,11 +29,6 @@
 #include <public/vcpu.h>
 #include <public/event_channel.h>
 
-#ifdef CONFIG_COMPAT
-#include <compat/vcpu.h>
-DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
-#endif
-
 /*
  * Stats
  *
@@ -166,16 +161,7 @@ struct vcpu
     struct sched_unit *sched_unit;
 
     struct vcpu_runstate_info runstate;
-#ifndef CONFIG_COMPAT
-# define runstate_guest(v) ((v)->runstate_guest)
-    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest address */
-#else
-# define runstate_guest(v) ((v)->runstate_guest.native)
-    union {
-        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
-        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
-    } runstate_guest; /* guest address */
-#endif
+
     unsigned int     new_state;
 
     /* Has the FPU been initialised? */
-- 
2.17.1


