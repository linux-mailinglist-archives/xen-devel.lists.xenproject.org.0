Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA93A80DFD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942344.1341533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29xk-0003KC-Uj; Tue, 08 Apr 2025 14:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942344.1341533; Tue, 08 Apr 2025 14:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29xk-0003G5-PH; Tue, 08 Apr 2025 14:30:04 +0000
Received: by outflank-mailman (input) for mailman id 942344;
 Tue, 08 Apr 2025 14:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wetR=W2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u29xj-00030U-MI
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:30:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2614::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f440b9fc-1485-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 16:30:01 +0200 (CEST)
Received: from DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) by VI1PR08MB5438.eurprd08.prod.outlook.com
 (2603:10a6:803:12e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 14:29:59 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::17) by DUZPR01CA0053.outlook.office365.com
 (2603:10a6:10:469::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 14:29:59 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 8 Apr 2025 14:29:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 VE1PR08MB5647.eurprd08.prod.outlook.com (2603:10a6:800:1b2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Tue, 8 Apr 2025 14:29:21 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 14:29:21 +0000
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
X-Inumbo-ID: f440b9fc-1485-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q6C/ZJAJLaAZeaRgJY9jpTNyi1rS7J3PTfMd8ziYjdLG2Wxr4KkrNjH13IFWF8x+oqs/PTA4CTFyojrdY19tBXcZ34rmFY9HvIDrmzTGCH3JV1I8mgkRoccsNvAg2j4Lm4PbYgdv0s2W733wLdfrfkb5HSiEdBIb6Vsix8qB81KZxx7J9ttPXosbcfXSDzGKu5frhWSWLXGnyAr5WKStxQf3OeWuxtqGAzVbjlmrwpGUHn97LllIZeLBzC+556wcpmPidtA/2bt7qbGggqGd0eEHipr1VV6Mt2AfJJq5UatMCHyKnCu+NiGtvKURv8+c78CsmDCUJp9J7L5dfhhf4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id+0WXbyElh6DKsfM1Fx31khUsFWufY4SlXqN8P3bqI=;
 b=O4pu5p0j1Zi9fqIeFDKNJf4BSyPZAYd3xcbgARQA3CoJnIRO/HzjklC1gME7BAU0ckWXQf3huGcVYhEHssFXH5ZWKfxQ2BnzksToH+iVABYyEMPCizzvTW/dFivhORa1Qk23MofDUwNCwxfpv0E92td9jYWgFsfSZPq5+qEqeM2WykhOprtVsCHAXNpFKLsLTean/EqjzB4oQw8NH2k5Cf0UIaFqYK6WV58CpMrFX3Vyg2dfJgxoc/SJrzB0ipE+o7gal78gKxx7W6k6tNS6WPLnsI9e+2qoY/9ivGssGWxY2w2pDxoxGvw0SZ+0fubw9Zb0ezOMy8pdJ6t+6/KlLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id+0WXbyElh6DKsfM1Fx31khUsFWufY4SlXqN8P3bqI=;
 b=l1KWz+s/ONR+Tw2KByHq+YVqZAZ3XFZQPYbyv4VamkpjpExW7q7zlvaTpAYWsH4uuk83lkJKVH6eftZ+s8SGTR6sj0hJNoxmWDJcTnahXWaw8SAtkT09D3uzlgIIo0GVUDkGWvzngOskrrSNi4XZc64sIpmBmZEARhf4LJtQ55s=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMgHD7n5nkjSS1kY0Ipiy7EC1R2jRqGJ18946TShceAxFbjgPefTU7bQMOmYsXWTftGhHx2NBvbowTUL8W3viVjXUHTGHbv7ICtsUjX0/DOj0EW4+J9EnzRTVUfr868iBkfWQlCiIDlle8YazkEx3NvQ2WqKMqEvI5Dk52enoRYiOFmB2ZjRbGA922P6HLhPVkyd3/3VypksLp2t4L9Fd4MvUSTzSlHncO2UVllAi12A/xwtAeEpocKzuPMRCZkBk5Zb2XdZUHjj5990P4ovdHNzokIVmnXSj3LZbO+qU5RqFty9kgmmHthGg5yOcLf6kd9NdkHjSXoEo+0WrzXOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id+0WXbyElh6DKsfM1Fx31khUsFWufY4SlXqN8P3bqI=;
 b=QMIFKHzYNJxyZMjdU6xBVuadHXk9TGe2M3xjkdPtmCCCLADDBhBz76js5FbDsLu9MIEnclxaKo8Dz+pNtFuA6otzGDwLpae4pCABKayGWCSJhF/+Megijad032WeVEFdUCySZ1K72b33Q/U6I/3tLaMZ3ePEZiwf6OAhI/bRN8iGPZjuiFhKnj3gQem/jreFm69Ia0SLOuLQ84rbyBLHlyf6KrZo8iTQouZDfyQ+vdqqa8RSvaoKtxgb9u4d8tvOoZ2ms7cbG4rRyfz241pzXsCgRIN+lShs/EFhWZY4AVj31UAJigDqw8g85MeSJdb6ZGE0HoHcedjvmvtzgkDe9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id+0WXbyElh6DKsfM1Fx31khUsFWufY4SlXqN8P3bqI=;
 b=l1KWz+s/ONR+Tw2KByHq+YVqZAZ3XFZQPYbyv4VamkpjpExW7q7zlvaTpAYWsH4uuk83lkJKVH6eftZ+s8SGTR6sj0hJNoxmWDJcTnahXWaw8SAtkT09D3uzlgIIo0GVUDkGWvzngOskrrSNi4XZc64sIpmBmZEARhf4LJtQ55s=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index: AQHbp52Ro+Yg+pQClU+WnJSxei+hH7OZzl8AgAAHm4A=
Date: Tue, 8 Apr 2025 14:29:21 +0000
Message-ID: <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
In-Reply-To: <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|VE1PR08MB5647:EE_|DU2PEPF00028D0C:EE_|VI1PR08MB5438:EE_
X-MS-Office365-Filtering-Correlation-Id: 7025dd72-48c5-4146-a485-08dd76a9d733
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ai8rc1FENndHa29XaWd1TDVOZkRNbmR2WmIrSWs0c2h2eUh4WXQwV2JwOVZZ?=
 =?utf-8?B?SkRraExXTmJWS2J0TUpnQ2dIYW1uak9BaE9rdXNLY09UanllZUpORDFscVpC?=
 =?utf-8?B?STJKaUxUMXZuQ2ZHbG5MUERpT3ZvZmxLTEdleGthL3Rzall2UUtkcHEzMHN0?=
 =?utf-8?B?eEVPeGQ1MnErV09TekJsZHc4VFRzbi8zVFlPUXpZWDBmRWE2Q2Rwem9pT3k3?=
 =?utf-8?B?Tm9HSnNCYTNUbGZRcjBmcC8wWmMyRU5VWFlXSWEyaEVrclBHb0tSeFFuYy9J?=
 =?utf-8?B?dXdiZEFhRGhEN01XazFDRFo4WENYeFZPTlFJSVBqSG5ESG5IMFZ5b3JiNGE3?=
 =?utf-8?B?NWphZWpJS29pUlNZMmU1Z2YwMERNb0c0dE5XRVpObW1IQVYvMUVkV1FqaGhN?=
 =?utf-8?B?M0xTSU9oOWM4YW1xR0tFeUJOSG9rTDlUdHZzdDZUVUFxZWk1V3R1VmlOVkFG?=
 =?utf-8?B?emVvTk1BWndzenJFMUpoVW9lWjVOaHFaSURUMGM2cDlycHU3bzZHR1NmakRI?=
 =?utf-8?B?dU5zRTdLdUtPQ0lZOHhFR1VHckJiclhEeDVPOW8wMnF3cGdIMy8yaW1wUmVX?=
 =?utf-8?B?b3lSdzdDZnp1SE5qK3hqSk9vdGpncU9oSTdQSU1Kb042SEtZam1VVGRibXZS?=
 =?utf-8?B?WWpNeTVvVXlqdW1wOFpnRVJySk0zRjZRU2xHcXFmUGVqZExKWmUyV3lnM0VD?=
 =?utf-8?B?K0Q0UC9DQytRWHZOOFA1Rk5XZE1jTys1a3Q3TWlPQk9HbzloQ0d4WUZCUk5l?=
 =?utf-8?B?bW9UeEtQWXptQVk5TW03dEdmRnRvZ2hvcVRMcFZ3dnpJQ0kzUkVpTTZHRDVl?=
 =?utf-8?B?eVRKT3MyMXhKU3ZjS0V1M29GVmF4bTlnMjZUT1FDUDd5cFB0S09ES1RyYTZH?=
 =?utf-8?B?UGdXS2x2WjJtbklyTE5RRGZKVFNYMlh3OE1PVVRlb0FRREFuMDhFYk96NnVS?=
 =?utf-8?B?VnFnQndEQ1NCVGJqMWh0QVJvbFdNMWtnTHVoTFpCSWQrbktOSHRCTVkwZE9T?=
 =?utf-8?B?SmRZV28zb29Fa0hTQUkxaXR0ZEVqV0RhWU5oUE9KZnZUamJaNDBNUHRPc0Jv?=
 =?utf-8?B?Y01qNFc5cG81bnFnZlFRZldxRVhUQ3Fna3JLd0x6bitmU3VYSDNhbElIL3ZS?=
 =?utf-8?B?WVR6eHJDRXNoc3YvZmxCTm0vWGxHellrZXYyWEZRRFBieGZ3V3JaTDU0Unk4?=
 =?utf-8?B?NEVjVU9MaGNTcllvTVRiRW1FK0p0UEhwZUZidTU3Ti9TaEZ2Y040TmxpeDNE?=
 =?utf-8?B?Yy85dlhHVC9pU1FRVmdwM0lVZEpKUHEwYWtUNDh1anFQTDRZaU9PT1dPUmNE?=
 =?utf-8?B?d1l1Q2wwRCtZbldNNFFsOFlhekg1QTQzd2xTQS9ad2tTSXE0eTVqT093WlNo?=
 =?utf-8?B?Vm5GQyt1UVptM2FTT1paTmd1WlQyMUF0UTNjcFFyczNVNG9ERlhoNFd3UFZs?=
 =?utf-8?B?cjczUy9meElvLzB4cStQcEJFNk9LRkcyQlNGMG5PbU1iWU44QlRYSFVhck1N?=
 =?utf-8?B?cDM4SytNOWpUSGhreE90ZnNzdlA5SUl5NDhNSTRpd2UxaVZPNnlsK1oyakZN?=
 =?utf-8?B?NWF1K250WmdhQ2RLbzkxQTJMWHVTMmRBTXVUUFdtc3RmVkdrQkNzZkliZDFQ?=
 =?utf-8?B?R0grTjdPM1E3U3JZT0pKZkozV2JDNGJ4ZXh6cWZnZHkwZ1lhYkM0ZW1rbVM4?=
 =?utf-8?B?bTNsbFg1a0p4c3JIQWRxN1k3T2EwQ3ozOVROK2FoN2YxbyticDQvd1psNEZ2?=
 =?utf-8?B?MlRvc3hRT2JGWDdMb1U2TmZFS1djd2Z4aTJ3QUVXZVg5bzJ6MmVQenEyS1Qx?=
 =?utf-8?B?ZWorRUpnNWJ5cTFnV1crYjMwaE5Wb2k4cmpiMjBLREZxYTNuL1hPNTQ1UHF2?=
 =?utf-8?B?aXhuRTNUWlNUUDJ2K05CMTBqVks0emNZdTByUUsrZlc1cktBTnpRb0U4Mmkr?=
 =?utf-8?Q?pb8O1ODI2WZ3sU6FaMyib1RmAWQiH4nT?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DAD99C34FBAE345B1C1A58C5D087CC5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5647
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f967debd-4cac-4996-0978-08dd76a9c113
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnU3RjM0TjIwc3VHWUlyK1ljdmlYVytneU9wdlFROHR2a2RUeXVQd2ZROURG?=
 =?utf-8?B?U3EwaVZjME8yeDR3S2RMUDNxQVVza2ZsRWVCaVIxTUxpZmdJSUVtM2RFbStR?=
 =?utf-8?B?YzYwcjhGMW1SdUdCUjRDYW5GeXRVenAxcVlmcklNUlgxM21zRUFQQ1I4aGpY?=
 =?utf-8?B?RHpwblZQMG4zSTRCVzBxK0JBUXlYWDRYbXlDT3NCblBvbE5jUXZLUFdUUVZl?=
 =?utf-8?B?ZEp0Y0dRcTcvOEJmNm5uQm9wRVRDTlM0bERYY3NLRDRFNUJNb2RYV3NOMXFt?=
 =?utf-8?B?d2YzaEFad1h3c2htZnIwK2c3YUdvS3hKaWdTZzF0R0x2Sk1NWHR0NnBiWlcr?=
 =?utf-8?B?YnNtL0wxU1hLZDVSNzBUS3JlWnkxNjNjSHF1eVU5SkZPVkNSdUQzOFZEUjAr?=
 =?utf-8?B?WGpiTkhaQTJjcmdQaC9rTXp2ZmxVY3JpbFRNTlhxOU9jWXo5VDJFVWR3ZmlU?=
 =?utf-8?B?d3NuMmVad2JYVXJ6MzllSDA0Sk9rQ3lpaklQbDMvR0ZWcDVWeTd2RC9ZK2xr?=
 =?utf-8?B?RTRoT1A3MjVBVzNKblQwR29vZHFkaXhXbm9ZWDhaUitiYTA4YkVkQTAyTTla?=
 =?utf-8?B?dXQ4Y3J0Vk5EdlFXanhKc2p0ZlFDNlVKT0traXhlWUozN0tBT0JOaTBpbm8r?=
 =?utf-8?B?S0sxaFdaVVkwNVJtcWNXOWV5cU91elErUFpucGV4Y2k1SEg3Q2dKRG1UdFJR?=
 =?utf-8?B?Y2c3M004VE4wSmhicWdIcytoSksyeExEakMxVmo3c0Vqc3RiMlBxUVlHTDZF?=
 =?utf-8?B?T094YVVjMVo1THhWL2dwdTIyMjMyT0pCYUtZWnVVVHA1OS8yMnZZaVlMY3JF?=
 =?utf-8?B?aGsvQjVKWlZTTURrSGIxellwT2VpWURLSG1zdTVMMDdGa2hZUjdKenhHTG9Y?=
 =?utf-8?B?SlNKanV1Q0tndE1nUzMwb0NhQklBM2ZYY2ZyOTBTdTRoazVZMVZ6UFFmdVNY?=
 =?utf-8?B?N3ZSOUtZQWxzUDVBYXMxc0FkenVrdm5uZWdxWUEycFZnbHVWZjkvTEg1WVk0?=
 =?utf-8?B?bVB3akwyRDRMSXprRFpGdkFPUEIvSjRWVjYzTnlJa2hoS1dncnpNem5tT29j?=
 =?utf-8?B?RVhZSXM1UmVYMVNFTnlvcDJIdFRkOWRKc2pKUk9MSXlqVEswenBiUHJnT1lU?=
 =?utf-8?B?M0pSbm9qT3VxZ1pib1MvL0orVENmV1pidXBTVkJORGlkR25HNWo0MnBlbm0v?=
 =?utf-8?B?MWlPYTJsNEJHMFBGVXUyT1lQKzVXWFp0cmV6N2FnY09wbit3bzE0dHUyeWlN?=
 =?utf-8?B?K2g2bTF3R3lUOEFmd05RWUpSVDI5NVZvWlBIQ1Q4aGxmQmg0QmZTem5zdU1N?=
 =?utf-8?B?MWgvTjM4YkUyTEdmUmR3RUxINjM5TG9lYU5iOUp5a1djQ09DV1orRktTYnJF?=
 =?utf-8?B?TXNqTk1Fdlo4T1ZlejAzNEFVYkxYd2NmYUhtejlFU3ZwSUtjVmRDaytseDhp?=
 =?utf-8?B?RmE3STFLNjgvZkdGNnNxTXdRNExGdThOTzY3NjdZMHlCbkc0dXZsaWlxSmc1?=
 =?utf-8?B?QXdxUXlpWTdzSXU1bGc5Q0pOWWV5dThtNjhtbFRoK3E3RXpNS1pxM2pLNHgr?=
 =?utf-8?B?YzlIVldkNnVoc2JuTUFpMStXZ1l5Q1BubXk1bjNSMG9Ia3FaeXRNbWxlOGF0?=
 =?utf-8?B?d2g1VjhFc0lGd3hUOExSVkF4VUxFQ0YzR0JETFAwRVJ0QnYveEljNGdBNkNR?=
 =?utf-8?B?TXdoWHRzOEZXd0VTMWRmS3hoVWVXOHdBNUJmVm91M3FnU2NnM1FxNnlVV2x0?=
 =?utf-8?B?aHgyaE5jbXFmd0FoRkVVSzdvSk5rRFpoN1NyWmhDSzFQUHl6V0JCYVRiNzFx?=
 =?utf-8?B?aVhWMjU3R2I0SHk3ZVlneDU2NGo1ZjI2WDFqRGlkdG5DbkNFWGpSZ1BWWnh6?=
 =?utf-8?B?UjZNVFE0cFhwVmpWSjByd2RIdUx4WFQ0bmkxMDYwejVvNWdoM2pDRXBENFB1?=
 =?utf-8?B?d0huOCtZVTlmRnRUSGFaVW45MTI1ckxhT3dKRVhNQTQzaDVTVG52MFJvSEpC?=
 =?utf-8?B?RmhtbVNPZlBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:29:58.7421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7025dd72-48c5-4146-a485-08dd76a9d733
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5438

SGkgQXlhbiwNCg0KPiBPbiA4IEFwciAyMDI1LCBhdCAxNTowMiwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+PiANCj4+ICtz
dGF0aWMgdm9pZCBwcmVwYXJlX3NlbGVjdG9yKHVpbnQ4X3Qgc2VsKQ0KPj4gK3sNCj4+ICsgICAg
LyoNCj4+ICsgICAgICoge3JlYWQsd3JpdGV9X3Byb3RlY3Rpb25fcmVnaW9uIHdvcmtzIHVzaW5n
IHRoZSBkaXJlY3QgYWNjZXNzIHRvIHRoZSAwLi4xNQ0KPj4gKyAgICAgKiByZWdpb25zLCBzbyBp
biBvcmRlciB0byBzYXZlIHRoZSBpc2IoKSBvdmVyaGVhZCwgY2hhbmdlIHRoZSBQUlNFTFJfRUwy
DQo+PiArICAgICAqIG9ubHkgd2hlbiBuZWVkZWQsIHNvIHdoZW4gdGhlIHVwcGVyIDQgYml0cyBv
ZiB0aGUgc2VsZWN0b3Igd2lsbCBjaGFuZ2UuDQo+PiArICAgICAqLw0KPj4gKyAgICBzZWwgJj0g
MHhGMFU7DQo+PiArICAgIGlmICggUkVBRF9TWVNSRUcoUFJTRUxSX0VMMikgIT0gc2VsICkNCj4+
ICsgICAgew0KPj4gKyAgICAgICAgV1JJVEVfU1lTUkVHKHNlbCwgUFJTRUxSX0VMMik7DQo+PiAr
ICAgICAgICBpc2IoKTsNCj4+ICsgICAgfQ0KPiANCj4gVGhpcyBuZWVkcyB0byBiZSBhcm02NCBz
cGVjaWZpYy4gUmVmZXIgQVJNIERESSAwNjAwQS5kIElEMTIwODIxDQo+IA0KPiBHMS4zLjE5ICBQ
UkJBUjxuPl9FTDIsIC8qIEkgZ3Vlc3MgdGhpcyBpcyB3aGF0IHlvdSBhcmUgZm9sbG93aW5nICov
DQo+IA0KPiBQcm92aWRlcyBhY2Nlc3MgdG8gdGhlIGJhc2UgYWRkcmVzcyBmb3IgdGhlIE1QVSBy
ZWdpb24gZGV0ZXJtaW5lZCBieSB0aGUgdmFsdWUgb2YgJ24nIGFuZA0KPiBQUlNFTFJfRUwyLlJF
R0lPTiBhcyBQUlNFTFJfRUwyLlJFR0lPTjw3OjQ+Om4uDQo+IA0KPiANCj4gV2hlcmVhcyBmb3Ig
YXJtMzIgLiBSZWZlciBBUk0gRERJIDA1NjhBLmMgSUQxMTA1MjANCj4gDQo+IEUyLjIuMyBIUFJC
QVI8bj4sDQo+IA0KPiBQcm92aWRlcyBhY2Nlc3MgdG8gdGhlIGJhc2UgYWRkcmVzc2VzIGZvciB0
aGUgZmlyc3QgMzIgZGVmaW5lZCBFTDIgTVBVIHJlZ2lvbnMuDQo+IA0KPiAvKiBIZXJlIHdlIGRv
IG5vdCBuZWVkIHRvIHVzZSBIUFJTRUxSIGZvciByZWdpb24gc2VsZWN0aW9uICovDQo+IA0KPiAN
Cj4gSWYgeW91IHdhbnQgdG8gbWFrZSB0aGUgY29kZSBzaW1pbGFyIGJldHdlZW4gYXJtMzIgYW5k
IGFybTY0LCB0aGVuIEkgY2FuIHN1Z2dlc3QgeW91IGNhbiB1c2UgdGhlc2UgcmVnaXN0ZXJzLg0K
PiANCj4gRzEuMy4xNyBQUkJBUl9FTDINCj4gDQo+IFByb3ZpZGVzIGFjY2VzcyB0byB0aGUgYmFz
ZSBhZGRyZXNzZXMgZm9yIHRoZSBFTDIgTVBVIHJlZ2lvbi4gUFJTRUxSX0VMMi5SRUdJT04gZGV0
ZXJtaW5lcw0KPiB3aGljaCBNUFUgcmVnaW9uIGlzIHNlbGVjdGVkLg0KPiANCj4gRTIuMi4yIEhQ
UkJBUg0KPiANCj4gUHJvdmlkZXMgaW5kaXJlY3QgYWNjZXNzIHRvIHRoZSBiYXNlIGFkZHJlc3Mg
b2YgdGhlIEVMMiBNUFUgcmVnaW9uIGN1cnJlbnRseSBkZWZpbmVkIGJ5DQo+IEhQUlNFTFIuDQo+
IA0KPiBMZXQgbWUga25vdyBpZiBpdCBtYWtlcyBzZW5zZS4NCj4gDQo+IC0gQXlhbg0KDQpPayBJ
IGRpZGlu4oCZdCBnZXQgdGhhdCBiZWZvcmUsIHdoYXQgZG8geW91IHRoaW5rIGlmIEkgbW9kaWZ5
IHRoZSBjb2RlIGFzIGluIHRoaXMgZGlmZiAobm90IHRlc3RlZCk6DQoNCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vbXB1L21tLmMgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCmluZGV4IGZlMDVj
ODA5NzE1NS4uMWJjNmQ3YTc3Mjk2IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL21wdS9tbS5j
DQorKysgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCkBAIC01OCwxOSArNTgsMjEgQEAgc3RhdGlj
IHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkNCiAgICAg
QlVJTERfQlVHX09OKFBBR0VfU0laRSAhPSBTWl80Syk7DQogfQ0KIA0KLXN0YXRpYyB2b2lkIHBy
ZXBhcmVfc2VsZWN0b3IodWludDhfdCBzZWwpDQorc3RhdGljIHZvaWQgcHJlcGFyZV9zZWxlY3Rv
cih1aW50OF90ICpzZWwpDQogew0KKyAgICB1aW50OF90IGN1cl9zZWwgPSAqc2VsOw0KICAgICAv
Kg0KICAgICAgKiB7cmVhZCx3cml0ZX1fcHJvdGVjdGlvbl9yZWdpb24gd29ya3MgdXNpbmcgdGhl
IGRpcmVjdCBhY2Nlc3MgdG8gdGhlIDAuLjE1DQogICAgICAqIHJlZ2lvbnMsIHNvIGluIG9yZGVy
IHRvIHNhdmUgdGhlIGlzYigpIG92ZXJoZWFkLCBjaGFuZ2UgdGhlIFBSU0VMUl9FTDINCiAgICAg
ICogb25seSB3aGVuIG5lZWRlZCwgc28gd2hlbiB0aGUgdXBwZXIgNCBiaXRzIG9mIHRoZSBzZWxl
Y3RvciB3aWxsIGNoYW5nZS4NCiAgICAgICovDQotICAgIHNlbCAmPSAweEYwVTsNCi0gICAgaWYg
KCBSRUFEX1NZU1JFRyhQUlNFTFJfRUwyKSAhPSBzZWwgKQ0KKyAgICBjdXJfc2VsICY9IDB4RjBV
Ow0KKyAgICBpZiAoIFJFQURfU1lTUkVHKFBSU0VMUl9FTDIpICE9IGN1cl9zZWwgKQ0KICAgICB7
DQotICAgICAgICBXUklURV9TWVNSRUcoc2VsLCBQUlNFTFJfRUwyKTsNCisgICAgICAgIFdSSVRF
X1NZU1JFRyhjdXJfc2VsLCBQUlNFTFJfRUwyKTsNCiAgICAgICAgIGlzYigpOw0KICAgICB9DQor
ICAgICpzZWwgPSAqc2VsICYgMHhGVTsNCiB9DQogDQogLyoNCkBAIC0xMDIsNyArMTA0LDcgQEAg
dm9pZCByZWFkX3Byb3RlY3Rpb25fcmVnaW9uKHByX3QgKnByX3JlYWQsIHVpbnQ4X3Qgc2VsKQ0K
ICAgICAgKi8NCiAgICAgcHJlcGFyZV9zZWxlY3RvcihzZWwpOw0KIA0KLSAgICBzd2l0Y2ggKCBz
ZWwgJiAweEZVICkNCisgICAgc3dpdGNoICggc2VsICkNCiAgICAgew0KICAgICAgICAgR0VORVJB
VEVfUkVBRF9QUl9SRUdfQ0FTRSgwLCBwcl9yZWFkKTsNCiAgICAgICAgIEdFTkVSQVRFX1JFQURf
UFJfUkVHX0NBU0UoMSwgcHJfcmVhZCk7DQpAQCAtMTQwLDcgKzE0Miw3IEBAIHZvaWQgd3JpdGVf
cHJvdGVjdGlvbl9yZWdpb24oY29uc3QgcHJfdCAqcHJfd3JpdGUsIHVpbnQ4X3Qgc2VsKQ0KICAg
ICAgKi8NCiAgICAgcHJlcGFyZV9zZWxlY3RvcihzZWwpOw0KIA0KLSAgICBzd2l0Y2ggKCBzZWwg
JiAweEZVICkNCisgICAgc3dpdGNoICggc2VsICkNCiAgICAgew0KICAgICAgICAgR0VORVJBVEVf
V1JJVEVfUFJfUkVHX0NBU0UoMCwgcHJfd3JpdGUpOw0KICAgICAgICAgR0VORVJBVEVfV1JJVEVf
UFJfUkVHX0NBU0UoMSwgcHJfd3JpdGUpOw0KDQpBbmQgbGF0ZXIgeW91IHdpbGwgdXNlIHNvbWUg
I2lmZGVmIENPTkZJR19BUk1fMzIgaW5zaWRlIHByZXBhcmVfc2VsZWN0b3IoKSB0byBjaGVjaw0K
dGhhdCB0aGUgY29kZSBpcyBwYXNzaW5nIHVwIHRvIHRoZSBtYXggc3VwcG9ydGVkIHJlZ2lvbiBv
ciBwYW5pYy4NCkFuZCBpbiB7cmVhZCx3cml0ZX1fcHJvdGVjdGlvbl9yZWdpb24oKSB5b3UgY291
bGQgYWRkIHNvbWUgI2lmZGVmIENPTkZJR19BUk1fMzIgdG8gYWRkDQp0aGUgY2FzZSBnZW5lcmF0
b3JzIGZvciByZWdpb25zIGZyb20gMTYgdG8gMjMgc2luY2UgUjUyIGNhbiBhZGRyZXNzIHRoZW0g
ZGlyZWN0bHkuDQoNCldoYXQgZG8geW91IHRoaW5rPw0KDQpDaGVlcnMsDQpMdWNhDQoNCg0KDQoN
Cg==

