Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E21F6753
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 13:59:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjLrb-0000f9-NV; Thu, 11 Jun 2020 11:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muN5=7Y=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjLrZ-0000ev-I5
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 11:59:17 +0000
X-Inumbo-ID: f914cde8-abda-11ea-bb8b-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::600])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f914cde8-abda-11ea-bb8b-bc764e2007e4;
 Thu, 11 Jun 2020 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9LeQAfhC/BKsL2smIOUvgONsIexEg/IAzNAQ+yxpOo=;
 b=Gc1RME7v0RCufZPS0A2ygCI9rPimBD1BkZnpFTHg9cfPPo8eGSFM36U6Bx5CoY7aJIr/eUYQaYpV7i/ZOa+xunsE2RRfwT3EhIWqysVg8FOHBLZv1Hc6dGbmOn/XDZOJ2en4n92k1OWlJ9X7NeO+xNd+cdZv7xFw5M+yhaJIE34=
Received: from AM6P195CA0071.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::48)
 by AM6PR08MB2966.eurprd08.prod.outlook.com (2603:10a6:209:4e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Thu, 11 Jun
 2020 11:59:13 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::50) by AM6P195CA0071.outlook.office365.com
 (2603:10a6:209:87::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Thu, 11 Jun 2020 11:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 11:59:13 +0000
Received: ("Tessian outbound 39cdd740f5cb:v59");
 Thu, 11 Jun 2020 11:59:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6929578770bac2f
X-CR-MTA-TID: 64aa7808
Received: from 58f8df83267e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF4A3B3B-644E-4C1A-8E7B-D325FDD950B6.1; 
 Thu, 11 Jun 2020 11:59:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58f8df83267e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Jun 2020 11:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGHQ0jEwQLNPfQ9tSLfo6AIM81aGLaqAwR6g8zPZjIHcqqZMYkEgAkx55KzOSI/uX3Y/qRYk/Xr16TKAu78lkW3NUpqLPNUUh+D9UGs+iZf7vl0z8ISzEtFBV0SH+GdSDekZMp8dGwOP7kJs0WSkcU0B2BoszqwzDXPOYvClbGH+AvobzkspHkxs/QboOUOTeqKnPRRsemUbcoxyce+enA8lVfu89WaNiysiDayO2PHbOrZRm63/4dGVeBPxwksapviKfAa34Clo0qCRdJL2MKDX2MimbAte/e3HVbPbJbI8ILfYzMAiIuUNPBhlfXJ9JEnPWEU3T0pZSYv6euHgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9LeQAfhC/BKsL2smIOUvgONsIexEg/IAzNAQ+yxpOo=;
 b=leJoQCK2E0kMGqpJvuSxQisz7ezE9Z+lmrDZs6yqT2B1AuyB9jEoqoVDOKydwgoAHuFNwsRf3RmevsMC3TJWzgW0ZzwHwCZr3fFr0HpH+4OoPcgO4GlzjDCdf1VhhJiQizcRq+gIfB7H06zr6rqjpFZsLzg8m1M5/HyyUOk3+xXJSJ8iY/TLB5PVxVFTXssxTYCNV8YHXUCSwiCbwmeGRvjfSVR8/29iv5PmfFDINjXO8C0GRUvxH3YraCBLzy0CufLj794CerJ4XSjnb23t0VzGoY9kMKt04Vz7jua7WBOYfuNB+LzAy5eff4Cw29oYESU7eAgyyutWI3QMf36CbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9LeQAfhC/BKsL2smIOUvgONsIexEg/IAzNAQ+yxpOo=;
 b=Gc1RME7v0RCufZPS0A2ygCI9rPimBD1BkZnpFTHg9cfPPo8eGSFM36U6Bx5CoY7aJIr/eUYQaYpV7i/ZOa+xunsE2RRfwT3EhIWqysVg8FOHBLZv1Hc6dGbmOn/XDZOJ2en4n92k1OWlJ9X7NeO+xNd+cdZv7xFw5M+yhaJIE34=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 11:59:05 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 11:59:05 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Date: Thu, 11 Jun 2020 12:58:20 +0100
Message-Id: <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591806713.git.bertrand.marquis@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0008.namprd21.prod.outlook.com
 (2603:10b6:805:106::18) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by
 SN6PR2101CA0008.namprd21.prod.outlook.com (2603:10b6:805:106::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.0 via Frontend
 Transport; Thu, 11 Jun 2020 11:59:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15f000e1-ac0b-4795-ecdc-08d80dfedbe2
X-MS-TrafficTypeDiagnostic: DB7PR08MB3387:|AM6PR08MB2966:
X-Microsoft-Antispam-PRVS: <AM6PR08MB2966E8D14611EED72F3F05CE9D800@AM6PR08MB2966.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: D9wQPT1Vw+v6KQltmu09NTYPOCY1mhLdUwZv6Nr81EbAR8WId5a9zjhmw20V0Nw5iO7rWZrQxy1v+EcjFjdfdFXrFr/qd9dN5XFGnd7tFIuZ8ztVQWYjBvp8eWAkhoveIsIGRW7PsNKz4FRHZu92tNvubeizWom6wRgHLxve3enxaLMZJTh/aT16Chb7m65DsdyRl8Occhcb4h9KarGcEBfiCV39udQL8U4wGxylpSlgJ9nYoiQk5bnFbx55YYiAPD4eBk2eSYNLj04ChdHecnpjEmq7hnljD56pVaJSfeP3P31bMdrYCtL39pzs9o8K4TYmbYPDq6rKhrSyZraUbZXKULTI+ulbNhQktGnsWX4HLuX+3q6vWY6vfVrM8LdP
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(66476007)(6486002)(66946007)(86362001)(5660300002)(16526019)(36756003)(6666004)(7416002)(30864003)(186003)(4326008)(2906002)(26005)(83380400001)(66556008)(8676002)(956004)(6916009)(54906003)(8936002)(52116002)(2616005)(7696005)(316002)(44832011)(478600001)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aWzEyJRdq1pGHFE09K6PK0lNXln1VWPBzowpXAHu45UPwD6QW2OaVxe858DapuHxIE6EhotLpYpKDirq1gkRstkuO5rxyvnPfUmlznyBif11hebgfPbpaEl4wP9WS5gEnp0iVMCKwWRBtq/sI8alh/hNyyfDuskme9/HG3Gn331qSyDiHFw3Sv9PlM3f3lvUIb7YSmKDjHUGd4obBz/1r0gZi6YwxnexKvSyA+27xXTf1/1PuMLryTWLXRuI1yRGX2hJtYHl9sWX0hVbyCQjNGD7KwJkmTvJSdt5JdxdPnlq6ovMkOc4eE4S6HVsY9iX7O503cjniyvbrO8jvK7sVANJHFbvlN0p4d2j+6IrNjxFPhANuKLjTEYJM30DgyT2jmGLAKbG7fl/m1nMztMoJ3HEdiDIXgLrIilfgNWIvrM1NAkCG2pxP0OHmAhds9tYdeLrrW0SPS5nMmAWibJGc0xbzDDOcwhoWRKwPjWoXYkiA+gjLU9D6BXb3vs+o2u+
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(30864003)(83380400001)(2906002)(6666004)(8676002)(478600001)(70206006)(70586007)(86362001)(47076004)(336012)(81166007)(8936002)(54906003)(36906005)(2616005)(7696005)(44832011)(6486002)(5660300002)(6916009)(36756003)(107886003)(186003)(16526019)(82740400003)(356005)(316002)(26005)(82310400002)(956004)(4326008)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 74ba31bf-030a-4c6e-b19c-08d80dfed6b9
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2IE9rJbXiEm3dfCTxaPiMqIM+6vBgg/80cARySSrPk6UKwglI40xTiOrRg4bki1XF2u9DprIOww8IOQ7wcwUhCrsVhQyuBP9TrRVNMr7Fk7DnTP6sOOsJdmQ0BlkKqWr6Ko0MTOXHFG7xArEkE6TDPhAOx98BL2A/FsoFDpjfcOEA4X4ABxzdroxuCfML1Mqp9stjJ57cdOFjyd8xwlc3cqAAIsBVe7M64fHcKT8A+ip8aIdC8DwJEZJ/FiFADrcbs90t3cHGcZL0xSP13Q8XMsix8b8sjxZRZiPFHBFVf3TEY+mos0FZSXyIqKr8mWYgEkW6IoOwEeG4PdBUqC3wx+UPKStcfTpdXwYU9mHXGH+mKuCC4pmDVhdGaxo3L10IEEygm1pkfSzrDP5h0UQb8oOcH28arHTTjcbo7LGI62tXc9fLOuultRqZquZn+0q
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 11:59:13.4137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f000e1-ac0b-4795-ecdc-08d80dfedbe2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2966
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

This patch is modifying the register runstate area handling on arm to
convert the guest address during the hypercall. During runtime context
switches the area is mapped to update the guest runstate copy.
The patch is also removing the initial copy which was done during the
hypercall handling as this is done on the current core when the context
is restore to go back to guest execution on arm.

As a consequence if the register runstate hypercall is called on one
vcpu for an other vcpu, the area will not be updated until the vcpu
will be executed (on arm only).

On x86, the behaviour is not modified, the address conversion is done
during the context switch and the area is updated fully during the
hypercall.
inline functions in headers could not be used as the architecture
domain.h is included before the global domain.h making it impossible
to use the struct vcpu inside the architecture header.
This should not have any performance impact as the hypercall is only
called once per vcpu usually.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/domain.c        | 109 +++++++++++++++++++++++++++++------
 xen/arch/x86/domain.c        |  30 +++++++++-
 xen/arch/x86/x86_64/domain.c |   4 +-
 xen/common/domain.c          |  19 ++----
 xen/include/asm-arm/domain.h |   8 +++
 xen/include/asm-x86/domain.h |  16 +++++
 xen/include/xen/domain.h     |   4 ++
 xen/include/xen/sched.h      |  16 +----
 8 files changed, 153 insertions(+), 53 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 31169326b2..739059234f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -19,6 +19,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/wait.h>
+#include <xen/domain_page.h>
 
 #include <asm/alternative.h>
 #include <asm/cpuerrata.h>
@@ -275,36 +276,104 @@ static void ctxt_switch_to(struct vcpu *n)
     virt_timer_restore(n);
 }
 
-/* Update per-VCPU guest runstate shared memory area (if registered). */
-static void update_runstate_area(struct vcpu *v)
+void arch_cleanup_runstate_guest(struct vcpu *v)
 {
-    void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
+    spin_lock(&v->arch.runstate_guest.lock);
 
-    if ( guest_handle_is_null(runstate_guest(v)) )
-        return;
+    /* cleanup previous page if any */
+    if ( v->arch.runstate_guest.page )
+    {
+        put_page_and_type(v->arch.runstate_guest.page);
+        v->arch.runstate_guest.page = NULL;
+        v->arch.runstate_guest.offset = 0;
+    }
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
+    spin_unlock(&v->arch.runstate_guest.lock);
+}
 
-    if ( VM_ASSIST(v->domain, runstate_update_flag) )
+int arch_setup_runstate_guest(struct vcpu *v,
+                            struct vcpu_register_runstate_memory_area area)
+{
+    struct page_info *page;
+    unsigned offset;
+
+    spin_lock(&v->arch.runstate_guest.lock);
+
+    /* cleanup previous page if any */
+    if ( v->arch.runstate_guest.page )
     {
-        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
-        guest_handle--;
-        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
-        smp_wmb();
+        put_page_and_type(v->arch.runstate_guest.page);
+        v->arch.runstate_guest.page = NULL;
+        v->arch.runstate_guest.offset = 0;
+    }
+
+    offset = ((vaddr_t)area.addr.v) & ~PAGE_MASK;
+    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
+    {
+        spin_unlock(&v->arch.runstate_guest.lock);
+        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
+        return -EINVAL;
+    }
+
+    /* provided address must be aligned to a 64bit */
+    if ( offset % alignof(struct vcpu_runstate_info) )
+    {
+        spin_unlock(&v->arch.runstate_guest.lock);
+        gprintk(XENLOG_DEBUG, "Runstate pointer is not aligned\n");
+        return -EINVAL;
+    }
+
+    page = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
+    if ( !page )
+    {
+        spin_unlock(&v->arch.runstate_guest.lock);
+        gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
+        return -EINVAL;
     }
 
-    __copy_to_guest(runstate_guest(v), &runstate, 1);
+    v->arch.runstate_guest.page = page;
+    v->arch.runstate_guest.offset = offset;
+
+    spin_unlock(&v->arch.runstate_guest.lock);
+
+    return 0;
+}
+
+
+/* Update per-VCPU guest runstate shared memory area (if registered). */
+static void update_runstate_area(struct vcpu *v)
+{
+    struct vcpu_runstate_info *guest_runstate;
+    void *p;
+
+    spin_lock(&v->arch.runstate_guest.lock);
 
-    if ( guest_handle )
+    if ( v->arch.runstate_guest.page )
     {
-        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        p = __map_domain_page(v->arch.runstate_guest.page);
+        guest_runstate = p + v->arch.runstate_guest.offset;
+
+        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        {
+            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
+            smp_wmb();
+        }
+
+        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
         smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+
+        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        {
+            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+            guest_runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+            smp_wmb();
+        }
+
+        unmap_domain_page(p);
     }
+
+    spin_unlock(&v->arch.runstate_guest.lock);
 }
 
 static void schedule_tail(struct vcpu *prev)
@@ -560,6 +629,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.saved_context.sp = (register_t)v->arch.cpu_info;
     v->arch.saved_context.pc = (register_t)continue_new_vcpu;
 
+    spin_lock_init(&v->arch.runstate_guest.lock);
+
     /* Idle VCPUs don't need the rest of this setup */
     if ( is_idle_vcpu(v) )
         return rc;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fee6c3931a..32bbed87d5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1642,6 +1642,30 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
 }
 
+int arch_setup_runstate_guest(struct vcpu *v,
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
+void arch_cleanup_runstate_guest(struct vcpu *v)
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
index 7cc9526139..0ca6bf4dbc 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -727,7 +727,10 @@ int domain_kill(struct domain *d)
         if ( cpupool_move_domain(d, cpupool0) )
             return -ERESTART;
         for_each_vcpu ( d, v )
+        {
+            arch_cleanup_runstate_guest(v);
             unmap_vcpu_info(v);
+        }
         d->is_dying = DOMDYING_dead;
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
@@ -1167,7 +1170,7 @@ int domain_soft_reset(struct domain *d)
 
     for_each_vcpu ( d, v )
     {
-        set_xen_guest_handle(runstate_guest(v), NULL);
+        arch_cleanup_runstate_guest(v);
         unmap_vcpu_info(v);
     }
 
@@ -1484,7 +1487,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
     case VCPUOP_register_runstate_memory_area:
     {
         struct vcpu_register_runstate_memory_area area;
-        struct vcpu_runstate_info runstate;
 
         rc = -EFAULT;
         if ( copy_from_guest(&area, arg, 1) )
@@ -1493,18 +1495,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
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
+        rc = arch_setup_runstate_guest(v, area);
 
         break;
     }
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 4e2f582006..3a7f53e13d 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -11,6 +11,7 @@
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
 #include <public/hvm/params.h>
+#include <public/vcpu.h>
 #include <xen/serial.h>
 #include <xen/rbtree.h>
 
@@ -206,6 +207,13 @@ struct arch_vcpu
      */
     bool need_flush_to_ram;
 
+    /* runstate guest info */
+    struct {
+        struct page_info *page;  /* guest page */
+        unsigned         offset; /* offset in page */
+        spinlock_t       lock;   /* lock to access page */
+    } runstate_guest;
+
 }  __cacheline_aligned;
 
 void vcpu_show_execution_state(struct vcpu *);
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index e8cee3d5e5..f917b48cb8 100644
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
 
@@ -626,6 +631,17 @@ struct arch_vcpu
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
index 7e51d361de..d5d73ce997 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -63,6 +63,10 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
 void unmap_vcpu_info(struct vcpu *v);
 
+int arch_setup_runstate_guest(struct vcpu *v,
+                            struct vcpu_register_runstate_memory_area area);
+void arch_cleanup_runstate_guest(struct vcpu *v);
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


