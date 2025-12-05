Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6911CA947A
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 21:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179432.1502936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXn-0006f1-5g; Fri, 05 Dec 2025 20:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179432.1502936; Fri, 05 Dec 2025 20:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXn-0006cF-2h; Fri, 05 Dec 2025 20:36:47 +0000
Received: by outflank-mailman (input) for mailman id 1179432;
 Fri, 05 Dec 2025 20:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rowU=6L=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vRcXm-0006OM-5O
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 20:36:46 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ce83b1a-d21a-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 21:36:44 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AM7PR03MB6182.eurprd03.prod.outlook.com (2603:10a6:20b:140::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 20:36:42 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 20:36:42 +0000
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
X-Inumbo-ID: 1ce83b1a-d21a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKm3mAZ7hEXoJ5rHtfeeOU728sqESQjmyFUgxNxkDYnGE60w6EUeoLP/fPtYzZc1dkdtQuVRkrjvHS92m5mVvvq0mSMTOyoqgTCtXqh4Bbg+Bwau68JVE44OSov3VPtXr75JDp/pcF7TOdKKOOQ/JHPCsmDXKDzxNlEfQyyDjztpM/AiETK/XzzIUsqYk44GqCUBEKVpwP8wClhFATbDx5i+EKYxqr2sNhriEOUUdnBs2ze+cOVHh4+MhJMpwP4jTHXIgZVGGRU7/dSgr3vlcPKbqr6hQ5Xnutb+6HbwSZC+lG153HPBb5k4t3HuslVnF1SBGZr0lNbMmyIeFHIENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9U3lVm3LdZ4OeMGAuKbjx6qHerHHmDtfUlIblUbFDM=;
 b=mURkJR74nTDr7U6KjLSby/vonmgjo6LuM7lBnKrwN92e5ZH9S/nsAnKOzKav8WrCLypjaAWSszwMww8/9RFO0QbIdIL5GnO2NlSVL8q1p09WYBRA0sCMqlPO2AFCcuMCzdUa2OviPB5/c4nX4t+3V+i/HIujRyzCqHla6HuJMGAEThTqs37N6QcFr0DiPA/4Ah+L/CgZpXDhha455ZPbqkaE9KrgQU5pgyyKtEQvJyJQ3EwzKv42jZa9Ww6MBCul1oVNm1PKVlvCy4UHdgAqqw+CzK8sqS72XHyh9OSwjlIkMnpRxCp0WPVuc+7RcZHzmzbyYMRP2O9l2HFaLgZAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9U3lVm3LdZ4OeMGAuKbjx6qHerHHmDtfUlIblUbFDM=;
 b=XdvMka9bHeZ5hjsPAFtORMxwqBzqzPYWSIp4V4+VFpB40B3z/NCqh4+m1uSsM210yItJlEP7EVXiGpp72wcl8nvrzja2xovaXuWrvFou6AOf8/sSPrF+QDgweUlEfTkS4BxmScdHdAIga+TEdxwxhEzdEfAnIQ2P14+lOMo8XuYUquldIzwY6XJXkO5IK5+1kHklJBdvbh3LVoqy1XEuW3WoXmr1/B7UGBOrNWNWHEQ3hnIl/sCacmQ+fbZfPLQ/7wt6q4Vu4hqUN5ItfKSDjH4WSN+oSOYugnbIrMWFAB2qAV3NQ0CC5m41qm/e/BnxObAUt/NjzcgIBRSsWJpH8w==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/4] arm/domain: Update SBSA_VUART_CONSOLE config option
 handling
Thread-Topic: [PATCH 1/4] arm/domain: Update SBSA_VUART_CONSOLE config option
 handling
Thread-Index: AQHcZibd6UEW2KUo/EaT5vMEhVUoyA==
Date: Fri, 5 Dec 2025 20:36:42 +0000
Message-ID:
 <723a873c8c35f54d1cb29866c9b68211f6a977e7.1764961645.git.milan_djokic@epam.com>
References: <cover.1764961645.git.milan_djokic@epam.com>
In-Reply-To: <cover.1764961645.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8322:EE_|AM7PR03MB6182:EE_
x-ms-office365-filtering-correlation-id: 4e2ecab3-75b3-4ab2-7e01-08de343e0019
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gv4pGKpN4egyPMYK1hWWLDzFFnJGAGPulxz2o20FkBS92g+gOR++Pih7Sa?=
 =?iso-8859-1?Q?hT+Acp45+WI3iX5a+eprB2wkoPAGafRCM8KfhfebgRfWwoQLDxXZorqMIf?=
 =?iso-8859-1?Q?Puigx8J0eymrw6gxdHZwSrc2CWtDzRzBryuY3CoDzGvuZ6DcY2swbgsfmF?=
 =?iso-8859-1?Q?XDpDgM4GSdAgp0tRegsPqmuQYE8V3VIezW4U7nEs4zMeSZnuMpQX8vAYHR?=
 =?iso-8859-1?Q?csqQvqfLME37ECKCA4adF2ZuyRFNDGRC3866Hmo/4HsU+v9J3OxPRu3WCF?=
 =?iso-8859-1?Q?07fHXZDCbsCeoPWZNv9lf+95Cq6TVGSAqG6FifF3NL32xj72eHk44LWHOd?=
 =?iso-8859-1?Q?SjcC6qRGitjLhLPTGaJGZTbed0SLz1BIZV8bYsSn3/Xft+PembLk3aXzF3?=
 =?iso-8859-1?Q?4jH+BI5/95mi6eHQZwQZm2bE8MGk3A8mkiPR9U8zDnwtivkm1ZT6yTu5te?=
 =?iso-8859-1?Q?S85GZHQazUGUY/qEek9Nry4bnwn0dYKeXsetOB/JKPTA4McE6aHNtH/SnH?=
 =?iso-8859-1?Q?pKNDRuAnVrufJP0RZJNayIVSKLPLpubvj+f+Lz5Wk+3ltSijY5CdsvX2dr?=
 =?iso-8859-1?Q?wfTNWP/B2uLupD/sWgvvbhWWY217FytKu4zysPZaGDt383fsvW5DH4fdFM?=
 =?iso-8859-1?Q?36TflFVGa8Pd2Y4RLHiPdm9ZBfnrnqwWyYRvEFoCW/F5Xo/0Z+eVUEq/Va?=
 =?iso-8859-1?Q?PJmdGeqnihpAT4ZFAJfCGl3GV9zmp6OcCHvTzN1HOBu8uktn5CrIODntZ/?=
 =?iso-8859-1?Q?OWsd3uUxZxaggmOfn0Oe65nT5S5y3ppxogWvjyf+SF5FYPPD7cWQyn2rAJ?=
 =?iso-8859-1?Q?RsouzuW7UtJ/XSjUqZ0l3zr3oSVc2ZpZLf4jfvUYM+AW9JhLnAt0Jvah8T?=
 =?iso-8859-1?Q?UNxmmdfs0ZXVZHfeq7pFbB7yBd3AbdIOmL0fe3h92XyIlW1P6PftcNzHAL?=
 =?iso-8859-1?Q?GTFF9CPU2FFB1X0vHvzK9Zu0sHK6uffU6OiZFF2wPyQXA6YyLDpzIZZQpp?=
 =?iso-8859-1?Q?tSIRiij8N1T1XG3xWwIvFxIIwIF9u0+xxNCYG2IvUCXIpvXVnhufDKlGKr?=
 =?iso-8859-1?Q?CB/IvL2LxHxQ5pdy0b0HmAeE2F6XQHY/f8dLqQMSDAJW0MRi23vKiGQw79?=
 =?iso-8859-1?Q?GtmWRhIqEZUfw+JJ7hwt7S3NOyaUoAg1PlRswgfmG20Uhu4IeAWyNcXzjl?=
 =?iso-8859-1?Q?ZSe1PuFpUbdm8NfG5C+2V6h85LlUCuHZP21IExZUbje1IGrHTu3b3ceVl+?=
 =?iso-8859-1?Q?NCxXScjarWitGT0vVZ641BD1vwAZf9Df+Ch1ubwu/4ZajEp/cDtGsuCK/3?=
 =?iso-8859-1?Q?9JndkRwoi8WjNmew7s9B/8gm8fz9T7EkQ/CgD1PR4zBTFcs0L5qVT23hSc?=
 =?iso-8859-1?Q?StiW0Um54+D4j449OcSCkn1NXm9yMwI8NHNhzky038T19mXfQrSrRI6zzE?=
 =?iso-8859-1?Q?pLMyJEUiT6Doh/gl2bzqlJeb73eLKhVlVRutClXGkjrJKx2QoJAMryZaS7?=
 =?iso-8859-1?Q?0NdFChFwUl1i4LEDatuYCsHGRrkaCcROpEDDA4utdGuaf/8xBOAAf2G4IX?=
 =?iso-8859-1?Q?loNSmLj6sLN3KPy4agOqiurWeBjB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1gPaSQixAO2uYEK74Bee5w99oOmAj+3zLUruhmu2v0wmcPBe+6KUlYeu/Y?=
 =?iso-8859-1?Q?Mkl7SEt2UeyvSKhrMHqESljk4paSaOt2NqzFPO0o2wYsTWTMOdyXIEl/Q7?=
 =?iso-8859-1?Q?2iVmYGFvw9yRbK1PX5LHLW/5SXYlZkPMqjhVRJydMemUiXtHp5ezLG+b3O?=
 =?iso-8859-1?Q?siXRXsPaCz9K++jSTi0qDj1vyzwOfvwITUZPrAcnYGW5lockgvqI5wXpx3?=
 =?iso-8859-1?Q?pAyYhhXXp4A7Obm6JT4tNv1fwX+SeQN3gHBQTqW08Y7dP1WhOVL/vcAGdc?=
 =?iso-8859-1?Q?AjUFMuYDrhVlcVtmNvH4A3t0zOpNvHpMf3kraiTkkRXTJ5t75hJFnw/wOA?=
 =?iso-8859-1?Q?YiRkxFR9xsefyMqmw9sfNUNfvAz4NyobVRe/I9AT66OHsAlvv/l5wx0qVc?=
 =?iso-8859-1?Q?gV9HtrDeBXoKdPwbol1fjMRuDOXBTFyfDIVHFYg/Uf2EevNCRB1jfhVkYr?=
 =?iso-8859-1?Q?ZGViUJRTGPaln+zz6rVD4vyM2jFJVQ2PS8VehX1HuvNq9U/LIRvWU9JV/O?=
 =?iso-8859-1?Q?KVMV4M4BeCVHzz2u/qAlA7C4DMtscEUMs9x0B1VL/fh+LVMaAD4iZEpDhM?=
 =?iso-8859-1?Q?HUjHiMmHw5WA4kaS5ayX7/7n5Oul74j/VDfDNb1Vitms54TZcAm1Le1Osg?=
 =?iso-8859-1?Q?WmdKcdF+vfxt6qQLp7mGZXQxroWgXZx5XH/A3gZYEwUHS8CJCPCNDe0c6Z?=
 =?iso-8859-1?Q?PjVFVjEF/rYJskxI8Jwqr9OlQuat9SyVG7MUypTygSi+slTfF0j0JC76JN?=
 =?iso-8859-1?Q?Iortoj2+e9EQP0zLVEo1Mv9wTaGv87F+ugnAQH9a6SRuNRNK0J2LmHBZPQ?=
 =?iso-8859-1?Q?ODUUItUmSCSC6svFzVjD61Hf+T4NzTRuZJrMfo8vNyfOBsk0YbUCe4dYnP?=
 =?iso-8859-1?Q?jplpoPMsAMhvdNBeeDCRaq1kVf1rTkkMiszl4h/z1ThcSlDybfASmJuGfD?=
 =?iso-8859-1?Q?LWfwUt8AKDotFDRCYRdM/rZ8hfBusox/fWePt5FW+FCmML4IC//FNm7ARh?=
 =?iso-8859-1?Q?47BHDgAsdDxB7pjjkLcI+KK3e0Kbi/qRsq4BnJKOfGnwDmgf4IdXPZwGk2?=
 =?iso-8859-1?Q?pG6OF7qF1V5S8yzkLLrYOsyfrL3Uz3w+gU/NQ5C35DNrPuz3frVBFSIoi5?=
 =?iso-8859-1?Q?CRSRYD069/kOeqe1aIBBPA1YL0qWUoLduV43inmRtsJSGSL7BnFB1yr9e9?=
 =?iso-8859-1?Q?DAcSCyci0AvOvfoMLBVFuWmRTR/BT9snvujrUJtu6ItZ8RRgk/56chvBfz?=
 =?iso-8859-1?Q?n/sJJOxBjIZ4trrz43pBXNhDPxgz3HadXD7RMs4QSmM26ulzrHMuUNtXPP?=
 =?iso-8859-1?Q?TVTERzFhstpO9dqf/bVDckv/LhbVEgbcTF+GSEEZiLHUywSL71KXjaPn6C?=
 =?iso-8859-1?Q?m426az03pH0rHTFWQS3FAwkGqLshBacKES9O54bev356xy8B4lOWJ+4VcE?=
 =?iso-8859-1?Q?blov8i5NoOAMvkw3Jb2Obc5bCWH/l+wd02k2nMUx3D0gVtAxJJolYFGE8G?=
 =?iso-8859-1?Q?j1EFNAGjurBkS6ziunR6TceY9o1yXXN7aRv47mahDnzN3vKOf1OG4EcpWs?=
 =?iso-8859-1?Q?WypTXNVSfNpkh3R6oxvJ4aIIGXW0Wd6KNYCvqM13KpzXptMcrMZ/2DV5mr?=
 =?iso-8859-1?Q?YT31qavdMB8z9Ok6W07o9+3SaWxAz4xWVi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2ecab3-75b3-4ab2-7e01-08de343e0019
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 20:36:42.7319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkx259Dvr9Xjp6DCQLc72BZ/6HbbZxSZ4nhU9JY4aKiVJBjwAo4BN9QvAfGZnDzjBMXBYwL156AgVt3KnhUiHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6182

Update XEN_DOMCTL_vuart_op command handling to return -EOPNOTSUPP when
vpl011 is disabled, informing the control domain that this feature
is unavailable.
Added dom0less config sanity check for vpl011 property

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c     | 4 ++++
 xen/arch/arm/domctl.c             | 3 +++
 xen/arch/arm/include/asm/vpl011.h | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c10538..57980d2abe 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -322,6 +322,10 @@ int __init arch_parse_dom0less_node(struct dt_device_n=
ode *node,
     if ( domu_dt_sci_parse(node, d_cfg) )
         panic("Error getting SCI configuration\n");
=20
+    if ( dt_property_read_bool(node, "vpl011") &&
+         !IS_ENABLED(CONFIG_SBSA_VUART_CONSOLE) )
+        panic("'vpl011' property found, but CONFIG_SBSA_VUART_CONSOLE not =
selected\n");
+
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
         int vpl011_virq =3D GUEST_VPL011_SPI;
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f..250e20a9fb 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -156,6 +156,9 @@ long arch_do_domctl(struct xen_domctl *domctl, struct d=
omain *d,
         unsigned int i;
         struct xen_domctl_vuart_op *vuart_op =3D &domctl->u.vuart_op;
=20
+        if ( !IS_ENABLED(CONFIG_SBSA_VUART_CONSOLE) )
+            return -EOPNOTSUPP;
+
         /* check that structure padding must be 0. */
         for ( i =3D 0; i < sizeof(vuart_op->pad); i++ )
             if ( vuart_op->pad[i] )
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/v=
pl011.h
index cc83868281..b8f4d85651 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -74,7 +74,7 @@ int vpl011_rx_char_xen(struct domain *d, char c);
 static inline int domain_vpl011_init(struct domain *d,
                                      struct vpl011_init_info *info)
 {
-    return -ENOSYS;
+    return -EOPNOTSUPP;
 }
=20
 static inline void domain_vpl011_deinit(struct domain *d) { }
--=20
2.43.0

