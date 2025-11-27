Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65417C9045C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 23:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174420.1499400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEP-00038V-Fs; Thu, 27 Nov 2025 22:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174420.1499400; Thu, 27 Nov 2025 22:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEP-00033H-Ac; Thu, 27 Nov 2025 22:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1174420;
 Thu, 27 Nov 2025 22:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0cJ=6D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOkEO-00025I-Bp
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 22:12:52 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36233a68-cbde-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 23:12:50 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DU4PR03MB10621.eurprd03.prod.outlook.com (2603:10a6:10:58c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 22:12:46 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 22:12:46 +0000
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
X-Inumbo-ID: 36233a68-cbde-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpduF4+IdL1Pn+Z8wDEneLYldo5YxNRjfslTJe4q8wgR04C5WpLbkIHOctDWSOEDiVtIaNOqF34VblCZ+n0HimSkihNmaKEXyd20iTEaNMxGysUsdc8yK6HbSGDBCo+XmjiLOH0z88v02LEcfXCItBuucBH8rOXNJmfb+K4U+3C/1NGDiEhUL1UgbAT1R2zZebYYPOTW//88LDTpPGMqOUzAC0LsTmZavp4Z17ddLJ9HMgsdQgkt8op9c8eAgRVwTb0wLbqnTCL8IpmqkPg+e3W1802KjOekMnaa1Q0+W6tfK8/eCDq+0Kylwdit5y4PrripUuJVSXfwvS9u8cFx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jaZZTxt+HNEmR3xuzZ2rMAPYzH0LdEAJ65xR2sO9Vk=;
 b=UbjUW5ulsNxtPQTMaK9UlTvTiRNZObFUKmIdCF5f1uv4y3MJp0GvuGTttjk0Qz4Dyz1Vlfm3x7hJQcFTV7mH/3YY3DiqtnLWbTggQnCbSF9VFQsXlRU9mRv7UoaunusJCdF3mg+e5/sUIL3Oum8gQsy4Lls78TKNtkx6WXYSpoVMHLIMjifLf2EO7SOM8puhJUIZf5ZGBKctuX0BaCjaqSeUjxlX8Er8JWkIERtCscjJCRrTqrQbe8DksIxSI10BIY0CPr+v9a8nGt2gB1rxZrT3UK5DklnY9+4LVMVUJiDgy+1Pw+sDcrCdvY0KC1mjx94oM+WKMSgXepT/V6SK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jaZZTxt+HNEmR3xuzZ2rMAPYzH0LdEAJ65xR2sO9Vk=;
 b=CPqZsT9KOvyC6PpzedSueXFBq4vK/VJKrE0Y2c9/VxEfUbx7E4lBVQ+taNQdyYgGQnuBzsqsMnN8N9S1kGNPCOYZF3Zgk3aplaEHzSWVmQLWo2O9Vym7+ta43OlRuzDn67dk4ohULddlQELOrTOLexw5rvO5I92utVo9OlaP1LEoIZfpOFJM5iA4NcuwZVoDgBxNcv2O80QIk31+r0tLDtLoTE9ALNV1mkS9Y2vfzFrgO1dXHAOkz97sd/cDGWTxJJxkUavhzLPmn+ov7hc0q/EntbpvsvTwvcM8klLlJBrbmoAvSoTaEwUp1UX7b37QnkcbnRMS6AmvhNLVIunm2A==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/3] xen/x86: move d->arch.physaddr_bitsize field handling
 to pv32
Thread-Topic: [PATCH v2 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
Thread-Index: AQHcX+r1RZK80lHptE+u/qWPaEQ8Kg==
Date: Thu, 27 Nov 2025 22:12:46 +0000
Message-ID: <20251127221244.3747918-4-grygorii_strashko@epam.com>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
In-Reply-To: <20251127221244.3747918-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DU4PR03MB10621:EE_
x-ms-office365-filtering-correlation-id: eb8764d4-47d9-4089-2096-08de2e021860
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EgP3JcfwHM03RsBLq5SDjdYVsVJFlePqcKkj3lYxKWTwTElPc0nVM67XRa?=
 =?iso-8859-1?Q?pyYNcAfNKE0kwNcfg1pH6+ZH9c8X9u95GbjE44xDj+CoO8QImi7zbW25T8?=
 =?iso-8859-1?Q?cwthB0U4MhZtqD0kykn8qkY5LP+mQzTfm0xC/B4nXcgzCstZ0izcTA+NZj?=
 =?iso-8859-1?Q?VyWoh0i0fxebCETWih280bzpX2o8ZptSWH5LBt4J6HHIJ2lrp/sG3IjLDX?=
 =?iso-8859-1?Q?TYvbO+kLS4YrHfsF2Y9D00VTPJc1g71aGWcscGqfx97D4rsnxlmNIF89U2?=
 =?iso-8859-1?Q?3zPCmLmyaP6hdfJpq+be6c/7z4d9q0HPiOIuwX2hJI9mOK+2MqyCKd+fbt?=
 =?iso-8859-1?Q?Vh5jbStR19CR8wXZEqls3nlwhU/pSDRsgL3fiDDQHmGqms/1Ox3tq/hUzZ?=
 =?iso-8859-1?Q?MaIrEOFuXjIq5z+5apKDI5ggwD+4vIPhQCqjxxjFYemPR9mem+ZDifqNOE?=
 =?iso-8859-1?Q?ghSDx+Wg9qiGg3PblaAjGukH19F9i0iaxtQ9i7Ue7HthFTV54ppX4iA3Wb?=
 =?iso-8859-1?Q?Y2uRMpmWn8ruOt8KSW5MVvg63hUg2nCYawRFmdkptglXUL5GhGuoefnDx9?=
 =?iso-8859-1?Q?eD3OoMk3EGP5dNRTuS92vQtQCl1Swvjbq6VDVCi5ceNWvltVSlfqepocbi?=
 =?iso-8859-1?Q?gAfadJicl8B9gHlLWt0+nG86qB2urHWhW53O05pQIVI8W9RS4HC2SJcgkz?=
 =?iso-8859-1?Q?yuKkY3R53Tp+nVlEvMb0PHEh8obGtx5SR8TS7RVQn+56rcF9q8GXVxoeNu?=
 =?iso-8859-1?Q?uslkrR9G9nDGDAFcjCB7Fezk0WLCT4Vs9abmQuhzQRRWfbj85xyOVrUi9Q?=
 =?iso-8859-1?Q?RVj3M+4Mvnv8J03BIVJ3NR+Jg5NkzvTJRfus1zPGtDk3HsywUnWsafRYyu?=
 =?iso-8859-1?Q?vrr6sQLJl3zfqzHOlELzOVei0Ptiy0T9EbF4tPa7tQClfQUM8D5cUA3euT?=
 =?iso-8859-1?Q?CI97uykWXbAB+4N/deveCZwGPgBfernj6S5xptZY0WmLNefrkMD+pl0z3v?=
 =?iso-8859-1?Q?x4IX23jfN+Ch6oMDO6H0PAxgKjHVS2+SUGGmmqStmF+wnhKKKbs7Sn1nGc?=
 =?iso-8859-1?Q?75oCn+XIf0FCeHLZ29C+YwEGlI4cxNUeWUxwLCWPINKEZuamAazQDaZfvj?=
 =?iso-8859-1?Q?+3CZxkKbig0eRKLeeyecWBJTRSYWgOlLHthoXSqgXjPOYCQqj4dAiOM9oh?=
 =?iso-8859-1?Q?QSFJoRPNt46xRj9jmnvsVLPO2eN3/fByU4Q4x9v490HY3qhJSC7fYjSd4J?=
 =?iso-8859-1?Q?ged0WQZYFHVB+ePYHYhQEOKmNqc9AzUTdDFeIo8LmorF0HhJf6yfPXDzRr?=
 =?iso-8859-1?Q?4PUY5U4GMV/AbTLcp4pVkz1B5ktTAN7ZtYWzkJWM6lfjP90Em140RhwBOn?=
 =?iso-8859-1?Q?dasTJGS4fhilVzt0IZifeX4HDM49ChjykB7WkxeC5rnkpo0va1PA7DHhLE?=
 =?iso-8859-1?Q?i5Ni1bY41napgosu03OzZld84BjipJyi8Jy0H/MFE3BWgOMMzBPAdbBCR6?=
 =?iso-8859-1?Q?5ZBfhSglvOyGfZrOJCookomu/SO0K2FO1WB5wyPECV8XK7eZIYY/mH7bq0?=
 =?iso-8859-1?Q?wAHKjyzw6drNdt2te9wmX2IAmYAI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hkyIab642dZ2ZpJAJIXE7lQlFPLSx0ZcXYppMP51LiyalUdTId37ZF5SCr?=
 =?iso-8859-1?Q?it6cJP921e98K/+k9a4v9q0STa/hJne6xWUqW9p0za5JKR3FwWIfir+N1x?=
 =?iso-8859-1?Q?ODFHt91c+60Mwj+5z5orYE2FSq/M5OeAQU2D9gBx6ZlPTPr3fSqbOId5ci?=
 =?iso-8859-1?Q?2RfBd1A7RHE35+4SpMeHxJkYFGHlRQ8FNclgd7o2xH6vK8+9UHH3xP7QeT?=
 =?iso-8859-1?Q?YYcoljDQq1Fue7H2wJ1NoTCzFFAzsHIGkx3osHIihDPWc+3GYBNyLielq+?=
 =?iso-8859-1?Q?yitaZ1b6yYcH5rz2CxR0d1c1MJ3LmakzfY3ii6FMWociWndNYOhdgt3Kg1?=
 =?iso-8859-1?Q?EkdvceysjbShprJkBd6mQUmjdAQZN46WoOSjIXVq2IZc9SXVfjA+19J3nW?=
 =?iso-8859-1?Q?r2xJ0WY/7TzPAYcDwgw2woEDw3b8QxMz2KYizWPR7veBiUHHR9jJOh4wcc?=
 =?iso-8859-1?Q?l6sl1In/FWk1JOKrMHKJBn7V+yGGAhOlScBYF9anoAUL5jVXx4hGqeAo6Y?=
 =?iso-8859-1?Q?a5acsyCDyog1T+OBcWktq8Xkj1ZiYI54gAK3RiFWCxIN8+ooZUNhKPc20d?=
 =?iso-8859-1?Q?DskMXb/qaKqIza+qeLm5VPzK9UY+DC3mQHkPQ4rTtbE/1XM+bG1N2aMIc9?=
 =?iso-8859-1?Q?xgOt4BQGanvwlhnIMbL1KaG0XgQbyWVSliuX04i+pqXCgHX6jQzNwD3AmI?=
 =?iso-8859-1?Q?aLqvA8IDvYXarz+XbClnmfaKiH9EoKVorHe56V9UUSt8wPjGRcOoQnCwNT?=
 =?iso-8859-1?Q?YpAasOR84ZIsqlIkddl5JsDaHKzbz9endUgFz7i6FDlEuw0/pnQ6Va453e?=
 =?iso-8859-1?Q?hpttFwnhiRjGW6eCLCv2tthKbEGCSeGSLDB0xTbCsX7vE7GHbONqB1p/Jh?=
 =?iso-8859-1?Q?PBGO81iqnwFrU4cdmHc6cKLLEMeY1oo9DJLtDkhDz8QQjFcnF0vujYPrTs?=
 =?iso-8859-1?Q?FUuJ5vd9QiiWc43O8hvEZjozsSImK1GZNp/h+F4JKVn7PW96uAmm1xi619?=
 =?iso-8859-1?Q?85nM4GAGUurT8XeCYPbKLHc/EBuz3nYyhNK8StIfd3SciC2BK8+tlpQmYv?=
 =?iso-8859-1?Q?cOQzMivQUjjTSMW+8HUxy2F2TXCDhrlxtxGwrau+Jfj7nrvTQzzyxKxjKB?=
 =?iso-8859-1?Q?RwhWwRMuHJZbSl7JFHJcvLy2WeJB1RZkB6y44nS5YRjg2iqkWGGR7rE/DP?=
 =?iso-8859-1?Q?RxyjQ7r6DmZe0K7zTAhUAa/VWMr/CA2Y0NUea4mznmSnrNpocYzgq98xTW?=
 =?iso-8859-1?Q?xtEq8sUFc3clyPPIde8XujZ2Egg9SabIUHtFYkBMHey76REYpYRmSgHHr9?=
 =?iso-8859-1?Q?Q6VrCFcYY6uXWSsU08IsZyPrMAH6C1U5contsD8zhYSWsSO7rtm4zCxnc3?=
 =?iso-8859-1?Q?Ctm2OaJr/dAjkdiXsP24dw8U6ardpAtwalmk6DYmQsV9spL5m4jtql6Hby?=
 =?iso-8859-1?Q?XIxENsjE1KxgDf2Xpk7BscV7kS4GOzACziyPKEWZdbqFxQO3dbFLHrvGqg?=
 =?iso-8859-1?Q?4WzMgLjU87CjvnUJnTOpmQQOtxtDuu+eOfNljIOvbIHygj1qxej6uDpIM0?=
 =?iso-8859-1?Q?OBPd9do+64ti5k6c7GxJ42BwxjodSMaBCn9RieSdLPHLQ4Y1PUfIEjEaUR?=
 =?iso-8859-1?Q?gf4XRXSuTff+acn29Y9Y1uSinirHQErqgQXtYNIamqVbaagUo2HOZkQg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8764d4-47d9-4089-2096-08de2e021860
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 22:12:46.6645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFS8nM+e5okxuny/CvxPxs68IJDO8FcYov7oo+C11pzjHli6+5BvdPEuBa8yqUU4yJRe8BbJl4O2UhXz1D7o2uF2AHsFT65oBBtiLnzzQdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10621

From: Grygorii Strashko <grygorii_strashko@epam.com>

The d->arch.physaddr_bitsize field is used only by PV32 code, so:

- move domain_set_alloc_bitsize() function into PV32 code
- move domain_clamp_alloc_bitsize() function into PV32 code
- move d->arch.physaddr_bitsize field under PV32 ifdef into
  struct pv_domain

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/include/asm/domain.h |  8 +++++---
 xen/arch/x86/include/asm/mm.h     |  6 ++++--
 xen/arch/x86/pv/dom0_build.c      |  6 ++++--
 xen/arch/x86/pv/domain.c          | 23 +++++++++++++++++++++++
 xen/arch/x86/x86_64/mm.c          | 20 --------------------
 5 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 5df8c7825333..6cdfdf8b5c26 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -276,6 +276,11 @@ struct pv_domain
=20
     atomic_t nr_l4_pages;
=20
+#ifdef CONFIG_PV32
+    /* Maximum physical-address bitwidth supported by this guest. */
+    unsigned int physaddr_bitsize;
+#endif
+
     /* Is a 32-bit PV guest? */
     bool is_32bit;
     /* XPTI active? */
@@ -316,9 +321,6 @@ struct arch_domain
     unsigned int hv_compat_vstart;
 #endif
=20
-    /* Maximum physical-address bitwidth supported by this guest. */
-    unsigned int physaddr_bitsize;
-
     /* I/O-port admin-specified access capabilities. */
     struct rangeset *ioport_caps;
     uint32_t pci_cf8;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 17ca6666a34e..128115442ecc 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -619,9 +619,11 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
=20
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int=
 pxm);
=20
-void domain_set_alloc_bitsize(struct domain *d);
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s);
+#ifdef CONFIG_PV32
+unsigned int domain_clamp_alloc_bitsize(const struct domain *d,
+                                        unsigned int bits);
 #define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, =
bits)
+#endif
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21158ce1812e..e4f95d8f2fc8 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -626,8 +626,9 @@ static int __init dom0_construct(const struct boot_doma=
in *bd)
         initrd_mfn =3D paddr_to_pfn(initrd->start);
         mfn =3D initrd_mfn;
         count =3D PFN_UP(initrd_len);
-        if ( d->arch.physaddr_bitsize &&
-             ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)=
) )
+#ifdef CONFIG_PV32
+        if ( d->arch.pv.physaddr_bitsize &&
+             ((mfn + count - 1) >> (d->arch.pv.physaddr_bitsize - PAGE_SHI=
FT)) )
         {
             order =3D get_order_from_pages(count);
             page =3D alloc_domheap_pages(d, order, MEMF_no_scrub);
@@ -650,6 +651,7 @@ static int __init dom0_construct(const struct boot_doma=
in *bd)
             initrd->start =3D pfn_to_paddr(initrd_mfn);
         }
         else
+#endif
         {
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9c4785c187dd..ad40a712ac5f 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -230,6 +230,29 @@ unsigned long pv_make_cr4(const struct vcpu *v)
 }
=20
 #ifdef CONFIG_PV32
+unsigned int domain_clamp_alloc_bitsize(const struct domain *d,
+                                        unsigned int bits)
+{
+    if ( (d =3D=3D NULL) || (d->arch.pv.physaddr_bitsize =3D=3D 0) )
+        return bits;
+
+    return min(d->arch.pv.physaddr_bitsize, bits);
+}
+
+static void domain_set_alloc_bitsize(struct domain *d)
+{
+    if ( !is_pv_32bit_domain(d) ||
+         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >=3D max_page) ||
+         d->arch.pv.physaddr_bitsize > 0 )
+        return;
+
+    d->arch.pv.physaddr_bitsize =3D
+        /* 2^n entries can be contained in guest's p2m mapping space */
+        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
+        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
+        + PAGE_SHIFT;
+}
+
 int switch_compat(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d4e6a9c0a2e0..8eadab7933d0 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1119,26 +1119,6 @@ unmap:
     return ret;
 }
=20
-void domain_set_alloc_bitsize(struct domain *d)
-{
-    if ( !is_pv_32bit_domain(d) ||
-         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >=3D max_page) ||
-         d->arch.physaddr_bitsize > 0 )
-        return;
-    d->arch.physaddr_bitsize =3D
-        /* 2^n entries can be contained in guest's p2m mapping space */
-        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
-        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
-        + PAGE_SHIFT;
-}
-
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s)
-{
-    if ( (d =3D=3D NULL) || (d->arch.physaddr_bitsize =3D=3D 0) )
-        return bits;
-    return min(d->arch.physaddr_bitsize, bits);
-}
-
 static int transfer_pages_to_heap(struct mem_hotadd_info *info)
 {
     unsigned long i;
--=20
2.34.1

