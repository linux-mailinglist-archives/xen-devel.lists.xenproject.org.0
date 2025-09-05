Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982AB45416
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111579.1460228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKB-0007Wx-HJ; Fri, 05 Sep 2025 10:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111579.1460228; Fri, 05 Sep 2025 10:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKB-0007UO-E2; Fri, 05 Sep 2025 10:05:43 +0000
Received: by outflank-mailman (input) for mailman id 1111579;
 Fri, 05 Sep 2025 10:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bvvL=3Q=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuTKA-0007UC-7P
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:05:42 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de61d3f4-8a3f-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 12:05:37 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PA4PR03MB8295.eurprd03.prod.outlook.com (2603:10a6:102:260::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 10:05:33 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 10:05:33 +0000
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
X-Inumbo-ID: de61d3f4-8a3f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPPymxeUQLhU6h7Au1yUzCnjdfxamn9tHtSrgag7Sgulz/lhVQqXfeYMC1WmvSapqdWOMMvfrkRlJ75xNS/u4jGaCBjUOSf9s7IPCytINofk3d7Q0Pz/8xrgdMcAvTq2q2mdIl4IcWMjpD0cpN5LisUs7+N+qUYub6qkIxRAp57DtKpeSXAgmHWYb+LvbBFgXRkwpOkjVTXFCwJ6VMT+vFeqbNGFCsZbCMWbK0W1BPud+4g9qt6/zA5/DnBsWTYHufsmZS5U4SD7mzf6MBJrhKS8BeicCkViTBu8pU1LmgmR2/ITt1ivNO2NWBaIjF/Z2Kif0KwxPYBjwdmvUWq7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdungOsxOzp7BSzikz/ChkxnYS9pubO+hZKQjxzrfWc=;
 b=hbsJisVAfCKHTADzzI7Bum1+dGo9tfGtThi4sMxbt5xk1bpWAWgpUzJZlVzNM8rPcbP2Ea1kimj+tf30CLKSHNB5Dt+skN3Zz/dAIGkgYcZ+H0S3VC9XLR21qunyS7phGxoiH9LS4BL/n//PCPbT3k6nVA9WBOhWIlQy2WxhibDarEecPlDjxtLhXwkUtkub3r2Ps3F85GIaET1qdK6q4IuaSR1nUnQZ2zH1idYSR1A7Q6D8w+DANYay0syh5KOMs9pPf9/PK6hbMH48tozE7dBLqAZgqrA/Z8QyY0Hvi1XUNt37E9urzJ5C0lRxLcVPSId3VTUStOixRdsaEl3RYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdungOsxOzp7BSzikz/ChkxnYS9pubO+hZKQjxzrfWc=;
 b=Jrl6n6TM1n3aUg48zZ2Mx/PeKzkulxc/aQXs/KT8CdwOxIDVLPDqhqBboG68c7ZP55oJsYknLDdtzNIKHJlz9HqLwCbmA971jNfMhM6wOjNYsB8+Y0IkPPzEmIVc2FxaiSkW6pPqsF/o5HbtMtEExA8fxzBJBIud66EUFQKj9ts3YNIxWn6RaYNTDT5L88XRd0Kzpo/R6XMQrh680m+PVEemIhxnWGseJXInqdZA7kXWi+3yadjl5/g41zsj92PqJzn3e/a/A+b/wuahTxtLeDoJouAZU0x7pKEpz4K2dS3D3T9rXL2XmM/Nl04CYtZAP5CwByz2lgkY0qmdpOcFcg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcHdaxzH0gJHOWB0uscg50WGUPx7SELLEAgAAw3YA=
Date: Fri, 5 Sep 2025 10:05:33 +0000
Message-ID: <00bfaf5c-c502-4792-a426-015f72dfc2db@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
 <3a487f5c-0837-46b4-ad17-410a4a4bc78a@xen.org>
In-Reply-To: <3a487f5c-0837-46b4-ad17-410a4a4bc78a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PA4PR03MB8295:EE_
x-ms-office365-filtering-correlation-id: 3b216163-e876-41a7-1f7d-08ddec63c0ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MU5zZnI5RDNXV0RBWHVUZGlUL2lFZEFaR29GOHFiVy8rOTBzSTJxOVFpK1lC?=
 =?utf-8?B?cmFBWmF5WjBiR21BL09ZZnR6ZTlCMWZ4ajczZW9ER2pSay9xMk4wMDdhQ3ZV?=
 =?utf-8?B?bWdDdkh2YUMwY2RSbEp0SkFxY3dqY0N3eVdWRFFCWldLQ0FBVXBJQmtrQnV2?=
 =?utf-8?B?Znp1NyswTHp2elMvT1BqY1ZWQUhFeGloQXF5NklNQklVbSsxTDRKZmpaOFRE?=
 =?utf-8?B?empKMkVNMGkzOTNUamlLamliMnB3SGdwcmlTZXdvdGZZc2h0YVhpUk1Mak9a?=
 =?utf-8?B?L3RtejRCODdhSUp3eHFNaHI1U1ZiZFNyeDZ2TTlra1ZldHpWL3R4bU1SWCtQ?=
 =?utf-8?B?cmJqRkNIdGg4aEpwdk82OUp0eU9QMms5K2tRVUVwUUVDcC9YSGpUaTRUTzUv?=
 =?utf-8?B?dVk4dElQUk1hc2IzYTJEdmRKTTdSay96RmlVMW9zYlcxa1B2K1gxK0VOK2Z2?=
 =?utf-8?B?VlBEVE03eFpVazRCSGZXbHM1VHBETFExQWNoQUVkeTZVeDZHcnFjMWhRWktQ?=
 =?utf-8?B?UHVxV1VEa0xpa0dRenRZNVRMK2FMdmRpaTVHamJaZkIwbWhRMnB5b3krdVI2?=
 =?utf-8?B?a0dtOEFjMFg1elRBQUc2cTVoRUhDMURhZTk1MU0wLyt0U3dRN3hTSU5YQjNR?=
 =?utf-8?B?TXdjdnBXZGdJYjB5cXE2djB6djdxblJqb0Y3Q01GM2hwRnJ6dDN1TWdjVU9Q?=
 =?utf-8?B?THo1YnlFSldNYWNaeEljLzU0cmYxM2habXlMWDBpNkY4c0RsdHdHc0grNnU4?=
 =?utf-8?B?ckRyK2RpamhFcTBVME5sL1Q4L3RhUHJSckVmbHBzbGQ1Q3hXc3dMdVdDVDhO?=
 =?utf-8?B?R2xzcXJ5NUFRdWI2MldsTzdoUUlyTFB0Vk9QYUIyNjhzbk5RUVRhaThLZVFM?=
 =?utf-8?B?MXRoT2lFVkpFenR0ZGNCb3NhNDJRWmtkM3p6dlEwVVptbTRHbzl2dnk1cCtp?=
 =?utf-8?B?TTRmNXZHMUphQW1hZzM3L0pxZElzZVIrWWZlakd4dzdNM0UvYjNCTWp6SGRi?=
 =?utf-8?B?R2hiNVZ3MXdGa0xNalRHQmJOZGVYbXRLR2VXZGFNZTl3V09rLzR2aGN1TFg3?=
 =?utf-8?B?OFNER2twN1R3ZFhzUGszT25QbEV3Uy9TOEJsMkdvbCtTOHhqV2dQWUJod0RT?=
 =?utf-8?B?YTNXbm9IN3llbDU2WTlaamtVNkxGVlFnUkxFR3l4TFkwaXIyOFhBaER6MFdJ?=
 =?utf-8?B?TC9OL3EvUUltRm45NFdDNks0blhoYkpvN2ZkbnF3SVFzMmFPNnovUWU1UDBC?=
 =?utf-8?B?WTVrTjNUNlE5NU1sTXdJTFY4TklPV0cwNWVNcDltMVpFMFhkODZoMU1nMS9I?=
 =?utf-8?B?UUN1dWZOWmoyOWRqa05qdm03bjRUcys5azVLcHdOSElHYjljYm1XWFFPNnVO?=
 =?utf-8?B?MmFjdmJEREhsZWFPVE91bEFYMmxsWUVGMTlhQVJ1WkVQWU12cXVGZXVzWGZJ?=
 =?utf-8?B?VmVSa1Z1WnlOcVRZajFpV3ArdFcwajJxVXh1SjRhRXpxRStqaW1JNy95MnhN?=
 =?utf-8?B?TUtnRitlWCt1SjNMbnJhWGJMKzRpNGhJRWgvYnBiQnNDTmdQbUg5Vld3Uysr?=
 =?utf-8?B?MnBiT01mWHVzQ3QyaXBrdmE1dDd5cU4wa01FblZHS2xSN053MnlzS2M1Qytz?=
 =?utf-8?B?NE1RT2xkMkxlN3VRaWZxTUdsa3JaVkV1WDYxczdoR1pYZVRaM3VkMVZ6STZk?=
 =?utf-8?B?L2NZUlRWSWNKNHRSbXRuUFF0OHdSMnFrVWtnamgwdzVKRHF5Z3ZIemdGMFB0?=
 =?utf-8?B?NmhXNk91SW5DbTNoN1Z5blc5OHVMbmpUbjQxOWVEWDBpU0E1RW1rL2labW1M?=
 =?utf-8?B?emRZcDkwQzJGZllqUjl4VXhHTnBpZE91bmtrWU5JTDZrNzFoaUdHMlZzeTUr?=
 =?utf-8?B?UEhPdXpxRFBGYmcwT2ZJaE9VcmNUSWlSeXluTDNGM1RYaEx0RXd5NlFmSU9w?=
 =?utf-8?B?bmtVaWdkL1BLRDUwenY3UFBoalhnY1R6ckV5RWwvc2FqSmtGQUhsZUxuZ09O?=
 =?utf-8?B?LzFFZlNOMXhnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3FZN1dDYm1peVJ6WmhGQUUzaGJ6WGtqTlUyZ1JlRWxFV3VuK2tFZ1NUaVZq?=
 =?utf-8?B?ZlRMRFg3UkhnZ08wNFk5Z2piYTMzbTdBT0VTL2lPMG9YL3VXVTg1TUhvUkx1?=
 =?utf-8?B?ckZGNW5yYXVvWjhNaWg1K0RmUTNLMkM0ZlI5VHp0UEZvSlNMQXV1UkpFaFNS?=
 =?utf-8?B?VENJNnZ3ZWVLTTF2QWRuUkJacTdkYWNmUm5ZY1dsSXp2dHB2b0hsdzkxU3Vz?=
 =?utf-8?B?bjVwR2FhVUdQOVVsYmlRV1BYWGs0Q2cwRy9iOUdMdWZsRzBQem8xMXB2UXRY?=
 =?utf-8?B?allaeHdvcXdEQzRhdUlFWEEyVENyZjErQUZ0MG56VEpneXBJSEEzcTFodVp1?=
 =?utf-8?B?aUl4R2N1OE0xNjZXREsvalZzUncweHlFU3A5NnRwUW5HMFZQa0lyT2FwcHFu?=
 =?utf-8?B?YVM3MWZCMmt2d0NlWjJNdHFBdk9HOVpBTTNRV2drR2Z3UUorbERrQzNRUmM3?=
 =?utf-8?B?MTJNaC9EUUFpMUVKUWpIbzMvMXM5ZDdOb3poNTBwS3dzSUU5cy9wQ1BVc00y?=
 =?utf-8?B?Sm5kdnErU1Y4N1k5QjJCYjlQdlNjZ3c5bjVzSTc4WjdMNWs2b3QxZU5FQW90?=
 =?utf-8?B?cEZWZE5PRkxaVzR5YlZLTGdpK3JKUm5uelBzbWRWS085cTF1N3REQjlKclVV?=
 =?utf-8?B?dGdJYXNYeU5hbStwdWxNVTJXaEt2QytUS0ZiamJNTUgwUU9OTnRHa1g3OE0v?=
 =?utf-8?B?ZHZMZXhJU2U1TEFPWDU0a0dxQzhDM0Y5Y1NnY3BMd2IrbTJDa3BmTmJqL0k0?=
 =?utf-8?B?RXVrQTE3dUJFNGg3U0FudzJkeVhPY0M0NWFYaHl3R3RCVXY3MHNpNUhyUVUz?=
 =?utf-8?B?YnN0UjE3Z2RTVTR4T0hyTFFJMnFiam1aSGJ4c3Vuc0MyOTk3TjRNYWV3T0pu?=
 =?utf-8?B?aHAxS2dXaTd4UXFIOEZMRS9YaUtjMHNRNjdOYXU2U0JMbkdxcVZKbVpCWlZF?=
 =?utf-8?B?NjV5YXJCNWJXRHpINFFnZjlLR29GanVweisxTEZSYTg5UEFSeFk0OHQrakpV?=
 =?utf-8?B?aXBwYXA1TFlXejlDb05hMVMzRVowejVxMUFybzYwd1dBWjROQktUR0FRaDNL?=
 =?utf-8?B?TnVlREJTMEpLTUltU0htOVYralEwbTRhLzlqdU44V1pUbkRNUVN5RFd1cnhX?=
 =?utf-8?B?cmRVK1NJNGdRWWdFNDFieHVDTkNUTW90STM1R1lNcUJRcVhFc3JBd2tudXVu?=
 =?utf-8?B?c3Vhbks4U0VzUDNMZG9wRzQxUkl4OEl6aENoUFRXeXhWbHpXQlhGbjM4SGFN?=
 =?utf-8?B?T0hXL3o5SUhaeWs2OTNzUjIxL0MzYmpFem4xQXZrUW1sN2d3OFU4L0tKTzFD?=
 =?utf-8?B?cHNtdWVUcHB2QVByUXpJbkRCL25TMWhBWDRJZWZaREM2M3BzRloxTVNZTmJ1?=
 =?utf-8?B?UnZOU0FZcEVtUDIvSXRrMUJodnpWNVZ5aWx1dmJ3WGx5d2lFUkxrNjd1RW9M?=
 =?utf-8?B?NEs0dkdseHhtTFBYQXFzVnN1ZloxRXVDWGtIL05IOUVRb1dGZGtBVkJsUlh2?=
 =?utf-8?B?T0VwbmJOWGdpc3FldlArclRhSmp5eG5NMXVodUw1bzNoRklTUm5vamRxVFBS?=
 =?utf-8?B?Rjd1Mk83TUlJTjI5dXRNcWlOcUMyMEtEeGdnQ1dINSs3TjVXZWNhOG1OeFFQ?=
 =?utf-8?B?M0NaaEsxTElRNjVaeVppR0g1Qm95Z05UQStVbldvb3RnUGNUSksvMWRQUWtK?=
 =?utf-8?B?alFmK3l0NFpSYjZQVG92VlhxQjVUeWhZaVZ2bzJBMHdCSmFqTy9lc0RBZ0NW?=
 =?utf-8?B?OHFCMzNCUTQvY2lPQ2dubktrTjVZNWtQSXphazlhWitGR0paR3NXam1qcFJn?=
 =?utf-8?B?RTh4SG05YWF5ckhCL0lvMFJydllkdS9RQzVMM3YrZUVMQzZOem93bjhjb1Fu?=
 =?utf-8?B?MkhhdG9vc2hIYlFGRXE5cWdMdjZORGVFRjM3TXF1Qm84dDk2cVFrbks4ZEZZ?=
 =?utf-8?B?MDZoQmVzUjF4dTdiSk95b3Y3ZXkydTBqRjBSQjZQWjY3NURNZG1ZVUp3cHpi?=
 =?utf-8?B?SG8vTW5xN21wNkhhd1UwNWtNTVVsTmgzUkFEUE80WWgxNzJmSEdBUzBlMFQ3?=
 =?utf-8?B?cllqSDlsczdiRXBFd1hhY21WZi9ZSFBCL3V5MHZMZnYzWjlVaVlHUUJvblhM?=
 =?utf-8?B?SU4rLzE4K2VrSFR1a3BiRktSb3c3YnhuNXJvK3BDZytDTDhIZkxVT1lTY1hB?=
 =?utf-8?Q?nnEtwkRPd3NjWveyyEkDCjE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1ED32A546B5EB45A1AA48F0219B94C8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b216163-e876-41a7-1f7d-08ddec63c0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 10:05:33.6329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oO6h2wPOVnIKfL0apTxr4B6+J4Gch6oXWoKQedDnJO/9NTF5SmO7PvX8k9g1aH9H2S4ItO6SH1fYMEte6dG80dEC0N5+8PEQadOZnbHJq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8295

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4NCg0KT24gMDUuMDkuMjUg
MTA6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgTGVvbmlkLA0KPiANCj4gT24gMDQvMDkv
MjAyNSAyMTowMSwgTGVvbmlkIEtvbWFyaWFuc2t5aSB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaXJxLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS8gDQo+
PiBhc20vaXJxLmgNCj4+IGluZGV4IDViYzY0NzVlYjQuLjJmZjJkMDdkNmQgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaXJxLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9pcnEuaA0KPj4gQEAgLTMyLDYgKzMyLDEwIEBAIHN0cnVjdCBhcmNoX2ly
cV9kZXNjIHsNCj4+IMKgICNkZWZpbmUgU1BJX01BWF9JTlRJRMKgwqAgMTAxOQ0KPj4gwqAgI2Rl
ZmluZSBMUElfT0ZGU0VUwqDCoMKgwqDCoCA4MTkyDQo+PiArI2RlZmluZSBFU1BJX0JBU0VfSU5U
SUQgNDA5Ng0KPj4gKyNkZWZpbmUgRVNQSV9NQVhfSU5USUTCoCA1MTE5DQo+PiArI2RlZmluZSBO
Ul9FU1BJX0lSUVPCoMKgwqAgMTAyNA0KPj4gKw0KPj4gwqAgLyogTFBJcyBhcmUgYWx3YXlzIG51
bWJlcmVkIHN0YXJ0aW5nIGF0IDgxOTIsIHNvIDAgaXMgYSBnb29kIGludmFsaWQgDQo+PiBjYXNl
LiAqLw0KPj4gwqAgI2RlZmluZSBJTlZBTElEX0xQScKgwqDCoMKgIDANCj4+IEBAIC0zOSw3ICs0
MywxMiBAQCBzdHJ1Y3QgYXJjaF9pcnFfZGVzYyB7DQo+PiDCoCAjZGVmaW5lIElOVkFMSURfSVJR
wqDCoMKgwqAgMTAyMw0KPj4gwqAgZXh0ZXJuIGNvbnN0IHVuc2lnbmVkIGludCBucl9pcnFzOw0K
Pj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4gKy8qIFRoaXMgd2lsbCBjb3ZlciB0aGUg
ZVNQSSByYW5nZSwgdG8gYWxsb3cgYXNpZ25tYW50IG9mIGVTUElzIHRvIA0KPj4gZG9tYWlucy4g
Ki8NCj4gDQo+IFR5cG86IHMvYXNpZ25tYW50L2Fzc2lnbm1lbnQvDQo+IA0KPiBbLi4uXQ0KPiAN
Cj4+IFVubGVzcyBJTlRJRHMgZnJvbSB0aGUgZVNQSQ0KPj4gKyAqIHJhbmdlIGFyZSBtaXN0YWtl
bmx5IGRlZmluZWQgaW4gWGVuIERUUyB3aGVuIHRoZSBhcHByb3ByaWF0ZSANCj4+IGNvbmZpZyBp
cw0KPj4gKyAqIGRpc2FibGVkLCB0aGlzIGZ1bmN0aW9uIHdpbGwgbm90IGJlIHJlYWNoZWQgYmVj
YXVzZSBpc19lc3BpIHdpbGwgDQo+PiByZXR1cm4NCj4+ICsgKiBmYWxzZSBmb3Igbm9uLWVTUEkg
SU5USURzLg0KPiANCj4gSSBhbSBzdGlsbCBjb25mdXNlZCB3aXRoIHRoaXMgcGFyYWdyYXBoLiBI
b3cgaXMgdGhpcyBmdW5jdGlvbiBjYW4gYmUgDQo+IHJlYWNoZWQgaWYgaXQgaXMgY29tcGlsZWQg
b3V0PyBTdXJlbHksIGlmIHRoZSBEVCBpcyBtaXNjb25maWd1cmVkLCB3ZSANCj4gc2hvdWxkIGdl
dCBhbiBlcnJvciB3aGVuIHRyeWluZyB0byByb3V0ZSB0aGUgaW50ZXJydXB0LiBObz8gSWYgc28s
IGNhbiANCj4geW91IHBvaW50IG1lIHRvIHRoYXQgY29kZT8NCj4gDQo+IENoZWVycywNCj4gDQoN
Ck9oLCBzb3JyeSwgdGhlIHNlY29uZCBwYXJ0IG9mIHRoZSBjb21tZW50IGlzIHJlZHVuZGFudCB3
aXRoIHRoZSBjdXJyZW50IA0KaW1wbGVtZW50YXRpb24uIEl0IHdhcyBjb3JyZWN0IHdoZW4gdGhl
IGZ1bmN0aW9uIGhhZCBhbiBpbXBsZW1lbnRhdGlvbiANCmFuZCByZXR1cm5lZCBOVUxMLiBUaGUg
Y29ycmVjdCBjb21tZW50IGlzOg0KDQpEZWZpbmVkIGFzIGEgcHJvdG90eXBlIGFzIGl0IHNob3Vs
ZCBub3QgYmUgY2FsbGVkIGlmIA0KQ09ORklHX0dJQ1YzX0VTUEk9bi4gV2l0aG91dCBDT05GSUdf
R0lDVjNfRVNQSSwgdGhlIGFkZGl0aW9uYWwgMTAyNCBJUlEgDQpkZXNjcmlwdG9ycyB3aWxsIG5v
dCBiZSBkZWZpbmVkLCBhbmQgdGh1cywgdGhleSBjYW5ub3QgYmUgdXNlZC4NCg0KU2hvdWxkIEkg
cHJlcGFyZSBWOCB3aXRoIHRoZSBjb21tZW50IGZpeCwgb3IgY2FuIHRoaXMgYmUgY29ycmVjdGVk
IG9uIA0KY29tbWl0Pw0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQNCg==

