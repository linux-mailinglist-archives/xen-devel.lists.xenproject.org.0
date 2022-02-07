Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D911B4AC446
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 16:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267155.460871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6Gc-00027c-MW; Mon, 07 Feb 2022 15:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267155.460871; Mon, 07 Feb 2022 15:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6Gc-00025h-JO; Mon, 07 Feb 2022 15:49:26 +0000
Received: by outflank-mailman (input) for mailman id 267155;
 Mon, 07 Feb 2022 15:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wO/0=SW=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nH6Gb-00025b-Cd
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 15:49:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 845f1f96-882d-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 16:49:23 +0100 (CET)
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
X-Inumbo-ID: 845f1f96-882d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644248963;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MY7Z5FwUiaPGBlJzHz/bNmCDZrW81h1hOhMJKyQZMPM=;
  b=AMT1CzWGjVKDlWexqGRqY74mcDn3eQMW4Anvy3DRRuXB17yFYeRSZh50
   y2bvTcIBwybBls/kITe0LQEpxvGZOB+MRR1tCT8BYiacFmDQHKmjYrIpN
   GMiV5jkKaeBtvPXU+0+Kwck0V3Q11KBdV3ujA9RS8DYe/2nHUOx5Zo616
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: d523P19b6Rg0LPIMo/cyDpWhQJ1Ir6Y5uhxQSl8blDEit1iJsLYp1g6jkD/jpfM+SZT/QTLTBW
 n+of6KM87F5uXZx/c59ClsO3FQiMwK8M2MIMAoZEF6J7Qx6NeZblvwpOoRPO+kqcDm4TE5XNKL
 G6DzypXYdDiQtY4rFHk8sL4ufxJFR6LUsGBKMwSjEEVfIcZMhPaheQd+569vsJmwJW+TxpCSxT
 jnhwb+aoXMgE6rhKK6Cj/hnuxNAHGLDJRhbthpCV53Uyw2R8LoJJi0ytaMxmAPJi+J+x/TGki8
 qUGtRCNv6jOJ8Z/IMNXr0yDp
X-SBRS: 5.1
X-MesageID: 63567136
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ccr59K97bi8VEnwJOIF4DrUDeXmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 mdMXGqGafmJNjH8KYp1aozk9B5V65bTyoRgQFZuqSE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhXw
 YwQm6aBFDsgI63DpdpEaxJ4I3xXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwMIc7xM45ZlmxmyTjBJf0nXYrCU+PB4towMDIY2JsTQ6mHP
 JRxhTxHdgT7bj4SBHMrMJ8HocyXnkvieWFTkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 kre9nn9KgEXMpqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZtXgWRmxuHGsoxsdUNoWHuEngDxh0YKNvVzfXDJdCGccNpp276faWADGy
 Hevloq0KwZe7YGcVHKSy4nNlTiSCXU8eDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsuAZCQ0c0
 BjR8nFg2ux7YdojkvzioAuZ227ESo3hE1Ztjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBvaLhXdF1Kz6zcWNE5vbKIN8NwnwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpP97oWp1zk/m6TI+NuhXogj1mOMkZSeN61Hs2OR74M57FzCDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX+PUkE83eLOlPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6WNmON6Jd05wPg9eyWh1
 ijVZ3K0AWHX3BXvAQ6LdmpiePXoW5N+pmg8JisiIRCj3H1LXGplxP13m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:5M7dxqF+ei1SautspLqF5JLXdLJyesId70hD6qkvc3Bom52j+v
 xGws5w6fatskdrZJhSo6H7BEDgewKXyXcR2+Ys1NiZLW7bUQeTTL2KqLGSuwEIeBeOu9K1t5
 0QFZSWYeeYZTMV7PoSojPIaurIq+P3kpxA8N2uq0uFOjsaDp2IgT0JaTpzQHcGHDWvpPcCZc
 ahD5981nydUEVSReiAPD0iQ/XJocHNmdbdeBYDQyUq8Q+UkFqTmeTHOind9TslaXdo3aoo93
 TDnkjC/62m98uwzATRvlWjtKh+qZ/L5uF4QOqRl8MSNjLgzjywbIAkYaCLoSwuydvftWrCxO
 O8+isIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsPuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59cs5Ufa/peVFZil/1dwKpnKuZDIMs80vFjLA
 BaNrCd2B+RSyLfU5mWhBgp/DXmZAVPIv7PeDl/hiXS6UkboJkx9Tpm+OUP2ngH754zUJ9C+q
 DNNblpjqhHSosMYbt6H/ppe7r/NoXhe2O6DIupGyWQKEjHAQO/l7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P0bjE9eH0pFH+g3EBDzVZ0Wn9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRsnWQe
 y6Np5aC+LqaWHuBYFK1QvjXIQ6EwhXbOQF/tIgH16eqMPCLYPn8uTdbfbIPbLoVS0pX2vua0
 FzKAQb5P8wm3xDdkWI8SQ5akmdCHAXp6gAbpQy19JjuLQwCg==
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63567136"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhK1kFYLvZJahA6Fc41McMyoB24nrqJKRS9Z3JdykS4jVdSO1sl94LfnROWRN+DokjLLxFrTrnXztgSmwTfbzIyHVll0nsMBkJ/eE2jRtAAkoed+sEfExAnt04Wb8Z2QuVAtRgbStxhEpevEwdANgSbJZB0Dz08r/4e26kxgV0kDBmKosy3JBAjLwU8FZx2Xc69bL6L+A3+2bbp42OoaX7BMzcJdqE4k8bmhij7IrvkZHMWll+WnJp4P2DCcFb3Us2Ambt1EAEudT0NxEEbbHiRowTyhVf2GCYs5gAEUxgLcAC3iSvOVopRr3+FkxXrHbQXM1yXtSwEN56lK7xuzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY7Z5FwUiaPGBlJzHz/bNmCDZrW81h1hOhMJKyQZMPM=;
 b=b16+GZ30saxSAKczhlUa5ZbPNAcht2c55cx8eJXbRgTBYbStnysb1LGhWfaJrnnreVb++4PVqCTYOrn9c+FBGT4BPZf1SM1MY3gKSj9tgQ7o5hwjKkc5uIVu4BSW/kwj4lo/VGFnmDJQZcolmTJvoSnSVUu0Jr5k734cJmcleJ1SkNjkFyn5PRSBT2/mN3k7lPE7sJHilrBXzIonCWPVZ0z5b+7pCorBlHbN5FY3YTsXZeZq9OodD+b2yTtnWrgfcFZ1jBWZd7RKsBQjh6hmyWu1/JZiVf8UEoF396w4DCurEhAE/8MPuXpM6rekEW6Bb9uqf8OZ07Vbhy5ciTgNxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY7Z5FwUiaPGBlJzHz/bNmCDZrW81h1hOhMJKyQZMPM=;
 b=sQFCEWGIwQUyn/aKpV5f+pHyQJ4erjJHw5yUxkR5DBcULZoWu5Q2wc6mGya0E96dUyg6iT3nxFsVqRo1uK7TQ+H4GUXw6Fohtrqnex2P6sxHdUvWDZHaIMLUJIsu8Bwnw7hFdDxtrb7xzA+DhMlbG6VO/Oqck5lUJrfbJNcmKfs=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <dunlapg@umich.edu>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH 02/16] x86/P2M: introduce p2m_{add,remove}_page()
Thread-Topic: [PATCH 02/16] x86/P2M: introduce p2m_{add,remove}_page()
Thread-Index: AQHXcbe4nq39qHT4NkaFiXaxZQKxtayFQ+EAgAPllgCAAGedgA==
Date: Mon, 7 Feb 2022 15:49:17 +0000
Message-ID: <26C975A8-9ECD-4330-8852-4D308D386A46@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
 <CAFLBxZZQgfYZ=OcyhRedPvK0CZxjrHY-5kRp4EOpJ2LEFL09yg@mail.gmail.com>
 <f986aadb-0eff-0f51-be42-16c31999cb08@suse.com>
In-Reply-To: <f986aadb-0eff-0f51-be42-16c31999cb08@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6ff1a86-3e8c-465d-d58f-08d9ea516654
x-ms-traffictypediagnostic: BY5PR03MB5362:EE_
x-microsoft-antispam-prvs: <BY5PR03MB53621D2727E205AF36FCEE9B992C9@BY5PR03MB5362.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aiJ9PqA0JopeJJNr+l64KYaTOUiCDk0ZF+06oudo4J848fDlWGjteS6stcKGuNTO5essn/o43RcW5hGuLM7bhwa5jJeru6tUC3JPnDxNl6zRGT334wv6yI5DLaLvM7grBSgV7KkxX6mridzDzlyvUKDADdu0oMr0P4Uy60+yHcGRCkpiT7QdErOWB5Y28LhENxM+AM7AGTiVCrgoVLPAE6M9516isvMa1smuoYI+LPStLFwYmG0hOISIS8/PYAfDjrWEoJYlr8GQagKOMLXVjhueBrTuVAIFOulefsccIvCvkRzV9DgCAI7FM1CRvFhwquK/VP71/ZBxUtM0WW82ziOvvKZcasvQauT+LvZEJzkg4ZSMHEhQTSTCNKlQvvczcsJuNBqs2Jc61zyNU6HzWwowiRdh8QUr/ID9rknBcqXUcD3VyFyu826dAHAe6OEjyKuMwnksqSo6JqzL8JOFwLSF0g9yiYwlXE9EfXJkqn1j5TiIxpDH1T938QvOkasUoVcG1gLVPmrLZW+ECFHAnFvcoBiyCb568gLsXZKpEKUzJ0dHSCQYOaOoPJI1vcOY2+6ZVca/rqxueQF09fctdLh6HylO7puF0W1s2/nMuKZmgocSPL0r/5RRF5EfDlRKT3ZWkuG/MSoBmg1dnjQDFxYZsgX/dFBWkFzHXCa1Rkb2g5jLy+xJUFu7QeURts8IHdJprBH+1PaA2sjNsfKrsvJ8/0p2L1nwj+9zIMyCt1wit+TdySjvDy/wLZQWpgEi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(6486002)(508600001)(64756008)(8936002)(8676002)(38100700002)(2906002)(66476007)(76116006)(66446008)(66946007)(66556008)(36756003)(186003)(2616005)(5660300002)(6916009)(26005)(6512007)(316002)(53546011)(54906003)(82960400001)(38070700005)(83380400001)(6506007)(86362001)(122000001)(4326008)(33656002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0xDczlPdm9yODcremVia21kaDFISmpWelljcE91WEtDSXdoSkR5TEtkTFh6?=
 =?utf-8?B?ZE83Sm1samRYemhBd1pncWxySUlsdmk3MllNYVhmV3lPVlhlVW5pWDZwTHJw?=
 =?utf-8?B?S3BFTk1WRUFGb3ozc1J2bHV1enhnQ24xSmhIaExnekh5bU43YkdMUXQxSW0y?=
 =?utf-8?B?VWpSdjJGNWE5UHd3cU1BTmF1emR2bTJQcGtPRjF1Uk96VzBuRkk1MnlqenJx?=
 =?utf-8?B?S0lrZ1FrWnRieFcranpTb3pLd0tWQ3E4bGQ3cTdnWGhqMEJPajBpSldMYlJj?=
 =?utf-8?B?Qk53YVJpclMxcit3ckIvRWRCYWx4YUdJM0pKaFlveFU4U01GNFJHc2ZHRC9s?=
 =?utf-8?B?YUNWRkQ2b3dKeXBucUJua00xWXZmemNEaEk1QTJSeE1pbkdlTURaTmxObU9I?=
 =?utf-8?B?Z3VpcXNJMEZtZkgxaU1NeHVaL2psYWdwanJKVDh2MHZURFRlS3JFT2R2emhu?=
 =?utf-8?B?U0s2M1pZYldzUit6aVZSWnFTSWsvbng3NXp2VFNkMndKazl5QUdpS1Q3QWlT?=
 =?utf-8?B?YzN4MXl0SjJlRFpidjV0WndoU3Y4SGpLcTZUaGVCRXUxV3FGMVVKak92WmQ3?=
 =?utf-8?B?RjN6Z0RjT2huM3NLczIvZDFoSElqbGlHQUF5eWRCY1JIZ29hTmUrWFhPNGJw?=
 =?utf-8?B?ekZmRUpVRkNxeVptR2FUNXhrZTZPNUF2bzdDb1dERU1LM1hZYk1JRVh5UTRx?=
 =?utf-8?B?akVvc2NHa1pTUDc2cEFRbXZwOU5kTVdOUjF2QXQxeDRzRHhhY2lJMTBkdzFP?=
 =?utf-8?B?RENKQ24ybzlSTnQyLzN3VUhUQmVCcnhTSGVuTHBiM1dzd01kcisyQ3JzRVBC?=
 =?utf-8?B?RWNvZytWK3VURDhva2I2NFR2V2EzVG1LTk5lYVNSNHEwOWZWdnR3UnRJMS9j?=
 =?utf-8?B?ZE82UjFFSHYwTHFlcncxRkZUbjNSRTkxYUlHZFY3M1V6WDRRd3ZUZzY3S0Fn?=
 =?utf-8?B?dnpNTytnQ1Q1MWJYLzJkS1J5d0lBQml4MXppOTdFQWo1TGtUS2UwTDk4a29r?=
 =?utf-8?B?dWpoMk9XeHpiV3VPVktnTjltM3ptNTcxM1BKaFp2aCtVNnBEb3ZyZ3RTdnBi?=
 =?utf-8?B?a09mR0NRYjBaYS9obEVDVWE3K210aGtRWHRwS2lrZlFNSDBoc0hzbW45bWRv?=
 =?utf-8?B?MllsMnNoVUhYNitrTjF2b3JwUjR1aDFIcDYxMXI3dEdBZ2ExakVldmU0aEpi?=
 =?utf-8?B?dGtLTHRyZDF0VGdmeS9SWE43ZEdwaEVjWTE4SFZXaE41TkJtaU9rZURBWGhu?=
 =?utf-8?B?SStabnNrMktwWnVBdHpsQVVzZlJKekswbW92U0lVMUZjaHBiWWNwRkJodGVq?=
 =?utf-8?B?QnBwN0NPTVVudUhGZVNqMU1BMjdCY09CMk1ra0NmbE1OeHMycXJNTGNUVVgw?=
 =?utf-8?B?M2FHbkIvaG95cEZrcjlQTGxBMDM3VDlES1FRanBxWC96QU5JalpQZXBCRWpo?=
 =?utf-8?B?RDFRT25BaWRINmxzY2s0RXNkMmR1Um1LcEpNT0paanFOUysvN3A3L083R2tu?=
 =?utf-8?B?SnpjTnhOc2tEaysvM1hGM2grRlZwdnlJRGRVY0hHQ1JhclN1ci9MTDNpbnhh?=
 =?utf-8?B?Y2RCdnZ1Q2owRE5UeEJqbGxteVNWaFQvbWVJNXAycVRUSVF1ZVB4WVZrbFdz?=
 =?utf-8?B?R1ZRdk01ZUsyUkhmL3pMa3NRVTdmcHNLWllHN3NKRjc3UEtHcW9XZHdYbEh2?=
 =?utf-8?B?VjBHSlFpQ3RTUXl6UzFOODVMNlhUeTJqM2Zkam4zaFJYWGxERDJ5aVQ1WHVR?=
 =?utf-8?B?QjRMMDNidjlacDM1U1VIMVJwbng2VVhHVmUvTnlleWo3TCtjWFIxWW9qY08w?=
 =?utf-8?B?VUFhTUV3QXFZcThtTWVUWjVNb3ZrcFhEWEwrN1E0bGkzdmk5OHZkNWlVQk42?=
 =?utf-8?B?dEkrM1RzVnkyNlEvQWtmbCtDUndXVDFWeUNldFlyWllOaVUyM3h1UWtwdDVw?=
 =?utf-8?B?NzRzN3YxUEJEdW5vRnlia3RGanpLWWp5OWltWHZCQzR0TXdHblVXcUZoZE1s?=
 =?utf-8?B?eGNFZTN2NFhxZEhPMXFLcG9RbSs3WG02YjlmUHMvWk5kcUg4K2JWcG9GbmJV?=
 =?utf-8?B?Nnl5VExaSXVXc3pUNmtTc3k3alZpNlkxeHBGUkpmeVRqTnJ4UzVzcmpzc1Vj?=
 =?utf-8?B?bEtMa1FCREN6YTFVMzJVTkU5Z2ltR0g2NzE1RXlLd2tjZ2RuWUx4M1dqQmtM?=
 =?utf-8?B?eHVGMFNiS29RL01vcWNMWk9zRndZT2c2RGNFcS9TUFU2WWlxL3BzT2dBSW13?=
 =?utf-8?Q?5kw7082gwC21kIq2XMT8DQiIeLlA+on4p60ybutztk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47426208BE01BD4CB96E92C80BE60D92@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ff1a86-3e8c-465d-d58f-08d9ea516654
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 15:49:17.8784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZkanR4oZ9Xcvd28I5WoMMiflT5AfzF/Ib7CEA0ia735l5Ae2IcBeJiMj4BhJg68HVPJ57g8CiY0qis8SPKrmjVrvFwjHhJL0FUoB38BKHLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5362
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDcsIDIwMjIsIGF0IDk6MzggQU0sIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNC4wMi4yMDIyIDIzOjA3LCBHZW9yZ2UgRHVubGFw
IHdyb3RlOg0KPj4gT24gTW9uLCBKdWwgNSwgMjAyMSBhdCA1OjA2IFBNIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+PiANCj4+PiBwMm1fYWRkX3BhZ2UoKSBpcyBzaW1w
bHkgYSByZW5hbWUgZnJvbSBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSgpLg0KPj4+IHAybV9yZW1v
dmVfcGFnZSgpIHRoZW4gaXMgaXRzIGNvdW50ZXJwYXJ0LCBkZXNwaXRlIHJlbmRlcmluZw0KPj4+
IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKS4NCj4gDQo+IEZpcnN0IG9mIGFsbDogSXQgaGFz
IGJlZW4gbG9uZyBhZ28gdGhhdCBJIG5vdGljZWQgdGhhdCB0aGlzIHNlbnRlbmNlDQo+IG1pc3Nl
cyB3b3Jkcy4gSXQgbm93IGVuZHMgIi4uLiAgYSB0cml2aWFsIHdyYXBwZXIuIg0KPiANCj4+PiBU
aGlzIHdheSBjYWxsZXJzIGNhbiB1c2Ugc3VpdGFibGUgcGFpcnMgb2YNCj4+PiBmdW5jdGlvbnMg
KHByZXZpb3VzbHkgdmlvbGF0ZWQgYnkgaHZtL2dyYW50X3RhYmxlLmMpLg0KPj4+IA0KPj4gDQo+
PiBPYnZpb3VzbHkgdGhpcyBuZWVkcyBzb21lIGNsYXJpZmljYXRpb24uICBXaGlsZSB3ZSdyZSBo
ZXJlLCBJIGZpbmQgdGhpcyBhDQo+PiBiaXQgY29uZnVzaW5nOyBJIHRlbmQgdG8gdXNlIHRoZSBw
cmVzZW50IHRlbnNlIGZvciB0aGUgd2F5IHRoZSBjb2RlIGlzDQo+PiBiZWZvcmUgdGhlIHBhdGNo
LCBhbmQgdGhlIGltcGVyYXRpdmUgZm9yIHdoYXQgdGhlIHBhdGNoIGRvZXM7IHNvIElkJyBzYXk6
DQo+PiANCj4+IFJlbmFtZSBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSgpIHRvIHAybV9hZGRfcGFn
ZTsgbWFrZQ0KPj4gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZSBhIHdyYXBwZXIgd2l0aCBwMm1f
cmVtb3ZlX3BhZ2UuICBUaGF0IHdheSBjYWxsZXJzDQo+PiBjYW4gdXNlIHN1aXRhYmxlIHBhaXJz
Li4uDQo+IA0KPiBXZWxsLCB5ZXMsIEkgdW5kZXJzdGFuZCB5b3UgbWlnaHQgd29yZCBpdCB0aGlz
IHdheS4gSSdtIG5vdCBjb252aW5jZWQNCj4gb2YgdGhlIGZpeGVkIHNjaGVtZSB5b3UgbWVudGlv
biBmb3IgcHJlc2VudCB2cyBpbXBlcmF0aXZlIHVzZSB0byBiZSBhDQo+IHVuaXZlcnNhbCBmaXQg
dGhvdWdoLCByZXF1aXJpbmcgdG8gYWx3YXlzIGJlIGZvbGxvd2VkLiBXaGVuIHJlYWRpbmcNCj4g
dGhlIGRlc2NyaXB0aW9uIHdpdGggdGhlIHRpdGxlIGluIG1pbmQgKGFuZCB3aXRoIHRoZSBwcmV2
aW91c2x5IG1pc3NpbmcNCj4gd29yZHMgYWRkZWQpLCBJIGZpbmQgdGhlIHVzZSBvZiBwcmVzZW50
IHRlbnNlIHF1aXRlIHJlYXNvbmFibGUgaGVyZS4NCg0KVGhlIHdheSB5b3Ugd3JvdGUgaXQgaXMg
YW1iaWd1b3VzIGdyYW1tYXRpY2FsbHk7IGl0IGNvdWxkIGVpdGhlciBtZWFuLCDigJxSaWdodCBu
b3cgcDJtX2FkZF9wYWdlKCkgaXMgc2ltcGx5IGEgcmVuYW1lLCBhbmQgc2/igKbigJ0gb3IgaXQg
Y291bGQgbWVhbiwg4oCcSW4gdGhpcyBwYXRjaCwgcDJtX2FkZF9wYWdlKCkgaXMgc2ltcGx5IGEg
cmVuYW1lLuKAnSAgSWYgYSByZWFkZXIgc3RhcnRzIGludGVycHJldGluZyBpdCB0aGUgZmlyc3Qg
d2F5LCB0aGVuIHRoZXnigJlsbCByZWFkIGFsb25nIHVudGlsIGl0IGRvZXNu4oCZdCBtYWtlIHNl
bnNlIGFueSBtb3JlLCB0aGVuIGhhdmUgdG8gcmUtZXZhbHVhdGUgdGhlIHdob2xlIHBhcmFncmFw
aC4NCg0KSXQgc2VlbXMgdG8gbWUgdGhhdCBteSBwcm9wb3NhbCBpcyB1bmFtYmlndW91cy4NCg0K
PiBJJ20gZnVydGhlciBzbGlnaHRseSBwdXp6bGVkIGJ5IHlvdSBrZWVwaW5nIHRoZSB1c2Ugb2Yg
cHJlc2VudCB0ZW5zZSBpbg0KPiAiVGhhdCB3YXkgY2FsbGVycyBjYW4gdXNlIC4uLiIuDQoNCkkg
d291bGRu4oCZdCBjYWxsIHRoYXQgdGhlIHByZXNlbnQgdGVuc2U7IEnigJltIHN1cmUgYSByZWFs
IGxpbmd1aXN0IHdvdWxkIGhhdmUgYSBuYW1lIGZvciBpdC4gQ29uc2lkZXIgdGhlIHNlbnRlbmNl
LCDigJxQdXQgdGhlIGJveCBuZWFyIHRoZSBkb29yOyB0aGF0IHdheSB3ZSBjYW4gZmluZCBpdCBl
YXNpbHkgd2hlbiB3ZSBuZWVkIGl0LuKAnSAgVGhlIHNlY29uZCBoYWxmIG9mIHRoZSBzZW50ZW5j
ZSBpcyBzZXQgaW4gdGhlIGh5cG90aGV0aWNhbCB1bml2ZXJzZSBpbiB3aGljaCB0aGUgaW1wZXJh
dGl2ZSBoYXMgYmVlbiBjYXJyaWVkIG91dC4NCg0KIC1HZW9yZ2UNCg0KDQo=

