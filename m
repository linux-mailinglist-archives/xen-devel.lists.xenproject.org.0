Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3F88F164
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 22:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698731.1090784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEk-0001ut-W1; Wed, 27 Mar 2024 21:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698731.1090784; Wed, 27 Mar 2024 21:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEk-0001rp-TD; Wed, 27 Mar 2024 21:55:10 +0000
Received: by outflank-mailman (input) for mailman id 698731;
 Wed, 27 Mar 2024 21:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpbEj-0001dR-BF
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 21:55:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad0e9d23-ec84-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 22:55:08 +0100 (CET)
Received: from CH2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:610:5a::25)
 by CH3PR12MB9396.namprd12.prod.outlook.com (2603:10b6:610:1d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 21:55:06 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:610:5a:cafe::20) by CH2PR08CA0015.outlook.office365.com
 (2603:10b6:610:5a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 21:55:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 21:55:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:04 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 16:55:04 -0500
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
X-Inumbo-ID: ad0e9d23-ec84-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdbN+KDAMkJ62GBrKvkgdKlRnwmIuPg5t6b7rvE1ZshHB+eT4JeBBzUvnO22XAwKzdHGvAmK84YSr6jJJeaMh7W8NOtqYRp1hili94v6QRGfwSYV/L8p7LoZ4n1bPhQC6ERaXjVZNw2EVpD1toKWhfLRWOjemz1vCA0D4XeMabHQX9yuZYlileEkXcg0HuaO0JQNWq/m88zeTjRCHfliifXMNItjkyufli/6+5SyWB+CZX60QhNwDfpllcFiuFZyDYc0OURcIyhzvU6ubZutQN0eJWfA5t6WKtYm8TP3pcYoVZEg7+i/gIhlFByDtLo7d55WdeaZluAW/9j+FlWwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpYFdzJHkuO60SpR1aTtd436m2Cbip6KFJuG8vrlzio=;
 b=GtivoUZaizOp9bN0wYp/dsUIY+aoL5Mj17cirV9DXVWkIkJj82qTxrs7to7VLN+EE8P8HP3W5tQpcnmQ5Qm6LMePx+S0dokTJgLuG1TL3EfMdi8bsHCuyzgLoXjvNDR+wrU5oZmRfXgCmkPsxbW0TnIxbGTgj8uFFLZpyh1DlxY49HJ8Rmrb6huNupAYcgUHeljZG97MXmeWu1O4jsrZjo7cq4s1jMBGLTqwsFMjutFIKWdybP0T6FJaRyfguCVgmhLbrmtfmVbekQYyJ2aP3cdM10LEJl7LDUdv6/oyqY9PEHMeRbY21A4v8tY+vk7xAXTixVdaMUoa4+0ACdQXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpYFdzJHkuO60SpR1aTtd436m2Cbip6KFJuG8vrlzio=;
 b=4rEtW7lutcfQd4P9DP0d/vWgzEnQjcD6Qa+SvNpcLbCOFTFgY54dbLC7OY7GOXOx4hPlQA7dEbi3+SPo02NmUkMgerl9c/TAk4SO07APOnoa7mikLhfs+ksnuh58i61Yp5cRI1eajw9q1cq9U23UyrD2bpkoBus+SiNfpqtuLiE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 1/4] tools/init-xenstore-domain: Replace variable MB() usage
Date: Wed, 27 Mar 2024 17:50:59 -0400
Message-ID: <20240327215102.136001-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327215102.136001-1-jason.andryuk@amd.com>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|CH3PR12MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a330a1-2b12-4784-95a8-08dc4ea88fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	acln6GSUv5TKr2UKAaiFuuljqix3fHDWx+AqVZfdKR6t2R20mSPfCaYEw5m1C7LoIpauVh/CYpKGb0JibrmV4EKzN8bODdvn+AKVLK6zJvhxoPEUNFc3p3oK1XtbSp/eyy0HPt9+4cm2cxw9aoElPzHeMe8+6rc5cf6gCWPyOZtyMUfRFxIAy3fI4iYrj6o5p3/y+V+QynA1JRi5n/nKrr2hpMfVOBqU/Iw+5lsfI899Ax5Jqa9Dsdj5IilS9Lk51bcBrWeCzeAVbp+9efPzMjRcVDv4D9hrxkjwkVYyciOJJHCEWMwXIRlzCZTkP14bb3MaCR2glAjv0E9c9G4XHmT9po0K9KMF++mgnvRXjnn67Ygj4iHeA+WTZ9sfCo0RtwdjC8rjnje7Dqx0kZY/2z7FH7n79wIekSmf+57FGkPqT6OtCK2mx5LpIo0S9KqMBRe6LNOrb6CxD/dwnfCTodKy1xOArFcP4I3/U7zP1pIRZbw+N8+shxHwl2qk1nVCVlMJRk/RvL9qAxL8RPYJl3FcKoLtf572yDNVZVo5tr1pJHQl/i2H3pANxLhvk0m7tXpqInPqDk18zGYo95wT1+Xefo7YTGbQEHCk0vMOo5G/xUqFaFD5QWDM8eUTdnzJv5j/nMbcpHFBuLcZCUATfkDlq2IxSdWB/LKdMpcudPx2ECUKpqYYpIZJPuklA0F39OXJ8ZG1utdbOBuceA/zZHoDFiaqW5Y0crNO4WnKn4HFwCjzHSzGPm0g0kWd9pb3
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 21:55:05.4685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a330a1-2b12-4784-95a8-08dc4ea88fe8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9396

The local MB() & GB() macros will be replaced with a common
implementation, but those only work with constant values.  Introduce a
static inline mb_to_bytes() in place of the MB() macro to convert the
variable values.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v4:
New
---
 tools/helpers/init-xenstore-domain.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 1683438c5c..5405842dfe 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -20,7 +20,6 @@
 #include "init-dom-json.h"
 
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
-#define MB(x)               ((uint64_t)x << 20)
 #define GB(x)               ((uint64_t)x << 30)
 
 static uint32_t domid = ~0;
@@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
 static xentoollog_level minmsglevel = XTL_PROGRESS;
 static void *logger;
 
+static inline uint64_t mb_to_bytes(int mem)
+{
+	return (uint64_t)mem << 20;
+}
+
 static struct option options[] = {
     { "kernel", 1, NULL, 'k' },
     { "memory", 1, NULL, 'm' },
@@ -76,8 +80,8 @@ static int build(xc_interface *xch)
     int rv, xs_fd;
     struct xc_dom_image *dom = NULL;
     int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
-    uint64_t mem_size = MB(memory);
-    uint64_t max_size = MB(maxmem ? : memory);
+    uint64_t mem_size = mb_to_bytes(memory);
+    uint64_t max_size = mb_to_bytes(maxmem ? : memory);
     struct e820entry e820[3];
     struct xen_domctl_createdomain config = {
         .ssidref = SECINITSID_DOMU,
-- 
2.44.0


