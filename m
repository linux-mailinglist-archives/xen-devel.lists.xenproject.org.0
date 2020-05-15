Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE41D5918
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 20:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZf6e-00032I-SC; Fri, 15 May 2020 18:30:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXO4=65=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1jZf6d-00032D-5n
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 18:30:47 +0000
X-Inumbo-ID: 30f8e41c-96da-11ea-b9cf-bc764e2007e4
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:d::60f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30f8e41c-96da-11ea-b9cf-bc764e2007e4;
 Fri, 15 May 2020 18:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=t4k6B29PLTME7UUNC38EtMDhFZwfS2stwxmvq1oPoww9XEf4NcqtNp+o+lD0eU5qayDkjxjJetTL6KrbVi0NM6V2iYFZe2F/ZzMkKILZyibJ2fhSXQO6QODQBfgxzGQijoW1Cs+6FCXUnWt4qdF1OrrxsLyTBCYcxH+39cskOdvF+gdavQN0f2iENZs9RbjbJ/QO9oN5IFQ4+Xm94/EShjht7Zcf7TW6z3+RpFfExmX0ph+fTi6Ko7pdolIb0PCV8SQ1co5jwez2pDpIejD+rByleWqsgoCIA+AnlvX+cNZlCtH2ws+r8csw+tXlwRjsoB+cql79oBIbkpxs2KRvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hYA9aoOhl84nJcESWARiJ0BxzRpOnYbkQaV/ykIkuc=;
 b=x/BbIN9GcHbdt+SKiPUgg+27UXDE/pSo5fiEvx0KrziSXBGgHE5adduKtlne1JSxCaromLDpP6Efwz58UGICi4BkiteR+hwnjdKnf7MgTyedcmf112CkWiWz6p3WJH4Bub9rKAqhqBubD8NhZo5zS+Z6ik7IKaEuzJ3+pluQi87Y2x96uySrQG55R6lq17AkwVSUkt75Y7UtFFeLAv5WI2pAyyklb7XlMPKUHYhW4Uh89LUXC9hMR8m+m07V85mMMCWPfrLFqmsr/sm0ar+KLaJBj82sFp6RTKVlNaY3sed9MW4plLHgru4MWL4y7SocMHbUrH3VJha/I7qCle4z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dornerworkssystem.onmicrosoft.us;
 s=selector1-dornerworkssystem-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hYA9aoOhl84nJcESWARiJ0BxzRpOnYbkQaV/ykIkuc=;
 b=rHILfo+wEBKRhbLwYs5wpDR4v+mJsQgHbDl6X0dzjXgqPh94VWdamH1HWTR4Cbs7JAVKbtiLsyCWxbuYyAetBrLf5KqDHaLul9RASgNw+geWQHkJkGM3OwZ0alReD9wGuVL7QerW80XTbPozx1084792hPJmeuVTf97N/s8nYsE=
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:404::14)
 by CY1P110MB0549.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:404::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.35; Fri, 15 May
 2020 18:30:42 +0000
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8888:67a8:9eca:3edf]) by CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::8888:67a8:9eca:3edf%6]) with mapi id 15.20.2958.035; Fri, 15 May 2020
 18:30:42 +0000
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [XEN PATCH v2] xen/build: use the correct kconfig makefile
Thread-Topic: [XEN PATCH v2] xen/build: use the correct kconfig makefile
Thread-Index: AQHWKuYywWMBJNbmN0GLTPve7p+kuaipd9QA
Date: Fri, 15 May 2020 18:30:42 +0000
Message-ID: <CY1P110MB0551ACF3B18E4969A8D15C698CBD0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
 <20200515182509.5476-1-stewart.hildebrand@dornerworks.com>
In-Reply-To: <20200515182509.5476-1-stewart.hildebrand@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dornerworks.com; dkim=none (message not signed)
 header.d=none;dornerworks.com; dmarc=none action=none
 header.from=dornerworks.com;
x-originating-ip: [2607:fb90:a22b:677:9065:c12d:e772:d615]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce20010b-97bf-4d7b-998d-08d7f8fe1345
x-ms-traffictypediagnostic: CY1P110MB0549:|CY1P110MB0549:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1P110MB0549566A2AACB0F7A95EF3278CBD0@CY1P110MB0549.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(966005)(186003)(52536014)(6506007)(54906003)(55016002)(7696005)(71200400001)(9686003)(508600001)(558084003)(76116006)(8936002)(110136005)(66476007)(5660300002)(64756008)(8676002)(2906002)(86362001)(66946007)(66556008)(66446008)(33656002)(4326008);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce20010b-97bf-4d7b-998d-08d7f8fe1345
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 18:30:42.2765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0549
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Friday, May 15, 2020 2:25 PM, Stewart Hildebrand wrote:
>Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

I forgot to include Anthony's Reviewed-by from v1 https://lists.xenproject.=
org/archives/html/xen-devel/2020-05/msg00848.html

