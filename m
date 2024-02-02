Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA1C847BAC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675237.1050583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dv-0001Gk-Or; Fri, 02 Feb 2024 21:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675237.1050583; Fri, 02 Feb 2024 21:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dv-0001CX-J2; Fri, 02 Feb 2024 21:37:23 +0000
Received: by outflank-mailman (input) for mailman id 675237;
 Fri, 02 Feb 2024 21:37:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1C7-0004Ae-4j
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:35:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fba113e6-c212-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 22:35:29 +0100 (CET)
Received: from SJ0PR03CA0381.namprd03.prod.outlook.com (2603:10b6:a03:3a1::26)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.13; Fri, 2 Feb
 2024 21:35:25 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::f) by SJ0PR03CA0381.outlook.office365.com
 (2603:10b6:a03:3a1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.27 via Frontend
 Transport; Fri, 2 Feb 2024 21:35:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 2 Feb 2024 21:35:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:35:23 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:35:17 -0600
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
X-Inumbo-ID: fba113e6-c212-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfeohXYcssNx4LGdnMYO1l6efKA2Cu4pWzgNugzpbp0WI3n+F98n0GqUP0JLNg7pcfDIR9w4+wIDzaJawO8YRqDlMsEqd1C75+U+Y5zKeUlAoQNywrn4zZkXVaQ2O1DPy9sgOuYrSQnKqxDAu+RnKt+qFC5mnHCikAeH0r/FfPuXFf3YFquVam/ixdfbkRpC3cpSfSONj7sCnnEX4aow0gonPk7gYWmSkLDnYRDPBF/6YFyhFFRoSU8wVFOYWA2lQJWwLVN48eyJ68sar9B9WIZUmpNm3U3ig3c+9VZIvocvWifww/Bbd/zdz5bqfqzS7VJ8sKSJ0B7blP7xanF7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi56JEzWMgKoMsc50mwUebNiiljtIu6vzi5g/b8KIBY=;
 b=kEb6n/l4euu0BG8KsUgcZjMIxggmkdndvzmYPDqCQZ5dMuqXtMko0tbwAMm9CEgc3XxjM27iBxVSlpTC9803CtGNcPyXYe+JCPPpWTbqb1QsA+eG2ldPEIR6Lpg1OG4GCfkYqJB1rBBqcSzmBrVhEOv4hhUxxf2uLRMHqWQb9/XZejlIRe+2Jn/hCI76rQV6Uv7Z0R3CFT7525Lzgx5AP2XWXi1L8rltAkemmVdj7iFsu2pXQiNXiG5vZoLD/SXsinPnNYzId0c7lTL0NGAjjmGOt/KPMwxVE6zLqKLiKcYOWN1D+ktuXApxWm8VjAaNNCntqxMyBNgxyhPFUOJ6dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi56JEzWMgKoMsc50mwUebNiiljtIu6vzi5g/b8KIBY=;
 b=k4Ys+m/wdNa1Pkyi/my9j9CLIW8jMOAnsTQBw3N+dqAndW7VMbuHc3KbcADrqjTnPgQgIxQKq7rBi9ImZECRkmumgh0HOXKzgDw9bjaDXT6gv/1SBxz53s1TyPdWT3ixpcoblttqHflhNH/U3KqHdNcKAd/0WNl+HeLgE0JxeH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v13 07/14] rangeset: add rangeset_purge() function
Date: Fri, 2 Feb 2024 16:33:11 -0500
Message-ID: <20240202213321.1920347-8-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd32703-21c8-4311-cf92-08dc2436dd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wA0uZjREnZav4KOm+CgHBzzFX+GbLx8RJW3/lFefgpDJGl5mpchTDav0KXHRhl/N1TJSeg1iC9aOx0EE41f/nC/S+jd5XCHXUQBGgrLn4d4jjjEfbG+T/wzFbwYWiKUBAYpSP0nLLDq1d0wScq8F7g14sGuYVi1Gw8LfXRWZgPpcfhVvsddbgSfCghTMzd/qhjHcGJKsubHplszvEe0Sek5+G0Bh026uVjSVf9KsEm8T04DDwjxyCiAHIGlWLJUGwZxHBMcLKL/zUL9WJCQTFz04o9+Vv9Ydx77/c6kdNkZc1hOoK8s3lXf9V1TPcuUOinXR/XNe9CrAFdBM5AExOHKnRq9lGWEB159TRKUMdDfpQytgtrCmwIrkLrJSqOU4fUrIgynNB2kEiixyn5x09BiW6miaPXuaqm6YoAn9oErMLJ+I0/oI03bOEDM1sQkoGB1ZrjqElR4q7ui/KDozBFz6pMb+EiZLr0+kwP8I9EKchyLkH/xgQD/9+vEa/B50HKgXLu3mGJyL1URtQtH0u3mgn++o0i78pK1oaETuOSBOMAJD4sTYKHeNTerFKztCF9iCJEbHGGTWuILWcbQJ0QlAdtHjtFynE6X4Liy7MLp+7hi04NB8VmGWSyz9UZbKRvbUi9clWbPD0cUs0fvZ29k5dwCgqT0xp2/kvwetHfA4OpTM9UKbMg6T5T22TFUZS4Y+YlUsrske9seX5UsEE5XCcMXsIVnAHjF+xBsPZC/RExBd0TgYPkAlSEF7ejqttL4VLYXtPuOBKIIHFqbnfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(46966006)(36840700001)(36756003)(2906002)(5660300002)(41300700001)(1076003)(2616005)(83380400001)(336012)(26005)(6916009)(316002)(426003)(54906003)(6666004)(70206006)(70586007)(478600001)(40460700003)(40480700001)(36860700001)(47076005)(82740400003)(356005)(81166007)(8936002)(44832011)(4326008)(8676002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:35:24.1820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd32703-21c8-4311-cf92-08dc2436dd84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

This function can be used when user wants to remove all rangeset
entries but do not want to destroy rangeset itself.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v13:
 - Added Jan's A-b
Changes in v12:
 - s/rangeset_empty/rangeset_purge/
Changes in v11:
 - Now the function only empties rangeset, without removing it from
   domain's list

Changes in v10:
 - New in v10. The function is used in "vpci/header: handle p2m range sets per BAR"
---
 xen/common/rangeset.c      | 16 ++++++++++++----
 xen/include/xen/rangeset.h |  3 ++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 0ccd53caac52..b75590f90744 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -448,11 +448,20 @@ struct rangeset *rangeset_new(
     return r;
 }
 
-void rangeset_destroy(
-    struct rangeset *r)
+void rangeset_purge(struct rangeset *r)
 {
     struct range *x;
 
+    if ( r == NULL )
+        return;
+
+    while ( (x = first_range(r)) != NULL )
+        destroy_range(r, x);
+}
+
+void rangeset_destroy(
+    struct rangeset *r)
+{
     if ( r == NULL )
         return;
 
@@ -463,8 +472,7 @@ void rangeset_destroy(
         spin_unlock(&r->domain->rangesets_lock);
     }
 
-    while ( (x = first_range(r)) != NULL )
-        destroy_range(r, x);
+    rangeset_purge(r);
 
     xfree(r);
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 87bd956962b5..96c918082501 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -56,7 +56,7 @@ void rangeset_limit(
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
 
-/* Add/claim/remove/query a numeric range. */
+/* Add/claim/remove/query/purge a numeric range. */
 int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int __must_check rangeset_claim_range(struct rangeset *r, unsigned long size,
@@ -70,6 +70,7 @@ bool __must_check rangeset_overlaps_range(
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
     int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt);
+void rangeset_purge(struct rangeset *r);
 
 /*
  * Note that the consume function can return an error value apart from
-- 
2.43.0


