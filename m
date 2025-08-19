Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90922B2CC1D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 20:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086979.1445140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoR9F-0007ZC-Bb; Tue, 19 Aug 2025 18:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086979.1445140; Tue, 19 Aug 2025 18:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoR9F-0007WE-8I; Tue, 19 Aug 2025 18:33:29 +0000
Received: by outflank-mailman (input) for mailman id 1086979;
 Tue, 19 Aug 2025 18:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1y2Z=27=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uoR9E-0007Un-1u
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 18:33:28 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe26ad99-7d2a-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 20:33:25 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB6868.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 18:33:21 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 18:33:21 +0000
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
X-Inumbo-ID: fe26ad99-7d2a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xr0Wi5Qv0ellTElOnriWx6N/GuAe+de9gUdP5uZL6RoLDZkqF/9QOQVEJVeKtNE8K5/TjNchb+dnLW+jgALDh1AsxwERevijJdn/Es1j92bAslq5YjN99VbAoYaFbMeZ1D9BEzMQM32ibP0e15if54cRPo2XdJczh62R3ZEpfZqDDtrklUFLVjI8/05H4F9S4vR02dytpLR77v3jDLkj0zFQqNe30Rsm0XJVF+S4aw9esWhVxX7Wjo5wuIbCNpp9CUroiHKxHhltt5GDP+7Vd1CNGG1Fi0RTlqKFv8LtcHI40/VX6Z3qFtSLlL+m3+j1U57rNXjq0vr9FYSak4SOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3VwEsLRkfi8LA2LlMMSvtpPduGc9+igZfMWlXI5awo=;
 b=tPS1GBgl/QoAfwppopa6xVkgTsY7drkCr+41nkWrCnLnDJ0FpvIC4MF5mz3UzznAeYsYVkPTqALKiAsZWGUu3CvvppVNU+Ma5PIN4cQkScpvcYxlAn99Z5u/LqFzaPjv29LPEAFBB7QAWR2HJochPC3mtUvavFfEmHSiHDWSjGz3W6PnUiOv280wa69rpee+U1IrL9u9dwow+j2IeAZSKqA2pi5O2YHbKK+H/TY8YO3Owe5KijH5Cmh7BF8bELK6lhTsVnPvEvcEJY08ISCiHS2VfaNA38YjsMjoR+7EP2f4SDWPpkLOf85SuDygfnY91obl1wPuyX+eta6aIY7p/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3VwEsLRkfi8LA2LlMMSvtpPduGc9+igZfMWlXI5awo=;
 b=XtF61tee9KfVVxvJi36CraAm1PPwA3OjhdKf9HEZ69j6mcK4vqQFuvUkf4BtFbSNfgLwTo+wooUjE8G7oRyKdY95Nr44cBS15stAZYPxyLzvugGxJU+eQHPUkTPR+BJ3+Pxo/nFKPmVFFtszAlXlV5Yq5YBVqJnC7i2mX3srvckOL4YXf3iopYdxe+MF49JOPezLCziBFxyGBSvXQWu7Lnc10X7UhvPivK9Yv6APmC9mptpLLjm4+Ql2bn+7V9/sDDB+PGOSbh2V/sAU7GNznQP0uoIDajaY5dUieMxhkaANox0fZj8jqI9tPWzvCtJ4fO5DRkDIwIDn/qmcZmK6qA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation for PrintErrMesg() function
Thread-Topic: [PATCH] misra: add deviation for PrintErrMesg() function
Thread-Index: AQHcEQr89D/JS5GCrUaBbORYWk1wAbRp920AgAASxgCAABODAIAAL66A
Date: Tue, 19 Aug 2025 18:33:21 +0000
Message-ID: <0520f673-4157-41f2-9b7a-7a84232cf780@epam.com>
References:
 <5944d87aae330246b7dab6eebd04d5d71a7d7e8f.1755608417.git.dmytro_prokopchuk1@epam.com>
 <37c61f78-b723-4611-b9d5-f915f72f36e8@suse.com>
 <7bd11401-bd8d-417b-90d5-e52a501211ed@epam.com>
 <195b9a3b-c15a-4bf8-a0e4-2255ede95310@suse.com>
In-Reply-To: <195b9a3b-c15a-4bf8-a0e4-2255ede95310@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB6868:EE_
x-ms-office365-filtering-correlation-id: 4dfa8785-b565-4385-b490-08dddf4ee002
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NzJ4MGVabG1pK1FYTENYVnoxYVZmSjJPeEZZV2ZJeFc2OXVWdFhaa0tCRFNK?=
 =?utf-8?B?STZBcjlTYVkzVTFienBuZ1F5aHlpeU9PbHR4bmxSVWRVWTBkejFwTkJ4MkMx?=
 =?utf-8?B?Njh5T0RmbTA4WnZxaUpzekJmREFSREoxd1M0ck9MNk85V1VxMVQzbEpmREcz?=
 =?utf-8?B?T1RCbmlBVXhoL2NhVWxtakpjTGxsVGZlMUYxZnNwUEw3RThiZEVPNVJYK2po?=
 =?utf-8?B?S21HUEtlUTB4V0wrQjNPQXB5L3ZNd2lnYzc2VTVLRWlkbUlvMFJncVNhNU9E?=
 =?utf-8?B?bGExTkZ3cklxZkMxTGM0SVlEZWtLNjh6SE5EZDEybkhNMkhjMFR1OVdvUjJr?=
 =?utf-8?B?aGVlaE05R2R6L1orTHhqMVkza2tXUEdPSmVYaUNEWHgvNEt5NHhsL0tJV2pP?=
 =?utf-8?B?TDdUSjFqYVNOUDdKTEJoM2pTb0VSWVRBZS9wS2FCK0ZpUEkwUjZLUWl3U1hE?=
 =?utf-8?B?Z3ZyMnZlRjdzNEptTFNrQVdxVFdDY2NJM3hGdHNrS25xbURNdnpjZ3JKT3NS?=
 =?utf-8?B?c3ZQM2ZLcGJBZ2U5VlBHZ0pPbW85dFNzbG1HOHBkMTZWM05jaXFxTk1VNjR1?=
 =?utf-8?B?eXcvdHd4REErT1V4bWxGbG5uN2Qxc1RXbmxROUpRd1E0Q0hTV2hITFV4QzBi?=
 =?utf-8?B?QTJyeUlFMEhjLy96cC9RcWU3Sko2T3NCaTBiWitQczIvdzFsSythS29YVmtV?=
 =?utf-8?B?VFVub01ZTVZtb3FkMm5uOGozT0ZucEt3anFrQ0dWNjEwZXJNc01kU0xmcGtS?=
 =?utf-8?B?ek1FYmlZZ2xIcGNpczRxcnd4RlJPamJESHRjdVZVbXdYU1hBTjZpcXNGVm8w?=
 =?utf-8?B?S0IwbnQvU25HdG1uUlBtdEN6cG9EUUwxR3JZcS9zUm9IenZwblYybk1ZWkZx?=
 =?utf-8?B?ZVBOR25VN2VrbytqVm1aYi9SYURtcmtua3ZYYTk0ZUFUZTVYQUhNenlaY09W?=
 =?utf-8?B?RkFOMjRMYTRUL2NuMjRYZWVwV1ZOT1FGOUxRd1JHdHJKMDVwdi9OcGNsLzFF?=
 =?utf-8?B?eEZKbU1LeXlyOTVqalZneE9IcjVVeS9jS1UyNUxxWTBlakY0ZytrekpvQjNU?=
 =?utf-8?B?WE5iNnZTK3RKVDJ2Ny9VT0VqVE1tSEkyZkphTWZOQm01ZFdwUmRqTkdOMWJP?=
 =?utf-8?B?Ui9tWllaUWE4TE1GSkN6OWQwNFB5bEljcUpyVlJtaDZySWxXK2hUVVJBTndy?=
 =?utf-8?B?RVBvYU5ZR2ZPSC9sVHkwNFZaeENtUCtGN0lJaWRtWXVFc1BCVGlqVWF0dXFu?=
 =?utf-8?B?NGFxT1pzOE9oRlV4czhwQ09mUDJ4OWZXTjFGVTNzb1E3NkRBSkFsWExrblE2?=
 =?utf-8?B?c1J6RFhsRURReTd5SER1TDB1a0xvV2Z1RktOUlZFMDBGTndNdXVFUmJuS3Av?=
 =?utf-8?B?TTloQXNBWGN3ME1lSlpIK1ZFRjRrZ1FJWEgzK3lkYTA1enFQREJyMzJDd3Fm?=
 =?utf-8?B?bk9YSE1MMS9TYzBrSGJKakoxQlFVSmRxd3ZXUHBJaGhydkkzdDFmaG41M3Nm?=
 =?utf-8?B?eWtLd3pxcndtdDlIVkNHLzJ6VmcyOFNVaWtOYWF1VVVlekc3RSt4QllpZ1ht?=
 =?utf-8?B?MWJjRmVjM3Fvd1BTWlFRL0JCaWVtNk5LVExIcy9NU09mM2pwS1JFclhIUWlX?=
 =?utf-8?B?V21NYXdITTQ3SFlrZ2cxZDZnUk56S2lhb0hlSWQzNEpXcEQreEVRcDlnZnBI?=
 =?utf-8?B?RGJ6bERkODh1Vml3U09FNTl6SURXUDhTekZRMFJrZFlQb3pwNWJ4RWFaYit2?=
 =?utf-8?B?TUMxZURmdTN6Z1UvVVBXVGtYcVBSclpMSDg5alB2TU1iZ0hKVTZTbFBDUEVU?=
 =?utf-8?B?Z2tGazlWVFNub3IwYnYvbEtlVnp2UkhTSkpUNFN1ZWF5elFHSFQranZLK3o2?=
 =?utf-8?B?Rm9KQjBNWTAvNnlZNFc0VzVPUnJTYVhaSUxCOTNQWXR1Ry9xRkZpdmphb3pN?=
 =?utf-8?B?cnZpVkRmYW42WUNlNGZqU1gvREJmcDZlNTRJckZOVkZSWmEvSHdheDlPa29h?=
 =?utf-8?B?VU53bXlkYndBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXErNGQwRFl5SG9UMTlxc05BbnFKUDJzRG8yb2pvNEFscnR3cDF3Z09kQVYr?=
 =?utf-8?B?c29qUkUxUFYwdDRiUXQvdjNMWjlzc0hVOVBTNkJoN1FPdEh3Q0pvclA2NmVR?=
 =?utf-8?B?clpXOVd1ZGpVWUllYzVFbUM0QmY1NXNMYTlRYUpPMTVlYmV2Z29pMEhUbzR6?=
 =?utf-8?B?bDArS1hoUm4xZHlqaWIwanJTTmNhMnFPUVNDZWVVU3Fma2g4VSt1SmhiZzRX?=
 =?utf-8?B?SHhoUkU0ZDNZY2xEZCtDTmVWeG1rNk1qVkVvWUpCS0J4bDIvMHpRN2trSWsw?=
 =?utf-8?B?M0NzT2I5WU8rbWJXc0NWdmZEVlR5Nk1VaHN6cG5BNUM0VjI1WnRBZDZKU0Ju?=
 =?utf-8?B?MWRLdHFpbzYzWU5VNFhVRksrYkZITFF6SzNncXltZWRLK2pJK2hZLytPdzh6?=
 =?utf-8?B?YzVzTFF1MzRpdDJTRGRQQms1MUYxODBaWjk1a0s0clgvRDlZRW5uaGdibndD?=
 =?utf-8?B?M3Jha010TzgweGdEUEQzeTJTSzk2Z0N4WUVJVGZoRkVkM3Fsam4wb2Z0ZHd1?=
 =?utf-8?B?eWtYWG43aWs4LzJML1hUTzc4Qm5BeTdpbkNFUnJhRXlQSVlxM0Z5RS9ac0Na?=
 =?utf-8?B?YmEvQ3FraUVwUWZWSVBFakpiMlIyQk9kY2hIQ281RGRIcHB6Mk02R05ESXZR?=
 =?utf-8?B?NkNOazFjNVVHeUxOTkpoOFNHQlNSeWVXdktCUEZuVnR2T2pMN002QjZ0MHIy?=
 =?utf-8?B?V0hOcGNJa29ONnh4MjFURFBrN0ZRKzZUa1ZqNnhMK1g5dlRKZ0N6Rk5HbjdO?=
 =?utf-8?B?UVEyendvYUFHUG5qSGhKOTduV3IwWmE1NndVdTNtNERCd0Fhc2ZQQjdYSjVJ?=
 =?utf-8?B?elJlWXR0QmR1eVFGZmJyUjhWMGt0OVljYmFXTHZBVVdqL1NmREJ6SkUwMEI0?=
 =?utf-8?B?eE15SDVtOFpYdWdxSk5UOWJDWmVYZnFkYW1CdXA1NENuL0t6Ymd4dW9RVXR6?=
 =?utf-8?B?cVpxbE5KTzlnNm93M1ZWRFdlUm53LzJ6SDQ3MVZldVpadkZUV2NKclJ6Zzk3?=
 =?utf-8?B?eFhTSkNtM1RVb2pjVFN6L1VETmNqMVhwTTF0eXVPZ2htSDZVSzJwVTVubmdo?=
 =?utf-8?B?Qzk4akxNYnJQWTJWcEtjREEzNG9pWmZZSDhwNVd5eDQxckJBRGlHTXppNXR3?=
 =?utf-8?B?Y2hxb29LOFM0UGZoOW1RNklXdFd6SGdoOUU5a2xkSjYwUGdpODBFdEJGanhk?=
 =?utf-8?B?SXJKVGNjZE1JZll3NnppM05GWG9mME53bmdsQU42WXBMNXY3UVliT1VuNHRT?=
 =?utf-8?B?YmtjTVNEcFFMUEhxSDRVTXJGcXNCTENwUjlCTHF5WEhnSWVCVGl1OWd0N3pU?=
 =?utf-8?B?VUNHVzhBVGpJMHZOU0xEZ3U5cmZTMUdQV2k5UFpGQWtFckh1RkdYZ2xWSDEy?=
 =?utf-8?B?R2RZR2U2RWo3Q2UyMm5hVE5OSFh6UHNyMk1IdWd0S0NuZ0J3YUxraVpIVjBl?=
 =?utf-8?B?LzNaak1Dc0Vmek4zWUlkb0Jtai95d1hFOXUxc0FvUTgrZWdMM0NwU29lT0Iw?=
 =?utf-8?B?QVJKWGFsVW1BSEQ2UHpRazNEYlFaV3JoSVYrcGNNdklRaVROUTVrbmZTTU9X?=
 =?utf-8?B?TUJub3ZPdDYxTHlxVmpEbHdPQnVTV2dTdzQ3blR2dlJsZjA3QXlYVWtSRTJj?=
 =?utf-8?B?cm5Kck1OcWdrYTBGZzJ2eG8rMm1ZY0FrS1R6Kzd5NENMRGJWTS9GY2hHdHor?=
 =?utf-8?B?WUNQOXpiRndIMVZkQ1NGMU5MSDZxZEw1UTg4dGRvdnBtc1hSbGFnNXF3VU8z?=
 =?utf-8?B?M2xuZEJ2QUw1ZGNhbEcrYktVZWE1cXEwaEhPd3ppRERIQUxVdnBmRWhnODlM?=
 =?utf-8?B?QUdxNU1ucFNISVM3TEN6ZlZsek5SKy83RW1wQkZjSlV6VVY3UHVBWE00MjY4?=
 =?utf-8?B?S2VHeWc0SHp5VHZsVW5HbzFMSENEZ0RwQnl0UmJlT0tORk1LUUd1MmN6RW1h?=
 =?utf-8?B?S3JzRlpHVHNhTmJpbTFPSzNiajNFdVBhVFhDV1FQUXZPcFVUazVtbmYvb2lR?=
 =?utf-8?B?SVVOUmlVTFREU2UxZjhGK09IUzA0NzE2c1lSK3VYMjhtbldqc0pEeUhZcGNa?=
 =?utf-8?B?VmR3anNLOStweGZTc0xFNXcyUzI1VWlTQXBsZmVoVUJIaExJaUt2aFhVQ2xI?=
 =?utf-8?B?dkVUZnhtZzRRMEdTUWpDM1JBMlpjbGtSMm51bU5PMk8yVUx1LzBiNGlCYmlX?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F01B41058BB414428D04FAF335B30D9D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfa8785-b565-4385-b490-08dddf4ee002
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 18:33:21.4835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzRKEwgKzTCO4IoVgIIaMxpvFpUe4c0GohmwtVAoHiRGFYqQApdY/XUSg8E1chW+CKtBGH6A+X+yyyTgeMehFJza0unfTdLzZKchgrdQn5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6868

DQoNCk9uIDgvMTkvMjUgMTg6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wOC4yMDI1
IDE2OjMyLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBPbiA4LzE5LzI1IDE2OjI1LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxOS4wOC4yMDI1IDE1OjEyLCBEbXl0cm8gUHJva29w
Y2h1azEgd3JvdGU6DQo+Pj4+IE1JU1JBIEMgUnVsZSAyLjEgc3RhdGVzOiAiQSBwcm9qZWN0IHNo
YWxsIG5vdCBjb250YWluIHVucmVhY2hhYmxlIGNvZGUuIg0KPj4+Pg0KPj4+PiBUaGUgZnVuY3Rp
b24gJ1ByaW50RXJyTWVzZygpJyBpcyBpbXBsZW1lbnRlZCB0byBuZXZlciByZXR1cm4gY29udHJv
bCB0bw0KPj4+PiBpdHMgY2FsbGVyLiBBdCB0aGUgZW5kIG9mIGl0cyBleGVjdXRpb24sIGl0IGNh
bGxzICdibGV4aXQoKScsIHdoaWNoLCBpbg0KPj4+PiB0dXJuLCBpbnZva2VzICdfX2J1aWx0aW5f
dW5yZWFjaGFibGUoKScuIFRoaXMgbWFrZXMgdGhlICdyZXR1cm4gZmFsc2U7Jw0KPj4+PiBzdGF0
ZW1lbnQgaW4gJ3JlYWRfZmlsZSgpJyBmdW5jdGlvbiB1bnJlYWNoYWJsZS4NCj4+Pg0KPj4+IEkn
bSBkaXNhcHBvaW50ZWQuIEluIGVhcmxpZXIgcmV2aWV3IGNvbW1lbnRzIEkgcG9pbnRlZCBvdXQg
dGhhdCB0aGVyZSBhcmUNCj4+PiB0d28uIFlldCB5b3Ugc2F5ICJ0aGUiLCB3aXRob3V0IGZ1cnRo
ZXIgZGlzYW1iaWd1YXRpb24uDQo+Pj4NCj4+Pj4gLS0tIGEvYXV0b21hdGlvbi9lY2xhaXJfYW5h
bHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+Pj4+ICsrKyBiL2F1dG9tYXRpb24vZWNsYWly
X2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4+PiBAQCAtNDEsNiArNDEsMTAgQEAg
bm90IGV4ZWN1dGFibGUsIGFuZCB0aGVyZWZvcmUgaXQgaXMgc2FmZSBmb3IgdGhlbSB0byBiZSB1
bnJlYWNoYWJsZS4iDQo+Pj4+ICAgIC1jYWxsX3Byb3BlcnRpZXMrPXsibmFtZShfX2J1aWx0aW5f
dW5yZWFjaGFibGUpJiZzdG10KGJlZ2luKGFueV9leHAobWFjcm8obmFtZShBU1NFUlRfVU5SRUFD
SEFCTEUpKSkpKSIsIHsibm9yZXR1cm4oZmFsc2UpIn19DQo+Pj4+ICAgIC1kb2NfZW5kDQo+Pj4+
ICAgIA0KPj4+PiArLWRvY19iZWdpbj0iVW5yZWFjaGFiaWxpdHkgY2F1c2VkIGJ5IHRoZSBjYWxs
IHRvIHRoZSAnUHJpbnRFcnJNZXNnKCknIGZ1bmN0aW9uIGlzIGRlbGliZXJhdGUsIGFzIGl0IHRl
cm1pbmF0ZXMgZXhlY3V0aW9uLCBlbnN1cmluZyBubyBjb250cm9sIGZsb3cgY29udGludWVzIHBh
c3QgdGhpcyBwb2ludC4iDQo+Pj4+ICstY29uZmlnPU1DM0EyLlIyLjEscmVwb3J0cys9e2RlbGli
ZXJhdGUsICJhbnlfYXJlYSheLipQcmludEVyck1lc2cuKiQgJiYgYW55X2xvYyhmaWxlKF54ZW4v
Y29tbW9uL2VmaS9ib290XFwuYyQpKSkifQ0KPj4+PiArLWRvY19lbmQNCj4+Pg0KPj4+IEkgZG9u
J3QgdW5kZXJzdGFuZCB0aGUgZGVzY3JpcHRpb24gaGVyZSwgbm9yIC4uLg0KPj4+DQo+Pj4+IC0t
LSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+Pj4gKysrIGIvZG9jcy9taXNyYS9kZXZp
YXRpb25zLnJzdA0KPj4+PiBAQCAtOTcsNiArOTcsMTMgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRv
IE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+Pj4gICAgICAgICAgIFhlbiBleHBlY3RzIGRldmVsb3Bl
cnMgdG8gZW5zdXJlIGNvZGUgcmVtYWlucyBzYWZlIGFuZCByZWxpYWJsZSBpbiBidWlsZHMsDQo+
Pj4+ICAgICAgICAgICBldmVuIHdoZW4gZGVidWctb25seSBhc3NlcnRpb25zIGxpa2UgYEFTU0VS
VF9VTlJFQUNIQUJMRSgpIGFyZSByZW1vdmVkLg0KPj4+PiAgICANCj4+Pj4gKyAgICogLSBSMi4x
DQo+Pj4+ICsgICAgIC0gRnVuY3Rpb24gYFByaW50RXJyTWVzZygpYCB0ZXJtaW5hdGVzIGV4ZWN1
dGlvbiAoYXQgdGhlIGVuZCBpdCBjYWxscw0KPj4+PiArICAgICAgIGBibGV4aXQoKWAsIHdoaWNo
LCBpbiB0dXJuLCBpbnZva2VzIGBfX2J1aWx0aW5fdW5yZWFjaGFibGUoKWApLCBlbnN1cmluZw0K
Pj4+PiArICAgICAgIG5vIGNvZGUgYmV5b25kIHRoaXMgcG9pbnQgaXMgZXZlciByZWFjaGVkLiBU
aGlzIGd1YXJhbnRlZXMgdGhhdCBleGVjdXRpb24NCj4+Pj4gKyAgICAgICB3b24ndCBpbmNvcnJl
Y3RseSBwcm9jZWVkIG9yIGludHJvZHVjZSB1bndhbnRlZCBiZWhhdmlvci4NCj4+Pj4gKyAgICAg
LSBUYWdnZWQgYXMgYGRlbGliZXJhdGVgIGZvciBFQ0xBSVIuDQo+Pj4NCj4+PiAuLiB0aGUgdGV4
dCBoZXJlLiBQcmludEVyck1lc2coKSBpcyBub3JldHVybi4gV2h5IHdvdWxkIGFueXRoaW5nIG5l
ZWQgc2F5aW5nIGFib3V0DQo+Pj4gaXQ/IElzbid0IHRoZSBwcm9ibGVtIGhlcmUgc29sZWx5IHdp
dGggdGhlIHRhaWwgb2YgcmVhZF9maWxlKCksIHdoaWxlIG90aGVyIHVzZXMNCj4+PiBvZiBQcmlu
dEVyck1lc2coKSBhcmUgb2theT8NCj4+DQo+PiBJJ20gYSBsaXR0bGUgYml0IGNvbmZ1c2VkLg0K
Pj4NCj4+IEFzIEkgdW5kZXJzdG9vZCB5b3UgcHJvcG9zZWQgdG8gaW5zZXJ0IHRoZSBTQUYgY29t
bWVudCBiZWZvcmUgdGhlDQo+PiAncmV0dXJuJyBzdGF0ZW1lbnQgKHdpdGggcHJvcGVyIGp1c3Rp
ZmljYXRpb24pLg0KPj4NCj4+IEFuZCBjdXJyZW50IEVjbGFpciBjb25maWd1cmF0aW9uICYgZGVz
Y3JpcHRpb25zIGFyZSBub3QgZ29vZCBhdCBhbGwuDQo+IA0KPiBOb3Qgc3VyZSBob3cgdGhhdCdz
IHJlbGF0ZWQsIGJ1dCBhcGFydCBmcm9tIHRoaXMsIC4uLg0KPiANCj4+IEFtIEkgcmlnaHQ/DQo+
IA0KPiAuLi4geWVzLiBZZXQgaG93IGlzIHdoYXQgeW91IHN1Ym1pdHRlZCBoZXJlIHJlbGF0ZWQg
dG8gdGhlIGlzc3VlIGluIHJlYWRfZmlsZSgpLA0KPiB3aGljaCBtYXkgYmUgYWRkcmVzc2FibGUg
YnkgYSBzaW1wbGUgU0FGIGNvbW1lbnQgKGFzIHlvdSBzYXkgaW4geW91ciByZXBseSk/DQo+IA0K
PiBKYW4NCg0KVGhlIEVjbGFpciByZXBvcnRzIHZpb2xhdGlvbiBhcyBmb2xsb3dzOg0KImNhbGwg
dG8gZnVuY3Rpb24gYFByaW50RXJyTWVzZyhjb25zdCBDSEFSMTYqLCBFRklfU1RBVFVTKScgKHVu
aXQgDQpgeGVuL2NvbW1vbi9lZmkvYm9vdC5jJyB3aXRoIHRhcmdldCBgeGVuL2FyY2gvYXJtL2Vm
aS9ib290Lm8nKSBpcyBvbmUgDQpjYXVzZSBvZiB1bnJlYWNoYWJpbGl0eSBvZiB0aGUgbmV4dCBz
dGF0ZW1lbnQiDQoNClNvLCBwYXRjaCB3YXMgYWJvdXQgdG8gaWdub3JlIHZpb2xhdGlvbnMgaW4g
ZmlsZSAneGVuL2NvbW1vbi9lZmkvYm9vdC5jJw0KKGFjdHVhbGx5IGZ1bmN0aW9uIHJlYWRfZmls
ZSgpIGlzIHRoZXJlKSB3aGVyZSBhcHBlYXJzIHRleHQgJ1ByaW50RXJyTWVzZycuDQoNClByb2Jh
Ymx5IHRoaXMgaXMgdG9vIHVuY2xlYXIuIEFuZCB2aW9sYXRpb24gbG9jYXRpb24gKHJlYWRfZmls
ZSgpKSANCnNob3VsZCBiZSBleHBsaWNpdGx5IHNwZWNpZmllZC4uLg0KDQogRnJvbSBvdGhlciBz
aWRlIHNpbXBsZSBTQUYteHgtc2FmZSBjb3VsZCBhZGRyZXNzIHRoaXMgY2FzZSBhcyB3ZWxsLg0K
DQpEbXl0cm8uDQoNCg0KDQo=

