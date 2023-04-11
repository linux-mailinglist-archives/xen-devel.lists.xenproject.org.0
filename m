Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB06DE623
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 23:06:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519947.807072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmLAz-0002Ad-Hy; Tue, 11 Apr 2023 21:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519947.807072; Tue, 11 Apr 2023 21:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmLAz-00027q-FF; Tue, 11 Apr 2023 21:05:17 +0000
Received: by outflank-mailman (input) for mailman id 519947;
 Tue, 11 Apr 2023 21:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmLAx-00027i-VZ
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 21:05:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe59::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c77a037-d8ac-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 23:05:13 +0200 (CEST)
Received: from MN2PR01CA0042.prod.exchangelabs.com (2603:10b6:208:23f::11) by
 PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Tue, 11 Apr
 2023 21:05:10 +0000
Received: from BL02EPF000145B9.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::5a) by MN2PR01CA0042.outlook.office365.com
 (2603:10b6:208:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 21:05:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000145B9.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 21:05:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 16:05:08 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 16:05:08 -0500
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
X-Inumbo-ID: 8c77a037-d8ac-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jegRTeJSpZuE5Q3pTyaHRqHQvGxMY6P+irT7jYSVekWN5rAyXxR1So/cwGjL5Z/MnE0/jDfYXl1Aw2mIV+DLEgOhpsS4n66xuv8Rzht9Scr7ACfDjQVBlkMGgC97Bhf+QtA3vDbt/WPC5xcanZ280jYCW82zAxdI3wpqXFvdVO73ROJJbZiGvvWQhmEar6PpXkbsqNDP86EQ8lfgN0GAwa1Rg1MvGv+4Z96tFmELn2OnNVjv+I7lm2S7NyKuaHwKzQxc+nf+YMczgy37zVJhMiqA6gpYFUGO1jTvOW0lns0UDiUn1H+WIwKySbu6KBIFOnwqD2ZB6AxqNBUmzd3C1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyQCgywzSPQJgk3l7gPLyp/Wd2+MwFaNmcvT4lvITlY=;
 b=VTXEPXu8h5R2+ITRNrw9ekN6qqrpfoelBZDfFPTJ0hAAW6a/iI6RDagUQaNhSMdf9ses+zqkHjDdLrwnDIPpfMoLhb0JqlepZLPa9pXrnRKCN/VhmzNvCcSBUjewg7W0a/7m3+5yz00Dd5KphnaVof07SNeLsyXsbecRdKsGlgysZqe/3JV59pg5OHfEqxT7ROI2rP9VjGeTFkVLGCGKxymmB99gUzHBYGqChSNoKgmWw5NM7Nu3z+bYZmkhUmLpsWwPuulDT0zzgp7c/sqgfS2knxKidJhKNxM7bx/NKlBJiq+tbLtqQCGSXWgwp/Rd7zge/yknwNn33GDTIbs/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyQCgywzSPQJgk3l7gPLyp/Wd2+MwFaNmcvT4lvITlY=;
 b=HIAOrlOoPf1lOufdYmhQtb0i+ul2zvBLxwuklWzGQSL6JdKDRU4mtCJcC4HOM6kZqEok146MDaD30EKcnw2MngI74Kq+jNzxTk51XcACqXWJ3Xz536mXij8irfBlM6W+/9Dzi67z18xq5lDIlMnGuC1o7xrUlpGklhpQBZb3Aj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, "Wainer dos Santos
 Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg' configuration for xen
Date: Tue, 11 Apr 2023 14:04:22 -0700
Message-ID: <20230411210422.24255-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B9:EE_|PH8PR12MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c46b70e-6ee8-44ab-b23f-08db3ad06f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RN1w/NXEhX5pXZwc0HtFOl0/F+RYHwjclG4S+a/RqRG+m2nbAQvVjY0RovoCmHqlNh968194MTBhC8ECFgct7SZeAKkYmXNDYR6Ed+GdrjjpKwAyPqTbZxtufa5NfTsgwHuCuE5ATlLeYv5qrD153ip4g1bZ9u/Sfw+lekGksvzeE+zcQoRI7yGsrZ/zMEX1TkKTi6yF2e82W8s6vMF7v0zC6MEdK+qnam17685sXlJMJA7xNsyTXfiq7fMWmiR+Sja5J5DR+bhJCKcxr4OYpPH1Xke8pIwyrUQM5OIBYy5NXwUWGdikmY0iL852sUnToJNrtwXfopbV1suD7UQPxvYyFo0bO2FdPlB6qQIlGrjnOuZNhg2Z0/E//k0rfyV8WZ6bKqJ9+3lIlpcIkUOCPQaVX/un8OKG4M0I7YFDtZGdnVPAx9JX8pM2ghicaZllNtWLx0iIuiub3FGTdvVepkZMTZv8HuEcstlyxcXap3aIbEcC0isVJSNDc3w98DnExBh7J6Ojg1jcQPeXpfZOZ4xa5F2PIyBlGhbec2MTYNqjFib1b25Vn0vMuoOvro4FouEswSpVTs/t8qcZyDy9sCmzF1/gzD24iG1OcMKpQd6erYBY6CkxaULL5hsd38LltVg2MvYERXYDPe6W6G153+nrbpZZI+p2wXS9pNFt47zy+Iwb5fSjPmqJ+attx+twCbNj8YQM+J6uW6ZG3KoGX/1U/RMKdOCqXt38WG1azuA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(86362001)(36756003)(40460700003)(40480700001)(26005)(186003)(83380400001)(1076003)(2906002)(966005)(336012)(47076005)(2616005)(6666004)(478600001)(426003)(8676002)(70206006)(4326008)(5660300002)(70586007)(54906003)(6916009)(44832011)(4744005)(8936002)(316002)(41300700001)(82310400005)(36860700001)(81166007)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 21:05:09.2841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c46b70e-6ee8-44ab-b23f-08db3ad06f05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000145B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424

Xen is supported for aarch64 via xenpvh machine. disable-tcg option fails the
build for aarch64 target.

Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu-devel/2023-02/msg03979.html

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 .gitlab-ci.d/crossbuilds.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 61b8ac86ee..6867839248 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -186,7 +186,7 @@ cross-amd64-xen-only:
   variables:
     IMAGE: debian-amd64-cross
     ACCEL: xen
-    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-kvm
 
 cross-arm64-xen-only:
   extends: .cross_accel_build_job
@@ -195,4 +195,4 @@ cross-arm64-xen-only:
   variables:
     IMAGE: debian-arm64-cross
     ACCEL: xen
-    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-kvm
-- 
2.17.0


