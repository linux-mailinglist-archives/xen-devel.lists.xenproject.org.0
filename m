Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB03870D4
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128605.241415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lirxf-0006km-Ge; Tue, 18 May 2021 05:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128605.241415; Tue, 18 May 2021 05:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lirxf-0006i2-CV; Tue, 18 May 2021 05:08:07 +0000
Received: by outflank-mailman (input) for mailman id 128605;
 Tue, 18 May 2021 05:08:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lirxd-0006hw-9g
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:08:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d7caf99-845f-4c1a-8493-9ff95be76fcf;
 Tue, 18 May 2021 05:08:03 +0000 (UTC)
Received: from DB6PR0802CA0029.eurprd08.prod.outlook.com (2603:10a6:4:a3::15)
 by DB7PR08MB3820.eurprd08.prod.outlook.com (2603:10a6:10:7f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Tue, 18 May
 2021 05:08:02 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::24) by DB6PR0802CA0029.outlook.office365.com
 (2603:10a6:4:a3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:08:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:08:01 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Tue, 18 May 2021 05:08:01 +0000
Received: from db17a58bebc5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60777063-A240-4833-9BCA-4A42F57A272C.1; 
 Tue, 18 May 2021 05:07:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db17a58bebc5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:07:55 +0000
Received: from DB6PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:6:2d::31) by
 DB7PR08MB3114.eurprd08.prod.outlook.com (2603:10a6:5:1b::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Tue, 18 May 2021 05:07:53 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::33) by DB6PR07CA0021.outlook.office365.com
 (2603:10a6:6:2d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Tue, 18 May 2021 05:07:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:07:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:07:52 +0000
Received: from entos-thunderx2-04.shanghai.arm.com (10.169.212.221) by
 mail.arm.com (10.251.24.31) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Tue, 18 May 2021 05:07:49 +0000
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
X-Inumbo-ID: 0d7caf99-845f-4c1a-8493-9ff95be76fcf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/Mv1T2M0Bx1B+fMN0UAjGi/7MkFiN2JRmd2c51npb8=;
 b=HmB2DtkYoYocC8MaPgmA1kB1ldDSiRP0/ruhomrRpX3e68I7Bcgz0A7iSYTHwWLv720uwBB1LCaGKoNWfenruWTfNl7J5fMo8Y4vd39pTgCfq8JvoTw0xaFxpadYGMFMMyXKdrFr3jYMhK1ahZTQRQYi329rd5vN/UcuOXCT96U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f2b5464e4b0ed90
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWB92OENDXoY25hzRFHYLUNn3SYwapYJ03OscNjEHUpaZEucBkpX6Z2DtlxQ/Kankdtb8xfpHIjuLArVxgROTfxiu/+onFO+qnDsBjyw89kn3LyFzljKdvdKvq+/auD4dve8prgIxu1ESumnyYv1mjrW2BIpY4UPl/rRJdomb2So0DbwthVbEgjMYE5bd1qYlaUduJFZBgQ90Rkg45bYi2mImD+L3jBB9n29qMjmeVXq3N5lEP6x2NSQ11Fp4v8vCHKolG827l/JiPv6k+3SmapvFW4oj4tZwntwXjV/YpjkiLzTzBExVuujFR+JVt2wfsihn3jIoa4IGR7hREAb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/Mv1T2M0Bx1B+fMN0UAjGi/7MkFiN2JRmd2c51npb8=;
 b=ZlmugA+oKKzq5Ix+vl9kdgXNXJdA7TOlM8gF5NTai00A+lfyyuhdDVtqdgvJyNELIYPsTozCvEKzZYk13GDZaZqRl077+yGodKKmQJYjd0+hpxntBazYc078nzBENnZB+51mJaroAOlFcXuHgur8QBbtzGa1XKMEG3XAfIoMkuGZcRvdjqU0jmOdGiWlG0fAv6+jXiTybqmOLPXLbfL4LGJWOzbg10r36B6knbx5VkDL2MaIUaLJxzf7oGRNdWElcigf7eajChN2jghUrFLPpQcJdi+lGa0/qCJW/XjNXb5hYN95m858mSE86jM2Q6NvSptYoh4NejHm7v5/nxsg4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/Mv1T2M0Bx1B+fMN0UAjGi/7MkFiN2JRmd2c51npb8=;
 b=HmB2DtkYoYocC8MaPgmA1kB1ldDSiRP0/ruhomrRpX3e68I7Bcgz0A7iSYTHwWLv720uwBB1LCaGKoNWfenruWTfNl7J5fMo8Y4vd39pTgCfq8JvoTw0xaFxpadYGMFMMyXKdrFr3jYMhK1ahZTQRQYi329rd5vN/UcuOXCT96U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH] Xen: Design doc for 1:1 direct-map and static allocation
Date: Tue, 18 May 2021 01:07:38 -0400
Message-ID: <20210518050738.163156-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbe0e276-d68f-48e0-4323-08d919bae944
X-MS-TrafficTypeDiagnostic: DB7PR08MB3114:|DB7PR08MB3820:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB38203B47F5853FDB9E0D1AA3F72C9@DB7PR08MB3820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DrpkQxLy/IdLBKaLAulstC33bldfutzmHbyWk8aC1usWQ/iOZh3GFEW+sk9/cGDNBIdw0inV8C2KZKs0zJjcA13J9WQxDVTzQDrVkplRgavwkqphWd23KQAFnxMZpVaZgrCZRRZ9glxV0tswQHQPY5g7V9yyqPuRSBdgeQPmPk1+x7espgll6BEydH6NkOl725iW2Uh1xhg4i7Kt70ryrzr3mtJ0FBPy4Qzx9jY7mXhTJRv/VesDdnmvYkI9MB9yI1yQiz9HXAze4Yui414VxwJn8HT8EvUMxFCkuDDGguz/NhDDymd3slwc6p+aCluMIiVjZcQtqLCSt8Wl5po3GoO1fUVeKr+PflfRy6oi6j75EjgX4soCvm93tnGyVl4ECZh9O2+6rDN+0MCPMnrxjkKO5MjNSTNXFTx2khbPB9Cp2eZa0gmLtRgk8n023mfUOAeEfMqa3d0fgLFDZftedJ/GOMxB89GzXwhy/urWk9Bzx25S/JcdtfbX5PExrEJoC/F+iWGRCYZ831PSXPDhIv23fwK3D1datqnDuvjgncbddCnvZz1XtAJMbbLKcLobnzYX4HZCz6xMbhXi1Miehkq2RuwqvFVzpd0xb+McpEEV0uE14CvtsH72Ul/dSRxyWgJLLHASKwSAsIvg7WDY6KxhEl2G9CAoXS8vASrn4w4gGyVmOdWm20h4a0gE5tRmyJrrGvQG1l2pb+iWkdn/Y6Qnq97/sQZHigxBxuj1fjd02Lr3PxDhFpaC2PLdQp/C6/Y1lZLfD0x0xnE79MlG3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(46966006)(36840700001)(82310400003)(7696005)(70206006)(186003)(478600001)(4326008)(82740400003)(5660300002)(70586007)(1076003)(8936002)(86362001)(36756003)(336012)(2616005)(6666004)(316002)(44832011)(8676002)(47076005)(426003)(26005)(83380400001)(54906003)(81166007)(36860700001)(110136005)(2906002)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3114
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	856b2ac4-762c-4f04-0981-08d919bae432
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b03BZI//UOyKfD9IqWjp0hbcEzq1g1QlNocVWhhvMQ4qzPdWekz3jYZWy7fworKzOh3jNOELAyRTAsu7mfrnnM+sVG6pNFfvvRyZiQRCDcDNa93xLPrrZLiYY3CtYWx65m0NLKcmsUU3kykv3xfvT/CNj0oaNYZ/+ak9DGVkwsFCcA1QF/qBO3AT53JSbDjdwpXkzUmr3XfSHBb6jCjsfsCNBlF9VxHeUXYrzg30bpygkRIaFHCQR1J7sgSO2EHQmgW9RZD/cPLkZyfJuELtO2w+dbTE5dumKbFcVqFzxKXIZBnt21GAyulPNzoTSlLAvimiZAoJaT3b2CbkpEUpqGgJh0gZYmIQEUIgdQh8l9+nhyl29ZeI9Q6Ej5xFOtKgMaZ6FqwaiuzY8VE3orFnOYPmpouzDzmvloyLYi7/Ikx8lz5dwUc9zvXbDvxL6gcO60R0Mu9U8CnKDzZV5YG3oJ6r/KO6eCfUAbbp2MDGMrXDz1T6BK5/xFGDo+q+UweNK83uyIlozu6X7raBnzNGBjxrLTmqLLp77WnrL3iNZFUBKgXfIT3jzaeBZ5HVqMeRXzsPNY37ehhfHR71dGl0G3dHWyji+H0q8EoknKPxt8bNkdDmQ/v8VH7pcO+324jfNgfFIvDlZTedeOGgC+Ts73NApnGPH4yWrCQv+T4SdSMp7GiDrePPA/F+Rg84Iexts0RSDTfWAytSAhV5/I9X7HLUg8zoXSXPyGbJlweRrRE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39850400004)(36840700001)(46966006)(478600001)(8936002)(54906003)(110136005)(316002)(83380400001)(8676002)(2616005)(81166007)(82740400003)(336012)(186003)(26005)(7696005)(36756003)(5660300002)(1076003)(4326008)(36860700001)(47076005)(6666004)(82310400003)(44832011)(426003)(70206006)(70586007)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:08:01.7722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe0e276-d68f-48e0-4323-08d919bae944
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3820

Create one design doc for 1:1 direct-map and static allocation.
It is the first draft and aims to describe why and how we allocate
1:1 direct-map(guest physical == physical) domains, and why and how
we let domains on static allocation.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/designs/static_alloc_and_direct_map.md | 239 ++++++++++++++++++++
 1 file changed, 239 insertions(+)
 create mode 100644 docs/designs/static_alloc_and_direct_map.md

diff --git a/docs/designs/static_alloc_and_direct_map.md b/docs/designs/static_alloc_and_direct_map.md
new file mode 100644
index 0000000000..fdda162188
--- /dev/null
+++ b/docs/designs/static_alloc_and_direct_map.md
@@ -0,0 +1,239 @@
+# Preface
+
+The document is an early draft for 1:1 direct-map memory map
+(`guest physical == physical`) of domUs and Static Allocation.
+Since the implementation of these two features shares a lot, we would like
+to introduce both in one design.
+
+Right now, these two features are limited to ARM architecture.
+
+This design aims to describe why and how the guest would be created as 1:1
+direct-map domain, and why and what the static allocation is.
+
+This document is partly based on Stefano Stabellini's patch serie v1:
+[direct-map DomUs](
+https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00707.html).
+
+This is a first draft and some questions are still unanswered. When this is
+the case, it will be included under chapter `DISCUSSION`.
+
+# Introduction on Static Allocation
+
+Static allocation refers to system or sub-system(domains) for which memory
+areas are pre-defined by configuration using physical address ranges.
+
+## Background
+
+Cases where needs static allocation:
+
+  * Static allocation needed whenever a system has a pre-defined non-changing
+behaviour. This is usually the case in safety world where system must behave
+the same upon reboot, so memory resource for both XEN and domains should be
+static and pre-defined.
+
+  * Static allocation needed whenever a guest wants to allocate memory
+from refined memory ranges. For example, a system has one high-speed RAM
+region, and would like to assign it to one specific domain.
+
+  * Static allocation needed whenever a system needs a guest restricted to some
+known memory area due to hardware limitations reason. For example, some device
+can only do DMA to a specific part of the memory.
+
+Limitations:
+  * There is no consideration for PV devices at the moment.
+
+## Design on Static Allocation
+
+Static allocation refers to system or sub-system(domains) for which memory
+areas are pre-defined by configuration using physical address ranges.
+
+These pre-defined memory, -- Static Momery, as parts of RAM reserved in the
+beginning, shall never go to heap allocator or boot allocator for any use.
+
+### Static Allocation for Domains
+
+### New Deivce Tree Node: `xen,static_mem`
+
+Here introduces new `xen,static_mem` node to define static memory nodes for
+one specific domain.
+
+For domains on static allocation, users need to pre-define guest RAM regions in
+configuration, through `xen,static_mem` node under approriate `domUx` node.
+
+Here is one example:
+
+
+        domU1 {
+            compatible = "xen,domain";
+            #address-cells = <0x2>;
+            #size-cells = <0x2>;
+            cpus = <2>;
+            xen,static-mem = <0x0 0xa0000000 0x0 0x20000000>;
+            ...
+        };
+
+RAM at 0xa0000000 of 512 MB are static memory reserved for domU1 as its RAM.
+
+### New Page Flag: `PGC_reserved`
+
+In order to differentiate and manage pages reserved as static memory with
+those which are allocated from heap allocator for normal domains, we shall
+introduce a new page flag `PGC_reserved` to tell.
+
+Grant pages `PGC_reserved` when initializing static memory.
+
+### New linked page list: `reserved_page_list` in  `struct domain`
+
+Right now, for normal domains, on assigning pages to domain, pages allocated
+from heap allocator as guest RAM shall be inserted to one linked page
+list `page_list` for later managing and storing.
+
+So in order to tell, pages allocated from static memory, shall be inserted
+to a different linked page list `reserved_page_list`.
+
+Later, when domain get destroyed and memory relinquished, only pages in
+`page_list` go back to heap, and pages in `reserved_page_list` shall not.
+
+### Memory Allocation for Domains on Static Allocation
+
+RAM regions pre-defined as static memory for one specifc domain shall be parsed
+and reserved from the beginning. And they shall never go to any memory
+allocator for any use.
+
+Later when allocating static memory for this specific domain, after acquiring
+those reserved regions, users need to a do set of verification before
+assigning.
+For each page there, it at least includes the following steps:
+1. Check if it is in free state and has zero reference count.
+2. Check if the page is reserved(`PGC_reserved`).
+
+Then, assigning these pages to this specific domain, and all pages go to one
+new linked page list `reserved_page_list`.
+
+At last, set up guest P2M mapping. By default, it shall be mapped to the fixed
+guest RAM address `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`, just like normal
+domains. But later in 1:1 direct-map design, if `direct-map` is set, the guest
+physical address will equal to physical address.
+
+### Static Allocation for Xen itself
+
+### New Deivce Tree Node: `xen,reserved_heap`
+
+Static memory for Xen heap refers to parts of RAM reserved in the beginning
+for Xen heap only. The memory is pre-defined through XEN configuration
+using physical address ranges.
+
+The reserved memory for Xen heap is an optional feature and can be enabled
+by adding a device tree property in the `chosen` node. Currently, this feature
+is only supported on AArch64.
+
+Here is one example:
+
+
+        chosen {
+            xen,reserved-heap = <0x0 0x30000000 0x0 0x40000000>;
+            ...
+        };
+
+RAM at 0x30000000 of 1G size will be reserved as heap memory. Later, heap
+allocator will allocate memory only from this specific region.
+
+# Introduction on 1:1 direct-map
+
+## Background
+
+Cases where domU needs 1:1 direct-map memory map:
+
+  * IOMMU not present in the system.
+  * IOMMU disabled if it doesn't cover a specific device and all the guests
+are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
+a few without, then guest DMA security still could not be totally guaranteed.
+So users may want to disable the IOMMU, to at least gain some performance
+improvement from IOMMU disabled.
+  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
+To be specific, in a few extreme situation, when multiple devices do DMA
+concurrently, these requests may exceed IOMMU's transmission capacity.
+  * IOMMU disabled when it adds too much latency on DMA. For example,
+TLB may be missing in some IOMMU hardware, which may bring latency in DMA
+progress, so users may want to disable it in some realtime scenario.
+
+*WARNING:
+Users should be aware that it is not always secure to assign a device without
+IOMMU/SMMU protection.
+When the device is not protected by the IOMMU/SMMU, the administrator should
+make sure that:
+ 1. The device is assigned to a trusted guest.
+ 2. Users have additional security mechanism on the platform.
+
+Limitations:
+  * There is no consideration for PV devices at the moment.
+
+## Design on 1:1 direct-map
+
+Here only supports 1:1 direct-map with user-defined memory regions.
+
+The implementation may cover following aspects:
+
+### Native Address and IRQ numbers for GIC and UART(vPL011)
+
+Today, fixed addresses and IRQ numbers are used to map GIC and UART(vPL011)
+in DomUs. And it may cause potential clash on 1:1 direct-map domains.
+So, Using native addresses and irq numbers for GIC, UART(vPL011), in
+1:1 direct-map domains is necessary.
+
+For the virtual interrupt of vPL011: instead of always using
+`GUEST_VPL011_SPI`, try to reuse the physical SPI number if possible.
+
+### New Device Tree Node: `direct-map` Option
+
+Introduce a new option `direct-map` for 1:1 direct-map domains.
+
+When users allocating an 1:1 direct-map domain, `direct-map` property needs
+to be added under the appropriate `/chosen/domUx`. For now, since only
+supporting 1:1 direct-map with user-defined memory regions, users must choose
+RAM banks as 1:1 dirct-map guest RAM, through `xen,static-mem`, which has
+been elaborated before in chapter `New Deivce Tree Node: `xen,static_mem``.
+
+Hers is one example to allocate one 1:1 direct-map domain:
+
+
+            chosen {
+                ...
+                domU1 {
+                    compatible = "xen, domain";
+                    #address-cells = <0x2>;
+                    #size-cells = <0x2>;
+                    cpus = <2>;
+                    vpl011;
+                    direct-map;
+                    xen,static-mem = <0x0 0x30000000 0x0 0x40000000>;
+                    ...
+                };
+                ...
+            };
+
+DOMU1 is an 1:1 direct-map domain with reserved RAM at 0x30000000 of 1G size.
+
+### Memory Allocation for 1:1 direct-map Domain
+
+Implementing memory allocation for 1:1 direct-map domain includes two parts:
+Static Allocation for Domain and 1:1 direct-map.
+
+The first part has been elaborated before in chapter `Memory Allocation for
+Domains on Static Allocation`. Then, to ensure 1:1 direct-map, when setting up
+guest P2M mapping, it needs to make sure that guest physical address equal to
+physical address(`gfn == mfn`).
+
+*DISCUSSION:
+
+  * Here only supports booting up one domain on static allocation or on 1:1
+direct-map through device tree, is `xl` also needed?
+
+  * Here only supports 1:1 direct-map domain with user-defined memory regions,
+is 1:1 direct-map domain with arbitrary memory regions also needed? We had
+quite a discussion [here](
+https://patchew.org/Xen/20201208052113.1641514-1-penny.zheng@arm.com/). In
+order to mitigate guest memory fragementation, we introduce static memory pool(
+same implementation as `xen,reserved-heap`) and static memory allocator(a new
+linear memory allocator, very alike boot allocator). This new allocator is also
+applied to MPU system, so I may create a new design on this to elaborate more.
-- 
2.17.1


