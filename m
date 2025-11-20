Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA233C738A3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 11:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166805.1493237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2CP-0005F9-DP; Thu, 20 Nov 2025 10:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166805.1493237; Thu, 20 Nov 2025 10:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2CP-0005Di-AW; Thu, 20 Nov 2025 10:47:37 +0000
Received: by outflank-mailman (input) for mailman id 1166805;
 Thu, 20 Nov 2025 10:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQ23=54=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vM2CN-0005Dc-Sf
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 10:47:35 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e2172ef-c5fe-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 11:47:27 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PAWPR03MB9922.eurprd03.prod.outlook.com (2603:10a6:102:358::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:47:24 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 10:47:23 +0000
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
X-Inumbo-ID: 4e2172ef-c5fe-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3XvLemDMZws75ed4sjQoIDhMW+IqAZjZvC4ITHZ+8Dvf57bN3511AtA23sthp3bUd7LMueziaC5nNcxMWYEhi5HXmuFK3woYr57w/Kl7vvULigv7zXhinEQDxZ+aV+IazdCxCNxL/BDBjs//2b7+dRNqONY5gC5AbrAFLVOVqi+wOb5AQC0SmhA4Tx5QQgaFvwIVRxZFzIODgkw46MZ0lSrJx5ahTeG+f6N4KiBcL9ivZPrgTL8TlYQagfM35yHTqEN4/OEp8v8LuJRUOwSzFLR+HaZZVoyOGe/P7cfWh3bO2DwRhfe3LL6pNHoWEKxUh3LOv6kdPniuV4T7XlKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zet+1/WAg/mK2F4LaJxBMH8W9F4nGtbtbZDeiT5Djhw=;
 b=A0WQdMwiAbDjSMaTvleiWEQwg0bbRzA9olZfeL6jvdfdhtts2+EgPffeqj6dH5vBy6aWabV0guVOHzzSQ7FwVgSN2h3hIdzee0snXBle4NG28F0G0Ogf/BTBc5tuuzHIx+s2EIG80K4ZwhnTXruzz33pWnuQKNUsf51uhjC9guIbYIToVyhncpwDJNkkSMJ/t1LZcWp2THK45a0z088rTpyCNJt4y5N3Dak0yWKA8dbQ9koh7xgCz+QPqyl3n+YNRI8RUz9T7tnQ2fSvxy+PLhh/v+gca3TF2bc/2YHVpczMQr/4XVS4kfIu1kQ0SJK4qg90ZF48VWVDy4hA8ZKpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zet+1/WAg/mK2F4LaJxBMH8W9F4nGtbtbZDeiT5Djhw=;
 b=Xlx7P5QmH6p4vH9PcDUiLYm82GXUDBXvY6r92W2y8bQqcYBqhUEPv6/VE6dDs/HXi/gx+H8ZEeIQx7/0+WhrjQuM4QIMqEKYImbxQAszudQrby2s6ZMJqlNYdUX04efn72QS45C52w4ydpkhDKMFOQ7mozfzfB56WPwrFYImskvL3sLffrP3q6C5lVzoom+CN6uOFJmndOxKxE/6AGvE8UZmySQLpHyi2O257G1exAs1iQ0chKuIkKWZGqBbjSfaZCJpThRLndVE4sJQXoO7DJqUnZCWkKKU/aPsYm1WIUoqQl9EgQj7dIWHcEwFES64BxJWMxJGKsyPU84z2CckKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <054aaca3-919f-4b9e-bdfe-9bdb40f08388@epam.com>
Date: Thu, 20 Nov 2025 12:47:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119193120.1011448-1-grygorii_strashko@epam.com>
 <f354c1cd-c46e-4bd2-98d6-a614029991f7@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <f354c1cd-c46e-4bd2-98d6-a614029991f7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PAWPR03MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f66807c-7e03-435c-e589-08de28223050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHl6K2xVUCtkajE2TXk1NVJJWW5yMlUxcHljQnVUTm5jbzRLVWRoUDlBN0NT?=
 =?utf-8?B?ellhajgzbFR0ZkhGdk1xNWE2Zytub2c1QUtnU1kzQmtHbXFqVUdzTWhoWDBo?=
 =?utf-8?B?T3hVR3p1WjFzblVEZEY3ZlJ1dE1wYnIrSmZnSjNPZlNNVlpwYkhNZHVuaXYr?=
 =?utf-8?B?YmpqZjlNbDU2TWF0bHc3V1RJQk5LWEdVZW1NaGJybmMrRGx2N0l4OWhxdkFO?=
 =?utf-8?B?akgyWXUvYm1zUGF2WWNKblByQlRkSjlTZ1pRR2FhUDlva2VOeGlPTnd4eXFG?=
 =?utf-8?B?ZTVSbmZka3RrVytQNHVlYUY0RzJLdFA4ZGFaYjM4ZCtFbkxuUVR4d3BSc0px?=
 =?utf-8?B?dWZBaXhJVnFPaDhPZDZDcEVhS1I3NUNTdWhNdFY2V0tBRVlENmtoNFU5aFJE?=
 =?utf-8?B?L0ZWVEFnbXBDY3Z4NG5Xd0drdVV4eHdlN2hJV1R0TmZLd29IbmZycnVOTjJ2?=
 =?utf-8?B?VTJyaG1aRndvcEg5dEpiK1RGRTFlaXZBZVhSbVlYUTZSRmVsdXNxNktGTXJz?=
 =?utf-8?B?Mkt3OThHbTJWNkdGYlpVc2M4a0lGUVMzdk9Gby8rUHYra09mVnZzc2JtSzEy?=
 =?utf-8?B?RmVUU1puTXVEb3NvTk4yK1FLK2J0M3Rxc1l1amtJcjBWd0xNTmhNL3FkUGkz?=
 =?utf-8?B?eUFlNDIxUlUva1Urck9CK2RrYVd2Q3ZEWE15a3gxY1JJQW16N2hkSFpxY0dF?=
 =?utf-8?B?TnhMeFVKMGx1Yzk3MWliNFJMWWdxRGtrb216T3NSc3o3Y3JhTTdHdi9lUHdZ?=
 =?utf-8?B?V09McEJqTlRBU29wTVdMT01EeXYwM2tISjZXRTg3ekNTWFJWNmQ3cWpYRk5x?=
 =?utf-8?B?OFNzZldSQ2ZVQmZhNzM4WmJGRDZTSXM0NjFFUjhjMCtLdy81UCtjTXRNL2tz?=
 =?utf-8?B?QlU2Y3pPcHQzNEtYMjA4WlZaNWhDdmV4dTNHSEMzc1E3R3dob2JZczBpR0lR?=
 =?utf-8?B?Y2M0cS91YWk3UEQ4Q2grVzJMc29pS1hENkt3TmliTnZKMEsrWW03a0owQjN6?=
 =?utf-8?B?eXBkUzZHRnNmOWtFcnNjbEUwTGIzNXlGd0dzdkVtSmVZdS9aSXBnbEF5RW03?=
 =?utf-8?B?Z0ZXRzJ1bVozMTZXU0RHSWYxbEpkNWpURGhjZzQvYnB1Rzg5RnZCRWZDVkxk?=
 =?utf-8?B?Tlg1Y2RBWXVyTXA4Y3d2RWFtYWhGMFpIbTA1SmZoeGxiZVI2MVdpS0dmeW5j?=
 =?utf-8?B?bThXamNuN3Q3cUF6dDc3VlJubDVLTm1tWll4OWpHUnROdWtSZVZobHFla3lx?=
 =?utf-8?B?azlLK2hJMFkxaXNXdjJYT2NGOS83RjhNK09FMmJvOHk4TEtTL21jaWZaUmlN?=
 =?utf-8?B?QUlvZUdZSk8rK1FDVkk2L0xwWWRIQnMyVGVKaHN6bzMxWkxFTmxmMnc4N3JQ?=
 =?utf-8?B?ellJUXVmeG1GbDdOR2I5ejA3dkZTM1lhRlpIOTNDRDBxTmxyaytXbHFTSDJj?=
 =?utf-8?B?blRmaEV6SnJNOUM5VlZLMjQralA4SEVWZU5FY0UwYjlpTXcvYWVWNzJBc0hy?=
 =?utf-8?B?ZkhlQ1B2SUxFWmRvTlBnN29qWnpFMjBHNDhuTnRrUmVaa1hUN1JvdUZYRFB2?=
 =?utf-8?B?ck9hMVRCa201ejY2aUMxYXpqTXQwRjQ5Nk1qZEFqdXFrSGJMcWpQdDZ4SkRF?=
 =?utf-8?B?MWFYcmFYY285RlZrWkltcWxLUkpnNFkvQjk3aDdOemkvZExJWlRmVVBKYnNV?=
 =?utf-8?B?SGhYVHQvenM5VVFqOUIrZDlFOW9RNThBWW83SGhOYnlTWDBVa1hsSzNZNHAv?=
 =?utf-8?B?eXg2UGtDVG81S1U3RkwzUFZTdHc2SjRrTGJYaE9vNmowUENaRmNSNGUvc1pk?=
 =?utf-8?B?MngydkJiRUdlVDc2UGVlTFpZR1JsMnhsNy9qdmo5T1hCb29ITXpNS2lEVkdQ?=
 =?utf-8?B?R2dZaytGaitXNHhabllCWldCVWlYYUZEYVYycE1rTDdSWE4rQ0UyM2JLQWRj?=
 =?utf-8?Q?+Z81mTkK12XRcO8qBm+bmIC0BFmocmzS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzN6MkwveDdtc0lKMSt0am5qaldWVGo2dUJXWVpZZEpOc1RCR3hCb3FCaG4x?=
 =?utf-8?B?SlVLRTBvenZ1MHhzVjNMT2h5WU5BR1dDbk8vMGFGWHh5OUZFYm5jbng4UytQ?=
 =?utf-8?B?ZUlNSXUvUmtQeGN3cm1JZ0dqaCtEK3ZBUjY0OGtqZzZ5M3ZLNldvSFFRZzlz?=
 =?utf-8?B?TUhacnFDbU1NK0J1QUJMOUw1bUFqdml3dWVHMjF6d1VYZUZJc3FEWVNUZWxj?=
 =?utf-8?B?aDVGVGJsSk01MUVjR3ozZnQ4MzExbkkxSy9WcGhieStoY3FmYVo0ZGJMejda?=
 =?utf-8?B?aGpObjd0L1NIVUFtYk01cXhicG9LRmw0NnBncWF3QXRnM3dIY0cxVkJEdHRt?=
 =?utf-8?B?cExlY3RUUlliOFM1YmVGOTZMY1p5NzdjQWJqMWpOZDBPTnY1ZGFnNmtMb3BC?=
 =?utf-8?B?SmxXaHBZK3lkVFhDdVVCNWlwK0pLcUFXdGtHUlA2TmhKUUM2SlRIT0x6QTd1?=
 =?utf-8?B?Y3loalRDS1ZrQzRWSXNsM2ZoNkFRSk5xR3FLUS90czRyMmI0T09uMUNMYm5I?=
 =?utf-8?B?QVRYc3ZCZ3pCTElZRm81dmNMUjA0WDdhNXlpVS9uVG00QVJSWU5xL2ZzalIx?=
 =?utf-8?B?ZmRjMUVHNmRqR01wOG85WXlEVzFpU05raWVBcUtQeGphYzhMWGlvZXZiYU5D?=
 =?utf-8?B?VnNud2N6Z3BOV0lSZExxcXFBcmE5RENzL0s0QUNBNU1HV0tGUytDdlZ0bC8w?=
 =?utf-8?B?a2tmZGJsUEFiWG5KQTYxWWJFWEREK2s1UXBSSGlPS3JiY1RxTmFOWjVoaGFy?=
 =?utf-8?B?ODJsbFFNZVordzBKSzVhUjZnY2lCb2JpMEdPTG5IQVc3TXRURG9rcWgxWllX?=
 =?utf-8?B?M2I3aVFvaHZZNXk2MmppTVdVakZ2NFlRWDY4WDZXaUxyL01NdEp3ajBVaE8w?=
 =?utf-8?B?THB1ZGY4eXR1TFVzbUltK3VsUGY0Y3V4MGhhVCtCejZTUTE3aDhISm9sVEhM?=
 =?utf-8?B?SmRsSU5oK0cyYWF0Tkx3aTNRSVVQb0c4My9zaUFkSmo2K0ZDNkpFYjdkVWNN?=
 =?utf-8?B?L3B1ZXdrMHozNEY0VTdoMDhhVW01aUp4U0JqRk9HRUhXZ0h2aUY5QTQvNUJs?=
 =?utf-8?B?RitVRUJPd1d0WWc1VXNKQnZzK3JSRWpZb3R1cUtOQjdEWEFYa0RZdGo2S1NB?=
 =?utf-8?B?RlpNRGlvVWV0VXFxbXNta0VMYmVKRzV4WnpuWlMrN3dSa09CTmpXczVSaHZv?=
 =?utf-8?B?QmQ3L1poVzdOMHBTWDVOblR2elZiSXVBZ1FLRWRCN1lDUnJHSXpxaWhzUm1y?=
 =?utf-8?B?RlI1Tm9PVkF1ZGQ4NGdOd0dkM0pCekN1M2dIdVVuOTNENEpudzBnOW5pWEY0?=
 =?utf-8?B?TFhsS2xDMnRUL3ExVitoc1hpT0x5WXkrOUI0WVZ4VEYxL0JuWTJteVhzbzJO?=
 =?utf-8?B?YnE5TjBHYnpsa2pWT3pFdTQvTy90VDVreSs2SWsrQ3RBRDdZWisvY2VYOThl?=
 =?utf-8?B?YVY0WlowQzg1UXlEek02Mk5QTnhMTi9jV1QxY3YzcmdaWTlWY0NnQWpRckty?=
 =?utf-8?B?MjFTMURqY3B5Y2VORDA1M2JIS1FZeXJ4bDFhTUdZaW9KakNhdjMvZmNkOTFh?=
 =?utf-8?B?Y0FIYzlkRGpoL0dlTENwWFlBbkRjTHNSd3F1T0dBelZmRmU1SVQ3M0hGYjFF?=
 =?utf-8?B?NTFIVXlYZ256N1ZZQVdZTUYydCttMzlvODloVXg2NDFBbU5YcktZanNHaUZQ?=
 =?utf-8?B?eldmQzhwQ1RJbWszSXFyYlhlcm9PRTNNNGIvdVJTN1R2UmpzYzlFMTc0dFJF?=
 =?utf-8?B?Nk44Myt1OXNBcHZOaUV2K2ZEcWxGamFXZnZZNk9MQkhpbmZjcjlDN241YjFr?=
 =?utf-8?B?dWlIRmo0YS9IeWZLb0dBTlQ2eGNIaHFaMERWbmlUMkxDWTlVVGVNczVVL0NW?=
 =?utf-8?B?ZFBUVDlKRVRXSjYvUCtGc2c0dzh4L2UrdmVNdGhJRTlvbUtsTkd0NEtRakJY?=
 =?utf-8?B?Z0xDdGtNN1FaZlY4MG1IVWF6dlJKaDhMeS9TUUFkeXZ1OUV5dWp1MFRYaXY0?=
 =?utf-8?B?R05tWWVoVXhuR0JGcktyOFdpNkJUVWdrejR5YUF0TEM2U09memJ4bGVSUFV6?=
 =?utf-8?B?QW1tdzU1STRNVmk0Zkg5NWNBMkJ2K042ZUNSY0JFektvT0lkdjE5azk4cWZG?=
 =?utf-8?B?a0FHNGoxdEsyV0dDZDBHVGduM0Z5bDRnbnJyaEpkM1BPdm94NGg2cG5iWTEz?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f66807c-7e03-435c-e589-08de28223050
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:47:23.8937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcMk4bOJLXlTMeX2aUvLVX2Rz8AI7epU2wmq9NqRGIBAlKpNBK2NTNG3aWId4E0yltK2ayxshQO8Bb+ZRg8dhyRSxPwEVKA6hDrFpuMXLkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9922

Hi Jan,

On 20.11.25 10:56, Jan Beulich wrote:
> On 19.11.2025 20:31, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The VMTRACE feature is depends on Platform/Arch HW and code support and now
>> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
>> This makes VMTRACE support optional by introducing HVM Kconfig option:
>> - CONFIG_VMTRACE to enable/disable the feature.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v4:
>> - format changes
> 
> Just partly, ...
> 
>> @@ -772,13 +775,24 @@ static inline int hvm_vmtrace_get_option(
>>   
>>       return -EOPNOTSUPP;
>>   }
>> +#else
>> +/*
>> + * Function declaration(s) here are used without definition(s) to make compiler
>> + * happy when VMTRACE=n, compiler DCE will eliminate unused code.
>> + */
>> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
>> +#endif
>>   
>>   static inline int hvm_vmtrace_reset(struct vcpu *v)
>>   {
>> +#ifdef CONFIG_VMTRACE
>>       if ( hvm_funcs.vmtrace_reset )
>>           return alternative_call(hvm_funcs.vmtrace_reset, v);
>>   
>>       return -EOPNOTSUPP;
>> +#else
>> +    return -EOPNOTSUPP;
>> +#endif
>>   }
> 
> ... the #else wasn't dropped from here. If no need for a v5 arises, I guess
> I can make the adjustment while committing. But it would be really nice if
> all earlier comments were taken care of (one way or another) when submitting
> a new version.

This is absolutely my miss. Sorry.
I can resend with fix. Just tell me how will be better for you.

> 
> With the adjustment:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank you.

-- 
Best regards,
-grygorii


