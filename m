Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1B21BIj3H2p/tQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:44:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015B636440
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:44:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=selector1 header.b=KUDUTPRk;
	dkim=pass header.d=arm.com header.s=selector1 header.b=KUDUTPRk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=2")
Received: from list by lists.xenproject.org with outflank-mailman.1325979.1591361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUi9H-0007cY-HR; Wed, 03 Jun 2026 09:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325979.1591361; Wed, 03 Jun 2026 09:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUi9H-0007aV-Ed; Wed, 03 Jun 2026 09:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1325979;
 Wed, 03 Jun 2026 09:44:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wUi9F-0007aI-Rm
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:44:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUi9F-006YmD-0V
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:44:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1ff773-5cb7-0a2a0a5109dd-0a2a450790e4-20
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:44:28 +0200
Received: from [40.107.159.59]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1ff77a-229c-0a2a45070019-286b9f3bacb5-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:44:27 +0200
Received: from DU2PR04CA0248.eurprd04.prod.outlook.com (2603:10a6:10:28e::13)
 by GV2PR08MB11837.eurprd08.prod.outlook.com (2603:10a6:150:304::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:44:24 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::29) by DU2PR04CA0248.outlook.office365.com
 (2603:10a6:10:28e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 09:44:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 09:44:24 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA4PR08MB6144.eurprd08.prod.outlook.com (2603:10a6:102:e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:43:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 09:43:20 +0000
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
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WWZfYxGfvWAUaTs8d8eJZvj0UdO2igpgd9PpKCPE5kq5SABu/6Zl82wgYhvBKQtcm9YaMkIPPddI4g+WINJF94c4FpDhszxtNsVTFBeKKmQwYzx41VqNatpOG6FVAXokVjUn3AuqAggY1d1mcR08CmbTRqa0lKEss5GxfBt+DDwpTpLjBNuBhlujwuQMAkquIBUrWpFcphGTBDDBG8T50aEnImS7fIPhWj2bls2QoaN9W2cQYKkL5PV7kDguKAOwircb1FoLBRF9KHPG4tUzouy+cYL2oglpjyfOpwdESI2UjKRsQZ/oRlj6WzBPo25aW08I+kB8Uv0A8vROLmCutg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai0P5PdEcqBqJjj/3PtwqBLUx1AG9EAnhuUZPISh8K4=;
 b=CzZhDLjFBThZjeauN0AATFERoPVybPg7oizbn7tQYBsq1n1R6DwrTNRtCegcAkyK/WJ14TYK5nS0mj482DJ61UK67ZKfHORo+nhAf5mQsQwJhdCXMqX5o54LUeqVS4qqKJW5zAH7gFa9ujOOnYY1JnTFtS0C1laWUPcJzvXLPsz7w1a/36tksBjrlT+P1d194zlLCqCqO8XlB6OBCm9fX6x02fxa9qq6ZHgwLW8qe1288Rm0wAhj9inEGrX6MIOcjkaJSVW+kQKZ9HuUrGrsLVGEnY2qRJhRWt3rd5R1Onfppn1TQbIgmLCstWra+T4+1F1An5gz1O74h+X22BtRgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai0P5PdEcqBqJjj/3PtwqBLUx1AG9EAnhuUZPISh8K4=;
 b=KUDUTPRko4QNaR/V/JhHk2IZjAWnW9NQx2baTV+X29JYUpdUnv7wcN32NLDKdjGnXyIZiZ6KlYTbReID7pX/rAJg8oT+FWoWZU9JPhbdNOsIWmOyFlxKUcUk7jTbKFw3j5qTrcFUgBTVi18dDkQuaF++i0aTcJBRPLhB6BzcEB0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DR+UwnnfQyflEtZJlqdwdMdbCJEh5TCxdSy22QHgSu/Ymd45ytFZ7UAYCv/OMkOMGjw/9FJcLRA28mpWaJ4+KtvHiY52EFOeqkK1n9Qo1K7S9bvl3B5nEhEpSYBj0eA2PcYhr7i0KadWD/n2/l7SR6dg0g+/OK35QCYqozW0uhIryVvGWMUMNJHTsr5cR8lV/rJa1Toull9XDnU8ldrNUdQNmu0TWmuLUqoDa4paU8/fPrNU4O0Ctbz4mWY3PhtcNXQAdGehjirNA4BQaJSHOjRdAK1PSs1ZqwMdO4ouKrB+nevDZWgKXzSn80z/LIYpGV+MoLCRHg/JaPX4UkP2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai0P5PdEcqBqJjj/3PtwqBLUx1AG9EAnhuUZPISh8K4=;
 b=kZII/d5HmV558JudPHTrFAKVDqg0XGuL7wxvTG2Wj+AY+rkoUihVfpyot2PQlz0IPIXv2Lw9elbK26+NL+VGiRD86T459frm4kB7hoaJgVByVHYJ8RAA4G60LFuEVYvCoMcis6P4BqzDaDie3wS+c1ksKGcpfX7eEyzz2ylwhOuICxptigQAHlxZdg/sMC7nr6ca2UeDO1DetWQ1PPwDP+OGok/37Z9oD1GWyRULJOpdQmUnCirosMzjsgJwRtn2b5sGnfk6BcAJMuyoqMx11Byn3CNdRulEim6ZAzGO6qdD1m1N+h/cm0dJKCqAZEvvsG7/Qx6bb8blfmPIp7ZXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai0P5PdEcqBqJjj/3PtwqBLUx1AG9EAnhuUZPISh8K4=;
 b=KUDUTPRko4QNaR/V/JhHk2IZjAWnW9NQx2baTV+X29JYUpdUnv7wcN32NLDKdjGnXyIZiZ6KlYTbReID7pX/rAJg8oT+FWoWZU9JPhbdNOsIWmOyFlxKUcUk7jTbKFw3j5qTrcFUgBTVi18dDkQuaF++i0aTcJBRPLhB6BzcEB0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v10 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v10 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Index: AQHc6UoJ2/A9TKf5Mki5mcNZE+ke7LYqAKSAgAJppgCAAD3PgA==
Date: Wed, 3 Jun 2026 09:43:20 +0000
Message-ID: <5A04DFB0-4ECC-41C1-9AD7-85D78AB740F8@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <279cd20f49be956fc8493aace906a1adfaf473ee.1779385072.git.mykola_kvach@epam.com>
 <349E0857-AB61-48C1-BB91-ABE1422142C9@arm.com>
 <CAGeoDV-sEeQSpDvX7qTmHdRNLPWPUbxJ_NWYYRKAmkk1w6ixmw@mail.gmail.com>
In-Reply-To:
 <CAGeoDV-sEeQSpDvX7qTmHdRNLPWPUbxJ_NWYYRKAmkk1w6ixmw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA4PR08MB6144:EE_|DU6PEPF0000B621:EE_|GV2PR08MB11837:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2e3f0b-0831-40b1-717b-08dec154b25c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 KYLShw18sgz4SGpbCFNl+pzLDxdkhJ2A6dxDzQ8OgdJSkzbDf9QDEK+JOW2TVa3ye+AcZxj8yr7asGiUXBX5MZ04qL5vuOSYzRCwg2MZCAPPCBKWoPDbbilNc4qSEWA8r2mbUoOHnnde7zBaLN0XCADMVaBY7+bEuQTbvb1X6Wczb3HeFJpSnL/6YnJNnjnWThcYTAYp17hSS+9slKZ1reSHtWJt+EDlmL6RnDAXlM6IqyixFPSMLlsnP/BmoFq8tmQIGOMes1O7AiQJwu01N5zzYTOgI9FY6Ju1nmOwTcbSFSIV2/KVy/fturCarGFXMsr5hwbSRZymqboP2CeUdAyz8PBnvj9lXZfHQIvMRroTjD8RxB6OlzwMX8/OqYLfJa+NZkxFwFG1j3063aNmOQBRoCimS7qNpL15aAfEkoRQISzDQjB5/yNcMqsMh11RthQSP/3kunSOM0d8+DAYLUn/3hXi54WYY8niDOmCWj47084ywa1BuhrJqpwSHjvqfdUcbxDFab6ap1/HqAu+nSypQ05P25JohGEbmk2SwfeVYvl8ZezWXtp+tGJHaHbhkT3PvASCQuWPWjB9Uj5zAM5f1tGpxCFhtSBfHokzn8npwtDcLIR5nxNh0R+Ov+iKo6KEkXy6eDGYBeTeFKdMk4H0yFZTjR7gUgPt7k9rof6KvAOgaazolKccqigNPhg8NYhEm+iYZkX8l0FRNEbQ6gqEG1pFlF0IVEN8QuXaTTdadodwW3txiTxgyVGONzG/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A9D7C3BE48A77419EF752C8C531C2E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 oyImuMrXk4rKYD/aWvio8NB87fpFEpHqT7bazxzSHWI0GgSwfo3MmO57yesnsojgMT+Ehssa897i3a9EXzErDsd8dmEQkPz8ycKQxbwiupkqjnG8JfwDWPFZUX04xjpDPBo3ihy8QdNeHQXLpZxfuRMABN8cRZGS5JCXufFJeRvJj7xz/jaQf/AQUxpeDb+s6md5GFK/oHHDdQD7Qoya4/rNKwX94JpLz7smBwv2SnHtBd5AQWTxO86iGM6oEtT5ujm1dhJ5TzS8Oq03LGW1T0p/19p3n9vNblM2p/fT0qdF2nCyzRrAEJoCISQPOBVLxhbzKgieA9YX0UvXwGnyFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6144
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a63ed8e6-269d-4045-4d56-08dec1548bff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|35042699022|14060799003|376014|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OFOb4Oa8sAzWgaVW58DthX/PJbfIqqtbyVwozYRW47kffRXpFv41yUE67Y3+MaLsXiGFw1ZoEvRGmaIqQhF1C12/r3rzOkXmrCWkIVAfu5zxAcV3Rq6OVwxqBdpU0jrLa6wmEB5sWTs5aHq1dt7fZcyesXqwkmoOYg3WXesbhlfsDGDv83ownfIkAIgS+5WdcVNHKmvkQQmm5IL9wHzSDq4afmCxMx1hhPFJv1Hf3+2d92L4/e/L/gaqHnED6wdcY1COKx6FcQQKJrrAjDGI7G7QwM2eQrQ5sObmjYMoC4jXnaZzr78kGiV3/W1ZFMxQhF+R0f3k/BcoFi3fmozhi2tqifipozTYptt+nO5GCAgZCWdKURS6oxPUbgxEiADAa30Yh5OFNECupbkHFpMWROa1rh7oHTBUbrUs6SjVlhOYAoIFxDVQztYT025fFK5fQljv8ZbkfZdA/GexHJlSMrSmO4ThywuhJHLz+R7dOI/y6L/WDFOj5k78dFxUlUDGFKOu9y8IWve99tmpitaxHvcEMCbag+o+ea362R2wu/WRunZxRWq3kDsm1unq9DLvX8efRT8389lyh+wXhcr/2Js2M1K38NZhpO/09DVV21qh3NRykOaf03+6FfoE6L0xBP3I6VXOMHz1lm56t0UKfRLqQxf2sK56gcWwv/6uf7Q9vTtBJPOlm/mTR6vlb2mw8NkaPxL4vRWx1r8aQZdUeJEk6wjqIYNylyo11HXEDRk=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(35042699022)(14060799003)(376014)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1HG6SSWh80I2mwfQXrJxluHLpAhCBzdFXS/ts5/wqIBZqGnAcYUO03Aj7oVVUJdHY4rNCATTBAJkYdsRnOSy4RcHosHZDBuo8D4qlHJfgrXZ+RgWUoJm4c5nKjE9NBwuC7omxq1kBSpLMfn+VVBbDLTSyU89cRYqKnbD8anYafuHwbf7xS9+gB+MT72YlDz8QRdHxMKg2AlfSZxIUH/ab/cDLnA8FKhgJTFDi4cApxDX6Wwqdx2onB+rY5kZ0l988fxBOe769kCspxEmo3r9gqUdJUYOqXA+yzXJMOumZ6NcaEM6Rz5B+j+Rt6YiiNERsZ2JqUZW9ZxHqWtNzSI11czSX4EbymqB3Pna7yLTXe1NWsfSE9rN1z7ATnEh9T6GaDT+UzIjpdayxx3mrqRgI9kn+4ekbRUvu3521hx45ICDn4YrUhdf0xFI0hXdeMM1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:44:24.5996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2e3f0b-0831-40b1-717b-08dec154b25c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11837
X-purgate-ID: tlsNG-ef75cf/1780479868-09165C48-448B790B/0/0
X-purgate-type: clean
X-purgate-size: 1700
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7015B636440

SGkgTXlrb2xhLA0KDQo+Pj4gDQo+Pj4gLyogR0JQQSBpcyAic3BlY2lhbCIgKi8NCj4+PiAtc3Rh
dGljIGludCBfX2luaXQgYXJtX3NtbXVfdXBkYXRlX2dicGEoc3RydWN0IGFybV9zbW11X2Rldmlj
ZSAqc21tdSwNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IHNldCwgdTMyIGNscikNCj4+PiArc3RhdGljIGludCBhcm1fc21tdV91cGRhdGVfZ2JwYShzdHJ1
Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LCB1MzIgc2V0LCB1MzIgY2xyKQ0KPj4gDQo+PiBOb3cg
dGhpcyBvbmUgYW5kIGFybV9zbW11X2RldmljZV9yZXNldCBsb29zZSBfX2luaXQgYWxzbyBmb3Ig
IUNPTkZJR19TWVNURU1fU1VTUEVORCwNCj4+IGJ1dCBJ4oCZbSBub3Qgc3VyZSBpZiBpbiB0aGUg
Y29kZWJhc2Ugd2UgYXJlIGRlYWxpbmcgd2l0aCB0aGVzZSBraW5kIG9mIGNhc2VzIGFscmVhZHkg
b3IgaWYgaXTigJlzIHN0aWxsIG9rDQo+PiB0byBsZXQgaXQgYmUgd2l0aG91dCBfX2luaXQgYW55
d2F5Lg0KPiANCj4gR29vZCBwb2ludC4gSSB3aWxsIGF2b2lkIGtlZXBpbmcgdGhlc2UgaGVscGVy
cyBpbiBydW50aW1lIHRleHQgZm9yDQo+ICFDT05GSUdfU1lTVEVNX1NVU1BFTkQuDQo+IA0KPiBJ
IHRoaW5rIGEgc21hbGwgbG9jYWwgYW5ub3RhdGlvbiBpbiB0aGUgU01NVXYzIGRyaXZlciB3b3Vs
ZCB3b3JrIHdlbGwgaGVyZSwNCj4gc29tZXRoaW5nIGxpa2U6DQo+IA0KPiAjaWZkZWYgQ09ORklH
X1NZU1RFTV9TVVNQRU5EDQo+ICNkZWZpbmUgX19pbml0X29yX3NtbXVfc3VzcGVuZA0KPiAjZWxz
ZQ0KPiAjZGVmaW5lIF9faW5pdF9vcl9zbW11X3N1c3BlbmQgX19pbml0DQo+ICNlbmRpZg0KPiAN
Cj4gYW5kIHRoZW4gdXNlIGl0IGZvciBhcm1fc21tdV91cGRhdGVfZ2JwYSgpIGFuZCBhcm1fc21t
dV9kZXZpY2VfcmVzZXQoKS4NCj4gDQo+IFRoaXMga2VlcHMgdGhlIHN1c3BlbmQtZW5hYmxlZCBj
YXNlIHVuY2hhbmdlZCB3aGlsZSBwcmVzZXJ2aW5nIHRoZSBleGlzdGluZw0KPiBpbml0LW9ubHkg
cGxhY2VtZW50IG90aGVyd2lzZS4NCj4gDQo+IFdoYXQgZG8geW91IHRoaW5rPw0KDQpZZXMgSSB0
aGluayB0aGF0IHdvdWxkIHdvcmssIHlvdSBjYW4ga2VlcCBteSBSLWJ5IGlmIHlvdSBhcHBseSB0
aGUgbmV3IF9faW5pdF9vcl9zbW11X3N1c3BlbmQNCnRvIGFybV9zbW11X3VwZGF0ZV9nYnBhIGFu
ZCBhcm1fc21tdV9kZXZpY2VfcmVzZXQuDQoNCkNoZWVycywNCkx1Y2ENCg0K

