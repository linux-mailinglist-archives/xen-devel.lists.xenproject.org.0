Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968505803A0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 19:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374736.606900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG27l-0002gA-Sn; Mon, 25 Jul 2022 17:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374736.606900; Mon, 25 Jul 2022 17:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG27l-0002dL-PP; Mon, 25 Jul 2022 17:44:09 +0000
Received: by outflank-mailman (input) for mailman id 374736;
 Mon, 25 Jul 2022 17:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z81G=X6=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1oG27k-0002dF-7Z
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 17:44:08 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0098.outbound.protection.office365.us [23.103.209.98])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6003cfa0-0c41-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 19:44:06 +0200 (CEST)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1484.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 25 Jul
 2022 17:44:01 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27%4]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 17:44:01 +0000
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
X-Inumbo-ID: 6003cfa0-0c41-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=UZXjv/69WcoUo1UfBHz0/bVuLuy7VLzpjf3ZiuywJD2rlLGJVVppPp5Ne3mE4KiV9IpyAZ4jzQHRB8+Fw8RcYNr+znnxDdMPy6/Wnusu7KzCm5+Q3CyI8LPqIyjtrT1VwHpa9IYQb/10I7zulEdIC9nE4eTLHC4nv/MF6pNzYlOKvFJRqq1c9cIcJu9qL8sLeS9dU0M9hCsxUGiV4QXrJXBnyNEjZTNCCYC7dk1v6M/aDbIw01aKT2MxyINRzcPIlJPVd9ZbgmmUDveBF1eRwEc+zzTka3gmcYUQvUyEnMRphfeN+m253ywHHgZa2Hg71mo2H1ZAA5dZmnmtOyaVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aLSY46HCACeRx9OPpUpXthhlP/QIwvUeLDK/Y4t5AU=;
 b=hggJKQDcsKrGLyYog9uT1NhAisUS86bi0lHzvoprjekY9bIvS9/vivcx99hk5/wbuIJi0J8p2eRvfossLtvE7oJ4uJVOwUsH5A0suM+RiGJOW2c8LrpbJrPhqhhZkpTzM4vX8DvCeZK6WueGX37kd+qblhdLtgajKburlnFOyRXmWy2DxcRaLdsDP4RjkMO4Gfy3qa4XegMP64QMSKPFg/vb5b6tkYIYZoPzahg9lIbgGirlJLfqihsOXhK64djiKYiYtbd+xNWcfiXaKgNiShGv+WUkh2mXt0TXBYp9rUi/ePKgygZa9zAPni7Q5eB3ZGiAiRAicF/CT5o+vm7qcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aLSY46HCACeRx9OPpUpXthhlP/QIwvUeLDK/Y4t5AU=;
 b=Yipb7/K4Q/yPQaoBkTHljD4tL3vEm4tjKx8Bn5CY+WIPTD8auGtWXY9SCjT9j+YRPTRtTCgj1VyAAmdAh1ooaFVO6H8oBwoMNxBD3qOqtTl+jzcgiP7I/NMWYQ04PAgNyD78rdk9kgB5MD5SAHFGVzVHARAuGiZn8kMrT3uC+RBHs98s16pST24BThlVsxmGOpGY3TqjmevxeOM8BzntWws2eqBZwv5vWsH4heTDoI2ZcINxzrejlWx6IWEaaUGHkbRWfu7LtHb7Gal/dqRw9ngTzqLRlyB4o5m/LIXXk2cx3ElBmdvle27OyO51g7RUT0wL8Ba0qyV2PkacXMN7cg==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
Subject: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with no
 dom0 kernel
Thread-Topic: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with
 no dom0 kernel
Thread-Index: AdigP3XkakTWEwukTeurpU94cGpQzA==
Date: Mon, 25 Jul 2022 17:44:01 +0000
Message-ID:
 <BN0P110MB16423592266085271C069BA7CF959@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4577e3b-0cad-4023-a7e0-08da6e6542af
x-ms-traffictypediagnostic: BN0P110MB1484:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d/2LMZGExwp1euZU53xFDnbc1KBfsd4/KvkNle1Jrx1TxETGsfcAS549t6eJAZN8X9u5JZK+v1KbpcA9yfYjKGKoocF6sWzJc4bp/huFIAz0vzsDfHp94OoYZI5x2aTDz5v04r+tkb3+sFgyb2uKHmEdkSkD3vUGEHqzuz0BdUzOhfQ+HKZdLBMMgx5dAbnelfrvDRealO5EngniuHu9v/sCz9FEOHcz/h6kyL/xBWyu0dKj2XK/CM7Sp7d/6CmQJb/2wf2vB9yJivsiCy3iioDVI4RYwI3iFiW34k5U8wBJo+TzyfPj9iNYd6WiwmC5BztbYbYCoIs/GNWTYXxvWwPFt9s3PqWBIGlz+z38P1sBJyarW3jDXDGtMxs09LTLE24mGmgpB1eNfym3Qtu4yZr0Y4/FUlPZaYaqeQ0DDFEv8P+WTVxf1VCBz3ozF9prQkxLVZxAq0qL1YMXUYUIwDpztIyaNjQRJDNtSdwq1y4kMmUXbHMoJ7Te4zMy5Ia+VUKil7bWxzznWFX/rhSJ74ihNjQ/lrxGIhJp7SKfKPrjFwzTsPwIoIrneZLij7YfoGiLFFjWvsc5mUP7chFPlLcp/xHXCvByVFzD0RmGvJ1C88z2BdQ5d8lXc1CkxVIRkYxH7gGBBUpA9ZUY7b47XtGMwBDNbwRMeYjTgIBXgIMh4B2OVnONilJAWbqtv+i95q+lxLHo59wDPJ/+GrjOIM8LtKNqb//+p937DOMHq4NVXeCjPp2ZTIETVal9o3H+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(6506007)(66446008)(4326008)(76116006)(66556008)(4744005)(64756008)(66946007)(82960400001)(498600001)(66476007)(5660300002)(122000001)(9686003)(38070700005)(8676002)(8936002)(7696005)(6916009)(38100700002)(52536014)(55016003)(33656002)(86362001)(71200400001)(2906002)(186003)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 sfayqqNm035M7iSuSJ7rTE0H0qdVAdEiVEGnmgYmzcrUTV7oG7wJ1AkeLuNZF6mcR5lCUzJ/TTwZaT098Cu0ha1TJqo46s3K/wZrXJeYTl74RkHGXCIEjA5LAUnxXQyONfp15DNelUC/oG6d0b34K29h+UQc2GPJKIJ+TugzI2BPyZvW3WHB9aUM0nN9c/XsW8LzdY0S2Tlfb1Mj4rwdaNfgZRc+g2Z5g+gkBrmldUMcqDggprIvxyeF1vmFIUfkEGUo5fjjSZpQH6E9U1G8rO+8N0IGn4XusPvzjp/F9mfKIilGamakY0vpG9RDoCxXw2lRjlVwhrrP5t8WqnOHcXhYRnppKNzDQm6QkiBNEVVue1f7nEwoP1NHLm1SnSl3JGe71k6bJ/il0wQdyly00mWZYZdNTwOpQw6Q11Uq0ZT//RpfMOu0URO6Tjax3eTRXS0bSYX3l5sBVx9x9ZmpojIs2+aEvklVIfIHHS1majM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d4577e3b-0cad-4023-a7e0-08da6e6542af
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 17:44:01.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1484

Hi Stefano,

My colleague Jason Lei and I would like to submit a patch to imagebuilder.

It seems that generating a .fit with a true dom0less configuration fails be=
cause an extraneous comma is included in the its file.

We believe this change resolves the issue.

Thanks,
Jackson

-- >8 --

Remove extraneous comma in generated its file when no DOM0_KERNEL is specif=
ied.

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 8f08cd6..6f94fce 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -676,7 +676,12 @@ create_its_file_xen()
             i=3D$(( $i + 1 ))
             continue
         fi
-        load_files+=3D", \"domU${i}_kernel\""
+       if test -z "$load_files"
+       then
+           load_files+=3D"\"domU${i}_kernel\""
+       else
+           load_files+=3D", \"domU${i}_kernel\""
+       fi
         cat >> "$its_file" <<- EOF
         domU${i}_kernel {
             description =3D "domU${i} kernel binary";



