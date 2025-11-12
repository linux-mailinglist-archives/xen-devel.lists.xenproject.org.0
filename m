Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18190C51C58
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159700.1488050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SC-0007uO-Nl; Wed, 12 Nov 2025 10:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159700.1488050; Wed, 12 Nov 2025 10:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SC-0007pP-JB; Wed, 12 Nov 2025 10:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1159700;
 Wed, 12 Nov 2025 10:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8SA-0006fP-UE
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:55 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99824a73-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:53 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:48 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:48 +0000
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
X-Inumbo-ID: 99824a73-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJilnOwp6mhwWhuraiIt2pOq1ZHHAK4W2WL/z8/DPU+pBVUTcrtDm+0N1HiTE3JcXMH9+pfINhWHd1y762Oisb13gjEbDqToLY8WSuvjs2K8Od8PC+Ld3dZTuc/uhz3YC15grUMjBwvXmehluJ3x82ResGW7FmRx9Wc8IUBzYsbysgoAhrKUZyh1K9M7939mCweenzzTjytX6H7Ss1j8l7perSa+nm9mRtxv+BEQfn6un+FVFDJ93VHFAB34ddgu+NXzLNqhjn90FY3p01aVtCa62NL90hwzvSDJJrZNLZNLQm6UG4B8JmcncfGOUc3N0QiRADMtZP4Gsa/+z1Tv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMZm3LDcUtStDARrFmbJcMu3ghMVkEWfJ14QTbgWQCc=;
 b=ZRkpXYWC859N7qpTcIavCe3Epu0z38hcYhRQTrhM9MBTE9Jjel7uGfsRka9CbgYgAw5fD3WrUD4QwPI0eHTbEeubbuE7g2mQ8qGarsjp9uqzl7L46WmIGTocwQtrqoX5I1L72xoDhTsWzhkv2Trg+qjkjf51dq9cdOuRHFPd0UrnwGpFDc0QnYogS7VdAeGCzeJ2rvl/XuyYo94bYk8OboQNkZwktQHL5yyQjydoh9mNsJqCIOEEMoiUqyuVWNel1jyISWzDGhPMmHo0S9+/YU9RddevnBFCtD9kyTNlJSdFG7avBVhs9MM7PEql/osAPrGYdysxkgWngtOe8Eww6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMZm3LDcUtStDARrFmbJcMu3ghMVkEWfJ14QTbgWQCc=;
 b=dBNzSE+JWQEeEwTVRx9YJlMlZ5gFEOA2rn+A9X0jfXgjXbg+YZWzFCUxaaWhj7Jg4Tktv7OsDJrapgJ7CdOJUg4SdDPLh5X0Syns1b2h5RbNRcdaQSrZ23ci1U5o5AsOzrkgy4xMnmtjNSBrHmGO9udfQqzzpzqYD5ESBuHdOPBe+FouBIMbCNBTSv28zWZXJRuB926V9c1ZdlhsN1flBoOF5UzwaSpD1m9zdLa4+y5Hqq0OEaEusUPbX+M7ohtfQCs7OkfiCpHQjT5rlxov5tDoo6ehhGKAZ/Ui/q2cEZShcTiVulNtgTLBqVNcVEJDzJPRGq/li3k2SeBCrg16Qg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 5/8] smp: Move cpu_up/down helpers to common code
Thread-Topic: [PATCH v4 5/8] smp: Move cpu_up/down helpers to common code
Thread-Index: AQHcU8JYQt16KVNB8U2nXkz3fMDrJQ==
Date: Wed, 12 Nov 2025 10:51:48 +0000
Message-ID:
 <e0fe3bb03af9c612605a2a5dd9b5670d0428fa1a.1762939773.git.mykyta_poturai@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: cc993a82-5cc7-438e-19dd-08de21d97adb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rC1ctaKxefUf8o8c0qWKehUfQ/kaVhjOdF2hC2ZEKoJ3lv/m4f+SG2fmbs?=
 =?iso-8859-1?Q?cbtkaN/Mn/yYtl/UYIjsT/9BQ82JmCbw203CngvMo3duGz1Upf9pY+6n7y?=
 =?iso-8859-1?Q?kME/ie+NE/6uSFW3gHbMD7KKLN1XsTiynp5uMuvNem8g7JtjoLXg3eRSBt?=
 =?iso-8859-1?Q?YsE37eNM9wJNsZwjHH0H4aAvwNYnrDNmIV7t2XHoaKuZZ1RV4nLK3a8A4Z?=
 =?iso-8859-1?Q?R7zvY6YUlZPBbG23X206SUHXAG333eo809S7k2/RMrjAKUCSwwoZOyiSnS?=
 =?iso-8859-1?Q?i8Eye6TpZLjk7ev2zbWTlLSrL4NdAV44rPwmvhJ4UnLD1VAJ1CiLV+ZVSg?=
 =?iso-8859-1?Q?Apt/AZH+RkK/18h7ijd68ef3eleFb5GdGp5wQVvaqsQr/N4r+oH9F7dz7G?=
 =?iso-8859-1?Q?uorGXl5lfO0keuZaxO0qS81YFvpYJve8ALZmrCa0tVX2pztkALbY0rk/7H?=
 =?iso-8859-1?Q?RJzGQ6MvICy3pUZIeLYKb6B+EiOXNvzjwvGVt8aimNQqChBPyuirIQkLio?=
 =?iso-8859-1?Q?FZeiCnRdRhp8dUXqXu1fmx17ChWRUaEycJvgbzssMhQF5O6ZKTi9TsYaVb?=
 =?iso-8859-1?Q?3eOcSdWpHweu2a9ujBUrdWHlQR9fsqu5k8IHKf9XSZwRIZm10ZaMws9ATF?=
 =?iso-8859-1?Q?nH+eRqbaZDWqGya4wtz+WdJRH3IX6OrS/qbJxzPR0eIXZT3zyqsuxnse7E?=
 =?iso-8859-1?Q?XrXOTzzupJjOXGHpqzNy19pXoHvENn0dStwlCzo5WPZKa3kjUgoF/vw8SB?=
 =?iso-8859-1?Q?z24CyPa7oaH4r+cKbnGjdqAswnjTHGo3I/UrlZdKAPE9dSB6s6m/yE+2KI?=
 =?iso-8859-1?Q?fTJ/G8aW/0af3lShIWRmkoisKbzc6WWt+p49JBz7Q3biwPyGxHmV3APGuj?=
 =?iso-8859-1?Q?umFJnZ26wwRQmbhINYoXJaoxkdM1ZsnUCnwTKJuk2+aQOUnSOl/PF4/8yq?=
 =?iso-8859-1?Q?0CQurhsfARpQ02KukaZxffa4u+ay2YGPJXhxA1N5dCbztkuipvMqiZ1iGi?=
 =?iso-8859-1?Q?hgrZLhrXzLh9lXTmYmz/YXnnMry+iUJvpZFHSkGoWwPezWT07+drGXmJGK?=
 =?iso-8859-1?Q?klL2rhmdaEOXWXlbJ+6nOwZg8pqYAkcKKI1Ir1VN//l4HH654XKOZ92ke5?=
 =?iso-8859-1?Q?S+TFFVeffgkfurwp6u8iZxhRffENhLlBHtX23J0K6yd7dnR72i1VA6OeQQ?=
 =?iso-8859-1?Q?oklTCT4c24H4GAaY9RTw8dUTbnQshccWLA52RWfphk5OiCrukOfp748lsO?=
 =?iso-8859-1?Q?NDGf8dc5HQMQ2PVxE7BxqDm/kCioX8yT1RexxZ/FnxcnXXvnpswP+go0DS?=
 =?iso-8859-1?Q?c+Y32dZlg4KHroVd1tsS14CVGDzTFc97L4orDZ/idsPGniAU5Sw+zy98vO?=
 =?iso-8859-1?Q?do/cgIwFr/RsrDbDJEyQYalFI+gYhOoP2p/8oaltqYaoi3PYQFpDBmWZ//?=
 =?iso-8859-1?Q?jilrkL0Huc+EcCp+Xcx/tktB8uGow5fsZzpg5fgFYhE2Nwg66wUW/4ZcwE?=
 =?iso-8859-1?Q?YeBP465nkTBU0f/0hxDLKpc5LiFvPkwgSGOLwkQwWdEnjzkzHGzVlEN7up?=
 =?iso-8859-1?Q?hhb/wBJ0Z63REY1bnpscd1gG8AT4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HpqLbPIse2E/I1FmuEqwMz0rml0t8l72t6ZdidcOntbO9yow30vLwhPHlc?=
 =?iso-8859-1?Q?DLOmse/H4SLdLTDzKQweSKWvogKha4vMpoWaBijrTY32QLVBMU+yuYt1zg?=
 =?iso-8859-1?Q?6ICmrwvKjir63cWwAaOMoqDLnu2uW6eF0ODCZTnDDSM+Tl+3ab/8e46Zmw?=
 =?iso-8859-1?Q?TEKireNfo7+s6LSTKYH1lVIMLJFq4b0ST9vdRmoM2CzL5a7QRmerXCYc77?=
 =?iso-8859-1?Q?oufV7sU/vlYzfF5No49ZVQCsjAz1vSe5v6bGNgqj2SP1/Pmf9so0hQrdyQ?=
 =?iso-8859-1?Q?jVnDMqwn0MJ7mDM7dnnJ2V7dInjMcPS/zIjYBt+u6CCHAvyDYNrgf/Bi00?=
 =?iso-8859-1?Q?Oz+sNyYVxxx1Fq1cJwjUbFOkh7cpfgEmziP4F9jDJdoEe1ImPbtEJCTIWB?=
 =?iso-8859-1?Q?+0PylHISFICNPrb/VikDXgacF5OaoWqTxOBS4HX4oTZWpaHr4CZ+/mXL/1?=
 =?iso-8859-1?Q?m+etoF2Nr6B3C9JeivB2SgYW/Q14xCso7E4UIug17IgnQxpoIB1AvXuJgN?=
 =?iso-8859-1?Q?rLcn1WkCul2fWY5WEErI+FDKif2et7oS/nipRJV5GitCA7e7bVljHJBYnf?=
 =?iso-8859-1?Q?Y/znm5r0DPeipdQkKxftF5gUrVqeyDghHxBw1ipFtpvI6RW1/fZIisiYbE?=
 =?iso-8859-1?Q?BwvbDYn9kSvb7DzLsnQh3XktbsaWfd8x5677L101fWuHKCIOuIOEoQxOHJ?=
 =?iso-8859-1?Q?AS8IjR9nwGqbRDIlnVvxlgdQSyDWhYakBYYC2YoTz1KIvHJOoHA14FKRoT?=
 =?iso-8859-1?Q?GADXAvIuprZaKID1/cIs6fYU2hSjWTs+c4xn7vVK0Wkz/Y6vVuFX9wyvVH?=
 =?iso-8859-1?Q?zd1GeTU4pwRqWWzxS8kJ4bsvHLhHf9tu+KgOKQbBaV/5Vjt2Ti/J7G9ChQ?=
 =?iso-8859-1?Q?Xk3ENoDVEfgn30vNuHE1IA86c6mixRb4NBkbztmC4h5MSvxrmeMjm/h1MQ?=
 =?iso-8859-1?Q?u/pv2mJsAoqCmh9nRNK/DivbYvH3pqgDA1ExcAVA6ybTjhU3VdLhGZhm+/?=
 =?iso-8859-1?Q?QjRbTqhtjzN8ArzeT2LeKG5zEH5LPvbZqOKwvLT2cNzu3/SkhsmG9JVZyy?=
 =?iso-8859-1?Q?H/Xv4C7opphPwTVRgHPWD8o2d1ps5ULKxoTzjyGv+T5Go91DKx5oDElQhH?=
 =?iso-8859-1?Q?bvHBBFR2ZknACJiLOxxVY43Z//wQiL9notRxvUpmq2Mef1zQ5mMfHQpweq?=
 =?iso-8859-1?Q?BNL0P4IbMQUZTsknvimpQ7YlrdfAm1FO0oPqTP64BoI+xTqH2tGBU9A63K?=
 =?iso-8859-1?Q?mrXdmUtwmx0xqEgd1/Xk7VUaMsZWI8g1DvDVocalY7GTYke9NrOnuuA0WS?=
 =?iso-8859-1?Q?owBaOL3mA7o9dsDH3ouUn9n6bdg+Hgq/b6pAQO4cw0+rTr36wKFdXBpeKn?=
 =?iso-8859-1?Q?phcKew7NNtN83PNyO4pe4zgTmw1awJqBBAPX2qOKvPLHySq2Flhg7P0B/o?=
 =?iso-8859-1?Q?WK2lbNO/gsmk3kD95fCzKsa1hoAnJtLBC5npxTDVhRFxgcyr1FjywGxDwU?=
 =?iso-8859-1?Q?8sBbsf5Nj9wV44s3A6lG/Y/fEEOP3QPVl+IJnI3DTuEcERn5h3hxmBh6PR?=
 =?iso-8859-1?Q?YdbS5lEJnYvTSG/NUKY2TqJ8ODOfPfPfkL5jYk1Hn+GgW6AIMvzA4O8m5J?=
 =?iso-8859-1?Q?E6vRpB20a+9RAoz6vsDccqUsfPERqSkHZF7TlGLQK752SHOgRG/619FQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc993a82-5cc7-438e-19dd-08de21d97adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:48.5687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIMqDUUxA+VBFhfTSNwZb/GlDlJIFVsvBZYaPNN25PyRq7qEIWiACCXOAC7D2TpA+5oiuD535PlHFvnjEIKrqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

This will reduce code duplication for the upcoming cpu hotplug support
on Arm64 patch.

SMT-disable enforcement check is moved into a separate
architecture-specific function.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v3->v4:
* patch introduced
---
 xen/arch/arm/smp.c             |  6 ++++++
 xen/arch/ppc/stubs.c           |  4 ++++
 xen/arch/riscv/stubs.c         |  5 +++++
 xen/arch/x86/include/asm/smp.h |  3 ---
 xen/arch/x86/smp.c             | 33 +++------------------------------
 xen/common/smp.c               | 32 ++++++++++++++++++++++++++++++++
 xen/include/xen/smp.h          |  4 ++++
 7 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..85815aeda0 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,12 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+/* ARM don't have SMT so we don't need any special logic for CPU disabling=
  */
+bool arch_smt_cpu_disable(unsigned int cpu)
+{
+    return false;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index bdaf474c5c..ca97cec51f 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -101,6 +101,10 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
     BUG_ON("unimplemented");
 }
=20
+bool arch_smt_cpu_disable(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 1a8c86cd8d..60610349cb 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -80,6 +80,11 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
=20
+bool arch_smt_cpu_disable(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 60eb4ac254..b77fc0bc6d 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -50,9 +50,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7936294f5f..d64b533cc0 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -418,35 +418,8 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
-long cf_check cpu_up_helper(void *data)
+bool arch_smt_cpu_disable(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return !opt_smt && cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &=
&
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1;
 }
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..114c1da77d 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,37 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && arch_smt_cpu_disable(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..c734033bfb 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+bool arch_smt_cpu_disable(unsigned int cpu);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
--=20
2.51.2

