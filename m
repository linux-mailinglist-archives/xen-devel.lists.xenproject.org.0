Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47686B287C0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084088.1443548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25o-0006YS-Hh; Fri, 15 Aug 2025 21:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084088.1443548; Fri, 15 Aug 2025 21:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25o-0006Vh-Bq; Fri, 15 Aug 2025 21:36:08 +0000
Received: by outflank-mailman (input) for mailman id 1084088;
 Fri, 15 Aug 2025 21:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25m-0005Bt-Ou
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:36:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2009::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d93c5cf6-7a1f-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 23:36:06 +0200 (CEST)
Received: from BN1PR14CA0026.namprd14.prod.outlook.com (2603:10b6:408:e3::31)
 by BN7PPF0D942FA9A.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 15 Aug
 2025 21:36:00 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:e3:cafe::5d) by BN1PR14CA0026.outlook.office365.com
 (2603:10b6:408:e3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 21:36:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:35:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 15 Aug
 2025 14:35:58 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:58 -0500
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
X-Inumbo-ID: d93c5cf6-7a1f-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwsNIf6F+5RmvZcWKCnZ+WKiy8IPyzWYTVPa7hyTebWvAnCBBhGCShaBwqBEhNegUx2z4NnRQF04OaUtSpiEkxQTfO/LF7jS8a3ZPIKbgXpj43jUv4TMS2jpjYSy6bCEjLMuI88L1v6K7PW71RuAaBL83Wr+K2QNYdH0rcGLwt1oeBcXCJDBiIu8KeKId+yVPRHa/Yu8kAW3gIFkzM8lb7yGkd+JvDETjgnbihouJauUXIT/dkpJq2ETcxeWYOBZxs6k0T/TxR0Qpuj/4B1+T7U/LjJnbSywC8eFrum+1lA/nYvJ9mEkhiZCJ4jjSjZ1xkyjszCsqfb3Pb4JdWGbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+7OuLM8ujWFjQdwdbY3VEN6ufQX8/ZTtd1lIhEbSQ4=;
 b=TBFeKYmmrbOpV4XuqpPg3HtCGE6OflcLrss5ykDOuSdUk1A6COFMtm73DjmO8Mb/eg/MNkRsCj2pIP4Q/2N9khPMn9FrCUYcLWoYd+oA0E5Wcl/UBX5bV0p4eNuff9FfXtKxcDUaIeDPtjbD7BdspRaL2J+FvnL5jCOuu1tD59pNZvynDgL336YFqKJzaR4VL4HASZgqBdBiP9FT6A8lnsiVqljmZNHo4FRtdu75befVXADrja8I+4SaD4Qp6lHagMzSGP8No4tq+gpC2utAcZH1NoeJhO2TuLoUMze8N3AArFTZ59AA2TDNsc0rmOci/XqhUwzZZR7R2mn4OZjq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+7OuLM8ujWFjQdwdbY3VEN6ufQX8/ZTtd1lIhEbSQ4=;
 b=tUaAXX5gQZxplhnjE1+pTJYcKZQZfdaRmznsdgzUhAQ7EopFf0wo5U8vlRFpkEoPFx0sYKnRcDJMkFfuEnER3/t1L1T2W1WMbEVRwlUl1qfG1A3YP6yWH5ITadgiNwBJWasqa8+fHTKxOIB3lPqv+9GxhQQiIkqxLaC6oluA8bk=
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
Subject: [PATCH v6 6/8] tools/xenstored: Rename dom0_domid to store_domid
Date: Fri, 15 Aug 2025 17:35:54 -0400
Message-ID: <20250815213556.90068-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|BN7PPF0D942FA9A:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9fe8a8-1dbf-4d4e-ed8b-08dddc43b9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MbBCNNumPkrTmmvRgd6QWWtH5JAcC5erQ15zNCyzF3R6+b8djx3QMqq4Gvkb?=
 =?us-ascii?Q?fkx2cOd+mesLVedJPumA8gt9ZB2Mmb85Nuy2rU/F2EuC2iapfYH1sDUmfnTV?=
 =?us-ascii?Q?ExBDoag+WhzTZtt/wKCF/rHuuH8/nQ/6XlVHd/3dZgomG6X56XgBl8qOSzOO?=
 =?us-ascii?Q?gsbJ/vlaA8P6hrXCASCPeYKbqi/1CFjOwL415hZcMziAvkS+nhCJ3c1kzeUU?=
 =?us-ascii?Q?isxQu1N/21ttsFK7CcEkmhWgInwKPKcmhcbHeRLtavYyuji/gKjgQdu8ufQq?=
 =?us-ascii?Q?9dCXVFIT4R+eQ8isMW0NJQu7eOIL5kYrqB+TKVlhwBeZz6vCB1HrDjohLnNe?=
 =?us-ascii?Q?Xuydj79uchjjEPZWrizhQnN7bbfarZah76EYy+kZaoUKuFVvjIodAUfvOlZt?=
 =?us-ascii?Q?aXSETHv//7vp42nIs2/tZzlq36fRz9rMrFR9BYoZRj7SA6z1bNH9OPe7Nm0J?=
 =?us-ascii?Q?V/pmjRWts5ujKC82HhDuZOeWVtz/1Ss/KxzM6EaYInn+qBwLxH/YxsmPmJYx?=
 =?us-ascii?Q?fT9WS4aVRkMnSualXUua58W+rR9dBMlsNcXohwjby2E2PS7Aala0nhafWuo8?=
 =?us-ascii?Q?4EzYzBU9ai2qO/3Tr8B6jWcsAmMJxOXTNa8jfu81DcLqIsiJWkR09TvD2GZ5?=
 =?us-ascii?Q?cIMVox42JmOP82SWOpHcxhSk2ZK/MbEUuvxW74YQIc2Eygv6CEjceCH08MPM?=
 =?us-ascii?Q?wqcNs5zz+rrqzJyDnp1n68GmIPugh8HH98j7iRxeR2ahfGgHrNmLf2PnBCic?=
 =?us-ascii?Q?ZAoxTiNYdZCoBp0OlZKbpDd+PnqTMLVyEqbHeSozIW+23un+SJwTz76rdsKA?=
 =?us-ascii?Q?B+ZMZ+r42xqIsrdQYPR5KSRZnsAzpPPQ99RPVePCp8snj2GYMLTknJI5gPEX?=
 =?us-ascii?Q?r3qLwtpJthp0/jtmZFIpFM5nTVy6vEZV4+OFZVRFSmXrvH0lfdZKB75wNrPh?=
 =?us-ascii?Q?wMGmMRVEa4VlkavVNNy1CB5cLvBGMvfAZfX+VMvCnqYSzBmzxJTIlL+AUWWj?=
 =?us-ascii?Q?P8jpSf7NcSt9tNt+LqWBgtrtBMo2q1m8zHxE9qJmGzwpaBVQEjEhck5MZBsK?=
 =?us-ascii?Q?l/MBDzh/k8viw3INOPIDM4lTRhoOUD4txu9kHU8dnCecdCNyDnVeRAcyInt9?=
 =?us-ascii?Q?OF85+IbZDo82F42X+6Z+VcRWbNqsqSNxVt6TOP+Yw0NJnvvREY/wsPatQqIJ?=
 =?us-ascii?Q?u6nSmEKxZXofnOoZNeNpA6kqO/7UmLjeKL7kzADDgbN9fMoZqBT0ukgt8pXY?=
 =?us-ascii?Q?4qUY+F/OgH4jycH0juPnK5ZQ0LEfb1vPKUlM4W6bLbPP4CX8RD+J70hwDfYZ?=
 =?us-ascii?Q?49y4ilkhCK3/ZSslzUwahQIg6216ecGRio9Pc89s1uNfjG+4I/fxMi1qBwl5?=
 =?us-ascii?Q?tfWQnwD8mg+tHphawyzhU7Xh+WUB2ZhviJUepwz6f+GAaRCdLEiBkwHEXpCR?=
 =?us-ascii?Q?DOPc2ArlzzMvS8CSsZUcQLiPnkWLkei3GNkEQ/eyGcP4U6/xJyzyX9/rQ1Xg?=
 =?us-ascii?Q?phJ4wPTuipijd6XfJFVazxS5KBr01lrrmz0a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:59.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9fe8a8-1dbf-4d4e-ed8b-08dddc43b9e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D942FA9A

The dom0_domid variable is misnamed and conflates purposes.  If we have
xenstored running in a Linux domain that is not dom0, this variable
controls the lookup of /proc/xen/xsd_kva and the event channel.

Rename to store_domid to better show its purpose.

One implication of this change is that the xenstore domain is not
privileged by virtue of considering store_domid as privileged.

domain_is_unprivileged() removes the dom0_domid/store_domid check, so
xenstore domain is no longer considered privileged.

onearg_domain() is updated to return EINVAL for store_domid or priv_domid
to maintain the ability to call XS_RESUME.

xenbus_master_domid() is removed with store_domid being used instead.

Add a description of the -m/--master-domid options while
doing this.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v6:
R-b: Juergen

v5:
Remove xenbus_master_domid()
domain_is_unprivileged() drop dom0/store_domid.
XS_RESUME/onearg_domain() check store_domid || priv_domid
---
 tools/xenstored/core.c   |  9 ++++++---
 tools/xenstored/core.h   |  6 ++----
 tools/xenstored/domain.c | 14 +++++++-------
 tools/xenstored/posix.c  |  4 ++--
 4 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 7a65ddb585..64c478a801 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2539,7 +2539,10 @@ static void usage(void)
 "                          allowed timeout candidates are:\n"
 "                          watch-event: time a watch-event is kept pending\n"
 "  -K, --keep-orphans      don't delete nodes owned by a domain when the\n"
-"                          domain is deleted (this is a security risk!)\n");
+"                          domain is deleted (this is a security risk!)\n"
+"  -m, --master-domid      specify the domid of the domain where xenstored\n"
+"                          is running.  defaults to 0\n"
+);
 }
 
 
@@ -2567,7 +2570,7 @@ static struct option options[] = {
 #endif
 	{ NULL, 0, NULL, 0 } };
 
-int dom0_domid = DOMID_INVALID;
+int store_domid = DOMID_INVALID;
 int dom0_event = 0;
 int priv_domid = DOMID_INVALID;
 domid_t stub_domid = DOMID_INVALID;
@@ -2736,7 +2739,7 @@ int main(int argc, char *argv[])
 			dom0_event = get_optval_uint(optarg);
 			break;
 		case 'm':
-			dom0_domid = get_optval_uint(optarg);
+			store_domid = get_optval_uint(optarg);
 			break;
 		case 'p':
 			priv_domid = get_optval_uint(optarg);
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index cef3c71eb0..e0b48e4978 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -365,7 +365,7 @@ do {						\
 		trace("tdb: " __VA_ARGS__);	\
 } while (0)
 
-extern int dom0_domid;
+extern int store_domid;
 extern int dom0_event;
 extern int priv_domid;
 extern domid_t stub_domid;
@@ -382,11 +382,9 @@ uint64_t get_now_msec(void);
 void *xenbus_map(void);
 void unmap_xenbus(void *interface);
 
-static inline int xenbus_master_domid(void) { return dom0_domid; }
-
 static inline bool domid_is_unprivileged(unsigned int domid)
 {
-	return domid != dom0_domid && domid != priv_domid;
+	return domid != priv_domid;
 }
 
 static inline bool domain_is_unprivileged(const struct connection *conn)
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index bcc63104b7..e282b5c5ed 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -509,7 +509,7 @@ static const struct interface_funcs domain_funcs = {
 
 static void *map_interface(domid_t domid)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == store_domid)
 		return xenbus_map();
 
 #ifdef __MINIOS__
@@ -524,7 +524,7 @@ static void *map_interface(domid_t domid)
 
 static void unmap_interface(domid_t domid, void *interface)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == store_domid)
 		unmap_xenbus(interface);
 	else if (domid != stub_domid)
 		xengnttab_unmap(*xgt_handle, interface, 1);
@@ -1158,7 +1158,7 @@ static struct domain *onearg_domain(struct connection *conn,
 		return ERR_PTR(-EINVAL);
 
 	domid = atoi(domid_str);
-	if (domid == dom0_domid)
+	if (domid == store_domid || domid == priv_domid)
 		return ERR_PTR(-EINVAL);
 
 	return find_connected_domain(domid);
@@ -1381,14 +1381,14 @@ void init_domains(void)
 			 * have 1 domain.  stubdom there will be dom0 and dom1,
 			 * so this will take the second for stubdom.
 			 */
-			dom0_domid = domid;
+			store_domid = domid;
 		}
 	}
 
-	if (dom0_domid == DOMID_INVALID)
-		dom0_domid = priv_domid;
+	if (store_domid == DOMID_INVALID)
+		store_domid = priv_domid;
 
-	if (dom0_domid == DOMID_INVALID)
+	if (store_domid == DOMID_INVALID)
 		barf("Could not determine xenstore domid\n");
 
 	/*
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 4a97f53dc0..0ec7babb7a 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -174,7 +174,7 @@ static evtchn_port_t get_xenbus_evtchn(void)
  */
 evtchn_port_t get_domain_evtchn(unsigned int domid)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == store_domid)
 		return get_xenbus_evtchn();
 
 	return 0;
@@ -280,7 +280,7 @@ static void accept_connection(int sock)
 	conn = new_connection(&socket_funcs);
 	if (conn) {
 		conn->fd = fd;
-		conn->id = dom0_domid;
+		conn->id = store_domid;
 	} else
 		close(fd);
 }
-- 
2.50.1


