Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F161530982
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335351.559517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1W5-00087m-J2; Mon, 23 May 2022 06:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335351.559517; Mon, 23 May 2022 06:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1W5-00085W-F8; Mon, 23 May 2022 06:26:09 +0000
Received: by outflank-mailman (input) for mailman id 335351;
 Mon, 23 May 2022 06:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1W3-0007pn-Ny
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a16bae3-da61-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:26:06 +0200 (CEST)
Received: from AS8PR07CA0054.eurprd07.prod.outlook.com (2603:10a6:20b:459::32)
 by PAXPR08MB7549.eurprd08.prod.outlook.com (2603:10a6:102:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 06:26:03 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::c0) by AS8PR07CA0054.outlook.office365.com
 (2603:10a6:20b:459::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.12 via Frontend
 Transport; Mon, 23 May 2022 06:26:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:02 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Mon, 23 May 2022 06:26:02 +0000
Received: from b2b1ae26b73d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49E9562D-944A-4F42-8459-EA8E520D366B.1; 
 Mon, 23 May 2022 06:25:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2b1ae26b73d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:25:55 +0000
Received: from DB6P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::25) by
 VI1PR08MB4302.eurprd08.prod.outlook.com (2603:10a6:803:fb::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.17; Mon, 23 May 2022 06:25:52 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::6c) by DB6P191CA0015.outlook.office365.com
 (2603:10a6:6:28::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Mon, 23 May 2022 06:25:51 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:25:51 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:25:50 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:25:47 +0000
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
X-Inumbo-ID: 3a16bae3-da61-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fb4hL0yc09MLsc5zFMdAdz3FRS2CMqlYrpjijDzFgp4vypMRT6ZWxGCaRILJba5L3BRx4A3iVRKTsxMbmF/7uCuvgBD7RLHcQM2v7yPyYHssl6JtbEblpeycMLw1Zu+i4Z2IiQZncC9MFoEg+9pUkvRN/EV4+XUep5Wtklq6UXClBTBMurygzoj1E6xWWmAxTamaQQ8oVgfFvch+njX4GoxcVFVgzi/xgcHtVTYL5JlT2/jMQTfsldfnCZmeKUQ86aTJRpI8paajrWiSNNy2P+j1DdnFejsDlF/9o7NOOHYJVl6bsMJV8FuxIzLJ4qgJacVMkMztdF+8wg/TEnZOAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oo+mgb4JbHlmUNvz//rcx4bdSUBO9I8LAbHX+BGSbl8=;
 b=C6ey0GQe3dQ6sDy+bFe0OmrBZsl67YT3MOJYftRdhkJvEpALVxA8iX7jpvVuNmuDEOG8jiDeWWwehCeqZeZCJVgpzx7QyEW6wWXkvaiXxGDSGtSEn5Yr86mZvuDSRrm5isA8RgDW2V8i67Ggn+cVESpKY2M8GzsIfqKesmgPnu0JN3E0GRxkVffemqLrecDH0UalbQYG2hvoykOnIqioHNkd7iS940J8iTo2ypTrgmJFylhaXqFKVZoDAUF/9yjTq4uh7VaWvRqjezLRbrKuiXldrgtI+EvOvXKVTLpWPNe29VLymK6G/8ICXXMIZhAJU4iYBl9Gy0//3XMnc5GJpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo+mgb4JbHlmUNvz//rcx4bdSUBO9I8LAbHX+BGSbl8=;
 b=naldSN/AGHLaBYh1998QuFBtcCjP00xCEuLo1/iN/nL/JpwVveuXzJhPpPo4EWe2PO79lxpRIsg/jPF4LGvHaXc1I9e/djX/FVvX3HubpxhRhIebzNRa5jhTRF1ObgvbYWrW+CNd8MBzV5stmzLxOX7VfS1n7rfZaELxQTqtHag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10ac714f71a4c7c1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib1MBpQnmeGgtnymx/w4iwDdthDhyeILfda7T3zsGU4xk6r+QO2FoucSIAGNZsttkdYwTE+MytyPb2Yaju1aThdTa678jIH8J63TMDvXv4dfc8YgK0w+2B5KwvhRYhurPHO4QPtJf7U32CtqHeDqpTi2rTGF1R/DfJsOMI7yHY0Cedi/w962zssC3I6msAeTKXbRJANRJYkY69Dg83Xm3OirRvYFdNtZWphnbowGgrFGQmfvFO5f14LsdBhRoCls+RhRRPTlptpGoD6dr1Pabu6boZm60rYsaCNU9W590aLlxoFAkwkTgG79zpK0erccVipHqQjur6fQWNk0X8kvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oo+mgb4JbHlmUNvz//rcx4bdSUBO9I8LAbHX+BGSbl8=;
 b=XdmlnRwpK7W9eKfvbtLlNcPxCv5xnwt22rLyJT6mXaKeiN6psNuFm+Z/+WRjBKAYn/bLfVyKenfUSyLPxKkOGXnaXeMr+9ti5Cu7zgWOH/JwBV7Gti1xzomQFmH9VSbvfA+t4OkMhLxdsOwbWhQJThHTpwOjOeJxHBniokURFmQW+pRY7BCmbFfcejQdlxLkh6vVCG7G8nRm5/flfYUrISgsMbsO8bb14q4ODMs5Q34CV4Cp43WYBj4glvi0S0OGikQgDepDYGPjYp7iUW0hHmNO2v21TLrYT6K278JoTPAuDnK7DgDp9I26+uVkgZxsHJ7VR0Ixw2Y+gUdODBdZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo+mgb4JbHlmUNvz//rcx4bdSUBO9I8LAbHX+BGSbl8=;
 b=naldSN/AGHLaBYh1998QuFBtcCjP00xCEuLo1/iN/nL/JpwVveuXzJhPpPo4EWe2PO79lxpRIsg/jPF4LGvHaXc1I9e/djX/FVvX3HubpxhRhIebzNRa5jhTRF1ObgvbYWrW+CNd8MBzV5stmzLxOX7VfS1n7rfZaELxQTqtHag=
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
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v4 1/8] xen: reuse x86 EFI stub functions for Arm
Date: Mon, 23 May 2022 14:25:18 +0800
Message-ID: <20220523062525.2504290-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 6caa2191-6d48-4feb-44a2-08da3c851c48
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB4302:EE_|AM5EUR03FT047:EE_|PAXPR08MB7549:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7549BF34A035756CE462F8929ED49@PAXPR08MB7549.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GMommwcAWmF5rJFW2Wu1Kgcte/Ed+NVBxpzCuyepcEV9VD/vLKnli3RCFMzy9rJr2L4zVF+tHtI+ivggU5ao/dYfiXEeX3+TPA3voU/msu08gkKkJQGTw4D3QOEerrXUmyJslmTRdXLBJH5wtJBD18LJs/MF/tfDQazejkc3tuaYAYbbREWIxLIku1zRmRqom8zo4x1Rto7e5q5G599m73LMssCFyRvwzTc9b9JxWhWpujaPqy6TorOFxaf5Oe78QV54hihGnOmswqBC6q/uH0nAli6PUSYgeQmyV7/YGh+CYDCoeqoektpQht3oi0PL7hMahX0ILVCOBte59+4jWaEw9YOI7vr4q691qgFAEWwhbSRRXw0voAI9IukslAzmoe4NkC5qNtf24lKR6K0DS9i6ABa+U+CyINcBplCm6JiiHcfnhtM/LcCQHgknLHx5BDFEu4qhRQaCX61aI4u/JQmp8zICDEi4VU0s0ufBVKh+1UGyHz3mGOxkfjIG+yr9ZD1J+2idXpSyo4FCROlgulSNvRgfvqxlsqxfz1e+5XOYyy8UHlQraBXX+Lo0ZKV8Sa2YGodgNoixAbQkQpjLAGplG4cGfsdTZgdkLZZRvTXSF6ZbPARtMxgfmtMw2nWTg7FnpM/Lu8IbPczitwnqktwzQEvR3yDIc8xBdR8z27dAz6qi2V0Ea2pdSQ/Iu45T2tkIkXsCxrIjKrlUiWnkYQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(82310400005)(5660300002)(2616005)(81166007)(36860700001)(36756003)(44832011)(2906002)(8936002)(6666004)(316002)(356005)(426003)(86362001)(1076003)(26005)(70206006)(7696005)(70586007)(508600001)(6916009)(54906003)(8676002)(47076005)(83380400001)(336012)(4326008)(186003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4302
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	deb31881-8cac-49e3-1bb3-08da3c851574
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xVjx4cgcVqh5ZvtKZQ00GezPeE539MZimGr6hhBxFlJeVIXKLOk+7gOrCkBxFhtE3PuWO0xrJxz1GNf3QzmBGZHTugZW3fzQVUD25LWXPrU4mqP8ax8JQSipaRqIQ8WB8h6vyGLdccy93uHD3ojJCigDn3f+M/szeRsvX2TcdfH1OYx9HEYHNKMUXJE80U7iixEk9lR1v0/0pNgxtSYsoXzWEiZCwmKPtjBvlu3hczThQxWlOI7BCui6/y/bf3XdfgKy8rj2u3W8WneDPJ/jTPvYGO3DcOTyRlTvSEYe6mp9HzgsbRkmLcxVbvQOdB8gHZjL4bv48/2Fn9s/JX9WtN+KLED9Op0NFKUTRWCnXrKwe2yjclIorPrD6fiZ4DWdpUS3gPSuxB1mhaG57T3+U+yNnYuhK+gnAhvOu8vl8LafXm3A1gz4CE0mcpkw9aHA/NAq/t0CzVSbYsGy8v3TiOkXrky75PVShuNAzbInhNfVm3h80cP8VmMnkYa1dJLF6iAagWwt32q7gkM+eIW4OzOFC/VEwGgukb4G+zLbsb2dhvSF6aVm3HldfOlE83/SoQJm29CUgUtSJAVz1UjowlzRRhCUsVw53R3ctoQTEiC1giolC/0vc1snGtzTaVCadpUfn8ekp0PQR8kMHyf68rgTUP7eOEAk6GWT1WVcvwASFICQ6EC4qdkLHcEMERAIKh56CxSfQBkQoc7LjaJCqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70586007)(70206006)(83380400001)(6666004)(40460700003)(2616005)(7696005)(316002)(36860700001)(82310400005)(8676002)(2906002)(336012)(5660300002)(4326008)(47076005)(426003)(1076003)(26005)(8936002)(81166007)(508600001)(6916009)(54906003)(36756003)(44832011)(86362001)(186003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:02.8536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caa2191-6d48-4feb-44a2-08da3c851c48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7549

x86 is using compiler feature testing to decide EFI build
enable or not. When EFI build is disabled, x86 will use an
efi/stub.c file to replace efi/runtime.c for build objects.
Following this idea, we introduce a stub file for Arm, but
use CONFIG_ARM_EFI to decide EFI build enable or not.

And the most functions in x86 EFI stub.c can be reused for
other architectures, like Arm. So we move them to common
and keep the x86 specific function in x86/efi/stub.c.

To avoid the symbol link conflict error when linking common
stub files to x86/efi. We add a regular file check in efi
stub files' link script. Depends on this check we can bypass
the link behaviors for existed stub files in x86/efi.

As there is no Arm specific EFI stub function for Arm in
current stage, Arm still can use the existed symbol link
method for EFI stub files.

Change-Id: Idf19db1ada609d05fc0c0c3b0e1e8687c9d6ac71
Issue-Id: SCM-2240
Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
---
v3 -> v4:
1. Add indent to make ln and test to be aligned.
v2 -> v3:
1. Add existed file check, if a regular stub files,
   the common/stub files' link will be ignored.
2. Keep stub.c in x86/efi to include common/efi/stub.c
3. Restore efi_compat_xxx stub functions to x86/efi.c.
   Other architectures will not use efi_compat_xxx.
4. Remove ARM_EFI dependency from ARM_64.
5. Add comment for adding stub.o to EFIOBJ-y.
6. Merge patch#2 and patch#3 to one patch.
v1 -> v2:
1. Drop the copy of stub.c from Arm EFI.
2. Share common codes of x86 EFI stub for other architectures.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI
4. Remove help text and make CONFIG_ARM_EFI invisible.
5. Merge one following patch:
   xen/arm: introduce a stub file for non-EFI architectures
6. Use the common stub.c instead of creating new one.
---
 xen/arch/arm/Kconfig         |  4 ++++
 xen/arch/arm/Makefile        |  2 +-
 xen/arch/arm/efi/Makefile    |  8 ++++++++
 xen/arch/x86/efi/stub.c      | 32 +-------------------------------
 xen/common/efi/efi-common.mk |  3 ++-
 xen/common/efi/stub.c        | 32 ++++++++++++++++++++++++++++++++
 6 files changed, 48 insertions(+), 33 deletions(-)
 create mode 100644 xen/common/efi/stub.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..8a16d43bd5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select ARM_EFI
 	select HAS_FAST_MULTIPLY
 
 config ARM
@@ -33,6 +34,9 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+config ARM_EFI
+	bool
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 1d862351d1..bb7a6151c1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
-obj-$(CONFIG_ARM_64) += efi/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
@@ -20,6 +19,7 @@ obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
+obj-y += efi/
 obj-y += gic.o
 obj-y += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 4313c39066..dffe72e589 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,12 @@
 include $(srctree)/common/efi/efi-common.mk
 
+ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
+else
+# Add stub.o to EFIOBJ-y to re-use the clean-files in
+# efi-common.mk. Otherwise the link of stub.c in arm/efi
+# will not be cleaned in "make clean".
+EFIOBJ-y += stub.o
+obj-y += stub.o
+endif
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 9984932626..f2365bc041 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -1,7 +1,5 @@
 #include <xen/efi.h>
-#include <xen/errno.h>
 #include <xen/init.h>
-#include <xen/lib.h>
 #include <asm/asm_defns.h>
 #include <asm/efibind.h>
 #include <asm/page.h>
@@ -10,6 +8,7 @@
 #include <efi/eficon.h>
 #include <efi/efidevp.h>
 #include <efi/efiapi.h>
+#include "../../../common/efi/stub.c"
 
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
@@ -45,11 +44,6 @@ void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
     unreachable();
 }
 
-bool efi_enabled(unsigned int feature)
-{
-    return false;
-}
-
 void __init efi_init_memory(void) { }
 
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
@@ -62,32 +56,8 @@ bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
 
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
 
-bool efi_rs_using_pgtables(void)
-{
-    return false;
-}
-
-unsigned long efi_get_time(void)
-{
-    BUG();
-    return 0;
-}
-
-void efi_halt_system(void) { }
-void efi_reset_system(bool warm) { }
-
-int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
-{
-    return -ENOSYS;
-}
-
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
     __attribute__((__alias__("efi_get_info")));
 
-int efi_runtime_call(struct xenpf_efi_runtime_call *op)
-{
-    return -ENOSYS;
-}
-
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
     __attribute__((__alias__("efi_runtime_call")));
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index 4298ceaee7..ec2c34f198 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -9,7 +9,8 @@ CFLAGS-y += -iquote $(srcdir)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)test -f $@ || \
+	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
 
diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
new file mode 100644
index 0000000000..15694632c2
--- /dev/null
+++ b/xen/common/efi/stub.c
@@ -0,0 +1,32 @@
+#include <xen/efi.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+
+bool efi_enabled(unsigned int feature)
+{
+    return false;
+}
+
+bool efi_rs_using_pgtables(void)
+{
+    return false;
+}
+
+unsigned long efi_get_time(void)
+{
+    BUG();
+    return 0;
+}
+
+void efi_halt_system(void) { }
+void efi_reset_system(bool warm) { }
+
+int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
+{
+    return -ENOSYS;
+}
+
+int efi_runtime_call(struct xenpf_efi_runtime_call *op)
+{
+    return -ENOSYS;
+}
-- 
2.25.1


