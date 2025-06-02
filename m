Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61391ACB5CE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003585.1383157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6nK-0006jR-AL; Mon, 02 Jun 2025 15:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003585.1383157; Mon, 02 Jun 2025 15:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6nK-0006gW-7Q; Mon, 02 Jun 2025 15:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1003585;
 Mon, 02 Jun 2025 15:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yeyf=YR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uM6nI-0006gF-I8
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:09:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2417::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cc6ca7a-3fc3-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 17:09:43 +0200 (CEST)
Received: from MN2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:208:23b::23)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 15:09:39 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::1f) by MN2PR11CA0018.outlook.office365.com
 (2603:10b6:208:23b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 2 Jun 2025 15:09:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 15:09:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 10:09:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 10:09:38 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 2 Jun 2025 10:09:37 -0500
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
X-Inumbo-ID: 9cc6ca7a-3fc3-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRZRgSAPrbhG0HCC3nAJnpJCtpuwVtdJiGv33WoufjT/q0giE32mddzjUdAUKK0u9yaZ7gbFAu9u/Mwh2ILB0uvQXMLTDJtGvDCdj77wyKB6q/0U0XtUWRy3ZLvLzxSMuussX4Akdwt5d92lfeDY614VeKPxiXmti3TzKhoXT1wvKxHmiq1QDfKkxGNJeNr2Op+DlSO/7aaErLT0aF9k4GphvHD3ergRTP7fPMaAf8zq7N5+vvJh/xWv3Ay+w/ILC0EkJWFDL27L/2/t4dPCr1N7wXbeoVeZCWSbkIZ22x/q/dXmtcNrLlZI2EqHBW7f97Fz92aeka4KZfAGgcAT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twEqUavFV+a5GkK6oudUB5yohK7XtyF83wD0kvr1NWk=;
 b=FkJjLeRGFjxfeYDweEyEad7dJq9IRXrB6WmYVj+Ng8Sfezj6cKlFmFDRjOqcq0LiTr3DX7DIZpyRAkjZADhUe0pvFyfjQmHMqyShfMUWOocb2rdRoJMJjsoro2xCtJDMEoYjbJTItLMmQEqipbdGXNhmAeVsbX1CwdSKrXCPaRModl80ajjqg4O+/rU06uFUWGuj2pPDLrz+HdErumOqzV5wMe3HR8basPpQEZXOc/0/xlO9+eQcVxCbC3OgJ4P4bRxInd0NSRz2EwQkTlSjrZQev/UXwMh59eJERjQ/B5AKKEgbP5/2YmVeGkg5QlZ5u2aL8KGFzeOqP1IAKu1aEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twEqUavFV+a5GkK6oudUB5yohK7XtyF83wD0kvr1NWk=;
 b=LZ8C1fP1spllQwanyI5wVW/H5Niuogh5HPVW/UKJyJ2Ki1/nm2+unUPK0sV+jotyx5p1tLxMnCDwj+fx3Awmyb4ezkvAbdvpfmNrjzQpmcLOno0c/IuPgLnB3ZCu0iteGtzdYqYzVwMa9uKE+amkR3BFPbXgIDZ25p9eu83Y6g0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
Date: Mon, 2 Jun 2025 17:09:29 +0200
Message-ID: <20250602150929.10679-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed29135-86f6-41f7-8585-08dda1e77e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?80IY62AVazCjmmUFIB/sTTVaM7hgyqOrxlrIx0qYwwujnPF2v3eMiWGwWKgr?=
 =?us-ascii?Q?OMnHUOOs/y2/Bnn3nEDcnssGDORIYfgQ5zSvcjuQzD/No2kq6y/p6iJHE8Lp?=
 =?us-ascii?Q?rYe+U57u8J1ygFHAcj6vFhV+937mbKP0M04B9ZsfC8+/fvoxbnDNFX0meGbA?=
 =?us-ascii?Q?eTJGBuOyBeU+S4tW0m6RjzBaR9BOXDmXQ+3QeCB39ru3VmXu67inNcWclxzW?=
 =?us-ascii?Q?NAHBjsUH3IOVz49qVVPTtf4mkKi4fRe/pg4oBqhKRHZre4napUADm2NzZr40?=
 =?us-ascii?Q?7jkC3Q9/4ZgPZbkx4QaOmPjoZ6AYhy2z8HljvQ8p3q/2sLN0JfHtgIRJi+eQ?=
 =?us-ascii?Q?e1D3Y37mAa5P7qJV2Rs214Bd9f3mi8Mm5+TU3eKr21SmDyZoByNRyvIqA42N?=
 =?us-ascii?Q?tVp/OngE4rwe8n8Bwa1dNmkPa3OPZAo7simvnsOAjRUx5JycVchnCA0P81Ja?=
 =?us-ascii?Q?RhJxNzSOIS7Aa4PID+Vm62RuoK6vcZDoQKjHdUWtnJzyC3tm/Q1U15W53ZOb?=
 =?us-ascii?Q?8yQl9c5Fpejb6x2TWyKk9TFs30g5i8nZ1uZOg5tH9G2rFS9nncH8LANzseLO?=
 =?us-ascii?Q?P9r1fEjfgwYSBuDWGr7Oza/QS8te4+lg/MkDRN2vcVVy/9pIqrXgM0O4ZC/Z?=
 =?us-ascii?Q?IgLH86QVrsevnKkqNjEBbgIkX8qDkEaJ1/6B76wNjJG9urn4z74+Ob/aAdMs?=
 =?us-ascii?Q?N/23SDp5miDCbqTxdFrvbPXAr65fTSwejoCqo0NuO5DE17C6skDKJexuvoVM?=
 =?us-ascii?Q?RHoP8gfxJunQ/aPkLxbGJbejtbABR3I4PuZV36yDpKASfpzezwmM46b8LuRg?=
 =?us-ascii?Q?FHnqZR4VeflJ0TwUeZDYG7FvZf57MIzYLTVXasH7egj/i+KZlNbvME5Qwuls?=
 =?us-ascii?Q?15Qcd2Pu8gr3ECKYzJvBUQbqE4n9lzWTqOgVRhu/B21lMPaQj8+pNZlZLEVS?=
 =?us-ascii?Q?BLqoZ+Yih8FvWjjJI9NaN4hjGSK4yLNhTN899LJxXTnGQjoigxdKykAfnrFf?=
 =?us-ascii?Q?1z/erFxwpO1aZzXEzlIePbvD+0XSMTG8COR9BNhhvNt05n74c+ew3z46/e4k?=
 =?us-ascii?Q?WeuokiyeH3smC12LwHo6sH5reTMopAP+Dw+FWVDkexz1UuYD24HMU6xxFrsT?=
 =?us-ascii?Q?qpH056AqqJ1AucDjUxX4u3bTAXBgl/2UiWGtSHTqLJl2cgHTtLODiCUyw1YV?=
 =?us-ascii?Q?a4/id29idgyRYxIa8Bdb46lE+3wX6/GxRnMtok2zpjEFl8wqnczxkQBJHSod?=
 =?us-ascii?Q?foQiMCpFcw4tj/QYYbbHuc94FgT6wcgT49dPyUOS03ON4qmcQ0KrfWuex7IU?=
 =?us-ascii?Q?O0J0JB7sWsKXXF56ouHpWF4sj9ELpKpU9FRwrREy8PzhmVnR7LCXfKXj5tQP?=
 =?us-ascii?Q?mpTzzgtNsbexe0nHaClzLTN06qL7gU8rqs+dmVbXtYlK8lSo7kNQSNRsHxuz?=
 =?us-ascii?Q?FqqcZdclXoVBZYOYgONqh5qWDU/+X6u9E1dSmwScHGcrrWwvQAzdn3FzlApn?=
 =?us-ascii?Q?B2MKGCwQ6D0yMu2+DKaJe66eawhuul7+R1zS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:09:38.9451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed29135-86f6-41f7-8585-08dda1e77e98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227

These tests are supposed to run on target. HOSTCC can be different than
CC (when cross-compiling). At the moment, tests installation would put
a binary of a wrong format in the destdir.

Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 tools/tests/vpci/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 9450f7593a41..1101a669e118 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -11,7 +11,7 @@ run: $(TARGET)
 	./$(TARGET)
 
 $(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
+	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
 
 .PHONY: clean
 clean:
-- 
2.25.1


