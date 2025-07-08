Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C9AFD6A3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037190.1409862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDKZ-0004e0-Bj; Tue, 08 Jul 2025 18:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037190.1409862; Tue, 08 Jul 2025 18:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDKZ-0004bs-8y; Tue, 08 Jul 2025 18:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1037190;
 Tue, 08 Jul 2025 18:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9jj=ZV=boeing.com=matthew.l.weber3@srs-se1.protection.inumbo.net>)
 id 1uZDKX-0004bk-Sv
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:46:14 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ced737a0-5c2b-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:46:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 568Ik5ka019940; Tue, 8 Jul 2025 14:46:06 -0400
Received: from XCH16-04-09.nos.boeing.com (xch16-04-09.nos.boeing.com
 [144.115.66.87])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 568IjtSG019808
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Jul 2025 14:45:55 -0400
Received: from XCH16-07-07.nos.boeing.com (144.115.66.109) by
 XCH16-04-09.nos.boeing.com (144.115.66.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Jul 2025 11:45:54 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-07-07.nos.boeing.com (144.115.66.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Jul 2025 11:45:54 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.145)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 8 Jul
 2025 11:45:33 -0700
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by BN0P110MB2273.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 18:45:33 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519%6]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 18:45:33 +0000
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
X-Inumbo-ID: ced737a0-5c2b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752000366;
	bh=Cp+rlzGbTGczJK9tpO1twArHxZ09wjO3NdOFqdgIado=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=q6foa5cE0nOH3ejfqUzI+IqEAH4ZfOIhL0NdPn0RT7ZniiPoXGOTsvSeLYydMO4eq
	 TQngiOjyZamr9EnLyKHv/ZcGQgEAqKnWQB2fBnv7t0nBiucVDD2nGwMm68RfXdOZ/9
	 mG7LWX0pS6dCG4J22oxbYSsu/b4z0x88NJ4XU4WS8SNGowT6ek6mqe6QFhanDBuoa9
	 kyswKGrHtk5XdC4ewTkOwC5u3u+vGzHrVh0IuNhYwSS8ZLZ7Z+FSQL3o9ZBAsr/jp6
	 QGeURuf5MXsrhiewpeeWEAyf5IKa2HrI3Ar22Vdrsn/83hBJusy8ZWbJ+TaxO0J1Mi
	 AAJNCD6ID4ygg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=mpsZNjNNr40Me05CaGyvjVhC/U55SwGLxSyehedKbFFGKFcS4haw2NMNPoQeg0HrULWwKvOKQMiPBJDt8YaD4NZK42wZfi+AZZKMzA5jagG+2SRrZiVY6cPmAuOCOoB6abdlRBSEQrIcMEHOCyN8/0vW9p0aqdFQS9DiUCuS5UMMSY2plSpaNgbrMb9tQEqU0/4xX7chtHjv+gKH69v5sdU+vzm8jWVPMgXBo9ZFehTYK+idKUEifYxMaffV0sX4V92NT0eXTHJm4MI002g27dixq4l3oEKw3UeVVz3HKrrlXtQKV4gHbIbe4SrgnH91uHHf8CyGclAkeH08aCZSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp+rlzGbTGczJK9tpO1twArHxZ09wjO3NdOFqdgIado=;
 b=WhiZX43/A9/FBDUNsb8xtYjfEgXwdvupPcFKRanGyxxzhwWhEZbcRAA56Zu//rJLbIzp1JP7LdFg7qWcMNW7hCFAIwoPETHF+NjuO2qIHtzimoZ8g0aGRKn/csOPP5cEZACSngMuiC0rABwqxAEwXJBdOhiEdes9cBXu1+GAq1hi/shQDjU4gsrOEL8eKDR1Ix6vaj1Dj2QdzOuQ0pqQpaJ1jqMkAidqizczOMdYjookjuBJMcq+O26raDC8T7iF2I4tVWiFF8D/tWx/gY7Dvc2ebF6FhzU9ahTNTiCtUJ9+OVb6lMB1mMNddPA5pGSicw6qWE6d7AKEkm1Lywp40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp+rlzGbTGczJK9tpO1twArHxZ09wjO3NdOFqdgIado=;
 b=mJV1QRdPpEULAvZ1L2dUTZw2zt4oxJdt4o0q/N0Mu1DadFkgRkLDzNdCRyvO0wTs7BntAAumbnshFXkHGANhYtiA0P9iXYEh+jG2CRCY9mXOcfwk10RcVOl0B0xINaA0F2SSOyqtN1cyG2MfYHUXRdl0S9ajRK3jgBhJ15A6iDM=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: Anthony PERARD <anthony@xenproject.org>,
        "ayan.kumar.halder@amd.com"
	<ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>,
        "Choi, Anderson"
	<Anderson.Choi@boeing.com>,
        "Wood (US), Brian J" <brian.j.wood2@boeing.com>,
        "Kim, Haesun" <haesun.kim@boeing.com>, Jan Beulich <jbeulich@suse.com>,
        "Ahn,
 Sookyung" <sookyung.ahn@boeing.com>
Subject: RE: [EXTERNAL] Re: [RFC PATCH 0/2] Propose an minimal xen-tools
Thread-Topic: [EXTERNAL] Re: [RFC PATCH 0/2] Propose an minimal xen-tools
Thread-Index: AQHbxJ+rU1WRHkBjOE2Z4lnnftilU7PdL4mAgEu0HLA=
Date: Tue, 8 Jul 2025 18:45:32 +0000
Message-ID: <BN0P110MB20671D37FFC1797C9CA3CDC1F34EA@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1747205627.git.sookyung.ahn@boeing.com>
 <aC3iq8YDNzAvr4zH@l14>
In-Reply-To: <aC3iq8YDNzAvr4zH@l14>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: ayan.kumar.halder@amd.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|BN0P110MB2273:EE_
x-ms-office365-filtering-correlation-id: 55aedff1-66c7-4acd-4bbb-08ddbe4f9eae
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D/ocmNpbSqhFDSIc/S77c5oQ54QN1eJB72QmFGJtUxj6gs7zYVuua7mUtqFh?=
 =?us-ascii?Q?RlNdlMbfw+8YGqyfjZg7QWLuKvkzbHlzo/qjzi/pXY4E6vv6OuGgMDgLlfdQ?=
 =?us-ascii?Q?xbliSWfSpoKMSt7oAl9+e39vhDwvf3ibbYtCn0vPsvvGu3pThHXVbOi0vqPc?=
 =?us-ascii?Q?oZkfH9Sy3OtDQblXAISC7Q9r8cFg5G7/gFozvz/FJsksTfnwrOuPgvhLNXbJ?=
 =?us-ascii?Q?K3pzIOm2NRE2bymDkleRMfs9W4loRG4WpxPOdu0YkRmJyJBt3rfouuHcM6d8?=
 =?us-ascii?Q?6Q7m28FCD6QyqqIkuC6RkDZEB1MgWEbM9Xs72c8QmU4s/f+y+B7QAIfzycD0?=
 =?us-ascii?Q?5sDAkM/JrDjz3hryZOx9rHTU7N7ML/lvSoJuftG12KImeEr4ioXvTcP4j6D2?=
 =?us-ascii?Q?djWQfo/aplPYeORjET9e1u6CcebBA9wYuP3o0KX8C1KpFNUsX8qvHqNLz1VZ?=
 =?us-ascii?Q?LsmawrEI3SKb4X7JvnLSM3FLizg+auPNrWYzcSJFNYjnTG/ep6sQv1tWhnBC?=
 =?us-ascii?Q?9NZd71S5lBgz7fVIW7+wcmxJwxQOmAdHmOASRPMEEBx0a30f9TRUmJPbr7HA?=
 =?us-ascii?Q?ptXLUrIl26MhmkTmOlgLwU6eAXGM7b0lUrLCHs3OEOtCC1OngUJ6m1JK2Lku?=
 =?us-ascii?Q?2eZw482iYBxPCvIgqrD5Zn6TXF39QjA3BbUkBye+7PE6JDvOifOEQW+gZt/E?=
 =?us-ascii?Q?YIlAASdTkKDyVciYiQlM6RNZUZHT1xyBojncowirKJqSsrRMkA7DeFNVTblw?=
 =?us-ascii?Q?uLd4kmq4jn1iKXWQ1XyK96aw5WiotGsP92hl6JxisPpOib1v+1iY0WFZVCzb?=
 =?us-ascii?Q?kaFiE3YNX7X9G80bXdsKT/tBuEAmfHr9EUT9bTBf8SoKKzUgBlU9ANaV7zwZ?=
 =?us-ascii?Q?kJ8qb/TbSsQwA25aYh6lsq2/J2K+dm36y16IhXacTo66DOnNKlK16C01aZOH?=
 =?us-ascii?Q?Ry0xple6s68hVw6f0s/oa/3uzhNJVcplhbNNZyuH3a+5B2NlOnZqbuF382gJ?=
 =?us-ascii?Q?wT7fkgc/YFtt6bZxnhRPqQWHzKHe5XmmWyMPpfMguwrYCJvmJyl0CQBKuBS8?=
 =?us-ascii?Q?1Myy8gAmZ2STrp3TiZD5lmkYvBSfVm7Unm8Fu5jY8oi7p8xIbO2LYkXX60UA?=
 =?us-ascii?Q?M4A8DDXQxzBm63TIpEqtXsIpDUqYfV2JkGcCiyD3znCU6+XkIRZOSXqv/yxu?=
 =?us-ascii?Q?JTAONEiX5sm7ipM5ByqhGdxjBRrFFs85sfqWayHIW/1bmbI8g/ubO2dQ1Wh/?=
 =?us-ascii?Q?HlwyBSyb/R7OmGr3e6ZtleLIwN9D4MCxwvBnCKLM76hFIPqMHpxm4MetcQsT?=
 =?us-ascii?Q?hGuYagQ470snFb7b+/xddxkh047AKZbQ5x50eD+kHd++jou0Y+DRuDHKKozA?=
 =?us-ascii?Q?UuxHTAxpwEDh6erKIHIOqKT1iZOtYjf1xJqYAldPg2PelGxAYG8iExr/c6rt?=
 =?us-ascii?Q?C0CSJKR6hu3748YfckX+zPdp+EvHQHwpwZs4HBdT7irBqar0GxoiH/I4qvPJ?=
 =?us-ascii?Q?w4KbV0glYbhiWgY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tm0rc4YkfpeHfiGQQb4pie1Sz33l8XFtc/yQdOjZcOtjLcB4ocWgUfj5ke4W?=
 =?us-ascii?Q?M6Yxe4rfwWODEK9lGpg7kkJVDZ1astJYIqbaPCBaWSz0dkh5+phBDpH5CIuE?=
 =?us-ascii?Q?yDna5XLD4Rkblp1ZX+QQmWmPFloRpk1jjFhMGqEiIlOGjZ7w5izj0ihWFwpc?=
 =?us-ascii?Q?V55hlYcj3/L1bOG2wFXBVAtTDu/27Zj8YKxY2Tc86Jl0W1Nmf+eNGCRAdH2J?=
 =?us-ascii?Q?R19Dyo1j2VWBQdze+7RjBZalHFpS1VUmh5zb69HOT1frQaGlUtl7hDgpN7Pe?=
 =?us-ascii?Q?a2mjstjlVKiFToqLPYwvipMIAa//AN+V7gN3MOAEPnNFPNeXr+ixdrVCh7Ce?=
 =?us-ascii?Q?6akM2ZCmE8bSj2DOj2nJ/sJx3FF0CO/BZaNuecgIzFsSN2HECV8HcpfUrssV?=
 =?us-ascii?Q?4H7CrsvlefqcnGm6GJTJuG1YXpXF65SR4WfkCkXH6NmhH2o5ephAynnMphQ+?=
 =?us-ascii?Q?G944IGIUIWkQ48JIYc0Vk0QNLr/yTpXeWP4qhY4PYBLsDGfyeXfmipkFUjil?=
 =?us-ascii?Q?fk9nxZkHjI8WpN9zdVf8SQARgF8BJgJ4w56Oigp1MlrPDjYzYnNvDkkf4fnw?=
 =?us-ascii?Q?q6lR3EcEZvotJaLIZz+XvIooOaElXBcf5icJ2aTY9GOYrD0lS+XfxBkPA6/h?=
 =?us-ascii?Q?7OjDCK1tJcXIN1RB6kbI3iOglONZ2MojtYpgTRwztPqtJYy8a0Rp7Sei08Ms?=
 =?us-ascii?Q?AT1mNBMzZw+eXmVbMfqVqdB8wuKYYj+FFaAGyex0W9yZNjutUK+H7nh2To3W?=
 =?us-ascii?Q?62nFS1pJzDIRE6ba8G72Hr9PJVM8xdVFNHzZIjYG6HVwqZfIWae11QFjT4cH?=
 =?us-ascii?Q?q6vonuqiJWFBtXjiXXzM6MQIkFS87P04oYWLCinopQKaP5Nk6g1ZT9V+h80y?=
 =?us-ascii?Q?jp/HMlkq9bHTagWDKSSV/y+P0OSiJ+ILjOUaprc/N2SruTkSIiupzgwZWmKk?=
 =?us-ascii?Q?GPjdW9ecbCxJt8C/hGSl08PavTzFounrMIik36ocyQGEEnGE3Z9eJfbPu+BE?=
 =?us-ascii?Q?s43zkheRqYEA3ELJcxRnzJpp/WjsMNmbWhrBQn0XUt5xEpNl27eHjxEk6ZT5?=
 =?us-ascii?Q?d07ljskd1hU0G7t3/qMIjjTDx6AZ3HmroSQmtkMUFpH+zaa7Dlzvw5q5TWRa?=
 =?us-ascii?Q?KGY/YSbv4dz8vF3eZssl1IPkoY+R2LG55X/1uy/U+uzEs1Sbq42YMNFMtASt?=
 =?us-ascii?Q?K2gebzvAVOujv3RSXnozJGyRbDAojY0byuN4nVgsUyTlKj4y/bNrBuz5seRa?=
 =?us-ascii?Q?AGuYIYdJ/t6/SKUGPYlIcL6F6O74KPsEWfE84mC2whs+vaArsk2t14lVtoFg?=
 =?us-ascii?Q?moQBdlTtGbmsuR0QSHUpTcPUP4A3ccxamrmu2xpkPm24XOHdHO/PYS3LL6C8?=
 =?us-ascii?Q?DkelVynkozyd9X+9Gt4waBZngCPDO1lTHhSm2Wkw9wrd5WNe7Ax4Icdps3k4?=
 =?us-ascii?Q?wQIM0hbPBynuhhKCnGgCDcEEu1TXdG8o8eYfA8mPGm36nrWBgaS/ohzNKdTw?=
 =?us-ascii?Q?zt9CTVHZznV3swtPGHxBjJZiPN4hweKTudWa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55aedff1-66c7-4acd-4bbb-08ddbe4f9eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 18:45:32.9810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB2273
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Anthony & Ayan,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Ant=
hony PERARD
> Sent: Wednesday, May 21, 2025 9:27 AM
> To: Ahn, Sookyung <sookyung.ahn@boeing.com>
> Cc: xen-devel@lists.xenproject.org; Weber (US), Matthew L <matthew.l.webe=
r3@boeing.com>; Whitehead (US), Joshua C <joshua.c.whitehead@boeing.com>; C=
hoi, Anderson <Anderson.Choi@boeing.com>; Wood (US), Brian J > <brian.j.woo=
d2@boeing.com>; Kim, Haesun <haesun.kim@boeing.com>
> Subject: [EXTERNAL] Re: [RFC PATCH 0/2] Propose an minimal xen-tools
>

<snip>
=20
> > The proposed implementation includes:
> > - Introducing the `ENABLE_MINIMAL_XEN_TOOLS` configuration flag.
> > - Modifying the build process to selectively include only the necessary=
 components based on the configuration.
> >=20

@ayan.kumar.halder@amd.com  what is automotive planning to do for XL tool s=
tack in a FuSa configuration?


> > This implementation can be effectively applied to the following use cas=
es.=20
> > - Minimal APIs for `dom0less` operation. This involves taking existing =
Xen functions and shrinking them to minimal needed parts. For example, we c=
an use static device tree instead of XenStore.=20
> > - By retaining `libxencall` and minimum part of `libxencrtl`, the Hyper=
call interface can be utilized, enabling support for the Xen ARINC653 Multi=
ple Module Schedules service.=20
> > - Addition of ARINC653 Part1&2 APIs and services (hosted on the domain=
=20
> > OS.)
>
> I don't quite like this approach. What is "minimal"? Whatever definition =
we can come up with isn't going to fit other's expectation of a minimal set=
 of tools. Also, the minimum set of tools needed might be 0, if you only ne=
ed the hypervisor.
>
> Also, the implementation is quite invasive, with `CONFIG_MINIMAL_TOOLS` s=
pread through the build system. It also duplicates configurations, with lik=
e "SUBDIRS-y +=3D libs" been written twice in tools/Makefile.
>

This is good feedback.  The other route we had looked at is establishing a =
new library that's specifically focused on ARINC653.  The Xen existing ARIN=
C653 scheduling support has some out of tree tools we're looking to integra=
te in and we're working to finish implementing the standard.  So maybe the =
basis for this new library is more around ARINC653 and not minimizing the e=
xisting XL tool stack.  (We'd have the XL tools disabled in a dom0less safe=
ty certification configuration.)

> I feel like a better approach would be to have something like:
>     ./configure --no-default --enable-flask --enable-hotplug ...
>
> As for the makefiles, instead of having to invent a config option for eve=
ry single `SUBDIRS-y` we could have a generic
> SUBDIRS-$(subdir-default) where subdir_default is 'y' unless we want to s=
elect a handful of subdirectory.=20
>
> It might not be necessary to have a config option for everything, you cou=
ld deal with some of the stray binary with the tool use to make package, li=
ke RPM where you select which files to packages (as already suggested), and=
 for other tool just `rm` the few files not needed.
>
> Then, there's `libxenctrl`. For this one, it doesn't feel like a good ide=
a to make it selectively smaller. Maybe there's a way to extract the functi=
onality you need into a new lib? We kind of tried in the past to extract pi=
ece of it into lib with a stable interface, like libdevicemodel, libcall. S=
o it might be a better approach to remove the need of libxenctrl in your en=
vironment.

I see, sounds like the possible way forward is for us to make a libxenarinc=
 static library that pulls in only what's needed.  Then look at the ./confi=
gure approach to enabling that library and seeing if we can selectively bui=
ld solely that new library.

Best Regards,
-
Matthew L. Weber
Associate Technical Fellow / LXF ELISA Aerospace WG Chair

