Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA1B58295
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 18:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124366.1466753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyCRd-0005hf-PH; Mon, 15 Sep 2025 16:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124366.1466753; Mon, 15 Sep 2025 16:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyCRd-0005fp-LW; Mon, 15 Sep 2025 16:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1124366;
 Mon, 15 Sep 2025 16:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RtB=32=student.uliege.be=Julie.NgamiaDjabiri@srs-se1.protection.inumbo.net>)
 id 1uyCRc-0005ff-4p
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 16:52:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20729.outbound.protection.outlook.com
 [2a01:111:f403:2613::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67d2b913-9254-11f0-9d13-b5c5bf9af7f9;
 Mon, 15 Sep 2025 18:52:46 +0200 (CEST)
Received: from DB9P250MB0523.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:338::7) by
 PA1P250MB1086.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:454::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Mon, 15 Sep 2025 16:52:44 +0000
Received: from DB9P250MB0523.EURP250.PROD.OUTLOOK.COM
 ([fe80::bfa1:a1c3:42a9:744e]) by DB9P250MB0523.EURP250.PROD.OUTLOOK.COM
 ([fe80::bfa1:a1c3:42a9:744e%5]) with mapi id 15.20.9115.017; Mon, 15 Sep 2025
 16:52:44 +0000
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
X-Inumbo-ID: 67d2b913-9254-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utSICj1gu91iMhrwhNMgff7g+tUwbmENO/94n59pgxFq4gtLvZ0n/TTh/VxZTAiS1sI/Jw9/BXvt8ozdcQ7qni0z2TC091HhXsXs3c0wDAGctuWd2p9LdAUMIYduHDkGL6B6uT8keTA0CfE0VWKd73DZPSaPVBYl4ok/lMps2/CgXscceGitGbe1o7Rt7WFli2avTHEy34TOReAw0S2+OVLmEIgn0cKR20TZTeeVO4RG8ZB/i65xeL9DaBQvvJ6tgVwC0Zzsv4i9/HT6+UExx/ihmDS8beNlR0nBPbwXmQ7tWTi/HNpJCFuJ8uPru8q0KD0TqFyZFQoVeVhiLNAcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdkLOj+4y/jK1MmehA41W2jn/zC/qER/r8Sveptw/I8=;
 b=y850Ax2mSnfz89xBJ1YS2weJDF/YYpc2itGluRzg5yX8pYkrKnakwrsEov0OSzNSFLZhyt5/dT44cPUW7Vk3Gf8wdd8oPtCyF78/N7Vn0ZIqx+P32V67fo7WPliT7gVnPaAFmMUqcO5ksyTBVjisjdc6ldHUfcPQJRsJsSmhOj4WsCBxYlGXzd1lAqOR/bnUs8zs7uUc5eh4nQj2h35+hWB8uIsTn6cDkCvcWEgQum4HQ79IW4EpvdI61ApX9q/CLjVWZWUB6UpO5JEhf85QyhuOJIqZCBWjsj+VOhkHQyPTjbKMvcjxqC7QB3yP4kACsbodeyjuE9FbBc8p+xY04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uliege.be; dmarc=pass action=none
 header.from=student.uliege.be; dkim=pass header.d=student.uliege.be; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uliege.be;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdkLOj+4y/jK1MmehA41W2jn/zC/qER/r8Sveptw/I8=;
 b=nDS7O2ooEYFbJfzKBXXFxbsbqg9AWhG9R7Bq8ltFRZwxZpl9Uyy7b6SQfYqdTlelgcLaOcHEwionu3kqSPNkJfcrK8jEs5MaKMVklb5bsTzL8laXv1dUFDmqO6TuZcIXQ4+HK7YBaWruO6zt42yKIwlDjr0sn0VmTqcfZXi12+KJbqOPziRwaX396aGhuqZtH8+diGh6IcBYzwwdYrsci790P6aFMb6/UZHtvDilrXvUBxiZGXGzGUxr7nMZR3G5A3akBRfsK50xLsvdXlz7ftzVPJsBLmIhaWJEqQqQUwxApd5WESpwrDnqrYUhC0rmIdEDfaorz4I+7EeBSC/ajQ==
From: Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Request for patch to fix boot loop issue in Xen 4.17.6
Thread-Topic: Request for patch to fix boot loop issue in Xen 4.17.6
Thread-Index: AQHbu22NmgKiRiHk2kKM1KfVYdOb37POwC4AgMaJ3Tw=
Date: Mon, 15 Sep 2025 16:52:44 +0000
Message-ID:
 <DB9P250MB0523A25B90E1223BD1037EE7A015A@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
References:
 <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
 <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
In-Reply-To: <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=student.uliege.be;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P250MB0523:EE_|PA1P250MB1086:EE_
x-ms-office365-filtering-correlation-id: bc9a8513-5e45-4571-4169-08ddf4784a9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|8096899003|13003099007|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?/SUrHFpXVCeTcSlIwNet4WIbYNMyKNfpEyYde6OO3daFEYdpyEdXpOqd?=
 =?Windows-1252?Q?9En2V8h8sYpaLVgEEsfA4ZVKCEHYMSBGG1nK2hIHh64LE6KVi2haCQ4V?=
 =?Windows-1252?Q?shcc7hOK7Ab9MMBYF7JBY7KIVpK235U2rVVHF5J/pNjyXJaBNRNnas5R?=
 =?Windows-1252?Q?QbWhcbqCYfUvs6otdmUNA3STkiidCQCTfjg0Lr+pBq9ywkNj+KOVOcr4?=
 =?Windows-1252?Q?cjPe2rqXHykcxQgx1nI36QzgOValCLibLjMVzNsHJaDGQHVLOXVHwEzX?=
 =?Windows-1252?Q?sr8FdX8NEs70JOd5U7nY7JGRI8x02WyGJWyRaVYwUPPEEbaRYMb/az89?=
 =?Windows-1252?Q?59EC1mgifD17rFctgvqClg9lstek4xXO2aMUZ84MC51JNCdINsso9I/y?=
 =?Windows-1252?Q?J6kzKvRkWA/vvOSy0P4kJtX89I0d9hBdo10MQ1NZtBgVOOvfEaNp70Nm?=
 =?Windows-1252?Q?x0g3H6Nl77oHH09Wc10LKAsSMAR5/5RWTvN34vBKPoGnDMt88WgL3Dnf?=
 =?Windows-1252?Q?68O69q/WHDkx21eGkQcWeYZEjAmB9ZLFef1rNAPFxWtcy209N5OGh7By?=
 =?Windows-1252?Q?8VwIBp4SRue1VxtOo0df/cFM5WM9e2HGSK6cFl2pz0BQpm3LfMSh5N6g?=
 =?Windows-1252?Q?vsCQ8r9cRC9dxwpoQXdsbulkKJSHjWcs2hugyrnzlbeRU/y8oGwSYm+d?=
 =?Windows-1252?Q?7kTRaQMp10vji6+CSEJvkosfVpvGRb63QRu+fEm7QV2bOylZCR1JihyJ?=
 =?Windows-1252?Q?Xn6/2uJyU5CNl7ogGSeoaORxt80Dk2L7UdSyaMPjLhc1noc4bTr3v5IL?=
 =?Windows-1252?Q?Vl8nNExO8zXhAg79zp/87sVrJsOr6lIUYY4YXV998YR7hS9CwF9Lm06A?=
 =?Windows-1252?Q?8Qyx4/n7FCPR/pNK0090W3MA2nzx0SPex/yrUz1/b9vg2kI9JT6Xw64B?=
 =?Windows-1252?Q?BMmcN8SpeFnm4krpOOj2vlGXeoUXnWLlQb3tWHRZrzbMqtMf62BhnbkF?=
 =?Windows-1252?Q?r1dUj+o/1COeRvTtRH88tYxwn9vkAXw0glFKCuPhS7cZ6K3fs3tRBiOf?=
 =?Windows-1252?Q?crZTE56+WQqPv59D18oYV7vvAKID4bRdNbpX5rjWgZqIsqe3TYVUwV48?=
 =?Windows-1252?Q?uuncwNwaAS07W+bcST+qPhl4E5fjyl8hqw9jZpeJq7e9ya99xqLszs0L?=
 =?Windows-1252?Q?0tNr58v5x3lLSKD3bINPEAjI7Kzq7TcG6hx7pUgMnx2RIryJZZjcUeW5?=
 =?Windows-1252?Q?KKd06eWNhNRV8o/nmlG25vlOngJsYdQYNKeBkltAGH2pRHE6/l85/cfB?=
 =?Windows-1252?Q?OM5Q4Y7mbsc84Bli8lirXPKrFHLY1f4hO1irTVV+ORbrer1PgkqS3DsB?=
 =?Windows-1252?Q?aQ3a2/CadQIZr5jWoUYC7CNnso59SOLIaYS1weLDABHxZgeK+wrSoOKN?=
 =?Windows-1252?Q?mTeh4YAMwQW8/6Q98lEbAwviqyIFZpF+msqjLsS2TfgjBpcAN7EKNOJd?=
 =?Windows-1252?Q?wIp3jZcPmjA4PcU0RlsEm1DiF8AC1LXurSUN1vsZ4j4YviM/Acg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P250MB0523.EURP250.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(8096899003)(13003099007)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?LsYyMOmA6rIJQhA24tdwOHRpwLVCSmVocEtNQjqodTjt84wKuu9iPXnY?=
 =?Windows-1252?Q?ejgzpE1Lfhlww5BPLpbGNaTj0NqCuBceAKWWnvOsvteoGtEELZ9fE4yo?=
 =?Windows-1252?Q?T6KStu0PbEEnB/4JWxu8R9VFGAH9DLT3qkNCvVfJNIjT65PN26kAP8I4?=
 =?Windows-1252?Q?1f71/cUBqLybeqEbEcz9i9v1TJPRqLwgUoJH0f3nHHpXJZoyHLAyN+w2?=
 =?Windows-1252?Q?V/HJuULlWuwGQ6C+Rb/DScDDjU+3sT0InavcgO7R1poafzKW8zSCupgf?=
 =?Windows-1252?Q?jhw97YMjZeiP2F6hSTg9+e4HWv0Ib7pXJGP1rFzGZULcVnlXvMbERNrG?=
 =?Windows-1252?Q?6AAQETnEEwSMeBlut19/T3YKZKhbFrnk9MF/tvB6qCqIlZ0UJQ58fZVO?=
 =?Windows-1252?Q?IMUdLqmUWKgP4qwjFT863y0hyQ28DCKzv6ynB966ugTdQWiNaEvbUSVY?=
 =?Windows-1252?Q?VOKpvTyiBqzWneKYrkz8OE2AZRn1AcHeq2204fr7eQzvBk7PUZzM8qoU?=
 =?Windows-1252?Q?73Bb5LkBmpdDcH/VGmTds5bMY1p2uBw9Ddl3h5kAj2+reZG2M7bN2W0t?=
 =?Windows-1252?Q?zQqPfxAX2DgPlj6ZuSzWvpQQePYpgxy/91pCa1YAEmEKzqLp0qJcKrnN?=
 =?Windows-1252?Q?j/vU4Yh0jc3O4uM5Fx9nD6BpFDAzi5fayNFgreibzHn2jSn5/2FCZqh4?=
 =?Windows-1252?Q?P7bLcUZJPVxtL1CNX1qiPnGkQobnfHALlG2Is8xjo2WkT5UI6Ttl02EY?=
 =?Windows-1252?Q?W71YtimKQb+iE2Y2W0Z1WThiIKD/pPbrxzvujWxJx8oN6uOjA0kjbfC4?=
 =?Windows-1252?Q?pRwqTLnlHMxcH0K1rK5+YSZqjl+wAYUmAcdonrAKRxiKYhH9PkcxhWpG?=
 =?Windows-1252?Q?IxJGeIdigc2UMMCVtkFxxtXzBNQB8yjQjCGkx39tFwVyiaHdsiWUJqh4?=
 =?Windows-1252?Q?m0APZunwqNvdv+iCoy4pdcR1enFnF1e10kud9OjoPhNM1xs5MlYry7fb?=
 =?Windows-1252?Q?52ink2qabVsAdrXj+tjb+O9xWkjxTwTSQ6KLHpEEJWJcyuaKOBUdzBQu?=
 =?Windows-1252?Q?jKySz+4mUX5Cw4Mpn9+abzY8RAueIQy7HTTu0OYCyKzaI8GCUNDM4lw7?=
 =?Windows-1252?Q?Gc/cM/lT8LstAaD1qP61QGXaNlEzTz+nkELZLoMwD476Q3QUVQAb7k5B?=
 =?Windows-1252?Q?DFCd6nIjr2O5/OSN6u12kjtwNq6pN/ZxQHVW7kavp/b3P7U7Xfy9iqDw?=
 =?Windows-1252?Q?/foe/T/xqkVIQODCtStVrP+LH9Rb2Xj9cQN82rznYOfx/xf2/YiNeH9F?=
 =?Windows-1252?Q?yT2eWlO46xcurv83gdiVFrLCtG3uTaXJitlpPiIZWVFQLA8OF4WB3sGA?=
 =?Windows-1252?Q?A4nLsDP4DUc1m/PlLD5Jiy/aymVSA7+EvwCbWZnWLa/s9O8lrkLpNX4J?=
 =?Windows-1252?Q?Y3hwcuB7DIYxKAkRnjb8MFzJpBEIp5wsvhyjWL8TfpUvPdJ7gLJ9RW7P?=
 =?Windows-1252?Q?HFdCHkJ/KpRB+RdTt21iIeA0sosQkfzi7u5BHuEqHBXjYc8R07GWq3S7?=
 =?Windows-1252?Q?4xzwWCscJRcLm57jXdmUNaktFGqbmQkjTqeF8IzyCjB1U3DCG8hohhr5?=
 =?Windows-1252?Q?f537HgUVtSs6YTL11fpA/WIAn1ohzKpVS3G/PJanpLmOje+vD+AvSRSE?=
 =?Windows-1252?Q?CMZFrW/uokJJyQig3McERSUOQLSWzsCnZN2E60Z4042txsdg8s/zg7nI?=
 =?Windows-1252?Q?CEAJytTyDWxV8eS9on2ADhrEhu+wcjVc1qC4pjOoAtUSvjslZml/4hgo?=
 =?Windows-1252?Q?Cceu3+qHE+KWmfhAhgZ0h3/KWzw=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB9P250MB0523A25B90E1223BD1037EE7A015ADB9P250MB0523EURP_"
MIME-Version: 1.0
X-OriginatorOrg: student.uliege.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P250MB0523.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9a8513-5e45-4571-4169-08ddf4784a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 16:52:44.1065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 62e13b84-1960-4562-8c7f-72472951da8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EZ2wK/uu0bhYpecjpKKJ0MntlIUIEr2U3EDo6Js+Qg3MAdU9pfHcrc/qWFSqOMjphYC81+Add4n2JuFYu7ObgcgOETFU5KMmxsi/AARjxNzaQ3/XC/HhYQANF7tsI/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P250MB1086

--_000_DB9P250MB0523A25B90E1223BD1037EE7A015ADB9P250MB0523EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Dear Jan,
I want to underline that this issue is a critical security problem affectin=
g system availability and that it has direct consequences for XEN users:

  *
Systems running Xen 4.17.0 =96 4.17.3 will fail to boot when upgraded to 4.=
17.4 or 4.17.5 under Intel Nested Virtualization.

  *
Diagnosing and fixing this requires advanced skills and time, and in some c=
ases may be impossible for standard users, leaving their systems unusable o=
r unmaintained.

  *
The problem has been known to Xen maintainers since 2024-01-20, but no offi=
cial communication has been made.

  *
Root cause: commit 6bdb9651<https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dcommit;h=3D6bdb965178bbb3fc50cd4418d4770a7789956e2c> (2024-01-17)

  *
Fix: commit dd05d265<https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit=
;h=3Ddd05d265b8abda4cc7206b29cd71b77fb46658bf> (2025-01-21), applied in Xen=
 4.18.5, 4.19.2, 4.20.0-rc3

  *
Xen 4.17 remains security-supported until 2025-12-12, but this fix was not =
included in 4.17.5


Suggestion: I would suggest creating an XSA to notify the community and/or =
include this fix in Xen 4.17.6. This would help prevent affected users from=
 encountering unbootable systems and protect the availability of their envi=
ronments.
Thank you for your attention.
Best regards,
Julie
________________________________
De : Jan Beulich <jbeulich@suse.com>
Envoy=E9 : lundi 12 mai 2025 10:54
=C0 : Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>
Cc : xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
Objet : Re: Request for patch to fix boot loop issue in Xen 4.17.6

On 03.05.2025 16:02, Ngamia Djabiri Julie wrote:
> Dear Xen developers,
>
> I would like to ask if the following fix can also be included in Xen 4.17=
.6 (and eventually in the Xen versions after 4.17.6 that don't have the fix=
) :
>
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Ddd05d265b8=
abda4cc7206b29cd71b77fb46658bf
>
> This bug causes a boot loop in nested virtualization environments (for in=
stance nested environments that use VMware Workstation), making Xen unable =
to start. It was introduced in version 4.17.3 and the fix has already be in=
cluded in 4.19(.2) and 4.20(.0) and woud be planned to be included in Xen 4=
.18.6 in the coming weeks.
>
> Even though Xen 4.17 is in security-only support, this is an issue that b=
locks testing and usage for users and projects such as Alpine Linux.

I fear I don't view this severe enough an issue to break the security-only
status of that branch. People concerned ought to simply update to a branch
where the bug was fixed. Or the distro could include a backport.

The underlying consideration being that once we start making exceptions,
more exceptions will be asked for, along the lines of ...

> I am a student using Xen in a nested setup for Virtal Machine Introspecti=
on (VMI), and including this fix in 4.17.6 would really help avoid these pr=
oblems for others in a similar case.

... what you say here.

Jan

--_000_DB9P250MB0523A25B90E1223BD1037EE7A015ADB9P250MB0523EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<blockquote style=3D"background-color: rgb(255, 255, 255);" class=3D"elemen=
tToProof">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; line-heig=
ht: 1.284; margin: 0px 0px 8pt; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: b=
lack;" class=3D"elementToProof">
Dear Jan,</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; line-heig=
ht: 1.284; margin: 0px 0px 8pt; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: b=
lack;" class=3D"elementToProof">
I want to underline that this issue is a<b>&nbsp;critical security problem<=
/b>&nbsp;affecting
<i>system availability</i>&nbsp;and that it has&nbsp;direct consequences fo=
r XEN users:</div>
<ul style=3D"direction: ltr; text-align: left; margin-top: 0px; margin-bott=
om: 0px; list-style-position: initial; list-style-type: disc;" data-editing=
-info=3D"{&quot;applyListStyleFromLevel&quot;:true}">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: black; margin-right:=
 0px; margin-left: 0px;">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
Systems running <b>Xen 4.17.0 =96 4.17.3</b>&nbsp;will <b>fail to boot</b>&=
nbsp;when upgraded to 4.17.4 or 4.17.5 under Intel Nested Virtualization.</=
div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
<br>
</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black; margin-r=
ight: 0px; margin-left: 0px;">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
Diagnosing and fixing this requires&nbsp;advanced skills and time, and in s=
ome cases may be&nbsp;impossible for standard users, leaving their systems =
unusable or unmaintained.</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
<br>
</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black; margin-r=
ight: 0px; margin-left: 0px;">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
The problem has been&nbsp;known to Xen maintainers<b>&nbsp;</b>since <b>202=
4-01-20</b>, but no official communication has been made.</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
<br>
</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black; margin-r=
ight: 0px; margin-left: 0px;">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
Root cause: commit <span style=3D"color: rgb(70, 120, 134);"><u><a style=3D=
"color: rgb(70, 120, 134); margin: 0px;" data-auth=3D"NotApplicable" data-l=
inkindex=3D"0" rel=3D"noopener noreferrer" title=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D6bdb965178bbb3fc50cd4418d4770a7789956e2=
c" class=3D"OWAAutoLink" id=3D"OWA740a0c8d-ac74-86a3-1603-ef436d41112d" tar=
get=3D"_blank" href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcomm=
it;h=3D6bdb965178bbb3fc50cd4418d4770a7789956e2c">6bdb9651</a></u></span>&nb=
sp;(2024-01-17)</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
<br>
</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black; margin-r=
ight: 0px; margin-left: 0px;">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
Fix: commit <span style=3D"color: rgb(70, 120, 134);"><u><a style=3D"color:=
 rgb(70, 120, 134); margin: 0px;" data-auth=3D"NotApplicable" data-linkinde=
x=3D"1" rel=3D"noopener noreferrer" title=3D"https://xenbits.xen.org/gitweb=
/?p=3Dxen.git;a=3Dcommit;h=3Ddd05d265b8abda4cc7206b29cd71b77fb46658bf" clas=
s=3D"OWAAutoLink" id=3D"OWA3e1f14c1-3878-ff64-eab6-48789d6871ff" target=3D"=
_blank" href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D=
dd05d265b8abda4cc7206b29cd71b77fb46658bf">dd05d265</a></u></span>&nbsp;(202=
5-01-21),
 applied in Xen 4.18.5, 4.19.2, 4.20.0-rc3</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
<br>
</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black; margin-r=
ight: 0px; margin-left: 0px;">
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
Xen 4.17 remains security-supported until <b>2025-12-12</b>, but this fix w=
as <b>
not included in 4.17.5</b></div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px;" role=3D"presentation" class=3D"elementToProof">
<b><br>
</b></div>
</li></ul>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; line-heig=
ht: 1.284; margin: 0px 0px 8pt; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: b=
lack;" class=3D"elementToProof">
<b>Suggestion: </b>I would suggest<b>&nbsp;</b>creating an <b>XSA</b>&nbsp;=
to notify the community and/or include this fix in
<b>Xen 4.17.6</b>. This would help prevent affected users from encountering=
 unbootable systems and protect the availability of their environments.</di=
v>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; line-heig=
ht: 1.284; margin: 0px 0px 8pt; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: b=
lack;" class=3D"elementToProof">
Thank you for your attention.</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; line-heig=
ht: 1.284; margin: 0px 0px 8pt; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: b=
lack;" class=3D"elementToProof">
Best regards,</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; line-heig=
ht: 1.284; margin: 0px 0px 8pt; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: b=
lack;" class=3D"elementToProof">
Julie</div>
</blockquote>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De :</b> Jan Beulich &lt;jbeuli=
ch@suse.com&gt;<br>
<b>Envoy=E9 :</b> lundi 12 mai 2025 10:54<br>
<b>=C0 :</b> Ngamia Djabiri Julie &lt;Julie.NgamiaDjabiri@student.uliege.be=
&gt;<br>
<b>Cc&nbsp;:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproj=
ect.org&gt;<br>
<b>Objet :</b> Re: Request for patch to fix boot loop issue in Xen 4.17.6</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 03.05.2025 16:02, Ngamia Djabiri Julie wrote:<b=
r>
&gt; Dear Xen developers,<br>
&gt; <br>
&gt; I would like to ask if the following fix can also be included in Xen 4=
.17.6 (and eventually in the Xen versions after 4.17.6 that don't have the =
fix) :<br>
&gt; <br>
&gt; <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;=
h=3Ddd05d265b8abda4cc7206b29cd71b77fb46658bf">
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Ddd05d265b8ab=
da4cc7206b29cd71b77fb46658bf</a><br>
&gt; <br>
&gt; This bug causes a boot loop in nested virtualization environments (for=
 instance nested environments that use VMware Workstation), making Xen unab=
le to start. It was introduced in version 4.17.3 and the fix has already be=
 included in 4.19(.2) and 4.20(.0)
 and woud be planned to be included in Xen 4.18.6 in the coming weeks.<br>
&gt; <br>
&gt; Even though Xen 4.17 is in security-only support, this is an issue tha=
t blocks testing and usage for users and projects such as Alpine Linux.<br>
<br>
I fear I don't view this severe enough an issue to break the security-only<=
br>
status of that branch. People concerned ought to simply update to a branch<=
br>
where the bug was fixed. Or the distro could include a backport.<br>
<br>
The underlying consideration being that once we start making exceptions,<br=
>
more exceptions will be asked for, along the lines of ...<br>
<br>
&gt; I am a student using Xen in a nested setup for Virtal Machine Introspe=
ction (VMI), and including this fix in 4.17.6 would really help avoid these=
 problems for others in a similar case.<br>
<br>
... what you say here.<br>
<br>
Jan<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB9P250MB0523A25B90E1223BD1037EE7A015ADB9P250MB0523EURP_--

