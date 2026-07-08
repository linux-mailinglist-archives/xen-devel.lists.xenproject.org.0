Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vOseDVSDTmr9OAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 19:05:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862B729004
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 19:05:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=TFoiNF+W;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357229.1611710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whVhc-0003q1-Sp; Wed, 08 Jul 2026 17:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357229.1611710; Wed, 08 Jul 2026 17:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whVhc-0003oC-Pl; Wed, 08 Jul 2026 17:04:52 +0000
Received: by outflank-mailman (input) for mailman id 1357229;
 Wed, 08 Jul 2026 17:04:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whVha-0003o4-S7
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 17:04:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whVha-00Aj4E-7m
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 19:04:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4e832d-e002-0a2a0a5209dd-0a2a450ad5c0-12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:04:50 +0200
Received: from [40.107.162.119]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4e832f-e40e-0a2a450a0019-286ba277bafb-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:04:50 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU6PR03MB10944.eurprd03.prod.outlook.com (2603:10a6:10:5c0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 17:04:44 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 17:04:44 +0000
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
 b=r3jlayRDTQb3ORW2IufTfmVlGYmPh8no6TwWy+N9aBxa5/VgrGbcSU3jqXQrUCMl73ryxG8LKe13Ev0Caxxmw4EtdC53BiDR6BJuHRTXMNbPDQ2WC6QOn9srZu3i1Re255EI6sij9mUs1rJ7ogCsRBEy09bWpr+qXzize0WmGnM9z29srx3Pw6iAUJcajC4lGw0hEkJ4zfx19aNM92apzwvmUQfARg23gEpAKjAEHGeHj+I7afKeQ8U1svExH6LPId8RKkMhYrNmADWwxbB9aK2nesmlHOe9qig9gvR7CK7rq6jSsxBaWv1A3mWjj24Y6OGRR87psYT/gPVqq1JAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uikqKhueURthZnybTA74Ibzy5r7ysbLJVb6DmVx4+C0=;
 b=cm/8O8rDy16/z2oeisYPFm8+7xxXPiz+81f0O3/3XPbXnlD1AEkBdser0wFna2Iw6WOPwhgrrudJQCo/Pt8Xk+axaTW5wU3k8fa9aQI9oWCtPHKGSLZZ+USxRVGR0ODz2k4I5QB+zMjJD+YD3D8g0YI/8JPAcLb3N0wgwEkp6l061bO638fVXWp344MkdU284AaiHOVEBeS/5rw+jwoLPp33SNm97+62h7xYz9dTpD2UVuzN44F3POFPKuRgXTLpkZYKxU/BLZgGXAUcyzls2zt5CpszGy2zxYENlqowY/qEdXpzDdxwsV6t3Y4nTiuZhPre+UU077mYAbgUWLFnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uikqKhueURthZnybTA74Ibzy5r7ysbLJVb6DmVx4+C0=;
 b=TFoiNF+WlU2X5mDIttazrLUHDxiNxXeamatIOCsi25rvW5oQiwwt2yXkjtcwnY6K1rxF5IXpNrNLvoP+ynTLMl6W8tiCsedoGEfnzX+zh+n8qw6gR3sJpL3qcWETZp7kbKl3KoFkPQT5LoH2pTjdCLhMhTeQMP264/7PptWicRF+0gMhbidkk4T/YY35gXvFLuB3kZxbkBo98Lv4GLcpQRe1duDyGhm9hzWyoCt2W1p1kNNFKz+rA7W/C7T9m4T2lCGnVFTj5KFmamYl5Jvx087EBinnMn3+WrL5RB+tlV+ecFlhmeSqc2IwHE1/Pa+qHXz9OtEvmzz5jK0HqYeYPw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdDiOX7r4PlObs6ESPVB8UpORls7ZiOVkAgADswwCAALVbAA==
Date: Wed, 8 Jul 2026 17:04:44 +0000
Message-ID: <c8769518-3f84-4c73-920d-975b7efaaf92@epam.com>
References:
 <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
 <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
 <21ec0511-bf7e-44fa-b6f6-99d9c4085eda@suse.com>
In-Reply-To: <21ec0511-bf7e-44fa-b6f6-99d9c4085eda@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU6PR03MB10944:EE_
x-ms-office365-filtering-correlation-id: c1714c0d-4a70-4486-7387-08dedd130230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|42112799006|23010399003|366016|56012099006|4143699003|11063799006|22082099003|18002099003|5023799004|38070700021;
x-microsoft-antispam-message-info:
 X/IlKJdTLKTw0QHvksihGlcvBm6DVsJhFLFcpD+A5FCDWeCiy3c46YQpXvOgYEgIpvHYSEXKGN73N2kutfN5DE2pludY9CiAX1/dMjJse6rUF2+8v+rsvWwcrUh28mjqv1I6Y17hrfZlKNHdtorbOHL+2EMEuzzqTvsM0K/ogZ/YAX918AMhchi+Y9C9B2xqBHuozRf2FoLir+UfFOCGbDGwGy4n0D7hIFU7S2/96rQ7WbW7rQEvWLeNFLYah3HKS+05LC/DDFAf+VJaqmVbsNWUnU8SqUoXGGQYC16F7PY4j3QiVXSlcaVcEooyBXP0+2hoqoek2KdRJJ25iDK6Jeb8WpF8t4gtrCHhzhUj9VTYFrWYcdm59MmPSjR2rqZMVAMIOs3Ung7vB+ep8473p/3mJTOn04k/q4quYKKQBT8j1bdQmWEmXG14X9C63ASyI3hNDLs/z+lTN1zQkH24HGryqDSz1EjwXYP1aSUP4XoXeFEomd1xuUpshUi2a1295/VGIhLcAjx1TvNhetmDoPSv2ovkbh6088/cUCf4HjAHkZ1IcX2Oe2G8ZaIAgsrIQ9nbySQBOyFJKm0RUCUXWZf/0Mamv99FdsJrUCQvf6FsJlPVB7z0wMCfHZzZl677INLvntkv8S9xxRdamG1e2cSnUivUFiqkZCAtwEBuSrleAke831vYN6b7FTUCEaehArm1CZ+5cbt6lZ/UX5GHTDeaWe7/w7wMjqtePaP0BdY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nk9jTU9rakxicFFIaUgvVHlSbzFwZ2VpanBGS0lZL1QrLzNDM1ppeVZuZGxQ?=
 =?utf-8?B?b1oxUVdBUlBqdzRoczRkSWc4VGNCejZEWExYREsyS3VOWFAwWmViVnMwR1g2?=
 =?utf-8?B?K2R0RDJzYkFoTHNvMGpadWZCOXBRd3c2dHhPT1BoVlRzSDJnMW1wenBMRWlF?=
 =?utf-8?B?M1lCTUdndFUwUkF2dTNnQ0VpWU1jaHRpdVMwd1RoVHcxSUh0MTJrdzBtSytr?=
 =?utf-8?B?VG96RGo5TjAwYllrUnBDN0VremhyLzNwL0V0OVBFamxqd296eW1VbTJwdld2?=
 =?utf-8?B?WFVOeVJPeHdMY2hjMjdBZ2I4eTduSllCWXJuVmQ2UGkrZmlPY0NuamNNTVRM?=
 =?utf-8?B?d0UrVndIRWFkRG5qeWJXQkFYZnBzSi8yWm9TMHRXV2s4cWlvTW04b2E1MDNt?=
 =?utf-8?B?Y0twRmx0MlVrWVBBSEx5TmxZdWtsZ3JUSFRJVkd1d2IvcHN6V2xYRjEwVVcv?=
 =?utf-8?B?aVJrZFdZT25VS2R1TXAyYVR5YjUyRXhNQ3ZnYk5haDNHM2tCNmpiVGRZV0pt?=
 =?utf-8?B?dHlXYzVRZEc2OGd3VmRER3gvU3V6Rmk2YmNMVlZxR09VV2lXMEpkeVFpb1Vv?=
 =?utf-8?B?cU1rcVUwZTBHRHovMjlCUEVyakFpZXQzSUI2VUJXV1J4b1FWS2NFaXJESXlG?=
 =?utf-8?B?NTRkVVFtNHNyNEJaeE8wbVFBZnBMdkZMLytOSlRpbUtaZSsrWjJwR3BqVDMw?=
 =?utf-8?B?dFRBb1JUQ3dTZFVxdHJUSlRRQkhicHF0TkR5Ry8vd1d3N1FIekpFaVhianRU?=
 =?utf-8?B?WlYyVVJxWVhJNlJhVXhFbnpsOXkrRGp6NTNQSUZyaEp6MExxcmpXVDR0c1Y1?=
 =?utf-8?B?NHN2SnJUSXZ5VVY0VjNiWmtUZUdXaVZjQ05pclE4MVRHNUc5aEFydVZrbm5O?=
 =?utf-8?B?L0VDUlpRN291cmVCVkNSSmc3SjhwZm1YYjhwbmdzRE5oZ2piVmwyanpYVHFp?=
 =?utf-8?B?VDBxYlFWYWszUytxallNM2J1b05nOC94eU80VVU0ZVJHb3RWejg5MXl5TFBL?=
 =?utf-8?B?VksyWTNmT0xUSnF4NFdkWnA2V2VRbGpSTzBVS1YrSTVBL29UNEtqb0VzSWV6?=
 =?utf-8?B?ZFNTdDRWWC8rRlJVT2xqNGl4UUVUbGZtT3ZmL2NrNVU2UUs3eG9CUFRJRlFx?=
 =?utf-8?B?VjdlNTRIbmVhQjVkWUZ4NGxJaS8xSzkwcTNwUVJMeSs5UHRKRDB5SE9BMzF2?=
 =?utf-8?B?WE9uY1lWeWpZbTltaGJ4emsvUkxjek9RMG16dUozb2tLUElMTzhHb3Q5bjFa?=
 =?utf-8?B?YlBadkdvTlNad3ZGRGl5VXBJVCtESHBNTHpLdTROWGlhVC9lM082RlR3eVZK?=
 =?utf-8?B?OWVFZEwvMkxFTFBzVlNkdHlzRWlDdmNjQmRWYncxdTlOcXl3aSsrejBYQ0VX?=
 =?utf-8?B?RG5FRW1NbzVLcDBvYXkxS3pma1lNMXR6aUp3WjFzbE4waUp5b0FDSG9IMTdm?=
 =?utf-8?B?VXNWQ1RuZXpmVHVJQUtBTEtaMStlK3lEdU5FT0lyZ3JKRG5yTHFEOSs4M0hw?=
 =?utf-8?B?R2hhV2VHWkRWdk1neGJQSE5WMWtkRjFPbFJsV3lSYzZ6NHRDcTdhdVZlTkFB?=
 =?utf-8?B?NnVkM0R4enE5RVRmVkF4aWxIS2J1c1Z6NXVHU3JzV1lkU2NaTlBNR2dUS210?=
 =?utf-8?B?R3dSMDFWRXZWVnhQWGZ3RElwMkVEVUo2VVJlblhJYWpZTm1mblFDVnU1RFlH?=
 =?utf-8?B?YmdFeExFMEkxUkV0VXdRblZGSTB1NXJTcGdDOVl1Sk55cU5pU3NOT2VrTnRa?=
 =?utf-8?B?VXpQZFZFcW9wNGFUbEJrU0w1L1J3UWd0WkU4VW9ZdURvcmJFRTJTRnhRNlBj?=
 =?utf-8?B?MzFNVER4V3pkZndzOEdOSkMrRnhRL3JnMEhIQ0s4S2x3MzVJQmt1L21wcVZU?=
 =?utf-8?B?cmQzYkI2cmd5WURwcGQ3NUIrMCtZMkZUbHlXTEdsc2hxMWdmSWJpVllDYk5V?=
 =?utf-8?B?WU1QVVRzZG42dC9tZXh3SCtHUWwzdE9aT08yWnZHRStjcGtMRHhJb3o1YmxU?=
 =?utf-8?B?WU4zYVMxMmxKN2Z2SzlaYkpCSnR2SytXbDhBQm9wN2htZ0s3QjVjd0pXc1NO?=
 =?utf-8?B?MTZwd2ExSGxjQUJNUkxDZVNqa3hjVkxGTXBITmhrR2tlV2pURHZoMDU1RFBT?=
 =?utf-8?B?L0Jma0ZkRjl0SXhSV09BMC9mT3BBbEluZFZ6eGlGNGNoR0Fkb2VOd0V2QmJ6?=
 =?utf-8?B?dVJWeFVNRUdoNDlqTm0yZzZHd0RmcnhTR0VGU0tITHRXWjd1VWR0dEFHS0J5?=
 =?utf-8?B?cTJZdFNHQytvcnBVR3I0YlRZUGNwVVh5OVhVaS8wMWZIYUYyaTEvKzBGcVpn?=
 =?utf-8?B?MmpBdHFCZUlHYXFJZ0NsL1dmTnQrS2JoblpvOEtHRWpDVnhPNml3dDBpNHpt?=
 =?utf-8?Q?wuczFq3lv9IXhGKM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F7F282121469144AFA9B96E2C347CCD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1714c0d-4a70-4486-7387-08dedd130230
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 17:04:44.3997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3i5VjEkk8eeaQUToHjDH9RWz66B3/LqbCe/tUsrJ3d1PELr7yHyrhCkkfP7tJUprOTNfGc960c47AIFilAYwaqDg+b6M6xOywnoq08qNNzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR03MB10944
X-purgate-ID: tlsNG-4011c0/1783530290-D5726DDE-D8EB87A3/0/0
X-purgate-type: clean
X-purgate-size: 3720
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7862B729004

SGVsbG8gSmFuLA0KDQpPbiA3LzgvMjYgMDk6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
Ny4wNy4yMDI2IDE4OjA4LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPj4gT24gNy83LzI2IDU6
MTYgUE0sIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+PiAtLS0gYS94ZW4vY29tbW9uL2Rl
dmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+PiArKysgYi94ZW4vY29tbW9uL2RldmljZS10
cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+PiBAQCAtMTU0LDYgKzE1NCwxMyBAQCBzdGF0aWMgaW50
IF9faW5pdCBoYW5kbGVfcGFzc3Rocm91Z2hfcHJvcChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZv
LA0KPj4+ICAgIA0KPj4+ICAgICAgICAvKiB4ZW4scmVnIHNwZWNpZmllcyB3aGVyZSB0byBtYXAg
dGhlIE1NSU8gcmVnaW9uICovDQo+Pj4gICAgICAgIGNlbGwgPSAoY29uc3QgX19iZTMyICopeGVu
X3JlZy0+ZGF0YTsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIChhZGRyZXNzX2NlbGxzICogMiArIHNp
emVfY2VsbHMpID09IDAgKQ0KPj4NCj4+IENvbnNpZGVyaW5nIHRoYXQgdGhpcyBjYWxjdWxhdGlv
biBoYXBwZW5zIHNlY29uZCB0aW1lIGhlcmUgLi4uDQo+Pg0KPj4+ICsgICAgew0KPj4+ICsgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSICJJbnZhbGlkIGFkZHJlc3Mvc2l6ZSBjZWxscyBjb21iaW5h
dGlvbiAoYm90aCAwKVxuIik7DQo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4gKyAg
ICB9DQo+Pj4gKw0KPj4+ICAgICAgICBsZW4gPSBmZHQzMl90b19jcHUoeGVuX3JlZy0+bGVuKSAv
ICgoYWRkcmVzc19jZWxscyAqIDIgKyBzaXplX2NlbGxzKSAqDQo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1aW50MzJfdCkpOw0KPj4NCj4+IC4u
LiBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gY2FsY3VsYXRlIHRoYXQgb25jZS4NCj4gDQo+
IEhtbSwgb3JpZ2luYWxseSBJIG1lYW50IHRvIHNpbXBseSBzdGF5IHNpbGVudCBoZXJlLiBCdXQg
bm93IHRoYXQgeW91IHNheSB0aGlzLA0KPiBJJ2QgbGlrZSB0byBleHByZXNzIHRoYXQgSSBmaW5k
IHRoaXMgMm5kIGNhbGN1bGF0aW9uIG9mIHRoZSBzYW1lIGV4cHJlc3Npb24NCj4gYm9ndXMuIElm
IHRoZSBnb2FsIGlzIHRvIGRlYWwgd2l0aCBib3RoIHZhbHVlcyBiZWluZyB6ZXJvIGF0IHRoZSBz
YW1lIHRpbWUsDQo+IGNoZWNrIHRoYXQgKGFuZCBub3RoaW5nIGVsc2UpLiBJZiBpbnN0ZWFkIHRo
ZSBnb2FsIGlzIHRvIHRydWx5IHByZXZlbnQgdGhlDQo+IGRpdmlzb3IgZXhwcmVzc2lvbiBmcm9t
IGVuZGluZyB1cCAwLCB0aGF0IChhbmQgbm90IGEgc2hvcnRlciBzdXJyb2dhdGUpIHdvdWxkDQo+
IG5lZWQgY2hlY2tpbmcuIEluIHBhcnRpY3VsYXIsIHRoZSBtdWx0aXBsaWNhdGlvbiBieSBzaXpl
b2YodWludDMyX3QpIGNhbg0KPiBjb252ZXJ0IG5vbi16ZXJvIHRvIHplcm8uDQpZZXMsIHlvdSBh
cmUgcmlnaHQuIE5lZWQgdG8gY2hlY2sgd2hvbGUgZXhwcmVzc2lvbi4NCj4gDQo+IEF0IHRoYXQg
cG9pbnQgdGhlIHF1ZXN0aW9uIHRoZW4gd291bGQgYmUgd2hldGhlciBvdmVyZmxvdyAoYW5kIGhl
bmNlDQo+IHRydW5jYXRpb24pIGluIGFueSBvZiB0aGUgaW52b2x2ZWQgZXhwcmVzc2lvbnMgc2hv
dWxkbid0IGFsc28gYmUgZGV0ZWN0ZWQgLw0KPiByZWplY3RlZC4NClRlc3RpbmcgemVybyBpcyB1
c2VmdWwsIGJ1dCBub3QgZW5vdWdoIC0gdGhlIGV4cHJlc3Npb24gKGFkZHJlc3NfY2VsbHMgKiAN
CjIgKyBzaXplX2NlbGxzKSAqIHNpemVvZigqY2VsbCkgY2FuIG92ZXJmbG93IGFuZCB3cmFwIGFy
b3VuZCB0byBhIHNtYWxsLCANCm5vbi16ZXJvIG51bWJlci4gU291cmNlIGNvZGUgYW5hbHl6ZSBz
aG93ZWQgdGhhdCBYZW4gb25seSBzdXBwb3J0cyBjZWxsIA0Kc2l6ZXMgb2YgMSBvciAyLCBhbmQg
dGhlcmUgaXMgYSBBU1NFUlRfVU5SRUFDSEFCTEUoKSBpbiBkdF9yZWFkX251bWJlcigpIA0Kd2hp
Y2ggcHJldmVudHMgZnJvbSB1c2luZyB3cm9uZyBjZWxsIHZhbHVlcyBpbiBERUJVRyBidWlsZHMu
DQoNCkkgd291bGQgcHJvcG9zZSB0aGUgbmV4dCBjaGVja2luZzoNCg0KICAgICBpZiAoIGFkZHJl
c3NfY2VsbHMgPCAxIHx8IGFkZHJlc3NfY2VsbHMgPiAyIHx8DQogICAgICAgICAgc2l6ZV9jZWxs
cyA8IDEgfHwgc2l6ZV9jZWxscyA+IDIgKQ0KICAgICB7DQogICAgICAgICBwcmludGsoWEVOTE9H
X0VSUiAiSW52YWxpZCBhZGRyZXNzL3NpemUgY2VsbHMgY29tYmluYXRpb25cbiIpOw0KICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQogICAgIH0NCg0KVGhpcyB3aWxsIGNvdmVyIHplcm8gY2hlY2ss
IGFuZCBvdmVyZmxvd3MuDQo+IA0KPiBGaW5hbGx5LCBhcyB3ZSdyZSBhbHJlYWR5IHRvdWNoaW5n
IG9uIHRoaXMgY29kZTogc2l6ZW9mKHVpbnQzMl90KSBhbHNvIGlzDQo+IGJvZ3VzLCBhbmQgaXQg
aXMgYSBnb29kIGV4YW1wbGUgb2Ygd2h5IHNpemVvZig8ZXhwcmVzc2lvbj4pIGlzIHRvIGJlDQo+
IHByZWZlcnJlZCBvdmVyIHNpemVvZig8dHlwZT4pOiBXaGF0J3MgbWVhbnQgaGVyZSBpcyAtIGFm
YWljdCAtIHNpemVvZigqY2VsbCksDQo+IGkuZS4gc2l6ZW9mKF9fYmUzMikuIChJbW8gdXNpbmcg
c2l6ZW9mKCkgd2l0aCB0aGUgd3JvbmcgdHlwZSBpcyB3b3JzZSB0aGFuDQo+IHdyaXRpbmcgc2lt
cGx5IDQuKQ0KQWNrLg0KPiANCj4gSmFuDQoNCkJSLCBEbXl0cm8u

