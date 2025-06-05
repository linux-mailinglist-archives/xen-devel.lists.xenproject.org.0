Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC77ACF0B9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006882.1386133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAjl-0000uw-Bw; Thu, 05 Jun 2025 13:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006882.1386133; Thu, 05 Jun 2025 13:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAjl-0000s1-9G; Thu, 05 Jun 2025 13:34:29 +0000
Received: by outflank-mailman (input) for mailman id 1006882;
 Thu, 05 Jun 2025 13:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiAS=YU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uNAjj-0000rv-G4
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:34:27 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca2ff987-4211-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:34:22 +0200 (CEST)
Received: from AS8PR07CA0059.eurprd07.prod.outlook.com (2603:10a6:20b:459::28)
 by VI0PR08MB10539.eurprd08.prod.outlook.com (2603:10a6:800:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 13:34:18 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:459:cafe::18) by AS8PR07CA0059.outlook.office365.com
 (2603:10a6:20b:459::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.8 via Frontend Transport; Thu, 5
 Jun 2025 13:34:18 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 13:34:17 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAWPR08MB11086.eurprd08.prod.outlook.com (2603:10a6:102:46e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 13:33:46 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 13:33:45 +0000
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
X-Inumbo-ID: ca2ff987-4211-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PPb7bnSttIdbohfTvbfdFpEOvrBIKorZ+JutjycGyHauBdQTTuL3dulnit5k2+i5tv03QYDmwXdD1x1B8T6X0yPTSBiUxWf/cRGvWBWejzO7dhqjDTfjnq+6uW3rXvQ1yV4rQCA8KLqWcdF3WN4PhPRTglTMj81UUweHmm2yg8urNkjpn4X0old7VYYLJfe0QgN//yPhe3etsEO9PTEDbbf9+RyKlwJ/hngwH6AamaW36o1+JvfIGGT+0RDWlZxxTIwiIbODLnfaKTUwpKM14LC19GlMN3VVJASN3MqvUx3QiaEpTBeeQdqhfy2JhBCzy5+SxJZlUWz1ohAaBuPa3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmKQvjwyH95o+2UdOedf5lPpQ0hP/Us2XZHP0WIppeA=;
 b=lSJbiyAfAkqY9OF09sbVRXeNDpdywgzKT8VUt9296xExw1ysJsNxQA1hz2jpfjImVfuV5zRn96c+zMvgmtYXmteJAgd8mAWyy4nLrTanYdDYB24PAZ0C16mdDoK82Et73NAkIJqQ8dpX0/9nA3pji40UXSDCSzpJsSwSfYKQAHqjACMn0qPIIZOLby6wr7Pcfcxzc3SrKJHfjKinvvoDeqPHPqI8PcMNj9PnR5/XDDCF7fbxYZ2W7T20HJbpcPIkRoxkVHvnKmpfR9xdjqwQ2GLviHX0cs6bulxrJD5v+FSgnUsPZgTbVVdXJVGKHJmxffv2UGWEIwSW1scmKyqb+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmKQvjwyH95o+2UdOedf5lPpQ0hP/Us2XZHP0WIppeA=;
 b=h9QeRv/38bIa7vTt/JwqCXwp7q8q94fSDmOnKV2ECule6xxDCgAnW7924SD3Tb1Xl1LVtUXQHhn5Jqlgxe9Z49GLafvsuZ/xE6hBjGzzItWjVisRocRKCDffzdjJ2QoAY5ebj3YdHxoDCgcRHDiIuLjsggHUGSGdqy4GR5FFCLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4HFecs9ktR/tsMNJcdK8GH7BdZDLCBVVw1E+X/5SDl6o5NbBY+wa8lKRyBPSHv0W9w+OcDuWrop+hgm44f5gpRClni2pD1OEBsDbcCz0+D4+7zjg8mFoux2y/xG3LvQSWxXDJOl2UYnSLh8esEsL2THgpl4fy98TYB2MEGGmgyC7HKdLAIaOZ8XqCjoCsw3dpte/T9fg8pLG4bFD3vlEY0sTLoISvqJRZ3el+0HQcMne6rbL9QQERwCbNRRVPn0eJ5sSZJ1H6k9R47cJzZw/pJm0x7kvO/lKL2AKRWgvOTMszNW5U9PelvY+kEvfX29shf15WFhEp5jLC/9Tz588A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmKQvjwyH95o+2UdOedf5lPpQ0hP/Us2XZHP0WIppeA=;
 b=vgyyFGnvzarOJUwyoIVPyDOWXZMRbPYd1JQxWFwbNTsuK6kP5WzXEztNWcVqZxEjQBus/GBtdZBm0oT0tRt1Up6Z9joYsFB088WKNhO0cqKgndDOdjRkKRiJtd8/1X2aIrZnfEE38uDVKStr3By2wzk7eNq4KrNV2aV9BzgYTYLaNUxJWwKfwfWfTKSRZHFFZ/EM7drwg2Wxn0RYai+Oi/JDChAst1KU9rNSI603ifiyFAWhkQHeUTmfDkJKsMpC4QZjzdeMvLsFmvUksQc7yZ/QpKK026GVkbO2+d8qRefakw8j6KX3ddemuAX9HZ6jxTwzKBmbLTX4dPavLl96+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmKQvjwyH95o+2UdOedf5lPpQ0hP/Us2XZHP0WIppeA=;
 b=h9QeRv/38bIa7vTt/JwqCXwp7q8q94fSDmOnKV2ECule6xxDCgAnW7924SD3Tb1Xl1LVtUXQHhn5Jqlgxe9Z49GLafvsuZ/xE6hBjGzzItWjVisRocRKCDffzdjJ2QoAY5ebj3YdHxoDCgcRHDiIuLjsggHUGSGdqy4GR5FFCLs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
Thread-Topic: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map
 structure
Thread-Index: AQHb1XhE+9uzMCRJ9UO6OgGmjkgLx7PzYDyAgAExFACAAACHgA==
Date: Thu, 5 Jun 2025 13:33:45 +0000
Message-ID: <C6E33398-CF1A-4137-8724-32EEA19C96D5@arm.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
 <154A0263-6E4D-4855-9408-ED31F45B293F@arm.com>
 <3857c1c8-0abd-4058-a355-9c12ab08ad3c@amd.com>
In-Reply-To: <3857c1c8-0abd-4058-a355-9c12ab08ad3c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAWPR08MB11086:EE_|AM2PEPF0001C70E:EE_|VI0PR08MB10539:EE_
X-MS-Office365-Filtering-Correlation-Id: c82cc432-91fd-40a6-aaa7-08dda435abc8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZlBpN0V1a0E2RzdpRnBROE1RQ0Rjb1oyZi90RExyVXBrWS9RM0JzSUhmdHI0?=
 =?utf-8?B?c3RETGdCZVhBZ016RVpPSjgvSWlzeENuZ0NJdE5nQUNwaGJiZVdUL3pwNHNn?=
 =?utf-8?B?bFRCby9meW5hQ1UrWHdYbWRVK042Qmt2K0dpd0tEcVJGY2JkNDczYjJGUGx2?=
 =?utf-8?B?ZEN3Z0gwTEpZY01NMjdMdGF5eThFMEJlaTR2ajNHaEN6QWRxd21HVmpjUmFa?=
 =?utf-8?B?YzR6UFpXYXo2KzRKN0l2Q3lwT3VUVFBDUG9Sb1ZvNDVrK09vejhOTXEvV2tw?=
 =?utf-8?B?NDFnbERBQ1lwQzBDYzFQRGxoOVdpYXJRa2tVRk82andaUXVIMVFzTW4wcmdy?=
 =?utf-8?B?VDNGM01aZHZNOHpTcWcyU1ExSnVWSjFEdXViRXZhd0RVQXBOMkltS3BRaGdV?=
 =?utf-8?B?eTR1Zi9qK0xwTXZBMk1GTFVUSkdMRWxZaWJVa0ZLWTNrV0NnY0pSbUlQZmUz?=
 =?utf-8?B?MzdBOFJxWk45STNKR0N4QUR6NWIwUHNFTGtWK0pHMGJKZm9VaFRHSG5NTWwv?=
 =?utf-8?B?cDladUxnOFBTWEYzcDlnaytQWWJBeDVUbEZyT3Y1MWUyci9KZ3ZXWTlRZG91?=
 =?utf-8?B?WkZPS1RPdnE2cU5pSUNDSFR4ZE5oOE1HdjczRGhPb3ladEZLU09iRmlISUp4?=
 =?utf-8?B?TkE0S0JFemRJQ1VPWjc0UGszck1yMkI1Q014K292dDhzWVVNTThLVytqcTVK?=
 =?utf-8?B?cjJmY0hJeWMvM0xrRVlacWpSUS9kcHVaUHhmaFFuTW9TYnJmV2d3b0NabG5V?=
 =?utf-8?B?SnFYUEJFck5oZ01hZDJUS0lJeTVUZnRoZndIcWQvblM3RENibEQ4UTN4UGpw?=
 =?utf-8?B?Vm0yVHAvWTNsc2FpcTE4WmdmWnFHSmNBaVFZWGlFTEdPWU91ZmlJbGdydVBL?=
 =?utf-8?B?cS9xcVB1cGh4dXI0cVdSck4rOFhmY0NLdmF3MC9jY3Z3N2plNC9jU3poaUIv?=
 =?utf-8?B?OGtrRkVSWC9BYnlsaHFEOFNYbmd6RmNNUGk0Q1dwMnNsSHA5czQrSG1YaFUr?=
 =?utf-8?B?TUlDOXcxakY3d2JPa3AzLzRJakhSamczekZ2S0xXL2NnMEY1Q1VsQ0hKNFBQ?=
 =?utf-8?B?L3EyQ3N4VGd2UXVsZHhiV3cvUGJjYytKK3ZyRXJlOGpCcXNUb0xKMllFUTA0?=
 =?utf-8?B?UzJSOVd4K09McDNNSjdwSXVSQ1FNNVR3bFU4SDl0TEJ2RUIwVDVBSUpTV1Vu?=
 =?utf-8?B?eEVPanhkVlQ5UThpY3BxdlBZZmFEaFIwOWxGN091NzBLMC9ueXI3OXlrZFAz?=
 =?utf-8?B?eTBNaktqK2NoOGh6bU1PaklxR1hPUWdKRkR1YktxZ0RYdXFJMW4yM0ZFbVdv?=
 =?utf-8?B?RlY4YW8zOUkyOVBibFBGZCt5NW02KzdXZ3VwMTA2WnpQVitqWEQvb2hDbUNz?=
 =?utf-8?B?bXFWNDVuMFg0a2tWZzlRcktKK3lxTUg0S1A4YzFXazBlMkE2L2o4ZG9EUHhM?=
 =?utf-8?B?L1Y1emtRVWRTaUxkWDI2N3ZwcW93MkRHVzYxWlpwNG9tclNDUXJHV2lqSWN2?=
 =?utf-8?B?dE5lYXA5KzgrS2NQaTRSUStscXlpUkhKYk5samFxTFJvRmtnWWlkYUpnYmVO?=
 =?utf-8?B?b2E1Nlh3M3g0YmlZazFwbTMzMmFpZ3pFOUVhLzh0N291WnNHWCtMOXJvT2Rr?=
 =?utf-8?B?THhmZ1NLdU5rL2ZiR0RXYlYrMmx1SnY2bTRBMTl5QXZvSHBaTU5EbSthcWo4?=
 =?utf-8?B?LzNEZ2J0U1dDZXkzcUdPbzRWYXI3OENFTUdERm92czBpWWxvUklNRWpiTlAw?=
 =?utf-8?B?Sk1rWEFzMURPOEFuV1M1RFZ2aExIWUhCcjM3RjUxWjU4UmtFUFpEL0labTlN?=
 =?utf-8?B?NTRzUUkrTE5ZNjRFWE45SERUbTJWd2YvVjZHWm9UcXYrNXlCV2ZWb2drSVVX?=
 =?utf-8?B?eGpvT2ZsQ09OeUExVXNTZkJhRG14ZGJ1L2dCVzJaNXF5RDduM3BxUjQyZlVO?=
 =?utf-8?B?VS8rckRnY1RVUlRpZUpUeUFrc1JGYldRcUpXVHVOVnozdWt1SUZpSXdmc1FK?=
 =?utf-8?B?dmhjcm5WS3hBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <095F735C73948140B88BAEA25F52F80F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11086
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94715248-048e-49f2-5df1-08dda43598a1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|14060799003|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmpDNHpVRzdtb1J4MHA5YUtBU2dXdENXaW9YK0lmY1JFVjNYbjYwaG82ckRH?=
 =?utf-8?B?MTExazhCR0hpUnQ5c1gvUkRaSi9nK1VFZWNsWEdLcGdZN29Kay9tQ1dhWE1o?=
 =?utf-8?B?My9lZlRsbVZmQkQ3UHYvYTRKa3I5THExUzhkd09KZVFxQmNEWVNWRGVrb3FM?=
 =?utf-8?B?b1pTOERyVmR0TkJMQzJFYXdhL3BEZ3dLUTRMK3pWVFlpWjZDdEV3eEFwTEVN?=
 =?utf-8?B?Vy9uVUlrOExpRGRDV3Y4R1J6T2pPM05PQUd3UnpiRUROeDNRM2dDVjlwejlK?=
 =?utf-8?B?NXMrWEU3cEwzZHo5bllyakt4anNqWEFoUFo4b1lkaHE2dHBYQVAyRTlmWFg2?=
 =?utf-8?B?aDgyNVI4M3BUSXZJZEpzbzNEcXNGbjJRSzdFbExJdlpQZDdYYTVuNXlWcDZU?=
 =?utf-8?B?UURDem8wSVhUVEtxemloblVLYkMremxaemlObk9obWpwLzRVUjJCckFZbUZ4?=
 =?utf-8?B?citSTzVic1BpSHAvNURFVFNYTGlHNk85M2ZTck9RVW1Uc2txOW9pNzR3RTVB?=
 =?utf-8?B?WVJCemYvdlFiVkd3WHF6bXFPWkJUSkFvU3dxbllvUGZvSmZMdVdBU3FPOXkz?=
 =?utf-8?B?MnFXb1ovNFNKaXNXUGNsL1N1ek01Y0RqRUJSejRaalYzMzZJazMwVncvSGZu?=
 =?utf-8?B?UXBmTklpQmdWTzRMWkNaZ016UDE3UFk3eWxHL1dJSnQ0dytwQzI4U2QrczJ5?=
 =?utf-8?B?YzdQdHRya01NL3dPNDgvQkxnWUQ4Wk82QkF6a0Y1UHU5RWtidm4xMVpXbVJz?=
 =?utf-8?B?azZMdHJQMklkbzlkRkQ5K1BoLzByd3VFR3o5a29LS3BVZUE5RWdWRWxFOERC?=
 =?utf-8?B?SGx1amplaUN5UU9PQ2pyS2UrQkkwd01nMzRGcnBjTDgwOUNRTytxQisxd2I0?=
 =?utf-8?B?Skx5VVFvQmNWMjdtWnRnRkVZUUlhY1A1dXcvc0RvWXVYb3pYWnAxUDZmS1kr?=
 =?utf-8?B?dERhUWJsNjBUcFpHUnMrUFFyOXdLUWh5SHNHODRRRUw0NmVPSTZCWWdudERs?=
 =?utf-8?B?TjliVkpDNEhSUzdRTEt4UGl2YVc1TFBNMFdjYVZUSWZRQ2NNN2haQzY3Sm9w?=
 =?utf-8?B?cjVXUFM5MnV0UzRkYklwcXR3WkRLVDl2ZFZOdy9YaVhUVjk3UC9QVUdDbFV6?=
 =?utf-8?B?V0xQTTl2eWFEUXhCaVB3WThHR1ZUZlNxZG56WFZQbk9QRFFYcE56eitjM1gr?=
 =?utf-8?B?SWxLbE95b3IybG5VR29maVFka3lyTXA4cmIyZGZlUnB5NE9tOUJiZDM2Zjdw?=
 =?utf-8?B?a0hDVTlSRG9ab05nRmgya3BHcFpkNzZmWEdiQ1ZIVFNPK1p1VGtheHpyWExq?=
 =?utf-8?B?NytFcjRtU1YwY2VmRUFDakNkNWFCRFhUdzNjcmxMWE9jN2tKMVIraUtOVVJk?=
 =?utf-8?B?Z3JqdWJUVGZYWmlVN29ueWtQbmFJclJ1ck1tdVZSQWJndU56ejc2M3FrNWpw?=
 =?utf-8?B?LzB5M0FDTG1yQktPV1pSUGFycGJSQ3U0NXV0VmtSY3Z6TWFpam9nTUxtTG5i?=
 =?utf-8?B?b0pqMDdEZHN4ckVIcjZSNHBuT0ZMTnpUTEJqbEhkK1JHb1RqSXYra0UvSERE?=
 =?utf-8?B?MHdPaWFBTHY2R1RrWm1PZCtvR1h2amFoUFRwa1ZTcVFZR2Rwc2JZVFRKU09Q?=
 =?utf-8?B?aDBVQytIeU9RWmtVVExkYiszckhFMW42bVFYOTJJZ2RWTkJrNlFma21FTzRv?=
 =?utf-8?B?cnYrTThhbUZjdFl0M3N4OHRWV3NmOURyTEJTbU1Gb2U2cDJ0d3BLSzlKZEtM?=
 =?utf-8?B?UElrRVVkN1RsK1ZEQWIvaWxUTjRzNUxGK1FVenB0OWN6MTFJbkZmWUVWVHVo?=
 =?utf-8?B?K3pacVFIMm9IaGFMMmJzLzhBQ0JUZ2JDUFdmWUFmTit5ZnJ0amxwQW5jQW1m?=
 =?utf-8?B?M2Z2cHRlcUVES2NGaFluREV2UFVnSnRyOVdEL2xyYlh5Q1dSVnV0VHJGMGV3?=
 =?utf-8?B?b1VKdHR2WFFMT0MyL3hCdTlMcjNmdTlFTGxLaXlxNytTZklpaDMzSG1kWGN3?=
 =?utf-8?B?M2RNdHM2OHlNazVsakRMb09yRzB2NVhxazNpUnBSK2Nnc05oRjVSNER2Y2dx?=
 =?utf-8?Q?kJy4sh?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:34:17.7892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c82cc432-91fd-40a6-aaa7-08dda435abc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10539

SGkgQXlhbiwNCg0KPj4+ICsvKiBIeXBlcnZpc29yIFByb3RlY3Rpb24gUmVnaW9uIEJhc2UgQWRk
cmVzcyBSZWdpc3RlciAqLw0KPj4+ICt0eXBlZGVmIHVuaW9uIHsNCj4+PiArICAgIHN0cnVjdCB7
DQo+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IHhuOjE7ICAgICAgIC8qIEV4ZWN1dGUtTmV2ZXIg
Ki8NCj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgYXBfMDoxOyAgICAgLyogQWNlc3MgUGVybWlz
c2lvbiAqLw0KPj4+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgcm86MTsgICAgICAvKiBBY2Nlc3Mg
UGVybWlzc2lvbiBBUFsxXSAqLw0KPj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBzaDoyOyAgICAg
ICAvKiBTaGFyZWJpbGl0eSAqLw0KPj4gVHlwbzogU2hhcmViaWxpdHkgLT4gU2hhcmVhYmlsaXR5
Lg0KPiBBY2sNCj4+IA0KPj4gQWxzbywgZnJvbSB0aGUgcGF0Y2ggdGhlIGNvbW1lbnRzIGZlZWxz
IG5vdCBhbGlnbmVkLCBpcyB0aGF0IHRoZSBjYXNlPw0KPiBXaGVuIHlvdSBhcHBseSB0aGUgcGF0
Y2gsIHRoZSBjb21tZW50cyBsb29rIGFsaWduZWQgKGluIHRoZSBjb2RlYmFzZSkuIERvZXMgaXQg
bG9vayB0aGUgc2FtZSBmb3IgeW91ID8NCg0KSSBkaWRu4oCZdCBhcHBseSB0aGUgcGF0Y2gsIG9r
IHRoZW4gaXTigJlzIGp1c3QgaW4gbXkgY2xpZW50IEkgc2VlIGl0IG5vdCBhbGlnbmVkLCBzb3Jy
eSBmb3IgdGhlIG5vaXNlIQ0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

