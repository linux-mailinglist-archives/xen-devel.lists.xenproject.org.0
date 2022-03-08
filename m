Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CEC4D19A5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286917.486623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaGd-00013c-Q9; Tue, 08 Mar 2022 13:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286917.486623; Tue, 08 Mar 2022 13:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaGd-00010c-Lo; Tue, 08 Mar 2022 13:52:47 +0000
Received: by outflank-mailman (input) for mailman id 286917;
 Tue, 08 Mar 2022 13:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRaGc-00010W-1X
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:52:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 065968a4-9ee7-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:52:44 +0100 (CET)
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
X-Inumbo-ID: 065968a4-9ee7-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646747564;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O9155BDAnNVAviUt/U2hzgdm3VosB9qUYXeR6htG8Jo=;
  b=E9WOVwK17OYizQemjsXkPQKzR4MMMQPqNOahCdg2+PnuZ5tCoty5/Lzu
   0Y8wZYD1MU1JSfRs9eSMN90ywHOzZwqZ/u/zxGgiFC7oK9EnwG06tBnEO
   fW/BkvRLusVGOAr2gA481mwW7V8KHalLzKwqe4RBujcyPNy4zTRF3f51M
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65636938
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CBBRb63oUI3XDM9FqfbD5eVxkn2cJEfYwER7XKvMYLTBsI5bp2QOm
 zNKCz3UP66CYGL8eNFxbYrn9EpVsMCAz99jHgFtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1qtoGbRR8GMZTFgdo+DgdzPHldHv1JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO5gE/HVpwjzDEv8iRbjIQrnQ5M8e1zA17ixLNaiDO
 ZFHOGE/BPjGSwdfME8TOY9jpsOtv2feIzRY+U7NhKVitgA/yyQuieOwYbI5YOeiScJYlEucj
 mvD9nb+BFcWObS3yyeB83+qrv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGrq807kWnCMb8Wx6Qp2SNtRoRHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC8
 VyUtN/xKjNWuaSrai+D3ZjMjhDiNn1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsWRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTQGI3h/5nzvp5p1QEwZ3Y1R/HNEBz3pxaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZh0k/ewSI+8Bq2PBjarXnSXXFXclM2JTRTMt10BbWB2yf1vU
 XtlWZzE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6OJkeN7Jd0/xPg9eyWh1
 ijVZ3K0AWHX3BXvAQ6LdmpiePXoW5N+pmg8JisiIRCj3H1LXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:o4lF06OF3vpeRcBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65636938"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOft0Eo/XnMJF0xeha48uB0ybOLj8zBmhLwmsOJFyuZagD24MKLNFuUE/cjSixkr0hDTm9sicG21rPUoU2c9A426bYVRA3WANzYE2XxZ6ksbEoARZMCCZwR3YfGUzN8nCCVyIkZ8elvNscmLcEKlDqQ76oBv4JBo/2iyL0Y+pFU+FDToK1WC8GUyNPcjjsWi4DoSOFkMGdAxeV1RpPgBPa3myCNzJivERDF8Hz0tIAUkrWdI8Rda58uC/HpPKyrm0Ww7xAP2uFofgUWCBCgu/Ah+DN+6nmL8Qk75Kh3v7LhyAOjfIVquidQ4HVjxlycV48fyMoqadr0LAd049Ls2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAOUOJ0jB6mSdT0t7+Eq+yBBYYGeFA374gfxlRedNL0=;
 b=OGuVw8xfKFzPAtMJAPKM+wH6mJVCpr3yYDH3PdAg9xnAVN83tWSpLWc4yh1nOOKUH+Oyr4JtpA/8YL9WLSdw2/rYqvLrCkMRtly/ERGtHzc1z0GumEQjtI3HlR4DZDZLbEiN2Mzi7K31Xs9g25pr1fx4ujVMq1nW5yTgEalm+Ih0JrleKpCFj2hP7X02MxwFUS7nubjv+MKHpa28ZvmpTGmCwL8KvhmTB9LZaZ4tz3whB68H3o5HmKbUu9HgtU//hrt5qGF5KjngO5SobA9Auy+ydeH3+nn8/qSkgkKpYWQkOghvqUAvcjj7rQxYWI3EAfEKrO62uBxVJ9mYwy0hHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAOUOJ0jB6mSdT0t7+Eq+yBBYYGeFA374gfxlRedNL0=;
 b=Nt3YLLTjDaM+KaEXUYJLErK0iFXNwehzv4wvZLSxYzwYEWLya/m/2nhEG8igftIxjEr3DY5V5VuNqKmLGPPLh3/LVc5qn4bSGOW1EldJ/T/1P+DDwzf3cfsXW64blW6EFJnL7orNCin1FwqHkxMNCr6R3cXWOCDfzb3Np8zu9SU=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "doebel@amazon.de"
	<doebel@amazon.de>, "julien@xen.org" <julien@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 3/4] livepatch: do the initial build using CROSS_COMPILE
Thread-Topic: [PATCH 3/4] livepatch: do the initial build using CROSS_COMPILE
Thread-Index: AQHYLkHcTkbZn1yzL0yPG0BHEpHy/Ky1icjX
Date: Tue, 8 Mar 2022 13:52:37 +0000
Message-ID: <PH0PR03MB638268644A8459016AB61C4BF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-4-roger.pau@citrix.com>
In-Reply-To: <20220302142711.38953-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 34e9a7e3-1c7c-4a8a-4a42-cba50b66feb9
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8307660a-4b0a-40ec-776c-08da010ae7fe
x-ms-traffictypediagnostic: MWHPR03MB3262:EE_
x-microsoft-antispam-prvs: <MWHPR03MB3262B14BFBD5EB256C197FF0F0099@MWHPR03MB3262.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2QYsFkHGL6Ip4oRRAGqoSpolJmLd61fpN2HvcuMHRqzyDF6w5eEdy1lNUIGXW6W+a5Gp2qrtJk8C4b580FeE59ezWz637r/19g43n2pncAxPnGE/za5PbB+KLBdm73O5QAqtqFJTAS0SL7CoJ5LMNADcBTtpAV0aj9YCJwMxgM+xRIvKWSjzfPCAkma8oQsQJhimBNCNUyl1Rus5FrkdGvozoDNTxlI54GPHSrz/uVu4OZ9tcpw1P2WoBcFqCGfn0Hczu33InDRpZB1s7X+/EPYSMmzH4cFVFKmstwBFzqm1rV5JTrT+TiHNS1n4WXjtNivPQsSGzbkxTTVcM1MPaj3h/ncW4B6cjhZSxL71CBzULkGcWpFqsJg5zAmFjpAyRCY/pjgxl5KfzJaF7Ikho/tFmkwecdFaOmhTHyPYQUbVlOVnlI9PP+F4x015j1ofonf/lDQem1Vgi+N7T6D/mv+of00ZI5EcargC6y0++wL2yCz0Qv74WzhBqPVovtXPqHQFvw+eMVtTxm9cotBBnppM0vca1zgbVET3iRIpUsFEI9KuYK8bO7cVsM/lcKx0QLX4+mv0DZBn/59+NtMObqSzD7R0PaFAdzUyNGI7NwYHLWnQFmAosjJn42M8mqFJYDgXjeK5iHEIQQhsBceyjE1FVHtvggTy3sdZ9BjYqwCSAYGdPTF0ZwsIZIiKXzcy8vt/Vj311xN9pkngQvsoiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(508600001)(91956017)(66946007)(82960400001)(66556008)(66446008)(66476007)(64756008)(4326008)(76116006)(38100700002)(86362001)(71200400001)(33656002)(107886003)(55016003)(186003)(83380400001)(26005)(9686003)(8936002)(7696005)(6506007)(5660300002)(52536014)(316002)(54906003)(110136005)(44832011)(2906002)(53546011)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8ImY/S2ywxBsU2t5G12Ks2g/9bbzSrPwnbDX9op0G29lCivMxNklrhcpnP?=
 =?iso-8859-1?Q?VwuMKkNLn8h8+g/nq5PrVo/ZlEYoxSLX1K5P1DGutvYMdelJFgDBK3WXyU?=
 =?iso-8859-1?Q?OwPQyqnChyPmBXNsLKjegglqzH2NCrlZFPkqHpLNyJjzNL5L62Z+VKZXGk?=
 =?iso-8859-1?Q?ve9mhTWXwWQvYkZaibHYHjV0dqAewqmIEi8War70IKvJRrvA/VjuowUesl?=
 =?iso-8859-1?Q?J9jjYQ7eKNw+WKH758lrmFyWJlzB/a/NTG0pznMfrtkpSjz9QVJ7xuqytS?=
 =?iso-8859-1?Q?Uul8ibn7dVMByVY7wMoTDvSmA3THrHxiqtP4JgoH3Rhu4kHD9ZBezvnCKL?=
 =?iso-8859-1?Q?UoHKmBe+el3mMY6s++vE4GtoMeiHczXib4ptU8BY/J3UUPrykoQJylHCrS?=
 =?iso-8859-1?Q?SBaS+S50JH05WFB67SvCUfTOPJiS90TeJVC7A9tdQVxUUHceS7Zjsq9h6w?=
 =?iso-8859-1?Q?1JJ7UIUBnZJpomi4aafFMkcX6WfHMLMmfgNHdK5Uxn7FyIoPEgEFCi5CO9?=
 =?iso-8859-1?Q?K3Faes/n92gXdInkE1IQpzqNPrWA7Qsk4R4ZAZO3nJw0JB2AesyJRkAH6E?=
 =?iso-8859-1?Q?+sXDCKhHPSRhxGd8OUsYcnyuGAQvWCiDo89iMf6jj0/hg3qkj/PL038Qrn?=
 =?iso-8859-1?Q?K14nr1X4jema0YBWAfhkYdXEsHBb0YTwXZboLlzUIaV5+3UDKVIwrq7jcm?=
 =?iso-8859-1?Q?EkQF8K72hL0V5iiHleLTjYgwcyR8vYc1rQXSPr09bkLOBUvm4ON6VSk3PS?=
 =?iso-8859-1?Q?zvFUJ+p3Ry9+Af7t3WXZOTa5lsxKvbH860L+CPQMiQo9XPwTtDTWcnUzqC?=
 =?iso-8859-1?Q?8FXktk0a8YIm6ramdbC1sqrw7iuuNUBfxPV7nJHJD2E2FCva5WyW3wstXl?=
 =?iso-8859-1?Q?1XcbEsehTGOJ89v5iMk3GYz8FKbcmLRKCzTn2EvpPSJ+LV6dSlvUEtymbS?=
 =?iso-8859-1?Q?K+o11Grboc5qLpixAqY8hcRf4Ap/TaaB84trDvKoY4wrWuK4ZaxBcGHJA7?=
 =?iso-8859-1?Q?TJnW72lKlxqdmoMdwfefIwTk6PUJKlXQy7pRXEjsJhI7R4tInIzJ/HCdPj?=
 =?iso-8859-1?Q?pA4Hhg17p0UMerDvA/zxvs6SbrpqYZTugmjm1u1GBZPnWDOjABdsKvx7ck?=
 =?iso-8859-1?Q?bP+RPDsRFgXeApQBKC4z7UfcIv8/ljV5Qoo6RlGBVUptFfzFiF2WOSzw+V?=
 =?iso-8859-1?Q?lSvVNJs0uqzYqCS5czt+UwO4KV+9S8umViNqLNzGaGknNlAezFoTrB7HtS?=
 =?iso-8859-1?Q?+CQdQY1UvvunxmPs5FiDwFqdCVMSQip8RmnLvJCLQbBg48KyBrnDqt7dNb?=
 =?iso-8859-1?Q?ZyM8jY/vAjD3mLryoQlsmxg2VlHBHM5qCowFpMYfPorMhDRya6wQJE12hP?=
 =?iso-8859-1?Q?rfv3YKgfbB0RvEXHyQBqnIQHdEkAKrJNzRz/NqncgWXMwpADeTipJqxjW8?=
 =?iso-8859-1?Q?3lIXu0uctHWf2TrNJAgHl2jjtXFNzkY6z2a5NPLudx2fJYxX25+Xfz1PuX?=
 =?iso-8859-1?Q?C2Ah1JA1BJi9O1u3QgpohYYJIsxrtxpcHd5toKhmLGgPvodQ1bh1LFChCR?=
 =?iso-8859-1?Q?AzqTOIMUptgkbYwUv5f1bJZlvkEJWLIQ+snxeDbuTxgdB0B7+YEV0YBrJR?=
 =?iso-8859-1?Q?OKKswGHfdnXF+vTFyWm/1Y4LWgCyfN3yQZQKwedEUqV7DV2lEGnwotVTfD?=
 =?iso-8859-1?Q?zoAIXVCwub09Db1f9HfkLaJxvqX1sy1cmTweQ1gz1Nko1yeJm/sajWh48k?=
 =?iso-8859-1?Q?G2VA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8307660a-4b0a-40ec-776c-08da010ae7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 13:52:37.8767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V25+guR80lpzzyFR5P7MBHzfgfoJd8Aqv4gx8RgyDnczlYB9VIvOOJv+7CiqFiwG6OkERvR7N92JRbC2I7xjNoI7aSKv24HyBxIaOd2y6rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3262
X-OriginatorOrg: citrix.com

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Wednesday, March 2, 2022 2:27 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Ross Lagerwall <ross.lagerwall@citrix.com>; konrad.wilk@oracle.com <k=
onrad.wilk@oracle.com>; doebel@amazon.de <doebel@amazon.de>; julien@xen.org=
 <julien@xen.org>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Roger Pau Mon=
ne <roger.pau@citrix.com>=0A=
> Subject: [PATCH 3/4] livepatch: do the initial build using CROSS_COMPILE =
=0A=
>  =0A=
> Setting it afterwards for further builds will cause the build logic to=0A=
> detect a change and thus force a rebuild of all sources.=0A=
> =0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
> ---=0A=
>  livepatch-build | 3 ++-=0A=
>  1 file changed, 2 insertions(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/livepatch-build b/livepatch-build=0A=
> index e1715ea..38a92be 100755=0A=
> --- a/livepatch-build=0A=
> +++ b/livepatch-build=0A=
> @@ -92,7 +92,6 @@ function build_special()=0A=
>      cd "${SRCDIR}" || die=0A=
>  =0A=
>      # Capture .o files from the patched build=0A=
> -    export CROSS_COMPILE=3D"${TOOLSDIR}/livepatch-gcc "=0A=
>      export LIVEPATCH_BUILD_DIR=3D"$(pwd)/"=0A=
>      export LIVEPATCH_CAPTURE_DIR=3D"$OUTPUT/${name}"=0A=
>      mkdir -p "$LIVEPATCH_CAPTURE_DIR"=0A=
> @@ -408,6 +407,8 @@ if [ "${SKIP}" !=3D "build" ]; then=0A=
>          XEN_DEBUG=3D"debug=3D$XEN_DEBUG"=0A=
>      fi=0A=
>  =0A=
> +    export CROSS_COMPILE=3D"${TOOLSDIR}/livepatch-gcc "=0A=
> +=0A=
>      echo "Perform full initial build with ${CPUS} CPU(s)..."=0A=
>      build_full=0A=
>  =0A=
> -- =0A=
> 2.34.1=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

