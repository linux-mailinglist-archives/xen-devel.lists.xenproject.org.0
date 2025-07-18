Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0948B0A063
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048347.1418565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci4K-0002c0-TQ; Fri, 18 Jul 2025 10:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048347.1418565; Fri, 18 Jul 2025 10:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci4K-0002Zs-Q3; Fri, 18 Jul 2025 10:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1048347;
 Fri, 18 Jul 2025 10:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34x3=Z7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uci4I-0002Zf-Sm
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:11:54 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0c63570-63bf-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 12:11:53 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7670.eurprd03.prod.outlook.com (2603:10a6:20b:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:11:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 10:11:51 +0000
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
X-Inumbo-ID: a0c63570-63bf-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTFd4nFHT4+QwghwMfHfz4JTYze1N373pBdpS5HFaKC7RmRDNWqOw86NggrT0Z1A/g5CjouWQxNgI5olsI+760LeLsFosBZQuIQcXnlX2EBiPL/osFutddaVNnhZMfn3hZ5jAus998hqz86kiCKrLZQhpCojYHbPgy52RXOMV6ZZc7A4uJoQ4/otEuouTePMW1FKPEUtW1lmiavdt2oDsAgPpEIi0MgYSEpekMViHIa560cZIZzLMqrP/X56P2gMLPg5vrBVxABY0+wM1zL3nowNtTdbS9u1MePBlafK3/bAkU5dnL2b4KdsjOdWjWlt4ulTOlb+IjFdjXqUeYGEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZR3GjOYSbQoSjhXybpJurepJfrq5aaGUue1gC6VE3A=;
 b=kZMcsk4AKL//nLrNxoNmqdu84AI1sENewPUTMt6c1lml216MXsmsyiwFfq//qg/gVsLmbZjXs5UX2JZNSl5aaWsPxTV7ICtqbbvxXNS17Zf5PP+ysc3IyocqbqkeiT6oufVjdJjC96EO8Q+BP6mjgbIxWzGcAYhprwgSCizM0BqUF36NfPVJI1iGyi6j7ZU+pbVr92KhH1JgpUV/ayZCIfDNDS+Jx/chaCK+WFVmqRevIVgR2JoZ1WuZzio4Mnh5NwIPWJ7f2OYdvby0xG4zovGZk8MXoQcWyOH953HPRgYjSw+wF8Zu9C7I+tFGVamOg8Ba1AOCtRKkKZNO3BzcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZR3GjOYSbQoSjhXybpJurepJfrq5aaGUue1gC6VE3A=;
 b=p5JdzH9XbEd2QBgijBzPlH8fwg6T/WpylcouL+QaYGi2VuUL4mmejg3JafBmesUARWTmJvaIzY1D0TGEHAnYQdhcP57Cr5iAD1J1a4m8StduxFfHnx5wFkCJatQxYEVG8uBkSN4DAzR4nI6FwBFxfXedvv+bLKEbAwRoCFDtmuX5oh4lrM3eM34vLShgxuhwX4oh0BBlKdVxsVDYhnEBXrxBDD8FXFs2l+6uTNktnJyoAbPeZUUmjsjO1KCxZZtpOeE3fH3s+CZSn+7t1MoU5/EkSIVbpVFpuWByktIRqRxhdpzJ7nryjVDPOeMKH5E7HhjzF4gK4+/kPlXI24jXig==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar
 Halder <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 2/2] xen/arm: irq: drop unreachable pirq callbacks
Thread-Topic: [XEN][PATCH 2/2] xen/arm: irq: drop unreachable pirq callbacks
Thread-Index: AQHb98xgXqvD0MCD70OfPSTzdEycaw==
Date: Fri, 18 Jul 2025 10:11:50 +0000
Message-ID: <20250718101149.3107110-2-grygorii_strashko@epam.com>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
In-Reply-To: <20250718101149.3107110-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB7670:EE_
x-ms-office365-filtering-correlation-id: b809606f-7d64-4a75-ee5c-08ddc5e3838b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pTIbaUn2xINIRMnDoZXmuLRai6gyU/YKv1m7o5KFfl9gAtIBv1JzoYxI1Q?=
 =?iso-8859-1?Q?6b3bJiNmA6kcBRTFR48I4Hv5P4pIGN0ivQ4H5ffEP8XE+O3g70KF7p7PlI?=
 =?iso-8859-1?Q?YU5IqhoS1fsm0fhdeuoaz3Tzw7yqDQjHMwF1Ac9y5j+Zd79m0OayF+ieT7?=
 =?iso-8859-1?Q?XhR6oFcIwC9fPyDZBqTaZDAWRXAcklnjIYoRlgqLJ92abK/9hOWdJ/S5qt?=
 =?iso-8859-1?Q?Ba4KOjEvHkAzD7jKKOzACdAY2L7S7rScCkC8YGe6I8lQd2GCDQHGsOr6ut?=
 =?iso-8859-1?Q?mbZuZixqibUD9qJNqf2YGkDX1gnff5xMKXaQMe2eVg/m6KeHQwL5peAaCP?=
 =?iso-8859-1?Q?7PRqo5oUz0IOAaLpV6OIEWWGSAZOdoUZdZKhleAy61zEz65rObiWriTXlh?=
 =?iso-8859-1?Q?E0R7+gFLVAkdiGF5p4YQKCM515itHYYSXol0nupIarqfj1iv1rfKyy7Tft?=
 =?iso-8859-1?Q?4D9Ue8JFLDoh3qYr5zScihVU5GOt6MC5WVVMizS5brN839eQiWc+dIeiCt?=
 =?iso-8859-1?Q?7lXES/lGiij1UUeerr/gvhYtfZcKtmWfJGNhpwqiNDmxOceze1bFnBdkDf?=
 =?iso-8859-1?Q?1qzqUNrctI89qbuPgra1vg9QqVJQJIuUuy/QGUoiW7pxqGDex8VljTRRzY?=
 =?iso-8859-1?Q?he7cKkBq5qsAYLi3/WuGg4o8+eIF8nB+xBp5tFd9WYoJUH6Th34aPAVYW1?=
 =?iso-8859-1?Q?xl0O435eC+pIFNUpoB4SfbatqL58/1Io6BuUtsP6XQyWLFn9j9iao+miq+?=
 =?iso-8859-1?Q?NgAPjsw5CMDnJQEfQDLUTDguwhjnoxKtSBlxBgYP+mYKbDTNo6CS5eOmXb?=
 =?iso-8859-1?Q?ZYOBo3YR9AFGAfYIJqZShLcbSzJm434ihIwIu/jcxtKNT5QdT4TeRn0NJF?=
 =?iso-8859-1?Q?4WPlrn0/hbtC89VpzDVIwU5zHYOgbjvvY0vsEYKKPsBUqHI672hNKXWfyY?=
 =?iso-8859-1?Q?49h+2D3p52C1RpIOk3pgCEbqGI1kBw4ECPqrg/ISCpsk52UUev1JXdCu6n?=
 =?iso-8859-1?Q?fb/8WArlNzKroRMj6X/yYyppTtyrOB8Mkm7ywFhi3m300b9Zyh3GF8KVZp?=
 =?iso-8859-1?Q?5xeBQRs6t3CkDQ+3ghBZOkVQxpfoqvMcguHZ80VrCrDyOguMCmNWXbVbBY?=
 =?iso-8859-1?Q?/i1ke3PSjBj2weSAfKPaXq7/FlvJx5gHuiriSQlup/c8skCgRixd45Fu02?=
 =?iso-8859-1?Q?awRbX4bDYYmLHS9yo2YnW3zpA5flVTP83KC8bCCfYmS625iy2y1LuxN5m9?=
 =?iso-8859-1?Q?3GmT7qgKHBG6AecZZO2Y7/pqbcHJKingYHp3vVLXHOYUsEVy0e1/7ecV4Q?=
 =?iso-8859-1?Q?7etENv8ylWLwIGMvlscHSrOgpXeVuNsbhiHJws1JXQ/G8s9FppxLYtK+fI?=
 =?iso-8859-1?Q?BFIx1fTZNBf2p4K6r6zNSODAzwGVN8N2w/mAo+EbU2j/ct3ZOqiUXZDbsU?=
 =?iso-8859-1?Q?akUAB4iaEJdl3B610Y8kwdqCKIHbmE2zrJYoWy1VoHjGmSrw/AymR+OlNt?=
 =?iso-8859-1?Q?UaohB/a8h2NbYruSCC963rpRHMpjqsVNlmo/Fmx98NtQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZlnGwfOE8m2QKAV2i9B/CHEOTSB2Xeqi3OV6ZarLS2AzVS/ey+TBcQjCnC?=
 =?iso-8859-1?Q?fULQZoDa61wD3E4O8Cyes6TNayyD6KtjP3eYjcEuqW7S7uCTrOx2oDhVNS?=
 =?iso-8859-1?Q?4PI4IZADEaxTRsLMZZfdFv2RziCL+Z4ZtgC9yuCcq3wr9WJSBHdgnv2waL?=
 =?iso-8859-1?Q?YdxdkxY5/PhUVHmHOl6oaqXBeFK+9poq/PED92bs58Y1Z9ATWFngtgATYA?=
 =?iso-8859-1?Q?/MUWiqUZhMlt/aZQhxk7i/jZ5UgAMEklNrgBC5nHoTViaCEnph+MtM179X?=
 =?iso-8859-1?Q?I73T6tXZpMpdzAeIRAYgCn8yeojVthXfWg51CDVeJKjiDocfLWbOvds6YU?=
 =?iso-8859-1?Q?0fETthKVc8WeU9brCv5m+rj7ADtXkPxoFi0pTLJTKplNC/i19WuEcbD6Bp?=
 =?iso-8859-1?Q?ZWrKnRXeOI1DHucNAcDE8Cjxd4jquJEmqyfLpveSxH08UJ8TpWwpCyCVub?=
 =?iso-8859-1?Q?haUektpzdAm/modjLapBJwM3yCOskKqa9lj65LA0cXAeddeGn9Zj7KgVsn?=
 =?iso-8859-1?Q?kxx1sg6Wfl0dujZnIkuaNKoQkvJaaV+HL0Dae1LroqWFBt+HlJnW6gu+ms?=
 =?iso-8859-1?Q?kWnUtjKssm5V0myg/YI8lTIDWUSdQRTtPTqFVJk6I3JrZBf1fz4gFd0HJD?=
 =?iso-8859-1?Q?qUfzIkcPxbKi4F6YaXYxb/v4MnSp78FRkRDm2h7lzhOaIIhdZkO0uer2iA?=
 =?iso-8859-1?Q?WoLSKWyK6OmIsM57fk5Au8s9PACx0yK+GnZfccf2XLHDFSij9OvBg37kY6?=
 =?iso-8859-1?Q?V9ERyba2mPY5qnO+ZaWPiN0BTNMIVKU78b5OebKOV/Od4YpR7k3yGQl3k8?=
 =?iso-8859-1?Q?RScJz46Rkn/mmB5V4uyMtJrPyBWEEl2QkyK8FrOuU3f3FISyw6/ENwEACm?=
 =?iso-8859-1?Q?gY4f02KykgespXXA9jOd3638HjWFZwWMPpwlz3n5JhnUUq2cygB4/s6MIO?=
 =?iso-8859-1?Q?rl2dRLkpfZzHK1vOp8NKoRGuxea979M1qIHuUKhOK26588FDjDf5bpQ1rq?=
 =?iso-8859-1?Q?ePzvRwvgQ69ttfPPhzMrzKWxR/J6iQw8syWOnMtEcU/QodgVLnRw2KEf8f?=
 =?iso-8859-1?Q?eiihoPopiTMypVPTkv22izkCpyKCOP138TcdNh0tBTxN02szpNCE1F0b4Y?=
 =?iso-8859-1?Q?6lkE3048P3MUeaBWRxBFBfdW0YFdwOqBee4H+TowdndZtip3NPFbopRHBs?=
 =?iso-8859-1?Q?5F8y93bj4l0TQxiNRzEOtFKQRKEChGYoHEfyaUR/dDKbEpmWJbT16Lr1ai?=
 =?iso-8859-1?Q?FXVMIMVjbDt2fpgDnjLvPFpqovgSHZmtI6UExo5u5OylnPKVp6C4rSWMMw?=
 =?iso-8859-1?Q?Dl0uFnefJ4zbq19zZCucOJXZl39sq89/zS4rF4FnUVjaNcdSu5K0z4eTcX?=
 =?iso-8859-1?Q?oGve4eYCuzNulIEyvqpGUTjmYSJjBnrhtODWxgD2OU6r+lZ1j2YFd8DVyn?=
 =?iso-8859-1?Q?GzsZLSyu4gjpYf/S0cFs0pXrmQGHvVONsj5Ej/AIF9MKAmXW6E+kIgO5J7?=
 =?iso-8859-1?Q?9UsAosl3pDsNnYYVCrZEC8oI+jInnfEdzfesBN5nokt9LqbO4GQt9vCK6J?=
 =?iso-8859-1?Q?Wo8a15+XC8rt6huIMPo+szkWdPwsaNrEpSpkU6DoGWxhOV4zurBsIAJvkL?=
 =?iso-8859-1?Q?z/hVViuXuG6+yk2qRMdh5iOqo8yHfk7BFFLiddLGlfw/KNCPhFXaoaog?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b809606f-7d64-4a75-ee5c-08ddc5e3838b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 10:11:50.9874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LagJox9LnOnrSfPBETOftypLVVTWRkVKHn4bZsR2xGDcAjso0IeVqyysevqeQz7HsaXAeR0e9PfTeesUA0zRraEXg69y/APMeHy8A1/lCwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7670

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hence all common PIRQ code is under CONFIG_HAS_PIRQ idefs corresponding Arm
arch callbacks become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/irq.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c43..4bbf0b0664df 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -595,35 +595,6 @@ unlock:
     return ret;
 }
=20
-/*
- * pirq event channels. We don't use these on ARM, instead we use the
- * features of the GIC to inject virtualised normal interrupts.
- */
-struct pirq *alloc_pirq_struct(struct domain *d)
-{
-    return NULL;
-}
-
-/*
- * These are all unreachable given an alloc_pirq_struct
- * which returns NULL, all callers try to lookup struct pirq first
- * which will fail.
- */
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
-{
-    BUG();
-}
-
-void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
-{
-    BUG();
-}
-
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
-{
-    BUG();
-}
-
 static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 {
     return (curr =3D=3D IRQ_TYPE_INVALID || curr =3D=3D new );
--=20
2.34.1

