Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99470590CF0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385384.621012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPUU-0003J9-GU; Fri, 12 Aug 2022 07:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385384.621012; Fri, 12 Aug 2022 07:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPUU-0003GY-Cg; Fri, 12 Aug 2022 07:53:58 +0000
Received: by outflank-mailman (input) for mailman id 385384;
 Fri, 12 Aug 2022 07:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKa9=YQ=citrix.com=prvs=21604d9cb=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oMPUS-0003GS-O4
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:53:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8374d29-1a13-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 09:53:53 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Aug 2022 03:53:49 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by DM4PR03MB6912.namprd03.prod.outlook.com (2603:10b6:8:47::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.24; Fri, 12 Aug 2022 07:53:47 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409%6]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 07:53:47 +0000
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
X-Inumbo-ID: e8374d29-1a13-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660290833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=X4+wCyRqTpLU/ZPapbf5fB05XSLqF7kLKMGSd6561H8=;
  b=MDGOW9BYGLV2jPuSKdOmDIOkMx9ujx7L0Bh5qZcJGfAC9hd2hHhURgRm
   wY1jSrWpmL0+YuHTmefPgBkyDPdUCbmGtbOIygxi2GVVwJLJjRE8lAknA
   aza+KdikNefLU/MCYI2nPKWbTI19DhBtWIMTUkDSFYDmJg/hPH/W3ZpWL
   8=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 77179424
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GegfSaNLxW/t2TPvrR3kl8FynXyQoLVcMsEvi/4bfWQNrUoj1jUHz
 WMZCmGCMqmLZGD1c9kgb9ux8UID7cDTmIVqGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/vZ8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP94c9VLh0GE7YnoONdLXEf3
 PIbLxwSO0Xra+KemNpXS8FKr+F6dozHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr5wCCgKFW0q3rMzUYzy2PT1g1qzLnkNpzRe9qGRMp9lUeEv
 GPWuW/+B3n2MfTAlmPaoy722ocjmwvHVIkdM5SJpsd1nQHN4X5INk0rbHKC9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8+QGCDHIDST1HQNMjvc4yAzct0
 zehktfkAzUprbOUTG6G+6mdhTSoMCMRICkJYipsZQkP7sTnoYozpgnSVdslG6mw5vX5EC/96
 yqHpy8/g/MUl8Fj/6e051fcmBq3u4PECAUy423/XH+h7w5/TJ6oYcqv81ezxe1bMI+TQ12Fv
 X4Fs8uT9uYDCdeKjiPlaPoJNKGk4bCCKjK0qUJuGrEx+jLr/GSsFahc+Cp7JVtpGs8cdCX1f
 VTIvgdM+J5UOmDsZqhyC79dEOwvxKnkUNjgCPbda4MUZoArLVDcuiZzeUSXwmbh1lA2lr0yM
 ouadsDqCmsGDaNgz3y9QOJ1PaIX+x3SDFj7HfjTpylLG5LHDJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:o9n2s6zhMCSlld9Lui1qKrPxgOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SETUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZHN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUezpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZrcI5p4dYyxY/ouW3fRYzWTFcFcsnq5zXQISdSUmRUXeR
 /30lAd1opImjXslyqO0GbQMkHboUoTAjnZuBClaDLY0LLEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77WzADnfzJmNXftrdmwtcrQc/tQ0obWIlUs4ZkaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbNfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2HfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPIcFyZMj8a
 6xJ2+wdVRCD34GJff+rKGjqCq9MVlVdQ6duf129tx+pqD2QqbtPGmKVE0u+vHQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.93,231,1654574400"; 
   d="scan'208,217";a="77179424"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccw9FOrnbwuML8EclNG4CMqeGwhoDgaS3lQSVc41AvrWfZDF1tMVJWysJK4hVqYZnv3+/mC1Ar9erNk56QVolYOYI2EeIdnOx9x0Yt8fedPJa2QZSqM8/m6/INcY9gfUhiWExCc7eT5CrJTg5UHcU4ZFP+3A/sBsybcZLC2zBKLdqtwIWBz7yIKLwyEvhNv/tWz57nqke28Alb7IMBOAaUG+KM9+rw1AieyBexRlCf/pAw+YfTYncinrQgWmF+LPLKCYgOVgZcVlIqczzaKX+qmkyooCnPbNTjj/QfVAfwns94W7KeA/N3ymU1aXlOtnM7JokvncSkzJXirrzY2tVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6U3eLAChzlxu+MYGljrnrnxHQBzoKQql7/JShCq/lE=;
 b=HRqfyRGeiLYZtHtgo5sp+G/UDgot4C3m4rtLwZYdMnur4KqI0thKSv5gX5hZ3T8divfUwLkJ/JXuOLOUPIfCbUtZH6Cz4Y+xkRoC5Itd2kdudxCsRUsGAUi6NnMs5GB9b5hEM0e38F9ENpNXM6dUWBpridPlypCcUKXcAaooFyJ7Mtx+onxewuLOLsnWTWajkNrDrkyP7Qj5P3oO5+xjiT8XS8jb4MDgatFr/duADkeJI/IPv81r2aQedg5UDs/cYm8w2V7H5UNVFPtqGs3Rn8s2XekT2WXcFp74WzmRE+EK+7V9RWXYUcIi9luVihcYeawPp0Y3oz509KF08gvPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6U3eLAChzlxu+MYGljrnrnxHQBzoKQql7/JShCq/lE=;
 b=oXTldCKi23IGHuMzcOVEB7HkJK2gv5Fl3tIkqBxpkHFo0wDbb+p3Be6EHkt8Xl0Wl7BG8tTSf/11ugu9AfZb8Zd34DglxjJqJNaV7P4GdJnu00+on1Ug0X0n87T/8F5WlJJB2Jx28OoFxmDfhvHYumqJ6bg0/r9QI33nB0h8W+M=
From: Christian Lindig <christian.lindig@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger
 Pau Monne <roger.pau@citrix.com>, David Scott <dave@recoil.org>, George
 Dunlap <George.Dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "Tim (Xen.org)" <tim@xen.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v4 00/32] Toolstack build system improvement, toward
 non-recursive makefiles
Thread-Topic: [XEN PATCH v4 00/32] Toolstack build system improvement, toward
 non-recursive makefiles
Thread-Index: AQHYraI+K9klKSLPzkSqNdXb9hkD8K2q5ggA
Date: Fri, 12 Aug 2022 07:53:46 +0000
Message-ID: <110A6400-B02E-4AF6-BC7A-FAFE307FA603@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d373f7e-d8c8-4f27-2c08-08da7c37c95c
x-ms-traffictypediagnostic: DM4PR03MB6912:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kBLQDnUmTsn+pJPzbYatFcDUOKcdDBdpcR98Bec9QziJzvZhaCFhHUtPslK41UscrjzBrE11rV4sjBJ95WOUJDn6qcRDH9O9fDI5I6lnz+TvwUA/NCwAZhqIjZs5dNPBPafpggG/OkUnDTgEoc0BitTjnIhMtp4lxdQ3ZKwxfeujipxO4Nlqj4ihA+F32svJi30uI0RIg5kYmrbpZcQ8qqd9X7qEK2bp8EaRl1v61UzGZxwzZ7LJh2p6wkzmSQZLC0s3QOMyLuMaLxQfS1gjlEdwGKK9TJspm9AiFHFHXyKGXxGjgeeVvaEExaSQmRYsSIHdELl4X0HKsrziY1S/74b1MtQXKCFrQaXos20GEEjIZNUYhKQ3205Hzwx6J+/VaHsHKyeBy6ChgMqXicOtYS+ex1BtUUaBbEd/7BCv8tGVJawLP6tzS2f2iBHnV37D2n1JmmJSUCcHBb/S04W/Lgguy9s2OhIcu5UYGFLighHPgNCtvo2jX1tAENKmwM4MypDwnlMQr38exvxl5uoIpFCDeUWxj9M6xgBJk/TuE94A6FESDAgPaDywr6cfcfQ3ZGFGNSetobUww7CZAMK/87E7FxmBSsZx9JwbyCT1qNo8UwOW8preWyP9vPaW56F3DxDk5WzOC9i/v1iuJ6n2/17kXF7SI0cDwoMx7ZVi55CgN+5KGAaUcKGXCl0rRrSQmR+rhhja7HEWJtlGrlWuj/P+gnTxzFWMfwgTTDkqDCOT8cfYZmaX6n0facds7oNjoxpNuCjaZKdgysNtdslqL+PDw5lRe1DW4aHxdu97vmJlKJQeLdbu8rM+m8bYzD/mA2Vb7frfqTo5HcaNNYVUsE69lTJO9C5jzVn1J8GjmTJA5jL6uXHPpzJCjUrkMy4k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(33656002)(82960400001)(44832011)(2616005)(186003)(26005)(6512007)(166002)(7416002)(6862004)(5660300002)(8936002)(2906002)(36756003)(66556008)(86362001)(316002)(37006003)(54906003)(6636002)(91956017)(6486002)(66446008)(71200400001)(966005)(66946007)(76116006)(6506007)(41300700001)(4326008)(478600001)(8676002)(66476007)(53546011)(64756008)(38070700005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SLHHwMd6aEGXvnwzP9M3aBFNxLydOCzW6cZPQaYvnv0Y3C91/jG4O7f/bcQ2?=
 =?us-ascii?Q?BdSYHs8tzGB8V3c1AyAeTwp2x/PRGZRZlNtrdhgfC9YEusQmD86VuBL71Mdt?=
 =?us-ascii?Q?aSpxXPqDr9bzJkMCK7JZZ07F2X6c9GA+0us6HUMw+5wDy2znLE+bFaMmTHzJ?=
 =?us-ascii?Q?Yzf0ldPE8KHBP0hRcdWw3gvVY2yUHDS+iFehRa8GdoDvRHgOVlnP2CnTs45b?=
 =?us-ascii?Q?aaHTOFqDyloS9fNt/x2/a5U8BMsA/6aI0msLbvkqaCZIvn9OBa1c8l+/ZKjv?=
 =?us-ascii?Q?umjyJsxP/4A6cZCQQhpUkiudNtY8V5INdNhwqB3pS0Dpz9obFww+/z1pQxgO?=
 =?us-ascii?Q?cmjV0FWLpxKt5YkFhrd+rIwIXaJwazdt7/5tbYBXT+F7xdd8QH6kPBwQrnDo?=
 =?us-ascii?Q?9advV1AD9mKSgV4Rev5lEH6earRF+i62mvWZH6iRYiPrGxFn/qaqWwovLyB7?=
 =?us-ascii?Q?l4iXkhY/6IcdYsO9Sqof5OIEwCf/WeN/NmjuDPFomk2X0wO1EvacIcJwp51t?=
 =?us-ascii?Q?MUm6tXXF6Uo06pKuPb5g7PUd3E/M1Gd89gAYLRiL0QHiF2tF5DjnKaMR7IRh?=
 =?us-ascii?Q?X4bl3BpQmMV88C+xvQqoAsUUt0EdYEuCHTcK94+MLWgG5f7JJVAS2abiBZLg?=
 =?us-ascii?Q?9nkXUujhPinBq9WxgW6iUrpBaIn2WVk3fb3DocAyQ0/uxD2UkrDrLH0kQgJV?=
 =?us-ascii?Q?aubzSe173knGdgTzsBqu5oA/gvGYk7o8yqiLSKMfBODJC/gfqlMDuoX9lqz5?=
 =?us-ascii?Q?+YnSjgi/yth1+PF23VsmXwVdsDMYfHaDYYJCZWgCbPrNYZjA75a/4AgzuRsO?=
 =?us-ascii?Q?e7yYYMO5eNHGS6nbuXmE1J7wp640ssoHvAuF47GHZjJKHPoAPU7fTkq2fObb?=
 =?us-ascii?Q?60rjSetQBCq7BT00tEpEOT9DPXj+Ci/JDlAHAxBHS0q+SHtcvYfxMGOoBoPl?=
 =?us-ascii?Q?0IL1V2dXSA4JctmzCBG1gzMYsNcBMrzSQvvknOJGfiaZoT4Tpl3yx0BmLQSJ?=
 =?us-ascii?Q?b5qFWaSrh9DmC01iqSuI36kYswAH1EJRXNYYGxOcnf+rif/Ewye09Ha1/7t1?=
 =?us-ascii?Q?00EC7beYiUH2gVB2v9mNGr2equfLRPdzZM4BVYQEVCM9PQ1omprPA5dp2YXP?=
 =?us-ascii?Q?1C+7nSYEB2FvbELpKU1rXtuOm5jImEV2RGzRr0lnKd3KbUy+S0o+KXZuxPe2?=
 =?us-ascii?Q?mYiwuwqHOwWxCOb7H62cTql10K9dBRVLwkcMzAUGMtI0J9H5FzVhn71moBWU?=
 =?us-ascii?Q?f7JbEnnzaX4SxJArBzXYR3IAT22UJHG6YLPfbZhh+Qu6SaVmIkOl+ZLfvb7r?=
 =?us-ascii?Q?nRKUWirdiOQNtQFTHreUIzHk+hg+RQVAdNMtfPZvy2hQ+3aOjvHZ2RnaDTKx?=
 =?us-ascii?Q?vxx07V+otJ8ECqCKzsk8OmyQh9cVsLSTQzoGCDT+nmkkm9oFGuhQL3dqGoz0?=
 =?us-ascii?Q?o5GWWNbIxXrDEYjdLj91YlafTBzdpXoST9OE1OW2CKPVSK46QuYgWgNkED77?=
 =?us-ascii?Q?jTwScpvdNW4WjLPB/Tc4wr305YXam7IkZ8h4CaQBFAXXTyKDv0X5Ve+wPQN7?=
 =?us-ascii?Q?9d7xwXjDlxcpooFTnQ5KvRa4yR8fYv2XJU4Xyk2E0Tw/n2qeRfN/iBdy0chS?=
 =?us-ascii?Q?XaHyF/4keKOksa0IDVF2/jc=3D?=
Content-Type: multipart/alternative;
	boundary="_000_110A6400B02E4AF6BC7AFAFE307FA603citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d373f7e-d8c8-4f27-2c08-08da7c37c95c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 07:53:46.9183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDw3rQQOVpxbuXad6842kjIrji+Ou47PYy258CqViXBs/2831WhsD1u1jsQKlFfJuEWawcjbeDUQHMmCVy0Jq0yik70W33ptWgAdDzUx0CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6912

--_000_110A6400B02E4AF6BC7AFAFE307FA603citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 11 Aug 2022, at 17:48, Anthony PERARD <anthony.perard@citrix.com<mailto:=
anthony.perard@citrix.com>> wrote:

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolsta=
ck-build-system-v4

Changes in v4:
- several new patches
- some changes to other patches listed in their changelogs
[..]
Anthony PERARD (32):
 tools/debugger/gdbsx: Fix and cleanup makefiles
 tools/firmware/hvmloader: rework Makefile
 tools/fuzz/x86_instruction_emulator: rework makefile
 tools/hotplug: cleanup Makefiles
 tools/libfsimage: Cleanup makefiles
 tools/xenpaging: Rework makefile
 tools/xentop: rework makefile
 tools/xentrace: rework Makefile
 .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
 tools/libs/util: cleanup Makefile
 tools/flask/utils: list build targets in $(TARGETS)
 libs/libs.mk: Rename $(LIB) to $(TARGETS)
 libs/libs.mk: Remove the need for $(PKG_CONFIG_INST)
 libs/libs.mk: Rework target headers.chk dependencies
 tools: Introduce $(xenlibs-rpath,..) to replace $(SHDEPS_lib*)
 tools: Introduce $(xenlibs-ldlibs, ) macro
 tools: Introduce $(xenlibs-ldflags, ) macro
 tools/helper: Cleanup Makefile
 tools/console: Use $(xenlibs-ldlibs,)
 tools: Add -Werror by default to all tools/
 tools: Remove -Werror everywhere else
 tools/hotplug: Generate "hotplugpath.sh" with configure
 libs/light/gentypes.py: allow to generate headers in subdirectory
 git-checkout.sh: handle running git-checkout from a different
   directory
 libs: Avoid exposing -Wl,--version-script to other built library
 libs: Fix auto-generation of version-script for unstable libs
 tools/include: Rework Makefile
 libs/light: Rework acpi table build targets
 libs/light: Rework generation of include/_libxl_*.h
 libs/light: Rework targets prerequisites
 libs/light: Makefile cleanup
 tools/golang/xenlight: Rework gengotypes.py and generation of *.gen.go

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>



--_000_110A6400B02E4AF6BC7AFAFE307FA603citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <01E68851B392DA42A94885D054D49B15@namprd03.prod.outlook.com>
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
<div class=3D"">On 11 Aug 2022, at 17:48, Anthony PERARD &lt;<a href=3D"mai=
lto:anthony.perard@citrix.com" class=3D"">anthony.perard@citrix.com</a>&gt;=
 wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Patch series available in this git branch:<br class=3D"">
<a href=3D"https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git=
" class=3D"">https://xenbits.xen.org/git-http/people/aperard/xen-unstable.g=
it</a> br.toolstack-build-system-v4<br class=3D"">
<br class=3D"">
Changes in v4:<br class=3D"">
- several new patches<br class=3D"">
- some changes to other patches listed in their changelogs<br class=3D"">
[..]<br class=3D"">
Anthony PERARD (32):<br class=3D"">
&nbsp;tools/debugger/gdbsx: Fix and cleanup makefiles<br class=3D"">
&nbsp;tools/firmware/hvmloader: rework Makefile<br class=3D"">
&nbsp;tools/fuzz/x86_instruction_emulator: rework makefile<br class=3D"">
&nbsp;tools/hotplug: cleanup Makefiles<br class=3D"">
&nbsp;tools/libfsimage: Cleanup makefiles<br class=3D"">
&nbsp;tools/xenpaging: Rework makefile<br class=3D"">
&nbsp;tools/xentop: rework makefile<br class=3D"">
&nbsp;tools/xentrace: rework Makefile<br class=3D"">
&nbsp;.gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}<br cla=
ss=3D"">
&nbsp;tools/libs/util: cleanup Makefile<br class=3D"">
&nbsp;tools/flask/utils: list build targets in $(TARGETS)<br class=3D"">
&nbsp;libs/libs.mk: Rename $(LIB) to $(TARGETS)<br class=3D"">
&nbsp;libs/libs.mk: Remove the need for $(PKG_CONFIG_INST)<br class=3D"">
&nbsp;libs/libs.mk: Rework target headers.chk dependencies<br class=3D"">
&nbsp;tools: Introduce $(xenlibs-rpath,..) to replace $(SHDEPS_lib*)<br cla=
ss=3D"">
&nbsp;tools: Introduce $(xenlibs-ldlibs, ) macro<br class=3D"">
&nbsp;tools: Introduce $(xenlibs-ldflags, ) macro<br class=3D"">
&nbsp;tools/helper: Cleanup Makefile<br class=3D"">
&nbsp;tools/console: Use $(xenlibs-ldlibs,)<br class=3D"">
&nbsp;tools: Add -Werror by default to all tools/<br class=3D"">
&nbsp;tools: Remove -Werror everywhere else<br class=3D"">
&nbsp;tools/hotplug: Generate &quot;hotplugpath.sh&quot; with configure<br =
class=3D"">
&nbsp;libs/light/gentypes.py: allow to generate headers in subdirectory<br =
class=3D"">
&nbsp;git-checkout.sh: handle running git-checkout from a different<br clas=
s=3D"">
&nbsp;&nbsp;&nbsp;directory<br class=3D"">
&nbsp;libs: Avoid exposing -Wl,--version-script to other built library<br c=
lass=3D"">
&nbsp;libs: Fix auto-generation of version-script for unstable libs<br clas=
s=3D"">
&nbsp;tools/include: Rework Makefile<br class=3D"">
&nbsp;libs/light: Rework acpi table build targets<br class=3D"">
&nbsp;libs/light: Rework generation of include/_libxl_*.h<br class=3D"">
&nbsp;libs/light: Rework targets prerequisites<br class=3D"">
&nbsp;libs/light: Makefile cleanup<br class=3D"">
&nbsp;tools/golang/xenlight: Rework gengotypes.py and generation of *.gen.g=
o<br class=3D"">
</div>
</div>
</blockquote>
<br class=3D"">
</div>
<div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
<div class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D""><br class=3D"">
</span></div>
</div>
<br class=3D"">
</body>
</html>

--_000_110A6400B02E4AF6BC7AFAFE307FA603citrixcom_--

