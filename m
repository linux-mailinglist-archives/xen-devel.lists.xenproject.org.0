Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78196AED67A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028894.1402571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9Sa-0002Oh-Kh; Mon, 30 Jun 2025 08:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028894.1402571; Mon, 30 Jun 2025 08:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9Sa-0002MB-G1; Mon, 30 Jun 2025 08:01:52 +0000
Received: by outflank-mailman (input) for mailman id 1028894;
 Mon, 30 Jun 2025 08:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TOiw=ZN=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uW9SZ-0002M5-0N
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:01:51 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7999d9b8-5588-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 10:01:49 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by PA1PR03MB10724.eurprd03.prod.outlook.com
 (2603:10a6:102:488::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 30 Jun
 2025 08:01:47 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:01:47 +0000
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
X-Inumbo-ID: 7999d9b8-5588-11f0-a312-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgyuNFZHREPKpFUPtmOzL6aypLo/4rnPLxtGMRL+nQRvQ7vOBqDwPKfTP3UFWiWzLuEvCWbyULnTICP/tPWMtGZPBnWMs8guFVJOB6vbfxqcF/kN//lrzihUlO2diHdOK1o0gb3wbhK9TZjHuap/lET3BTWBMkHAjzfJo0BZm4/lEzzKV1PlBTGVzR149H9gsuCpJyWwyy2m/MvQ56Q3W9DY5Q6miSMyFVWUm3+t3Cgeuwb25UoHLOkxuvFdd1O2gCPMPoqSLsP7261cD/R+gE4+dPUWwin8aXD7wGRp8e55jKUMhS2StM6KecmVTZ0HIqoFY70nfcSXcyua/+RaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvzU/Y6IR77BtCJ1BMIGK/zyLTtZdScEZ6txdRAwZ6Y=;
 b=ToPVMFDkQjN2MT/D+pTeczQ7HbZq3YzDXm1ywpDoOOK0+y1UJO8Gl3z7g1XPUTsXFf7tsBOtYl3oGO/4PTYyT3h+WSQgnqIULehbGxWGW98y5+54i3PeTs0syKNi/8Bpw+FYgXAhQO0s4+tAjursRGZbENNcjxKF2tB2qAUhXQJKgP6u27BV6V+Qx0cS/BhtVyK7HNS6qjuU9681HagppoavC0NM57cZh4PuhB0wUQNV6m7LNVjAAh9Ci7c8QcB6ZXtekmWP7df2aIIt+X8LAXYKAcbFmsFPu9TYHHDYt2Qpvd3XF/EuXpXC4EILHgpMDJcfB7Ts6aFWOLPdpIVckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvzU/Y6IR77BtCJ1BMIGK/zyLTtZdScEZ6txdRAwZ6Y=;
 b=QIkU88M5ZFPYtiK3nydAhnkJr6LEEuqTFnhoizhRC3fVyNsmkfcBcfASiF/dMvRTo/Y0zisf0Y+sjSDWhs2c8ZcDC4uh7y0D+KRpPV6RWPH1ZSPwcWEfSIbSfMQiVxKKku58T4jAUg6SgrdfjSmOr+GlYZFaGVlIGvC7uB8TVLTWl00Cok5F9gVNYirGOGwKJVvgYcqRxAFv34ZlybUiuI4TUS4vfb6YjB0wtxWMGI9tSOH0uHW9it0qb5nZS6uYFoQist7iXXGHYtHmcnCdANxRdklwcN88PnvX87oL0Zy06GJ+Jma0YFjMOlLpuFOe4xvB5Z7Scs4FHt/EgEPJDg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] scripts/add_maintainers.pl: set double dashes for long
 options
Thread-Topic: [XEN PATCH] scripts/add_maintainers.pl: set double dashes for
 long options
Thread-Index: AQHb6ZU5GqvLxUb1v0eVLL/RYoouyw==
Date: Mon, 30 Jun 2025 08:01:46 +0000
Message-ID:
 <7f66cbd47f45b2cc442c541cd264a208ea1f406c.1751269784.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|PA1PR03MB10724:EE_
x-ms-office365-filtering-correlation-id: c7fc3595-9308-4399-cc9a-08ddb7ac5c88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mQylP8IRtYXUBy5skhKIx5qGnkwYOHfIxyL0h//rVeTZ4SynzwAg79C3qO?=
 =?iso-8859-1?Q?MsCVImdMNk4O502YlM3GPEs4vM5AzS3t5DKZUUnMMWc98Lar5zu0547S4u?=
 =?iso-8859-1?Q?7z2thuqJvZhGb+fKP6H08VmXtwyqMMzAR4plzYXuhcUVt7SZ/MXVquhp0g?=
 =?iso-8859-1?Q?LnjH3tVysX1auwMAPm1YghAecuZS8e9UbOj5Cs+xysCMCE66uju5QYy/Oy?=
 =?iso-8859-1?Q?C8OkudfvjRcTuzKQf5AhDoKc78TZ8gmk37c5UIGsCpRjAn7uUAzcG3+Qw+?=
 =?iso-8859-1?Q?N/qUTHIkrjInMjl0RX4/nyFQzqo6hFVYopry61io9qmPwL+AgTWSdAM4jm?=
 =?iso-8859-1?Q?2HcixdpekW2ddls8nYWueQa0wAh5bK5GYG4SaVKj4+aSBUe6QL/rZib4T1?=
 =?iso-8859-1?Q?s3yuIEB2Ger8/dZ/sMbyJMshje8NFgO4kWW/n53CHWdO0jXjmDAUBLAAuF?=
 =?iso-8859-1?Q?llTO029mg7InlNQY0Fweq1FKPLlukQAuUG2YwJ4pcZXFwPCvgErQijhYP5?=
 =?iso-8859-1?Q?23CWf1oYMv+fHRJkoe+9AhR4OFkIJuaXezV3jSyT8zMxzuInK7H/BYOiFA?=
 =?iso-8859-1?Q?WeWrdqK77vzG3ipz/HEZfOBCxcnzVYpt9BYk9qy+N9KgaLFx6vK5wWUNiV?=
 =?iso-8859-1?Q?KC45ablckB3i1VIlbOU8wb1ebLrbO/EzLgudsmZQdZ0tXk4t0kD3b4qipf?=
 =?iso-8859-1?Q?n+wD8Nq8Tsl2zHKKNOJaBYtjYnWNi0aWzVTMKe7vLRDuAUmMUKKwuEHX6m?=
 =?iso-8859-1?Q?0A0OBFg+bbNvwktTSXWp4GbcppfPWNvptgdKPNvD+sC8+QRJI1hPuBln5X?=
 =?iso-8859-1?Q?8t1VI3Yxn7InpN29W+Qal/cLDpjxibtGKN/iwUX8m5WvAIh7CDRq/qtqCC?=
 =?iso-8859-1?Q?SCp7RDuuYFz5Js/rZNv4cYA5GK+2H8fPXCdQK8+1lMpXchjHL67aN4Ptg/?=
 =?iso-8859-1?Q?9TGzliQA6HLqUi8b0ZHzGe5opiBEs7jFRI7uBKX0fbyiP+gqFsu6b5oAcp?=
 =?iso-8859-1?Q?MdNFcD5JXpg7/PaA1MVg7NAFhg0mlOqNv4NK5y+QanZr9SckD3hR4dShVA?=
 =?iso-8859-1?Q?IWCCN6g/fLmElW4MDhCY5cgr00nIRsSm2z/Z05YvJ2SmsIperwV/smYCH6?=
 =?iso-8859-1?Q?DOrwE/xyVMV+W9xI6Zh9BaCSbYkcuhJlwmkOQz26z5+3oB/A+o7C4HSAx7?=
 =?iso-8859-1?Q?5BmGy+Vw6EXdgrEhbEgILW2r5QGRK9Q+HmycfE3o+KHYGc3EyVeM0fm3Rs?=
 =?iso-8859-1?Q?KuGpJfAjGmqJhrJ2mv+ihG7sYFv84Svhq5OSaKzuy7ANvoYNh9ZOtUf2pQ?=
 =?iso-8859-1?Q?UWKFwPhNDfpUlqaVR7pPKVlcrCxxONGmEwMMJ6FaAVZ/INAj9dAigHe5ba?=
 =?iso-8859-1?Q?Z1iQBhOK4/E9QbLnL+TjAmQwbYS1fiW1tcUOrNTeAZ+N/7Zb9fLv7p8CQP?=
 =?iso-8859-1?Q?TJyrbNNAeccmxYHsDtXgX5Xfl89l08K223+FZZhlQZQ6I5MSyI84eXNGcy?=
 =?iso-8859-1?Q?UNMBh3Iq6a9D655zf+k3FY0mQw69tn83T0rkXBL9T4uA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sG/4UrIhVCz5xgFbObROG+KD5chSxVCF+umLGvs04N6RhEHxOMN37N+Q+z?=
 =?iso-8859-1?Q?iLadyxNycZZDtSkaIbKeGCqGJS5+1BXOu28RJEUFAz77+RtCsQmuANbsxQ?=
 =?iso-8859-1?Q?Uq9qUn88Ca7Zmxn1PsReVrZIV0oEYoy2mGu+I/GhZ5riHKVsVg0/iHcLlf?=
 =?iso-8859-1?Q?Joy3f2PVvDID96mKsXzF5j7IZNQ8nQ3twlkJqVKv2qi7qsSS0VtGXlYYcd?=
 =?iso-8859-1?Q?/6HwA85sUZxat0HAEWpEGhBTn4+Re4C348oTPMwaiA2nfN6diQJNzuM92T?=
 =?iso-8859-1?Q?7Jn5D4OA0QPWY1YiOJPD/eELD28zvP6Cfeeqpt/sWf38MdlEOaYOgfGFgz?=
 =?iso-8859-1?Q?TFKF7Tdp2VWpQA/QAvPm1hkKE0kODK4EhBwm29k8O176jNR8X24el9Z6Mh?=
 =?iso-8859-1?Q?/zcKvXmnOu0tpoaFKaBvh/B465mzKrmIb52Rx6TASZfUgrSwIxpyfMskJC?=
 =?iso-8859-1?Q?qFnMCrBb0GojaJS9F5Bjw/b/iX1ZAWZ7TNo2vqe+rRAdTZXNxqSz+hh1pj?=
 =?iso-8859-1?Q?sdwnjMCTqpd5BO8IETcYzLJAPchPokNlZNetjvMf6wIGJ3zLKzInizRXP0?=
 =?iso-8859-1?Q?NeoCzULLQKN6NjmpDlzEDPps6cCCxts6XpZ+Qva/6nrZR5r5sF2TU09poA?=
 =?iso-8859-1?Q?Ny8prxIaJqw2MRAh9IJ7rSHjM27YZDb6V+Y+77eNoYzT2iCjex3JKXrerH?=
 =?iso-8859-1?Q?Ccv0YfMK6hzrqqAT8wc1VV++4rOmDT8LTFemohjy8bPv2ElaDEd/GNvzBl?=
 =?iso-8859-1?Q?cnEjj5u4xBQHBXj4BJ89syNuAJWML01Vimp6M3Mzjjxv1JXo2n5sB3Ej17?=
 =?iso-8859-1?Q?qVWWGcHCddzDU4Q47BJk0A7wOR64Cc8hUlMZaoHMwjxtg2YODX3FvXEqco?=
 =?iso-8859-1?Q?XzeLzbLrxeBPyRe6j1Fb/9c2TWvbane8GvsU/Geov0scvnrLehl4PGSr0J?=
 =?iso-8859-1?Q?36y9/sm8ZFKUla4mVsu6WBgljG9hKSnUI5cgZ1y5v49KsZs2Hz4LsbFHOK?=
 =?iso-8859-1?Q?fE2/kOUnGwkZZjKb57n3a2ADdqCSlqQA/LflQY62BF3Z7HFauP4BR+56KW?=
 =?iso-8859-1?Q?OAxWpf0XvPQ3LrRQRV6n86TMeZvtcDkh4UH2qLzKkQqb8waE2ap2tuwJxL?=
 =?iso-8859-1?Q?FPKTT/DAkoc+F6UeknHRoXZ2xB62yb3649CxfNV7/0O73FKMVJG9DnolFO?=
 =?iso-8859-1?Q?rxqpJKyRf9FEzcY+9ahiIiF7NMw6bP2cpI05eTrdNKcFsxy3GVZjQtoU76?=
 =?iso-8859-1?Q?ATHMjJr/O+7srZn3i7FFkJFMMlBiviTWRBpr87MwjitqYTe3LBgWJ/egj6?=
 =?iso-8859-1?Q?0kD9aQfEsxNs3AiBROHVrv15kRYuAFj0VdgVm05HLAPcJNss1yzHpnVf9F?=
 =?iso-8859-1?Q?cZsS5fx+gHGtR+5++lOzeWhnMEtRw6O83xLuMSJM38trei4w6WMjogAkhN?=
 =?iso-8859-1?Q?xlWaxRTW1On/nQxizq1yJErk/5bE03733hiqnvrYjKcHKJbDW1yCjZUF6n?=
 =?iso-8859-1?Q?GABUZO4fA29Ed6aE68InCfRNA1bCRG8XcmfiCb2I877hVnjtxpr+igyGQz?=
 =?iso-8859-1?Q?I/Vak7085S+ypeUa5FH910PQA0tsrgPVOQK6TPfKP5i9uabKb5K5oouZfA?=
 =?iso-8859-1?Q?PIl54HN2dypYUSF9Oiveg1WC2Ldczl4OdbNrD2ExlKErfuby0vR7t7BQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fc3595-9308-4399-cc9a-08ddb7ac5c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 08:01:47.0486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+6FNVEkAgxa2wtWcaUbaqibUDVxIE8GXoqEpuO3Z++xhu7yi2grNrCZnkE3QDf5jbmsyBM5zc+tq0ac9AaiOTgzSbLjb2wcIniAPYyNaHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10724

Current script shows message:
 Don't forget to add the subject and message to ...
 Then perform:
 git send-email -to xen-devel@lists.xenproject.org ...
which has wrong option '-to'.
It may be confused for user.

Set double dashes for longer options to avoid that.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 scripts/add_maintainers.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/add_maintainers.pl b/scripts/add_maintainers.pl
index 380e8da22a..5ad0869730 100755
--- a/scripts/add_maintainers.pl
+++ b/scripts/add_maintainers.pl
@@ -3,7 +3,7 @@
 #
 # Add maintainers to patches generated with git format-patch
 #
-# Usage: perl scripts/add_maintainers.pl [OPTIONS] -patchdir <patchdir>
+# Usage: perl scripts/add_maintainers.pl [OPTIONS] --patchdir <patchdir>
 #
 # Prerequisites: Execute
 #                git format-patch ... -o <patchdir> ...
@@ -126,7 +126,7 @@ WORKFLOW:
   Step 1: git format-patch ... -o <patchdir> ...
   Step 2: ./scripts/add_maintainers.pl -d <patchdir>
           This overwrites *.patch files in <patchdir> but makes a backup
-  Step 3: git send-email -to xen-devel\@lists.xenproject.org <patchdir>/*.=
patch
+  Step 3: git send-email --to xen-devel\@lists.xenproject.org <patchdir>/*=
.patch
 EOT
=20
 # Constants and functions related to LOCATIONS
@@ -371,7 +371,7 @@ if ($has_cover_letter) {
 }
=20
 print "Then perform:\n".
-      "git send-email -to xen-devel\@lists.xenproject.org ".
+      "git send-email --to xen-devel\@lists.xenproject.org ".
       $patch_dir.'/'.$patch_prefix."*.patch"."\n";
=20
 exit 0;
--=20
2.43.0

