Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2DAF9BBF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 22:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033716.1407025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnC9-0006na-1N; Fri, 04 Jul 2025 20:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033716.1407025; Fri, 04 Jul 2025 20:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnC8-0006l1-UT; Fri, 04 Jul 2025 20:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1033716;
 Fri, 04 Jul 2025 20:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSlO=ZR=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uXnC7-0006X7-Ia
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 20:39:39 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 008bc39b-5917-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 22:39:38 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by AS8PR03MB9414.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 20:39:36 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 20:39:35 +0000
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
X-Inumbo-ID: 008bc39b-5917-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBjoLqraoelj018rEINNCjAUwK2j7eUSb1VFeUHkRAJArsdFiB/pmf9hVUMyV+HN0OjeOSlHu77sfPYZOYiClhY9goNUOCiFYlpg3Uv/qM3r0EnPkvBv/wk8i0KretRieistP5pcXg+b8D19UhXkoiimzVA3E9kMmICSVzWLgWxItFecxNf2jLTEMbqTEKCWLw/cI72x/3SUUd7UYeggv81E4tc4D6QVy385UgzvNJWzaYsQlQ605Z/QoPJn6eJhZRFF9s3lZ7MB5+UP3en9Sg+dQgMON/REGEtjPeJlbeYG3UzcjJxH232RVu+sI2VNgMKCi2kb2HxhTal4/gM+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFEhnjI1bfoyDLK3xv+TPUZ1vpS2vxUiyW7XQCXI7eA=;
 b=eCkoNQyLE50ScpXcdZ+FpgXpyBAX2e9w/gsPxqvhvuFhH1HgZDhaQac4bszAMiaONMxur2S0n0igymIf1rF9+vKDrDpbNVVJ8xaR1U3Mg+48xNY4PYI6s+CesY20LnGQHVRxTPdfrNYUNBFrE6fETePZV9JZchnTpdJ2GHOs6ga88tCvJEFS7I3FnuOH9miZAAqIV1PBHdgAdvg3jKAjTlgINeJPLvJ+7Bp6FsskyGIfblv3d6WZQMOrB8ZiqKQ4VO8t8F9qA/9XC5AxkKBFd5MajS5xPLd4Qkbt3kmTYR2leAVY+feLJqsXBrRht5KQRXK66je/uKyEge3FHtwuKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFEhnjI1bfoyDLK3xv+TPUZ1vpS2vxUiyW7XQCXI7eA=;
 b=kS6DPuuIQloBBmo3tda925EQGfihAvYU/PirXjj1tkSbpjyTTxzi3SCxhUxFBMX6aYlHIINEAf63DxMXeNLrvGsvwGC9PT5kqM4ogjbmGVLvjdoxsJaD/kG9+6c0aN5aPgO9wHlNQ3XYKYGn7bJtssaan4jHwYQgY8ntGb1rXAFzu8tfVEUbYapwbrxl2JGIiHmxHlXMG58oX6aZer3e5BBPvE3mPFcgNimPOhDznUuSR4qfLROBV1JgoZsJM5tCVxC3LVY4nbqzFw92PcoPuotBViYxAWcM5sUXyffHk0+ZEmnk+C/1vfH4FGFiSHSbwmf9bS8+NmM1cTiS0S5Ejw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH 2/5] iommu: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH 2/5] iommu: address violation of MISRA C Rule 5.5
Thread-Index: AQHb7SPBz9lylza3OEK8worIo7OoNA==
Date: Fri, 4 Jul 2025 20:39:35 +0000
Message-ID:
 <29ba418db4a7a193fe07fa9927b4ab75e0355fcb.1751659393.git.dmytro_prokopchuk1@epam.com>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|AS8PR03MB9414:EE_
x-ms-office365-filtering-correlation-id: f224c584-2c52-4018-d94e-08ddbb3ae39e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+DL1qFnAtdlgw9MZ8jnnVIPk/P40iqHcD76f3vuzRCx8ep34CwWUG6v2K5?=
 =?iso-8859-1?Q?b7aoBHXYSkVhCI08IA818jkBiPfu7pd81OhkeEQj0U880MCvN7or5juUFl?=
 =?iso-8859-1?Q?YcT3CepWDI4odiDkpnRr2QQ14JMN6nj9PNYtw3sBGR+HrSRghjbSft0EQM?=
 =?iso-8859-1?Q?htkFQEQ7E41tLsnuFGubjPxlCw8vM849niQXIPf4Hzq8YUrqYhSciF/7By?=
 =?iso-8859-1?Q?nWwoFNGTemDivgssZx/PQ+vPTA35f6lPJW88HcsAqD0mPAEGfrbjKUEJ6a?=
 =?iso-8859-1?Q?mzRcNKqxTkCffAPoorkTWRlDyTiVl5GMHKwKtBD5AFyBfuOSNo34fvqtLv?=
 =?iso-8859-1?Q?cd92NmdyV8gKkZNiSQy1AUCqroHZkMHxdHpnul+xVfkqjwtv9D6XyIQkp6?=
 =?iso-8859-1?Q?qHIG8vNzGgZchm3f8dricdh/8lc7BDqksDenQgyrodHvBZTjQdHVR8vfPK?=
 =?iso-8859-1?Q?LnUadpM8i0tHpXscxSRtZ0CazQK63xXxEBLcZVbcTYZXIBVVD239vuDhDa?=
 =?iso-8859-1?Q?OKOdn9cbtTCeEO35hLwltajoYbkNhKMVcegx4YYTR8aKKKqqRHKVW1cCwS?=
 =?iso-8859-1?Q?1ZVdy3NI3TpHlGL08dO7OpidCMG7Q4qIsPVAjDPHFMMlXFeX618iJe0Itn?=
 =?iso-8859-1?Q?EldHtul0nreDyrsHHvhKtssy/ye2xa/Wc2zUpbpDxRhFbmCYi8SXvEBjiN?=
 =?iso-8859-1?Q?4rbKrje5aI6lplExB2b4tKIOMU/8S83HDQOO04YJ/aCZOpn14lTblasGfO?=
 =?iso-8859-1?Q?y4tDx8h+CxY6pZjDPh0ANXgLpj4KXoTZF4JVQ/K6LqqwVjrC3qXfUISHsg?=
 =?iso-8859-1?Q?gYO5xENIBsq/8HlhuoEazkDj60EzWUJjSVvBjtxhYJq/DlF+nX3CgYJ1li?=
 =?iso-8859-1?Q?QiHCxxAUqx+Co1PoVhRGLhb8hnvSZq84FC1K6kAK24DTUHOZq/PlVBZu11?=
 =?iso-8859-1?Q?ui3HGie1gqYcr/yFi76RzPxQ6bx0QLx5NjIK4i9ZVL059j4op7J1sHUyBS?=
 =?iso-8859-1?Q?qGTpmn8YjJCri7vjp6jyW1D1v+v7InGzixy2P/ASwAqJu0X+3n8u5nqctJ?=
 =?iso-8859-1?Q?VU8Q110lBsv8DHfMmrMDUN3X6epcGb/PLPfjomcU0eMn4pdWD6EBZn49hK?=
 =?iso-8859-1?Q?DdJ//rDqGiO1MFvqh9uhRBcZWENcLryIc3vrlmARymGnzn7tTW6zIqVBMu?=
 =?iso-8859-1?Q?MiNVsE2QylGepzMu/FIi2+TaKjRS+ijkdkYg+sGkQJMFbGprlUzmjMSMIf?=
 =?iso-8859-1?Q?bSCREfybDtHykNUiUNEohYlWYO73+jo6dPrMvCUH+OK7XXgVgXdfy1IjaJ?=
 =?iso-8859-1?Q?EVsrXGdSIfWqUoiq9fSVJJ0R+jd1WDhO/hl/b2FgYYdkDcU6HtehngdVSJ?=
 =?iso-8859-1?Q?9Iw6SFcwfJFk9pDDtA0OslyQYN98TrzcLRiNWf8AuGW4QZV7+wtk79uteS?=
 =?iso-8859-1?Q?mUiZJEppKEtZztxAxz3I8VdSlIEAsjVGKHx74rTN7BZ/wWCl3uwxZfYYK1?=
 =?iso-8859-1?Q?yFTFdfHDCDLwTlNZCMbv8Se58VVynG5sHCyfs3oGsKGQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tZuAu3Hva/wwYekEOOXPUCAxvGmy2x7/Uxqr4qaBQu1RTlMblTj+fj7Z1g?=
 =?iso-8859-1?Q?ClSB84h+CsJhtK3EVWkwRgXBn82Z4fNykCc3za4KkbFuf9wUy00ZijP6I4?=
 =?iso-8859-1?Q?NDwo/P60CF0in4uo5NnxQgANA+EE71GIXs2gDUWXX8RE4gUWFjDBI0RfIU?=
 =?iso-8859-1?Q?CfBWYIxmWKL0NovgLfLkIS24XOLrY0MNfYVOD/wlK0m+HzYwaslU9AJG4l?=
 =?iso-8859-1?Q?1HpX9Hmc0GWORDVzmzcarnoQ2/YXDJExsmAAi3EdPLfJXD00UELwTZubSe?=
 =?iso-8859-1?Q?HzRPUG45aOw6stDYExw60+xvrm2Z7YQTE0X66kjh5B+Qmj6Y4Ubsrz6a1T?=
 =?iso-8859-1?Q?756GfAV8BPTauSUlBBr2LxVuKMkBQ5haby2zPdvchZ9SvsBxqLOKb2QkNq?=
 =?iso-8859-1?Q?TrKgx+wvP4xK291I5YvualMioKez67SA2SPhJQI8DA4mcFtom23Og5qDUG?=
 =?iso-8859-1?Q?y1zKukv2LdL3RHWDVnezbTtEFCPJroFSgC6wRitinTcDhXjeEAw2RzLE1t?=
 =?iso-8859-1?Q?h/6LJRmQSq0H7hRm7e0PiPi1pxw+T/EReG5dnd7ZmI6Ty+t2cP22NPBGNp?=
 =?iso-8859-1?Q?YOLNZzP/f6llXNyP0IaZC8+g7fCbhrGP6UAbOS5LKK5BJb1hxJS1Ey9ZsS?=
 =?iso-8859-1?Q?JQCJ837lgzDzVzbjaPqCVFyvV2+2BGBycJXLncZYldlJLYgDUHMcrAtlfe?=
 =?iso-8859-1?Q?JjZCwMHnXtMTU/l++MlY7bw4hu5MSTHNrCgFF8TledncdvmoUZKMKQd1kD?=
 =?iso-8859-1?Q?FQmvixBgBpq7c6WycDxIqkZP1QWyyPzgvfG9eEb1z7F6GrcLdJhoTRZkMH?=
 =?iso-8859-1?Q?qvl0LqWRNaHskRxszhv5U4aU45PcdXjUXcx5kCGFuyPGuYf03DMz8n9B/J?=
 =?iso-8859-1?Q?G0x7T1FkZaI/UyPL4/sri96tcvMTnraK/1mN2NbcB7vGTWtopnhhGMsGAO?=
 =?iso-8859-1?Q?IvQ62jfwyB/c0GUN6abj7QEyN3RWarbm+ReeoW/QDnca5GBwWSCLOKndHO?=
 =?iso-8859-1?Q?rmTFHcni0T/ugLO08R9lq93CScNrFJNFAEjHxeyqfpFwZBrZ2hhB/IJXVU?=
 =?iso-8859-1?Q?y5zvQZoeGol7BQ6vP/8Od2FJEXmJsWZhZ2GbI0U/QZq7pMGRuc3iACWtb7?=
 =?iso-8859-1?Q?PSRgu1k+pL5vjviMlypyN8RslvEd+Zps0RmtaltM4AqKUWC6RRxiI7mqnR?=
 =?iso-8859-1?Q?5PF73Jt74I5KWuUU96ESKTK5o6MVHAXg3FlZPK3N+63G75/WDemP56Qth+?=
 =?iso-8859-1?Q?eyowquiGCEZDgbAv9Kjai6bs52336jaM24UY0ue43shG9DMjaKtNggIvas?=
 =?iso-8859-1?Q?hy22sXL/5wNlupgpJzjtBpIhNGgiG2XaSjgDaY/MwX4KvZ6tpUtEpMGKV/?=
 =?iso-8859-1?Q?kBowNpDug9DOP1cfL6ZTe2+TXOzZ/ew1ACMkrKN2dl+SOQoA0uMxjZsFuM?=
 =?iso-8859-1?Q?D/MvhAqMp4LZIaNkb4xZGoHhxU1RKfREsJFqzpcOlXjzKz2QjEhEyEdWpq?=
 =?iso-8859-1?Q?3Fi+dpJqufkUFqezmCuqR2ZcTWpRKEQxdqv+y6dxnSi598I1MnajtgChpf?=
 =?iso-8859-1?Q?JcDAVZGGpLzSD2/1TRNGFn9fz1iLFLzFkSIxgcGMwtAlASI5XPtDAr/9Kk?=
 =?iso-8859-1?Q?Z3SVKOaryC98smvvE4DP5HN/eIGINoUenH37TDZLND9d5oPKOgvLBMtw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f224c584-2c52-4018-d94e-08ddbb3ae39e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 20:39:35.7216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3p0J3WkdLzXjP2Sr4IHnRpArVGvl7iKI5jaKdCtnRp/r6GPs8wahLrPrNI/e8/pi3U4UWpzknIaPInIzBfFRiBEbtbW8Ukk4jQKYLhEPcY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9414

Address a violation of MISRA C:2012 Rule 5.5:
"Identifiers shall be distinct from macro names".

Reports for service MC3A2.R5.5:
xen/include/xen/iommu.h: non-compliant struct 'page_list_head'
xen/include/xen/mm.h: non-compliant macro 'page_list_head'
xen/drivers/passthrough/iommu.c: non-compliant macro 'iommu_quarantine'
xen/include/xen/iommu.h: non-compliant variable 'iommu_quarantine'

These external variables ('iommu_pt_cleanup_lock'
and 'iommu_pt_cleanup_list') are no longer used
in the codebase. Removing them eliminates dead
code and ensures compliance with coding standards.
Fixes: b5622eb627 (iommu: remove unused iommu_ops method and tasklet, 2020-=
09-22)

The variable 'iommu_quarantine' makes sence to use
only if 'CONFIG_HAS_PCI=3Dy', so place it inside '#ifdef'.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/include/xen/iommu.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index ebfada1d88..57f338e2a0 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -53,7 +53,9 @@ static inline bool dfn_eq(dfn_t x, dfn_t y)
 extern bool iommu_enable, iommu_enabled;
 extern bool force_iommu, iommu_verbose;
 /* Boolean except for the specific purposes of drivers/passthrough/iommu.c=
. */
+#ifdef CONFIG_HAS_PCI
 extern uint8_t iommu_quarantine;
+#endif /* CONFIG_HAS_PCI */
 #else
 #define iommu_enabled false
 #endif
@@ -500,9 +502,6 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, st=
ruct pci_dev *pdev);
  */
 DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
=20
-extern struct spinlock iommu_pt_cleanup_lock;
-extern struct page_list_head iommu_pt_cleanup_list;
-
 bool arch_iommu_use_permitted(const struct domain *d);
=20
 #ifdef CONFIG_X86
--=20
2.43.0

