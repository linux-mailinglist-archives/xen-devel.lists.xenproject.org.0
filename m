Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4CA3D2F6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 09:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893585.1302456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1mJ-0001Dn-0a; Thu, 20 Feb 2025 08:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893585.1302456; Thu, 20 Feb 2025 08:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1mI-0001BE-TM; Thu, 20 Feb 2025 08:19:26 +0000
Received: by outflank-mailman (input) for mailman id 893585;
 Thu, 20 Feb 2025 08:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zogB=VL=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tl1mH-0001B8-7s
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 08:19:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20618.outbound.protection.outlook.com
 [2a01:111:f403:260d::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63ceab68-ef63-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 09:19:23 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6703.eurprd03.prod.outlook.com
 (2603:10a6:102:ec::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 08:19:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8445.023; Thu, 20 Feb 2025
 08:19:20 +0000
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
X-Inumbo-ID: 63ceab68-ef63-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luNDToi290LqrfvrI5sDtfvf6IN/0QWJIHBGKB/PX5sY86WWzhIRSkNagPGAxr5V5KFQLfH36TkyqMyqzruu5P81bYGAL3T18P60HeLm/2TD8FjGtwjrvnRjWSLMnSZc+qeT/JCsG1yJFf8F+mcO1pHxEU6lvnHCm2Nc8M6+TgDarR4ObVUEPDmUyowwktA9zEPMSwrhY6z9If15XkRENCzPQjQVHd7U2emSBSDwg2KZrxzprg1eMCJVBypDQ/eN4hucGZyl0rADsfGqp4uXeNIvlcBup7EQqD7ugWGOGaYrZEG6/hI6Zxc41v0Qz/EdKfuwWwWj/LZVb3Fu1TYiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=494lSa9DU7Cs8y3KZR401Gy6ki5s72DgPD0x5z6wNUY=;
 b=p//g5roXMFuCwjadBr8SCpIL+XxWJLiCkinUERlOWYO1ALyn3lev/57SUUWMBN/JB0NOHHk094lwERRQiO0UrbbHs8RxBWMs+NtfeZ/XZ7oSM1TQhcxXCNcZoTc6lz/4qdqUAuov366WBk1MY1UKkIYuGRvaFhsJQ7Wg3wEJAckSSTSCgx0Pf6uqFGTy8eW1O+K1+rCybrMo13P5FPmsl1fwKVR6h6S+Hrc3+/gX8CsGUQ470QfwZlezHUh0pdCLX6OTd+5VhzS2/M+iVKdsv6cQFpr6a8NWoPkoeybrssEI+Z/kvnODdqVhvT+nf8n4kwla1iF0d5lEj05MbMeXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=494lSa9DU7Cs8y3KZR401Gy6ki5s72DgPD0x5z6wNUY=;
 b=H1ZQsA7NCmE5++wlUEMToWJXNEAMKpjQQ3yXhGeT3DFGjw/MBx66CjeuIiSWQlHfRNOUuoxjpnj8UaWlcWkBGC7FdL6MXLqvHVPNVcdkQsTzki7QNt1gkhZFVreHI6UFsXOs/qo1gfpqsjQ1PIvILR/7NnyXYgYkBdImdMX6S0AjAxPOnk/Zee5BxRkzry1JyJ7VV9JyZvpuKsD3yrF70G7XThbL8TiwerwazqmNTqN6pzkBi2GROsiFVbyv9jwihz0FQdwYl/p5mhl3RwIAq0/tQ1NvcUekuRra34VumBoYL9jeXIET96nXhnkyU5rq2pfp7R9jlIkqdBf6wNOf/g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: shenghui qu <adam.qushenghui@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: Inquiry About PCI Passthrough Development and Testing Patches on
 ARM
Thread-Topic: Inquiry About PCI Passthrough Development and Testing Patches on
 ARM
Thread-Index: AQHbflPk2+BhgzgyhUOKeKiTU37MlbNGoU2AgAlCUYA=
Date: Thu, 20 Feb 2025 08:19:20 +0000
Message-ID: <9c9b7ca8-e09c-4568-b24a-8026da5fd7a5@epam.com>
References:
 <CAHfJC1=gH7tm3V922+5Nqz76mB_iSeiTjU1rwKAVOzaj6B9LJw@mail.gmail.com>
 <alpine.DEB.2.22.394.2502131211100.619090@ubuntu-linux-20-04-desktop>
 <CAHfJC1mW7UXeuSyRFB6TpJctS8g5wgX35FnAa3D0jaB1NhW2dA@mail.gmail.com>
In-Reply-To:
 <CAHfJC1mW7UXeuSyRFB6TpJctS8g5wgX35FnAa3D0jaB1NhW2dA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6703:EE_
x-ms-office365-filtering-correlation-id: 0c4ed9d3-33a0-4615-6aa0-08dd518746c2
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|3613699012;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3E4ZFY5RkRsOW9QbE9LWDlMa1d0Y3U0WU9qd2VwRU8yM2ZVTTdaalBpdERO?=
 =?utf-8?B?MFlodHZMTG52a0pqZ0gxS2pPc1pFOE83VE43RW1hc2Vnc3BQSjd3cW5sUzNJ?=
 =?utf-8?B?N2x3ajN1YWtHcGVJQjc5aFp0eVcydm5yQVowaTQyaUJGWUo5aDAzN3JMTFFp?=
 =?utf-8?B?MVl4eDc3amJvcCtGbTVscjdRaE5aZDl4dXhWSGcvdzZ3QmVxSW1XbEI0S0Nj?=
 =?utf-8?B?dnpaNnRBVFN4VXFDc1JlVlNjZFNHR3FXeVBNZ1NxSjJDUTNHbnFpY29ZU0tr?=
 =?utf-8?B?QjQ0ZVlkL3Bsd2hlMFpacTZSZkg1eDdBQlVPeE1UY21XS0Nxdko4dmQ4NmE0?=
 =?utf-8?B?NmtndG5iK0ZQSUVlSWUrWlFyeVprbTkwNStUVHZmRTBzaTRjL3JMQkNqYjhl?=
 =?utf-8?B?ZVZYSGxNamJwTWg2djZHazMrMWxrQ1Bla0E2aENhaDluS3BMQ1VZZUtONU02?=
 =?utf-8?B?RTNSNURYTE1KSklYYkx0ZVY3VUVhU0xuclFUM1NEb01jOEl2eGM4YXB0ZzIy?=
 =?utf-8?B?U1JvQVIvN1FsZ3R4NzdnaTVqb2JBVHkrL3IrRExmekJXbUlmQm9raVJqVERl?=
 =?utf-8?B?elkyVkVON3NyMTFEWUZyT20xL0k2ZWZ0bEZLZXdGSW91Vk5XWnFRUkg5aXFv?=
 =?utf-8?B?WDFqampSK1lyTjBjekZUKzdkYmhabEI2S0t2aWNHaXU0elRSaXVGTEh1bSto?=
 =?utf-8?B?eVVRcE9ldC9iQWNWOGNEMTdsSGlISE9VN1dXS0MzcDBYSkRkM1lUTlNTUXNH?=
 =?utf-8?B?T3NmNUx4WUxPMEUwMi82ZGZmbHdUT1B5RE85VkFHNVFKb0JSdEhTMUlQS3FU?=
 =?utf-8?B?THI4NjhMOG81eVM1OElYdytSZHpWOFFTS2ZmQnc5TzRHUFNPV3pOZUNubkI2?=
 =?utf-8?B?RGFGS0tLSVpXVkpHSk96Y2pabEIwczd1SytYcFBtMmxZZm9OMUhzMEtSeURt?=
 =?utf-8?B?anhPWktLcDJuN1dIZHNQWHV2OC80RThrU0VsTEk5ZmIvc0FobXNuVDJzSnNG?=
 =?utf-8?B?TnhUYnkvbU9TemwvSmJETHB1dFhqRG1sRlMrd1R2aUJsMG10emtsWXlWdHZk?=
 =?utf-8?B?UnVGOGVGald3K0t1LzlNQXBkRDNKTzdZb0Rkd0NiY3QxcXBlSEJIcnZWNG5p?=
 =?utf-8?B?cEg3dGZOakxlMWtFdFM4ZmJUT2ZMN0RCcVJHVHJQamF6SkYzazk5SlRjNmls?=
 =?utf-8?B?OU0yTjI5Sjg4MjdiRHV0SXNIc3AxS2JlQlNYRzlzcTZFRlF6aDVhM0M0bDFp?=
 =?utf-8?B?UDJOc1VzdCtZcUxoKzkyTml4TTVSSEZZUTVheEx5YW44aE9WK1pxV0w0emFy?=
 =?utf-8?B?Vi9FdXBYRGpmbHMwZWx4Y0trVk1qMlZtbGVJTEhaQTV6MVEzOEt2eHhFOUh0?=
 =?utf-8?B?OHdXZm5QY3RQb0JOTy91WStwckF1VXAwY1Avb055ZitZV2xtbGo0UlJBUUtH?=
 =?utf-8?B?dFl1VGk3dUl2VmIrTWRnVHNnbEIwUmh2bW8xdVRUU1FrazhaM2ZnK2NITmwx?=
 =?utf-8?B?d3pGaTBodEM2eEtBeDhPVlhCOFEwQmpvelh2VFlNeDZHL1hKd0NmTnBnMmtn?=
 =?utf-8?B?NWcwWHJXWVJub3hGZ1N3TzkwbnBWeklnbWIvSG1NZ3ZGdSs3eTl5Slorazl0?=
 =?utf-8?B?Sm1qTzlKOFd6Yy82dnVnbjBWZ2MzN3JvdnRyQlNHMXFCY0tJV1p1d2RsVTdY?=
 =?utf-8?B?U0N1OEdObFlTYmhJa0xJZzAzQnRyREJrajA1UHpobE9VVjRoWktuaFQyOFBY?=
 =?utf-8?B?andmdjZCaHRQT2NmdG4ySTNjUXhsZEJIcFR2d1RpaE1YU1dSVjg0N3lJOW04?=
 =?utf-8?B?U09UOFpOeWFsNkZTSmRsK1ZFejl1aGErdjk2aTloUG83Qit5RVBiNWdQcnRt?=
 =?utf-8?B?VUNPRmEwbit1eEpnei80YVVWQUJ1cm5heEE3RVlwcGh2Wkx5YkJlR2dDSVUr?=
 =?utf-8?Q?4cgAh81DS8Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(3613699012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2h0TnAyUHhCL3c4MWJzbGtHR1cxWmJZQ3hlbnZycC85NkZGaUpzTUJ4QlJr?=
 =?utf-8?B?WUZ5L2RMY1E4UkVEU1BOOGhqWHZIOWJIcE9LNFRGa2ovaUdzUjhGM1dNZnhZ?=
 =?utf-8?B?dFVWNzFNdHFHYzN5UStxaEljZUdBUmlQdlozWjVVUjh1Vm9aTGh5UlZGTkRD?=
 =?utf-8?B?Sm9pY01wRnVvWFJQYythYjB0Ri94S1BlelFiWDNXUTNoblJMbGtZcEVCdkww?=
 =?utf-8?B?QzlVL1J6eWZZRW5UODRQa1NjdFJEWWN0cy9ZMTloN3Z4VHlNSFhZNS9YS3FD?=
 =?utf-8?B?ZFNWSXZjTTZwTzFhZG9nclQ3b25JeU5tUnJRMzBHbDVSNDIzYWhaU2h0cjVl?=
 =?utf-8?B?Y0grd2tnaElxOWd4R3l1ZU9JdWtrcVI4WUJVVXg0YjBENm0wOW1KRVhVSC9O?=
 =?utf-8?B?RkVENktuQWhRQ0ZCekFkK1BHcUJmNlRudWF1QVJSZ2lxU0gwOC8yQTZCYnow?=
 =?utf-8?B?T3BtTTFQcUluWDVBSXZPVWhYUklPWkttNHViM2hxbUtOejVEMW91Tm50YjFQ?=
 =?utf-8?B?eEx5S2x4MjlyVyt4MmFNV1VtOXlDVWZWaUJKQXorMmh3UFNNMjM2enZtWVZR?=
 =?utf-8?B?M1pQNll6ZVdJeTk1djUvNXYzL1R6WjIybVRBWk5xaXEvOU1lM0pmYzB6aVpt?=
 =?utf-8?B?dmttMUNLK3VNTnUybkxnMXNqTFZWRGdURVJCNnBIWitLZFJHVk0xT2ZFV2NQ?=
 =?utf-8?B?ODgvemhTckp0VWRndUx3c0d5VkVoOWtCNEtBMEYzTUpYQ2dDV2VseHozUjY3?=
 =?utf-8?B?Y2ZaNzlTR0ttc28vN2VVUm5RR2xpd2wzQjVGNGpKRDNMeWdDWUVYYWRkSG9D?=
 =?utf-8?B?RnpJUnRuNUkrSlhhMGNtRlBILzk2eCs1SmdoamNDUW9YRDZqYldqL1R3V1ZL?=
 =?utf-8?B?eEgrTFZabUwwSG0xWXlSeno1UHdkVTNKUDVZTGNDQWpoTTZ4ZC9Tc2kvdDQz?=
 =?utf-8?B?SU1jNlIxT2xER3FmRnlPMWtaY05RQi9GTUMrcDk0Q0tEOVZJN1R4cmZZelFO?=
 =?utf-8?B?UGVQME9ZMmpLOEhNb3JIUHFZTU5NSlB5Z2ZOTkF4NkV5QkgwQ0dkVnFGeEMr?=
 =?utf-8?B?NktxT25JeXplVWJWZWhsdHJkd2pPZHdLTkcrb1BBVldQQ3FEWGF4L3BUQ2ZJ?=
 =?utf-8?B?SlZRMHluZ1hCZCtxRjVGUnp3c0ZwMm9LZVZrMWFMSTR2blVNMkJUVkJaV2pm?=
 =?utf-8?B?cFl2VHdNNE1XdjF5a2laQmtYSlQ3VDlXeDNpbjRnYW84UDRoMHhmajN5WlRR?=
 =?utf-8?B?SmtiS0NENHhTejlOdzZyOEMyejJ6dnBkdzFkNmtocW02OU10NGVIRmlPMDlS?=
 =?utf-8?B?K01NRmppRG1SN3NuUHNYaUIxTjZkVmVHZzgwajJ5azVqZStFVWplc0xMQktv?=
 =?utf-8?B?WHhQV0dNUm1HSFpVcjFYVWdBL0R1UVMzU09nQ25JSmdOU3p1Z04zdkVkcDBQ?=
 =?utf-8?B?WlJERTkzaGprdm5XcGFkVlRRYmMwd1RIMmU0WlFmNWpjVHZDSWRKQTZxS25X?=
 =?utf-8?B?bjQwdVNoV1J4OUh3K2FKdDg0d0R6MExYcmZkRXlFQktIanVrNlZOdFA5cENI?=
 =?utf-8?B?cHNta2M3VnNXeVZYOWFocjZBUUEzdE5xcE8zM21aUXdYOUdjMXNnVGhPemhQ?=
 =?utf-8?B?aXZiS3MraEJwK21hQWJxNUtFVHVNU2JWY2NnT05XamxGa2xXVUt0QStVcUtS?=
 =?utf-8?B?NlBLeWsrWUQzSUVMVS9kRTI5K0N6TkNlSG1zQWFpUHJiKyttajNVRFZRVTJj?=
 =?utf-8?B?MFZwMkR4aUNsbTBtY1dER3FxNFYrSW1NaXNMdE10Nm9lU1hMNW9Rb2Y2OVZq?=
 =?utf-8?B?OUdWeEtTYW1NbEtkZmtxZUhCT2hXNG4vaXFvR3V6SGczOEhqejk4Z1Vua25a?=
 =?utf-8?B?a1BSREQ3amgvUFlMTDVnL2s5a2o4UWJsMXg4NUxNZmNyZHpFVHB6alQ0U1N4?=
 =?utf-8?B?bDlWTFE5Tk01cm9VODdyV2UxbEdidGhzNXhsQ083V0ZmV0ZXVFBhNFJwZkdU?=
 =?utf-8?B?WDg5Ylp5RHhwR2xNNzBGNXhrUWF3SnkxN2FsRDF2bm9McGR3SFN5WkdqTjQv?=
 =?utf-8?B?RzQxdlJIaURrbVJrdFU3Q21VOTFTZS9iMFJzT3JyTVlRY29GekVRTkFIR25h?=
 =?utf-8?B?cEFqcFRiRFpjaHpCV2tPOGR6a3ptc29tZVQ2WThqdm5VODRsT2J4dHd0dnJt?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2411237DFC699B42911BAFFBABDB59F6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4ed9d3-33a0-4615-6aa0-08dd518746c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 08:19:20.5926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CufCguMDklVtn71tWnMuxDBzVLuhQTsyZEk4LH3PkBufVuhdIkR06SuMNEPnEEdOFsuqUGUVrIzX05W0wQHow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6703

SGkgU2hlbmdodWksDQpJIGhhdmUgc29tZXdoYXQgdGFrZW4gb3ZlciB0aGUgdXBzdHJlYW1pbmcg
ZWZmb3J0IGZvciBub3csIGhlcmUgaXMgb3VyIHBsYW46DQotIDIwMjUgUTENCgkxLiBTZW5kICJ4
ZW4vYXJtOiBwbGF0Zm9ybTogQWRkIHN1cHBvcnQgZm9yIFItQ2FyIEdlbjQiIC0gRG9uZQ0KCTIu
IFJldml2ZSAiU01NVSBoYW5kbGluZyBmb3IgUENJZSBQYXNzdGhyb3VnaCBvbiBBUk0iIC0gRG9u
ZQ0KCTMuIFNlbmQgIkFkZCBzdXBwb3J0IGZvciBSLUNhciBHZW40IFBDSUUgSG9zdCINCgk0LiBS
ZXZpdmUgIlBDSSBkZXZpY2VzIHBhc3N0aHJvdWdoIG9uIEFybSwgcGFydCAzIg0KLSAyMDI1IFEy
DQoJMS4gU2VuZCAiSVBNTVUgaGFuZGxpbmcgZm9yIFBDSWUgUGFzc3Rocm91Z2giDQoJMi4gU2Vu
ZCAiRW5hYmxlIHRoZSBleGlzdGluZyBNU0ktWCBhbmQgTVNJIGhhbmRsZXJzIHN1cHBvcnQgZm9y
IEFSTSINCgkzLiBSZXZpdmXCoCAiS2NvbmZpZyBmb3IgUENJIHBhc3N0aHJvdWdoIG9uIEFSTSIN
Cgk0LiBTZW5kICJQQ0kgZGV2aWNlcyBwYXNzdGhyb3VnaCBvbiBBcm0sIHBhcnQgNChwY2kgc2Nh
biBzdXBwb3J0KSINCg0KUGxlYXNlIG5vdGUgdGhhdCBtb3N0IFEyIHBhdGNoZXMgZGVwZW5kIG9u
IFExIHBhdGNoZXMgaW4gc29tZSB3YXksIHNvIGl0IA0KbWF5IHJlcXVpcmUgd2FpdGluZyBzb21l
IG1vcmUgdGltZSBpZiB0aGUgcmV2aWV3IHByb2Nlc3MgdGFrZXMgYSBsb25nIHRpbWUuDQoNClRo
ZXJlIGFyZSBkb3duc3RyZWFtIFdJUCBicmFuY2hlcyANCmh0dHBzOi8vZ2l0aHViLmNvbS9EZWVk
b25lL3hlbi90cmVlL3BjaV9wYXNzdGhyb3VnaF93aXAgKGJhc2VkIG9uIA0KNC4yMC1yYzMpLCAN
Cmh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYm1hcnF1aXMveGVuLWFybS1w
b2MvLS9jb21taXRzL3BvYy9wY2ktcGFzc3Rocm91Z2ggDQooYmFzZWQgb24gNC4xNy11bnN0YWJs
ZSkgdGhhdCBjdXJyZW50bHkgaGF2ZSBQQ0kgcGFzc3Rocm91Z2ggd29ya2luZyBvbiANCkFybSwg
YnV0IG9uIHVwc3RyZWFtIGl0IGlzIG5vdCB5ZXQgZnVuY3Rpb25hbC4gVGhlcmUgaXMgYWxzbyB3
b3JrIGRvbmUgDQpvbiBtb3ZpbmcgUENJIGhvc3QgZnJvbSBoYXJkd2FyZSBkb21haW4gdG8gYSBz
ZXBhcmF0ZSBkcml2ZXIgZG9tYWluLCBidXQgDQppdCBpcyB2ZXJ5IFdJUCBhbmQgbm90IHlldCBy
ZWFkeSB0byBiZSB1cHN0cmVhbWVkLg0KDQotLSANCk15a3l0YQ0KDQpPbiAxNC4wMi4yNSAxMjo1
NSwgc2hlbmdodWkgcXUgd3JvdGU6DQo+IERlYXIgU3Rld2FydA0KPiANCj4gVGhhbmsgeW91IGZv
ciBiZWluZyBsb29wZWQgaW50byB0aGlzIGRpc2N1c3Npb24uDQo+IEZvbGxvd2luZyBTdGVmYW5v
4oCZcyBndWlkYW5jZSwgSeKAmWQgbGlrZSB0byBzZWVrIGZ1cnRoZXIgY2xhcml0eSBvbiB0aGUg
DQo+IGN1cnJlbnQgZGV2ZWxvcG1lbnQgb2YgUENJIFBhc3N0aHJvdWdoIHN1cHBvcnQgZm9yIFhl
bi9BUk0uDQo+IFNwZWNpZmljYWxseSwgSSBoYXZlIHR3byBxdWVzdGlvbnM6DQo+IDEuUm9hZG1h
cDogQXJlIHRoZXJlIGNsZWFyIG1pbGVzdG9uZXMgb3IgYSB0aW1lbGluZSBmb3IgY29tcGxldGlu
ZyBQQ0kgDQo+IFBhc3N0aHJvdWdoIHN1cHBvcnQgb24gQVJNPyBGb3IgaW5zdGFuY2UsIGlzIHRo
aXMgZmVhdHVyZSB0YXJnZXRlZCBmb3IgDQo+IGluY2x1c2lvbiBpbiBYZW4gNC4yMCBvciBsYXRl
ciByZWxlYXNlc++8nw0KPiAyLkN1cnJlbnQgU3RhdHVzOiBDb3VsZCB5b3UgZWxhYm9yYXRlIG9u
IHRoZSB0ZWNobmljYWwgcHJvZ3Jlc3Mgc28gZmFyPw0KPiANCj4gTG9va2luZyBmb3J3YXJkIHRv
IHlvdXIgaW5zaWdodHMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFNoZW5naHVpIFF1DQo+IA0K
PiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcgDQo+IDxtYWlsdG86
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4+IOS6jjIwMjXlubQy5pyIMTTml6XlkajkupQgMDQ6MTTl
hpnpgZPvvJoNCj4gDQo+ICAgICBIaSBTaGVuZ2h1aSwNCj4gDQo+ICAgICBUaGFuayB5b3UgZm9y
IHlvdXIgaW50ZXJlc3QgaW4gWGVuISBMZXQgbWUgYWRkIFN0ZXdhcnQsIHdobyBjYW4gcHJvdmlk
ZQ0KPiAgICAgeW91IHdpdGggYW4gb3ZlcnZpZXcgb2YgdGhlIGxhdGVzdCBzdGF0dXMgb2YgUENJ
IFBhc3N0aHJvdWdoIG9uIEFSTS4NCj4gDQo+ICAgICBBbW9uZyB0aGUgdmFyaW91cyBpdGVtcyBp
biBwcm9ncmVzcywgSSB3b3VsZCBsaWtlIHRvIGhpZ2hsaWdodCB0aGlzDQo+ICAgICBzZXJpZXMg
ZnJvbSBNeWt5dGEsIHdoaWNoIGlzIGN1cnJlbnRseSB1bmRlciByZXZpZXc6DQo+IA0KPiAgICAg
aHR0cHM6Ly9tYXJjLmluZm8vP2w9eGVuLWRldmVsJm09MTczOTE4MzE4ODMxMjgxDQo+IA0KPiAg
ICAgQ2hlZXJzLA0KPiANCj4gICAgIFN0ZWZhbm8NCj4gDQo+ICAgICBPbiBUaHUsIDEzIEZlYiAy
MDI1LCBzaGVuZ2h1aSBxdSB3cm90ZToNCj4gICAgICA+IERlYXIgTWFpbnRhaW5lcnMsDQo+ICAg
ICAgPg0KPiAgICAgID4gSSBob3BlIHRoaXMgZW1haWwgZmluZHMgeW91IHdlbGwuDQo+ICAgICAg
Pg0KPiAgICAgID4gSSByZWNlbnRseSBjYW1lIGFjcm9zcyB0aGUgWGVuIFByb2plY3QgNC4xOSBG
ZWF0dXJlIExpc3QsIHdoaWNoDQo+ICAgICBtZW50aW9ucyB0aGF0IFBDSSBwYXNzdGhyb3VnaCB3
b3JrIG9uIEFSTSBpcyBvbmdvaW5nLCBpbmNsdWRpbmcgc29tZQ0KPiAgICAgID4gcmVmYWN0b3Jp
bmcgYW5kIGltcHJvdmVtZW50cyBvZiB0aGUgZXhpc3RpbmcgY29kZS4gSXQgYWxzbyBzdGF0ZXMN
Cj4gICAgIHRoYXQgdGhpcyB3b3JrIHdpbGwgYmUgaW5jbHVkZWQgaW4gdGhlIG5leHQgZmV3IHJl
bGVhc2VzLg0KPiAgICAgID4gSSBhbSB2ZXJ5IGludGVyZXN0ZWQgaW4gdGhlIGN1cnJlbnQgZGV2
ZWxvcG1lbnQgcGxhbiBhbmQgcHJvZ3Jlc3MNCj4gICAgIG9mIFBDSSBwYXNzdGhyb3VnaCBvbiBB
Uk0uIENvdWxkIHlvdSBraW5kbHkgcHJvdmlkZSBhbiB1cGRhdGUgb24gdGhpcz8NCj4gICAgICA+
DQo+ICAgICAgPiBBZGRpdGlvbmFsbHksIEkgd291bGQgbGlrZSB0byBrbm93IGhvdyBJIGNhbiBh
Y2Nlc3MgYW55IGF2YWlsYWJsZQ0KPiAgICAgdGVzdGluZyBwYXRjaGVzIHJlbGF0ZWQgdG8gdGhp
cyB3b3JrLg0KPiAgICAgID4NCj4gICAgICA+IEkgYXBwcmVjaWF0ZSB5b3VyIHRpbWUgYW5kIGVm
Zm9ydCBpbiBtYWludGFpbmluZyBhbmQgaW1wcm92aW5nDQo+ICAgICB0aGUgWGVuIFByb2plY3Qu
IExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHJlc3BvbnNlLg0KPiAgICAgID4NCj4gICAgICA+IEJl
c3QgcmVnYXJkcyxTaGVuZ2h1aSBRdQ0KPiAgICAgID4NCj4gICAgICA+IA0K

