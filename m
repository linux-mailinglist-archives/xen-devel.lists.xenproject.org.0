Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677177920BA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 09:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595374.928939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXY-0003gU-59; Tue, 05 Sep 2023 07:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595374.928939; Tue, 05 Sep 2023 07:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXY-0003eB-1h; Tue, 05 Sep 2023 07:32:00 +0000
Received: by outflank-mailman (input) for mailman id 595374;
 Tue, 05 Sep 2023 07:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AA/O=EV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdQXV-0002rN-O1
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 07:31:57 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a728ebc-4bbe-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 09:31:57 +0200 (CEST)
Received: from PH8PR02CA0013.namprd02.prod.outlook.com (2603:10b6:510:2d0::14)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Tue, 5 Sep
 2023 07:31:53 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::9e) by PH8PR02CA0013.outlook.office365.com
 (2603:10b6:510:2d0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 07:31:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 07:31:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 02:31:51 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Tue, 5 Sep 2023 02:31:49 -0500
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
X-Inumbo-ID: 4a728ebc-4bbe-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaUmqwAvbS0bq6t6s2ZB5/xGhmszoBwoG9dbVmFgl6dMO1cSnjZd0e3QnhXKYHVWtjj2u6PHMtOcSWpwKnMFX++hQ26QBmC+LTKpiM7bNlB+HH0+ueU0oHzncCiRo3rni2R8y221nzPeoEdrddEuqAWWsmGM/jfz+f/2HgMprgu4P/L8A0tcwk26OZdFoukuKvLQlVSAUeWcY/HcjCEiQR/fv5cB3Yf33vGApxdpYyaH2LZRiK+KJLRaVJxJd9Bujnxf16q237kIBQ9MJ1KshfdmoSfbVIiN98sx44yPdtDiLnV07sLzwVnTJYmqiR+i/oLvcMByAPW6R1MAiErMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ttBx/RLfvS/dpP2YFQ9lhSCOmO9pCv8GBtM7hOK5HY=;
 b=TdQ7GGnQpL2+aRwiKuVazqoQi0N8R/BSndhvjvPCaP9jNf0Z+PMmF3UvIfo6Yth7XjZOpYFnBaKeAdf/QuPVsBnwgnexN0Z/i6KYWiYIavzqq6Fvxlqm4ggTh/LQp8C1ZyFJilAdd1TNn5IXQFPVuCcPQRu6kYevFOILXc1nWb3gs2WmQTnWP6wtYqE2/Kli9hnMRESPcEQkLVK9q/Xmb9TAW51AVq3Pp7tmCIo/LrhyxCDuuKBLfBFvFsnqsFGWgFOPe/pOuslehwAgpG8rdC/xg8dWraqB4aP8IGxWXoHb4js20t0gmStNhvviP9W11S7idGs4p3n7nxYmq3HUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ttBx/RLfvS/dpP2YFQ9lhSCOmO9pCv8GBtM7hOK5HY=;
 b=kF7DdiXTfabXf12QKsc+JQbtmY0NsMnkouNBb+7tmEh67h89DO7chafghGiXLx1OM0iqXkgwhZ2gvuzuhtFa6W1vkTiVeoK7v+bkn6jmcYL1Gf5YFqQikkcRpHr/Luui31B26G+YY7cU1i6B01g9OWHMVMG2KH9+CG9Zv/bdVho=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<Henry.Wang@arm.com>
Subject: [PATCH v2 2/2] xen: Change parameter of generic_{fls,ffs}() to unsigned int
Date: Tue, 5 Sep 2023 09:31:35 +0200
Message-ID: <20230905073135.12360-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230905073135.12360-1-michal.orzel@amd.com>
References: <20230905073135.12360-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b8cf58-0433-414e-f10f-08dbade22c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6yG3E5Fdmt37VCAUJYNK3dg/K8EaXIG/kXwYUjLNllUsotS9I0mGzbAyzOYozeurMv0dATf5n91pHAKM3lu8jb3iKoJ3cxgqnzV1GjWkZNz9c9TAzJ9+7WOICSiBfQacOlk19I4KiuOqz1vpWC/LOS0aYZfEzJdGTLSiNj7IZKOjztPd15By9STSztjSn2CH14M0s9f8DE0OeEJYSgX8eH8H1vK6wIDftElDP/WkZNUEnG2+zHff88B/6iDUgY+jLIseu7UhIm0vWv2Uhhwbisv9birTjZ5n/yNFKIxdutqhkpJoglqzniUGCvAMcewDYyfv74uZrmKQ0IEIZnO7jVGEqfEYAEVxgTNA0pP305b05gEF/6nFcoFAHEZe7mhfZQPRcrtU9d0UF9RgDXOAlpMj4cNYWnX+rV3Pslyinor5//1KLPZKX8Xz52LEUX+JO9G8+Ip8Dcm3GCZb5oYSTJqT6tX9QL+Gf8I1XwtexwTuf+Za3PKagyhtq2nGr5rF4EECFiRdMdUy3RDw1R1AIy1oehLkhPHUICSgg5haUkYOgeYz9JAaIiGsGBXcSOsERlbhfs80ODOSJi+jUV3rgxvlvA6esMXcYv0j61vOo7diSdYHUvTwDagnO1ivKBYnGDc+fQzI4D6M14caSt+xFwkDZu1SvH8Uf5Cu2aSxjAjGdzG74bvGuwJd9GFKCE2f94wIwabZWaBqX2v8gk7YWyutG0wjm68kq9Q4gkGWTdPnrKZqWcQWR45oQQC1O8ndjHMW0MgW9F6qryWz0dlbPTlGAZGuWhaOyqozdrLpU1I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(1800799009)(82310400011)(186009)(451199024)(46966006)(36840700001)(40470700004)(41300700001)(40460700003)(356005)(81166007)(36756003)(82740400003)(2906002)(70206006)(86362001)(316002)(6916009)(70586007)(478600001)(54906003)(40480700001)(6666004)(8676002)(4326008)(8936002)(426003)(44832011)(336012)(26005)(5660300002)(1076003)(83380400001)(36860700001)(2616005)(47076005)(41533002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:31:52.2074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b8cf58-0433-414e-f10f-08dbade22c6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654

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

To keep consistency between the helpers, take the opportunity to:
 - replace __inline__ with inline,
 - modify generic_ffs() to take parameter of type unsigned int as well
   (currently no user and the only wrapper generic_ffsl() passes unsigned
   long).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - as requested by Jan, s/__inline__/inline/ and modify generic_ffs()
   for consistency

It looks like generic_fls() is only used by Arm and invoked only if
the arguement passed is a compile time constant. This is true for SMMUv3
which makes use of ffs64() in FIELD_{PREP,GET} macros. generic_ffs() has no
user at the moment.

Note for the future:
The return type could be unsigned as well. However, looking at all variations
of the helpers to find first set/clear in the codebase, returning int is the
de-facto standard. Changing the return type of the title helpers would result
in inconsistency or require to do modifications in other places which is not
something I want to do at this stage of release.
---
 xen/include/xen/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 654f525fb437..edd6817d5356 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -18,7 +18,7 @@
  * differs in spirit from the above ffz (man ffs).
  */
 
-static inline int generic_ffs(int x)
+static inline int generic_ffs(unsigned int x)
 {
     int r = 1;
 
@@ -51,7 +51,7 @@ static inline int generic_ffs(int x)
  * fls: find last bit set.
  */
 
-static __inline__ int generic_fls(int x)
+static inline int generic_fls(unsigned int x)
 {
     int r = 32;
 
-- 
2.25.1


