Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C082E96949E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788652.1198131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNbL-0004wA-Qy; Tue, 03 Sep 2024 07:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788652.1198131; Tue, 03 Sep 2024 07:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNbL-0004ri-Lw; Tue, 03 Sep 2024 07:05:19 +0000
Received: by outflank-mailman (input) for mailman id 788652;
 Tue, 03 Sep 2024 07:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slNbK-0003uZ-KU
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:05:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2416::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df4c25f3-69c2-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 09:05:17 +0200 (CEST)
Received: from DS7PR03CA0208.namprd03.prod.outlook.com (2603:10b6:5:3b6::33)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 07:04:52 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::ef) by DS7PR03CA0208.outlook.office365.com
 (2603:10b6:5:3b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 07:04:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 07:04:50 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 02:04:45 -0500
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
X-Inumbo-ID: df4c25f3-69c2-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrSKR7mo4H47b+Wq9BPbpz1Zm2kUWwTfWMOTNKZ3Brbr9Fv1JxyDvlpbKQHcRJk9LzHAW2LEF+tSJsCYgs7T0ucq/x3jSQFrIPkqkV8e49Gb/rSehctbpfAJR3089NuWNTRCGsGdxdpiZlYOT5B5D9UjPFQ/dPYqvxS32mbMOZ+sH/egysad1HgucvmfwpqymVAIQDjMcZ7n3e+dAsdkBSboi3wyV4V5POrAE+lqq/c/SyBvlfnPrY5SkqXq6osopBPElyAQAkwZkZJCkifIwe9eEuQX6FglHep3eKSHrrkv5lr1n1LDgopEMQgmfz/uor7YNNPFvc2L5T56yKxzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9HsRibqBTCMt13S76pOCZKNm1S4OJKlQQcgJQgl9vA=;
 b=RI8SGTDSgwc8GjVioKIA6ojKpT7bj8UhAFwEdVWrXj1OpOw8ZsrdwnJC5IVpIRLVK/L7eAIDNzubuN7xBUBj6xUyFcDuuXhkHWGRIs8gk7PZDdzHIMCpxli+mgNdnKbCbZ+RgpgkkyK+oKygje5PL3lNEQmfdEEWOB7RSj/LY2Sp4gTuzwBcqyL0A+kxf+xDTDx3+pAhBfL5VeymPrqXnkG3kTVlpd0C8IXHAH0JBnNd5QFGU66pnR77pPPhhhYxV4BfbBZDn1GlR4EFaNy9/x5UxXDpYW7ydbNSkkPPDUCeh5DhyN19pzpr+/jwuIiigXCZbCog2jvVeB3wcAC5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9HsRibqBTCMt13S76pOCZKNm1S4OJKlQQcgJQgl9vA=;
 b=1N8DT9HJRXsSPKzI16EUg77MYhkjOBc0/4piJFPr8HHOKfTmEoWWSNaaaJDz6QKhJmNUuuaTe3upEAlu0dPwUou3zkWQGooCfzhQruHltOp4pq+Eg/pnRiaEqRCFJtTkpA1hxpa30XksIYX8REUP2E7kYhwoAd6V6BCZ69JK79s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Tue, 3 Sep 2024 15:04:21 +0800
Message-ID: <20240903070424.982218-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903070424.982218-1-Jiqian.Chen@amd.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 72efb3d9-3652-4163-1726-08dccbe6b45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HAUDxtmtEDRwQ/iz4LrFtIMAC86zoxQai4LTzs3ERgrHmKDdqE3cbme+1vjP?=
 =?us-ascii?Q?CViIOCh2R5aCezFQvzvrnLCMTDq+5+gFP1aZGAYx3MgBd9H1utSQ+GHgC8Jj?=
 =?us-ascii?Q?rSV72z8z0wBlw4e4r6IeQt2sHdQfDZYArp3bRRTs7ePTS3ycMmMXx4jd8CHE?=
 =?us-ascii?Q?n0+rsAgSNKbHGkdmIxUKvC8zbUZnpYWtShqDDPHrv3MVOkYWCu00vWf9oL8z?=
 =?us-ascii?Q?/USigjh9dYRsGZaGnBLXvrlv82OxRQ9vXlrDsTaCTgj50e0JjbOstNqAfpiH?=
 =?us-ascii?Q?vJbZgjK6myEqDxnLB5FRUSFaIMDzjpGH81MxQGiFYXcQpQ8l3Gh7ucNa8cc8?=
 =?us-ascii?Q?C0tT0/Casdxw3/8Hfwnt8gC33WX0qNViauRX1SSjm3iyzRO11G6f6sd75pBY?=
 =?us-ascii?Q?lGOvTzUcINGabHRI1wFg+K42ydfveuJ/q1EFUVFj9S1gJxt2a4F0w8lrgzDM?=
 =?us-ascii?Q?hVoeOCpp7CCJbLi6CFDEFjKP6N45ytdEXdl2HhFby/hgiPgMApJwHFEMJ8V1?=
 =?us-ascii?Q?9fdadJvU+QHfLs3c/2p/2q2otmMsVTobQh7X3GhUlx6SzlfU6X1+3zWEjAOE?=
 =?us-ascii?Q?WJ+OX1khmp462u8xmoNQoaYqD3nNuQhJAzoyyCL5WRsvsvdVvTdOZJTvIwzn?=
 =?us-ascii?Q?DFQcdAFHc9wW9SgvT87FG0cewwk1fT0hg3nYYlqaaT2buN8QgQIFgMRQs4bj?=
 =?us-ascii?Q?zhK+UM3Sty7gNRDbog5jsRjocAJV37CqhDVP9Uj9GCvocGSyQkGHuXA2jR+s?=
 =?us-ascii?Q?e0OQ1ltdsh+oKbBR3WbNJge8WSQtfXh6U093P15OLF1DApvImNIhBCxD9n7K?=
 =?us-ascii?Q?GOVgfnG8kTE8G4hw1TJ+ueoOGcXQwg9dN5P2/w4o5o5oEmegn+wrZvcCIyfi?=
 =?us-ascii?Q?wwIzqjRYpwFhTRLYm0MmfU36irTk4Gs3PXaNoB/p+d8R0UriP9B90JJvjEMI?=
 =?us-ascii?Q?tQS3wYU2YjSYt279FYoRrWZZmPu6L2UMB7X96gsKE30FL+kHpfzcHNA797DZ?=
 =?us-ascii?Q?/OnTWV+uKO/URA3RCwLBcInmqjdzS6uCtxWPEd40vdKetVewumsHFqjaFxp3?=
 =?us-ascii?Q?wRhJpPYAvOsc6+YqnRzL5+27YJ2KqP9cWYS0xo7lA+WqTEDzANlpakHvjSpP?=
 =?us-ascii?Q?8F5YO/sfampRyElaGyYXqK0svNraw9kj2xpRPr93AnXy/KqjD5XIbSMGm0XA?=
 =?us-ascii?Q?g+FAi9YuOv1om7BOUMsCCs2kdM2JDu8PMoUFlXp2T440eB7RPLTl+aYb3MtE?=
 =?us-ascii?Q?pPzXRwMuxVq9RlaDhPB6JQFmdde16Gqv6jDTklzyeOhiBlgGTNSqCfcLHpAi?=
 =?us-ascii?Q?azmpPm0qoDCgp1HTRrEs9PQi26/PwTA5LV/I050qypggzmOXinp9kzjwrJg1?=
 =?us-ascii?Q?4m65BqjdkDvOxPKjzsY2GE3hk5Vs7YKzjlYv2EPqtittHNtV24CQGPfAghZl?=
 =?us-ascii?Q?GFXou7iGayW/CqbhYrHkUH3W9Cc8ztl4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:04:50.5674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72efb3d9-3652-4163-1726-08dccbe6b45a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
xc_physdev_map_pirq map a pirq for passthrough devices.
In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
codes.

But it is fine to map interrupts through pirq to a HVM domain whose
XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
reference interrupts and it is just the way for the device model to
identify which interrupt should be mapped to which domain, however
has_pirq() is just to check if HVM domains route interrupts from
devices(emulated or passthrough) through event channel, so, the has_pirq()
check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
interrupt of a passthrough device can be successfully mapped to pirq for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
v13->v14 changes:
Modified the commit message.

v12->v13 changes:
Removed the PHYSDEVOP_(un)map_pirq restriction check for pvh domU and added a corresponding description in the commit message.

v11->v12 changes:
Avoid using return, set error code instead when (un)map is not allowed.

v10->v11 changes:
Delete the judgment of "d==currd", so that we can prevent physdev_(un)map_pirq from being executed when domU has no pirq, instead of just preventing self-mapping.
And modify the description of the commit message accordingly.

v9->v10 changes:
Indent the comments above PHYSDEVOP_map_pirq according to the code style.

v8->v9 changes:
Add a comment above PHYSDEVOP_map_pirq to describe why need this hypercall.
Change "!is_pv_domain(d)" to "is_hvm_domain(d)", and "map.domid == DOMID_SELF" to "d == current->domian".

v7->v8 changes:
Add the domid check(domid == DOMID_SELF) to prevent self map when guest doesn't use pirq.
That check was missed in the previous version.

v6->v7 changes:
Nothing.

v5->v6 changes:
Nothing.

v4->v5 changes:
Move the check of self map_pirq to physdev.c, and change to check if the caller has PIRQ flag, and just break for PHYSDEVOP_(un)map_pirq in hvm_physdev_op.

v3->v4 changes:
add check to prevent PVH self map.

v2->v3 changes:
Du to changes in the implementation of the second patch on kernel side(that it will do setup_gsi and map_pirq when assigning a device to passthrough), add PHYSDEVOP_setup_gsi for PVH dom0, and we need to support self mapping.
---
 xen/arch/x86/hvm/hypercall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index f023f7879e24..81883c8d4f60 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


