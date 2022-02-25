Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E634D4C4ADE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 17:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279520.477243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdYN-0007kR-1N; Fri, 25 Feb 2022 16:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279520.477243; Fri, 25 Feb 2022 16:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdYM-0007hY-U2; Fri, 25 Feb 2022 16:34:46 +0000
Received: by outflank-mailman (input) for mailman id 279520;
 Fri, 25 Feb 2022 16:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H5pI=TI=citrix.com=prvs=04867385f=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1nNdYL-0007hS-7j
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 16:34:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d48ddc9e-9658-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 17:34:43 +0100 (CET)
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
X-Inumbo-ID: d48ddc9e-9658-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645806883;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GjXkIADl9uM4Dlv0sXQ4R+U/++MHKrpWDEYeyP1k9ww=;
  b=FV4Ia93Htl8BJNOHkR/E1Y/9FbnsU6VF9n9urC0IIEoh+6jwZ9pTr8QP
   DDIEobN3dMrlb0dlt1K6zmn3H9l1z/FZA15RO2/DRoAA3EslbQdWHMAIF
   EBAK1RQ2rYuGeQtBI9TqMGADwafwHeKU8qFicbYYwmHUc8OZjTC38m8cd
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67275415
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6xn8kq5eQNGhloN/x5QzRQxRtC7HchMFZxGqfqrLsTDasY5as4F+v
 mMcCmCDPaqOZGahedxwad+3900O75HUzIJnTlNory5jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YLjXlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS5cigTb4bjl90naEIFLSIjDZ1ewuDYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsStm9hy3fFCuwhQrjIQrnQ5M8e1zA17ixLNaiBP
 ZVENWMyBPjGSwcUZ3cxBJVnp6DrmH/kWQMfq3Owi6VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRDhgEOfSFxDGC83bqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9NrPNdrwy6C85DvuFunBTU0fiZ7N8Nz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO93ABbvzt68owGOlor+p5
 ilsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieRg1a5pZIWexO
 Cc/XD+9ArcJbRNGioctPuqM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlOniHqdNIdAtSRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WbQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:mHcFG6tHCX3fkh+WO89gp2IH7skC2IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPiftXrdyReVxeZZnMXfKlzbamHDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sZxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMEE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJppmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF491HqWxa0u
 UkkS1Qe/ib2EmhOV1dZiGdnTUI5QxerkMKD2Xo2EcL7/aJHA7SQPAx+r6xOiGplXbI+usMip
 6jlljpx6Z/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5rD2bCtuYeY99Q/Bmcka+d
 NVfYnhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtR5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdY15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAp23G4gMyKeFPGC1zwdLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67275415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo6zoQ+3srPQIW/kgi3m+qsxAIkFo8BYoRQIhvizGqPE7K7479kTqWh65cUEJBh4c+fc32HB1/Fqriur1HYi2rteIJo0otdQR+VFTRb0TNhEPDt2Fv4c5l7lNy/4uDtz7fFiWZefNwgAitOguUnC9mKXwywEI49fClUmf2ObHYv8qmAppUOTpF+LScHpTJnI5OxJ1eWE3mc79JLrqQbVKHnRMxZZv/Qlm+Z0rLjvMm7pZBGoPgSxSK4azv8khp58zK8gHF6LcW1TBKTPHtKZdQGevkam3NSYdAVPr0T0X4E7ZEE0WFq4DuBwfIxeM6N7lggrJCK1/ObJ4Ns+qc/XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txgGUiJ+6nBlTCNx2uw2Lxue+ffy4vVAQ9yyLvyT3Yc=;
 b=ZVs6Y+GCKAX5FbheY9NngBVwiodEWn2SfnXhYT333TCVY6+zYug08RCWmbhzQpw4j0KvG0vD8rUtliGTEtRk31U/y9/xWN6enzNTzhPfQuw4vVi2aREtirRuVkEzq8h5d4H98PUIIoqa1K5W5Gl6dn6gvghWGULMgdSwJg2USye/RNksk/BxfXpM2BcrdCafOLHjJcZoiDFJm00394TAQgXCs1J/xnicHbM2QlNouisf/ltCZfu7rA7EtwRTmnRaiJkOx2zrq4xyZA6a1iOj4sN36paHRis1VLrGHVqT6eZMT7pS8OKEMvQ51tDnsrwIaTznRAxh0HvIYsG1jPmlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txgGUiJ+6nBlTCNx2uw2Lxue+ffy4vVAQ9yyLvyT3Yc=;
 b=KjEHBc/5exs9KLM3OS+iMPQGWU5WQTsjgQvXUs0LpN2H7pkMBF1mVwSs7XWAHpOXhU4ycn1FcNEPAy/iplXykRCqDcU5IhG4AvK2SxZjvwH1tk2NNwy43UT1FUiCBHM36LpT0Qb6LtOasqT3z7GsD9c7/3WseSgMeSqUBlsfWl0=
From: Edwin Torok <edvin.torok@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Christian Lindig <christian.lindig@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v2 29/29] tools/ocaml: fix build dependency target
Thread-Topic: [XEN PATCH v2 29/29] tools/ocaml: fix build dependency target
Thread-Index: AQHYKlrZb2DloYmiEUGGLqB4eANGnaykZKqAgAAQIoCAAAGTgA==
Date: Fri, 25 Feb 2022 16:34:23 +0000
Message-ID: <F69E17D1-C936-4648-A8BB-C9FB64ABD769@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <20220225151321.44126-30-anthony.perard@citrix.com>
 <C31BFB15-F511-452B-A249-1D6FDAC5F626@citrix.com>
 <YhkDu+oikp0Yd3sN@perard.uk.xensource.com>
In-Reply-To: <YhkDu+oikp0Yd3sN@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.40.0.1.81)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56d1882d-9d11-4d1e-aaa4-08d9f87cae26
x-ms-traffictypediagnostic: CY4PR03MB3269:EE_
x-microsoft-antispam-prvs: <CY4PR03MB326912372E490C2EF8BF47459B3E9@CY4PR03MB3269.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DYjapxbFnuHE1zo5RnroD1CyqfIVe28wNS2iDZePmFLvI7VbQfXCnhICXrBtieskH4OLJLPiFqtqMlvD9ifu/UaNIZJSLTVq81236Ql91lbVjXuB164yQmNeB9rzozvknFAjK82Y/VqDpf5vlLLj51rAaGM4dc6AL6eDn936W+++s9NfhmGjUH/6KlWuMmEKCOfK809I3k9GMIvRwVPW59N7o8PvvYqN+t3/ViMkJqTShEhYA9qlqnPXS0eMnjBRrmMxIsZS2ZDC5DuNpUIQ1KL4KqD9unEA4DBGr8x1eBTffGe9ZwdkAfYzTjsISA70bBxPBHFu+4VoogSfznOVyrC1ajs4qGDVj43w5Wo0bzZv9Kq8ReRmu43+waVqU471MWY71Eyv2W4TY5KaNF2mTOGboWOIvS+VG9kA92BQ/dgdAs5jot8wpu/XfP0qg+5beOuexsUe3bZTtEydLB4avkeh02yJxJADXhv6KWKBFxAyFcn2r4zj3znAU5xFDa6OrPeLmg0SyJLcs5t6NS0PpSHRwKy/9NdLKVV2DBDiUbnF1cc9mnP5hQK58YZ8Rm1SNnKDsFtsXUq3mPWKPeFn2X/6FyHoQMw6ulapnATMxlsDVpthL1dwVpkKvnpNHuVxEtlJAnkMFj6Aa6KT6l7vXcrhY9T1xrpY5GHV8+EftPAcQBYUBxN113KNh9gZsVBHfKiQoSd/OkP0GmCugSTtAurDdd0GYAiAwCLj9zjy7zme21rHJ/HKR7NOSmGpddUV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(186003)(2616005)(86362001)(33656002)(6506007)(6512007)(38070700005)(2906002)(6486002)(26005)(316002)(76116006)(5660300002)(66556008)(82960400001)(64756008)(66946007)(8676002)(91956017)(71200400001)(36756003)(6862004)(8936002)(54906003)(37006003)(122000001)(6636002)(38100700002)(4326008)(53546011)(66476007)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W419s8RDwdbwF2PLex6JnAS0CFOG3VJQjxtviyG04pAH6t8YLYV1mLV+exRe?=
 =?us-ascii?Q?pADDYi/pR83bhBVyG8+/tnLdV+jHo0kKTL3Lo9In73HgNnyem4KvHvbgJLGo?=
 =?us-ascii?Q?uAi5yiMgwkJ6BBPkTPiONY8w/GEWfXGV6ZC6mZ9y8rVmlfr9bhiv+wJWIk7u?=
 =?us-ascii?Q?+X7xIv46hYn3MUkFVMPdQBHqhSQH2TEarUhYPhmvNxqdxPJK1hObRPT3OQ0Q?=
 =?us-ascii?Q?tDh62EZiQH+kItmuFiBsI08sOljX+ysIUsxg8wjOUfQ5HxjmaZwgsZXYpUJ8?=
 =?us-ascii?Q?kUVP8DnYYsvkrEx6zYifIfv+NZ1K0WxBVWf7s6+UlYNVSdKVs/1AnBvYvqg4?=
 =?us-ascii?Q?FEO/RlARDL1WMstGNv3UC4S+I+tZvIlHZd1Jdn3j48IGr8LKkfiA6pKzBC/Y?=
 =?us-ascii?Q?/GimBH94f85PzEBvbicq2Jizfs5+osl6y5q5ZTuzIIRvPzdSNAmIrBTKBCXJ?=
 =?us-ascii?Q?Ynuq6zP2cS4jIawOSSMdRkyJUMBbHyaluM+KLdp9xgjkRhQiCiVJnB9SwOxI?=
 =?us-ascii?Q?ZjQk7Fv6LYxI0+Wayq/h2qOHk6196qFKb72jcnGRh0EEvMcCVsbl3HbWHY8t?=
 =?us-ascii?Q?e63npxiKaWcEgf8k5W5PTwjPY/S/IcZD1OvtXHULtKrT631ZabU4y6iPjT66?=
 =?us-ascii?Q?UiMXPxucaDFVVWqmD8/HIQjoGM7Pg2YZAHtbii9m80LjfhkEgvvE6Ly8XTZS?=
 =?us-ascii?Q?9HCwBqr1GxN2c83yrlKXyVwMaccSfvh27zgygh1UdAnbuNJzszWzqcW5gNyk?=
 =?us-ascii?Q?dNVGO+w5UPzeuZcElxQnlspPjpiQ6Nk10Cvm5Jrlbbu84gSc8l7W5XaRXf+a?=
 =?us-ascii?Q?2JYYxAnKicnyfh0UBVlaCVK5svtEqBO3XObaDpnYBWHBPuDuvcteoKRNwJkJ?=
 =?us-ascii?Q?mTvfd2vJmR2l3A0rJsbzcF2+dtYIN1Q13jr64xL1T6MjINrOkL/ejTKqHAqM?=
 =?us-ascii?Q?jDfHMEckuc7hn6B56kShfa/j/zKGnR7Yt56YFJpZf490p51L4pO3Xiye7Nvv?=
 =?us-ascii?Q?FqCz15UOBLUJoYdy+TlvprFWAB0bXgUnGKEhxAoe7Q7WxH1yiD77RSFGJuxA?=
 =?us-ascii?Q?8d86nqCBsvC/wTC6j0n3YeuAjAQFwyTy6H9UC+IOsb5VNeIpoE04h1E/OaDe?=
 =?us-ascii?Q?kAfXhVRM6wHmkAQyO2ZeD1C5pMu52eSmsm8vAgA5PsFHHloT4OCP4F3uCo4q?=
 =?us-ascii?Q?zoit8cwq7cz8ebuWOTYGxd83FG4PtXgUp4HpJYfA4Lx4wbyB1mM2ZCYVj1Ti?=
 =?us-ascii?Q?f2Y9Pzai557jmh7KRVfpaTOwDYaAjKSMu+ZXgnimfXr8F7JJQsxNqte1IlOt?=
 =?us-ascii?Q?bKu0TRy4R/i/zsw49Epf2pXWXQU1sL1crNAQmyU8L9XPtAM+mdIocLfuOnSZ?=
 =?us-ascii?Q?DCRthjo1chhGZEOMN1Iyg3+pK0zyTJqLt/RDKpmD7k4C2k+GmlMDBEJ5Hqlt?=
 =?us-ascii?Q?b0kI9UXfliU0nxOhiaLfP73fXxAzZTIT0pbDgdMx4aRvATBSI5u+vjCRqCCD?=
 =?us-ascii?Q?rl3fBRK4oNeM8CxJU/nwysoNCyybl0DZDHxLxTJkO9G1EzlPD88VFsILEaZ/?=
 =?us-ascii?Q?Y5sdq2n/4C6edxG2vOli0CvhEQwg361ibpqyNT89unmz60kI90pN08E6Zcfu?=
 =?us-ascii?Q?j+5Gg77v7yYa0t3I8zAKYzo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B75A6B12C7CBD3468F39564B9E4401C7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d1882d-9d11-4d1e-aaa4-08d9f87cae26
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 16:34:23.0257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jYJSeB4eooa/PThKjNUs8Vr6g2GAG5FRWS2AVaeQuwYpy0cVGEadkITL7qElhBvvufEi1/LlP8IuLOhuWsxh8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3269
X-OriginatorOrg: citrix.com



> On 25 Feb 2022, at 16:28, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> On Fri, Feb 25, 2022 at 03:30:59PM +0000, Christian Lindig wrote:
>>=20
>>=20
>>> On 25 Feb 2022, at 15:13, Anthony PERARD <anthony.perard@citrix.com> wr=
ote:
>>>=20
>>> This patch fix ".ocamldep.make" rule by always spelling the variable
>>> $(OCAML_TOPLEVEL).
>>>=20
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>> ---
>>>=20
>>> Notes:
>>>   v2:
>>>   - new patch
>>>=20
>>> tools/ocaml/libs/eventchn/Makefile   | 8 ++++----
>>> tools/ocaml/libs/mmap/Makefile       | 8 ++++----
>>> tools/ocaml/libs/xb/Makefile         | 8 ++++----
>>> tools/ocaml/libs/xc/Makefile         | 8 ++++----
>>> tools/ocaml/libs/xentoollog/Makefile | 8 ++++----
>>> tools/ocaml/libs/xl/Makefile         | 8 ++++----
>>> tools/ocaml/libs/xs/Makefile         | 8 ++++----
>>> tools/ocaml/Makefile.rules           | 2 +-
>>=20
>> Acked-by: Christian Lindig <christian.lindig@citrix.com>
>>=20
>> I am fine with this but in general think that the OCaml part should be b=
uilt using Dune (but invoked from Make), which is now the standard tool to =
build OCaml projects and is simple, fast, and accurate. Edwin maintains suc=
h a build for all development work on the OCaml side but it is not upstream=
ed.
>=20
> ocaml-dune doesn't seems to be available on debian oldstable. So I don't
> think we can use it for now.
>=20
> But thanks for pointing that out.
>=20


I think we should try to add it as an optional build-system: when available=
 use it, and at some point in the future remove the old one.
It is pretty much impossible to do development on the codebase without it, =
any developer who wants to make the changes to the OCaml code will likely w=
ant it.
(Of course those who only want to build and install oxenstored may not requ=
ire dune, and may be fine with the Makefiles as they wouldn't require incre=
mental builds or editor support).

Best regards,
--Edwin

> --=20
> Anthony PERARD


