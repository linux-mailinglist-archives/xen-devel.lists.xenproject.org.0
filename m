Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B151642AA3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453791.711394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ClC-0001DL-M0; Mon, 05 Dec 2022 14:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453791.711394; Mon, 05 Dec 2022 14:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ClC-0001AH-Iz; Mon, 05 Dec 2022 14:47:58 +0000
Received: by outflank-mailman (input) for mailman id 453791;
 Mon, 05 Dec 2022 14:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2ClB-0000oh-OX
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:47:57 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdbd5fcf-74ab-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 15:47:57 +0100 (CET)
Received: from BN7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:408:34::19)
 by DM4PR12MB5280.namprd12.prod.outlook.com (2603:10b6:5:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 14:47:53 +0000
Received: from BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::dd) by BN7PR06CA0042.outlook.office365.com
 (2603:10b6:408:34::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 14:47:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT083.mail.protection.outlook.com (10.13.177.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 14:47:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:27:19 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:27:18 -0600
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
X-Inumbo-ID: cdbd5fcf-74ab-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS4hSfbrelHttQWuFtSJhpjPEd+6qyph1H0p1ej8t/inKnxeXrUMNkk0vPSjU4xWjknNXHliFvi2o2ajqMFkwjjRCZgO0U+m+tawv0XHtn/ryIzVn8Nbvo+jqmRmiylw/DMkE83li16JG9FI8EFAMrm/qsdBkgaqup3V/JJl7SaUc1g06m463uLJGfvbOPfT8kLeFStVur88M9KybSDIIjUsX1SXnK6k1skVcY7kVDjA4JA8Hw3XAR4Lca2tEZZmXeoGJnIQp1jw3AK2up5D+LwTXypCRyJBCmkq2r8XGqg1Bm8G0cQgey+MA3J8qnL104nfGZfheDrhcBgAOQuUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbBy4ttF/x3KcPy08K/eQwu1bbiSIC1Vmw+/9aMnPtA=;
 b=XfWyw6wnH68IRsxu5i/x4MVWrOk3NQwNh/zrP6tPmKCxyXwwW0bZX9nfyFzDBgTUcnEoCZXrOHNHW+HpFhx/KOzOuGMjT9QW6cx4qHL2BH3qRG4r8hiCCxXFHh9qdxVeZJh4V3pFRMN/La8qKJ9kfMoPKoV0JUA0vpLxJ5Ft0QmP+KMe6oQHuktNAhiJL/xETHxi6ugtI5ffvsCoBjJdDeFacvfUeAXhJD2/hfmogcn9QqOij2vePMRXyjgpRtF7dyrrO8Gp7OCH0K97gJCkjjOEFycSWl0gpKxLg7GUTOU4l+H549TOSbQAHIcNlYgSLEpWAEfpM91ie1w8BjIsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbBy4ttF/x3KcPy08K/eQwu1bbiSIC1Vmw+/9aMnPtA=;
 b=xyAmpNaTzqFfDB8BROW9BgqjSIDo6TenvDeXNSjTukvCGX2PqX9q4FZWRYsWMliOtpVENLnxYthF+imIXZK4taXUNh+/aX0Xl4mUb9awtfiWVIWCkZcZQPfbRS1no+7+Kv8e9+q0N/CvLiJqrzOlqbiMoT+0R/5z9CnSPdCAEiQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 04/11] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32
Date: Mon, 5 Dec 2022 13:26:30 +0000
Message-ID: <20221205132637.26775-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT083:EE_|DM4PR12MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 0568ba9b-2722-4525-152c-08dad6cfb082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0pYL+xASgdD4C4AzsJe/vYoKy7G6PkqGVu/JZcr2+tnqmcOAelwtEnPzIor4Ea651voxFgFLegnQRviljNNqStG8tlQJHLAYHGoz94b/a/Vj9O1mxXWPjfFxwS5AbZtOiICwf1+1AjfRWujDZ8jAjg0jZcqLNHOaWnFQS1ktDFpTJvPWNFpJ5dwomtob3ch/0imXBZvwkmwxKsc//+QllfUE1nAv3Fb9y2ROI6fP6gzjwLYIfy/ebJWHEB4kSh4LHmBkhDGk+ZDME+Avs2xlgs8ycYll30R1OvZeVR+55N0BXs5944thuMug54C7fIMKAfuXDDozZOzZtygmpVoFuZ7viu7Xtj2JCjmgFhZZ6xB5v4wH2G8CH33bEuWkibfC4VjLSaa3MXcPsGh5z9rrxKRSslWWbkP6Q1Xq5XHGsG0Sh2qJNVj+XoPmEMNOPWV0IXk+lMfnqi/dvFeg+eNqP4EFiSi6B4NkDNRCZv14Bin703uj9Wh/0EnfSTQI6IvU68/lUr4CKXFgCgBtNuWiooGnXS5ygApxoD8MtlNp9Ywc9TcWDB8AZWn0bTElS7Rxf8VHzENQA8zqgGCXp2yHeQYqblsSLfr2aNxymwYl6Dm1EK2dMIG0VTlCKXn78S2Ag/nWwGGjH6fDWyRFMklAJMZ3wuonXY+Tg5Ud4YjZK0JTNeWz36P0Jtn9HkYBvdoZtW9oJtlIHSSVCfbL6uj6VjXOWo15tYKEfx6VyPXfz9k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(1076003)(336012)(186003)(47076005)(2616005)(426003)(82310400005)(82740400003)(41300700001)(5660300002)(4326008)(70206006)(8676002)(36756003)(70586007)(83380400001)(86362001)(81166007)(356005)(478600001)(40460700003)(40480700001)(103116003)(6666004)(54906003)(26005)(6916009)(316002)(36860700001)(2906002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:47:53.3923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0568ba9b-2722-4525-152c-08dad6cfb082
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5280

Refer ARM DDI 0487I.a ID081822, G8-9650, G8.2.113
Aff3 does not exist on AArch32.
Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106
Aff3 does not exist on Armv7 (ie arm32).

Thus, access to aff3 has been protected with "#ifdef CONFIG_ARM_64".
Also, v->arch.vmpidr is a 32 bit register on AArch32. So, we have assigned it to
'uint64_t vmpidr' to perform the shifts.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from :-
v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use 
MPIDR_AFFINITY_LEVEL macros to extract the affinity value.

v2 - 1. "MPIDR_AFFINITY_LEVEL(vmpidr, 3)" is contained within
"#ifdef CONFIG_ARM_64".
2. Updated commit message.

v3 - 1. Added an inline comment to explain type widening for v->arch.vmpidr.
2. Updated the commit message. Added Rb.

v4 - 1. Added Ack.

 xen/arch/arm/vgic-v3.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 3f4509dcd3..e0b636b95f 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -191,12 +191,20 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VREG64(GICR_TYPER):
     {
         uint64_t typer, aff;
+        /*
+         * This is to enable shifts greater than 32 bits which would have
+         * otherwise caused overflow (as v->arch.vmpidr is 32 bit on AArch32).
+         */
+        uint64_t vmpidr = v->arch.vmpidr;
 
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
+        aff = (
+#ifdef CONFIG_ARM_64
+               MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
+#endif
+               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
         typer = aff;
         /* We use the VCPU ID as the redistributor ID in bits[23:8] */
         typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
-- 
2.17.1


