Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5AAB127BE
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058724.1426270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKH-0000bA-Pn; Fri, 25 Jul 2025 23:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058724.1426270; Fri, 25 Jul 2025 23:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKH-0000XL-GA; Fri, 25 Jul 2025 23:59:45 +0000
Received: by outflank-mailman (input) for mailman id 1058724;
 Fri, 25 Jul 2025 23:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKF-0007YZ-FY
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:43 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6da0cc7b-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:41 +0200 (CEST)
Received: from SJ0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:a03:2c2::19)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 23:59:35 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a9) by SJ0PR13CA0044.outlook.office365.com
 (2603:10b6:a03:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.16 via Frontend Transport; Fri,
 25 Jul 2025 23:59:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:33 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:33 -0500
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
X-Inumbo-ID: 6da0cc7b-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udzMCsgqBJ2qN1/gSdk9JymNmZVNBOJDEfjE6co7FeqcwG27n3T8/lb5B363eBMUY/vqEzrZMChOBwvmeL339R+GdkzlE6FWapCTV8XRAZlK4qSacImTSxtNqxXUPKb22ij+A6F4z/77tjq/cxakRg7zTHswrcmOYVUt0R5yjR5qAH0UTYDNI3tpYrTRXzzf5LgyFMbWqPEw3dINgj0wtWvRV3qx1jwOpKp6CjApvDI9+iRwHZCDhzS2M7PUZLu/jE4BpuJRXigk1tl0T2euTJutryfvf/mh6XwlP4Jk1Nd30EnPjS6MorVhEhzDzkMvVwhurLnAQKq3PriUPIICbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqHjxqohFPHOSPVRyrPZTNT5elTCXWAy2c5zwbn6lSc=;
 b=vEgP1y7g0Gb/jpMRKye5IxfrwPr3LnVBLy+HHW8boVILcaiA+X682oEiqrqBpao9VjO0u8ZgLaUU0ebHmLuc1gDjnv12qBFbKBp7hrdDBAzA/EnC6pJaSoLBekXGCRn3ooh4NU28ea8l9QHa3UxE0/sl+TW1Z5LE3RJPsPnsbn8EXLcgOf7gERTTZltE/1xPK+sF4TAU8hUGwNjINRDcMRFuG/UcR9mIZfIv03O601GdLXl+++6yZv5bnqcbFAaVjYjUNmUWMDju4mcCOZ9gaPYI1H5hL7wK9jvAV9Hp88CcPsFfFwocfuwbbEsY0ZdLll2IzPfYx+A2N4vGrSkCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqHjxqohFPHOSPVRyrPZTNT5elTCXWAy2c5zwbn6lSc=;
 b=3z+BDxe/DU3EC+kjZgbOSzw9g8LkUb4RQP23aCIGtWoN1rUNBZvIOQjZ2mELWBUIy7+Lwk3A84evPdsI32ps9lO8cgbHQB05WYO6OH0FBAJZKkOYqc9Sr1TjMruXvB5uk6UqvKJwO3kIFcoW/YF7srG26rW+WdOY9Dv+WJqyHfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 06/11] tools/xenstored: Add get_domain_evtchn() to find evtchn
Date: Fri, 25 Jul 2025 19:58:53 -0400
Message-ID: <20250725235858.666813-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 207e1786-16dd-44d6-a764-08ddcbd74e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F2Wg7XeYnNJMNI49qSO7E8+mwN2iabLYOtfD7zg8Dj44LPjVzjXnaVibpO+4?=
 =?us-ascii?Q?T12hIGUa3goFwy/BieWbmHxLyW/3rF3OhZRRq5bL/tM+d7xIpxwSvS/SajI0?=
 =?us-ascii?Q?8olkcdeXwWaUyXUvi9ichZq0SUPbi86T3fNhDk/AwbUa9BWIWV6bqbvBKz82?=
 =?us-ascii?Q?nw3efSI7wF+6dQDTcSdgAEreeHXbdJ/AwVVt8PG7RpVvE8rSTm6CMdzVxKwP?=
 =?us-ascii?Q?Bj3e3puTM/dV0+Anuot1lbh2kaFhOZ1+yIvOtOASwW+qJ31LUldwPgHn6h6t?=
 =?us-ascii?Q?dGWq9tc55cCbbFEkE24m23FM3yaSApxX6YAKfnJ502N9Nqqm2DV0g8yCN852?=
 =?us-ascii?Q?y9Pi44rlwjmzAo6gOGwU1ez2PPk5OkSIUkDMZfUW0k0qq8n4tUqevRovskPs?=
 =?us-ascii?Q?yy5JSs+hs8gZYA3nFdRg+Rdp0ti0YtL3nufrN9fZp6GZLIo7c332VVkYCzM8?=
 =?us-ascii?Q?pS9X0UeWiHDtGwdwEBuD/VepzbU2r2qK+/kbmfNLQmExM1EnCeBY8d5+53K9?=
 =?us-ascii?Q?WC18uXO2ZfL2V97fPj2KKZgx3qjFx44SUQJiAY6wWXtQHJQdYZ0jrbwlyMHj?=
 =?us-ascii?Q?pxiT9B+KiRdS4RKPFK2xQh9LcU0CaZ7GvAJjDKuq1sZg4FLfkLzlXaS1ccNe?=
 =?us-ascii?Q?NWXHSY8iY8dUNWiMvCblRUktcrDOkRn9sW68MHwqf5nlTe7oRurdgg6P3G52?=
 =?us-ascii?Q?u5+SW5hrYMlGDneLyaaDmBOLFihLLNa1aDtrbA/3VMwFd9+BWB2fI6zfWevH?=
 =?us-ascii?Q?meM30+oniMEMCouh+dw25v//7Un7JHv1eEQcvQvrGz4MSBvfvuqmI8BWV+gd?=
 =?us-ascii?Q?c26Sahb2T/XZFv2uqEleAOaSKL1zsHsvIHkRleHeCHT29jRvsHqWAnTtPQ80?=
 =?us-ascii?Q?4d34aruDYW0rxr/5+chI9zWOuC/8Po9hVcLMseRRvzuF3LpYeGpcJVi6uaC9?=
 =?us-ascii?Q?bEL/mRnsRx6sawCYqHEronlPmT6LozYe18CmWOsEB77DjJT5h/+RmB19MRRe?=
 =?us-ascii?Q?SEDkZDi9v/7gEnfe72TYJawckcVds6Tcebe6yGcIOiSdnoKPvgmu/ZJUzkPZ?=
 =?us-ascii?Q?SWIxBUg92LLmGgmrdJht3DqSnwcdEMFK0Agt1uaARXqxNx+sQ0Xva7StUJYr?=
 =?us-ascii?Q?MGyEfUBg7iwmGVO0hNFQnJd6AICt4x6+0OdjT3dAQQv97xVl8+QxCqrUFNxg?=
 =?us-ascii?Q?hfR1A8uqKiU1xXlZh8jGRhTWlhEWwMR/syoJyefxItE5jO1eDZPHQPwLi2hh?=
 =?us-ascii?Q?Kx2CL514q8WsxBtLwlhloYL8a5UzbiU6kI6SLK6XXbF+0X3S+SXYK35rvyiS?=
 =?us-ascii?Q?/38O2B5QPvbtquxKDB4OzU1rfBXrXbOA38mTk9l/ggDD6j2WOiqeZ6cBHaKD?=
 =?us-ascii?Q?l9nr+bVlU25dUMA1paNeRSu46u5ymyf/A9UE4+q0vCBLlUXJ3N2V0ooHkL8/?=
 =?us-ascii?Q?SOYUwiTJYY5T7OmL9mKzRR7ZSdoMsLGvNF0gJMx3aUCFDdKrsb5IXpIgEtYw?=
 =?us-ascii?Q?BbtVon9Y1Y/KB6zIlFr6Pdcq/Tyt9k9mOWfg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:34.2803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207e1786-16dd-44d6-a764-08ddcbd74e09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810

Add helpers to lookup the event channel for a domid.  This hides some
of the differences between dom0 and stubdom xenstored.  Each version
defines its own.

It highlights the different meanings between get_xenbus_evtchn() in a
stubdom, where it looks up dom0's event channel, and dom0, where it
looks up the local event channel.

get_domain_evtchn() replaces get_xenbus_evtchn(), and
get_xenbus_evtchn() is removed from minios.c as it is inlined in the new
function.

The default return 0 will be fine as any other auto-introduced domain
will needs the event channel populated in the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v5:
Split get_domain_evtchn() in minios.c and posix.c versions
s/dom0/stubdom/
---
 tools/xenstored/core.h   |  2 +-
 tools/xenstored/domain.c |  9 +++++++--
 tools/xenstored/minios.c | 17 +++++++++++++++--
 tools/xenstored/posix.c  | 16 +++++++++++++++-
 4 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 1ba9592d16..877b1e1103 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -394,7 +394,7 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 }
 
 /* Return the event channel used by xenbus. */
-evtchn_port_t get_xenbus_evtchn(void);
+evtchn_port_t get_domain_evtchn(unsigned int domid);
 void early_init(bool live_update, bool dofork, const char *pidfile);
 void late_init(bool live_update);
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 1241f8c73e..71ab7aaad3 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1256,7 +1256,7 @@ void dom0_init(void)
 	evtchn_port_t port;
 	struct domain *dom0;
 
-	port = get_xenbus_evtchn();
+	port = get_domain_evtchn(xenbus_master_domid());
 	if (port == -1)
 		barf_perror("Failed to initialize dom0 port");
 
@@ -1271,11 +1271,16 @@ void stubdom_init(void)
 {
 #ifdef __MINIOS__
 	struct domain *stubdom;
+	evtchn_port_t port;
 
 	if (stub_domid < 0)
 		return;
 
-	stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn, false);
+	port = get_domain_evtchn(stub_domid);
+	if (port == -1)
+		barf_perror("Failed to initialize stubdom port");
+
+	stubdom = introduce_domain(NULL, stub_domid, port, false);
 	if (!stubdom)
 		barf_perror("Failed to initialize stubdom");
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index a229954cf4..a86edbd5c8 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -41,9 +41,22 @@ struct connection *add_socket_connection(int fd)
 	barf("socket based connection without sockets");
 }
 
-evtchn_port_t get_xenbus_evtchn(void)
+/*
+ * minios stubdom looks up dom0's event channel from the command line
+ * (--event).  The stubdom's own event channel is returned directly.
+ *
+ * Any other existing domains from dom0less/Hyperlaunch will have
+ * the event channel in the xenstore page, so lookup here isn't necessary.
+ * --event would not be set, so it would default to 0.
+ */
+evtchn_port_t get_domain_evtchn(unsigned int domid)
 {
-	return dom0_event;
+	if (domid == stub_domid)
+		return xenbus_evtchn;
+	else if (domid == priv_domid)
+		return dom0_event;
+
+	return 0;
 }
 
 void *xenbus_map(void)
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 6037d739d0..d850dc0da9 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -139,7 +139,7 @@ void unmap_xenbus(void *interface)
 	munmap(interface, getpagesize());
 }
 
-evtchn_port_t get_xenbus_evtchn(void)
+static evtchn_port_t get_xenbus_evtchn(void)
 {
 	int fd;
 	int rc;
@@ -166,6 +166,20 @@ evtchn_port_t get_xenbus_evtchn(void)
 	return port;
 }
 
+/*
+ * dom0 xenstored uses get_xenbus_evtchn() to lookup with XENSTORED_PORT_DEV.
+ *
+ * Any other existing domains from dom0less/Hyperlaunch will have
+ * the event channel in the xenstore page, so lookup here isn't necessary.
+ */
+evtchn_port_t get_domain_evtchn(unsigned int domid)
+{
+	if (domid == xenbus_master_domid())
+		return get_xenbus_evtchn();
+
+	return 0;
+}
+
 void *xenbus_map(void)
 {
 	int fd;
-- 
2.50.1


