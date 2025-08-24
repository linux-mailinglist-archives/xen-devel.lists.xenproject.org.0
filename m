Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A46B331CC
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 20:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092190.1448205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqF9I-0001cm-Pj; Sun, 24 Aug 2025 18:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092190.1448205; Sun, 24 Aug 2025 18:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqF9I-0001Zv-Mp; Sun, 24 Aug 2025 18:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1092190;
 Sun, 24 Aug 2025 18:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Bk9=3E=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uqF9H-0001Zp-7z
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 18:08:59 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c01144-8115-11f0-b898-0df219b8e170;
 Sun, 24 Aug 2025 20:08:57 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB8094.eurprd03.prod.outlook.com (2603:10a6:150:1d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Sun, 24 Aug
 2025 18:08:50 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Sun, 24 Aug 2025
 18:08:50 +0000
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
X-Inumbo-ID: 66c01144-8115-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+vWnWWjjxsBhXXVf1odbtL27Aaqp9/h5nSoFrkEn/3d7rh0HpgIMEmjKqEJV3h6f3KFCgKrgE8lM8+hWR66YozR1Ab8T9smqKsyO4fM3qCw7JkDuOHpia821Bi0Z14O40auJgtWHN1D04KUCmYtSU3QEfYfML1XvD9BLYEl5b9/1X8iuNZp0l3cHBKVKgsBZddcg6slCqhk8DnKg4XcRrNc5ieaQOs32wbDdKKvTV+RXHIcx7xlWcbzyHXsxwPdCGCi3E/G585QAHQpg/bOI6QWZlSdIPytuTTvEpazsLrEDeh8OfJ3SWxLPEFfuo++jc0f9cipS/OL8sW/S8JPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4imJ6dvURYjQYR/dZwnaWRCobQTX2Deyj3iYav320gM=;
 b=eFHkLwtt+v6toZZiHBoQM6Go2U1BgGPbNW694gMuRiQ0rX1zinZ5EQl9NKrHNqGclrWTsGu5StTrPVVGZ5RIicu7DfZQxcsj4mjZMSLm2EYfyiAWJqOIqoBgx9oMn22u4XiaxIlLbGRzJzgSTnPwxh8FUavR+Sw8FKHqO1+hDKrGVnHbo15TCT/y9YcXTHDha7JbrYHmtVf3ZXtYLfM+CKQwM/ni+jvTcHZ7RhIbUZmHT0K7Hc8SSAnWzd+encpR30D7gxUVHlQNBCAYWqEBiLEZbBcPhctzUK8ufmw0zQOlwr4HNZWWHS1hccouFDus+vfsEMxFXSyLeC/Oe3zS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4imJ6dvURYjQYR/dZwnaWRCobQTX2Deyj3iYav320gM=;
 b=o1FjAHwQX9lbbJb3EuxPqX+OMaOlY+WlcGAE5i9HqHlJzLde5QjxMkjILWpXnwkRy1K9GGy0hQBSVUtmfS+w/LLcMbgGBDZT26PFxuCt8lb+9eQ8Q2UpcysenV82nb1Aql7+MbWioeOyto5h7+jJZURX1dIiMAQdCQbFFO+D5LdbD6QNBfPx95C4lD5TjyEBZShOOTWocW3gr//m7BBp8GSZ0qEkUS3bv/eLiRSJ+M5XlLMYjbZOrkm3lyyASNYMrMbPCSm5tgglWT5nhvjtkEIz6u8yMUrrRvAVvlCjhXP6EKzWdVke2rkaECodjurl55ZUiNAOtoYQ1OTcpo8+9w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Topic: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcB5d76MRh/Swq2EGu624C+G/Fb7RwRBaAgAHxAoA=
Date: Sun, 24 Aug 2025 18:08:49 +0000
Message-ID: <70eb1b7a-2882-40f8-8ebb-c82fbaaba411@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
 <29d0e5ed-78b3-45ad-9543-e47731c41c3f@gmail.com>
In-Reply-To: <29d0e5ed-78b3-45ad-9543-e47731c41c3f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB8094:EE_
x-ms-office365-filtering-correlation-id: 24b7de65-89f6-4d05-804a-08dde3394701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?cElEZ0pncFJCd2gvWStpdEVLV3Z2ZG9GdThhK01EYUdZWktHTGdHMUd5N2dZ?=
 =?utf-8?B?WFp2S2dCQzVxdmVXVmRTVkdWMWpoTi9KVDhQOGtTOEkrSkxiNDUwVzgzbHhj?=
 =?utf-8?B?bHFKbzJMZjYxSjdka2RFL201eWh0SU52KzNnS1pqbFpkL29QelpNdjVyVmdz?=
 =?utf-8?B?ZkpJQVlSTEowUmVxOGdZUzl3czlZZmtsTEhyWkdkaDlPaXNnQUFtL1hSZ3hS?=
 =?utf-8?B?WjJwWjBJN1lDR2NnWjUvNEVTSTV5c2NxalVoNHpjTjcvblM0ektjbGo4UktX?=
 =?utf-8?B?ZUhvKzhUbVR3OVBqZ3dsc2p0S1pwWVg2V3Rkc2EvaXBvc0JtVk5POVoxbG1H?=
 =?utf-8?B?MWpuRHlvWTBiR2RlMko4L0JYcFBEOVhtdGozbW5aZktWdlUrU2UyVnBORElX?=
 =?utf-8?B?VEhETWVHdWFsaGVINDV5NlVidGF6Z3dCRVg1UW9SM040Q3lXckcvTEg4QUF4?=
 =?utf-8?B?ZVBsRS9OSExWejB4R2lkY2tKTXVVUllSTVlhcHk5OUNwZllRNUJreUxCV0Vs?=
 =?utf-8?B?SlRkQjM2djZVMVZ2Yk5pdWtGejczTEV0UUR1b1ZWSnE4SVBVeWdqcVpKMGJI?=
 =?utf-8?B?YzJRWmlmSnBobnc2cGU3RmlINjdWZUt2Rmk2cVBzdS9KejhUMzhXWldBSERp?=
 =?utf-8?B?Zk1mRTdma0ROMnY0aVN6NmhLMXRpVmJtbzY5cktkbE9TQzJGdS93VU1jZjFx?=
 =?utf-8?B?Sm1VbVcvN0FjOHQ3ZGRoaXozMmNrQWpBLzliZWpGeDlRVDd2R09uc2t2Qy9q?=
 =?utf-8?B?bE1YRVlVRXZwZDVYSkxlWEdoTmZEYURwRHkwc0doM3JmaHRSK0ljejhqVzI3?=
 =?utf-8?B?bGoxajNSdHJRWkZvU1QrYUVMS1dGdm9UaU14NXNSMzcwSW1adVZEZDJvOVds?=
 =?utf-8?B?ak90ckpDckx4SmN6NDk4WWpmaU0wUVM5N2cxSjJnZHVCZGcvbHkxWVVMRDND?=
 =?utf-8?B?eUJmblhBWEFOTUU3WEpkOGZRWkNTK3pGL2NSYm44cEJpbFA4aDZqclQ4aTh3?=
 =?utf-8?B?TmpOclJnU1l1d1ZlNTJGU0EwbS9tYURCdE9RcGdlc1RveXI4LzZ2M1VMRkxT?=
 =?utf-8?B?QmtKelN2TW5UQ2Z6TGdsejUrRmxFbjVEQlFIQ1Jkb3BRWkVEZ1l2WXNQaExS?=
 =?utf-8?B?cUk2YmdZQWg0N1pUcWx1ZVRqc2FkR0xrQ1FQd0J6alBnZUU5Qk53c1R2TVVO?=
 =?utf-8?B?aDM4MGJlUWVrT3lOclhya3NPQ0M5bUFrclNKanBlcDdKUEdJWnZSV0ptUjVw?=
 =?utf-8?B?RDAvb1dWazYrUStaWk5NV3pQamZONDh5NUtxRHBDV2RtM0VaT1RicVlaSVJ4?=
 =?utf-8?B?YzZuY1hKZ0kzQmpVd1ExMUFPZHh3Y3lsZVpIMDJydmpSV3hzL2NXNHhkQVMy?=
 =?utf-8?B?VE9rTzlhdUxxZEZxMjVvdnNwZkFnbjNTOWFjL0dEdTVQU05DanZ2VnBPOWRt?=
 =?utf-8?B?djdZQmdKOC91ZTM5YVVZV085MUJidGZucFBZYnRuT1crbXBva01ORFRWdno2?=
 =?utf-8?B?M21BeGJteG1QNm82bFRTNEtXelJGcHNzYWxJa3RrZUw4Q21kOFNvRmRBR0ZD?=
 =?utf-8?B?OHQ1WitxRFRnUXVtLzJyS1Q5emRoUmo2RDdYTGdSVW05dHZnN1IyL0dDZEtF?=
 =?utf-8?B?WWx5a2lERS9ZcDdWQ08rMHNzZXMraXhMQjZVSGNIY0dOa01pK3VFL1Z0VFNL?=
 =?utf-8?B?b05DaVFzVGF2cjJiQ2V0T2pEU1orRkxOdGJ4eitoOHB5RmxQMi9WaHhCeUcr?=
 =?utf-8?B?YitlV0F2MmV2bzFNODFlTlZGSldta0ZkT0ZYQ2ZmODBPUVFPNUMvUUZnOHQ4?=
 =?utf-8?B?MkhNTktIS2o0TVJyaFdsbDdHZWlZR3VOQXBPOEZPWS9wTjgwZnRqRll1M1Nu?=
 =?utf-8?B?SXdSTGpkR01wRXdwMDhhdU9aMC9sS1VKdnRrOGpFNTZyZmh4elNnTlpYU3BO?=
 =?utf-8?B?MFFMSjl1b25pRDgzSnZuU3Nra0RiVnN5R0pqUzFJL2pSZWdZeEozR2U5QVNk?=
 =?utf-8?B?am0ybFFjdUd3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmdhay9IVVpkNnIrTVhZR1A1cFlRd2Y5QXZzK3Y0cTlIalE1UHdDWFlMb2Rk?=
 =?utf-8?B?MmRRSUlEQjNmemNjMmoyUE1nOHcyVnRDQ2RZdmNkc1IydktDVWtrMUZKVElV?=
 =?utf-8?B?eEZLcHh3ckpnREE0amd1MFJRMmdoQ3hwSUJ3V2tJelZvT1B2TktBL2Z6dWQ1?=
 =?utf-8?B?UHN5eFZRMmN1eDErODQ1M2RxcmxVWjNBMDJFb1NrSGtoNlZuU0FWWUxvY2VZ?=
 =?utf-8?B?ZG9OYVdvMEZyMHdTQ0V1b1p5VlZmUUhNdko0T1NKRHRtZllvTE02QXBKZ1dH?=
 =?utf-8?B?MzJQVWJGU0ppdWFEMVZVWVZxNWc4NVdEbHY3bUtKL25OYmhkelgrYXBrNUFD?=
 =?utf-8?B?ZGJEVXlvUnpucnVkV1JJWmJoVko1UXl4M01ueUQwa2pvdDlEYUY4RFJQRGZO?=
 =?utf-8?B?M0JCVDlUY1g5cXhzb1U3OHhESEU1Ymw3aXp1Nk5zWTJ1SFlIbnBOaGthMkh2?=
 =?utf-8?B?a2xSd0VYWVFTb25PN0ZMSVJvYUpvUnVnZVF4ZkZJYi9wRDIrMDJ0Y2dtMllu?=
 =?utf-8?B?b3h3ODVFMFJOd3FqUkw0Mzkxd3VQalBPblpLbENQOGFlT2pNOTBxUDFaMFZC?=
 =?utf-8?B?OFJzdWhzS0RWM0dDcEl4VTRYR2l3Z1BXT2k2ZElmQVdIeHlqUlFCS2ZTaTd1?=
 =?utf-8?B?UC8vVXdVQVN4WEhGa3JQdjVES3k2RDBzb3hPZkhFMDNrUzM5a3NFYzQzTW9w?=
 =?utf-8?B?SlkvRVB4WmhzdXYrbjZpZThBU2dIRGNpUUk0MnhZWExhTngzaVZxS3FyRG5s?=
 =?utf-8?B?em1Rb2Y4TlNNbGgzZ3luWWxSbEhuZW5oNGVtRVRpYk8zdlFzaUhuZTFFbnRM?=
 =?utf-8?B?alhkUGpxMzlhQ21BTm1lME1LYTNpVGwxVWFPbFo4NWpndzhydTZrOERkQXBO?=
 =?utf-8?B?dEVEOTJ1ZG4zZG1xbENBYjhyQThHa0NzcFczeG1DNUJNaVhjbTNIUUpPQ0k2?=
 =?utf-8?B?UC95c0Z1eTJQUmJXSGZmWHhsMTNxVEwwRVlNUmd0TG1iUTEwejVVSHlIM2s2?=
 =?utf-8?B?RWl2RStNcERkUXJRUkFHc3E0aVJ4Z3FNZWpzcTdDRk93U0h3WUZheFhjMVJ0?=
 =?utf-8?B?MkNuUy9CYUVFVkRBSmc0QWswLysxMXo1MlVoRDRYeHFaeW1qSDBicHFlVGY0?=
 =?utf-8?B?NEFBZW50WUQ3VHZ5ZWNkNjNPMXNRcG5mcUM4YW5CWlRUMnFWMU1FTld2Rml2?=
 =?utf-8?B?QnQxVnpUdGc3ajFJcjFKS3lwdE01V0ozdDhLSWJUckIzL3JZWjYwNnBSZUVp?=
 =?utf-8?B?MG9EelJkSmFVU0FtdlR3Ly92QlV6dzlJdVphaFlTdmwya3RHa2VqYmZiU0lx?=
 =?utf-8?B?Z0EzV0gwNzRSa3RnZlhTQ2kvZVltRUxTS3VPazlQQXdOQXRLRjl4a2MxZm1s?=
 =?utf-8?B?Mk8vemcweDR0TnA4UU93L1hnZHhraHJhU20rMVRvL2RBNEMxUnk4Tm9OYU5N?=
 =?utf-8?B?Wkk1ZjFvdy81bWNKL3g5anhzblJYNEs4d2kvYzA2b2xISCtGbUJsS1I4emxp?=
 =?utf-8?B?NnRGZzlBSFVsSUw4RjBTa2lhWERSdVhKcm84MTFsQUI0dWkyK3RPQ3M3TnlQ?=
 =?utf-8?B?dFZjb3FaeFFteHUrWVF2aTZNbHNlMVdEdFE4bks1Tnp5N2xxbXdDU3Y5TG1k?=
 =?utf-8?B?elVHSTlUZzFZNTBsVDRSU2o5OFErSHN2NnNSYnRiSk8yTUhYRXVOeStTaWxR?=
 =?utf-8?B?WU1rZGRnbXRzNlhxYzlNQ2ErSG45a3dUNE1nd3cyaDhZYXAvWERvWkFzb0NY?=
 =?utf-8?B?UG8wRGMzaDlORXJyZGthNWhTT0sxVy9vMmFVU005MzFzV01ka2QvakoxSEdB?=
 =?utf-8?B?cDdqcmhqSEhWaTRuYzE0S1JhZEVuMWRNWkFRUnE1eU1tUTdpNE04Ui9mRDU1?=
 =?utf-8?B?OUZBakFpQVQ0SkxueWg4VGFYS0FmSWNCSmJqd2tEZjdLNU9LOWNwVFJNaGNJ?=
 =?utf-8?B?d3lYQmN6ZTFqNUlBTDBneS8vendQcC83cERlZkViR0lMVmxCUW9KMlR4Rkdx?=
 =?utf-8?B?VGY0WHJxZHNJRTEyL1pNMHd1dTNDamp0ci9UYld6SThVZEpuVko5OEVsa2Nm?=
 =?utf-8?B?eC9oYnl4bEMzTEFZOGZiNlptRUhBMTljcW1oRE9iNUYrTnVaZkFsdDNDTE0v?=
 =?utf-8?B?cFAzY3piV0cvZGlDRWVTTW5qSWpETkxKOVhDeXRDbldrK1NVSEllUjRiSXd6?=
 =?utf-8?Q?M4Ya+sfGNo7JYNn9lK3sOAM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAE6F2F9724C5B41AC383E3DA4F99AC6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b7de65-89f6-4d05-804a-08dde3394701
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 18:08:49.9778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lVoE9QWq0QWgPtce2apzbCz4NKWho5w5esXa16ozWhgo42YLeb72aypbJoJ/eMBk65Xj8mF+oA0GehG/ItWNAdRk5ZlNgj5jqnrEsBzMgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8094

SGVsbG8gT2xla3NhbmRyLA0KDQpPbiAyMy4wOC4yNSAxNToyOSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6DQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gb2xla3N0eXNoQGdt
YWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5t
cy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gT24gMDcuMDguMjUgMTU6
MzMsIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6DQo+IA0KPiBIZWxsbyBMZW9uaWQNCj4gDQo+
IA0KPj4gSW50cm9kdWNlZCB0d28gbmV3IGhlbHBlciBmdW5jdGlvbnMgZm9yIHZHSUM6IHZnaWNf
aXNfdmFsaWRfaXJxIGFuZA0KPj4gdmdpY19pc19zaGFyZWRfaXJxLiBUaGUgZnVuY3Rpb25zIGFy
ZSBzaW1pbGFyIHRvIHRoZSBuZXdseSBpbnRyb2R1Y2VkDQo+PiBnaWNfaXNfdmFsaWRfaXJxIGFu
ZCBnaWNfaXNfc2hhcmVkX2lycSwgYnV0IHRoZXkgdmVyaWZ5IHdoZXRoZXIgYSB2SVJRDQo+PiBp
cyBhdmFpbGFibGUgZm9yIGEgc3BlY2lmaWMgZG9tYWluLCB3aGlsZSBHSUMtc3BlY2lmaWMgZnVu
Y3Rpb25zDQo+PiB2YWxpZGF0ZSBJTlRJRHMgZm9yIHRoZSByZWFsIEdJQyBoYXJkd2FyZS4gRm9y
IGV4YW1wbGUsIHRoZSBHSUMgbWF5DQo+PiBzdXBwb3J0IGFsbCA5OTIgU1BJIGxpbmVzLCBidXQg
dGhlIGRvbWFpbiBtYXkgdXNlIG9ubHkgc29tZSBwYXJ0IG9mIHRoZW0NCj4+IChlLmcuLCA2NDAp
LCBkZXBlbmRpbmcgb24gdGhlIGhpZ2hlc3QgSVJRIG51bWJlciBkZWZpbmVkIGluIHRoZSBkb21h
aW4NCj4+IGNvbmZpZ3VyYXRpb24uIFRoZXJlZm9yZSwgZm9yIHZHSUMtcmVsYXRlZCBjb2RlIGFu
ZCBjaGVja3MsIHRoZQ0KPj4gYXBwcm9wcmlhdGUgZnVuY3Rpb25zIHNob3VsZCBiZSB1c2VkLiBB
bHNvLCB1cGRhdGVkIHRoZSBhcHByb3ByaWF0ZQ0KPj4gY2hlY2tzIHRvIHVzZSB0aGVzZSBuZXcg
aGVscGVyIGZ1bmN0aW9ucy4NCj4+DQo+PiBUaGUgcHVycG9zZSBvZiBpbnRyb2R1Y2luZyBuZXcg
aGVscGVyIGZ1bmN0aW9ucyBmb3IgdkdJQyBpcyBlc3NlbnRpYWxseQ0KPj4gdGhlIHNhbWUgYXMg
Zm9yIEdJQzogdG8gYXZvaWQgcG90ZW50aWFsIGNvbmZ1c2lvbiB3aXRoIEdJQy1yZWxhdGVkDQo+
PiBjaGVja3MgYW5kIHRvIGNvbnNvbGlkYXRlIHNpbWlsYXIgY29kZSBpbnRvIHNlcGFyYXRlIGZ1
bmN0aW9ucywgd2hpY2gNCj4+IGNhbiBiZSBtb3JlIGVhc2lseSBleHRlbmRlZCBieSBhZGRpdGlv
bmFsIGNvbmRpdGlvbnMsIGUuZy4sIHdoZW4NCj4+IGltcGxlbWVudGluZyBleHRlbmRlZCBTUEkg
aW50ZXJydXB0cy4NCj4+DQo+PiBPbmx5IHRoZSB2YWxpZGF0aW9uIGNoYW5nZSBpbiB2Z2ljX2lu
amVjdF9pcnEgbWF5IGFmZmVjdCBleGlzdGluZw0KPj4gZnVuY3Rpb25hbGl0eSwgYXMgaXQgY3Vy
cmVudGx5IGNoZWNrcyB3aGV0aGVyIHRoZSB2SVJRIGlzIGxlc3MgdGhhbiBvcg0KPj4gZXF1YWwg
dG8gdmdpY19udW1faXJxcy4gU2luY2UgSVJRIGluZGV4ZXMgc3RhcnQgZnJvbSAwICh3aGVyZSAz
MiBpcyB0aGUNCj4+IGZpcnN0IFNQSSksIHRoZSBjaGVjayBzaG91bGQgYmVoYXZlIGNvbnNpc3Rl
bnRseSB3aXRoIHNpbWlsYXIgbG9naWMgaW4NCj4+IG90aGVyIHBsYWNlcyBhbmQgc2hvdWxkIGNo
ZWNrIGlmIHRoZSB2SVJRIG51bWJlciBpcyBsZXNzIHRoYW4NCj4+IHZnaWNfbnVtX2lycXMuIFRo
ZSByZW1haW5pbmcgY2hhbmdlcywgd2hpY2ggcmVwbGFjZSBvcGVuLWNvZGVkIGNoZWNrcw0KPj4g
d2l0aCB0aGUgdXNlIG9mIHRoZXNlIG5ldyBoZWxwZXIgZnVuY3Rpb25zLCBkbyBub3QgaW50cm9k
dWNlIGFueQ0KPj4gZnVuY3Rpb25hbCBjaGFuZ2VzLCBhcyB0aGUgaGVscGVyIGZ1bmN0aW9ucyBm
b2xsb3cgdGhlIGN1cnJlbnQgdklSUQ0KPj4gaW5kZXggdmVyaWZpY2F0aW9uIGxvZ2ljLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IExlb25pZCBLb21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNr
eWlAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBpbnRyb2R1
Y2VkIHRoaXMgcGF0Y2gNCj4+IC0tLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL2dpYy5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKy0tDQo+PiDCoCB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vdmdpYy5oIHzCoCA3ICsrKysrKysNCj4+IMKgIHhlbi9hcmNoL2FybS9pcnEuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0NCj4+IMKgIHhlbi9hcmNoL2FybS92Z2ljLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrKysrKy0tDQo+PiDCoCA0IGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNoL2FybS9naWMuYw0KPj4gaW5kZXggZWIw
MzQ2YTg5OC4uNDdmY2NmMjFkOCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMuYw0K
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+PiBAQCAtMTMzLDggKzEzMyw3IEBAIGludCBn
aWNfcm91dGVfaXJxX3RvX2d1ZXN0KHN0cnVjdCBkb21haW4gKmQsIA0KPj4gdW5zaWduZWQgaW50
IHZpcnEsDQo+Pg0KPj4gwqDCoMKgwqDCoCBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmRlc2MtPmxv
Y2spKTsNCj4+IMKgwqDCoMKgwqAgLyogQ2FsbGVyIGhhcyBhbHJlYWR5IGNoZWNrZWQgdGhhdCB0
aGUgSVJRIGlzIGFuIFNQSSAqLw0KPj4gLcKgwqDCoCBBU1NFUlQodmlycSA+PSAzMik7DQo+PiAt
wqDCoMKgIEFTU0VSVCh2aXJxIDwgdmdpY19udW1faXJxcyhkKSk7DQo+PiArwqDCoMKgIEFTU0VS
VCh2Z2ljX2lzX3NoYXJlZF9pcnEoZCwgdmlycSkpOw0KPj4gwqDCoMKgwqDCoCBBU1NFUlQoIWlz
X2xwaSh2aXJxKSk7DQo+Pg0KPj4gwqDCoMKgwqDCoCByZXQgPSB2Z2ljX2Nvbm5lY3RfaHdfaXJx
KGQsIE5VTEwsIHZpcnEsIGRlc2MsIHRydWUpOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS92Z2ljLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS8gDQo+PiBhc20vdmdp
Yy5oDQo+PiBpbmRleCAzNWMwYzZhOGIwLi40NTIwMWY0Y2E1IDEwMDY0NA0KPj4gLS0tIGEveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL3ZnaWMuaA0KPj4gQEAgLTMzNSw2ICszMzUsMTMgQEAgZXh0ZXJuIHZvaWQgDQo+PiB2
Z2ljX2NoZWNrX2luZmxpZ2h0X2lycXNfcGVuZGluZyhzdHJ1Y3QgdmNwdSAqdiwNCj4+IMKgIC8q
IERlZmF1bHQgbnVtYmVyIG9mIHZHSUMgU1BJcy4gMzIgYXJlIHN1YnN0cmFjdGVkIHRvIGNvdmVy
IGxvY2FsIA0KPj4gSVJRcy4gKi8NCj4+IMKgICNkZWZpbmUgVkdJQ19ERUZfTlJfU1BJUyAobWlu
KGdpY19udW1iZXJfbGluZXMoKSwgVkdJQ19NQVhfSVJRUykgLSAzMikNCj4+DQo+PiArZXh0ZXJu
IGJvb2wgdmdpY19pc192YWxpZF9pcnEoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZp
cnEpOw0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2Z2ljX2lzX3NoYXJlZF9pcnEoc3Ry
dWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IA0KPj4gdmlycSkNCj4+ICt7DQo+PiArwqDCoMKg
IHJldHVybiAodmlycSA+PSBOUl9MT0NBTF9JUlFTICYmIHZnaWNfaXNfdmFsaWRfaXJxKGQsIHZp
cnEpKTsNCj4+ICt9DQo+PiArDQo+PiDCoCAvKg0KPj4gwqDCoCAqIEFsbG9jYXRlIGEgZ3Vlc3Qg
VklSUQ0KPj4gwqDCoCAqwqAgLSBzcGkgPT0gMCA9PiBhbGxvY2F0ZSBhIFBQSS4gSXQgd2lsbCBi
ZSB0aGUgc2FtZSBvbiBldmVyeSB2Q1BVDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2ly
cS5jIGIveGVuL2FyY2gvYXJtL2lycS5jDQo+PiBpbmRleCAxMmM3MGQwMmNjLi41MGU1N2FhZWE3
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2lycS5jDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vaXJxLmMNCj4+IEBAIC00NDIsNyArNDQyLDcgQEAgaW50IHJvdXRlX2lycV90b19ndWVzdChz
dHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCANCj4+IGludCB2aXJxLA0KPj4gwqDCoMKgwqDCoCB1
bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4gwqDCoMKgwqDCoCBpbnQgcmV0dmFsID0gMDsNCj4+DQo+
PiAtwqDCoMKgIGlmICggdmlycSA+PSB2Z2ljX251bV9pcnFzKGQpICkNCj4+ICvCoMKgwqAgaWYg
KCAhdmdpY19pc192YWxpZF9pcnEoZCwgdmlycSkgKQ0KPiANCj4gDQo+IFRoaXMgZmlsZSBpcyBj
b21tb24gZm9yIGFsbCBWR0lDIGltcGxlbWVudGF0aW9ucywgc28NCj4gcm91dGVfaXJxX3RvX2d1
ZXN0KCkgaXMgdXNlZCB3aXRoIENPTkZJR19ORVdfVkdJQz15IGFzIHdlbGwuDQo+IA0KPiBJZiB5
b3VyIHNlcmllcyBpcyBidWlsdCB3aXRoIENPTkZJR19ORVdfVkdJQz15IChJIGtub3csIHRoYXQg
TkVXX1ZHSUMNCj4gZG9lcyBub3Qgc3VwcG9ydCBHSUNWMyBIVykgSSBoYXZlIGdvdCB0aGUgZm9s
bG93aW5nIGVycm9yOg0KPiANCj4gDQo+IGFhcmNoNjQtcG9reS1saW51eC1sZDogcHJlbGluay5v
OiBpbiBmdW5jdGlvbiBgcm91dGVfaXJxX3RvX2d1ZXN0JzoNCj4gL3Vzci9zcmMvZGVidWcveGVu
LzQuMTguMCtnaXRBVVRPSU5DK2NlNThmNTYxMDgtcjAvZ2l0L3hlbi9hcmNoL2FybS8gDQo+IGly
cS5jOjQ0NToNCj4gdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgdmdpY19pc192YWxpZF9pcnEnDQo+
IC91c3Ivc3JjL2RlYnVnL3hlbi80LjE4LjArZ2l0QVVUT0lOQytjZTU4ZjU2MTA4LXIwL2dpdC94
ZW4vYXJjaC9hcm0vIA0KPiBpcnEuYzo0NDU6KC50ZXh0KzB4NWUyZjgpOg0KPiByZWxvY2F0aW9u
IHRydW5jYXRlZCB0byBmaXQ6IFJfQUFSQ0g2NF9DQUxMMjYgYWdhaW5zdCB1bmRlZmluZWQgc3lt
Ym9sDQo+IGB2Z2ljX2lzX3ZhbGlkX2lycScNCj4gLi4uDQo+IA0KPiAgRnJvbSB0aGUgcXVpY2sg
bG9vaywgdmdpY19pc192YWxpZF9pcnEoKSBuZWVkcyBhIHN0dWIgKG9yIE5FV19WR0lDJ3MNCj4g
Y291bnRlcnBhcnQpLg0KPiANCj4gW3NuaXBdDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcg
YW5kIGZvciB0ZXN0aW5nIHRoZSBwYXRjaCBzZXJpZXMgd2l0aCANCmRpZmZlcmVudCBjb25maWcg
b3B0aW9ucy4gSSB3aWxsIGFkZCB0aGUgdmdpY19pc192YWxpZF9pcnEgY291bnRlcnBhcnQgDQoo
YWZ0ZXIgZGlzY3Vzc2lvbiwgd2UgZGVjaWRlZCB0byByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIA0K
dmdpY19pc192YWxpZF9saW5lKSBmb3IgTkVXX1ZHSUMgYW5kIHJlY2hlY2sgdGhlIGJ1aWxkIHdp
dGggTkVXX1ZHSUMgY29uZmlnLg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQuDQo=

