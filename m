Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB500ADAB74
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 11:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017066.1394028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5mW-0001hj-CC; Mon, 16 Jun 2025 09:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017066.1394028; Mon, 16 Jun 2025 09:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5mW-0001g5-98; Mon, 16 Jun 2025 09:05:32 +0000
Received: by outflank-mailman (input) for mailman id 1017066;
 Mon, 16 Jun 2025 09:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR5mU-0001fz-MJ
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 09:05:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2418::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0918b1e8-4a91-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 11:05:24 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY5PR12MB6156.namprd12.prod.outlook.com (2603:10b6:930:24::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Mon, 16 Jun 2025 09:05:21 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 09:05:20 +0000
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
X-Inumbo-ID: 0918b1e8-4a91-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM4AvX0zHU8PourLkY8w8xTXqYkWNfFoHiVBDQPpNAdJcdJY4ZdF7oHmRm0YlBOoXG7f59qiJrbt+D3RRpfZbhDw4+avkfN27IAzP11PFxg3fgg7Bj2kFJusX0OVs6reHsJokISEnSQ6zN3iPZ7RznzEObKVreu4tATxIvxZd8XO1WeScLWxo1X4JvBZGd5keTyo3s2/nOdLFgm0GU6iJuP04qTn1rwauHo5F/4H41RbMImiD2+y9/XyIxyHYmaC5WMP/c3SaUtMmxGPNVFOjxZPzMPw0CIITP2y/7E7gDtxYqSViHCAmWoM1lSXszk8sv8wdFzzFbdZdoH6HOuolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86DipraPTR65br2hSMwr9FW4ooObYOdYVQ7sKn3EtmM=;
 b=GshT5erps1nRBHNYbD+GQ/jA7DzV64eVp/VBQIf23aj5zPuftBriITSwfVNMsqb8ysMmKKfY1CywDIjgZFzzhyZhk9Nr37eufXBWzDDnhKXQhk/1ermN3U9rYf3EEhU6BN2L7T0qebfC3hbHZS/98so2X1IAHGHp2DfzfHADjFKUI5lGBlFT7DmyaDkS+pPPdPbDTUn3hbsjWYmudUjATwdmOLy/YMbZSv7ObKsmKGuVszCxUMa3TBBxiBpmGtwDCrQcnMbAjiYGMHCZe0BZFa99sw/+b5ZTnAjBM7bSctMRmZyigpheEaw93V1dj3GrBQj/c0hrHYYGblXzDTqNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86DipraPTR65br2hSMwr9FW4ooObYOdYVQ7sKn3EtmM=;
 b=MO0+02L7oJZMvwUP0qbLDJiejH3jigXRCDNKmXHHZbm1wOFqGBoZZHkvcCAEeHurkvoywKNBSothL5wv4N5THqOI3emLQwhlBUobmxyWSicd+KipCErpzjKigWWC2BgAHBeFI3sLzlbnwtM/eGUjgcM0VuyJCOvosc+SwPLNAL8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with
 XEN_PX_INIT
Thread-Topic: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with
 XEN_PX_INIT
Thread-Index: AQHbzuQ5KDq5M5MbdEiyL/UuBwqBb7P+KsSAgALCz6A=
Date: Mon, 16 Jun 2025 09:05:20 +0000
Message-ID:
 <DM4PR12MB845179B8BDD9399B0DDB7260E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-2-Penny.Zheng@amd.com>
 <0d60d42f-d844-41b5-a8ca-bdfe7883d15b@suse.com>
In-Reply-To: <0d60d42f-d844-41b5-a8ca-bdfe7883d15b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-16T09:05:12.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY5PR12MB6156:EE_
x-ms-office365-filtering-correlation-id: 4278126c-be7e-4a04-86f8-08ddacb4ebee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UG9JblFFUTdLa21sYmNRd3pJYnhXNkQxRWo3TVhna2VSNHpWVzNYWXNLL1dr?=
 =?utf-8?B?Z0YyUERSNlB5TEJOb2ZkckIydXlNd1JWc0xWVTQ3YkVOVUEwR1FMV0NhTGF2?=
 =?utf-8?B?RGxYUWVYRkd0MmRFdmt3VjBxNXoxZGMwTGdWQ29Kc21OM1I2VDJSQVRVa1hx?=
 =?utf-8?B?bHg0MG9iSDNxSmo2bDhxSTNnclArdW1ROVBJOG5rM2pQR08vb0Z3MTJWUlpC?=
 =?utf-8?B?VVlPNEpFdWh4V1ErQkoybVZLWTR1WnRWYnMvWGs5cnBXZElwQ05KYU9CelRr?=
 =?utf-8?B?TTgyM3NaeVNPQ0hkbnZRVUJFdk9sNXNaZEFxN0RUUVVzdlY4M1ZPZ1hLQk9j?=
 =?utf-8?B?S0tsek8vRnppTUFIZWk3RG9Wc1ZRem5qWEE0eFdCTGlpVjVMcUtCU0NhL1ZM?=
 =?utf-8?B?d3hYN1FxMTJ6ekpNOHJ6MGJPNllWNG1yVXE5WXFsMlpXSk0xdE1nakFudG1k?=
 =?utf-8?B?UUJXK3owdlovQmZYNW0wZjluQi9lYURPUjBJSVNPUmw5U2pJWER4VHVKaWht?=
 =?utf-8?B?MDdaNjk5bnJ1RmtvcFdWMmlhUGFBaTVleFBabW5xUzB6N3p6UlpFNUhKdHoz?=
 =?utf-8?B?M0F4WS81Nm5CcWRDVUIxU2VaeUlNOVhuZGh3NURpRnltTDBMNHdqNlYvMzBB?=
 =?utf-8?B?b1gxb3ZHenVnYmpVaGFxbGpTVDZiRlhwZTRnNUN5QnJTM01hZEJObEZpOW5C?=
 =?utf-8?B?RTVHVXpLOW5rMkFFbTdJc0NId0VFaHU0WTBDRm5VT1RBUFM4b2pZblRPWm1O?=
 =?utf-8?B?WkxqWjE0bVFHdDg3OHkvNVAzbEd4L3IrT0FYRVdRckxpdCtqUzBGMGoxYVJQ?=
 =?utf-8?B?TjAyRDJTVmh6ZEd2M0RsZkluWFdvemFDWUxaL0hQWkxJT2ZFbE9mYUJ3RzFY?=
 =?utf-8?B?VXFWNlZHdG43QkNFZDRicVZ2cVlaZDJjRldmK2JYWXlmM2wveDhJd21odWkz?=
 =?utf-8?B?bFlYMEtieUZDbDZrbHU3dVg0bnY4YUtpTkU2S1lGYjJtUjdHOEJsTW41QkFQ?=
 =?utf-8?B?VDRjeG9VeVpZYlZIRWNWVVY4ZWsvQ3hSVEwzdWdPWGp2TzNMSk5acERQUTFO?=
 =?utf-8?B?a0srZ3hydXZTcWo4Y3hTSVpUSG1tN2h3aWlyalVXMUR2R2l3azB1Kzg4WmVw?=
 =?utf-8?B?TzVRMkhDNDY5WHgzdlJqdXhzU1RCekd3c2hxVjBaVGVGemNrUiszT2JQTnZC?=
 =?utf-8?B?UEFCNDNqZmo3Y3dvM2ZDN3hqRWlGaSt5aWZzNVQ4ZXNVcEF6N0RzUUQwbDZj?=
 =?utf-8?B?Rmc3ZE53emdRYmxkTTVMbWxPdk94ME9sSHMyZDdncHpIQy83a1JlMVRkVHdW?=
 =?utf-8?B?RHBpS0FqTzNmRVpkS2xtMFpId0Y3cWdPZkc2MEZCSVVBdFo1OTFBMDdyd0Nl?=
 =?utf-8?B?cm9teEJBanAwUm94R0NCVi9BNkR0UXlSczNhNm9WVmtlc2VoZklNS2NKbFBT?=
 =?utf-8?B?WTJkcGVIdXcvUklDL1ZOVGlpNm14bERaVkliNzVYMWZ2WjBwcFlHMkJnTG9S?=
 =?utf-8?B?Z216Yi9kOFY4cFZCcExob0xHcU04NVpYbzA2Mko0MXpFWGJteUcyTzFuc0ZL?=
 =?utf-8?B?NzFLTU94Q0ttVVpDZ1R3WGZRMVZ6R2hGR3JHY2xnUjNtRWZnUjNHbWpSaWdt?=
 =?utf-8?B?QlZxZWFBK2xzTFpQdnVPOS9pM1VpWFhubDgzWjF2dUFPSXl4Z1dzTFFoQkFK?=
 =?utf-8?B?QXVvYkdKMGlMVmJtTU5YaUh4eE5McUZGeXBBT2hnTkRJMTVDeEVOYVlubmlv?=
 =?utf-8?B?YlZiRktvR2JZZlBPTDVOTVU2YUpFSGdDSkZPSzVDc09CcDcrTzcvRXZyWXJT?=
 =?utf-8?B?MmVub1lPbG9MOG9Nbk9UTUcrejhkcFZ1SEVDcHFJVGtvQ0ExRGU0aFBHWUU0?=
 =?utf-8?B?MHg3V3Nnc1M1OTFQWnNuZjhQcG1lZ2dmczZHSVVYZVBieTJsNHZteEFBTVpP?=
 =?utf-8?B?Z3dYS2lyRldjVUtNV09sZSs2RXA0NDJRS0lsUnpVMlNaeEN0dEVEU09NcXZP?=
 =?utf-8?Q?xJ0NRTzpDRwnlYUVtAvgtpmntjJLlk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGtiWTEzd0NKaEdFb0Rkc1FPRDV1Z21PRytxZUMreEkrZDVGWlpxZWZMRGYz?=
 =?utf-8?B?MG1EM0pEL25waGdzMjFnZ2lHbVRHNUJDanFBbW1iR1BpYVhHT0NUanF4MmQ2?=
 =?utf-8?B?QkcxSmM3Sm5mdDN3cXpaWCsrR3RyNFduV1dmR2txVnYyVzY5QUtNWHZVRTB2?=
 =?utf-8?B?SnRDWnQzQUhPM0FMUkR5YlhUUzBJTVFoNzNqNnBpT3Z2QjQ4bi9EL2h3Rm12?=
 =?utf-8?B?OU1iVXBUVzhLbWR5bzhJdmphdU5BOUx2VHFDdUx0aXFYb0ZFaUlLMWRJVXJD?=
 =?utf-8?B?QmFMZStiSmptUmhvVlNuM01DWmwvRVBXUTNWd1Y1a2VzOGhUUTJJZUlNeVBN?=
 =?utf-8?B?Snh6c2grMTVRODJObitHRDB3WC85TVlLM1RJb0pURlp3M2VWcEMvcHE5Z2NN?=
 =?utf-8?B?bTIrbGVJK2xxY1dOellpWmRkTTNGcnk2MSs4RklNSkhPMmNsdWQxc2JkTVhM?=
 =?utf-8?B?U2FuZ0xjSVZtOTFVcm9ockZjN2w0NFVabEFQellZakRjak5GdDBuWUcyRnkv?=
 =?utf-8?B?TEZMaDBkczNoSVVXSGZlWDRUWUpSQVVKU05ZbHVMdTRmSWcrbEZVTXJOamg4?=
 =?utf-8?B?cE8yT3d6Q2ZWN2FKekg1NmNiWmY2VWdreHZQLzhHNGtidW00U2s5bnljNTVk?=
 =?utf-8?B?bVNndklXWFc0bFFEOXNSZ0FSbWVQTnU3VDRzVjZWRXMwVXB0RFZXUXpydzhE?=
 =?utf-8?B?RE90WjZqblF6QTVHcFhGa3NGa3ZJeDI3NUFYR1cwMnUwK0VJNCt3UFJhbWhJ?=
 =?utf-8?B?aTU4c2xjV2ZxSHkyTmhscUp0eVRLOUJuK1RUSVp2NDZRUkFQa0l4OGM4Nlhl?=
 =?utf-8?B?NHZTbGRTaGEwdFN6TFh3MklhenM3ZnBXblNtU2xMc3ZidzRtVmcwTmF5L0RG?=
 =?utf-8?B?NnplNjZiS1p6V0U3Z3pKeHBiQm0zc3BMcGYzU2VQQUxrWkNJMVhqVFQrSXVa?=
 =?utf-8?B?M0tzMXlWM1h2ek5NQTBWWXFPV0JqMC93RGlWc1dGQVBVb2ZiQU1QeGdyV3lZ?=
 =?utf-8?B?ZG9iMGFlYnBTbURFVXJVcEpMelp2RmNHTFkxaUFodWlpVStUZ1NJalB2YnZT?=
 =?utf-8?B?WTlPWUp4QUF2Nm8yTE5PTFdQOFl0aDRKaUtvSzZFVDVxVUgvSGNheXJkOENp?=
 =?utf-8?B?RlZDYmF0L3VQVVIzTXpOMnNQak0raDNWeXpyWVdRRlc2ek1DNlhTV0tRQlZv?=
 =?utf-8?B?RWkveC82aXdJcXk5MnBOL3ZXMkxpTUZkUVBLQmxDa2s1Q2x5cjN6Q0pXdDRq?=
 =?utf-8?B?Y1MyczAzTkxwSEZ0bDZQbHZRcDF4bE1QeVpqTzhQanVOVTlPZ24vSjI3d25V?=
 =?utf-8?B?MGxPeGtDSW92MXJUdHNNUFUzdVEzVGlLZHJITDg1OXFUeEVsU0V5SFBtSHI0?=
 =?utf-8?B?cldWZHZmYlRwdFVQbHFiRUNDcTlrZDJwT3RuQUJWaGEwVjNxeWQ1OExCSHBj?=
 =?utf-8?B?c1dCbUg2QmlTenl2cHNDVFpnN1FMYUd6M2RpQ0lsaTRmekVqQldHd1I4ekk1?=
 =?utf-8?B?TUhRaVFaNnBjVmxvZUJQMEdSUzcyV2pHTmo0ZGkrd3FvMDJJM2gvV2xRQmZP?=
 =?utf-8?B?Y3hwWGwzWldBekh2c1ZMT2MxYlQvWkNlR29rbmtpMmFTYU4zWUwvS3dtaDAy?=
 =?utf-8?B?aG0wZkhNOFA0emNnSmFMSEdRNVV6N25vVURYckMrOVVvL21taHNZekxudFEr?=
 =?utf-8?B?UDdmTXViUm9rZzBKbXNDVEY0YzRFUGRFd2lDTzRRR0VzUDRiUEdFVWVXRTl6?=
 =?utf-8?B?aDVGZ2E4RUcvYlBaZ0J2MEtYQ0F5Y3lIUHRoU2M3UWFOdW8wbzlVU3MvaUpE?=
 =?utf-8?B?Z1AxMk1SS05hVmt4RkFCY2xDbkp3NlB6UkxXUURaQktBYkg2RjIycGg2UThr?=
 =?utf-8?B?K2hZREdFUnIwclBDT2g1MElpbVhZSVQwVE5adVJ0QlVGYUdDcnZrNnpPU016?=
 =?utf-8?B?K3YvbzN5V29EMTFGa3o0UDNhQklPdGVZb2tlM3Z6MUtSMXhkUzhHMWZreU9n?=
 =?utf-8?B?R0R6TnNudDVLdDM2ZEZsaEsxb0E3VWFUcVZnVW1IYnkzQ2wvS1NZV0ZjK2tP?=
 =?utf-8?B?eVlZTkVMb1FxZCtYUGN2OEUzeDJSQXc2N2NpNmZIbGFON3pSYm51a3M5ay85?=
 =?utf-8?Q?pkgo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4278126c-be7e-4a04-86f8-08ddacb4ebee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 09:05:20.8585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mSgD1DZgEY0jNwYDInVELyVs7eZRr7btE81s2mTec0hQTfnGW5fLi3TLqdIw7nIO2DRV20VnYBglwRNZSKRwQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6156

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxMSwgMjAy
NSAxMToyMCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xOF0geGVuL3Btc3RhdDogZ3Vh
cmQgcGVyZi5zdGF0ZXNbXSBhY2Nlc3Mgd2l0aA0KPiBYRU5fUFhfSU5JVA0KPg0KPiBPbiAyNy4w
NS4yMDI1IDEwOjQ4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBBY2Nlc3NpbmcgdG8gcGVyZi5z
dGF0ZXNbXSBhcnJheSBzaGFsbCBub3QgYmUgb25seSBndWFyZGVkIHdpdGgNCj4gPiB1c2VyLWRl
ZmluZWQgaHlwZXJjYWxsIGlucHV0LCBzbyB3ZSBhZGQgWEVOX1BYX0lOSVQgY2hlY2sgdG8gZ2Fp
biBzYWZldHkuDQo+DQo+IFdoYXQgaXMgImd1YXJkZWQgd2l0aCB1c2VyLWRlZmluZWQgaHlwZXJj
YWxsIGlucHV0Ij8gQW5kIHdoYXQgc2FmZXR5IGFyZSB3ZQ0KPiBsYWNraW5nPw0KPg0KPiA+IC0t
LSBhL3hlbi9kcml2ZXJzL2FjcGkvcG1zdGF0LmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9hY3Bp
L3Btc3RhdC5jDQo+ID4gQEAgLTIyOCwxMCArMjI4LDEzIEBAIHN0YXRpYyBpbnQgZ2V0X2NwdWZy
ZXFfcGFyYShzdHJ1Y3QgeGVuX3N5c2N0bF9wbV9vcA0KPiAqb3ApDQo+ID4gICAgICByZXQgPSBj
b3B5X3RvX2d1ZXN0KG9wLT51LmdldF9wYXJhLmFmZmVjdGVkX2NwdXMsDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGRhdGEsIG9wLT51LmdldF9wYXJhLmNwdV9udW0pOw0KPiA+DQo+ID4g
LSAgICBmb3IgKCBpID0gMDsgaSA8IG9wLT51LmdldF9wYXJhLmZyZXFfbnVtOyBpKysgKQ0KPiA+
IC0gICAgICAgIGRhdGFbaV0gPSBwbXB0LT5wZXJmLnN0YXRlc1tpXS5jb3JlX2ZyZXF1ZW5jeSAq
IDEwMDA7DQo+ID4gLSAgICByZXQgKz0gY29weV90b19ndWVzdChvcC0+dS5nZXRfcGFyYS5zY2Fs
aW5nX2F2YWlsYWJsZV9mcmVxdWVuY2llcywNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
IGRhdGEsIG9wLT51LmdldF9wYXJhLmZyZXFfbnVtKTsNCj4gPiArICAgIGlmICggcG1wdC0+cGVy
Zi5pbml0ICYgWEVOX1BYX0lOSVQgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgb3AtPnUuZ2V0X3BhcmEuZnJlcV9udW07IGkrKyApDQo+ID4gKyAgICAgICAgICAg
IGRhdGFbaV0gPSBwbXB0LT5wZXJmLnN0YXRlc1tpXS5jb3JlX2ZyZXF1ZW5jeSAqIDEwMDA7DQo+
ID4gKyAgICAgICAgcmV0ICs9IGNvcHlfdG9fZ3Vlc3Qob3AtPnUuZ2V0X3BhcmEuc2NhbGluZ19h
dmFpbGFibGVfZnJlcXVlbmNpZXMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGF0YSwgb3AtPnUuZ2V0X3BhcmEuZnJlcV9udW0pOw0KPiA+ICsgICAgfQ0KPg0KPiBHb2luZyBm
cm9tIGp1c3QgdGhlIGNvZGUgY2hhbmdlOiBZb3Ugd2FudCB0byBhdm9pZCBjb3B5aW5nIG91dCBm
cmVxdWVuY3kgdmFsdWVzDQo+IHdoZW4gbm9uZSBoYXZlIGJlZW4gcmVwb3J0ZWQ/IEJ1dCB3aGVu
IG5vbmUgaGF2ZSBiZWVuIHJlcG9ydGVkLCBpc24ndCBwbXB0LQ0KPiA+cGVyZi5zdGF0ZV9jb3Vu
dCAoYWdhaW5zdCB3aGljaCBvcC0+dS5nZXRfcGFyYS5mcmVxX251bSB3YXMNCj4gdmFsaWRhdGVk
KSBzaW1wbHkgZ29pbmcgdG8gYmUgMD8gSWYgbm90LCBob3cgd291bGQgY2FsbGVycyBrbm93IHRo
YXQgbm8gZGF0YSB3YXMNCj4gaGFuZGVkIGJhY2sgdG8gdGhlbT8NCg0KSSBtYXkgbWlzdW5kZXJz
dGFuZCB3aGF0IHlvdSd2ZSBjb21tZW50ZWQgb24gdjQgcGF0Y2ggInRvb2xzL3hlbnBtOiBQcmlu
dCBDUFBDIHBhcmFtZXRlcnMgZm9yIGFtZC1jcHBjIGRyaXZlciIsIHF1b3RpbmcgdGhlIGRpc2N1
c3Npb24gdGhlcmUsDQoiDQpUaGlzIGxvb2tzIHF1ZXN0aW9uYWJsZSBhbGwgb24gaXRzIG93bi4g
V2hlcmUgaXMgaXQgdGhhdCAtPnBlcmYuc3RhdGVzIGFsbG9jYXRpb24NCmlzIGJlaW5nIGF2b2lk
ZWQ/IEkgZmlyc3QgdGhvdWdodCBpdCBtaWdodCBiZSBwYXRjaCAwNiB3aGljaCBpcyByZWxhdGVk
LCBidXQgdGhhdA0KZG9lc24ndCBsb29rIHRvIGJlIGl0LiBJbiBhbnkgZXZlbnQgZnVydGhlciBk
b3duIGZyb20gaGVyZSB0aGVyZSBpcw0KDQogICAgZm9yICggaSA9IDA7IGkgPCBvcC0+dS5nZXRf
cGFyYS5mcmVxX251bTsgaSsrICkNCiAgICAgICAgZGF0YVtpXSA9IHBtcHQtPnBlcmYuc3RhdGVz
W2ldLmNvcmVfZnJlcXVlbmN5ICogMTAwMDsNCg0KaS5lLiBhbiBhY2Nlc3MgdG8gdGhlIGFycmF5
IHNvbGVseSBiYXNlZCBvbiBoeXBlcmNhbGwgaW5wdXQuDQoiDQpJIHRob3VnaHQgd2Ugd2VyZSBp
bmRpY2F0aW5nIGEgc2NlbmFyaW8sIHVzZXIgYWNjaWRlbnRhbGx5IHdyaXRlcyB0aGUgIm9wLT51
LmdldF9wYXJhLmZyZXFfbnVtICIsIGFuZCBpdCBsZWFkcyB0byBhY2Nlc3Npbmcgb3V0LW9mLXJh
bmdlIGFycmF5IHNsb3QgaW4gQ1BQQyBtb2RlLiBUaGF0J3MgdGhlIHJlYXNvbiB3aHkgSSBhZGRl
ZCB0aGlzIGd1YXJkDQoNCkJ1aXQgYXMgeW91IHNhaWQgYXQgdGhlIHZlcnkgYmVnaW5uaW5nLCAg
b3AtPnUuZ2V0X3BhcmEuZnJlcV9udW0gaXMgdmFsaWRhdGVkIGFnYWluc3QgcG1wdC0+cGVyZi5z
dGF0ZV9jb3VudCwgc28gaWcgdGhlIGFib3ZlIHNjZW5hcmlvIHdpbGwgbm90IGhhcHBlbiwgSSds
bCBkZWxldGUgdGhpcyBjb21taXQuDQoNCj4NCj4gSmFuDQo=

