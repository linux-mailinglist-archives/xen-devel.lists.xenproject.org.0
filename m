Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43F6ED676
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 23:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525653.816961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3J3-0000pJ-DS; Mon, 24 Apr 2023 21:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525653.816961; Mon, 24 Apr 2023 21:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3J3-0000m4-8R; Mon, 24 Apr 2023 21:01:05 +0000
Received: by outflank-mailman (input) for mailman id 525653;
 Mon, 24 Apr 2023 21:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eiY=AP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pr3J1-0000jG-FR
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 21:01:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe59::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cd876e8-e2e3-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 23:01:00 +0200 (CEST)
Received: from MW4PR03CA0122.namprd03.prod.outlook.com (2603:10b6:303:8c::7)
 by PH7PR12MB5711.namprd12.prod.outlook.com (2603:10b6:510:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 21:00:56 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::78) by MW4PR03CA0122.outlook.office365.com
 (2603:10b6:303:8c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 21:00:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 21:00:55 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 16:00:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 14:00:54 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 16:00:53 -0500
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
X-Inumbo-ID: 1cd876e8-e2e3-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs5Ao5SlgVuctQAcbJy75kiz++FkNHMbX42fKnUXNj4BNFnRS6u0Elx+1JdnoC4UIAEuFCcfxWtj8HXubIr4q438iq+/gUwm3Ok1lOXzVSNkhfH7/HBzEUGMw0yBn25bU9juS/fGviK0tg4bKz2545xNTNdGLHYVsJOOBIr/YXCrsDLY1zSOu4zGg9oLKYun1FgpPAbpKIDVuIoEdD7HPMh5qyez3rFKDWImxP3CsIpy5ze1pFkqc9twSqFPmUN/0wRYj7LiTsqfILXIhwwXPrzpr6xx0MH7LC+OP92jHGZWGdzdu9klzhr7uVGJsNNrVDRtB3PhbyR0YiI8RhlrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIY0qqdmHDda78wfplCadbi3y5M95ECBZ9jQJrtNo4g=;
 b=hHmTwD+s8nnmcwfxyFQU0s0nZFKDdyhvbJsBJbW18SiGy6hc1BOVacJMsYGidKLfTzfoZEr5xQK2eapxI/Niv1fxDplgc8hRbnHjWy/ZzbFo68zSCbCneY9/tkBNtCL9doMANh3xhmMvOQ9dc5d6GFxVvuqTg82jzJVULiCIv8Ea8gmOu8ku7woskMF/DhJHccoMfpB2H/dMHvrtuRDcC7kSHPTnnJP9I7TTy33fpfJ8fJgpYjDWcWSs/Mv05K41C+qRVnKsf6dFXaQS6K8+ik+ZBS4mg78bJBlE8sJd2zTJaHUNwyb9hKAnuciRGxXGL3QG6MDKcXQOBFR5yC2yZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIY0qqdmHDda78wfplCadbi3y5M95ECBZ9jQJrtNo4g=;
 b=FkwqJdOChon08eo0Nb5Ey8nY42PnoKhh3BPc+J3rF58tExgjzxUN+5VpusKyHhuSvk1MUpelqLu1mOxynHILV7soEzfoPpH7CuN+KB8h/LsQnfben/CVqm16OSAnDHe7j4BFY3CUFsw5gSPK3s1lhMKBL46WSkImQplN7xkT1UU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, George Dunlap
	<george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH] xen/sched/null: avoid crash after failed domU creation
Date: Mon, 24 Apr 2023 17:00:47 -0400
Message-ID: <20230424210048.786436-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT022:EE_|PH7PR12MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: 3394b3ff-138d-4922-44cd-08db4506ff42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZ/NASekFVA9OBcNGrRES3QVOImGBChFYRys8sDqWzWp88Kr29QhXn0bu8f8ZQienhFIUy+AdPnmdOYss+A0p+u46CZRMfzbIeY23wsmMtcpESBdXPXo18gqvEI3sTjVolaxWkVZNMc0FNbqfFfz0kyBQQsbfQz9TMDCKFV/WI2cAqttmZm5Om4IQ5yqCbhfpcPzFGy3b6Fu0G7OZ0vUIv/06OUrR0TUepj5f1HAgux5LndYB1wbd/J3wWqORxFe7HJHjujjyUzw3ZpBUUzE/Ks3baP5YfAqNHbmgpEJlx3d9u5020CN2tHbP3P3YizrWcxgXIz1DaMw5alISUQCQSiFvV2fY1NRMIY8oYqjehQZgJPPRKznG2Gj3yNP8S9Qt2u7lVAfGpYe/2i8APWWnPibUeZ+DeSbkhLjMSSKgX4NUT5ZEhIxTTgGjCfkJ1FsIqFfmK2/xSY01v5E51heAWM+8Q/ST5l+C+IbgnvS9HbAf7NgzAxgEALlTefz0EaPSPzQtkbzAMyj8dgl/jRRGh+EI2qOgkcgxBDRznAE5PR9XhuR3ZtE1DdH5eFrwxTOm9dfooQJygfzU8fE2Xy8zZBCz/V9EY3R7MaXkdFzQupFFhqn3pVVhHuvYmyOScuoEabhOqBAlvC6jZ/Ydnv9VahrJQ+nWA0hGAwuIYyTAlXmNdimbskvk6oKYOaUfT03s/hm3D3bYUZNpneu9dIOEu+tRmJxEgMrSgWmL6zVlUE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(2906002)(2616005)(6666004)(186003)(40480700001)(26005)(1076003)(70206006)(70586007)(8676002)(8936002)(41300700001)(6916009)(4326008)(316002)(478600001)(44832011)(5660300002)(54906003)(82740400003)(356005)(81166007)(82310400005)(36756003)(86362001)(40460700003)(36860700001)(47076005)(336012)(426003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 21:00:55.6304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3394b3ff-138d-4922-44cd-08db4506ff42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5711

When creating a domU, but the creation fails, we may end up in a state
where a vcpu has not yet been added to the null scheduler, but
unit_deassign() is invoked. In this case, when running a debug build of
Xen, we will hit an ASSERT and crash Xen:

(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
(XEN) ****************************************

To work around this, remove the ASSERT and introduce a check for the
case where npc->unit is NULL and simply return false from
unit_deassign().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---

I'm not entirely sure whether this is the correct fix (hence the RFC
tag), but at least it avoids crashing the system for me.

Here are the steps to reproduce on an aarch64 system with 4 cpus:

sudo xl cpupool-cpu-remove Pool-0 3
sudo xl cpupool-create 'name="nullpool"' 'sched="null"' 'cpus=["3"]'

cat > stew.cfg <<EOF
name = "stew"
kernel = "Image"
extra = "console=hvc0"
memory = 768
vcpus = 1
pool= "nullpool"
pci = [ "01:00.0" ]
EOF

sudo xl create stew.cfg

The PCI device 01:00.0 is not assignable, so the domain creation will
fail.

Here is a more detailed crash log:

stew@ubuntu:~$ sudo xl create stew.cfg
Parsing config from stew.cfg
libxl: error: libxl_pci.c:1677:libxl__device_pci_add: Domain 1:PCI device 0:1:0.0 is not assignable
libxl: error: libxl_pci.c:1809:device_pci_add_done: Domain 1:libxl__device_pci_add failed for PCI device 0:1:0.0 (rc -3)
libxl: error: libxl_create.c:1923:domcreate_attach_devices: Domain 1:unable to add pci devices
(XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
(XEN) ----[ Xen-4.18-unstable  arm64  debug=y  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) PC:     000002000023ec30 null.c#unit_deassign+0xdc/0x1cc
(XEN) LR:     000002000023fa1c
(XEN) SP:     00008000fff67bb0
(XEN) CPSR:   00000000800002c9 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 0000000000000000  X1: 00008000fff43d70  X2: 0000000000000000
(XEN)      X3: 0000000000000003  X4: 0000000000000000  X5: 00008000ffff84b0
(XEN)      X6: 0000000000000000  X7: 0000000000000000  X8: 00008000fff43fd0
(XEN)      X9: 0000000000000000 X10: f00ff00ff00ff00f X11: 00000000ccccccc0
(XEN)     X12: 00000000ccccccc0 X13: 0000000000000000 X14: 0000000000000000
(XEN)     X15: 0000007fde58e6d0 X16: 0000000000000024 X17: 0000000000000000
(XEN)     X18: 0000000000000000 X19: 00008000fff43cd0 X20: 00008000fffdc120
(XEN)     X21: 00008000fff69a30 X22: 00008000fff69a30 X23: 0000000000000003
(XEN)     X24: 00008000fffecb20 X25: 0000000000000001 X26: 00008000fff69920
(XEN)     X27: 00008000fff43c70 X28: ffffff880188eec0  FP: 00008000fff67bb0
(XEN)
(XEN)   VTCR_EL2: 0000000080023558
(XEN)  VTTBR_EL2: 000100087ff94000
(XEN)
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 00000000807c063f
(XEN)  TTBR0_EL2: 000000000034b000
(XEN)
(XEN)    ESR_EL2: 00000000f2000001
(XEN)  HPFAR_EL2: 0000000000f90100
(XEN)    FAR_EL2: ffffffc0097b0f00
(XEN)
(XEN) Xen stack trace from sp=00008000fff67bb0:
(XEN)    00008000fff67c10 000002000023fa1c 00008000fff43cd0 00008000fff43d70
(XEN)    00008000fff69a30 00008000fffec068 00008000fff68000 00008000fffecb20
(XEN)    0000000000000001 00008000fff43d70 00008000fff69a30 00008000fffec068
(XEN)    00008000fff67c40 0000020000243948 0000000000000003 00008000fff43e10
(XEN)    00008000fff43cd0 00008000fffec068 00008000fff67cb0 000002000023069c
(XEN)    00008000fffecb20 00008000fff68000 00008000fffecb20 00008000fff68000
(XEN)    000000005a000ea1 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 ffffff880188eec0 00008000fffecb20 00008000fff43ea0
(XEN)    00008000fff67cd0 0000020000231cc0 00000200002bb7e0 00008000fff68000
(XEN)    00008000fff67d00 00000200002099f0 00008000fff68000 0000000000000000
(XEN)    0000007fb5381010 000000005a000ea1 00008000fff67d30 000002000022ec8c
(XEN)    0000000000000001 000000005a000ea1 00008000fff67d30 000002000022e744
(XEN)    00008000fff67e40 000002000027121c 00008000fff67ea0 000000005a000ea1
(XEN)    00008000fff67f20 00008000fff52000 00008000fff67da0 0000020000244650
(XEN)    00008000fff67d90 0000020000224f54 00008000fff67da0 0000020000224f54
(XEN)    00008000fff67dc0 0000020000225088 00008000fff52e16 00008000fff52e00
(XEN)    0000001500000002 0000000000000001 000a752520646a25 742064656c696166
(XEN)    c00cc00cc00cc000 0000000000000000 ff0000ff000000ff 0000000000000000
(XEN)    00000000f00f000f 0000000000000000 f00ff00ff00ff00f f00ff00ff00ff00f
(XEN)    00000000ccccccc0 00000000ccccccc0 0000000000000000 0000000000000000
(XEN)    0000007fb5310018 0000007fb529d8d0 00008000fff67e70 0000020000272134
(XEN)    00008000fff67ea0 000000005a000ea1 00008000fff67fa8 0000000020000005
(XEN)    ffffffc009c9bce0 0000020000255c60 0000000000000000 ffffff8809182a00
(XEN)    ffffffc009c9bce0 0000020000255c54 0000007fb5381010 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffffffc009c9bdc8 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000007fde58e6d0 0000000000000024 0000000000000000
(XEN)    0000000000000000 0000007fde58e6d0 ffffff8809182a00 ffffff8809182a00
(XEN)    0000000000305000 0000007fde58e6d0 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffffff880188eec0 ffffffc009c9bce0
(XEN)    ffffffc008648cb8 ffffffffffffffff ffffffc00803799c 0000000020000005
(XEN)    000000005a000ea1 0000000000000000 0000000020000005 0000000000000000
(XEN)    0000000000000000 ffffff880188eec0 ffffffc009c9bce0 ffffffc008037998
(XEN)    0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<000002000023ec30>] null.c#unit_deassign+0xdc/0x1cc (PC)
(XEN)    [<000002000023fa1c>] null.c#null_unit_remove+0x6c/0xe4 (LR)
(XEN)    [<000002000023fa1c>] null.c#null_unit_remove+0x6c/0xe4
(XEN)    [<0000020000243948>] sched_move_domain+0x194/0x39c
(XEN)    [<000002000023069c>] cpupool.c#cpupool_move_domain_locked+0x38/0x70
(XEN)    [<0000020000231cc0>] cpupool_move_domain+0x34/0x54
(XEN)    [<00000200002099f0>] domain_kill+0xc4/0x144
(XEN)    [<000002000022ec8c>] do_domctl+0x6d0/0xfa4
(XEN)    [<000002000027121c>] traps.c#do_trap_hypercall+0x280/0x34c
(XEN)    [<0000020000272134>] do_trap_guest_sync+0x448/0x5c4
(XEN)    [<0000020000255c60>] entry.o#guest_sync_slowpath+0xa4/0xd4
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
---
 xen/common/sched/null.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 65a0a6c5312d..71a83c4fb1ad 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -376,7 +376,14 @@ static bool unit_deassign(struct null_private *prv, const struct sched_unit *uni
     struct null_pcpu *npc = get_sched_res(cpu)->sched_priv;
 
     ASSERT(list_empty(&null_unit(unit)->waitq_elem));
-    ASSERT(npc->unit == unit);
+
+    if ( !npc->unit )
+    {
+        dprintk(XENLOG_G_INFO, "%d <-- NULL (%pdv%d)\n", cpu, unit->domain,
+                unit->unit_id);
+        return false;
+    }
+
     ASSERT(!cpumask_test_cpu(cpu, &prv->cpus_free));
 
     npc->unit = NULL;
-- 
2.40.0


