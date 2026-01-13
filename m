Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602ED175CF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201204.1516882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa21-0003HS-Sc; Tue, 13 Jan 2026 08:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201204.1516882; Tue, 13 Jan 2026 08:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa21-0003Ds-PF; Tue, 13 Jan 2026 08:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1201204;
 Tue, 13 Jan 2026 08:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCXa=7S=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vfa20-0003C7-Jw
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:45:40 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c5d379f-f05c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:45:39 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8709.eurprd03.prod.outlook.com
 (2603:10a6:150:93::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 08:45:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:45:34 +0000
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
X-Inumbo-ID: 3c5d379f-f05c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ypizxbr9KlA+Zq9DFI2qYw89EvG7F2bIF5rKWMqP3VidpxpqSkyYSoCtJC3szlLISU7BicAKzUab+6cqAVrKiHBzGGlmpoul9L0pngoSfD2vDg59+gj7HBpWzJJRUpHAz9n2Vx2iHOxDQTdeb/4m3giEG86spbaTZmOS8JX+1ypr7GpjdYbiLoE5dmY72wEmJtBgX/FfuYiSZV/0AtoBliyhZyeO0NuEFUfrJ525FkT3sYRNJVaYG7VoFn1j7pPPqLSHE9jLp45ORfFggIMcfYVYv7LwGuB7LODr22bSp8FpY6OpNc+TS7O7hgGHuQsBKnB+vt9pIG+Z9KAJCSxIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iajnySkeHDY98iHHfq/Pdiht495trLBHcrNlpd8yI4=;
 b=D/1L+154ZlsVkafhb1gryXt8XBN9Ssmfa6DkTLhU3Z5+FPDSHQiG8o9LKSGKYFumDghYNz9wXbRUvdHYWplEtDN7cmYP/xcojy203tMNuwQRpDqYT0V99zxJFZ0zBKzdjdeEH3vtg29WRYdj2J8EBUcNFYIqvBNn/v2t+C4LJMCl7ZLOjyu5ejZrziTYf7MWqaNqpKCMckuT4PVfZaoVYimnz33sLyhqRDnx3eTlUy6V0fbCBh4NEcraVzncI6EoKAGtXTiQai+x3xBoed/SR+msg4Wlka2thKXGRUjq0NQKfOsshHgazvq5I/OaqzhqxJH+XhPUUMUr3b4de25qGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iajnySkeHDY98iHHfq/Pdiht495trLBHcrNlpd8yI4=;
 b=Fzd4Dit2PzwL85jpwEjL6jIv+EX60T6acR3HJXZb3Cl5mM3ZzvKf+X4/NnuZC7RraK9CnIHOa7qBICRQnvPVXOhjhBOOAdsNXaiMn/BYPgvZMHxbVZBKnWlAtWqSAAv7r4hQitpY+E/52uSqguRUFGUrdWu7qJnN72p/f92PdS6a6Pw46cBzPfAFHQ+rq7Dom0v7zEKIPjxDblraNuTMvGXYjdIfNF5u0rSNJGt3qTAVWpKP21+s1o9PA84djUsMHYgx71rvSlbEtyFyHds7lsQnbOP7fEgFr1BSsF/uugj5pKofpE24jDIUfn92TtQnUhJrkLNSQavUks8WjzlcEw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 1/5] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v5 1/5] arm/irq: Keep track of irq affinities
Thread-Index: AQHchGj7DB4SczePiEuTZHuufPnk+w==
Date: Tue, 13 Jan 2026 08:45:34 +0000
Message-ID:
 <2991ec1845868940488c912c5dd34798a58bbf87.1768293759.git.mykyta_poturai@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8709:EE_
x-ms-office365-filtering-correlation-id: 8aa5e9b3-9ad2-41fe-2c23-08de52801ded
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4Uts1prxA9ysJmAl9V6XCt3l8Z49AyI0qks4R+CS856C87dBsy8tYUtzJG?=
 =?iso-8859-1?Q?hrNkRJdfThMe3GuJTJc/Z5ryYIgrQemhkXZb+Gvo36m0G9KISUsgr8YABB?=
 =?iso-8859-1?Q?Orp+iSPbriO1s3dbifQxs/qZw/4rmRbqXwLC5sHowidhFz95WZN7KeCw1c?=
 =?iso-8859-1?Q?Tlo578XNwspEpuHjR52sLK7QxPHGZ9zuEmnQW6i1qBnpz12b8xaEuzPkUH?=
 =?iso-8859-1?Q?5JIIrMljmeKo3bO4aH3R9G4MP80SdvZSUif4CKp88fb3tTjkFrimbOed7V?=
 =?iso-8859-1?Q?ALGMYgIvrm7jOStqsSEkXHKkK/KJKzWyP6M3HaxmvbhgoXffSAkTDJgYm+?=
 =?iso-8859-1?Q?8bziGP3JHRUerkBwQfIoR9Vz3H+Q2oxmDb9K6L5FeILc/td/zrfS/PhN2F?=
 =?iso-8859-1?Q?93GrszqdwqCPXbCicdL9+CQw78//KglvXGAwW3Gy87lJvm6PPKEZIX7eZY?=
 =?iso-8859-1?Q?JjTDyIzMmrIouITXjfhEtY98lPLJ4amCXvL9Z1K8JoKZZFH8a5WSMQ4U4n?=
 =?iso-8859-1?Q?Jm/kArSzjaFiT8q5CWBUlKQfYaDlxroIk1n5rWlheBiE/R0TlTN5GtzVFs?=
 =?iso-8859-1?Q?nO/FGidKK4yNPSoDIh1a4mbmTDfUTElCKNofjqG4D0ewCkNOT9vLB0orkX?=
 =?iso-8859-1?Q?0nbfQ3IHtp6Ax/ihkD/Mm2YUNxYrQYKZPXdS+uts58fVqA8UGKZ/GbrkrK?=
 =?iso-8859-1?Q?RhLq4cWON5u53SojWn4Zu4eLubd2MIE3tk55JfdldeHXqPhsqQefyP9CUj?=
 =?iso-8859-1?Q?qWG48VncCabBZBpxoqzSN2mC8YgZlkYVFt0ByzM8z0BXoJtFtEbl90LDMK?=
 =?iso-8859-1?Q?jWrTIrIcS1q6hpYOvlQxO79+iK1KlfPFK5Fu7S8k4+teoOq8c6gzjUZxtH?=
 =?iso-8859-1?Q?K4zM05yxqUHz1Zhdf5uZh5aGqwYIziAsCIxFRa3B5hH7dTib3DlypAzR70?=
 =?iso-8859-1?Q?ha1SwrCFE+Sh2dJFEWSl5SzokiZnCtB4v/35BGYJkgIuMeA5i2J1ahZgo3?=
 =?iso-8859-1?Q?ZPfTqF8XDJsd0WcnYl+SAIyQ1TIvm5V1qjdQT97UAsoy8KRmMCpov/1fg9?=
 =?iso-8859-1?Q?H2YSOT//wGDLY+WwylFTLUaqRYpg4K/K587ELs8yaT5xLHzHs+Mges8Jfv?=
 =?iso-8859-1?Q?LEWEVl7bl8V2xugskctQ4ABrm91FzLi260jliUIAPjd0El+lr+SFEaHd3X?=
 =?iso-8859-1?Q?+FgapLSwBgcRlb1OCYzFbrEekuCoe1G4PNiqQP7BQH1cj77MY4PIM1rQgT?=
 =?iso-8859-1?Q?K2r7j+K9tO3TOe/kZmyImTrvLey++7b+711AixnvAoBADGJUe4x47/2t7P?=
 =?iso-8859-1?Q?Z6sUTTyzhCu9Z7SZQ/iq9tsFq5cXlJGVBwnmAvAqpU8cRzlpp+ubyDnfz+?=
 =?iso-8859-1?Q?ZuRnSqEd62hy4uov8f1QEh9z6To2GrCXgHnbpbYRrjss5doPlYr2mUbpxC?=
 =?iso-8859-1?Q?jr3qvP2PDjbXNZIeJskBMMAFyY62cPTHODVUpHLFkeBEkefNC7YhDpJcn9?=
 =?iso-8859-1?Q?BTB1M2Vut6tIEIHdTES0bvVFrFVplpdWnjz5HrSg5rutb6kbKF877tuaWm?=
 =?iso-8859-1?Q?n4+y36xiqW9MHRgnwRn4Xejdt13/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jozKfmSJ2acrxFlm63e3XX8zV1Aq+FSD3PHn1dLi2ip1frcirDui2yiMxx?=
 =?iso-8859-1?Q?6avmpdNYF4rWPdlLblFp93dbum5u/IHIktw6wLeHDH/e6bSahb1ypyM0Kh?=
 =?iso-8859-1?Q?SN/VPGu3GqgK1aeU7YQkCb303RLTFOEnYT2C0U49ivLCFbTGQQ0zkemL+L?=
 =?iso-8859-1?Q?s6P32Cx7sTrEzJjCgT73Tm6kTKsubkrIypd5anc1IN2yIkNi1bibZXS7l2?=
 =?iso-8859-1?Q?3qVflnOuXxVbpmXkkET5cHCWgR8u88pegHZlXeV9dQkvZrpqdoYkdqhrI3?=
 =?iso-8859-1?Q?KUnwmLeIi06sxeicx32RGEq1b3U/bECilYetXcCnUTwP+CfJjNCckDR13x?=
 =?iso-8859-1?Q?qRE8yqUz53dQn5cqDKlPfziqA6UmF9SAnRhkmTMGCOeN5MEFjHvydX91iC?=
 =?iso-8859-1?Q?c1k6RFQqNWrTXwG0buipazgFKU0HY0cgz3kt0I+uZXDm4WdAVlrAgywXi9?=
 =?iso-8859-1?Q?gx293IZ2x6TOI02PFovkQf0W1niv8qQ8h7YtVHu6zYyusC787I257QQPpj?=
 =?iso-8859-1?Q?i46GWKYGDPHsThcx2XilbSzSTahYWQ0n9BM13wJ+EC8lfQwkKAK10ycS05?=
 =?iso-8859-1?Q?OuQoRzzUdMWQygqZYw2d8G4F69ipdXqhyEhtHb3lKzRrDGqfeEBJe9IxPW?=
 =?iso-8859-1?Q?o5R/RQp4bbFJi5ycoG+hIgwbApqGd2Y/myGWaqFpw6NlJBtV35q/nwsyTM?=
 =?iso-8859-1?Q?yIKFMMw8JW15bJMiZiPYJWd6QGVaCEbLS24eLbC63Fcictpy0Nq1jT5ZB4?=
 =?iso-8859-1?Q?ICwcasvcfwrFYjvRJnoVpXIu0+BPT7PWfyGmFkEfUtWZ0mFGsMF67eBDZd?=
 =?iso-8859-1?Q?dKZH9ArrqKIlGMx8x0HefhhpbYIZEfv2k5EzBGmpC7UDd8LyaiAQ3N/stT?=
 =?iso-8859-1?Q?YDDOJF3QfOtdZV1RbjOVt8XEtmRE8lycMoXIsHcxIGtvw+TMpJj433pYOa?=
 =?iso-8859-1?Q?XGpJKvXP64UyMTJe/MWqfOBrpRvXtNIwfzRT5WIBlaugTeElz3P+uUaje6?=
 =?iso-8859-1?Q?lBNqaRfZSvraGiCQQAIYZnyHsDCUGgQL8v/YGX6kQ/izH1h/yws1OX0RPt?=
 =?iso-8859-1?Q?otn+u9AzNH2Uvx5+3imKPlKIhbw/8c4OeXjMqUWsTa5kVrq+t/2Kq+85vD?=
 =?iso-8859-1?Q?PwKWuQc8gkmQ2eTb3lIoiNQptdtCcu/Es5E4LbhOsv9epP+GyDu9ch/uDK?=
 =?iso-8859-1?Q?n4YVYioanVlYKlZlneGysQHj1e7XgiLM75Xh0DaDfYYjedDCxLrnA1YNRl?=
 =?iso-8859-1?Q?G2jH7JsVFdfglBoTp+wLNjQVGK6Pswss+XaBkU6DyIxkzwuATrizAt42jy?=
 =?iso-8859-1?Q?NWuwPG6PVMNT62fkY0S7HrFpkekoqBbGsU/bj7c5gGi2TQFoc8at9+ApfZ?=
 =?iso-8859-1?Q?MrAL+rp5OJI4qERu6Qvd5MqmB9MCeehVoVPqNj2HNfzM6iqQfg3X5Cuz35?=
 =?iso-8859-1?Q?ONMb3JaCUSVcJ68nE3tvjwG8bqYW/+EqI3cbvk1sU6oQzXj6nPMfRVK9mR?=
 =?iso-8859-1?Q?rfncCm3A+4RE8OuilDCztQOnWqoG/+8pUMTgT67MbjFVlesuxjHCwpSjBB?=
 =?iso-8859-1?Q?cHjIswqjLn6X3YG6AxptSLMTaLTdJJFgaX+8QhyIT7g8t5mmPEK8v/Bu7b?=
 =?iso-8859-1?Q?tHfpNkwUKxynvsVl8cSiJvmJk8lJqil01XaAh8lVpr5N69kBSkeQcnKiby?=
 =?iso-8859-1?Q?3eOt/QCFELz/YgJTbpq7CP4tzmf5P/ED3uhmHzWCz4FIaNjKwFOMOSCmBm?=
 =?iso-8859-1?Q?4vkM3DNpI4kq9mgH4Y+c2rfIdpt14pC8sq+QNh4EZtm0jGLqpxd3uANvmy?=
 =?iso-8859-1?Q?ovsx78EDLk+e61Qij10o140gsNzdXQU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa5e9b3-9ad2-41fe-2c23-08de52801ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:45:34.3555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7thUQ5nrObzP7dVDPKtRu3izYidJjTv86goA+9IUE4yt6oO9TOKckV+rCzsKHWPuX2GgVr+Gzl+VVQX55oqnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8709

Currently on Arm the desc->affinity mask of an irq is never updated,
which makes it hard to know the actual affinity of an interrupt.

Fix this by updating the field in irq_set_affinity.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

---
v4->v5:
* add locking

v3->v4:
* patch introduced
---
 xen/arch/arm/gic-vgic.c |  2 ++
 xen/arch/arm/irq.c      |  9 +++++++--
 xen/arch/arm/vgic.c     | 14 ++++++++++++--
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a..5253caf002 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -232,7 +232,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
             if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
             {
                 struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
+                spin_lock(&p->desc->lock);
                 irq_set_affinity(p->desc, cpumask_of(v_target->processor))=
;
+                spin_unlock(&p->desc->lock);
                 clear_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
             }
         }
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..7204bc2b68 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -216,10 +216,15 @@ static inline struct domain *irq_get_domain(struct ir=
q_desc *desc)
     return irq_get_guest_info(desc)->d;
 }
=20
+/* Must be called with desc->lock held */
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
-    if ( desc !=3D NULL )
-        desc->handler->set_affinity(desc, mask);
+    if ( desc =3D=3D NULL )
+        return;
+
+    ASSERT(spin_is_locked(&desc->lock));
+    cpumask_copy(desc->affinity, mask);
+    desc->handler->set_affinity(desc, mask);
 }
=20
 int request_irq(unsigned int irq, unsigned int irqflags,
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 6647071ad4..c59f6873db 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -445,7 +445,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
=20
     if ( list_empty(&p->inflight) )
     {
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         return true;
     }
@@ -453,7 +455,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
     if ( !list_empty(&p->lr_queue) )
     {
         vgic_remove_irq_from_queues(old, p);
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         vgic_inject_irq(new->domain, new, irq, true);
         return true;
@@ -473,6 +477,7 @@ void arch_move_irqs(struct vcpu *v)
     struct domain *d =3D v->domain;
     struct pending_irq *p;
     struct vcpu *v_target;
+    unsigned long flags;
     int i;
=20
     /*
@@ -494,7 +499,13 @@ void arch_move_irqs(struct vcpu *v)
         p =3D irq_to_pending(v_target, virq);
=20
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+        {
+            if ( !p->desc )
+                continue;
+            spin_lock_irqsave(&p->desc->lock, flags);
             irq_set_affinity(p->desc, cpu_mask);
+            spin_unlock_irqrestore(&p->desc->lock, flags);
+        }
     }
 }
=20
@@ -574,8 +585,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsig=
ned int n)
         spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
         if ( p->desc !=3D NULL )
         {
-            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             spin_lock_irqsave(&p->desc->lock, flags);
+            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             /*
              * The irq cannot be a PPI, we only support delivery of SPIs
              * to guests.
@@ -944,4 +955,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, u=
nsigned int rank, uint32_
  * indent-tabs-mode: nil
  * End:
  */
-
--=20
2.51.2

