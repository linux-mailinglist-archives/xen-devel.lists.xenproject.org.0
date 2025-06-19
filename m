Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489C6AE0B29
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 18:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020237.1396633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSHvS-0007aT-6i; Thu, 19 Jun 2025 16:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020237.1396633; Thu, 19 Jun 2025 16:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSHvS-0007Ym-3u; Thu, 19 Jun 2025 16:15:42 +0000
Received: by outflank-mailman (input) for mailman id 1020237;
 Thu, 19 Jun 2025 16:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRu0=ZC=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uSHvP-0005oY-Li
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 16:15:39 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3c9bf61-4d28-11f0-a30d-13f23c93f187;
 Thu, 19 Jun 2025 18:15:39 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB8PR03MB6332.eurprd03.prod.outlook.com (2603:10a6:10:13d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 16:15:38 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8835.023; Thu, 19 Jun 2025
 16:15:37 +0000
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
X-Inumbo-ID: a3c9bf61-4d28-11f0-a30d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bH0UugQPi0fTFzbb27m/DLPrDlGmId62FGqmtaQVV2rIGA5dLFA21QCQ7XetBhcpEP8IZCX15kO35+7ocn5bt8Bs/x4YZX9rabARBXT5SwRwmB/u43+hhg/l7OGyjDKJ2TDlA2Vf/TSP0nHVLt9k0VOrVb69m6M5D2KRHy64LLm5Y0JtWSV0U0ctXuadOS+uZOgn5lk4lLdYVy/LVx4gfGmyVe58PRu4hlKP/aR/6gFQzF3m6ERUSimLdnJ7CqS5x2+51CS0hsgoY1RE+O5km7x1YGl/0EpJH5+whMaT5JWm9Hi/x/2k03qMqa0aRWXORfnKV8nPxj4yTTtpo9O3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lflLdOipEqmnCKZZXZjjMTogz5yfqVOI6aOdNSsd2Ss=;
 b=keByeEA1pb1zy/zMP2pyfo+Kgw8Zkklvhxqcakr0MCAqOzIo3+xCeA7Z4mPhcW5rGEV799tmdTaeGBY05+a9Edt3xo7GQEbqqnRpxZ1BYdxx3DovQTU80ihm57+T/U6lc3lLprt0DXLUj0Ac47kembLmTtmFjH+mBQcFiWyfESmDMCGC4QxK+leJQL67RCTDBm6XTNdi+7De+CUzzIBbDCsb3Pe94XbUn2uuEuCF9wfmtfrgPlw7nFebA6PTw1jOBoTaDc1Mj3vjM6TpdbsLaYTeprOl8Z6ZOA/JnVGhZTKVZ/cAnldGWInXM5cb2NbfeLw69aR0Ksc5iLVha5eEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lflLdOipEqmnCKZZXZjjMTogz5yfqVOI6aOdNSsd2Ss=;
 b=hp2ZtG+ZSuFZr47W+mFi1jUZ0/1sK0OiJjP8L0t4angHwT6ywHLELIhLY/NANQIILctqqABHgs2IttMn7g9Qw0FaisD9RXPavW4gqvz/TFJMlLvSt5BTQqBTcl7vvXpJ0NniAeQrqji3qgYUkscHu1wGlRCqWcEVCYjUI+aPRkxLrqGr9QxzWwbebqQgEO+7yXCJKRorG/TvdO1UICTgRF4GppnIOoGhFQRfiqNb0z3gV71ytBj5MOlyfL8YmpYI8m/kGkXonwP5epzBeqH86O8dF378JfL6LPGrAUkTB0hNjAa2gYwtqGr2ULacXXN3tz0miV+PdDZ7r3giraLAhQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Topic: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Index: AQHbyNXPHUV4T01ZEEC9Uxm0LaLKHbQIs5qAgAIlg4A=
Date: Thu, 19 Jun 2025 16:15:37 +0000
Message-ID: <2a98353b-a28b-4935-af26-80dc11d3862d@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <13d95459-ea77-46ea-84e4-cccece4cd496@xen.org>
In-Reply-To: <13d95459-ea77-46ea-84e4-cccece4cd496@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB8PR03MB6332:EE_
x-ms-office365-filtering-correlation-id: aa67015d-a214-4571-35e9-08ddaf4c8754
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bzNLYVZZaXVEVFNTS2xZVzJJTThyMHZYS0xNOFQ4aHJTNUEvM0dmbWhoS0Nu?=
 =?utf-8?B?WGZmY01kK2I1K3FRRGFTMURKcHRDb2FYbGVPL3lxYlVIMVVPV3lyZ2ttZUVp?=
 =?utf-8?B?NEZNYURWRktxTHRrdCtkRVZYajVyN3Z0Rm9Ucm5mbmtRMW5SMVBydDRRWkdP?=
 =?utf-8?B?aFRhYXlFUWt1TFJrK012VUhIWGgwMGMxLzhtSHBMRzFKMjQ4WWtkc3ZYMXlX?=
 =?utf-8?B?bzFqQnNWZ2tTNzdIb053VGU1QWRTY254dVB4WHZpcHl1NHgvWWR2YTdPYXpi?=
 =?utf-8?B?YWVmRHl6cFhYZGVvdXpsd3hYUkRRZ29WdUJNcnBZNjdaazRHVzJJeEswL3hn?=
 =?utf-8?B?WXE3TXhzSU42VW5DQk1JSUZJbUNFM2xCNlhZT1FTdlh6WFBFQy9tbkZPUVh6?=
 =?utf-8?B?S2trSGdZRjdqaVpRcW9QaGEzam5qWGtLMTdMODY0WnZTUEtFcW9leXp6MHEz?=
 =?utf-8?B?aE01WWg4aVMvSlVSekcvWGhOQ2ZPZ3c4YVdRcS9hYjFLT0t5QjJOMk5hLytT?=
 =?utf-8?B?M2UwSW9heStwMGJzQ2RFc0FXeUxJVUxnSmFraWFZT1VRZU83UWMrUkpXTSs3?=
 =?utf-8?B?NUU1anByNGlqeWtIc0FGMWMwUXRybXowa3VtbUl5dGJscHFlaGFRNVlwZk5L?=
 =?utf-8?B?ZlQ4bUlMczBEUEZiNkYvWHR4bVFJN0cwVE85QTlHUThzQjVpVzRmVWRMSUhp?=
 =?utf-8?B?UEhFSTBlOE1jaERMcmlibldBTG4wdVNGSkRMWDFQK1k1blNHeThORXhTS1Nz?=
 =?utf-8?B?OEMvbjIrTjEyK3dqS0k0YWMrYUE5c2RMeG1wS1h2SExRMUVtSlRSNXk1bG44?=
 =?utf-8?B?eDlmd2Jib0FJRnd3Z2dBWFdMeGVFSnZnMzhJanZDalI3aGQrZzUvMjdPcWFQ?=
 =?utf-8?B?WHR2SlN5VU9wOFA0aXVMUkpnS2F0STJ1SlVDWGZ0bHIvWnZUa213c2IzQ1RR?=
 =?utf-8?B?WjZkRnlqNFo3dWJUVHBJbklvTDFVaDM0TTJLWVEzVk9meVR4RGJZZStIcEpl?=
 =?utf-8?B?ekJxaXNkWnMxZXNRSG1pTXRQd1pGK3RsRUFjdENiZ0hxSG9kYTc3WTRBcGhF?=
 =?utf-8?B?UU1BUXh2WlFxeHRwNmo1TDRFZkJjRU1CcGtheWRMUmZXdEdPN1B3bFZQb0Rj?=
 =?utf-8?B?YWY1N3NNQ0IrRFRNTm5RclJrblV3VUtkOTFUZDZhMkl5cmNTdWpoWWhWa0I1?=
 =?utf-8?B?d2RGUlNpRWVVdTNsQnJPTTNUNmp1ejMzaE5JaTVmNi9yamVtR25tZTE2Qys5?=
 =?utf-8?B?OWZNdFhvenRsVHFXaFpyQ2JwamRKc2VLTGN6RWFnVVBGeFRxRjhnKzVObTJO?=
 =?utf-8?B?V1l2TjBhTUU1UDcyTWRUTG9leDVLU1dBT0dSTG1PWG5GYi92a3k4cEpUclow?=
 =?utf-8?B?Sis4d1pObTBFVUNIM2NVUWYxRFFZeTBrVFRjY2x2OW1CYnZnMmFyZFhCVTQx?=
 =?utf-8?B?ODRCTnZCT0tFUUsrTUZ3Y0FYNDMrU3hhcTFXMWMyNm83MkpINTRlQS9uR01Z?=
 =?utf-8?B?TG9xd2ZmSGtFNnNPaHBteHdMdGE4WXNXbVQ0TkN1bkJJbnNUcm9GbkszelBJ?=
 =?utf-8?B?N0VQZjVtRjMydGdEK2IycGE1OFlFQUREZHF5bjBKTlBHY0RMV0F3aFZxNDh4?=
 =?utf-8?B?K0h1TG9vZldLbW5uK1NFYk80OHF1Mzl5aWVNRWdkaDNoRWc4RWpIVEpYMERl?=
 =?utf-8?B?bXMvT1JQTVQzTXRFMGQ0RlExdHVnaXE5UEhLa0dNV0k0dGJKelNFMUZQcEVy?=
 =?utf-8?B?elBUbG00RlpkcFl2YTFpY0hTMWMzbmZUbk91RTh5VlhVZVNmeHdxWEZJWWFC?=
 =?utf-8?B?eWVtRjA5N3Q0eGlSMjRsUEdPMmVjN3J3dXJjc1liNzhLUVRwK3dwUUlHNE5V?=
 =?utf-8?B?V3M4ZC8reDZnazhiRlM2L3k4UDhVREVLeHUrVUtJTy9yTnFKWU1nUHhwbUpG?=
 =?utf-8?B?dUlRRUJoZnZ6Zkd3Y3dZMEZ2eGZQSG53MXhvZ0I4ZkxxSXBMZk9HREVwWjZU?=
 =?utf-8?Q?Ba/o08aF0NEQV9XD64fb4Ae/jTzTss=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmZGSUxQL3A0TFZyTEQwRm1kUmV4RjRBYXp1K0c5SGpMRFU4RUlWbGtuTlhO?=
 =?utf-8?B?QzloSlBuT3hOcjNLYUZ0OFlpdFBhM1NzZm1NOVc1enRkYlVLNkxmbS9Zck1V?=
 =?utf-8?B?YUtmSGlqYktBRnpuUGtGZUJNdDIzbTZ6TTZtc1R6NVpmYkU2WUdFY2xjK3J1?=
 =?utf-8?B?Z0czNldVZXdrUXRYQm1lVUp5MTVWN3p2dXdRTVdxdG9uTWlTSG01ZURhM0I1?=
 =?utf-8?B?L1ZrdU1ZZlVEMEU5ZUVPeisrWjl1U3BmTDh6Q25jL3I1NjFad1orRkVUWU5k?=
 =?utf-8?B?UzFVOWRwVW52YktvYXgrMUs4bWdpWS9ISE5zdklGVzFwMEtNNmJKNzN4MnJY?=
 =?utf-8?B?Q0t4cDllWSt5b0x5MUdkVVQxcEx2cFh6RTRvRytBSmNuaUNycndGckdLOHVM?=
 =?utf-8?B?WS9hakI1bG5rc2I0VTBRRmlPSzAxU3VLdnFrOUJrcVltMzRQcUVYWDZWYWJr?=
 =?utf-8?B?N1Yvdlk3QmpZbkNxZlIzVVRhUE9BTm13bkd0OG1HbmJzSkdIYk1jT0g1dUhF?=
 =?utf-8?B?ME9zcXBLaXVBNStGc0xyZ0F4OGhGZHgrbEhFeC80YURBSVB0Q0E1MkhNZEky?=
 =?utf-8?B?NzM1SHhQOXZxcnNCbUVLczhSUWVoak0rNTFzMXgvVUNjRGtHWmJBYXpEUnBJ?=
 =?utf-8?B?ckZxVmRka284VkRDSHdzMk13dzhZK0hXRlAxYXFTbGJKd1drQ2tiRXlsbXVT?=
 =?utf-8?B?aG9pVVJxRTRHVUNZY1p2OFpQNWx6UVBZS1R4aEV2T05sMFp4TUpCLzNkQWZZ?=
 =?utf-8?B?RzQ0TVN0NmE0bGlDTk9rSTlnc2srbUJkcE9VM0ZIN0tnWlh5UWtGeHRwb2FI?=
 =?utf-8?B?dTg1QVV6Y240Si9MKzQ4cGgrS1M1UkVEZUtrdy93eUd5VHdnbHFOZ0ZPOVR4?=
 =?utf-8?B?ZWh6SFUvc2FIb1JTZ0RYeUNvSmpRRGREZjlSaXZKN3hsdmxlelVNSWZQU2R0?=
 =?utf-8?B?dGZyK0xQUWczMmpydmlHaXJWWHFZL29ONmdHWjluNzZqTFdXRStyN3ZIMmtV?=
 =?utf-8?B?dVJoL1BuZ0tDOXhNV1QyRElTUFFaR3NkSmJSN0xHU3FDYkx6cENKc2ovVUN0?=
 =?utf-8?B?QjRtWHdiOFE1QjI5VnczL1dxR3BURks3T1FlK0J2a0svT1lieE1iaWZhNFdl?=
 =?utf-8?B?L1JrQVFKZnNCelA1UUEzSWdxVGYrTkRFME5ZbGdjUXRwUnJ5RGZDZHZsaDI4?=
 =?utf-8?B?RG9zK3NxMmVTalowdWIyRnFJdWlkZldjVHBDa3Z5Z0ZubjdMYVdnV0ZHbTBB?=
 =?utf-8?B?alk4YTJJQWxXTTBDSzI5TnVHbGtTOFl6UnNvMTRNVkZQNElqcjYxWUhKK3JQ?=
 =?utf-8?B?S0dkdGwzNGVKM0FGMTErSHVVdWpNY2QzSGdBMGNoQ0RRTkIzb2Z2M25BWndh?=
 =?utf-8?B?VGljS2I3S3JmLytLZDBBQ1B4YnJ3L243UFFhMTh5NVloQWhHZWRjOTlTdUxv?=
 =?utf-8?B?QU1GV2JBejdxbmtNZjdNanNhcFV5aE5HdlltYi9VUDMzWGNYYmlRK2hVQjlu?=
 =?utf-8?B?cDRCaEJFZXArL251aGxRR1ZnQXE5SG0rTWQ4RVMrdy8xd3pwZm4rbG5KUDZh?=
 =?utf-8?B?T2UvU29yMHNEZ0dpdW1mNXJ4TlFqMVFDYXdpNng1NUZPYllseDFmd3R5Vnlm?=
 =?utf-8?B?Z1Fya2kwNGlmVFFwNjJKb3hOSTVIQ2thcVBWNkF0L1JiVTZrWG13clptSVFs?=
 =?utf-8?B?M3NEVnVKbGRudW9SYW9UN0o4SkRaeHR1c1VGNE5ocjF1eWN2Z3lRTTh3Zm9k?=
 =?utf-8?B?bDRHdVp2dTAwWnVjZ3cwM0Rac01qaHpTV2t3d3F3MFRnN2xwYkdtSm9UZ2Vs?=
 =?utf-8?B?T2N3UDdDTitKMFFxNE40cXJiMTk2Zm9vNXpzSzhpcjJsTzRRcW9IYkVGMExv?=
 =?utf-8?B?cXFIeFViS0dKSG8xRzBRS01SVkdaeFJ0KzloNFp3MEt5MjRXam5YcjNrNVl4?=
 =?utf-8?B?bmNGVEYzY0psR0g4R2h5UUhNM0lkU0cvNzkzeTVEQmUyMERRalZLWEMwTHR5?=
 =?utf-8?B?eGt0QXl5K0ZEd2FUeVBxeUxyQkRxcFJGekVHV3JrSVF6VHptalExR0pFM2NG?=
 =?utf-8?B?OFA4NG43NkNiZmwxUXNjdkFycUJZelVOcm1hRGY3MEF0MlozdGc1bVMxVWRn?=
 =?utf-8?B?L2l6Q1R6TXB1aHROTkZGVzd6NFVNNzI3aUliUXJjeDNUalpXTXdTa3FKWVdM?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA9C9AAD84F7B34AAA1A9288AAC27809@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa67015d-a214-4571-35e9-08ddaf4c8754
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 16:15:37.9060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMhyXLvGwjboSr1pk+ejUNOWVvu6y8m+70OiYduFhDL0urpffPpVi9W/eP8lsVh4KMmVSwdkLxwpRJLez6AZ3G+mb6BTO98hX/Dfqny2fuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6332

DQpPbiAxOC8wNi8yMDI1IDEwOjI4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIE9sZWtzaWks
DQo+DQo+IE9uIDE5LzA1LzIwMjUgMTY6NTAsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIFNDSSBkcml2ZXIgdG8gc3VwcG9ydCBmb3IgQVJNIEVMMyBU
cnVzdGVkIA0KPj4gRmlybXdhcmUtQQ0KPj4gKFRGLUEpIHdoaWNoIHByb3ZpZGVzIFNDTUkgaW50
ZXJmYWNlIHdpdGggbXVsdGktYWduZXQgc3VwcG9ydCwgYXMgc2hvd24NCj4NCj4gcy9tdWx0aS1h
Z25ldC9tdWx0aS1hZ2VudC8NCj4NCndpbGwgZml4Lg0KPj4gYmVsb3cuDQo+Pg0KPj4gwqDCoCAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+PiDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiDCoMKgIHwgRUwzIFRGLUEgU0NNScKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gwqDCoCArLS0t
LS0tLSstLSstLS0tLS0tKy0tKy0tLS0tLS0rLS0rLS0tLS0tLSsrDQo+PiDCoMKgIHxzaG1lbTAg
fMKgIHxzaG1lbTEgfMKgIHxzaG1lbTIgfMKgIHxzaG1lbVggfA0KPj4gwqDCoCArLS0tLS0rLSvC
oCArLS0tKy0tLSvCoCArLS0rLS0tLSvCoCArLS0tKy0tLSsNCj4+IHNtYy1pZDAgfMKgwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiBhZ2Vu
dDDCoCB8wqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwNCj4+IMKgwqAgKy0tLS0tdi0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0t
Kw0KPj4gwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgfA0KPj4gwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
wqAgfA0KPj4gwqDCoCArLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0r
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc21jLWlkMSB8wqAgc21jLWlkMnzCoMKgwqAgc21jLWlk
WHwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhZ2VudDHCoCB8wqAgYWdlbnQyIHzCoMKgwqAgYWdl
bnRYIHwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCArLS0tLXYtLS0rwqAgKy0tdi0tLS0tK8KgICstLXYtLS0tLSsNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqAgfMKgIHzCoMKgwqDCoMKgwqDCoCB8wqAgfMKgwqDC
oMKgwqDCoMKgIHwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IERvbTDCoMKgIHzCoCB8
IERvbTHCoMKgIHzCoCB8IERvbVjCoMKgIHwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgwqDCoMKgwqAgfMKgIHzCoMKgwqDCoMKgwqDCoCB8wqAgfMKgwqDCoMKgwqDCoMKgIHwN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqAgfMKgIHzCoMKgwqDC
oMKgwqDCoCB8wqAgfMKgwqDCoMKgwqDCoMKgIHwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCArLS0tLS0tLS0rwqAgKy0tLS0tLS0tK8KgICstLS0tLS0tLSsNCj4+DQo+PiBUaGUgRUwzIFND
TUkgbXVsdGktYWdlbnQgZmlybXdhcmUgZXhwZWN0ZWQgdG8gcHJvdmlkZSBTQ01JIFNNQy9IVkMg
DQo+PiBzaGFyZWQNCj4+IG1lbW9yeSB0cmFuc3BvcnQgZm9yIGV2ZXJ5IEFnZW50IGluIHRoZSBz
eXN0ZW0uDQo+Pg0KPj4gVGhlIFNDTUkgQWdlbnQgdHJhbnNwb3J0IGNoYW5uZWwgZGVmaW5lZCBi
eSBwYWlyOg0KPj4gwqAgLSBzbWMtaWQ6IFNNQy9IVkMgaWQgdXNlZCBmb3IgRG9vcmJlbGwNCj4+
IMKgIC0gc2htZW06IHNoYXJlZCBtZW1vcnkgZm9yIG1lc3NhZ2VzIHRyYW5zZmVyLCBYZW4gcGFn
ZSBhbGlnbmVkLA0KPj4gwqAgcDJtX21taW9fZGlyZWN0X25jLg0KPg0KPiBJdCBpcyBub3QgY2xl
YXIgd2h5IHdlIG5lbnRpb24gWGVuIHBhZ2UgYWxpZ25lZCBhbmQgDQo+IHAybV9tbWlvX2RpcmVj
dF9uYy4gSXMgdGhpcyBtdWx0aS1hZ2VudCBwcm90b2NvbCB0aWVkIHRvIFhlbj8NCj4NClhlbiBh
bGxvd3MgbWFwcGluZyBvbmx5IHBhZ2UgYWxpZ25lZCBjaHVua3MgYmV0d2VlbiBkb21haW5zLiBD
dXJyZW50IA0KaW1wbGVtZW50YXRpb24gc3VwcG9ydHMgb25seSBwYWdlLWFsaWduZWQgY2h1bmtz
Lg0KDQpUaGlzIG1lYW5zIHRoYXQgd2Ugc3VwcG9ydCBvbmx5IG9uZSBjaGFubmVsIHBlciBwYWdl
LCB3aGVyZSB0aGUgc2hhcmVkIA0KbWVtb3J5IHN0YXJ0cyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRo
ZSBwYWdlLg0KDQoNCj4gVGhhdCBzYWlkLi4uIHAybV9tbWlvX2RpcmVjdF9uYyBpcyBhIHR5cGUg
dXNlZCBpbiB0aGUgc3RhZ2UgMiANCj4gcGFnZS10YWJsZXMgdG8gaW5kaWNhdGUgaG93IHdlIHJl
c3RyaWN0IGFjY2VzcyBmcm9tIHRoZSBkb21haW4uDQo+DQo+IFRoZSByZXN1bHRpbmcgbWVtb3J5
IGF0dHJpYnV0ZSB3aWxsIGJlIGEgY29tYmluYXRpb24gb2Ygc3RhZ2UtMSArIA0KPiBzdGFnZS0y
LiBJbiB0aGUgZnV0dXJlLCB3ZSBtYXkgZGVjaWRlIHRvIHVzZSBGV0Igd2hpY2ggd2lsbCBhbGxv
dyBYZW4gDQo+IHRvIGZvcmNlIGEgc3BlY2lmaWMgbWVtb3J5IGF0dHJpYnV0ZS4NCj4NCj4gVGhp
cyBpcyBhbHNvIHB1cmVseSBpbnRlcm5hbCBkZWNpc2lvbi4gSW4gdGhlIGRvY3VtZW50YXRpb24s
IHlvdSANCj4gc2hvdWxkIHNwZWxsIG91dCB0aGUgbWVtb3J5IGF0dHJpYnV0ZSB0aGF0IHNob3Vs
ZCBiZSB1c2VkLiBGcm9tIHRoZSANCj4gZGlzY3Vzc2lvbiBvbiB0aGlzIHBhdGNoLCBpdCBpcyBz
dGlsbCB1bmNsZWFyIHdoZXRoZXIgdGhlIHJlZ2lvbiANCj4gc2hvdWxkIGJlIG1hcHBlZCBhcyBE
ZXZpY2UgbkduUkUgb3Igbm9ybWFsIG1lbW9yeSBub24tY2FjaGVhYmwuDQo+DQo+IENoZWVycywN
Cj4NCkkgd2lsbCByZXdvcmQgdGhpcyB0byBleHBsaWNpdGx5IG1lbnRpb24gdGhlIGNvcnJlY3Qg
bWVtb3J5IGF0dHJpYnV0ZS4NCg0KRG9jdW1lbnRhdGlvbiB3aWxsIGJlIHVwZGF0ZWQuDQoNCg0K

