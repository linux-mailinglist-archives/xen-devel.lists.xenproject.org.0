Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AEB22BF7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078859.1439889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrDJ-0005iC-A2; Tue, 12 Aug 2025 15:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078859.1439889; Tue, 12 Aug 2025 15:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrDJ-0005fP-6j; Tue, 12 Aug 2025 15:47:01 +0000
Received: by outflank-mailman (input) for mailman id 1078859;
 Tue, 12 Aug 2025 15:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OTH=2Y=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ulrDI-0005fJ-01
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:47:00 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d68e62a-7793-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 17:46:46 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS2PR03MB9348.eurprd03.prod.outlook.com (2603:10a6:20b:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 15:46:43 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 15:46:43 +0000
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
X-Inumbo-ID: 8d68e62a-7793-11f0-a327-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwSSF6bBD+wLP6jVNtIUoW6/XQEsCQOHyq08M2yWUIdyaQqTTemrN774fRpKPz/t5+0WlZCUg4as5DooFuQPnDX5YuG8jKml1vSHO7A9fgkYYSynqyjj/tnqdlB8CqbOfd6119MYklegnwvTSy1fDLeMckt5xnVD01XUKTw+CrPf7m1ih8zVc1L8SGU9Umw0p8EpoAFEF8eN0V9fvOub+JKNAd5PRQ321H88+O5vY6ewy3E4hWOTvLDh9ixFNFofeo1HAqjoyYGoOdKxJMF45x94cBfhNFL+RDetPYCUnI3ck6z5yUpmrAm6AJsFy/EntVqStSs+xz1vMO2HndSw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/QHvgbmohPFmHHzvigTT9seSw/ncIG0QHyBVaz8jIo=;
 b=OoIFYJckwfq28w5kHwBoWXit6BlE2HLICcXfmCqDxJCbr8nAEAW+wrJNHuCOgc+C96RI95pAvKarAHDWj+23fhuFFpl5QxoL8kxQqn1U+POORU0UswR4YgZl/+qsQQDp+oYk95eW7CDInRYJubqbPMVeusVs0eZN9v3BTbLJ7EdGsW7INNohx2x8c4iChzCZHvaEEphxF6AVnpPUr7aagA4xdCtDt3uQtMkvRwSdklISUjwg/WjH1Pzt/jqVRdvKcJAAMWFs519sl+JwPAWudw3Ifr7epC/CDgBWoKokwtAF9ICBwl68lLkSTzvEZkqJLFFPY3VVP1z2qvskL9O3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/QHvgbmohPFmHHzvigTT9seSw/ncIG0QHyBVaz8jIo=;
 b=NvtRNN6LaLj7vgSLewiop5WQohr9z8fNl4VQca/mRfb7pD8hX4LRpfWjiAskQ7Xt/OiMUt8vDwGDp8QokOgBMXAVt42w6cFGiOJ3pGO61OKOtK0XofGcJoVOlVP5s7OTLYcOwET9SyALsh297VmR3c5H6iP5zLIdsXXMDVr7e/j6FG3Oev0ElKS+Otl4piEs7JWuP9hlZkLmAqvqp/eTUTt1WQDZTGisLfLvbBqv6/9WlsEDd0ss7e9IIv8kgoT3RvLISxSqL56qayjTS8iH9OI5iT56Ff+qsUPdMXB1iTiW27soXeW5khyyvBG8z1VdlqJDOrJmD0oIJ6kuhGK63Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] misra: add missing noreturn attribute for __div0()
Thread-Topic: [PATCH] misra: add missing noreturn attribute for __div0()
Thread-Index: AQHcC6BNrZWExZ8T4Eir24b0NtVqLQ==
Date: Tue, 12 Aug 2025 15:46:43 +0000
Message-ID:
 <1b5549a97db31c65edb769302deff73576cec41d.1755013482.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS2PR03MB9348:EE_
x-ms-office365-filtering-correlation-id: 47498684-2ecd-459d-f3dd-08ddd9b76fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qPqdgUSjtzwPeABK/iosiQ8zQaxxJfEKtxM88E0iIG5ofX8+XECyHcUcEk?=
 =?iso-8859-1?Q?Clxw+BUzCBrIfWDWmgPFySrVo7H0W2c8J86g11ouSzJjqGXa7q1Cd4lznX?=
 =?iso-8859-1?Q?7ikLbuuidZgS97tujMVQ3L0xdquAdmw/dNeWRqnilZKBcZ6HP5daEay9tp?=
 =?iso-8859-1?Q?930/AC8vFdNt4MKVrDPTQPTT/vzQWFls76Gp8CqpE6d8yhg8QSY9pQntL/?=
 =?iso-8859-1?Q?UoQNICoAPiWeSFqPGKiAVRd4V5rkFx88i0NjGkaZDVQrBq9y4mMW18XryK?=
 =?iso-8859-1?Q?nFhqBVsaULejWG+OGmRLcG7EwMeXpnNUwvPqdNgzxJ8ha0A7OuDJpFzbNG?=
 =?iso-8859-1?Q?4N+QafMlU4gzSDMxoomIPblpWaAS81GcQcoV1VxiUkQ0l8SLyo8+aAE1jS?=
 =?iso-8859-1?Q?hsoI1jrl3YfkS1L9/AIjhV+3dMVcdIXkOJtVj4caERMy08+XxremhE7SN7?=
 =?iso-8859-1?Q?Y56XH3c06sVIWB/tenVXqQ9+gRwoFtGj1pQROWWrdesmlJ0I5mCHPBTOvk?=
 =?iso-8859-1?Q?RzE4k2nyFcPsA3kRSvfyd8p4Ws3Mkjc39SwH9CxI9ZoUppScxLnMni3qUK?=
 =?iso-8859-1?Q?vfBVO9k3yxJZuGAv4gJewXPqdyVV4xH2Jl8F7/tJGSw5jkDi2NSzIzrHKR?=
 =?iso-8859-1?Q?Ieau/5H6RMYa8yrOe/WCTpMQn94O9ux+6ggMuFcqD0Q57b/GTSGShu5HkN?=
 =?iso-8859-1?Q?LP2FgrBgHGlkPTwkpEBbGmPJ6SYM5h/mUFBkalDmnf2uwNrlulpct0eamn?=
 =?iso-8859-1?Q?0Vtn/RF7M0+v2x1ahJuCOXxUb3PrkcS7hk1UE47esyZPzzef/qQm4S43rT?=
 =?iso-8859-1?Q?VZ6KuxM/BKS/AUqTj2mRQ6096ShG7dZS5Z0dddamfOWeaivojNXTR9JMvR?=
 =?iso-8859-1?Q?Mp6gdVRsys2POQUBDROFgO12UKWj8X5v8qNw/iq9BToe1owmioB97+9x4V?=
 =?iso-8859-1?Q?0yOge5LUMo5Y7cG9STL61ARr7q4T8ijp6TRDyiky08yBDQIGKiTEMYCKPq?=
 =?iso-8859-1?Q?b3s+lYZP6QsM338j2pv3fe38XsnKx30PJf0ioytOtFB9r3sYTAQyXMTz+v?=
 =?iso-8859-1?Q?XFZbRor+f7hfOWEmB4HKrbnbriWORSAuM7wlsLpO/3fpUCibER7xS/h9wR?=
 =?iso-8859-1?Q?5sZsVtDwqcLyLA1zJX+x/3hApysUZ8TNSIHBpTWEPuUtkExz6D5h57AuOJ?=
 =?iso-8859-1?Q?wmCJ9yqeRi/qphoTwUmZKResK7/UC+443mMNrEhHwZUvQ70M2chfz+PO5O?=
 =?iso-8859-1?Q?aQIkVSGKty0+oB7aehQE1rbtMfcElXdJAIaAI1iwoo05++4s2qsxbh62d6?=
 =?iso-8859-1?Q?MkSkyB1TBLOkZLjDwqDxdUj5yFW8mEsQKSKiD/JnHyrkaHpG5EGcuMUg6J?=
 =?iso-8859-1?Q?1i97d3BHho3OgWP8PjlNV/ydABjbUnwuqWnTHIQn9aDQXCRSqslQOVcikw?=
 =?iso-8859-1?Q?sHxsPDCLXnij2f4xYSzAoi6200PzW//9UcVpzsY/JQwAgLE/mHvknKS5P5?=
 =?iso-8859-1?Q?BPVLuU3QwMs2YtJuw8TOus0hH0B/nohBLv/zAvItSH8BmDr0ayg6rMp8yz?=
 =?iso-8859-1?Q?8kGjapc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Wng5J8mwdax6IIF/fPEBCvJtNitR4PwYpO8MegidwhOOmAcbX+0VeAE9Vu?=
 =?iso-8859-1?Q?aCObwyz5QOaWLpHkDOi6yIJgdeaKDl6QY7NDnGS31889JMSdLeHKwABRh7?=
 =?iso-8859-1?Q?qD/ubLg2ohnWba0XBHByX5XlqxJ6XRirk5r6aWv/Iso2SIIxJRacE5/9kq?=
 =?iso-8859-1?Q?kynvIXGC+UMkTLci3Zlb/vk0HODR+JWzMnP6wHrQxUxfvgQZrWkbxzKGji?=
 =?iso-8859-1?Q?WfNKSONmjO70zw2CxR084psbSkqfb9H7+rYzaoEwl/Ra1QFm9NaNRuKy/D?=
 =?iso-8859-1?Q?6Gvh1ACaFT8df1X3ctPjUcu7FQgPb+WkcErIsUnRMhEKeTT/OomE9JmRSU?=
 =?iso-8859-1?Q?8jJqW20Gzh7EJRMPYGcr9LqaG4QGJ3P25c6EFsesbDZoFvL/GJfRcE9jRk?=
 =?iso-8859-1?Q?T2PGMYT2xqvazR6jHVfkVu7LE52EqT8zqL19+LueV8jv4aaqnWdYhgBOgZ?=
 =?iso-8859-1?Q?EMArKV0///EYbcIjWvk4Zz0fsGyQqdqfCTq5Vs7Wly2caXBf7PtltvMNiP?=
 =?iso-8859-1?Q?0o2eNTJHVBs5hf4UOWcRaRz5tFUonySCpuGYKbLnlCnZhEAWYLPr3NX6xz?=
 =?iso-8859-1?Q?CQJk1iy85svjSMnnMR++iEZz1xScqyKfN1kpRX5SoNWMI4EHHCVF8dGUbX?=
 =?iso-8859-1?Q?O4RTfrsHhNjhez/9Ck+oY/wO4Brjzol3CGmffKsfN2j9riipXhzxIH78pj?=
 =?iso-8859-1?Q?BOwWy8KsPoK7t+6K1C9WZ3qrwekICphO8rGfxd5iVOqY8T/7F0rmLg6jNZ?=
 =?iso-8859-1?Q?MbkBJLPmgvFJzfwMDdkQBOQTFjWbXVlAe0qFurUb5nLa5j3ehHcrh2T8vp?=
 =?iso-8859-1?Q?PoHw/0ZL3PIo2h9yBaKyQQ0VD0lWnVxqx5IyLruMOwUf0UZHfDzY6yYLrq?=
 =?iso-8859-1?Q?ArklD3gpiqE6gm1sYPLKqchsHtiOudGPKHoCF7XM6maE5okSrW6ZIul2tL?=
 =?iso-8859-1?Q?bsMPEQIwjdAsm+ZbxAOb6duV98kovbFa8Sd+eoAAQgPAqnA0SkjSFc/AO0?=
 =?iso-8859-1?Q?ZNGae2RoL+p9XdJTn7bRWAEUrIbvtR9Rmm7yW0Z9sDC+/+92uWcFo58tNt?=
 =?iso-8859-1?Q?Rw91rwVm5tj4sc4LFtFm1q51Vhru1Gm8YsLDKzKmKVKEoiSuWnOkl4ASYE?=
 =?iso-8859-1?Q?HJuTY6+43A7/ir20u8BU0T6vRRPBh/gdFPpAVshDE6nKlQcN475idt+bz1?=
 =?iso-8859-1?Q?raBHZZvWRpUH0lx9ojtE9/2f1CTMEw2+beXlsO5fWyIXhkpOxXMs4v5+t5?=
 =?iso-8859-1?Q?xtbJggYXQq3RaApi6I6fWPQbc2T8DG1F3pyxffBYP5T14Gg0wh8udm2X7N?=
 =?iso-8859-1?Q?1HdwX9fWeCd9B8EH09/j90dO8FkcWNQnhhjAbIkGMyjdJI75HROhfizwQM?=
 =?iso-8859-1?Q?0yc5+A6kvs3WwUoIzKwQzHp0I0tCljx6oAEfyUMRXxyzwcJyr4uj7CPv7Z?=
 =?iso-8859-1?Q?RyXlKnfuMAAv6o8G5NcJQYhjY3eUonl881hKA0lWVXSAf7QpS0r9d7Tnal?=
 =?iso-8859-1?Q?jQtJ31XWXFVrMndAkgfk22Iv+kgmgRhLlxdA2P4zu/2CMifYNwLhWUy0o0?=
 =?iso-8859-1?Q?t2+ZXssLPOytcrTsi/+vXGK4au5QvPukY7z9lbzTSbV90kXjqNGAkiRehP?=
 =?iso-8859-1?Q?17jGX4NTdAoUhfej9UUyI5+bbMwvcvjznFqZh2MIvlIX1yomzYjcm9hA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47498684-2ecd-459d-f3dd-08ddd9b76fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 15:46:43.1399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WV4QJRAtyr9sM2B4mqzydwowqyQFdZhx9V8IZxlw1hlYJ3YKgMHqe4V0yeLpVhLPMTc2yftAdI4i3WUp0jsDeZhAEY1mhTIzI63IYhUx3LQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9348

The __div0() function never returns to its caller, causing a violation
of MISRA C Rule 2.1: "A project shall not contain unreachable code".
Add the `noreturn` attribute to fix this.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1980129839
---
 xen/arch/arm/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 445e7378dd..2bc3e1df04 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -172,7 +172,7 @@ void init_traps(void)
     isb();
 }
=20
-void asmlinkage __div0(void)
+void asmlinkage noreturn __div0(void)
 {
     printk("Division by zero in hypervisor.\n");
     BUG();
--=20
2.43.0

