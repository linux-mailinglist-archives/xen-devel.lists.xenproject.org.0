Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2640C51C64
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159702.1488066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SE-0008BY-Hy; Wed, 12 Nov 2025 10:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159702.1488066; Wed, 12 Nov 2025 10:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SE-00089H-B0; Wed, 12 Nov 2025 10:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1159702;
 Wed, 12 Nov 2025 10:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8SC-0006fP-Um
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:56 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99f8dfd7-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:54 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:49 +0000
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
X-Inumbo-ID: 99f8dfd7-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oo6tgQLzFRZSLaZzMwzySm/rVZky7/q6T4KD8IMHV2GTGQ2sYgXJhQUMfv6Kv6aFhPm6+SBD11U0WUvd9CHyPyWznH/XdVtEZyDEXtUioVady1UdQknAUPQOTC8PRY05nVyWN/LSv/YHcU8uIr2jKoQx5jq2Emz6UhFYdVlht/oAmzOx+V9yGXIm9kXZiOS8XvJtd1SmvIWQB6iRR3IYTLQSFQIJMJZFzXRBwAZjYIDu4dVHqQEU74KmJnmavsO/gamUukwuzEdjp9KkBXdIWA0dTHUbmrWaAt9hKB86R9FOEhFX6RjCKeMMCB7C/cCIGq7lRnvgnhMeZhWOJYZRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHWxEhZr2qxm7Hi5KjcTQQYKD/7NED9STP8YDDxxDx4=;
 b=Whj4BpdIAHqjsR44UcmTxXbOy1DaS0ymVoC60qi7TGmKZ7mvS3/rtFMsa/EHhVnKxo53NRahE2EUbo/QDTOh3lfCzCAQ7Bj44VYyAsOXkCTYF/z5Ml83RA0nVA17dkME4YOsWAV253j25IvJE8Dn/cTilDvJhbZ6/BG73/ZBzFy5cplSFxTwYyQ8A/TCq2lSynH71AHut7VnsUuBxqm86GFaJjR7H8r2r+7C9Tpi+0rz8XUrwfaoVoA1a3XSLKuHd7awqOmXD40WEg5bGqZ+robip+alLECv2G/ltcSA3EE3ddadIJN/pASlbW4I7GXh1YZMJfP1NF4odkTXbfbtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHWxEhZr2qxm7Hi5KjcTQQYKD/7NED9STP8YDDxxDx4=;
 b=uq5OWBTObst50o4TlhqipOQQ63zvmpxpDz4WqIZp08wb9QSe3PaJYFuyGRF8tPVslZQcFZ9f00fCsB/jQ+9y0CeluetWeKfic7eH3e3QsVoCeGzhexVa4xsItvIsroHx3XAn3EWuum4IFb2cM+aHeRPS5ZSJvAOCfnyOI4M4ETD4oADzsYxVla7O5JhHAxUsYEDZW3HOwhKBzAXRcHexoL/6Ko8m1lpmwETlkknb3CBiiZK9DEnOis7OYRSZ0Q+2PZc+o8ebtN0kwbjXybPfgwejssTvGKZPkm9ipzVAa3s8d4au3833mCWcVhZe71zq5ZjCNc3y+VNjXYUEEn7ttQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 7/8] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v4 7/8] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcU8JY88Sv3J3KcUCnbLXdCp+q+g==
Date: Wed, 12 Nov 2025 10:51:49 +0000
Message-ID:
 <6da5b8b1aad1af18cf6ed352697ad39786adc37e.1762939773.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 09306751-89f3-48d6-f7aa-08de21d97b5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?epZnBjE417oZSqDP58+zsLlMlnMXbxcKdyHaAkFIPz4y/ulWdGSOEoohnc?=
 =?iso-8859-1?Q?Zk7TOq2QScOlURbY1sn1KXZ4cClAGY+jN7mdIDsm76b9sEgHpLMy+MrJpu?=
 =?iso-8859-1?Q?tk6ZlX4k/qZ8KbS+zHiOvfHm92i6g/ToMSuTPZq+4TVJtsQEp5Rc0dp5sZ?=
 =?iso-8859-1?Q?G51eVT1M5Y3pwuMeg3mAPzh8wRZPSnAFe1QzfiWKMveX9ADZ2ydDajWcBC?=
 =?iso-8859-1?Q?VdesL7zEpfzKH/+IL95ACuLMq8Kbt+mAoNhcf2zhrcprJvm+2XP/1L3ZkG?=
 =?iso-8859-1?Q?jxwhpKZRQSIv5x/9OyAywedWAkLcC1AyEV8ei4UqneXwxxqZvh+5c9jib+?=
 =?iso-8859-1?Q?Wtc1iTj/gB45BZqEOrErcKHftSfJcg+3cL0bLTITBsIvxnTAQyckE5PYaH?=
 =?iso-8859-1?Q?kyxY6RVcXPDrppLahccvWV1dzBtsJUO175ZwbVwImYb+3izIeJQVXnNKcm?=
 =?iso-8859-1?Q?8F8SJ6vYMUeshddJLy4ZnFjX1yVmqG6EQILoRcEmb3IB/V5V9TVavF/pPo?=
 =?iso-8859-1?Q?LlLxXYGzN3C76MfHymfYZnvm+oMy/otjH7QAe55bkBgNsF2IHzn9DcwAGd?=
 =?iso-8859-1?Q?RsR09ewQP9TE0axYX4IhBQZ2h/CrdlvYOMSepkQfzANbBqT/d/cgCzCR9L?=
 =?iso-8859-1?Q?ykfBj2waMPz5xc83hMZnSq12+fJd5ej4BV1EoGa23L1Pl6KNIW4Q4UDGIZ?=
 =?iso-8859-1?Q?N2QNWXX9GOyPpu1yxdrbzhvXMcTqhXnEm3Kfr1lK354CVxEBGRQ41UiWG/?=
 =?iso-8859-1?Q?SplndkVc2LNijJUH0IwEgFXqyZKnSCuEy/NQNjRzTckHIBKYnyvcMm3FHO?=
 =?iso-8859-1?Q?37b0zSZb/J6nbUmOz1O8iSTRbV3lvFmFYFQt1PsWZhLlbQ6Xlk5cYKGSa1?=
 =?iso-8859-1?Q?swKZ5w+y0XWEbWEivbBYmEAcR3UdMlc6VBzNIHELWwImqmlw6gvu6tmtp6?=
 =?iso-8859-1?Q?ldjXszO2OZKF5N2aGNIK/O5A0ct5XriG77+eitqgydt+97Tqwsu9GZonIn?=
 =?iso-8859-1?Q?ltiMSo1upRbcHY/yM91ktMNi6gBpl+31si/qR/Meve/M2f06v7iZKM2B6y?=
 =?iso-8859-1?Q?vDvDP6O/FpmC0HceBrnP3b8tIY3HmGEJUfwevoNlqirzJz6E35K+uBfsaY?=
 =?iso-8859-1?Q?i/I9oOan8ZhPQtfJBWamThc8Bv+pXBHky1xEMi6Xotn0UV2RCxDPuluyjt?=
 =?iso-8859-1?Q?dgWL3pYPQ8vM8r+jQO1vZf8pT3+u1E/P6xiYtwF8K4nrJURCDBCceE2IQO?=
 =?iso-8859-1?Q?c5cOuSsFUwoGq5HECoooMdwbpwNosFzVnJ7DAMmc1YFAdc3T+WYvz7HVeV?=
 =?iso-8859-1?Q?d1hb5/5j9kCAHdzUexci7eRA6abN53CpQ1e/Pt+LFYMrW32blCjuvAGChI?=
 =?iso-8859-1?Q?dAyqqwkQPgWk1SkfIg2Ne/KRuQkpJCMsy66ZYuupe3Tplq8rq1pTvmOYeq?=
 =?iso-8859-1?Q?saNKCkV4m4NUAhnCGcML6ADHPs6oXPpVzIJcwBkwFPLAyguylDrxJeaAlU?=
 =?iso-8859-1?Q?tx29tAFmhoVp7eaO0Xwmue/bnKYEtCmVJB2029i5736Orv0ZJsg3OGCAHc?=
 =?iso-8859-1?Q?v9hMktqQ5+5Y6d9vbXIgI69gKHm9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dRUWybDNhoKGL/zBe+5qquUK8ykdO0O5YBdwny5ZytLLH1A1SKbD2eg1c8?=
 =?iso-8859-1?Q?QqlSt8dpe7iPyJFhp/xFZcxoHyHwutJ2MTEdc7mX0RVtl+y2vJlaO+oBP1?=
 =?iso-8859-1?Q?scjfjI6CYxcIloKIdGr5pKaoR1It3PfnlaTT6e+HQgZz6HLbWExAjwcbfL?=
 =?iso-8859-1?Q?ljt3moROjinnllxb2uM+PwLJhihEOMXufhnetlEqC+RoD1VKvinQF/u903?=
 =?iso-8859-1?Q?KSArk0qrdtrVqtJqMAj4VQzM2WX8K0U6gPgcZzdT63jfQRMqN9KENRxNUR?=
 =?iso-8859-1?Q?raXuVld17Qf7TvuGAQgMSPM3+zjYiqqcqj3jlIWD2SJ7mkFyC1asyvydJK?=
 =?iso-8859-1?Q?kD9f8KHxEdviISLDgsgg1M27OgvLemM0c/9proFFRc7uAc98o9IfEI2ABd?=
 =?iso-8859-1?Q?76ehM4OB23qKAVXnDj/62ZZE7frI1POGHNNEaat6TSladF5ZuT1+pcLacG?=
 =?iso-8859-1?Q?iZ8+dz2cEyaOSlccDFCuGJGv46z6ga+T52V45KeK1fTosBhX/YV+i1Gdzi?=
 =?iso-8859-1?Q?2JzAuXqZFkTYbXpJdQw+1IjrvPbt/OVXe8ZsQdhAWD00r5NLsHlx27HiO6?=
 =?iso-8859-1?Q?VBAvkhUvMgspZe8s+c4OB0p0MLyuzA+WvkXWv7D67pc8Alhte4V6wWtAbO?=
 =?iso-8859-1?Q?fJzl31HBr4Cf42MKlT053R40cfR2I+FFsRuyWqtx8ABBqby6O7pYhG4oW5?=
 =?iso-8859-1?Q?mVnQV2yY9OuOAVL3V/LLKPXV3JzgF+xB2f54lPECweD9b7g9RUAoanJ3d/?=
 =?iso-8859-1?Q?yrjOOVDoWWNvRJwJiLchd85TUbveHJyoebVggeYqbcbG7ZYxrenaJN/Ofm?=
 =?iso-8859-1?Q?xspdgaSbVQfRD4drCMovZwGfjN9ZrxKWeNBSU3hzVnZUWKTMCFHkVGW6nH?=
 =?iso-8859-1?Q?y41Ddaqsy2ZhpcDhy29DucaCuMpj+tyfj9GWL3rVNL3QTHCWECrQa5GMVk?=
 =?iso-8859-1?Q?F+jAZYnfbyVkrhYmMWbfvpusQJXfKS684A1x8Z+RmnFmpm5oWpSjB+Njgu?=
 =?iso-8859-1?Q?/r9XG1UjJrnAbvo68H0CI5XgLqZYqPgmy+ll/oP8ZLMxJTEvHY4W+WDYNC?=
 =?iso-8859-1?Q?fE7yubFcRSRdNQGxsRPtGAf7WfPWOt04SPRf+GYgTdNPyWQmqdVU2LmPI7?=
 =?iso-8859-1?Q?9q3gixz6l3BdujYWAqRdgbuyo1SA0a5+vs+UkIdtKH4gK+ddRzxS0e0mtl?=
 =?iso-8859-1?Q?2lXIHoPdEkrS271cmdH8c7Onkeeg25hEGlARqmZkeTEW4I3Y2PBzgm1l0P?=
 =?iso-8859-1?Q?r22lsGzTHH3E0ih3xTWkL0OjoVL5KnLZJLaESlxOcaBYFaNnn/b2qbs8iE?=
 =?iso-8859-1?Q?84OOzhTC57WbqGIAmAlhVEzqfUv5pyEc5EbNrn8mPz00bz5UCJtuAZ7227?=
 =?iso-8859-1?Q?sD+7nfPYXCv524giNz3e0DWfjuWmK3fisgph1vdVwH7lD56GCxkpY/oPYT?=
 =?iso-8859-1?Q?tx1GCHQjg5lzZFaY+KMemiQpXRjWRhCR2Ns2TlML2IPV6Hkn8BWDyjjVmc?=
 =?iso-8859-1?Q?jwoWIVqu/xs0h9bH5OqtXaHRflTJr1gGZCpyI4X4dH4pDi5TuFKAkP1hlR?=
 =?iso-8859-1?Q?EieCK+lYhD3+pEd8WVXTdMbVZXYVLN7qAvxMlEd/B9NnxEhBDevrqF51Ql?=
 =?iso-8859-1?Q?dzxCdLLeiGjwLoKd5sTyvVXiOmTxUa45IID22aTXtOTlLaqPxPYnVK2Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09306751-89f3-48d6-f7aa-08de21d97b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:49.4298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyRW3I8VItaclnc+w9oiEZLwb1TGJSv03RiVosmKCfzrapc+AFkvkWFOnxNgHmVzqRwZNALEbEO/TizbadBzJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them. Introduce a new congifure option "hptool" to
allow building hptool separately from other migration tools, and enable
it by default.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v3->v4:
* no changes

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
index 0037ad5a64..d5855ca090 100644
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
index 3111f5688c..8a86582ece
--- a/tools/configure
+++ b/tools/configure
@@ -731,6 +731,7 @@ LD86
 AS86
 ipxe
 LINUX_BACKEND_MODULES
+hptool
 pygrub
 golang
 seabios
@@ -837,6 +838,7 @@ enable_ovmf
 enable_seabios
 enable_golang
 enable_pygrub
+enable_hptool
 with_linux_backend_modules
 enable_ipxe
 with_system_ipxe
@@ -1524,6 +1526,7 @@ Optional Features:
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
   --disable-golang        Disable Go tools (default is ENABLED)
   --disable-pygrub        Disable pygrub (default is ENABLED)
+  --disable-hptool        Disable hptool (default is ENABLED)
   --enable-ipxe           Enable in-tree IPXE, (DEFAULT is off, see also
                           --with-system-ipxe)
   --enable-rombios        Enable ROMBIOS, (DEFAULT is on if ipxe is enable=
d,
@@ -4816,6 +4819,33 @@ pygrub=3D$ax_cv_pygrub
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
index 285b4ea128..28a0c095c2 100644
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
2.51.2

