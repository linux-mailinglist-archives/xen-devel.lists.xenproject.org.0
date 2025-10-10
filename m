Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D2ABCC515
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141096.1475736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K4-0007Oz-Rh; Fri, 10 Oct 2025 09:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141096.1475736; Fri, 10 Oct 2025 09:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v79K4-0007Jt-LT; Fri, 10 Oct 2025 09:22:00 +0000
Received: by outflank-mailman (input) for mailman id 1141096;
 Fri, 10 Oct 2025 09:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR8D=4T=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v79K3-0006bm-Ig
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:21:59 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 918025ef-a5ba-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 11:21:57 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB10161.eurprd03.prod.outlook.com
 (2603:10a6:10:49a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 09:21:53 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:21:53 +0000
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
X-Inumbo-ID: 918025ef-a5ba-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbaXQVDC0I7CiTqYAsZE8+458CMyeo9cTJd+1vhGMdIU/vYasbiEnKVGiDwDBJjuAs7hD0idwMQbNacNJUBVQwDD/CJMb51MKfjsEPQAb5OveCOh8W156xI5e42brnprsZ/wq3BprqPCCkC9sbPw1qA5CM3+Ndt4gKKEgWQejzzCIHUnOrR2/+YNCr0/DOobshIZwuPpeVQFHlcZjpphEgdlOaC3eGhB5O0ZMMczIGekS7q8Q398yVdOOmH9PdnnGoy+ZNH7QfmwsegXtav21CrFFvqlmeNw7sg/+2bQ7iVS0S44mzNHESJEtOMkWKSOtUkO9yz294Lp7v//KxEeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9bNx7Ab/YiPLJtEhYi9gy233vDY+7+k7vYv5Kt1ySA=;
 b=GB9j027nUJ/VFqirS8wEBmZYaEU19lYmc3o1+lgb7vIu3NuHdqbamBIHUdtla94+duZgvTIYD0TA5BIFuYmqBvLehvUVyTJ/GNV44AoxRpGsk0lx/3QWDZR+mFl0c+OAt1eS86RWV7KYIsJY3M1KoqH3mwezOY3IGTMqsXgFR73w0lZK0aZ8TltjvVh9JeRUur35KtLCvmKOZg6u54Z4PczzOSY+QXc4BipGMMd7mh2xCmsaGfNurrZi4ZzERz4Qrrl2O9KSRqezRv/vc6umg/diNHAygtEUdcCDD/uZmNkPMqq4N1l0cAcH/PvvjWqEY/gsd0QOKr7O+dwUlxGaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9bNx7Ab/YiPLJtEhYi9gy233vDY+7+k7vYv5Kt1ySA=;
 b=pt5sH+oX99vupClVxSP/k8W1d3QUzWQPbHwQu3raYjPw5kIezScmjfnbdzOKwj9VZemCL4jwm35s6tjcfD5Tl7dJapx7pi6yMAQ6tHRjLt5Dx8t1Ay3I1FsRgQ7rqRNr3w2asEiaJslFL46TMCt/GtoJ1oHzD9OhaR50Aj24nNudJ+CBInCosIGs+ijvTCXuwzFlGjNS5pV+hVut4L8sh8zeFacR4zGVpkBCEr6PgIDmhDRUU8VDypo4iOvkamAi5QK8+sgaSInUw8Acq77zXJeHmYBOKCNUbexKaQUrimNK9CAKzPuDxoXT6MS1lA82K61nVezwuPU7JLz2wj3hSA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 4/5] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v3 4/5] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcOcdQwzS1cOJYwkSZT3yaMp/Z0g==
Date: Fri, 10 Oct 2025 09:21:53 +0000
Message-ID:
 <e4f4107e54f737932904c76aa65d41d4453780df.1760083684.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: aac7e549-82ff-4d9c-5bfb-08de07de73a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8rz12ZDW356Er306sUsbB25qNrZ9bsoW74rVs4Fzbs8+pJ8No57DkGxWUw?=
 =?iso-8859-1?Q?JEpMs7xHK0K3mRNoNrvVu7q68v96FSEr3ERo6cTviBs0m6zakB/GsDCxuY?=
 =?iso-8859-1?Q?/+ccCrAAlfwsj3sdnHlIyK3eRDypwG5yQ54cpsQykNbi2uRTe83HtV1WIx?=
 =?iso-8859-1?Q?hHG4zgBDWbeGYQyR3nsvc66kkGM2gfQWxFSzS9Tg0F6mHaTwgOePhNT+tE?=
 =?iso-8859-1?Q?2UyaODBb1g/poreSGs+idbUdnouW/+/c+YI/6fLv7kMe73iv8/mtRMFjOU?=
 =?iso-8859-1?Q?pq8sE10Sod2zAGanyFLUR18IwpDU9cx7roIBZ0KxNGkCRtAlOmBNGUmenj?=
 =?iso-8859-1?Q?BdNWS9hxIJEk/+LB5MJE9wYGFtcheNDUmmV7BH0IjjFqq7PVRTHvj7sDw4?=
 =?iso-8859-1?Q?qQTJICP1A+kmxP+1tUtR2bKoaYdEWMmafPWzKQXkRHz7uAa+fjo6ascbHI?=
 =?iso-8859-1?Q?BLLLqtIneGittZk7CO8QBtN41rQ7mYSAcMxQhCbl3nDBF+SJTLKe0u6lv5?=
 =?iso-8859-1?Q?5M3crrT80a1+jJG+hawlTz8NkMVv7gAaCQhJlU6Ekqs9qGhyAMopKnKkuD?=
 =?iso-8859-1?Q?aokYR+70LgSmWfpB519vUEmdFiUI5gjS3INbU4/OxCUT3wChOE1SZNiS5J?=
 =?iso-8859-1?Q?TWewfK3Y3f65RzSe1bJcO3IyWeCwbr4EhxCjZgaUaEOgfB0vhnN2iHw1c4?=
 =?iso-8859-1?Q?6sTooOywwPftHSzE8DJ9Ne6Zh330rsVzf+hfueJevNd0VFaWjs9SdNVepS?=
 =?iso-8859-1?Q?QkHZ591XEgdrvnnZBt1ejmu/OB15jEyqBf4t7ydkAhy9+tV2fqP0bp2dDd?=
 =?iso-8859-1?Q?AcpecZtpy67J+Je0BKMgGbrNdADz8OmP8gaaU3tK+JcdesDEPr4u2I1k0F?=
 =?iso-8859-1?Q?UoG3wiY7UIcfRI/3xZjyUh2vT8S8LTMapMiPe2gPKZeqtfvxd/HU+v0k6j?=
 =?iso-8859-1?Q?YsgEwQIc+OJrzNE6+Jn6zGUHddY1yNF0lHBWIOdKswxw6P/N/AMRcr6TuE?=
 =?iso-8859-1?Q?hERbV/opL6R5Qk5uyRilSSVQsWt4k9kWgo+dXjMpaBxxfxE238okqTGk+j?=
 =?iso-8859-1?Q?Piy04noc8yDCQuAGZDseoITEtfBqtPVqJt3bYO0RNvaIwNFD67CtHWeuHv?=
 =?iso-8859-1?Q?7cD/zoAW3WArs+4/PNjhAw0HBsVOEe4nTkQD08IfazK+3XD0DH69ALdjYa?=
 =?iso-8859-1?Q?7LJ1VEN0ovGQMKRHk2IOOmbqwO6AUmsoB1HGAsQDLwnVOIkdw6i2o3H0hZ?=
 =?iso-8859-1?Q?NZbevuzd9Rkzv+3MFyOUl9HpC9FknVVgEKWq48gfe+msvEpePmbHuK8vSI?=
 =?iso-8859-1?Q?J/jXNk+4b/LMV/aLGkq4hzFyiVZ+SYGh2I0Ms8d40ei6BhzDdpDQ4jSkJQ?=
 =?iso-8859-1?Q?k7ic6fT4wn9c1/uII1eq9yhBveQ3u2TdfhFyxO9pNoFeqx2qxRry34epYU?=
 =?iso-8859-1?Q?w3NwgR0NQcxQVT0NmAPBOUnPcbbKSfjZR0D3lrohvnwmqlmwA7zhMXe5M8?=
 =?iso-8859-1?Q?6j5x2qMwtSTLbnOhy+XY/WhxHxAKT/TJd9hzMkLTdTy6EZwsh0WoaYC8/3?=
 =?iso-8859-1?Q?toVuRFjQI3H0J44EJ5H77LCeZM3y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YExH6/BRPWRfS0ChK0poResVPiVBn2PQhvlX6lHENBYjOxAFndDWORqE7F?=
 =?iso-8859-1?Q?aYMhRpANLepinNP8KrVgeFE0rcJ6/oatY5Ed1swbgj/uqJ7MVBekj3s/w6?=
 =?iso-8859-1?Q?BMPOqBVVzfp+GeO9jnwcZQLEgqZR884iEcY1X/jlZyuLlYNNG5XL+zUIde?=
 =?iso-8859-1?Q?esgPdiK8ajTvc/t8n1vk2a3t3QdNloKZPnL2x9Y06iBU7ruAkYXdrEJGw8?=
 =?iso-8859-1?Q?md4NJSr6nGdlmHBDtBEn74TQZRs9wUMABupqXpGjG/q3WpymfDEE8ms26D?=
 =?iso-8859-1?Q?3vJzdH6NLk9Km4/dy7RMun1BJHRpvHMY8BcpHNrKBRgtQLrKTTmTPsH9ug?=
 =?iso-8859-1?Q?MAJA/7XrwBWj5fQ54iuBaMUq4yffWomIIgBUTqfTHj62Cm369VaPmUODEE?=
 =?iso-8859-1?Q?g9vzRkOvQKn5Qy3URDFb6kLbVeMDMuARLHPBYlmb0OS25Uk9GAqguGH6SG?=
 =?iso-8859-1?Q?FhYpL+n7u/vF0Q8Gz/Uu12qlGEXvoC88Xn/4jxwmuX0LT0F7xxEJqQzNYq?=
 =?iso-8859-1?Q?4/Ez6kdR3FYqMIEmVyDS7BEONBXmtt/iwsncr+Bk+6yTUBrW9EtajsFbXY?=
 =?iso-8859-1?Q?dMoCptdTHb/xVkfrd2F0yeY0YYFQd+Bk+SdQWhzc4h1mJCSFiHp6/X3fOe?=
 =?iso-8859-1?Q?galQV+/KxKkBz8o95T9nk9NOjvRIyF0BodNjhqfwCh7WyYsMs+8R2bcxoP?=
 =?iso-8859-1?Q?n6i3hE//YoB3qsNTuOkGSFIDvh04K/ghDFwZUVf8InkuNSYeR3MQ68TKjk?=
 =?iso-8859-1?Q?JV8yRlpXKKoduyfDjZ16tRG9bCyOJTcXBfCqi7Cg0JJcIBMxZh0pk9xmkD?=
 =?iso-8859-1?Q?TAVhTRAzJx4NfR1dNoP7s7T8psLnOV4Wyn4cRgMHcUv4PiGDHHgUujLsHB?=
 =?iso-8859-1?Q?EjbCPFFD9J7o+ydXgwfOig1I2i73dIfnI8/WdKN8os/l1FNzUbRrqdHxFx?=
 =?iso-8859-1?Q?Jlja4QUBSf8+vsyGpXJ1Yao1QZ0S89ALwivoneEq7g9iYOwmEGrDhjNb5X?=
 =?iso-8859-1?Q?6ILlcpsAg4qeAuewQdv9g4jtp1IMqEVl5QKE9jWYVQXgrnAyqfIjBGwUj0?=
 =?iso-8859-1?Q?Ram5Tsbl5dKE6XtmIqqLlqLup9xuv2t/NwRTjXpF05Jt/8peZkUqdiSRbH?=
 =?iso-8859-1?Q?07mTEz8KnhhUtQO8RUHX1grohv9Gx1ef0m1K8giFn4AcYHWgsNGdWV8rDQ?=
 =?iso-8859-1?Q?CCMNqv2vLhdpsRdSI0a8SXgAhnDf6xNGrCWXL9z5Ch9JQpZlYdp+8OvEOb?=
 =?iso-8859-1?Q?gsP3n66a2Z07UROzx29RJQUC0eq2gcpt/2bFVYUpaX/+vraoqt2e8W17NZ?=
 =?iso-8859-1?Q?KRNE1pecXAly2RalHaBdt9JtI+FgSs51an0l9x98WIcUpbQyaq4oqh+Cyk?=
 =?iso-8859-1?Q?4LAWoH6KopCg0PkbDQ2tCSy/QgZhz1CnFSmEZwF9FggcvW8coqAJV7zzTE?=
 =?iso-8859-1?Q?spDYW5X2TEaOFVFbhKtIevYdu0jzS7vVMOL1seBsUgTIaz2OsAFcxh0sbK?=
 =?iso-8859-1?Q?T3Ex1Vvg+MXmFq4SjF1XrFrLjHdEG9EJ6hRcDHkQq4gNNqZBZJoVXNF0o2?=
 =?iso-8859-1?Q?XbE9S+2eP6POOcZ6vYCy23d5J/DAoCc6fvu9+fk358DCHOFHgU9f9qN0N4?=
 =?iso-8859-1?Q?tr2Ddap6PhUM/Hj6j12BLhIeI/lJaYf0MvCvLHwov7cRx3+PEr4G21wA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac7e549-82ff-4d9c-5bfb-08de07de73a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 09:21:53.3205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i19unZ+BOtOO8LuDReKaF6uMFzu5kGddyApExR2UysWPS59K0o7JyEKGAFJ8+GdlzgRWNoLjevjX4I2Ni+ew1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB10161

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them. Introduce a new congifure option "hptool" to
allow building hptool separately from other migration tools, and enable
it by default.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v2->v3:
* no changes

v1->v2:
* switch to configure from legacy config
---
 config/Tools.mk.in               |  1 +
 tools/configure                  | 30 ++++++++++++++++++++++++++++++
 tools/configure.ac               |  1 +
 tools/libs/guest/Makefile.common |  4 ++++
 tools/misc/Makefile              |  2 +-
 5 files changed, 37 insertions(+), 1 deletion(-)
 mode change 100755 =3D> 100644 tools/configure

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index e47ac23d11..eb4855d93d 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -49,6 +49,7 @@ CONFIG_LIBNL        :=3D @libnl@
 CONFIG_GOLANG       :=3D @golang@
 CONFIG_PYGRUB       :=3D @pygrub@
 CONFIG_LIBFSIMAGE   :=3D @libfsimage@
+CONFIG_HPTOOL       :=3D @hptool@
=20
 CONFIG_SYSTEMD      :=3D @systemd@
 XEN_SYSTEMD_DIR     :=3D @SYSTEMD_DIR@
diff --git a/tools/configure b/tools/configure
old mode 100755
new mode 100644
index 5abd44e21e..5cf5381c0a
--- a/tools/configure
+++ b/tools/configure
@@ -728,6 +728,7 @@ LD86
 AS86
 ipxe
 LINUX_BACKEND_MODULES
+hptool
 pygrub
 golang
 seabios
@@ -834,6 +835,7 @@ enable_ovmf
 enable_seabios
 enable_golang
 enable_pygrub
+enable_hptool
 with_linux_backend_modules
 enable_ipxe
 with_system_ipxe
@@ -1519,6 +1521,7 @@ Optional Features:
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
   --disable-golang        Disable Go tools (default is ENABLED)
   --disable-pygrub        Disable pygrub (default is ENABLED)
+  --disable-hptool        Disable hptool (default is ENABLED)
   --enable-ipxe           Enable in-tree IPXE, (DEFAULT is off, see also
                           --with-system-ipxe)
   --enable-rombios        Enable ROMBIOS, (DEFAULT is on if ipxe is enable=
d,
@@ -4807,6 +4810,33 @@ pygrub=3D$ax_cv_pygrub
=20
=20
=20
+# Check whether --enable-hptool was given.
+if test ${enable_hptool+y}
+then :
+  enableval=3D$enable_hptool;
+fi
+
+
+if test "x$enable_hptool" =3D "xno"
+then :
+
+    ax_cv_hptool=3D"n"
+
+elif test "x$enable_hptool" =3D "xyes"
+then :
+
+    ax_cv_hptool=3D"y"
+
+elif test -z $ax_cv_hptool
+then :
+
+    ax_cv_hptool=3D"y"
+
+fi
+hptool=3D$ax_cv_hptool
+
+
+
=20
 # Check whether --with-linux-backend-modules was given.
 if test ${with_linux_backend_modules+y}
diff --git a/tools/configure.ac b/tools/configure.ac
index dada1c3b15..3a0644ef89 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -90,6 +90,7 @@ AX_ARG_DEFAULT_DISABLE([ovmf], [Enable OVMF])
 AX_ARG_DEFAULT_ENABLE([seabios], [Disable SeaBIOS])
 AX_ARG_DEFAULT_ENABLE([golang], [Disable Go tools])
 AX_ARG_DEFAULT_ENABLE([pygrub], [Disable pygrub])
+AX_ARG_DEFAULT_ENABLE([hptool], [Disable hptool])
=20
 AC_ARG_WITH([linux-backend-modules],
     AS_HELP_STRING([--with-linux-backend-modules=3D"mod1 mod2"],
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.c=
ommon
index a026a2f662..774b1d5392 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -25,6 +25,10 @@ OBJS-y       +=3D xg_core.o
 OBJS-$(CONFIG_X86) +=3D xg_core_x86.o
 OBJS-$(CONFIG_ARM) +=3D xg_core_arm.o
=20
+ifneq (,$(filter y,$(CONFIG_MIGRATE)$(CONFIG_HPTOOL)))
+OBJS-y +=3D xg_offline_page.o
+endif
+
 vpath %.c ../../../xen/common/libelf
=20
 LIBELF_OBJS +=3D libelf-tools.o libelf-loader.o
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index c26e544e83..f783f16ae6 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN-$(CONFIG_HPTOOL)  +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
--=20
2.34.1

