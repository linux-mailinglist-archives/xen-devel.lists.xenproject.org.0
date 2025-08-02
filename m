Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B130AB18F9B
	for <lists+xen-devel@lfdr.de>; Sat,  2 Aug 2025 19:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068037.1432258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiGLD-0002dy-Nw; Sat, 02 Aug 2025 17:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068037.1432258; Sat, 02 Aug 2025 17:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiGLD-0002cN-GE; Sat, 02 Aug 2025 17:48:19 +0000
Received: by outflank-mailman (input) for mailman id 1068037;
 Sat, 02 Aug 2025 17:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9RL=2O=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uiGLB-0002cE-P9
 for xen-devel@lists.xenproject.org; Sat, 02 Aug 2025 17:48:17 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de532c6e-6fc8-11f0-a321-13f23c93f187;
 Sat, 02 Aug 2025 19:48:16 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU2PR03MB7862.eurprd03.prod.outlook.com (2603:10a6:10:2d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sat, 2 Aug
 2025 17:48:12 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.017; Sat, 2 Aug 2025
 17:48:11 +0000
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
X-Inumbo-ID: de532c6e-6fc8-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Baf5S2iZh5NGSiXqyfb0uw3VT0wW0yB6Nl/UJByL/gNYW6vNxgahcVuo5AmK/JrjySLjc97uSigt5zJ5j2rDII+K7nUIPAH3arudarovD9KVMwCyBfeyj/iUbGQh8Iw2XhjkYwWVmMNUKNJ150olALmykUO0tNKJ18Rh8DS0nn3XL2dL/blDwH75p+EpqYlDlCw5e4cvUm3l5uEdnXQm4Bggvy0gZmAjnDGVd3GltLXn4/mxjQRiTb1GiG29l3XF/T1EE2hc8fP4VRfxQdYGh/Ko3L4AkRwT0g9DDmaJbzyJ4dfny4EsbxID+fxHNTMbyCvKR8ADdRR4sH4/UHqy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej0Bymq+pXP4vV+9sbVFLLMVo4Hx7NOfVgawxm5lS0g=;
 b=BaAv/+/XGofOOuv6SeLWAhwYJKhxwv3foW2AgPCEkWv+aZmKoJ2Zs3MWEbfIvySUINF5Jn2lf+Knv3Q/claItE22udux03KAT6M8Dc5btviaRh20f7njDLekecjxRqb127MDINpr56k0/z4y5225PqvxnixOotYbftRHoYJwP1z9SVEdiNC6yDlHaK9QQSPVfQ0UjV9956rWKqFthSRtFwWjX6kDJbHhfXsn/hKdZ1bOxQ6MttVrLXGemOv6UNX1EC/Rn5z2aJyLLziAxltYzPqR/Fjd+AnG/p0L1M2yzdcyqG18f4XzZGG7U3VOS0ycHOfFnbVqClD9yebwcdny0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej0Bymq+pXP4vV+9sbVFLLMVo4Hx7NOfVgawxm5lS0g=;
 b=JI1+Wbt2iEWdRWuxOvyM/QlI+gFJqXUaiz2k0iv5x1zGonMteHfOQ3C+XZOH+3M0B+YZXVKLR986F9QQb9ABxt7oGzMuSfs2ekuGzKlffow1aFrV2QMcXD69r1GEeRGEmbe7jebwCLL3ggXyA71T6D4OfPLjgM0TRtvr2uYkP11B+8AELAFoz5forKWf5cVQ1WEc0I7qsSwBwmAtYYnvL8oUCg4TLtDgSr5IvF7lHQooa3MxOR6rImVksvyD/uYD+Ajk1rLb3oGBMuxPOIrKr2bBCnfX8+EKVhv46ScoSb5AIQD6nE1Cn1bYIfcfbpAD2Fd2m07LL7LkHGP3bvFuRQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: [RFC] Next steps for MISRA C Rule 17.7 in XEN
Thread-Topic: [RFC] Next steps for MISRA C Rule 17.7 in XEN
Thread-Index: AQHcA9WdQBGGn1ngVkiEBTFhozxERA==
Date: Sat, 2 Aug 2025 17:48:11 +0000
Message-ID: <6d622813-1617-4af3-876e-52a551518f68@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU2PR03MB7862:EE_
x-ms-office365-filtering-correlation-id: b55346fe-2f11-45df-66cc-08ddd1ecbfb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWMyY2FBVm5zM0plNUxXbmU3U3NHakRBaHBXSkNUb2xROXZJMzR0YjB5cmVt?=
 =?utf-8?B?dkREYXd0T1lwUTZUMDA1Nk4vYllFWU5PMGRUREJPQ1k2UkIwS1Y4L1JVSHJy?=
 =?utf-8?B?WjRxRU9GNTZVKzF5TzVjQmRUYVZiUWNsVWNDSUQzNlYrSWJDUWd2RURRdVdu?=
 =?utf-8?B?RkQvOGI4cjZkQlZiUGR3QktGWitra0dCREQxdXFvWWttRW5ETDhkTGZ4NDVq?=
 =?utf-8?B?NFg0Nm80TzQ1OU9XdmJ4WnVjQnBxUlVINnIwQnZzMG96aGFyWUpNM1UyK1V0?=
 =?utf-8?B?WVhVeGYxeG93elFEVWJ1WmVuNit2eWhJOUZVZnM1LzJ0bldMbTlFZnBOczVP?=
 =?utf-8?B?UnNlOG1Cb2ZLWTBYN3E1bCtxVlRXU2NSWWlrTkdjNmdFZ0tzSGhETkhrWDRr?=
 =?utf-8?B?UzR0clJzWFkvSWRIMkxEeFQ4UHlCOXNSMklxSXYvRDVNUUE1MnQ5VEd1YTlX?=
 =?utf-8?B?d0I4V2VLUFBWcDFHcEc3V25hazZ0ekxucis5d3JydVJkbTBiZkxkbEFuUDBJ?=
 =?utf-8?B?andOUUJPelFYSFpEcHh4VVZGWHZNNFB3RStqcmtLemVnZ0V2dHM3Y2pubklW?=
 =?utf-8?B?cFRTd1F2RVVFSW1RS2tzSDllYnJWejZSTEtCY1JiaFpDWE1IcUlRamQ0a2Rk?=
 =?utf-8?B?aEdXQ0NPdy9acDR5NFNsUU5PNmc5M1dVU3RGY1doQUJCUW1QdXhNQ3FUenJI?=
 =?utf-8?B?SEVVVnhuYUtyeUlXcWVzVVBWSE9YMWRVSXpEeXhBTDBnd2FBa0g2T0VTK1Rv?=
 =?utf-8?B?WS9Pa0tJaHlhV0htSm9kYllhdGQ3MjVsUElYVjZvMHMwemFZVW9TQ2Y1L0Fp?=
 =?utf-8?B?akhPbzAxOE1leVBQRzA2L2p0czMzSHNseFZqS0FaL29IZm9hQlR2QTlXbi9N?=
 =?utf-8?B?aTBtc2d6NWdzQVozMnlGSWtNRXZnL3BCQWJ4eUlrSXhSWGF2SllMQ2poK1NC?=
 =?utf-8?B?WEw3YXZIRzRrWmQwbElscm5UNEhOaVI5cEhOWWlHOWEzVUtNYkJEWll0Mmdo?=
 =?utf-8?B?SzV4Nmo0QVNLZmRXNFZkRzQ0NjRFbDNGenZLVHRicWk4TWdnejlaVUVZTmpk?=
 =?utf-8?B?dVVOVTR4eGIwb3c5Zk9NcWMrZEZ2WUtLZENoZmpHRE9Ha3RLYldtaUo4VDlQ?=
 =?utf-8?B?NlMzaW9UamJ6RVBnUk4yTVJQQmtHUWdabnV0cVJsdWlXYm9mZ1ZSTEVYSWV6?=
 =?utf-8?B?YmVhbFVkQzNDOEJhV2FRdXF1SkxIL2ZVZnVpTlhGc3JzaWlSdVc4T2cxQitF?=
 =?utf-8?B?Zis4WTc4SFlKWmEyRldjY0E3QlJIVkRCN3hoOVZVKzNnM1BTQ2QxWHF6V1Q4?=
 =?utf-8?B?UHJiQjRPb3ZMT3FsYXFLTGVZbndISGZPdHZPSTNMdDA1VTdQaTdwbEx1V2lQ?=
 =?utf-8?B?QVQwVU1rczlTQmQrcXJYV3JkeVNpUjk0dERuV0NpRGdRVXFoK3RCTmltMzFm?=
 =?utf-8?B?aGhhK3RsRDVFMHI5WHJmVGFtVU5HMzdXc1RiZGxUWDAxN2hWZ2JWb1hQa1lF?=
 =?utf-8?B?NThGWFQ5LzBRZmNMWmFjYUZvYXl4TWM5cjlCNHFNWlZXWW9DWjZ3empkdW5p?=
 =?utf-8?B?RWhZeEQrQTljaUNpQVNIOHdLS2Q3cmV6VUl3YTBTay9lVjQrWTZzVEZrZUU0?=
 =?utf-8?B?TkJEdGdWRHZpWXRsMHkvVlRkTVYrU3h5MG9jcU4rcFFLeHl0RjYzbE9PZndY?=
 =?utf-8?B?aGZ1Y2FjWHFYNm85SXBhK1VxOEN3K1Y4WXl4ZzNBK1hOSUZQczlUajkrY3JK?=
 =?utf-8?B?V2w0aHBNUFVzMFErRG91YXZUeGl2YURkWjNTdFBUWGRvZDRkWjdsa01QOXQx?=
 =?utf-8?B?ZDNJRHZvdTcxbzhybWF6RFI0a0ZaZ2pEcEY2L3o3UUkwQnhxOWZqOFpKQ1hJ?=
 =?utf-8?B?Qi9ha2hqNlF0K20rNWRhRUtaek8wWUIxWlNTT2JJTm51c1BYdHJYUFdGZ201?=
 =?utf-8?B?Z3RlTlRWamFTbFNINGYxeGV6MnJRa0FZNjdZUGVGZUp6MzAwekxhdHk2UzJR?=
 =?utf-8?B?bkZVdXBiSGp3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cG0wOU9XZ2hNNlJLMnNscitUNmp0VnhYS1JVVWM0cjl4K21WU3dvK3hiS01S?=
 =?utf-8?B?bWlyMGxPbWdsekx4d1FNdnM2eUdlRm80ZmtPRkowSnVNSUVEcjlNaXQ0KytG?=
 =?utf-8?B?RzNqN3A3RVNPZG5rbnltcTVVNWRvbUZmVWdvVG5nN0tUR2NFbGlGZ3BSWU5t?=
 =?utf-8?B?VGlYc21CbjdUSlRLak9zVkpyQjFoME90RUkxRzRLc0JHd2xuYkc4NXkvM3dh?=
 =?utf-8?B?TmFXVUIzQldJbERDVTc5S2VRQ1FlVTh2eFpRYlk4Q1JMVlk1aWVrWXhNcWJ6?=
 =?utf-8?B?TmNCRG9iWDFUc1R4YWVyRXZveUhQS0FaZHpDQXBiUDhSZ3NrTG52TkhWeFo3?=
 =?utf-8?B?ZmpNR09zcVdPdDhNaXN3WHZ1Zyt1WU1jdDlJNXlxbEQwcklYYmtRSi9NeEdw?=
 =?utf-8?B?cjJPalE5K2xPb3JyZ2NRL1laSGljbzNVWmRUN3FKcC9aNVZ0T09HT0pVODZB?=
 =?utf-8?B?b0llNlZmYUVGN0tPYU54OGZIU3JjSmFSYjM4Unh2cTdGQlFYZmE2Q2FRTEhJ?=
 =?utf-8?B?SEswaGJHUGdXM0ZnN1o5eUEzK0pzNk5PTFErV3VpK2JyZjVvbktrL2dLOFQz?=
 =?utf-8?B?NlVnbzJjL0swcmREclA1Z1FHeXJtN0hCQnBraU13K05FeSttMW5acUlhZHRM?=
 =?utf-8?B?bFFIVlVkbTZTRllqYjN3bXpyTDNxUklFSkg2em4vU0tIOUc2MHphVys3blZE?=
 =?utf-8?B?SVJYZG9pMG1BNnBxK2RZNEFxMFpxMURGUlpXMEtWRCsxWTdzM2tXaFNQeUJG?=
 =?utf-8?B?NHRJSkZaMkdIMVE2ME9UK2x0blFKUWdDT1BFeFJ5L0FGSG0zYWI2V2dUSVhU?=
 =?utf-8?B?WkEyT2xIL09ZajJUeG94NzlrTitBZ09GVWc1TDVkKzBnb3Jhd21RV3FKUzRl?=
 =?utf-8?B?MkQ0RFFoRWQybkxsSWF0YXU1L21uNzNhV0pPL2JKK0pDZ2xTL0dUY29zOVJt?=
 =?utf-8?B?SUFjaWdxazJkaFZIeHMxbytuZDRLdVJuQUFrby9WUG5XTmhLcnlmN3hDSmEr?=
 =?utf-8?B?M2hmcnJMcUIyU2lPTHhnY3pDZjlMaGJ2c3Y1SFVQOHVEY2ZzbkNtNmZ2SVlG?=
 =?utf-8?B?MUhVeThRYXF3WkxuZDlzdXEyTjdkWXdXUC9vaGZTNGVJc1ZHWThhNWIzR1Nk?=
 =?utf-8?B?NmZrMi9KOE9FZ1Y4YzN1QWlLYWwwSlpqQVU3TVpxRXhSRUp4NDZWTk40c2dm?=
 =?utf-8?B?eXlaR0haTm9TS3RRVGFHZW5TOUc4aEVIYlJxejVFS0E1OGNjQnUwTm9lQTZp?=
 =?utf-8?B?bHdaMXFrM29pbnQ2aVhYN05EVmdoRDZ3b2x6RXJOQXpDemQ4Q0JqTHZpNzRI?=
 =?utf-8?B?M0FDTVV3MEFQNUtLc2ZWMnVVMDd3T1VsM3p3UjJYM2djMm1UWlJIdldTNTFZ?=
 =?utf-8?B?c3VWYU9WY1Zla283MUx3OVhWek50NnFlaUliVWZXTzAyeHRZTnRrdCtsM0tM?=
 =?utf-8?B?dmtpZUxGdklmajA3T2xONXVEQXdRTXhlbmNhdDBvL1V3R254dmxESmpDNjVW?=
 =?utf-8?B?VnBpTW5pY242K2V1Rm1TSVBDK1VKL0lya3lDS3JhdGhvQWRVbjFVRVRCRmVH?=
 =?utf-8?B?clVLOVJRR3FhTHZRaXY4eTlHTVNMTS9QMGxuM1dhdThJcGYzY1k1aXlCRTda?=
 =?utf-8?B?U0xJdUlRWXhqa3R6cXAxeEhvQThJd2JpTTM4azdVOWplWU1Sb3dQTnBhR1pJ?=
 =?utf-8?B?aTk4TytRY2JaSGIrTTQ2QVRRMGh5dnZ6bFBsWGg2d2lyRE04S2lsTzNLWEN1?=
 =?utf-8?B?SFgxUTNON2ZuYlQ0WitvTzExSDhIbWw1cmVzb2paazdIb3V6Z0k1NHR4aHVS?=
 =?utf-8?B?QWo2enRGTjQ1UFkrVkVwNmduakhHNUkzZW03NFFaazBWcVFyckRTWjNncnhS?=
 =?utf-8?B?NmpsbHZIWE96RWtWb0ZGY0Z4eU10bTIwckhhbnd4azlabnZrL3ZjUlEyaldN?=
 =?utf-8?B?QjVuaXdhMWxReE9yQ2ZvS2c2WTRaWXZnQkZYbDNtWWZ2dXUvMldjT01HUGNn?=
 =?utf-8?B?QnQvNHlCeFpUWmZ5Q0JVZTQvTHNQbEFKWFNZNkJDenBXSDRhTXhyQTREUkh3?=
 =?utf-8?B?VFc5NEhIOWJYb0xUMnpTdlM1OXBwb1EzSXRvdlo3Z0g5d0REcENaaXk2MGF4?=
 =?utf-8?B?MFVQMW1wY2R5UXFhUWU3ZHdmRjJYWmM0QVJhZ0UrREltTEJzWkFCM2xocVkx?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21AFAE7C30C83949915313C946841006@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55346fe-2f11-45df-66cc-08ddd1ecbfb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2025 17:48:11.4604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTQfJNVtCB4PphkTRDQQ9wrUBOfj6LOBjz0y2isNqeTpKxysQlnlAsQAMnl4WpBn6k01H7B2BPjxnaByIv0ZiwwpxrzmT/ef3g0xaBns3ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7862

SGVsbG8gZm9sa3MhDQoNClRoZXJlIGFyZSBhIGxvdCBvZiBNSVNSQSBDIFIxNy43IHZpb2xhdGlv
bnMgaW4gdGhlIFhFTi4NClRoaXMgcnVsZSBzdGF0ZXM6ICJUaGUgdmFsdWUgcmV0dXJuZWQgYnkg
YSBmdW5jdGlvbiBoYXZpbmcgbm9uLXZvaWQgDQpyZXR1cm4gdHlwZSBzaGFsbCBiZSB1c2VkIi4N
Cg0KQWN0dWFsbHksIG5lZWQgdG8gZGVjaWRlIGhvdyB0byBkZWFsIHdpdGggdGhlc2UgdmlvbGF0
aW9ucy4NClF1aWNrIGFuYWx5emUgc2hvd24gdGhhdCB0aGVyZSBhcmUgZGlmZmVyZW50IGNhc2Vz
IGluIFhFTiBjb2RlIGJhc2UuDQpMaWtlLCBmb3IgZXhhbXBsZToNCg0KdGhlIHJldHVybiB2YWx1
ZSBvZiBmdW5jdGlvbiBgY2xlYW5fYW5kX2ludmFsaWRhdGVfZGNhY2hlX3ZhX3JhbmdlKGNvbnN0
IA0Kdm9pZCosIHVuc2lnbmVkIGxvbmcpJyAodW5pdCBgeGVuL2FyY2gvYXJtL2FsdGVybmF0aXZl
LmMnIHdpdGggdGFyZ2V0IA0KYHhlbi9hcmNoL2FybS9hbHRlcm5hdGl2ZS5vJykgaXMgdW5leHBl
Y3RlZGx5IGlnbm9yZWQNCg0KVGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGZ1bmN0aW9uICdjbGVh
bl9hbmRfaW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFuZ2UnIA0KaXMgY2hlY2tlZCBvbmx5IGluIG9u
ZSBwbGFjZS4gUHJvYmFibHksIGFmdGVyIGRlZXBlciBhbmFseXplIHRoZSByZXR1cm4gDQp2YWx1
ZSBjYW4gYmUgZHJvcHBlZCBhbmQgZnVuY3Rpb24gcHJvdG90eXBlIGNhbiBiZSBjaGFuZ2VkIHRv
DQoNCnN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhbl9hbmRfaW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFu
Z2UNCiAgICAgKGNvbnN0IHZvaWQgKnAsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7DQoNCg0KTmV4dCBj
YXNlIGlzIHZpY2UgdmVyc2E6DQoNCnRoZSByZXR1cm4gdmFsdWUgb2YgZnVuY3Rpb24gYHZnaWNf
cmVzZXJ2ZV92aXJxKHN0cnVjdCBkb21haW4qLCANCnVuc2lnbmVkKScgaXMgdW5leHBlY3RlZGx5
IGlnbm9yZWQNCg0KVGhlcmUgaXMgb25seSBvbmUgcGxhY2Ugd2hlcmUgdGhlIHJldHVybiB2YWx1
ZSBpcyBub3QgY2hlY2tlZC4NClByb2JhYmx5LCBpbiB0aGlzIHBsYWNlIGNvZGUgbWF5IGJlIGNo
YW5nZWQgdG86DQoNCiAgICAgKHZvaWQpdmdpY19yZXNlcnZlX3ZpcnEoZCwgaXJxKTsNCg0KDQpG
b3IgdGhlIGNhc2Ugd2l0aCAnbWVtc2V0JyBmdW5jdGlvbjoNCg0KdGhlIHJldHVybiB2YWx1ZSBv
ZiBmdW5jdGlvbiBgbWVtc2V0KHZvaWQqLCBpbnQsIHNpemVfdCknIGlzIA0KdW5leHBlY3RlZGx5
IGlnbm9yZWQNCg0KSSBndWVzcyBpdCdzIGJldHRlciB0byBjcmVhdGUgZGV2aWF0aW9uLCBzb21l
dGhpbmcgbGlrZToNCg0KIlRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIGZ1bmN0aW9uIG1lbXNldCh2
b2lkICosIGludCwgc2l6ZV90KSBpcyBpZ25vcmVkIA0KYmVjYXVzZSB0aGUgcHJpbWFyeSBwdXJw
b3NlIG9mIHRoZSBmdW5jdGlvbiBpcyB0byBzZXQgYSBibG9jayBvZiBtZW1vcnkgDQp0byBhIHNw
ZWNpZmljIHZhbHVlLCBub3QgdG8gdXNlIHRoZSBwb2ludGVyIHJldHVybmVkIGJ5IHRoZSBmdW5j
dGlvbi4iDQoNCg0KQnV0IGR1ZSB0byB0aGUgbGFyZ2UgbnVtYmVyIG9mIHZpb2xhdGlvbnMsIGl0
IHdpbGwgYmUgdHJpY2t5IHRvIGFkZHJlc3MgDQphbGwgb2YgdGhlbS4NCkkgZG9uJ3Qga25vdywg
bWF5YmUgdGhlIG9ubHkgcmlnaHQgc29sdXRpb24gaXMgdG8gZGV2aWF0ZSBhbGwuDQoNCg0KVGhh
bmtzIQ0KRG15dHJvLg==

