Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D6B3BCCC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101405.1454496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzTd-0007NC-Lz; Fri, 29 Aug 2025 13:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101405.1454496; Fri, 29 Aug 2025 13:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzTd-0007Lg-J2; Fri, 29 Aug 2025 13:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1101405;
 Fri, 29 Aug 2025 13:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psBU=3J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urzTb-0007DL-Gn
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:49:11 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f025403e-84de-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 15:49:09 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9413.eurprd03.prod.outlook.com (2603:10a6:20b:5a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 13:49:07 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Fri, 29 Aug 2025
 13:49:06 +0000
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
X-Inumbo-ID: f025403e-84de-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnOgq2QQJkgEHghs75YXSicFFIyMbxoPboTD1KEte+6wD8GgBC5fO4TxlSr7dy/0xX3QJbyOzek+ajMp+EHK00FLqKQBCyftRDbgnIgpYhITI2PtXyj0JG9baOYvX7sIEPwMDkJKy51sPWUh1br+S0Kd/G7eVIs9IVUhFYSvn1LqiFVgAYeLfccNzwBkGnMwJK3+fWb/UI5GOtGtdAWhOhsgxUldEXvCJvlYJ3hz5XAVeWSluRv5sgeaDrOZMnChy1A/LyQucKGWpBW0D2bLFNuy4DMG4BgGSKbyeInNM7/nBiI50ZCro4p6YrImFTdcYHEjTmrJ2tcWzCxRSzE9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iV10E0UqfN4m/i/UMX4SsavK/fpjdy2wKC3KLQwLZTU=;
 b=XDXQltxwfWIGD8Iv3YA3oAf4jwZkzi7bpHnQQBVW0VwqX9s+QXh7//B0UWrAzBTzDcZxTK0OYOkGqLqaejZ49hMf3J3BQOrONXzaD08ZtlsnZWVlItIxfhuRwLBKr8VUvlwU0d6Yww/Xk9L5lWe3Lwf5gRO6jRkQLeFkbIPovr8nHfNEt3KEXPto+F/+89YSGizafMz1LBAiujZTkmBH6yNBW/UlOgjE/KdNhaDZQegVQ56rftzSv0A9vM+jw199r/n+eG68UDfyCJUJD6Jx3uKtbePBjcN1WmLLg41JuMLc1Gdvzi3DD8cNLj1NvK4yyChqWA5LNjCzoSuUmrddsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iV10E0UqfN4m/i/UMX4SsavK/fpjdy2wKC3KLQwLZTU=;
 b=tyiNHdAQq2ZSpelv1GBGuyHSz0hXGJuN2CR0OXtc1I1EL2wF4y2wGDVAQvnRLeWdOpZBOQvWO7NEQ7OTiQDAtll1Pjv5yOJwg6w0VxQ+T9H+MkfZ2SiyAi9NX87NNvAPapX5dfIZt5Pl5XFtv5j13agG+FsMlIuCT+2WmwfsJas7T8bwS4Sn3l3xq49e+tf3WmSyQqzw03i3hRRUPa37q/jufeMv8Rb/HgaASeIiMfaWXAcJFebIl3i1W5zNIFBTcOryKNson1oYMtlqCTz6NW5M0V13o59yjbjfsLlhCI2xqtqxl5t5iLSH7NpYDva+cRulEpV7bDSD7grR+ZYPng==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
Thread-Topic: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
Thread-Index: AQHcGDp0HddMWoIUiESW9wlppK7VcrR5pRiAgAAB0YA=
Date: Fri, 29 Aug 2025 13:49:06 +0000
Message-ID: <33e5bebd-3738-4dea-9c9b-504bb112ab77@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <ffe5a45efd34d92c9f2c7307ecd0e9efc5b0d57c.1756399156.git.oleksii_moisieiev@epam.com>
 <c51b2a15-dcc2-467c-904c-ef01c37ef5de@gmail.com>
In-Reply-To: <c51b2a15-dcc2-467c-904c-ef01c37ef5de@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9413:EE_
x-ms-office365-filtering-correlation-id: 76104a10-03a1-4adf-96fe-08dde702d29b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?clQwRDg5YkhrRFIxVjIyTkFCeHRzN1E5TExPQjQ1YzltNlJTSWdCSm5UbWtF?=
 =?utf-8?B?MHNWN1hnRFh1amUvN1dNL1dFK3I0U09vY1pxQ2Rtcms0R3pyYlBVelQwOTJE?=
 =?utf-8?B?bEFjRE1SV0x6NHIyTTNIVVdmNjA5N2NQWW9zRTJOd0ZYUWpNNFRJN05MeUJq?=
 =?utf-8?B?RWw3bzBiRmN6Z0NuTnpBczFZTytLUGxsWVJZbjQ5WTdla3NKcVIwTmxyZmRq?=
 =?utf-8?B?L21VMXhCU0ExYXdyZkpRcTQ3VDFBb3JhT0NId0FQZ3U0b3dmSERNOUphNXZQ?=
 =?utf-8?B?a2F1cGlENjNpT3FBbVNUTkw5VURxNTQ1dU5QN2oxYlpJWC9hcU1BL3BXN2Fw?=
 =?utf-8?B?Y2NuZVRiU0NqTjZrcjdtL3RtdllUZFdrNFprWE42SHRsQWdXa0pUTWZaYUU1?=
 =?utf-8?B?dFVrMjFCbmgxWG9qNStWZUZ5U1llZkVjWFVHRzRSOWtkOUZPa0RycXBGYUhx?=
 =?utf-8?B?QXgvaU5ZUEVlRy9qU1FDdUZKU3RmbnBSWDZrVXJEYUlTQnNpYXl4eExaOTZU?=
 =?utf-8?B?cXdpZEJzNFFPdjJSTWVWTk9Bd1k3SmU1K0RCalVjSmFkMWxVdC9sOGJKMVRU?=
 =?utf-8?B?QUJveWtjRHlya0NmNXF6SjA2cTdhVGJjcDRuNmVtdzYwMmtFMUdIQXNCbkkw?=
 =?utf-8?B?aE9GOHdicVhUVlVuZHh2VGtybVpjSXdNZDAxaXFIZmRXeWgxQmdVRTZTN0lQ?=
 =?utf-8?B?aDNud0Q4elY0YTl0dFF4TUxya3hjS0I2dTR2clI4QTJ1OHNPZHpmRENKY1NM?=
 =?utf-8?B?aW9kNFZiWm5VZ0RUYTdRVXlHV1hHT3dFZEQwZEUydkVtcmRTck4reTl0ZVNw?=
 =?utf-8?B?eFZIS0xjZnFldTR0OHdxN0R2Kyt1aEgvN3g5Z241NmZJb1BWZW44TExmTUtr?=
 =?utf-8?B?TDRJZVppSno2aUwrYjBZTkRyZllWUDRwb2RrTGN5YlZua3RDVC9vMVBHS3Ex?=
 =?utf-8?B?d0pZL1RDc245d3IzQUtxcEthR3Z6Z3NlMVQ2eUUrMmpVdE45K25xRFpxM3hh?=
 =?utf-8?B?ZGNIU0FaeW8rWEgwczBJd1V0WEkvUHViQmhDbjdvcnkrdlFXREMvV0RjL1lX?=
 =?utf-8?B?WjB0ek15ZlpTM0FleVAzOHN2L2RqNjNtclIvRHBFbUk1TWpwc1Npbi80aDhE?=
 =?utf-8?B?alFLUHFNR2RmU21TYjZxdE14TTdjNWpTU2pMQ011Q2pNdWZuMnNNbWpUWHIw?=
 =?utf-8?B?Q3J3ZjRCZVp6ZEVLcTk2NXgzM0Z0Und1L0JyWXBzanhxeXY2dmphdERyVDZN?=
 =?utf-8?B?dlV5YzMwU2Y3THZaNVNaZzdOWXpWZjVxYW1pUXgraEVibmtFei90TE00NEJX?=
 =?utf-8?B?czZrQlRMQUlzZE9jSHI2NkZWaWN5UXZCbWJydUE4U21xcndKRW5xdjdRU1hs?=
 =?utf-8?B?OWJsZGZzcFRUemlTYUQvdks0b1ErcDRPUUlQV2FtdGFmMHg4ckRtZUM2cVhO?=
 =?utf-8?B?Vnp2UnVpUGQ2cUxpOERIQjk4L1p4Wk03WjFtSVYrRlhNQTFxOEU5S2dqQ1di?=
 =?utf-8?B?Vm1DUkhiRVB4Ly91TGw4UHk2eWQvdUdPZjFvbkdnUGxESnU5S0M1enFsYWM3?=
 =?utf-8?B?UmVUYkZOUVlJQU8wK2xUVmQxNW9OZnBKbHVQcWY0UitIMW96WDVMUXgxS2JN?=
 =?utf-8?B?M1ZLcTJmR0NiMEtNV1RXQ3BkM3NiaXpmcHU2dnhOWWxJRUJBOXZDOTd6N0lC?=
 =?utf-8?B?Sk9yUW5YK09UaEpXNTFrdi9HcE1MRFNxdWU0dzdxRWtXQnZKUlRDblBydjRJ?=
 =?utf-8?B?Tzd4K2RJRHVpUmM4eG9xU0drc0FCQ0lSMFVvbEkraFJaZmg3dGVRMUQyeGY3?=
 =?utf-8?B?UTl0K3dPeVlWYkxTbm1zRXZqMUlHNnZpaVVsd1VlaVpCSU1iWTk3UDdTVmRm?=
 =?utf-8?B?aS8rY2hMb1MyYkhzUHJsckdKTGFDaGg1TFB2RFFmdCtUdGJBWVN0ajNKOHZl?=
 =?utf-8?B?cVg5R0w2ak1aaEZSdEdwKy9aWVNWVmJZM0hqOUxKeklEUUpQeWJ5YVU0Sml6?=
 =?utf-8?B?c2EwdHVDYmp3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3ltRmZXc1Z0TWVGY2NuVDN3c2RuSHhJcnkyVElVc2FpWTZaRVp0OFoxNElZ?=
 =?utf-8?B?VXpQMUhuSldTVUFPSC90cXFSdUkwRGx1eldzTmhpNjMwU2NiSDYrcWhMMHdO?=
 =?utf-8?B?ckhzd25tZFo2a0pVc0hIQ056Y283Z3VQUGV3WDkvSGFHd3grN3lJS09iL2RO?=
 =?utf-8?B?dUg2OGFHaUhMS0hkL21hUCs4YmgxRzBaMjFPVk5UZ3ozemZwWWV0SDVHRlEz?=
 =?utf-8?B?TCtXWXpkUEhCeGZ6RUFBMEFZRXg4NytwYnNCUmFoeENieis1UFdrMlFWcTNp?=
 =?utf-8?B?bk5DeEthVnBvcTE1TWpocGRxT0F0OStKQTlndTd0S09KZmpuS2ZXRHlVcjU1?=
 =?utf-8?B?dmpsTkVxWVdiNkQwRW9yTVhTaktVRHNqVWpyTkxIWnYzRUxmQk9acFVJbkNy?=
 =?utf-8?B?Y2pQb1Fodjh3RUhXeTJOajY0cVFRcnl6YkdGNGVYSFdTV1VlbnNidUVVbHlr?=
 =?utf-8?B?anYxYWJ4aHRYVTNpYk84WVQvRWg2a3VaSlM3UlVvNjR5YW1VYk1wVmFmQzVo?=
 =?utf-8?B?dkIzUFFubWMzVTFUU1B0TXpYNWQzeWIzdFZOZzJtRUF1UnNwbGxPNVlmYy8r?=
 =?utf-8?B?b3NETytTRGQwbi83TVNNT0JiN3JUekVmVk5TUS9LTy9xY2JXK3ZoYThEM25r?=
 =?utf-8?B?eDYzZnY1R3JVN3ovVVFTaHR0RXlkWG4xejBia2xsZDh3WWxCVWhmWWtmOHVa?=
 =?utf-8?B?S1RNQWNVbG1CNlZEejhlUTE4ZkpOMFh2NGtKQnVWSEg2QTNVc0ppbCtqdHlm?=
 =?utf-8?B?WGxBVkpORGVJRHQwVWJsS0Y2WjZZKzhEL1YrR1IwQllMYVZpNTRIWUcyVUs1?=
 =?utf-8?B?ZUpSL3RDbnFWWGVrY2FCbWhoakFNNmFIQWhUbERUbS9tM3BwOEs4U1FyS1Jz?=
 =?utf-8?B?VEtzU1IrQnAxUFRJQ1F4RVl3U1FIb2xuNnVhUXh3QVRraENuU1VKczhTOEpo?=
 =?utf-8?B?Wi9PTTM2QzBWU3lSV2VVOXlhU3FPcjJ0ZE1wdjdJVWpnYlRUUVhTMWhVZVRj?=
 =?utf-8?B?SU5HR1hlZEpQbWtweVZyeDJQOFJwOHVENEN1N1Z5a0tjVUx2S2p6UjVybENK?=
 =?utf-8?B?UmtNWmpCMFlyNDRQMTl5U0o3S2pqNURoSEpxc2g1QWtHMm9vK0lGQ25pNERy?=
 =?utf-8?B?U0tnbHpmeW1zUktTRjV0MEt3WXh5SlNsMTlzc2d1akF6U2Izd1AwRzB2Rm9i?=
 =?utf-8?B?NHVlSkdyTTZXVWV2ZUVKYjUzVkNxSFNrRTh0VUlvdUlDTk8wV0NTSkxTVzFU?=
 =?utf-8?B?SjJndEFYUFVRT2VwVFRxZkswc1lGYmN6ejJZSWFwR04xOHhFVWljMWszczk5?=
 =?utf-8?B?SHRCYnhuSzRGenREMnFzTDJRK1VBc0U2NTVtWU9ZbTRUMG1ORXMyZGd5NWVp?=
 =?utf-8?B?L3V5VE9yd3ZpeEtYaEpSc0VUOEM2MzQvNU1RVDNVQVMxOW92VmZqVjkxekVw?=
 =?utf-8?B?RHkrbVVVZ3FxaXNocFV6VXlTSmswRDFnS0plOWVjKzlpZDVpY1B3R3RDTnRC?=
 =?utf-8?B?K2MxOXFoQkwvaE9wbTdvRWxxdGlMZFZJcjY3ZFBYZHlTdC93QTNvL2g5SUhz?=
 =?utf-8?B?eWhXaUhwQ0tvNzhZNlpXcjZGaDlWTDRETkpGSlZYUGxJKzlPU3VkbVJLcEdM?=
 =?utf-8?B?SldlMWRDTmhSdEdaa2RPenZGVy9FU1Bsc1RBeENhZU16cTNzT1R2NUszaGxE?=
 =?utf-8?B?aWR1dTJuZ1RtNDVhcXZxcjJiRlJ2azhsQURxZHVvbWtTV0pBSFYvTTkyR3Rz?=
 =?utf-8?B?aFR2Z2VvUjhSSThqVHdpRG5zc3IzZS90Tm1UdnRWMGRpemhBaVJHOHpqWDRm?=
 =?utf-8?B?TExwTkFrM3FqaTMrWVY2WTh4ekMwdVo1T1dxdFlHUDF1K3NnNE9pT25jU3lC?=
 =?utf-8?B?WHpDRC9FNWJpbWYxQWhGdXdhUTViM1huVE42c3Vud3cxOENYTXFCRTdzZ1J5?=
 =?utf-8?B?YVZpK0RXWFhxSlhoREErZHRZd0lLNmM4N2l0VGZTaGxic3NTc092NUNyek9V?=
 =?utf-8?B?Ly9EWGt0Vm4yN1JxOFZMN0pIR2gyY2tRUnU5T0ROeHVyQXBzK0NVWFZSeldR?=
 =?utf-8?B?WENremZ4K2ttUDN1c0t6emhPR3ZFVWFMcTJqQi8zbjFrcEIzNWM3WUJOU0Q4?=
 =?utf-8?B?UGxEcDFyUDE0Uzk0a1ZWYzZuNTlFZFBhNG1sWjNoZ1R6OURSbUJ0TnRsTW1v?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <240A40A3AB3FC24D95F440185D90858D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76104a10-03a1-4adf-96fe-08dde702d29b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 13:49:06.5399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWwmv0sUeU1niXF0ndoAZjbcR7NDitTRsj+p2jtEETw7ZKHlN6FnOTt8+Gq1n3pNCSSz6Hqg5G1SWO539lFYiYcs1mH3EQQvyuY8pB/2nl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9413

DQoNCk9uIDI5LzA4LzIwMjUgMTY6NDIsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPg0K
Pg0KPiBPbiAyOC4wOC4yNSAxOTo0MCwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+DQo+IEhl
bGxvIE9sZWtzaWkNCj4NCj4NCj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgYmFzaWMgZnJhbWV3b3Jr
IGZvciBBUk0gU0NJIG1lZGlhdG9yLiBTQ0kgaXMgU3lzdGVtDQo+PiBDb250cm9sIEludGVyZmFj
ZSwgd2hpY2ggaXMgZGVzaWduZWQgdG8gcmVkaXJlY3QgcmVxdWVzdHMgZnJvbSB0aGUgDQo+PiBE
b21haW5zDQo+PiB0byBBUk0gc3BlY2lmaWMgRmlybXdhcmUgKGZvciBleGFtcGxlIFNDTUkpLiBU
aGlzIHdpbGwgYWxsb3cgdGhlIA0KPj4gZGV2aWNlcywNCj4+IHBhc3NlZC10aHJvdWdoIHRvIHRo
ZSBkaWZmZXJlbnQgRG9tYWlucywgdG8gYWNjZXNzIHRvIHRoZSBTeXN0ZW0gDQo+PiByZXNvdXJj
ZXMNCj4+IChzdWNoIGFzIGNsb2Nrcy9yZXNldHMgZXRjKSBieSBzZW5kaW5nIHJlcXVlc3RzIHRv
IHRoZSBmaXJtd2FyZS4NCj4+DQo+PiBBUk0gU0NJIHN1YnN5c3RlbSBhbGxvd3MgdG8gaW1wbGVt
ZW50IGRpZmZlcmVudCBTQ0kgZHJpdmVycyB0byBoYW5kbGUNCj4+IHNwZWNpZmljIEFSTSBmaXJt
d2FyZSBpbnRlcmZhY2VzIChsaWtlIEFSTSBTQ01JKSBhbmQgbWVkaWF0ZSByZXF1ZXN0cw0KPj4g
LWJldHdlZW4gdGhlIERvbWFpbnMgYW5kIHRoZSBGaXJtd2FyZS4gQWxzbyBpdCBhbGxvd3MgU0NJ
IGRyaXZlcnMgdG8gDQo+PiBwZXJmb3JtDQo+PiBwcm9wZXIgYWN0aW9uIGR1cmluZyBEb21haW4g
Y3JlYXRpb24vZGVzdHJ1Y3Rpb24gd2hpY2ggaXMgdml0YWwgZm9yDQo+PiBoYW5kbGluZyB1c2Ug
Y2FzZXMgbGlrZSBEb21haW4gcmVib290Lg0KPj4NCj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBu
ZXcgREVWSUNFX0ZJUk1XQVJFIGRldmljZSBzdWJjbGFzcyBmb3IgcHJvYmluZyANCj4+IFNDSQ0K
Pj4gZHJpdmVycyBiYXNpbmcgb24gZGV2aWNlIHRyZWUsIFNDSSBkcml2ZXJzIHJlZ2lzdGVyIGl0
c2VsZiB3aXRoDQo+PiBEVF9ERVZJQ0VfU1RBUlQvRU5EIG1hY3JvLiBPbiBpbml0IC0gdGhlIFND
SSBkcml2ZXJzIHNob3VsZCByZWdpc3RlciBpdHMNCj4+IFNDSSBvcHMgd2l0aCBzY2lfcmVnaXN0
ZXIoKS4gT25seSBvbmUgU0NJIGRyaXZlciBjYW4gYmUgc3VwcG9ydGVkLg0KPj4NCj4+IEF0IHJ1
bi10aW1lLCB0aGUgZm9sbG93aW5nIFNDSSBBUEkgY2FsbHMgYXJlIGludHJvZHVjZWQ6DQo+Pg0K
Pj4gLSBzY2lfZG9tYWluX3Nhbml0aXNlX2NvbmZpZygpIGNhbGxlZCBmcm9tIGFyY2hfc2FuaXRp
c2VfZG9tYWluX2NvbmZpZygpDQo+PiAtIHNjaV9kb21haW5faW5pdCgpIGNhbGxlZCBmcm9tIGFy
Y2hfZG9tYWluX2NyZWF0ZSgpDQo+PiAtIHNjaV9yZWxpbnF1aXNoX3Jlc291cmNlcygpIGNhbGxl
ZCBmcm9tIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpDQo+PiAtIHNjaV9kb21haW5fZGVz
dHJveSgpIGNhbGxlZCBmcm9tIGFyY2hfZG9tYWluX2Rlc3Ryb3koKQ0KPj4gLSBzY2lfaGFuZGxl
X2NhbGwoKSBjYWxsZWQgZnJvbSB2c21jY2NfaGFuZGxlX2NhbGwoKQ0KPj4gLSBzY2lfZHRfaGFu
ZGxlX25vZGUoKQ0KPj4gLSBzY2lfZHRfZmluYWxpemUoKSBjYWxsZWQgZnJvbSBoYW5kbGVfbm9k
ZSgpIChEb20wIERUKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2IDxv
bGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEdyeWdvcmlpIFN0
cmFzaGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+PiAtLS0NCj4+DQo+PiBD
aGFuZ2VzIGluIHY2Og0KPj4gLSByZWJhc2Ugb24gdG9wIG9mIHRoZSBsYXRlc3QgbWFzdGVyDQo+
PiAtIGZpeCByZXR1cm4gdmFsdWUgb2Ygc2NpX2R0X2ZpbmFsaXplKCkgY2FsbA0KPj4NCj4+IENo
YW5nZXMgaW4gdjU6DQo+PiAtIHVwZGF0ZSBNYWludGFpbmVycyBmaWxlLiBTZXQgcm9sZSBhcyBh
IFJldmlld2VyDQo+PiAtIHJlYmFzZWQgb24gdGhlIGxhdGVzdCBtYXN0ZXIgYnJhbmNoDQo+PiAt
IEludHJvZHVjZSBhcmNoX2hhbmRsZV9wYXNzdGhyb3VnaF9wcm9wIGNhbGwgdG8gaGFuZGxlIGFy
bSBzcGVjaWZpYyANCj4+IG5vZGVzDQo+Pg0KPj4gQ2hhbmdlcyBpbiB2NDoNCj4+IC0gZml4IFNQ
RFgtTGljZW5zZQ0KPj4gLSByZW5hbWUgREVWSUNFX0FSTV9TQ0kgRFQgZGV2aWNlIGNsYXNzIHRv
IEZJUk1XQVJFX0RFVklDRQ0KPj4gLSBtb3ZlIFhFTl9ET01DVExfYXNzaWduX2RldmljZSBjb2Rl
IGluIHNlcGFyYXRlIHBhdGNoDQo+PiAtIEFkZCBkb2N1bWVudGF0aW9uIGZvciBTQ0kgU0NNSSBk
cml2ZXJzDQo+Pg0KPj4gwqAgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICsNCj4+IMKgIHhlbi9hcmNoL2Fy
bS9kZXZpY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICsN
Cj4+IMKgIHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgOCArDQo+PiDCoCB4ZW4vYXJjaC9hcm0vZG9tYWluLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEyICstDQo+PiDCoCB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOCArDQo+PiDCoCB4ZW4vYXJjaC9h
cm0vZmlybXdhcmUvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKw0KPj4gwqAg
eGVuL2FyY2gvYXJtL2Zpcm13YXJlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEg
Kw0KPj4gwqAgeGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTU0ICsrKysrKysrKysrKysrKysrKw0KPj4gwqAgeGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2RvbWFpbi5owqDCoMKgwqDCoMKgIHzCoMKgIDUgKw0KPj4gwqAgeGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2Zpcm13YXJlL3NjaS5oIHwgMjAwICsrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gwqAgeGVuL2FyY2gvYXJtL3ZzbWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMyArDQo+PiDCoCB4ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNz
LWJ1aWxkLmMgfMKgwqAgNCArDQo+PiDCoCB4ZW4vaW5jbHVkZS9hc20tZ2VuZXJpYy9kZXZpY2Uu
aMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPj4gwqAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
YXJtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICsNCj4+IMKgIHhlbi9pbmNsdWRlL3hl
bi9kb20wbGVzcy1idWlsZC5owqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArKw0KPj4gwqAgMTUgZmls
ZXMgY2hhbmdlZCwgNDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCj4+IMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZmlybXdhcmUvc2NpLmgNCj4NCj4g
W3NuaXBdDQo+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Zpcm13
YXJlL3NjaS5oIA0KPj4gYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZmlybXdhcmUvc2NpLmgN
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi4xYjlhNWMwYzA3
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZmly
bXdhcmUvc2NpLmgNCj4+IEBAIC0wLDAgKzEsMjAwIEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPj4gKy8qDQo+PiArICogR2VuZXJpYyBBUk0gU0NJ
IChTeXN0ZW0gQ29udHJvbCBJbnRlcmZhY2UpIHN1YnN5c3RlbS4NCj4+ICsgKg0KPj4gKyAqIE9s
ZWtzaWkgTW9pc2llaWV2IDxvbGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbT4NCj4+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMjUgRVBBTSBTeXN0ZW1zDQo+PiArICovDQo+PiArDQo+PiArI2lmbmRlZiBf
X0FTTV9BUk1fU0NJX0gNCj4+ICsjZGVmaW5lIF9fQVNNX0FSTV9TQ0lfSA0KPj4gKw0KPj4gKyNp
bmNsdWRlIDx4ZW4vbGliLmg+DQo+PiArI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPj4gKyNpbmNs
dWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL2Vycm5vLmg+DQo+PiAr
I2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPg0KPiBOSVQ6IExvb2tzIGxpa2UgdGhlIGhlYWRlcnMg
YXJlIG5vdCBhbHBoYWJldGljYWxseSBzb3J0ZWQNCj4NCj4gW3NuaXBdDQo+DQo+PiDCoCBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2RvbTBsZXNzLWJ1aWxkLmggDQo+PiBiL3hlbi9pbmNs
dWRlL3hlbi9kb20wbGVzcy1idWlsZC5oDQo+PiBpbmRleCA0MDg4NTllMzI1Li42ZmRkMDU1MmUw
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2RvbTBsZXNzLWJ1aWxkLmgNCj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9kb20wbGVzcy1idWlsZC5oDQo+PiBAQCAtNjIsNiArNjIsOSBA
QCB2b2lkIHNldF9kb21haW5fdHlwZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgDQo+PiBrZXJu
ZWxfaW5mbyAqa2luZm8pOw0KPj4gwqAgaW50IGluaXRfaW50Y19waGFuZGxlKHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8sIGNvbnN0IGNoYXIgKm5hbWUsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGludCBub2RlX25leHQsIGNvbnN0IHZv
aWQgKnBmZHQpOw0KPj4gwqAgK2ludCBhcmNoX2hhbmRsZV9wYXNzdGhyb3VnaF9wcm9wKHN0cnVj
dCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUg
Km5vZGUpOw0KPj4gKw0KPj4gwqAgI2Vsc2UgLyogIUNPTkZJR19ET00wTEVTU19CT09UICovDQo+
PiDCoCDCoCBzdGF0aWMgaW5saW5lIHZvaWQgY3JlYXRlX2RvbVVzKHZvaWQpIHt9DQo+PiBAQCAt
NzEsNiArNzQsMTIgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2RvbTBsZXNzX21vZGUodm9pZCkN
Cj4+IMKgIH0NCj4+IMKgIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfeHNfZG9tYWluKHN0cnVjdCBk
b21haW4gKmQpIHt9DQo+PiDCoCArc3RhdGljIGlubGluZSBpbnQgYXJjaF9oYW5kbGVfcGFzc3Ro
cm91Z2hfcHJvcChzdHJ1Y3Qga2VybmVsX2luZm8gDQo+PiAqa2luZm8sDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGR0X2RldmljZV9ub2RlIA0KPj4gKm5v
ZGUpDQo+PiArew0KPj4gK8KgwqDCoCByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiDCoCAjZW5k
aWYgLyogQ09ORklHX0RPTTBMRVNTX0JPT1QgKi8NCj4+IMKgIMKgICNlbmRpZiAvKiBfX0FTTV9H
RU5FUklDX0RPTTBMRVNTX0JVSUxEX0hfXyAqLw0KPg0KPg0KPiBJZiBJIGJ1aWxkIGN1cnJlbnQg
cGF0Y2ggd2l0aCAjIENPTkZJR19ET00wTEVTU19CT09UIGlzIG5vdCBzZXQNCj4gSSBnb3QgdGhl
IGZvbGxvd2luZyBlcnJvcjoNCj4NCj4gQ0PCoMKgwqDCoMKgIGFyY2gvYXJtL2RvbWFpbl9idWls
ZC5vDQo+IMKgIENDwqDCoMKgwqDCoCBhcmNoL2FybS9ndWVzdGNvcHkubw0KPiBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM6NToNCj4gLi9pbmNsdWRlL3hlbi9k
b20wbGVzcy1idWlsZC5oOjc4OjU1OiBlcnJvcjogJ3N0cnVjdCBkdF9kZXZpY2Vfbm9kZScgDQo+
IGRlY2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxlIG91dHNp
ZGUgb2YgdGhpcyANCj4gZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbiBbLVdlcnJvcl0NCj4gwqDC
oCA3OCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgDQo+IGR0
X2RldmljZV9ub2RlICpub2RlKQ0KPiDCoMKgwqDCoMKgIHwgXn5+fn5+fn5+fn5+fn4NCj4gLi9p
bmNsdWRlL3hlbi9kb20wbGVzcy1idWlsZC5oOjc3OjU1OiBlcnJvcjogJ3N0cnVjdCBrZXJuZWxf
aW5mbycgDQo+IGRlY2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNp
YmxlIG91dHNpZGUgb2YgdGhpcyANCj4gZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbiBbLVdlcnJv
cl0NCj4gwqDCoCA3NyB8IHN0YXRpYyBpbmxpbmUgaW50IGFyY2hfaGFuZGxlX3Bhc3N0aHJvdWdo
X3Byb3Aoc3RydWN0IA0KPiBrZXJuZWxfaW5mbyAqa2luZm8sDQo+IMKgwqDCoMKgwqAgfCBefn5+
fn5+fn5+fg0KPg0KR29vZCBmaW5kaW5nLiBUaGFua3MuIFdpbGwgYmUgZml4ZWQuDQo=

