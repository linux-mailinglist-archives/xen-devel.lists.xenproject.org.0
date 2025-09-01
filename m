Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD9B3D737
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 05:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104024.1455221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usv7I-0002BP-Id; Mon, 01 Sep 2025 03:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104024.1455221; Mon, 01 Sep 2025 03:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usv7I-00029r-CC; Mon, 01 Sep 2025 03:22:00 +0000
Received: by outflank-mailman (input) for mailman id 1104024;
 Mon, 01 Sep 2025 03:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hRN=3M=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1usv7G-00029l-OS
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 03:21:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:200a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf2b301b-86e2-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 05:21:56 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BN7PPF28614436A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Mon, 1 Sep
 2025 03:21:51 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 03:21:51 +0000
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
X-Inumbo-ID: cf2b301b-86e2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6rUv7pHIBKTUvgc0cbFlJ1+AYiiRozFYWoF2JoMgQENIUSJk91DCE8kTDyZAOF+FgRear1ZhGZwmEa3MqgG9kAjWDw9IRcqKAs0lPEefCXotRkubwhjywy3FVn+T2jTOxQTHzIV44trOCpFlaENoQeti7QArHAr4zwlmIEC6jY4bB0AKV1x0Ya8N4jYuywNk3xsPE3WSVH0OJwjuHt4RKvR/7THp4R+sZC7ldJVmTKZkD39SZjtofRS1C9pEm7Ck/abw6LBfEo78Xt4+QdQZpnestlmI9oSODAtPY6lGVHjfk4v1Izo0ZMJUgnFiDtbJNyOp+lhBYQOckYqxutRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MswoHzAN+UDOiDVkyv5bZcvgdrW3uhYxVgTIWlU2M1k=;
 b=A5fsQkviacVHJumLrJDNGNeIo0xEBPZcPd8WN71nIpp4KB2eqCPIsJ85LiiCOyZfvxFYd8jxiD25YIjOlUe1DJH+wyaWNh2oUW+c69cCQzp4o9TvmBZFhELH6mCCs+IrzSz9GpamR/BjNQyLBxQYdOwayShAoS3iCFtvuf/f1A6QgnroU/IlSWwfHM56KlRVosxOGm7B0frwqgCmMS5s5U++P5H+7tIlK0MvrPoVCbZi0DlCmJwjJORk2egKnOgrGJDaTjGggF35oyL7mfZF+b3Kh0P7WDfHY69Jk4COZ1tMe6D8JSuXLCFZ+viD0IFUCYliJ8gODol/w3vvtI/oNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MswoHzAN+UDOiDVkyv5bZcvgdrW3uhYxVgTIWlU2M1k=;
 b=UEgbWo1zv9+4FJrbWxDuWQC7u8VISqK74Ym4xIE97DVsTnSzHCedQ/aj473o1kGjNiA2hfMWByVRlArqSucxrAAWJqNYW1y1SfjNgu5aoSy6j13HOBbn5aiLYdxndIc41XQJpr6gY1d04pXhvBm0hWOlm/z4mV9fCaaoABGSs6w=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
Subject: RE: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
Thread-Topic: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC
 in passive mode
Thread-Index: AQHcGAMPJXzUCwqDQEuHduiQbQ8QbbR37ByAgAEJOqCAADI8AIAEhAsQ
Date: Mon, 1 Sep 2025 03:21:51 +0000
Message-ID:
 <DM4PR12MB845109DC4B0822344D2DC72CE107A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-4-Penny.Zheng@amd.com>
 <b2712815-97c2-4473-bcf6-aae8517aad37@suse.com>
 <DM4PR12MB8451D6ACE480227632A8156FE13AA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <1ad85430-2aa7-4834-be56-67515ca51310@suse.com>
In-Reply-To: <1ad85430-2aa7-4834-be56-67515ca51310@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-01T03:21:42.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BN7PPF28614436A:EE_
x-ms-office365-filtering-correlation-id: 6cc82468-9bb5-42e4-ea7c-08dde906b180
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aCtNVGhzUFBKaUcxT25KRjhISktibm84MnJtRnR4ZnhHanBScUJkRXpVNWdp?=
 =?utf-8?B?eXJiV1JJQjU3RG5SNFJBVENXUUhXbG5wRjRUQVlucEF6MVFmOUZKYldSV0dx?=
 =?utf-8?B?V0JISUFxZkMvbXRBd2F3UUwwMUszSkR2NFZrenI2L09SNWxRSUFFalArOGpT?=
 =?utf-8?B?UU1XbjlQNDJBcEtaNDdGYWE3enpHVmc2R1loMDNUNEVvSExNVlBzbUh3NWhE?=
 =?utf-8?B?MkhoelRWL1c5VGZqdWVRSWJkRFcwTDN1cTJrckpiYjV2bXl6TUhyQXlSZmdj?=
 =?utf-8?B?emRBUk1OUXZOak03N3d6aU9mU3dSRElvZWFJeThNdnZzVGVDZm5PcStIb3Rz?=
 =?utf-8?B?TlBDTHNEdVhQOFlNMUlxQWY3cVpxQlVHdjVYcE1UUGM5aXBOUzJqeGdKQUNt?=
 =?utf-8?B?KzcyNFZJK1MxdDBqQ05EUDNMaE1kVnRmeUY0L2YyR09SaFNaRDh6M3ZtQUpW?=
 =?utf-8?B?bUpBSjZOdUVJZWVnellyOCtEWjVyUkFFMUZGbURGcWRHSWMyY1NKRm5tcW00?=
 =?utf-8?B?OHMvcGFCR0pkaTAya2J3UVdudHVHclBpZ0NheXVNdW1FY2dLREwyWEVBeFk2?=
 =?utf-8?B?NUI0WjFucjZYZEMwVG8yRG5IV1ZOdzZ6RlkyeDV1ajI3cGEyMksxZGM4K1A0?=
 =?utf-8?B?UThQRDgwVktNdE5vY1Fsd25oMG5mYlFuaGM4VENkcDZuYXZIelpPVTQ2NU9X?=
 =?utf-8?B?ZENxTFRsaXdLTmgyZmZDTEpPcjRtNU9sZDBrSytUTUUvc0dPRzNUTFdQSGp3?=
 =?utf-8?B?MzZpeDl6ZjF5MEFLSTRHMFZldkI5WklpZjBFMHRDR1k4ZTFtdTJ2MFhFakFM?=
 =?utf-8?B?ckhISG9hYTQwdjVzN0pHZ3IzMnlUcVNHMkhRc1NELzVzcjI1YkF3OU92TVVE?=
 =?utf-8?B?dldqcmF1RnVrWGRQMzQwbXZIOTM2QW9CT2lRSWVDaEJMbjJOT2hXellZSmxP?=
 =?utf-8?B?QlRjYWdJaDJXUHRjaGlrRG9qZmJYWnI1SlUzV2h6L1FYTDRBdUQxVlY3cDFK?=
 =?utf-8?B?eTlGck1Fd0crVkhxeG9LeEVjZzI3TEFvYmwra3MvaktYU3B3TWVTdXFOaWM2?=
 =?utf-8?B?MUtibUEzVlo0MHhVcmpOZmpFM3RSZzdvMnR6NUtOeDhYbGVjcTI5ZVZTMXdG?=
 =?utf-8?B?MEpSbDJUdXpQSURicDlPN1BnWVZnRndTVzlYWCtFQU9MT2VhNlVsNnNyVkhZ?=
 =?utf-8?B?cEZsZDhSd0ltTm4zVlFsVUZFelF1SFQ0MWJ6bGxxaURYcXo0YlEvSFFFSVYx?=
 =?utf-8?B?UTdoclRCdzErQWZYdjN5WnR0Q2x2K3dLNzBSL0hvY3V0VGQ0dERCamNzdlFP?=
 =?utf-8?B?enc5WG9YZFZKRGttK21nQW9ZMlU3dHg4c3Eva3NYeU82Y2czZDB1bjVscGFo?=
 =?utf-8?B?UmhzRDFrMFB2Y29SN2FHdTd2SWdFTjFYY0gwY2xQVG9JcWpRbFJBdTZHOE8v?=
 =?utf-8?B?RHBiY1c5bEVNNVdPK1BTeXh3S3ZacGk2cnRsbEZBMkF0RkJJS0ZPdlk0VWFl?=
 =?utf-8?B?MjUwZk0rT3V5ME9MY05GSUdod2RNV2Z2Y1hiTmY4c0g0NE1WNFVJLzhGRVdL?=
 =?utf-8?B?Nk5oUU5hd2UxOUlUUWxvRjRnT1J2b0J0RTRPMDF6UUZPekxWK1NMY1l1c3lr?=
 =?utf-8?B?NStZcFlQNXVBTzN5cTBFd3BUTXNIb0pmZzFzUS9SYXdwWldWRUE2aEJQK0kz?=
 =?utf-8?B?QU9SeDRHOVNPSkpNY1JXNmNMdTBhSmZVUzFyd0s0V1lEUE4vbSszNjlEUmxO?=
 =?utf-8?B?c0RGMnF0KzJqR1VYWUNRY1ExajI5ZE5XNmdzRmtBMHMxNExKc2tyWHZocTd5?=
 =?utf-8?B?SHdJeWhTQWtHWUhIanJsWnJ6emU3VVc4MU5wNFN2QmVTMUhHTmV6Mk41VmR0?=
 =?utf-8?B?MmUyUDUxNGNwTC94QURnZWtQK2k5MThCUVdJQkFRdEVqUm53TUFuN2RDeTRT?=
 =?utf-8?B?dWxmSzVTaEcwMkhMVUlvUW9NOTFKaXd0L2tlOVpuMXplcnFpV1dBbWlGN0Fu?=
 =?utf-8?B?dzRMREh3cjdnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3p4VS94UVFEbWtuRzJyb3RhdDJyTjRqWTgyZXNWbXVXcVg0bktDbGNpQlVF?=
 =?utf-8?B?eE8raUp6bWIwbmY3K2lBbzlBd0VaRUEwUkRKcVVqK3c0a2pPK0gvZkx5SDBL?=
 =?utf-8?B?Y25vTEZiNThpWmQ0bDZFRWROQ0cwUGkvRVN1M1FsWm40LzhPSnRiWHpGbVFI?=
 =?utf-8?B?U3BHNjV2ZXIrdXE3QWxBVlYyMmJBVjlEV3FLRVhDNng5bWs1R3JmOFNCZENG?=
 =?utf-8?B?aE0xVDc3QlRDZmtkMXp2REhkYlBQc3JYbWVROVJHM0RHanZDS042RWswanV2?=
 =?utf-8?B?bDNJMmRzZTJoMzk2d3M4NjhDUENUaG1ET1Z4b0hwTDFrTStjVHJPU2xEVjZ1?=
 =?utf-8?B?czdLbU5uY0xHYUZPUjN3NGlaM0ViSWxCVTRWa28veGlIL0RwV2U4eElVRXIz?=
 =?utf-8?B?SSs2N2YzUFo0OTJZaDBPUmJLQWFtanlOdXZNV3QxY0M5N2hNKy94YnIydnl5?=
 =?utf-8?B?STdUYWduQ3REbjNSWk9IN05Ra3VJZjBMQUJxMkRiSUJPN1Q2aEh6dVhUdnY0?=
 =?utf-8?B?S01WU0J0YkQ0T0szYk9EYU5BZXVteGtPQUxzeTVRamZTeURNV0o2OGFHSzNP?=
 =?utf-8?B?ejVkaUVZOXNVdU9zNzc5RVM1QUN6THAxTjRZNUtvc3ZiTlZva2N2eUhnejc1?=
 =?utf-8?B?b1B3RkdmdGpEcDNLZTkySzZJTHA5b3FrSGsxTk4vYVM4QWlTVTZxMDdOV0Rk?=
 =?utf-8?B?M2IzeE82a1M3NklzaTVlM1hmRTI2ZHpPUzNOdHNxbkFmTDk4UmlmK3JXMWgz?=
 =?utf-8?B?ZWFNSjVwMzI4YWpCRDVyTjBMMmhsVnk1elAvdUhycElFM2dGT3V4UXVGcGJ3?=
 =?utf-8?B?UjA2R3hZU3BJZzZoaXF5SW1ac0t5QTRwQXA2b3F0WEdVVDFyMkF2ZlNycWlQ?=
 =?utf-8?B?eTgyZHhWUkRGanhKdGpxN0NLZjBQemtVcGU5eEZOKzZ3dUtEQUNpdVBESW5k?=
 =?utf-8?B?dFlLNDB4OE5uYnJjQ2w5WWVkOFo3cnUvOGdqOHZXTTZoeXZlQTArQnNBcjd1?=
 =?utf-8?B?Umx4ZU9HT2x5eXdTZkNMT2lGUk9NSkVORXhYSFVzdEcwclo0U25uWnpnUjI3?=
 =?utf-8?B?TERkbmp1REhRenR5aVVnZUFpQnc2VHJWUFV2RUM5N0poamc2VlJjSkVtZXp1?=
 =?utf-8?B?RUsxOU5ueHJINUd0Ni9RdGpJN0psRTIrK0ZlL3ZCYUZPZithRXVWZWY0RFJT?=
 =?utf-8?B?ZUZkcVE0QmRlRnRURzhCUVFBNVRKbkpXRUdFL1NnaHlmOFIyTVgwZmlwUHp4?=
 =?utf-8?B?MndMV2k1cDE5bXBNWmYrVitjb2dTdDQvSGl5eGpNbmJTMTBIeXZqOWZTUDQ3?=
 =?utf-8?B?UTdPN0ZONWp1emhiellGMDhvYkN2SElUMUJmTGhrNHBSZjcyNmE5OVVlZk5t?=
 =?utf-8?B?SDZONXUrWTZxbFpNL3lDOXZhbjFpSi9iWGowVndhQThRT1lwVEZ3N3BCakl1?=
 =?utf-8?B?M2o2WGlyZ09ST251R1JGbEY1VXgyc3hzMUdYR0JRbUlSazUzZ3ZndnEzNjA1?=
 =?utf-8?B?aVd4RkhFTmVSSEdZeHZqTUl5NlBPMkROak5VaHBIRXhtOUJmTkVhb0tmUCty?=
 =?utf-8?B?cDlYdUluMWNHY3locWluWVgrekNKcHZ5UnNsK1FFVjdxY3hqZHpVUDJPODky?=
 =?utf-8?B?MzY3enAycllPUytpblNSSVVZT1RiVU8wTkM3MVdFSGZ2WE1wWmlaTGNmWC9Y?=
 =?utf-8?B?NUQ2bE9hanBXcnpwSnczZXAvSUp4SmNxdlVjT1N6cWFLNG5oeVRyTEt0eTZm?=
 =?utf-8?B?aVVvbzk0VU16STJ6ZldiV21hWU14NGpQbjV5Z3FweGVrbVJ5Kzl1WWIrMmpS?=
 =?utf-8?B?ZjZ5WS93YUxWQTlRL3ZTSXNOTkloRFNVUFo5d1Npa2phYjJkRWhzRXJOZWht?=
 =?utf-8?B?a3RvL29WN1RpWFEwbHVUbGRxK0lIU2haZkN3MjNwMm1KNjBRVkZ2YTlDSnhX?=
 =?utf-8?B?bE8xT3RiWFRrWVV2N09tbWcwd1QvR25DejdmazdNc1JrZ3R0OW9VWHo5S1Br?=
 =?utf-8?B?UW5paFJZeU9ZemZjdDg0Z1VmalVUcEcrU1RPd2JVcHdpdGxIcjNqdUZKQ0ZK?=
 =?utf-8?B?b3kwMVdXckdvRUJXRjNaN1V0cUhULzhaQnBRd0NaYmJ2bGhmbUNBR1BOZ0Nt?=
 =?utf-8?Q?c280=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc82468-9bb5-42e4-ea7c-08dde906b180
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 03:21:51.3527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQvziCRBFwNikfuqiJ6ZoRcdRGURPnK1tCwujkQQLLYipQF/HbhmI7+qWemLLDL99soiYoLwc462m6ZrfFS3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF28614436A

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDI5LCAyMDI1
IDI6MTIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnpl
bCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJ5dWssIEphc29uDQo+IDxKYXNv
bi5BbmRyeXVrQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMy84XSB4ZW4vY3B1
ZnJlcTogaW1wbGVtZW50IGFtZC1jcHBjIGRyaXZlciBmb3IgQ1BQQyBpbg0KPiBwYXNzaXZlIG1v
ZGUNCj4NCj4gT24gMjkuMDguMjAyNSAwNTozMCwgUGVubnksIFpoZW5nIHdyb3RlOg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIwMjUgNzoyMyBQ
TQ0KPiA+Pg0KPiA+PiBPbiAyOC4wOC4yMDI1IDEyOjAzLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
Pj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGFtZF9jcHBjX2NwdWZyZXFfdGFyZ2V0KHN0cnVjdCBj
cHVmcmVxX3BvbGljeSAqcG9saWN5LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRhcmdldF9mcmVxLA0KPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlbGF0
aW9uKSB7DQo+ID4+PiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBwb2xpY3ktPmNwdTsNCj4gPj4+
ICsgICAgY29uc3Qgc3RydWN0IGFtZF9jcHBjX2Rydl9kYXRhICpkYXRhID0NCj4gPj4+ICtwZXJf
Y3B1KGFtZF9jcHBjX2Rydl9kYXRhLCBjcHUpOw0KPiA+Pg0KPiA+PiBJIGZlYXIgdGhlcmUncyBh
IHByb2JsZW0gaGVyZSB0aGF0IEkgc28gZmFyIG92ZXJsb29rZWQuIEFzIGl0DQo+ID4+IGhhcHBl
bnMsIGp1c3QgeWVzdGVyZGF5IEkgbWFkZSBhIHBhdGNoIHRvIGVsaW1pbmF0ZQ0KPiA+PiBjcHVm
cmVxX2Rydl9kYXRhW10gZ2xvYmFsLiBJbiB0aGUgY291cnNlIG9mIGRvaW5nIHNvIGl0IGJlY2Ft
ZSBjbGVhcg0KPiA+PiB0aGF0IGluIHByaW5jaXBsZSB0aGUgQ1BVIGRlbm90ZWQgYnkNCj4gPj4g
cG9saWN5LT5jcHUgY2FuIGJlIG9mZmxpbmUuIEhlbmNlIGl0cyBwZXItQ1BVIGRhdGEgaXMgYWxz
byB1bmF2YWlsYWJsZS4NCj4gPj4gcG9saWN5LT5TZWUNCj4gPj4gY3B1ZnJlcV9hZGRfY3B1KCkn
cyBpbnZvY2F0aW9uIG9mIC5pbml0KCkgYW5kIGNwdWZyZXFfZGVsX2NwdSgpJ3MNCj4gPj4gaW52
b2NhdGlvbiBvZiAuZXhpdCgpLiBJcyB0aGVyZSBhbnl0aGluZyB3ZWxsLWhpZGRlbiAoYW5kIGxp
a2VseQ0KPiA+PiBsYWNraW5nIHNvbWUgc3VpdGFibGUNCj4gPj4gY29tbWVudCkgd2hpY2ggZ3Vh
cmFudGVlcyB0aGF0IG5vIHR3byBDUFVzICh0aHJlYWRzKSB3aWxsIGJlIGluIHRoZQ0KPiA+PiBz
YW1lIGRvbWFpbj8gSWYgbm90LCBJIGZlYXIgeW91IHNpbXBseSBjYW4ndCB1c2UgcGVyLUNQVSBk
YXRhIGhlcmUuDQo+ID4+DQo+ID4NCj4gPiBDb3JyZWN0IG1lIGlmIEkgdW5kZXJzdGFuZCB5b3Ug
d3JvbmdseToNCj4gPiBObywgbXkgZW52IGlzIGFsd2F5cyBwZXIgcGNwdSBwZXIgY3B1ZnJlcSBk
b21haW4uIFNvIGl0IG5ldmVyIG9jY3VycmVkIHRvIG1lDQo+IHRoYXQgY3B1cywgb3RoZXIgdGhh
biB0aGUgZmlyc3Qgb25lIGluIGRvbWFpbiwgd2lsbCBuZXZlciBjYWxsIC5pbml0KCksIGFuZCBv
ZiBjb3Vyc2UsIG5vDQo+IHBlcl9jcHUoYW1kX2NwcGNfZHJ2X2RhdGEpIGV2ZXIgZ2V0cyBhbGxv
Y2F0ZWQgdGhlbi4NCj4NCj4gV2VsbCwgdGhlIHF1ZXN0aW9uIGlzIGhvdyBkb21haW5zIGFyZSBv
cmdhbml6ZWQgd2hlbiB1c2luZyB0aGUgQ1BQQyBkcml2ZXIuDQo+IEFpdWkgdGhhdCdzIHN0aWxs
IGRyaXZlbiBieSBkYXRhIHBhc3NlZCBpbiBieSBEb20wLCBzbyBpbiB0dXJuIHRoZSBxdWVzdGlv
biBpcyB3aGV0aGVyDQo+IHRoZXJlIGFyZSBhbnkgY29uc3RyYWludHMgb24gd2hhdCBBQ1BJIG1h
eSBzdXJmYWNlLiBJZiB0aGVyZSBhcmUsIGFsbCB0aGF0IG1heSBiZQ0KPiBuZWNlc3NhcnkgaXMg
YWRkaW5nIGEgY2hlY2suIElmIHRoZXJlIGFyZW4ndCwgLi4uDQo+DQoNCkFjY29yZGluZyB0byBB
Q1BJIHNwZWMsIF9QU0QgY29udHJvbHMgYm90aCBQLXN0YXRlIG9yIENQUEMsIHNvIGluIG15IGlt
cGxlbWVudGF0aW9uIG9mIGdldHRpbmcgQ1BQQyBkYXRhIHBhc3NlZCBieSBEb20wKHNldF9jcHBj
X3BtaW5mbygpKSwgSSBkZW1hbmQgYm90aCBlbnRyeSBleGlzdCwgX1BTRCBhbmQgX0NQQy4NCmBg
YA0KICAgICAgICBpZiAoIGNwcGNfZGF0YS0+ZmxhZ3MgPT0gKFhFTl9DUFBDX1BTRCB8IFhFTl9D
UFBDX0NQQykgKQ0KICAgICAgICB7DQogICAgICAgICAgICAgICAgLi4uDQogICAgICAgICAgICAg
ICAgcG1faW5mby0+aW5pdCA9IFhFTl9DUFBDX0lOSVQ7DQogICAgICAgICAgICAgICAgcmV0ID0g
Y3B1ZnJlcV9jcHVfaW5pdChjcHVpZCk7DQogICAgICAgICAgICAgICAgLi4uDQogICAgICAgIH0N
CmBgYA0KDQo+ID4+IFNpbmNlIGluaXRpYWxseSBJIHdhcyB0aGlua2luZyBvZiB1c2luZyBwZXIt
Q1BVIGRhdGEgYWxzbyBpbiBteQ0KPiA+PiBwYXRjaCwgSSdtIHJlcHJvZHVjaW5nIHRoaXMgaW4g
cmF3IGZvcm0gYmVsb3csIGZvciB5b3VyIHJlZmVyZW5jZS4NCj4gPj4gSXQncyBnZW5lcmFsbHkg
b25seQ0KPiA+PiA0LjIyIG1hdGVyaWFsIG5vdywgb2YgY291cnNlLiBZZXQgaW4gdHVybiBmb3Ig
eW91ciBkcml2ZXIgdGhlIG5ldw0KPiA+PiBkcnZfZGF0YSBmaWVsZCBtYXkgd2FudCB0byBiZWNv
bWUgYSB1bmlvbiwgd2l0aCBhbiAiYWNwaSIgYW5kIGEgImNwcGMiIHN1Yi0NCj4gc3RydWN0Lg0K
PiA+DQo+ID4gSG93IGFib3V0IEkgZW1iZWQgbXkgbmV3IGRyaXZlciBkYXRhICIgc3RydWN0IGFt
ZF9jcHBjX2Rydl9kYXRhICogIiBpbnRvDQo+IGNwdWZyZXEgcG9saWN5LCBtYXliZSBwb2ludGVy
IGlzIGVub3VnaD8NCj4gPiBMYXRlciwgbWF5YmUsIGFsbCAiY3BwYyIsICJhY3BpIiBhbmQgImh3
cCIgY291bGQgY29uc3RpdHV0ZSBhbiB1bmlvbiBpbiBwb2xpY3kuDQo+DQo+IC4uLiBJJ2QgcHJl
ZmVyIHRvIGdvIHRoZSB1bmlvbiBhcHByb2FjaCByaWdodCBhd2F5LiBXaGV0aGVyIHRoZW4gdG8g
dGFrZSBteSBwYXRjaCBhcw0KPiBhIHByZXJlcSBpcyB0YmQ7IHRoYXQgbGFyZ2VseSBkZXBlbmRz
IG9uIHdoYXQgKGlmIGFueXRoaW5nKSBpcyBuZWVkZWQgb24gdGhlIEhXUA0KPiBzaWRlLiBJZiBI
V1AgbmVlZHMgZml4aW5nLCB0aGF0IHdhbnRzIHRvIHRvIGNvbWUgZmlyc3QsIGFzIGl0IHdvdWxk
IHdhbnQgYmFja3BvcnRpbmcuDQo+DQo+IEphbg0K

