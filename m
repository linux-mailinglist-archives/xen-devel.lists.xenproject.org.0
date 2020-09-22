Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B6273F32
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:06:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKfBe-0006Ku-Et; Tue, 22 Sep 2020 10:06:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7PG6=C7=epam.com=prvs=75341bc617=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kKfBc-0006Kp-RA
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:06:13 +0000
X-Inumbo-ID: 873950a5-67ee-42b8-bfd8-ade48674eb0a
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 873950a5-67ee-42b8-bfd8-ade48674eb0a;
 Tue, 22 Sep 2020 10:06:11 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MA680f009280; Tue, 22 Sep 2020 10:06:08 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0b-0039f301.pphosted.com with ESMTP id 33na0kese0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 10:06:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlRvMcshCJb+ZoH0C3f3s6M4D+R+IBOPnN40DYuIRQY4uWrIlb7lmRK9G2mGTDbVDmS1+pZ/04uNB9XgM1dHxXoL75+DChfaS2FeqpbTP6TLkfxM2yH7L15kOVn+vBE/mGzNjRzo0J0NhoFFVKM/a+2MCGCsbI1kMv6umhl6tKWyXyxRlOlb71F+yPtGEBmYcXcwkjrRknjlWgENwnM9z0tfWiERmML+NrlS622PIyvulK1tu52ImWsoCSJXxroUKKidLIcZtEmyDvww2UpS6ww9fit/X8oaqbZEwm5XL5Rn58Xc/6riLKUSZKvPUB05RGgkIrCXiX60B469egSjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xGz8ACD7altQV86fFw0eW34/75ycOiGwA3kuULxlPk=;
 b=eONbrpark+qLvDlfilMRk3CXtus5NyrKS8tjFLB3Uru0kkmzlaOXXn3VKJI+Mkldmc5n5pfWd73WNjO6J1CR1PrOgKycTjZ77ah9akPWqtxipiP58jxlpUtKofeXp9ddPouCrzaVh6yTGG+jc7ON82P1YNaPU/A/hGDqwxchTZfPRWmvatJogx3ok9UCW8NGZj7618JH1as+ZFTo/9/qlXJNP8ucke3y+CJJRkLmP9WmWXrG8Blp13Nm+lZpAmIlAFKlSW+ATW+mh0QBoJpCoabW1JAuJ82Y6LIqxLHTKcnxmbJUxHrNx9yVMq5IwPYaE4WIFDv/PfA5Jo/3Layuxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xGz8ACD7altQV86fFw0eW34/75ycOiGwA3kuULxlPk=;
 b=0DxF2eVjPZTZUzIoUiIivhUlTE1Ekcr8lQJnKtRrtOFMKNSbbVgJfd68EAQd6J098k0qu4pqU4li4nBClvG34LnaNobF8DmSFrwW+K0tx+z42udHJhoAsHL/VPXgLOqR8XUlA6ZhGHkMW15zRl6aLrbrcEwg59LJuuY9YY6iI7F5vbLts0ijlZGFWcxBRBL7xEGLcQucI7sMO2MkOcKB3irW5CcC0q1kdx6bNPTiRRr34NRU0459vUx6Ruu50rb19WhSGrIK2vqoKOivPbdtHGfNNHmGMs7b7aOpGVjnGVT0VnblvNLJqmkWOJ/aXJKp+6A7ItkxIXLsd9+kJdgm7Q==
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB4669.eurprd03.prod.outlook.com (2603:10a6:803:53::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 10:05:56 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0%4]) with mapi id 15.20.3391.024; Tue, 22 Sep 2020
 10:05:55 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RESEND][PATCH v2 1/7] xen/guest_access: Add emacs magics
Thread-Topic: [RESEND][PATCH v2 1/7] xen/guest_access: Add emacs magics
Thread-Index: AQHWZp38moFqv9vHskKF4Z/e70Jnnal0wq4A
Date: Tue, 22 Sep 2020 10:05:55 +0000
Message-ID: <87pn6eazy5.fsf@epam.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-2-julien@xen.org>
In-Reply-To: <20200730181827.1670-2-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe572d3e-c1d9-4501-1ea2-08d85edf18cf
x-ms-traffictypediagnostic: VI1PR03MB4669:
x-microsoft-antispam-prvs: <VI1PR03MB4669672BEB5CC8311CC60116E63B0@VI1PR03MB4669.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:9; SRV:;
 IPV:NLI; SFV:SPM; H:VI1PR03MB6400.eurprd03.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(478600001)(2616005)(55236004)(86362001)(6506007)(316002)(8676002)(4326008)(5660300002)(2906002)(8936002)(26005)(83380400001)(6916009)(36756003)(6512007)(91956017)(966005)(76116006)(7416002)(4744005)(54906003)(66446008)(64756008)(66556008)(66476007)(66946007)(186003)(6486002)(71200400001);
 DIR:OUT; SFP:1501; 
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?GfkjG4/v2mF0zK+67VUGtZ9MJ1POndXk/5EVAPh91cQH+UpXhwhpOZvQqM?=
 =?iso-8859-1?Q?9ZcU0GSZX6uoXmMMNx9IU1FhoQy9gfH0dEx4Ph84L+cBidtgYTYHygK+JL?=
 =?iso-8859-1?Q?1SDKRydWLVo6UaW+6dUiwMzJpiiUP43A3gSxpc6lABHxTIzkWopUvOUENK?=
 =?iso-8859-1?Q?36gnWvOvitQI1KPf91ctmZKV35IQXYRJm/J5jy9oBfxDRLZ97ZVKYHaFLi?=
 =?iso-8859-1?Q?LBnBhrYuYXU9SSI8jlhBjfaiIVWizPoK7mG879RRGq0wftnp9xHswauh1q?=
 =?iso-8859-1?Q?94eyr0aJOrYKiesbWvpPZoJLCfY8oz1JCWdIj/yCZEOss4H0ol82xw6L7h?=
 =?iso-8859-1?Q?NPjnLkqUV2rpxMUmFfjMRpvAWga4SlJdWhGER0RA7YV8c1MB/38L77U7WZ?=
 =?iso-8859-1?Q?OQCNv3BZUBlIOsl77qTWV5fCHmVeCoI4yubOqHORSDLHD7eABCZvuc6PcD?=
 =?iso-8859-1?Q?za82CBIPidYfEM+u6wV13rW9Q/2iSXbBle2swzAtKCTOTdYhHDvibXWdjN?=
 =?iso-8859-1?Q?1Btbwn79y+14aXXT4CIsq6Wg03lEfG+JZZk4tclqq3C5TM7kxzG38J2YAR?=
 =?iso-8859-1?Q?NwVH4XQanzu+QITJs1u62b174sYkWaJiBN7Tf35RL4enUJyH+qJ4CcbWf8?=
 =?iso-8859-1?Q?lKHsKKp6YA4DvPE9L4RCGLx3JBkb/fxHunuBKbbSrSxlpQAxlMR2zRCKWb?=
 =?iso-8859-1?Q?Jj/W+0TqN4h9wBGxPwHCOaZbMJhV7v9TR4SUDLkdrpayf5IHI3T8m2tXRx?=
 =?iso-8859-1?Q?WinRbThpYzI3WiPoKZBbMZl9XPBigLadMpz0lE4norj94gmTSI9Qe0fkdy?=
 =?iso-8859-1?Q?bis77SuajTEgJ2eprnWSTceIARaYM44m5sHokeXL9ROmPBpR+BUXxkvmhm?=
 =?iso-8859-1?Q?B35+rpPYgU3A5ZkbfryLxqan8SCDhok+AFbhP+M1X0ksazkhJEQiknsN+9?=
 =?iso-8859-1?Q?0+pRZjO3lFFZLvNUmytjDshYvlX951Y4Q8WfgRjNH+8wX1bzRB9nlPHgoC?=
 =?iso-8859-1?Q?WMNJF1pdu3xlmWWW74Q14kFCI++UnIt394cjZZ?=
x-ms-exchange-antispam-messagedata: 89MHH9LpKQLWoMHiyOrN8JPKIgx3jUyL36bKKf8XQTQ972+sgPRmVDH7pd01HqxNGSH+XYNO0sY8O18B1z6IdVFzQEWesqbMijBZcbp1z5qvfjChHK8K7S6ujODTd2UGB2b9Z7KTD4B+0iEoZMmW5jSqLICtfDpZT98hkB/uam5zwZV/sWATdND7kHOvwp2GrDsBOrA0FD3ZbTICBa0OGFoUvcawlvPMUmjgIRuDQg+ZvrRltmg3xaCuQ06BVUeXx7DUw3dF2d09Y5UJ0diJYi0f3DmgXlkQcVXRMTHtmNfNWRVmcj+DnRNwuqTUserLnaM3KazYQr6YManQ+gViRq7yC+cIK8kcrAARCxoIcD44cCsaaWEDUUNtBr7DYAFVgHg5XCOEJfKOuRZdGdr8cmtghTq4Ves9ADLkhpYw06CtXQMqvb7lnNHkvLYeIC7PeWXWV1XEbr2UkssGVKHxUAW+yjuBSSzO+cZxDtk3h73zuSqYmSqcjaawmRziooshMUNSpXn/QwltGc1Q5eux9WTsk83gHV+IccCoWgMpNiyZtjO3akp/e6ciyD0njUxOvy3b+q02C/QjFQN1HpBQz1mQI3OFhqOagpENboKuwlmnRCb/N9SyT4NL5lt66TSgtwGW5v2ITtiAGbYkK40I2A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe572d3e-c1d9-4501-1ea2-08d85edf18cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 10:05:55.8774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0+OjS3qFPZDJgfpEXE6Tak2+8oftd3W1AzY3px2/fOzljzwOUrkydwYP+YTi7DnAwpYNrdMY3NVMOKXDTmsh6fKjxNSqGz4YoWtQ5FoE3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4669
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_06:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=997
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220083
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Hi Julie,

Julien Grall writes:

> From: Julien Grall <jgrall@amazon.com>
>
> Add emacs magics for xen/guest_access.h and
> asm-x86/guest_access.h.

As Emacs user I fully approve this.

But I want to hijack this thread a little to discuss even better
solution. Emacs supports .dir-locals.el file [1], which allows to set
all per-buffer variables once for all files down the directory tree. So,
instead of having "/* Local variables */" scourge in every file we can have
bunch of ".dir-locals.el" files placed in a strategic places to define
coding styles for different parts of Xen. As a bonus, it will be
possible to define Linux coding style for files taken from Linux, for examp=
le.

[1] https://www.gnu.org/software/emacs/manual/html_node/emacs/Directory-Var=
iables.html

--=20
Volodymyr Babchuk at EPAM=

