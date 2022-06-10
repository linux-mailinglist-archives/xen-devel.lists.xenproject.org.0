Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF4545BED
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345806.571543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXb1-00013e-5y; Fri, 10 Jun 2022 05:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345806.571543; Fri, 10 Jun 2022 05:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXb0-0000z9-Vh; Fri, 10 Jun 2022 05:54:10 +0000
Received: by outflank-mailman (input) for mailman id 345806;
 Fri, 10 Jun 2022 05:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXay-0006br-M0
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:54:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd6b350f-e881-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 07:54:07 +0200 (CEST)
Received: from DU2PR04CA0328.eurprd04.prod.outlook.com (2603:10a6:10:2b5::33)
 by AM6PR08MB3957.eurprd08.prod.outlook.com (2603:10a6:20b:a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 10 Jun
 2022 05:54:05 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::5b) by DU2PR04CA0328.outlook.office365.com
 (2603:10a6:10:2b5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14 via Frontend
 Transport; Fri, 10 Jun 2022 05:54:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:54:04 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Fri, 10 Jun 2022 05:54:04 +0000
Received: from 33806bc2eda2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB52A1E6-B8CC-4081-A99C-0E5B26116A6C.1; 
 Fri, 10 Jun 2022 05:53:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 33806bc2eda2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:59 +0000
Received: from AM6PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:20b:b2::13)
 by AM9PR08MB6802.eurprd08.prod.outlook.com (2603:10a6:20b:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 05:53:51 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::e) by AM6PR08CA0001.outlook.office365.com
 (2603:10a6:20b:b2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:51 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:50 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:47 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:45 +0000
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
X-Inumbo-ID: bd6b350f-e881-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AIm+ukrKRp7SiLzo2UB3Zb/xaPUU667ynDB8ZLNrai8wIWQNDIVNr3gYCsJPdBS9V2FUZfPmLV74fHbkbyuyOkl99zotxER3BEMUeQO0Agb006c2JulISKh6Kmi+/qZcYOzPNv5G5K9HTOdaWL6lGBxhVZMRiQGcNf7ZWN49+4Q7PosTShTiIM9mYaNBOXQVs+2To50WP68M+IW6dL8aOszNLB6p4QCABNQd0wPkWUJ71ZnZ7d154DL4IcqwB+LA5Bt46QXJBb2bcvqyGguWTUeyOFS67cbR7KevY4SAmQQ74KeGUYC0fwibz+4S6w/0jaDwa6cRkAMdWGA2BoJ11Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71g1qCFmdU3XbQ0p2R4qHlQkvDUCjtYpciVZO/CP2Pc=;
 b=TPXs2x77o2i4gqfSDTeR5wGsglCCVxcKVf+bZpcMfLFsmURj9by4kRicw/evM0cbwxz8HEQT4IDQJA3/sACu/jOdNp+zotwgHWDKVeu0rRnOe8D408hr5CEYsg1FDquSMy0lCIgc96Zf2ZnHDrHRm4H3w4V1sNffi9+hSBGlM+hiNrs49HlYczbPTpXcL5mm52sOqvDZ5nvLgeCi+GBvZMy7l3E1lmQpjpvwWvXe7pTUsNwoGHxcTwWXOVWc3CVO/c3SXGBotI0KIH0JZOL1S2ILQLG5G1gTNFleB0HJx/gf52j02yAy5j5JBCxsdsr7/iMuOz3z63qEligsnebPjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71g1qCFmdU3XbQ0p2R4qHlQkvDUCjtYpciVZO/CP2Pc=;
 b=CzDjPGqwDAetOF4tqxe2rp1E0JF5d9FVZ6UrTB33XBroHuNYSibv5bA+MYQv0VmUHNNJjVIbwoofi0X3PENEXrSByQ2YNB1+O1zcpEFiVtyH2WboyZO2idW2Y11FuW+G4w6JA1XOQ3RT3c7UVgeQJN1NSp0CFjGrFj3T8SgFoDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ab16ee7f36652e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knwkhk5mwSdPpW9ZYo9K2GBneoFdNpKV8oWCqDJpMD55Anm69xPpP5mroImx/z2MjyoPfa3d/+HOaziC8DczfVU1L/Ksf5BMQYSTjV7Z3UdPXpD9xKqtxd4rpmLu57GHdDUuQpZeXXfFwD5XWOH2EnyyOmHXH9dBKnj4PDStxfAEhBT/37W2XfIXteniGcDnmDUWveHia34l+GQ8O2ZVHFN74mkrzlZodr3B1T6TLOqUP9vQApzLuP4VBVzKSoX6Po6KkVMRPf4hO0Yyw0NZBJwsYZRN4xnqXg3193pqaRZsMKfE9cD0P6SQBZg96PR3jjzwykVf/+AUF7oIOjeCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71g1qCFmdU3XbQ0p2R4qHlQkvDUCjtYpciVZO/CP2Pc=;
 b=Cj0tu/b8DLYdt1Te8BL4jeyFIgVA86FoLfq1winHpUGOxbBYLjXIdd7VxPSOj3F3V5gdTgRwRIemROqBjWBvi4uE8IASBPuWwwo67DS/StlfBjShUR/HtifNR2NEfFNQekXTOKg88E4rucfpozJ+9ZQ3PZF4t0Ywi7sUl04JIjQTfulka5WFj7zvSN62NzoFK69xId+dGhgEmCAV/RTJZEXyny28c2LeDjkdyVwDte26IrRAe23id1wtT3XEl/3AMv+6jhf+QnBTZb0VdRAkS+KwVydAShuqQOCVezIgOh3nm0jauLNft8s/DsSI+0MfDei8FUzchwE/sUi08ECeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71g1qCFmdU3XbQ0p2R4qHlQkvDUCjtYpciVZO/CP2Pc=;
 b=CzDjPGqwDAetOF4tqxe2rp1E0JF5d9FVZ6UrTB33XBroHuNYSibv5bA+MYQv0VmUHNNJjVIbwoofi0X3PENEXrSByQ2YNB1+O1zcpEFiVtyH2WboyZO2idW2Y11FuW+G4w6JA1XOQ3RT3c7UVgeQJN1NSp0CFjGrFj3T8SgFoDc=
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
	<wl@xen.org>
Subject: [PATCH v6 8/8] xen/x86: use INFO level for node's without memory log message
Date: Fri, 10 Jun 2022 13:53:16 +0800
Message-ID: <20220610055316.2197571-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 3c8a299a-9af0-4388-c5b3-08da4aa5a060
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB6802:EE_|DBAEUR03FT010:EE_|AM6PR08MB3957:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB395794CA5A2E41D1F0E1276D9EA69@AM6PR08MB3957.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nRBxxvS6+3OYtOYc2d6VW0I6xKS1Pide9bBnoRZhr4lwO14UI1e+c9m5n0twcqiI65PsFxHnuCcUl70cc8U1UfacYyMpNh7Lc5c2scpXeLaWpTvXLBfm1TuVot/Eme6v31x8MX3wXkA4KsWw3pq+6IufXE7dkbUU1Hv59nMh3ll69cKAxEGZ7qghs26X6Al/+Q6f/NqV3iwuDOZUsjzTrhBQRu19/h+9ep0IurPEvGeTUOyl1udJgJO6KCJvjDYlwbn9azP4FHhCG1LF4NvkimxD4qGx/tcFyrVUXYpOQiJJB8XUtk5JQbT3DBUR3M232n8QplWRfxu7rFV24MhFGGRaYx9G4f7AB6XNfAfQ3AblvajACVmXGhB3Z8qqnauoL/MlKeYx/WSKlh6dW8h0zqFvXW2aS1B4sFgEHfyz9+3rJjAuOjaTdBGqhKcDtDA0i1AaerA7PnKGUKpVI/34FBVRv40bGJ/vWSH8BIw1CEG7J8iPFTqtaO0gWM3GbhxYYfCymuanRU+g45hlBjLKV/kGFnUYgB40QHEu6i+bt4yW5Tyn2KDuDIQR3p2ZMpgMkuRGdNTM11gPmh3JCkv3Sb8ffIkisgGJC+lx8HYpOovD+lXTKgDwG+2WGRdlN6HCmd0nu6mMvFetsqwgSOYBdHiMtcfw/htfHRmX5ahS8PjRQckOY5BvbKp381RJmCRfe/vhB5BiE9vkAo6/R1wBHw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(426003)(508600001)(336012)(44832011)(6916009)(70586007)(81166007)(54906003)(70206006)(316002)(40460700003)(15650500001)(82310400005)(8936002)(4326008)(6666004)(5660300002)(7696005)(8676002)(26005)(2906002)(36756003)(1076003)(36860700001)(47076005)(83380400001)(86362001)(186003)(356005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6802
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4da6defc-fd78-455b-ac90-08da4aa59816
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ZB4quyO7AnNEQelgEiMev4cj4bPpb4H8nB9OiD2Blk/jGkpjkR4ZG5A8GaPnCrN66tpHmTaCTqRel7AuNE/4U7xdDzyY4aiJPH0oMxMOrOAaB5izCamcRRHoaT16+VMjsWWEG9TSO6HvXWRL5rkSLKHnU8azNjOHb0+1aPDz6/54kg/OG6HXduG6r6+/Qyv8NKrWyqmr30/yFRh1KsYkKpb5i3k63JlI0ZhLQHgSyosyqeVh8XCItMI1LHpbaC85cr1P/sjusc26F2SFcVd/ympxMwrcXJkVrOznC2pZ4J7361gsmrohh/q3cRQkFaD66bZDWp4ZLV765EF1Fg7ocnKyO2I7JYNvPctDETuCnMIUuvv718hYjjohPRH6vcYs+QlmlGtbPo5QbxgNsY6iscH+ZGe4uIKuFE0T1ghJMOtf5XP15gb2i+atUW+0fEPpa2R4/3amHNmQlJmvdayDne5V3YizQHf5k4l6NsnFHTkuw+R24G3lSXCU2zUXt+MPhqopMND+xGU/rCKbfAUkK4Ezhe/VfzXX4BIEhTL8G9LRTw+VqzXmpBMAduKz5D1yDxTwrC3jaxMltflKNbVk0ixoqhk/ciwW0mKtf3EfilBH7psX7AeiScrSEuNcFdT5e8mjIdRqL7tXRoyKcNrqi6VC4t4K+1U4qvcb4SZa1ljFF+Z9M8IAhsA/YPu0UuW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70586007)(5660300002)(44832011)(4326008)(81166007)(36860700001)(86362001)(1076003)(47076005)(40460700003)(83380400001)(6916009)(186003)(15650500001)(82310400005)(8676002)(426003)(26005)(336012)(2616005)(70206006)(8936002)(36756003)(508600001)(7696005)(6666004)(2906002)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:54:04.6946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8a299a-9af0-4388-c5b3-08da4aa5a060
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3957

In previous code, Xen was using KERN_WARNING for log message
when Xen found a node without memory. Xen will print this
warning message, and said that this may be an BIOS Bug or
mis-configured hardware. But actually, this warning is bogus,
because in an NUMA setting, nodes can only have processors,
and with 0 bytes memory. So it is unreasonable to warn about
BIOS or hardware corruption based on the detection of node
with 0 bytes memory.

So in this patch, we remove the warning messages, but just
keep an info message to info users that there is one or more
nodes with 0 bytes memory in the system.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Remove full stop and use lower-case for node.
2. Add Rb.
v2 -> v3:
new commit.
---
 xen/arch/x86/srat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 3d02520a5a..b62a152911 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -555,8 +555,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 		uint64_t size = nodes[i].end - nodes[i].start;
 
 		if ( size == 0 )
-			printk(KERN_WARNING "SRAT: Node %u has no memory. "
-			       "BIOS Bug or mis-configured hardware?\n", i);
+			printk(KERN_INFO "SRAT: node %u has no memory\n", i);
 
 		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
 	}
-- 
2.25.1


