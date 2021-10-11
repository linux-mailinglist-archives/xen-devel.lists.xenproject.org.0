Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E7428A32
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205662.361036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrye-0000Dn-RG; Mon, 11 Oct 2021 09:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205662.361036; Mon, 11 Oct 2021 09:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrye-0000At-Nw; Mon, 11 Oct 2021 09:52:12 +0000
Received: by outflank-mailman (input) for mailman id 205662;
 Mon, 11 Oct 2021 09:52:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daVx=O7=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1mZryd-0000Ai-E1
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:52:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6d827c4-2a78-11ec-80d2-12813bfff9fa;
 Mon, 11 Oct 2021 09:52:10 +0000 (UTC)
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
X-Inumbo-ID: e6d827c4-2a78-11ec-80d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633945930;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=VnGgR3oOIvC5gp5hPXpguM1vSR+tYhTlkNRa+OHhe9s=;
  b=C6hKY7OpoCDsyxZ3eo0ctyo8sM4Qrh1iAcwd8T8rI6MjOofpPQJeqqYR
   mFUy5N1uZjClnltFHRwyqg8aiXwEz79FGv2Alxo5mm228fYnkvCrXvC5R
   jh6kaPMVBivTy0HMxVxJKFMWNdtpoK0mWftfP2OE5WgVGskCwB6T3JzEk
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3za1ygkV0K2CqIDTHiHyg08WplwaIjiTh0MeuTvNn2ejRC2XStFphJRFYtAA41MZiheFiMoX+M
 PXEFC/3H00UrT05UTdsky+SkYbr3gIsEFnxwo3WTAz9nNHkN+ZZujzADqjPufNN4S5lDonbthK
 6iYYST1UpyFzWPZwKxq/5KwZqxBXXDAObrpY1JFwf/QVJd8AyHINKEaH4yBIva1KprwYKno4Vh
 SojzjuoBGvhdsrn8R1CChtUk65OSJDoiHCItRNVlfF0/ka4CBhQBFMnvxZeBcbSupX9GTD0fKg
 CSF5AUxO8uWAo6Go0b1Hn3mj
X-SBRS: 5.1
X-MesageID: 54838789
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oCCm0a4tdP92u93O+7sF+AxRtGLBchMFZxGqfqrLsTDasY5as4F+v
 jYZUWuOb//fNjejeY8kbovnoBkAu8XUzN5gTVBr/HhhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh29cw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 tYOuJyTdA4SHqDFxd8PSAMEMAxHMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJ8nxPZgDu3hmizXYC/onTrjIQrnQ5M8e1zA17ixLNauCN
 5FJNmo+BPjGSzt9YVdQOJcspuDyjFnZMB0JgWOLrKVitgA/yyQuieOwYbI5YOeiR8pPmV2Dj
 nnb5Gm/CRYfXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa+EW1Q/HnUha/oXrCuQQTM/JSDuk75Qel2qfSpQGDCQAsTyFDQMwrstcsQj4n3
 UPPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxAAhg50DgMhN0L+0lW0rmBr1+MKPFFRsoFyKACT1tWuVebJJeaSa6hvW7dV9Jb25Q1Dch
 2ofgZS9wdkBWMTleDO2fM0BG7Sg5vCgOTLagEJyE5RJywlB60JPbqgLv2kgfBYB3tIsPGazO
 heK6Fw5CIp7ZSPyNcdKj5SN59PGJEQKPe/uUezIdZJwa5x1eR7vEMpGNBPIgT6FfKTBl8gC1
 XannSSEUSZy5UdPlmPeqwIhPVkDnH1WKYT7H8GT8vhf+eDCDEN5sJ9cWLd0Usg37bmfvCLe+
 MtFOs2Bxn13CbOlOXmGqdFKdAxUdhDX4KwaTeQMLIZvxSI8SQkc5wL5m+t9K+SJYYwE/gs3w
 p1NchABkweu7ZE2AQ6LdmpieNvSsWVX9hoG0dgXFQ/wgRALON/3hI9GLsdfVeR3pYRLkK8vJ
 9FYKproPxi6Ymmek9jrRcKm99IKmdXCrV/mAhdJlxBmJ8Q+GFeTpoO9FuYtnQFXZheKWQIFi
 +TI/ivQQIYZRhQkC8DTafm1yEi2s2Rbk+V3N3Yk6PEPEKk12IQ1eSH3kNEtJMQAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYg3zWLNtK3WLx+dVsahJyuMLsAe6Q
 BvXqNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfeCBdcJRiBjiBZPYBZCoJ9z
 LdzotMS5iy+lgEuboSMgBdL+jneNXcHSagm6M0XWde5lgoxx1heSpXAESuqsoqXYtBBP0R2c
 D+ZgK3O2+ZVykbYKidhEHHM2axWhIgUuQAMx1gHfgzblt3Aj/4x/RtQ7TVoEVgFkkQZi7p+a
 jpxKkl4BaSS5DM51sFMUlelFxxFGBDEqFf6zEEElTGBQkSlPoAXwLbR5QpZEJglzl9h
IronPort-HdrOrdr: A9a23:ge+Rga3l3Ex90MFOm8ZdHAqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208,217";a="54838789"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NykfsiKDrVSJvIPilH0XQHe+/j74U+IbXPVBuKrJSe5rM+m0lZT9R9Ve8iH/pUICP6W7XBhRZJ819sh+6LUTX5afzaloS7eH1d4kgEHbIdx/0Ud0glK93G47VzINy1bctgrMZMouOcw2FZvSFqe/YlicljdhXzI36GIv6rFP1Td/VciWDQ1CQOlBP/snWsfXmZeAid4frrpLEPyER5pk62b0RT/ei5vb7xDR4weKA0WRJF0KKvWL+ydInNxHs4r7SvUbijskAmyBm1RTI6t0aFyUcVcgypQSHad2uum5yOYdmj8a+MSKtWjL+TJZ3LzVNCzIsynFHve1udJsR276KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnGgR3oOIvC5gp5hPXpguM1vSR+tYhTlkNRa+OHhe9s=;
 b=Z6ZydOjzrVUJ5OyiR2T3wq85h4V3603nmVVzMP8/RP2Y9Mof3T/uayC+sXoqu9WT3Gg5ctoAqHaQo+YENd0HCwP1dMaMgzG0Uawhyqyjf5ZtNDqvvGhEtR+dM3f2DBjeMvpgt136XpCcbIJvEbVWn0eVPeY19nI3Q6bNP/E9F3K00/4D+lNhDlZPkLz5vAQv9VolZalb5uEPIfJ04RU2WUJ6lKkPIq7V8rLoINwyX+C3o1IulCSkCROH0VyMiJ/RgTZI46YNgvAA00dBzIRZ263jKlGZAqJJewZP/PsLYw2YZMosAduvosz6wu3j4DzW2OQeXBz/D2V8Yq6E20ul1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnGgR3oOIvC5gp5hPXpguM1vSR+tYhTlkNRa+OHhe9s=;
 b=Y58Rie1mZkCh3hV1ywQcyWU/ck4rDxgITGGLTMcDKlmNOeS8O/1tCC0TSZNULdIOANsPky41AToVwFrnzZjOmZiAELbHRDIO/ktLkHck0ySpYb0qpjRdgt3o6VxgKg0NoV40BTbB5pMVv7mYuvfzdJwiFeDzAS9RfZaEf55ytaA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
Thread-Topic: [PATCH v2 0/6] gnttab: add per-domain controls
Thread-Index: AQHXr4rhj2WUWOIByUen+NK40c9U7KvNp8mAgAAEaAA=
Date: Mon, 11 Oct 2021 09:52:04 +0000
Message-ID: <89FFE3A3-0819-4357-BA9C-E7823CC7765F@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <YWQFj70MRWHEeOd8@MacBook-Air-de-Roger.local>
In-Reply-To: <YWQFj70MRWHEeOd8@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 538044f2-0ace-4d7e-299c-08d98c9cc7b7
x-ms-traffictypediagnostic: CO6PR03MB6257:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR03MB625770FE6E31743C5A97E587F6B59@CO6PR03MB6257.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+x0ixLtkmYOT2XZe9Hdcy+r+pF8aPhyATEVfkkxBz6aLU1R0IqY+QZXPJnqe1TabtidLhjcFY+x09xLx7E7gPrn2q51k+AAQsv2zNYYlh5R4HqjnCTLNY5NNOWAne7CQ6F5/vM8T7WxZZ2FyitXJdYP92p/zQopB1smY4VLe/s3ISU2hhRNV4fgTQLxsal/18NP5qhocw1Voa0ZH0pmXSwnMinqhacIVsrp08JHAWjdpxFY/FbLmjymjutGtAI14dDsEbO36GJgRQ1D869GzfOgJAacSP1Ezd9K+Udp/3Ix5z4YUHVK5c9QXGvsqDsS5GJRzgqtX1KDOZ09i8G0kD5acXAagfRr7wP5OUkPLUcfIC7qM+w70+IFHQHvtX8V3CJGh9vzhKINE60NJUxRu6lQR0zjKsbcDe1lUtkG7qVjde2NibqZHMs5XTvvnlTLHVThdGr/xNTtDOF6INcLCiOOeJGc5oKaNU/ZPSEpcb402obsDIgpWsmRg8lmzAt7xw4G2RYXiExJz5lgeNhu8PKJCRkYqcR8gd/R2R/ybbUO/Q5KfAjoSAIsRUDCBTUHNLwVVCaGV2Gt4EzBAsosrXttBaVVt8JNFOcf7O5cWTy6cdF9T7VYvMWXtDkUxVzs9qg4GUo8Xttji0MKCP+pPwQHImIpONhHUVel4lVWXcjw+Ujv2Ln2cfCTMhORrhfsaNLqnkse3Rfs/bAveyxgnHzprg5HAMDi96qD6yKEgDI1/kEwOSKiOynegm1eJi7g
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6862004)(6636002)(6506007)(55236004)(558084003)(26005)(186003)(66556008)(38100700002)(53546011)(54906003)(66446008)(64756008)(37006003)(122000001)(316002)(8676002)(44832011)(38070700005)(6512007)(86362001)(66476007)(36756003)(91956017)(5660300002)(4326008)(2616005)(508600001)(33656002)(8936002)(66946007)(6486002)(76116006)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rRYgmZFOR+Iwt+qpS4SI4CrGXNG0SdJ/ITQTN12ifcZNPEPXLEH2f6vSfK86?=
 =?us-ascii?Q?YZmjfFtSm9aJWuRsiTF8XwjVVPQKTJSCMQnHoKq0+FIACQjzJvT1NxiTcvsl?=
 =?us-ascii?Q?26fFw9XXZk9tGUGEDcS5bomVdSr8ZbUQvtVt/vSX+oPYKCyk2qJdz94cbQWg?=
 =?us-ascii?Q?QPcTIs82RJ3I1kJKltbz/uoNalI0QIFf+Ezxg7Bt9IVsGCfIe5VPPoZpQWhY?=
 =?us-ascii?Q?2VT7mIQymys5R9extsaOBReHpIIdP0E8LH6LSTd8jaF9K5jeAWRbR0ju4chs?=
 =?us-ascii?Q?a3mfDcgKm79sqSqqpl67hjocnVfvAT1jHj3jLg1jOJtkjpNnXBHPudNkfoLF?=
 =?us-ascii?Q?4mfllEd2hYBVpL0HFXu1fcpXnPsXiKSWGartmI0cTL7Q1De8U4lfLK6EbE+5?=
 =?us-ascii?Q?IS/il+7xVnhAKMcmn2fx02zY+n46V0mt22w4XRzZkPj+Gqb3KuHgbC0lYHFV?=
 =?us-ascii?Q?JHwNIr+z9bHPW7bV15WnDQraiYg1dnuYG7m5DG1OjILmaWkqiW8C3YhxG0Rt?=
 =?us-ascii?Q?T3THTz5IqDGfloZNDjqUXc2uso5aOBVL9+YsB0PMU3GAoLDASkle6sW6gNYx?=
 =?us-ascii?Q?jZXFt9zHOjBWghZL+ESlIh86bXnEPNg8V32XUOIjr514pVbL7W7q+XQD/FWR?=
 =?us-ascii?Q?O0AHTDQvrgVsjamxSSsqbhRleSETCq+0jBre87OnPis79hDjHhUIPiqhla+7?=
 =?us-ascii?Q?B3/RqQONNo7phI8zrSE5+3dae8QDPh1bRI+dHwPZcUqOwLnrwZmGYGlocYEf?=
 =?us-ascii?Q?rJdETHZD+1AtQ8OPV85lLKwZNRYe30GrDHIFb3blzHY7qndkJg4agnow21ax?=
 =?us-ascii?Q?Z06yRCX5qIb2b6G7153B7ERLY7vUwkmBE2VgjZaiYhIGqtoMYpmv83RMHCVT?=
 =?us-ascii?Q?BimUX0mLToe4ToyFw2ZS2KZbgkX7uAl/0dxjIMfAORckcfMz4nfgPgoMxQGP?=
 =?us-ascii?Q?d7MvWhSgn77WnbSg8hJtO9AxwYNGO6bYhbkmN18d4U/ue5VpyLNvc1gfCAh+?=
 =?us-ascii?Q?btf/kgNfkGGZf3NvTL6UCrAzEpNxiltUl5gydBnuDtepv7o/pnJ+01flxGgT?=
 =?us-ascii?Q?YFCoix6fe3yPBPrFkh4HvLFGiMzxuehmiBcOfYgrOK2ah9PVli1iuffdLdLL?=
 =?us-ascii?Q?zZRq940/gfv1Evpj+X/sIBlndVZrrN6wude3j8wnCJiGyxDgb0GGBk91y2Sh?=
 =?us-ascii?Q?t3sD/KDNxAKI4vlehHHgL2lo3JMe2k5xCP5tF0ICkFea0pIuzo0M2VIrF5jp?=
 =?us-ascii?Q?Gg46vufYv1iSyXaB/c3A3vsvtSrIjT3L7RI9D78ZUm0x5H/fMx1JWG0/qXxo?=
 =?us-ascii?Q?PonpiFvV4WHqznAyFiPCdALiAeW4qg6mf9k+q1F21pGi0g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_89FFE3A308194357BA9CE7823CC7765Fcitrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 538044f2-0ace-4d7e-299c-08d98c9cc7b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 09:52:04.1409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zahJyMYiXE3rX88pM2RPdPfjTvqDEBVcCGvZF4exZn0yEp0e/qwO87ISPurSszVYzxFckVxLKAgLnBG+lhKj+DxWrEWMpkws60RphfLzISI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6257
X-OriginatorOrg: citrix.com

--_000_89FFE3A308194357BA9CE7823CC7765Fcitrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 11 Oct 2021, at 10:36, Roger Pau Monne <roger.pau@citrix.com<mailto:roge=
r.pau@citrix.com>> wrote:

Ping? The two patches above didn't get any review in either v1 or v2.

Patch #1 should be ready to go in AFAICT.

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>

--_000_89FFE3A308194357BA9CE7823CC7765Fcitrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <70176F864BE74F4793B43BDAC8B79BA6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 11 Oct 2021, at 10:36, Roger Pau Monne &lt;<a href=3D"ma=
ilto:roger.pau@citrix.com" class=3D"">roger.pau@citrix.com</a>&gt; wrote:</=
div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Ping?
 The two patches above didn't get any review in either v1 or v2.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Patch
 #1 should be ready to go in AFAICT.</span></div>
</blockquote>
</div>
<span class=3D"" style=3D"font-family: Menlo; font-size: 14px;">
<div class=3D""><span class=3D"" style=3D"font-family: Menlo; font-size: 14=
px;"><br class=3D"">
</span></div>
Acked-by: Christian Lindig &lt;</span><a href=3D"mailto:christian.lindig@ci=
trix.com" class=3D"" style=3D"font-family: Menlo; font-size: 14px;">christi=
an.lindig@citrix.com</a><span class=3D"" style=3D"font-family: Menlo; font-=
size: 14px;">&gt;</span>
</body>
</html>

--_000_89FFE3A308194357BA9CE7823CC7765Fcitrixcom_--

