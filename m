Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DB4A85B64
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947205.1344892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CQH-0006EN-5Z; Fri, 11 Apr 2025 11:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947205.1344892; Fri, 11 Apr 2025 11:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CQH-0006C5-2j; Fri, 11 Apr 2025 11:19:49 +0000
Received: by outflank-mailman (input) for mailman id 947205;
 Fri, 11 Apr 2025 11:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlgU=W5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u3CQE-0006Bz-Rm
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:19:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f403:2612::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de305202-16c6-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 13:19:44 +0200 (CEST)
Received: from DUZPR01CA0205.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::18) by AM7PR08MB5400.eurprd08.prod.outlook.com
 (2603:10a6:20b:109::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 11:19:40 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::fe) by DUZPR01CA0205.outlook.office365.com
 (2603:10a6:10:4b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 11:19:35 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 11:19:39 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS1PR08MB7425.eurprd08.prod.outlook.com (2603:10a6:20b:4c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 11:19:07 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 11:19:07 +0000
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
X-Inumbo-ID: de305202-16c6-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OvMLlphojUg1HYHvRrXmTnWJViPMh008sT0u3rc9f6UHGGh6C0FxivEMQlhKfV8yFXKWeoNx1y71z1zKOAJGldXl22GLAmK4BpE5pKXD+2sId9hzQwScPxjEnhecvlGR8g0V1q8ig8qMAmPptk548FiQnOcccSl5zewB0fy1bZYmVoJyUjms+Gj4ueXJadC+3GcDOosTP4CfNZQV+v9lJBKcams78aZo+UBItGxn0d30yjAhrhwsaLfc1Wazgj1IUpvcRWJgmE98AvW48D+coJrUNuEj1mTUtwU0PQdGGw/UDImBiTWFpedSRxeRv3flOXp+7LPGAsj/6LoqoIcDiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoXfUfZ0KtopeAqO8/edlmTjLIO2HsdVyKoFUaZGNNM=;
 b=jRQova/IJ2Otq2l1Jpql0pdHVjk5FBGYADOagFxZIBQ65B8daExzUBu6T0FzoQLF6qpyiq74yRtd0jMr0eqVe/FgEXg34mnnKdga3omwXdqSzD5rsPs1vh8RTjIlWc5uLqIbcowLi1/ODXESDPJKuPgEwpIuoxjIwGI9QYq6kDABctER2tA+aBl9Uzn2OlyQKAThZd3O/33my2CVI9YGJY244S6VVFATjyiqojh3qTHEGsj3QEufGzPPPwvjFgm2EU5vVXEkjLam+bYM4LmCGOprN5y5PfkXhNwj5+ZuuKQb/ebgeTYIV9qJdziFXsJUVQ2hM+eUEMel2jArsaz6UQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoXfUfZ0KtopeAqO8/edlmTjLIO2HsdVyKoFUaZGNNM=;
 b=mA2kjNTFJrGfif212H49Lr4647ljeupRz+Uuc02W03ebhwKFFJeUrm321T6QrW2bleMSZMQAnStXJJR9NL2IoSjsHOwc+gtyhOLZ5xZxSmeP/oyNrKdXnUkGN7BSAKA0hOYAUzYH5toHDNBIPPpjzC2z5fpoSc/93HxmDG0YFyk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDr7WmC+3XvU97FyZLDfPGx4ke58xJkFp03QOX9fyUPIt/i60G5s9wjK1FO77zlJ+V7dpTq87EKL0up0JfW9nEshVenO8FdS9JViKIbpX0Awr8vRPjNR2A2b2nidXs+YqTcv4wgONMe8G3qtP2bmC0chuHnYE2Pdqu8AReGTzkybQq3IUHycm7S9YfoWTb+IkRhTlaF+kwDpg/qltd3WiL0wpx6V+B3cPgtBjxf1Ay6SeK2bdQQzvksZecQq0CFVzFTPe3QNqXJvzME/X05/DKSdVUGUAEU1alKEfDku0+Egboj/qdb/yEU8n7kXRwGNTWeX+CnLrWkuibpxt2fB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoXfUfZ0KtopeAqO8/edlmTjLIO2HsdVyKoFUaZGNNM=;
 b=EWA3Y+R/zaxa7ZJ+yjnMVKA0N6LDd73REI8sx4gRPqjA0lVflovE5/dnAjaA8c/nRyIVWIqXusqH43xRlTOrUstjsyt1oVx03yF8hNuNFdG8xhEomK8AscsEpAURZgb+9udc9xhcywVJuqBWSmU61Tx2wtwjxJTCY6oiVPwP7oqx2XpS+N+PpcwiPF69EIl6+eLkX3S9GqYFy2Ej+uxmdA1h0j9UXExHw914kkWl2M6a8XTEgtManHQpSa6Q3dy0HBho2pMb1FtyBmIV1taic2tIVb0AwCnGYi7WANwjST8QsJJC5tStCKSIRa4MvgzPAcaM4OZaqsmrF7jjALe+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoXfUfZ0KtopeAqO8/edlmTjLIO2HsdVyKoFUaZGNNM=;
 b=mA2kjNTFJrGfif212H49Lr4647ljeupRz+Uuc02W03ebhwKFFJeUrm321T6QrW2bleMSZMQAnStXJJR9NL2IoSjsHOwc+gtyhOLZ5xZxSmeP/oyNrKdXnUkGN7BSAKA0hOYAUzYH5toHDNBIPPpjzC2z5fpoSc/93HxmDG0YFyk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Topic: [PATCH v6 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Index: AQHbqtGiUF1c7UE7dEqUOxk7cDhLvrOeUUwA
Date: Fri, 11 Apr 2025 11:19:07 +0000
Message-ID: <53CDA1B8-107C-4B08-88FB-D8822549DBB0@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS1PR08MB7425:EE_|DB1PEPF000509F7:EE_|AM7PR08MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb3d5d2-cf77-4ead-4fa8-08dd78eac005
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?clF2cEoxbWlxTlh2dS9iZ3NFMmpSMEhmbjl0cTF5RVc1SnZ6Yld2ZkNQRW1r?=
 =?utf-8?B?aTVUaHRtNnNXRUZnRWU2TVlSYW5xN0oyZkcwT0xVMUlobTJ3c1dCRmNoOXMy?=
 =?utf-8?B?RTd4NlpBaE9ITEYvaUpDaW15cGdUcmZ3NUE5RTdrejI0SnJOZXJ2aFhNVW9Q?=
 =?utf-8?B?bTR6MUhBMmEvSVRPSXlIem5UbFZJUVVrdEJzM3pQRWQxdnhLTUdQSXNuZGM3?=
 =?utf-8?B?WGIzVCs3SGVoUEVqSHpPUnFweWxocWR5clpTTkRLZUdTc2tEUVlIVGI3YlFM?=
 =?utf-8?B?alY4N0hYcDdOZ003ZlFKOFlVQytTdGhkblNCUGUwaFpPdTViTzIyNW1iN09n?=
 =?utf-8?B?SVlzbjV4MjF1bmVSRnUzSW5CMDArY25DNkFjU0RDY1dqaXFrWEkyOE8zTzJv?=
 =?utf-8?B?QTZseDdlZzEvRFV6RndUVG9TK0gyNnFGR1h5ekp2TzJnWTZWaDBHZWN6SXhL?=
 =?utf-8?B?WTBMaGEvMG82aEJjUUV5MUp2U3J4UnI4WS8zeEttYW95a0FxSXVoUUY5Q1hO?=
 =?utf-8?B?di9GWjcrWkFsSVhwTVBaSm1PRGkzUWk5aHA3NDJQaTdJTWwzdUh5dW5WZ1Bq?=
 =?utf-8?B?QUdDeHFxNTQ0NWNDU1VrSjlyU1FLaGV1MS9vVnViK0doTWNpZEp3cldlVmdD?=
 =?utf-8?B?Tlh6b2VxYTVkYk9vWmFmTUZ5RGRtWUwvYlpDRGVNSVJaNjlMVFdNejVXcCtF?=
 =?utf-8?B?ejVzZVVrZmZrM3hWZTZTbWc4QnQvb1N4NlBLcXRyWnV2SXhGVEdpSDV5SDUv?=
 =?utf-8?B?Umx2RWkvclllNzVEeXpLSUlvWDZTZzRoYmEzQTNsc1NQM2JGdmFHK09SbXpU?=
 =?utf-8?B?dTR0ZmFHSGJJS3kzK0NRT296alpVaDBPbUwwRXZlcTYvcnBRVGppT1JNYTJo?=
 =?utf-8?B?N0VkVG1Sbkl0VHlpSEVzM3BaUlB3SWZqVEtUVGNSYkQzQlhWalJ0dExnVVhO?=
 =?utf-8?B?MFFMODJBUDdCV0w0aXQ4eVV4d2hoVDhjWml4OEszLy9WalhOY29EK01SM3B4?=
 =?utf-8?B?L2FIdW1rVEpJeWFKQ3ByZVpqK2JrYkM5NkdLSFI2QkRSNkdRMVNZbGdRMU84?=
 =?utf-8?B?eWE5N2ladmo3S0FseGQyZVo4SFpmVUVwU21qTm91bDZvbFBBOG9iQTEzenNi?=
 =?utf-8?B?UzkxdmFmYThkb25kSUtsdXgvd3grRDF4MHpxcW1USE9BQVlObzM4Skdra284?=
 =?utf-8?B?WC9rUmdqZXVJbGFCOWNlY3k4ZVpwcFk0d3hVUXlETTI0Sy9DWEppK0Rzcjdx?=
 =?utf-8?B?SGpLMTR5eUxvanJUdlpRdVMyQ0pqWmwvUnJWdFRXcHoxU3RETmdkVXk3NXlw?=
 =?utf-8?B?dEZKN2UzUCtld1RYUkZvMTU4YWFVVWZ3ZTFxb1hCbnVGMnVaQ2JNRGhycUlZ?=
 =?utf-8?B?eGlIWWpRS0kySG1iM3dSYWU5bWp6K2MyalVIMEM1TXllYjBQNnd4d1U4dUtm?=
 =?utf-8?B?Z3BpL0c1c1Y2dDNJOUJiQ2ZRMG8yN1E4eS9tb3dBdSt6NElXTWR3RFhMWmNM?=
 =?utf-8?B?WkhQMkxySDFMc2Q3T1JnMGtzUG13NENOUW55TWw2TWtmMGdSNExjTm9NaTV5?=
 =?utf-8?B?NzBiVFhwa0FGUFZuTVdNcmYrZkJkcDF0S0g4TWh3ZzR5RU1jSlJMRmJuc0lB?=
 =?utf-8?B?SFhsRkp6aUsxeU9uUGRGcXNrRmgwSW1XcktOQUR6R0dzZkFHUyt5b0FpaHpP?=
 =?utf-8?B?SkljWWswZ3BqYWIyMFZPQk9Qek9hTHUrdFdXSEVtZ1lrRkdzQ2huVENrK09G?=
 =?utf-8?B?VmViRVdpZzh1SUJNc212UWs1YjlhS3VEZUZZNWdkbXFVeTJ0OWJvcTNRaENT?=
 =?utf-8?B?elgxSHgzZHM2K3cwVjEvZnJ0dkRtL1haTEhJajNpTU50U24yVFFIdXI0Y0g4?=
 =?utf-8?B?MWhYc1dmRmpWVmduWHdmMnpCdk40dGFsenF5SmdCcFEzR0RrcGlBeHZkL3Vi?=
 =?utf-8?B?ZGFKTWZvSUlVN0hsalp4N1RNZGd4NWZ0aDc4KzcvSWlycTA1Nk9YbWdiWGto?=
 =?utf-8?Q?kBhzT0Bq6odafdLuLO4pmzNJtT4TNw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <53CC7F702084E64FBA0FAD429EC4FED9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7425
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f48a3f3-19d3-41f0-2859-08dd78eaaca5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEFMNkMxR3Q0b3ZqWXpFUW5QTjExVW12N1BpZ0FWT01SV2FibE12bFZYWHAv?=
 =?utf-8?B?YzdJUmFMTEkwUDBwMW10d3FwNXEvNUtidVh1ZkxrTklUMElQSklXRmRTTmFO?=
 =?utf-8?B?TWV6V1I4dlYzNlZIRWJFQjZVcGE0ZVhBcHJQZVl2eDZ2a1cybDZ3OTdZWWRw?=
 =?utf-8?B?cGdCeFI3WjNNQ3RvNyttZ2FaMTdScXh6TnRSZlNwZ1huYk02T2x3Q09ndVNG?=
 =?utf-8?B?dlpybFpjZHFrWEdubnM4VFVDK1lHNHBwOTA3a0tvTmU2RWpWVHdTdndHVVM3?=
 =?utf-8?B?QWJDbmkyNzYzZUtodkdTK3hMdnpDQVhqd084RW4wdmxDSHlyekgyQ1c4TS9q?=
 =?utf-8?B?cklTbzRINkRPdzdjR0NObEU4L3JKVWhGNmJ0MHk2Y3o1d2VtTmRIMkpXUU1x?=
 =?utf-8?B?QnNXa2tidUNKSHJ6VC9KOG85dWx0QWdRTzZYQ1NCd2w0d1c0Ni9jMmw2OWZR?=
 =?utf-8?B?ZWZpZ2k0UHgvUmttNHpYbEZQdlVCWGdLSnYxR2owUWJtWDBjdDFhbWYzYTFx?=
 =?utf-8?B?RHZVdVFqazFwcWliOTVnZ1JhNlFKdTZCZGVKcUoySmtqQm9RWmVGbktzQW1W?=
 =?utf-8?B?cDRwSVU3SnhKSVBWYjNpeWVMRmp3ZjhHUFYvbnRrOGxSNE82bWxzeThiQ3Ew?=
 =?utf-8?B?WW5Kc1V1Z2MwYjZTZkdKUHVHRXhwRjFQZWprOVpkQUdFTTVzUStPYmhPZkxp?=
 =?utf-8?B?QWNrTi91NGlaZHBZLzdQN2dEN1hqTzlnaWVVay9QT0pvaC96ME50TnJFdk1J?=
 =?utf-8?B?RWJzN3M1SjFQSEw4MVBKOUJBRFM2OVpjUkFWNDZGekV4OGRWc1FwNUhKY0dJ?=
 =?utf-8?B?WlkzUVE0OTdHRnNzeXRlRW1KU2VxMWthZHZYNVF4OFVxaWk0TG5LNGJmTWlj?=
 =?utf-8?B?eWtkbXJRZ084ci8ybXM0Sjk0aGpTOC9CVnpGRFNvYnRHTDB6R3JOZmpCeHhZ?=
 =?utf-8?B?QWFqbDJkaTMvWk5qZDFxc2JMQzBXcDhTcnIybDZ1YkRKZFdadDRIRklId1Jt?=
 =?utf-8?B?Y0ZLMEg4TnFERjR3c0tCNE5vbmVwSWw2Y0hrYzlUOG83SWZ6NU9sNGY0bU9o?=
 =?utf-8?B?Y0lWZWlqR1cxWFFsZm1PcEVzUjB1Q0ZHa2pOSTNueHlCaXR1MGVIaitmLzU3?=
 =?utf-8?B?Q2ltRmx5WUtEeFkrMitBMFB1KzcrNFpVK1dNaFBMWlU0cXV2ZWp1UXg4OUtK?=
 =?utf-8?B?ZkR1S2tJNFRpMytWNExNa1RwNlJ2UHNBUmZuUEFUWlpqMXEvOVo4cmpSV2tl?=
 =?utf-8?B?UVVBaE1qeUJaOUNTMjdDVlloZzN5QkUvc3o5Q1JMYXphYVVaOUlaU2hDL0J3?=
 =?utf-8?B?ZmljcThhSFhlQ0xEYW4zNnQ4cGhZd1pvc1J6SDJRVVNsWFgzdVBKUmtrRHJL?=
 =?utf-8?B?SUFPZXF3RTEzeXJycGwzMk9xOEJCTHlVOGpJVTE4aEoxNmpEUnV2cUc5WWc5?=
 =?utf-8?B?MFM4Q2lLVjErcXlWMUEvT2E0UjQ4cFBWWUQ5dnRBTk5sTHViRGtta0ZXMHhL?=
 =?utf-8?B?cjQ2eFJhdzF3dGI0aHZBTHFnRVhYVE4xUmhEVXlrc0tEekRHbm51RzVqcWhv?=
 =?utf-8?B?cDRsVVh0SnNmdTNkU3pVdHhvcC8rR0xYTlVWVUxIQnBWczFoeFhtUDQwY0pr?=
 =?utf-8?B?TzRGeWsrT0w1engrRE91NmhLS1M2TnUrK3RITjUzUENGL2pIdkRJQU1KbWh0?=
 =?utf-8?B?cVdsYzRtQlVObDQ4enBKN2NJS3hpM2xwbUxXdmU4OHFxOWg0ZjVRM3Y2UjdX?=
 =?utf-8?B?TzRsUVQ1cEhHNlRGa3V3dlJ0bFpSemRTMmxIU1lxQm9kaUh3eC85V3VURG9F?=
 =?utf-8?B?V3QwdFRKOTBvQ0JXamtmYkQva1JUSWxpeVpmdmtKWUk2Tk9sQUE3Wmd3MS9W?=
 =?utf-8?B?ZE1FWTB5Q2xLTVIvUXlWcjF4QWZTZmVsckJiaVJQbDZzcFM2SDRXN3hlY2du?=
 =?utf-8?B?M0djRmc4bFNZSTllc0xoTk83a3NtVmhVWklNSDZHdUlMbk50emVCS2pyd2Rh?=
 =?utf-8?B?dE52ZHZ0V1d6OTNaRzNrQXRNSkRZOG5wMGdJV2xEY2RqQnNFaTlFNUhTZWxl?=
 =?utf-8?Q?Su+IBt?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:19:39.4794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb3d5d2-cf77-4ead-4fa8-08dd78eac005
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400

SGkgQXlhbiwNCg0KPiBPbiAxMSBBcHIgMjAyNSwgYXQgMTI6MDQsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEVuYWJsZSBlYXJseSBi
b290aW5nIG9mIEFybXY4LVIgQUFyY2gzMiBiYXNlZCBzeXN0ZW1zLg0KPiANCj4gQWRkZWQgTHVj
YSdzIFItYiBpbiBhbGwgdGhlIHBhdGNoZXMuDQo+IA0KPiBBeWFuIEt1bWFyIEhhbGRlciAoMyk6
DQo+ICB4ZW4vYXJtOiBNb3ZlIHNvbWUgb2YgdGhlIGZ1bmN0aW9ucyB0byBjb21tb24gZmlsZQ0K
PiAgeGVuL2FybTMyOiBDcmVhdGUgdGhlIHNhbWUgYm9vdC10aW1lIE1QVSByZWdpb25zIGFzIGFy
bTY0DQo+ICB4ZW4vYXJtMzI6IG1wdTogU3R1YnMgdG8gYnVpbGQgTVBVIGZvciBhcm0zMg0KDQpJ
4oCZdmUgY29tcGlsZWQgYm90aCBBcm0zMiBhbmQgQXJtNjQsIE1QVSAmIE1NVSBjb2RlOg0KDQpU
ZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo=

