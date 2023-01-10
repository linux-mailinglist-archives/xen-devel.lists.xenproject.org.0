Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF1663BEE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474465.735711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPX-0002wI-AY; Tue, 10 Jan 2023 08:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474465.735711; Tue, 10 Jan 2023 08:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPX-0002uV-7X; Tue, 10 Jan 2023 08:55:11 +0000
Received: by outflank-mailman (input) for mailman id 474465;
 Tue, 10 Jan 2023 08:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAPE-0005oC-5t
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2079.outbound.protection.outlook.com [40.107.104.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706f88ee-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:50 +0100 (CET)
Received: from DUZPR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::20) by AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:47 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::fd) by DUZPR01CA0078.outlook.office365.com
 (2603:10a6:10:46a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:47 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Tue, 10 Jan 2023 08:54:47 +0000
Received: from 6209e2cc19c6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5B9000A-951A-4E52-BADB-5DAEA1383FC3.1; 
 Tue, 10 Jan 2023 08:54:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6209e2cc19c6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:36 +0000
Received: from DU2PR04CA0216.eurprd04.prod.outlook.com (2603:10a6:10:2b1::11)
 by DU0PR08MB9347.eurprd08.prod.outlook.com (2603:10a6:10:41f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:33 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::a1) by DU2PR04CA0216.outlook.office365.com
 (2603:10a6:10:2b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:32 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:32 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:29 +0000
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
X-Inumbo-ID: 706f88ee-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCO0fihkDCNBhO3hhRTkyjVzUW8pv9QuwCGAw2orFHo=;
 b=9snf656RL62LLV3QLMlqWRD1bA5sBjsdFifN0MCcM1kyoGFw0u4By3BaDPFZpUWGBxuJGTnPKzMeXGodh6NujH9l7nphIP6Eqd+Q66122+c0bU1bo1s8HH6/cZfDjCGyX2Wp/YTuQIj3kUd84oShKtt98HWrwzT8KxPCcD+mX70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1e887521e64c94f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9RTdtytLXmYRaeWcnThNla6A+vtkm0MCJ05xG4ycM2uUbvMSe+GIjQIwDIuBMNGGsiSYYoCqG3EvEoJYnG21/+bpgpaQonoWoLyQ37gCWZEzaonbkHTs4lWiCVp8Agfgbh6hZVU+WbkmfR0Gfv8TYPumvgu7JZ+NGJ+C3oi8QDJ+cZh8m2JUgd1pv7dgK/z4ytxp03ShKm5fF779FwuCGWEukjPd4saDwnbjo27UVaFQ3YTws98KkmXqAVHS8EugE7iCJYC6wHd2RihHaVgz0DVY4EPmGaRS78nOQ4eZ6COfjSKHCOsYNxuM/L2ukSna+WmE0MhLIrFIUm8/7Fb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCO0fihkDCNBhO3hhRTkyjVzUW8pv9QuwCGAw2orFHo=;
 b=AKNXnO3yPkNYTdleVc27vHUcs8IUpvjA6riOPIOQzNzTCy/8SswijdK/5vpYGBfCsafh1H3twNJnk1CCwCLsDgqr7CAU4A6szPwZg5xtGtZtzzpFqDYmi19loDjJybNI+v3WmNA9ECnb9WeOW6DP+nok58u3qOyQKL4s2/qYkVk74SjCvsyVIloG++ElXl1uU+p709K5GgXlejK/uq1yq7pGBFIqs58T79/XJjwPoQs7lcbn7uPyJ7ePb2HAPOBLr0Luj50TTpJbBK2jhSauzRQMSvz9rBf1f6yGQfFg6oJJ6P8pdfpEwuU1LVG15KdMqdQhYoeTxL2hCQaBKrWEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCO0fihkDCNBhO3hhRTkyjVzUW8pv9QuwCGAw2orFHo=;
 b=9snf656RL62LLV3QLMlqWRD1bA5sBjsdFifN0MCcM1kyoGFw0u4By3BaDPFZpUWGBxuJGTnPKzMeXGodh6NujH9l7nphIP6Eqd+Q66122+c0bU1bo1s8HH6/cZfDjCGyX2Wp/YTuQIj3kUd84oShKtt98HWrwzT8KxPCcD+mX70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 17/17] docs: update numa command line to support Arm
Date: Tue, 10 Jan 2023 16:49:30 +0800
Message-ID: <20230110084930.1095203-18-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT041:EE_|DU0PR08MB9347:EE_|DBAEUR03FT025:EE_|AM9PR08MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: a233f2fa-3505-4379-13df-08daf2e8537d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gYqbdJxhb49crfW6S5nQgUv+h9haKLbcdOx/n4owFnl/MnlejUmKJzuoDv9TxMTMd2nmJiuJWa5+joXUP5YDBGOui1hPv84lfTa7sWIbXbSC6I0Fvk44cfW4zfMy/GbupT3hu5m5cIPh1cvcjmz0eos3FzHhakigrI+wVylRLRC9Kq4H6XHoa7xHRjS9BOi43SlGf9awimkKpK00JU4m9TzpOdg6ySIvzemXwa9J3qKu8huTPvXVY2+96r2195eAEX2UxY8cvPjPVY3Ga/YQjDTG1G1yBc2fwFdZpiCIcOr8F0qFhzJI+6zHhBing5sU+zNgFqXHj0l9Z+geGvHzuYZe3dToka/N0eDToAVctWqc1/JPlMKJobJtwyqwl2LfkVZBDcFjB9OxDKw/ks28KyrgThG8QIaVdoA+5DxIlxJZdTCcWh6i66ykzvxwL8WxZRvU8ZQM3rm0TmNcUib1cUxtXUqTlx0qrLmRL5ltx/xD3p/oRn20q2fIySxS8lZQwWRSWKlnI3dMpI10ucFzHF0sEgyWpSBEMzKv7ipwy4nVODBl60RFVEoX0R0I3h7lchCnVgBi8qtbP0IPzykFAwAGlcVt7dIpd5a1eM+JHfI9wTvwhB6W9wcwZ12zLy2UV+pxwyLXpwymxxOTMervjm1JipskKyUZF0JaTKF0qsvhLDPw+PpkWe/QG/HV699R5lEkDhm+1p4WE+S0DVX88Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40480700001)(356005)(36756003)(86362001)(54906003)(478600001)(316002)(15650500001)(44832011)(5660300002)(7696005)(2906002)(8936002)(70206006)(70586007)(36860700001)(8676002)(6916009)(41300700001)(4326008)(82740400003)(81166007)(6666004)(82310400005)(426003)(26005)(186003)(47076005)(1076003)(83380400001)(2616005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9347
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b91dd04-ff36-4b04-0c74-08daf2e84adb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AWhCG1PH88NBGFSOzjFy6h3+pWSWTjsZHeeH0PagxRz8JmgmAnz/Bn08a+oKGxV69CI4uuQAjcmyKwwQ0rl+DHur3AzklMy9KJF8OE+HB4MDHAN6pLWaSMuqcTNO7NjlRpNILT3fNxOS4CEMO9+uxiqcg3O4j1Y7iDupQbU+94oLSc5G6gq58Vax4ksXwInAIyEA6dtKrMAxOZQIKYA9JCJPExRLonvwIRBoypjGr+r5chc1UphkWxgNHGOM2r4olhW9VWUXHFNPT8wv3MS94Md5cVUky67p6Nx/Dl7bKIk9P5sF2wlk0dBYuZhRJaLjbaUspJmvJEOH9oZZ0m4nLM33H4nJWeRzVysttygn4fG+QWOXGvWB8gIwdENrSIU+94Th18vMSO3QgD9smwt6zLSwD+Qdo2cSi/qvFuG0FwqXrvougE1hnlctXXmGmn1KdoJAbUC22CtDMqQtiHdzIzQyp57zh84zHHVsKtwluyH5ucKRcRaGy8cEdehnL6xA9lKVQCMRRLr57fmel57b7fglHtkJBXn5/70+Qfdd2LpZ/7b9DF7u/fx5sLRnawezXlhSWUUX0Jo5frlEcblEzeHiKewvDxR9VeAzX8HsBSCcR7v1U81fe93WFIyJnM5agyuAXJblE1C2ORfOr5+eCxkJWSSI0ZdX6N7be80+yDOjO9sRHk9YS6GIClWQrzEvTRCK/hVK19pJ+pK5Pq7pOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(1076003)(336012)(426003)(70586007)(4326008)(47076005)(44832011)(70206006)(8936002)(8676002)(5660300002)(82310400005)(26005)(186003)(2616005)(6916009)(6666004)(86362001)(82740400003)(316002)(15650500001)(36860700001)(54906003)(2906002)(83380400001)(40480700001)(81166007)(36756003)(41300700001)(478600001)(40460700003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:47.3386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a233f2fa-3505-4379-13df-08daf2e8537d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6034

Current numa command in documentation is x86 only. Remove
x86 from numa command's arch limitation in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Update Arm NUMA status in SUPPORT.md to "Tech Preview".
---
 SUPPORT.md                        | 1 +
 docs/misc/xen-command-line.pandoc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 295369998e..b73d04a028 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -401,6 +401,7 @@ on embedded platforms and the x86 PV shim.
 Enables NUMA aware scheduling in Xen
 
     Status, x86: Supported
+    Status, Arm: Tech Preview
 
 ## Scalability
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 923910f553..40da980b67 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1878,7 +1878,7 @@ i.e. a limit on the number of guests it is possible to start each having
 assigned a device sharing a common interrupt line.  Accepts values between
 1 and 255.
 
-### numa (x86)
+### numa
 > `= on | off | fake=<integer> | noacpi`
 
 > Default: `on`
-- 
2.25.1


