Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA55E7346
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 07:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410219.653651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obawc-00024H-TK; Fri, 23 Sep 2022 05:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410219.653651; Fri, 23 Sep 2022 05:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obawc-00021h-Qh; Fri, 23 Sep 2022 05:09:46 +0000
Received: by outflank-mailman (input) for mailman id 410219;
 Thu, 22 Sep 2022 14:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqP+=ZZ=citrix.com=prvs=257ea8821=pau.safont@srs-se1.protection.inumbo.net>)
 id 1obNAF-0006TE-KD
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 14:26:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 961ac911-3a82-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 16:26:49 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 10:00:44 -0400
Received: from DM6PR03MB4138.namprd03.prod.outlook.com (2603:10b6:5:58::12) by
 CH0PR03MB6129.namprd03.prod.outlook.com (2603:10b6:610:b8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.19; Thu, 22 Sep 2022 14:00:35 +0000
Received: from DM6PR03MB4138.namprd03.prod.outlook.com
 ([fe80::653a:87b4:8096:8bf]) by DM6PR03MB4138.namprd03.prod.outlook.com
 ([fe80::653a:87b4:8096:8bf%7]) with mapi id 15.20.5654.014; Thu, 22 Sep 2022
 14:00:35 +0000
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
X-Inumbo-ID: 961ac911-3a82-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663856812;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=0yB3CWTwn7miff6WKQfg4NNooeTmqdpZdK27Pwgqt2w=;
  b=ONJLUXM1B27xXjluG22Mlz1KTWe4e3uHvI9zUIcQ+Y3HT98EVgMK4BoG
   PQLEiuAheYkG7qnC1hYY6Vxs3E9349Vk5a/Sn0MOpVgLb5DT3jWg5GjZJ
   oia3yY/qUF8kTEde5sKZkV8Bvyxo5bqLWrX67n/AD87RaZG7GjfntX4Me
   M=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 80784651
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b48NU6oGhvKtxlmG/vZ61N0QZs9eBmIzZBIvgKrLsJaIsI4StFCzt
 garIBmHOq2NMGWmLYwkaoWx9UgPscSAn4UySVRp+ShnRCpE8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WlC5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVBqt13LWhgx
 8AiFz8DLUnY3f71+omCH7wEasQLdKEHPas5k1Q5l3T1KKhjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/E4/NouQA/zyQouFTpGMLcZ5qRTMtSmFqwr
 WPa5WXpRBodMbRzzBLVqi382rGSxEsXXqoqHbCaqOdTkWfMz0NQITcLSmr4nPK23xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xHWEBUzNFLsIrrtQ9RTEu2
 lKhgdr1CCcpvqf9YWOU8LHSoTKoIi8TBXELeSIfCwUfi+QPu6k2hxPLC9pmTqi8i4SvHSmqm
 m/Q6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHb5
 yRb8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:sHky/6NbSNpo+8BcT23155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Ar4wBkb6Jq90dq7MAjhHPlOkMQs1NaZLULbUQ6TQL2KgrGSpwEIdxeeygcZ79
 YYT0EcMqy9MbEZt7ec3ODQKb9Jr7e6GeKT9IHjJhxWPGJXgtRbnmJE43GgYy9LrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njBsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqh9jIDPr3NtiEmEESvtu+aXvUlZ1REhkFwnAib0idorD
 ALmWZmAy080QKWQoj/m2qW5+Cp6kdS15al8y7WvZKrm72HeNpxYfAx+b5xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa4HZcjEBS5dL7tUYvJrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFkgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve4PcV
 T6ISFlXEIJCjLT4Je1reN2Gzj2MRSAdCWozN1C7J5kvbC5TKb3MES4OSMTr/c=
X-IronPort-AV: E=Sophos;i="5.93,335,1654574400"; 
   d="scan'208";a="80784651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpCv3qPz44qq1S3cqUdJyHCeAWrTBniTgdCVCfupgpUb4V7kmcc9H4XRh+Rz1RSYJTrpNfIRn0wMmuKI55WLNzxhRsj3zBV98dfvocT8/EljI54r/tVuM9Pn9THpqQpgZukR+XTBDLy5yFNfC0nec+2cHYyN/NwOyxhmE2dMtjTK7/S0acRj2PWsIDZasJ5vLlZ6m5uwaFjzilK7ZoWEp/zCmG5CNESYkUMlXHgLfkuOwq/AbXhs9escdo2DcMNauKFxL2tzCq2s/manKY6n7i15+pt4Ct7ZIO0GKoJak35bDVqwNRAlwAOSeWlApEHHaByV9Fym3XjziB7f3rfEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yB3CWTwn7miff6WKQfg4NNooeTmqdpZdK27Pwgqt2w=;
 b=HXda+t1UfT7TSW68zIBxUAq3POIlPgNSvTt+8Ax2ZjUU54npF2hXP0OJY0rDisculUvKouqrhgbdg0KxXzV8EKtwuAnd77Szi4kcxufa8IA8v5C/pkWb9yfhllDgbScIuoIDD/fZStK7ZMrxS2PsceD3rX+A64FDWYO+oZdQ5lXma6h677NJC+X7119y4KURaDbV4Q09LB7da3lKXWK7qw+7sVawd9kc4R5hSWSyaggY4jlD6bcw3eHP01b3uqzXDMxKhR2VqFuzHIK0rvS4q6LNqTP+2YNNhFQ1hm0g3AboEm0XpHYZ1TxWO0gbMekhUxUhm9V4E/uBOJ4kqdKUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yB3CWTwn7miff6WKQfg4NNooeTmqdpZdK27Pwgqt2w=;
 b=FzdF/Q/t2OlSl+3srr0zS0sBFqKlRU/0mGd+1JDx4lvKMFFbvlz4OVUChOEetIEBXnV6PqkKe5omzm4brlTA2hM5eTvn7ZVRm8OdJhUxQEwU2+HHI1MaSjlupuE8HlXDvKYYkEuP6TcET6ChySQWodIy47/sNzcBV+nUabLTQmM=
From: Pau Ruiz Safont <pau.safont@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?WGlodWFuIFlhbmcg77yI5p2o5Zac5qyi77yJ?= <xihuan.yang@citrix.com>,
	=?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, "samuel.verschelde@vates.fr"
	<samuel.verschelde@vates.fr>, "yann.dirson@vates.fr" <yann.dirson@vates.fr>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Notes about "A common codebase for guest utilities, defined and
 shared with Xen downstreams"
Thread-Topic: Notes about "A common codebase for guest utilities, defined and
 shared with Xen downstreams"
Thread-Index: AQHYznooQP0DCtQ2a0Sdfczhui1HGK3remkA
Date: Thu, 22 Sep 2022 14:00:34 +0000
Message-ID: <81b18e59-8fcf-6c69-eafc-74947ca00522@citrix.com>
References: <067a94bc-b167-02c1-c654-27f2903f42c4@citrix.com>
In-Reply-To: <067a94bc-b167-02c1-c654-27f2903f42c4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4138:EE_|CH0PR03MB6129:EE_
x-ms-office365-filtering-correlation-id: c364120f-35b0-4fde-1141-08da9ca2d219
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 biy6e4NMD43i9HWSJW1MNNbwc8M9QExNpZqvF2UTHVzpvkegQWMA6uGdQqNHEKRmYlwi472HeCG5Bm0k2o5Sh1Zj+rLE0S7ibIGjxabWFiJpkCnvrF57HPWTeZOUGukWKlC9Ixzzx/a5oRPoc4dnxrBHiABGiPWQYF+70Wy4AlNJLru2RNUZKKwvdkfQY84fYo+ZfaUeGssSxzFy15kj/Y3BBwWZdGWIIEDwFmI5LMeiV8Z9Tb+/w/4Blkb4KpHZ2T9uK+A9nLmjM9qg0AHeAHVV+vOOEv0z+BqXSM10sD4WX4kV3OjH2eqpY60n2cPmtZ04cgy/70CE4FR7Ir76kBDpTGx3XixwuuPQ4bOm9UeoHVMSE49jyI0yAgm5S5BiilzZk2jrbYncDL2FX4bm3tub98NepxuYM5TjjJQmMATs5AmLUSOdEGPPKxaaKPaln8YEXXo6bz1Wt78vV8EqcPJNZeloKRBvooh2R7pTY4iloN9J/VJ789wGBweO1iZfx484I9n5myyV3oejDBhSnNSoq4lmed0x91mWuvsBBrzeEjjJf01cl2nVQqFA67zcywxXAye59XiDFgY/xVXCjpWWfOHOR8X2wapmUMx+fxgD5VHDWCCvb4MMu6S784ZIIKxlvpBxX7XpBIAodWELHODto4C0V3llePk0nK2/2k7RqEOMlpjC+/HYXchQwd1XtPlwP07E3aStVBxrGUnC8+DquN2q4LgnZobXa9aI/uxqrmCJEF5dRtyCG8c+j4aloMVg7uf6HbRz0QxjTtdpUWnsXsIY6cgPJ71cNCXat1xZWtZfvnu7lG59+isPo7DiXThnU2K24RSYFqCp5IjkRYGFIraJTErBMFLpgSAu4h8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4138.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199015)(83380400001)(2616005)(8676002)(31686004)(186003)(71200400001)(966005)(6506007)(91956017)(6512007)(316002)(86362001)(36756003)(31696002)(6486002)(5660300002)(26005)(66446008)(64756008)(122000001)(38100700002)(76116006)(82960400001)(66556008)(66476007)(2906002)(66946007)(110136005)(6636002)(41300700001)(8936002)(478600001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0swYy9pNSsxTkhTYWVvY0dYRnUrbmhWY2hab2w5UzYvSnpSR0M2eERmR2hq?=
 =?utf-8?B?UHR0TkhkRFBTRkYvUjQzdU1VQTJ0Sk1WQmIvU200NkJPSEQ2eERtaG0zN3Uv?=
 =?utf-8?B?ZURTU2ZQcnZiemI5bVpoTUthcmdJRVZKMk9SelRRSFBjWkVRTWNTempabWdC?=
 =?utf-8?B?WEk0NzJsVWFrQmp0OXlidi8rV0hrWmtSdUJsclRxTFhqUVlINkpOUTJQNUp3?=
 =?utf-8?B?ekZNcFN3dXpnOFBuU2pjY2pXZlhudU95UVppbWhGYnhRQ0xROWZQNFJiTzQr?=
 =?utf-8?B?Rk1ldWZtbGZsUmI1bUNESG5kTUNWb1dpVnB4am5FMjVtZFVmL1k3bEJyRXla?=
 =?utf-8?B?YWFBQ3RQMmttdnFGeWxucDFjcHJ4M0dCeUlGMnQxMFRyU0FXSkcrQ2JWeHhj?=
 =?utf-8?B?WnBMQ1hqUmxiNUsxRDR6RTV0NVc2T09md3YwUytZRG1VUlZrYVBIdnNpNVUw?=
 =?utf-8?B?cXliMUEzZFNYZEYwT2Z2K1BsR2tWNVR1Sk42dlZzNDNXYWJYU0xpd2xQU05U?=
 =?utf-8?B?K3N1Z2t5cDhlY2lkZEJZTjdtTFFjak5rWCtRdVN3V1NyN2ZodGMzSXJKYTU1?=
 =?utf-8?B?UHF5cXNUZ1NtUmd3ZzlQbnpJTnR3Q3ZKYk10ZS9wSVcrVmFyQW9BYWhTTnhz?=
 =?utf-8?B?d2ZnbmNQcEhyQUkwaExmTy9RY25CK1hmd2cyUEdzaWo0SzFyT2FPbHFzVjVK?=
 =?utf-8?B?MkVJN0tJQWc3ekVjN0FMOFdxQS9QV2ZZMDN4MmdRa0cvcFhJMnZweEFUOUNW?=
 =?utf-8?B?bXY2a3k5TGwxdElCaXhTUU4rajZZalNMeHo0QlB4dmxhNFowaFlIUGJuNU05?=
 =?utf-8?B?UkZhV3VTbjdScE9rNTBTY2twNXpSSjdSZ0Z2L1BBUnI4TWJsRjRWY3FFNnE4?=
 =?utf-8?B?L1U4Um5HdWlEazZ0L3FHMjcyQmZycGt4OEFNTnp0akZvNkFXcFFpbkFud2M5?=
 =?utf-8?B?b0NuMjFnTWRZdEVRNGZmYUhLcTdZU2lUQmErSWVEb2szRjVWUnlhelQyQVhG?=
 =?utf-8?B?RHg3TTEwbzlrU3pLZFhxWlFCbCtnZ0ZqbS8rZXRyQjlqRWRSVkpwTWxCTHA1?=
 =?utf-8?B?YnEydFQ1RW9JTUtoZG1FKzcrRW9qZ0F6b04xRmVFSmZndHdCUEp5VDkyQUNk?=
 =?utf-8?B?NFRMYnlZbzkvbE5oUDVBbzJKQ1AyaXdNRERrcjl2Qk1ZUldwY3p0RU83SDhZ?=
 =?utf-8?B?YVY4MFI1aVNYSmxmTEgwYlhzb0o0S2cxTFc5RXExb3lvUUhaNndCUjZYUFcv?=
 =?utf-8?B?ZVFpKzA2cDVRVVRXVUhOWk44TDJtUWhuQ2VuVGk2akE2UzNIV2FNaEwzcUJR?=
 =?utf-8?B?NndwWURUMllieDU1eXBXQjhjZkVMZGgyNVVQK2VDeXNOK0J1Q0Nqb0J1cVBD?=
 =?utf-8?B?ekZKRDk0TEo2NTdGWHM0Zk91UGk5M1Y4dDFQWkFJTkcwWjNGVG5VVkhNMDMv?=
 =?utf-8?B?YU5Sb2RWUG1JckxTT3JpWFUzaGl0QXM0SkhOR1Z4a1lPWklTTlRreXptRFk0?=
 =?utf-8?B?aFRwdTBLajIzVUxUZ1hxeU9VUDBCOHZ4djgzRUFPMFhVaExGOU5LYnpEQTBw?=
 =?utf-8?B?eisvTjFSLzRVK2lBNlRIem5SWUt2OUhSY3kvQmJnUXpsT25yYmhPZGhabkg5?=
 =?utf-8?B?M1NqVEtzVk9DMGRZUStnRW5HMzlyQjJ4b2tuK1VEeU1VbFN5NHBPeWZ3WlRV?=
 =?utf-8?B?cUxqcmFuQ1d3YlpybTB1dHpRQmsvNWZsai93ZTlXUDlUMCtJbi9SWFZLWVdJ?=
 =?utf-8?B?VHlwV3BScXNhNEpydXpRRGNCSXVQVllZSGduUDhPTndJVGNhNXNhNkJyVjBZ?=
 =?utf-8?B?Z0ViOUp1UUZNVXA5ekMzWGljOUJBSjBWOGNWOGlMajIwWU9TK3JMRVRYajMw?=
 =?utf-8?B?YkJBOEpNaGt3TTQ3b3VGWU1pcDlEbVp5ZGppYkg1MjQzOWs4SFMzNzVnMWNY?=
 =?utf-8?B?R1Q1MUx1bjRyL0Y4SUVNaUlubDlScnNlT0tvYmVTTDNoR09EMnM2ZUZEcy9D?=
 =?utf-8?B?aUpscXAxdDNtMWt3cUEyS0daRWNSaGE2YTE3MmxYUWg1d3piRlEvSTlkWmdI?=
 =?utf-8?B?K1dJOFMzdWMwbTZQa2hTaXlLdG9uRTBJdDMxWENrUFo3MHlRdnB2b2czOGUy?=
 =?utf-8?Q?BcM8fMyI+aiR0zpu+2KC0WgKO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <300F402B93D6F44F99CC334A699CCCA4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4138.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c364120f-35b0-4fde-1141-08da9ca2d219
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 14:00:34.9370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNTF52J2kDfsBGos1KqoohUdPzbSfFbdtE81nVsv4bIENyiDN24xme7dM5+wS29XKVwF/UEqMSTu+veTY0/mBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6129

c2E6IFNhbXVlbA0KZWQ6IEVkd2luDQp4aTogWGlodWFuDQphbjogQW50aG9ueQ0KeWE6IFlhbm4N
CnBhOiBQYXUNCg0KDQpzYTogYWdlbnQgcnVubmluZyBpbiBhIHZtIGNvbW11bmljYXRpb24gd2l0
aCB0aGUgaG9zdCB2aWEgeGVuc3RvcmUsIA0KdGhlcmUncyBubyBjb21tb24gY29kZSBiZXR3ZWVu
IHZlbmRvcnMuDQpsaW51eCB2ZW5kb3JzIGRvIG5vdCBrbm93IHdoYXQgdmVyc2lvbiB0byBwYWNr
YWdlLg0KDQp3ZSB0ZWxsIGN1c3RvbWVycyB0byBkb3dubG9hZCB0aGUgY2l0cml4IHRvb2xzLg0K
DQpjdXJyZW50IGltcGxlbWVudGF0aW9uIGluIGdvDQoNCkZyZWVic2QgZGlkbid0IHBhY2thZ2Ug
dGhlbQ0KDQplZDogd2hhdCdzIHRoZSBtaW5pbWFsIGZlYXR1cmVzIHRoYXQgYXJlIG5lZWRlZD8g
QW5kIHdoYXQgYXJlIHRoZSBhZGRlZCANCmZlYXR1cmVzIHRoYXQgYXJlIG5lZWRlZD8NCg0KeWE6
IHN1c3BlbmQgcmVzdW1lIGhhbmRsZWQgYnkgdGhlIGd1ZXN0IGtlcm5lbA0KDQpxdWJlcyBoYXZl
IHRoZWlyIG93biBpbmZyYXN0cnVjdHVyZQ0KDQpzYTogdGhlcmUncyBhbiBlbXB0eSBnaXQgcmVw
byBsaXN0aW5nIGZlYXR1cmVzIGluIA0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hl
bi1ndWVzdC1hZ2VudA0KVGhlcmUgYXJlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIG1ldHJpY3Mg
aW4gcXViZXMgYW5kIHhlbnNlcnZlcg0KDQp5YTogaW5zdGVhZCBvZiBwdXNoaW5nIGluZm9ybWF0
aW9uLCBvbmx5IHB1Ymxpc2ggdGhlIGluZm8gdG8geGVuc3RvcmUgb24gDQpkZW1hbmQuDQoNCkRp
ZmZlcmVudCBhZ2VudHMgcmVwb3J0IHRoZSBtZW1vcnkgc3RhdHMgaW4gZGlmZmVyZW50IHhlbnN0
b3JlIGxvY2F0aW9ucw0KDQplZDogYWZ0ZXIgcmVzdW1pbmcsIHRoZSBndWVzdCBhZ2VudCByZWZy
ZXNoZXMgeGVuc3RvcmUga2V5cywgY291bGQgYmUgDQpkb25lIGJ5IHVkZXYNCg0KeWE6IGdvIGFn
ZW50IGRvbid0IGRvIGl0LCBtYXliZSBrZXJuZWwgZHJpdmVycyBkbw0KDQplZDogdGhlcmUncyBh
IGNvbW1pdCBmcm9tIDIwMTYgZml4aW5nIGl0DQoNCmN1cnJlbnRseSB3ZSBoYXZlIHRvIHN1cHBv
cnQgY3VycmVudCBwcm90b2NvbCwgYW5kIHRoZSBjdXJyZW50IHByb3RvY29sLg0KDQpTaWduYWwg
dGhyb3VnaCB4ZW5zdG9yZSwgdXNlIGEgbmV3IGludGVyZmFjZSBpbnN0ZWFkLiBUaGUgbmV3IGlu
dGVyZmFjZSANCndhcyBwcm9wb3NlZCB5ZWFycyBhZ28sIHRvIGV4cG9zZSBtZXRyaWNzIGZyb20g
dGhlIGd1ZXN0cywgZGlkIGl0IGdldCANCmltcGxlbWVudGVkPw0KDQp5YTogYSBtb3JlIGVmZmlj
aWVudCB4ZW5zdG9yZT8NCg0KZWQ6IGlzIGl0IGV2ZW4gdGhlIGNvcnJlY3QgaW50ZXJmYWNlPyBi
dXQgdGhlcmUgYXJlIHRvbyBtYW55IGd1ZXN0cyANCnVzaW5nIGl0IHRvIHJlbW92ZSBpdC4NCg0K
c2E6IG1heWJlIGd1ZXN0cyBjb3VsZCByZWx5IG9uIHhlbnN0b3JlJ3MgcGFja2FnZSBmcm9tIHRo
ZSBkaXN0cmlidXRpb24/DQoNCmVkOiB0aGUgYWdlbnQgcHJvYmFibHkgbmVlZCByb290IGFjY2Vz
cywgY3VycmVudGx5IGdvIGFnZW50IHJlaW1wbGVtZW50cyANCnhlbnN0b3JlLCBidXQgaXQncyBp
bmNvbXBhdGlibGUgd2l0aCBkaXN0cm8ncyBwYWNrYWdlDQoNCmlmIHRoZXJlJ3MgYWxyZWFkeSBh
IHhlbnN0b3JlIGxpYnJhcnkgYXZhaWxhYmxlLCB0aGUgYWdlbnQgc2hvdWxkIGp1c3QgDQp1c2Ug
dGhhdA0KDQpzYTogdGhlIGluaXRpYWwgY29yZW9zIGlzc3VlcyBtYXkgbm90IHN0aWxsIGhvbGQs
IHRoZXJlJ3Mgbm93IGZlZG9yYSBjb3Jlb3MNCg0KUG9DIHdhcyB0YXNrZWQgdG8gWWFubiB0byBn
ZmV0Y2ggdGhlIElQIGFkZHJlc3MgYW5kIG90aGVyIGVhc3kgbWV0cmljcywgDQp3ZSB3aWxsIHNo
YXJlIG9uY2Ugd2UgaGF2ZSBhIG1pbmltYWwgc2V0IG9mIGZlYXR1cmUgdG8gZ2F0aGVyIGZlZWRi
YWNrLg0KDQplZDogYXJlIHlvdSB1c2luZyB0aGUgZGlzdHJvIHBhY2thZ2VzIGZvciB4ZW5zdG9y
ZT8NCg0Kc2E6IGlmIGl0J3MgYXZhaWxhYmxlIHllcywgYW5kIG90aGVyd2lzZSB3ZSBtYWtlIHRo
ZSBwYWNrYWdlIG91cnNlbGZ2ZXMuIA0KT24gZ2l0bGFiIHdlIHdvbid0IGluY2x1ZGUgdGhpcyBw
YWNrYWdlcywgb25seSB0aGUgYWdlbnQgY29kZS4NCg0KZWQ6IHRoZSBvbmUgaW5zdGFsbGVkIGlu
IGRvbTAgaGFzIGRpZmZlcmVudCBwYXJhbWV0ZXJzIGZyb20gdGhlIG9uZXMgaW4gDQp0aGUgZ3Vl
c3RzLCBpdCdzIHByb2JhYmx5IG5vdCBpbnRlbnRpb25hbA0KDQpzYTogd2UnbGwgbWFrZSB0aGVt
IGNvbXBhdGlibGUgd2l0aCB0aGUgdXBzdHJlYW0gcHJvdmlkZWQNCg0Kd2h5IGNyZWF0ZSBhIG5l
dyBwcm9qZWN0PyBkbyBub3QgZGVwZW5kIG9uIHhlbnNlcnZlciwgYnV0IGJlIGluIHhlbiBzbyAN
CmRpc3RybyBwYWNrYWdlcnMga25vdyB0byB0YWtlIHRoYXQgY29kZSB0byBidWlsZCBwYWNrYWdl
cy4gV2UgbXVzdCByZWFjaCANCnF1YmVzIHRvIGZvbGxvdyB0aGlzLCBhcyB3ZWxsIGFzIEFtYXpv
biwgbWF5YmUgb3RoZXIgZG93bnN0cmVhbXM/DQoNCnJlYWRpbmcgL2V0Yy9yZWxlYXNlIHdhcyBt
YWpvciBpbXByb3ZlbWVudCB0aGF0IHVzZXJzIGNvbnRyaWJ1dGVkLCBiYXNlZCANCm9uIGEgZGVz
aWduIHdlIHdyb3RlDQoNCmRpc3RybyBkZXRlY3Rpb24gdG9vbCBjYW4gbWFzc2l2ZWx5IHNpbXBs
aWZ5DQoNCmVkOiB3aGF0IGFib3V0IGJzZD8gaXMgdGhlcmUgYW55IGludGVyZXN0Pw0KDQpzYTog
d2UgZG9uJ3QgcHJvdmlkZSBwYWNrYWdlIHRoYXQgY2FuIGJlIGluc3RhbGxlZCwgaW5zdGVhZCBp
dCB3aWxsIA0KZmV0Y2ggdXNlci1jb250cmlidXRlZCByZXBvcyB0aGF0IGhhdmUgYW4gb2xkIHZl
cnNpb24gdGhhdCB3b3Jrcw0KDQplZDogYXZvaWRpbmcgbGludXgtc3BlY2lmaWMgZGVwZW5kZW5j
aWVzIHdvdWxkIGJlIGdvb2QuDQoNCnhpOiB0aGUgcmVwbyBpcyBlbXB0eQ0KDQpzYTogdGhlIHJl
cG8gd2lsbCBiZSBlbXB0eSB1bnRpbCB3ZSBoYXZlIGEgcHJvb2Ygb2YgY29uY2VwdCB2YXRlcyBj
YW4gc2hhcmUNCg0KZWQ6IGRvZXMgdGhpcyBuZWVkIHRvIGJlIGFuIHJwbT8gQSBsb3Qgb2YgY29t
cGxleGl0eSBpbiBDaXRyaXggaXMgaW4gdGhlIA0KcGlwZWxpbmUNCg0Kc2E6IGl0IG1heSBiZSBh
IG5vYXJjaCBycG0sIHdpdGhvdXQgYnVpbGRpbmcgYW55dGhpbmcNCg0KZWQ6IGlmIHRoZSBycG1z
IG5lZWQgdG8gYmUgYnVpbGQgZm9yIGd1ZXN0IGlzIHZlcnkgY29tcGxleA0KDQpzYTogaG93IHRv
IHByb3ZpZGUgcGFja2FnZXMgZm9yIGRpc3Ryb3MgdGhhdCBkb24ndCBwcm92aWRlIHRoZW0uIElu
IG91ciANCmJidWlsZCBzeXN0ZW0gdGhlcmUncyBibGFjayBtYWdpYy4gSW4ga29qaSB0aGUgZ28g
cHJvZ3JhbSBpcyBkb25lLCB0aGVuIA0KYnVpbGQgdGhlIHJwbSBhbmQgdGFyLmd6IGlzIGJ1aWx0
LCBiZWNhdXNlIGl0J3Mgc3RhdGljYWxseSBsaW5rZWQNCg0KZWQ6IHdpdGhvdXQgYmluYXJpZXMg
d291bGQgYmUgZXZlbiBzaW1wbGVyDQoNCnlhOiBkZXBlbmRpbmcgb24gZGlzdHJvIHRoZSBjb25m
aWcgZmlsZXMgYXJlIG9uIGRpZmZlcmVudCBwbGFjZXMNCg0Kc2E6IGxvY2F0aW9uIHNob3VsZCBi
ZSBkZWZpbmVkIGluIHRoZSBwYWNrYWdlIG1ldGFkYXRhLCBub3QgaW4gdGhlIHVzZXIgDQpyZXBv
IGJ1aWxkDQp1cHN0cmVhbSBkaXN0cm9zIHNob3VsZCBidWlsZCBtb3N0IG9mIHRoZSBwYWNrYWdl
cw0KDQp3ZSBidWlsZCBvbmx5IGZvciBzb21lIGRpc3RyaWJ1dGlvbnMgd2hpY2ggZG9uJ3QgcmVs
ZWFzZSB0aGUgdXAtdG8tZGF0ZSANCmd1ZXN0IHV0aWxzDQoNCndlIG9mZmVyIHVzZXJzIGluIG91
ciB3ZWJwYWdlIHRoZSBvcHRpb24gdG8gcGljaw0KDQpwYTogd2hhdCBsYW5ndWFnZSBpcyB0aGUg
UG9DPw0KDQp5YTogd2UgaGF2ZW4ndCBzdGFydGVkIQ0KDQpzYTogd2UncmUgdHJ5aW5nIHRvIHVz
ZSB3aXRob3V0IGFueSBsYW5ndWFnZXMsIHVzaW5nIHVkZXYuIFdlIGhhdmVuJ3QgDQpkaXNjdXNz
ZWQgd2hhdCBsYW5ndWFnZSB3b3VsZCBiZSBhcHByb3ByaWF0ZQ0KRm9yIGxpbnV4IGl0IHNob3Vs
ZCBiZSB2ZXJ5IHNpbXBsZSB0byBidWlsZA0KU3RhdGljIGxpbmtpbmcgaXMgdmVyeSBjb252ZW5p
ZW50IGZvciB2YXRlcw0KDQpwYTogdGhlcmUncyBhbiBvY2FtbCBwcm9qZWN0IHVzaW5nIGNvc21v
cG9saXRhbiBsaWJjIGFsbG93cyB0byBydW4gDQpzdGF0aWMgYmluYXJpZXMgb24gd2luZG93cywg
bGludXggYW5kIGZyZWVic2QNCg0KeWE6IHNlZW1zIHZlcnkgc3BlY2lmaWMsIHJ1bnMgcmlzayBv
ZiBub3QgYmVpbmcgYWNjZXB0ZWQsIGl0IHNob3VsZCBiZSANCnNpbXBsZSB0byBjb2RlDQoNCmFu
OiBjb21wYXRpYmlsaXR5IGluIHB5dGhvbiBpcyBub3QgZ29vZA0KDQpzYTogbm90IGFsbCBkaXN0
cm9zIHdpbGwgaGF2ZSBweXRob24NCg0KZWQ6IG1heWJlIGEga2VybmVsIGRyaXZlcj8NCg0KcGE6
IGl0J3MgbGludXgtc3BlY2lmaWMsIHRob3VnaA0KDQplZDogd2hhdCBkbyBvdGhlciBoeXBlcnZp
c29yIGRvPyBrdm0gYWdlbnRzPyBxZW11IGFnZW50Pw0KDQphbjogbmV2ZXIgc2VlbiBhIHFlbXUg
YWdlbnQNCg0KeWE6IHRoZXJlJ3MgYSBoZWxwZXIgZm9yIGJldHRlciBtb3VzZSBpbnRlcmFjdGlv
biB0aHJvdWdoIHFlbXUNCg0KZWQ6IHdoYXQgbGFuZ3VhZ2UsIGhvdyBhcmUgdGhleSBkaXN0cmli
dXRlZD8NCg0KYW46IG1heWJlIHRoZSBzb3VyY2UgaXMgaW4gcWVtdQ0KDQp5YTogdGhlcmUgbWF5
IGJlIGEgZHJpdmVyIGlzbywgY2FuJ3QgcmVtZW1iZXINCg0KYW46IGh0dHBzOi8vd3d3LnFlbXUu
b3JnL2RvY3MvbWFzdGVyL2ludGVyb3AvcWVtdS1nYS5odG1sDQoNCnNhOiBjb3B5IGFuZCBwYXN0
ZS4uLiBzdXJwcmlzaW5nIHRvIHNlZSB0aGVyZSB3YXMgbm8gZWFzeSB3YXkgdG8gc2hhcmUgDQpj
bGlwYm9hcmQNCg0KYW46IHhlbnNlcnZlciBoYXMNCg0Kc2E6IGJ1dCBvbmx5IGZvciB3aW5kb3dz
LCB3aXRoIGEgdm5jIGNvbnNvbGUgZm9yIGxpbnV4LCB0aGVyZSdzIG5vIHN1Y2ggDQp0aGluZy4g
TWF5YmUgaXQncyBlYXN5IHRvIGFjdGl2YXRlIGJ1dCB3ZSBkb24ndCBrbm93IHRoZSB3YXkNCg0K
ZWQ6IHZuYyBzaG91bGQgaGF2ZSB0aGF0DQoNCihub2JvZHkgaW4gdGhlIHJvb20ga25vd3MpDQoN
CnlhOiBpbiBxdWJlcyBoYXMgaXQncyBvd24gcnBjIGluZnJhc3RydWN0dXJlIHRvIGNvbnRyb2wg
YWNjZXNzIHRvIA0KY2xpcGJvYXJkIGFjY2VzcyB0aHJvdWdoIHZjaGFuIFRoZXJlIGFyZSBzaG9y
dGN1dHMgdG8gc2hhcmUgZ3Vlc3QgDQpjbGlwYm9hcmQgdG8gdGhlIGdsb2JhbCBvbmUgYW5kIGJh
Y2sgY3RybGMgY3RybHNoaWZ0YyBldGMsIGl0J3MgYSANCnNwZWNpZmljIG1lY2hhbmlzbQ0KDQpl
ZDogd2UgY291bGQgcmV1c2UgdGhhdCwgbWF5YmUNCg0KeWE6IGl0J3Mgbm90IHZlcnkgYWR2YW5j
ZWQsIG9ubHkgdGV4dC4gTWF5YmUgcGF0Y2hlcyBuZWVkZWQhDQoNCnNhOiBsZXQncyB3cmFwIHVw
DQoNCnRoYW5rcyBmb3Igam9pbmluZyBldmVyeWJvZHksIHdlJ2xsIHNoYXJlIHRoZSBub3Rlcw0K

