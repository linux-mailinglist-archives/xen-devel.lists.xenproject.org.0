Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DB573B0E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 18:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366834.597761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBf6x-0000T9-HM; Wed, 13 Jul 2022 16:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366834.597761; Wed, 13 Jul 2022 16:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBf6x-0000Q3-EQ; Wed, 13 Jul 2022 16:21:15 +0000
Received: by outflank-mailman (input) for mailman id 366834;
 Wed, 13 Jul 2022 16:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2pZT=XS=citrix.com=prvs=1869b752b=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1oBf6v-0000Px-Vf
 for Xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 16:21:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd43f94b-02c7-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 18:21:10 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jul 2022 12:21:06 -0400
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by CO1PR03MB5889.namprd03.prod.outlook.com (2603:10b6:303:6c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 16:21:05 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::64d9:22fb:9c9f:dc62]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::64d9:22fb:9c9f:dc62%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 16:21:04 +0000
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
X-Inumbo-ID: cd43f94b-02c7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657729270;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MrR/C61oTWDkMgmnLyHsNYaRFvwyAix+xmQuRcxwXik=;
  b=ajYYe9lLioyT5dwldwVbQNw0WXBFsK8ndKC+8A2lPe6ZdKbvC0Lt4wgN
   fzDCIkBjd0yB3Jw+chqODXObNvdJHnuuqpclkffPX4imLFKwKFTUDnVB6
   iDwNVSiihIx4OrBF0b0ELFAHXsB1TdQBfELf7j5pSwgdO4PGEmZk4gAIX
   o=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 75709168
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8fmR76yEIefQFv/HP7V6t+dAxyrEfRIJ4+MujC+fZmUNrF6WrkUEn
 TMYXm7QO/+Camf2e9BxbIW/9k8AsZSGzddrHQFoqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY32IPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7YfsSgcEF7T1nukMQUJ8GWJyL41HweqSSZS/mZT7I0zuVVLJmq0rJmdpeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacG+OTvYYwMDQY36iiGd7EY
 NECLz5mYxnafBRLPn8cCY4knffujX76G9FdgA3I+vJmujaDpOB3+KnTH9X7eYCIecAPtV6Ij
 HDCrnamBQ5PYbRzzhLAqBpAnNTnhirhUYJUErCn8/dsqFaUw3QOFBAME1yhrpGRukO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM+e8CMU/4QCJj6DSvACQAzFcSiYbMYR/8sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP45eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:MKZI76DQi2Cc1GzlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.92,267,1650945600"; 
   d="scan'208";a="75709168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVZHEIjpeFN3rfcscHpHH0iAn8Pk4LEkL82eQZ/QYDdxtqQ/Klsy6jCQa3KkhHuKPdWduTP/AuWhcOR1AV5OpcrVFdqYWqv5VwlV5bhreK60vO3l1AOPco6WT/47nSHrnoXaeHC4EJUWK6mlKQ0BmEdZLStUj7GSq3+RF0cVvN+qkI00rzhU8Cttu5aZPflnPNCxLULG5CNbc8eMZRlxjPJLLL5G0L8yVYQ6RGNDaGL4Pe5BPO5DafV/tkwSrdlBj7fqv02yocQq1DjABbq7Q3cRLgb3hU0+NlMvorho5+8IbtOjKq2ku+BnH5jK1aqbYPVcjLr8F7rK1D1Za3ULKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b16pnGuYlnyP0bvSoWfyOoThuqtcPtqTtR4TFmJCzX8=;
 b=C9pA/mKMtmVIUtkQLhsNicLzeYdjHYn3j4MbM+MQJXV8JJycMTrM5JNAAiIMxnYxF02I3nidGpnrWkXLp/BTqKZoUGjUze4AIXRDMFB7ggSj51Lqqv/4ngZ8V9Yl914J6VgkTGYxx7Z7nS3zLwgskBb33m3V1BaLy3R88nWCn/UQpn8PwE9kA3wH+AYx94Zp7ybAeGGsLLRzYN4f7em9XFmDfV2IWt2ScjqVbXywCK43Fcgrx7VwIsxMF6Kcru+gnKUBo9ZF3PiIpHUoxXXx1Ay2aysWhfCR1fEWIyeeMc4RJrIQPmcboNMZpmuDh5bZWzqU2HMMGPK3bBGe5a6JfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b16pnGuYlnyP0bvSoWfyOoThuqtcPtqTtR4TFmJCzX8=;
 b=K8UZFnL6IQKirW9xKL+FUe219ZbbuPmAv/n1C14k1Q+otgponlYwqnHAzHV3x0AJglW18ze0QOCn+gC3HfLIhGcmpBJjD2XSKMmkJ+CtxKOKc3jblvae2XCKoTcJDXxtQrebohePfRbaPuhtO+cSvHQsjWwhLNOpGVCsmG64Lx4=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Sarah Newman <sarah.newman@computer.org>, "Xen-devel@lists.xenproject.org"
	<Xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] livepatch: create-diff-object: Check that the section has
 a secsym
Thread-Topic: [PATCH] livepatch: create-diff-object: Check that the section
 has a secsym
Thread-Index: AQHYkN7aqV56xqXY6kKAbBDxTuBuP618hun8
Date: Wed, 13 Jul 2022 16:21:04 +0000
Message-ID:
 <PH0PR03MB638214E12D08875B54928642F0899@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220706021817.20437-1-sarah.newman@computer.org>
In-Reply-To: <20220706021817.20437-1-sarah.newman@computer.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 331827fe-d0f7-4d3e-1130-08da64ebaf4c
x-ms-traffictypediagnostic: CO1PR03MB5889:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hZavrUWvMfwSxuKBGx+t7FIaoUg6cm4ldqSG/djeRnDsThE/7P3DyU9aG3rtWciWI3r9tSjEw7ptRzh2J6vRWIZwsHjD4Epkff8merBuunQ6K9a4QApS5V2somQ6j4M4DnA25XMednNioSV79Q7UV4O8iIJ8GF83KU42qvK7f7BkmwhRBx2Jf6YD1J6Nn++sxa32EBW9jxMk1Dq8QspjeEWwKfzASBZDbsJNm7MYrIEhee9VDX7tV6k3P0uk+hZOynzNwjRsUWso3Xa6FRJsZkzE9PlPpnW9vmHn3P6KjS2cp9z8oJlpv0X4Wu3WQBFq75Piw8YS3uYvEpGhbwb62AlfvSaV1GWgNdc4/0sgd9wIPMGYzFFzcSJt9kQuTiaV2FRnD+uISjelBhm0hImPCuYaW+cRCvLChWD6g6QPahwhL9H2gV7Wn2oER2uwA/GrsaWaygz7vUBLGLQRQWq2DtLrhabpP2Zq7Z1gGsagRN4NiyzeLZwUW0q8ZDFfTDF3OsnFFXyV8ymrTiZMrri/3EfzbWrBdkVAx3y/njNw/3O8pfuX8GADKm+JKlXP9YsHihoRhq0aD0gbRLf6t0WEvFR+7ABwZ1a/mOVy1ZBv5KfSH3bwAH5fiKiVyIGPKf22GIweABkCCHyk/v+HdGjHJPPuYyCB47LOiAEe55kjJmpBriQ8W1vmaMkv6N33g4zGKnlYrGo5HU/zlkuzmFIjcOdjY5kd0CHmE9FnAm8cKi6esR85gzYn3tP6cgX+o5Wnio42Lh0I8N2Sm7g64ZwwaFkfj64mKYXWyXi4b9R9OwJ9a6xgwJ2oNH4JEWojNZj2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(33656002)(44832011)(55016003)(4744005)(110136005)(91956017)(478600001)(2906002)(86362001)(71200400001)(82960400001)(66556008)(66446008)(64756008)(66946007)(26005)(66476007)(122000001)(53546011)(76116006)(8676002)(6506007)(7696005)(316002)(38100700002)(5660300002)(38070700005)(52536014)(41300700001)(186003)(9686003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d1OILmsw4nmT5YP6bTgaifGK2KNHNgX8jpsTDfQ3T58qqZPMayhq/bQR3C?=
 =?iso-8859-1?Q?yjm3XdfHf+JzA5VOFzUgAsJQdv3CE+XwnUXe5uzod4sBNWIAGfXoIZ1qfu?=
 =?iso-8859-1?Q?l8+Uu9r9HKQJJHZ109S9wj+GJvriSfa4ffQzsZ0WtEfWcEvWoXuYoVsMvT?=
 =?iso-8859-1?Q?f6Csy32Drbgj4yDn8hg0foSQgaoHnU9Lrsvy++/C/uy9EgVJQC75Lg24BV?=
 =?iso-8859-1?Q?+o0lqB7ercovctJjRfSC2kvcBfmYcPzLfrNoyUXVRSBUOiB4Re+MkHbEwi?=
 =?iso-8859-1?Q?WzRyzOiq9OP/KrjrpVx5+oiKYRZgr5pT5rkl74taxqoctaTJKKXxgXcTO/?=
 =?iso-8859-1?Q?7KVoUfDjOiWJKOFJWc+leLMUfv2SAjifa/SOan2NWUEbUqwk5mET1mlwbU?=
 =?iso-8859-1?Q?9w8Cl/NEUpumxKBCyyOvcEkR4bvccTvaR4v5b5mBKzXCScOakpFE0Yo4IQ?=
 =?iso-8859-1?Q?z4NCbqHLSHTI28wX7PbeLHWdKWFUdVZLK0444wacTxxBcClAjjrlTeTOeZ?=
 =?iso-8859-1?Q?5b2qH6r3nzJ0unCIBuc+22u5PjpKa/BUZkU7oKwDxb1gIk8vh8gFGsx4Ec?=
 =?iso-8859-1?Q?MAei8CnQGDFcNMX+NZjK7MmRSCSo6a15x0/rxn2FVKZoNh8NfBcJDgBGrl?=
 =?iso-8859-1?Q?d7S0z39/mMad8kdTsKbvbsA/A4e1Y2seBkteOK7Kz1CeVyuZoYGjfwUIQy?=
 =?iso-8859-1?Q?oN4PgGAdoSxWVstnbt/mP5PURFnMbjB41aSaD6Z1RgoDdY4+qjKSekOwuu?=
 =?iso-8859-1?Q?1cSloeB11YXwTMtaV8I2D8CQSPfJ/kqZd9WVj/shqMo0abm4lu6IMDtW1f?=
 =?iso-8859-1?Q?h3aPU+qiY/vM+oj7Eejr+z19RWJTYTP9xHIKnCN2MOhCVfB+s1kRsh5UPg?=
 =?iso-8859-1?Q?2zO4o0+RmZy+wV6lY1Wscf59o8lo9HhMMx9i8BvQbEUK0Jkwf+/RQ6FlQr?=
 =?iso-8859-1?Q?TX4XQtH5tFFsUvOtEiGXUVy65JCVMZvxegGFp5mOfVUNV9VvAioGCKK+wL?=
 =?iso-8859-1?Q?Vew/l2EBkbVRGxaPWB6gbfBmLpZh7BC2tm3s9jNm/Wbkh5j9h/EDmDAgwK?=
 =?iso-8859-1?Q?ziS7DdPYnNGXdJLWopbw7HYCs/eMQTh11AtBMzViFUsyHvCJ/Jf/6j7VA+?=
 =?iso-8859-1?Q?txT33i6XmI9GYx3oS87WW9k3lKMadhS+D7r6jOro3SfUJJ7tj4z/k+RFx8?=
 =?iso-8859-1?Q?aPYWz8nHSuPZKUzZomqyzv1nEX48Exe6kbJuSjCf/Oxn187iPoFvBsoHTz?=
 =?iso-8859-1?Q?hhfHO4UQq0BXo7HEyE91615Y4lCquqrssXd233Nsikk4eVodA4Qc7Fe/qJ?=
 =?iso-8859-1?Q?IeuVKyIMMaHv5CAQbtIXtByg6YPpxB0GcNOjISyKWrZxCTlSE9fNMSGGv6?=
 =?iso-8859-1?Q?9WDnsPQQ+cwdKfPH0qUgGx2uZ1LGvi0Xyx0ANgAyc543btg4WpKGd5ELMc?=
 =?iso-8859-1?Q?crxsiSwmFvtWQnizk3oIEUecxngQRdbaj+CIT6oxvRULPPoJizgBQd4P10?=
 =?iso-8859-1?Q?00iC797S8EbJOqLUZ19PRVKMsXAtfiOxABmqgl7FNLf4ajk5N7ptzndY08?=
 =?iso-8859-1?Q?Ott4vQoyB4FdjuHT5x9pWBLrrthk1D2r8LqvYW34+a7/329tdiQVJitSDD?=
 =?iso-8859-1?Q?MJEKewKAHpxtJwxDVaa31XWfN1LLnwMKDz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331827fe-d0f7-4d3e-1130-08da64ebaf4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 16:21:04.6811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: npIOpZpouy23Yb1T/F8RY/UYWTlwLU8W3e8dKDLiCwRpphK0B8LWxwDlhqEtmdFt4hGcLpsXRE/vdovDmNaTFzVQ9tJJSoVyb1Bb6OCY5Rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5889

> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Sar=
ah Newman <sarah.newman@computer.org>=0A=
> Sent: Wednesday, July 6, 2022 3:18 AM=0A=
> To: Xen-devel@lists.xenproject.org <Xen-devel@lists.xenproject.org>=0A=
> Cc: Sarah Newman <sarah.newman@computer.org>=0A=
> Subject: [PATCH] livepatch: create-diff-object: Check that the section ha=
s a secsym =0A=
>  =0A=
> A STT_SECTION symbol is not needed if if it is not used as a relocation=
=0A=
> target. Therefore, a section, in this case a debug section, may not have=
=0A=
> a secsym associated with it.=0A=
> =0A=
> This is a livepatch backport of kpatch upstream commit [1]:=0A=
> create-diff-object: Check that the section has a secsym ba3defa=0A=
> =0A=
> Signed-off-by: Sarah Newman <sarah.newman@computer.org>=0A=
> =0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

