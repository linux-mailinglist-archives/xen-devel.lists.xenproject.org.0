Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBDD54C608
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349896.576090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QES-0002BN-Tf; Wed, 15 Jun 2022 10:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349896.576090; Wed, 15 Jun 2022 10:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QES-00029H-Pv; Wed, 15 Jun 2022 10:26:40 +0000
Received: by outflank-mailman (input) for mailman id 349896;
 Wed, 15 Jun 2022 10:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTDw=WW=citrix.com=prvs=158947eee=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o1QER-0001x2-3B
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:26:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0e63de9-ec95-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:26:36 +0200 (CEST)
Received: from unknown (HELO NAM10-BN7-obe.outbound.protection.outlook.com)
 ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jun 2022 06:26:17 -0400
Received: from CO1PR03MB5665.namprd03.prod.outlook.com (2603:10b6:303:94::6)
 by MN2PR03MB5215.namprd03.prod.outlook.com (2603:10b6:208:1e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 10:25:34 +0000
Received: from CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::d5fb:172:dc55:fbc0]) by CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::d5fb:172:dc55:fbc0%5]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 10:25:34 +0000
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
X-Inumbo-ID: a0e63de9-ec95-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655288796;
  h=from:to:subject:date:message-id:mime-version;
  bh=RzBnfGh14RnQTE823mnMpsOaE5WUtxy4YjmW/nr1x3Q=;
  b=TKR95br2ZyEsy7VIWU6a+dvmXlYG+otIyIbaIVm4KciUK3hb87r7f9ek
   6UD72HsAf4JlADkpnqpccj8sKg7FQy0dC3tpd3xNI9gHsA+OJKREBXmUZ
   Ofm0E0JZZhiv91OYUEbo0h9ot3zn3vvNKuNcpgEiqCcTFR0xB0o9tEfvT
   I=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 73660150
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3B5KVKwWftESjd8WNVF6t+fxxyrEfRIJ4+MujC+fZmQN5Y8a5oE1v
 iFGDjfXfrrIN3ykOIpG3L7Gp0sGuZ/TmtFqSQVvrylkQi0QpZqZXY3GIhz9Yi7Ld8CdFkhtv
 pVDNNKYcJ9oE3WN/Ez1O+TvoCh1jfzQF+b2WYYoVswJqSpMEU/N3jo/y75RbvdUvOWE7yOxV
 fLa+MPWZgWo1mcoajJLu/jdph1lta2u4W5BslEzOq5H4FKPy3VNAJwhfqzgdHGQrqu4vwKZq
 0Qv6Jnjows1Kj90UovNfo7TKxFMGviIVeS3oiI+t5KK23CunQRvlPdiXBYgQR0P0W/RwYktk
 I4lWaGYEm/FAIWdwIzxbDEAe81OFfUuFGjveCXXXWS7liUqQlO0qxlcJBhe0b4wo46bNVpm5
 /0AQA3hWzjY7w6ALBBXfcE37igrBJGD0IryIRiMxxmBZRotacirr6kneba0ddr/7yxDNa+2W
 iYXVdZgRA3rMg8UYQccMc0RpMiNh1rPYyxmuXvA8MLb40CLpOBw+J7EFYONP/asGoBSlEveo
 X/a9WPkBB1cLMaY1TeO7nOrgKnIgD//X4URUra/85aGgnXKnjBVVEJQCgP9+KHo4qK9c4s3x
 0g81Scpt6c/smC2SN30RzWzoWKevw5aUN1VewE/wF7WlPSMulvBboQCZm9nauAhieJxfBhwh
 n/Ro43YJmNpvpTAHBpx8Z/R91teIxM9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiaoS57jrMVitMN3KiT+VHcnynqtpXPVhQy5AjcQiSi9AwRWWK+T9XwtR6HsrAfdMDAFgjpU
 GU4pvVyJdsmVfml/BFhis1WdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:Lz9PcayisTEXdbT+1rLCKrPxleskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBHpTnyAtj4fZq8z+883WB1B9uftWbdyQ+Vxe1ZjLcKoAeQUBEWlNQtsp
 uIGpIWYLKfMbEQt7eY3ODMKadE/DDxytHLuQ6x9RdQZDAvT5slwxZyCw6dHEEzbhJBH4AFGJ
 2V4dcCjya8eFwMB/7LS0UtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8DlyxwgoeaTVS2r0vmF
 K13zARp5/T/M1T+CWsllM73K4m2OcJDeEzR/Bkv/JlZAkETDzYJriJFYfy+Qzd69vfkGrC2O
 O82CvIef4DoU85N1vF3CfFyk3u1i0j5GTlzkLdiXz/odbhTDZ/EMZZg5lFGyGpnHbJLLlHod
 h2Nk+ixu9q5Cn77VDADhnzJmBXv1vxpWBnnf8YjnRZX4dbYLhNrZYH9EcQFJsbBir15I0uDe
 ErVajnlb9rWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRalHYd85A2TYVC+o
 3/Q9JVvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXOljjHLFvAQO+l3c22sRH2AiHQu128HJpou
 W8bLpxjx9NR2v+TcuTwZZM7hfBBG2gQDWF8LAv26RE
X-IronPort-AV: E=Sophos;i="5.91,300,1647316800"; 
   d="asc'?scan'208";a="73660150"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZuJ90QtyplGapBZQGDMfCjhEqljeW5edVBr1jL7DCChNKz3soT0ann/RewVs0A1twrXE0OcXi+SQy7rwf6SrA1RdXfgBo2yGd9SslCb0fYrggT4sUTxu2F5b1BT/jiMXosRj6wAC3Qe5jVLUapoMQOHDecKVbULhpJnFsYyaln3n926lBLHdgaQc2ZkmLzWWh8F50COuybTvAloVwoU33bmhkXLOOg/wVRBroBZpBOuycMCBUrEzIBWRhBzbOvVa6tVSwKB/04kGRUPlFQPIVm/C29wLV+W2I+Tud8p2u6fETpZj2YMykCpZi4EUSlH7tp8WHpjYV8uAeoK5gY2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQt/gcfEXOcYivjEt1Oj1brZqNd40vjplQDf2W7Nrbk=;
 b=BCinqtvDLSt3d9KbwOqtT5xGHTr2jE5CZUyy4KIgppJ8aGea1QAnzEtWkdN6VEBYd+veqRaG61uhYTjh9ojPpWYPrpc7tzYcDGpcMd0fBSj3r72a0zT32eo23gji5TOokvpXJd/GFyYkEU/Am/hROiG+Qm4M4ZKsBWVLhrex1A1AbF5tHcV8yqVEPEjcPh7PNeCs+o/MjxeDwyqHRJq/bazUggPGa1UxgImGZgwFCDbRSpzDZY6fw+jU4HivF9/hQ3CaqUX248vKSKAAKfZWaoMwDvJmwKCi6DTnsgZPi89njw2wgmyfPVY3PdzkvEcABgcYsKbM2A7fLLmEnV5h4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQt/gcfEXOcYivjEt1Oj1brZqNd40vjplQDf2W7Nrbk=;
 b=Skcn9CfPm86skQEH/ws/9kUp3UxyCBoQK9rycVozTT1P/hZa4OK1qCcqEg4rg5wJ0Joe1/YaCl5rwxdWqdLRe7u0stFiN40w9xTilmvc2klQivtcODerq86Pyvdl7lOnAdeiGDJ99Ye5Se8+bKheeq4BADxySiCm4UGcCxrVPmo=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Subject: XenSummit 2022 Call for Papers open
Thread-Topic: XenSummit 2022 Call for Papers open
Thread-Index: AQHYgKI/ZmpAfNYPSkWL/Rc2+ibxAQ==
Date: Wed, 15 Jun 2022 10:25:34 +0000
Message-ID: <DEA6E62E-4135-4315-9F55-7263544FACD9@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08adf12a-59f6-45c2-cca1-08da4eb961e0
x-ms-traffictypediagnostic: MN2PR03MB5215:EE_
x-microsoft-antispam-prvs:
 <MN2PR03MB5215948AD7F9F8A013813EA899AD9@MN2PR03MB5215.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GCjyHbEF2lP4Q5jIfEyfeUXDQPha/WWs1btj/s6+vpImVL6NCdoPok1DNmlWUKHpNXLuZ3GEmDGBU96mYQP4F3CJaY4FuUKpJNDb/fyibZ4xp6GXO7W0SKH4aODu8+CKVDtlEJ+S8HqL2xgHcEtJS526/tARBmchWxy5r+hZZ8x047+8WeXpsyvbxoemkvrx7OUTWiq/65Xr9MlRnFiBylPuy8zqpjxXXtFMYVZXidQl0sFkERqIUjzwldUB5VVwo0GXV2l7qcaXcvQ9AhbeE2rVBNynD6nxHAIkBQxFJXbynJEHD3VSyNTI+buzHypUXLztrPNDSE7bzITeocF5TQ7s/QN8qPr1ez0IbjkNuPyHFjI2jaB8H8Pqu1+l9dpu0CPmv7e7IBQIFPlnUfuGE4M9+LwVDzsVSNtJ3kZIhR8ON7RswbNz/HHuGt7TQq81tTMfMQW36GRcCBkHFzM28TVFR6bABxmlXJzf4GOgEkyiDFDDVJRDGOtjh/EKy2mHgr9HPfJecLj3InTzOfLRjFTjTCj8OKPn/weAC7W36a+OzJou6K3E+VCgsMahs7l+f0U1gB45RvElLFzgA68W0wT2o9YzNoDKcS8iZYu8IlJl52yYqC3Z6paWbeNgkOD6lZqyOMwTE2yCXdY/5lNmb9haKRjZiAU4akYrHtssKEApfBzg1vyGAAgBTrnBtlBCLvO676rZTo90jYrTjAK/e5JS3yKBu0cSThlgo4kiTIdBdhnjm4IciVSuiqwEFgzqTZavYkTl2VTPh1CMTmg7apg/+NIIAZatWfOrjZ3AhY3q/azi5J0241uSLIybecoZxXfbHUWNvMwlrbJuVyoT9iXqu5jW9I4VIPpXuvkVUlE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5665.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(26005)(6512007)(86362001)(122000001)(71200400001)(6506007)(38070700005)(2616005)(99936003)(82960400001)(186003)(33656002)(110136005)(76116006)(36756003)(8936002)(4744005)(8676002)(66476007)(64756008)(66446008)(91956017)(316002)(5660300002)(2906002)(38100700002)(966005)(450100002)(6486002)(508600001)(66946007)(66556008)(83380400001)(225293002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NNr3HllzNegTpWduL6eJ8u8lu7kJ0x9X/RH9bXfsmmSAQzrBWloSbpe31gMf?=
 =?us-ascii?Q?zngY/aChnq0ar4BEx2Vh4E/0HExVLDzQl9goAwLj1nBpiUGMcHuE71oKiWw3?=
 =?us-ascii?Q?AopOTN23VN/1Rj1nFV/MU4b15LCWm51YqCKXXBU8jbqozWIfegqBCmYRjudI?=
 =?us-ascii?Q?TnL7Q0BK710vGl14s+VdVywhnvgwtm/W8UZwTRaKv7Gh7pCKyldGfETQ0bZH?=
 =?us-ascii?Q?u83JJP7JxAS89btJsUXL0Fr8XRAhkfePYTc6IaS/1/EdMeWdJVdgHY2tyBhw?=
 =?us-ascii?Q?b96oPEpOjj2zgBNdr1w86aohDH1OCJPW4yvy7YUE/5cZtBnbKx9mvrfchMXK?=
 =?us-ascii?Q?lwvbR62VtIVgmfAXE7gRHNYGGrB5vUS2adxUz03Vu24+rfVytugUNj//cfZ/?=
 =?us-ascii?Q?hQD8PJF7u70MuySSEKmR6OvEcaEBkwbbBO1oeRElbO9bUU5rxv3hleho4nXo?=
 =?us-ascii?Q?z8urZZ3EZEvA2+H55yCNrZIc60TAD/c3lMcD11v1yGILVTxwJvV+AiGqkcSg?=
 =?us-ascii?Q?y/uP95Vh++AOVR9J6OvuNB5kboLVl8gy2jpLFU+mjrosh0AJpDz8iQF4KBzA?=
 =?us-ascii?Q?LDRLlxcYvNpIy7yzOUDItRumzbx43YFEUvSry5M7yT65IULxi7B1+bmNLSCk?=
 =?us-ascii?Q?7ZXfXxhhhtSars8yrVEQIL14XuYgdy1hYBRT3aliNndpYTsj0xuNAkJreGv+?=
 =?us-ascii?Q?j2hrY9VG5v1nQmJLbN7wIt7AwOqbsY3GVAme21cncAJPlgzvp3K03siiVOZC?=
 =?us-ascii?Q?RaVKl2iQuoR8x2IBGrZzeZpLM7nQ0xDGP0sI1QLbf4+MsoQLxzn8qoS0zI+Q?=
 =?us-ascii?Q?p9kOl9cdrLR1jE7M2som9FoQhYGku0Rx3hGY4HBoUCHcnZiIFhTg1NZ6/Y+B?=
 =?us-ascii?Q?X0VU88RKOmlyGfrGPV2NruYtBO+eHAlR4GxuAb0vlX4nhcG6AfsNOgZxZmkD?=
 =?us-ascii?Q?4Nuv5XcenclNaROHTXOK/b6wBWWPomDil92VP0ja6+ZTRrPe5lNWG1F+zNS9?=
 =?us-ascii?Q?e6vsy7LIMDHWAHvK4QSXZ1OtDtl07nzfJEcOvnOm+l30DzBJ6cHiVUyaCXJs?=
 =?us-ascii?Q?QZadgbeAd/iSp3I8KBPKG9u4ZaechbT73ReFpCITz0XRfD+BydikemePqDrN?=
 =?us-ascii?Q?sB37aoQJMZKX2fQOaOoGWovcuXn2T07pQk7Xiu9nGiAyq/RAno0Hsiw8aslr?=
 =?us-ascii?Q?DGFK5u/XU15Sdm30WnaxrOf+8SUAiNgYBqkFmDwfxQnH9QF1zcNJmS/+TtEt?=
 =?us-ascii?Q?zVjAJEKo0kc+LqupDfH7qJj94rN/e+iCD0P3/pYdLpxICyIW1IVmlaw6A9eN?=
 =?us-ascii?Q?/jIPHPD4v7+8/ubZ2GFZPCC5JTr3QyGvVuvyR/QMoimg2dPcxpBpzcmTijmT?=
 =?us-ascii?Q?T6PIr7MiDJswggumBcqLdxnA3tvuz/R/R8Rz66HxTsIKqXGitwtK1oPYufjy?=
 =?us-ascii?Q?aG1B6nqKG35sXZHHlchC1X42hH51rlrYOftLYWPyh4vX283SXaZFrpLSSEUn?=
 =?us-ascii?Q?JvJ0TRm31xI0qwPeaPj5smdr7mMSPBq3RzMsn9WpDxbehKSvqucUSoMQnpE8?=
 =?us-ascii?Q?rFk3OL063obME6lo5925dG6MjaNpq6de0oJjgrlrpHskR1v7+/bm2UtgHra9?=
 =?us-ascii?Q?j8HOPqGacpAdnJN/55L5dWlLqhJ4PrpAcf3Bl/umw7F/ZJfo7fyGPk+LLXLi?=
 =?us-ascii?Q?F9EUH+wi6fpn2d/OBEQB/l/UGkYZXylIVCfJvAhbo+uQtw0dN38twCtJPsEV?=
 =?us-ascii?Q?T8zDoA2ZxuzBn7cj2+gKFmga9jx8t2o=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6264F2C8-D1F4-4668-8195-CD097291CFEB";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5665.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08adf12a-59f6-45c2-cca1-08da4eb961e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 10:25:34.4228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t91w9syCf3nqxCF1zdj/AQML8XOdszMio52kqzxAV/UySz/L2Ax10QD8LEeydAmWwqewFjidPjoFrto2TaDe5pKpKyq+oD4G20tZJFUiFYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5215

--Apple-Mail=_6264F2C8-D1F4-4668-8195-CD097291CFEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello everyone,

The Xen Project Design and Developer Summit 2022 is officially announced =
in Cambridge, UK, for 19-2 September:

https://events.linuxfoundation.org/xen-summit/

The Call for Papers is open as well; please submit talks here:

https://events.linuxfoundation.org/xen-summit/program/cfp/

The deadline is currently listed as 8 July; I expect to extend this, but =
if you can get your talks in by then it would be great.

Sponsorships are also open:

https://events.linuxfoundation.org/xen-summit/sponsor/

Registrations will open at the end of June.  The summit will be a =
combined virtual / physical summit; due to space limitations, =
registration for physical attendance must be approved, with priority =
going to core developers.

Hope to see you there!

 -George

--Apple-Mail=_6264F2C8-D1F4-4668-8195-CD097291CFEB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKps50ACgkQshXHp8eE
G+3P7wf6Azx2E/NML0nM0q79D4KzAQughZP/DSYL6TEMGVBZ8mIGKjjtig/OzvZA
1lMiOPLVRmF7lQxyWbVde7svMOb0ir6D35lj6AlxC0lTwRufNpB3r0PqMLjUdrFv
bvDxQByXX3YpV6WhvXRBlJxODpiRyqJIfsugKHBgJtKKIgSwpBeu9Bj33CWZAzdC
Kjluc6d6o4Uw96vi5X34lsmugzrHFBc+iRkOD/46mVjWXr9rDCHcOS6VoKZOk7fZ
lZwZFfXFRyhDqvuRsLNU70q3YvARJTuJpY6gCbTt/XCoDfNRid3KM2h472r7eUt6
DngN4gdoPfLDWMLZIkSLBZMO96kKXw==
=bvTw
-----END PGP SIGNATURE-----

--Apple-Mail=_6264F2C8-D1F4-4668-8195-CD097291CFEB--

