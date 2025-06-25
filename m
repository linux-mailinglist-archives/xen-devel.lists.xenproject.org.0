Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA4AE7F3D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024668.1400500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNN3-0006Ce-Jk; Wed, 25 Jun 2025 10:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024668.1400500; Wed, 25 Jun 2025 10:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNN3-0006Bq-Ge; Wed, 25 Jun 2025 10:28:49 +0000
Received: by outflank-mailman (input) for mailman id 1024668;
 Wed, 25 Jun 2025 10:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HOm6=ZI=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1uUNN1-0006Be-64
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:28:47 +0000
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c405::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f151f9-51af-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 12:28:43 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by OSCPR01MB14757.jpnprd01.prod.outlook.com (2603:1096:604:3ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 10:28:35 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:28:35 +0000
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
X-Inumbo-ID: 29f151f9-51af-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adI/X/gz2iA/JT2pk+3Mc22d4ruxNRrMVsgdppFy3hSfScMjIx8w7HuIK3WtJqJRQxFo8YOXPfBBQy74mIQxbnyG+uzm8h8xCsmw591+lF5HfnsOVyxdutFxDG7i/3GlWEcXLjGgHx1882irWBzLC01G0bUwE7zdOo8Bav5Mf0oNjpSrMrEt85adbAyLK+dCJJ/3wySc00YYFYYWvxEsZXS3U1nd+IzfSBEUOH+4YDW8vZxgyDilEilzWWuKgbLvoYOAvBZdUkh93Per8f+X5tvTtiOtm+GsLNmSLYMpbgB99wmTTfZwHBp4e6l2p9fbMcSFihlk+yH2W49XyeDY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKzWTVWrGb0bC9gAvNTpISKhhAEiaXgjCxN0G+Rap/0=;
 b=kaN6sRb34FyPqpGqIGT5I+WX9yvm6cgvSC/qwuC0BB0d3HLUeXDrek+/PITyESMkxEVxSxKnjEFbxO1wjIuNz/n5kpU76xyeWLtBK5K0hYqbs8aERHtcbYWzSUkXqn+UV0AVgOptLUknWUEOXsHEVAbQCgzCBuxjhVhCucJ0YCfzTDPorEW2fdCYjHOyAGrAf/LwroJKc0Zn47MelW2aZFQ3nFC4VG0NsblL0DsYjdXsZzwLhxUOAQdiCrbLXXdNhCkNnkogjFah4MA6HXL6LKgyV2/w5wmrV0wKaljXH9G5eSvy/IR7jhdW+O+7z9KLgb3LA4l6goqtO1nyu7238g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKzWTVWrGb0bC9gAvNTpISKhhAEiaXgjCxN0G+Rap/0=;
 b=I8KEpVD/Y9ZmWjHBGiwZ7rHAuvVoy/+LrPjVU/Jd2G0KvoxXlsLBmx6sTpOxPnoSEhKy7m54PT8kLe3JmWRSnFoAv6giqV2JgOeZwPHjTSRhg9T5VOPKP8r3+cAIrPttlmD82A36A0bNl7UfJnmuyWw3iZLzribyHK/j3XZAolU=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Thread-Topic: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Thread-Index: AQHb4c6ALl3IHvqkBEOgbLXzyjOhU7QQXHcAgANRIGA=
Date: Wed, 25 Jun 2025 10:28:35 +0000
Message-ID:
 <OSOPR01MB12408AB9E8CD52B45381E83FFAB7BA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
 <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
In-Reply-To: <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|OSCPR01MB14757:EE_
x-ms-office365-filtering-correlation-id: ad3b8a7e-930d-4047-b962-08ddb3d30a8f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZjZGWVFjNlozNHByVFNNODZtUno0MGlwQ1RKeE93U2pTSUxWVzdLS1lFb2li?=
 =?utf-8?B?LzFrQ1ZITTR6UUV6bEpIU0FSY1RTY29ITUhkZHFyQmYzWW16RTYwSjJWSHU2?=
 =?utf-8?B?VFhRZ2lySVo3N3BZM1F2ckY4Y0p0Q3FUNFl6WElkV0RaRFRkVDZsTTZ6WWxQ?=
 =?utf-8?B?V1NmdEpibXNQckVtTXJtTkxQVHdjM0R6c05aUFlUOFlxbVVZckViMjRpakFw?=
 =?utf-8?B?Q3BMYitEOUx0VWU4M3Z1RUVwbmFZenoyUHVzTHpCbjN4UjZHYzFPSkpCWWl4?=
 =?utf-8?B?cENmelRJQkQ4YzRTZGJtNSt1UUxyeUdhN1VGcHBGdkVTdFlSbFZjMFkzVjNp?=
 =?utf-8?B?RXUrV011am45eUwxekkxNlYxdUlVSnBWTHFhT2hXNVhyUkhEUWRwbXBIdXh0?=
 =?utf-8?B?eGZVeEtvOVdkT0dhL0QxYUtMbU5vVFo5VnlvUkhqWlNZYlVJSnNpQWxLcmto?=
 =?utf-8?B?Ym1RcXM3ckxoS0lXTkhCQU9PeVo2OWl5UFBwVVBCTmFXRmIvNE85akdqbTFH?=
 =?utf-8?B?UW1MRDBValVzMTRsV1J4RDRVR0dXcytTUThxUHlqbXMrVi9BeGVjWEtqWlhp?=
 =?utf-8?B?Qkg5NHc1WVNZaXNQaGkrdTJzcmFIbkg5ZGtHS2loVkkwNjNzR0FIbVhBYUI3?=
 =?utf-8?B?cW9ma21lbCsxVEZKY2FMS0hxQ0hFY2liMjdQL1owdGFjak1qRFBLQjJvbWlp?=
 =?utf-8?B?bENRWnRTVnNINS9yQUhBbW95OGJGZG5SYmNOQStIVkU5RUNsRExsZlJyNEo5?=
 =?utf-8?B?LzFVajNXeU5zQlNqYWowM2ZkUHpVWVFkTnd4QkZNSEY5TFIxVnB0d1FsLzZq?=
 =?utf-8?B?RTlyTkNyS2l2elg5SElBWCtORXptZkpJcmwxUzJJRGdSaTd3V3haaG8vWHZH?=
 =?utf-8?B?S2g0dkdTY05FNDdlWHBTaEU4a1poMDRQeFBlMUxHdXZGL3hLZlZkcEtmRFh4?=
 =?utf-8?B?ZFoxSE4zdkZsekRPSjhqbFVBMkszaXMyVnlFOHF5YWVFaWJLWTFnL0RDZnpt?=
 =?utf-8?B?TWdpUFhPdFhDNGx5cWxxcWREVzROTlNaZHpmNGQ1T3RhaHlCYUxzOUVSMnlo?=
 =?utf-8?B?M3FCY0Z0ZWJ3R3Qrci9hMzF0MldqOEVlcmYyaDNsSUtkYmswK1d2RnAyVFVO?=
 =?utf-8?B?Nk9zT2dnaFlqT1FZTnhJSlZDMyszMHpWN2RQdU45SUYwYm52VTBpMUtqWlhO?=
 =?utf-8?B?dUJhVmQ1MEtuNUJvZzJIME55R0d0N0tyeXUzMllXMHBwVndIM0g1U3NNYnpr?=
 =?utf-8?B?dkpWM2g0UmVUcFY3Q0JNY29lSjhVUHlWT3QydWVKcUs0d3N2WkJWd1VWM3FM?=
 =?utf-8?B?eHlGN1VTSFo0VU8vRXdxR21aaTVBa1REOThxZlVMRmpXREwzcHF0ZEtIOURB?=
 =?utf-8?B?VElqUmt4dTMyYVJSeUZNVmRLWm4wMHdZNDY4QTdpWHBIQUptKzFNcHdocmNp?=
 =?utf-8?B?cHdaeU0zRmd5NE9SdCt0RkphQlZCYTlhN0dEUWNOK2czRjVxa3Z3clFhZlY0?=
 =?utf-8?B?a0FTY0ZaMXUyYWloU2FoT2oyR05lUUdabVpHZmc1QU5PeXA0VElIaEUxK25P?=
 =?utf-8?B?Mm82YnF1c2xkR3BnN3REZ2toejFoVTB1WXREbFlCc0pMNC9kbFI2bVEwek41?=
 =?utf-8?B?ZVFzRGhSZnZuMEVWUE50S3pwZVVkdFRIdVNpekpTekp5UEhYVUFZKzhJODhn?=
 =?utf-8?B?NmI3bURMKzU2RzBjZE5lWU95bWdYQ2J1bXpyak9WWFJlLy9heUUzNHY1WlZ5?=
 =?utf-8?B?WHpGaFZKdXg5dlFxOGdyamJDQXM0SUROb0drUG0vNFAvL0dpTVE2RnhKUDU5?=
 =?utf-8?B?bFMvNXNlbDVFRk5Da1RBcFRISm9TVnlST0lmVDFOMWwvb3Nld0d5QVczOUF5?=
 =?utf-8?B?VERTVlNqTlFlOWRvdWRrVllGa1QwMVhEUzdOY0hIN0NnQkVNWTBoelJCN1pE?=
 =?utf-8?B?TGJmV1J0ekc5dXB5QXNvMHM3R1BmeG1XdGx6WkQ5SlNBR09nU1lhTU9YODVN?=
 =?utf-8?Q?mVC8S4r9nQllwNpPZuXL3u7X9EUrro=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXUwcVJoVGt2aVA5WVY4QzJGeVhUczk4RDdRMmtqK0F0VEZ5OHhwNmtiOFp0?=
 =?utf-8?B?WXJKaWFNRFZiMFR6NG9JUUtoWjFlRlNXUW5jYVIrVXlyRy84MGZuOW9hazBm?=
 =?utf-8?B?NjUzWjZJTjNLbmFIZzdaM3FCUG5MMmhNQm9RR2Z6d2FnTU5ENXlrOXhaU1pE?=
 =?utf-8?B?N25YdDFZZ0Nva2ZtUjVjMkI5Y0VJYjI4TWsra0U1bW1TNk5WaVdMQTJpbEI3?=
 =?utf-8?B?MWRuaStJQnNLWDJmUE5Hd0ZkMGNCN0xJS0JqQ1NSc293c2l6ZFNXemtQRFF0?=
 =?utf-8?B?eXhjM1IxclpzempJRkREQWlwVGhsWE1oaEhKZjg5NDdJaFdubVNWSDZscjRH?=
 =?utf-8?B?UGRPWGFma2xuelkrYjJkTCs2bFBpRmU2c1AyUFpMQ2t1aXdmczhPNzNRQmto?=
 =?utf-8?B?VjJRbisvREcrUU9penhpU3Q0cExCUmdPN252eDcydkVQVzAzMFVwVjMzNUZM?=
 =?utf-8?B?LzAxenluVUM2T1UzMnFqbTF5Z2NtTjFySU9wT1UvWFNDaWtMK0F5Vk1ITlQ4?=
 =?utf-8?B?UzlTQWdrT3VURi9sNmVmMXVBUkUzdHF1cisrSkNTZzFOWU9tWUY2K3ROMzVJ?=
 =?utf-8?B?K3pxcW5ZVjJsT1hkWlhJSWF5Sk02NzBIQmxhc3dnWkp5N2l1ZFZITVVTZWxB?=
 =?utf-8?B?MlRZL2dSTnZZakRWZFpFNjk1SW1ROHIrN00zbmN6dnBuaGNFZXJFY0VNUDh0?=
 =?utf-8?B?WFd3Q1RYNm1NVzlKWSt2MXliaUI2YWdZU0IwbXMwTnpwQ0RwdGFUOVVsaHBR?=
 =?utf-8?B?V0IxNEx2ZzFQZ3NNdXVJUDBnSFNFanRaWXpoY3prNndTNHBGQWlnd1p1QkxM?=
 =?utf-8?B?blI3cTZUK1NaMldNNGRjUmVQZHhzVDN5cm9UZ2NGQXlGMS9ZVlYxbGpObDFz?=
 =?utf-8?B?a2djektPU1o0b1pvV3JzWUdsQlN1dUpMeEZUWHVESC9yMDFWUlRqeC9xSEph?=
 =?utf-8?B?US9vbHQ5Y3FiZWVzWnBlTVYranYxYXovUWRmL3kraUJ0THU1dTFOU2QvL3Fr?=
 =?utf-8?B?ZENBSC9uSStDZjZOVE1HdkltY1N3bjNuMktEMU9YOVVkaC9zSFRhYzFLU0tw?=
 =?utf-8?B?Mm9oZDZwd21qUm1pNDJWVGd6MVFnUXBSelBDeEtVZ3M0YVdDaVZ3WmV0WVRu?=
 =?utf-8?B?eVVHOUF4QzlhWGYxMndqSGt2MC9ObjZzTHJ3bWpGYTJ5aGNaRlhScUZMY0NU?=
 =?utf-8?B?UW1TSjVTUll4QmxJTDhGS3hYZnVwZ2hYZUY1Q2UwVC91NmlTQ1ZHWjFuRXky?=
 =?utf-8?B?dzRQckpyVEZGYUlLbUdVTXpjODdCbThsYjJwVFZ3NUtRY0NwZ2NySWtabzNZ?=
 =?utf-8?B?dHdYcFduSkI2VEtRK1RveHFOUjl2NUZpVTYwZGcxMFZaNFZHL3B3RTBGZXF6?=
 =?utf-8?B?U1pZWks1dVFaNEUvZmpoUDBmaTF2ajAzdW94OFNwL3hUYnI1SU1ibDUrWnc1?=
 =?utf-8?B?MUZBNHp1ZnpyZ0YwbUlyUm95aVhWYW8ySVVVNFl2YjBWQWgvbzMxMDRIVlEv?=
 =?utf-8?B?VXRoVUpIRS9oNmxrRzFVTTVBMlZsVTFFajFwNFdYNWlKeW5ZZFUyWnFNaXh1?=
 =?utf-8?B?MExkRWJzOXZOaHAva3BXSzJZZXY4N25yamtONHVsekJhNHRoQkdpTjBKTXpZ?=
 =?utf-8?B?RVJ5ZHlzelUzVlBsRjMvc2ZiUGZYaWxqY2oxRWVjL2dkc1UwRDhvWVJDY2Jm?=
 =?utf-8?B?NFhWZm1pcUVOT3QzbFFCdFBFVldxVnR1eFZXM1djT0Yzc3dyQlRQczRadVB1?=
 =?utf-8?B?Vm51SEdBRnVpb1B5eFhoeFVjMjhnQWFZMmNIN2NMdTlMU3JaNkdZK3hMZFdX?=
 =?utf-8?B?K3VSZjBzQVl6eUVVNXpYTHVxTldRK1pJUk1JaWNrVGxvcEx6bW5IKzNkL29P?=
 =?utf-8?B?U1JOaGs5K3EyQUVHaFJ1VUVNQmFJL3R2d2w4eUw4VU1nVkV1cU83TXpIRHgz?=
 =?utf-8?B?NDFmcllMMWI4aVBUL0JFazRKdXM0U2R6cHRQcDVnSjkvVVNrd1pNN0wwTUd4?=
 =?utf-8?B?bEFiM3ozNGRZcXZqQnlJMlhKa05GcW9ka1hhaXRNb0pOMG5BYjUrMi9YQlV6?=
 =?utf-8?B?eWpISjFJZU40QWE5em1UamRZdVpLaVF2UXJtRGNSaDVQUmh6eWd0VDg5ZWQ5?=
 =?utf-8?B?U2Q4K3JHZHVsMDRRUmFtQXRtZllOMTZMSkRWRVd6ZFFVSXBnQjc3SHNjT0ZF?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3b8a7e-930d-4047-b962-08ddb3d30a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:28:35.2520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57e7D9NLGAr3/P/SNj8vhuEo+qwbcAg1Bg4ryJ087CQjV3IeANuMQjv87JO/UzG8EV4Mjlww4CB2RnEokaT/KoeJwY4CdZCxp8dvYYQczVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14757

SGkgTWljaGFsLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGFuZCB0aGUgQWNrLg0KDQo+
PiArICAgIGRzYihzeSk7DQo+IEFueSBjbHVlIHdoeSBMaW51eCAobWFpbmxpbmUpIGRvZXMgbm90
IGRvIHRoYXQ/DQoNClRoZSBpbXBsZW1lbnRhdGlvbiB3cml0ZWwoKSB3aGljaCBjb250YWlucyBh
biBpbXBsaWNpdCBkc2Ioc3QpIHdoaWNoIGxpa2VseSBzdWZmaWNpZW50IGZvciBMaW51eCBmb3Ig
aXRzIFN0YWdlLTEgSU9NTVUgdXNhZ2Ugd2hlcmUgQ1BVIGFuZCBJT01NVSBpbnRlcmFjdGlvbnMg
YXJlIGNvaGVyZW50LiANCkhvd2V2ZXIsIFhlbiB1c2VzIHRoZSBJUE1NVSBhcyBhIFN0YWdlLTIg
SU9NTVUgZm9yIG5vbi1jb2hlcmVudCBETUEgb3BlcmF0aW9ucyAoc3VjaCBhcyBQQ0llIHBhc3N0
aHJvdWdoKSwgcmVxdWlyaW5nIHRoZSBzdHJvbmdlciBkc2Ioc3kpIHRvIGVuc3VyZSB3cml0ZXMg
ZnVsbHkgcHJvcGFnYXRlIHRvIHRoZSBJUE1NVSBoYXJkd2FyZSBiZWZvcmUgY29udGludWluZy4N
Cg0KUmVnYXJkcywNCkphaGFuIA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
T3J6ZWwsIE1pY2hhbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IA0KU2VudDogMjMgSnVuZSAyMDI1
IDEyOjU2DQpUbzogSmFoYW4gTXVydWRpIDxqYWhhbi5tdXJ1ZGkuemdAcmVuZXNhcy5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgQmVy
dHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNo
dWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0geGVu
L2FybTogRW5oYW5jZSBJUE1NVS1WTVNBIGRyaXZlciByb2J1c3RuZXNzIGFuZCBkZWJ1ZyBvdXRw
dXQNCg0KDQoNCk9uIDIwLzA2LzIwMjUgMTI6MzEsIEphaGFuIE11cnVkaSB3cm90ZToNCj4gLSBG
aXggdHlwbyBpbiBzb3VyY2UgY29tbWVudCAoInlvdSBjYW4gZm91bmQiIC0+ICJ3aGljaCBjYW4g
YmUgZm91bmQiKS4NCj4gLSBBZGQgZHNiKHN5KSBhZnRlciBJTUNUUiB3cml0ZSB0byBlbnN1cmUg
Zmx1c2ggaXMgY29tcGxldGUgYmVmb3JlIHBvbGxpbmcuDQo+IC0gQWRkIGRldl9pbmZvKCkgbG9n
IGluIGlwbW11X2RldmljZV9yZXNldCgpIHRvIGluZGljYXRlIHRoZSBudW1iZXIgb2YgZGlzYWJs
ZWQgY29udGV4dHMuDQo+IA0KPiBUaGVzZSBjaGFuZ2VzIGltcHJvdmUgbWVtb3J5IG9wZXJhdGlv
biBvcmRlcmluZywgY29kZSByZWFkYWJpbGl0eSwgYW5kIA0KPiBydW50aW1lIHRyYWNlYWJpbGl0
eSBmb3IgSVBNTVUgb24gUi1DYXIgR2VuMy9HZW40IFNvQ3MNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphaGFuIE11cnVkaSA8amFoYW4ubXVydWRpLnpnQHJlbmVzYXMuY29tPg0KQWNrZWQtYnk6IE1p
Y2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQoNCj4gLS0tDQo+ICB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jIHwgNiArKysrKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jIA0KPiBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMNCj4gaW5kZXggZDgyOGQ5Y2Y2YS4uZGFjMGRk
NmQ0NiAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZt
c2EuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jDQo+
IEBAIC0xMyw3ICsxMyw3IEBADQo+ICAgKg0KPiAgICogQmFzZWQgb24gTGludXgncyBJUE1NVS1W
TVNBIGRyaXZlciBmcm9tIFJlbmVzYXMgQlNQOg0KPiAgICogICAgZHJpdmVycy9pb21tdS9pcG1t
dS12bXNhLmMNCj4gLSAqIHlvdSBjYW4gZm91bmQgYXQ6DQo+ICsgKiB3aGljaCBjYW4gYmUgZm91
bmQgYXQ6DQo+ICAgKiAgICB1cmw6IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9ob3Jtcy9yZW5lc2FzLWJzcC5naXQNCj4gICAqICAgIGJyYW5jaDogdjQuMTQu
NzUtbHRzaS9yY2FyLTMuOS42DQo+ICAgKiAgICBjb21taXQ6IGUyMDZlYjViODFhNjBlNjRjMzVm
YmMzYTk5OWIxYTBkYjJiOTgwNDQNCj4gQEAgLTQzMyw2ICs0MzMsOCBAQCBzdGF0aWMgdm9pZCBp
cG1tdV90bGJfaW52YWxpZGF0ZShzdHJ1Y3QgaXBtbXVfdm1zYV9kb21haW4gKmRvbWFpbikNCj4g
ICAgICBkYXRhIHw9IElNQ1RSX0ZMVVNIOw0KPiAgICAgIGlwbW11X2N0eF93cml0ZV9hbGwoZG9t
YWluLCBJTUNUUiwgZGF0YSk7DQo+ICANCj4gKyAgICAvKiBGb3JjZSBJTUNUUiB3cml0ZSB0byBj
b21wbGV0ZSBiZWZvcmUgcG9sbGluZyB0byBhdm9pZCBmYWxzZSBjb21wbGV0aW9uIGNoZWNrLiAq
Lw0KPiArICAgIGRzYihzeSk7DQpBbnkgY2x1ZSB3aHkgTGludXggKG1haW5saW5lKSBkb2VzIG5v
dCBkbyB0aGF0Pw0KDQp+TWljaGFsDQoNCg==

