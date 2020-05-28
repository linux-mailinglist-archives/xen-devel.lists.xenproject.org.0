Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267051E65FA
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 17:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKR2-0002Ym-GB; Thu, 28 May 2020 15:27:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLP3=7K=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jeKR1-0002Yd-DG
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:27:07 +0000
X-Inumbo-ID: af79e986-a0f7-11ea-9947-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::608])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af79e986-a0f7-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x49loOKd0eLq+Ci8SrugkRc00z80hcsQX17k9oTzHC4=;
 b=Q3/QlUSiNfIKPgnr10Nnt/5xpCuTh2osygZRHA8jwp1dicO98oAZgXPus5miCpdFjrN26V32zu/tMI1o7LDPMi0qz9cGe/Tn3XGKWO4fjEHe4uq9O442WlXPtYnXIIGn+9+SKix2aqPs6K+3hI+GzdJIzY1TcAp2WiDc8JhZTM8=
Received: from MR2P264CA0056.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::20)
 by VI1PR08MB3391.eurprd08.prod.outlook.com (2603:10a6:803:83::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 28 May
 2020 15:27:03 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::4f) by MR2P264CA0056.outlook.office365.com
 (2603:10a6:500:31::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Thu, 28 May 2020 15:27:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Thu, 28 May 2020 15:27:02 +0000
Received: ("Tessian outbound cff7dd4de28a:v57");
 Thu, 28 May 2020 15:27:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ba243edbbda6a26
X-CR-MTA-TID: 64aa7808
Received: from 72b4dd1d4e3b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F79D85F-8E11-4C8B-AA30-1402C01297F0.1; 
 Thu, 28 May 2020 15:27:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72b4dd1d4e3b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 May 2020 15:27:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGDDAeSlF0aiahxa37OAMA9PqojcavNfZKKGZp4gjwqMkKY1ugUov0s1sC70CA0C0uEtAXEW4WNDvIsQYhu8d1YbueN4RH9elvo7lcHLkZWi/f9ETEwtET+/+SkvX+wXJpbx5vvcsIXI4VZeh0coezBzqDkwi+4UtHCvvZOnGk3k3/xrj5kiw9GtOT/XyOGjLPSX3kfHRdw9Q9pn83a+H4VoARjSwYwUy04b2AVHlM019tMq9sXk2BOQkU0atCg/pTB3+sPGj9VtmdbRHdFePzFY9jDc7yezTj/SC7fY5841tO/uCRY2UieR7Xyz6kJ/sI1qupEjdx9hJrJForEQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x49loOKd0eLq+Ci8SrugkRc00z80hcsQX17k9oTzHC4=;
 b=IKpw31S1XMY5MOdkvnBuhq6iOJunbGJ+ZFTdfZL/8bBFPxFk2CWNGFdlrkisV4qiVavUTM1LzzTNDl28r8pUxqiHQeT+5XcS7yW1EiCy3kDeME0QUapB25PInxPD+ZlWaYoWy309iNM270iOYj4umaO4qanSTvmqHtvYL5X8InUmYa5wMzsdzAl8NCgKoiHUP6w/kreCbPvBCAzWofTjYFjOuR8ytjOKQz/lxXuPGd7v79Bbr8UFOrhz5Q9YmjNxzem7O02RCJPwSoQCw3/W+uOjqt46cQMwWcixHbDAgVKie0tbF4afrMeAMcE8c60CnaCysrnQ9cPzBDJ9lHxanw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x49loOKd0eLq+Ci8SrugkRc00z80hcsQX17k9oTzHC4=;
 b=Q3/QlUSiNfIKPgnr10Nnt/5xpCuTh2osygZRHA8jwp1dicO98oAZgXPus5miCpdFjrN26V32zu/tMI1o7LDPMi0qz9cGe/Tn3XGKWO4fjEHe4uq9O442WlXPtYnXIIGn+9+SKix2aqPs6K+3hI+GzdJIzY1TcAp2WiDc8JhZTM8=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3211.eurprd08.prod.outlook.com (2603:10a6:5:27::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 15:27:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3021.030; Thu, 28 May 2020
 15:27:01 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Date: Thu, 28 May 2020 16:25:31 +0100
Message-Id: <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590675919.git.bertrand.marquis@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0017.namprd07.prod.outlook.com
 (2603:10b6:803:28::27) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by
 SN4PR0701CA0017.namprd07.prod.outlook.com (2603:10b6:803:28::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Thu, 28 May 2020 15:26:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4d97222-9bd9-4b92-6a65-08d8031b9296
X-MS-TrafficTypeDiagnostic: DB7PR08MB3211:|VI1PR08MB3391:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3391D220CC1D2717A8BA085A9D8E0@VI1PR08MB3391.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OVKOPqr7sWKHHwBca/ky7F9njEiU4E8PjsuX5iEdNQO1u3AgEUXo2jh4k8XQ9Z4NHBWhR95stYW/V1dbO3SshOKxPuEGgJOncdatHNdLvfLwLCg/tU5kJKoMJIlqg5kufqQQVVyEnNFSkcOrpspIMy49z8PN0J5KpZ4Vzd8adrunDRB+iLfJm6B35Jc/5nVp5lD63ED/FwCBUZkhBw/DYWlskvI8lsJc8HuXv6Jwzg0WfU5f8FjLCvgPel+KDn9nqjcxAVrNjsHXT5cyb5oDAkD751VZGH99NuVv5rho9+5HbtqFpn+fDUTsit6BWDSqu3O/v6BGOhiPkIXrrAYg730j13rVHVvuKnA/38ybuG0m1pXDNxza38b1iZrOy/XskypZgwLloIxviM159CMcRTeUHmVdEau4+0Ru6UBxrsw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(36756003)(66946007)(316002)(6666004)(54906003)(478600001)(186003)(44832011)(956004)(66476007)(66556008)(7696005)(52116002)(2906002)(2616005)(16526019)(5660300002)(26005)(8676002)(7416002)(4326008)(8936002)(86362001)(83380400001)(6916009)(6486002)(136400200001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: kRcrYODIDK0s/gXVJPdF71N7EC5EbpQCcjYDQMl/pvkHwh6EfdTXE2440OqT2npOTnzQQG25wG/xriu+ReSala1Q5tahzL3xKDQ3h0N9XLuHi+8vYu58I8gtLr2kH6Xq6wivBWiYBcG47lj10lCqIMTzdCbtZLo45rpqAcTWaEcT7citPmcbeyxhdnmHQsDuhKI37WUL5O3Qcp7tsoOAsddluxZIWqPlhe5N2Pr+2qlGmdsw330xS/FtfnYtb9Ug+h1mgEG2maNVioTtnG1GDaIttt/Qezrc0+06A1y3kezEx1+ESOZozxLcaKMGkrEnN2/9KUuO2bq7+ei9ZWjZnxHAHef4HtE+OLdCVyA90luAcVCxejGRqv0il4e0Uz4GYT0+/J93VXIVPVO8hmPOizwMsLkye+Y7f7kYRF6yfDggQFXVtks0cY6sBLRzupNuEenW7o9NOQF6fOq4DP8DUgzw8req5qbHzWcIDyTJU2n7ao8RRPM28pMKQIKATeQr
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3211
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(6666004)(81166007)(478600001)(356005)(26005)(2616005)(82740400003)(36756003)(16526019)(70586007)(82310400002)(5660300002)(70206006)(336012)(956004)(47076004)(107886003)(8936002)(6486002)(54906003)(86362001)(36906005)(6916009)(8676002)(44832011)(7696005)(4326008)(2906002)(186003)(316002)(83380400001)(21314003)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 853b39a9-567d-4a3c-eae9-08d8031b914a
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjEuu2pJ84NWMpojryCZ0GHlsBRHybGW92iASM5BuWA/r+p/287DesgZGxQLod6b0aLtW7dBoUQ9O9R0XM6I9H4r5NASInEwDoi5s3Uaa73QvITH6fdVeVG0nxWwE42GLCrXqxUdO5U8quzBgfsALkbDXno3BowklJ5YeW2qz9bHH4o/I9Ldmrlzo1xID5gEtXvOIxIv5F/IGXM5IBpzGUd1nA3OiLDvFe1IVHEPEgGksCjSIlAaFL8JycG5iERpaXUHuQOlFF6tKTlBWjVC4XDkMxUhXT3m5SPrnrKit1PusEN0XqgyoBkEky0jEt/EMee1WrxCvmDWW53l8A3+jqPaTKAf2viyImT1Fjsa0xOlB1uV2EDG6PsNVwwbbuFJBEuhUTKZ1rQhmTERMUyFbodN/qKwM+hg08/LVTCMb9vLgxLK9Zs23MWEfXn8Kduczy5C5X8Ui04MD/iWqWPbQA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 15:27:02.9827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d97222-9bd9-4b92-6a65-08d8031b9296
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3391
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

This patch is modifying runstate handling to map the area given by the
guest inside Xen during the hypercall.
This is removing the guest virtual to physical conversion during context
switches which removes the bug and improve performance by preventing to
walk page tables during context switches.

--
In the current status, this patch is only working on Arm and needs to
be fixed on X86 (see #error on domain.c for missing get_page_from_gva).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/domain.c   | 32 +++++++++-------
 xen/arch/x86/domain.c   | 51 ++++++++++++++-----------
 xen/common/domain.c     | 84 ++++++++++++++++++++++++++++++++++-------
 xen/include/xen/sched.h | 11 ++++--
 4 files changed, 124 insertions(+), 54 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 31169326b2..799b0e0103 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -278,33 +278,37 @@ static void ctxt_switch_to(struct vcpu *n)
 /* Update per-VCPU guest runstate shared memory area (if registered). */
 static void update_runstate_area(struct vcpu *v)
 {
-    void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
+    struct vcpu_runstate_info *runstate;
 
-    if ( guest_handle_is_null(runstate_guest(v)) )
+    /* XXX why do we accept not to block here */
+    if ( !spin_trylock(&v->runstate_guest_lock) )
         return;
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
+    runstate = runstate_guest(v);
+
+    if (runstate == NULL)
+    {
+        spin_unlock(&v->runstate_guest_lock);
+        return;
+    }
 
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
-        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
-        guest_handle--;
-        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
         smp_wmb();
+        v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
     }
 
-    __copy_to_guest(runstate_guest(v), &runstate, 1);
+    memcpy(runstate, &v->runstate, sizeof(v->runstate));
 
-    if ( guest_handle )
+    if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
-        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
         smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+        v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
     }
+
+    spin_unlock(&v->runstate_guest_lock);
 }
 
 static void schedule_tail(struct vcpu *prev)
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 6327ba0790..10c6ceb561 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1642,57 +1642,62 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
 /* Update per-VCPU guest runstate shared memory area (if registered). */
 bool update_runstate_area(struct vcpu *v)
 {
-    bool rc;
     struct guest_memory_policy policy = { .nested_guest_mode = false };
-    void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
+    struct vcpu_runstate_info *runstate;
 
-    if ( guest_handle_is_null(runstate_guest(v)) )
+    /* XXX: should we return false ? */
+    if ( !spin_trylock(&v->runstate_guest_lock) )
         return true;
 
-    update_guest_memory_policy(v, &policy);
+    runstate = runstate_guest(v);
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
+    if (runstate == NULL)
+    {
+        spin_unlock(&v->runstate_guest_lock);
+        return true;
+    }
+
+    update_guest_memory_policy(v, &policy);
 
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
-        guest_handle = has_32bit_shinfo(v->domain)
-            ? &v->runstate_guest.compat.p->state_entry_time + 1
-            : &v->runstate_guest.native.p->state_entry_time + 1;
-        guest_handle--;
-        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
         smp_wmb();
+        if (has_32bit_shinfo(v->domain))
+            v->runstate_guest.compat->state_entry_time |= XEN_RUNSTATE_UPDATE;
+        else
+            v->runstate_guest.native->state_entry_time |= XEN_RUNSTATE_UPDATE;
     }
 
     if ( has_32bit_shinfo(v->domain) )
     {
         struct compat_vcpu_runstate_info info;
-
         XLAT_vcpu_runstate_info(&info, &runstate);
-        __copy_to_guest(v->runstate_guest.compat, &info, 1);
-        rc = true;
+        memcpy(v->runstate_guest.compat, &info, 1);
     }
     else
-        rc = __copy_to_guest(runstate_guest(v), &runstate, 1) !=
-             sizeof(runstate);
+        memcpy(runstate, &v->runstate, sizeof(v->runstate));
 
-    if ( guest_handle )
+    if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
-        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
         smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+        if (has_32bit_shinfo(v->domain))
+            v->runstate_guest.compat->state_entry_time |= XEN_RUNSTATE_UPDATE;
+        else
+            v->runstate_guest.native->state_entry_time |= XEN_RUNSTATE_UPDATE;
     }
 
+    spin_unlock(&v->runstate_guest_lock);
+
     update_guest_memory_policy(v, &policy);
 
-    return rc;
+    return true;
 }
 
 static void _update_runstate_area(struct vcpu *v)
 {
+    /* XXX: this should be removed */
     if ( !update_runstate_area(v) && is_pv_vcpu(v) &&
          !(v->arch.flags & TF_kernel_mode) )
         v->arch.pv.need_update_runstate_area = 1;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7cc9526139..acc6f90ba3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -161,6 +161,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     v->dirty_cpu = VCPU_CPU_CLEAN;
 
     spin_lock_init(&v->virq_lock);
+    spin_lock_init(&v->runstate_guest_lock);
 
     tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
 
@@ -691,6 +692,66 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
     return 0;
 }
 
+static void  unmap_runstate_area(struct vcpu *v, unsigned int lock)
+{
+    mfn_t mfn;
+
+    if ( ! runstate_guest(v) )
+        return;
+
+    if (lock)
+        spin_lock(&v->runstate_guest_lock);
+
+    mfn = domain_page_map_to_mfn(runstate_guest(v));
+
+    unmap_domain_page_global((void *)
+                            ((unsigned long)v->runstate_guest &
+                             PAGE_MASK));
+
+    put_page_and_type(mfn_to_page(mfn));
+    runstate_guest(v) = NULL;
+
+    if (lock)
+        spin_unlock(&v->runstate_guest_lock);
+}
+
+static int map_runstate_area(struct vcpu *v,
+                    struct vcpu_register_runstate_memory_area *area)
+{
+    unsigned long offset = area->addr.p & ~PAGE_MASK;
+    void *mapping;
+    struct page_info *page;
+    size_t size = sizeof(struct vcpu_runstate_info);
+
+    ASSERT(runstate_guest(v) == NULL);
+
+    /* do not allow an area crossing 2 pages */
+    if ( offset > (PAGE_SIZE - size) )
+        return -EINVAL;
+
+#ifdef CONFIG_ARM
+    page = get_page_from_gva(v, area->addr.p, GV2M_WRITE);
+#else
+    /* XXX how to solve this one ? */
+#error get_page_from_gva is not available on other archs
+#endif
+    if ( !page )
+        return -EINVAL;
+
+    mapping = __map_domain_page_global(page);
+
+    if ( mapping == NULL )
+    {
+        put_page_and_type(page);
+        return -ENOMEM;
+    }
+
+    runstate_guest(v) = (struct vcpu_runstate_info *)
+        ((unsigned long)mapping + offset);
+
+    return 0;
+}
+
 int domain_kill(struct domain *d)
 {
     int rc = 0;
@@ -727,7 +788,10 @@ int domain_kill(struct domain *d)
         if ( cpupool_move_domain(d, cpupool0) )
             return -ERESTART;
         for_each_vcpu ( d, v )
+        {
+            unmap_runstate_area(v, 0);
             unmap_vcpu_info(v);
+        }
         d->is_dying = DOMDYING_dead;
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
@@ -1167,7 +1231,7 @@ int domain_soft_reset(struct domain *d)
 
     for_each_vcpu ( d, v )
     {
-        set_xen_guest_handle(runstate_guest(v), NULL);
+        unmap_runstate_area(v, 1);
         unmap_vcpu_info(v);
     }
 
@@ -1484,7 +1548,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
     case VCPUOP_register_runstate_memory_area:
     {
         struct vcpu_register_runstate_memory_area area;
-        struct vcpu_runstate_info runstate;
 
         rc = -EFAULT;
         if ( copy_from_guest(&area, arg, 1) )
@@ -1493,18 +1556,13 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !guest_handle_okay(area.addr.h, 1) )
             break;
 
-        rc = 0;
-        runstate_guest(v) = area.addr.h;
+        spin_lock(&v->runstate_guest_lock);
 
-        if ( v == current )
-        {
-            __copy_to_guest(runstate_guest(v), &v->runstate, 1);
-        }
-        else
-        {
-            vcpu_runstate_get(v, &runstate);
-            __copy_to_guest(runstate_guest(v), &runstate, 1);
-        }
+        unmap_runstate_area(v, 0);
+
+        rc = map_runstate_area(v, &area);
+
+        spin_unlock(&v->runstate_guest_lock);
 
         break;
     }
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..ab87182e81 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -166,15 +166,18 @@ struct vcpu
     struct sched_unit *sched_unit;
 
     struct vcpu_runstate_info runstate;
+
+    spinlock_t      runstate_guest_lock;
+
 #ifndef CONFIG_COMPAT
 # define runstate_guest(v) ((v)->runstate_guest)
-    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest address */
+    vcpu_runstate_info_t *runstate_guest; /* mapped address of guest copy */
 #else
 # define runstate_guest(v) ((v)->runstate_guest.native)
     union {
-        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
-        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
-    } runstate_guest; /* guest address */
+        vcpu_runstate_info_t *native;
+        vcpu_runstate_info_compat_t *compat;
+    } runstate_guest; /* mapped address of guest copy */
 #endif
     unsigned int     new_state;
 
-- 
2.17.1


