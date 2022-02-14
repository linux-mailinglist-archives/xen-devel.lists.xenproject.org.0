Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC24B5502
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272470.467328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdST-00038f-Dw; Mon, 14 Feb 2022 15:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272470.467328; Mon, 14 Feb 2022 15:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdST-00035M-A6; Mon, 14 Feb 2022 15:40:09 +0000
Received: by outflank-mailman (input) for mailman id 272470;
 Mon, 14 Feb 2022 15:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJdSR-00031p-NB
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:40:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60bfc221-8dac-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 16:40:06 +0100 (CET)
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
X-Inumbo-ID: 60bfc221-8dac-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644853205;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=vX6X4mvJ1o3sQayLH7VjW7RyiH3ENeeEMcSgtjrVuoc=;
  b=Cyiack4UqIE0gMDQ2R3HM8f2bA0dxxggqknnBPrPPS0kLv90QZwvE6zv
   KW38gB9imba6B+ygPox43zXWFnH2GDjeMF8gdFo5sfjnaiMMwm1H9YUeV
   qFDqi4X/0hRPKpEK72wIbaeSevSEIltakLJswxlEBf+ldD+J3aAAwEyQ9
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FCRoe1yuHMpiCOrNooWCjs2ymhMkpQN9R/ZG7Eujeze8V1t8C2ZOSmgMedFWqTUc/TeTxln195
 oF9+o2iZPwGJT/PA0mZVIsXyXks+EBu1dLR4MEQ8F7ri3kyPGNiNJAmEAAODHcwZxqPB0FklFs
 4XcXeNl1FnatM6BT+/XBXcJpeo04E9D/RAaxawUEuDc/RUWgUoM5awH54U+8ax4W5kSl1xWDhE
 nvZokQOM+674LXdSwwgDg16OA+w7sEUdMpMAzKo2ydjgLcvAarc4zy22BJvtAekUTc/40O/Dsf
 KJNrEANz7fjKvFQxcNSaT9Zd
X-SBRS: 5.1
X-MesageID: 64066256
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1+EMmKJKa1fbEY8nFE+RlJMlxSXFcZb7ZxGr2PjLsTEM7AuW5UVEl
 zVBCC3DeKqUMyGmS21FGIvn/EgFusCGyoNmSQFo+X88FnhH8pqVCIzGcxqoNXKedJebFhk+4
 59DMNPNJZppH3OBr0j2Oeft8nIi3/jZGuGU5IIoQsxUbVYMpHAJ1UIz8wJAvrNVvDSZP++sk
 Yn++8SGZA78ijArPm9MsP3bokpitfii6W5D5gJvOKkW7QPSz3UbMskSdPq7R5farii4PQIYq
 8LrluzRErbxpk91Yj+dfzKSnnQiGtY+ByDX4pZtc/Xk0kgqShAaiP5hbqJGMBsP0V1lovgqo
 Dlznc3oIesWFvWkdNQ1C3G0xAknYMWqUJeeSZSOmZT7I3/uKhMA8N03ZK0CBqUK+/4fPI173
 adwxAbhzPy0r7neLLqTEoGAjym4RSXhFNt3VnpIlVk1ARu6KHxqrmqjCdJwhV8Nas5y8fn2N
 sUedCJKXBD6cyJLYXQwDb0OmOyVmSyqG9FYgAr9Sasf5mHSyEp60aT3McqTcduPLSlXth/G/
 CScpT2/W0xEcozEodaG2ivEauvnsi78Qo0fUpGl8PpjmHWYx3AJCQ1QXly+yRW8ohDiA4wBc
 RFKksYohbkP1mioRYXCZi+9rkaPuCxMcOENKuJvvWlhzYKLul3EVwDoVAVpd9gOpMIwAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HBiowuihPETv54DbW4yNbyHFnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhHwEy+x3ybmaf/jx9P62CYqOY7VPm8qMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDBoxaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlifapkmChmbKhggBdXTAdollZ
 /+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiLJFudVbQbWN7tjhE9hnOky2
 4wBX/ZmNj0FCLGuCsUp2dJ7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt6E7GJa599z7+Sl
 lnkAxcw4AOm2RXvdFXbAlg+OeiHdcsu8hoG0dkEYA/AN44LOt30ss/ytvIfINEayQCU5aAoH
 qdVI53aWpyiiF3volwgUHU0l6Q/HDyDjgOSJSu1Jj85ep9rXQvS/dH4OADo8UEz4uCf7KPSe
 pWsiVHWR4QtXQNnAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvGUw0FoeTtopMu9IWbj66zsIr0QfB1GVBXHjeH4O/uZzXa5Geq3aRJTP2MIWLGTGrx9aj7P
 bdVwvjwPecphlFPt4YgQb9nwbhnv4nkpqNAzxQiF3LONgz5BrRlK3iA/M9OqqwSmeMJ5VroA
 hqCo4AIN6+INcXpFE8qCDAkNunTh+sJnjTy7OguJBmo7iFA47faA15ZOAOBiXIBIeItYp8l2
 +oopOUf9xe71kgxKt+Dgy1ZqzaMI3gHX/l1v50WGta22A8iy1UEap3AEC7mppqIbowUYEUtJ
 zaVgovEhqhdmRWeIyZiSyCV0LoPn4kKtTBL0EQGdgaAldfyj/Mq2AFcrGYsRQNPwxQbi+9+N
 wCH7aGuyXliK9uwuPV+Yg==
IronPort-HdrOrdr: A9a23:3GdJla4rXsIc71wcngPXwKvXdLJyesId70hD6qkRc3xom6mj/P
 xG88536faZslwssRIb+OxoRpPufZq0z/cc3WB7B9uftWfd1leVEA==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="64066256"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njsaKCBaA6TlEF6afIK0j10tE7TdevS5pmfC2I0h8CKR7QsaDzTZrgWTe+4NmAwaQXIuzhjrF94AQ7LKjUldsF33FKTIXOz0AhkwwK9HCzHJWOtBa/Vw6aq3TtPqhVj1v7U+aqmfFRFb2MQySWpPB2lkOnjcg7dDytdv7QMN+OVEcNGXpuEcNjwlF/V8N1bxesaSVjl4S5ud9EnoiLputZDnGis3FY3GwSVpc8mYqfaSDA6UMKhVMB1HSZ/d+2AfMVytx60Ne1S29qqAcdwm+LiP7UhZbWHCoKUOiCP6p7Bp1t3sUJDhcdyGKgoFCUA/D8L5Yx9zsQR4tHnC41Cw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlMsN2RU9LxbRIxnTeyZFF/hccJNs83z8eUAbO8saDQ=;
 b=DLm4UdoYY1ho2SwIB2x+rYcIG+x0r6YRLZwvCg0oaLAXGnzWraWeVcXv+Kid7+DDrDJ/bFAdTVhzh1jwrcQu8IOpBS4+aG8G2NzfEz7QIr+KkpfoZFci1hgUHsfzb9QnBQG/yVxEybgSIEFRJGdDf2X32aO6NNtQB4zh4oVZYYBsixfnERk2AMouzaAr7DeeR0mfkY+pOOQKKu8XIZgYrzuf+EKO0Ghc1paIXpS0T+xBx3r80yu3VzxtO1md+LQJzC4uliC11V0PNDwIFFZIMhBWPA2QpghwwIqyw5JAT9BxNIfznCdVP+NEc4CwEPO/twU3biYSclJfZbWM2v887Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlMsN2RU9LxbRIxnTeyZFF/hccJNs83z8eUAbO8saDQ=;
 b=wVuDoMVrzZV+eghAl5qOdnQxoG6YmhG9/xj5XTClnoSwaap4VEGQQJDM3n46T42+E8HTK89MhjrfmpI8n7VHqNeSpqF96bHBKlJXNjFC7zVsHXKtPIxC2/wuIDRMGBanMwnyynKx/AQk/5T8iC708tVFio0PLtdSUkcnC7s0IKA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 15/16] x86/P2M: p2m.c is HVM-only
Thread-Topic: [PATCH 15/16] x86/P2M: p2m.c is HVM-only
Thread-Index: AQHXcbjzd5/toOQYoUyjtEewKjWYIKyUjsqA
Date: Mon, 14 Feb 2022 15:39:58 +0000
Message-ID: <05E1C46A-5652-429A-AF95-7F6AB65A280E@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <7f868820-20ac-4850-aec7-35bc843cab6e@suse.com>
In-Reply-To: <7f868820-20ac-4850-aec7-35bc843cab6e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbe87981-9da5-46d4-5a54-08d9efd041f4
x-ms-traffictypediagnostic: SJ0PR03MB5792:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB57922B9970EE2854AC549FBF99339@SJ0PR03MB5792.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6kugJNhrHWIMbg2pKg5JI7kURut4944W0RQOQlCwzXuYaKIz3Ro+xSs9wqJbv3m0/N4NFOQCKwhMDOCPGlOD2pZzxonOflMZldQe5+2X2MygEEXNGnkq7fmFf7gj8yR7pckaGCG9QxUkeZNH8h2nFn0+Nso/3uuPvV+kUX6ZT3dlRghSIhdmC1ev+Kure3vtuJ3+Uc0Q64ArKQKEyabFGxw/I8TYY8tAe9oIL0MjoEl7Yy8GAMDH5kcNgAmLkT3rC43Mvj1Gg6ZizT7n/3xrWcMQVFD27n4J5evreWbIPQleLg8zV/Eyb/PDMX7mIeKCelAXBDlw3jOgD9LI1sv3n0qBg9hkwERUgXRqVVsMGVrB1F4sBEG5fZm/sB0FV7pRFpvuu+63Xq5vMyKz/jwPoghjO96oeJ8VnqrwyKW6cXZX3D01zYF0GzPq8TM+irtNUwmamsvBipB7ivtgOwxtNhvqcjk8g1gQE+cIFpmI3Uj/ntJ94fkzklgY/SgXTXwkPOYAydjAus8zwt6RzPkFX9gA6F0kkcYTBJm4iqsl6CT9yR5qU3D46X0jBKkbYNBogk/k9U7499jl09I06vUsHf/0rLhLktE0nzY/8+4vPEVzMKXNhU3DpquzDi0q2D1SV/SSt+vsAMHyiU7/Xv/dXRuHF/ZLsMBEZWjWzwESneSpSLFBglw0TaEFH9l7zwXsFkqwjW1mC5EdK5YR5sjsbvS2AclDRRuIwoMWpYHUGw6FWW15rpteAC2wrABaGyFh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(53546011)(38100700002)(4326008)(91956017)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(8676002)(26005)(186003)(6486002)(6506007)(6512007)(54906003)(71200400001)(316002)(36756003)(6916009)(2616005)(83380400001)(2906002)(38070700005)(4744005)(33656002)(86362001)(8936002)(107886003)(82960400001)(99936003)(5660300002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nfiwsE54V8WaXKHG73JDDlI6G55U6937jJe1THga0x172lA7RFpY2ZXdagpC?=
 =?us-ascii?Q?nGefsn6P5XzYP96kazOZGdz8BAHH19HCVLr6A4KKEQQYkFtZKlFZ/zhzlti/?=
 =?us-ascii?Q?rnhlUkeTByLqvVtVMtmhDh56jVGnPcbtS6WeqOaFBnngDkGoKF+KgifMZo5S?=
 =?us-ascii?Q?IOpuwBRZSKN1Zs+x4Hq+DHruDcMGXaG5jet3PzeFz0lCUBOmSiLlrissGJgd?=
 =?us-ascii?Q?l1WwfXYg34O+UuEUym7V4Ut61jFe9LhUEhwb1M41XJUSz9d2DdDZzCdNKmrs?=
 =?us-ascii?Q?YrVdqDjsNqgLxi94mvqAKdzkjfi5sTWU40OXaaTULm0TXmGrBDSLMniGmnOa?=
 =?us-ascii?Q?tseMcjIqj6Eau39POpe7wpN0QBfVu9EWXbvIr/Rkc7NxwM04jLMNjVvXtabG?=
 =?us-ascii?Q?okXe4Gb6WdDG1LpsltqkJru5GyKjLRWNWcbaMECqhfiiGK8o+do+oMuIFHye?=
 =?us-ascii?Q?bYhACG2KY8Ru8WcB0BpUg0fuNnULBigY50mnKVZmc+uJyZe8jk8cHWH6Je68?=
 =?us-ascii?Q?TDUG71OAkPu8EDI6/7s7W04SnLDJ/juVz7r4SwcNepzHIrdAVz32pmcTOSBI?=
 =?us-ascii?Q?HXYv24ZaDFMa4x2+x1k7Xpoc0iAVTjWoR1ImIJwNXQaUg8aP7kS/c4aqZZj8?=
 =?us-ascii?Q?OySE4qGzZjV7dqK0tsKuYx31Oqm8uzHLRjETLlf9oT4aElBK1lpvt1kqXEbS?=
 =?us-ascii?Q?/tO+LKYorjrDVzGDFPVOm78Z5cRRK0RzOcZbjzyRQpDSMaUf8f7FZ+s9/k8Q?=
 =?us-ascii?Q?zA16gXgs7D6IbE7g6OCzsS091Krrul/5EAx/nxXC7QkVcYaGZdCqAqYgCkJc?=
 =?us-ascii?Q?HeZkLD6uAsduvX2tQfdg2BUWXHE0PiIEVuVyph9E9dpvlagpl3jN5D93ccLB?=
 =?us-ascii?Q?AuNzMh/stSinzc2JXc/z2bdQ8pmbNmBdIQj6xmekL+09SXAfMNlN7HNUhtGl?=
 =?us-ascii?Q?hEjvyUs6RLqqFO1CXYeDFLvxNqa88t6zV9q0B0fwk93TdrItA8yVp283NMIG?=
 =?us-ascii?Q?5jMSUsGZyxpOGXxsePKqzGMaXrDX/GbkAcH14/A5af7GSE622FU84OeOdpiv?=
 =?us-ascii?Q?09AEdJZ7Th3BLh/SD98MqaJLso6BmLuQvpI8btQifJJPk8GSdO2eVf9nHeRg?=
 =?us-ascii?Q?kE8Up1wLCCQGHDj3TvXQcPXx76FDwQho8aCuqx0l3CxDybiGq95ahBdYHdVp?=
 =?us-ascii?Q?ZyYkntm5695EpoBt4l1kAwQVpoPK1MVtBv7wsAICqyKpvPl890UBbjvGRFc+?=
 =?us-ascii?Q?n8RAXDJlNmjBQrel2W3XLSZo/mg6jVKk56a6SzXqr5lbbbtNtmKyX0PZ2j3B?=
 =?us-ascii?Q?n0MI/M1/mK6QtIi0NvAVXbghh3ksX/jak4ELA+AmIUL2fKbR55uKifKYCTKw?=
 =?us-ascii?Q?l1WneD8BzFlkOyyDaBKS7WWvUAh90AK/CssDiF0anHMUiw2ZAc/dDWMRvWb9?=
 =?us-ascii?Q?wbD6txsVh30LfFfMhxD+AHzOda2kKW4nP80JumqD89VF05agbRgtgP1h10uG?=
 =?us-ascii?Q?VnsZ7/n4UqYRabE8uiDBuMPxQABstMvLVGiAp+asMsh5456LISMDNteYlwP5?=
 =?us-ascii?Q?r01ayjEJdZR79YJMmB9j/D1Tq99nPjzwG/oNDeddmIjWBF47R31/PbviTi4Q?=
 =?us-ascii?Q?8qyxWQQ8aeDKztKdMijyYRRdjft7vFtDgRzAUB/EZ1KCO8W+2DsCDqmabpEs?=
 =?us-ascii?Q?9im8wV5GHPGk+ocjcBjVsu8flAI=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_73756F51-2A3A-4F02-9DD6-BB7A27600AA9";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe87981-9da5-46d4-5a54-08d9efd041f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:39:58.7311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LesPYfbr/6GsSlbBdmuCxQ7q4DNQ4MfNRvnFQonXst2md1NnSawUwJgw7+W5U4zPzEmqN32myK5VHzhoON8HQY1OxuN1tS7Gl6gn3Rgct+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5792
X-OriginatorOrg: citrix.com

--Apple-Mail=_73756F51-2A3A-4F02-9DD6-BB7A27600AA9
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On Jul 5, 2021, at 5:14 PM, Jan Beulich <JBeulich@suse.com> wrote:
> 
> This only requires moving p2m_percpu_rwlock elsewhere (ultimately I
> think all P2M locking should go away as well when !HVM, but this looks
> to require further code juggling). The two other unguarded functions are
> already unneeded (by virtue of DCE) when !HVM.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_73756F51-2A3A-4F02-9DD6-BB7A27600AA9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKd80ACgkQshXHp8eE
G+3A3wgAmKx3Tf98tj65jzxuW6T4sR6c2B/otgJy/t6z5jC3bpAbF8UUZg+cFr7z
9hTvoqGfTPgWUEuy3aq6aqgm7UGte09IAgAXQVUW+9ysJwI1oszfDq4dJoEGKeUm
GC61cazqOiezcYEAhJm4Gm6q2Zct8mA4UultpLHwqSDC5r8EwFXxBOo91iK5I0on
fV1yZX7xb4Y3WyNcIpCGlxyl/7xtATudbvoD4kYApLjHLknvz8j/rrK75mHNBKQ/
0ieEiu6SVnUEquPLdQb6y5wCAs1TY4TKsk09Z+MxWipTh2Qt5FNyKF/oqD7UptnI
99bdDkN+sr0QrQwLJ4bGhzBDMfwEbg==
=sbkD
-----END PGP SIGNATURE-----

--Apple-Mail=_73756F51-2A3A-4F02-9DD6-BB7A27600AA9--

