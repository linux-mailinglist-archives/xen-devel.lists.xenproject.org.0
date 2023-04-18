Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E36E6972
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 18:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523011.812736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poo9X-0006kH-Cr; Tue, 18 Apr 2023 16:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523011.812736; Tue, 18 Apr 2023 16:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poo9X-0006hf-A0; Tue, 18 Apr 2023 16:25:59 +0000
Received: by outflank-mailman (input) for mailman id 523011;
 Tue, 18 Apr 2023 16:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqrX=AJ=citrix.com=prvs=465e465d1=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1poo9W-0006hZ-08
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 16:25:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0d26f3c-de05-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 18:25:55 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 12:25:53 -0400
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by DM6PR03MB4985.namprd03.prod.outlook.com (2603:10b6:5:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 16:25:51 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:25:51 +0000
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
X-Inumbo-ID: b0d26f3c-de05-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681835155;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GheJe5J+AZWn6GMpDCG8af9lZgEy0F/0Z2KZ8WdeIhY=;
  b=XXWXwQ0elcb2xhu5cEhcXb541FzMsmx5HVqRwDRRsat2VVGZrDNklRyi
   awlLva/XxLk+WCf4B5/+y9DmIMDQpQMKu2eMrTAQJz1QyJvKK+BgDJ2lP
   MGskCxoMymCiWzkYkOA1K1gQugT6HgmGQNk8f9UFDrOoBY11lFLhrTryA
   M=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 105328711
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RqmsF6yoD683h8vP0/d6t+cTxyrEfRIJ4+MujC+fZmUNrF6WrkVRn
 GoeXD3Va/fcMTegeYh3O97j80gP65CAydZgHlBvriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiPKAT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVpUq
 uAiFT4zVUCGmtmm/6q+buNCof12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQruFTuGIO9ltiiX8JOhQCcr
 23L5XvwBhUyP92D0zuVtHmrg4cjmAuiAN9JTu3nr6cCbFu7x04cJTMJSmeCmtKazVe1R/ZjC
 xc60397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMwxQyYj2
 hmWntfqLTt1ubaRRDSW8bL8kN+pES0cLGtHbylbSwIAuoHnuNtq1kiJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:xaK2zaCqsMgz2rPlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-Talos-CUID: 9a23:LyT3HGG/zLU+1cK+qmJc7hEIIP0rTEaNyWrrM3CgDEJjZpqsHAo=
X-Talos-MUID: 9a23:zgPd1QtcG4WKvMziSc2nhRNtGel3/JiXM2su1owNp+24FXdeEmLI
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105328711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez119Df///LlqbMLVqOGhZqlHba5t3MSeWqIjhA/3JDpVqlJTRHHkNd+ghPQjHoBE5MDbfsa9wZPLqEUf6iEQp4BPIFXu0nFcZCKPptbsWdIrKxf8gZoVGJMosmt4wdbMA5I9nCRIrMvUTfdwwBDM/nB+TuY25+ajhgqm3AtakGWKZbA77ZFAbDoeF9XfKANMS7ZDLJfWt65k4I2tjcwtb3YQ8H85/eV2tpWSU5W4E9ydb98guuZLiGJapSiRo+YuhyrPQgCuU+/IE9lXszDHW8A3k2hNjaDI1iOTZh/M+zPHjGkk7g1NZu1IACcI8q5GAO643C2FYG5d3m3eVT49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GheJe5J+AZWn6GMpDCG8af9lZgEy0F/0Z2KZ8WdeIhY=;
 b=E/12EJRBpgao1wGsrmdh7+SoEk2eCxHtmCENvD+kIn4yfdnqNbxFAR1dY4PT8buqmgPV0mRZDdHUjAWy+aLLEs73+6z89VwBjTKKWiVRZQJvTn5eCz1fT9qBLkipwGFvQOQ1dY4boCOjUqE+7ZwRNoyqx6hO4cl/34DXds7ho/CzDKs/pB+bUodVoETpcGi+1vLW2IuE95u3aj1C8YBSxpB224B0EUnQLPDj1TVKmjh5K7C8LuUW8AynAdwpPRuHjOI12cPOllPVgbIChYaHJ7m11EHbrXVY+MSi9VDIOyUcXnzAtb0mKBm+tuZpN0WJBe7Kx6czX9/QsGRVJlJ+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GheJe5J+AZWn6GMpDCG8af9lZgEy0F/0Z2KZ8WdeIhY=;
 b=W0sLBI7So3Ype3llSfMJZiITS/sSjd/Vcw1ovoptoJ8zjBwidQg7L/oFR/BIoixK1iM/vNcnzEs5Ai/NMWzqWqh/T+VxeE93xPvrvrPeGmp3qLq2qGWADBcKdOUk26jCH2JhRriq36N0ZwEAskqYuw/dEZzjhtuWJv9trU5rAZE=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 3/3] xen/livepatch: Fix .altinstructions safety checks
Thread-Topic: [PATCH v2 3/3] xen/livepatch: Fix .altinstructions safety checks
Thread-Index: AQHZcSYgbPbLeOW+Q0WPDx+blTOlEq8xQGxn
Date: Tue, 18 Apr 2023 16:25:51 +0000
Message-ID:
 <DM6PR03MB53728A41166A01EAF9A86482F09D9@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
 <20230417121357.3738919-4-andrew.cooper3@citrix.com>
In-Reply-To: <20230417121357.3738919-4-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|DM6PR03MB4985:EE_
x-ms-office365-filtering-correlation-id: a11249d0-44a5-4d99-a4b8-08db40299345
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 V/40NL6dJi/UsQ6rl0ZybtM3m8zpvhwfUmOkxAt+WNcb5zsETWoAm5TVsonCMmmyA+Sl5M6zuHb3s0rnRDVjaJQt42wskayiCa+KWq+64m03PVRHQg/3SKlHh+5PhvJ4i4iYYHT6ZiPXvDeiN8g/vgdRprMLhUPrSwFrO8AMOX20DPmk2SqLnxVJwcNtJjPMIC37FxwQFO5YtIo4LdISiGgUBiF5IPmJR86YrsvecD4cejxPmsWMdCVV95aPFCJGygxai7AEVrwVhGCFgI3XFeirjr5+uGfRDkR0Qpzef2Aop6owUGN2J8ksYZlAgfNtb0rMXRPdJbaLuslZFyNglNTVIVRqggzoMRYyDHQ+J+cnhe/nk2iUlkMJrtyUO7mZO16M9MH7VjYQH1ncqZeCF2wL0HbHV5zhN9gsHNqJujFdSoWV1scPJnQwgi4B7wDNeJte7BRkrcOw93yITRLBEL2D1lUwMMd3IOwFOdKirdprCUDC9AjJdcET7mVYJsUxowL+wowJ6cXZqYBuYTWpUbJw8a6Z5AczITIVCMALn+3Q68KHR88EYtXPbFxTckQqlmXpI+62EbrOgcHmRN2mUFkrrFy4O2uUVSZ+ydCO88emvyolDvyrYYGtod4ZaiVz2EhnE5l8+VUhBxreIHQ0Ig==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(38100700002)(4326008)(122000001)(91956017)(71200400001)(7696005)(55016003)(44832011)(316002)(52536014)(33656002)(41300700001)(8936002)(8676002)(110136005)(5660300002)(82960400001)(4744005)(2906002)(64756008)(76116006)(66946007)(66556008)(66446008)(66476007)(9686003)(478600001)(53546011)(6506007)(26005)(38070700005)(186003)(86362001)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?++OdFiVw5VCBzf+tRQClBJ6lzNBULBU3muToplymIypcEOOVvUl7aW2cUx?=
 =?iso-8859-1?Q?CxxvHATLBG1dgHQZnSjf9WJ81LwsR+noOALYxO/3ovKEtYf9zR3sAwLbOx?=
 =?iso-8859-1?Q?rnCNgxzqRvKHKdAGpkXGmjPgotohlhoU3stxqQinRSgCsCKKWI57xx44NN?=
 =?iso-8859-1?Q?7HNcU0xegAQn+0t0kRmUbLAibAD9wdpWfysyXfGdwi4KrOMQP9ADfdHPP7?=
 =?iso-8859-1?Q?B+HldXGeIhH8xbCWxDKlaxQAD56pRVJSEJyRiCTU36EHp5X4iWSFXndYAO?=
 =?iso-8859-1?Q?b5TInxq/qj6+ecslfiU0ayfb2JW4zC/bj3psg6EbXQteXirgnxi7f7Tsu+?=
 =?iso-8859-1?Q?oB/Uj2F/CSO4QKtNC3a02hLNedRQ+M0MFkonrQg+xedDR9x9Sf5yK3ym5O?=
 =?iso-8859-1?Q?QKqVzprnjwmr3lSf4thV0EYKoBZj+aOCRLGYoheoT9HxlWZijkBkBWMS/X?=
 =?iso-8859-1?Q?NmjxM6GyN0o3zFCuizCgLyIeKaNYhOaP4nX3hZ7B7fTjo+lHeXp8Lc8wBM?=
 =?iso-8859-1?Q?1Oa4UU7KOQ3Hced7Q+3W76hy8SoH/feyeJnoCBtk5PIWWUWaByKsc6jkh1?=
 =?iso-8859-1?Q?4+GHOizJw774PIsnsWNetqLPa0+AtDaiAgxbLpA9Pa4SVse3YTwtTj+Bja?=
 =?iso-8859-1?Q?GiOWEMo/ZLFMYzq5JaKZ84O9wypOTQxV8hzGhBptO44PaXSCbwZyMAykce?=
 =?iso-8859-1?Q?oFGHBbzGGgH1TTQdGTCT5LKINOzJhWfvOJgjZbg+7gS9h0oSN7ALE1qZ1q?=
 =?iso-8859-1?Q?SevNV9hOK4KPFB04lFrD/s3ld8wI5w901HXTJCqF4LnHFT7N5rpF5Kbodi?=
 =?iso-8859-1?Q?uMg5ASSG9adEI1DUvEzNxVMlDUjeprv2/RjKiEfHVBeo8ZQdScTrI4TReF?=
 =?iso-8859-1?Q?z4xOx758xf5h8HeWruVmkDTIm3jcOsC+3mhh8fWefswImgfVlb9fvr/+PZ?=
 =?iso-8859-1?Q?L3cpuQOKw4fmMa2sNhVY751VVZ19XF31KcTwDiaAs86pAZCuZB/dsXPoph?=
 =?iso-8859-1?Q?2Y4BvQGlTFi1bUepgpkW9aBpG7YtcH/tIVTtTEDwN4HrAFTeMLqm4qWKCk?=
 =?iso-8859-1?Q?WkQ9yipQ5EvFTW7OP79FrNCLLrMcl8LYCB0lTXqvrEZYvgPrhYaG3Z6kXT?=
 =?iso-8859-1?Q?BrdWkJWFbFRH0yUEkp4MAl/Af377Mx0N4t9UJPKpmtJtRm2Awg3UJBahf9?=
 =?iso-8859-1?Q?JK4mcVChn+hs2Zem422qa+ZoaYeWYD+Wvgr41O/arI2vgnb8VAkJIyDpjy?=
 =?iso-8859-1?Q?wcU6ezKS7cjJsVmDZUpJWaTzqi/Ee8jjrk/pY8y6Weym7PAJnRUeKSFvEX?=
 =?iso-8859-1?Q?a4asN97y2lKItse6L7rPWkz5KCMkMBtq/YF9tiUQtLDg3IFfVCI6uwS2rP?=
 =?iso-8859-1?Q?k++REbRjsO62qgZUcO4Iey2FWzZFCTLrRwKyYuAHfFrqDjDLj5ROnKhPcU?=
 =?iso-8859-1?Q?VuUygtr0XWSrHabyiQUC51E5sBVVjS7IzUa80pmj9p3lCjAZn6c8B/+A1d?=
 =?iso-8859-1?Q?IAIdOJc6mSaGM87cLqjP6cEEHrhoQRLgd5J2j/BcG41FoI8DI6YOPR5hrd?=
 =?iso-8859-1?Q?v/W+CZlqRwj2TKIQ/aoadmBS5No23V/s8xpbBZbO/u/fbClS1E1jP6Jm5N?=
 =?iso-8859-1?Q?I3Nrm5BHEmn2E7k+yxTxMzr8JeBXHIBmyd?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gA40S7zidF7fNI8YvkohyNLSdhAsUtToW+6Z8yGHxG7JXbrnob6OZkLUai1PC7zg2o29wHJixiyZrnvF4HxGZqI6YR46Jy13483kuWTae1oNCwcaOWVYvTYLyMjpwxifeGf7/xnY+11O4EPF3FyQaTabkC3EgIAhtYI1a9S0LDOtaMO3y7Xb8xh1vRrsTuN4kHag8myaQPr9g6jJy4PQK/v1G/j5zf0Wednxe0vseCXGJwDtv1YarDhfTaWMuDtr/INUJ08QjUGmbaOFANi2u5d4u76J117OOc/5i61hlG+hfSbteIrXnGSLWvoLK/5BV2Z66oYxgLiHW5o36P0IYg4BxrbjrgBXUYTCP3cZNdD5To3ZsUFW9x7Gwfim7tEdUs7ccSlhIXVWvEMudgYI+DMWnTuFUAGP93lN/bX2Uf2sYVXT3/oBSD97ZJsgVNFpCu6anXL4mY71alr+1hnhrA7bnHa5v7gOv043zFRaO/IKmpP5MpZK7nnQOzUqFIIjTRxNWB829kTEZ5fQh2pwUZFIae215qWcuQ69hiZNVdyvZyR3pYfT0sk9UmQ9oyhkkKuPN5htEmfSUhX/HLm3W8Aau06/r+IzJkceOVQarBFLIyOPETiGrEmpp3vLJIZ6SJrwg0eSi5Qh4QqMA3GEoTl+BBwWFkBAKYAyJeFYN2MzXLSWjpGlpTuNGJNifcmy6r1uo9PP+zsIMhzXnUsmO5vdsLEdxhDn/tqXdYA4jXhptL8R6x7mciC8GksIax4TxaKVHtzKebc9VbDEorZdtQmDOJJPJor7pGZ5JchnMIpwL4YOvXcLqZuYxFljh6g2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11249d0-44a5-4d99-a4b8-08db40299345
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 16:25:51.1621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KX70nIRh943IXSWq2wwgc5R1xLSfKdLdK/87v7C/ToJ7mNZv5C5+LzTBwK17VxXl+GkBvVzopA+Z2ZlnBTV+tDiTsy7/Ym7Q0jYOTfB/yPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4985

> From: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> Sent: Monday, April 17, 2023 1:13 PM=0A=
> To: Xen-devel <xen-devel@lists.xenproject.org>=0A=
> Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; Konrad Rzeszutek Wilk <kon=
rad.wilk@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH v2 3/3] xen/livepatch: Fix .altinstructions safety checks=
 =0A=
> =A0=0A=
> The prior check has && vs || mixups, making it tautologically false and t=
hus=0A=
> providing no safety at all.=A0 There are boundary errors too.=0A=
> =0A=
> First start with a comment describing how the .altinstructions and=0A=
> .altinstr_replacement sections interact, and perform suitable cross-check=
ing.=0A=
> =0A=
> Second, rewrite the alt_instr loop entirely from scratch.=A0 Origin sites=
 have=0A=
> non-zero size, and must be fully contained within the livepatches .text=
=0A=
> section(s).=A0 Any non-zero sized replacements must be fully contained wi=
thin=0A=
> the .altinstr_replacement section.=0A=
> =0A=
> Fixes: f8a10174e8b1 ("xsplice: Add support for alternatives")=0A=
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> ---=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

