Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B94110E5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 10:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190311.340162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEbf-00057i-BN; Mon, 20 Sep 2021 08:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190311.340162; Mon, 20 Sep 2021 08:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEbf-00055e-7C; Mon, 20 Sep 2021 08:24:55 +0000
Received: by outflank-mailman (input) for mailman id 190311;
 Mon, 20 Sep 2021 08:24:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+Th=OK=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1mSEbd-0004oG-Vw
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 08:24:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9d9065e-d9a4-4c6e-94d6-83607cc27844;
 Mon, 20 Sep 2021 08:24:50 +0000 (UTC)
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
X-Inumbo-ID: b9d9065e-d9a4-4c6e-94d6-83607cc27844
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632126290;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fx1zSfA1R220O/aaGUHyRpJ2+0Ro7oxjPjSBnJ41RiE=;
  b=YfjQmFbtAOmqBEdVhnl7HYYoGjo5O9BaIFJHOjL4Qu9dgoDsgHMW8j18
   WYDJxky874ltdkCc51X9kXj0Zf8poHDbsLJKont7/izvWqvoQ+8maeAEI
   r8lD53HMThKBjOh2T17pl9S+nyRxT9vkhWo7Wt9kTmF8XXVxTw0J2EDU3
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9LOx6gyPRIdLbue+VS7SBouuWKLAVP7GXXwr0y3/FRxvi+lQdoNPPHpxycfyNAnjaBZiEztiRg
 I8p95plcfsM6eb3oI+Q4xW7JA8FMCtbh8M3pibb42Gc8OxrNrtxDV25NQyh32A17r3UL7nsemE
 7lm43I88Bi90FF7plx9Ov8my4FHcYwb8NncjQhYwo5ItVGAHHyI2sF8dcdwkXUpjS4zZXDujXN
 iNMkWsV8Y1u6b8A9371DUxUxthyfdveTm8WfQciXAsSyj9zw+JUsvrynaCry6UndAbV/eBmpE9
 xLFp1dJnC3LUcOmTOXj5PNCO
X-SBRS: 5.1
X-MesageID: 53118422
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jHKsZq53RdxtHyaDSARvKgxRtJbAchMFZxGqfqrLsTDasY5as4F+v
 jRKXWqFafmNZGOnKt1+Povn/RtSsJGGz9cwGgFt+S1gHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2NYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 tdhh7m2VB8SJJLPisI+az4bAR5uIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALIcX1PYVZpnZ6yjLxBvc6W5HTBa7N4Le02R9t3ZkXTaqEP
 aL1bxJPTS/dekQICGwHAYA4jOyQqlr1dhNx/Qf9Sa0fvDGIkV0ZPKLWGNjaYNuRXu1Og12V4
 GnB+gzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQyPluh1GCw30JPzcfX1C7vPqRh1a3XpRUL
 El80iYns6Ua7kGgSdj5GRqirxasvAMYWtdWO/037keK0KW8yweGBEAUQzhZctskucQqAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HhqowuihPETv54DbW4yNbyHFnY3
 DSivCU4wbIJgqY2O76TpA6dxWj2/96QE1Bztl6/sn+ZAh1RYoyJVamu9EDg98lDPqC6dn7Cr
 kcUhJ3LhAwRNq1hhBBhUc1UQurwt63UYWWG6bJ8N8J+rGX2ohZPaagVuWsndRkzaq7obBe0O
 Be7hO9H2HNE0JJGh4dMaoStAowByaH6HLwJvdiFM4ITPvCdmOKBlRyChHJ8PUi2yyDAcollY
 P93lPpA6l5AUsxaIMKeHbt17FPS7nlWKZnvqXXHI/OPiuD2WZJoYe1dbAvmgh4RtfvZyOkqz
 zqvH5TTkEgOOAEPSgLW7ZQSPTg3wYsTXMutw/G7gtWre1I8cEl4Uqe56ep4J+RNwvQE/s+Vr
 yrVchIJlzLCaYjvdFzihoZLM+i0A/6SbBsTYEQRALpf8yJyOdrwtPhPKcRfkHtO3LUL8MOYh
 sItIq2oKv9OVi7G63Iaa5z8p5ZlbxOlmUSFOC/NXdT1V8cIq9Xh9oC2cw3x2jMJCybr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBne37rk/s6A8AQMhGflDGU4
 BmbXEUDru7Xro5rrNSQ3fKYr52kGvdVF1ZBGzWJ9q6/MCTXpzLxwYJJXOuSUyraUWf4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LyDfj8dVt6BLyrtIgieMW
 xqCqotAJLGEGML5C1pNdgArWfuOiKMPkT7I4PVrfEijvH1r/KCKWFl5NgWXjHAPN6N8NY4oz
 LtzuMMS7ADj2BMmPszf03JR/mWIaHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLE1rDfg7l8x1bZdythHHfA6uNRmJAStU0Y11QFPVmIxoLIi/JfMMe9KtjrotC5Fil67t8=
IronPort-HdrOrdr: A9a23:6lvD/6rbQAQqatjWlNMJSWsaV5txLNV00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhfItKLzOWxFdAS7sSrbcKogeQVREWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjFzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2WKbRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX262oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkFxnAjv0idvrD
 D/mWZnAy1B0QKJQohzm2q05+DU6kdo15Yl8y7CvZKsm72ieNtwMbs/uWsQSGqm16NnhqAh7E
 sD5RPoi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4dkWSOlHklYavoMRiKo7zPKt
 MeRv00JcwmBm+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBKVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNKAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4ljDlhCy/TBrZ/QQFm+oXwV4rmdSsQkc7vmsq
 yISeFr6tfYXB7TJbo=
X-IronPort-AV: E=Sophos;i="5.85,307,1624334400"; 
   d="scan'208";a="53118422"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCSPu50Gd8fJzEvK3P4ebEVZcl5nUUp/nRAWOZh09WDjLxb8q3qJzx01/C2Tar3gvoxSR+YwWM3q8d1Il6+eRsemVtp8T4nRnoQkayjjtPHYmBGu9hqqwC0XrANMO8aSpX0LL4hwN+tB6lsM6V80Y1uX4NyihlRRTTo3kOTFV2TONxkXxNGAo9WSBoloRJZY/JxWBZeON1v/xxzTVc/72GxVCeUjvFQKdWC7SKaDZqtqCNk8hk0NhhehCCaPaIJE1r4iAJbR5v3E1wV8sR6oRrpBKh5TvRil+GcWRnHh6mW0PiAl9F9MUYAsrlv70Qxn4g0JAciq51cJqHy90OOSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fx1zSfA1R220O/aaGUHyRpJ2+0Ro7oxjPjSBnJ41RiE=;
 b=B7A0TQ7AW/3ybR6xSJe6oao2dPkMAQSS3pGXk8PsUAjz+b6Qf0d3PD2YbORB84mWnv5sMlmQiZQ2nYzUPs8J89k8m9HJ99XFZQSiGw1LiUAZItmFHxZTqo/wNFwd5iu2s4If3sjfrsCHTup3zJEeRu1kzNQUQ9Z1PpzLLMR6frBc67/95th4c3oEbHYpW/7QpgyBNYLrG2fHrxTmeE+BnbF14MZFQQ/A4obNwWf49GtsKTbFGOPW+TvC3vaXmATuJOeHXszdFR5Q4iCuagCl4iD1PumlUKOABfvKBQ1ZeH0DEstOpSSFfWc7P08KfrP5LXS/HD4hU+1+4RlxrnGP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fx1zSfA1R220O/aaGUHyRpJ2+0Ro7oxjPjSBnJ41RiE=;
 b=j6AFwBfPT+/YhImyUXv/AARtQSaCAgMlZocOXNvn0Of5OvjSeclYPkf/N2biatd2dTIEsSJs1k697NRl9VfSBifXiu1JLPKTD3NtT3qk/fSr4iY/W/vGeObIB20v2BwOG2OfQ81bzb72hLn/K3q3wAJf9QVr7VZ+3PulTBuJ98s=
From: Edwin Torok <edvin.torok@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Christian Lindig <christian.lindig@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/6] gnttab: add per-domain controls
Thread-Topic: [PATCH 0/6] gnttab: add per-domain controls
Thread-Index: AQHXq9s0IM3OAQqHo06+ALWIm01YaauoZEqAgAQlp4CAABBIgA==
Date: Mon, 20 Sep 2021 08:24:45 +0000
Message-ID: <BA298B54-07C6-45AE-AFE7-A9BF89C06D01@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <0D7E40CC-EA8F-4CE6-B4C7-A69C403BD4DF@citrix.com>
 <YUg3pc9A5C4GTTeR@MacBook-Air-de-Roger.local>
In-Reply-To: <YUg3pc9A5C4GTTeR@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d443d22e-b013-4891-7a9a-08d97c101ad6
x-ms-traffictypediagnostic: SJ0PR03MB5791:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB5791A7E813E07706749A7DF39BA09@SJ0PR03MB5791.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2IUZ1Jxd1x0c++rG0hqvYTGIP7Dzz8B7s1l/E+uam61k/I5ynqqKS31q4Cw0bo6Qq2U257V0BmVZ+DRcofgASbQUqx4qbmxglE3lJwlz/Qfbebytg7Czh9zSgciP0jkkgJ4av6CGLn4rp/oidopxAnepdFtUNoyGZM3e/a4n/hDJKE4t5cMhaT66dh67f03GdxdbcspGSaFb+OS3OIRcsHzQxsiWoTOW9pVgoEKM75Ixo6pjmw60UhkyFNWmK57Kz3t1HKO8vUYqt8HnswyorigDvjdaalxafb52xUw2MffqiVb5FlOOIYPLTQZJCQlTPMmU3m8tEE6rYj4IfKH9VOntB5P3oZiFM+Wwpbs3aqinO2eyPS1K95E0q1XXJDxzvGZVNCu94s5TYu2P8/A/yUVTFtCt+jeOUxbup9Qyj2Odbl9WNvnViqSxttXiyOjiMOwwA4IxSd1uyU6bVC03cKhu4AMHh1++iUsgXRFcC52trsAt+aJI2YE1fntyT7GOK6K3ifEWP0stDGpqTSIQ6l+USVy+Wqzp2nfOHoHmmSa3HTii5H7s3UCOjrrkwm3cO+yMs0GLbSqlnINGYZ2fAt9V0WH6XRKkh3KiNumiMrLdSd3uwB5X8CBrRBaL5/16HBD2/gFkCydBofaR2OjyYrRa/Hwpj80QhibWrPA9VsMvWy3fwB6pRkqk1BALk07fCMmE3eR3lO8vZbhBpSf/6WzabnYaQRxNxlv/wdAVJ0elIyV2d9W1ckkaD4TICBNVJSZ9ZI4DmZO+5p5vZoQiY/4IHiUNaB1hvtGEieFNhshmTFHWGSnSnNVPc1lARHPY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(38070700005)(4326008)(6862004)(122000001)(91956017)(2616005)(36756003)(76116006)(6636002)(5660300002)(6512007)(66446008)(316002)(33656002)(71200400001)(66556008)(8936002)(186003)(54906003)(38100700002)(37006003)(66476007)(6506007)(966005)(26005)(8676002)(478600001)(53546011)(86362001)(2906002)(6486002)(83380400001)(66946007)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bnP2gKlUQiSDhxbSrriJiNthMqKMBJZuhs/Ic83OAe0sLS2maNve3KyTlVoi?=
 =?us-ascii?Q?rgzkO4DXb9xcOyI8ugT5N7nc6hIg9EbZEfnLQt3m5PXQWuCPgi4IA9ApjqaZ?=
 =?us-ascii?Q?saVPcuGp9bor2ubIRlXLE3xSElww6dTw6te4ORdOMbEy6V64SbKc5+8p0fX4?=
 =?us-ascii?Q?fvchNmOIKRA0ob+gUqCDQS0lwYIs/pTGNtSV/hOlffM5OuY1L77Z1tJWM83U?=
 =?us-ascii?Q?C40S7Q6Uvgp/2hSP8MMfTcHXcSGcSxc7/rFX8WlmKM7bqRviOaZcbw6UwILc?=
 =?us-ascii?Q?s8Yh2sEzhPL7CNZBeLbALqGAUSG/RgGDMkzxcFyb/7TezFPGx8Fw39QAHP4z?=
 =?us-ascii?Q?9ppYUSq8iC2Q+9btN2lbnksB/YQqlI/2FnHrWDMPGNV9Cr4odniuUT+OMu3c?=
 =?us-ascii?Q?Jgl6Cq0xJYaGV/99UAtfXomQE/s6XLZb24zNPakhzYyZ7pDtlsRnwIfuodIp?=
 =?us-ascii?Q?RAoEjpqxWYeB1zLIc8sx7ciwnqt8g8+BoIWp2xDaBdltJMfMdCdy++qL/mU0?=
 =?us-ascii?Q?EliAvwcTT5S5jUzbQT54ISQ88hNzVZhQOr2v0RmX4jX9wgLCYmsVYRNlBX3t?=
 =?us-ascii?Q?OW1+Df5aQcNvz2WoX6ZXPQ0YRTd3EDd0pxNDBTw8vAO9Vc1BJnVtB9FdPJ/y?=
 =?us-ascii?Q?kOpjSh4Ma/MrN4zIF6eq6iPbqY/MU/Im0OgZBJLaUZeimp8MwDv3y2m4XCIz?=
 =?us-ascii?Q?QwjDG/FFAlgU+od5QfHsYIp34RaX/TtF+ATy9xzOdOS8OtS4Dx3l+zvoQtXw?=
 =?us-ascii?Q?9idViiu/YQJUp/RRo6IqtFiCzBSy/uk0nZ0XzS1JSDKCsS8P1LpqBzaDEXS3?=
 =?us-ascii?Q?8hYLgII0is2Q2lfMNuhYn3JqN3GI1hfYR5OQ0YyM1kZdScEKm/iMXeLMv0gR?=
 =?us-ascii?Q?rsbdyG+Jhv/WSURCXjzCmjkXWgvykeL0MekCGkRjXZMNdeIDzWYzXK+6ma8E?=
 =?us-ascii?Q?94zvpEUVAwE/FzFaKVw/JAp+An77asywAH1LwzVk8FoWyzZQUsdpqUT+qR8F?=
 =?us-ascii?Q?RvlBvlmnuS9oFJD8KKP/KcHcuLtHuHOtLTfbyErwgS/xXX3OMQntn57d8oE0?=
 =?us-ascii?Q?PaovuSd+bO9DcSA8x9swXoWMq9Hifaw5RuIjEorNgNRmgQuR25tm03gI0Z9Y?=
 =?us-ascii?Q?v1kam1DFzwE05rRgq2w3OMMWAdSEy5EihRdrpyX+Ap+CgTx7PRGgoisP4Z/I?=
 =?us-ascii?Q?4UL3ULNqyneE9/Jp5s/ZtbvVIhEw8+LLU2MkafoCjhYUt/eFKSRBYgxV7g1W?=
 =?us-ascii?Q?NlURCKPPA6YJItoKwvEtIV4UremlpBK/lfE7DD1BH3hi+8kw6XH2YOWYnHcw?=
 =?us-ascii?Q?4QktV359p6GynK7obX3FHr51?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D0E0A553EBDB3F409B551E57A9A9D767@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d443d22e-b013-4891-7a9a-08d97c101ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 08:24:45.9279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EbS2D4tku1afMP2vLSOuOSuC1O+8uBIlDc+GukccHavPJ0LG4uNJ1u07uCPJetIJR9/X6oolxTFagm5GCky0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5791
X-OriginatorOrg: citrix.com



> On 20 Sep 2021, at 08:26, Roger Pau Monne <roger.pau@citrix.com> wrote:
>=20
> On Fri, Sep 17, 2021 at 06:06:42PM +0200, Christian Lindig wrote:
>>=20
>>=20
>>> On 17 Sep 2021, at 16:46, Roger Pau Monne <roger.pau@citrix.com> wrote:
>>>=20
>>> Hello,
>>>=20
>>> The first two patches of this series allows setting the preisoutly host
>>> wide command line `gnttab` option on a per domain basis. That means
>>> selecting the max allowed grant table version and whether transitive
>>> grants are allowed.
>>>=20
>>> The last 4 patches attempt to implement support for creating guests
>>> without grant table support at all. This requires some changes to
>>> xenstore in order to map shared ring using foreign memory instead of
>>> grant table.
>>>=20
>>> Note that patch 5 will break the save format for xenstore records, and
>>> should not be applied.
>>=20
>> Has this relevance for the format used by oxenstored?
>=20
> I'm no expert on oxenstored, but I think it has always mapped the
> shared ring as foreign memory, and hence no changes are needed there.
> AFAICT it also stores the mfn on the save format, so I think this is
> all fine.
>=20
> Should have mentioned it on the cover letter.
> =20


There is a patch series from last year to make oxenstored use gnttab instea=
d of map_foreign_range.
https://patchwork.kernel.org/project/xen-devel/cover/cover.1598548832.git.e=
dvin.torok@citrix.com/
This got lost/forgotten amid all the oxenstored XSA work.

Later on I discovered and fixed some bugs in it, and is part of this refres=
hed patch series (part of which got committed, part of which didn't):
https://patchwork.kernel.org/project/xen-devel/list/?series=3D480623
https://github.com/edwintorok/xen/pull/2

I think the current status is:
* there was an objection that the commit vendoring the external dependencie=
s for the unit tests was too big, and should be replaced by just an opam an=
d lockfile telling 'opam' or 'opam monorepo' where to download it from
* I've discovered some bugs while testing this code together with other cod=
e, and need to retest with just this code alone to check that the bug was n=
ot in this code


As for the save format, that is part of this patch series too, and we don't=
 store the mfn anymore. Do we need to go back to storing the mfn?

What do I need to change here? The reason to move away from foreign memory =
was that we could avoid relying on xenctrl for that function (and thus havi=
ng one less unstable interface to link to). If we need to conditionally use=
 foreign memory mapping then we're back to using unstable interfaces, unles=
s there is a stable interface equivalent to mapping foreign pages?
I see there is a libs/foreignmemory (it has no OCaml bindings though). If w=
e wrote OCaml bindings would the API/ABI of libs/foreignmemory be stable?
In which case we should probably replace the commit introducing the use of =
gnttab with the one using foreignmemory and always use foreignmemory instea=
d of gnttab libs.

What do you think?

Best regards,
--Edwin




