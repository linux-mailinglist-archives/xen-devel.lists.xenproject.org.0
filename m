Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB16619433
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437425.691843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtcu-0003T9-0i; Fri, 04 Nov 2022 10:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437425.691843; Fri, 04 Nov 2022 10:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtct-0003Pj-Qx; Fri, 04 Nov 2022 10:08:39 +0000
Received: by outflank-mailman (input) for mailman id 437425;
 Fri, 04 Nov 2022 10:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtcs-0002Y7-H7
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2078.outbound.protection.outlook.com [40.107.104.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5ffaa44-5c28-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 11:08:37 +0100 (CET)
Received: from AS8PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:20b:310::14)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:08:34 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::8d) by AS8PR04CA0009.outlook.office365.com
 (2603:10a6:20b:310::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:34 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Fri, 04 Nov 2022 10:08:34 +0000
Received: from 8f84a1913189.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60168D8F-1A97-4CB8-89BE-D22AC04BAE0F.1; 
 Fri, 04 Nov 2022 10:08:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f84a1913189.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:26 +0000
Received: from DU2PR04CA0293.eurprd04.prod.outlook.com (2603:10a6:10:28c::28)
 by AM8PR08MB6625.eurprd08.prod.outlook.com (2603:10a6:20b:357::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:25 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::f7) by DU2PR04CA0293.outlook.office365.com
 (2603:10a6:10:28c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:25 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:22 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:20 +0000
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
X-Inumbo-ID: a5ffaa44-5c28-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mZGKPaCnTQ1vhG7A/dG8/YoQhSII2/mrNKUNrxWEFQDCDtLxWie9vJ5oG0XcSRiLpEyPGWYoUujZmjFUVWF95sXSJcxPxYat+qCpW5f16Puo85DfuuXrsHdE9oicLMeAvgdG0Fy6EgF84KfWcMsDujU+Zw2tN0cpRg/lsUX8fCIylvBMbgRmQrmBuVjKV6coMYLsHjBlmFX1PRTPjgHWauYiT+6pPTKGAja/02rveRoCRyiEaLuo3/A/sxVfMkmxOILvA3VaIbrNrwFX7Inna9rgoknLCFdWdG5Zyh8rI3gQ1HJTVAPt2GZzmrJd/vnNpNyMv/PQODI98oSLHde6Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c83sPn5waglt7AsZTsybdIkX6p9bIApiwcHQJUpCiHU=;
 b=OIQbVMba5Cdi42TdiUIitbOeW2LuH4HdVXuic81y02gdX12se7obqllaHnS3AAAJpbtxRVpybYrWT1oMRX/ToEv4FWaZfs5RhtMsbMlik7TqcdEg3y8TmTVF+fwQ9PK1kje3r20G0iygwGrHrDXxxV0DsiesTWznkMuZZzgiZTqOKrLGwZN9i72vHTBPDq8OZ1jsuUcwEUy8UJ/OF+wVkJtorxKyMchYpPqngPiIQKpJcJl4Ner/bFInXN0vpeZDET9C4GL1KCsG30m1vmQ6jvAd5V6HATdbAQ8h7kY4LZrKMAjkGmPMlzD+dqIYbmSle/ZOWCy9GVSvZBTOYZ2PLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c83sPn5waglt7AsZTsybdIkX6p9bIApiwcHQJUpCiHU=;
 b=BOjmomYT5kfex0Zw7CongWBk22a4EYUKvxfDJXPiwsiWNep8wM2NbeWRkqaO30Bh5jRnmukNnHnWFCIir/WV+hPlCGvMFoMnHbC/Mmu1wc+7BSGKftFtcSYtI2U28cPo5ecYJKe+Q/AJh4afVvUNJLA++Z4NpwYV6kPxf0f9srQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f282e67ff45f34cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYJUt2LLR4GT62crYVzvdmvWP2Dt/5qknnC+LjR1PO0V8jPNJR96WTltiNqxHldBsQ3rXV3DQBJR9le0P7kDqCxnpnyEtkYUa8LuPYCfJUuO1AWxMRwGk4TLHczivVXkNw2roTEKdAnvVXj3Q8sG+PWgPvOeSoULM8AWa0htZtI2os/Aj7p9am3XjRRTj8uSkbbV5Qf23ox2E9a+43aBj5FpYBPvUi/yyz7F1Y1AdWpvQkKRzGseEnfr4PIJ0+RtyQ4nCXTfatsFbtOANGXonNBK5ruYZiy7q8HsEc9vqmpq0oTFihcWPfiyksKgb4L6ZWtiBzjxvD8HgAdpRVHsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c83sPn5waglt7AsZTsybdIkX6p9bIApiwcHQJUpCiHU=;
 b=JLt9yKjsTeWz62ETNaQBlLHAIwtnbKzytXrn5aYFhzUTj3NsGV47bUuNKBhZaoeHbk8Dy7kbPbeQkXhnwXxn4PlmtQ5yp/1PtOCIiM9rcxpL1K4SNbDOyMu+kICIb3toZDotnBEYY+WhzzsUCUw0XA/fU6xR4RHH9ICIoPm+fyXZ/HMCGWCV6ICUTTQmyimKFA+fvQDYMRKNE9BW/BJf6ixOWdg0vX+cSjTZyF0SRBAErFrcYN/5DFYCo7p7YbYI0Gy6ejdUj5OctgzhckzqcNMuPlDKBkcr+Gmq8gDm5vC+fyQQTfo1vNBwPDPA4O/Ftz2o0IxtmMQWicBpp5O27A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c83sPn5waglt7AsZTsybdIkX6p9bIApiwcHQJUpCiHU=;
 b=BOjmomYT5kfex0Zw7CongWBk22a4EYUKvxfDJXPiwsiWNep8wM2NbeWRkqaO30Bh5jRnmukNnHnWFCIir/WV+hPlCGvMFoMnHbC/Mmu1wc+7BSGKftFtcSYtI2U28cPo5ecYJKe+Q/AJh4afVvUNJLA++Z4NpwYV6kPxf0f9srQ=
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
	"Jiamei . Xie" <jiamei.xie@arm.com>
Subject: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR platform
Date: Fri, 4 Nov 2022 18:07:35 +0800
Message-ID: <20221104100741.2176307-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT052:EE_|AM8PR08MB6625:EE_|AM7EUR03FT016:EE_|AM9PR08MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: e964fb75-088f-4d55-d02d-08dabe4c88a4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bLT+mUdP00z4e1w4SDyK1mGpcABic/E8OlPFhZTAoLxpxhSlAUqiXmHz88uYzrStFZsu17+ulICo32L5neteH4s5Rajnk9Y1zaBU4GXBgom3YN6R6tlkqqfGXQptu8nTqpUkbIeA79QG/bFA1jaqI9YBP4n5vMcDIfIYrjCaLTgutMBDZDFxqkZCtSM0ZhrhGQlffO+iLI4RwB4jRRDcROJ0fJQkqAIvib9qln1DxwBT40tY2VB+10aHMunXipKcu4rxyHqK6V1dP59TzX08cjjkcwB2JyUzBtgmqem1cAArb7Q5f+a4MaELzvpXMW3KsS6pIg+8t+FKCcbVuK+tzrN/R6l5sXB5xKNvBR6l0EW8vtNjztLBxCWfhsiChJvCuudAeqOasdR/naOpctDuFfF51xrVmo//HuYpBqpQ1blk6mTclWw9RWBxq+8owUF9Ve2fduGf6lbAESLIZ8x+9oekRejM2CbLV0VYPB7c584LMy+P9oufidxzOgCq5SKq31UcR2+FI8BMqE+GM5CWoS7zz7oRgEjEsjt1dpo18d47vA4vJ4spvMHcF8GO38oGWtFJUBMT55wcNwH/MMXusbzwpQAc/ilIKrAOJ8Z8t3cVL/Nk5SOtbDb+qcdaGBceXNemD8Fi1T/EX7/2KeUYUEKhxA6sAgME3vZX/ti6SBAGps0LjlVC2KpoTU/irFnhc2RoA/Bh/lwEkje0uOoD6bRUU6fcjNzXPIsSHcirlRAxq3a/DHS8+K6YW/CKOxKaL+vev/bMRPPqQqKpFEX/gWKNpAbBZeEKhPJ2lMlD5iQ46PrianQ2u416yhZH6db/
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(426003)(336012)(36860700001)(86362001)(36756003)(356005)(81166007)(82740400003)(83380400001)(47076005)(1076003)(7696005)(26005)(6666004)(478600001)(6916009)(54906003)(70586007)(4326008)(70206006)(41300700001)(8676002)(316002)(44832011)(2906002)(5660300002)(8936002)(186003)(82310400005)(2616005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6625
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a229894-52fa-4d08-452f-08dabe4c8334
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gYZ0FhS1PzsfWPBS4Gbgve6nNG/O5e48GX+zgeiVC2JBp3TpeM8DAr5qmxgot+uJF3XUlVp1gMbUFergOgtbE6jTY2tbRRR2mUKLXl5tYeevyCKYoj2SS2kRIxoMUDHH7pUaH0AcP9R6+hWxPuM4qCpc2+eGjLb2ihXhGc6GElZjXG7LShtUJsPW3xErSI2asLlfTBvwpmT1vTYS/gOOWkrC1HrCdqKBmjtDJXyoXJXSQGK/CfeXSQjpx8EHLqnRXFK7T1kFVTXJzdPmuKXs/Q5fed8+Jxz2R5S3+P3OuM69y1wCVBpLDJGTezi0tiG0bFFx+IrlwdWD+p5b5RkgeDDX7+sMJgqnldj9R/V3Wi95wmioIjZB3RE7FTeqrcO94H9/Sc1qbXBJfLpUSp0oz4VW+OLtsPs6Ql5r6AqPt0XYX0nki6kXtyrm71OV6DphDm31oJn1dU2s2muk/Ul1D0DiFyXjqdzsT1JPM7JKiwHJk4LCbz6flAlSeP6a4zjAbvCUIyddwjgSs8c2Eswm3P1IvMr0CXcNY6iVvJhMT+BlyHurvCFz4j/JgZDtJ+EjCbd/iuaKGwPpns0+f9KM/Og7JywUegg2UyYri5uQ9wScA7ybGcvLHGEDjunfg6LVIeSBaOyjy5xqPzeljmttfFxUS+D2qXiABZvLNInN7t6Pnli2L8fAV/G/5YmpyzKt3zrB/xCtNgDMQ602i73GvGWlBOrzwHplKHfBdEKVXq9iMGKjM0oQC5BpUV0Af9BHIBnactqxUykhLeP1fC5wUQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(82740400003)(478600001)(36860700001)(82310400005)(44832011)(336012)(70586007)(1076003)(5660300002)(70206006)(186003)(40460700003)(4326008)(8676002)(2616005)(54906003)(83380400001)(6916009)(6666004)(7696005)(47076005)(426003)(86362001)(2906002)(36756003)(26005)(8936002)(41300700001)(316002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:34.5016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e964fb75-088f-4d55-d02d-08dabe4c88a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290

On Armv8-A, Xen has a fixed virtual start address (link address
too) for all Armv8-A platforms. In an MMU based system, Xen can
map its loaded address to this virtual start address. So, on
Armv8-A platforms, the Xen start address does not need to be
configurable. But on Armv8-R platforms, there is no MMU to map
loaded address to a fixed virtual address and different platforms
will have very different address space layout. So Xen cannot use
a fixed physical address on MPU based system and need to have it
configurable.

So in this patch, we reuse the existing arm/platforms to store
Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
kind of FVP BaseR platform's parameters. So we define default
`XEN_START_ADDRESS` for FVP BaseR in its platform file.

We also introduce one Kconfig option for users to override the
default Xen start address of selected platform, if they think
the default address doesn't suit their scenarios. For this
Kconfig option, we use an unaligned address "0xffffffff" as the
default value to indicate that users haven't used a customized
Xen start address.

And as we introduced Armv8-R platforms to Xen, that means the
existed Arm64 platforms should not be listed in Armv8-R platform
list, so we add !ARM_V8R dependency for these platforms.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
---
 xen/arch/arm/Kconfig                           | 11 +++++++++++
 xen/arch/arm/include/asm/platforms/fvp_baser.h | 14 ++++++++++++++
 xen/arch/arm/platforms/Kconfig                 | 16 +++++++++++++---
 3 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/platforms/fvp_baser.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ad592367bd..ac276307d6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -138,6 +138,17 @@ config TEE
 	  This option enables generic TEE mediators support. It allows guests
 	  to access real TEE via one of TEE mediators implemented in XEN.
 
+config XEN_START_ADDRESS
+	hex "Xen start address: keep default to use platform defined address"
+	default 0xFFFFFFFF
+	depends on HAS_MPU
+	help
+	  This option allows to set the customized address at which Xen will be
+	  linked on MPU systems. This address must be aligned to a page size.
+	  Use 0xFFFFFFFF as the default value to indicate that user hasn't
+	  customized this address, and Xen use use the default value that has
+	  been defined in platform files.
+
 source "arch/arm/tee/Kconfig"
 
 config STATIC_SHM
diff --git a/xen/arch/arm/include/asm/platforms/fvp_baser.h b/xen/arch/arm/include/asm/platforms/fvp_baser.h
new file mode 100644
index 0000000000..9450a411a9
--- /dev/null
+++ b/xen/arch/arm/include/asm/platforms/fvp_baser.h
@@ -0,0 +1,14 @@
+#ifndef __ASM_ARM_PLATFORMS_FVP_BASER_H__
+#define __ASM_ARM_PLATFORMS_FVP_BASER_H__
+
+/*
+ * 0xFFFFFFFF indicates users haven't customized XEN_START_ADDRESS,
+ * we will use platform defined default address.
+ */
+#if CONFIG_XEN_START_ADDRESS == 0xFFFFFFFF
+#define XEN_START_ADDRESS 0x200000
+#else
+#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
+#endif
+
+#endif /* __ASM_ARM_PLATFORMS_FVP_BASER_H__ */
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index c93a6b2756..0904793a0b 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -1,6 +1,7 @@
 choice
 	prompt "Platform Support"
 	default ALL_PLAT
+	default FVP_BASER if ARM_V8R
 	---help---
 	Choose which hardware platform to enable in Xen.
 
@@ -8,13 +9,14 @@ choice
 
 config ALL_PLAT
 	bool "All Platforms"
+	depends on !ARM_V8R
 	---help---
 	Enable support for all available hardware platforms. It doesn't
 	automatically select any of the related drivers.
 
 config QEMU
 	bool "QEMU aarch virt machine support"
-	depends on ARM_64
+	depends on ARM_64 && !ARM_V8R
 	select GICV3
 	select HAS_PL011
 	---help---
@@ -23,7 +25,7 @@ config QEMU
 
 config RCAR3
 	bool "Renesas RCar3 support"
-	depends on ARM_64
+	depends on ARM_64 && !ARM_V8R
 	select HAS_SCIF
 	select IPMMU_VMSA
 	---help---
@@ -31,14 +33,22 @@ config RCAR3
 
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
-	depends on ARM_64
+	depends on ARM_64 && !ARM_V8R
 	select HAS_CADENCE_UART
 	select ARM_SMMU
 	---help---
 	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
 
+config FVP_BASER
+	bool "Fixed Virtual Platform BaseR support"
+	depends on ARM_V8R
+	help
+	  Enable platform specific configurations for Fixed Virtual
+	  Platform BaseR
+
 config NO_PLAT
 	bool "No Platforms"
+	depends on !ARM_V8R
 	---help---
 	Do not enable specific support for any platform.
 
-- 
2.25.1


