Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A664B0DFFF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 17:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052831.1421618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEcW-0007WG-G2; Tue, 22 Jul 2025 15:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052831.1421618; Tue, 22 Jul 2025 15:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEcW-0007Tv-Co; Tue, 22 Jul 2025 15:09:32 +0000
Received: by outflank-mailman (input) for mailman id 1052831;
 Tue, 22 Jul 2025 15:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueEcU-0007Tn-Fg
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 15:09:30 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd3049f9-670d-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 17:09:29 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PA4PR03MB8246.eurprd03.prod.outlook.com (2603:10a6:102:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 15:09:25 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 15:09:25 +0000
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
X-Inumbo-ID: dd3049f9-670d-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZmQv8oWXhj7trWmnBxXWyZPrgKEeebQkpVPViQ4WR9mCwnKXHDNf837iRhnRtn1fotdAIXdYXJKNUzaupswJAeRAomylL/ONIwLTR1XE2dnaRUFsHsokERQI7SoMZMvIGGUY/EgqfPnwMxiojlgKhpexr/lnry+v2qzDnR1q0T/JyNJ55H5o8P2vSZJynvuJkeoxFc91MsUoilwB5jfEYCppHN27nAwQ+6tiYpdwuJuNTA1aMsZosNw5cCotM/SZz3aEctVTQsLmBukpZzXka+H0NXDHJMbizklxpw6ohQcpE9k0y22kk5qXPe3bX25UwTRh8M8jG5MyhuMWSzCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiZl2hKadnOYjPKOPYSN+FJRmuoG83vp0Qj5/gaprKc=;
 b=IF7Bb8axx289NXYZIvm5WXin/j20PLIqelDtgkcaMDmmSW2xrLlUHWZb/tn8rdDR36D1UNMEM7Bf13WJYPqi+BGC7V+Pdx9c5R7E/RtKsYF0/RU0cvoOATRpNdWjy6Py2BzofHlcuFdP+7KF3MhWuwP7s/kzdKBoGSIPsmgpPHwlj4TdLR1Wn6eu5i8StTuk5tS/ZB0k/jD5lrxYdXxSo7MvBaHBm3czL2ML9Up8fLWNwcVXfX944/mA3HQzj4HDOVudBSFBC6PIb4r0ngbsquduk/eKKga4Q/n9K6IGch8tTA9Obb6Ugg5NE8919CA140KzWnEYcilRoF1CZhdCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiZl2hKadnOYjPKOPYSN+FJRmuoG83vp0Qj5/gaprKc=;
 b=FLpob/bkCLyyfIcueoLq2rJrxHoVjdZwYHk+Qc6pjYtJ8DfjMjWEubqdjIwZZAl9tEo+o0haGKUBtQcFP7xFPQ8VNI5tjBsHleoHgGGREw2fLQwIvG8MrwNWYSxZYDUQzfijcqJZKIfwPGW/Bfoo+IvkWfAh8t/soCbCsXLFm8TBsGvnpvLNm4ysDKFXP/hHvy8llcc75b/TFQo9SgPuHKyKhdEOj0I4iVQ8slKn281b+u2aplQTMDx6xzGe0nCJHC8FcxZeBvYLNOkyOgjQo3BJ09LCrj+w05lseidY1weZqYRCctyvEAN69a46/ilKrFHsFH6HL0IAyFkksGYATQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v5 03/10] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Topic: [RFC PATCH v5 03/10] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Index: AQHb+v2WwNOcdkSTxEeQCZiMLfCc77Q+EFoAgAAu2AA=
Date: Tue, 22 Jul 2025 15:09:25 +0000
Message-ID: <1300e293-0467-4206-a6f4-3379ba821eea@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>
 <472d150b-3ba0-4c89-b72c-75eb8783cf52@suse.com>
In-Reply-To: <472d150b-3ba0-4c89-b72c-75eb8783cf52@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PA4PR03MB8246:EE_
x-ms-office365-filtering-correlation-id: 1d1964e3-03e5-44ef-5c2d-08ddc931bf33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QlNpY1FxVjRKN0piWXBJc1FoSDB1Q1dKeHRhcEEweElaOVdJWDJpcitzbHd0?=
 =?utf-8?B?MXJQUXJqMndJcnBkWjk2dE03ckhEM1oxdXF0bGNTRkVReW0wUmxIS0hVZ2o3?=
 =?utf-8?B?cnZOUTFlSmpUVWVGMzd2Z21oTnpDNjZTOWR3VDVkVjd5Qk5ralZra0tOQkR5?=
 =?utf-8?B?ZDdjTjRmcHpoSnQxb2xIcnVIWkdod2FQSHB1WEFjRkEzbGIwU3JWUHhYOU5U?=
 =?utf-8?B?a3ZhdHFJK1RHaEtKaU5nOG5weVVvbGVOT0E0SThXNjF0VUM4eTlMVU5rWisx?=
 =?utf-8?B?VFRBazRvMTh5YUgwcmZaNVFxZ1lwc3JzbU9ycmIvWWtVVVA3ZFBaK3lxemdN?=
 =?utf-8?B?MTluN0lpTW5VZjhReEcyR2FqVFlUdHhBSld4aWs2MlJKcENDTisrRG1Qekhn?=
 =?utf-8?B?Q3pzUElnRkFENzQvSGd4WlRGSU1pL0xFMVM0YURFNUFCaFhqUURIc0l4ZEUr?=
 =?utf-8?B?MU93SXBzOERPa3JkRDlXdXJlRFRUVGd2UkxKUmhkR0V6SUlBU0sxaHNWWmJ3?=
 =?utf-8?B?b0ZsUlprOTRiZHBYZTJ2cUxEOUdlalBYd0NmV2x1RkVVajdoaS9iT0tzaVFa?=
 =?utf-8?B?c3VMMmVIZU5CZ1pVOFR0RjltU3UweHhjMGhGRkJRcEJrUjZiNTh6aEE5bXpt?=
 =?utf-8?B?OUlNRGJDRm1aYWtYRXhtaVRLakx4WWs1T0d0N2VPSzIrRnlWRzVOY0VuZVJx?=
 =?utf-8?B?Nm13dkRoM3YvVWhTNHlKeDhjOWdDbEdJbmJydzZUc3ZNS2kzZ3lNeHc0c2tx?=
 =?utf-8?B?emJkVlduWGtwemVtZ09GZVZHRGo3dll5RTY0K1R0Mnl0bUZ2d3ZwWmhrUDZ2?=
 =?utf-8?B?M21sbnpKRjRjRFdDelJKSnlJRjF5RmltVjA5eUZZN1BWbDhQeHBBRHlpTll1?=
 =?utf-8?B?RTVjVENlR0RDWGFoTWJaK01nNU9zSCt3TTNBandpb2hMcXpGN3FFb1pyRDNC?=
 =?utf-8?B?MjFkbDdHdEVXUWVlU3BaVjZwelpRejQ3U3VLMUZQbkE5SnhwVWJjNVN3bEZ1?=
 =?utf-8?B?UU1NcStpN3FZM1QyS2dXSHQzMUdQOU1WQVpSbFJjc0VBQWN4bGFEVlhkdjR4?=
 =?utf-8?B?c3R2VGpUaHlmeG42K2JoQmUvUHFYd09UaXNka0l5aCtuU0Nka2V2dFo4WDRN?=
 =?utf-8?B?VGZ1d0RoWkFoWkVqS1BNeHd4cHJoUVpoVit5U0tvOVo3dnNtajZIT0IyUG00?=
 =?utf-8?B?RnJHNU55ckVlZnEzTzBGeWVjeXBDOExJQ2orc1FJZ2Vxbjh0TFdTekMvR1oz?=
 =?utf-8?B?djQ2SzJxZW1tSXBVM3lncWNFQUFObXQrMzNJZmtsYXV4NVVxSXpFN1k2a0Zx?=
 =?utf-8?B?cUczNS9qdzNtOHgrZCtGMHNaOGtxOE1ZSCt2SkRwekpLU3AybG01bEFnOElq?=
 =?utf-8?B?MVVEdHR1OWhMNG9FRUF1K21EWU5NZ1pvVytMSFdrWDlZNzRiM05PT1J1QTUy?=
 =?utf-8?B?VVVjVG12Ulc2ODhFRjA0Q2pla1hMK29kRDVIWnI5RDVWNUhlYmJPS2RUQllx?=
 =?utf-8?B?VVFSZE4yRWlTS3NITVRJM2RXOXhKU2pMYm9PUWNOb0k2R2tTd3h3V3NOdUpY?=
 =?utf-8?B?MjRGTnBIdisxNDhXSmtCRUQvWjZNWWNKMFpEVEh2bHJ3NXl1T2lQbkFDK0Y0?=
 =?utf-8?B?ZENCV0o5M0R0NjQxRldnaTRZbnl2WVVCaEM5K05xSUNqUU9vVGdmb3k2QmVW?=
 =?utf-8?B?YnBVWWF5OXJVRWROOHFyZEpaTlNCWi9nSElycXRaS1BYRjV3UHUzNmZ0amc5?=
 =?utf-8?B?OGthQUJLWDk0cWl5TkpDZnh2WUlnUHBJQUtRYkM2Q2ZsM3F0dGF0NU5RWnNZ?=
 =?utf-8?B?R0ZQUElHeUM1U0g5QTlqekN2aStScnY0ZVhQZW9MYVdSdDVqSDJIcU1STm5h?=
 =?utf-8?B?WkluQmRPUXE4NVpXNXJOd3AwSzN3eStLMzFPRkl4djl6bFpGR05lUmx6bVBS?=
 =?utf-8?B?S1Q1WHlqb09vT0FaRFdMd2JxcG9BaU04bWZIOU90M0M3aEJuS0J3Z3VtbEV3?=
 =?utf-8?B?clZieDEyN0xRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djVYeE1NeXdPd1YxYzQ5bWh2M2NyMmZXbFJlaENuMmNuY25sd3UycFFOWGtJ?=
 =?utf-8?B?Ujl4dFhKdXN1R0Q3dzA1VDV4Ylh6RU5kczNzbHJaRFIvMkRoTDZ3NldOTlMr?=
 =?utf-8?B?cWMrb1Z0Q3hMZDdWVG4xakxTN2tHSXhjWWhFNDhmK1VnYWwyTUJIQzVtdkhO?=
 =?utf-8?B?ekdMRys4czdPVXgwekdmZnRva3RCa2svbGRQZmRsL0VFUUZTNTdJTHlVRXp6?=
 =?utf-8?B?RXQ3UGd1aUZ4YmZKNGtxdVEya0NZV284bkJZTitrRDNtT2hhREw2djhra2tt?=
 =?utf-8?B?dG5LejQwNElDbTJpa3ZuenpoK2xFbzg2Q1c0NlM0d3lHLzlJVVdtK1dDVGE2?=
 =?utf-8?B?ZS84WFV4Wnp0blY1V1drV1VuNm90NmdqbU9selE3K2VFSEdUckxvcm01UDBv?=
 =?utf-8?B?cnBuNUVDRWRoSnN0UXBMSGtwQ3VsRXZSME9ERVFLaWNtOExzK0JrSEFXNXpE?=
 =?utf-8?B?UHhCREhiK3I1VGNLcC9ncVV0MWdOUllITTVBdU8vTGJzN1dvcWx3b2FOK2hE?=
 =?utf-8?B?NVk0Z2VxZTluWlBFVHkyUFZnYXduclRrd21FM1ZqN285NGNHaGxXeEFqTEM1?=
 =?utf-8?B?UVFOMSsrV1ZtazFsNFZoSlE5T240M2p3QmRveVZjRS91QlIrRG56K3dGNmJU?=
 =?utf-8?B?TnlnRDVSM29YTzdqTEZXdk9OVXF5UnBmVFBWdXZ5WUxWQW5qYTBDZ1VSazcz?=
 =?utf-8?B?ZnNrT3dnOGpXZDBHR1BnclVxdmIrVEIydHc3Vkd6UEdRdGMvb3FWODI4SDBn?=
 =?utf-8?B?OUFoSVQ3clB2VzZVNWZacFRqQTRpS2NyKzd3T2FMSGpmdWZqL3V2K1I5cDlw?=
 =?utf-8?B?My8xd2xFbTUrN2dPbmNjZ2xzMS82Vk9XR3poa0U4UHdyNVQ5TW5aQ2pkQ2s5?=
 =?utf-8?B?c01NbFViemxMQkxZTGZNcTRwOGZZQTNLYTFvKy94MzI3SHFVbW43OWc0R2xo?=
 =?utf-8?B?bXRxSjU0a3lsdHdCVk5Ia3FWcHpKRTVONXIyVzBNOHJGT0NZY0tydmVsSzRa?=
 =?utf-8?B?dzlYWnJObWJ2UmtWTDJNMWVCNnlEVzRBWkhYTWFzSDNYY0UwNTM3elh6WXk3?=
 =?utf-8?B?cmJwTjNmWkJQMWpIUFljWEpVS0xQRlplOWRGY1pqSmU0cEE0UGxjVy9YSS9l?=
 =?utf-8?B?eVdIOXV5NXo2SDhZZmxJeCtvTlVDTGxHMlpDN3BrSFB1WXNDU3hqclZmRVBY?=
 =?utf-8?B?b3Zub3hQQ0lXOThWN2ZpcWN6eEc0TXZnSkYrWVFUeWRNOFU3SHFwRkZsTXJw?=
 =?utf-8?B?M3Fob3dkdVVmVHNDWWhiWlhnbWNJVUdLWEVsZlQ1cTUvSWFWb2dTcEZTNE5D?=
 =?utf-8?B?ZVI3RHIycnRtQ3NscW1jYXF6V1BLZWhneE9oRzVhYkk5d2o4UURBNlYvdEZF?=
 =?utf-8?B?ZUcyUCtjTnVtSmVTUGtWdEVQZ3pQR3NWT24wcDFKTTlkRUhiZnIyQzRUVVRr?=
 =?utf-8?B?MURST040cW5mYmVxbnJnQ1hWQmpSWWJ3MVAyZy9Wb2c1ejBoK29DL1VJeURh?=
 =?utf-8?B?TFdFd1JQai9mS0RnMTdvQ0NtL1p6S1Z4c1pyeTJZa05QWjVDWXkvYy85QVBt?=
 =?utf-8?B?aHFaRmYySXhXUWROS3kxSkUxRDRxTGhsaXJFQjUzeFhKS2Y2ZmxsVW5KK3lz?=
 =?utf-8?B?R0xlYWttM3FodkJFZlpyc0MzSnFCek80T25GaHNPNG9LejF4aHlDUnFqNWlQ?=
 =?utf-8?B?akNBelQ0V1VxUUJGdURKdnV1VjAzejNLdFVCNWE0QnArNDUvNlVjYkZvLzVo?=
 =?utf-8?B?UkRTaFpaZ1lCYi9ZeW9kUEN6ejNkVXk0N1krbVIyZm9FMEdOaDdGSFJWdmpU?=
 =?utf-8?B?Q0RiQjhlRUxHODRmMkpFY21TbVVhaU5pMjJFQlpxczE1TnNCUEw0WjNCejZi?=
 =?utf-8?B?c3FvWmk4cndkc0QrSm9HVjlmQlB5NElFUXVnK1ZDOHRKNzVqWlovb0tRS1ZX?=
 =?utf-8?B?cWFMYmhzMm4wS1dyZUNWSElIb29mVGNydmo3d0lJcGcyb1NmeVlsS08wNzBh?=
 =?utf-8?B?cytKV2U5ZU1EZHdHbGdUVXQ4ZTU4VnViMGNCNHNhQW9TUjJlQjdFMlhpOGNG?=
 =?utf-8?B?Wis0dXdWTGw5RlJuT3FLWE1SQWNiNmlxdGJnMTBRKzlOaEtwOWp5VFVybkJZ?=
 =?utf-8?B?UnFWOENhMHM4L0JtZGRvNXYzNFphTG1Ka2hBc3BmUTdCdmtGeERZUnJhaTlp?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92B3568D13192348BAB24B3808157655@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1964e3-03e5-44ef-5c2d-08ddc931bf33
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 15:09:25.4307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3zpQklA2CqAAXOkRgDVZFqcvdYuEWDo3/rLIlmwfQf71eGkmwP3dgwkQ9ilyWO+oDpmUQCI0mhkpATPe3O89qQNJad/CmSY/BRyKUOfUgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8246

SGkgSmFuLA0KDQpPbiAyMi8wNy8yMDI1IDE1OjIxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24g
MjIuMDcuMjAyNSAxMzo0MSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiAtLS0gYS9kb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4+ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYw0KPj4gQEAgLTEwOTYsNiArMTA5NiwxNSBAQCBhZmZpbml0aWVzIHRv
IHByZWZlciBidXQgYmUgbm90IGxpbWl0ZWQgdG8gdGhlIHNwZWNpZmllZCBub2RlKHMpLg0KPj4g
ICANCj4+ICAgUGluIGRvbTAgdmNwdXMgdG8gdGhlaXIgcmVzcGVjdGl2ZSBwY3B1cw0KPj4gICAN
Cj4+ICsjIyMgc2NtaV9zbWNfcGFzc3Rocm91Z2ggKEFSTSkNCj4gTWF5IEkgYXNrIHRoYXQgbmV3
IGNvbW1hbmQgbGluZSBvcHRpb25zIHBsZWFzZSB1c2UgZGFzaGVzIGluIGZhdm9yIG9mDQo+IHVu
ZGVyc2NvcmVzPw0KPg0KPiBKYW4NCkhlcmUgaXMgYW4gZXhhbXBsZSBmcm9tIHRoZSBkZXZpY2Ug
dHJlZSBjb25maWd1cmF0aW9uIG9uIG15IHN5c3RlbToNCg0KIMKgwqAgwqDCoMKgwqAgYm9vdGFy
Z3MgPSAiZG9tMF9tZW09MzIwTSBjb25zb2xlPWR0dWFydCANCmR0dWFydD0vc29jL3NlcmlhbEBl
NjU0MDAwMCBkb20wX21heF92Y3B1cz0yIGxvZ2x2bD1hbGwgeHNtPWZsYXNrIA0KZmxhc2s9cGVy
bWlzc2l2ZSBib290c2NydWI9MCBjb25zb2xlX3RpbWVzdGFtcHM9Ym9vdCBzY21pX3NtY19wYXNz
dGhyb3VnaCI7DQogwqDCoCDCoMKgwqDCoCB4ZW4sZG9tMC1ib290YXJncyA9ICJyb290PS9kZXYv
cmFtMCBjb25zb2xlPWh2YzAgDQppZ25vcmVfbG9nbGV2ZWwgY2xrX2lnbm9yZV91bnVzZWQiOw0K
DQpJIGhhdmUgcmVmZXJyZWQgdG8gdGhlIGRvbTBfbWVtIHByb3BlcnR5IGFzIGEgZ3VpZGUuDQpJ
IHdpbGwgdXBkYXRlIHNjbWlfc21jX3Bhc3N0aHJvdWdoIHRvIHNjbWktc21jLXBhc3N0aHJvdWdo
DQotLQ0KT2xla3NpaS4=

