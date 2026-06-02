Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wnOBBzDkHmq9YgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 16:09:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5862F29F
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 16:09:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=W3tkPUOI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325083.1590620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPoM-0004JN-Fq; Tue, 02 Jun 2026 14:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325083.1590620; Tue, 02 Jun 2026 14:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPoM-0004GZ-Ci; Tue, 02 Jun 2026 14:09:42 +0000
Received: by outflank-mailman (input) for mailman id 1325083;
 Tue, 02 Jun 2026 14:09:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUPoL-0004GT-5R
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:09:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUPoK-003dX0-IO
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:09:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1ee424-5cb7-0a2a0a5109dd-0a2a4508ed20-2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:09:40 +0200
Received: from [40.93.201.47]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1ee421-63b5-0a2a45080019-285dc92f10d3-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:09:38 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by SA2PR03MB5721.namprd03.prod.outlook.com (2603:10b6:806:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 14:09:35 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 14:09:35 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af9izQVnZNrzC97gevcpIpFUsWVabVM8pTNnvqazY74/XdEdJ3bl/GIClkk1Kc8pnh3Vz/IP3acc1BBpZVwEv9y00BETyga/XKFJV5Z1kszLWAQOoUucoDu5e5nHE4zwpiAiSqPO8ZNqYyhD+xRupY8c6cXMk54zazi2gVGPHIyzU2jKGnTM6GMZPrilGi/U+/JOUrQXlaN6DFDrdGsBPGFio6Q8n8ITBRYk0VUJhoZcqC4AezCK264SGWHoHfy1bKcTARvdRmZI/2vUB16gceloyL8ARtrYj3lGXn5f6bJaQLF4vhe+eWib7UhbWEIhK7BboefpDyZ/dtL0iimZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q3KxC6loRuy+eQ0kKIGUnfFCjI3BivJRz+GeIgQ0/8=;
 b=zCBQEoiZR0M7zDDqL8oJHo1or1Oojo4r3LM8rZEEQeBr/iL17LuI3fqlMKLTCXIzwPI58F1jio9bAuNYx78aTnEx+sY3bbSYy/+sQbjI6XW1yCc3Yr+1AbvGj70Re0io6oAuUFmBJyF5UenqruN0h3ISryjkSMnHgnwspHMSdN3CWxlCAfy6s1vmX+fiZzrjOiLwDC8P7phsmrIXYfMnsqQPXLhc9Rz/iXzRI7gReKTD64krievlQYbxaty5j5VAaC3ovdflncYTr3WFXNUUBtieJ/KCwYnMM7LrDtCvqFz81J52811F8o17YFVAVlJK8/anK2AHNjD/7fcJAPd1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q3KxC6loRuy+eQ0kKIGUnfFCjI3BivJRz+GeIgQ0/8=;
 b=W3tkPUOI5/c6bLnHLcU2D9+GGI7vCE2HdXRfjSuqXOXzSfoxq1QtHqKhr1h/i7vFIoQJjYa9w4MJjoBgTo0h64N/ejLm1A9/Dnjm8W3P0+XtnSyF5XlQRDgfNP9fyX4jO5YpqojvQe7UZ6iT23vnw43sQhkUoULH/eVrWP2Vza4=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Andrew Cooper <andrew.cooper@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Marcus Granado
	<Marcus.Granado@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large
 domains
Thread-Topic: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large
 domains
Thread-Index: AQHc8m0cC2Q3ziRM6Ee1Tf3SMKSJo7YrJ16AgAAZegCAAAgNkA==
Date: Tue, 2 Jun 2026 14:09:34 +0000
Message-ID:
 <LV3PR03MB77077924E08313AC8808FA6F87122@LV3PR03MB7707.namprd03.prod.outlook.com>
References:
 <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
 <4f3f6ead-b917-4824-bc24-47a37f921bf6@suse.com>
 <702a949c-882f-4c05-b765-ef75c5e8a9cd@citrix.com>
In-Reply-To: <702a949c-882f-4c05-b765-ef75c5e8a9cd@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|SA2PR03MB5721:EE_
x-ms-office365-filtering-correlation-id: 12aec097-88fc-4053-d733-08dec0b09345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info:
 I5oIOA2ndx5vAnTnReJYrcVEZNHdedSRBZ78mT2vMtGS7cFy2z55TWb+V0X80zNhrDeaWE7rGVAe9TNP1ysTyMjdIptm0XMvHSlq9m5UXkcEsg8u/J/C+kE0k9tirNpwMVYhF2xwOYRUJO9VlBTsO/5fc9vhcxt6Y5mWKJ24o9UKTirnQ5ro0ZFPmSeHFMSQkmJZFhG2xKjjhxKDVo5aBnB0nECF5nuEXkKRsJPMc2MFfEVsIIYCKj6g7up+Z1aU01DqgGddpKYWUWMHKVdMWy6jllc9USmgQADfMbE6tnMiT3mKPWNwYjAsMxXYKMg5J5ijYlh0OkXgrnN7SHNQZlNwFsa50OZ+jWbm3QL/5WH9Yda+laHs1heKVzkeDStH6hugN9dPOgRvjz2tT7ASmfV+XZNodY4Ia8yoYo740iGUSGJUcbhD37Q4ltDUp020Z07o9zKw/v1wsT/DloVGPsaPCgLbY0+8rlFChy+Xg2+n5fvnsApne6w33A/YbzYBFChTepH2HCGTRWvJ1huEebAEHCc2LIBaRoGj3u2pFbqoIwLd3PKPLw+TGNXRUr9Kmv/tBmq860BJfLeDye4RtV0sQhcWk/4+ysOD5dyg799M5ZyfhgiZEUynTEn41BKc61IH6g7i4WldEASsuCkMgx5hIv0Gwv9KP+fb7ujb/sYbsXqVNVVH4WRv3dmvtiKTWF1+fgH7YnqWhUQrpPvbW7H4FnfZp5TW0kQxNN+7bSCYgP7CXkqpH+LcC4rPNRd+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STBGUE1QcHgrcEE5Rlh5bUNiNExyR1NOUmYvQzZManNpRHhWbm96Q2ZMZ28r?=
 =?utf-8?B?UFFKaWdIc2FTWm1uRlY1VDVDWFU1Y0RZTUdTUGhFQ2lkaDNKZjE1VllaT3pr?=
 =?utf-8?B?eUkxdVFrVFhlaUNpWWFRSVVWWUFVYjF1Rk1DUVVDVWpiNTVmdHdJdE1ZbzEz?=
 =?utf-8?B?RmdzK2ZId0lvUzVnZHNsZ0l0Qy9WdWkrZzFQL0NvT0J0MXJUZlhBMmJuYUtP?=
 =?utf-8?B?aVBEcWY3VHFNMWRueXJUV2FHM01QeGJjVkgzMDhYaEVVNWdyL0RGazhwMnY1?=
 =?utf-8?B?YVlwNjVFS2xSM245UmlQYzBKaTU2bXdXeU5jSzhTY1lhVHluREVrODlKZi9p?=
 =?utf-8?B?TWh4ZHd3SEh4b1QvbG5URVJGWWswV0F3Qm1ZWU5lNklrRVRKSGdlU3BDTWpv?=
 =?utf-8?B?S1JwZVBhTFpUdmlxa05kc0habTNzeE1pdGo5K1JjUWI0MllydnlYUjBmblhv?=
 =?utf-8?B?M0lPVHRUSno2UFZlVWg0RTVTWXIzb2lseGo4aHl2NytvOTJBRkpyUmV6L29p?=
 =?utf-8?B?bEtNUEQxVmIwTVpGb0F4SmpMbzNtMTlPdnkxTUtOZzROZysvRksxT2VDUXJL?=
 =?utf-8?B?S2Z4dnpkdTRSd09CZE9Lczl5REdGQzhIeTZmZkM3WU1HcnloajROU0JpcEZL?=
 =?utf-8?B?SVhnTXg1WlhtS0paOFJPbUNFaEtJd0xoNGRIeXVkS0JDaW5uYWhuQmJHUGxU?=
 =?utf-8?B?cWFEWDltM3ZPWE0rOGFIOXFuTkwrcGl4aE16UVpmYUFzTnAxbUhtbmd4RmlJ?=
 =?utf-8?B?bnI1b1hYUVkrdkVVNEhXMC9rTmNWQmZmVjB3VWV6UTlPWHZYYTVPV3VGNURQ?=
 =?utf-8?B?eGZmSGk1OUJmMDFVdDgvNjJ0d3gxYUJOZkxDRk1ZY1JjNkZib3dacVlDRXR6?=
 =?utf-8?B?SG9JUWcrSXlITkFDdk5IMS9IR2dPMExEdUxab1A4TVNDVGFwbVVMdTJvc3Ay?=
 =?utf-8?B?czVQZE9kYm9KRlBDOFRROURrcXdndzdGMEVTaHgrbXhXSW5EL0huWGtnZzJv?=
 =?utf-8?B?cE9veUMzMDgybXFURDN6SGZ4RDVEYVJta28wOUxXWjhJUE82UHZDTU9Vblln?=
 =?utf-8?B?S2Fnc3c2dkdBYnVwdVFaaGRxVjlFTGROTHZBUFZ1cW4xaDdkdXBHRHBlQW56?=
 =?utf-8?B?eHhyeDBiamRxU2JqMlRiQlJ3Z0d3RVlKVGR2akkvZ245clBjVWNQc1F6eWxE?=
 =?utf-8?B?QStqOW01bGtaaHBrWUhHRHVqbCt1TG85MTViUThKTkVsVDArdC81SkFTc0ZZ?=
 =?utf-8?B?Q1VjUnc4M1ZIUEQ0bmdvYWtrMTdLK3NpTExhNDQvV1lPWWJVQ0pYZERRTlU3?=
 =?utf-8?B?ZWx2QkFGYk00V1pxU21iTVlaQm9zY21SdFpQTTJBUDN4cWRvVFZNcEI1a2h3?=
 =?utf-8?B?bWFqNi9ocUpqVmJ6MCs5QWZ5dUlVSjlvcXdySWpQRGdJdlZiNWxzRjltS25x?=
 =?utf-8?B?WUdkZ1F5M2taRDVTbmVuc3ovMHF2K3cvOFpsVlJ4Z2p6S0F5ZFk1Ym0wWVU5?=
 =?utf-8?B?T0JIa2FhMmpVOWMrVHdEM1FMajZaRXd6QW1sN0JlbndwQVV4L01BZUpLRWlp?=
 =?utf-8?B?ejhzemcxZUk3OExVU2FtVDhmL2djWHFINWwwd095VFNBTUVzWHNXWExSNXZh?=
 =?utf-8?B?bitKK2lZKzZMMFNoUm9LUncxU1dTTkRYSnMrYUJVRzRKNDU1ZzRTOTlUWWg5?=
 =?utf-8?B?VXF4eUhOU2tjdndaSCtZRXdMNFl2Q2NKaEwwMXVNY0EwK1RhbTFlbHF5V0dG?=
 =?utf-8?B?dTZEUFNPQVZYNHRRaFFLWXhWWlRKNEZndHYxaXRxWnNDRThZbXZJNzJKUCtJ?=
 =?utf-8?B?dnp2ZkVTMTFZUlhCeXRtNXorRTgxVXNzRGkvOUVjMU9reEF3dkh1Z284UW5W?=
 =?utf-8?B?RWVJaHRRMHdHQ3VSYnVkWFFwaHdUclZ1bkIyTTMwM0Nwbk9qOEZLV3c5cDJo?=
 =?utf-8?B?Z3ZlaU44Z2l5RmhFWUZGY25sYW1saTVIOG05TU9FL2lHTE9ibWdTdnQ2R21m?=
 =?utf-8?B?TCtLKzVhTWJBVlJkUnUxaWZveUhPNzM2M3pVckF4REpqWDNYSjZ0Vkt2RFVW?=
 =?utf-8?B?Yk54MWsxd05iU1dSYjBHakRkdzlSYm1MOTNCK0I3WEx0RzFTWDlyNm5jeGxm?=
 =?utf-8?B?emdqZWVQNU9CZmhJeXlaaWhOY1VMTkhqanBBZGFYNmdWeDRvRWxWd3NBT0Nm?=
 =?utf-8?B?ZkhvQXV4R3UxRlhxR0V6TnZuVHJoa1hLcjR6UTlRSm5YU0lxNVFFQWY3bWw0?=
 =?utf-8?B?VVB0ODFUaHFMdzBWTUM5amwrL3hIQU9OWDBoeFRYZDhZV1YyTEliMTAzT2c1?=
 =?utf-8?B?YUZlOGJxQUx0VlkzV3lmUm1PcGhSS3NpNjlMdVh4NDBXK0ZDL0t3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12aec097-88fc-4053-d733-08dec0b09345
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 14:09:34.9847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIDZmP5xagg8paF10j0iKoSAmHAFYKMYRQO879StDDmK9guJICeVoR93Qfk+nxrrpg5Hysyw3XYDXIPxMKmRnmDCVDV48y7jYsLSShbvpjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5721
X-purgate-ID: tlsNG-c1860d/1780409379-BFF7ADB1-35F20945/0/0
X-purgate-type: clean
X-purgate-size: 3186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,m:alejandro.garciavallejo@amd.com,m:Marcus.Granado@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78D5862F29F

DQo+ID4+IFJlcGxhY2UgdGhlIHBhZ2UtbGlzdCB3YWxrIHdpdGggbm9kZV90b3RfcGFnZXNbXSwg
YSBwZXItbm9kZSBjb3VudGVyDQo+ID4+IG1haW50YWluZWQgaW4gc3RydWN0IGRvbWFpbi4gVGhp
cyByZWR1Y2VzIGR1bXBfbnVtYSgpJ3MgcGVyLWRvbWFpbiB3b3JrDQo+ID4+IGZyb20gTyhwYWdl
cykgdG8gTyhub2RlcykuDQo+DQo+ID4gQWx0ZXJuYXRpdmUgYXBwcm9jaCBmb3IgY29uc2lkZXJh
dGlvbjogUHVyZ2UgZHVtcF9udW1hKCk/IFRoaXMgYmlnIGENCj4gPiBjaGFuZ2UgZm9yIG1ha2lu
ZyBhIGtleWhhbmRsZXIgd29yayBiZXR0ZXIgaXMgc29tZXdoYXQgcXVlc3Rpb25hYmxlIGFuDQo+
ID4gYXBwcm9hY2gsIGltby4gVGhlIGtleWhhbmRsZXIgaXNuJ3QgdGhlcmUgZm9yIHVzZSBpbiBw
cm9kdWN0aW9uIGFueXdheSwNCj4gPiBpdCdzIChwcmltYXJpbHkpIGEgZGVidWdnaW5nIGFpZC4g
SWYgdGhlIGRhdGEgaXMgc3RpbGwgbmVlZGVkIChhbmQgbWF5DQo+ID4gZS5nLiBiZSB1c2VmdWwg
b24gcHJvZHVjdGlvbiBzeXN0ZW1zKSwgbWFrZSBhIChwcmVlbXB0aWJsZSkgZG9tY3RsIG9yDQo+
ID4gc3lzY3RsIG9yIGFsaWtlIGluc3RlYWQ/DQo+IA0KPiBJbnRyb2R1Y2luZyBkLT5ub2RlX3Rv
dF9wYWdlc1tdIGlzIGEgcHJlcmVxdWlzaXRlIGZvciBwZXItbm9kZSBjbGFpbXMuDQoNClRoYXQg
aXNuJ3QgYWN0dWFsbHkgdGhlIGNhc2UuDQoNCk9ubHkgb2Ygd2Ugd2FudCB0byBzdWJ0cmFjdGlu
ZyBkLT5ub2RlX3RvdF9wYWdlc1tub2RlXSBmcm9tIHRoZSBjbGFpbXMuDQpCdXQgdGhhdCBpc24n
dCB1c2VmdWwgaW4gbXkgb3Bpbmlvbi4gDQoNCldpdGggbXVsdGktbm9kZSBjbGFpbXMgKGFzIHJl
cXVlc3RlZCBieSBKYW4gYW5kIFJvZ2VyKSwgaXQgYmVjb21lZCByZWFsbHkNCmF3a3dhcmQgdG8g
c3VidHJhY3QgZC0+bm9kZV90b3RfcGFnZXNbbm9kZV0gZnJvbSB0aGUgcmVxdWVzdGVkIGNsYWlt
cyBmb3INCmdldHRpbmcgdGhlIGNsYWltcyB0byBpbnN0YWxsLg0KDQoxKSBUaGF0J3MgdW5uZWNl
c3NhcnkgY29tcGxleGl0eToNCg0KICAgVGhlIHB1cnBvc2Ugb2YgY2xhaW1zIGlzIHRvIGFsbG93
IGRvbWFpbiBidWlsZGVycyB0byBjbGFpbQ0KICAgbWVtb3J5IGJlZm9yZSBwb3B1bGF0aW5nIHRo
ZSBwaHlzbWFwIG9mIGEgZG9tYWluLg0KDQogICBhLiBBIGRvbWFpbiBidWlsZGVyIGtub3dzIGhv
dyBtdWNoIG1lbW9yeSBoZSBuZWVkcyB0byBwb3B1bGF0ZS4NCg0KICAgICAgSXQgaXMgbmF0dXJh
bCB0byBqdXN0IGNsYWltIHRoaXMgYW1vdW50IG9mIG1lbW9yeSBmb3IgdGhlIHBoeXNtYXAuDQoN
CiAgICAgIEl0IGlzIHBvaW50bGVzcyBmb3IgYSBkb21haW4gYnVpbGRlciB0bzoNCiAgICAgIHBv
cHVsYXRlIHRoZSBwaHlzbWFwIHdpdGhvdXQgY2xhaW1zIGFuZCB0aGVuIHN0YWtlIGEgY2xhaW1z
IGZvciBpdC4NCg0KICAgICAgSXQgaXMgdmVyeSBhd2t3YXJkIHRvIGhhdmUgdG8gY2FsbCBhIG5v
dCB5ZXQgdXBzdHJlYW0gaHlwZXJjYWxsIHRvDQogICAgICBnZXQgZC0+bm9kZV90b3RfcGFnZXNb
XSBmb3IgZWFjaCBub2RlIGFuZCB0aGVuIHJ1biB0aGlzIGxvb3A6DQoNCiAgICAgIGZvcl9lYWNo
X3B5c21hcF9ub2RlKCBub2RlICkNCiAgICAgICAgICBjbGFpbV9yZXF1ZXN0W25vZGVdID0gcGh5
c21hcHNpemVbbm9kZV0gKyBub2RlX3RvdF9wYWdlc1tub2RlXQ0KDQoJb25seSBmb3IgWGVuIHRv
IHN1YnRyYWN0IGl0IGFnYWluIGluIHRoZSBjbGFpbXMgZG9tY3RsOg0KDQogICAgICBmb3JfZWFj
aF9yZXF1ZXN0ZWRfY2xhaW1fbm9kZSggbm9kZSApDQogICAgICAgICAgZC0+Y2xhaW1bbm9kZV0g
PSBkb21jdGwucmVxdWVzdGVkX2NsYWltW25vZGVdIG5vZGVfdG90X3BhZ2VzW25vZGVdDQoNClNv
IG5vLCBJJ20gbm90IGdvaW5nIHRvIGRvIHRoaXMgaW5zYW5pdHkuDQoNCj4gVGlkeWluZyB1cCBk
dW1wX251bWEoKSBpcyBqdXN0IGEgdXNlZnVsIHNpZGUgZWZmZWN0Lg0KDQpBY2ssIHRoZSBwZXJm
b3JtYW5jZSB0ZWFtcyBvZiBjdXN0b21lcnMgd2VyZSBmb3JjZWQgdG8gcmVseSBvbiBkdW1wX251
bWEoKQ0KdG8gZ2V0IGRpYWdub3N0aWMgaW5mb3JtYXRpb24gYWJvdXQgdGhlIE5VTUEgbWVtb3J5
IGRpc3RyaWJ1dGlvbiBvZiBkb21haW5zLA0KaXQgd291bGQgYnJlYWsgdGhlaXIgdG9vbGluZyAo
YXMgdW5zdXBwb3J0ZWQgYXMgdGhhdCBjb3VsZCBiZSksIHNvIGl0IHdvdWxkDQpiZSB1bmRlc2ly
YWJsZSBmcm9tIGEgWGVuIHVzZXIgcGVyc3BlY3RpdmUgdG8ganVzdCB5YW5rIGl0IHdpdGhvdXQg
YSBzdWZmaWNpZW50DQpkZXByZWNhdGlvbiBwZXJpb2QuDQoNCkJlcm5oYXJkDQo=

