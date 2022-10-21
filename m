Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D3B607169
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 09:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427383.676380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmlj-0006Sr-Cp; Fri, 21 Oct 2022 07:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427383.676380; Fri, 21 Oct 2022 07:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmlj-0006Q8-9E; Fri, 21 Oct 2022 07:48:39 +0000
Received: by outflank-mailman (input) for mailman id 427383;
 Fri, 21 Oct 2022 07:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chjt=2W=citrix.com=prvs=286a1e6c2=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1olmlh-0006Q2-P2
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 07:48:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3a3e6ba-5114-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 09:48:35 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 03:48:27 -0400
Received: from BL0PR03MB4161.namprd03.prod.outlook.com (2603:10b6:208:6e::27)
 by SJ0PR03MB6599.namprd03.prod.outlook.com (2603:10b6:a03:388::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 07:48:22 +0000
Received: from BL0PR03MB4161.namprd03.prod.outlook.com
 ([fe80::f917:c565:10a9:e14c]) by BL0PR03MB4161.namprd03.prod.outlook.com
 ([fe80::f917:c565:10a9:e14c%7]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 07:48:21 +0000
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
X-Inumbo-ID: c3a3e6ba-5114-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666338515;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=AHS34pg5GW2Zd+8WAOXQURwcDmuIJ1v3T14Y91kF8xY=;
  b=Of0q4AG18AU3EFL+sz35VZb02lXW6fKRwY6d2c/udgxJrNJ0yS+aFda0
   JS9AuMfgta2v7YjPlgpqxmEYxh3QkLEN0IXerSrRxTgvh35wMJoEYZFth
   3A6jMljATOY9lHaTDCVyud0kYboCG7IOrDzVd+LsQ8TRFPRd1W7TiUXuN
   0=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 82848223
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DGk85aPnzeW5ygbvrR2LlsFynXyQoLVcMsEvi/4bfWQNrUpz1WMEz
 WNNC26OMvncM2rzft9xPdzipxkCvcXXm4VqTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayo4WtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eHcobp8BvEFh13
 9sJczcJUC2pu+Dsz+fuIgVsrpxLwMjDGqo64ysl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF+RTM+vJfD2v7lWSd1JDmMMDUYcCLTMMTmkeeq
 mPJ12/4HgsbJJqUzj/tHneE1rWfwXOhAtl6+LuQzcx7qUC9mUsvIUc5c0H4/MmT0VasVIcKQ
 6AT0m90xUQoz2SLQ9/nTluHqXiLlhcGXpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHvLSLRFqH+7yTrDf0PjIaRVLufgcBRAoBptXm/oc6i0uVSs45SfHtyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:zhkNGazGnEbYEbcdVyKTKrPxmuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SFjUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZDN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUazpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZXcI5p4dY2xY/ouW3bRYzWTFcZcsnq5zXUISdSUmRYXeR
 /30lMd1opImjTslyqO0GbQMkHboUoTAjnZuBOlaDLY0LLEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77W3AD0ihbWAUqqOYmwtUrQcotQ0obaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3mYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZIfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4uKfaWK
 6xJW+wmVRCCH4GU/f+raGj2iq9MFmVTHDq1txU4YR/t/n1WKfrWBfzOmwTrw==
X-IronPort-AV: E=Sophos;i="5.95,200,1661832000"; 
   d="scan'208,217";a="82848223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0K+smPd5irxxcseW+vIstcwcbR4fzdv1M5fr97DM08OckgN/+B1ZCPi5bVbPKcKM0gidlU3lUm3BFAMaN5zQLmTps+bxjsX30WU9OTxfgoy/EH/LYve+QnE/eXWupeU/SPBzLj/SzKOpmGyLOL0zwwJAYm3d/Of1VhXFSQGTXXQO7P9aDo/ZQuFcuc5LGF9xdfzjkAIPIt19mTD5Lhvtcy4eIX9nrkIMV/ah2tg+Kc/sg3m4THTfMnaIu8/ZgvaI92Fmz3qRaQqPeIUK9ddsvL18Jwsj6FmOb+A+7aP7ECyFRSQpUhEIr/2gxSVeNpmOP648bwPHC3LDzeyOqo8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHS34pg5GW2Zd+8WAOXQURwcDmuIJ1v3T14Y91kF8xY=;
 b=aiDDWRQ1LYLM+x81fhtZJEaLpLnhL5BFZOzbI0tIoJJk4b9t83nrcgPRwMoaqw3UG5YIGNtMCf+IcbOWJ9FLVt6EYP1JovA1uZkr76BDnhpKFmeR3z4inx5UYhCVZbVdeYx+T3pq5Smocmnwj0V0pKnxauGe8UdDXRNQdghjKx8ptUqw7v5xzXZQvh3llGddnyqVNmkm6P5YJ8Tcb8A/acImUr5RtLCenKaftcJRNW3qhUeJrEVGHH4T9H6fjKdIuyz0mMFGO/+MakvSeoKTun/3FGsbl2IauM2fVOB9gTr0shQIO0uCBVFzXYTxPDb9tyjAwJdObnYz8tWwkmqFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHS34pg5GW2Zd+8WAOXQURwcDmuIJ1v3T14Y91kF8xY=;
 b=nITmGXOYfPxVdXvoF6wDa5w+SfVNJPBdic/AekZwpNVKd07GPPmm//Y/YmSTs+Z11LzLU6ub4rfbDfQWb4X6ztPl9dLozHVXYmBbjcvS2I1hmL5I5RehAWkADRuN1Ag/kR4tfbXsFkogIzY1H/2IVvIpYrZNZalsf+eMh0d6Kws=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	David Scott <dave@recoil.org>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Topic: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Index: AQHY5HiAcD24hk9GgUi1cSkdE1Fmrq4XOrgAgABGQYCAAPkRgA==
Date: Fri, 21 Oct 2022 07:48:21 +0000
Message-ID: <C4ADF58A-9B82-45BE-9FD3-E9AD55557EE7@citrix.com>
References: <20221020113810.20844-1-andrew.cooper3@citrix.com>
 <AS8PR08MB79914FC06AE997ABF32780E4922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <F65C8E58-EF3D-47D9-A94E-7B70EB93E068@citrix.com>
In-Reply-To: <F65C8E58-EF3D-47D9-A94E-7B70EB93E068@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR03MB4161:EE_|SJ0PR03MB6599:EE_
x-ms-office365-filtering-correlation-id: 1fc45ec3-9b1f-4995-f77b-08dab338a06c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 63pZKuZB3BXd+RI5VS8MIHBvidMLKNP4C7TsXHUJLcxSeEIf1yUSLwL1/qkJpaHXstpgnSrKDu6RcU5bQliozkA3ya6eA3Oo4Kqt3jypg1usNG/90dNVqOOPyalTSu5PzXhwmtqybhh8/oBMlSJL0sO9/0xcC88JwRshn2udrukAeFTg+qXYaWAmhHzmrRM/O6O6Q3eeIj+jq93pjHlU7TDRsvW/WMSwPXRJkMG5Oa3162ZHK9P3m2iq0bzN9qHa1EGBM/i+kfTlZ7lBlYca33pQtsLMqB8oTUcnjzyufIP3/zu81kD2x0mmCJlMbxwZlGO8DvZQgnIBmalcFCwjNVACnmo/mGoWqu6Fd45h6/+vEkB/grF3+bgI3vF+FDJQMLs7+s5R7Zz6gClJkQZd3OhCMe5f5j+8XR5gPfNtRDc1pHgtTQ32/ZUdqFOLXUqLi8Z8TUYSGTIPmORLccTuFHFXfJMdfWfLQ7xzoYnFMOuI8t9cJVLJ3h5sm0yTQr1pVdd0odnGbVhD/YLQm4NLYdr2yLs1kB+YD/JlRrmKxXDOMFszscuVS92YTpfyn5ijgnfT88S+Viu33HK9kwfVNHFpe7TFkxk/AYAst7+8/OZeRaiAbkhCze8lkF8i5MbIaNbfhZjtu0ApEJcRQ+GrBBEP1gA6AB2CBC+yl5BWLJvajtj9Vm05OfyNbumoIudETZKOZn/JqYpv71Fv6m3vyynl1L6ZYXoYeghapN2hF+pUKo51HLAXYdUdXkPfNQbrXaoOiJIQwSMGANOpY/Gp/7QiuO2S2jWnJOW8r7cgOPqI+8dj6qz+tOIYYktT1uWqBv1QUMccTaitWpHyZ+RXaZkYjIFsxfdJsitPr/B3U7I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR03MB4161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199015)(41300700001)(122000001)(6486002)(966005)(38070700005)(38100700002)(478600001)(166002)(82960400001)(71200400001)(8936002)(6512007)(6862004)(76116006)(86362001)(37006003)(66946007)(54906003)(6636002)(83380400001)(36756003)(4744005)(91956017)(107886003)(66556008)(66476007)(66446008)(64756008)(316002)(6506007)(8676002)(53546011)(2906002)(15650500001)(2616005)(4326008)(26005)(186003)(5660300002)(44832011)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5AiTsQedUzZxXL6QyiM0S8VWLbpmrt8m+koTUK9QRkDUPgXch6RgtkMi/IjM?=
 =?us-ascii?Q?paf6eLkYBWE/rxA8LR345FSEY7RF3WM/4DrcC4AbWDzhOk4eeSdnMkrQRMzN?=
 =?us-ascii?Q?w7HYHjRc17JtgVTvMphrbYO0uuBdoTCRlxi4MysgMItDdJT5saKlg8RGBuNq?=
 =?us-ascii?Q?xjmax5KgVhge+354i9cVL9VIDZaDUoJiFy+x4BDfuntCigqJPj++Z0iR7aCt?=
 =?us-ascii?Q?2R9dl6bSJyZZ7gSk6ib78eFYViUR56YFZmL80TDNhyATMAAzrkblfTTV4o1U?=
 =?us-ascii?Q?BUKtW28hLNdoSLRvreXPKYLrUhZx0/M51JMcIyMZyjZlxHiioNGRLED2/8X+?=
 =?us-ascii?Q?/dnjUOCzFPCSf7EL5yOGmtvO3Jk77AuhTO9N5D1huZw5LQriPDSmvJxYP9xT?=
 =?us-ascii?Q?2ZQUU6v8OfINORcl0R6RJkVYdxCcXErIL1xSVenKP5N1oG/SG4c1inQhHFSL?=
 =?us-ascii?Q?z8vUMTRca9xo62wAj7NUUrxHHpcrXcVnbjYQVAM5ncK2S8K4Kz6WApKY2FoP?=
 =?us-ascii?Q?f62Rx3QpabRrGoVBBxgW23kOrKtuvqPI/V5AceBAzblJJ4jzq3F46xwBe3yl?=
 =?us-ascii?Q?Ye+MAoD6QwZ24nHDaUctW4IeRqGZef9QW9VbVx2xWp/Tfd5fnC7daIAO6rzd?=
 =?us-ascii?Q?PSyEr5KlXx1wZayjXwrH2IPhOO9SH0zzAK0ohMzO7sTmEVi90bfSiP/nnyNF?=
 =?us-ascii?Q?qL8Bi4QKdH4jptrnJ0LyLSj/ZD4GRqqmrO0Ka7QE0JqFkP1tX6K/+qq66M7H?=
 =?us-ascii?Q?kEFPmvRf5zGRkxP7W53Lm5MtUnVoqsNHHI8p7WlipmfekmMEfRtAAfVctGtZ?=
 =?us-ascii?Q?yrLrmjYLCUb+ZvhywxlrFpiw47nC6nI8wwmzT+JzUFP2NkbJcKwTmzYkQ1tj?=
 =?us-ascii?Q?eh9mx16tmMQQSxNdhQDPQpDwQ5gSVBJtUpCoWVJt6cHspuJ1pSYbq8eGiCcr?=
 =?us-ascii?Q?QbWyA+ybJQyfrHJ/HGtBVK3Mo7ZnRsMk1Vex4t/gikZRQ/V0pgV/Kf+30WMN?=
 =?us-ascii?Q?7ewRjZ3l3pOjfFK4I86OTRncP2L+XITSolkHzWAl4qxPagUBj3uVwEOJ+IWq?=
 =?us-ascii?Q?xWHWxTzZZ7HcfTv8TgtyOwvp18eoDeTVCCfVMlCkFF3BUpMJ9IhgHLMXtVUq?=
 =?us-ascii?Q?4qZgzfzv/hVzQRXgZLq67BZkmUYXPpfSASkZtykDz6hvR00jEn8CiJnjABbn?=
 =?us-ascii?Q?luyZ8Uc3T0GgiR9RpF8WrT5QM6if+FgSamgG3BRKXO0vDwETbgqmTIrk1b1/?=
 =?us-ascii?Q?yTTo4rzZInWv/F0i3jiMZknXmjDg1vMfZj9sTm7wheRb7t8UIIsIzNnSnuYo?=
 =?us-ascii?Q?hprgNszhuoSi0BgTOyUKHhQbewZhTdeLXtKPU8R2MOUSciLnbZAi+hHW2G+x?=
 =?us-ascii?Q?lqR7l+6SWIgF2VQTRldWTgggsT5ntxbSLOmwSX5znWf25C5d3PgxvSEqv2Ir?=
 =?us-ascii?Q?KFBgZY0lCzrc7t4TrpVXGBb5p5KCb3t8SwH3y0exVjI9pEVer+9jwjRPAw7Z?=
 =?us-ascii?Q?z9IGYdR0t+2zmdBSpLYbu1/d3Xtii10tgh0RVw4ETjJaWBrDVXNOpz964Dcb?=
 =?us-ascii?Q?ii+GlAL2N1IvREvUNK43uyprMwb7wVUNQeqWIV3iIunFWYZMjEkFk1aCzG5b?=
 =?us-ascii?Q?qXjHg9sbq6U6QPuqDAN49nM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_C4ADF58A9B8245BE9FD3E9AD55557EE7citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR03MB4161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc45ec3-9b1f-4995-f77b-08dab338a06c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 07:48:21.7226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMJ7gegSJMI359yJzLMqoGI5VR5FDJbP/Pxhdlzpbt2vVy9QP6va1VTAayAegV9j1knuDKf2xBDfE+F0h7ccR3SDp7x2jGpqtag1BI676gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6599

--_000_C4ADF58A9B8245BE9FD3E9AD55557EE7citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 20 Oct 2022, at 17:56, Edwin Torok <edvin.torok@citrix.com<mailto:edvin.=
torok@citrix.com>> wrote:

Further testing has revealed another bug, patch here:
https://lore.kernel.org/xen-devel/12d90632bf881e96e0b6c256df193f00df187dc1.=
1666284745.git.edvin.torok@citrix.com/T/#u

For convenience the commit is also available from git:
https://github.com/edwintorok/xen/commit/12d90632bf881e96e0b6c256df193f00df=
187dc1

With both of these patches a smoketest 'xenstore-control live-update' with =
a stopped toolstack works now.

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>


--_000_C4ADF58A9B8245BE9FD3E9AD55557EE7citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <93DC32BE136C734F874738A34B746DDC@namprd03.prod.outlook.com>
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
<div class=3D"">On 20 Oct 2022, at 17:56, Edwin Torok &lt;<a href=3D"mailto=
:edvin.torok@citrix.com" class=3D"">edvin.torok@citrix.com</a>&gt; wrote:</=
div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Menl=
o-Regular; font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">Further
 testing has revealed another bug, patch here:</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<a href=3D"https://lore.kernel.org/xen-devel/12d90632bf881e96e0b6c256df193f=
00df187dc1.1666284745.git.edvin.torok@citrix.com/T/#u" style=3D"font-family=
: Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; widows:=
 auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stro=
ke-width: 0px;" class=3D"">https://lore.kernel.org/xen-devel/12d90632bf881e=
96e0b6c256df193f00df187dc1.1666284745.git.edvin.torok@citrix.com/T/#u</a><b=
r style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size=
: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">For
 convenience the commit is also available from git:</span><br style=3D"care=
t-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-st=
yle: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D"">
<a href=3D"https://github.com/edwintorok/xen/commit/12d90632bf881e96e0b6c25=
6df193f00df187dc1" style=3D"font-family: Menlo-Regular; font-size: 11px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; orphans: auto; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-te=
xt-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">https://g=
ithub.com/edwintorok/xen/commit/12d90632bf881e96e0b6c256df193f00df187dc1</a=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-s=
ize: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">With
 both of these patches a smoketest 'xenstore-control live-update' with a st=
opped toolstack works now.</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
</div>
<div class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D""><br class=3D"">
</span></div>
</body>
</html>

--_000_C4ADF58A9B8245BE9FD3E9AD55557EE7citrixcom_--

