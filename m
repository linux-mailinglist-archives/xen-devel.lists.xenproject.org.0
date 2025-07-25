Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCD6B1200E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057931.1425638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLm-0007UZ-2w; Fri, 25 Jul 2025 14:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057931.1425638; Fri, 25 Jul 2025 14:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLl-0007RN-VA; Fri, 25 Jul 2025 14:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1057931;
 Fri, 25 Jul 2025 14:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGu/=2G=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ufJLk-0006kC-Ct
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:24:40 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18e5f7e2-6963-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 16:24:39 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7421.eurprd03.prod.outlook.com
 (2603:10a6:102:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:24:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:24:33 +0000
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
X-Inumbo-ID: 18e5f7e2-6963-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV5uiZJrruc6giti5NfN7aXPY6nxEqyjSj8ksgLya6Ysz2bjGcvaio9tegSFYk5KGUr/lwRitSGVHQIchSyfM5/EIvwdTpXwqw3Srs0EbIVOj3+PsTfsG6aPkLAIq+0exWSNWcSzRwGAJ5mKEHRQQOAtfQZT68wFDYOj/+GOb9ExnTOMTCUhhd+X6i38EeFszYbRUUnk7PTfFwkeNQF3sLFUA5xwxqHpj4afi7fn2e8khABduM+zJq76ZszI2O/vZVKonMongRhRZZUDAvgnvmpaQKzV73XPjdIZkRzMJ6R/hpp1kiyPXjM+P77/lRlgm5HgYyEaQrxnQjOjFH0ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIQLJudvS0iGvsbes6lTN6/xCz1ojow732/uGj/xOVU=;
 b=ayF9ssHGfInNsv87QIXi25L442KRK2PBT+Q4Bo4A8xhe3pKgAUlpFW6QdOlOUvsvtGyNuUR/+98w338qplQu38ksDWzcW210bcgfPotVBMM+ui+jBvgI7rG+1T/dFYY66FYb+iPJheJMJ8B7PqCZY/0M6Ae8qCgVC/k+ZrcjgIqyG5mmmIMdruOap0WCMAqRInO1/JqdPaMIj3PJQolWBEKTQlQuFWu1s+cYqoNm+74mMzinvD8+8pmw/mY/xOn06fFJkjJ0B+UV4sCnTX6qDVEUdwC+tjrslP/JW+5YjaVICsQHyEKPAp+ZJvBcQ1w3SPIi2fFuC4Er/O48sJcjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIQLJudvS0iGvsbes6lTN6/xCz1ojow732/uGj/xOVU=;
 b=qX/6IQSwasNpctMwrlE1sURjb3+iTEi1dW9Y9YtWmdg9WaPJCnBm4nvLzmbdt/wkxXoD1ZZj7e67bEXyu4hYQGGXTBkdplTTnge7/zI4S8X2wDjWgTPuRU1cziKb7e3edDwd7sKmR5MEVEZYvFOcuASkAYEle5K96zKeGODakEqNzK/PbCCDXtoz8AbldrpYVlWavHWKA/PGh8FcjdeO5x1YmSPsFLcPtfQSt9i4BzfPBybbyIIEdTRIUvV94FR/WslJj4sSCc/j83OxJ/2OTROigpHsIqT+Pvr4iJX4AGwy4pI6DR/S+75KtnGsbp86IP6PQuQoGIXGggxGxskyQA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v1 3/6] vpci: rename and export vpci_bar_add_rangeset
Thread-Topic: [PATCH v1 3/6] vpci: rename and export vpci_bar_add_rangeset
Thread-Index: AQHb/W/XjlJXEWa6DE2pU6XZEEu7zw==
Date: Fri, 25 Jul 2025 14:24:32 +0000
Message-ID:
 <2c7999d1186738a9f57364f127b9fbbbd440ca78.1753450965.git.mykyta_poturai@epam.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753450965.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: bfd750f6-17d4-45ba-7e72-08ddcb86f9c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?G3dohrMkJLSDNNj50NbRpEaN1FAVSPWXmaWG+icUh+FuDmYiYqqEFgyq1r?=
 =?iso-8859-1?Q?FN14JopF5tuBwOrNTnqP+d1hwL3PLXhrSK4Ln5BFjvVTcEiQGtHckY8EO1?=
 =?iso-8859-1?Q?HHeMt5XYTG3y/ycu2orjylXS9PkGUi2JOJdldsMm1kNdtEffVqSyCd0eGn?=
 =?iso-8859-1?Q?ob4zlRI0jG5kvnM84BlUml4HYRG2jfygjJiE1og7LOevFkrWu9pOun33La?=
 =?iso-8859-1?Q?GHclJgsV0VHavoi/1V8wafd2Rtg5BxhuI9NTN4w9Q2hDUs0/9fYL/mm/yx?=
 =?iso-8859-1?Q?mpsyzhi61Vu01cMsSH5SRDiZKOQRzXbhg6wgxEoRtynHx0mFV8eje5lSeW?=
 =?iso-8859-1?Q?gJ5tFX2EoXtVulvtnYrcwjInaIKuCeSGP0otz8dD6Ch8A+2aaMfvlVdTkn?=
 =?iso-8859-1?Q?JQSSAYdM8fL0cHHCTl8Dr0nCxXSR8/rk6qZ0Q2TVsMZ5v/O4Rr47WZ346O?=
 =?iso-8859-1?Q?b9uXR38MAQqTXWAPnEKrz8pl3qYJ/qzL77HpY22W6LUosE67ITdhL3Wr4i?=
 =?iso-8859-1?Q?epY45QmeePOd8PtVjmo1uvC+Ri/EC0ultPhIeYScwdGx3rd8FDxErrtJoa?=
 =?iso-8859-1?Q?GioZ8Rf34b9Q4GZIGcB12xj8vCu2fHCkRQEgpO9podkgL5apR3FS2Kk9Rr?=
 =?iso-8859-1?Q?yOX/77kcVI5y0a/j7snQ1h8XQ0rF6ieU26RLTQNEZMStGxApb8epQ/3Wbw?=
 =?iso-8859-1?Q?pdlEP/KxWntvBtosae162YWHEMh+DbTxqKyQe0XamNTK4pn5HqlUqU70t7?=
 =?iso-8859-1?Q?SFGOIOcooLpXDSnNEw0WLkjzhfn7SpcSJx0JjNpuWyyz6BytIgjtZd/GCf?=
 =?iso-8859-1?Q?XLuI7/yjZQt1NEjDA5VqZSCu6O49zLsgSU8rrWvCs871gGvHVT78O/IP4Y?=
 =?iso-8859-1?Q?jN0SRgRBjdiY8tnFhYB0Tl+7Dn6hMuGfinQir3k76OmpQC/zfNTtpRpTkG?=
 =?iso-8859-1?Q?mTXuGW6bJEi8BPDkoRUBwYAHiRH6a2TODDWq6IoN9j1LeLCfMu6cB4jp/N?=
 =?iso-8859-1?Q?DBhKE2lUMmHRB4fzFKlKIClSyWFKQO4+QgMP4EqBFddLvavrnt3XkKmngi?=
 =?iso-8859-1?Q?V7S6+5cqgQgtSGZLxTHdulnK3gp1fwWugRxLtK0AOLRU0huxV+mlLMGB5U?=
 =?iso-8859-1?Q?xgv93aXvT8xogHYL8WdqKjvKM9g59dHyKgKMp7kZCrQ2sFa7fCEzH/0wd6?=
 =?iso-8859-1?Q?NbPJpcaxRQCrWfE8+NDEO/AzXpIhEtUTIvOKAML8ljGyW8qOgcM5qN/Mhx?=
 =?iso-8859-1?Q?J3XdY0r2ZXfBhr680c4ICcVqeNxrgozcTqOOD0sxNsVQOBhgxdmDB4LTh5?=
 =?iso-8859-1?Q?IWo2LBQH6NP0s2iFcLn1sDWHRPvvwQKUSR5IJtqXT36w6A+Wl2GH0SmR7l?=
 =?iso-8859-1?Q?3f1PDei4c30859Gg9pjbWd0AU+wCikLDud2Cl0gWOkGgHxKXR3U7dyPCgE?=
 =?iso-8859-1?Q?9lgW7GWXlmLme4ZQxiXHXMUSfo7IvXdMigx34SnHNBzaanuj2sDUu44iIH?=
 =?iso-8859-1?Q?9LTJ4gDO7jNe8AiVke8Tns/Asp80dE36GB7YunstlF/Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?J2wj+zwHbeodHXD24MQTcR56Yh+uVji2qJP46zJbWEInMHaAT73pX145W9?=
 =?iso-8859-1?Q?sYrJwNh1xlXpF4GGt1jwbM2ktISgyByLH+toxztL68pnvGbkRhCzYBbyYD?=
 =?iso-8859-1?Q?PRtOofztiX60ID/FU1I6Ps68+AUynfEwiu/l98bL0gLVbaSDrrqCf5l1sb?=
 =?iso-8859-1?Q?7c5zJ59vQnruRafJSvziEQLqvoUZ8JLDfpanaikEpC6J7TplcChq9M86qV?=
 =?iso-8859-1?Q?tjAhAftcN+6c4ss9c/g83JY0i9hcveb6zWg43dqj9WlzMM3eqUC6nYLdJq?=
 =?iso-8859-1?Q?q2MvY8KobwdGb7IMaxnajeT2TwPKmkmTZ/mdsNdOzqKYbE45CScmD3L+w9?=
 =?iso-8859-1?Q?/lOGXHnGIbRR4kacfs7SWEMr047ss4livgrw+UoyOmMoDiAVDuSwEaDiRB?=
 =?iso-8859-1?Q?9DtxwQsSDGj8BhXyBEmVM7t8XwdPNLPsIvwZv7yUWIGX7Og97quGIeZPIU?=
 =?iso-8859-1?Q?FJaavsM/0fBZhAZxOj+78KAeAGjDTcurrl5j+IY6JeUweai7J2ktFqOXEn?=
 =?iso-8859-1?Q?NF6BwJrX/GtSGq0ijjOIbb+xgS84fqIDme6K/QHGoYwYcCt1zHWW87wyCS?=
 =?iso-8859-1?Q?16qxMp4Sc+CLXkLDL7K/6z2NZQBpZINLxMUvmpKJW7MaUnjeFrV/+7W1xk?=
 =?iso-8859-1?Q?DcgpRR8PM2Ri1MRgSiSCwIKaK/8t+FzKt5iUdz6wpT1dQUa8FXfAZR52/w?=
 =?iso-8859-1?Q?fjMUB6UdlREGSsbXXYkGungbia0PWzPMivzz1ms+2qNqO02WHkyVR45U9x?=
 =?iso-8859-1?Q?JO2UrwSWFk9kj0YHVcQHfbU6lGfcMUer9VvvZ9JCQZT5BjulcZ+ICPAoz2?=
 =?iso-8859-1?Q?Yr2er96HFngn3eUGWE1b9iMP0cB9Td5344TVydENCY/T/Cpft/NuZlpGqY?=
 =?iso-8859-1?Q?TGMcvVG/kpg4pZooh/BlKtySZtnPZ18U116UKeNZkDoK3rB0baW5xvqU29?=
 =?iso-8859-1?Q?y+S3IG7QBEgFr9NoiNLQy3YMNGClLqgujpk/n3HCIu/GuQ6WBIyXDi3I3+?=
 =?iso-8859-1?Q?uGvamWGzU0q2Q0sdUt+jcAtrwGpl1924RzYvO8hD4/ESOm6qhOx1bvZ7Mj?=
 =?iso-8859-1?Q?9ANwYVSOevqaa7sL7Cd/xlu00oeMdSCWs/p7gPi5kx1Uwt98Zx7IxURalF?=
 =?iso-8859-1?Q?1AB15yr0U72f4LMAkhql/DTY4WQFejXFP49TCwoPh9zdpDl53g3g9V1dwa?=
 =?iso-8859-1?Q?tUWy+y0wIj8SG0qhslcrHzIC5SW1p1DAfe6jW4h484QI3MRdvGtMqVUSNK?=
 =?iso-8859-1?Q?kpRqogekabb9KZ8zs1j6wjen0r4k2kT1+vzSMYwScZanAf7jL+xIzZ1LPp?=
 =?iso-8859-1?Q?nENIeaVxu2CBc2QJftaS4ISrhMjV0ts/bTTH2D+UPv08cdelJdBvHK4CZq?=
 =?iso-8859-1?Q?EjbEeie2JEiZF5WqD7r80SuM3yfLMp7NjVFaH6utZAfza8O4aPTig5WBD2?=
 =?iso-8859-1?Q?upSwMCpMVxE7ImBTR/DJxvAqdxii2KmoUFUUu/vrO9qmoe5wg+ELtXJ7Dc?=
 =?iso-8859-1?Q?gzstkZsatZP9HWdKbNFRTpictNdRC0GJ7nSmW8OZ8n8ltwo0cbjSelqbMp?=
 =?iso-8859-1?Q?ISDkbzi22mgq/Oi4f6xX0722wogYlp+POXwZCwvD9WtqWwNE6bzpxjnTck?=
 =?iso-8859-1?Q?8y399D0DmWd1iKE/ZbetQi216Rp6bkdji3FQBTc1FZTlHFck3oOg8hzg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd750f6-17d4-45ba-7e72-08ddcb86f9c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:24:32.8687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CkeH0G1s4FTUAANrJrIn97uChNQiXMaTWFGjmdr1qOtz4G0B2cyFLA7AfC78dRLKh66j9D0Mgz+uT5L9MyPxiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7421

Export functions required for SR-IOV support.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/vpci/header.c | 8 ++++----
 xen/include/xen/vpci.h    | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f33fb27bde..f947f652cd 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -733,8 +733,8 @@ static void cf_check rom_write(
     }
 }
=20
-static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *b=
ar,
-                            unsigned int i)
+int vpci_bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar=
,
+                          unsigned int i)
 {
     char str[32];
=20
@@ -950,7 +950,7 @@ static int cf_check init_header(struct pci_dev *pdev)
         else
             bars[i].type =3D VPCI_BAR_MEM32;
=20
-        rc =3D bar_add_rangeset(pdev, &bars[i], i);
+        rc =3D vpci_bar_add_rangeset(pdev, &bars[i], i);
         if ( rc )
             goto fail;
=20
@@ -1009,7 +1009,7 @@ static int cf_check init_header(struct pci_dev *pdev)
             rom->type =3D VPCI_BAR_EMPTY;
         else
         {
-            rc =3D bar_add_rangeset(pdev, rom, num_bars);
+            rc =3D vpci_bar_add_rangeset(pdev, rom, num_bars);
             if ( rc )
                 goto fail;
         }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0f0f321023..06f7039f20 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -294,6 +294,8 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, =
unsigned int len,
=20
 /* Map/unmap the BARs of a vPCI device. */
 int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly);
+int vpci_bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar=
,
+                            unsigned int i);
=20
 #endif /* __XEN__ */
=20
--=20
2.34.1

