Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349CE53E03E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342284.567371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43n-0007x8-4G; Mon, 06 Jun 2022 04:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342284.567371; Mon, 06 Jun 2022 04:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43m-0007sE-Vc; Mon, 06 Jun 2022 04:09:46 +0000
Received: by outflank-mailman (input) for mailman id 342284;
 Mon, 06 Jun 2022 04:09:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny43l-0007op-AP
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:09:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e484c36-e54e-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 06:09:43 +0200 (CEST)
Received: from AS9PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::30) by PAXPR08MB7575.eurprd08.prod.outlook.com
 (2603:10a6:102:23d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Mon, 6 Jun
 2022 04:09:41 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::86) by AS9PR0301CA0030.outlook.office365.com
 (2603:10a6:20b:468::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:40 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Mon, 06 Jun 2022 04:09:39 +0000
Received: from 255bd13d042f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B9A23BA5-FF17-4655-BCDC-E795D194E9C6.1; 
 Mon, 06 Jun 2022 04:09:33 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 255bd13d042f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:33 +0000
Received: from DB9PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:1da::9)
 by AM9PR08MB7290.eurprd08.prod.outlook.com (2603:10a6:20b:435::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:32 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::f2) by DB9PR05CA0004.outlook.office365.com
 (2603:10a6:10:1da::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:29 +0000
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
X-Inumbo-ID: 7e484c36-e54e-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TNr0nDJy/7sNDpTUonGvwMqf8fkAXncvAU69Ru2/xzzsjcUtYj57MwVe/MPbgM24s0fBHZ9iv6Ysr/A3RmPVX4/6z42AeAUn7lb+ziPLQOU7X+/VcmQyM71pTauqPsZwZpqNgdYOL6MCz3IsalafwkVLdbk1xQm9sWn2QYiTmPDYkm+3g60Res6mdNINU54ltNINiuKVwyXkvl3zF5lKxciI96gC3CNM1abCBK+2zLTc/k1dnCRY/2Z/wWuN1Im4sJXcW1ehR/VgZihyIGEyvuQO3tvT+ZTVaCSTAW8y7PC3f2SK/QY4di/6vjsX9XLGfoQl40zPuP9oP5zQxQxo3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=eJORL2AI6zonlga9Yz9hu3+XMxnqTsol28qGqXVhfU8pGroO1RQVlO3iv3Ybp5fd1IXBgji1Yj0cGZQ08HVFyfHUU0uZkro5Ot+IYVm9mk2lKk8zlge1vlsh3k3+hjcJhjkJa/sqIUP9HtZMYNHkrOlPE2Rv3Chf+vgfQCwA1D9FUrKHI8p0aRrMuRU9saigJgddIpNyur0INewWsC0BG1L+NMQ8YpoLbUNc53xAfbKSUbJxuUZL15BM7V+e2SiMwrZqKDd8y27Y3WZrySsIL7m8z/vrDFkkDYSwCafEtuK1+TKY2Suf8jqGNPXbvsDXYuv8hINYWwXiODbm4AbyGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=9thj/v2wtL4oVwQ/98ic3OTVm0anXvgjoDf+8B62IolFr6XWht4FvuDFdMmYlRTOJA2VfjDW140Q5PtFs/pNhwIbLUZPPtB4kFgEu8FbVRk7Lf8g3sgPd7vHUjwux/0ismwQy5744pT5TjXaf/8jBv7DE+OLirXSnyMqiuGiZsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f02ca4c2c1ffa36
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvm8xSS3GZChorjhWRJBrOHsUVgeDPIcCWscxdoQSuxY6tehw547EKGkRtdvYEZ6xw4dmyknP9sSJrSy2kniQLtVQiOOvjqVFnjNFvC/S1j0klqxazexjJ72+M5DkDqXHlnzQWLDxU4zr/2rcdmkVqFxjpvaLhCP/lS2Y/rpVjEDytdEYNiqVOF3lzCi027HVIRHazU6eDbPcaO2rxRwdv8W9iXR2eZXNg3VDqqrFwuaCFYJkl2oZwOsz4EabyESTZAWTHgtR8ORVAkzjEHMpqrlekiKGGnlj66EOCRUNVOIffBRr1mpU/WmbXV8CJmpOcOOGOssZnTMj77IuEJXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=HWTMmD7ii6tGT3gg7ZNeTmmPWNfsFeebDNX7SWLfbBTzlFk7dI/wDY5EoF7YzEX1/BpoBnqZVRNd/mlWpW4WXXZRCFlpP5pTlj//pIjywly7D+UktPzytXVRc/6658BPaKmYdP1VhnY/4/BDiexPVE5AvAHczoNmtGxvb1nj6v8O9hxqwbUBCJsP0SeU8feYMTq2qR0Lcu23vixd6QIctFLyrS5f3jePy86Kw948P1BQ73YISJhrhgBWkBdeFaxG7eZfRbp9ijBnut5VtdlZklhzNrs+bm5DvfngQnKPGfbKcWpBET+araCZpZTvLPz9p0kuKmkZVTELvYlqTwJuZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=9thj/v2wtL4oVwQ/98ic3OTVm0anXvgjoDf+8B62IolFr6XWht4FvuDFdMmYlRTOJA2VfjDW140Q5PtFs/pNhwIbLUZPPtB4kFgEu8FbVRk7Lf8g3sgPd7vHUjwux/0ismwQy5744pT5TjXaf/8jBv7DE+OLirXSnyMqiuGiZsk=
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
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v5 2/8] xen/arm: Keep memory nodes in device tree when Xen boots from EFI
Date: Mon, 6 Jun 2022 12:09:10 +0800
Message-ID: <20220606040916.122184-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: c1a36ab5-1900-453d-886a-08da477260dc
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7290:EE_|VE1EUR03FT050:EE_|PAXPR08MB7575:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB757516BFD2DDE53BA82E853B9EA29@PAXPR08MB7575.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9VK3bKh8C+P/DnVk0+KnSSzZ4OpgFJ07m8tpIs8MXS6cchtt5mqOItI2BudaxnIjU0sBHbBrBGH3dwjqscEinWsfCOBem4HQhWt8zsQLm5papxFgKtGpBuFyes9OIG/9pdcFT7bQLB9Ehx36GBdLeYIm7wchPGDKDL5moA/mgu/R3qHEEVl/VX3xJYBvjYQMz8K4yWq9dg3AQoHYY45YTC7w2qS+aQQVs5N43eh418jaq8r5w17OLUM2Ep30b0YmqZV0l6Ua2iLzSQsdpoR8OfqnGrXgqJx1fT/RPBTaz07sHZoFaf8Zk0ZSUky1RQ2xQyMeJf0D3+Qnc3eSIQpR0bDXnI/EPckrBhKoHuZW0eZ+R4XGDLJ/K3GTeGJLgNuKOz9JnKl9ZuQteB/LZYXiiQyEZouT+T8HRlH+g481b3+ZPeaef3IrGibwL6gk6ANMl0ItzNnL8wURFxgjXTFZ+8F0SEJt+fJJGb9SMb7nDvRM+t++jfd9gRp4A1bqnE7PleVhDyjy/v6XfUqasidUxD9HgtRMRZOYs1aV6VochmfiwbtbrvJpynUPp3OGVlXxvb5gpBLxHVvXtV2bsjcRziIAUj1ZFsh5tjanA6GNRKKGjv0wZvYoV1WIFGFuHuzxDfquTH3PhSwoHfkGHXz6kC8kFXZUHrLOQks3qHChEJnUXIIZXfJ2M0mNGy6wjVAN77mYZUsCncLBu1Jjf2YVCQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(26005)(2906002)(6916009)(6666004)(54906003)(7696005)(81166007)(83380400001)(44832011)(316002)(36756003)(86362001)(36860700001)(47076005)(426003)(40460700003)(336012)(2616005)(8676002)(4326008)(1076003)(70586007)(70206006)(5660300002)(186003)(508600001)(82310400005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7290
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9fee6d00-a119-4b93-70c0-08da47725b6d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NpF85UpSvQMazgglJArmmY9xxazetA7Z1bRriDFN/ruz9PSOJ3i4/FrrPiuyXQiqPA2cWwZ/txpx4PeZfwOSswdDtlodD2E9bIkVR65qKnDlQuauy4j9wSC2WE2SqhchmcH0eTFc87QWzkRb2ZmpfDDjcyP2PamaCJdi0COFDGGVe96DEkONxwoKqGfnCXG7kTkoPIYwj2QvYYEDO6DBo1Ev8Nf4pC2auZoiaT20GhJWJnca4coFbIIFq3L6dOPrcbFI4azkOLAwjkOOSqU+GT/KFWAYRWqrQafch0ImIIFcft85T9rjz3feElW9cjBvoOw3eSbDCXuFhUQrT6Z0LSonjm8qcjyw5LKEOgSBHJmeGjYXtZ/610VpZOWCBPShvdyOE3p7VCURTV+KTsZm/xqNjDUytaW6bAsFmNbiuf6JjArKP2YYnNEmkiOAoB10hvJ51mR2OFjI0kCtAn+aAA0E223+9YWDdJkRRJXmHX1J9BN1ex3qBT727UcqLqRIAygwoD4bySHgbubx4oQDnGbTxZUkLScrBg+1VKlQm8puA+DXr+TfgPjreLrJSuj1kpbO9SGCmoiqL6Neb0AMhPpJ3w5ouEPuwoGQiUxu4th487aNNB1GDkyVkpgVVJK4Z8LO1pCNAaylVeysoozraQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(81166007)(4326008)(8936002)(8676002)(36860700001)(5660300002)(36756003)(44832011)(82310400005)(70206006)(70586007)(47076005)(2906002)(316002)(6666004)(83380400001)(86362001)(426003)(508600001)(336012)(6916009)(54906003)(7696005)(26005)(1076003)(186003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:40.2162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a36ab5-1900-453d-886a-08da477260dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7575

In current code, when Xen is booting from EFI, it will delete
all memory nodes in device tree. This would work well in current
stage, because Xen can get memory map from EFI system table.
However, EFI system table cannot completely replace memory nodes
of device tree. EFI system table doesn't contain memory NUMA
information. Xen depends on ACPI SRAT or device tree memory nodes
to parse memory blocks' NUMA mapping. So in EFI + DTB boot, Xen
doesn't have any method to get numa-node-id for memory blocks any
more. This makes device tree based NUMA support become impossible
for Xen in EFI + DTB boot.

So in this patch, we will keep memory nodes in device tree for
NUMA code to parse memory numa-node-id later.

As a side effect, if we still parse boot memory information in
early_scan_node, bootmem.info will calculate memory ranges in
memory nodes twice. So we have to prevent early_scan_node to
parse memory nodes in EFI boot.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
1. No change.
v2 -> v3:
1. Add Rb.
v1 -> v2:
1. Move this patch from later to early of this series.
2. Refine commit message.
---
 xen/arch/arm/bootfdt.c      |  8 +++++++-
 xen/arch/arm/efi/efi-boot.h | 25 -------------------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 29671c8df0..ec81a45de9 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/kernel.h>
 #include <xen/init.h>
+#include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
@@ -367,7 +368,12 @@ static int __init early_scan_node(const void *fdt,
 {
     int rc = 0;
 
-    if ( device_tree_node_matches(fdt, node, "memory") )
+    /*
+     * If Xen has been booted via UEFI, the memory banks are
+     * populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_node_matches(fdt, node, "memory") )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index e452b687d8..59d93c24a1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -231,33 +231,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
     int status;
     u32 fdt_val32;
     u64 fdt_val64;
-    int prev;
     int num_rsv;
 
-    /*
-     * Delete any memory nodes present.  The EFI memory map is the only
-     * memory description provided to Xen.
-     */
-    prev = 0;
-    for (;;)
-    {
-        const char *type;
-        int len;
-
-        node = fdt_next_node(fdt, prev, NULL);
-        if ( node < 0 )
-            break;
-
-        type = fdt_getprop(fdt, node, "device_type", &len);
-        if ( type && strncmp(type, "memory", len) == 0 )
-        {
-            fdt_del_node(fdt, node);
-            continue;
-        }
-
-        prev = node;
-    }
-
    /*
     * Delete all memory reserve map entries. When booting via UEFI,
     * kernel will use the UEFI memory map to find reserved regions.
-- 
2.25.1


