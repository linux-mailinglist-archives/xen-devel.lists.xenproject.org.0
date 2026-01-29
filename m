Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJPAMPRre2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD7B0D35
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216560.1526495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpf-0000x0-JB; Thu, 29 Jan 2026 14:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216560.1526495; Thu, 29 Jan 2026 14:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpf-0000uP-EX; Thu, 29 Jan 2026 14:17:15 +0000
Received: by outflank-mailman (input) for mailman id 1216560;
 Thu, 29 Jan 2026 14:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLTt=AC=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vlSpe-0000f7-7g
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:17:14 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c29b40e-fd1d-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:16:58 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI1PR03MB10078.eurprd03.prod.outlook.com (2603:10a6:800:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 14:16:54 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:16:54 +0000
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
X-Inumbo-ID: 2c29b40e-fd1d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/+oA24rAnNN3LVmjEZgScB+N4fXqKKUzOfG/tjc76f98i8K8beA0+xmOuelyNFiooF7lrnfESmghrseSteKQXv2Zj8dzCr4zNLKHiaOYgkIy5mvgcrgAYSO0DqQ1GK49tBe3T+MvoCh5tHDnKm40A/PbYHvPhNkmIUuKsubCnsNelRR8RmRxQjVyD5UWePiVLbbZTCbyQMUrnAJYy96OksW4U8Xm59SWP/wLdbUm8qG+U5MPo7jgOKcbjUXWQzNXIv8QVL66ythNoRUfhY2UIVbYD0DIczbQN8euqt5xuV7yoK6mTGurHZF9V+m80X54KNpH1xML7DETT5u+jiqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75F7LBZs/9A/ecjgSuQlaiwP8pV0QmiImg6+C8Z/ZQo=;
 b=pgARHeEYjTcAncE2fVnq+mWTLUkdJXgNTJE3om+HMEzBMIx5Gqb3eLWhbJoeKpZovz5Fg72HYf+aB7VA64KHihKfua7kTKh2NG7eveP0w1turdNQmSrh5hzxM+B86c2ZAyNjLJNNrEVOI6PfRG6s59D2jSlXxooj5pI6dkANypmrkVHzb/viaKZUaPzdIc3af9P6YYmNAlaTAvKokjoCmu3YRse1FgKGpZ2sWRmyxjHmlPi6q31Vi0AdsMakG9wm45owCtzPQ/ROeel4N40B8Lc4SHI6WFVXtJIvbJe6bUIqs9PpjOjTlFpXAPazxcKWyzJ7c4jkwAFV/I34o86tSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75F7LBZs/9A/ecjgSuQlaiwP8pV0QmiImg6+C8Z/ZQo=;
 b=UsG1XF5D0tao4vR/TqgDNb0hQlrYzzUGo2e7ltGp2zEtLvP4jaUA8Grwu9pCtl4y4I2EmBeQzNKKM0Ky0YLrwszvv1T8ETzUniuxYtvWIDl5fVJ7oA5BgprDQOBuTOfk/sem8EDckcgI2t/DyU300MnkPUpnMl8ZvbGkgo4aG1VOf8Bu/ugZKtQ47Y1iGP0gpms5hEdncXftbMwsTR9HL/8u8U1MQvjN8n+i3tN2yHIFWJCM3LEwJBk0d0nZhLjs++wW3Kmut9A3KxGTwBiZpsoGjN74ZA+d9n58YAbD0iS4B/Eqn3HmfGP7aEfcHZPwt0S2JBaEYaaHypUHTebGWg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v9 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Topic: [PATCH v9 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Index: AQHckSnr8YaBhevnIkKApayON29DqQ==
Date: Thu, 29 Jan 2026 14:16:54 +0000
Message-ID:
 <69d32e2440b2ef194b4893e5dd29c2dd9d216a90.1769696107.git.oleksii_moisieiev@epam.com>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769696107.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI1PR03MB10078:EE_
x-ms-office365-filtering-correlation-id: e68d8cb4-2673-47f7-3339-08de5f410e03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SEQrVGRnUnh3SEZ0QWV3V1lTZlNGaitWZTVoNVFPKzBHcVIrc2FkcTJPY1NK?=
 =?utf-8?B?R0xUbzVmQWlmREN3M1BiVkdHL2E4V1BmY3Z2QlRyUmdiQnRXa0NmM2VGWlVS?=
 =?utf-8?B?UnJiRGpZZnVYUXNFbSsxeGZ0cjBHb0JvWFpYcHNrUTBZTlNEMy9CVmlGaDlp?=
 =?utf-8?B?aXRGOU1oVUhUL1M5a055VVZsMEVQYllnR044SWZLWHRVeStsNGtDVnJNQWVo?=
 =?utf-8?B?VFJkNlppMDlaK2JRTkh5OXhQZkc0RVF2czJsSWVReFhwMkxLZGdrVkdQQnVU?=
 =?utf-8?B?dEtIemdqOFFpSVhwZ3VMeGJielJHaHUzYjJJTjhmdnVJNnlLbEFaSDJxL0FF?=
 =?utf-8?B?Ti80UkdzS3F2cVhnUktwYUZVWkllbnliSmlGeFQvZ2ZqUmlGVXdDZWY4MjJL?=
 =?utf-8?B?d0ZIVnI4Z2gzZVBjTFFKSmRjbjZDdnpSek5EMHl3UWVWQlZRbUNxMFlsSFRX?=
 =?utf-8?B?bjVJcEhvUkw0aUJyVEN6ZW4yS0N6Tm9yOS9BRzhxQWdCT056dUx5VFFWNUxj?=
 =?utf-8?B?Wll5SUFSTU8xaENyNENON1p2SnBsRkd2ams1TGp5ejJwWUhuWGhhenN0cTZW?=
 =?utf-8?B?aTVPaFU1NUtOc05RNTJwNlZqM1NUbDhwcUVjQThvWVUxMjVrUWQ3NERzT3ps?=
 =?utf-8?B?RUZCZFA1cjNHald5VmtlZkt3K1ZOM0cxa3ljdE9WZy9obmF5ZGMwUzdNTDFC?=
 =?utf-8?B?cnhOVmUxcjBzME54RTI3VUZhWGQxcE04ODAxMUNaczBqeTNKSGR6RlhzUytF?=
 =?utf-8?B?QVFRNi9EZndLd0JXSjR3RmpyN1p2QnBZUEY3M3RCZTV2dlJDaEduOXRzNEFv?=
 =?utf-8?B?V2tTSW1Mem9SWjdEaGVXNXdnc0dMZ1pJNTM5SGt4T0VDZ0JNRUI1c1FzL1E3?=
 =?utf-8?B?Yy9DNjNyOGtMYmErZVozeWwxcnk0UzBJLzh0SlNDa1Vvd1E4OHZ4Zk10bVpW?=
 =?utf-8?B?RkUyUEZXajZNN1JaazgwNHF6OFk5bG9oMGNiQVNVVlNvY1gweHpWYUNQa0Fs?=
 =?utf-8?B?Nmh0N3FyMUhVV3FEdDI4K2xZT1NDYWpxV1VFdUkrSGtEL2tRUjNRNXVQKzhm?=
 =?utf-8?B?QlJDV3lkMHVMRSsvNjhIaVVic3ZpbHZ3NmVVU2pleUt5VEFFSTE1UVN2Y3lq?=
 =?utf-8?B?dVFFSjNnS1JWVm9VTUNWTVRnQ1hRNHA5WHYveG9tVE4yVkJKdXZaNFA3cnAx?=
 =?utf-8?B?eXcvUjl0bzFFeGRvcDh3WjFPYWFvZjB2ZTY2cmZOSEQzRllRRU05b0tEemx2?=
 =?utf-8?B?TTFENWEvNXZORkdEWDhwRDFnYStqcVUwc3R1WDRGY1ZkQ25RZ1ZINUlqVDdm?=
 =?utf-8?B?R09ZWTNXWnp5L0tGa0dueWdlZDludmc0TmZkNzkvN0pEWmJOL0FvMkMrU053?=
 =?utf-8?B?Nk03ZU9aOTFKdHFXa2tkWjFaYmJGNVQxMmtRM2p1c2UyR3ZwQ3lzamFWVEtH?=
 =?utf-8?B?ZXZFR2JDVVBGZENRR0dCZ3loMWpaSFBUYWFldDFrRVZIY1h6S2JTRjBYQm1S?=
 =?utf-8?B?S3U4SlZNbWYzWFJkRnV1ZTVXZzUxL3RieERyYnpFN2YvVXRubmNZUk5sNUZR?=
 =?utf-8?B?WU0wM3Z6UHBuZ3hRSkIrVUpGelZpYWs1VGp2SUczWjZOdzdHTDB6Mks5amxO?=
 =?utf-8?B?eTE5RFBFYzBhWkpKVUROczJDd1NITnJ4WklVdGEzTC9CQTFUenlldHJ4OEtS?=
 =?utf-8?B?dkVDaVhwM3UrM3dYY3RDaVFYNEZ6MnE1WmR4TjQ4RDVLdUVia0pkb3hHeXRH?=
 =?utf-8?B?Y1pvWnZJOGRjMkVoVTRvajJvZklVNUYxMVM1aEVFdHZPVkdmYTdBU3lxemNI?=
 =?utf-8?B?ZTg5NVh1YXZNMHFvbVJ0SFEyNU5IM29XV0lqTE45L2ZsYUd1b1NkcnUvQ3Vj?=
 =?utf-8?B?U0dySTRxUmZGS1JBaytSSG9SVWhaN0M2SlRkR2lya0s2aWNJWm9sR05ReDlv?=
 =?utf-8?B?NExVb1RvZXZma0Rqd2JhUG9CN3NkL3N2SlQ2Nll6NGtQc3VPd2VhaWN3OVhv?=
 =?utf-8?B?UWJnZFJrUFBTV3F0NUZXenZDYlJVK1owM1FxRFBibmc2UGFxaUQyTFNMTjli?=
 =?utf-8?B?ZVZqRVNVMmM0blpSMjBDaUJWby9xMWRtWDNkazhWY1BmYndIOGx1Z1BHNFU1?=
 =?utf-8?B?U3JFeEcyZFVqUWEyc2NuUjROMitWV2xqTGN1SkdjU0lBMTljK3ZabkN6bk5E?=
 =?utf-8?Q?Jdbxx8pXyrhhAANvDYOu/Ig=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rm5Id2lscjNidm1vQlU3VWJRWEZrN1c5Nmt2eEpwRldQNDBuYjRwaW9mME55?=
 =?utf-8?B?L0FWcjJCWUxuYTlqSU9WYUtWelVXZTZPNkM0ZnVhSUJ2dHgyb0ZjOGN3Sk9S?=
 =?utf-8?B?RCthQStJT0U0eUFXTVp5KzVkMVRSOEJ2VytDTWh3b0tpbFlyMVUrK0hzdHhR?=
 =?utf-8?B?ZE5lUFB4MUpZQTF5aVBzTGg0VmhYTU9SQm9jdkx2a2RhbCtqQVNDemt4Z2F4?=
 =?utf-8?B?NE5vTlJKbjM0Y3M5dHM2S01mOUlqckNlSVIyd21YZzFFR3dGUk44LzdGNkdQ?=
 =?utf-8?B?aGxrMVg2YWV4SEZmaVRWS2pIRnVLR0gxWklXQUN4eFQ4ckdYQm9CRDROMTlW?=
 =?utf-8?B?UlBpUERsT3R6aTl1MnQzSzVsZWJwRFpmeGNaZklKZE9wWENhdTY3cVkrN1BP?=
 =?utf-8?B?c3BGNXhIZHU2RmxZd1NhajVWMVA1UDNGcFdCelpRRkE1L3dEQld4b0FEWE91?=
 =?utf-8?B?bzZZcUVoL1VFaHl4YjBtVjdEbkczYUpROUdRMkVCVVQ2MzFOd2JXWjFENGh3?=
 =?utf-8?B?K3lYUWZibWRlMk9FV052V0lZcEhiQmcyZWtsQXRBTkdqbGhXbE5BNm94QzlP?=
 =?utf-8?B?MkNmN2RmQTVDUkw1SHJ1NlZ4Qjc5NytGVlYxVW9pbUg5U1Z3bnZoMlE1cU02?=
 =?utf-8?B?UDFXSGlPTkQ3cUJHM3hWSHBiK3ljMzZocTAvSzZScFVqVzNnNUhuWnpjMXl3?=
 =?utf-8?B?anlxakNtV0FkNGhLYVhSWWw3WDhVOWRqc2lXQUgrUTNCYzA3UnpqNFF0VWg5?=
 =?utf-8?B?T1NNR0pReWZ5NFczYVNGM3Z1aXhQVW11QXFGMGRzOEM2TndWbVR2RXlPUDBi?=
 =?utf-8?B?d3RKK2pQWTRBSEhCYVFOR1JmWkc3NVJBN3Q0OUlpVDVhVFdtQWZPL1V3V2c2?=
 =?utf-8?B?UnNxTVlrRGovUGQ1L3BYcFVyUzcwdVVFWVRpdGxjNHVEZFNBcGlYeUs5WktV?=
 =?utf-8?B?Y0svTm1RbE1XdGxZMWFydndoR3RwR1JZdXRwdkJGYlI0MDhYa211azMwZkNq?=
 =?utf-8?B?cHJ0ZEJHckdyd01PRTBrYzRQaTZMUnMyWDVueVhkd1gxZVZ6RFNwSUxkbVJ3?=
 =?utf-8?B?ZHI3NHhxbHgzK2NicDMxbWV3RUw5eXJZaDFxUVdQRVRQRS82V3ZXQ2tvOTlS?=
 =?utf-8?B?TllrY2drU2pvT3gyODdTaXBsSmNxUExpY0pTYytGdXJ6QmdVUzk2alg2Qm8y?=
 =?utf-8?B?MFU4VkgzNnZaSWdSMVkyL1ROYUQ4TWZyeU5JTjVjT3dNYkF0Um5tRFRXbG5a?=
 =?utf-8?B?M3lEbTRJZGNmTWlHQWo4enY5cFZ5S2RyeW1kd2dEVkFwYnhBSXhpeGpiakdR?=
 =?utf-8?B?bkplWVBpSVdYM2pOYndkUWxmYm1uZU5TekhrVWpaR1JUWkVEUkpDckpxVXFw?=
 =?utf-8?B?YXh2djRiYnU3REc4RStkUzlyby93VzJvQWtncmtjS3RDbWtZTTBwY2p3VGlm?=
 =?utf-8?B?KzVYQ1VXZHlNaHJieGJQT01vMVZGZWlha3pDd3RHRHU5Y2lOZGNneGsyMUNw?=
 =?utf-8?B?ZmFBQUUyK3Ayak1oOUZoSk5mQ0gwZVppT1dlMDgxeTYvb01Qa3ByT2drRmlR?=
 =?utf-8?B?MWk0amllLzhYa0ZHdnl6TjJZaDN4MWtpU2pqb3FFcnRLbFU3K0tYbzU2VUNN?=
 =?utf-8?B?R05GWjJVNWtQUlRKQ3lBSHFueTlmb3FkemNycHNSR1JXNzUzWEhDUVMxR2pr?=
 =?utf-8?B?WGVMWXVxZGU3eW96bjlYanF1M2crSXdQck0wRnl5RGs2d1FXWkp6c2dZd2I3?=
 =?utf-8?B?R2drMlR0Z3lFZ0YwMUxod0hvUExwQkFjeGJ5K2dUZWdHeXd0b256V2pXL0FP?=
 =?utf-8?B?akFMVVRZSGFnQWtCSWx4Z1ZDNWJnVjBhcGZWckExWmNpNkNadGNZNUlySDkr?=
 =?utf-8?B?TzEvQks2UkdrQXhPalVPY0ZEVGRIbXdhOXhTZlB6V2QxQnF6L0UvcXVUWlQy?=
 =?utf-8?B?TE5YRnpvdDZjQU5oT3d1aUNBcGxianp1VXFVSkR3YnJrdW1BTEVLUDUyK0J3?=
 =?utf-8?B?a0NCWEplWHdzRVBFR0FyWG9WM2xxTWNWQjRjUTNhN0VkSW43QkFwK1hhdzEr?=
 =?utf-8?B?c1ltNGN4S1BIa1FWakJycDU2QVMxMFBwemI0ZG9lamUrL2pyRE1EeXF1UkZJ?=
 =?utf-8?B?cnVHeEpsSlltZ0EzTGJPbENrQ0RBYjVrRW1PdWhOblJXUDkwbmxCVmVlM2J6?=
 =?utf-8?B?c3p1ejNnaGwwQm9NSVcvVlBEMDFsQk9QeHIzL0dBbEF0SU5GMk1US0Y3UHNW?=
 =?utf-8?B?Vld2WkdTaFJPMXVISnNpR3NHSnRMYzNxbzVqTm03d1Y1cmxBK1VBRDIxcHd0?=
 =?utf-8?B?QVdtSTlSckFhNERpMktwYnJjbTd3NlBRVy9kQVdOWnVGOCsxSUdHVllDeCtG?=
 =?utf-8?Q?8xeSEk0LHXbkieqk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CA1116734CEC7429F2A6F422342FE64@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68d8cb4-2673-47f7-3339-08de5f410e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 14:16:54.4945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytCzkhsK01vkiCMs+rrIzYIr0QiE72KXR7DT1xRuNb7RIW6Pzq6xTSAUzRYzQrhhSVyvDgC7GqSrDH9oh+Xk9OccjasQSij3RXbX6yw7b18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid,e6ef0000:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 42CD7B0D35
X-Rspamd-Action: no action

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KDQpB
ZGQgY2hhaW5lZCBoYW5kbGluZyBvZiBhc3NpZ25lZCBEVCBkZXZpY2VzIHRvIHN1cHBvcnQgYWNj
ZXNzLWNvbnRyb2xsZXINCmZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3b3JrLCBzbyBh
IERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUNCnBhc3NlZCB0byBmaXJtd2FyZSBmb3Ig
cHJvY2Vzc2luZyBhbmQgZW5hYmxpbmcgVk0gYWNjZXNzIHRvIHRoZSByZXF1ZXN0ZWQNCmRldmlj
ZSAoZm9yIGV4YW1wbGUsIGRldmljZSBwb3dlciBtYW5hZ2VtZW50IHRocm91Z2ggU0NNSSkuDQoN
ClRoZSBTQ0kgYWNjZXNzLWNvbnRyb2xsZXIgRFQgZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2FsbGVk
IGJlZm9yZSB0aGUgSU9NTVUNCnBhdGguIEl0IHJ1bnMgZm9yIGFueSBEVC1kZXNjcmliZWQgZGV2
aWNlIChwcm90ZWN0ZWQgb3Igbm90LCBhbmQgZXZlbiB3aGVuDQp0aGUgSU9NTVUgaXMgZGlzYWJs
ZWQpLiBUaGUgSU9NTVUgcGF0aCByZW1haW5zIHVuY2hhbmdlZCBmb3IgUENJIGRldmljZXM7DQpv
bmx5IHRoZSBEVCBwYXRoIGlzIHJlbGF4ZWQgdG8gcGVybWl0IG5vbi1JT01NVSBkZXZpY2VzLg0K
DQpUaGlzIGxldHMgeGwuY2ZnOiJkdGRldiIgbGlzdCBib3RoIElPTU1VLXByb3RlY3RlZCBhbmQg
bm9uLXByb3RlY3RlZCBEVA0KZGV2aWNlczoNCg0KZHRkZXYgPSBbDQogICAgIi9zb2MvdmlkZW9A
ZTZlZjAwMDAiLCA8LSBJT01NVSBwcm90ZWN0ZWQgZGV2aWNlDQogICAgIi9zb2MvaTJjQGU2NTA4
MDAwIiwgPC0gbm90IElPTU1VIHByb3RlY3RlZCBkZXZpY2UNCl0NCg0KVGhlIGNoYW5nZSBpcyBk
b25lIGluIHR3byBwYXJ0czoNCjEpIGNhbGwgc2NpX2RvX2RvbWN0bCgpIGluIGRvX2RvbWN0bCgp
IGJlZm9yZSBJT01NVSBwcm9jZXNzaW5nLiBJZg0Kc2NpX2RvX2RvbWN0bCgpIHJlcG9ydHMgYW4g
ZXJyb3Igb3RoZXIgdGhhbiAtRU5YSU8sIHRyZWF0IGl0IGFzDQphdXRob3JpdGF0aXZlIGFuZCBz
a2lwIHRoZSBJT01NVSBwYXRoLiBBIHJldHVybiBvZiAtRU5YSU8gaW5kaWNhdGVzDQp0aGF0IFND
SSBkaWQgbm90IGhhbmRsZSB0aGUgcmVxdWVzdCBhbmQgaXMgaWdub3JlZCwgYWxsb3dpbmcgdGhl
DQpleGlzdGluZyBJT01NVSBoYW5kbGluZyB0byBydW4gdW5jaGFuZ2VkOw0KMikgdXBkYXRlIGlv
bW11X2RvX2R0X2RvbWN0bCgpIHRvIGNoZWNrIGZvciBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKCkg
YW5kDQpub3QgZmFpbCBpZiBEVCBkZXZpY2UgaXMgbm90IHByb3RlY3RlZCBieSBJT01NVS4gaW9t
bXVfZG9fcGNpX2RvbWN0bA0KZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgYmVjYXVzZSBpb21t
dV9kb19kb21jdGwgZmlyc3QgdHJpZXMNCmlvbW11X2RvX3BjaV9kb21jdGwgKHdoZW4gQ09ORklH
X0hBU19QQ0kpIGFuZCBmYWxscyBiYWNrIHRvDQppb21tdV9kb19kdF9kb21jdGwgb25seSBpZiBQ
Q0kgcmV0dXJucyAtRU5PREVWLg0KDQpUaGUgbmV3IGR0X2RldmljZV9pc19wcm90ZWN0ZWQoKSBi
eXBhc3MgaW4gaW9tbXVfZG9fZHRfZG9tY3RsIG9ubHkNCmFwcGxpZXMgdG8gRFQtZGVzY3JpYmVk
IGRldmljZXM7IFNDSSBwYXJhbWV0ZXJzIGFyZSBjYXJyaWVkIHZpYSBEVA0Kbm9kZXMuIFBDSSBk
ZXZpY2VzIGhhbmRsZWQgYnkgaW9tbXVfZG9fcGNpX2RvbWN0bCBkbyBub3QgY2FycnkgRFQvU0NJ
DQptZXRhZGF0YSBpbiB0aGlzIHBhdGgsIHNvIHRoZXJlIGlzIG5vIG5vdGlvbiBvZiDigJxTQ0kg
cGFyYW1ldGVycyBvbiBhDQpub24tSU9NTVUtcHJvdGVjdGVkIFBDSSBkZXZpY2XigJ0gZm9yIGl0
IHRvIGludGVycHJldCBvciB0byBza2lwLiBUaGUgUENJDQpwYXRoIHNob3VsZCBjb250aW51ZSB0
byByZXBvcnQgZXJyb3JzIGlmIGFzc2lnbm1lbnQgY2Fubm90IGJlIHBlcmZvcm1lZA0KYnkgdGhl
IElPTU1VIGxheWVyLiBTbyB3ZSBzaG91bGQgbGVhdmUgaW9tbXVfZG9fcGNpX2RvbWN0bCB1bmNo
YW5nZWQ7IHRoZQ0KU0NJL0RULXNwZWNpZmljIHJlbGF4YXRpb25zIGJlbG9uZyBvbmx5IGluIHRo
ZSBEVCBwYXRoLiBBbHNvIFNDSSBoYW5kbGluZw0Kb25seSBleGlzdHMgd2hlbiBEVCBpcyBwcmVz
ZW50Lg0KDQpTaWduZWQtb2ZmLWJ5OiBHcnlnb3JpaSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNo
a29AZXBhbS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9t
b2lzaWVpZXZAZXBhbS5jb20+DQotLS0NCg0KQ2hhbmdlcyBpbiB2OToNCi0gdHJlYXQgU0NJIGFz
IGEgZ2F0ZSBmb3IgWEVOX0RPTUNUTF8qYXNzaWduX2RldmljZTogYWJvcnQgYmVmb3JlDQpJT01N
VSBpZiBzY2lfZG9fZG9tY3RsKCkgcmV0dXJucyBhbiBlcnJvciBvdGhlciB0aGFuIC1FTlhJTywg
aW5zdGVhZA0Kb2YgdHJ5aW5nIHRvIHByb3BhZ2F0ZSBTQ0kgZXJyb3JzIGFmdGVyIGEgc3VjY2Vz
c2Z1bCBJT01NVQ0Kb3BlcmF0aW9uLiBUaGlzIGF2b2lkcyBwYXJ0aWFsIHN1Y2Nlc3MgYW5kIHRo
ZSBuZWVkIGZvciBJT01NVSByb2xsYmFjay4NCi0gcmVtb3ZlIGVhcmx5IHJldHVybiBmcm9tIGRv
X2RvbWN0bCgpIGluIHRoZSBhc3NpZ25fZGV2aWNlDQpwYXRoIHRvIGtlZXAgUkNVIGhhbmRsaW5n
IGludGFjdC4NCi0gY2hhbmdlIElTX0VOQUJMRUQoKikgdG8gI2lmZGVmIGluIHNjaV9kb19kb21j
dGwgcXVhcmQNCg0KQ2hhbmdlcyBpbiB2ODoNCi0gY2hlY2sgZm9yIENPTkZJR19BUk1fU0NJIHRv
IGJlIGViYWJsZWQgaW5zdGVhZCBvZiBDT01GSUdfQVJNIGJlZm9yZQ0KY2FsbGluZyBzY2lfZG9f
ZG9tY3RsDQotIHJld29yayBzY2lfZG9fZG9tY3RsIGNhbGwgdG8gYXZvaWQgZXh0cmEgY2hlY2tz
LCBpbXByb3ZlZCBlcnJvcg0KaGFuZGxpbmcuDQotIGRvIG5vdCBwcm9wYWdhdGUgcmV0MSBpZiBz
Y2lfZG9fZG9tY3RsIHJldHVybmVkIHBvc2l0aXZlIHJldA0KLSB1cGRhdGVkIGNvbW1lbnQgaW4g
ZG9tY3RsLmMgY29kZQ0KDQpDaGFuZ2VzIGluIHY3Og0KLSB1cGRhdGUgZG9tY3RsIHRvIGJ1aWxk
IG9uIGJvdGggQXJtIGFuZCB4ODYgcGxhdGZvcm1zDQotIG1vdmUgcmV0MSBkZWNsYXJhdGlvbiB0
byB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBhcyByZXF1aXJlZCBieSBjb2RlDQpzdHlsZQ0KDQpD
aGFuZ2VzIGluIHY2Og0KLSBjaGFuZ2UgaW9tbXVfZG9fZG9tY3RsIGFuZCBzY2lfZG9fZG9tY3Rs
IGNvbW1hbmQgb3JkZXIgYW5kDQpjYWxsIHNjaV9kb19kb21jdGwgZmlyc3Qgd2hpY2ggd2lsbCBw
cm9kdWNlIGNsZWFuZXIgY29kZSBwYXRoLg0KQWxzbyBkcm9wcGVkIGNoYW5naW5nIHJldHVybiBj
b2RlIHdoZW4gaW9tbXUgd2FzIGRpc2FibGVkIGluDQppb21tdV9kb19kb21jdGwuDQoNCkNoYW5n
ZXMgaW4gdjU6DQotIHJldHVybiAtRUlOVkFMIGlmIG1lZGlhdG9yIHdpdGhvdXQgYXNzaWduX2R0
X2RldmljZSB3YXMgcHJvdmlkZWQNCi0gaW52ZXJ0IHJldHVybiBjb2RlIGNoZWNrIGZvciBpb21t
dV9kb19kb21jdGwgaW4NClhFTl9ET01DVExfYXNzaWduX2RldmljZSBkb21jdGwgcHJvY2Vzc2lu
ZyB0byBtYWtlIGNsZWFuZXIgY29kZQ0KLSBjaGFuZ2UgLUVOT1RTVVBQIGVycm9yIGNvZGUgdG8g
LUVOWElPIGluIHNjaV9kb19kb21jdGwNCi0gaGFuZGxlIC1FTlhJTyByZXR1cm4gY29tZGUgb2Yg
aW9tbXVfZG9fZG9tY3RsDQotIGxlYXZlICFkdF9kZXZpY2VfaXNfcHJvdGVjdGVkIGNoZWNrIGlu
IGlvbW11X2RvX2R0X2RvbWN0bCB0byBtYWtlDQpjb2RlIHdvcmsgdGhlIHNhbWUgd2F5IGl0J3Mg
ZG9uZSBpbiAiaGFuZGxlX2RldmljZSIgY2FsbCB3aGlsZQ0KY3JlYXRpbmcgaHdkb20oZG9tMCkg
YW5kICJoYW5kbGVfcGFzc3Rocm91Z2hfcHJvcCIgY2FsbCBmb3IgZG9tMGxlc3MNCmNyZWF0aW9u
DQotIGRyb3AgcmV0dXJuIGNoZWNrIGZyb20gc2NpX2Fzc2lnbl9kdF9kZXZpY2UgY2FsbCBhcyBu
b3QgbmVlZGVkDQotIGRvIG5vdCByZXR1cm4gRUlOVkFMIHdoZW4gYWRkaWduX2R0X2RldmljZSBp
cyBub3Qgc2V0LiBUaGF0IGlzDQpiZWNhdXNlIHRoaXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwgYW5k
IG5vdCBpbXBsZW1lbnRlZCBpbiBzaW5nbGUtYWdlbnQgZHJpdmVyDQoNCiB4ZW4vYXJjaC9hcm0v
ZmlybXdhcmUvc2NpLmMgICAgICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysr
DQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Zpcm13YXJlL3NjaS5oIHwgMTQgKysrKysrKysr
Kw0KIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysr
KysrDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYyAgIHwgIDYgKysrKysN
CiA0IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9maXJtd2FyZS9zY2kuYyBiL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYw0KaW5k
ZXggYWE5M2NkYTdmMC4uYTZjNjQ3YTA5ZCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9maXJt
d2FyZS9zY2kuYw0KKysrIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jDQpAQCAtMTI2LDYg
KzEyNiw0MiBAQCBpbnQgc2NpX2Fzc2lnbl9kdF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IGR0X2RldmljZV9ub2RlICpkZXYpDQogICAgIHJldHVybiAwOw0KIH0NCiANCitpbnQgc2Np
X2RvX2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLA0K
KyAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1
X2RvbWN0bCkNCit7DQorICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2Ow0KKyAgICBpbnQg
cmV0ID0gMDsNCisNCisgICAgc3dpdGNoICggZG9tY3RsLT5jbWQgKQ0KKyAgICB7DQorICAgIGNh
c2UgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlOg0KKyAgICAgICAgcmV0ID0gLUVOWElPOw0KKyAg
ICAgICAgaWYgKCBkb21jdGwtPnUuYXNzaWduX2RldmljZS5kZXYgIT0gWEVOX0RPTUNUTF9ERVZf
RFQgKQ0KKyAgICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgaWYgKCAhY3VyX21lZGlhdG9y
ICkNCisgICAgICAgICAgICBicmVhazsNCisNCisgICAgICAgIGlmICggIWN1cl9tZWRpYXRvci0+
YXNzaWduX2R0X2RldmljZSApDQorICAgICAgICAgICAgYnJlYWs7DQorDQorICAgICAgICByZXQg
PSBkdF9maW5kX25vZGVfYnlfZ3BhdGgoZG9tY3RsLT51LmFzc2lnbl9kZXZpY2UudS5kdC5wYXRo
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbWN0bC0+dS5hc3NpZ25f
ZGV2aWNlLnUuZHQuc2l6ZSwgJmRldik7DQorICAgICAgICBpZiAoIHJldCApDQorICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCisNCisgICAgICAgIHJldCA9IHNjaV9hc3NpZ25fZHRfZGV2aWNlKGQs
IGRldik7DQorDQorICAgICAgICBicmVhazsNCisNCisgICAgZGVmYXVsdDoNCisgICAgICAgIC8q
IGRvIG5vdCBmYWlsIGhlcmUgYXMgY2FsbCBpcyBjaGFpbmVkIHdpdGggaW9tbXUgaGFuZGxpbmcg
Ki8NCisgICAgICAgIGJyZWFrOw0KKyAgICB9DQorDQorICAgIHJldHVybiByZXQ7DQorfQ0KKw0K
IHN0YXRpYyBpbnQgX19pbml0IHNjaV9pbml0KHZvaWQpDQogew0KICAgICBzdHJ1Y3QgZHRfZGV2
aWNlX25vZGUgKm5wOw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXJt
d2FyZS9zY2kuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXJtd2FyZS9zY2kuaA0KaW5k
ZXggMzUwMDIxNmJjMi4uYTJkMzE0ZTYyNyAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9maXJtd2FyZS9zY2kuaA0KKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Zp
cm13YXJlL3NjaS5oDQpAQCAtMTQ2LDYgKzE0NiwxNCBAQCBpbnQgc2NpX2R0X2ZpbmFsaXplKHN0
cnVjdCBkb21haW4gKmQsIHZvaWQgKmZkdCk7DQogICogY29udHJvbCIgZnVuY3Rpb25hbGl0eS4N
CiAgKi8NCiBpbnQgc2NpX2Fzc2lnbl9kdF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IGR0X2RldmljZV9ub2RlICpkZXYpOw0KKw0KKy8qDQorICogU0NJIGRvbWN0bCBoYW5kbGVyDQor
ICoNCisgKiBPbmx5IFhFTl9ET01DVExfYXNzaWduX2RldmljZSBpcyBoYW5kbGVkIGZvciBub3cu
DQorICovDQoraW50IHNjaV9kb19kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3Ry
dWN0IGRvbWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFN
KHhlbl9kb21jdGxfdCkgdV9kb21jdGwpOw0KICNlbHNlDQogDQogc3RhdGljIGlubGluZSBib29s
IHNjaV9kb21haW5faXNfZW5hYmxlZChzdHJ1Y3QgZG9tYWluICpkKQ0KQEAgLTE5NSw2ICsyMDMs
MTIgQEAgc3RhdGljIGlubGluZSBpbnQgc2NpX2Fzc2lnbl9kdF9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwNCiAgICAgcmV0dXJuIDA7DQogfQ0KIA0KK3N0YXRpYyBpbmxpbmUgaW50IHNjaV9kb19k
b21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRvbWFpbiAqZCwNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2Rv
bWN0bF90KSB1X2RvbWN0bCkNCit7DQorICAgIHJldHVybiAwOw0KK30NCisNCiAjZW5kaWYgLyog
Q09ORklHX0FSTV9TQ0kgKi8NCiANCiAjZW5kaWYgLyogX19BU01fQVJNX1NDSV9IICovDQpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCmluZGV4
IDI5YTc3MjZkMzIuLmIzZDEzODExODIgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5j
DQorKysgYi94ZW4vY29tbW9uL2RvbWN0bC5jDQpAQCAtMjksNiArMjksOSBAQA0KICNpbmNsdWRl
IDx4ZW4veHZtYWxsb2MuaD4NCiANCiAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4NCisjaWZkZWYg
Q09ORklHX0FSTQ0KKyNpbmNsdWRlIDxhc20vZmlybXdhcmUvc2NpLmg+DQorI2VuZGlmDQogI2lu
Y2x1ZGUgPGFzbS9pcnEuaD4NCiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4NCiAjaW5jbHVkZSA8YXNt
L3AybS5oPg0KQEAgLTgzMyw2ICs4MzYsMTggQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KICAgICBjYXNlIFhFTl9ET01DVExf
dGVzdF9hc3NpZ25fZGV2aWNlOg0KICAgICBjYXNlIFhFTl9ET01DVExfZGVhc3NpZ25fZGV2aWNl
Og0KICAgICBjYXNlIFhFTl9ET01DVExfZ2V0X2RldmljZV9ncm91cDoNCisgICAgICAgIC8qDQor
ICAgICAgICAgKiBDaGFpbiBTQ0kgRFQgaGFuZGxpbmcgYWhlYWQgb2YgdGhlIElPTU1VIHBhdGgg
c28gYW4gU0NJIG1lZGlhdG9yDQorICAgICAgICAgKiBjYW4gYXV0aG9yaXNlIGFjY2Vzcy1jb250
cm9sbGVkIERUIGRldmljZXMuIFVuaGFuZGxlZCBjYXNlcyByZXBvcnQNCisgICAgICAgICAqIC1F
TlhJTywgd2hpY2ggaXMgaWdub3JlZC4gQW55IG90aGVyIFNDSSBlcnJvciBhYm9ydHMgYmVmb3Jl
IHRoZQ0KKyAgICAgICAgICogSU9NTVUgcGF0aCBydW5zLg0KKyAgICAgICAgICovDQorI2lmZGVm
IENPTkZJR19BUk1fU0NJDQorICAgICAgICByZXQgPSBzY2lfZG9fZG9tY3RsKG9wLCBkLCB1X2Rv
bWN0bCk7DQorICAgICAgICBpZiAoIHJldCA8IDAgJiYgcmV0ICE9IC1FTlhJTyApDQorICAgICAg
ICAgICAgYnJlYWs7DQorI2VuZGlmDQorDQogICAgICAgICByZXQgPSBpb21tdV9kb19kb21jdGwo
b3AsIGQsIHVfZG9tY3RsKTsNCiAgICAgICAgIGJyZWFrOw0KIA0KZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9kZXZpY2VfdHJlZS5jDQppbmRleCBmNTg1MGEyNjA3Li4yOWE0NGRjNzczIDEwMDY0NA0KLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYw0KKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYw0KQEAgLTM3OSw2ICszNzksMTIgQEAgaW50IGlv
bW11X2RvX2R0X2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWlu
ICpkLA0KICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgfQ0KIA0KKyAgICAgICAgaWYgKCAh
ZHRfZGV2aWNlX2lzX3Byb3RlY3RlZChkZXYpICkNCisgICAgICAgIHsNCisgICAgICAgICAgICBy
ZXQgPSAwOw0KKyAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgfQ0KKw0KICAgICAgICAgcmV0
ID0gaW9tbXVfYXNzaWduX2R0X2RldmljZShkLCBkZXYpOw0KIA0KICAgICAgICAgaWYgKCByZXQg
KQ0KLS0gDQoyLjM0LjENCg==

