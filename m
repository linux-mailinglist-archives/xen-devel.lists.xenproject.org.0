Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0599861945A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437485.691910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqto2-00028i-88; Fri, 04 Nov 2022 10:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437485.691910; Fri, 04 Nov 2022 10:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqto2-00025c-4k; Fri, 04 Nov 2022 10:20:10 +0000
Received: by outflank-mailman (input) for mailman id 437485;
 Fri, 04 Nov 2022 10:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtd5-0001vd-7A
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2086.outbound.protection.outlook.com [40.107.247.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9f044e-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:48 +0100 (CET)
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by DU0PR08MB7461.eurprd08.prod.outlook.com (2603:10a6:10:354::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Fri, 4 Nov
 2022 10:08:45 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::c3) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:45 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Fri, 04 Nov 2022 10:08:45 +0000
Received: from ceb771fe5de4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BFBB272-F530-4515-8EF4-20AFEBC2A0B1.1; 
 Fri, 04 Nov 2022 10:08:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ceb771fe5de4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:37 +0000
Received: from DB6PR07CA0024.eurprd07.prod.outlook.com (2603:10a6:6:2d::34) by
 GV1PR08MB8378.eurprd08.prod.outlook.com (2603:10a6:150:a7::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Fri, 4 Nov 2022 10:08:35 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::55) by DB6PR07CA0024.outlook.office365.com
 (2603:10a6:6:2d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:35 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:34 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:31 +0000
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
X-Inumbo-ID: ac9f044e-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PLNcyejtY6/WEVJbaGzaKgu0ZHwWza4IQCCPqDTKli072GmB4ZScNjbIzzpvx4zoO241TjAalQMcXaagZcNSkpdnfUmr59r/E42At/WJe85ubyWHL6mxeQbF2+DGUe7MVfYx92yxkB3muGubxxXWnaPkKEwHs8fMu0TsYLmUJBCNUaH63S31GZ6kUlOU7AdCwSUj3UcrWhTA4Du7/lzoAkF6gAPtAp+Y/+4uYqGIa6XyewnuxSL/1EiHSLUYaOaDjE3p9JcciQx1VTlRMDS5mNopM2SCTS877u6rbZiFGEKMyT6tilwV9RJWcADuYLz4xUOdZC7DGXNw1M32AfvKiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uic3PsgqPkXcbmPMgwL4wCno3VZjcf0Iwj5c4HANmuQ=;
 b=Inp7CSP1fsIZgFAebqFappOa5MIiIdB7xstnBY8qrihe8IC/wWpTPFawvqJnhOXph0mk72r7/Dh6fhMEshGbIPiXxwULAr0bMenNqSGqhSuaEO4pa+NlnkNXLoHm4UjHs6bJ46qmZ2RVVyo+uBz4C2m6b/eGRKlZs1UaDQ+ui/QhKuxMjAFv4bBOS2bqYGyho0v17Al/z7pcEluxtnoBt34ShclGOmV+bk0l4SqkCD85brxphDLtN5D81BHsXfzg3XLh68DaacX5wLM2ZCdNWXj/VDVsc2JmC1ABBqQob7I5YHqFQvVZJDHJ2feykPMD5viTziBBKMPqqvD8JvBtWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uic3PsgqPkXcbmPMgwL4wCno3VZjcf0Iwj5c4HANmuQ=;
 b=AfSHcCNNuRFDOFT5j5arSkXDGGWiLWj9dNIRtNRbjUqlUUom2hK0RhYUvqSKqNoh1pNVsJmYWjwqy054tSEASVeGfQgx6kWpXwatMg+DnfCN4rasmhvnIgsOjzmSBz6sUShXmGPBnQrMolN7Exq7v9ln6qe3YmE9kB0rKMN3s9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eda649b03a586408
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+5mwNRWq7GST6dBN5ahyCUCl6FncvMKvyihbadkagTHK7pHnQMnT8pddsNyQLe3Ax3CvsNtZLiIs43fnGUWEjTM1VAP2r4doK334v/SQ1/TOlWWL98gDgRlP5249ZV1MmPJjS6J69Ml+che5Myf8nX9nTuIosgJfGcCmvGqBBTcwRtNQecWaGQhxOjIAW6wD3/7tje1VWseG3In6/31wqpzF5O3TSFxjG4oyK+YmvAehJgM0xmjaJrwbaTDhEHr335Wh45jCqeupUd6OIsXHbhDHDOyJyUw+JdBnatYls7WRHpLmjgJs5cVFyLPPIM1/OVv+JXYZ/LKYgNZBtbJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uic3PsgqPkXcbmPMgwL4wCno3VZjcf0Iwj5c4HANmuQ=;
 b=dvqneko4RNYsYPU4dSTzPPPQkBk1UWFUEFcJ9IZQgT7Ga1rdySMBEn9ManIzgBo5gulgtCzuL2Klm6xT34ZnapXwDjpvJeI3tEa9Vva+h5gz1VqdqKOVEfHjtAp1XRdp5hiJ9bL8aSH7Dj1WMFFGVwJnEMIs982yWTOSRbZPhmNTcU5NMP3cZyQf9V768WKueyhrqceev4owzop/Uh/vYZ4KQUtX0YJerCs4DjzqFnBqeQfNKnrwe5uKgwMNgrS/bASC0sOhNYe7KKrluSIolPbx+vszwFu173/6alLZgTH9D7UdXYIb03tYjxp8V48ljihkriOQhmSrESscUoumBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uic3PsgqPkXcbmPMgwL4wCno3VZjcf0Iwj5c4HANmuQ=;
 b=AfSHcCNNuRFDOFT5j5arSkXDGGWiLWj9dNIRtNRbjUqlUUom2hK0RhYUvqSKqNoh1pNVsJmYWjwqy054tSEASVeGfQgx6kWpXwatMg+DnfCN4rasmhvnIgsOjzmSBz6sUShXmGPBnQrMolN7Exq7v9ln6qe3YmE9kB0rKMN3s9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v6 09/11] xen/arm64: create boot-time MPU protection regions
Date: Fri, 4 Nov 2022 18:07:39 +0800
Message-ID: <20221104100741.2176307-10-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT019:EE_|GV1PR08MB8378:EE_|DBAEUR03FT017:EE_|DU0PR08MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 1288136f-ad87-4942-95f1-08dabe4c8f31
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YDz5fIJeSyTX9LXNBuPq6LGLd9xImAfIM7xMZdhKWCL77jFphZz9xhj00s4mq/2l2Qd3JnOnAMc1/tDWYn8I3TgeKtvoiBnOtLGP6xUi+zmzAR7XZiWA/4KHZheGF/N99Hb7yVnD6JiJiEXmVXVr0ZUMN2XBrBwqtb+i0IaBHZicffOBE9kpn4Fzer9evDSElbui0W6UEQlBS7yzqnbSG88vIXU4SgFqK4t5RBjq4cCoqLFcym924uUbzss/ggDQT2A+oE5U6iIN13XxJOB5WfC98qKz1KVNU/BN2OLoK95i5moVB7AgSVgCOshUshyQYLB9eDDwEKhyGkWcf3DYEo6nXRdIvUkluCh/oXhd/VfryVUU20C5hBQYMZHhttA8GH/aRSpOLFAGJgDqRIwerUHnpzITgUviKGOz8M2JM6TBJU/Tw+dgEP1CFu0mnYUcuzjJBtLs0tkqfUB2P7QroPKacwC5lePgOQ3T68GHAXXbi9LytMDamNGTo82xvIz0jlnToous0CHGRjmzQFlFKYPY+ynOPBIhDd1KImWbDqmcp7u4ve5xsRMsau7KSh2a8JfbsqjXWT5dMOxkvm3zXMTXiAPcgVSb8ItxOs7z6pqmeI4uwJJ5Y0fNNOktsbgpbNYF4oGyioT5nvFK4IzbKWAE0NJiZ5Q0EBIxlMRTdv2oXxzJz8uyJZQbtxyE+KFHk220TcN/M+XvrClzw7TgwYVLh49NSuscOwuTXCIlrAk67tAPzK+EXJQw/nZ4MzYvV3gdQTh7fJ0Aj7ZK2+nABn3i85SXph11S8mkZDv6bwrW6x8adaFRikRp81t+wekT
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(81166007)(86362001)(356005)(82740400003)(44832011)(1076003)(70586007)(6916009)(40480700001)(5660300002)(336012)(426003)(47076005)(2616005)(36860700001)(478600001)(7696005)(40460700003)(186003)(83380400001)(26005)(8936002)(8676002)(54906003)(70206006)(2906002)(316002)(82310400005)(4326008)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8378
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39221e05-c9ed-44e5-cf1c-08dabe4c891d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GyRyp1En9LbocdSwDhaWiKN87O/T3u2+3wMJ/HOpZwLQh7IgGn5QJ+86gQNJRy03CxjA+zivERxauDMGz7x1aSiAAE/XiP2vnP50jEY56ZtRoHbvxE/yXbOTb7MUgGy2dKRtJG+tBKJy1INpGz3Jn5+9fgXTlISv8MqQH1DQlZCjVcBIDL2tCU8VUIynvGQyIJpILlTBhOgTuMp4OIOsxo97VQrlNsy9qh8CArXf6DYgQk9h0MdWkyXdVdNSBC6Q9Rw5FtJ6xcipLCX1LVx+oTWBlCi2S17XaXPdxUYBN9OkgdUDkVGMI43QQxANeBOLg8eqvkF5+cNG41SUrayE3sgA2Z1BYi6hZsK1QxtBJoeuL5aacFUK8vGvTB+PDf/qizbYMAktMqo/V25nV+Lk/aypW7fa5/Z36duOwlBdSkBLBaLLCWxQex/MXMiP/GuiCijLq+8RdFa+Wp/qjGhCP838RIPOWtMwn/w2MW8tadDSPneMsrsUgoY3Ao5yaLFUJMBCrUd46qF1VkqsFA6dDBDRhz6mSiJKwFNT7uxRtDYZ4ADXxwLv6ALudSEs5omfbryc82cuD4RxOEklDEghpuYdE/tJbb8qX/RrSoH+wNpWg1qbQ4WWYZ5YTT+Y2ykzmtuS6OMGbNbdLGtAhWh+LoCS8e8qo61RAgCT/KINwp/0ME3TlFWMN4WVB+9wSjXjJSjarpMwwerwZr8jWJpZX1qyFx3X/exJERrHemou43+F70I+vGXL+/A/rGOrcEgwNZYr6l/OmIPx/wVLGW5QzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(4326008)(86362001)(81166007)(36756003)(82310400005)(8676002)(40460700003)(70206006)(7696005)(40480700001)(70586007)(316002)(83380400001)(336012)(8936002)(478600001)(2906002)(5660300002)(1076003)(44832011)(2616005)(426003)(6916009)(36860700001)(54906003)(41300700001)(82740400003)(26005)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:45.5529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1288136f-ad87-4942-95f1-08dabe4c8f31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7461

From: Penny Zheng <penny.zheng@arm.com>

Like boot-time page table in MMU system, we need a boot-time
MPU protection region configuration in MPU system so Xen can
fetch code and data from normal memory.

This operation need to access Armv8-R MPU system registers, but
these system registers are not supported in GCC version < 11.
So we have to encode these Armv8-R MPU system registers in header
file explicitly.

As MMU system and MPU system have different functions to create
the boot MMU/MPU data, this will introduce extra #ifdef in code
flow, so we introduce a neutral name prepare_early_mappings to
replace create_page_tables for MMU and MPU.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/arm64/Makefile              |  2 +
 xen/arch/arm/arm64/head.S                | 13 ++--
 xen/arch/arm/arm64/head_mmu.S            |  4 +-
 xen/arch/arm/arm64/head_mpu.S            | 70 +++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu.h     | 13 ++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 89 ++++++++++++++++++++++++
 6 files changed, 185 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/arm64/head_mpu.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 22da2f54b5..438c9737ad 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -10,6 +10,8 @@ obj-y += entry.o
 obj-y += head.o
 ifneq ($(CONFIG_HAS_MPU),y)
 obj-y += head_mmu.o
+else
+obj-y += head_mpu.o
 endif
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index d9a8da9120..6c1a5f74a1 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -79,12 +79,12 @@
  * ---------------------------
  *
  * The requirements are:
- *   MMU = off, D-cache = off, I-cache = on or off,
+ *   MMU/MPU = off, D-cache = off, I-cache = on or off,
  *   x0 = physical address to the FDT blob.
  *
  * This must be the very first address in the loaded image.
  * It should be linked at XEN_VIRT_START, and loaded at any
- * 4K-aligned address.  All of text+data+bss must fit in 2MB,
+ * 4K-aligned address. All of text+data+bss must fit in 2MB,
  * or the initial pagetable code below will need adjustment.
  */
 
@@ -249,7 +249,12 @@ real_start_efi:
 
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
+
+        /*
+         * Create boot memory management data, pagetable for MMU systems
+         * and protection regions for MPU systems.
+         */
+        bl    prepare_early_mappings
         bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
@@ -307,7 +312,7 @@ GLOBAL(init_secondary)
 #endif
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
+        bl    prepare_early_mappings
         bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
index 1a3df81a38..fc64819a98 100644
--- a/xen/arch/arm/arm64/head_mmu.S
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -123,7 +123,7 @@
  *
  * Clobbers x0 - x4
  */
-ENTRY(create_page_tables)
+ENTRY(prepare_early_mappings)
         /* Prepare the page-tables for mapping Xen */
         ldr   x0, =XEN_VIRT_START
         create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
@@ -208,7 +208,7 @@ virtphys_clash:
         /* Identity map clashes with boot_third, which we cannot handle yet */
         PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
         b     fail
-ENDPROC(create_page_tables)
+ENDPROC(prepare_early_mappings)
 
 /*
  * Turn on the Data Cache and the MMU. The function will return on the 1:1
diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
new file mode 100644
index 0000000000..f60611b556
--- /dev/null
+++ b/xen/arch/arm/arm64/head_mpu.S
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/arm64/mpu.h>
+#include <asm/page.h>
+#include <asm/early_printk.h>
+
+/*
+ * From the requirements of head.S we know that Xen image should
+ * be linked at XEN_START_ADDRESS, and all of text + data + bss
+ * must fit in 2MB. On MPU systems, XEN_START_ADDRESS is also the
+ * address that Xen image should be loaded at. So for initial MPU
+ * regions setup, we use 2MB for Xen data memory to setup boot
+ * region, or the create boot regions code below will need adjustment.
+ */
+#define XEN_START_MEM_SIZE      0x200000
+
+/*
+ * In boot stage, we will use 1 MPU region:
+ * Region#0: Normal memory for Xen text + data + bss (2MB)
+ */
+#define BOOT_NORMAL_REGION_IDX  0x0
+
+/* MPU normal memory attributes. */
+#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
+#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
+
+.macro write_pr, sel, prbar, prlar
+    msr   PRSELR_EL2, \sel
+    dsb   sy
+    msr   PRBAR_EL2, \prbar
+    msr   PRLAR_EL2, \prlar
+    dsb   sy
+    isb
+.endm
+
+.section .text.header, "ax", %progbits
+
+/*
+ * Static start-of-day EL2 MPU memory layout.
+ *
+ * It has a very simple structure, including:
+ *  - 2MB normal memory mappings of xen at XEN_START_ADDRESS, which
+ * is the address where Xen was loaded by the bootloader.
+ */
+ENTRY(prepare_early_mappings)
+    /* Map Xen start memory to a normal memory region. */
+    mov x0, #BOOT_NORMAL_REGION_IDX
+    ldr x1, =XEN_START_ADDRESS
+    and x1, x1, #MPU_REGION_MASK
+    mov x3, #PRBAR_NORMAL_MEM
+    orr x1, x1, x3
+
+    ldr x2, =XEN_START_ADDRESS
+    mov x3, #(XEN_START_MEM_SIZE - 1)
+    add x2, x2, x3
+    and x2, x2, #MPU_REGION_MASK
+    mov x3, #PRLAR_NORMAL_MEM
+    orr x2, x2, x3
+
+    /*
+     * Write to MPU protection region:
+     * x0 for pr_sel, x1 for prbar x2 for prlar
+     */
+    write_pr x0, x1, x2
+
+    ret
+ENDPROC(prepare_early_mappings)
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
new file mode 100644
index 0000000000..d209eef6db
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mpu.h: Arm Memory Protection Unit definitions.
+ */
+
+#ifndef __ARM64_MPU_H__
+#define __ARM64_MPU_H__
+
+#define MPU_REGION_SHIFT  6
+#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
+#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
+
+#endif /* __ARM64_MPU_H__ */
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 54670084c3..a596042d6c 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -458,6 +458,95 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+/* System registers for AArch64 with PMSA */
+#ifdef CONFIG_HAS_MPU
+
+/* EL1 MPU Protection Region Base Address Register encode */
+#define PRBAR_EL1   S3_0_C6_C8_0
+#define PRBAR1_EL1  S3_0_C6_C8_4
+#define PRBAR2_EL1  S3_0_C6_C9_0
+#define PRBAR3_EL1  S3_0_C6_C9_4
+#define PRBAR4_EL1  S3_0_C6_C10_0
+#define PRBAR5_EL1  S3_0_C6_C10_4
+#define PRBAR6_EL1  S3_0_C6_C11_0
+#define PRBAR7_EL1  S3_0_C6_C11_4
+#define PRBAR8_EL1  S3_0_C6_C12_0
+#define PRBAR9_EL1  S3_0_C6_C12_4
+#define PRBAR10_EL1 S3_0_C6_C13_0
+#define PRBAR11_EL1 S3_0_C6_C13_4
+#define PRBAR12_EL1 S3_0_C6_C14_0
+#define PRBAR13_EL1 S3_0_C6_C14_4
+#define PRBAR14_EL1 S3_0_C6_C15_0
+#define PRBAR15_EL1 S3_0_C6_C15_4
+
+/* EL1 MPU Protection Region Limit Address Register encode */
+#define PRLAR_EL1   S3_0_C6_C8_1
+#define PRLAR1_EL1  S3_0_C6_C8_5
+#define PRLAR2_EL1  S3_0_C6_C9_1
+#define PRLAR3_EL1  S3_0_C6_C9_5
+#define PRLAR4_EL1  S3_0_C6_C10_1
+#define PRLAR5_EL1  S3_0_C6_C10_5
+#define PRLAR6_EL1  S3_0_C6_C11_1
+#define PRLAR7_EL1  S3_0_C6_C11_5
+#define PRLAR8_EL1  S3_0_C6_C12_1
+#define PRLAR9_EL1  S3_0_C6_C12_5
+#define PRLAR10_EL1 S3_0_C6_C13_1
+#define PRLAR11_EL1 S3_0_C6_C13_5
+#define PRLAR12_EL1 S3_0_C6_C14_1
+#define PRLAR13_EL1 S3_0_C6_C14_5
+#define PRLAR14_EL1 S3_0_C6_C15_1
+#define PRLAR15_EL1 S3_0_C6_C15_5
+
+/* EL2 MPU Protection Region Base Address Register encode */
+#define PRBAR_EL2   S3_4_C6_C8_0
+#define PRBAR1_EL2  S3_4_C6_C8_4
+#define PRBAR2_EL2  S3_4_C6_C9_0
+#define PRBAR3_EL2  S3_4_C6_C9_4
+#define PRBAR4_EL2  S3_4_C6_C10_0
+#define PRBAR5_EL2  S3_4_C6_C10_4
+#define PRBAR6_EL2  S3_4_C6_C11_0
+#define PRBAR7_EL2  S3_4_C6_C11_4
+#define PRBAR8_EL2  S3_4_C6_C12_0
+#define PRBAR9_EL2  S3_4_C6_C12_4
+#define PRBAR10_EL2 S3_4_C6_C13_0
+#define PRBAR11_EL2 S3_4_C6_C13_4
+#define PRBAR12_EL2 S3_4_C6_C14_0
+#define PRBAR13_EL2 S3_4_C6_C14_4
+#define PRBAR14_EL2 S3_4_C6_C15_0
+#define PRBAR15_EL2 S3_4_C6_C15_4
+
+/* EL2 MPU Protection Region Limit Address Register encode */
+#define PRLAR_EL2   S3_4_C6_C8_1
+#define PRLAR1_EL2  S3_4_C6_C8_5
+#define PRLAR2_EL2  S3_4_C6_C9_1
+#define PRLAR3_EL2  S3_4_C6_C9_5
+#define PRLAR4_EL2  S3_4_C6_C10_1
+#define PRLAR5_EL2  S3_4_C6_C10_5
+#define PRLAR6_EL2  S3_4_C6_C11_1
+#define PRLAR7_EL2  S3_4_C6_C11_5
+#define PRLAR8_EL2  S3_4_C6_C12_1
+#define PRLAR9_EL2  S3_4_C6_C12_5
+#define PRLAR10_EL2 S3_4_C6_C13_1
+#define PRLAR11_EL2 S3_4_C6_C13_5
+#define PRLAR12_EL2 S3_4_C6_C14_1
+#define PRLAR13_EL2 S3_4_C6_C14_5
+#define PRLAR14_EL2 S3_4_C6_C15_1
+#define PRLAR15_EL2 S3_4_C6_C15_5
+
+/* MPU Protection Region Enable Register encode */
+#define PRENR_EL1 S3_0_C6_C1_1
+#define PRENR_EL2 S3_4_C6_C1_1
+
+/* MPU Protection Region Selection Register encode */
+#define PRSELR_EL1 S3_0_C6_C2_1
+#define PRSELR_EL2 S3_4_C6_C2_1
+
+/* MPU Type registers encode */
+#define MPUIR_EL1 S3_0_C0_C0_4
+#define MPUIR_EL2 S3_4_C0_C0_4
+
+#endif
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
-- 
2.25.1


