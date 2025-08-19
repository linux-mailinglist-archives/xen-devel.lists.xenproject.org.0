Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F042CB2B89D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 07:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086303.1444483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoEs6-0002Ln-0P; Tue, 19 Aug 2025 05:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086303.1444483; Tue, 19 Aug 2025 05:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoEs5-0002Jn-QA; Tue, 19 Aug 2025 05:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1086303;
 Tue, 19 Aug 2025 05:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VG6f=27=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1uoEs4-0002Jh-HM
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 05:26:56 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b71fd5f-7cbd-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 07:26:51 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by OSZPR01MB6663.jpnprd01.prod.outlook.com (2603:1096:604:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 05:26:46 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 05:26:40 +0000
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
X-Inumbo-ID: 1b71fd5f-7cbd-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Go5fNQm8USQPuwyWo2J0skqt6x+/Xw91KVNEnQkFPpHJkAydfzV0DIiUzHmHbjjdx69ukz7RpVRYDNo/nDJBnq/GtVvJ/1oxIo6TX87iLh3ijkBZnCg2KpH2c/85HdhwDwvbS6aB2oTlkRUbozgeONUZSsLA6Bt+FidiFg0s3OsXyt1CGgt8DPTSEV7uiKdI4yFY272zKW9G07Og2rNBIdljMsfK5LycTi5gSarclyPU4cIVugKViM9jhxTJ1Cik+RrRkqf2c1k2e9dBotRT+JBEDYiLjiBleuxHeBadJRNEoXDN4G/rNj2ShxkTFtJRW6JOHWPeVbke1UAA7GXaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt1z5mfNShiW85IyOxztuczPGD391Y37CzfRyaJYOtU=;
 b=aMJ5z0eDRLELCYRM5dqqHmXLqrnLkxihQLKhny+p0YSyWmMVrVBzpgVqaLm1mGFrFlnn3+UU1dJwMk/lVqPQsQft7OUYKVx276e16F9kbE9XVJ3gRTiZnIO6TwcJkLMm1kyO9U6GSCWBaTJlsyoU3FWF8rwutjDAUelVKLYOSDaebu2itkfGCIThoKID8Nom6Tllu+71aiyd8PbmiTLnxgLmumRKzlxnXFbp05e3fWQl7+0gUHdr2CJztTfPfj1hqB6IRysoRYvgVtREcpntNoS93/Y+1bSGKcDd/k4x+y7YK/gMmB5XGS777FjVVck+gj9r5x7BWLYr8NFhudHGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt1z5mfNShiW85IyOxztuczPGD391Y37CzfRyaJYOtU=;
 b=lWOKEkqoLOrOa570XpViETU3DJP+2TF174SdmMB/UUoL44ZMP7tCnoWgzkv0Dd3oTagUUDdEi2dZ8J4ECNYWbf3z1Em9DlmP7etM2M8HrHRSyTauK0XTd78ds82uj5EB4470lMYWwi2o8UVggVaonbu3T/jm3hP66oYYW5EeorY=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jahan
 Murudi <jahan.murudi.zg@renesas.com>
Subject: RE: [RFC PATCH v3] tools/xentop: Add physical CPU statistics support
Thread-Topic: [RFC PATCH v3] tools/xentop: Add physical CPU statistics support
Thread-Index: AQHcBUCr71rqGhBhY0G/R3coh3xt6bRph6oA
Date: Tue, 19 Aug 2025 05:26:40 +0000
Message-ID:
 <OSOPR01MB124084CF3D745AA4974BE4737AB30A@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250804130643.1046157-1-jahan.murudi.zg@renesas.com>
In-Reply-To: <20250804130643.1046157-1-jahan.murudi.zg@renesas.com>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|OSZPR01MB6663:EE_
x-ms-office365-filtering-correlation-id: a751027b-d82f-42d6-cf47-08dddee0f9fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Qk9RZS9Zc0pUTitxa2dDUXA3akpXTU9vZUtGQVR1d053SFdUajhCSWwvZG1H?=
 =?utf-8?B?b3hzUmdGa2ljZmZMb2x2blNvQlI2UlBhaDRyZHdSQ21GeGNzUlRiREpVdXUw?=
 =?utf-8?B?Zjh6ZjVwY2Racy93OHlvdkZHMS9TY2RJL1Ric0cvVmF6S2pDeXczcDNubFJa?=
 =?utf-8?B?Mm5td0dUWE1sQ3Z2QnhnUm5hZVNUSTAxZUVDa2ViRG5KaFlhSldEYXVHb3pv?=
 =?utf-8?B?RE03VnlmdGp3V0F0UkdIcloxVThqbHlIQngrUUlYQXg1T2ZFWnlXTkoxTzJl?=
 =?utf-8?B?eHorbTNnOXRzUi96WkhTelVjT2V2QlozeGNqbnZLc2NUWldKbnBLWWtuRjZH?=
 =?utf-8?B?RDFVb2o2NUdrMzAzRk1SbDN6ZjYyb3BVR2dQU2dEY0VSUHJEWFVaVThZaktr?=
 =?utf-8?B?MElQZmJhOFcxbzRPUGcrNzhPYVVEYXFYbitaRWdVSTZReHNjQ1FnaHQ2OWFT?=
 =?utf-8?B?OU0vQXJkU3dOTnZvWHpMZUdKYzdWemNMUVU4WENkSnBRT1J6a2pUeTM0R1RW?=
 =?utf-8?B?eHlWdTlnUTgrMHBzOHl6Tmh3Ly9PbEdmajVoS3ZMR0l2TXhMTmlEM05CcnJY?=
 =?utf-8?B?amFuZDFuMnBxYkE2NUovTDk0Nzg5WktvbWVoaElpaXh4RnVPYjJSVmRHYm0z?=
 =?utf-8?B?UTJVRmlReE1pNVlqTEZXK0xJSnB4UGNzODVuYjhTakEvTURMdkEzYlJ0OUhx?=
 =?utf-8?B?Z2IvMFlTcTFjaGpvREZxMWNxRXlxRFFSbjFJRjM2MVl4STd1WmlsbDRtUHpz?=
 =?utf-8?B?SEFmWFdyU0xKZ2FGa0l3TjBZeTQ3cUVZNHRkaitpM21wUU41aSs0MVVsMVE1?=
 =?utf-8?B?RlZuV215Q3BJdjdLMUJqUVdIK2pMRUVSWnNYWG02Z0g4WVpTOWEyM3JZNTBr?=
 =?utf-8?B?ajl2SEtCZW5sU1NzRzVVTzRFNUdSNEtLOWNUUEdCM09PQWdwSGpleCtOZVdj?=
 =?utf-8?B?Uzc3Ymc3YnhOeko0bm8zb2VjcHY5MHIyU0ZrYjRKYlU5YXd6Vm1NOFlacDRQ?=
 =?utf-8?B?UkxWa0Y4RnJEN1ZTM045RndzUlVTVU9PZk9SYVZyODZvVDZ1ZGdQd0F1bWhW?=
 =?utf-8?B?YnhRbFg3UnhxMjNnb3dqYlBERGR0ZlRtd2VCbGZBR1JQSUxacmJ3cVVGbTNN?=
 =?utf-8?B?WGZWSjBuamQ1WUlYMkREc052M1N6a21CMmMvZEwwd1YxOVBSbGJDYm11eFRi?=
 =?utf-8?B?aHFHeUtlaXlFSmlvaldwTHJtRG5HbVZ0c0QyYTliZ0ZKYjdKa1AvTkhFNGYr?=
 =?utf-8?B?ZGNOUHVLcVZ6T2lyY2pCN0ZqZnJJc1B4Q2NzQUFPckh2dGRuQVJabUpVcGdP?=
 =?utf-8?B?TzhBV3IwekRzcGM3eGhvYzdwQTdrbkVoRnlFSkt2RjRVbmVNbUFCV0JZRU4r?=
 =?utf-8?B?eVR1bWpLNjFkenkyMjJDOTV3N1Z2eGlmZlFCQ1pJK1lWYXdYRVRFVVNndXNY?=
 =?utf-8?B?UkxtNkFtcDBSbjU4RXpJOUNQdVI4MU1ZQnh3OWw5SjJIL2RlcFIybFFBTmlQ?=
 =?utf-8?B?OUN6UkVHcVFkMkkzaEgxV3pZaWkrY0kwTG10Y2xUZ21mN094dGZZU0xpODhE?=
 =?utf-8?B?eEs4dEdYNWJBSk1yYU1PTEhQTG5FNnl0dWJTaGloZnI1NEZ5a3VKOWs4WTBW?=
 =?utf-8?B?Y01PUE5wS29IRG5ZT2d4aVpUV3prRTRzWnR6TTg5L2FyVXdCczZWeXFPMUZ4?=
 =?utf-8?B?eWFQNVRPS1hDbklLblVvN25neUd1ZU9Tbk9jazVKTXlHRWd1ZW5RZ1c3d05G?=
 =?utf-8?B?V2wyRGVoNk9XMG9YTnJyam10cXc0eUZsZTNLaWQxTGdJS29aZytOUFJuMXBk?=
 =?utf-8?B?UW83ZTFXVUFLSk1uUlVFaXkyMDRWb2lCWGlsVWFoQmtNVC82cmVMcXFOZEc0?=
 =?utf-8?B?cVZYT3VNK3B1dlcvY1Z3SW5JNXRidFBteENVMnFNUkJBZXBMRFZwMWxkUjdW?=
 =?utf-8?B?R2xXaE9Vd0hTUEtudjYyODA4Q2RRS0Rqck9vbEE0K0dpN2E4UXZ0cHdoa1VK?=
 =?utf-8?B?NGdudjIxWmtnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L01FWWo2aTNsMjlEMStJemk4K3R0bUZVNy9QTE9TQ0tWdm8zdEdCRmVWZTRt?=
 =?utf-8?B?MXE4OEc3OWw1UVlmTkhqd09Sdk9SeXZQLzZiVERma0ZyU1NPU3hFT1gxRFZU?=
 =?utf-8?B?cWVDMUJlMjNoeVI2YkJndUZmOHhNbmV1NTlHL096SmNiNzFsK0g1aHRWSUQ3?=
 =?utf-8?B?cDBmenFsS0NnYzVHa2lYQnhsSk9CWkhtdzBEdXZXaUJONE5INU5jcmJsaHRL?=
 =?utf-8?B?TEpCR3VaT2UyT1dPeWxyQVA4bFFpb0JlcTVRS1BueUY3RFJIZEY2aUVVWXVC?=
 =?utf-8?B?QXRZdHBXYjVia3NVRFNtZ1phYy92TS9IZCs5WmxRbWF4MGNsaEs0d1lIc1Ns?=
 =?utf-8?B?ZmlSbXpqcEk3ejg2UGZ6bldsTTVsR2RmcHVNaFB6RVUyb1FZRjg3Q1dJakNp?=
 =?utf-8?B?WFZBZG9IcVBpeUxMZ2dyaXpZQnZXanlMK2RuUXE0QlJPWnYwVzRZLzlDTXFy?=
 =?utf-8?B?WnZFSW9KOEcrYy8wYmFHS2N6RHdjWHBEaTdTT2lUMUdXWkFaeThnQ0crWHR1?=
 =?utf-8?B?WC9YWVM3TGx1UERxdjF0M2YxODZ1N1ViWnRCYThCNlplRW9GRzR3cy9ySUlJ?=
 =?utf-8?B?aFk1V0Y2M0trTG40bU85ekV0UlRuUDZpbzBhT2EvY3IzMUttSXlMSHdHTWZq?=
 =?utf-8?B?YThtMnhiclhobXA4YUtyOS9CalZ3SGNUT1hoSkJucnZOcmZnTi9COGVaZDJG?=
 =?utf-8?B?VHJ3UW1BTDNyMWhoTTJWR3FSVmNENmZUeFhYUWlFTVlmb2hlM0ptYjZNU3kr?=
 =?utf-8?B?NDhEVWVHL3NnK2M1QkZ1Tm53cGsvdzBZWHJubUZpblc5d05FV09Md054em1U?=
 =?utf-8?B?SldQNFlwNzFjTUZPWm5UREVJQUpTa2syRmJKSDI3c3hleTl1OXJldm1lekZG?=
 =?utf-8?B?dldVWXhBSXU4YWJGMUNaek96TCtRUGhQR3A3b1pkeWVsbDBrQ2hBckhDU0xo?=
 =?utf-8?B?Y0dQWk4zclg4TG5mT2N3N0l5MEs2ZFJ1N3h4Z2hWUHNaaE03M3dTQmlWenJS?=
 =?utf-8?B?eHQ2NStsTTBBQUhoT3R0WkhhbFJ1WTZidVY0WUhqTVUwYTNVd2QveFVTazdB?=
 =?utf-8?B?eXdoWHRQUUR4Rk43T2FyU2M0KzZIUjhRVXpGKytYeFJXSXhsczRTdm1ta3U4?=
 =?utf-8?B?K21IYzRlcXVoRHZFb04reGJjT21nSzVlODVsTWt5eWFpQXQ5M0loSFBsc0N4?=
 =?utf-8?B?RGdCZWxhOEtSdHNrZ2tQUjZLRXkydDJieUwzN1pVRkZPaFZkc2NxVEcwY05D?=
 =?utf-8?B?aEFtVzl3RkcwUkhwSmt3QmFQbjM5Vm9PTjZLdnhWdjBMdFhSWE1NZWZWVUpy?=
 =?utf-8?B?VDIzRmhXNEVyekpCR3g3MlMvTU5rbWNGd3VWQUorMkNvWDlDeDA0ZnlhU1lZ?=
 =?utf-8?B?ZXJ3SXZGQUFwdjdBSXRZdDRSQWd6TnFIb0w3bm9JU3BsMXpLTWpHY0JHMEdR?=
 =?utf-8?B?ajRmckVtUHQybDI0V3ZsUG9PbDJrODRvSnh6ZFliWEFtVms3ODBuM1BRcGpV?=
 =?utf-8?B?Unc3MTd6aW5DVnY1L2dISXM4U3Z5dlIwZUNLOHJ1U1dUQzRpeW8ycFhVSnd3?=
 =?utf-8?B?SHgxQUJlTmN4c3A3d3JuN3YrUEhpY0h2T1YrM2F5M2t2TDIyckFvVmhDVG8v?=
 =?utf-8?B?bWJ4Ti9Yci9lTlFnQWE5YXJIK3RyZDFvV3RONExGbGF6S05ObTdOa25oUGdz?=
 =?utf-8?B?Wnh6TWFqOU15UDVuRldaQ1NMQTU2OFk3SloyM2MyMnA4Y1hmbXowejI5Q0dG?=
 =?utf-8?B?VzBRSkNXRjVyYzdEeWIzSnd0NHd3bS8zUW4wNUx4b2tDRG5QdmRkczhTanVL?=
 =?utf-8?B?WVFVNUZhejlCa0FsYVk5d25MQ2FNVDY5SjFkVnNVNm5kclhaamMwdkhIY2pJ?=
 =?utf-8?B?aDFPMjJCb3psM3hqYTlWUkxuTEU0MlBEVjYxRXVCOGYrT0UyWWQ5WHZzdENx?=
 =?utf-8?B?bml2Rk5pV1BUVlNYQUVyS0Z1dysydXMxbmZ5aGNmYnRoWDRJS1FiNm96clB3?=
 =?utf-8?B?ckl4RTRLMDlWaGlpNERFb0ZxMVRhd250Yk1nY1FzaEVpQWxXeXZwdzY3VVJu?=
 =?utf-8?B?VGphVnA3OE5xZFNYYTQ2clNjNVQ0YUpkMUZ3RUhUZ1k2THp3akFCbHdDYm1Z?=
 =?utf-8?B?Y2JxbWUyWi9tWGZCcS9XUDhGVTltQUVLeVZTWDJsWGtKSURtbXpjcXU4anZP?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a751027b-d82f-42d6-cf47-08dddee0f9fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 05:26:40.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvqGN0TFVqdyqAK398sSvSWBTSl40aw/Pl1bgPcz06XXb4eec7oWAV5lkgPE8V+pbKx0bA8dSUEmmt50PaEgZgtSQEjJtKrHMFhkLt3FtAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6663

DQpIaSBBbnRob255LA0KDQpJIHdhbnRlZCB0byBraW5kbHkgZm9sbG93IHVwIG9uIHRoZSBwYXRj
aCBJIHNlbnQgZWFybGllcjoNCg0KPiBJbnRyb2R1Y2UgYSBuZXcgJy1wLy0tcGNwdXMnIGZsYWcg
dG8gZGlzcGxheSBwaHlzaWNhbCBDUFUgdXRpbGl6YXRpb24gbWV0cmljcyB1c2luZyB4Y19pbnRl
cmZhY2UuIFRoaXMgcHJvdmlkZXMgaHlwZXJ2aXNvci1sZXZlbCBDUFUgdXNhZ2UgaW5zaWdodHMg
YWxvbmdzaWRlIGV4aXN0aW5nIGRvbWFpbiBzdGF0aXN0aWNzLiBUaGlzIGhlbHBzIGNvcnJlbGF0
ZSBWTSByZXNvdXJjZSB1c2FnZSB3aXRoIGhvc3QgQ1BVIGxvYWQgcGF0dGVybnMuDQoNCldvdWxk
IHlvdSBiZSBhYmxlIHRvIHJldmlldyBpdCAoYW5kIG1lcmdlIGlmIGl0IGxvb2tzIGdvb2QpPyBQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgeW914oCZZCBsaWtlIGFueSBhZGp1c3RtZW50cy4NCg0KVGhh
bmtzIGEgbG90IGZvciB5b3VyIHRpbWUuDQoNCkJlc3QgcmVnYXJkcywNCkphaGFuDQo=

