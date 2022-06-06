Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4A53E040
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342283.567365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43m-0007rf-RD; Mon, 06 Jun 2022 04:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342283.567365; Mon, 06 Jun 2022 04:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43m-0007p0-NG; Mon, 06 Jun 2022 04:09:46 +0000
Received: by outflank-mailman (input) for mailman id 342283;
 Mon, 06 Jun 2022 04:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny43k-0007op-IR
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:09:44 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe06::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc59290-e54e-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 06:09:42 +0200 (CEST)
Received: from AM6PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::27)
 by HE1PR08MB2842.eurprd08.prod.outlook.com (2603:10a6:7:34::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Mon, 6 Jun
 2022 04:09:39 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::66) by AM6PR10CA0014.outlook.office365.com
 (2603:10a6:209:89::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:38 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Mon, 06 Jun 2022 04:09:37 +0000
Received: from 9632029c29a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C627D30-FCB2-4D6B-957F-2A2996E7B99A.1; 
 Mon, 06 Jun 2022 04:09:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9632029c29a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:31 +0000
Received: from DU2PR04CA0336.eurprd04.prod.outlook.com (2603:10a6:10:2b4::15)
 by VI1PR0801MB2015.eurprd08.prod.outlook.com (2603:10a6:800:8b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:25 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::e5) by DU2PR04CA0336.outlook.office365.com
 (2603:10a6:10:2b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:21 +0000
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
X-Inumbo-ID: 7dc59290-e54e-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MgDC/9BBLmp13PuCyZjIw88j4yl6DfzHObk1x0R9PZTfGOPa2bFQJbrb2kdH3mbw/i6VH+y1pxjnNHD5ZRyctagdhDDom8DNqoh5wLXJo/wvvDQk/1+PXMQzTr7QXEr7Kbd00M1gqp72Hta87tUUo7U0h+WyZzMCZRT5TJsq4SpD+nPAwr+pA9cdmGAajlX0Zd5gU/P+uLvLKsLJeQae3PgTpb1exhBwMBR63R200rR0q3I+f9szZGlQO2M9loYZcNkLQGo89/w+C3aUR8ETMEcKNNoylYo/S93h+mCF6XvEM2yx8k8CXXADs9DiZeHsd/b9UH8CumrzqplIvCrotA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgqMEKoYGJ9JOofanIwPVFJx2bQLFrHzSgsSU34qiaY=;
 b=UcIIhPoOUYGZVlphrCVWoxwbjZDAhWMd28LfzEiWBZQ+FX3borRM6D63bszdOm4tuaHVY/b+VxwbW5FR4ivUrdO9Zjx2LV8GWZYycoYypXO9pfq+mzzLa1iH4rLmqcj3OPPbpT6+DiWkQrOTC7uHWKjfQeXHkoOQvATT6Lx2z/bfXSaPXb/gr9M0Zm3R74STHH8M3Aq21XuM2ueMjfRar7Lbt+I6bY19ATgQjZdsC6e1VmKYL0zS2P0VbJRHm4DKr0r+nkou5mZ00BSNUaQ8aZffy8muJgm4a3KmVDmjlN5eo7JPatC7yJq9tiM46qePASkFLUPTN/D66wNe6ceLNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgqMEKoYGJ9JOofanIwPVFJx2bQLFrHzSgsSU34qiaY=;
 b=CmjxrqyAyx7ZSNghRujaEIUn1XdeLBI9XsMjtTjSSMF4kcEoPj6dtNnW8BTo9i+/U7jEHMQukyjvPhGLdUyTQs88k6vyJrXF8rQdPGSLRzRo9Wrnf2fbu9hUaO5NudQea5HnipGtB8Z+g+Z7QRadlqb0Z2kroqDy/xi2Do6uQW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ace7788932735120
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCJeAQPDDd36JVQpCk7rsAuhq4bgN/8oGoPvwWw+hrKJ1mNsPZIJSnu0i5H82IQyttQgtUZOw8fX72N/Wh9Ei0LALc6dwKraFLhqh/wS7zdZLSHiAmIix6DdEVqRRtHpenvWy+yvG7OfsgW4buzD9X0FHR2mOMFK16tIDhiMcp5CF/RwLVcSDpbHj4sQaJ9GaYHWAv+ZvJLWYguylkObfp+GGJRaOsR2IdwcTPN+IwjNOkLzKXUfA4dVN6iTZviFERh6NsSF5z/6rw9I2XcooTrdGT8HkGdwQebz3+C22SmFluiLk1tiB4SQTPlHwtMgW2mDm9pd9lOuDRmVZtzg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgqMEKoYGJ9JOofanIwPVFJx2bQLFrHzSgsSU34qiaY=;
 b=Xt/nlZl/PGl7mlAt4y7F/O/4hQj51RPmQkgqTotYMojOUnT04s1/4n0pA+0rvD11py8ZSpZa/OFafAN/n/ukOpU7fh+mbHlnOfD3oduiYrSUIxOhp4ckh101fwqe0i/5/mk3WR/0uddqNNnZbJX75VBXCy7u04Mohh6Mvv6uxQCJ3uU0ldziM+N9hvBhlyHFyXBXNsWF6fLKeb1+aE/nOH52EsgDlqkxH+hYMqa2MD9D3sLkZCXtkd78lrncje01QXqp9dyzJmQy70b9nE5y5eKafuUGwZgbSP5kiXZE6l/537kEmkcUvzoVYTWTcUF+tit3jJpK667Wybe5slsR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgqMEKoYGJ9JOofanIwPVFJx2bQLFrHzSgsSU34qiaY=;
 b=CmjxrqyAyx7ZSNghRujaEIUn1XdeLBI9XsMjtTjSSMF4kcEoPj6dtNnW8BTo9i+/U7jEHMQukyjvPhGLdUyTQs88k6vyJrXF8rQdPGSLRzRo9Wrnf2fbu9hUaO5NudQea5HnipGtB8Z+g+Z7QRadlqb0Z2kroqDy/xi2Do6uQW8=
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
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v5 0/8] Device tree based NUMA support for Arm - Part#1 
Date: Mon, 6 Jun 2022 12:09:08 +0800
Message-ID: <20220606040916.122184-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 51d35738-af1f-4e39-8270-08da47725fb4
X-MS-TrafficTypeDiagnostic:
	VI1PR0801MB2015:EE_|VE1EUR03FT011:EE_|HE1PR08MB2842:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2842BDDFC6410E57B2C381BD9EA29@HE1PR08MB2842.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JhEy32ixmYoxnztIsF5qehAYMe3rEwfs1LavGOlD3E9mHejBP2tFYpGS2/SI6PuMiC8TFq5qPShyzfbAb1UAeaIR5LJvOFG4xdfY2Rz5fT75g+vv/o4V/fL5yySomCv/1NjuUGNmcCFiD4nxh+lNxKNdTdCxBIH4SIYSgHLgafYDwSKhXB+rbrw3np37G7Ilpd9dUxymfTn+h0BDmqYZ+2B88jizpKaxw0qXPOcvuOJdDHD9DHlRhhgUO/m0YaAb97gYuKKDEc99c/5W2sw6H6u27IONwysEG8UHLjF3PlbjywN1gHFBXWP1MkL606D+6Z17hUYPubFEMOzP6Dhp+mnPrxvVLcYfMrpc0KNsLoB6tlkKzjH4IvCsaortDpNnqxR2UEerHQdfS9u/IOv0J9Z+Ti1MFC9FS9dRlmI+MrVm2RZ07/tLdylWjgMqfmlwDSV3ooQpx8jkgAyFbJE46mKcBq4yBHkxgramYQuYGZEL0NalsJd+YtIUH1rg+I9JR86d57/Gq9WY5I+sOo0NgWwTGsfSMuty/cNYdsDPgorxLw8EemORFxfkgGt9TVfO1AFxMx8YMTAePKOFdg4x2z1Tgx5842yru6ehRbSA9IzigrUD9jTvV2/wZ/5Egp+1uR2WqhCj4hB3e/sZkvubEG43cGlzAWnqBVZ3TNIFej8mklFhvDMJyvfkvfpttTdchgO1lsrlLqJg9Kg/uo/c1ZVdTZi6qUneRzLwpESEdWE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(8936002)(356005)(44832011)(81166007)(54906003)(70206006)(70586007)(6916009)(5660300002)(2906002)(316002)(82310400005)(8676002)(86362001)(508600001)(4326008)(83380400001)(6666004)(186003)(2616005)(1076003)(36756003)(426003)(336012)(47076005)(7696005)(26005)(36860700001)(4743002)(21314003)(17413003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2015
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	effd145e-5a1b-4ac7-097e-08da4772577b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b0SOaecEayVd/vMzuEvwBOR0Khss+5QQ9RyoUV8d4MWYa4sv1o69SBZTkSgnblRdGyDsvtJNKkuIId31D71hqcGQn6pmRKg7o5sXV4HIIfih2xXbRjOTfCve/j4QxJ4PltFf8tJ297eL8g57XQt1fYfnpBZg/tB/+vnPFZQKWrJioCXZMm7EBcZRNKdhqP8yasC5yAuDtpPVGXum8UVZaB1sDe2winNXLoAiHWKFow3Dq/LcKN5VNGlOst//ubLuYgTzEN82X5eFjc8b6h0yrUBmm5XjcFF+PIYg1YIpfulfI/nYzMXFQ/ZS2PqGafQmKo9nFnLTMaaEPOfjY2btII17uUktQWPQAI8jvkmp859norclrTifjBw2n1n5Jwr8RHpP5BX/Tvg1hrlzcQYjyaSj4I6SFiV/wIsgh8Xi8WfsoS8EYQ22mOiQy4T/5NTJEvmKw5QUi1He1n9F05Adve8Ot8rIMjiE8HzV+hX9B67n7bASeKWjOlSnYisWYgfl94QR22LwAWGwMPoXXjwHkhcg5zDE9Bnd1UzWtz95F+fKXOXhNUl3+5dhhZh2QQWonMq81064C/cdxxYDgEC8nJZUN/CpXP3Mmdnl1+7C18ZI56zySgtu+aig1J0juMRPcJpm/4NqPWvwzOBPIK2wp7lvnVa1Rvtc+d8n8H6+UH4VuC+2IylMfa3Nw6CsdnvpQapyLiKUCyn84IeYKmlSAA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(36860700001)(82310400005)(6666004)(7696005)(83380400001)(26005)(4743002)(107886003)(508600001)(47076005)(2616005)(1076003)(336012)(186003)(426003)(8936002)(86362001)(81166007)(4326008)(8676002)(44832011)(70206006)(70586007)(5660300002)(2906002)(6916009)(54906003)(316002)(36756003)(17413003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:38.2761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d35738-af1f-4e39-8270-08da47725fb4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2842

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series.
2. Move generically usable code from x86 to common.
3. Add new code to support Arm.

This series only contains the first part patches.)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts.

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

---
Part1 v4->v5:
1. Remove "nd->end == end && nd->start == start" from
   conflicting_memblks.
2. Use case NO_CONFLICT instead of "default".
3. Correct wrong "node" to "pxm" in print message.
4. Remove unnecesary "else" to remove the indent depth.
5. Convert all ranges to proper mathematical interval
   representation.
6. Fix code-style comments.
Part1 v3->v4:
1. Add indent to make ln and test to be aligned in EFI
   common makefile.
2. Drop "ERR" prefix for node conflict check enumeration,
   and remove init value.
3. Use "switch case" for enumeration, and add "default:"
4. Use "PXM" in log messages.
5. Use unsigned int for node memory block id.
6. Fix some code-style comments.
7. Use "nd->end" in node range expansion check.
Part1 v2->v3:
1. Rework EFI stub patch:
   1.1. Add existed file check, if exists a regular stub files,
        the common/stub files' links will be ignored.
   1.2. Keep stub.c in x86/efi to include common/efi/stub.c
   1.3. Restore efi_compat_xxx stub functions to x86/efi.c.
        Other architectures will not use efi_compat_xxx.
   1.4. Remove ARM_EFI dependency from ARM_64.
   1.5. Add comment for adding stub.o to EFIOBJ-y.
   1.6. Merge patch#2 and patch#3 to one patch.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone
3. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
4. Merge the interleaves checking code from a separate function
   to conflicting_memblks.
5. Use INFO level for node's without memory log message.
6. Move "xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
   phys_to_nid" to part#2.
Part1 v1->v2:
1. Move independent patches from later to early of this series.
2. Drop the copy of EFI stub.c from Arm. Share common codes of
   x86 EFI stub for Arm.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI and remove help text
   and make CONFIG_ARM_EFI invisible.
4. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
6. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time for
   arch_have_default_dmazone.
7. Update commit messages.

Wei Chen (8):
  xen: reuse x86 EFI stub functions for Arm
  xen/arm: Keep memory nodes in device tree when Xen boots from EFI
  xen: introduce an arch helper for default dma zone status
  xen: decouple NUMA from ACPI in Kconfig
  xen/arm: use !CONFIG_NUMA to keep fake NUMA API
  xen/x86: use paddr_t for addresses in NUMA node structure
  xen/x86: add detection of memory interleaves for different nodes
  xen/x86: use INFO level for node's without memory log message

 xen/arch/arm/Kconfig              |   4 +
 xen/arch/arm/Makefile             |   2 +-
 xen/arch/arm/bootfdt.c            |   8 +-
 xen/arch/arm/efi/Makefile         |   8 ++
 xen/arch/arm/efi/efi-boot.h       |  25 -----
 xen/arch/arm/include/asm/numa.h   |   6 ++
 xen/arch/x86/Kconfig              |   2 +-
 xen/arch/x86/efi/stub.c           |  32 +-----
 xen/arch/x86/include/asm/config.h |   1 -
 xen/arch/x86/include/asm/numa.h   |   9 +-
 xen/arch/x86/numa.c               |  32 +++---
 xen/arch/x86/srat.c               | 157 +++++++++++++++++++++---------
 xen/common/Kconfig                |   3 +
 xen/common/efi/efi-common.mk      |   3 +-
 xen/common/efi/stub.c             |  32 ++++++
 xen/common/page_alloc.c           |   2 +-
 xen/drivers/acpi/Kconfig          |   3 +-
 xen/drivers/acpi/Makefile         |   2 +-
 18 files changed, 199 insertions(+), 132 deletions(-)
 create mode 100644 xen/common/efi/stub.c

-- 
2.25.1


