Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC10E201E10
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 00:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmPaQ-0007Ul-7w; Fri, 19 Jun 2020 22:34:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bIi=AA=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jmPaO-0007TH-BP
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 22:34:12 +0000
X-Inumbo-ID: f9b03fd3-b27c-11ea-bc14-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9b03fd3-b27c-11ea-bc14-12813bfff9fa;
 Fri, 19 Jun 2020 22:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thtc1tGbhDltbnVamDKC92aY1/I3rkoDIjA87DehlksUcANdDogo2z3CY4PgBpWsaDOVV2nlNlDtyvM/enk9G3NJNEukvOjjCrr9lxz/JuAozxcw6Q85VfP0N3vO6TQE8gXrpEsvo+KwbtiVwjPTTVyBUQ0xTsWd78xqb86J+U1w9+90R/9wh62hwEmGbTdQnwhjmCx8avHhg4kGleHDl9+RdeHZCoxlaj4Fq53mCnzCSgPyRVn/lIruFA1OtdNAB2ANXojzQ7UeDw01rPsVHYuX6FzPCFryUgGmBVSDvJw+pQ46Zpjcs+MhLYJDi5Nf4w3V6Tekbm8jP9u7m+cKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAnBWq8tWHxmxrR1Lhikfu3J6pxcgll70UUIJjlkUNM=;
 b=TJGbMikEq95GYRQb91V6rPTatVIPels3MHmf751eDP+ATxdMG1qFsIxCYGl9BlvmBk2fyth31HrERTvPP2VXKTWIr9aJEwnpj5Gkc36/P9BUJcc3XYgUDEqVu0HIwvv7/6V7UCAEakQ4xtdI2fCZJCTZhec6xQnEQBJLVKQ3QUI/kC2nauerK5VhOhFF+kyI9sDzxsKYBo8sYP13qXdeaSbIgKakYaY/WkozNi6AWZnr4L9Sf41XkV/7pC4cafg0UjlvMN9hc25yKRaPb1j+IRcmf3bMbSi2FMHlUj7MPZKXFqFJeivK1qlp+pkW8F0Pob+3ra/OS2H6gyfb8dJpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAnBWq8tWHxmxrR1Lhikfu3J6pxcgll70UUIJjlkUNM=;
 b=FfMfZRLaOViq3yFscyeWC1EpOuo+ZvjWs5vxxFDnrZqB5jMtA5z6FHANIW6d00nu32qQYyjA9Up1GeRivmhXmfhjcXGwFeAm9Ap+SCxUZdQzHPd9vR+izbFU16voSa6R8uNFrCboGYmKTE7NGIsGcrHoWA1maUo669iaaYe/2/waQWhcRxzPcE3t6adY3LpNS8X681vhAomalFI5vW9w0CIb8JstZ7OD/3IrQHuACvF/+lxTqZd0ykdlKSpcSnM21juNL2+IXOQopqp/hK37o9B0RSBmtHypSG70CWrKh/2yIkKG/JUyjjOW1CANei8JotbhRnEv+uXcnKE3ZEMR7w==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB6304.eurprd03.prod.outlook.com (2603:10a6:800:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 22:34:01 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3109.023; Fri, 19 Jun 2020
 22:34:01 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "pdurrant@amazon.com" <pdurrant@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
Thread-Topic: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
Thread-Index: AQHWRom6aQ+ko86LqESb88QJVYc4LQ==
Date: Fri, 19 Jun 2020 22:34:01 +0000
Message-ID: <20200619223332.438344-3-volodymyr_babchuk@epam.com>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amazon.com; dkim=none (message not signed)
 header.d=none;amazon.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8d71259-a699-47b1-9fec-08d814a0dd39
x-ms-traffictypediagnostic: VI1PR03MB6304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB630403CC8E72A1C6EB4F2871E6980@VI1PR03MB6304.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PHhC2yX5B7fEWI6Ricbea9m75Dsjg60RlMMS+wmPGODdma5GXn0ez9lOpKap5TiTmqZl8vgh5bi6wM12ZJCkiP3KOlH1WJMoprAy+zFXIphrymPSrTuXpBSMGIQdzOkXR3IkFy9jWfUH1F6ZUeIiK/5UEUlHr++RwNsvl8c+Bi6MJCnNPqN3RxzyrzevVd4QHP0DXhkPPOWtMK5ed12ensuy4qLtkrn08wq4ycfXzrPbLwiRowXjUiTPZrgY8d8ZBJwABnQlBR7aINx4mk22Un416c+6eBgp0oXy08Y8T7GGgP/gzOakwo1bT1tOrJ2EWOpVsMh+IxhDNVVVCGfBqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(66946007)(66476007)(76116006)(91956017)(66556008)(64756008)(86362001)(5660300002)(66446008)(2616005)(4326008)(36756003)(6486002)(478600001)(71200400001)(2906002)(316002)(1076003)(186003)(54906003)(55236004)(8936002)(26005)(6506007)(110136005)(8676002)(83380400001)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: EwgVDIyclKS2zfZGbyPhO9kQsSSDKdcU5WY3daFNe9BFSxPJ5zjjb10DKudo0vI2ZIggzUkfBEGK1rqRgbaFNzgS6eBszPpa5TlPnGEZVjp53AOYNZ3TONTuuLfNEV5DSne/JICl2H092iiVGYlNZlQ1InceqC2l4goTaiCwOk9OhrBgxTG2WPS61ebq2lbPCG44+F4T1iQ5NTCE1yXkEdlZdAjaskvkZJ5oVw1lLNrCMjtbvF6J3Ng7oI6kibhuUr0SPAFLtEUUB/cY+JHwxWtNnBJ3IliDT4Lzmy1qB8wm39y0dsOmvvSxaFxWNrW7R5suLZaIO0c58GOf+qZ3jd1DHx7ldNyqbeh7js1U7OmWMkiv/iFDnJjJoRKtWS4/3l0MP8/wS3ylQOyqLgqUPy7FjtcTJpm7UtEG6ecU6tXS5XO+3zx3wjg0Re4efROwnSxAZOidO1SCSsv5oFyb4ilu1sBG72VGFU7v1P5L5Aw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d71259-a699-47b1-9fec-08d814a0dd39
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 22:34:01.0430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxxPRC6aYy/lrCpOvMPuQ8FxXvzo2YG78KqOoXInMFU1DyDGOu5EvlxyhqC78EZavTEE7iUA1nIuX5Fele7IKhw9YoS5BN7X7ZFFYvXvisc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6304
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Trusted Applications use popular approach to determine required size
of buffer: client provides a memory reference with the NULL pointer to
a buffer. This is so called "Null memory reference". TA updates the
reference with the required size and returns it back to the
client. Then client allocates buffer of needed size and repeats the
operation.

This behavior is described in TEE Client API Specification, paragraph
3.2.5. Memory References.

OP-TEE represents this null memory reference as a TMEM parameter with
buf_ptr =3D 0x0. This is the only case when we should allow TMEM
buffer without the OPTEE_MSG_ATTR_NONCONTIG flag. This also the
special case for a buffer with OPTEE_MSG_ATTR_NONCONTIG flag.

This could lead to a potential issue, because IPA 0x0 is a valid
address, but OP-TEE will treat it as a special case. So, care should
be taken when construction OP-TEE enabled guest to make sure that such
guest have no memory at IPA 0x0 and none of its memory is mapped at PA
0x0.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---

Changes from v1:
 - Added comment with TODO about possible PA/IPA 0x0 issue
 - The same is described in the commit message
 - Added check in translate_noncontig() for the NULL ptr buffer

---
 xen/arch/arm/tee/optee.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 6963238056..70bfef7e5f 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -215,6 +215,15 @@ static bool optee_probe(void)
     return true;
 }
=20
+/*
+ * TODO: There is a potential issue with guests that either have RAM
+ * at IPA of 0x0 or some of theirs memory is mapped at PA 0x0. This is
+ * because PA of 0x0 is considered as NULL pointer by OP-TEE. It will
+ * not be able to map buffer with such pointer to TA address space, or
+ * use such buffer for communication with the guest. We either need to
+ * check that guest have no such mappings or ensure that OP-TEE
+ * enabled guest will not be created with such mappings.
+ */
 static int optee_domain_init(struct domain *d)
 {
     struct arm_smccc_res resp;
@@ -725,6 +734,15 @@ static int translate_noncontig(struct optee_domain *ct=
x,
         uint64_t next_page_data;
     } *guest_data, *xen_data;
=20
+    /*
+     * Special case: buffer with buf_ptr =3D=3D 0x0 is considered as NULL
+     * pointer by OP-TEE. No translation is needed. This can lead to
+     * an issue as IPA 0x0 is a valid address for Xen. See the comment
+     * near optee_domain_init()
+     */
+    if ( !param->u.tmem.buf_ptr )
+        return 0;
+
     /* Offset of user buffer withing OPTEE_MSG_NONCONTIG_PAGE_SIZE-sized p=
age */
     offset =3D param->u.tmem.buf_ptr & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1)=
;
=20
@@ -865,9 +883,12 @@ static int translate_params(struct optee_domain *ctx,
             }
             else
             {
-                gdprintk(XENLOG_WARNING, "Guest tries to use old tmem arg\=
n");
-                ret =3D -EINVAL;
-                goto out;
+                if ( call->xen_arg->params[i].u.tmem.buf_ptr )
+                {
+                    gdprintk(XENLOG_WARNING, "Guest tries to use old tmem =
arg\n");
+                    ret =3D -EINVAL;
+                    goto out;
+                }
             }
             break;
         case OPTEE_MSG_ATTR_TYPE_NONE:
--=20
2.26.2

