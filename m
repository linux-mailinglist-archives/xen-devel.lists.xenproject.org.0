Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB3BCC516
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141097.1475750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K6-0007pI-9z; Fri, 10 Oct 2025 09:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141097.1475750; Fri, 10 Oct 2025 09:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K6-0007kF-5U; Fri, 10 Oct 2025 09:22:02 +0000
Received: by outflank-mailman (input) for mailman id 1141097;
 Fri, 10 Oct 2025 09:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR8D=4T=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v79K4-0006bm-Ih
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:22:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c5adf8-a5ba-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 11:21:57 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB10161.eurprd03.prod.outlook.com
 (2603:10a6:10:49a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 09:21:55 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:21:55 +0000
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
X-Inumbo-ID: 91c5adf8-a5ba-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cClscKG151OiELPCUjtwjUlSQcoTg5QrOpoKjrtmoiKjSdbUbTGUDtXVSwC0m1EmEOvFI7yRFV7uldpPotCc+yHNRFmiuxE3SSvMGbHBLXiHXqeRNsaiCeHeFb2f6hFb8BOIuydOYeXPvAQZ5IFY+PSm07b/M/M2XpqzlHTAW5OVPt74rN+5I/eVOpHYCnCS2St/PnOc5KMHx/tfwRRIbsY3tLRfFfNJoON382dw4d1UoLZra1XkQ9ZTtmdFLK/I96U0CjGYZt7ah9WWM9xKfvYVpQFcLQrScIaLqRPA8H8tY/MxYr6v+D0yezuJ2xm54YcC0UvSqrut4SNqFrGG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AToR280Ck6+ZL6TnH21R3RTZINBkxX3LZEidlj0YVUc=;
 b=cMo8L7/CACGRPtCzEd+JZJVhA3JZ6a8zy/i5N9MUsjM6uHCRumldIOniYMzzv3Zgd5/BvKUrg+Shq+aXf0Hq7XwTv1PVgt21pUSSWOiVLbUUQjD1B4iSgsHKAchxsbNil049M4XN0QfVKk3ueLWmtqK6QmPznFchrN9MvX95W7zXkKRO0ANWyrS+iqjKfMMeSm2hStubpU+BzCZfZNKMWN3UtM+8Eh6Z1SdaUreYSDJ4hFLETbQrnUSAYm14QnPFDprfsFOH3rbDmp8Ru0+YiY6Mv7can8B7FrrZmqAAUkmOH2Wih09LqwSZUWceV10+G/VFVs8LtH/9YD3i3R3SOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AToR280Ck6+ZL6TnH21R3RTZINBkxX3LZEidlj0YVUc=;
 b=nVhcnCnfvVLUjfWJmJc/QgpMzDVbfZGsau64pqKdks+FEd6TqUv3q1JctDFLiPwAYXiKS6dEnX8A2DU1rnzcdwy4emWAope1Rudloxo/r1KxoHxHAyfSpKkxHjW0sKikgPxV1bcDn7VCYaLIC3ZVi3iPCagr2pd0dfY3YxrtzgF80wckIUoSS55NOgxK7ROB+jVv/4XgIQgSH0C7ebdDbqp56iimnoQb4Im5BvZecJp7GXaRv9bh6HMP5g2CFmVaC3e6DVhDp9+ACE5rhHkl6p2UmUDishucjhQHTulfnNfzPJiALdVHU/JQtpgqc2yxH/jf9UkvfMKnqiV9mnvraQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/5] docs: Document CPU hotplug
Thread-Topic: [PATCH v3 5/5] docs: Document CPU hotplug
Thread-Index: AQHcOcdRAbW7d3bUAUGKbidrnjC6RA==
Date: Fri, 10 Oct 2025 09:21:53 +0000
Message-ID:
 <a34437bfc6511f7442cb357c956ba4aa2ef4cf0d.1760083684.git.mykyta_poturai@epam.com>
References: <cover.1760083684.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1760083684.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU2PR03MB10161:EE_
x-ms-office365-filtering-correlation-id: 0d0b4777-d0f1-4ae6-ce20-08de07de7475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YeNbn0JufEkLxJdVTqRFCcmDXE2u8Z7oCzepI19fkUWd51P3nP3QCh+K9P?=
 =?iso-8859-1?Q?pwM9FXNyHK3rENT3BRabTuiLCcfiWemxVbP/oTHwuonF0fZuJQTcoSIPaO?=
 =?iso-8859-1?Q?F6qTdODq414Z/eUydd83ILezjyPKN6SAyFtGLps1uFguYae7U9w7HPBV1g?=
 =?iso-8859-1?Q?L9zINMEs/JXhf08ONEk3QMoKrVojxo3+IYoSl1bLXCGNBBtGYGRP4T7AW5?=
 =?iso-8859-1?Q?k5lml41gao5uLtvE5X7ecWfz104gyvJSCbxT9omh/rrdIsVUjTQeoM26Hp?=
 =?iso-8859-1?Q?mqeksM6iQmpRjID20URC+6HDfh4KhRcDVOdFngxQ+PT2dTN25/dJcDHRkM?=
 =?iso-8859-1?Q?Ug6/QcXWNjVrHa3H+TAcII1sDaPBXocvN5EMwiY+pGhWQSUQfCAU4+krbF?=
 =?iso-8859-1?Q?uEGc63tbukbOOpxc30NHTY3erW5VNmPrCofdnUYan3LNo6xZ5bIEj+rIBp?=
 =?iso-8859-1?Q?RFt1hLNYt0tZ2fynmvlx2a4pIPc+3T3ERRy0KDswSnUyrQVnea6axSEdwU?=
 =?iso-8859-1?Q?cxsjnzG7+q3ozj8iKpWWxsTmi70VQMlJ9I0XJLMaN1wBV8M73DkdqnazUH?=
 =?iso-8859-1?Q?IRIRD6qd88pscWU+qdnjmNgRjQVyDqyf84S7GbtbDHcJeepf38TJCI8VWi?=
 =?iso-8859-1?Q?wsuDSlRBJGk4+XXEJ5lpA27p7SnPxjQ4dTKLfCbXwTGef/fYgjagBJVG3Y?=
 =?iso-8859-1?Q?gIBuzDgDMGN5PZWUYltu9F/Od+J06pDlZ8g6zqINXEUweSO5MDqx0vHb8V?=
 =?iso-8859-1?Q?tiFaGbcCIEZvyT5smR909ckTMcDeCHTG69SJ7x2SccsGdRW4oECAVenlh3?=
 =?iso-8859-1?Q?g1JZiQxDUNV1NW/CWZguQmDPobSHZ+5dSB3J56QoONZrVw0+SAyuSFBCSN?=
 =?iso-8859-1?Q?BZLT9pVt7z+ZpxEP+VL0RswypnsM7GP2suZ/6ZBHBkO+e1cdHNBgEpZv0U?=
 =?iso-8859-1?Q?OJ2debOBcU+llYWcbI0cyS2Qf8Q7TAkq+0TxOiOqNz4uSGBqALhJIvapJ8?=
 =?iso-8859-1?Q?lmshYa9raEsz5ppMX3FghQWGbYYn/LAoTZQ9rU5GHIgMXL0WWpsMwKfWSB?=
 =?iso-8859-1?Q?pCPvQmQvCKnurnfZXmPTDG2cIClsEmDUSkOLlVUk1tktKe3NwbSPslk9/p?=
 =?iso-8859-1?Q?dS++fa91viPHFKVc1qfgCqhGDLjvIT2rXTVtiDcSb5oX3Ewlduh9JLXLU8?=
 =?iso-8859-1?Q?RyglOA9DFu5Y18bEblWSLWWRMLVwirL5gPR3BZFkpSHxPmEQHCSpblRh3i?=
 =?iso-8859-1?Q?UvwqGV1Qe5XzyZll+VVyXyHDrrkSEr8jlvXuiHBvAa81dn3iEM5vmS1LCr?=
 =?iso-8859-1?Q?eUObAHAMhdri/LOa6tizoUP1FjqGHrsAKqM35+IONVcffFCa07EYrZWezg?=
 =?iso-8859-1?Q?JveSg7S8lPrQ9nwZxEgk/q+95S8KQc4QFF1ewCXIHJqNeAfGPT0ECFq5hN?=
 =?iso-8859-1?Q?Pd1aLoDvwgsOAZk7rZ7Cs7T0ZML6y7bDVTQUvk7GQYUsTHsIA2oQ5wpHO3?=
 =?iso-8859-1?Q?NeEoK2qbGIT2AWovKWlHDn9RcV/zJZoHcv88H8B5HzgAZ3YCymlljt6QH9?=
 =?iso-8859-1?Q?VCz/0rHJWtvJx8ns1CtMWa1zc24q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?K273MIi/OHIW1s0nYMxGKeGILXx66H4iyg7BP7XbOJUMle1ZJG+RKNElo9?=
 =?iso-8859-1?Q?KhxEkBevmFRKwpGMR5TiW6RcqmgX9MN4ADc7GbM7r7xZWB6UphQSMwEbRf?=
 =?iso-8859-1?Q?+TLqATOnglDnQGMx7qVtTxdm98p/4J956EczT/17NS+EmpULoy0PioRSRT?=
 =?iso-8859-1?Q?PgVxw2piysqs922uQQLwqJXAbOHrYoEQj/oICTfsAKHshKMoxjtegoDYm0?=
 =?iso-8859-1?Q?bRXoZBtISd+uc7q+2L/9f9d7UMHO2pLVw8VJqrMtUq0KKOex9Mo1CrcilP?=
 =?iso-8859-1?Q?ivA9mMjc6OSoGDib6fuAgFsTFeuM1e6MHDkAkpitohIpqJqo6B5CoH0ezd?=
 =?iso-8859-1?Q?8GI44xm8yrKeDQFjfpJ4fBfPj7XDZJ08mEZjSH50ltvPVyZuwyWLSVBxCz?=
 =?iso-8859-1?Q?BzCKNE98m2MGLJr02VVANzg+w1ZQa2Nv3C+jk75vzZGWCX233b8KvFN6Sx?=
 =?iso-8859-1?Q?s5IwN+KVuXF+a0pX7xk/hnfht6VqlgiBScU5JiaCM0ubbc7OwVq8HJ5dWp?=
 =?iso-8859-1?Q?lhw4UqhtfgJWdnvGIQlSepwKenFw2Uqmhul7uwxO+4JtYaX2FieB/jW38b?=
 =?iso-8859-1?Q?yIfC1hG9dS9eji9S367r06B2glG1OXHiyF1oSq09/RqM719TLf2lqwSIgV?=
 =?iso-8859-1?Q?FdZHJVs37QmQviQZPXeceHO0P9e16u2hpV2iEIdZtFH4OWGI4ngAjapO6k?=
 =?iso-8859-1?Q?XuzJSErgi6aE7s/kzpofxzPTjvsTO7mtstLM1Kt6VZYqbZefMaOfZfZ5ki?=
 =?iso-8859-1?Q?ruZHfLAVPs385I2Lck0be0mK99GRnAyp/qytqQdmtWdEPo653Dvvgk/ifU?=
 =?iso-8859-1?Q?Mucyei/qvrUk72TJec0VbR1YThpp428iOkr7SAiGHxGsVUcZTuxTUe2+vR?=
 =?iso-8859-1?Q?yv010ihc9sNmZ9XXKhE/mVR4spTfSYi4JlAuqf6yElOeGogJvNFLt8TBeM?=
 =?iso-8859-1?Q?DH/bTkjHv75VgU9hPuOo9Y14/V5M56cE6R4VApqKHF5ThOAFWc5D8rkv3h?=
 =?iso-8859-1?Q?mMvNbx0GAGAEsXBTJv1apUMQLqf01KJmkr9QiNUrLNdQNhgWdTWHOirFIP?=
 =?iso-8859-1?Q?CR7uJDs1SNduMIA3L76USq1Np7W85SBMBjq22Qwd9Y2pLit41ZRWwrix2T?=
 =?iso-8859-1?Q?fbV0nVqdiN7slfbalxBy7m/NkuTKRNntpBTzQt4w6gulFF8YHjUSpQ0fQT?=
 =?iso-8859-1?Q?GbnV33B5etbImZZ8YtA3bONoJR3cqEkJKvXFw07OaUBiHV2l1pJeb3Mzzo?=
 =?iso-8859-1?Q?AhahK8e2INfSaxsAKWmbJMFjQrCpf85Em93bEJ6FOOmBNs9cCB9JPiTXrv?=
 =?iso-8859-1?Q?NlG5UFcMqZxLigaTJecoE2lXvLSG4/4YlQVLC44QfAuIYezEQPvgPlDKjS?=
 =?iso-8859-1?Q?0vlXyHuHYfJFMO6BHGXV98FsladK5WE/GnldmLH1RGSNn1KuqYhRb4UwxX?=
 =?iso-8859-1?Q?fBzIF6xkhXFqIIdR+XhbhUe1FJfTHvBnrpxQoORnXVHvGfCgHs4IGDvtXK?=
 =?iso-8859-1?Q?4GtA4ii1IqgFJLoBhfd4qmMihpbneQw/nHUn36vfH9zfeLh9oZYb4TRE1m?=
 =?iso-8859-1?Q?9SsYRonfVydeH76R5rN17cwvFxBiPWZAbQtVhpnIT3vcEnMJFfoVQNTyXU?=
 =?iso-8859-1?Q?hzNEbJIj2CnGEWckLCoKSX6+UYD8RfAoqvTle5U/vokIAETHC1fyivBA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0b4777-d0f1-4ae6-ce20-08de07de7475
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 09:21:54.0127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAXNlbfIDS467xFDgRECSJ7EHe6te+Spm0WsckI98HKv3smxRtVydfeGEr5Kym4iMHPLj++tbz18JG+Ro/s52A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB10161

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v2->v3:
* patch introduced
---
 docs/misc/cpu-hotplug.txt | 51 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..f2b340d2ae
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,51 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is supported on x86 and Arm6=
4
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for core 0. S=
ysctl
+calls are routed to core 0 before doing any actual up/down operations on o=
ther
+cores.
+
+Configuration
+-------------
+
+Sysctl handlers are enabled unconditionally on supported architectures. Bu=
ilding
+of the userspace tool "hptool" is controlled by the "hptool" flag in the
+configure script. It is enabled by default and can be disabled with
+--disable-hptool command line option.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
+
--=20
2.34.1

