Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680FE530986
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335362.559573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WO-0001Xy-97; Mon, 23 May 2022 06:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335362.559573; Mon, 23 May 2022 06:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WO-0001TH-5M; Mon, 23 May 2022 06:26:28 +0000
Received: by outflank-mailman (input) for mailman id 335362;
 Mon, 23 May 2022 06:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1WM-0008Q2-M6
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 458d16e5-da61-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 08:26:25 +0200 (CEST)
Received: from DB9PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:10:1d9::21)
 by DU0PR08MB7613.eurprd08.prod.outlook.com (2603:10a6:10:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 06:26:13 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::90) by DB9PR02CA0016.outlook.office365.com
 (2603:10a6:10:1d9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 06:26:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:13 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Mon, 23 May 2022 06:26:13 +0000
Received: from 40971db31545.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F52B494-63F4-45C3-85DC-6468C30B9DC6.1; 
 Mon, 23 May 2022 06:26:07 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40971db31545.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:26:07 +0000
Received: from DB9PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:1db::27)
 by AM6PR08MB4936.eurprd08.prod.outlook.com (2603:10a6:20b:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Mon, 23 May
 2022 06:26:02 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::8b) by DB9PR06CA0022.outlook.office365.com
 (2603:10a6:10:1db::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Mon, 23 May 2022 06:26:02 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:02 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:26:01 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:25:58 +0000
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
X-Inumbo-ID: 458d16e5-da61-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nq9/h4o66eCTO62J8SHiEvmv/+W8LAEeSWjQ110P5xycNwN3hxFOXytPIQonnKEg04dLVMAVyCnlvUFvVMfKUcOsSMSITelyy6uoIESqDjlCh/zh2VZnWrTHKO2I2A6WLfseS0Kmrut9pb1LnTwFMMFviCWqlKiYk4ADRaNE7G8JeJxFZ+gYny65UIGiLLbR3JsWkv78Lttf0zzDZP55mcwzvXCv+WIQty2InFyVcVv5+UXt+kitFEUZKVe0tS2Kq4khjXadKv5xsihtJOTvxr7H3HdW1IerKT+Mbaw+2HEjIcWTCM2kLDB315zt3Fx1L2It+XqJWbzwRNOmpJAl6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GQ8cRjoyAomDmwPvqhEhvMhEOhwa4PJfeQ52AeZoUY=;
 b=FcUbvcGuVhpqM5Gkolfm/WhXKjEPxx5uXa5R2J4ngUmflG5j5Vx0CP6aoGWFEJrmiu9McYLTh0u6PLJfdNnW7zkFLT7MTgwrdy4ul6YxXxBHjMpOzIzI6ED7vrkpUhijK7fB2hKFi55PNUqX3lQ2+CPgDjrqq5DWODvIq7vR4lhzTGx2h9oojeTujAkhX1sR8zrmWprAnHz9w3xdW/YEailwix6EVrZSsLDugHsO+R441GL8IUu2tu66DqB5uJdmhiDUJD9FVBWh4Stk98Zu84Mq/k1c5/KY0i/l2mU/yAETJZNWYyMvfU1BKyfsGzEPOTfDOHwrWIPHHigcxjfp6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GQ8cRjoyAomDmwPvqhEhvMhEOhwa4PJfeQ52AeZoUY=;
 b=jS5uYugkkXeX6jZ/zj7kV0DMzaqLtDgK2pKUVMmelch8H3zJgfZd7TvEf613PbTkU++LJbHBDI2PHcpHukdDWZc3VYSiZSOh7RINSgSX8nMcmjd6Mk66tLEMbP1hYmpBX5kK9CQ6GHRIiD8qIHM9lm9qsqN4HJx4vFIJVuAjfik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e3845afd65344b0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz136JsgiiXMSykpSmpkv3GtkcDiJ1F9snFVy8vuC0yEH5Z9xJLV5HFGfMAzJvhEphNpArGWhGzNURgp5OdsZEQrvtexTvCVMRA9gUPdG+ZcB+PDRha+qhwPn0X5t7Wg3Nxn8UyGzJo3GfT3n81rSU505bWaJDzhkJSPGicP74XWhPyKpx6AlVrvX/0nVr93kinBePpUUAg+pAxRIsX2DNxuEzzFrKPULH7eVAN78CaY+lWjOI5AQRQwYNvH5S/IFa09pwHNB50DrDmR6kpUwCsWjn3cyTktC9LQztJ8cvPHV5HBYcyJ3Ug3BkzkmnRH1SH6ZZF/e3VxAHSmD39Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GQ8cRjoyAomDmwPvqhEhvMhEOhwa4PJfeQ52AeZoUY=;
 b=GJvhalGY5whTNIjpCkJpqaxp3sl5tTkDZ8x3WbmA+kqLclttKpFJqngPUzSWM0G9XEyeYVJ+gJzMiUWBEjyGT5ZeoLRQV3l89nbe8Znn3ijKiqAIG9ALeHUiDN6+zrf964Uj5wC/3LgQjnT8uO0M33c5p9thnIzNKCf/RQy+NGc8MjUVmwfQ6nqgBwvdad8U2VCHq6Agrv2sRccVYryxMgaqUWaPUcf1V12gPBF16AoABTPOCD+vHapgeL60A4/TzXkDadQZWPmE/5JjacH/LcmXIx3KGQjvMSCuKE4/BG9DCkBr4oyNgWyFyuWUcJaGkSFXb8pZlYmOy9bxFWK+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GQ8cRjoyAomDmwPvqhEhvMhEOhwa4PJfeQ52AeZoUY=;
 b=jS5uYugkkXeX6jZ/zj7kV0DMzaqLtDgK2pKUVMmelch8H3zJgfZd7TvEf613PbTkU++LJbHBDI2PHcpHukdDWZc3VYSiZSOh7RINSgSX8nMcmjd6Mk66tLEMbP1hYmpBX5kK9CQ6GHRIiD8qIHM9lm9qsqN4HJx4vFIJVuAjfik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v4 4/8] xen: decouple NUMA from ACPI in Kconfig
Date: Mon, 23 May 2022 14:25:21 +0800
Message-ID: <20220523062525.2504290-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 89bbd995-69e4-4830-1b22-08da3c8522b7
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4936:EE_|DBAEUR03FT043:EE_|DU0PR08MB7613:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR08MB7613575623535CA3A42565AB9ED49@DU0PR08MB7613.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8wrQRKmB2bxTo5kapelnM3YNFawBKWt5VD2SsjvISJ3Y0zdN9Mp+cJmpnmpYS5n5fyvsGHoWqcec9BStC5oBBY2rZRqmN1UPPerGXK6Ej2qddZUqvHIqVrPkYOgVO31DjeZyKmC7ky7/b0wbiXATm3xMJhmhf64JmP4SHVxWdnoxQkkQW3YFDVYVn7ICVy/otT+6WkoaNMKNzQDZLeMmaoyAZpsLI3euoiF3+szxJRm7uVzmkhcK14zxunm7X0PgD12fHHntUvHw3Pl99pCoac1Wg/coIm/4ac8vPoIKHyNfxQzYiIdtCFqYURlE9MmmzQvmv1xOrpyCgz8SZbfXX8PIA0TYhe0DakbvL5qSRxec5pozIcgXhujzv+D9PgDjA6kO+PKgQR2/lWkQ/eUuVh+XQ2cgRxwwI7y8M37E+38md7aZaR4UeIcBiHgg9FXdY+hd6RaqD6kZoC+t9kWn9wxxx9uKLKFP7+5hwFuGUVv8g18OjnMj4MpbY27dSCYkoFlH8trFGvuQ3JNMWMStX9cLrnLEsRZLoNVME4/28ux4CRq9O6F2EObZvDksaIHq9YACNqgcaYfw+Il/1b6FQSqb+AMQciiGg/PnNwYT09/c+3W0fwjM4go/Nutz8po1EVC1FqubrxQLSQq0wnMmvDECJxlYVPOepRuOOae/W49RjMuPTqYXlBcHc94uIhByugNXzkVhziBFJjrjtE7Z8A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(81166007)(83380400001)(82310400005)(86362001)(5660300002)(40460700003)(356005)(316002)(508600001)(6666004)(36756003)(36860700001)(7696005)(2906002)(47076005)(8676002)(1076003)(26005)(6916009)(426003)(336012)(70586007)(70206006)(8936002)(54906003)(44832011)(4326008)(186003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4936
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de5541b3-f6e0-40e5-7fad-08da3c851bcd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MCzm8p5R8g/OYzMg/OPgTBwfQqbGlqe4/d2+K//AsUr/3jplZd1WxMrybHUDRAQhdkfialZndlvYYqTqxP1FPlReIlosiqUXvliYrSKjpSkc4MQi+7xbMA7r5pIC8Y/gRpOGfkcmmFsNjlWF38SeSCrGLXdtV63aaIaiq80YodpjSj0WnPqzS08vqbsUNYDUHRSNApMS4gnowDiYRd+L/U+eSuYm/ILRdCbBJUbvn46tJbmuW03sPr+57FRzSKuMCrMnj4BC7pO5vDfYeoN2eosOpyjwImqtDTy4mi6dU0VlQ0lAvy/f9FkYjGzFFAL2PA8fcdcvbJvM6UGQIs2und//4jI9YO6PWV5x8GQFj49ZRCyl26EYZtE1+DAXxbYrNy9lMxrpgOwzxcvD8FOZW/e7j4TP32wRRxlLtbDjITZRO2i5vAPIEwYhqZOo+ZboBEG3QpiNs0Pnw/LnYndT+lp78/0arvJIsvu0NeZOCd+9/8T2mVUp6BRSKDc0BWJEKTgtD2suvX6FDCGOXFOgLI6HvVdc31z6gpZWgAcOn988fpQE+WFBtKzCe8JUO2Ee78S46B95ZF4Qxi+1BDidmCHD9CN7caY9dpzjOQJBWJn3tUswSX9gkGeidzoE84WzrufigiSv3JfRBTcR5g+XZIwnv83RwPEdE8EZ5KY6RUEnM8gQMlqY/nmEctyjXiPr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(186003)(7696005)(1076003)(47076005)(86362001)(336012)(426003)(2616005)(81166007)(26005)(36860700001)(83380400001)(5660300002)(6666004)(82310400005)(44832011)(8676002)(4326008)(36756003)(2906002)(70586007)(54906003)(40460700003)(6916009)(508600001)(316002)(8936002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:13.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bbd995-69e4-4830-1b22-08da3c8522b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7613

In current Xen code only implements x86 ACPI-based NUMA support.
So in Xen Kconfig system, NUMA equals to ACPI_NUMA. x86 selects
NUMA by default, and CONFIG_ACPI_NUMA is hardcode in config.h.

In a follow-up patch, we will introduce support for NUMA using
the device tree. That means we will have two NUMA implementations,
so in this patch we decouple NUMA from ACPI based NUMA in Kconfig.
Make NUMA as a common feature, that device tree based NUMA also
can select it.

Change-Id: I926c73c10aa9bb8e1e7ff77596afb11d3ea18363
Issue-Id: SCM-2240
Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
no change.
v2 -> v3:
Add Tb.
v1 -> v2:
No change.
---
 xen/arch/x86/Kconfig              | 2 +-
 xen/arch/x86/include/asm/config.h | 1 -
 xen/common/Kconfig                | 3 +++
 xen/drivers/acpi/Kconfig          | 3 ++-
 xen/drivers/acpi/Makefile         | 2 +-
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 06d6fbc864..1e31edc99f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	def_bool y
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
+	select ACPI_NUMA
 	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
@@ -26,7 +27,6 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
-	select NUMA
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index de20642524..07bcd15831 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -31,7 +31,6 @@
 /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
 #define CONFIG_X86_L1_CACHE_SHIFT 7
 
-#define CONFIG_ACPI_NUMA 1
 #define CONFIG_ACPI_SRAT 1
 #define CONFIG_ACPI_CSTATE 1
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d921c74d61..d65add3fc6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -70,6 +70,9 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config NUMA
+	bool
+
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index b64d3731fb..e3f3d8f4b1 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -5,5 +5,6 @@ config ACPI
 config ACPI_LEGACY_TABLES_LOOKUP
 	bool
 
-config NUMA
+config ACPI_NUMA
 	bool
+	select NUMA
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 4f8e97228e..2fc5230253 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -3,7 +3,7 @@ obj-y += utilities/
 obj-$(CONFIG_X86) += apei/
 
 obj-bin-y += tables.init.o
-obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
 
-- 
2.25.1


