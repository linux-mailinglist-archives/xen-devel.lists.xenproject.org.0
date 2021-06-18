Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A63AC8D4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144443.265851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBlm-0001r3-QX; Fri, 18 Jun 2021 10:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144443.265851; Fri, 18 Jun 2021 10:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBlm-0001of-NX; Fri, 18 Jun 2021 10:30:38 +0000
Received: by outflank-mailman (input) for mailman id 144443;
 Fri, 18 Jun 2021 10:30:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luBll-0001oZ-FO
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:30:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daea3599-2fd9-457f-96f9-d3e904fa3b5e;
 Fri, 18 Jun 2021 10:30:36 +0000 (UTC)
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
X-Inumbo-ID: daea3599-2fd9-457f-96f9-d3e904fa3b5e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624012236;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=A6WS5RICX2644zyPCiNC6NRK2m601M4cPMJTh6ubd2U=;
  b=PlYNSQ3FZHvoy8M8WVRJiFOcrDqQzCPNOdCZC+F1D71MzzK9ABvCj5Pl
   kZSd1eqveAMVRh8II8AEAaAhRctbCvtqahRkrxxVRbbojK5PP0pe+E9DW
   688/KXHwQUEYlPinXeMW+Vmp/WY/duoIKGDvnKN5eRFKKJdoVstFz+/mQ
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: B7irUKZvRdrO74S32dQOqCbfOaKCp3mdQVDg6ul4IjXRM8chVdiKt8SLq2VINJtT3evKtvoAEh
 Flo+J1JbXhoRzJzpCFKlKACB73qDrUUwjCMDmqRnw8RKJGBYoE0MGAnx62qBnzfYCSSWRY9rxF
 A9DeOJIjCfuwAO5Jyv3Hqoi+ox/mXBXHQxQ+z/QSoVX1vpYRQaRNOnt4ZypxOm++Y+vkROJjpP
 y1MJy0NLVTDbW9ExOuBsLd5Mk2bRnCWHcyYOjdFVbY8rEcblEYhWrIbd3eeXHHqhZoiuDu+TiH
 ifg=
X-SBRS: 5.1
X-MesageID: 46448076
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bo0nYK2x5UfYr4LDWUDdRgqjBQxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hRAV7QZnibhILOFvAj0WKC+UyvJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZq6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngaOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k7Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXUISaCUmRIXee
 v30lEd1vdImirsl6aO0EPQMjzboXETArnZuASlaDXY0JbErXkBerV8bMpiA2XkAgwbzY1BOe
 twrhKknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfVsRRx2xjIlLH4sJlOz1GkcKp
 gkMCgc3ocgTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRHXJ9up6pH
 3laiIWiYcfQTOaNSS+5uw8zvmWehTOYd3E8LAr23FWgMyOeIbW
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46448076"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+vOcqfRagMfQQovUgYGrNiJ+ee6MqnSir+SHamawyuT8CJj9StNFwAuRHHGqAvojWMu0A9+eAdirGE5uJ4InW8SUIKBuS69XhK9RylTFXj2u4OcHHhS4z6mH5Mzmuk/YwqsMt0f/8bWroP2uoWXrXhM2xR7IISr5+HruX70zm1YlDeSLBznw/YoHFn1m28skmazfEW3kMEolXCOIyYDW7TgrerlOYLH58meB9JynYapK7/K8CQVnC4iGeBqi3auo7GZgI8dDK190cJPCkzaDAc1sk0fuUJpR7bnq3sBMpVJLU9M6gGSdKfMDrhrk/Bfr5fBiXLOTLjG0P684NNrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6WS5RICX2644zyPCiNC6NRK2m601M4cPMJTh6ubd2U=;
 b=mIZlflh9eGDcHIxmHKt2PvgO7MrILPN+G/nP+tNB/kWMYfXO3p1qJQ9v8wFen8g4OLCjSbsIJgT/6q8wydaOZ2/rw43FGSVSGYudDUlXEZFE1+VeXcTENl9w0oWxZhEBNUz9GqHlF/+V7K8QrPPMZlmo9nQqBqTuXdWWqj+WdHauz2RMyHH+3K7uA0szNLoaABA8jM9xk/DSpcI5zee9Adp19o5+lZIfzJKEz7QpC3TMZyGKDqV/A0mtA7yP1zbO+D63zn+4rwDf3vy6wPeC+pl3Z71GmY5P6HLwjIOZ3aXtJ/K8H8LMIdqfCuJCJrxJdGf1hhtWPhGL0zTdEOmmZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6WS5RICX2644zyPCiNC6NRK2m601M4cPMJTh6ubd2U=;
 b=vtbuX2Nzx3EPbZ6KCnUMznHMXvdcU9ZIiBsCizJrwRoQ2nJzwpOj9Yx70v20mZdu8J2oMsxaV0OvFMw3S/ZuYBCSO4lhYHEN9vjUOOeWQ4sfeUq1plbgdyX81bHCDw2D9X6fQwJSgnuJ/a7yu8QWfB2e+It0yKBl3du1c+jJOdA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "xen-devel@lists.xenproject.prg" <xen-devel@lists.xenproject.prg>,
	xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 01/12] golang/xenlight: update generated code
Thread-Topic: [RESEND PATCH 01/12] golang/xenlight: update generated code
Thread-Index: AQHXUNy6uG+fcN5cbEK9jooORTlIlKsZuDOA
Date: Fri, 18 Jun 2021 10:30:32 +0000
Message-ID: <FB5F40FC-D63B-406F-A7EC-5617DA7332BB@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11163f00-82e5-488a-d6d3-08d932441a4b
x-ms-traffictypediagnostic: PH0PR03MB5734:
x-microsoft-antispam-prvs: <PH0PR03MB5734535F4ADAACFBBFD04DD7990D9@PH0PR03MB5734.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DvD1mpQ8CEgoTpK5mZtVKeOJLTRuRket2TNsY7ozmKE+yv6um4RLjKZbrEXdmJPig12mpdmGlCrlrQxOvqNsnt9YVpyKnGDomM49ZiGOsNoNh2TUpLtRQauxLRXJR6+f3X504CuAaJl5lfTxhl4pTdg5gr2PqzjDvQLuOFdzRQVkYxo9xKztgLo3YLDI0ugHmtLHenI+263fCF3RB23UJOQzOnsKGJT2DWP25MJp+5jXnjZ7+pNd8JGiSKGrlIY0OXtMfFzN8PXWJuNQEZlDIQOAvZCYxsAgk5c0sTQjMIT4MduYiO4kLT4si/NYfjqM38D72mNSYv43ZR5DK8U134BCH1ksk1YChW452n4MMRBXRu1XoX3QbYSMxqiNbT9yRU6Jac0nCvRLstpFPBfNe3qlFa6scSSsnmFL/JClj4dR4iI4d3TAG2kyNBItZvIcx3Qy4s4S6P1NmFp7GhDbs6OTWg8V6+w1Eee6gqExsRiLHg0WIXTBeApZdsaoaCdW9o6codfMYfALF2ayiBvdpRyivlwA9hM6KI+E2gzA10fV9V4LAfS0t5ZZobnHoqH0ucrdPqgyKCfXP5rtM0e/vC4bSP4BNCXb8dSYNUalRbmv8Dc79XP3gkaZXpKQ4p9nqb6Qt1TGkpy9+ewhqebE8fgdXOdweQouopKKmwfelDE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(4326008)(2616005)(186003)(26005)(478600001)(122000001)(66556008)(86362001)(38100700002)(316002)(5660300002)(83380400001)(54906003)(64756008)(91956017)(66476007)(4744005)(66446008)(6916009)(6512007)(53546011)(6506007)(2906002)(66946007)(6486002)(8936002)(36756003)(33656002)(8676002)(76116006)(71200400001)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6gWYsJ+V7M6QXnFAk0kpWX44aKZ1vHGFDRnxoJHoPXb/03kBSJTzzJJsYrRK?=
 =?us-ascii?Q?gqgL6Ydca5D/bqJSYNPFCp+MqjdFVfuPkrv02EOcQM8SS8oIK1xZIumviBd3?=
 =?us-ascii?Q?Y5Lg0jsh83TWbWAennBUoJCjuquPsvg6Nuw32NTJUNwC2RWHc8LYybLN5qux?=
 =?us-ascii?Q?bGumZ72G+xDMGvVMrgBDlzXR8KniPghvAKxhh+42HR6Hc66w7CMPUtA61BYC?=
 =?us-ascii?Q?7Qz3GcTiurPEyeuvtSC/F6eZI6K6kQV+dD5ys7lwW6Yw+yy5k/M5jbETRVp8?=
 =?us-ascii?Q?/nA7aKWvYx2m1Au9995L0Pe8xd1uwn7IHruAyE05k0jX3WAnuGhnmUGX/cP7?=
 =?us-ascii?Q?I2kilYqA7acmR4Wo24UUVJAkskfJrK8aauHvPGm0K2UkbNnF54q0JUyV6Juz?=
 =?us-ascii?Q?Q+RzBsAFtBQxy6QBpA3SJ6+jIq/HIrOk6/OtQfFa19XKcdmYZrhKoL75EiiJ?=
 =?us-ascii?Q?1L2YY56SADaX4M1MI0SuYDThQqHrin6Hg/DwbhfRuvww+WDwFszS5eJLynkF?=
 =?us-ascii?Q?3HOUy7rolb+uPyN+GM5DOHsmdVzmOWGx5Sh2bR7gv9mCwVN1MMRMnO79mQxo?=
 =?us-ascii?Q?nprv/xuQbsss/CloaMHnFSEQv0g1OzMAkdF1KVtBteuAgCdedkA3RMoBCLi3?=
 =?us-ascii?Q?8/cEOxwE+AbvcqCS3kgIgz+f/4w+DnxdKPw+QDMvNBrBESgyLX02mudJac9Q?=
 =?us-ascii?Q?jorfUamJZF/FoJzURcazmwsILTUVnq+l/TO9Qhbiqeblzx6SAMktTPFQU5S8?=
 =?us-ascii?Q?h1SSDYVaGZRiAUClVI9Ov9CM5SVJVMp9bT3mg+fOs83ui85HlB6zN6BDn4yw?=
 =?us-ascii?Q?rpdjZwTVXiP1vxcxETZQJf9vtA04MQLf7v6IwHayX0xPrRVr7pNXKoH9rzMQ?=
 =?us-ascii?Q?FiKXH/mJazFrK7hYEwqVDsJdlREk02qvQGslVu+c3Y06O9WFRGpfbXI7zsHq?=
 =?us-ascii?Q?j4uF8UG13Z2sK+FTdN0kgYz+g5duB+6tx6wN9ohuKbxN92J45vvdnMJsLYuD?=
 =?us-ascii?Q?9gGGZ0Q3Cn2yk4qLS0rXr200ONSbAs7CSZ3jum/MDOQu49amtt5oB/l+grut?=
 =?us-ascii?Q?ub/OWMuRjxLKszZuIZ+gBZv/TMF8AET2bHsiL41Z8pTDDzec27j0hz0NGMwB?=
 =?us-ascii?Q?Rsc0FGEQW3IB899BqNWOBLMK/CLl2pXBVmeHUB2Yf6YpLwGoi7fOFFSdJR2C?=
 =?us-ascii?Q?Xj6gxPkdQ3JmRAjBnXD0CaBzwgua/ZSZ76O3Qu8HAehJ0XgooJ40nPnqsy+V?=
 =?us-ascii?Q?5u3mFSY76xokMcYNTxi9oE3RR62Y7qIos7l29JCNpT3+lJjMwEYK5Zkp/K5u?=
 =?us-ascii?Q?pqD+xpThM4g0EPHlbRak8X8wWu0cogA+S/mDWq/36/QfaA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1E9AF86419E0954CB90C26803F274A77@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11163f00-82e5-488a-d6d3-08d932441a4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 10:30:32.8634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8Sdz8hNku187dSt36EiUmvgxlNA8aC7cGUgm+mWldTGSZPtVbwZTVcC58gzgr1RfSWsXx3D08us/FPjMVeeDxNi7oP+5gMiYZuLH6EANDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5734
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Re-generate code to reflect changes to libxl_types.idl from the
> following commits:
>=20
> 0570d7f276 x86/msr: introduce an option for compatible MSR behavior selec=
tion
> 7e5cffcd1e viridian: allow vCPU hotplug for Windows VMs
> 9835246710 viridian: remove implicit limit of 64 VPs per partition
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


