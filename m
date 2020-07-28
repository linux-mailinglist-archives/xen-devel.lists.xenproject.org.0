Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553C230E7E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 17:54:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Ruf-0003x6-Oj; Tue, 28 Jul 2020 15:53:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kvrz=BH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k0Rue-0003x1-21
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 15:53:08 +0000
X-Inumbo-ID: 6d6b52be-d0ea-11ea-a90f-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d6b52be-d0ea-11ea-a90f-12813bfff9fa;
 Tue, 28 Jul 2020 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/hjoToH+YF1XXX6PP8N1wKXPnL1QZ3k4NfiXQwytUU=;
 b=pZgwnxc0My7y7lmK3Li+1ZBv897RF6UtjV0WrTBDHpLeO/mo3Ww2hBdBb6FRAJU0u6UGQwRdT5bvuanwXiJrdgWYtv0Xw52b8/zWfMjZDEvXBkS1P7OJ0ychDrPR50KDGJkfsYGwYbRZBanlD9cyiTOatyg9dEG5yHaLRkLL8bo=
Received: from MR2P264CA0100.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::16)
 by DB7PR08MB3003.eurprd08.prod.outlook.com (2603:10a6:5:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Tue, 28 Jul
 2020 15:53:05 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::84) by MR2P264CA0100.outlook.office365.com
 (2603:10a6:500:33::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 15:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 15:53:04 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Tue, 28 Jul 2020 15:53:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e05cd15b33bd27f
X-CR-MTA-TID: 64aa7808
Received: from 3d316b07d0a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC60E24A-AB0F-491B-93CA-AD2E045D730F.1; 
 Tue, 28 Jul 2020 15:52:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d316b07d0a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jul 2020 15:52:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4O4bOX83tzITGwMajsxCcmLbK3s8srEhWFtj4rh8PpkahhXKlGz75c7YiKgSaCozyV8AdJoxTqgYyWmLnD9FvWTTWulb/uX6RSKu60HES3X1wdXBkUyPfTkN9/1NHn4Q8JoLlOObZDmF3mwIm80Is+pe1xQAGjWRCVPF5DA2hpa5EVMVRGvp7NGLqb7VlKNe0vJYFuHQN6l9mLhPMVHCEu5BVT3BRpBgRRlWuNaFxVMv4LUNf+MuUFcCc9GnxyVrKpJvDHclnlEzi7uwbTMLUJ2lyI9W3dQZJyYod/aPnPXxbAnBNhEAKAnR+eagiQEGb/FKyrK77aIcc8ax/9bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/hjoToH+YF1XXX6PP8N1wKXPnL1QZ3k4NfiXQwytUU=;
 b=gIgu3ZodWzfTzOsSQl1ZdQxglQTtISaUBEDwmF86o14WB29n0zv2LO+T+2lzgnjL1sX3UYt+LHTGd2mF3HJg5+UmvmHyw6GA1aC9XeH3bP0ZbrQxoSh8ZNKAGI/yl600TzCzIkzTwOugm1zZ2P/Vk5bZzUahwLTvWxhUqivi7of1V9mEvgdyl2mg+QFhl9hGx6sNakMOP2WwQIrT9M+YAsQzqeEnIjCSGHHEACHQBXGnj1WHudhW2WyZai1Hv2lj8RzQ8OpOIcnVMaa4iPCwDdtVP4NIgtKn7pgT5RFWqYGYLGmpSYo2cokvw87PMrBO70i+SPXRr5CVss8rEy4GJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/hjoToH+YF1XXX6PP8N1wKXPnL1QZ3k4NfiXQwytUU=;
 b=pZgwnxc0My7y7lmK3Li+1ZBv897RF6UtjV0WrTBDHpLeO/mo3Ww2hBdBb6FRAJU0u6UGQwRdT5bvuanwXiJrdgWYtv0Xw52b8/zWfMjZDEvXBkS1P7OJ0ychDrPR50KDGJkfsYGwYbRZBanlD9cyiTOatyg9dEG5yHaLRkLL8bo=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3692.eurprd08.prod.outlook.com (2603:10a6:10:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Tue, 28 Jul
 2020 15:52:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 15:52:56 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen/arm: Convert runstate address during hypcall
Date: Tue, 28 Jul 2020 16:52:41 +0100
Message-Id: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0601CA0024.namprd06.prod.outlook.com
 (2603:10b6:803:2f::34) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by
 SN4PR0601CA0024.namprd06.prod.outlook.com (2603:10b6:803:2f::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 15:52:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4a5cbd4-39e9-4bf1-b54b-08d8330e507a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3692:|DB7PR08MB3003:
X-Microsoft-Antispam-PRVS: <DB7PR08MB30038E16EAE3347EE0F0C6479D730@DB7PR08MB3003.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PpFJ+fpfHTUWIF3xCXDVZakyobW86hbW4V+3ge2c+kKAP/nUJLHqphQdDG5OJQFg77fd8h1cstucSVXoY40Wj4Bt/U+/eLvs4DTzb/6CNuIyeb2pp36XubZtqluu2X5J+jax8eiaBSXHE2Ahm09vgAaX80IEjkedeX8VekIKBcjk+j9niJ8Fcii1HrzNMGDa91fGA3D13ELE/NCfuXHPqfSAInLsH+gIKdQN6BChTOlrjiCl/PcANw3sdK7btTMCgMYUCL43zau+4td3BELnX4V7PEAWQI5Hhr1Emg29dEOIYAxDzhnywOv1A+aFXAd2yXaeMD6YwcVA0ZGlGe1UAYEr15QRkZx9y7dK/N11enlArr7pkYpjaDsec7MVoTuL
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(66476007)(66556008)(66946007)(54906003)(52116002)(7416002)(36756003)(8936002)(86362001)(30864003)(316002)(478600001)(8676002)(956004)(2616005)(7696005)(44832011)(6666004)(186003)(2906002)(4326008)(6916009)(5660300002)(6486002)(83380400001)(26005)(16526019)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Ed6bvtf1IIdmtx4E5desROcBiYMj64pMlQJZHQos8lCJf1Ql0N90+zdg+45v1/vr6uQHLGE8yqCacXrzDmBY3Djtd3/Q/w+McVXFiQCdS0aSCMRb+nt5h4NHK5+S4GveMLc7yzaupj2LjqjswergJVcHoGYdVC/9+uD3HKe7XmneNud+E0HGFzOaiU6nYT7RoptXt3KoszQh4+0rLOxmZulQ7+8Y53DsAy4BFP8kAbOW2RZQ8EGpitI9Mh3g5jJaT+HINJokpeH7lFjXTpAosJ5uk+yO1PoW+NY4HOiLjeZK5x5veKs6aza6l3S18Kex9X//lTqqKh9HjxVCHlGua+nOEmmtVoiYCkD7ZZDxUYb852Ue1yoM8ubi5/ZTtIzk7XriUED49NBPzJroGjUFmfR5clhhOec75nxow47Q7PCevlEGkkD7+0H18pqz/FoIWd9YliCMjOEfb7KbcYIxjCxKDejk02f0s8JPJ+VQ/80xN+qbj82+3zTx0zmVa6aV
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3692
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9d4149af-3aa5-4eaf-3c72-08d8330e4b5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHkPbjKcS1m6eNZLdfowgS3l+kgv8MD/Nq7inE7TwwjPDwc5QgZraQ7jpbL9/B4UVnCNHJVCGjXPNzAcfMOpWq9UslEYiD8sKAI52eop0D1DIf8X0/vVuRYgGoDcOCILiJzxppIQsTlafT6olbFZGRWL7jNl9+oHzlOMTIo2nkldIzyRKDpmnSF+bqUbVj8nZJLIpuLlGRpm9mUwbfqlJ5pVITNThov1u96Ja1l5itf56uJFsfLm1phItjh5xEujpD9HRzAoBfhgLGeIlKF/pZoy2cyFiS2bDzPewe7yagsb5yJ3sNteo94JwrnveLP8WMb+q8PYbl1CEXBd0/RSsMXhbWqvmbzHmfRM7biYSGtKaLrD3sbs0yUY/ikhh2Ygqu6TlxJsr4+lboDnx00TsXQ4PNZ7JiUm17yUJpsmTohnFHJ2DGanGIFCAPTetWsT
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966005)(336012)(26005)(16526019)(6666004)(70206006)(30864003)(7696005)(478600001)(2616005)(70586007)(6486002)(186003)(956004)(36756003)(44832011)(81166007)(2906002)(107886003)(82310400002)(86362001)(47076004)(5660300002)(6916009)(8936002)(316002)(36906005)(83380400001)(82740400003)(356005)(54906003)(4326008)(8676002)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 15:53:04.3594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a5cbd4-39e9-4bf1-b54b-08d8330e507a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3003
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

---
 xen/arch/arm/domain.c        | 160 +++++++++++++++++++++++++++++++----
 xen/arch/x86/domain.c        |  30 ++++++-
 xen/arch/x86/x86_64/domain.c |   4 +-
 xen/common/domain.c          |  19 ++---
 xen/include/asm-arm/domain.h |   9 ++
 xen/include/asm-x86/domain.h |  16 ++++
 xen/include/xen/domain.h     |   5 ++
 xen/include/xen/sched.h      |  16 +---
 8 files changed, 207 insertions(+), 52 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 31169326b2..c595438bd9 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -19,6 +19,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/wait.h>
+#include <xen/vmap.h>
 
 #include <asm/alternative.h>
 #include <asm/cpuerrata.h>
@@ -275,36 +276,157 @@ static void ctxt_switch_to(struct vcpu *n)
     virt_timer_restore(n);
 }
 
-/* Update per-VCPU guest runstate shared memory area (if registered). */
-static void update_runstate_area(struct vcpu *v)
+static void cleanup_runstate_vcpu_locked(struct vcpu *v)
+{
+    if ( v->arch.runstate_guest )
+    {
+        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MASK));
+
+        put_page(v->arch.runstate_guest_page[0]);
+
+        if ( v->arch.runstate_guest_page[1] )
+        {
+            put_page(v->arch.runstate_guest_page[1]);
+        }
+        v->arch.runstate_guest = NULL;
+    }
+}
+
+void arch_vcpu_cleanup_runstate(struct vcpu *v)
 {
-    void __user *guest_handle = NULL;
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
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
+    offset = vaddr & ~PAGE_MASK;
 
-    if ( VM_ASSIST(v->domain, runstate_update_flag) )
+    /* provided address must be aligned to a 64bit */
+    if ( offset % alignof(struct vcpu_runstate_info) )
     {
-        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
-        guest_handle--;
-        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
-        smp_wmb();
+        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
+                "Invalid offset\n", vaddr);
+        return -EINVAL;
+    }
+
+    page = get_page_from_gva(v, vaddr, GV2M_WRITE);
+    if ( !page )
+    {
+        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
+                "Page is not mapped\n", vaddr);
+        return -EINVAL;
+    }
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
+            gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
+                    "2nd Page is not mapped\n", vaddr);
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
+
+    p = vmap(mfn, numpages);
+    if ( !p )
+    {
+        put_page(v->arch.runstate_guest_page[0]);
+        if ( numpages == 2 )
+            put_page(v->arch.runstate_guest_page[1]);
+
+        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
+                "vmap error\n", vaddr);
+        return -EINVAL;
     }
 
-    __copy_to_guest(runstate_guest(v), &runstate, 1);
+    v->arch.runstate_guest = p + offset;
 
-    if ( guest_handle )
+    if (v == current)
     {
-        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
+    }
+    else
+    {
+        vcpu_runstate_get(v, &runstate);
+        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate));
+    }
+
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
+
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
+    {
+        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        {
+            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+            v->arch.runstate_guest->state_entry_time |= XEN_RUNSTATE_UPDATE;
+            smp_wmb();
+        }
+
+        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
+
+        /* copy must be done before switching the bit */
         smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+
+        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        {
+            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+            v->arch.runstate_guest->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        }
     }
+
+    spin_unlock(&v->arch.runstate_guest_lock);
 }
 
 static void schedule_tail(struct vcpu *prev)
@@ -560,6 +682,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.saved_context.sp = (register_t)v->arch.cpu_info;
     v->arch.saved_context.pc = (register_t)continue_new_vcpu;
 
+    spin_lock_init(&v->arch.runstate_guest_lock);
+
     /* Idle VCPUs don't need the rest of this setup */
     if ( is_idle_vcpu(v) )
         return rc;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fee6c3931a..98910b7cf1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1642,6 +1642,30 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
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
+    {
+        __copy_to_guest(runstate_guest(v), &v->runstate, 1);
+    }
+    else
+    {
+        vcpu_runstate_get(v, &runstate);
+        __copy_to_guest(runstate_guest(v), &runstate, 1);
+    }
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
@@ -1660,8 +1684,8 @@ bool update_runstate_area(struct vcpu *v)
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
@@ -1674,7 +1698,7 @@ bool update_runstate_area(struct vcpu *v)
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
index e9be05f1d0..cd8595b186 100644
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
index 4e2f582006..9df4d10abb 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -206,6 +206,15 @@ struct arch_vcpu
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
index 6fd94c2e14..c369d22ccc 100644
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
 
@@ -627,6 +632,17 @@ struct arch_vcpu
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


