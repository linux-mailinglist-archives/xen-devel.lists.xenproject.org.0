Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E87B4470B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110844.1459880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIc-0004tN-Fg; Thu, 04 Sep 2025 20:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110844.1459880; Thu, 04 Sep 2025 20:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIc-0004lj-9I; Thu, 04 Sep 2025 20:11:14 +0000
Received: by outflank-mailman (input) for mailman id 1110844;
 Thu, 04 Sep 2025 20:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9N-0005Me-6B
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:41 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8d7a7d0-89c9-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:01:40 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:38 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:38 +0000
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
X-Inumbo-ID: f8d7a7d0-89c9-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8CtVA3ikhWGidGWf+Defmzlw49+ayybGOn+0QQcCjxviKqgPSY58Xk92OKosdLY6exxyUbpukseqkqYusUDNNadzIi7H+smF46p7kr6LbhML5auBbqX68PLcGw6XzqYXlyjJvOLITUevv6Jgq+3Yr3yPsySNFg1yd2goDE/rTHMq/FD3EbnA/1ce50bAffCtW9wDfUlwcoydbK/pOZ+0rgyLXBtDdrdfU5lexrc81O7PeJmyROZjAfzRuIqwyyLPZ71FfdHArPYyCPd1glA/hVKkpcgt6FaZmCijoj9ym0WF/hiKn09n4Jyvhfn2ZAbpkcv7yi2YnHTJKzd18KLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVVaVjfnAm7dR2ZDj4Evcs3pc7jrZDaoUZKh2SDsNqk=;
 b=oKZcepzG2qQFkzecupw4khWpi9hM0epE9jjsOaLUeku74lhc0fkVVYcRpwj6smoZHShcDgDs1yFwlbC6XFo1jSl9hTqOenUxZSV5H4J8bweizsZmfHclpGE9hzHmB7d1JpExrFLxzTaCEiJi5Szn/dhaD4/yQ7OWTJmKc+P4AfoPT4S9+Z/X/c0ZJUK3B3xh0pRgOelQUqqySoCpFcedlyUJzN+faLpmAZ3GwO/b5NQdBRt1nA0gVjaECyB9ocoG3bfQb22z7bPfGWuKDOUbV0IuTEWms5/uHVotogqriPFSidWMrxtJVMniNja8gXiYQXbiegg3tDMLvSzjR1uaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVVaVjfnAm7dR2ZDj4Evcs3pc7jrZDaoUZKh2SDsNqk=;
 b=nBAqqO7QwyibApI+0YXmsctvYHbKd3gFH92aXuLxg4T5oXDzL9yksUUTTAepIS27AAOrweDbNb7gLrx9W/dNpJhwZHS4NHnF6xqvJkLbi8Ez3CRISeJJE0Q/ZGQ9DSstgadhDRIie7mwXQ6xOfdCg75PTGDA7g4KHsYtej9p1ceWS+F/UsFfvrJpVGp6qLM7wHewtGV+ta4EkTVwub2Pyo6RswzYFbdwlSPE22PMIZZkqgDKoIiIrcEXGJFTkSG3r3DiRrbvfEBoG5uTwCputVNeUKeoXYN6FtobAtYh3CRcEx5Dx0sFUhBWFZBZLwm05E5f/sDdSNGnnKPaA5xkxw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH v7 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcHda5M+j2hoU+tUCyZeWEwznwMA==
Date: Thu, 4 Sep 2025 20:01:38 +0000
Message-ID:
 <4a5c8a903c7b03716ea8c76b3e1dafd529a8684e.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 5a186009-ca7e-4c7b-af29-08ddebeddbd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MUGn3C54CYBZNcuhqD88gq9kEUv+R6osyJnlOejlsN60G55ugBR6ROJBCA?=
 =?iso-8859-1?Q?oM6bBTCKhs0YNNhpUBqHy/vPj12fv460DZojX4IiiNh8UKMzzqmD4YHcI1?=
 =?iso-8859-1?Q?VZzebuNVWSNCRnCl+DnzBVtLAmFKbDON9NUrSXSa3oxuPY14UEWD1LgpBu?=
 =?iso-8859-1?Q?sIRMYYDHXzbi/HPCJ0XE3Uo/HWcUI0LlCE6CQaD60T9kHFFLmr/aUoFF7o?=
 =?iso-8859-1?Q?tdsmaL75yQXirhhE2wk8EoMBiIxFbfKNbMNIdxTAaf2gAvJQoMPG+po58W?=
 =?iso-8859-1?Q?l9SLuGWDw7gExRjz8BIE7iLPYsHkASFRb0XrgcYHp7UC8Ty0spaX4/CEM+?=
 =?iso-8859-1?Q?ja8hL4kFAe3nAALWrCev6u4oyvH324kXBktMbM2waAxgFsAyEB4NFsRSes?=
 =?iso-8859-1?Q?GHAfJ3wGQGZmUPExpu/mULmQX7TgX2QAAoJmmDWgKZfAH6+fru4JZgTSFx?=
 =?iso-8859-1?Q?srFTyomXSuOq71V+soswuvPTklPN7JG1NZFCCJ0neYmBLBRC7fbciIVdaD?=
 =?iso-8859-1?Q?5CUgoSNLCcdaJ3DQM3vz3jKI47gTjsNvdtxbHXjQSM8c+doma4dWS4OA1G?=
 =?iso-8859-1?Q?xnFseOA+a/8LzwLAdOYwQZTL8ZTWVS2M8ShFbEwmBNiIovWXXfEqzrE530?=
 =?iso-8859-1?Q?UaB7UYUqF5bohWEbZQOyZGzP2y61i4hh77+hqf1+91zOrEwD/2ZNTmCNyh?=
 =?iso-8859-1?Q?B4UqO5+Ja0pLv3+PzRiYN1OLTk90eNfO28QhQ0VYRdGNtC9M1O9Yf9MTyQ?=
 =?iso-8859-1?Q?1XcrSAKwjcnaWfFKruGXsLbPrlHIRuB72nzYKV1E37Bl7zeqC5ZFYY9QQW?=
 =?iso-8859-1?Q?JH1tqkgxVmFydSJ5I2AeIMoWt2m5IKj35Wm6uZkE9NVRriBQ5MlSy7232G?=
 =?iso-8859-1?Q?+MxznFrQmtiThHoOpWCisZCsFDh7Iazriogujwn+wSbQL8RAVkZeHmIMSK?=
 =?iso-8859-1?Q?eweNkw6ggcdLGiTPkDQ2Tx/NThZraUm0JEF8f4ifPh0LmF7UBriPh9DRF1?=
 =?iso-8859-1?Q?qSTPWBhnpSh6+HGG2kG9R8dIkHXFVpBzXdwNB5wHS3hG2zeB7Xe3C3Wkf+?=
 =?iso-8859-1?Q?Ij8Xmui3NppPeC0Hk1KqR2A5ehmJRHPhkEeHI632W4i+YGQ5rrddrGsq1q?=
 =?iso-8859-1?Q?pfwFsAdRK4E9GRoNDe33gY8PaSrAmMKvj1y944S4947DFHxUs+nTIndJCb?=
 =?iso-8859-1?Q?2f0EHCKasSNasQuk56FlsuG4QMNhY0b6ErB0ppkvywZR2i2Y95UP8CKIGZ?=
 =?iso-8859-1?Q?z/bP1o5ROYFehYCDhwYgsm1BfZlV/BSzTXBV5RBQtwZ2GGfPufAf4fmWyR?=
 =?iso-8859-1?Q?OuBprGVdbYX3C7VFH4EaJLxhH1zWN9dIm5MDGyUKc4GmAOIxkhlC980GQr?=
 =?iso-8859-1?Q?ObYF5EA+IZXQy/pH4xqhgx6FUeY3rhev8InH3I8tC3ZyfaPw9rj0tWKnV4?=
 =?iso-8859-1?Q?rGoJ14KD7W2voY3PekhOZq9pGPbu8zQuCNvwXdTpc1hyKb2aGpmRVrJiiC?=
 =?iso-8859-1?Q?guVbMjEz5apG38O2Dp844JG29WROJlURd2LylGxXr3bw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Yx1aCgEMza9iMivl+XOfGTzLiFAJyN+8NDeM4SvHhCMozZENU4BcBqP4To?=
 =?iso-8859-1?Q?pYvnx0vSgTyrhNMz2G1qLzfNCi3AApPzsAYLWMUEe1LeLCkn3UkTvcQ0lT?=
 =?iso-8859-1?Q?f4jfQUD0rhPM+ZECzDqK4B5Nnjt+E/ix8q12/6t6fcDczGe+EI+qtRwcgy?=
 =?iso-8859-1?Q?RD4tOJ7tE1VrojMpWeDSjVzTU5EYp8W2yorP7y+dMtlnDiT0BlZefLMwqn?=
 =?iso-8859-1?Q?NjIh8qMdrPnWhv7nHwB41gVMSPizJRmRGm9nrBaKlGKdxAh9lEemMnEejD?=
 =?iso-8859-1?Q?pOOw/svPKaVjo31dqNdhBm2cx1oVT+icjxcXbTzh9CuKSiNsItkRn+8j35?=
 =?iso-8859-1?Q?8slFHZKtPWsnr80NW8MY8lytz8605CKlCVGRSTXvREmTsGxX4+3HjCi5I0?=
 =?iso-8859-1?Q?WHZc6VpbI6MTCvT/tq+HoBN1JL7eiz0uW37I/0B4u58FePnx13dZlA4zMX?=
 =?iso-8859-1?Q?AeYR5rldtETUI6jIM/qqDuKqKrBmB+1+djDclGSTkxm1IYb3ABbpOZIBg+?=
 =?iso-8859-1?Q?ljqi+nNwfbn5YA+Qft3oLxhnnycgPu+hM9X9kyK/n4MEByEpiNLC2usKK9?=
 =?iso-8859-1?Q?4ZFUlNO2HliThfB+JymTqPT6/LyjGf/4gbvbNINgc/0fG2GQleffSqMGVX?=
 =?iso-8859-1?Q?WJvB+BJaN727wkWWfQijuhF9rcGyqH0HyYeVqpjy/y0AbfrPgJeXpcqQWk?=
 =?iso-8859-1?Q?miplFhCCVITnBaQOjCv+zniJY6nrsgRJukUGKVythGEUZFOjN0UKSCl6HI?=
 =?iso-8859-1?Q?iEz7aapct1jXheG9eIwrJ+5KMpwjweYdyK+eKirL61NZcA2iiudn5MXuII?=
 =?iso-8859-1?Q?Q2zEWhKd+6IzZhh9RGb/kt30KMJnYqu+nc8B+qFDzBnWqsU6T2E+h0MfJj?=
 =?iso-8859-1?Q?lSiAbFT43zRzab5KCzFf8Aocy9IslWCwbobAMvzOD2WVWeZGtuHzhpG9oq?=
 =?iso-8859-1?Q?C3mNtWRZvhyLKxT9zTjLzCcT91z76rY5QbzeLW1t/GvgoXicI5UGbYzjlM?=
 =?iso-8859-1?Q?3DY1YBeTD55TWoLdGO2+SmUg4T9WOsdbrjgX6Utvu6dbsSiWACjPY8J/HS?=
 =?iso-8859-1?Q?1VKN7eqG6HZI8tZ3KnKDKpC3Pqhz/eYhi5WI5Wc35I8dl9XiYMg7aUpkNR?=
 =?iso-8859-1?Q?n8pLFcHFKqbNxA6rSogWILDcE63DbfJ9R34EkWXmCiluVRLSW/basIaZUj?=
 =?iso-8859-1?Q?JFrRsDbfymjb6ZnwlYR5lPS+1qEkahn4AZAH2J6OtmvJtFtohDtV+oRKlN?=
 =?iso-8859-1?Q?gnP9VRn4EKXbNFyNMhVyiaSgIRhNPmolEfaD7cV0XXCmqrA0FzqWnNbeY9?=
 =?iso-8859-1?Q?EluA/Dzeo5Hf9zHnnTYS4Lfr1CV9C2cyyM93G16aLXGLb4EJSlgLK1+fog?=
 =?iso-8859-1?Q?jDMeaqVAzY4+XvH5NqfRmFCT8syP3khtTPNJM9lcVIlDHyXw2mMBgVzkYG?=
 =?iso-8859-1?Q?ttE41e4ewVcquhKR0ogw62PcwIX6TZrdbrPkrVv7rbRhDRExZweBal3Zbd?=
 =?iso-8859-1?Q?oHt35ZJMh1OcM5Cps6r1bcW1LWiQ52/7EYRKfJFg+3Vvdymo7iKgqWEwST?=
 =?iso-8859-1?Q?4u663q+lsbUah6MPNffBAAAxLOMXVdLokuuzD4vOHsRHXoRafAQEM8xMsU?=
 =?iso-8859-1?Q?gMcAtoSDjUgA6ztfNAkgcSxrYdbqAGxqFMBPaw+8nd/m6uB2baApou/+GA?=
 =?iso-8859-1?Q?u9nJbzkSfUMO4k84pNQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a186009-ca7e-4c7b-af29-08ddebeddbd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:38.4314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rANL223sGaMFArN0HQNC/lRwT5LRA9R+9As0eIDRFRMGYA0zVhxN0gktlnPZKEocj/atw4CZ6679UEvZneJtCX2ZNB2CmY0u6pbc1YhOZGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

To properly deactivate physical eSPI routed to a domain and allow them to
be retriggered after the initial trigger, the LR needs to be updated. The
current implementation ignores interrupts outside the range specified by
the mask 0x3FF, which only covers IRQ numbers up to 1023. To enable
processing of eSPI interrupts, this patch updates the mask to 0x1FFF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V7:
- added reviewed-by from Volodymyr Babchuk

Changes in V6:
- updated mask to 0x1fff to avoid confusion
- updated commit message
- removed reviewed-by as new changes requires additional confirmation
  from reviewers

Changes in V5:
- no changes

Changes in V4:
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- remove unnecessary CONFIG_GICV3_ESPI ifdef guard
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 3370b4cd52..c373b94d19 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -211,7 +211,7 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
-#define ICH_LR_PHYSICAL_MASK         0x3ff
+#define ICH_LR_PHYSICAL_MASK         0x1fff
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

