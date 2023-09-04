Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD2791490
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 11:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595022.928489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5fH-0004V4-9w; Mon, 04 Sep 2023 09:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595022.928489; Mon, 04 Sep 2023 09:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5fH-0004T0-7H; Mon, 04 Sep 2023 09:14:35 +0000
Received: by outflank-mailman (input) for mailman id 595022;
 Mon, 04 Sep 2023 09:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qd5fE-0004Sj-UZ
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 09:14:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73793a5c-4b03-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 11:14:30 +0200 (CEST)
Received: from DS7PR05CA0090.namprd05.prod.outlook.com (2603:10b6:8:56::13) by
 DS0PR12MB6605.namprd12.prod.outlook.com (2603:10b6:8:d3::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Mon, 4 Sep 2023 09:14:26 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::ac) by DS7PR05CA0090.outlook.office365.com
 (2603:10b6:8:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.25 via Frontend
 Transport; Mon, 4 Sep 2023 09:14:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 09:14:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 04:14:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 04:14:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Mon, 4 Sep 2023 04:14:24 -0500
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
X-Inumbo-ID: 73793a5c-4b03-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/Bw3H1chNc6T9PUaqygjcSB9ZqRy0j1Jlby3vKAmjsx4CPIfq5BVAFsNFXmI4K8uGKgRGGV2IsQkm5x2M7GnyLHwfgwbdGNyaAp5iaMOT7RGMKIp4ITpHmVgQ+oYfAkyj+SKwo7mF22mBsVuytruKz3wBsGl8UBvXmHE2N5Yz0djwt+/XxOxZo28Alr3hqtZjimFaTtRJ3Amktpq6r6zh51sytqzT47TiQtE9YUymqKez6Rw2vF2cLBGtlBSTjA954djzu8BYGvGsnADZ7AAH8qwwpFeM8oo/D9rDH0JG0DnNx6YDgGqV8wnw4rnSiaSrL0RWS0TgBxqyE++Rlnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBnCGHonNCHGh97PQEUyjKjN1aii3LsbaDXQQKkQfu8=;
 b=HZCpeZHRL2t81CSzWe94wdYQOJvMgeS+zQtT1tO48ak7eTRrxqbQB+95hV4hd1fuHLkyj1UJwb52/otv9HQyau4OduhbntNMWMLum/oaCHBDqLgCUvpafT3DTfE1lM/iCwu7rQYo5YB6kD9V09OObTivotwhRdk1+dPQzRvPKFriq3yeFS1Btkr1J2QfZpRFm+08P5E5Sv9xZ6FTkaWCsC3Cz+97D9pJdFhg4m8qggeNe6uS3yTNDJcsv/bEleAZszN8wN9V+W8QJeKkq7yTASKcoj6YC/HgWnKgrlkeGZiwVO2NtlmZBzdvoCVHS/vcQsR4q9hpTmgpYfVSzpZoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBnCGHonNCHGh97PQEUyjKjN1aii3LsbaDXQQKkQfu8=;
 b=2KdPJEPFWVjZah/WfR27wcvL6EMihzGGmvX9RUx6f3gZGrzyJTz/ZyUlc1fwQTmDfJxPhlH3a3XonxfhEU4aHoQQAWAdEbAI8XLc/bdhGKzFIQj59w6bbSFAz86mOGFmlJMfR/v939CQFSlBZGgSq0lSKxesu6SMqqHdLbfHOKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen: Change parameter of generic_fls() to unsigned int
Date: Mon, 4 Sep 2023 11:14:06 +0200
Message-ID: <20230904091406.942-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904091406.942-1-michal.orzel@amd.com>
References: <20230904091406.942-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DS0PR12MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ebf2f0-e8ea-41f6-3821-08dbad27561f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vComPv9FMtEHnR1t/DJKxbYtkM2LiKz5KdXRy0NUn7lrcpvq2SpyfrUYSAqnqdPg8FMbkvEh9tF/E/PRZfG402Q44xvxdcpWRTi7XZ6mP08Yv5dTLt0T5d23EuqGGMyTj5DpDnByVoNs4qK7Je4OYC7AuKfHF76E7j24L353+6o2M58Bfrbfwn1h6yQgTQzGrpNlx7tqrpO8Bh3O/aRDM+NrCx0NQU4qy++Kc7ZwGILZ+Ujt7tTCl3XyIM1BDsNmA+p/wJrfR4cZ+J3NfFeBu5Ye5vLBSJM+LNx045jt95VkGZSuocRmE3iMlOIwlRzQRDU7uvpskvBHszaWdzH8SQtdgrF/IBmaIe3avsOFV/PgR0YTZWcV3EFnfQ6o6FJ9JuJJb5wtskxp3lLzw4hhSNtPd5Oqs56PuJgR9v89i/F+3m9lpPELqU4KAvyyrIstlb3Q/9MTb8drD74OLPFJ/WjDxoU9DSDI4A2G2zXKFNrbVPiSyUh08f3OcHd53JwuSRT2d/d00puELyXmD6Hn/eWhDWwGuPuWq8yKKZs8yAErSJNn3eo4Tbkf19E/ST1yg36vQzxBJSQET+Qvga7KeybX9FoYy1YnmYe0PSba1XVy/+sGUEJivkaXyyQSgJPkbi0Akd2lOUFafS3Vvfvdck3ULOkzYQ7+GCFXL6qYem414X1hKQqFLo9/F+Q0Z4bij/Fvo9dqQb0K6YoiWroV0wccuDgfWro+E2WX3UvPSTrK/5ypdCYnSIZPXRAJlI8TkfLgwpukk1PQ/UGj80kDxYJzoeuzVzufINUEVXljtQI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(41300700001)(6666004)(81166007)(356005)(82740400003)(86362001)(478600001)(2616005)(83380400001)(426003)(336012)(26005)(1076003)(47076005)(36860700001)(40480700001)(70586007)(70206006)(36756003)(2906002)(54906003)(6916009)(316002)(8676002)(8936002)(5660300002)(44832011)(4326008)(41533002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 09:14:26.2492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ebf2f0-e8ea-41f6-3821-08dbad27561f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6605

When running with SMMUv3 and UBSAN enabled on arm64, there are a lot of
warnings printed related to shifting into sign bit in generic_fls()
as it takes parameter of type int.

Example:
(XEN) UBSAN: Undefined behaviour in ./include/xen/bitops.h:69:11
(XEN) left shift of 134217728 by 4 places cannot be represented in type 'int'

It does not make a lot of sense to ask for the last set bit of a negative
value. We don't have a direct user of this helper and all the wrappers
pass value of type unsigned {int,long}.

Linux did the same as part of commit:
3fc2579e6f16 ("fls: change parameter to unsigned int")

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
It looks like generic_fls() is only used by Arm and invoked only if
the arguement passed is a compile time constant. This is true for SMMUv3
which makes use of ffs64() in FIELD_{PREP,GET} macros.
---
 xen/include/xen/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 654f525fb437..b2d7bbd66687 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -51,7 +51,7 @@ static inline int generic_ffs(int x)
  * fls: find last bit set.
  */
 
-static __inline__ int generic_fls(int x)
+static __inline__ int generic_fls(unsigned int x)
 {
     int r = 32;
 
-- 
2.25.1


