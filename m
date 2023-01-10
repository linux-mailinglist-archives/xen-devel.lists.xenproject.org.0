Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE566663BE3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474430.735623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOZ-0006To-22; Tue, 10 Jan 2023 08:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474430.735623; Tue, 10 Jan 2023 08:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOY-0006QV-UL; Tue, 10 Jan 2023 08:54:10 +0000
Received: by outflank-mailman (input) for mailman id 474430;
 Tue, 10 Jan 2023 08:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOX-0005s6-5v
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:09 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061.outbound.protection.outlook.com [40.107.249.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57c40165-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:08 +0100 (CET)
Received: from AS9PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::25) by PAXPR08MB7646.eurprd08.prod.outlook.com
 (2603:10a6:102:241::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:05 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::e4) by AS9PR01CA0020.outlook.office365.com
 (2603:10a6:20b:540::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:05 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Tue, 10 Jan 2023 08:54:04 +0000
Received: from cd1a513c34a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 736A2ED2-55B1-41D7-A47A-6BC14235A46A.1; 
 Tue, 10 Jan 2023 08:53:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd1a513c34a0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:53:57 +0000
Received: from FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::11)
 by AS8PR08MB9315.eurprd08.prod.outlook.com (2603:10a6:20b:5a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:53:51 +0000
Received: from VI1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::73) by FR0P281CA0063.outlook.office365.com
 (2603:10a6:d10:49::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:50 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT014.mail.protection.outlook.com (100.127.145.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:50 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:48 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:45 +0000
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
X-Inumbo-ID: 57c40165-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmYoezE2IW59ME1CxZnlcTEIFj+1tLggVIMbia4uvmE=;
 b=S+xLDEACULP7+KdH+nj/G3VV5LHgo4ymITLwjnMgopxVbrXQXWhbUyVRz9ogi53sk2bNSHD7T/TGduW+f/9T00ohftgTkiuDvUHGYD5oXeN2++KvwKo2agN5w2ycRJ/mA9Sn5qmzfO9hXnC7+yleeh1mNMmfODCpbvjGACVDPU8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83c795689737a32a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPYvj2k1Lj2CdVKjNkT7p0alj6ZJiiZyFUrQ0HV4Mmtyd1ese3R+OykyIpydt7iUFzgnIdYeXmBQLelrIl9+PnlKb3aaIDNnTBrb0FWosBzCdHcwihxA5FbmT2HiQYLSVK01XAOb3Y5RwrWpuO+7SGLqTefQQiPaPNdXrEXHwIaF5vo+MZNH6CBS0AdYcMU2zNsOLcN7vuWc3jy5affe5q1b29n4pFcSweETtkDoucXGhY8VPRv9XG87iQiIWtaY8KgMKFFtu6f5HslJE1kLQeJJxbKFG+dex3stozwASNCHqAf1e3fa32oAtzl9KI2JMOsgduzSPvzjnHHFKiUyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmYoezE2IW59ME1CxZnlcTEIFj+1tLggVIMbia4uvmE=;
 b=aCKm87ysa2saUVVLDBReWk2HgbAmJVGPn7fGA0UPXpPL9r7BZFJicp7bpp3ugFFaUGQfdM4NT+rlpLb7wYqXL8iseW38JQQHtCooDPJWw/zLq2G+LOHFPNCSUPs9f8GJNfmI0Wf051UFhsE6H7J0O4cdKvdvoPD4wpbPT8qncDiEvTFHFRV9qFfRiSeXzaRv9xq7JOo/CCt888ICD6/p2RKhfpISLuE+z37uasNRZ2SGG8QQFq/Qn/65D9wYRKZCj+LVF0hGLP4x/YSE6OZ0uXXf0NF9BbZsA0b09Z6bTrX95BhGXpc9W84x1+js5Ym3VpbZSPl68BzSSs+gMbkMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmYoezE2IW59ME1CxZnlcTEIFj+1tLggVIMbia4uvmE=;
 b=S+xLDEACULP7+KdH+nj/G3VV5LHgo4ymITLwjnMgopxVbrXQXWhbUyVRz9ogi53sk2bNSHD7T/TGduW+f/9T00ohftgTkiuDvUHGYD5oXeN2++KvwKo2agN5w2ycRJ/mA9Sn5qmzfO9hXnC7+yleeh1mNMmfODCpbvjGACVDPU8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 02/17] xen/arm: implement helpers to get and update NUMA status
Date: Tue, 10 Jan 2023 16:49:15 +0800
Message-ID: <20230110084930.1095203-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT014:EE_|AS8PR08MB9315:EE_|AM7EUR03FT008:EE_|PAXPR08MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d688aa0-011f-468c-06a2-08daf2e83a58
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bTZm+HdFMjwpjFhk74ZmuJGg3uJLNaJNRMl7VjLMOaUlJGDCQ0bWSEj/1dMcyUn0K24XpZVKImbVi4f9ymRMHp/qiagmo4jJ1BkkLQU40ZEcPIg6HqZIUQHWtaEJQlNauWimUUHaks2nwBCa0rO4Nd8+x7/G3vDwhUQcGzKg3aOE8csafVk2vNtVboeqxB/rPA4hlpTOD8a8GWB1z/QR98Dusg2pleIPFZ0WIb9RcOdsaxpERwWejbTE8mypQ26I3u6qB4o5+vxtup5eRJcxOsOvMEqk0cVxXo0QQaXH5eEF5AztxTQgj0TJLm7xly0c+xAYrBbsq6Mkkuc1wt6JEymO9ZlCvda+slC5f5qizknvzINBR1TpHtgXM1MHcR9VnYAPzd1Qm/8viOxuynD9NrD1mEBvXQN55ZuHkIAa5vcuPgLJYevQIbJ0rwd4WDiZnIxNb5tTB4ho4V9NtuO0YkmGXL+wHIhP5nmTOwK1sxvuK6kHK52JBvCOsemSZkFHRRiOQHiUfxBpER8TvGqlq1F/gO69QUpssYTMPmk0nO5eAAWccnJ9WRuscqARP8+DLw/IFPcdSrtVbYlZiq0QZBptM2PrFgfozIcJt2JtB91eFvP+iWcj7clzkh+vqBk1/9GBY4TXbXQHEJI3lwtpC+zgAg8aGkKKgwTLf3AiDAygTmbM8yUTT0WSfgYiw0hU8+aFyU+3UEkwHZrMpwX65fNr4Ywe9D/u23QFOvPsl3R0WeKrdJXU8C4Kt37bmS94
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(46966006)(36840700001)(356005)(81166007)(82740400003)(36860700001)(6916009)(41300700001)(8676002)(4326008)(54906003)(70586007)(86362001)(40480700001)(44832011)(8936002)(5660300002)(15650500001)(1076003)(83380400001)(2616005)(47076005)(336012)(426003)(186003)(26005)(7696005)(478600001)(82310400005)(6666004)(2906002)(316002)(70206006)(36756003)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9315
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c62addc-70e8-4869-cea6-08daf2e831a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JQG2fUK/dot99yd9QECpImJCMJouuwXf4n5gOoRIOxfRxI6U5YDUNguNm4rOeUsBKfHahET3UpoGq0XTBFPNSDH9K9DuE4OY7xtlVPG5rlnUVbvu9OTYJEWaD4IDFUwFfpZVEsd8WtuJwZuy9c7bPEI5EoXfixMZmJGFaWO8A5ltQOsm0dG0Ngl+d40iZfmoIuA1HE5+y9MQALfVGSZH9Q+4VLUe/KPJHEW2DJnJeFKtTHmSXcefbaKnO3sxiAf9+X8EV+1pACTje19/Mm2r5mFU9QDCZ0MxAhz32q5YjkRdRyWgzlx1vz+JEjdWol0AjQ1gRaHUT8U+7vnwmLAMFkaM7g8UQ5e6nrq6VZmY8eeuyyf/Bnwe70ktAZ9knirYqSlTd+4xuLJWaRKSx+aJLcIWaJdpZVfpWorSG+R8rthp9yYj97TXtsBu+wjoEGWG/9qSx6MlpaF38Ac4YkAfSV0j01gQaOCkHXHh7miLuN3iXAKA1uwKnzf9orGSVBVsZKqwxY0+iCuukHmuus7wGcWN4Jikdar8QrdTDGknSmLX2UJYDM8gSKWo5sL3Vv1M7b0eDqRqdrkPVW6KypYqMZXbFY4f3TNJrxN0AW2tM5i/6ctA/GHX531o8wIt9CvxEv9wY9hpKLdmHK3voUmU7j1IJdOK91dPe8pcr0tIWNc/JtZVB+GMcheUL4Grj7I0XASAmLn5issHE1vJfbNQQQCeRzc9+haf2mIYxhecDjzsAcRk7symhfQEh80I0vGa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(426003)(82310400005)(47076005)(316002)(86362001)(54906003)(6916009)(36756003)(40480700001)(7696005)(81166007)(107886003)(82740400003)(186003)(336012)(26005)(40460700003)(2616005)(1076003)(2906002)(44832011)(478600001)(6666004)(5660300002)(15650500001)(8936002)(36860700001)(70206006)(41300700001)(4326008)(70586007)(8676002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:05.1059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d688aa0-011f-468c-06a2-08daf2e83a58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7646

NUMA has one global and one implementation specific switches. For
ACPI NUMA implementation, Xen has acpi_numa, so we introduce
device_tree_numa for device tree NUMA implementation. And use
enumerations to indicate init, off and on status.

arch_numa_disabled will get device_tree_numa status, but for
arch_numa_setup we have not provided boot arguments to setup
device_tree_numa. So we just return -EINVAL in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use arch_numa_disabled to replace numa_enable_with_firmware.
2. Introduce enumerations for device tree numa status.
3. Use common numa_disabled, drop Arm version numa_disabled.
4. Introduce arch_numa_setup for Arm.
5. Rename bad_srat to numa_bad.
6. Add numa_enable_with_firmware helper.
7. Add numa_disabled helper.
8. Refine commit message.
---
 xen/arch/arm/include/asm/numa.h | 17 +++++++++++++
 xen/arch/arm/numa.c             | 44 +++++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/numa.h |  1 -
 xen/include/xen/numa.h          |  1 +
 4 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/numa.c

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 7d6ae36a19..52ca414e47 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -22,6 +22,12 @@ typedef u8 nodeid_t;
  */
 #define NR_NODE_MEMBLKS NR_MEM_BANKS
 
+enum dt_numa_status {
+    DT_NUMA_INIT,
+    DT_NUMA_ON,
+    DT_NUMA_OFF,
+};
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
@@ -39,6 +45,17 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+#define numa_disabled() (true)
+static inline bool arch_numa_unavailable(void)
+{
+    return true;
+}
+
+static inline bool arch_numa_broken(void)
+{
+    return true;
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
new file mode 100644
index 0000000000..1c02b6a25d
--- /dev/null
+++ b/xen/arch/arm/numa.c
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Arm Architecture support layer for NUMA.
+ *
+ * Copyright (C) 2021 Arm Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include <xen/init.h>
+#include <xen/numa.h>
+
+static enum dt_numa_status __read_mostly device_tree_numa;
+
+void __init numa_fw_bad(void)
+{
+    printk(KERN_ERR "NUMA: device tree numa info table not used.\n");
+    device_tree_numa = DT_NUMA_OFF;
+}
+
+bool __init arch_numa_unavailable(void)
+{
+    return device_tree_numa != DT_NUMA_ON;
+}
+
+bool arch_numa_disabled(void)
+{
+    return device_tree_numa == DT_NUMA_OFF;
+}
+
+int __init arch_numa_setup(const char *opt)
+{
+    return -EINVAL;
+}
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 7866afa408..61efe60a95 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -12,7 +12,6 @@ extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
-extern bool numa_disabled(void);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index b86d0851fc..7d7aeb3a3c 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -55,6 +55,7 @@ extern void numa_init_array(void);
 extern void numa_set_node(unsigned int cpu, nodeid_t node);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 extern void numa_fw_bad(void);
+extern bool numa_disabled(void);
 
 extern int arch_numa_setup(const char *opt);
 extern bool arch_numa_unavailable(void);
-- 
2.25.1


