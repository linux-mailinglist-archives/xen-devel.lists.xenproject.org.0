Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BFFAFCC52
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036554.1408811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8Yr-0000qo-Ac; Tue, 08 Jul 2025 13:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036554.1408811; Tue, 08 Jul 2025 13:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8Yr-0000om-79; Tue, 08 Jul 2025 13:40:41 +0000
Received: by outflank-mailman (input) for mailman id 1036554;
 Tue, 08 Jul 2025 13:40:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSBT=ZV=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1uZ8Yp-0000of-Lt
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:40:40 +0000
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c407::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 203205b9-5c01-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:40:35 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by OS9PR01MB12357.jpnprd01.prod.outlook.com (2603:1096:604:2e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 13:40:29 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 13:40:25 +0000
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
X-Inumbo-ID: 203205b9-5c01-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU06isWhLpinqpsjEBesF15kkIUGKZVbDYmjubKgu/4qGeDDiUlLqCYMJIabSjzuxime+cqkc7OG3ENDNmjR4J32QkeZs92Y7EcOaNJsepkL86uoWk3wzU6IUZ/lJU1dC9gZCxjIC624r+tiRxsp7HAVLb+yIzV4D0vtqbHZdzxUOs7k38Y2Dfd2E7B2i6jhMPOhcMh8YyJ28nft5IR8LQSgo4RHuob4wTo5fVTDzN5KVs3qjJnM52o9U/7ogKu/II7DgCZY3rUhfj18oJBqn/Zu6y5bsz9cna5yeRuqo4kJwRvEiGwQPMt7eBDKAsp9CFTbf/5BnFzJbClo2hZ7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AO417CGVu1h66xhJck4UTI61OKUDH9UTJSro8tUa+c=;
 b=MAusAC4oDexVf757xTnhlIMXIYe+Nzdy45GzsfkRWkkC7SAFsDOGj+CGpa0+nnlkgO6c+tj3xCf2kDodcTK+9zzJNvG4MjOsof1PMpBAVBMWY17jQYKUFGUnrk9mrHZColAG05k+T4xpu4u1VorTnXF4ZJrdqlE9oZVNeBTjJAA5/QpSj/EQX903Jv5ExrFf4GhuDYuBw3LbM2OBiNBbRvJmhsCm3oCx+e9eXWK0zxM/JC6jBciBPVMaNDB8uEkEC2ZW7SrTpmVJ8AYYi3d9tcTeTHX8LkbV131a0x/4udszktFe/hAmEWTA/Bu9L1wJ4bNHErTGNgvQmgGsQVp9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AO417CGVu1h66xhJck4UTI61OKUDH9UTJSro8tUa+c=;
 b=cd1sUPM+WvzYSS+UceHFLbkwEidgHOaxJPcXMc1j7ORo/F0uwdPLVnW3VKKQ6AaacITqUx3Fsf22zcl7Rr4OllPQWD3e2LsLamOFfQrM3axQokjI+w6foM1wx8fnL7I9xcY8xT9tsAqN0GdCjCl0ffbTaaNge+MCXImO7tGhzXM=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Andriy Sultanov <sultanovandriy@gmail.com>
CC: "anthony.perard@vates.tech" <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] tools/xentop: Add physical CPU statistics support
Thread-Topic: [PATCH] tools/xentop: Add physical CPU statistics support
Thread-Index: AQHb7/4FGehggkKGsUyTQlD7iNI2ErQoL1aAgAAG5DA=
Date: Tue, 8 Jul 2025 13:40:25 +0000
Message-ID:
 <OSOPR01MB12408A711DB657DB9E16BAB12AB4EA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250708114632.3007693-1-jahan.murudi.zg@renesas.com>
 <cf9503db-2726-4d0c-8b2c-da5fc7aa205b@gmail.com>
In-Reply-To: <cf9503db-2726-4d0c-8b2c-da5fc7aa205b@gmail.com>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|OS9PR01MB12357:EE_
x-ms-office365-filtering-correlation-id: 964a9f7b-0823-4cbe-d910-08ddbe24feb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K0krTVRVVHluVnIzQ25sNksyMVBPSGIxNG5JenFxbUZqQ1g0bUZ3bSt0ZTdh?=
 =?utf-8?B?NzFmTWZGNFprOHB6dDI4OXNCb3loQ29oMkgyRHFZb2JhdE5DOU9mRVlJd1pP?=
 =?utf-8?B?U2EwKzFXdEtPbEg4N05VMTByRElMTHEzbVZxTUpjcGR0a0txLzZWdnp6eHRR?=
 =?utf-8?B?RCtOM2grTFVCdWFqVCszZG9QTzJYejA3WXlqOERVOVUrMEFsRTIyUWtKSitO?=
 =?utf-8?B?N0t5Z1JMVkR4NkF1RHV0dlRUZDNCY04wVWZxeVZaRFVHSFVlY2dIdEhSU0VD?=
 =?utf-8?B?MXNxZjhJR0x5YldoTXdLSXJYZ1U2a0FsQXhzVVczRnhCdFQwNE01cmJURUpM?=
 =?utf-8?B?NDNmZ3llOWoyVTU3b0U4UVJHaDRlMG1OUkJtWnhCSFpuNThrWURXLzhNeHFj?=
 =?utf-8?B?MUtYOWNNMnZsQXZmeE1yOVRTWS9PY3pqU2cwQVg0RkJXZVBtRDliNlBPdFo0?=
 =?utf-8?B?RE5jMlhidCtvVlFEaHhGQTlSb0NWbXFFT3lpWk9tTyt0NG1RVlVyVmV5TnNN?=
 =?utf-8?B?dGVMa2NySGdjYVVjQjNoSXY3dk51MG53OHJ4Z21mckUvL1ZleVM0TjNtQ3RB?=
 =?utf-8?B?WGpFeWduQjdZT3BvWXU0MjY1UjY0ZGRPcWY1RHJmaTBvdVBLQkQzaXJ2VDhG?=
 =?utf-8?B?d05vNHNzYmh2Yyt2T3p0NEt5dFFCT24xVUNhWnN2NHZSS1gzY1lER3VEWDFK?=
 =?utf-8?B?d0o1Z3AxQnUrL3B5azBOTHVyT1pRSU5Za0RUaDJDTUpNNW5GYVp6aytqTzhZ?=
 =?utf-8?B?ZTNuanpORzk3SWtzalpyc0FBUmo0QjdpOTRSYURKQmRmdmxldWxEd29Ea2M0?=
 =?utf-8?B?S1FLdmZXK3Bqb0JJbVpWZ01jTUZSTVlhVWU4c2hPdUtkWk1ERUhKTmdEbjFh?=
 =?utf-8?B?blFNM0gxZHU4MGdMUm9vYkNScCsrNkl2THNJNWk0UCtNQSthU1lIdDZoQ0di?=
 =?utf-8?B?Y25VRmxuQ1E1Q0ZNNkIxNlQ1ME0zcW9Qelpxd3JpNEtqWVhqQzlNZXJVZXRl?=
 =?utf-8?B?MGFjVDRnWTBrQVhEK1pIc1hvRmRQMFNpTU9rNGpDZGtuTVB5K1FZWjh5dzdS?=
 =?utf-8?B?ekZJa0xUZ0h6UmJ5SWptYjU1OFdTc21mY29MRHlaRS9Ib0kweHlVSGFnTTdU?=
 =?utf-8?B?VHN5V29Qbms5MVAyZXFJNU9FT25wZ3FIZjRiRHoyTzAvbmgybHo4RUxWZ3RD?=
 =?utf-8?B?VUtjYkE2R29LZVRMYUwxZWhXTHdvOG94eXZha2Z6Z2JhdGVHUjBMYlZhNnJ1?=
 =?utf-8?B?bW43cFNyT2V6b3p3Q05OSE1OZHlGWk1nNVd3RTNlalkyUWcvZ1A1ZG9ncVA2?=
 =?utf-8?B?cGEzalN1UVJlV3I3QjEvMmNVU09HMmVFM1pmMmEzMVRGVHUrZjV1QWlOUjFq?=
 =?utf-8?B?YkR1QzRmY2NCdGpieE14ZG1nenIwUU9hQUxGSXpMbjRyUmRkVWJQQnRaYzZ4?=
 =?utf-8?B?aHM4bDJ5eCtXUUNsRDJ0WTNlN2FkRGpNY3BTODBoWDgvMFMrd3ZZTkRlVS9B?=
 =?utf-8?B?SXU2RWhzalZ4WEM3Z2dtREJISUF5TU5yKyszdjFiYThKd040QjlmQnJ3Wnd3?=
 =?utf-8?B?OU1OUTZUYUp2SkVvZTRsUzlsbzF6SlVLcTVlSFBhUlEwcUpJSVltZXdIVjEw?=
 =?utf-8?B?aVAwWVY4SjR0ZHdZbVNzNVk4QkhMM014MzI4ZHRVazRuVElPb1NPUzFNOGMx?=
 =?utf-8?B?dkU1VHM0eVBKblkxSWNRa0FIN2ZQVkpGUzZkQUhaNUpzelpJU3NwRzdYdThQ?=
 =?utf-8?B?UUVMR0NvYnN2bnR4aTRXWjc2b1FqMUw1L2xEZ1lUODBDRER0L2VTNE1RQll0?=
 =?utf-8?B?TmVFQXpiR3NTTnVWMGNsMWltNDhVT1JGY1JsbTcxSGlFdEh2ci8rak1NeFh0?=
 =?utf-8?B?OEFtSEtOeDcrdnZDb0ZtQ0QxRDRNTXg1N2hDZ0xlWVZ1MFFmMHgxQzZnUUI4?=
 =?utf-8?B?NnJDVHhYaUo2aDk3ZnliektvaTZMQlFkQVgvMVk4SVJybjlhM29qVUYzMUkv?=
 =?utf-8?B?dG94Q3dFdnhBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHh2YlU0ejgvTGFIWU5KWlVHd29XOGpOenhLdis1THJqQUZsMmRtUGsxNnV4?=
 =?utf-8?B?V2ZDWDkwVVArUUlLNEVJRHM4OERudERNWWZXdmJkSk85VngzcG9uOFZtWkp4?=
 =?utf-8?B?YVhsUlZ6bGRlL2lsdjJoQno1c3VoTElIUDlMQkdsaU16V2J2VngrZzREckpN?=
 =?utf-8?B?UVBPSlNJMzNpM2pTZzV6OXR3bmVNL0ZKMjg1Tkx4NnRJYnNvVDJhM29wR2Nk?=
 =?utf-8?B?USt4WWVmR2VLNXVlYUtFY1VoQjJpakd4aE84VWQvSDlNb2dqeG80NDh2QjNT?=
 =?utf-8?B?NVNxWXFBUEdsdHFzS0J5TUhITVVUdDJHdDRzNlNrbmdGVEgxOFRZdEZucTNy?=
 =?utf-8?B?S0ZwcGFSTVBBbjRhYkgzODhEVTdqN1JuZ0JjVjJoZUhhZm1CMGx3YWZpSERN?=
 =?utf-8?B?bURYb0hMeW9HUUdtb1U4WUhxZ0Y2cWRPLzh1ZmNrSHgwdTdJOEFqYWtTZzFX?=
 =?utf-8?B?dHFOdmVTR0ZIbHVjTTZta2dsRkhVMTZPaFBLbWQvNHpRYW5XNTJFaGdwNWtP?=
 =?utf-8?B?SWRxdGtzbXEvdit1dHBuQy9ndm1wYUJnREdoM3p2UW9TVTcvYkdLODhhdE1n?=
 =?utf-8?B?a0tBV25KRFV0ZzFsY2ZqRkNoOUZCM0FhR1ZudEk2dVNLUUV6VXU2b1VQWnRt?=
 =?utf-8?B?b3pCejgydWpjVGlwOThMODk5Y3NuMXA4RGRoMVNCNFIra2R3SThTVHFVaVM4?=
 =?utf-8?B?MGc2MlNDY2ZVTzBwdnZubVpHdU1BVk80cEx3TWJJalBhSDdqd2dBWVFEQXow?=
 =?utf-8?B?UVRLeGlxeTNCcHN2SVhWQmtHWVN2V0pVMXU1aHBaQkVxL3hCOVp4NlJvcGh1?=
 =?utf-8?B?SU5OQjcrRWh5aFJuTVliUVRwNEczcjhEZGtXTldzSEJucjdvT09qRlo1d2Jw?=
 =?utf-8?B?YXkxa1RjdUpsS3B2Z3RzcUhpMmxOcjRwSmpnYVlrU2kxbGdnTW1SSlVZNFVC?=
 =?utf-8?B?bXYrYzl0dTQrdnVaNmJUWG1Ec3h3RWVLVVBSeENsU2xrVFUvOEVhM2ZwVzk0?=
 =?utf-8?B?K0tJd1VNMVhOSkN1MVE4SDl5bFo0VTZ3TlZyZkNWWnltSHhYajd4REtld3ZM?=
 =?utf-8?B?clN4SzRuK1VIbytBdGl3VUUrM3psdUFwdUUzUWxxeTAvNE94bXVGOFhoa0ha?=
 =?utf-8?B?MWRUTjlMcEhsVkFHaXhtV0gvN1NNejJtSDBaRlZESkV4ejh5eHRCTVJucStE?=
 =?utf-8?B?a1pVdzI1Y0RLM3l2N0FoQlVaNmRLN1dHWFpDcmIzYjI4K2ZpYm5rVTQ2eTFQ?=
 =?utf-8?B?S05VckRaUnJpQmdHRDYvSkxRSHREQUlpVkV3R01jNU9ScVNxakxPWGNKVEZH?=
 =?utf-8?B?TzMxeHRzU2U1N1JsWUNGMytwSFR6d1V2ZEgyUjB2TmkwcDhJOXZ0V2RqU0RG?=
 =?utf-8?B?OXdrak5IZ1FLSnpvTzM2VUxac0tUTlVyU05QQlV4MEZSaHFZd0hyMk0yUHhs?=
 =?utf-8?B?ZzhmblAweXBSNWlxT3M2RjFmWlZzazR1QyttZUhRMXE5c21UZEZCWGl4TTIz?=
 =?utf-8?B?MjhjSU1YNWhOKy8zVVlJamFwczBOY1piNWx0b3h6NUJRMzk1TmtCTG1OYzlI?=
 =?utf-8?B?R2c3ckE2cWdsQUJ5VEl2L2U4SDhmaVBLd3JldVAvMm1FYytsQjlBRWxoeFA5?=
 =?utf-8?B?VGRlclU5a29Zbk1ydThWYjVwd25EZnE4MDg3a0Nsdkd4ZFpQMk9oMktDTXU1?=
 =?utf-8?B?MlhNSkxCbzZmdzVoK3V1ZmlFMFVTdnIySkQwbHJiVUtzMzZHcmJCbXIwQXNw?=
 =?utf-8?B?TkdmOFdSL2s0QXhBaVpGbEZXNnBlaXNhc1RkQlhueDArRmxQZjB3VnRHK0VR?=
 =?utf-8?B?Vlowb1p2VmpGWlVCWEJmMnFGMGVnTUpZVW84Zk9EbEJ4OGpoKzd6VE9MT1RG?=
 =?utf-8?B?T05QSTQrcmRzTlhaTFUvVHZ0anpkT3lPRmNlZGVLcmlwZk1zMEI2eTZqL0hr?=
 =?utf-8?B?aytQcVB3cUdRd0NENkF0aDI3L1QzR0FEWWNoamFmTVc2VTJiY25aWXRPMXNE?=
 =?utf-8?B?ei9xU2dTNFlVejdkUUNkVlV1MXNTQS9qRDNObHpEODFHOTI0aHFCZm8ydXBq?=
 =?utf-8?B?VGtrT2lOWWw3RzNLeklHVnhYOGgrcSswQm5Tb2J0T2xRSnhuWWtWM0NiWG1G?=
 =?utf-8?B?VGVMU3ZYUm03ZkZwUENSbTBZU1VLcVlZUzYvNXFvUzEvbTNKcFlpajhpMGxy?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964a9f7b-0823-4cbe-d910-08ddbe24feb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 13:40:25.7348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4aZHSzCK8G8frVIMRzHPlbWSI57hGXdUPllupO+BpDbkiPpHw3Z++vlL6tI4Yo7H5MIASTK7r2UL54EIFDixrRF3B2ITJHYKM9ddpf6awk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12357

SGkgQW5kcml5LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+T24gMDgvMDcvIDIw
MjUgMTg6MjYsIEFuZHJpeSBTdWx0YW5vdiB3cm90ZToNCg0KDQo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3hlbnRvcC94ZW50b3AuYyBiL3Rvb2xzL3hlbnRvcC94ZW50b3AuYyAgPiBpbmRleCBmNWQ2
YzE5Y2Y5Li40NzcyOTljODgzIDEwMDY0NCAgPiAtLS0gYS90b29scy94ZW50b3AveGVudG9wLmMg
ID4gKysrIGIvdG9vbHMveGVudG9wL3hlbnRvcC5jICA+IEBAIC02OSw2ICs3MCwxMiBAQCAgPiAg
PsKgICNkZWZpbmUgSU5UX0ZJRUxEX1dJRFRIKG4pICgodW5zaWduZWQgaW50KShsb2cxMChuKSAr
IDEpKSAgPiAgPiArLyogVEVNUE9SQVJZOiBGb3J3YXJkIGRlY2xhcmUgdGhlIGludGVybmFsIHN0
cnVjdHVyZSAqLyAgPiArc3RydWN0IHhlbnN0YXRfaGFuZGxlIHsgID4gK8KgIMKgIHhjX2ludGVy
ZmFjZSAqeGNfaGFuZGxlOyAgPiArwqAgwqAgLyogT3RoZXIgbWVtYmVycyBkb24ndCBtYXR0ZXIg
Zm8gbm93ICovICA+ICt9OyAgPiArDQoNCj4gV2hhdCBtYWtlcyB0aGlzIHRlbXBvcmFyeT8gSXMg
dGhlcmUgYSBmb2xsb3ctdXAgcGF0Y2g/DQoNClRoaXMgd2FzIGludGVuZGVkIGFzIGEgc2hvcnQt
dGVybSBzb2x1dGlvbiB0byBhY2Nlc3MgdGhlIHhjX2hhbmRsZS4gTGF0dGVyIG1heSBiZSBtb3Zl
IHRoaXMgdG8gYSBzaGFyZWQgaGVhZGVyIGlmIG11bHRpcGxlIHRvb2xzIG5lZWQgYWNjZXNzLg0K
DQo+IE9yIHNob3VsZCB0aGlzIGJlIGFuIFtSRkNdIGluc3RlYWQgb2YgYSBbUEFUQ0hdPw0KDQpZ
b3UncmUgcmlnaHQgLSBJJ2xsIHJlc3VibWl0IHRoaXMgYXMgYW4gUkZDIHBhdGNoLg0KDQo+ID4g
QEAgLTI0MCw2ICsyNDgsNyBAQCBzdGF0aWMgdm9pZCB1c2FnZShjb25zdCBjaGFyICpwcm9ncmFt
KSAgPsKgIMKgIMKgIMKgIMKgIMKgIMKgIi1yLCAtLXJlcGVhdC1oZWFkZXLCoCByZXBlYXQgdGFi
bGUgaGVhZGVyIGJlZm9yZSBlYWNoIGRvbWFpblxuIg0KID4gPsKgIMKgIMKgIMKgIMKgIMKgIMKg
Ii12LCAtLXZjcHVzwqAgwqAgwqAgwqAgwqAgb3V0cHV0IHZjcHUgZGF0YVxuIg0KPiA+wqAgwqAg
wqAgwqAgwqAgwqAgwqAiLWIsIC0tYmF0Y2jCoCDCoCDCoCDCoCDCoG91dHB1dCBpbiBiYXRjaCBt
b2RlLCBubyB1c2VyIGlucHV0IGFjY2VwdGVkXG4iDQo+ID4gK8KgIMKgIMKgIMKgIMKgIMKgIi1w
LCAtLXBjcHVzwqAgwqAgwqAgwqAgwqBzaG93IHBoeXNpY2FsIENQVSBzdGF0c1xuIg0KPiA+wqAg
wqAgwqAgwqAgwqAgwqAgwqAiLWksIC0taXRlcmF0aW9uc8KgIMKgIMKgbnVtYmVyIG9mIGl0ZXJh
dGlvbnMgYmVmb3JlIGV4aXRpbmdcbiINCj4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgIi1mLCAtLWZ1
bGwtbmFtZcKgIMKgIMKgIG91dHB1dCB0aGUgZnVsbCBkb21haW4gbmFtZSAobm90IHRydW5jYXRl
ZClcbiINCj4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgIi16LCAtLWRvbTAtZmlyc3TCoCDCoCDCoGRp
c3BsYXkgZG9tMCBmaXJzdCAoaWdub3JlIHNvcnRpbmcpXG4iDQoNCj4gSW5jb3JyZWN0IGluZGVu
dGF0aW9uIGhlcmUNCllvdSdyZSBjb3JyZWN0LiBJJ2xsIGZpeCBib3RoIHRoZSAtYiBhbmQgLXAg
b3B0aW9ucyB0byBtYWludGFpbiBjb25zaXN0ZW50IA0KYWxpZ25tZW50IHdpdGggdGhlIG90aGVy
IG9wdGlvbnMgaW4gdGhlIHYyIFJGQyBwYXRjaA0KDQogPj4gQEAgLTEyNDUsOSArMTI1NiwxOCBA
QCBzdGF0aWMgdm9pZCB0b3Aodm9pZCkgID7CoCDCoCDCoCDCoCDCoCDCoCDCoCBkb192YmQoZG9t
YWluc1tpXSk7ICA+wqAgwqAgwqAgfSAgPiAgPiAtwqAgwqAgaWYgKCFiYXRjaCkgID4gK8KgIMKg
IGlmICghYmF0Y2ggJiYgIXNob3dfcGNwdXMgKSAgPsKgIMKgIMKgIMKgIMKgIGRvX2JvdHRvbV9s
aW5lKCk7ICA+ICA+ICvCoCDCoCBpZiAoc2hvd19wY3B1cyAmJiB4aGFuZGxlICE9IE5VTEwgKSB7
ICA+ICvCoCDCoCBpZiAodXBkYXRlX3BjcHVfc3RhdHMoeGhhbmRsZS0+eGNfaGFuZGxlKSA9PSAw
KSB7ICA+ICvCoCDCoCDCoCDCoCBwcmludF9wY3B1X3N0YXRzKCk7ICA+ICvCoCDCoCB9ICA+ICvC
oCDCoCBlbHNlIHsgID4gK8KgIMKgIMKgIMKgIHByaW50KCJFcnJvciBnZXR0aW5nIFBDUFUgc3Rh
dHNcbiIpOyAgPiArwqAgwqAgfSAgPiArwqAgwqB9ICA+ICsNCg0KPiBhbmQgaGVyZQ0KR29vZCBj
YXRjaCBvbiB0aGUgaW5kZW50YXRpb24gaXNzdWVzLg0KDQpSZWdhcmRzLA0KSmFoYW4gDQoNCg==

