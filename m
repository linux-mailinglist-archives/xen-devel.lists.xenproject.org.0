Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BA530989
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335357.559562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WK-00011V-Ih; Mon, 23 May 2022 06:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335357.559562; Mon, 23 May 2022 06:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WK-0000yd-DM; Mon, 23 May 2022 06:26:24 +0000
Received: by outflank-mailman (input) for mailman id 335357;
 Mon, 23 May 2022 06:26:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1WI-0007pn-Qu
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42aecdae-da61-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:26:21 +0200 (CEST)
Received: from AS9PR04CA0098.eurprd04.prod.outlook.com (2603:10a6:20b:50e::29)
 by DB7PR08MB3642.eurprd08.prod.outlook.com (2603:10a6:10:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 06:26:19 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::d6) by AS9PR04CA0098.outlook.office365.com
 (2603:10a6:20b:50e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 06:26:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:18 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Mon, 23 May 2022 06:26:18 +0000
Received: from 1df778f9afdf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD48433C-39B2-4CE4-9B55-16FBCDE8EB08.1; 
 Mon, 23 May 2022 06:26:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1df778f9afdf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:26:11 +0000
Received: from DB6P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::13) by
 AM6PR08MB4551.eurprd08.prod.outlook.com (2603:10a6:20b:70::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Mon, 23 May 2022 06:26:08 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::c4) by DB6P191CA0003.outlook.office365.com
 (2603:10a6:6:28::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Mon, 23 May 2022 06:26:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:08 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:26:07 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 23
 May 2022 06:26:07 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:26:04 +0000
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
X-Inumbo-ID: 42aecdae-da61-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VgE00X9kVtQbIzXXEG9qzacXaXWER5WfS3RgOLR5DLxg2hemNnh3nh0nGjbNaFdNaZqqxNee3jbJ07RWFPQipE2yAnL9n32B+QOZc8bJi73fzIlXQxClg/sJ1CpSyc3Y0P55GPuyASt2NBtnYWr9UQCmBA5uEk5vKEknMznGk8AlhCLyGbvM5Rj2IQcnjWDxZ4V/ZSF6NmK9mnOql7TMrkg9bNGZJGbAtpw0uRmjxdFOu2JhcG0IBB0m7XmCffQutrCsCg1/5z/y3e0EUxNDXQ7JuZhqpiKjoDYZZ1oTjj/tJokYrkMIlhx4Cl+gQSBTOrknzRfhFh1qWwyYH25aug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLz9U4f5kBuwv8fnxvQyEObMqpaBQsZ5NTftoU1ebo0=;
 b=n3prIL8aCyivzg5zQ7tLjU6DctejpEnpIoUazvi1tIrgCi1Lj8UxzyITFDldqn0UDxse+R1qDUSNy13y/NVxnzdy9yNlrqfeqP+49Zffz3UNcXIhmcZ+FMHGqWSJy/e/TGFAVCdqaSQ+/dB0YRpQENwWUp450R/7ec5KPbROPSEvvgS5gt6B/FVd7k2Lteoqedluy3VtmRQm5VPcPC9rDKAvD/Tf4NdfQN3IBShLYcUHNPSYSnXJICSs8LrCxqQRkgHvnaJj7m9/E+1/ExBczE/Y7zFMIzbQ1kqxHGFb2D1tECzseoiQ0lYrLsjN+tZEg6fhSniRCbUmJl55fQgBhg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLz9U4f5kBuwv8fnxvQyEObMqpaBQsZ5NTftoU1ebo0=;
 b=Sb6cy0hPMNnvEwSqRE1pz9YQAl/r4PXPATqrH0cPntT7VVGCA4Tz94AkZURZb79Z2FrSeD0jVGwLKJHPQBsipDTgFm/FnKl0or2HOBlzVsKL+ZfhmAZTACZ21JkMIQivqJqdCZKnxzaNbkCB581k5QPRlccaC4U5pMV4iYOC29k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5aa893e04a90374
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izPrzjYtgf8q4E/3BmZOqMEJZyvmbSQNpw3zRAA7Ik2rGtlZ1NJcMyoovq0rSlJnHLFbF70+4i5LZDyFjm542mc30wIs+nQ3RYSyE/kZlQB/xdpXTPZNC+jnp3f9JFPx8hMsmDls5y586x85pzj0d2ka/DbiPwkNPLlQoxPCbF1PG557uYJyWyVDXFHDMLZgku7/Lv0xCt9knj8slJTtMxKVz3XA0uQNmunBmo1RbEWxUqQDIlW8h4V6fKLRs7P/zdrYFE6eozPM1hAO/A2qYNf+rK+QBYUaA0ZHk9ELgiZfgRQAkh1xUKIrNwPrcbMAjACpp8q+/5gJPHMvZZLqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLz9U4f5kBuwv8fnxvQyEObMqpaBQsZ5NTftoU1ebo0=;
 b=Rz/dc0gMbVSgScVb6fYy0gyutK8Y1fnpaJffOLTMaA3p5KUhp4FckbPSEPdyRfDXnOUSSZ77VvQswWp+mmLoH4J9g4ypPTWd8WL5p1OaCVfFqrtbUkJrllQE0DdrR+MSHkvelLKgRPnUDxMIbP+ud5xNZydieUuoMZkrO4D2sZNrgA7w2BCgETFtsznW7wwLP+moXuI9USZNRsDhDHnsT4vfqypbiL2ut78ESqUvZe8WZ4AVC5pXUj2e/BDrIj4aVAlDuFmPJ2/IoVxePmNiKaB1krUl4dmuCYuNYhBm8FtBuKYD/hKl9Yrd6mCKfNOTMXb9VDn5xwQBn+KwCDvhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLz9U4f5kBuwv8fnxvQyEObMqpaBQsZ5NTftoU1ebo0=;
 b=Sb6cy0hPMNnvEwSqRE1pz9YQAl/r4PXPATqrH0cPntT7VVGCA4Tz94AkZURZb79Z2FrSeD0jVGwLKJHPQBsipDTgFm/FnKl0or2HOBlzVsKL+ZfhmAZTACZ21JkMIQivqJqdCZKnxzaNbkCB581k5QPRlccaC4U5pMV4iYOC29k=
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
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v4 6/8] xen/x86: use paddr_t for addresses in NUMA node structure
Date: Mon, 23 May 2022 14:25:23 +0800
Message-ID: <20220523062525.2504290-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0b5b9c2a-c195-4d8d-76a8-08da3c85259e
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4551:EE_|VE1EUR03FT044:EE_|DB7PR08MB3642:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB36422AB72E778388D55E4CA39ED49@DB7PR08MB3642.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GJU/wEYLfiuXfxxnb/OkXgmAGgo9v8i1LBqLNl6GsNEL5d+PNXDK83Lp2t7SX5H3d2pV1jFX2NRNqYMQqR8rtSNNyUex7aW/EQFRhyTZpB8TqrX4JX2lIqPvyi1Sv+LD86/7xUgT17frvPQ4aQDg0XbYjrt5mdi/CBpOJGugNEqLOE9lhUrq4pgc0GUgmiHnXRjTcKW6BQJXMLMV2VvKcGi4RPfLw+79D5zlmxdsDKOsEk9mSPA7bCuGoNzk1WKTeArstSVAqo7JNsbKFeNxg91zcXbhmn/r0/mzLZZyoFB97EKrjjNd+AvNOvPni3CfJ8YCdDrCE/9LoX5sYPdbwX3c0xO6JFKqlCXrAycQY8WoLNTqXdljxlyXXAPl5FM/IYcJ2pCTAIDQ6Y0Xz42uYcTJsC0dLwd4RIA8LDoFlSbOIpWWW5uKJYlYE1fneOTFY2sWZFQ7M3niYqbTkxByhK5/EBQuXchFfkuc17195WNWd4+t8okINr5thy54GQdH+fi9mU1z0pdCo0Qp/NvL33P0DcTUR7dlCB3kVn49pypShQZTBfE+ZIfNisK4eHvxnLnNjVUHKoEI4eZhJDZIL9PLg7G90vpqBtWm6MxEpqfS9Xxn5PQKNBOzZuxnP3VRktVzKW5lJm7sUaGdcy44FywqPgCZEg3rztKh/2D+7/Bx2PV2hsCokfsDFaWWIoXad+S4eBoXCeeRtg0XgA+keA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(47076005)(316002)(54906003)(4326008)(336012)(426003)(83380400001)(8676002)(82310400005)(70586007)(70206006)(86362001)(36860700001)(356005)(81166007)(2906002)(26005)(2616005)(508600001)(6666004)(44832011)(36756003)(7696005)(40460700003)(186003)(6916009)(1076003)(5660300002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4551
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37b3d7dd-7440-41b1-9fdf-08da3c851f9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hs/ZPJRdBIgS/J3az0a2mKOs4wC1ndzzYEPeg+Po1qQpWDQEMI9hV7O7bAfUZ7470cO+2tIRyXzPNzF7vvnylMSarY6VmACC4ZcxtO8G0Ci7E61bUoJXZ2yKGkn4Gb/JX8dRr6IgsayOJMtSpPNibT4eZSnXvr1AVo1rY92eSjHzjRCZCZgseG8yt1FRaufKKd5G3+EMD5DwrVA8fqrLrjyQ7uJV3kM3Jg2J6gnn+Orc9Asnz3v6T03vfWGnftVthlM1hKDlbgmkwpmYVAtqZEqXsVkY7FGF3MYvG7CP9QQHApRdxXBtLJRIjUat9R/CJizjFbYmedJqkEnod5pFzZSD2tRwkEMMTDCUXBgLiryilmbmZ5qqpIaFnsDRCFHyjCW1FOzMC/urS+mS3hTDo5S1bfeSzRC3V/F8lKOwh9j6YJjtynf8zj2FQdLAh9+K5kIA4mVsDjKWRR2eHLK02yFFl1qCCprtdi9qPexfPsUO/esmz2T67aNqPP1cIqHhIjOz2E3P0Ui/gf8GnMS+7CbCouGYz+v+4/i48cAa79US5ynuDzLG11NpCiMSVrmyLfybbLIrsZT9FG4IcYKvOdavrXGViRTpJSzZKAh1y16n1z9otuChP10krXFHqBU0Es2L/kS/CDpcM5e0LZZ2AQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(4326008)(83380400001)(86362001)(5660300002)(36756003)(8936002)(508600001)(8676002)(7696005)(316002)(47076005)(426003)(336012)(82310400005)(70586007)(70206006)(36860700001)(81166007)(6916009)(1076003)(54906003)(44832011)(186003)(2616005)(6666004)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:18.4399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5b9c2a-c195-4d8d-76a8-08da3c85259e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3642

NUMA node structure "struct node" is using u64 as node memory
range. In order to make other architectures can reuse this
NUMA node relative code, we replace the u64 to paddr_t. And
use pfn_to_paddr and paddr_to_pfn to replace explicit shift
operations. The relate PRIx64 in print messages have been
replaced by PRIpaddr at the same time. And some being-phased-out
types like u64 in the lines we have touched also have been
converted to uint64_t or unsigned long.

Change-Id: Iac64ff398c10f6e642d40d06fc57e28806a1a4ff
Issue-Id: SCM-2240
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Add Tb.
v2 -> v3:
1. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
2. Add Tb.
v1 -> v2:
1. Drop useless cast.
2. Use initializers of the variables.
3. Replace u64 by uint64_t.
4. Use unsigned long for start_pfn and end_pfn.
---
 xen/arch/x86/include/asm/numa.h |  8 ++++----
 xen/arch/x86/numa.c             | 32 +++++++++++++++-----------------
 xen/arch/x86/srat.c             | 25 +++++++++++++------------
 3 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 5d8385f2e1..c32ccffde3 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -18,7 +18,7 @@ extern cpumask_t     node_to_cpumask[];
 #define node_to_cpumask(node)    (node_to_cpumask[node])
 
 struct node { 
-	u64 start,end; 
+	paddr_t start, end;
 };
 
 extern int compute_hash_shift(struct node *nodes, int numnodes,
@@ -38,7 +38,7 @@ extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
@@ -76,9 +76,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
 
-void srat_parse_regions(u64 addr);
+void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 680b7d9002..627ae8aa95 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -162,12 +162,10 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
     return shift;
 }
 /* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
-{ 
-    unsigned long start_pfn, end_pfn;
-
-    start_pfn = start >> PAGE_SHIFT;
-    end_pfn = end >> PAGE_SHIFT;
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
@@ -198,11 +196,12 @@ void __init numa_init_array(void)
 static int numa_fake __initdata = 0;
 
 /* Numa emulation */
-static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
 {
     int i;
     struct node nodes[MAX_NUMNODES];
-    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
     if ( hweight64(sz) > 1 )
@@ -218,9 +217,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
     memset(&nodes,0,sizeof(nodes));
     for ( i = 0; i < numa_fake; i++ )
     {
-        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
         if ( i == numa_fake - 1 )
-            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
         nodes[i].end = nodes[i].start + sz;
         printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
                i,
@@ -246,6 +245,8 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
 void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 { 
     int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
 
 #ifdef CONFIG_NUMA_EMU
     if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
@@ -253,17 +254,15 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
-         (u64)end_pfn << PAGE_SHIFT) )
+    if ( !numa_off && !acpi_scan_nodes(start, end) )
         return;
 #endif
 
     printk(KERN_INFO "%s\n",
            numa_off ? "NUMA turned off" : "No NUMA configuration found");
 
-    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
-           (u64)start_pfn << PAGE_SHIFT,
-           (u64)end_pfn << PAGE_SHIFT);
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
@@ -276,8 +275,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     for ( i = 0; i < nr_cpu_ids; i++ )
         numa_set_node(i, 0);
     cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
-                    (u64)end_pfn << PAGE_SHIFT);
+    setup_node_bootmem(0, start, end);
 }
 
 void numa_add_cpu(int cpu)
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index cfe24c7e78..8ffe43bdfe 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,7 +104,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(u64 start, u64 end, nodeid_t node)
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
 	int i;
 
@@ -119,7 +119,7 @@ int valid_numa_range(u64 start, u64 end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(u64 start, u64 end)
+static __init int conflicting_memblks(paddr_t start, paddr_t end)
 {
 	int i;
 
@@ -135,7 +135,7 @@ static __init int conflicting_memblks(u64 start, u64 end)
 	return -1;
 }
 
-static __init void cutoff_node(int i, u64 start, u64 end)
+static __init void cutoff_node(int i, paddr_t start, paddr_t end)
 {
 	struct node *nd = &nodes[i];
 	if (nd->start < start) {
@@ -275,7 +275,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	u64 start, end;
+	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
 	int i;
@@ -318,7 +318,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
 		                !test_bit(i, memblk_hotplug);
 
-		printk("%sSRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
+		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
 		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		if (mismatch) {
@@ -327,7 +327,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		}
 	} else {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with PXM %u (%"PRIx64"-%"PRIx64")\n",
+		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
 		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
@@ -346,7 +346,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 				nd->end = end;
 		}
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIx64"-%"PRIx64"%s\n",
+	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
@@ -369,7 +369,7 @@ static int __init nodes_cover_memory(void)
 
 	for (i = 0; i < e820.nr_map; i++) {
 		int j, found;
-		unsigned long long start, end;
+		paddr_t start, end;
 
 		if (e820.map[i].type != E820_RAM) {
 			continue;
@@ -396,7 +396,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%016Lx - %016Lx\n", start, end);
+				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
 			return 0;
 		}
 	}
@@ -432,7 +432,7 @@ static int __init cf_check srat_parse_region(
 	return 0;
 }
 
-void __init srat_parse_regions(u64 addr)
+void __init srat_parse_regions(paddr_t addr)
 {
 	u64 mask;
 	unsigned int i;
@@ -457,7 +457,7 @@ void __init srat_parse_regions(u64 addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(u64 start, u64 end)
+int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -489,7 +489,8 @@ int __init acpi_scan_nodes(u64 start, u64 end)
 	/* Finally register nodes */
 	for_each_node_mask(i, all_nodes_parsed)
 	{
-		u64 size = nodes[i].end - nodes[i].start;
+		uint64_t size = nodes[i].end - nodes[i].start;
+
 		if ( size == 0 )
 			printk(KERN_WARNING "SRAT: Node %u has no memory. "
 			       "BIOS Bug or mis-configured hardware?\n", i);
-- 
2.25.1


