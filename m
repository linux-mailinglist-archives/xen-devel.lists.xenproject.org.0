Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52CB0A062
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048348.1418572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci4L-0002hO-6u; Fri, 18 Jul 2025 10:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048348.1418572; Fri, 18 Jul 2025 10:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci4L-0002c9-0j; Fri, 18 Jul 2025 10:11:57 +0000
Received: by outflank-mailman (input) for mailman id 1048348;
 Fri, 18 Jul 2025 10:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34x3=Z7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uci4J-0002Zf-IT
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:11:55 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15277b2-63bf-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 12:11:54 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7670.eurprd03.prod.outlook.com (2603:10a6:20b:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:11:50 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 10:11:50 +0000
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
X-Inumbo-ID: a15277b2-63bf-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsPTjarWQWi91SWgoqhycV0pvT18Izi0GXjPinDCx48k/Mf0Dxo767m7NYrqSyTPcconRJ0RKVE1jenDOp1c42ySqRloup7nkGJgajxQUxWX6NHxOn8ShTVexeEiDwT8Q9vdxz95PhaC8UT4QaUPaNkpSr0Vs/Yy6YIsuw7YosYboN0OVdj9FFUWiKFaL8bHke3vCSnq6k4r9TNQaDxF2KJ3WekNPBWM0ojBoIERPt2Y4PMqBwWrzdHF1/hcN+QN8D2lpRaF9wJMx8yK+GFufxjH6VPUOHGF9xgiUkC+g9cQuXdLiPFepG/SYjBf8kBZuT9pAiTfBrIkug0fPcRSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/QS4SYrOQ8+/Pp3lF5IcA+CjFOUSBXpzliLqQXJMTE=;
 b=ds7DPGxaVCg/XlNFuWfg+N5eMF3QcpuO8KarJYIwxK2/fx/VC3w9SHA+sVHNTPJmIppWGifedEOcbvsmrbfvCdHm3nf45zEs+VwMHIDEecwzzRZUofKZTRffaBNQ8ro6ndbKLI025pzZZKOu9oewR8r5uw0Q6lXmvgtMalkTPh3he+ws2W077b6JISddl2x8BJd1d4wqSKa3PDgwaLs9LxGSNyVSquaK9ZrGcBdY8MND5OPZDIip8t3my/3NAVVExl4zIeOlv35piDvzeZo4SN+Iix43YXCLohouPFw7BPKA2hysGiopY1kskHt1yTJxfoAVttrMBenwCmxJmbIDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/QS4SYrOQ8+/Pp3lF5IcA+CjFOUSBXpzliLqQXJMTE=;
 b=scxJtproETcBv864cl3qMtlPfG1Qx+eznD9WAmfjibt6YLQ401sKxP8/WLIePEqS1fLzVhUbGcTA/FXto+QfoIPh6ZDnoceQ478hTIPb+rR48JEG5/+p7ynABsBdFtu7Ow4GwtsXY9WdUB/ktfW0GIezDEsTuzEa0hho5CzogvSnlsTTh1ZxYK44WMa0/f2WNl4R1y1JGGt/t3GorGTbQ3zRUcdk7NqUqmnMvJrJBJMFY9Yw6xVb+Ym0D/AJ90SgYUgAntNKDvwgJLMOT4CzJK4MOtGoM74G+UMIGGj7MtYC1G2AU58nYN9vr6CiemUAyh3SOMOJBMa5KWVj3vPPgA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar
 Halder <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
Thread-Topic: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
Thread-Index: AQHb98xgXEjYq4ZtG0GeJYJst0IW+g==
Date: Fri, 18 Jul 2025 10:11:50 +0000
Message-ID: <20250718101149.3107110-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB7670:EE_
x-ms-office365-filtering-correlation-id: 95ea5ade-32d6-4359-617d-08ddc5e38329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QnhmyFHJIRAOKGXSiTeEoLJbtOycjNYCRgFBlMBPYyFrI0GbpTZ3GYQpIF?=
 =?iso-8859-1?Q?tGPfteyuDdxZCs2FX5zkjSsVt2aY97jPv8TXQ2k0yL6tnVCIYg3OiY7CDO?=
 =?iso-8859-1?Q?oIDDhsncLiZCaQpuJhcZdH6cdRa5WGBuZ4EteF90VPaxf+VGx1tqe9K0Fk?=
 =?iso-8859-1?Q?PXLvezz9tVILsoSQ4qDptnTvJA6u5026Ej0rV5eps0k6ISTwHmDMfjnqGS?=
 =?iso-8859-1?Q?r4rbo86rXoWQHr+gKc/oNm0DgIFTwGUX1XFSyETW7GUotUs9GxSi/EguPp?=
 =?iso-8859-1?Q?B4r5S5qYRVqX6XQI2g0ApjrIzix4qrKM2TJDe+R16PTAL0GetsJ1FdsBgi?=
 =?iso-8859-1?Q?ig5MzpZQz9FqLwkgA8MEOUQybnljf/g/DSx4WhbMrrjh2hYF7pTRin1fle?=
 =?iso-8859-1?Q?EOWggVNRAlSCcSvHliitHzG2S4MDf3IegJLR+GSUSNNdyUauIxw6M3+We/?=
 =?iso-8859-1?Q?ubwPQSLwEK20gjAUUOEpF8Z9QySa+bbxOgkdLTNz6lx/oDOOAvsQ8p5q/P?=
 =?iso-8859-1?Q?067GTSVtq/eotxpclRm/DEmXx7NMJegd8Cv/XJSvbFo/Ai/KP/AZYey2pp?=
 =?iso-8859-1?Q?1P+166E2zCNB/mTRxBofHBO7cGJyV0UUSfY4k2jVHOLsImtqbWiZpzFlD+?=
 =?iso-8859-1?Q?ttGJ6Zmzcn5w10tWNQNM1TsCu0SYltUaZKu4pK+SAkEyD9SICMCOf+okEX?=
 =?iso-8859-1?Q?Sr8EgoKT7aYs7mUQKrvVqZpfJA7Rd3m1IWQUnXwG1vuOI6IHC1kP6TSxbA?=
 =?iso-8859-1?Q?WXBFvbqKR4cZxEBQ4aev6oIfYBRor8mze8aDTvgn7NmzN4k6rY/kwUoA7r?=
 =?iso-8859-1?Q?s7mIkmTRE+Id6AKxh/dpoVhDIUsNXvhzp5PpKEa+jcSlWtTCjMfpK/xC4p?=
 =?iso-8859-1?Q?mrvgCzdgsUgNUmAWGmXeFL3KGMleT0O3J4CGqydMaaIOmV+90K2G1buVup?=
 =?iso-8859-1?Q?ePBRJ6FuwhavcLdzE9ZyeaUqrpIwve2c1PDEPOK0hX04xKqTenFdGp1O1b?=
 =?iso-8859-1?Q?WNK4L0ToQR21SRf28LiynCF61W5TDXhKcFP9BAlgTwmB9pq1CwdlDBYaaA?=
 =?iso-8859-1?Q?DSsqIHCz2cMLfSfqRfFw5DzkOBCmKECVsJTyAawXMEVL5D7Ea/D64xG44K?=
 =?iso-8859-1?Q?bIsaei7Iu/1Lymb+tpzJrROp8iwR7Xe8Zj7nKa+8+26kcwPv4oNNM5k/Mi?=
 =?iso-8859-1?Q?pmxHzdb04e0/DSsyEwYHBygPiAxwCCRwftiak3ZYKQxwdQQzPDAoR3sIf+?=
 =?iso-8859-1?Q?CxYwnHUDOo9q2b4/Cf0/hCXiY+vlX0qTY3LJ1g3WhDkeGvv/mefRZJY/C8?=
 =?iso-8859-1?Q?66T/HGlUtHXF7AeW9TcXk2Y+CqQkT6hDzxDvvyxPE1FDCqW65q5ILqKxVp?=
 =?iso-8859-1?Q?dZdYpOFW+63x9gmiAm6Rto+FglAEX7kB+5+oSKQq3Xwvtuf07tZGZE1Jaf?=
 =?iso-8859-1?Q?CAQaqofyCXI+DybzzwON/LX6B/JhtSAtolxUJEOzfaoAcktCO5ZP/oP6Jh?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eFcB+NDFHXHhsSUYpZbMjNS/wp0PmB7IL5PW5BZmKU9ztAFiTwZHya/8M5?=
 =?iso-8859-1?Q?1cx9wGaVYrdPHM6yZ7J5xhvIELCwrsxE2Dlw7ZFq8ZvSnNXeFhZBuk7CrI?=
 =?iso-8859-1?Q?cxoqpDJoEzgcHjF34E0UpK5rdFOMHpFkz2yiQVXIH5fLkuAJLbnt2lAzIW?=
 =?iso-8859-1?Q?cR9B5KOx8toygQRMVnUMreHimunNXbyF7LpurhaFv4Hl8/5PLhGP0pGDbc?=
 =?iso-8859-1?Q?8+izhZiZ26nt6r4ixyu60mOgwR/n+FeAYv1vKZzrJJLCRxM+EagMpT5LC9?=
 =?iso-8859-1?Q?0rwK7AyM4bipPYZDcUG5GZCOCxkd+mkOeHfptNQrMtl+rv1op/QV7RueCt?=
 =?iso-8859-1?Q?/t90ECgXwms4qoRaSfLygwG4VHZbH9YG558nRTC8StMkU94PWcZSrOD9Gi?=
 =?iso-8859-1?Q?Pm9td3HrPy/o0cw5MykMH0qcRa+TPRbOCVgvLR3O5H8IofpCWF6opLP4Oi?=
 =?iso-8859-1?Q?4AXmkkwytXTSvJBQR2KwSveHEBIzRsAvn9wwxf+8ls4LufYq0lAoWxSn6b?=
 =?iso-8859-1?Q?BjxbPIEEn5Foq7Og5qphk7A2UMB2n4ylC3NuTAJE6bp/FIDnemdQ1n/hhs?=
 =?iso-8859-1?Q?SwIBEvnVk3T+BCtm9cdM9F7qYIwwVNzCEWYhKN7Pcdmq4pLH4qooOqwKKD?=
 =?iso-8859-1?Q?Ph+FpbTjjM3sexwrv5BKf0bzDHSI+AIYJsYrOLyii7PfC29WE/SoD+tJxD?=
 =?iso-8859-1?Q?W/ZJ8Zp/BkvdY7uDgUcGdySe+cwiC++Kam8WTFYmhLKpJKZqM/D84imE1C?=
 =?iso-8859-1?Q?vsr0WWxyrn3ETQ9mmr1n6ObS3TSPSapPoMI/a2OskT+qcPYLdDxxunYpVz?=
 =?iso-8859-1?Q?n5tw03ZK3d1DT0573QiQ4BlgcW4REM2Y8RWPeyGq34bVuern2Ut8ZrnNux?=
 =?iso-8859-1?Q?FG1icw1+db+SQx6CJoQk/qkm5u2IC3533OEaXfYsb+UQDONJspatUxbogf?=
 =?iso-8859-1?Q?Q8XUrkqchE9quo2tYvM4RZPzWZ/J7eEx2efiZKR9R+eHChc4V8CTy+/dfv?=
 =?iso-8859-1?Q?i+9d9C+CGDF9z2T0HyUNo/Y8BBVFG2hLNqqtg1Z90aRk4KAXCFNtlueHHV?=
 =?iso-8859-1?Q?iezu0uj4aJoaeS6WCPr2MW/q9bVtZuLOUz1WA+I6BiY3e9UER6Ui3Q6sb8?=
 =?iso-8859-1?Q?BykcJX5fuOx7FtqW7VVl22iQL7wDfgdXSGh5BEK2dW4t7fceFM/+v5BRmZ?=
 =?iso-8859-1?Q?5ovzDrOtN4OnsVdOOWYOBB18fnjReyfsKHLOzb8r/3wKMB8Lg/f+f+VML7?=
 =?iso-8859-1?Q?O57LjtmkeYM1lyb6WgdNDYDvtZX81PlovYcF0V/8mYqqeciHvRXOanHv2l?=
 =?iso-8859-1?Q?5Jt1kX/eX1Im29tAPsIhPfhtEeIKU63sDJokcAW+RktwZPER06KWqe3f/R?=
 =?iso-8859-1?Q?v7DriOXhivmdkmT1ZYyv5N75aNyV5XXCC/esuqXuZhhvKCNhKt1OKfdkmQ?=
 =?iso-8859-1?Q?qMTZrD/0KAifzhl1KFX6ZsZa/wIxaEZigfTjmVAaIB6zOVKBEdxE/dkAwY?=
 =?iso-8859-1?Q?Mzk1F4hPWk3iTQUObcDa8LhLFLRnfRz3KBP8gdgVxYrS4khTGvayGSzraR?=
 =?iso-8859-1?Q?VaQY7+c4VJ61e9+odxWrWIcSQMVpXmvxz/SKCSYKzcKxV+yG9dHB+i6lPV?=
 =?iso-8859-1?Q?96O3POlXM22TpsBnPSz8F8J2+rob61bawxQDlRYJV0BtZnmHYE7ZuiKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ea5ade-32d6-4359-617d-08ddc5e38329
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 10:11:50.5187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zzqBTDs15RgjP0HWwj9ufAK7V5eRJvKxPH3cCP2CzChWEPlE5Gjj7xVPEQZyuOYP8c+sfIwSx0Jn/1UE9LFV95yxqN5SpLLhFf78XtnBr4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7670

From: Grygorii Strashko <grygorii_strashko@epam.com>

On platforms without PIRQ support evtchn_move_pirqs()/send_guest_pirq()
functions are unreachable (Misra rule 2.1).

Move these function under CONFIG_HAS_PIRQ ifdefs to fix Misra rule 2.1
violation and resolve call of evtchn_move_pirqs() from common /sched/core.c
vcpu_move_irqs() code by moving evtchn_move_pirqs() into x86
arch_move_irqs() callback (which is converted to define).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- functions fully moved under idefs
- evtchn_move_pirqs() call moved in x86 arch code

v1: https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01207.h=
tml
 xen/arch/x86/include/asm/irq.h | 2 +-
 xen/common/event_channel.c     | 5 ++++-
 xen/common/sched/core.c        | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.=
h
index 3c73073b71b3..8c81f66434a8 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -224,7 +224,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
=20
 bool cpu_has_pending_apic_eoi(void);
=20
-static inline void arch_move_irqs(struct vcpu *v) { }
+#define arch_move_irqs(v) evtchn_move_pirqs(v)
=20
 struct msi_info;
 int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c8c1bfa615df..aa5cf41a8d6d 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -970,6 +970,7 @@ void send_guest_domain_virq(struct domain *d, uint32_t =
virq)
     read_unlock_irqrestore(&v->virq_lock, flags);
 }
=20
+#ifdef CONFIG_HAS_PIRQ
 void send_guest_pirq(struct domain *d, const struct pirq *pirq)
 {
     int port;
@@ -994,6 +995,7 @@ void send_guest_pirq(struct domain *d, const struct pir=
q *pirq)
         evtchn_read_unlock(chn);
     }
 }
+#endif /* CONFIG_HAS_PIRQ */
=20
 static DEFINE_SPINLOCK(global_virq_handlers_lock);
=20
@@ -1707,6 +1709,7 @@ void evtchn_destroy_final(struct domain *d)
 }
=20
=20
+#ifdef CONFIG_HAS_PIRQ
 void evtchn_move_pirqs(struct vcpu *v)
 {
     struct domain *d =3D v->domain;
@@ -1722,7 +1725,7 @@ void evtchn_move_pirqs(struct vcpu *v)
     }
     read_unlock(&d->event_lock);
 }
-
+#endif /* CONFIG_HAS_PIRQ */
=20
 static void domain_dump_evtchn_info(struct domain *d)
 {
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 13fdf57e57b9..ad6032fb2865 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -642,7 +642,6 @@ int sched_init_vcpu(struct vcpu *v)
 static void vcpu_move_irqs(struct vcpu *v)
 {
     arch_move_irqs(v);
-    evtchn_move_pirqs(v);
 }
=20
 static void sched_move_irqs(const struct sched_unit *unit)
--=20
2.34.1

