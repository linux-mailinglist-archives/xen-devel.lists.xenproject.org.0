Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNmRI1MOj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856F135D1D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230721.1536195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZi-0000Vh-9l; Fri, 13 Feb 2026 11:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230721.1536195; Fri, 13 Feb 2026 11:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZi-0000U3-4A; Fri, 13 Feb 2026 11:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1230721;
 Fri, 13 Feb 2026 11:43:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqrZh-00084s-5x
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:43:05 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 278aab8d-08d1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 12:43:03 +0100 (CET)
Received: from SJ0PR03CA0354.namprd03.prod.outlook.com (2603:10b6:a03:39c::29)
 by SA5PPF0EB7D076B.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 11:42:57 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::29) by SJ0PR03CA0354.outlook.office365.com
 (2603:10b6:a03:39c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 11:42:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 11:42:57 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 05:42:54 -0600
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
X-Inumbo-ID: 278aab8d-08d1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvE8yB7lam9gq9KPY5BNXnND5s2klap48V98nh1U2tqTjf54S+3C4keEoP5nrk02ggWLw8ict2bPWxXM5jXxqMIAyAoDJZtw+kGoJjSjrumxO1iyRicof3ClDZRxHVe4KMg9oJzGTM+ColIfbV+qTAtsmyW1ILldvJ0DhfpGw7xicnsJjZSdqT13zruQJQIEchbFRryDofIjqghHJJqMPTXYP/ujFDzAmjbzamLWA6kMbXTNC4DDGSIevI0KY6sARSBWPjlr3YRBqIxY6kqnYFg7jAg7Teh5S00AXO0iupzHYt/96JZfbSnvKW+AFrS1r0UJrPGAvFzLZPzFQ6z+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwNv6xSPrv19XcwIK2CSbdmL0zmxGyqcmeUFNv/Ifnk=;
 b=HbqJQvtjPF6xMsso/uEudtesqOHTbI+Y0Nb55lN8drYAOIB29KyslUzmadEyGObJhUeaCMDSQ+o4WCo8mDori2sOqBtBeah96FaNFlvrC6yj48HWz1J5+rdH1GIiHgGGUI55oXXLD9sLUwtBAXJdDBUA9LSq5cF6o4lJFCe8ZBP9eK6BkYWgoPHfxWGbF7G6z/RSUDYuis90QiNChe0oZ6JcDbO5ktU5olf5M7nPdYreqT0moyM9Ulg+muxqygavMssNO6NIYY1aR9R7pWtOrQz4zEiVLTQ9YiF4YDnAqCKcHW+sLeyXQgEdDBIV+4ReRO6Oeh6PyVrpNoWu4rGudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwNv6xSPrv19XcwIK2CSbdmL0zmxGyqcmeUFNv/Ifnk=;
 b=BjlDNVbVDP9AF1pARtlVMFTrOL0l/vfAKTkgLDFohRvAlmov64079M29aP3lyqATkKEIaciPyL0n0k7WuCYQ75UDBEeWb5SbvPDKBtlQrAD0TQb6bOuTwEkG/obXzftkl2w+jp6PNNAgqkhr/ZY4KKOXtyOiRaib1m8Gquap5Mo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 4/4] x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems
Date: Fri, 13 Feb 2026 12:42:30 +0100
Message-ID: <20260213114232.42996-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|SA5PPF0EB7D076B:EE_
X-MS-Office365-Filtering-Correlation-Id: 80dd543e-680a-401d-a7b8-08de6af5085a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5aGNmZB1IK2VE50v27Oqwk2NcxqNCt6kMO1zL8mUZqipOMkqSRnEKh+AL0S0?=
 =?us-ascii?Q?GuqQwHPANlzrSfOqH61I/KRCj90sN6xN9HDeF++5IreXSF1FxV67T0uUeiid?=
 =?us-ascii?Q?Hp6PrEg3oryot1TzFIgNIBkxwI+h4+ZTfQwaWy9mP3IL2IjX92RXsVIjsLE0?=
 =?us-ascii?Q?+beAuO6TqcNViWyYJ4MAlYgJTfbSFtg/GP1UCSxbEtFYg7171WnEPd7Yd+cw?=
 =?us-ascii?Q?K7CE7ndnXVGF7wiZbLrmJkzx18yt0VYyEJdmsjM5oAh99mEqk2WcYJKoFc70?=
 =?us-ascii?Q?U6UFe+6woJQnTBqKI8xdtUf5NG6iFf+Sb00oQkDmJgBwXw1KPUn17WWIuadd?=
 =?us-ascii?Q?ptExt/OF8zfXRFPfR9xN8ceRXLX1qHTFnSi8LzH6gSopPHweYz++S0XY58hZ?=
 =?us-ascii?Q?5iibae9UWV4EBc3VSpIED4VduOISOFB6mTBRTDBzed7zrTKcfBeZ4jfF/e5L?=
 =?us-ascii?Q?nR3nnNVxrMLOF04T/Ww5FhPXJUyidiFEEKhMj2ITHHCUHvPN0XeniVH96n0d?=
 =?us-ascii?Q?hp+GuBvfy7GQKIXjieuhg7+MsOPfkFnYB0Ebt08cK4PISaPVUj+o5uqccaiv?=
 =?us-ascii?Q?/b8v5o1PJu7nh1rzDTisn9hgfOKeLmbJYM9Nc6koNMNIvVpXaxy3nbmAWeLC?=
 =?us-ascii?Q?62bfxzzEOun5LuEsSo+yntZKoUCcM0ldgu90uK9PqPk34xVU7UelCVO3zaoY?=
 =?us-ascii?Q?cqMmyZsSeS7m6ip5y/OYX1gdCR7ojS7f5gVaXQFU2EOShDRn1WZ5V8fvFs1n?=
 =?us-ascii?Q?OODLxaReA3ZIRvNBosccDp0f16EfmCkJFnYJsfL8VHAwtEPtlCQ4OtLoxP/v?=
 =?us-ascii?Q?K0X/IoeBwiOLGvQOGlEEi4MtGlkzmd12BkbdtiDYLj/872vzFa36Y+E2cE/g?=
 =?us-ascii?Q?pFtNNuXwP0vXM/1BkwT3KnHOQ/PROFWObs5g278BjTiyVrU+fD9KIlCIxXBQ?=
 =?us-ascii?Q?tzmoUHR4HURvazvfSVI7t63Y1On5uH7zKp7qDb9EfHzEIHyl+48gTi+4E9m5?=
 =?us-ascii?Q?j8ff2bRLTJh3fX7Iy89oM90TXxa8xgdXQ38hjkI9tR9aNuGtL5/IvQlNeGx8?=
 =?us-ascii?Q?0ceUkeZLxAT2rfnm4n76sN8wy17cq3DZIsSy9dGHyAhqHGKgTf+86ShbAj+0?=
 =?us-ascii?Q?6cKlJ0wWeQdWKVIf/j1rYU+GeGy28Wzs+2cT0lN2avnOZcgM3XVjXh0ldN7A?=
 =?us-ascii?Q?r0oyzIGlOU7ujFJL1ObVFNtwTiX9KknwR+m3Jzh+UyQfI9l9LMyjze9ECl0C?=
 =?us-ascii?Q?UEQsMhUik9eLzsTp2qDeX5mKRapzJtAdMbFXWJJzkuptPPw3oW5mcHq/3qzH?=
 =?us-ascii?Q?g8chZrQJ74eKlAnnoj5WkTIwz0jaQARQrK2no4hMsOi/Gdf6Z14VqL0/ZlWN?=
 =?us-ascii?Q?ItnyA4QJhZMkKviTn6brnn491hZsk1CUUzAsZqylfj8/0TnHBcsYfM7WVgHE?=
 =?us-ascii?Q?Fv+hzwdX076ByOWBdIKdjjZJIcpWGrxXcC8sUCUY/Jc7NTXDxZMWTz/Ez3Rh?=
 =?us-ascii?Q?b2Eau9F+eLaNiJRwPo77RQMp32flWvAzRuPu/TIjj73oeGkUB/b/FJeUhKeO?=
 =?us-ascii?Q?0D3posuKbyWiBBv6Zihi42+vn0FcpdRLOcZ3RRQqsFx4KC887vjh/9ya42vC?=
 =?us-ascii?Q?WHwCXi0545NOxL6evGAjQybyY1+T+2m5hCF7a74SCdLB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CqPuvX1oF2+jNyp8Dcpb/42mpMenePwWtW9P8GRz5ayIU2UigqKYiG+Y8ysO5VyRG1/Mw2p6bU7jP6h8NqwUtsTx7YqkDK1iyxnZdhRs3sOE/yy+GGO+jBzklg6E82bpPs9TGqXoBNsgUiNyo3XSVFT0ai/EOpnP2kryhGn2Ob30PL6HXVqIFny2micwFjjGVDuu5kC8kcguWUSC+tjXhDWCi1vbAs2Td3sjW2S3GBRnC6tlG63UMIJVxcy2Fdt7ATzPUY9Mj2XgKnTgGVpx9lqI2gDz1VK427jOQiuX2xxg22/4JaXlZJBWRMbBVTtrVcle1t4dVS0MWt86QexGRQtzCiLbScd261BS6v4lMZDg0RkfHO1gIN/S4BoE6Hjh/D/fDZHo2yLJekYljjjkuV+I451P90OOkLdL6Ke6xn3QhDxK5QkZWAuj2gLf9F86
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 11:42:57.1537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dd543e-680a-401d-a7b8-08de6af5085a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF0EB7D076B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2856F135D1D
X-Rspamd-Action: no action

With cross-vendor support gone, it's no longer needed.

AMD CPUs ignore the top 32 bits of the SYSENTER/SYSEXIT MSRs, which is
not how this emulation worked due to the need for cross-vendor support.
Any AMD VMs storing state in the top 32bits of the SEP MSRs will lose
it.

It's very unlikely to affect any production VM because having 64bit width
just isn't how real AMD CPUs behave.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
v3:
  * No changes

v2:
  * Reworded commit message to mention the loss of the top dword for
    any VM stupid enough to use it.
---
 xen/arch/x86/hvm/svm/svm.c               | 42 +++++++++++-------------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ------
 3 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 10d1bf350c..329c4446e9 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -401,10 +401,6 @@ static int svm_vmcb_save(struct vcpu *v, struct hvm_hw_cpu *c)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    c->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs;
-    c->sysenter_esp = v->arch.hvm.svm.guest_sysenter_esp;
-    c->sysenter_eip = v->arch.hvm.svm.guest_sysenter_eip;
-
     if ( vmcb->event_inj.v &&
          hvm_event_needs_reinjection(vmcb->event_inj.type,
                                      vmcb->event_inj.vector) )
@@ -468,11 +464,6 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
     svm_update_guest_cr(v, 0, 0);
     svm_update_guest_cr(v, 4, 0);
 
-    /* Load sysenter MSRs into both VMCB save area and VCPU fields. */
-    vmcb->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs = c->sysenter_cs;
-    vmcb->sysenter_esp = v->arch.hvm.svm.guest_sysenter_esp = c->sysenter_esp;
-    vmcb->sysenter_eip = v->arch.hvm.svm.guest_sysenter_eip = c->sysenter_eip;
-
     if ( paging_mode_hap(v->domain) )
     {
         vmcb_set_np(vmcb, true);
@@ -501,6 +492,9 @@ static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
+    data->sysenter_cs      = vmcb->sysenter_cs;
+    data->sysenter_esp     = vmcb->sysenter_esp;
+    data->sysenter_eip     = vmcb->sysenter_eip;
     data->shadow_gs        = vmcb->kerngsbase;
     data->msr_lstar        = vmcb->lstar;
     data->msr_star         = vmcb->star;
@@ -512,11 +506,14 @@ static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    vmcb->kerngsbase = data->shadow_gs;
-    vmcb->lstar      = data->msr_lstar;
-    vmcb->star       = data->msr_star;
-    vmcb->cstar      = data->msr_cstar;
-    vmcb->sfmask     = data->msr_syscall_mask;
+    vmcb->sysenter_cs  = data->sysenter_cs;
+    vmcb->sysenter_esp = data->sysenter_esp;
+    vmcb->sysenter_eip = data->sysenter_eip;
+    vmcb->kerngsbase   = data->shadow_gs;
+    vmcb->lstar        = data->msr_lstar;
+    vmcb->star         = data->msr_star;
+    vmcb->cstar        = data->msr_cstar;
+    vmcb->sfmask       = data->msr_syscall_mask;
     v->arch.hvm.guest_efer = data->msr_efer;
     svm_update_guest_efer(v);
 }
@@ -1720,12 +1717,9 @@ static int cf_check svm_msr_read_intercept(
 
     switch ( msr )
     {
-        /*
-         * Sync not needed while the cross-vendor logic is in unilateral effect.
     case MSR_IA32_SYSENTER_CS:
     case MSR_IA32_SYSENTER_ESP:
     case MSR_IA32_SYSENTER_EIP:
-         */
     case MSR_STAR:
     case MSR_LSTAR:
     case MSR_CSTAR:
@@ -1740,13 +1734,15 @@ static int cf_check svm_msr_read_intercept(
     switch ( msr )
     {
     case MSR_IA32_SYSENTER_CS:
-        *msr_content = v->arch.hvm.svm.guest_sysenter_cs;
+        *msr_content = vmcb->sysenter_cs;
         break;
+
     case MSR_IA32_SYSENTER_ESP:
-        *msr_content = v->arch.hvm.svm.guest_sysenter_esp;
+        *msr_content = vmcb->sysenter_esp;
         break;
+
     case MSR_IA32_SYSENTER_EIP:
-        *msr_content = v->arch.hvm.svm.guest_sysenter_eip;
+        *msr_content = vmcb->sysenter_eip;
         break;
 
     case MSR_STAR:
@@ -1940,11 +1936,11 @@ static int cf_check svm_msr_write_intercept(
         switch ( msr )
         {
         case MSR_IA32_SYSENTER_ESP:
-            vmcb->sysenter_esp = v->arch.hvm.svm.guest_sysenter_esp = msr_content;
+            vmcb->sysenter_esp = msr_content;
             break;
 
         case MSR_IA32_SYSENTER_EIP:
-            vmcb->sysenter_eip = v->arch.hvm.svm.guest_sysenter_eip = msr_content;
+            vmcb->sysenter_eip = msr_content;
             break;
 
         case MSR_LSTAR:
@@ -1970,7 +1966,7 @@ static int cf_check svm_msr_write_intercept(
         break;
 
     case MSR_IA32_SYSENTER_CS:
-        vmcb->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs = msr_content;
+        vmcb->sysenter_cs = msr_content;
         break;
 
     case MSR_STAR:
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548..76fcaf15c2 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -97,6 +97,9 @@ static int construct_vmcb(struct vcpu *v)
     svm_disable_intercept_for_msr(v, MSR_LSTAR);
     svm_disable_intercept_for_msr(v, MSR_STAR);
     svm_disable_intercept_for_msr(v, MSR_SYSCALL_MASK);
+    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_CS);
+    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_EIP);
+    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_ESP);
 
     vmcb->_msrpm_base_pa = virt_to_maddr(svm->msrpm);
     vmcb->_iopm_base_pa = __pa(v->domain->arch.hvm.io_bitmap);
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 051b235d8f..aaee91b4b6 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -27,16 +27,6 @@ struct svm_vcpu {
 
     /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
     uint8_t cached_insn_len; /* Zero if no cached instruction. */
-
-    /*
-     * Upper four bytes are undefined in the VMCB, therefore we can't use the
-     * fields in the VMCB. Write a 64bit value and then read a 64bit value is
-     * fine unless there's a VMRUN/VMEXIT in between which clears the upper
-     * four bytes.
-     */
-    uint64_t guest_sysenter_cs;
-    uint64_t guest_sysenter_esp;
-    uint64_t guest_sysenter_eip;
 };
 
 struct nestedsvm {
-- 
2.43.0


