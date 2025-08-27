Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BD8B37F74
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 12:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095844.1450713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urCx7-00064m-7N; Wed, 27 Aug 2025 10:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095844.1450713; Wed, 27 Aug 2025 10:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urCx7-00062U-4i; Wed, 27 Aug 2025 10:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1095844;
 Wed, 27 Aug 2025 10:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urCx6-00062O-4e
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 10:00:24 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a59166a7-832c-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 12:00:23 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB9343.eurprd03.prod.outlook.com (2603:10a6:20b:57e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 27 Aug
 2025 10:00:15 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 10:00:15 +0000
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
X-Inumbo-ID: a59166a7-832c-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAfpmfY3HAgyNPHWskW4x6FN8Bivtr6BqtOZRxnCnMxrOZLIRS96hKNFR59qgGMglOcCGVlLa8ggQk+aLDSHIU62jUnP7TJ9uk5pMUVguom/bpueDwaOk3rM1iDReogcecTbSCdbi8nJ5GCp/sLX/imDFBuUvMxAKUbruEU/FL+Hgqzr0LOIq88arqHj253AJEdvwo5NFJJ+NTjo/3634sk6McDwwaUCMT4h8a5OTTpTAgrbZxHWWncxtMPqY81nWzNHdjrI+c4pOBhi71Ab8R/jMNIQB9lAc+PiK6+w9C3MRwK0rZbR7Uc0MvArdb3T0ZYIS1i2FvnZDNPvcGRwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYXxoh3qHo5hDPEzIBoDr1aAOskWc1JrOTShlUitBDY=;
 b=oZ7ybbnwKluqChb1K3Jwy8iQY97ReoL/RIOZJnUJAKyH9ZCYirTjNqEgV6X4zPAsdLmyDZo07uZvO+xpFKXmd0yvpYldIjU8z+nVweD9cQ/FSyY/I6s5Dpdj/cqeuB4JjrChhmtV1Zysl1CEX/8fGcXH+EkfW3US/bX0bvqKwPMRE1Ex6DPBQ75hw4ziN5mJ17t5dtUqW/5V2iT3qVXh9IYStcsNvCm8pvL8Hx6ty3zsSu+bp2W8KNFHZ9FPbgny0yoP4Dj1X+GZk/jb+E6ElFZeh/GO6gTJjXs68Iz6UBrKE8xzC5rtwb+v6QGh0YtGTeUSCL71aX4JAjBNtRXShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYXxoh3qHo5hDPEzIBoDr1aAOskWc1JrOTShlUitBDY=;
 b=HZhw19j1nB7KxVkSfGbJ3/atcg1Yv0js0GUFv1GLMDGKFmV0q9VmT3rydqR4qMNwPqJi0UQppLFbqk1J4MvCa82vH9+/vTZukGK2CDEA3aPr41I0ChPaouii1aNTrrrEoN+zw5pTjrg4oUugavnbd0ESkd2pVgSJxsInfXD5izhLJmyrrBTWCGnr0PWS1DM3L/AOk0gKv/OusjwD4a+UXcK6CqlnUKkNWS9Fw9/NoGr8N1tL0gwUp7UFu53n/2RY2mfckYizfO1A/wVn2be+2ye3CaVSVWQaRUaJPmyz1EBAiptC67/y1ZOhzD4g0oTRikuWdb1Zf/2bnCbuzEjdLg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 06/11] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Topic: [PATCH v3 06/11] xen/arm/irq: allow eSPI processing in the
 do_IRQ function
Thread-Index: AQHcFpJ/78TDbVIRnkOE9iNbqduJVLR2RaCA
Date: Wed, 27 Aug 2025 10:00:15 +0000
Message-ID: <6ba907e2-924f-4f7a-bb05-54f1d00f3f1c@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <c977f6c0746d4461a804ba2e2ca80159190923ab.1756216943.git.leonid_komarianskyi@epam.com>
 <87ldn54sxh.fsf@epam.com>
In-Reply-To: <87ldn54sxh.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB9343:EE_
x-ms-office365-filtering-correlation-id: ed5dba6e-6f5f-4fd5-00f8-08dde5508589
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eGp2S1ZmR3dzQ3lmSmdCdTdZYitzVlVZVi9FbHVUNDU2NmxLajFFSi9oOFBv?=
 =?utf-8?B?NXliVzZIMUcwYVdkS1JVN0tYRHFEYzl4TUdCamZjZlVZaFJsMlNCNk5OQ2g2?=
 =?utf-8?B?Tmc4RjFNUVZ3Y3AwdkUzMU1udTJYZDZNL2pSNDNFNlZ2TjV4MjIwQjVWbDIw?=
 =?utf-8?B?OVd6dTFodWh5RHltRVI2ZXFheGdXLzN1ZXAvUGY1bGVwWkNoL2h4WFZLb1Bl?=
 =?utf-8?B?RysrYkduby8wMklmcUdXMlRFTmVIcVE2YW1NekFmQVRuQmgvSVloWWtNa2NN?=
 =?utf-8?B?WjBzRytjbTlLWGdjSlZxWjRMMmRRa1F2Rzk0QVB1U0RCWmdEaXVPSHJodExT?=
 =?utf-8?B?ZDRoMExHVUJkbFNNMXE5VC94bS9BSndwMWx1UXpEVExzNWlzbjJReWZaYXYz?=
 =?utf-8?B?UERuZmhxY29DZkxjTHdzMlhkWGRobnpUb0dvZGlGRWpNemdwUllVbGlkVU9B?=
 =?utf-8?B?TjNWanE1QW9lZmlKNFZUY3pxYTBRMTRiY3dmdXlqL2xkb1BTN0l2UVlXUUhB?=
 =?utf-8?B?MGE3RklNYkZic1BYYzJucDVlYnV6RTErcTRBNnE0VHhFanhaMi91QWJ2K29H?=
 =?utf-8?B?ZmZYM29vaFF3bWZvMC9xRHpYaHNrZjQxYjFhY3hNa2hCd3ArNTNycEJIQ3ky?=
 =?utf-8?B?cnJNYnB0bGxSZXg4ZjR2ZmwyRGJQYk53bGRvSTJKVmllbHdGWnh0VXp1Z3NG?=
 =?utf-8?B?RGpOQU03a2JJVTQ0bWgzcGg4blRQa1lXYUlBaDQwekZ5N3lCelNNYUVqL1dF?=
 =?utf-8?B?NHpxWkREejlrb3NHbzRNN1lSUmc1eGhMeENuNEJlMHp4Z2o0WEtSZ0J2Y1hw?=
 =?utf-8?B?VDh6SUxBaWY4QzZHeTl3NzY0bzlRZGEvV2NOeWtsK1I5aGphYjlKQ0NxeHkw?=
 =?utf-8?B?N2FCOXRSbHpJTkZwYm15c21zWTRZOEpPSmdmY29scU5UdlRlOFZYWks4NDRi?=
 =?utf-8?B?RUJ4MXN0TnFJQXdhUksrSnRZYXdQUHB4L3VkbWxzRm5PMFB3L1RCYnN6VUJP?=
 =?utf-8?B?NUlYQm5OQjBGNldGejNFc1pSNyswajlzUzAxT1BrMCsrTks1MFZCMWNaUXFw?=
 =?utf-8?B?d1dSNVFocElMSi9nNEppTHFoVE9oM3NPV0RjTDFlVWUreXVBa3RJVXN3U3Zv?=
 =?utf-8?B?TjBXaEJ6SmZXd1pLVGJhelBkNmREZ01KK1Z4YndwVFltdTA3dlg0M1NXUzFB?=
 =?utf-8?B?ZU1oV09tRzhramxCRHNvNnd3TUhSamdvV3lrZnFkRUh6bmNwTklFeVlKWlBj?=
 =?utf-8?B?Q0xwYXJac1FjYXNFa2R1OVc4MTV5c2FmdlM2TG1ORkxWaHp1djZkMUdkakJC?=
 =?utf-8?B?bFpPbGoyRUlBREI3RnlZM2IydEJ5eXp6Rm94QUUyV3NPZGhtN0FXbm5XTk9y?=
 =?utf-8?B?ZTFUSjlSSHpoOE1XZmNSZnI5Rm4zNkl1cVYwSW56UjZuMGdvcVQ4MDN1UTNm?=
 =?utf-8?B?UzVycWVnM1FKS2FKbG1HQVF1Y1k1VERiTGhxRHpBNWJ5R3VQMkY1bjZQZ250?=
 =?utf-8?B?d0ZoVkdjTGxzNkhEZFVPZEN5SkxnaEkwT0dvZHVUUHIzUk5GOVBpR0t0TXQ4?=
 =?utf-8?B?R25KTXpPdE91bnZlQmRKU0d4cjYxS0xIRkoxQkV5cmk5ZThheHNWN1pjTVUz?=
 =?utf-8?B?d2pBMTNLM2EyYnRNOWhxblBpdnFlNkZrUTFhQ1ozeVh4RXpYU203bG5RREVI?=
 =?utf-8?B?RGJQYTdrU1YrajZ0YkFKamp1ZjdMdlV4YlRFSVF4M2VPbTkrVmxoeFRPQXMw?=
 =?utf-8?B?WjZid2dFeC95elUvTk5ySFAwN25sZFRNU25PaUVhdVBkUjZ2U1p5MGpUbk1l?=
 =?utf-8?B?Y2pNTnlZdXp4bFRJdG83TzFYTDQ4NGNsLys1TzZpNDgzekJGNVdnTko3YXEz?=
 =?utf-8?B?MDhxUDJiUnFpUG5FaHFEV05kMkQrZSt2d2l3QjhNS0syUDZEd0phZEN6L0w3?=
 =?utf-8?B?OWFxQ1BzOEZHUE5HMG9hYjNwdG5WT1A1YktsNmpseGorUmVMKzh0b2JqdlBx?=
 =?utf-8?B?cXR0TCtvNjZBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2loem1tRG9IWXdOdStYR0c0eVY2amd1aW1PVEhCSGN0bUpmUHAwN1hGRWwz?=
 =?utf-8?B?c0UzaXY4SWdKRkJmemp4TXh1U1JpQnB5Q1JtcTNmQnZYL1M0NXJhYzk3cmIw?=
 =?utf-8?B?dXRwNlRZcXp4NkpteU8vUGhxeUIvRlBsNGY1NHNXbWtHclBUUVlGTXp6ek9G?=
 =?utf-8?B?Mlp1VTZHYUZIRVVjS2dvbjV4Q1NXenpwYjRORWpKWDFGMG56S3Yrazl6TFFi?=
 =?utf-8?B?OTVhRm9PSzFwazR5b00veWtqNWsvMGV2aTN6WUN0bSs2TnRscDFXbEY1WmIy?=
 =?utf-8?B?Q3Nrc081Z0hZMlRGWUx2RkhoaU94MmF5ekpndDFBanpYZTlmM2krVzNyTEh6?=
 =?utf-8?B?VGpBT3hYM2ZrV3FUTVRRSG8wRHdCcVNsWktNOXdHTkpzL2dGUjhEc28xeEZM?=
 =?utf-8?B?RTB2dWorczBWNlhYVEdBSzRjdFBTdSsxNzBNVVE0Ykp2YUhQS0NySEJBUXBk?=
 =?utf-8?B?VEJFSHZJV1ZoMHB5UzdpWWlSR2VmU0xweHdmb29OWXE1K29aUHhvNGs2VmVL?=
 =?utf-8?B?MU0xNk9IdG1NNkJROEsySXl4NnQ5QTJLZXA3Y3dEaTdRUSs4WjcyTEdxV1A0?=
 =?utf-8?B?eFR2TE5KT1FvazFNQXB1Sm1SYmtwWVZWdVNUNWszMlErRGFFZTZxQy9zTXVy?=
 =?utf-8?B?UHl2MjNUbVcwNm9xT09PWXg5VnFJQzdZK2RlQ1pqYzBYTStyQkNPZ1JvU0wy?=
 =?utf-8?B?TWxud2lSS2RsNy9wT2gwQzZXMnBLcXI0N1JJcU16bmFuMGcyOE81RHU1cTFz?=
 =?utf-8?B?YnB4ZXlvS1hCNWQwRCtPVHpLMjBvVmdXSEZZMkpNTWZ3a1JRSzN5L0liWnBT?=
 =?utf-8?B?dlErTzJIZGRuT2FQR1RQb2hFaFFaOHZTTGVJbG04OENVaXVFa2FyTkdWbGg1?=
 =?utf-8?B?SkkxKysrRDZMN09tU1M0eUZoeGpUWlJlUmZFRFlXK0RCZVNoM1lCS21yRkhh?=
 =?utf-8?B?bEhnS0dEZ0RmZDM2L0ZnUkdheXkvQUJXV2Q3dFhzVExvZndTdDYrZFh2OHdZ?=
 =?utf-8?B?eDNmSEIxMlh6RE1mY3UyNlNXcUxqSjNKMWFPZVJqL3lsd2tSYmxsMVdSNUJU?=
 =?utf-8?B?ejFSYmZ3bjVPSitkdVdkaGJPM05kakZBWHBnUDhicEN5RzVPVktPTlFYUnNu?=
 =?utf-8?B?ZkFYbXhRb2I5dUUveEx4RGhHSWdKT3VRUlM2WGhqSEUxRnZoRU52RGJHRkVr?=
 =?utf-8?B?ZmtwaXNRRmtRZHlGa2RvNFFWQnY2NmdjVnpJWWhpRDlRZnNuK3F2TnVNbXZ5?=
 =?utf-8?B?MjM5blpVVlNRVnlEMzZDcGdieWRDQVh6Z0dhL1pqcjd5TEhnbmI0SCsxYllR?=
 =?utf-8?B?blJoN2V6OVZqai9Qd1k0L3prRXpnSjdmdFZ3UGJsNlRBSVhjOSs5MjlGcVUy?=
 =?utf-8?B?a0lvQUVSTmY0b0crbmR0ZHE2cStUdTM1QitXOGtrNUFpb0NlYURRZi9wTlVv?=
 =?utf-8?B?YzM5Q00rbmdsOWIxOGxDNGRvWVQ1aUFJZHV4Yis5UWFSVHVOMUpqd1ZCMmNC?=
 =?utf-8?B?blN1YUt5SUVXUVNSV00zWVdDUU5uNDZSRWhUMVNEam84OHJrc05aWnVJVVAy?=
 =?utf-8?B?VUw2ZDFnWGc0UXJPNFBrYUxYV21tVzlETkJkNjd1RldJSC9Mbi9HQU1CZ2tE?=
 =?utf-8?B?WDNiSmFNYXg1VTRQRE9HaFB6cHVEODRWRHpsQmJ6QjF4bWdpWXloUGJqeDZU?=
 =?utf-8?B?NkZsbVByUHV5aDIxTXhYYXRxdHptZkVob2lBcFNTMXF2a3Y0QXpESzF5eEtL?=
 =?utf-8?B?SERxT0JEaENVVUdPclBVRzhwM0VUS3ROaW9hYW9jelloNCs3L1JWUjQ5TGRy?=
 =?utf-8?B?ekFlQys3REpDYlRFbkxhZks3bVAvRWVrZUs4SGRhVElZTVZYbjhGR09uMm1I?=
 =?utf-8?B?QjBTNWdhSXFnVkFvYXh4Ryt4TGtXYzBTMG02VFFiZnZ5dVhyUk0xTmk2cEND?=
 =?utf-8?B?TkJ2RmlNcHRxRkNSVnJvNXFYMUk3RHRONWg4M3QxNFZocU84Si9xVkVaNXdo?=
 =?utf-8?B?c0RRT2VYdld6NjRQS2JwbzBjRk5IY0o1TnpncVB2VGhYU2w4NzZlaGNrTVNZ?=
 =?utf-8?B?Rlg0Um1vWC8wbGZhTlRXUFNzc3dFQk1XdVFhdDRBd0dVNStaY0QrMFFWM3hG?=
 =?utf-8?B?OFVZY1RjTW9xdmRZeDNydnJnZkZUaXd6RFVQOGFieVllSnduenlNOXZrUk03?=
 =?utf-8?Q?+Y68qo26u2bZtVXdq1GaE50=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6572C50FE0CA8E46B327C98AEDD52E63@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5dba6e-6f5f-4fd5-00f8-08dde5508589
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 10:00:15.6559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4gm7jpB2wVRZIafPLHlBHszXfzt7wts2MBN1jMh/sB3SHdL+6iWhKRqXBF1Q3xpTWceuaPZRwnOW5ERFCjCPaejdc0LDvAuf1QAIM6g7ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9343

SGkgVm9sb2R5bXlyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAyNy4wOC4y
NSAwMTozMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IExlb25p
ZCBLb21hcmlhbnNreWkgPExlb25pZF9Lb21hcmlhbnNreWlAZXBhbS5jb20+IHdyaXRlczoNCj4g
DQo+PiBUaGUgZG9fSVJRKCkgZnVuY3Rpb24gaXMgdGhlIG1haW4gaGFuZGxlciBmb3IgcHJvY2Vz
c2luZyBJUlFzLg0KPiANCj4gYnV0IHlvdSBhcmUgbWFraW5nIGNoYW5nZSB0byBnaWNfaW50ZXJy
dXB0KCkgZnVuY3Rpb24uLi4gSSB0aGluayB5b3UNCj4gbmVlZCB0byB1cGRhdGUgdGhlIGNvbW1p
dCBtZXNzYWdlIGFuZCBzdWJqZWN0Lg0KPiANCj4+IEN1cnJlbnRseSwgZHVlIHRvIHJlc3RyaWN0
aXZlIGNoZWNrcywgaXQgZG9lcyBub3QgcHJvY2VzcyBpbnRlcnJ1cHQNCj4+IG51bWJlcnMgZ3Jl
YXRlciB0aGFuIDEwMjQuIFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgY29uZGl0aW9uIHRvIGFsbG93
DQo+IA0KPiBCdXQgY2hlY2sgcmVhZHMgImlycSA8IDEwMjAiLi4uDQo+IA0KPj4gdGhlIGhhbmRs
aW5nIG9mIGludGVycnVwdHMgZnJvbSB0aGUgZVNQSSByYW5nZS4NCj4+DQo+IA0KPiBXaXRoIGNv
bW1pdCBtZXNzYWdlIGZpeGVkOg0KPiANCj4gUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVr
IDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCj4gDQoNCk9oLCB5ZXMsIG15IG1pc3Rha2Vz
LiBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSBpbiBWNC4NCg0KPj4gU2lnbmVkLW9m
Zi1ieTogTGVvbmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlkX2tvbWFyaWFuc2t5aUBlcGFtLmNvbT4N
Cj4+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gVjI6DQo+PiAtIG5vIGNoYW5nZXMNCj4+DQo+PiBD
aGFuZ2VzIGluIFYzOg0KPj4gLSBubyBjaGFuZ2VzDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJt
L2dpYy5jIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2Fy
Y2gvYXJtL2dpYy5jDQo+PiBpbmRleCBiODgyMzdjY2RhLi42MzRiNzdjOTg3IDEwMDY0NA0KPj4g
LS0tIGEveGVuL2FyY2gvYXJtL2dpYy5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+
IEBAIC0zNDEsNyArMzQxLDcgQEAgdm9pZCBnaWNfaW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzLCBpbnQgaXNfZmlxKQ0KPj4gICAgICAgICAgIC8qIFJlYWRpbmcgSVJRIHdpbGwg
QUNLIGl0ICovDQo+PiAgICAgICAgICAgaXJxID0gZ2ljX2h3X29wcy0+cmVhZF9pcnEoKTsNCj4+
ICAgDQo+PiAtICAgICAgICBpZiAoIGxpa2VseShpcnEgPj0gR0lDX1NHSV9TVEFUSUNfTUFYICYm
IGlycSA8IDEwMjApICkNCj4+ICsgICAgICAgIGlmICggbGlrZWx5KGlycSA+PSBHSUNfU0dJX1NU
QVRJQ19NQVggJiYgaXJxIDwgMTAyMCkgfHwgaXNfZXNwaShpcnEpICkNCj4+ICAgICAgICAgICB7
DQo+PiAgICAgICAgICAgICAgIGlzYigpOw0KPj4gICAgICAgICAgICAgICBkb19JUlEocmVncywg
aXJxLCBpc19maXEpOw0KPiANCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlk

