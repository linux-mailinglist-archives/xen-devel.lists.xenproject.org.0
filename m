Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201BF7E374E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 10:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628624.980255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IAx-0008WG-FR; Tue, 07 Nov 2023 09:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628624.980255; Tue, 07 Nov 2023 09:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IAx-0008Tp-Ch; Tue, 07 Nov 2023 09:15:11 +0000
Received: by outflank-mailman (input) for mailman id 628624;
 Tue, 07 Nov 2023 09:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjAr=GU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r0IAu-0008Tj-UN
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 09:15:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23f4dd9d-7d4e-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 10:15:06 +0100 (CET)
Received: from CY8P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::9) by
 DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Tue, 7 Nov 2023 09:15:03 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:46:cafe::e2) by CY8P220CA0013.outlook.office365.com
 (2603:10b6:930:46::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 09:15:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 09:15:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 03:15:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 03:14:43 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32
 via Frontend Transport; Tue, 7 Nov 2023 03:14:41 -0600
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
X-Inumbo-ID: 23f4dd9d-7d4e-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4ndbjnbgk980dgrmTXQG05AyIrr/P5C9CoM1ZCsux+y7UCFsVnIMluokYvH7wl5PdMpp5a64iKeshhs7V2vK2iQpWjrzStJajpOWJbg50cdHSfqF3kjf15YY2HZYdKIHrpPedM3ZuC8uoRI2n3e7K5UEhLE68PrxHXIbvXDHiLHsyy4rjR+/BvjaRRHGZlDgusWnwymrxc+gr33kemwukqKNe3ukNKJHKYRLnR0+tF2Hyo2cKAD5gT1YW/aW9CS3Dk3BqrwOyd9EYlCJSnPMMh5AXXS8jg69FHNhbXB17g1iLiWaEiH8CtNXUPpFdGnd+8Bsrp2DJoLvPYd/1YVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjS8PUvMoyk/GGe8HZDq/JIIKYhL8ZZdZRfEE4IxtYk=;
 b=dlDbrptvN2T1t4Wqx0t52KzTwuL75REllGUa64GLohO3gwure6K95xuX6KMd4iC7wj46beLIBrf5W4WjgtgoQpJhbGMYSbIT8zCz5cb2yNzHPKTSCSH6COFx9AEy6HX9IKepjrkyWJNmv/vaucY02bGtd9vD9GsSl2pB2lbLp3pQE6H94zPL3cqbfEwcavVNgHdK3AJWxxCFzqPi1rJ6Elhpa8PWmlHIEfjlgtTlVhWJEKxvsK7FyB5qtxaDu9lf8O4woc+o49p/opVIuKSLi4obEK3AHoSO5Ymj1YQtVtMjHYm9LRNluA6tN095mQLsvgMeMlgW7milKMH8hPLimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjS8PUvMoyk/GGe8HZDq/JIIKYhL8ZZdZRfEE4IxtYk=;
 b=Xpiy/TbsNfEOAMEw2UKXtDUy/tAKtzEs1mkueFZ13UqtjLhhWylaLp5toUWoXOeNSMlDufYAk6pxF4on7mXB+G9X52EoLawhwKUx+tZGda4EXEsi9xzjfjvGBxLqGvE4ffFxViQweiXyt6s46l4cx+0WcKBbLPHMuc5iFtbUE/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] ubsan: Fix pointer overflow error message
Date: Tue, 7 Nov 2023 10:14:17 +0100
Message-ID: <20231107091417.34159-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bd74e2-ee25-4976-ac6c-08dbdf720652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C5CzIEC/gT5loj68mtJ4U3Ptl2hv+j4G7qj9f52cAxwupRltapRPucnDAFgIU2/OftX1+sWSaFiCBzcuwSXfMqjt6m+WYsryF1jcPv2eRRbiQcaovZ/+KW2AiJOr6jt/VK/aPB/ao4uLDZjySkxLV6p9nwpA+ivXP5eY0lcoqrdXOkoDocnTeI1YBv5LYzy4IQ6FA1v+T993UdktreXBOq5k+L/uYPheLFcNBKghiIb1sxy2igvAXOEbwms3qQJtuePZC+Iryy0vRqDlaOmS+1KElwK45cMWvfNdeaBe//AkpCIEw5uafgoe7rrWlHChIuF7xfz5RV3B3vK+SolPuEJ+uDkuOYYiaSKzmUnOLXv9nwax96M9ctnS17AFOTiAeDXFKeTUsKbXCJuNHW2Ld6ZzB9d2tLpkXWVN5FaOuK4NOW77iKcdbMPA63FNQOLGpRf+Nug5PVgddshHz3RQx0ZrmhAFrZPVVU/YQ5NeIa7zlalwhq9IqJuDG6hXHNK7/t2w0JOkJssOeMsq43uWYaIv8/VYoHP4YI5GNKbazVXQa3pQLuI1Se5F2YAA4p5l2Qbpq84WZOAdY3+aNtO1yP5ie+8jVwIsM1vCcoFu/ihh47ShQNlmI730rk57l0BX6V682lBmx+sfWuJbPd/sJdpK5depOLy8+LRNQmKtcTmqCSwXjZHmlltZp0xbovy1xpnGr/284J8xycl83m1JV7n8chd9dkpIN+Qfs+VOQi38QzJpeRtA3wmhUV1u5dMrAV4AwMPEcLUF2Idcf6Ba+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(82310400011)(186009)(40470700004)(36840700001)(46966006)(8676002)(41300700001)(6916009)(8936002)(36756003)(4326008)(40480700001)(2906002)(36860700001)(5660300002)(356005)(54906003)(316002)(86362001)(44832011)(47076005)(81166007)(426003)(70586007)(70206006)(83380400001)(336012)(40460700003)(26005)(82740400003)(2616005)(1076003)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 09:15:02.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bd74e2-ee25-4976-ac6c-08dbdf720652
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043

In __ubsan_handle_pointer_overflow(), fix the condition for determining
whether a pointer operation overflowed or underflowed. Currently, the
function reports "underflowed" when it should be reporting "overflowed"
and vice versa.

Example of incorrect error reporting:
void *foo = (void *)__UINTPTR_MAX__;
foo += 1;

UBSAN:
pointer operation underflowed ffffffff to 00000000

Fixes: 4e3fb2fb47d6 ("ubsan: add clang 5.0 support")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/ubsan/ubsan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index 0fddacabda6a..a3a80fa99eec 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -513,7 +513,7 @@ void __ubsan_handle_pointer_overflow(struct pointer_overflow_data *data,
 	ubsan_prologue(&data->location, &flags);
 
 	pr_err("pointer operation %s %p to %p\n",
-	       base > result ? "underflowed" : "overflowed",
+	       base > result ? "overflowed" : "underflowed",
 	       _p(base), _p(result));
 
 	ubsan_epilogue(&flags);
-- 
2.25.1


