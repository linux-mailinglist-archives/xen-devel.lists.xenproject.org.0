Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C1AA1B6B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 21:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973025.1361263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9qoK-00043T-Kr; Tue, 29 Apr 2025 19:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973025.1361263; Tue, 29 Apr 2025 19:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9qoK-000418-Gy; Tue, 29 Apr 2025 19:40:08 +0000
Received: by outflank-mailman (input) for mailman id 973025;
 Tue, 29 Apr 2025 19:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkRs=XP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u9qoH-0003qG-Ue
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 19:40:06 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcaa4a00-2531-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 21:39:59 +0200 (CEST)
Received: from PAZP264CA0250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:239::9)
 by AS2PR08MB9295.eurprd08.prod.outlook.com (2603:10a6:20b:599::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 19:39:56 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:102:239:cafe::88) by PAZP264CA0250.outlook.office365.com
 (2603:10a6:102:239::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 19:39:56 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Tue, 29 Apr 2025 19:39:55 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB9PR08MB6329.eurprd08.prod.outlook.com (2603:10a6:10:25a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Tue, 29 Apr 2025 19:39:23 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 19:39:23 +0000
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
X-Inumbo-ID: bcaa4a00-2531-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Jrr9k2FP3VoAJGecmLbe7lmZFLQTLGDwCffw2b+bTDssmGAnifvYAug0HFde/b2uzgrJKcfSjUDXOiHrKftNa/KnO7ScgqtKFhmgtNc10DP4B9hZBliEdftjTrBOlc286wH4T2EGUD/Jqtr5Mrnnm19P6iuNwFx1Mwg+EfTnMboJAWh7nrmT0r/RU+bcVAALiVE4gPF/P/WNywe1nSkajjFOsaJ7hfamDQKON4ivi558yJLjeoFXaN+yc2XpbNginqtRh0WiGVXGjGQ3I+1tI/dl7HPcE6xEsPLDAGsVJ1LqGZGmK66++vt/L9P2lKq3AdQpGWjQn73EDuCox0xYMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCk0Z7ugaxLv4T8YXG0YTf0mv/e6tWxSOBRP9hzOzkw=;
 b=JZ+I0Bnl6YC6UM0yMjwydjQjN4pfIWYcZFXshRQW5rpXYOaUiMEHpqdeRxK05Y+pslboCZ59PW9WGKMb39VJ9t9mUHkkIBL1iWvicnqcunf5Q6yB3B3z09j2/Z0UJ44ZaSfgxIXeZb/mzY07No/aQ5jB69NGiccvAfUwZTHY5DLBB32xv18EActARNRs/EUwjf1OqE5xmeuJyIFPswg8eWzSEGy66Wfd34mSQjwqAi7o/2MTY/ynhrpi3WaKiHTM86Z55q5r4HlNn7bEtAUA/GB5Y87Np6z8amqL2pm624FkQn2TeT64O3p/SGK+2H37IaQHapoLVHoe0RXWJ2uYiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCk0Z7ugaxLv4T8YXG0YTf0mv/e6tWxSOBRP9hzOzkw=;
 b=N1nsvPa4OvKWtbKQpSjgEXn5Fnx/aBiLm8EynTPt2WToq24CoNTv1MBtJMdqT0ZToxWELMNaEdSejcSmNQLKCwXcdY44RQ5axoBze70Wv93qsph2ewNjeyu5F7YVFlzXOeB/HyCmYFR5kkru84RrExLZe1WfjGLeKz6Xs+jDJ2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsLJVF2kJaAT8F2ZeuoGQSwm9TLTXRuIjzLkeeqWe07DhWHXfgx2hi8xxDiKMAfOpN2lYzpuABBukF/qDoe7Elf1kxyYj3vFFsWU+JmpiQe67HIZroDOtnPxudccfAJjJltBNOcCUSOJyDWf7sOxIxThcXKPVWMTB69zSgLs2nYgAfkGoGJIJS/BAQshMo8j7bw9yQr5aoF6g4HaHPcQwWksjpKqb1gyv5oyMuKUJlbJ8uC2BsEO3NnHL9I/pozResGm+6iWjTg2p/zQlZKAi96kC0vgYCtMg1HDPH5IB1S7eI8TgZWMVlVYqLwCn9Ofs570ZfQgic0Fxmqsp7dvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCk0Z7ugaxLv4T8YXG0YTf0mv/e6tWxSOBRP9hzOzkw=;
 b=ccelM40GVlvGy56Ca7wpecdaCkcuuV32DuiplbNx2FPAsTraXRIgwoNpq0BOgySw873GASLWI3LTp1Q6A0rlbM8UqJ+BFYFmMSH/qPMsvGMWT5MGO0a3SFCtDdpkswuNfm3mptZ6pCCVfuP0z+nXLbt1trO+430qa+q6RghacK+btbRV5FeAl1GQ114t+uBt3QyVF4stF20gXP5IDQ+9YFKpbqJYONc+SQNaC4iUNNbl/0iNSta47SumWUWctEGFEnvMNDS2PiVrR9xGX/uOS0GqCocKdZ/22FqvCAhgk1MmJqkRSp4XFu27qR0imtb8klo28Xsajeo8wVbls7EDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCk0Z7ugaxLv4T8YXG0YTf0mv/e6tWxSOBRP9hzOzkw=;
 b=N1nsvPa4OvKWtbKQpSjgEXn5Fnx/aBiLm8EynTPt2WToq24CoNTv1MBtJMdqT0ZToxWELMNaEdSejcSmNQLKCwXcdY44RQ5axoBze70Wv93qsph2ewNjeyu5F7YVFlzXOeB/HyCmYFR5kkru84RrExLZe1WfjGLeKz6Xs+jDJ2Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Topic: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Thread-Index: AQHbuRpqbs0x64sbw06OBQfYV4WEtLO64q+AgAAnyAA=
Date: Tue, 29 Apr 2025 19:39:23 +0000
Message-ID: <D6D8F69B-B1A6-4304-9153-CB22A7907B78@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-7-luca.fancellu@arm.com>
 <2cfb5c97-4885-4a24-b77c-5953d9cb6245@amd.com>
In-Reply-To: <2cfb5c97-4885-4a24-b77c-5953d9cb6245@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DB9PR08MB6329:EE_|AMS0EPF000001A2:EE_|AS2PR08MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: c99c9e67-6d21-4b50-377e-08dd87559e80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?2xZ+9JCw++ISDmMc+yX2uK6jyLWYfJAxprf7qIE+D0RnXIQJE7xM9eKnsZm0?=
 =?us-ascii?Q?ptFpt7FrnUFwIdy6bOJM0ioD4I6QOuBHxIttvq/mTic6ozInIfIDJO+WOSNt?=
 =?us-ascii?Q?yiDoqecc8AAf/+OtPImf3pAKn2VtKl4bMA+b8cPdapbo6mONjFahl67msiXM?=
 =?us-ascii?Q?R8OhxoAzcNaM/cfK/YSSoYHZWJhuWXL6NB4dCki93ECgokJJnA/FCnRP+7ga?=
 =?us-ascii?Q?sxFYdmlcgVF2KHr8TvCTZbPwACKFukV8tkogLv0qAsXQY/7D8Hn19/bLgmbM?=
 =?us-ascii?Q?aVSxZupHaPER9HtzcyrmP+DIfVpb72sEkTE7QHjAer7kDduxCLh7WyDFAJSg?=
 =?us-ascii?Q?rRLy6iQf+pu6Dox0f4J5RY4HzJN1po5V5eaJ8xGutgvWC4BiWNod3+C1awNA?=
 =?us-ascii?Q?Fm8NuGvjyG562b6FvlyUT5eTEVmeQrM5mvIns9AiONhxCP/wiEdVSyhjc4cc?=
 =?us-ascii?Q?+2ekabK63AAYrdyAJD5Y9iqj0x1f+kUme4IQs9+kfsDGIg8kxMNlCqOjrOXE?=
 =?us-ascii?Q?fP5+qNR+OmqnSJxwlo3r25ytaYOrWqrwe0adtFqffnUVdth6J+YXJINdlvuE?=
 =?us-ascii?Q?eD+zaPicTsPzIjFUdhzTD7eM/Lp9FFOy3fR9LK3gv1uP7QABtcbDwYmO5fdg?=
 =?us-ascii?Q?BNCeSfAlOVLMfoSYVfpeq1R/Jo79VjzkHmEn2D/z9OspR+zIR5yeocWuk6sE?=
 =?us-ascii?Q?SVunKo0tQDbRRtoPabuf8p8+/ec+KJWP9mQE6/g1elvJaflMDLVrDelOCfBh?=
 =?us-ascii?Q?R5CqzNn6qIfBxMMNowzkcHyrAJN7+TtQa5ebbek5Scd361GyklHluKmeXieb?=
 =?us-ascii?Q?hbdr/tU5NygG/q3wrROW6oOslDyKSpvvcdA5An7h5wfJmY2n4xF8151g+N4R?=
 =?us-ascii?Q?yOeNGglZxCtPj1/GnYyoSd7GOi2xNKIdsMEIC2Q5FkiLvCQ+47MZcALxZdmN?=
 =?us-ascii?Q?/nIpBmH06cVPECu7NPtN20BiNxHVLxg3gTZnCKseg7eSumZSLoARgmIF6WUT?=
 =?us-ascii?Q?DHLW2NbPRtKiJC8m+An3ZYhwZW+5IHE7dzlqMuUGMDw/8ovpoB1T0MOv4Y4I?=
 =?us-ascii?Q?zqt5YuVbw5iqLENjK1zoeDE4UYJ2qCvDYwj5VPc38j70w02nxDW/FjExcGrW?=
 =?us-ascii?Q?ny7xU6Qfic/mdjpVaIYHPpwsvBsECZr4njnYyJpnQ+BHvlU/b2KenqxAUhlQ?=
 =?us-ascii?Q?8diNXsYKxn3byAFXxOS+i+FHdqmKoSfuPjvVpWkqm9f8MiFuhLHg8qj51mRi?=
 =?us-ascii?Q?wNf85qMzvGW0Zg5iFM+5jbrDf7cdfZi1UiKJx/atBfY3BdmoFH1102G5LNEO?=
 =?us-ascii?Q?L4n7vMXqaE/sD2EuooB1vv6A8gV0pnJFDzJOybNpdfhcOL00BCFGsoH2GK3Q?=
 =?us-ascii?Q?lsYT+C/Avu9mPzTExmP+Om8+6am3uwboGuXf0OnV2nqcYIki8xGzFSy14WO0?=
 =?us-ascii?Q?eK+5YMiLCPpa+rlNmA3o2bZNuY56XwW5u4R5YTMCUiVm8UFXKlOzkw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2B75BD8BEF1401409C7267AE87CE20EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6329
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c077a7a-1564-431f-90d1-08dd87558b0d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e64Uhy8wVGU9jn+nnjYcWTQ3iutPJzGdlZE2dLDuAXFzbBNciDnO5eSc0dpO?=
 =?us-ascii?Q?sOwgU6UjHgyQpk73gLK0OZcy3y41MjD4wzACw/dnmdZwLEWMQRow0YvFTs9X?=
 =?us-ascii?Q?I6QIvH65S/ydQE0t89SdBOPq3NR9XeAyFlKL9UYC/uB9iP0kkmgICc3J0iby?=
 =?us-ascii?Q?aMkqHA/2y1mg4uMV40RCwRVqrhL1IJUEeJQL+y6f0LzAGSuIxRizOHsLxr7Y?=
 =?us-ascii?Q?m2PjfaxxnI9JaHBWL5Wo0Es0nzoHk6Az2HR7IuZeQD9DaApvO4ktCkFfDH3Y?=
 =?us-ascii?Q?MFJx87EhH9Ihr6GMXx4PtllkVND6umMs9DDISo3er+ppLrTLyn6OY3btBpU8?=
 =?us-ascii?Q?Bot0nMMTtTra81Jg4zITuRn4BgrXRmPb0qW/h1N8cDDgn/N7z73fyJRQbN4x?=
 =?us-ascii?Q?eEM016MxVvuenN4b+5RNFZ77+o9+BpMZVShWUpTSwQrPjtPYEOjGnbg7P6wq?=
 =?us-ascii?Q?Ytv8pn7mT9MR0zmVlxvJIk9TPv0R96VLQ7+nRwe23mZTfsGgLA06626SceEa?=
 =?us-ascii?Q?wzTlPhGnHBN2Yy2ajtYjHMwqodVLTaV3qsdd0h88O3QGkySDziP0coG9IKwQ?=
 =?us-ascii?Q?AAKPBMraekkPMH1wmLs8zv0jURS4pt7fhTX+GJRAGoinPYGDCg51lG8ts+IS?=
 =?us-ascii?Q?gSthyidAIe0Cenr368iKVGmPfCRFWIoP0/AszRF0i6d5bSHi+AkOTSyttqJY?=
 =?us-ascii?Q?wCrNIFclAw96BnN3uBqf1L/OipmJN22k+Z72Cs53t/yGYvYbOqVjgtAxsg5J?=
 =?us-ascii?Q?017Gx2Qh6CuCgHpWI4EK2WQk2A85PpD2Opp2dejcJVqrVEh6Zyq2RMBxG3uM?=
 =?us-ascii?Q?LIIAbNS+E1MV++6RmwdLaccbOyTe5ASaENxLdxtf2m3kWkXG8tpDeui5eT/A?=
 =?us-ascii?Q?pYdfXYwB/CAPdSuW+ehmxeHvH5A4HmXYlrhohSu1Q3BD1HdL7lacrwyksr2b?=
 =?us-ascii?Q?CTi2SaWsvHBSmbMQrtVTBjPksojg2Fv5shVrqBAiPGR99eJmpoqLrHK8UdZG?=
 =?us-ascii?Q?TjZZK+5J7rus+vGxKTap79dIyFNxk+EibbHZYIY7o4fdO1EOw7J0Z7m0wgrz?=
 =?us-ascii?Q?DGIdaVxximxZacwXVVUT4/6Iec0lhDX0raggAzboDtPn4PjZ5xuCRsmeccg2?=
 =?us-ascii?Q?jYV8YVClKdjM+pRvFa44euM3Beyt8uIX6ktHKOH/310VfPbWQZ9Fkf6apDD9?=
 =?us-ascii?Q?5tbwjHiqdAhrr5qvom+aSOa46zODtudlM7upIRsD7ZBS3YqrnmsrhLC1IFuQ?=
 =?us-ascii?Q?pb9llP0lziq0HS+rhpBu1YuEC8e/jP1rtweairBqpilQ5Lg0zywYM0+7XCpS?=
 =?us-ascii?Q?YWtGgFyQsUFmK0pcfCC7nwJ9JZh018FbAbeOGrTNGAMWVN3MAlhVlHKfoQwm?=
 =?us-ascii?Q?caKZso3Vf2m/T2tpA0wg1/SalfhgWAGAWroSrqJxskrtk07UXpJrG8ThxeHu?=
 =?us-ascii?Q?uq9NdYjbjlcDfxhCQgMq2MWPq/wope70eJJVj7G8y3HkQi5VtAxdV3hvMpZd?=
 =?us-ascii?Q?GlQbpreozxoqzQtvdJ4bj1pg3WFDw8tfpJuy?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(376014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 19:39:55.6788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c99c9e67-6d21-4b50-377e-08dd87559e80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9295

Hi Ayan,

>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 40ccf99adc94..2e0aeb486ff8 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -9,6 +9,7 @@
>>  #include <xen/types.h>
>>  #include <asm/mpu.h>
>>  #include <asm/mpu/mm.h>
>> +#include <asm/page.h>
>>  #include <asm/sysregs.h>
>>=20
>>  struct page_info *frame_table;
>> @@ -151,6 +152,73 @@ void write_protection_region(const pr_t *pr_write, =
uint8_t sel)
>>          BUG(); /* Can't happen */
>>      }
>>  }
>> +
>> +pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx)
>> +{
>> +    prbar_t prbar;
>> +    prlar_t prlar;
>> +    pr_t region;
>> +
>> +    /* Build up value for PRBAR_EL2. */
>> +    prbar =3D (prbar_t) {
>> +        .reg =3D {
>> +            .ap =3D AP_RW_EL2,      /* Read/Write at EL2, no access at =
EL1/EL0. */
>> +            .xn =3D PRBAR_EL2_XN_ENABLED,   /* No need to execute outsi=
de .text */
>> +        }};
>> +
>> +    switch ( attr_idx )
>> +    {
>> +    case MT_NORMAL_NC:
>> +        /*
>> +         * ARM ARM: Overlaying the shareability attribute (DDI
>> +         * 0406C.b B3-1376 to 1377)
>> +         *
>> +         * A memory region with a resultant memory type attribute of no=
rmal,
>> +         * and a resultant cacheability attribute of Inner non-cacheabl=
e,
>> +         * outer non-cacheable, must have a resultant shareability attr=
ibute
>> +         * of outer shareable, otherwise shareability is UNPREDICTABLE.
>> +         *
>> +         * On ARMv8 sharability is ignored and explicitly treated as ou=
ter
>> +         * shareable for normal inner non-cacheable, outer non-cacheabl=
e.
>> +         */
>> +        prbar.reg.sh =3D LPAE_SH_OUTER;
>> +        break;
>> +    case MT_DEVICE_nGnRnE:
>> +    case MT_DEVICE_nGnRE:
>> +        /*
>> +         * Shareability is ignored for non-normal memory, Outer is as
>> +         * good as anything.
>> +         *
>> +         * On ARMv8 sharability is ignored and explicitly treated as ou=
ter
>> +         * shareable for any device memory type.
>> +         */
>> +        prbar.reg.sh =3D LPAE_SH_OUTER;
>> +        break;
>> +    default:
>> +        /* Xen mappings are SMP coherent */
>> +        prbar.reg.sh =3D LPAE_SH_INNER;
>> +    }
>> +
>> +    /* Build up value for PRLAR_EL2. */
>> +    prlar =3D (prlar_t) {
>> +        .reg =3D {
> #ifdef CONFIG_ARM_64
>> +            .ns =3D 0,        /* Hyp mode is in secure world */
> #endif

yes this part will be introduced by you together with the pr_t definition,
in this patch the overall pr_of_xenaddr is protected by CONFIG_ARM_64

Cheers,
Luca



