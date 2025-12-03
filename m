Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF82ACA1D06
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 23:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177162.1501550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQvHx-00011Q-BH; Wed, 03 Dec 2025 22:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177162.1501550; Wed, 03 Dec 2025 22:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQvHx-0000zp-8H; Wed, 03 Dec 2025 22:25:33 +0000
Received: by outflank-mailman (input) for mailman id 1177162;
 Wed, 03 Dec 2025 22:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WC6h=6J=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vQvHw-0000WD-Jb
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 22:25:32 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa754152-d096-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 23:25:31 +0100 (CET)
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com (2603:10a6:5:3::28) by
 GVXPR03MB10899.eurprd03.prod.outlook.com (2603:10a6:150:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 22:25:27 +0000
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66]) by DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 22:25:27 +0000
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
X-Inumbo-ID: fa754152-d096-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZnFGUV6ZbgHIktDbln/eMPyhrPVQi5G1vhfB1m3qqrtiRTWg/ipe1ts+MZsU6kyzjQbLf2GrV7zcQd5J/jfTewEWtfgSzOAkpxTvoeUqgfw+b4VzI+XKJk5tuZhZ3/9aMadkzD3WAcd2Ch0ZVhZRaNzgdxAg5MWxNOK/fq0pnAjzVA8n9izNOZ93leEqxPbTPd4Fh9d2pBw2CrzKTXR4tPNo4jLk/HrvjdUbTo5cjndv7hqJaFwfktZUMS5UKAILzbZ43ZZB7y+aB3c9t38sBqdfQvHd0xOFm2Dkrww5JVqy7LEVFWjsoVxs0YTEgPv+HeijgUWAu9MOeVly+PyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qOMvZLcNNPGyyEBKWzT/OD/Ocn0P5AV/dLSORJsr98=;
 b=EJ2zdMv66QVxMNODhw4nwHr+zMXQAyy9mt1vCu9wM1+mqPxpoJeXPt6DE9CfldYvMYWvOYZzB3E1Lu4OwjgV2k1mYYP2kc7nLjMWwq2Oo05njO2eWhCgleFgZf/7Fz5ZnRMks4/q2+UCpznt5VTsP4qYSo39CVwMK+RrtlsiThoQgCJHdstNJF8LWJ2ZFWtBPqUtuDLVOkog/v1n/8kQJGriOoZPp61Euxeydgt+QGrFVWVs1pVg+FSxfmA56eKo1LUPC3+JNzHjwr/2LqxYLeSWO3J3yitXGcdO1AnhgZjSnWUQTTrZHLgNkW0yWFdvoP1V2UszebH4626O9aat9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qOMvZLcNNPGyyEBKWzT/OD/Ocn0P5AV/dLSORJsr98=;
 b=VDqD4y9B1e31S7/Ggr2OeLzrRvblfQrPrvv73lVIfaDjf6dTDqcBJlxFtlrjGzaXFCKuQBSJraqcW6xdf5g1NZqs1rgVEZ0tnXOXDUdltX+JBAx7Aiar6AubbweOyWOADVmB8RA1h3k8UrvS/kj84fESmRvJzHgr0WnEvqtdfdtoWRakM7k9/mEB+vtX4M5caKptPeAV7xilFlalK8SoLMkWNyRqfwpIU23o9dv9pnp9i9FvEU2IgWSfBId/PhrJQRQzn9a1cs2v3u/5HN+TdGCmx3PIDm6GSkIDzVPlT1EwdquhU4tPkoaY0C8dRvZPg9BuxmA3htqSf4HqwyX8YQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index: AQHcZIbKZWHMCLfhnk2g+3dibmJCCbUQaX2AgAAU4YA=
Date: Wed, 3 Dec 2025 22:25:27 +0000
Message-ID: <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
 <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
In-Reply-To: <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB3577:EE_|GVXPR03MB10899:EE_
x-ms-office365-filtering-correlation-id: 8cb9cf65-e3f7-4031-a660-08de32badc30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3pOSitkTU51SkNzSjdqcmhyVlEyRGNpTjdVcVNHcHhyNkVIWDNTOW14SVQv?=
 =?utf-8?B?akErUk4zby9yWFRTcVlvK2xTb1VYWG9lVkh3K3JlTS9Lb0NGbkRYY3ZoYUIy?=
 =?utf-8?B?eG5PUXVxWTA2aWdpa3dBNDZLY0VYL2FQR0NXWU9tOHhVNUZ3MWs3V04wNVRC?=
 =?utf-8?B?QWVWTVRNS1c2NWR0enVqR3FJdGRvampBMTNWZThFSWQvdzFRSTVEUGlhWWt6?=
 =?utf-8?B?OExCNVFkUy9DcUp4NlZvMzJOaWFmb01SeXhUUVlvc0s4TkVZMm43NFhKRndk?=
 =?utf-8?B?amhOZURGNEwydkFBekZQMzI3eWRQWEZ1MmFpL0JZUE82OFM5OXl0Tnl5c3M2?=
 =?utf-8?B?ajFCZ2piMEpnUk55SnFQODJRSmswV2liVmp0U1NtS2pLNml0d3pGMFdUMVQz?=
 =?utf-8?B?VURPMFhQM0svd1U0clhZV3VHYTNzM1U4QnUxQ0xPRWEzaWU1VVBiZ0tzUVk3?=
 =?utf-8?B?QlFGalMxNlJoejdGbkpuQkFvckxTdjJrdFhRN3JIR2VQZWtUVG55dGkyUHdM?=
 =?utf-8?B?SWRZU3daR3BENjc0Tys1bi9DL1RSZk5VYWx5Z3RabFlwRWlyUVNsbEh2V0FE?=
 =?utf-8?B?SHV3NkV2Y0hQTENQU052RFhabnZkMjZJM1gxMFd0M3VQbVJ4QjlzYVp0cElF?=
 =?utf-8?B?RlJzZ1FPQ09mTXpmSUxuTXNHUmF6LzExNDcvR2tyM21RU0J3ZnM5NWZaN01F?=
 =?utf-8?B?VkszWmhmWVpWUnNpeGtHeFRqMi81cDh2c3FYWkNIaWlPVlBIOG5oQ25leDdK?=
 =?utf-8?B?bzVpdCtDNGNXRDNhbk1Vd0lDU0Y2ZVJyWUh5TCtrM2dlS1I4UkdRRng5Znd1?=
 =?utf-8?B?TFNvSkhMazZrQldkNWxsRXEvTkxnU1pTN3B2Zm5kN2U0UUx2cWl1WUw2MXND?=
 =?utf-8?B?U3d3SURGeDRMS0NUMXlkVmJpcS9kZ2Q3alVxMU9TUGFhSXdwMWFVMnlKSlg5?=
 =?utf-8?B?dUlKbU9NYlVnRGROd09sd1pLSTlMbmlHTnI1Mlc3THQzU1BFaVFXZkM5Qkk2?=
 =?utf-8?B?VmZMckFsZjlzZHpSTnVSRFpHRnBaaUp3bnB6cVZRRWFucGVBaVB5ZXk1TC9N?=
 =?utf-8?B?N1dESHlsWVRPUGUzc0QvQklSUS9IajRXUDg4WXRNREJock9TVXc5a1JMTnkx?=
 =?utf-8?B?NVBUcFNKKzF3U0FYMThMbS9OcStWYytvWmhsOWhJUVZtdXpnVjl0RHkyQjd6?=
 =?utf-8?B?OGpwdDVZVzBySE5oMzl0QkFpRzI3alpFUCt3RWR0YTNMNXZIS0lYSFFvMDJy?=
 =?utf-8?B?VWNtd21abTdZcThqb0c1NFMvbEsraFE0WnBiVmF5TnlmT1BOb09DeXBqa0RT?=
 =?utf-8?B?MHV5ME9Sb051M3h5RFpWWEdNb3VzbWUrZGQrVnNQOUNPYW5hNi8wVzVLVGFl?=
 =?utf-8?B?QytERlpBR2tGUkpjVXljNm8rOGpoRndKMzhya0lIa0R2VzRMN2J2R2V0R1dp?=
 =?utf-8?B?S043aFZ6VHJ1bzNhQ2hSTHlGcWdKeTVsdXZuUFU3eFRMYnBSaml6TnpmTUU5?=
 =?utf-8?B?OExaSHgrVVJWMnZyaGxmVGhHbm1QbGtKajdrQkhycVZtd25hL3B3VjhIYkpT?=
 =?utf-8?B?eDZwS2xDY3BNZEFtNXdoZmh4YTFOMjAyQ0tlTEFmQVd6bDNhK2NKbFRqdzBO?=
 =?utf-8?B?d2RSRUdNWWlLRWg5ZmM2UVY5Y1JnbWpJeEdsRTBOZm5PL0FPSVRkTy9BekhP?=
 =?utf-8?B?S09KdFlGVUxDNDZ6MHVhN3I4Y3NmNHNjMkIzV1Y2amMwWXN1TnNJUEFLZ3Fi?=
 =?utf-8?B?TnFLNGNYT3UzL0QzRGo0YWdKMHNtcm15TmxyaGFLak02UTZEQ01MZWVtb1RG?=
 =?utf-8?B?NVZUV1JJd0xpUUdSR3NTanVzSFlYa0RGMzBZZXBpd1ZnZG4xUXpjcWNneW1q?=
 =?utf-8?B?c3F5enlXM0sya0F5UWNJTnBMUVoyQTVKZnBacDhTcVYxeHFGTU1Pb2hKVXhO?=
 =?utf-8?B?VytiQ0VCMkNvSGs5T1gzeitNS0s4K1RWdW5qNk91a1pDNE0wMHh4d0kzSUJJ?=
 =?utf-8?B?NDhGZlk2a21BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3577.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UExlT0tveHRBSTg5WjFGYlBZN2lselA0a0RRZE4rSzVaWUpKeU90TXdlUm9Y?=
 =?utf-8?B?WllLRTlNRDZxZkdWOXFDRjlHWEFndjhoTzNCbUJBU0lja1ZDSmt0WXJXTEhr?=
 =?utf-8?B?a1h3SmY4R04zT1J4S0FSWENGT2oxYlA1VWlrWDFCQlA4MXpIODU2VjdtdGho?=
 =?utf-8?B?TURBemZLSmZMbUVPcnlZRTNWVVlHQmptUjdKTXBmelJkQy9PMy9zcklKdHlP?=
 =?utf-8?B?NC9CUGNDQVVTMjB6SG05UUxNUjdYSm8vSWlaR05TNGkyZ21RaXBqRjNVOWdW?=
 =?utf-8?B?THgxR1Z2TUVJb1R1VlAwMFpFNzRFeGZ3MVlnYy9VTnRNU04zZ25pajlEUUJ4?=
 =?utf-8?B?TmhFdUxSOTYvR1ZSTjkvNldEc3c1RDJnSGVFYlFFNjF4WXJiSnNzTDFtRDBD?=
 =?utf-8?B?U2NaZFRoQXUzNVFDUkVieFlPdHB4T0pXbzNzUXJ5eHlXLzVaZmo2bFA5aHJt?=
 =?utf-8?B?aXlFRDdRV1NmRmFNSHJvejNCaE90aDNkc3JGdmoxcTVFeXBRS01pZ0FZeHp2?=
 =?utf-8?B?N01XZUF3RWtTMmc1K3UxbFA5dGhOZ0FHRWtVUHZOWG5yM292MzdxblZCY0JW?=
 =?utf-8?B?WXlhcU5xNTNEbWZVVlI5OW9TNFhMYUIvN3hteTlMcncrREtNMzlET0hPTGc0?=
 =?utf-8?B?Wkk5QkhZbzBKOEdHQmlqa2FvRnpPNWdaUG5ZOVU3YnQxc1o2U25VMDFxc2JH?=
 =?utf-8?B?SW9ZdjlEWXRqZzBMV3F5WnhuMFlMbGhpMkVkSTdIc0tRWVRiTkE3VEVQOHJ5?=
 =?utf-8?B?R0hiUFc0SWhUNlFwQlkyUzZSMWFtUWI5TkRLTE42bU9pSTVJWC83bDZlWFNl?=
 =?utf-8?B?YlM4SUc3UWEzL2NuS1N1VUNQMzAvTnNNd3pnQ3pkVS9Xa1Q2VHVUdUVYYW5P?=
 =?utf-8?B?RzdPallzdnhSV1RRVURiTm02MXBKZWtQTUxnVGswV3p4T3B3ZnBsbVVjTlFl?=
 =?utf-8?B?bXNIQTRVTFJWSTdtNDgrdVFSTUE2N1F2amRyL1NvWlJ1L0NLWnZSYllSaXRp?=
 =?utf-8?B?c3NJempkaEwvd0dBWmpiNy9uWmdGWVdRN3lxbmdJVXVHT1MvQjlUNXRScThk?=
 =?utf-8?B?akh3NjBlVXdFRldHVzFGdU5qSGtLdlc3QVQ3RzY4NjZoQkxrcnphajQ2N3pu?=
 =?utf-8?B?YjNFTWNLWGw4dkJwTmE0SnZydCthU0ZRNEJOeGFCdzhPQU9ZMlVhbHFwdGt0?=
 =?utf-8?B?ZWRxbjBGVkw1dVk1aEo3S0RCYm04UFk4R0FQTFd3N2xmMkozTkQ1S0ptQlNG?=
 =?utf-8?B?SmFoYmVuRnovZ3NkTDVuQ3hjczZzT2lrWmNyQzJ2KzV4TDhHekhEcUFIaGJy?=
 =?utf-8?B?dmZydmROTGRGVHlCckZhNmVMR1dJMnRJUVE3K1lrU1htc3U5MGNEZGFTak1B?=
 =?utf-8?B?V0tVTmxIZnF0bG4xSDczZjlmNE9aVFloNXdRK1NMYm9qVGE1UGFuaUF6RGdy?=
 =?utf-8?B?RTdXU2doZE1rTW1JazM2UG05WEFCbVU4N3N2TW0xRTBRc0hNSkh5TVpkN3dR?=
 =?utf-8?B?bUdNOFQ0TjVxNjZ3MTV3WkIxY1c5NXZTUnRiOUZyU0xxRitYSFlmbUtMUHdY?=
 =?utf-8?B?MThSQ1hyd1pKME9zWHNGVXBVSkNXVS9uTzd3d2ErSFNTRWRjNjVtZGhualZD?=
 =?utf-8?B?Z0V0S3h1K2ErR0J3VDE1N3Rqa3BVdG92V1c2MSt0U3lVenZhRXVKVjhkRnJ6?=
 =?utf-8?B?djZobnBLVU53bzY5OE1QWEFPN2E4NUs4OXpKQjNWMmZRVGlRd1BpUUcrVktW?=
 =?utf-8?B?dHBwZjk1OHZhd2FZd2J5T25JRFp6UTBGdmp0NUZLT0JDOXJYcHRnMDJPVVNk?=
 =?utf-8?B?dHJOckgyYXBTRnYrWjlpVHZrWjBVTWJwZUlMVHdmc3RNcXYyRUw0TUI1WWNr?=
 =?utf-8?B?aEhvZlNLb2RBZGVRVVdnMCtCVlZkYXpyaHpIZ29TVFRXb2tnYUh6MzBDdXlW?=
 =?utf-8?B?RUFJUEliNjh6Y0tnWnRyQy90dHhrTzViTFZKbWc3RzNLUGRHTmpRU01aZDky?=
 =?utf-8?B?TExiSFI0UzZmR2d2SnBwK2FudFpZSG1ZS1lLMy9WOXcwbmg2MnpzbUR0blpw?=
 =?utf-8?B?VTU2TGpEaUhienRWd21TUWVvWjMrdzlvVDVqcnF0QStFL01VYTgxU1RCNk5T?=
 =?utf-8?B?TGhIbkhYYnFaaDNHcXBYYXpiRnVqRTREVDhiR3YvYWdEMURvbkF5Ym52TE5T?=
 =?utf-8?Q?2CRsnQm8igaYE0ZfvVowF1Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E986ABC48805064F86B8CAB52194C7C7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3577.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb9cf65-e3f7-4031-a660-08de32badc30
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 22:25:27.2053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxMyulg0x2IDpNaoNNRyua4xMshGL1SVXfXl7/s3EPi8c7/R0rHEb46KYl2kbO/fsmdyBKoxd4mINpvu66oWgk+DpqGVc7o840r24VaxwzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10899

DQoNCk9uIDAzLjEyLjI1IDIzOjEwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpLA0KDQpIZWxs
byBKdWxpZW4NCg0KPiANCj4gT24gMDMvMTIvMjAyNSAxODo1OCwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6DQo+PiBDcmVhdGluZyBhIGRvbTBsZXNzIGd1ZXN0IHdpdGggYSBoaWdoIHZDUFUg
Y291bnQgKGUuZy4sID4zMikgZmFpbHMNCj4+IGJlY2F1c2UgdGhlIGZpeGVkIDRLaUIgZGV2aWNl
IHRyZWUgYnVmZmVyIChET01VX0RUQl9TSVpFKSBvdmVyZmxvd3MNCj4+IGR1cmluZyBjcmVhdGlv
bi4NCj4+DQo+PiBUaGUgRkRUIG5vZGVzIGZvciBlYWNoIHZDUFUgYXJlIHRoZSBwcmltYXJ5IGNv
bnN1bWVyIG9mIHNwYWNlLA0KPj4gYW5kIHRoZSBwcmV2aW91cyBmaXhlZC1zaXplIGJ1ZmZlciB3
YXMgaW5zdWZmaWNpZW50Lg0KPj4NCj4+IFRoaXMgcGF0Y2ggcmVwbGFjZXMgdGhlIGZpeGVkIHNp
emUgd2l0aCBhIGZvcm11bGEgdGhhdCBjYWxjdWxhdGVzDQo+PiB0aGUgcmVxdWlyZWQgYnVmZmVy
IHNpemUgYmFzZWQgb24gYSBmaXhlZCBiYXNlbGluZSBwbHVzIGEgc2NhbGFibGUNCj4+IHBvcnRp
b24gZm9yIGVhY2ggcG90ZW50aWFsIHZDUFUgdXAgdG8gdGhlIE1BWF9WSVJUX0NQVVMgbGltaXQu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90
eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBWMTogaHR0cHM6Ly9ldXIwMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/IA0KPj4gdXJsPWh0dHBzJTNBJTJGJTJGcGF0Y2hl
dy5vcmclMkZYZW4lMkYyMDI1MTIwMjE5MzI0Ni4zMzU3ODIxLTEtIA0KPj4gb2xla3NhbmRyLl81
RnR5c2hjaGVua28lNDBlcGFtLmNvbSUyRiZkYXRhPTA1JTdDMDIlN0NPbGVrc2FuZHJfVHlzaGNo
ZW5rbyU0MGVwYW0uY29tJTdDNTdiZjc3MTFhYzQ3NDdkZTNkMmYwOGRlMzJiMDY5Y2UlN0NiNDFi
NzJkMDRlOWY0YzI2OGE2OWY5NDlmMzY3YzkxZCU3QzElN0MwJTdDNjM5MDAzOTMwNDQzOTcwNjM5
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3
TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNE
JTNEJTdDMCU3QyU3QyU3QyZzZGF0YT11NnBwMzklMkZWdG8ydlU3SHA1YVhsNDZWRjR6RHZEOEM3
OVhwMDliYm93UzQlM0QmcmVzZXJ2ZWQ9MA0KPj4NCj4+IMKgwqAgVjI6DQo+PiDCoMKgwqAgLSB1
cGRhdGUgY29tbWl0IHN1YmovZGVzYw0KPj4gwqDCoMKgIC0gdXNlIGEgZm9ybXVsYSB0aGF0IGFj
Y291bnRzIE1BWF9WSVJUX0NQVVMNCj4+IMKgwqDCoCAtIGFkZCBCVUlMRF9CVUdfT04NCj4+IC0t
LQ0KPj4gLS0tDQo+PiDCoCB4ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMg
fCAxNiArKysrKysrKysrKysrLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZp
Y2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIGIveGVuL2NvbW1vbi8gDQo+PiBkZXZpY2UtdHJlZS9k
b20wbGVzcy1idWlsZC5jDQo+PiBpbmRleCAzZjViOTg3ZWQ4Li4zOGE1ODMwODEzIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+PiArKysg
Yi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+IEBAIC00NjEsMTUg
KzQ2MSwyNSBAQCBzdGF0aWMgaW50IF9faW5pdCANCj4+IGRvbWFpbl9oYW5kbGVfZHRiX2Jvb3Rf
bW9kdWxlKHN0cnVjdCBkb21haW4gKmQsDQo+PiDCoCAvKg0KPj4gwqDCoCAqIFRoZSBtYXggc2l6
ZSBmb3IgRFQgaXMgMk1CLiBIb3dldmVyLCB0aGUgZ2VuZXJhdGVkIERUIGlzIHNtYWxsIA0KPj4g
KG5vdCBpbmNsdWRpbmcNCj4+IC0gKiBkb21VIHBhc3N0aHJvdWdoIERUIG5vZGVzIHdob3NlIHNp
emUgd2UgYWNjb3VudCBzZXBhcmF0ZWx5KSwgNEtCIA0KPj4gYXJlIGVub3VnaA0KPj4gLSAqIGZv
ciBub3csIGJ1dCB3ZSBtaWdodCBoYXZlIHRvIGluY3JlYXNlIGl0IGluIHRoZSBmdXR1cmUuDQo+
PiArICogZG9tVSBwYXNzdGhyb3VnaCBEVCBub2RlcyB3aG9zZSBzaXplIHdlIGFjY291bnQgc2Vw
YXJhdGVseSkuIFRoZSANCj4+IHNpemUgaXMNCj4+ICsgKiBjYWxjdWxhdGVkIGZyb20gYSBmaXhl
ZCBiYXNlbGluZSBwbHVzIGEgc2NhbGFibGUgcG9ydGlvbiBmb3IgZWFjaCANCj4+IHBvdGVudGlh
bA0KPj4gKyAqIHZDUFUgbm9kZSB1cCB0byB0aGUgc3lzdGVtIGxpbWl0IChNQVhfVklSVF9DUFVT
KSwgYXMgdGhlIHZDUFUgDQo+PiBub2RlcyBhcmUNCj4+ICsgKiB0aGUgcHJpbWFyeSBjb25zdW1l
ciBvZiBzcGFjZS4NCj4+ICsgKg0KPj4gKyAqIFRoZSBiYXNlbGluZSBvZiAyS2lCIGlzIGEgc2Fm
ZSBidWZmZXIgZm9yIGFsbCBub24tdkNQVSBGRFQgY29udGVudC4NCj4gDQo+IFdoYXQgaWYgdGhl
IHVzZSBkZWNpZGVzIHRvIHBhc3MgYSBEVEIgZnJhZ21lbnQ/IEhvdyBkbyB3ZSBrbm93IHRoaXMg
d2lsbCANCj4gZml0IGluIHRoZSAyS2lCPw0KDQpJZiBhIHBhcnRpYWwgZGV2aWNlIHRyZWUgaXMg
cHJvdmlkZWQgdGhlbiBpdCB3aWxsIGJlIGFjY291bnRlZCANCnNlcGFyYXRlbHkuIFRoZXJlIGlz
IGEgY29kZSwgbm9uLXZpc2libGUgaXMgdGhlIGNvbnRleHQsIHNvIEkgdGhpbmssIHdlIA0KYXJl
IGdvb2QgaGVyZS4NCg0KICAgICAvKiBBY2NvdW50IGZvciBkb21VIHBhc3N0aHJvdWdoIERUIHNp
emUgKi8NCiAgICAgaWYgKCBraW5mby0+ZHRiICkNCiAgICAgICAgIGZkdF9zaXplICs9IGtpbmZv
LT5kdGItPnNpemU7DQoNCg0KPiANCj4+ICsgKiBFbXBpcmljYWwgdGVzdGluZyB3aXRoIHRoZSBt
YXhpbXVtIG51bWJlciBvZiBvdGhlciBkZXZpY2UgdHJlZSANCj4+IG5vZGVzIHNob3dzDQo+PiAr
ICogYSBmaW5hbCBjb21wYWN0ZWQgYmFzZSBzaXplIG9mIH4xLjVLaUIuIFRoZSAxMjggYnl0ZXMg
cGVyIHZDUFUgaXMgDQo+PiBkZXJpdmVkDQo+PiArICogZnJvbSBhIHdvcnN0LWNhc2UgYW5hbHlz
aXMgb2YgdGhlIEZEVCBjb25zdHJ1Y3Rpb24tdGltZSBzaXplIGZvciBhIA0KPj4gc2luZ2xlDQo+
PiArICogdkNQVSBub2RlLg0KPiANCj4gRm9yIGluLWNvZGUgZG9jdW1lbnRhdGlvbiwgdGhpcyBp
cyBvayB0byBqdXN0IHByb3ZpZGUgc29tZSBudW1iZXJzLiBCdXQgDQo+IHRoaXMgbmVlZHMgYSBi
aXQgbW9yZSBkZXRhaWxzIGluIHRoZSBjb21taXQgbWVzc2FnZSB3aXRoIHRoZSBleGFjdCB0ZXN0
cyANCj4geW91IGRpZC4gVGhpcyB3b3VsZCBiZSBoZWxwZnVsIGlmIHdlIGV2ZXIgbmVlZCB0byBj
aGFuZ2UgdGhlIHNpemUgKGZvciANCj4gaW5zdGFuY2Ugd2UgY291bGQgaGF2ZSBleHRyYSBlbXVs
YXRlZCBkZXZpY2VzIG9yIHdlIG5lZWQgYW5vdGhlciANCj4gcHJvcGVydHkgcGVyIENQVSkuDQoN
Cm9rLCBJIHdpbGwgYWRkIG15IHRlc3RpbmcgZGV0YWlscyBpbnRvIHRoZSBjb21taXQgZGVzY3Jp
cHRpb24uDQoNCj4gDQo+PiDCoMKgICovDQo+PiAtI2RlZmluZSBET01VX0RUQl9TSVpFIDQwOTYN
Cj4+ICsjZGVmaW5lIERPTVVfRFRCX1NJWkUgKDIwNDggKyAoTUFYX1ZJUlRfQ1BVUyAqIDEyOCkp
DQo+IA0KPiBPbiBBcm0zMiwgTUFYX1ZJUlRfQ1BVUyBpcyA4LiBUaGlzIG1lYW5zIHRoZSBuZXcg
RE9NVV9EVEJfU0laRSBpcyBnb2luZyANCj4gdG8gYmUgc21hbGxlciB0aGFuIDQwOTYuIFdoeSBp
cyBpdCBvaz8NCg0KWW91IGFyZSBjb3JyZWN0IHRvIHF1ZXN0aW9uIHRoZSBpbXBhY3Qgb24gQXJt
MzIsIHdoZXJlIE1BWF9WSVJUX0NQVVMgaXMgDQpzbWFsbGVyLCBsZWFkaW5nIHRvIGEgY2FsY3Vs
YXRlZCBidWZmZXIgc2l6ZSBvZiAzMDcyIGJ5dGVzLCB3aGljaCBpcyANCmxlc3MgdGhhbiB0aGUg
b3JpZ2luYWwgNDA5NiBieXRlcy4NCg0KVW5mb3J0dW5hdGVseSwgSSBoYXZlIG5vIHBvc3NpYmls
aXR5IHRvIHRlc3Qgb24gQXJtMzIuIEJ1dCwgSSBkbyBub3Qgc2VlIA0KbXVjaCBkaWZmZXJlbmNl
IGJldHdlZW4gQXJtNjQgYW5kIEFybTMyIGluIHRoZSBjb250ZXh0IG9mIERvbVUgZGV2aWNlIA0K
dHJlZSBnZW5lcmF0aW9uIGJ5IGxvb2tpbmcgaW50byB0aGUgY29kZS4NCg0KSSBzaW11bGF0ZWQg
dGhpcyBleGFjdCBlbnZpcm9ubWVudCBvbiBteSBBcm02NCBzZXR1cCB0byB2YWxpZGF0ZSB0aGF0
IA0KdGhlIG5ldyBzaXplIHJlbWFpbnMgc3VmZmljaWVudC4gVG8gZG8gdGhpcywgSSB0ZW1wb3Jh
cmlseSBzd2l0Y2hlZCANCk1BWF9WSVJUX0NQVVMgdG8gOCBhbmQgcmFuIHRlc3RzIHdpdGggMSBh
bmQgOCB2Q1BVcy4NCg0KDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20w
bGVzcy1idWlsZC5jIA0KYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMN
CmluZGV4IDM4YTU4MzA4MTMuLjBjNjRiOWRmYjcgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL2Rl
dmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCisrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUv
ZG9tMGxlc3MtYnVpbGQuYw0KQEAgLTQ3Miw3ICs0NzIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCAN
CmRvbWFpbl9oYW5kbGVfZHRiX2Jvb3RfbW9kdWxlKHN0cnVjdCBkb21haW4gKmQsDQogICAqIGZy
b20gYSB3b3JzdC1jYXNlIGFuYWx5c2lzIG9mIHRoZSBGRFQgY29uc3RydWN0aW9uLXRpbWUgc2l6
ZSBmb3IgYSANCnNpbmdsZQ0KICAgKiB2Q1BVIG5vZGUuDQogICAqLw0KLSNkZWZpbmUgRE9NVV9E
VEJfU0laRSAoMjA0OCArIChNQVhfVklSVF9DUFVTICogMTI4KSkNCisjZGVmaW5lIERPTVVfRFRC
X1NJWkUgKDIwNDggKyAoOCAqIDEyOCkpDQogIHN0YXRpYyBpbnQgX19pbml0IHByZXBhcmVfZHRi
X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IA0Ka2VybmVsX2luZm8gKmtpbmZvKQ0KICB7
DQogICAgICBpbnQgYWRkcmNlbGxzLCBzaXplY2VsbHM7DQpAQCAtNTc3LDYgKzU3Nyw5IEBAIHN0
YXRpYyBpbnQgX19pbml0IHByZXBhcmVfZHRiX2RvbVUoc3RydWN0IGRvbWFpbiAqZCwgDQpzdHJ1
Y3Qga2VybmVsX2luZm8gKmtpbmZvKQ0KICAgICAgaWYgKCByZXQgPCAwICkNCiAgICAgICAgICBn
b3RvIGVycjsNCg0KKyAgICBwcmludGsoIkZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogJWQg
Ynl0ZXNcbiIsIA0KZmR0X3RvdGFsc2l6ZShraW5mby0+ZmR0KSk7DQorICAgIHByaW50aygiUHJl
ZGVmaW5lZCBGRFQgc2l6ZSBpczogJWQgYnl0ZXNcbiIsIERPTVVfRFRCX1NJWkUpOw0KKw0KICAg
ICAgcmV0dXJuIDA7DQoNCiAgICBlcnI6DQooRU5EKQ0KDQoNCg0KY3B1cz0xDQooWEVOKSBGaW5h
bCBjb21wYWN0ZWQgRkRUIHNpemUgaXM6IDE1ODYgYnl0ZXMNCihYRU4pIFByZWRlZmluZWQgRkRU
IHNpemUgaXM6IDMwNzIgYnl0ZXMNCg0KY3B1cz04DQooWEVOKSBGaW5hbCBjb21wYWN0ZWQgRkRU
IHNpemUgaXM6IDIzNzAgYnl0ZXMNCihYRU4pIFByZWRlZmluZWQgRkRUIHNpemUgaXM6IDMwNzIg
Ynl0ZXMNCg0KQWxzbywgaWYgSSB1bmRlcnN0YW5kIHRoZSBjb2RlIGNvcnJlY3RseSwgb24gQXJt
MzIgdGhlICJlbmFibGUtbWV0aG9kID0gDQoicHNjaSIgaXMgbm90IGFkZGVkIHRvIHRoZSBnZW5l
cmF0ZWQgZGV2aWNlIHRyZWUsIHNvIEFybTMyJ3MgdkNQVSBub2RlIA0Kd291bGQgcmVxdWlyZSBs
ZXNzIHNwYWNlLg0KDQogICAgIGlmICggaXNfNjRiaXRfZG9tYWluKGQpICkNCiAgICAgew0KICAg
ICAgICAgcmVzID0gZmR0X3Byb3BlcnR5X3N0cmluZyhmZHQsICJlbmFibGUtbWV0aG9kIiwgInBz
Y2kiKTsNCiAgICAgICAgIGlmICggcmVzICkNCiAgICAgICAgICAgICByZXR1cm4gcmVzOw0KICAg
ICB9DQoNCg0KDQo+IA0KPj4gwqAgc3RhdGljIGludCBfX2luaXQgcHJlcGFyZV9kdGJfZG9tVShz
dHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgDQo+PiBrZXJuZWxfaW5mbyAqa2luZm8pDQo+PiDCoCB7
DQo+PiDCoMKgwqDCoMKgIGludCBhZGRyY2VsbHMsIHNpemVjZWxsczsNCj4+IMKgwqDCoMKgwqAg
aW50IHJldCwgZmR0X3NpemUgPSBET01VX0RUQl9TSVpFOw0KPj4gK8KgwqDCoCBCVUlMRF9CVUdf
T04oRE9NVV9EVEJfU0laRSA+IFNaXzJNKTsNCj4+ICsNCj4+IMKgwqDCoMKgwqAga2luZm8tPnBo
YW5kbGVfaW50YyA9IEdVRVNUX1BIQU5ETEVfR0lDOw0KPj4gwqAgI2lmZGVmIENPTkZJR19HUkFO
VF9UQUJMRQ0KPiANCj4gQ2hlZXJzLA0KPiANCg==

