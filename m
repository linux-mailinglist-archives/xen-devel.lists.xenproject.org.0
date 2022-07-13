Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808CA572A3C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 02:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366143.596803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBQEw-00043o-VJ; Wed, 13 Jul 2022 00:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366143.596803; Wed, 13 Jul 2022 00:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBQEw-00041x-Rk; Wed, 13 Jul 2022 00:28:30 +0000
Received: by outflank-mailman (input) for mailman id 366143;
 Wed, 13 Jul 2022 00:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AHIX=XS=citrix.com=prvs=186aa51bc=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oBQEv-00041m-5N
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 00:28:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4824a98-0242-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 02:28:26 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 20:27:57 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by PH0PR03MB6333.namprd03.prod.outlook.com (2603:10b6:510:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 00:27:54 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d%3]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 00:27:53 +0000
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
X-Inumbo-ID: b4824a98-0242-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657672106;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=uAyNUMVHftUc+d7/0/6tUiwuKAiLPbScm4HjQHcTlLQ=;
  b=JVwEZiYtPjXz1geb1u9pjh/x79oAc0wvdH7dnjeYey2wuKwEBelySuD5
   jifuvIvcnF4ApXpWj6ra3eKX83CJM08Qe/1CIxnQjEM3CXVQUrFNPy9hS
   XyiPzLVbJJAkTmyzkj23rKtyke7KNskxgEqjzF7s7DldKgnK2LT4yxtsC
   k=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 78222362
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:f8vAK6N7AvZap7fvrR1KlsFynXyQoLVcMsEvi/8bNLWB5Y4Qp3Zem
 TxOHSzEb+HbITHFz+oGYYTl9B8Hu8eGn9IwQQY4/ng8ECtAopfLVIXCcB+uZ3PJcJCSEEw35
 p0TYNCac58/RCXRqh6gObOw/HQm3q3SSNIQZAK81gVZHGeIHw992UILd5cFv7NVbfiF7yKl6
 Ymt+JCHMQao1jUrOT5PsKvSohgy4qX74WlHswMzOaga4FOGm3crV59OfqvZw1kU42V38kxWY
 86ZkdlVK0uAp09F5uuNy+q9KgtQKlLrFVDmZkB+AsBOuTAf4H1oukoHHKBEMx0P1GzTx4oZJ
 Ohl7vRcdy94ZsUgp8xFO/VoO3kW0XpuoeKvzdCX6KR//mWeG5fe66wG4HIeZOX0zt1fE2BWn
 cH0HRhWBvy1a0Ba95rgIgVkrpxLwMAGp+rzsFk4pd3SJa5OrZwu38wmTDKXtds9rpkmIBrQW
 yYWQSRESEqHPEFwAWsOLopkpuPvtl76LAQN/Tp5pYJvi4TS5CpY9eG0dfDzKpmNT8gTmVuEr
 GXb+Wi/GgsdKNGU1TuC9DSrm/PLmiT4HokVEdVU9NYz2AHVmjNVVU1QDAXqyRW6ohfWt9Z3B
 EET4CUj64Qv8kiiVvH2XgGioW7CtRkZMzZVO7JqslvXkfSOi+qfLnUYX29gNIM2iJYdYTYP6
 U2Jk4LyIxU65dV5TlrYrN94twiaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cRngz
 jbPpS44gKgVhsMj06Sg4UuBkz+qvoLOTAM++kPQRG3N0+9iTIusZojt416L6/9Fdd+dVgPY4
 ilCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWaxC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:XB/wiaMxaUd+9MBcT3v155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Qr4WBkb6LO90dq7MAvhHP9OkMEs1NKZMDUO11HYS72KgbGC/9SCIVy0ygc+79
 YHT0EWMrSZYjZHZK3BkWuF+qMbsb26GdeT9ILjJhlWLT1CWuVF1UNUGwybGkp5SE1tHpwiDq
 eR4cJBun6JZWkXRt7TPAhJY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJ0x6s4+2
 StqX202kzjiYD19vbv7R6T031koqqg9jKFPr3OtiEhEESjtu9vXvUiZ1TNhkFxnAjl0idQrD
 CFmWZbAy000QKaQoj9m2qQ5yDwlDkp8HPs0lmenD/qptH4XiszD45biZteaQax0TtWgDntuJ
 g7ol5xmqAneC8oph6Nk+TgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 MeRf309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0kd
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdM60rL22u3KCZkOlZ+XkcYzveQPcb
 z6ISJlnH93fV7yAsuT25AO+gzRQQyGLETQ9v0=
X-IronPort-AV: E=Sophos;i="5.92,266,1650945600"; 
   d="asc'?scan'208";a="78222362"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgqOowrpsVcC/TnyPCUUh271TjNlsAZGwFhQMe0cDyk0Q3yHtPLZ8dqBZFs3T+n72sysZCbGLeWoLBsJDwQTW3t2beYq0D56OyINW3eFAME5+lbMZKS2MOVKrG8h3cnAn8WQcWtaZ85PPnnJ83N8Gb03JNlwUaf2Imj71lHtEYga3SEgb2KhAaRnpwYk0U+yu8zDbGAb3oWIArZ2usu5d0PVUetqLpBReZBp2r4FDcsju1rvs6vYuF0C494ysaucLbOo+m/jdio2sMcL3e1PQbgx+astKO7knRQcpTVNI336H9w/smM8eL86egtxNAlMUFnPWsjoopvcrMSm3AFFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqtKOWf75Qn5JjiMtGGLMmWQh+CjnlwKwdqu27Yfmu8=;
 b=b97S9mFmTyZN45ehHTTQEHNHbVz1Lq6feTZbPSlE0zdxp7VUX+8hA4zD1AKUTeF9Dm7LTHl0xlv+syfs1cKSlPHOhWWkGwnrouUPxldm3jqpDkU1BUQGa8ONdL7dIf7M2b9laFDZx3MLE6GRauWx9EXyJC7eNOPEvUs6STsf0KlsoLo1zoUxB8lq+u2c87nsMxkpXyH/kGqUkn4BXwWBYM5Xj8cN2kzaJU1aH2VUsTBjx8dlUfZhy5wGwqOn0mFtNxVhiCbdR/F2PKlhRmntOJqhIJ3RzQgt7LjT/8c5/bHIEYkZDI4wj8ZN+rzpf6AvNJXAdfLoSOq1+ie8ZIo7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqtKOWf75Qn5JjiMtGGLMmWQh+CjnlwKwdqu27Yfmu8=;
 b=InWUK4/O7Ysu1ZCBkCNA8lu9sosYJ1YF8fhwMdBBQNyJ//i+0tzEpdiTCSxY4T3GyqDVWLYrkKJg6ayvLN2Zml4nbSOBqlcty2QNEiLTiv3RT1AUwK5XvIh5vVKKdiBlxRcc9OxiQhdyCSVY7E30KA+31cHK8nY118NQiOsbE24=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Subject: Xen Summit Registration is now open!
Thread-Topic: Xen Summit Registration is now open!
Thread-Index: AQHYlk9kgYu4qIX7+ESUDN56VeqUxQ==
Date: Wed, 13 Jul 2022 00:27:53 +0000
Message-ID: <C077616C-9E39-4C12-9E6A-239C745435F6@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d64397c1-13de-470b-f0d2-08da646686e2
x-ms-traffictypediagnostic: PH0PR03MB6333:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GxPVnoGbJXfoTH/5ZbdyeK8u4Dk496nu7u4gXZ0OV/VBAYkZ3XsrsELVcJArM+kMsAtppLzjZ4p2WF8Wzccbp3beHNKzfJEJKo47fyXPJAb6rCP2WhqwIvfLHZih/Mt0I3/4pIs9if3p1c+BlOOFq9MxSKQkLTRMcj9qAfqCHYnWKOHub/NjZkcn9CwheKStGxLvQ83jbmA8cTNOZynS8E9kyG4ulDlFBLcHjonTVVntadyeV/fTZXLDEGkFvE5uWn7p0AFRdGq7yxqzyuaw3nG1sj3YmwRXlED/j5G8VlW5D3G75uSxey8dCDs0Xl1jSvdZecRYxN7x90WQLs52uTkuvY436fYg/3MqQSwGFsEMhjr5mUizxFNnMfII+GJB1dQTJsDGIfvIlbPysqu/sVZmdTowSijZDnEg3bNUlmtZDOtRorZmLVM0UPr3SzoqP74kDFdRcPKSi9xoa+qC517ZBbmlVfIJZOhV6tvzvtcxjHhSWzbmizCUaZkQsXgUrB3HmnrhU/CiDIt0+JLSNQ1UW8iOPgycJtb5hKrITxueVca8O3RGkx/1/Mim+T8aw5TqFZMsN3dWali4wQyUFpotJP551L6EkCfCqOxMR/U9jH9KJwY9MRQwwbWU6La5nNAZKUzsGVS+n0RLve32kBxgR3moMQuxbl5fSrtbSVvTNLVtKhu5SaDfZq6A7G/4CIREb+KOy7/KM9qjXAllBJBhPSYPO2tgJS9QIEXaaXJ4Q0Jm/aevtHVnxcGAgaUVukahyfT59wpQjNzqTxUGpz2cdYYFkaoMZKmngsXxLTJOR1ZyMl3+XfO3S7F34Ol/1Dwz5ODAPbBbxFAzHjU2kdv+dxXnXNg2YCfl2XERZ3xeGERW4aIdX7uf82uKETe8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(91956017)(8676002)(4326008)(5660300002)(450100002)(76116006)(316002)(36756003)(8936002)(64756008)(66476007)(33656002)(66556008)(66446008)(99936003)(2906002)(66946007)(82960400001)(38100700002)(2616005)(41300700001)(38070700005)(86362001)(966005)(186003)(6512007)(4744005)(478600001)(6506007)(6916009)(122000001)(6486002)(26005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XmkNWxSnMoZDOWjwGQKm7TwVaJoOMTgh08B6oBZZgIEM8nV0QMLIRRJeKKTS?=
 =?us-ascii?Q?QckTvxe8/3NLLkxgY3SWpGRLiS7Ti7afV8BWkfFrKEbo2wIbKLOwHHRHbGvY?=
 =?us-ascii?Q?lDR7RY+N/X8G1cQDgGa36MibxXS8LFZr4NahbNIY1R5vk2ijC8Sy48BHXcL9?=
 =?us-ascii?Q?jWg9jGwQkvo8uq2ErrTTZ7Y0RpZrAc4f6pDXMtDbYVo0izvEnIGDuM01hbRj?=
 =?us-ascii?Q?3p3a3UnUqIaXpsXj2K4sfZbuoIVFukTBgoV1x0fYOMNFVXLeMrDn4vbnKiIY?=
 =?us-ascii?Q?FX8ZBTfVbs+f/PKmJn9OVFnj9UT5j4t3DX60nAd2JSdA2bGstzHj+jmXxv/m?=
 =?us-ascii?Q?Rp1WnmUa+50rLviyVe8FDKu8KntnbRsctB+SpmQ0VUwKl4NrJP40rYZlL0RM?=
 =?us-ascii?Q?kGimEf+0UHqFxpTc1uRDcDJn3QSIYW2uPB/m+z7VptniXFsBu+EBBuSDRbuY?=
 =?us-ascii?Q?N9shroSaH2NfZdkOOrlqr7uRLKXPB1/xrX5f7wWmJVV/vozJlIZhwUFzMObu?=
 =?us-ascii?Q?u/tUYw7g0XsobNZMyc8PH6W21BCaV39zDS/1yI2Ss/Dqb+uV/PyDidMLkCRz?=
 =?us-ascii?Q?AiTjGU1f4jvwCepp7/eLBjzO2w4JiCQP/QgCWuF2MADQJnVOmcugwx9b87a6?=
 =?us-ascii?Q?EmGT4mP7NAEh/d0jwvOc13UTvldcNZ/9b9/Q1o7fKcZjc8FkcfD04hOmQ32Q?=
 =?us-ascii?Q?nXJB+Vre61gE7WctFr1axpDtlRh/GYa8CLRfTPqDLOLhKJsyZOITNvXQZWQ9?=
 =?us-ascii?Q?evFx76Q6TGy0IIeLQ3xL//77F9waLNfliFFBcoqclDmoPZ8QZIvd4XS/Tw/F?=
 =?us-ascii?Q?vhnKppB5ucErQRfzJOjOYbzF6/i12w0tJdXv2Vggr5NfAYRonIemK6qIeW0Z?=
 =?us-ascii?Q?IWz3mWSZ/Euea8Qow4ObX8WMZRSQ3L09HXd469zQkIKM5Sjh4EOg/EPugn9z?=
 =?us-ascii?Q?w+qW5yI8O+HpRQTkqx2gBWQpT97Htpw/iQI8Eyk8Xt6yE+cP6qnouF8Eol40?=
 =?us-ascii?Q?MJH3Aq7mY80tf1+cbZpSO5/3JeDTSKhqahqqK6Or//vYYDPJ4DTXzq3joqef?=
 =?us-ascii?Q?wTgq8S3mrqR+OLGL4g9VPRT7b7OlydI5Qirakz+zGg3RobUMfzuD8SLAPOes?=
 =?us-ascii?Q?XMJQ2GvybooBt9bIoBNuwlIsMZkrzsNzjllVO3vQmdICP7TyDUrTTGnzkUf5?=
 =?us-ascii?Q?KIwIRrKIwoOJZoqMkE0uzN6oJcVCYUASP1x6DHnCCcGaH9fdQalB9tfehC+Z?=
 =?us-ascii?Q?Keo1G8NeFatXfY4YlZWHWnWfA6ZkNk1escW6/jlx6S3R3iPX6DijV7hpsu9q?=
 =?us-ascii?Q?TOiS3iDTKhyahKDse/Z5R44cyDdMVmllJSszDIiJRgomgxVZ2JKHm0Qs6pE4?=
 =?us-ascii?Q?sGN+lQNNMtJGZKBt1qxDyoqP6NEtwQJF1vjrCD8M9VhCXWbODaKhEtX0BEHb?=
 =?us-ascii?Q?lqWb7UV16Go88UbRBMDEI+Dp/1ADYCIa3wTH3ZyZYBJNXDgaSoZyQkg8wYiG?=
 =?us-ascii?Q?/rJQogSxXjBhXaYTpr/me1i+O1eL/EbEl9fFxOAXFpvr5cefxiwjfFfJPTc1?=
 =?us-ascii?Q?3+RzmShJlZf5VrATukuu3iv8R0uMLa7qtJ0tzgkqyjZ5mzIVrOdyv7+tlPrS?=
 =?us-ascii?Q?mA=3D=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_584CEC3B-EA5B-4A8E-B360-A49F6F4EDC17";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64397c1-13de-470b-f0d2-08da646686e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 00:27:53.8339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xpO1rG8HZxyiSRjbtpRBSgkQSPlUyTvD78m72c0vnjkWx6Npa8/OSBsbNZOkA3ascjuH2Lno2MBt6TM/85Rfwss48Xp/lzxbaa39MnN0W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6333

--Apple-Mail=_584CEC3B-EA5B-4A8E-B360-A49F6F4EDC17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Registration is open! Virtual attendance is open to everyone; due to =
space constraints, physical attendance will be priority-based: Those not =
on the "priority list" will be put on a waiting list until 2 September, =
at which point slots will be first-come-first-served.

https://events.linuxfoundation.org/xen-summit/register/

 -George

--Apple-Mail=_584CEC3B-EA5B-4A8E-B360-A49F6F4EDC17
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmLOEYgACgkQshXHp8eE
G+1EewgAoy+rfjK3qw6deFM1bwFa8WxfGrzE6NLrPpVwD8Yx/3kOIUkV1/xzR/NZ
l8oqG/3iKOjs3/Q+BOLvKk6Xsk+BzSn4FnGpOdBztd4pJDT6JTWdwewNlwF1Ouhv
VOeAFlOFkT9IsgJMCuxb6uGL0BlGqgpf3FzkjXD0bz06qagmT0swB9z3um+jtEzL
BYs2FPAP9CWUYbrB2G0AjXM3nRXjw1s2uKiHyr2JSk+pHMfjGjrpg+sHHASxiWNz
jCK4IiWsqzMMGuIBSsYIPEly+/3H/1+oih+ipAsPsyhjtHrTp7LYxHiHrBqOKFLg
mIGL1WyUmHjtJ5fuKe0Fl91QJbN/hQ==
=ZbXM
-----END PGP SIGNATURE-----

--Apple-Mail=_584CEC3B-EA5B-4A8E-B360-A49F6F4EDC17--

