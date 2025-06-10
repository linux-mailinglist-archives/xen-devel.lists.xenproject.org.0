Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59694AD4726
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 02:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011232.1389614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8ta-0006W3-U9; Wed, 11 Jun 2025 00:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011232.1389614; Wed, 11 Jun 2025 00:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8ta-0006U9-Qj; Wed, 11 Jun 2025 00:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1011232;
 Wed, 11 Jun 2025 00:00:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uP8tZ-0005ZD-Fw
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 00:00:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2415::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e73f5f3-4657-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 02:00:44 +0200 (CEST)
Received: from SJ0PR13CA0221.namprd13.prod.outlook.com (2603:10b6:a03:2c1::16)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 00:00:39 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::ab) by SJ0PR13CA0221.outlook.office365.com
 (2603:10b6:a03:2c1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 00:00:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 00:00:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 19:00:18 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 19:00:18 -0500
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
X-Inumbo-ID: 1e73f5f3-4657-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUgn2NKGswK0DwIFzbwxeWx0LRxNBJBigN7jGE+AQ/4+JCwnczdM3MsdZIurnXb0Aik2z7Gp1Nam1A3TcD48792Rewf5l3K0GtQdjjYfmqEdPfyAfF3wpuzknNsgmUwk8Tezwg7CU9NyMIc29+r+TGopVvw/pyrpFxS0h6lhfm6ilheHbZ89+sUWPGe9SvX9mX6wtqJcJRjuS2hOn8TfWMpwSXD2xzJ7h+nBPhOM4tujR0ARRu3BkxTQ3dJ4Gmp6TmXu5ZxEuwOEHwViPUCtDIo6dX4WAi0Tof3J7xm3pDS5m/LPgXZaa++Z1KDSRWBj8bmqsHngyZJ0t3DwWdo05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts3RTY6TOei3qYAavMrJU+OXq8P7HWjtk/s03Gzv3uE=;
 b=OdkVbd/KUZAU2i+D8PRHzvoHJjnfvFYBezC8OS8SSo68neJSjSWw25v3CTDE7IGGS6PuO9RFCYUJ4aA4i74KWFqlkdy7WLeMnk2wRZunad4TeR/lVrpgOPhj4A8ihT9h9QjZp0yK0Op9zliawNv61zn0/l12TZPk4gSkElPZ1vXSy/9wDyfh4f+5XmOv3vxQ8Lx9vRdwC/to7RYEfwDcQQw7GON299Vopm3oMfdpJqJGkozwBZ3sJl9eCImASLu/nZFl9EQx6TIncBoNuKj6Vv8vqI0ulClPd/0YMEJh8+tCbpVhlcfFdBE+5vwMr05t4rWAjU5jUJ8Uk6hwdAC85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts3RTY6TOei3qYAavMrJU+OXq8P7HWjtk/s03Gzv3uE=;
 b=qbb/I+Ln/dDM0ZY22vvVEVxguSuZHuekGsUfJ7xF4TEzPPbTK7y/XssSELs46alWPzS3pe/SGUtRDfrzMGeh6JJJutz/MTePrHVoRGZK8wrF5FuyJVUQg9FPn0mVfwEq06o1B/Gt3zTGs0HjsuuP5HgPS+RuF7QgzypZftVL2VA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 2/4] xsm/silo: Support hwdom/control domains
Date: Tue, 10 Jun 2025 18:57:35 -0400
Message-ID: <20250610225737.469690-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610225737.469690-1-jason.andryuk@amd.com>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf7e91d-6e07-4c88-c748-08dda87affe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uhBRqAIp2Y8z/xynMDZSmGg/FQSCEpqfjMoYyZLywLhidGeqzlVB+1DXKEtS?=
 =?us-ascii?Q?phDRQF5lX/8O6gvQ5ZgPWK/uyQby6b83nCDDFfkXkjTGXvvtI2OY2LeLUq3V?=
 =?us-ascii?Q?vAm6IqvsC8Pdvzu0smXZYAlx1im+WfsdoeEtIDueEBrXonYoot4l2ibmhoPa?=
 =?us-ascii?Q?YcT+yWVwuNdaVkHdFa+FOPrCEfC9tIY0oLofyeLiYOemP0WVpktJy3yKkuba?=
 =?us-ascii?Q?KiI0YpikYUIhr+o6v86G0ijQRPq3cT0CiGoK3wm9RnxG75LAbHGKH8ImAmXo?=
 =?us-ascii?Q?duU2FLsRoHCgN2TomeO0SCEyoGQa4lkuwVBANnw0sSf5S4apXw7t9MIfHLjV?=
 =?us-ascii?Q?/dCUybSEJM/L3FJLuVrSl06tbtN2MtS2YOWx1V0ia/Kx5jFFABEykdmRjSeh?=
 =?us-ascii?Q?bo1pomZ1KGzC4PboQHbvnY5v1WF2gp+0CQV+rVpQJFc4jzTujfsd/h7RoBVR?=
 =?us-ascii?Q?lXhvFjFIkTiqcM/W+j32WTTpIHiV3rWsEtnXNIOFb0HY1wVft95SPj4sE+8n?=
 =?us-ascii?Q?2FOG/rD/ODbaqKBG5qjRBcDoviOwGJGKtWuSz6/RECuvbBeuFz+/HImzNKAM?=
 =?us-ascii?Q?H9nrXl9e36e4uN1AHOA7xP6zPSkS7l+WUOmjFHxe7EJZ67oo6DOBEzpzSTdv?=
 =?us-ascii?Q?PjcW9ez8cxKCaW8g9oro3AmuHW1zvi9FmK7AvsF/GJwyNhFDLc5b2fGhIxAI?=
 =?us-ascii?Q?gBrvrDtoff7d7Lo3RKmK7bwlPXm1e775rnQRKSl2V7V6sQJqQodraTjHsdzD?=
 =?us-ascii?Q?9/cjAtUrB3gvPMQuXxSL7NHO5sWBvJYrDKSi50Y0wX/Nv8pwb/7Rz5hjM8nX?=
 =?us-ascii?Q?IclDAVppc/WCb3F7iz9SMrhNDKq+18EthBQSGUkggMWWopdqsCnKmNq2d/Iw?=
 =?us-ascii?Q?laKydHkwayBhzYoaBHwX8s5i7nEji51latsGLDWk2lOHI0ZcU89id6fA9UUB?=
 =?us-ascii?Q?TV5fI4DTAfoZ3esrL5zY/OGO9AbGgMTCYqGOhUlLyMEDz5HJGsm4egZeu+lZ?=
 =?us-ascii?Q?rK+ZN4TMlHeL/wBCv1UNaSG35sY/fSWeoSl8TV1dBSEUxto2/k3oYZxPHlqD?=
 =?us-ascii?Q?noPkJ3znt80P7JaV5QvIb8OhHpgYJYalmpJSSpl5adyyN7L6KJQmr5+3ZWEf?=
 =?us-ascii?Q?Csm88v8/ld18mJezt5C0Yq4CXr6jXxRotxAMxQ5susRA5w06aQO4qXIDqKpj?=
 =?us-ascii?Q?pIfvTlfhJ35mrBLpULgpVz/C3E/jLoFftben+aAfO2eVEFSyIC6lYDFfuoMS?=
 =?us-ascii?Q?4qbB3/d8ddDfwiE9L4IyGc/C9zPnC1zqCbaiheEohFe0GqplJvivqwfKKhCV?=
 =?us-ascii?Q?ew6VsRGyPnVs1VMFkjhzGwba9XwkNaPUrDdkgkrtMBMO3WesIr+SPwF+raSw?=
 =?us-ascii?Q?/krwklAsHMvjKuntzsMt/5N8B/w3fP9/0kbNsvD092rADqlyv2u1Q4a2ZLrf?=
 =?us-ascii?Q?zxXXZKJUXTJVEnt0h7xWk7olc+vMCbU149CgTFKzS9T33FpkeBCe7yL/0gIm?=
 =?us-ascii?Q?93FURbUsLclKSPFSqKmW6fJuMjPU9g6e245x?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 00:00:38.7944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf7e91d-6e07-4c88-c748-08dda87affe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531

In a disaggregated environment, dom0 is split into Control, Hardware,
and Xenstore domains, along with domUs.  The is_control_domain() check
is not sufficient to handle all these cases.  Add is_priv_domain() to
support allowing for the various domains.

The purpose of SILO mode is to prevent domUs from interacting with each
other.  But dom0 was allowed to communicate with domUs to provide
services.  As the disaggregation of dom0, Control, Hardware and Xenstore
are all service domains that need to communicate with other domains.

To provide xenstore connections, the Xenstore domain must be allowed to
connect via grants and event channels.  Xenstore domain must also be
allowed to connect to Control and Hardware to provide xenstore to them.

Hardware domain will provide PV devices to domains, so it must be
allowed to connect to domains.

That leaves Control.  Xenstore and Hardware would already allow access
to Control, so it can obtain services that way.  Control should be
"privileged", which would mean it can make the connections.  But with
Xenstore and Hardware providing their services to domUs, there may not
be a reason to allow Control to use grants or event channels with domUs.
Still, Control is privileged, so it should be allowed to do something if
it chooses.  Establishing a grant, or event channel requires action on
both sides, so allow for the possibility.  This does open up an argo
wildcard ring from domUs, FWIW.

This silo check is for grants, event channels and argo.  The dummy
policy handles other calls, so Hardware is prevented from foreign
mapping Control's memory with that.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Add xenstore domain
Expand commit message
Remove always_inline
---
 xen/xsm/silo.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index b89b364287..db48705674 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -20,6 +20,12 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
+static bool is_priv_domain(const struct domain *d)
+{
+    return is_xenstore_domain(d) || is_hardware_domain(d) ||
+           is_control_domain(d);
+}
+
 /*
  * Check if inter-domain communication is allowed.
  * Return true when pass check.
@@ -29,8 +35,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
 {
     const struct domain *currd = current->domain;
 
-    return (is_control_domain(currd) || is_control_domain(ldom) ||
-            is_control_domain(rdom) || ldom == rdom);
+    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
+            is_priv_domain(rdom) || ldom == rdom);
 }
 
 static int cf_check silo_evtchn_unbound(
-- 
2.49.0


