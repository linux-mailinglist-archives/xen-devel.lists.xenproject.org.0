Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B2260B7BC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 21:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429388.680357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on39P-0005Oo-Lp; Mon, 24 Oct 2022 19:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429388.680357; Mon, 24 Oct 2022 19:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on39P-0005Lp-Im; Mon, 24 Oct 2022 19:30:19 +0000
Received: by outflank-mailman (input) for mailman id 429388;
 Mon, 24 Oct 2022 19:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1on39O-0005Lj-7A
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 19:30:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 489e78f6-53d2-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 21:30:15 +0200 (CEST)
Received: from DS7PR05CA0052.namprd05.prod.outlook.com (2603:10b6:8:2f::30) by
 SN7PR12MB7345.namprd12.prod.outlook.com (2603:10b6:806:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 24 Oct
 2022 19:30:12 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::34) by DS7PR05CA0052.outlook.office365.com
 (2603:10b6:8:2f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.8 via Frontend
 Transport; Mon, 24 Oct 2022 19:30:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 19:30:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 14:30:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 14:30:11 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 24 Oct 2022 14:30:10 -0500
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
X-Inumbo-ID: 489e78f6-53d2-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrY444qC/OTxm+yZmQvZDFYiqxCHPZJ3CuiN0vr5kKuX8u0iITPVPw/nrdA8DWEfdl0QCPuH74dM8eJvXPpBzvrJYQrpT7QwuEe25cs2K3vPxGc7Z1vC4l7nrZ4S7qA45lB3fyXirqbSIMJHpnLh8zdFb4nTDvGanZ5UpiXsPyESsPPlLskf0keAfrfFbX3t+0sA2GljDZHF0GX196hajzKx3Oh5G354Ms2ycltAWuiEO7PDnfk/G1V+n+vMDlw5KbScQMgfwcv+KqZ94XckoOhntire2lBuvdhnuwYMgyW/pESCwCZVMibN+XUkXab60GYnvs7rDjkKumu14Sjr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My2CdENgSSvX0A0wOdfMQ6XHEcFLH5icgIUZaNeQLPY=;
 b=dSPxSeIgXsK3L7/qtnwYieHWaypCaXsZhoRQ93m20+ZjmAP+IPaPGyleBrbNki4flX/5Ao8diahbBlfxDeVyqMoRcBdsq/Jbzn1K8RtRIdlZwiJ9DlN03g14Z59zvkEfCHKgVpUoblRA3CrhpcPBIy0AhLlM8xqoup98uU6nAFf46QW9GeR7R8qEStMeKuPUpd8G3BooBmm/lZ1L2NPdkF2wq0/+p+OPySnR8mhEDN77/hgzqQmRMFlAkVt1NIr7zbHj+0PgV+XmlA37u8+V7if65Wgrtoa+rlEuwvmEDTRb38aUqsOJQ+HL6pZCGsoL7ch2S4CMZo8Tt5wJzxValg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=My2CdENgSSvX0A0wOdfMQ6XHEcFLH5icgIUZaNeQLPY=;
 b=V8WTCvhtS013o1CnFk6suXvzd18ni+1Lyp4VYYRSCDqbCxcxP1QPhWS7r6GqLQ6ViE2Qnuk3+L4TFtnlfRb8R76EITLo26DvncV9lABmGxGZBpBh+ddGIiFRKqEaCZ1XVFoX7aJ9To7GEMRK+jnAGvmLgJVZaCKyO0EKAxgUWRI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2] GICv3: Emulate GICR_PENDBASER correctly for 32 bit guests
Date: Mon, 24 Oct 2022 20:30:02 +0100
Message-ID: <20221024193002.57888-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|SN7PR12MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d63ace-0f62-4e09-d257-08dab5f62b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hddS1p0hLRzbDq5y9rlodPwX5CWGReypLe02li/Q8vDh9NEebOJhezG8pcRBF3Y3zP0jNWb+71FB3IOzcGsb5kAGajIknCMfarIQoG9J9Fe0h9qXoqIA7sxlZ08Od+0GMERPJCFz8Sg5zy4/reZ6gNNBHPEXeCvCywuj9u+7KAD8ak97wnnvVwsgG66ju1PGgr/ulFJ0CWvqHvFItknxeZLftplri0LzfVswVg2XV3eMqoEMb0t/BU8TGAaY3UCnuYKKwIh2L8JDM6b+D96C/H6jf9mAzxPI7XbNj3ucgWSMlwf/sFv5ftSirMu7vE/57pF5wyH0U71TRdA6doXzZoQa2KYw3DnG9xbfl4hDW02MrA7lZIcafueLGNmWLc06cX6nh+qk0DoelNO7pENjhCStLODPNHfPmaaF1ME8fVqehS2FPA0xsSjmgiEisst426nJmAcmImUM9lQSeNCGNgeSu5quPXj0ZK5OUUVyAlKGjqznk6Uxm9JEJdY4wkPPTutGACgmF71kENeUSCVZKyssCcqYhpSTdc2kXBWWF44SG81fRbR6QFmRsNIqqR4cQ6yWvATfaumgNjZfFzwBOmEUXFumCESZih9vy0zS5/BS0Va7ii6+VIsH/bjax22C1Dr62BE/1z0fq2HhNIdCH4G3owoOEzqyN48MKgxT6oKVP24R8IWVs65p1A2WHy5ix1ilhQ6UOfzSSAJq/HX4m61QwvrnjtEgwXk6Ri1RlKoaxcdiHUKo9Iiksb3EL7rolaZNMIW1+GJn8ytHnwK0jCEVdggZxlmbhviNtBG36qzKe0MAKX8vf/A/kTbnQ2+l
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(426003)(36860700001)(40460700003)(47076005)(36756003)(356005)(82740400003)(82310400005)(6666004)(40480700001)(70586007)(70206006)(83380400001)(81166007)(8676002)(6916009)(5660300002)(54906003)(316002)(336012)(2616005)(2906002)(186003)(1076003)(8936002)(4326008)(478600001)(41300700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:30:12.0896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d63ace-0f62-4e09-d257-08dab5f62b6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7345

If a guest is running in 32 bit mode and it tries to access
"GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
will return the value stored "v->arch.vgic.rdist_pendbase + 4".
This will be stored in a 32bit register.

The 32bit register is then modified bitwise with a mask (ie GICR_PENDBASER_PTZ,
it clears the 62nd bit) which is greater than 32 bits. This will give an
incorrect result.

The correct thing to do here is to store the value of
"v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
vreg_reg64_extract() which will extract 32 bits from the given offset.

Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from:-

v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
appropriate commit message.

 xen/arch/arm/vgic-v3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 0c23f6df9d..7930ab6330 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -250,14 +250,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VREG64(GICR_PENDBASER):
     {
         unsigned long flags;
+        uint64_t val;
 
         if ( !v->domain->arch.vgic.has_its )
             goto read_as_zero_64;
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
 
         spin_lock_irqsave(&v->arch.vgic.lock, flags);
-        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
-        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
+        val = v->arch.vgic.rdist_pendbase;
+        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
+        *r = vreg_reg64_extract(val, info);
         spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
         return 1;
     }
-- 
2.17.1


