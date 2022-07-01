Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0156311D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 12:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358939.588327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Dfy-0003Lj-S1; Fri, 01 Jul 2022 10:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358939.588327; Fri, 01 Jul 2022 10:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Dfy-0003IJ-N6; Fri, 01 Jul 2022 10:15:02 +0000
Received: by outflank-mailman (input) for mailman id 358939;
 Fri, 01 Jul 2022 10:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pwB7=XG=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o7Dfx-0003ID-20
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 10:15:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9125990-f926-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 12:14:59 +0200 (CEST)
Received: from AM5PR1001CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::18)
 by VI1PR08MB4606.eurprd08.prod.outlook.com (2603:10a6:803:bb::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 10:14:55 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::a0) by AM5PR1001CA0005.outlook.office365.com
 (2603:10a6:206:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Fri, 1 Jul 2022 10:14:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 10:14:53 +0000
Received: ("Tessian outbound ef501234d194:v121");
 Fri, 01 Jul 2022 10:14:53 +0000
Received: from 5825e618c354.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D91858F5-5228-4052-9F2A-4143C23E20A4.1; 
 Fri, 01 Jul 2022 10:14:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5825e618c354.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Jul 2022 10:14:45 +0000
Received: from DB7PR02CA0036.eurprd02.prod.outlook.com (2603:10a6:10:52::49)
 by DBBPR08MB6105.eurprd08.prod.outlook.com (2603:10a6:10:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 10:14:43 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::d2) by DB7PR02CA0036.outlook.office365.com
 (2603:10a6:10:52::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17 via Frontend
 Transport; Fri, 1 Jul 2022 10:14:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 10:14:43 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 10:14:42 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 1 Jul 2022 10:14:39 +0000
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
X-Inumbo-ID: a9125990-f926-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fvaZplDSBpAe/+7E+4LM6pvhRNspqv1PpzU62zWKpxNdX2lldWFdjz+ZHn+Y148lGcaS/StZy0y2ZHAFK1w3jtYu7HHNd3LFlsHRtLnxHquRIratPOvW6SjD4k91Rlyo907+ij+GDEkmMOTwnsc9Y0Hqix6VqsKw0gTLztSre32W+CPAhWsti7smk90aRr/1ZZvzNM3kJs481M6kzkICx0UXPUgj9c7W8n9eFDK491oo+dYkCfUe0LWyRBu6Bsyf1zWi6NDRNXO/BrE7duRSDkvv71hGZrI7hZ1vwax0uWG2JATZi/bEkP9b6VGzCaejaxy2PNssGvTAqQ6DG9vAPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/EstXQWI7fTYjG6nR8Rf+nSkrpHj94TPD1Hr+B0j0g=;
 b=fZdIUL10JQKShnuoIJa8FgBUIts2QTTazLzo7ciTDjpk1CzXRxlOncIhnEkFdnl4BIjJj4TCL0zVSZD5O48X7VChMtsOhoiVv7XSg/6NG5jJiWRCQqroqxB5q5p80hGV1P9jVcIw6kVns0tbSrrpeFvtKgqay7cqZoW41hz0qvASS2lexCou4hTyHsyYIc6atXkK/+UgpMUvvn8U9vVdgTA5LUzD6jkA6QIkrY5YAAzTyjW5HRF6NAtKLe8bQdXpSeP6ORUgipT2LbmXLWRl9HApMFsx8NNvFWdxi5VVoYNHeHFeG3XmqMk2scgpoO2NQ8bIyDB3SzKSNjEwvCbQXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/EstXQWI7fTYjG6nR8Rf+nSkrpHj94TPD1Hr+B0j0g=;
 b=PSYiYjue/6yr6YLbmpPxhBsQyJP4WPYGyRqYu3vEciakMuq6VVbgDqgQkrc+Y0mFE+95GqOOXKdXoPgjRhKDqR/fgbtn0vCqWitb7EoSotxAfVp4/h3gvuJGEuY8sKXkKgO5p5jG6WQQwqiHffAkLD6+heMp2obFqBWvem3aaJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74455e79c36ca19f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiJ+i7DzfttsBCmA55OA5+bti8T43l2iAdByXTPjzESdaew+xjSb8RbHTR6teiNOWHYKqGlKg7ZgOLCOKvDtUSdHC1P41gIU61iPFEvjB68t0SWHqVQRUoZtwFNtJQTNCzppXZcFHzy454koZGWE+eTxr4CV8gozeURfZOfPziE6Mm9nbVhFGdiyZwQL4qo7BI7RA26Wwz162XNEGVjnwetIhyBN79dv5IDPvGHHxuF2JXuiKBIj2MgIN+2GxQhdtddUvFqBYxtkWFBdY9Eiv1ULmGA6jMIyiXP5BZKmAdVAVr/xr8TJhVrQieVgulhP6OTOauRtTcGReI/0SJwXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/EstXQWI7fTYjG6nR8Rf+nSkrpHj94TPD1Hr+B0j0g=;
 b=PYj/JuUiTId8p01LEAGBjtzcQvrtrXRH4gXfuQBccT9KtPilJBvPGLbTDs2W4vuFzuUtE0yeg9mli7d1WfpBtmw/Zl8alFCrLq4+LQ1jIbsnNO1h+JdZGuCP0PYzEhtb6f8LVbuQfmg9xlBRyT+3khUUvPvDiYo/hZshyWsxJWmHUsSxHTvFnS33QY3lITxvqr3jGpommu56I8lMxyZK2LgoAdRoPuZb4Z0N5z5vbF8Iytn6CjWFV0EqBlaM5ZZHwa+ARLDknskQ6GC+AXPOIoUve2KpfrokqaNV8OQfkM2A4LbVqq7qpzy70fWBk9Qh/xT1a1HhQFK7IoDNpwgcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/EstXQWI7fTYjG6nR8Rf+nSkrpHj94TPD1Hr+B0j0g=;
 b=PSYiYjue/6yr6YLbmpPxhBsQyJP4WPYGyRqYu3vEciakMuq6VVbgDqgQkrc+Y0mFE+95GqOOXKdXoPgjRhKDqR/fgbtn0vCqWitb7EoSotxAfVp4/h3gvuJGEuY8sKXkKgO5p5jG6WQQwqiHffAkLD6+heMp2obFqBWvem3aaJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] Xen: fix EFI stub wchar_t size warning of arm32 building
Date: Fri, 1 Jul 2022 18:13:58 +0800
Message-ID: <20220701101358.954527-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 2b3eb207-686c-4a72-4de6-08da5b4a8a7a
X-MS-TrafficTypeDiagnostic:
	DBBPR08MB6105:EE_|AM5EUR03FT055:EE_|VI1PR08MB4606:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IxhfBXowXFiHh85CUUR/wu4uXKCrqasI8kMOwgE8FoK0QLHteVyVbrZae8rH2u0azRxNtUSM0xp9EREBJkviMlsIMwy3z9Do+GjnmeflT4yJ3PdUIJ3CL8QnT/1K2eOMuVESGG8X4SMn+gPmz2NeCEPNXxT2XNyOT6KxkzHFf7Qm2e5i+gEHHQTu58Pr9Bl5Ffv4la6HV8Mv6P8LeCvr61Rh7XDDoRYW1T+y3SK50rUqmvriyu85QtUjaUO1p3khFnkhZAZhGUAIQghhPjTgEqGaCGBO/wTWStCts4FA7pqlxlHVMM61yUfB9kfGMuYPTpCUAiva2Z5Dt6rHaDUNuGK0xqNNvHsn4PpUwKrzwapNdU5GYdaLUQcZrlhsWpzKrFmHQj+IhRdsGfGubs+vcOC5BIvwQl84e2EbAx2rZD/UQLpu/rDuaTu0PBprwcFHEdh2xY/6XK5QGM3i7anJx7WEQzIu3/kbCjvpy82dH8O9zY6GqhoFSriktbFTfD7YqkF52x1vbqDQZ1sE/tzYlD2/nkcMZujsTNaJKdrC0elNMJMvfF4ml0Dc9jq75dJcHKK8jrQYJZzwVXP3AtOQKloZsOLvvyX+33W/ndukj4xQlQ1fUGN/Hq3N3tgH5hSI2li1eiAonxe0m67mHkeKUTbr4fJuDS3hdxUkOX6YSZxKmvJgPLyo9iPkHFn/W/MiGsHHscR9pqjAu0W/xI8RToUxPr1wQUWXoWTPt1voi3VgNVjUhD6LoROtkdjB8++VFk8638X02P8IlJNi7+qKD0kPXWUI2mhFaW9rHDN7hrqz+jT5iXyETaIXQabGEjLbc7ayGFoNFSICeZPWLFWv6mk/dwoEIDx2GCdSszgpcds=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(54906003)(6916009)(1076003)(26005)(426003)(336012)(47076005)(41300700001)(70586007)(7696005)(2616005)(186003)(82310400005)(44832011)(36860700001)(316002)(82740400003)(356005)(83380400001)(81166007)(40480700001)(478600001)(86362001)(8676002)(40460700003)(36756003)(6666004)(4326008)(5660300002)(70206006)(8936002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6105
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7dc6eeba-a208-4db1-bd8e-08da5b4a8486
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u8GBPzuW/tfQktXjpgUejg1MhvsrEgdanpw7HyCxg0KTbi4SE9U07XLW9U8KjYqZgGBS8SZZ4HyPGdU4zc1WqJLyrDAjHItFweo2Xx5s0Jp8Y3xKv+Dw/l90mEPoWNaleecrOXjv0vv/tAZVHKiiSVZysQNEEcJ4/0yfkAw7m0vq0sT04drjVuGwwbT5vrtbZ/1zJrydGtoqOfaDA/uUU18hK6mfmcPcGtSFZ56BKfn+RntPtmw8zUxx2S10X3/C5FtcLyezyFBGhZmYaTF17dQeUqPlbSi3YZucWRwuzGWY7Xxk8UN0oMF2zpgSwKvp6tUIi0ISFJ/qbFxqC3lwXl3OCai/iJsToHckMQMqhP4PfzyBsqe/nb+YYZtI/RFhYBM97DdL/6PY7dC7YkEOWjY5ZZG42PpnGx9dAu0rrWi0NAuBXMLOxS7vlCG5lF2SM0xA14e1JywufT8WMW+35cr5+NBbTzXhZ/2xyXNGHmHz8809FF1TKPbOSoGuDoAPN2u83jdjOwQ+5ukHqcepAu2kT5nv7jdOYmqcZ6CnttbnRIbSZVOXXPpXYfb+FCHpFbBRkJBp9lOzEGk11MkJONIZqEYfxgMdnn0qGf+gBAnrPrbWdrND+3j+c8fjT921uOQnXJ2Tf9G+PdzUWD1Kinu9/FDFpQJr7//s4VeDBjcIBjWYz2TAtGhhn5+jNCFvIFKr8PST6PKznD+uovDGJ8nswu0oxWUndJjRiPYJdmhAQp+h/R834w0LDQbRO4SXl6h583llaSgEReruCbgdvS7IS/hdhZTE3zu6VdjFXekk6B6Jw8qP0Dd+thHW+h1S
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(70206006)(107886003)(70586007)(4326008)(1076003)(86362001)(2616005)(8676002)(41300700001)(7696005)(478600001)(8936002)(2906002)(6666004)(40480700001)(36756003)(54906003)(81166007)(26005)(5660300002)(6916009)(40460700003)(36860700001)(316002)(82740400003)(47076005)(426003)(186003)(44832011)(83380400001)(82310400005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 10:14:53.4700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3eb207-686c-4a72-4de6-08da5b4a8a7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4606

Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
is using stub.c of EFI common code for EFI stub functions. But
"-fshort-wchar" CFLAG will cause a warning when build stub.c
for Arm32:
"arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
wchar_t values across objects may fail"

This is because the "-fshort-wchar" flag causes GCC to generate
code that is not binary compatible with code generated without
that flag. Why this warning hasn't been triggered in Arm64 is
because Arm64 does not use wchar type directly in any code for
parameters, variables and return values. And in EFI code, wchar
has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
CHAR16 has been specified as unsigned short type in typedef, the
"-fshort-wchar" flag will not affect CHAR16. So Arm64 object
files are exactly the same with "-fshort-wchar" and without
"-fshort-wchar".

We are also not using wchar in Arm32 codes, but Arm32 will embed
ABI information in ".ARM.attributes" section. This section stores
some object file attributes, like ABI version, CPU arch and etc.
And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
but for object files without "-fshort-wchar" is 4. Arm32 GCC
ld will check this tag, and throw above warning when it finds
the object files have different Tag_ABI_PCS_wchar_t values.

As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
to use short integers (2 bytes) instead of integers (4 bytes).
So keep "-fshort-wchar" for Xen EFI code is reasonable. So in
this patch, we add "-fno-short-wchar" to override "-fshort-wchar"
for Arm32 to remove above warning.

Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/efi/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index dffe72e589..b06fb96c1f 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,5 +1,9 @@
 include $(srctree)/common/efi/efi-common.mk
 
+ifeq ($(CONFIG_ARM_32),y)
+CFLAGS-y += -fno-short-wchar
+endif
+
 ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
-- 
2.25.1


