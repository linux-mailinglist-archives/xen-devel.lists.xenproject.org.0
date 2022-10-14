Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899775FEC39
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422648.668817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHWn-00068b-GB; Fri, 14 Oct 2022 10:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422648.668817; Fri, 14 Oct 2022 10:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHWn-000663-DE; Fri, 14 Oct 2022 10:02:53 +0000
Received: by outflank-mailman (input) for mailman id 422648;
 Fri, 14 Oct 2022 10:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojHWl-00065x-FG
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:02:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5af9b2cf-4ba7-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:02:49 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 06:02:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5919.namprd03.prod.outlook.com (2603:10b6:a03:2d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:02:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:02:37 +0000
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
X-Inumbo-ID: 5af9b2cf-4ba7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665741769;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=c7LG7/wLOFe8/Mu52FLx9+uc+gxfDHeQDPJap9EXJEk=;
  b=da4LySFhxlDHOFDl5cJHV2zfh8zVD+pcyup9ylcfrqT3p6TxU16PEWST
   hvFzzlPur5NzGpUIgeb0QGuJjSkZM8HIX8fN8wWqGyv14Srtn7InAcFoM
   rGq2e0U8qJHzzRUFnvg5Sv6VfUczwbe6PLUiCy+JhWkmwNdf39XHhYuKb
   g=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 81843246
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:S7GJCqnFRAtul+fOsAUpKyXo5gxAJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXTiFOqyNNDD0KtElbIXi8UpV656Dn4QyGwY9pC40FiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRnOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfL0JDp
 KwlBm4xKRG8lebu7LaKU/M0mZF2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1EZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOiCN5JTuHmnhJsqAXC30tJFS8JbH6mkeao1VyRRu1fA
 WVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLiKE+iAjeCOlqFqGdh8fwXzr3x
 li3QDMWgrwSiYsB0fW99FWe2Ta0/MGWE0gy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:P4jFv611TxmwsPQHa7NwlwqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgRBq3P4iFW5uYeE99RjBmckaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAs23EigMyMeFPCC1zydHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="81843246"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIlLaGHjdMVJQdecwYnBCrr36ibCowFE+jujJ5uTQWYmDJ+SbZQGFimMe1FwLdCFAZnVQoJB0u3SMn3x5Xslz6eGiT/BT9YrL2R2LpYAraF6+FNFCwpJlVHlMxW2K0AWM9joaPw56ArMFmEikuns3Jcp8E0rODPSDoIFzSk9b3rYwQmuTg03UUixjKVFLlQrvjx6KCVbaQrtPcWyl4BhH2Wn0vTCSqKb6+LhHAxdwJW00Vm3NJdaYowSMkLTHdL/2Zxou/OkcnhlLgmQ2R7ctmiLx46FBX0TYyxcza+QWGoFzXa9nRKJ74z0YjtcGU+By3PXSmHJ+G6L3Voe9rw/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7LG7/wLOFe8/Mu52FLx9+uc+gxfDHeQDPJap9EXJEk=;
 b=hs3rIHDMfoeqJjj70rcsxy6ZPdSbPo6kn536nkndV+iIggaakPK4MGtwalW+p1C4C07XCSbYYqSbFtrZleC9vpGfkodEiWnSrSJ3rA2uG5BEx0Hz3XkhKUpzhVtcPg1I2DzbAL2hAYjAz7W+z/Pk1JSLoiU9pfco74+a/LLhLPqb/k5YE3BITHNZPAi71p76BSfZCA89qtb03k043slo2+/HvBrXdzNf12rB7AH4qaiTJrsK1LxTwlyJNuXef311CZywByrOGa4+rDjkDdAJnZtCY1O8eOhgEltB4hVVqtOLFao1MJQ/pCRcKCLXOnb/t2B7TR7wxx0OfLc566OPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7LG7/wLOFe8/Mu52FLx9+uc+gxfDHeQDPJap9EXJEk=;
 b=q/jx2Jr8cDR6DfS0ShR+iQJXi/IP2xRnWOG5LOg5Nk3fNkvM+bO78RVUoTCDbal7nWdT6lG9MbXqY3mUkrBMZnZEUydGfy3CdqlAmrX7tDN783ormr33nTxuZbwpSxbNU1RdEozjIj6uEP52cM/8XP3ZfqXiZPNO6LYq2uMuHBM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, Henry Wang <Henry.Wang@arm.com>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Thread-Topic: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Thread-Index: AQHY36n1ImS1A0wmBkizaWL20LNyZ64NqNcA
Date: Fri, 14 Oct 2022 10:02:36 +0000
Message-ID: <79dc0e1a-8f8e-a05a-3db1-5163537c66e7@citrix.com>
References: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
In-Reply-To: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5919:EE_
x-ms-office365-filtering-correlation-id: 651fdb18-0dfa-44fc-f242-08daadcb38e2
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BIO2HwqNv1x5YBj2zhUQCgXqnUpi+zYPnNRJCtp1PSqtqjMFhKgh6Ff0FU6T6ITcVkOTHkRH1hQ5gBhiqwgFKGtqbbmMQMXwYjMIJXTsh7x7waeUMqsg+yGevxFYdb1LpKEqgbAgUvsspOtab60RuAfUqXbRjoXGDdaPljsA4I1h7alKyHdDCaDL5V44qaajPqdwatJqtuWqsnYbICxVsqyIYDhd6ZbmihQb2lPyy+3ABnGQmlk7OPnVNDUcsNT9Z9E1OBc+9GAH+emxJvvW8X1/taVER6SolVlxaMR2fVeeBgW/xKIFdo8HDhfKkJrzV48ADPvv7YXj/wV8DFhFilPMnFblgVbdE9iSMuWNFNIb0A42xZKuF42Tf6d8Wo++rwWUdiMZlAMwvXi6SGoNhILZ1ygT3i598lKtipwBTSbNKaXVVwPJM1ThCmZEfZjJq8Kl4EpgD4AQwrGLnh1ruILS68NtBPVmBvZ8c3PxghuhlOYieqBkUv6IkgJIOvcJw0/vpmGUpr0GoMWX1X1Ys32GTsVdYcYseSWaSe+YwVXbjF7LT4dn1B22M8DSQSd4T6aPyGrTyhAfmw2VjfpVLUmGkHVfZ/26vPiGa2sVRIgsqvQmHlWPMFACttRg3irHSnYHcdmNDXlJKT2eb1hX60B4mhZzQyf05mM3E8vFA4IlGhnXpXuBhBVcmEsvrcrPPjZnZ4ZBUj1Tefj9luYsG3VoDI0/VdlfQso93ApTINB2Py57waKochXA5tKYi3n+Xro8PngFRE4nY8FnxO7DzDE+SyuNsbs9ZXb2rKv4CJClL76owbf7ms7QOt8FRL+bHS9odSpoVQJuP2bDAkEKWA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(5660300002)(2616005)(2906002)(6506007)(8936002)(186003)(26005)(53546011)(41300700001)(31696002)(86362001)(6512007)(82960400001)(38070700005)(36756003)(83380400001)(38100700002)(122000001)(316002)(66899015)(54906003)(110136005)(478600001)(76116006)(66946007)(31686004)(91956017)(6486002)(64756008)(66556008)(66446008)(4326008)(8676002)(66476007)(71200400001)(107886003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDIycFVOOEJqWFZkTXo1Mkc1V2RydE1QeU5TdnJMejBUYjBVZzgxV3BDclJj?=
 =?utf-8?B?VEU4VWdJYUZaek1CSGwwSThpV0t3eUg3ZEY3eXNWSldaZ0RpLzVpWlM1N1RM?=
 =?utf-8?B?WDhxU0xGWktrZFVDdnE1Nm10RXVnTHp6V2xraTlzT0RtVjd1dnlnRDIxL3FO?=
 =?utf-8?B?dHJDTHdWTmFzV2hwS2ozK0M5aXRpckE1cElxQnpOai9hcTJMdWRKUW9KWDZo?=
 =?utf-8?B?WE0zYnptd0NvWHBBTksyK2ppcC8wODR5Q0s4Z0duU1FRdEtrQU5pR2l0MGJy?=
 =?utf-8?B?b1dZT0F0eGQyZGJqZW12bnlKcGVYb2RLL1JQTm9udU5XVUN4em8yWGhjbzlk?=
 =?utf-8?B?ZUgrRnlsWjlEVGp4TC9McldvMFMvUjQ1TEh6eTRVdmY4QTMwNnBKNm0rYjlv?=
 =?utf-8?B?S09wYVV2aXpYUE5ORCtRWEJyMlNXU2svaFF4UC85Ti8yYVRvMGh1NXJpQkx5?=
 =?utf-8?B?dDEzbFpiRFZrU1BqWlIxNmhmUDRUeG1aM0xlOWhhWUNBcTFvYkVPdDBVUE5R?=
 =?utf-8?B?UmRXZHBBckF1QzlzMk5vZkZkaTkrNTFnUjZsTFJMSmpGVXp6dFpFcmFPYUFI?=
 =?utf-8?B?WC9ReGR5RlFKUXRvVWs0YVlva2IySit4MzhrS3J4TGwwaWxGWkNHL0JGYXhV?=
 =?utf-8?B?UHNlWi96VmNVQmYzMmdSS1laMkxHYlRzRS9XaFZVWnIvWjA2NWUzbWdMN3Yz?=
 =?utf-8?B?N2QzMlpKTjA5R0FlMEE2YWMzT3lKemJLTTVzNkpwck9WbGNMRXAxSTEvVzcw?=
 =?utf-8?B?TmtKa24wZzdPMVo0UGpsN3MraWthTUhhN1NzZnd5Mk4zN1NyQ2tMczBrZDEz?=
 =?utf-8?B?RHVxTmRVc3NWWWZJV1A4SFdIQkRtdXZUN3RRWFRVN01MY3QxOGRhV01zK0ow?=
 =?utf-8?B?UTN5YU9VbDlJZ3Fuc014aVVSTnN6OGt5WFAxSEZkUXpLVHlwa1FKalliajE2?=
 =?utf-8?B?Wjk4NWUxeHovVnJhT1JodnJPQTRYUVVGd2pFOExaUXB0WmFJSWVSODU4cnZp?=
 =?utf-8?B?WEtUekMveWJydHh5aFVLVXNlQkFBK1ZwUEhUT0RsY1hhVkU0SUticDc1aFJH?=
 =?utf-8?B?NWhVQ2xFaG44U0ErY0lHckxVSjNJTGpHZmcxakZTM2pjR1owVXpCdm0vcGdw?=
 =?utf-8?B?NElIZHZVem82Kyt3bVF0V0hzSUtueG82N0FyTVlIYVMyTVYrUlFrTE5ydWpT?=
 =?utf-8?B?M0xFczMyUEJiYTA2ZHViNXltUGRETi91SHV5OW95OFVaekR2bnBDbjVjR2J6?=
 =?utf-8?B?Uis3WDBsdG13MnVLZmZLZE53cXhrc2I5ZzluUjgwSzR1RGsyOVE4NytPalJ0?=
 =?utf-8?B?S3BRU0swcWtoTUkwYUgvMURnUjc2d0NLU1pCSlVReEFXTXRsTTJWK2NPRzJ6?=
 =?utf-8?B?Wnk3SW1kc1JQcitWMUxNWHdQczJrY0x5UTg3VnFDeE9oNFdHNWl4cER6MVQv?=
 =?utf-8?B?c0RoYkk0WnlBQWlIUE4vdU94T1pVeTd5WGlDKzd3dVhpZmpoZ2xmbWRaSXdC?=
 =?utf-8?B?SFEwNzN0VytkSUxoUVpWelVvSHY1OFl5WEFaU1dQUmVLbTRzc3JmTkFvczFP?=
 =?utf-8?B?QWgzbVhEUU9xb1duMVN6eTJSK214SUFXSnUxR05ZWEpDaTZDb3hKd3pZNlZT?=
 =?utf-8?B?dGZ0MER4eFMzSHRJanRVV0JxZWs1ek92TlBlRG40OEttdjNTSUNmZldXZHlZ?=
 =?utf-8?B?bmVZdENaM3liR3lQendEUS81bXFoL1lRM25oSUx0YU9Qdk9WYkpCTEEzc3Jl?=
 =?utf-8?B?SUE5a1ZxUHBwTGN2UFM1MFp5NmZaN0NleURwdk0wOWN0a29JRW5pajhrZTVZ?=
 =?utf-8?B?UlgzTzBYUWdlUHFSOHVrZWtMMForVllRMGMyc2NjSHJVMU5iQm1Cd0NhVmVO?=
 =?utf-8?B?RzE3VVl4bmcxNGk3c29OVW5tNFBtV3hwbFBVSW9xeVVFZHBKMXA3TElrd3Vw?=
 =?utf-8?B?QkJqK2tNTkZmY0tXRitRMTQrcU9uR0ZHTmg5QnptYkszWUQ4RFFUTTdCblBB?=
 =?utf-8?B?UUlvMFJBOHNtcUh5UENTcG5lTFRPSmNJd0E4Sk53NVdUeXVtVHNuNERUUDdF?=
 =?utf-8?B?MzhBRk5PNVJiSnR1N3hjV3MxbCtvaGQvWjBXWkV1ekpFdGdnaXcyYkgwRVgv?=
 =?utf-8?Q?23e7pibmgTQVXRq3czrfLYa/2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F4C113223F0EC4DBD7858320196EA90@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651fdb18-0dfa-44fc-f242-08daadcb38e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 10:02:37.0397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NKQu5Y8y5v1EMc9WTPOCL9yaVZcOyb4lQXGNQSN5Vk/ou/Mtepzisj053a6n+Ddx4qqipvX+Hosjmp7iE5VUxAPoaXKrfK1SencmIYBYaRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5919

T24gMTQvMTAvMjAyMiAwOTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSBhZGRpdGlvbiBv
ZiBhIGNhbGwgdG8gc2hhZG93X2Jsb3dfdGFibGVzKCkgZnJvbSBzaGFkb3dfdGVhcmRvd24oKQ0K
PiBoYXMgcmVzdWx0ZWQgaW4gdGhlICJubyB2Y3B1cyIgcmVsYXRlZCBhc3NlcnRpb24gYmVjb21p
bmcgdHJpZ2dlcmFibGU6DQo+IElmIGRvbWFpbl9jcmVhdGUoKSBmYWlscyB3aXRoIGF0IGxlYXN0
IG9uZSBwYWdlIHN1Y2Nlc3NmdWxseSBhbGxvY2F0ZWQNCj4gaW4gdGhlIGNvdXJzZSBvZiBzaGFk
b3dfZW5hYmxlKCksIG9yIGlmIGRvbWFpbl9jcmVhdGUoKSBzdWNjZWVkcyBhbmQNCj4gdGhlIGRv
bWFpbiBpcyB0aGVuIGtpbGxlZCB3aXRob3V0IGV2ZXIgaW52b2tpbmcgWEVOX0RPTUNUTF9tYXhf
dmNwdXMuDQoNCkl0IHdhcnJhbnRzIHBvaW50aW5nIG91dCB0aGF0IGFyZSB1bml0IHRlc3RzIGlu
IHRoZSB0cmVlIHdoaWNoIGRvDQpleGFjdGx5IHRoaXMuDQoNCj4gVGhlIGFzc2VydGlvbidzIGNv
bW1lbnQgd2FzIGJvZ3VzIGFueXdheTogU2hhZG93IG1vZGUgaGFzIGJlZW4gZ2V0dGluZw0KPiBl
bmFibGVkIGJlZm9yZSBhbGxvY2F0aW9uIG9mIHZDUFUtcyBmb3IgcXVpdGUgc29tZSB0aW1lLg0K
DQpJIGFncmVlIHdpdGggdGhlIHByaW5jaXBsZSBvZiB3aGF0IHlvdSdyZSBzYXlpbmcsIGJ1dCBJ
IGRvbid0IHRoaW5rIGl0J3MNCmFjY3VyYXRlLg0KDQpTaGFkb3cgKHZzIGhhcCkgaGFzIGFsd2F5
cyBiZWVuIHBhcnQgb2YgZG9tYWluIGNyZWF0ZS7CoCBCdXQgd2UndmUgYWx3YXlzDQpoYWQgYSBw
cm9ibGVtIHdoZXJlIHdlIG5lZWQgdG8gd2FpdCBmb3IgYSBzaGFkb3cgb3AgdG8gYWxsb2NhdGUg
c29tZQ0Kc2hhZG93IG1lbW9yeSBiZWZvcmUgdmFyaW91cyBkb21haW4tY2VudHJpYyBvcGVyYXRp
b25zIGNhbiBwcm9jZWVkLg0KDQpBcyB3aXRoIHRoZSBBUk0gR0lDdjIgaXNzdWVzLCB3ZSBkbyB3
YW50IHRvIGFkZHJlc3MgdGhpcyBhbmQgbGV0DQpkb21haW5fY3JlYXRlKCkgKG9yIHNvbWUgY29u
dGludWFibGUgdmVyc2lvbiBvZiBpdCkgYWxsb2NhdGUgdGhlIGJhcmUNCm1pbmltdW0gc2hhZG93
IHBvb2wgc2l6ZSwgd2hpY2ggc2ltcGxpZmllcyBhIGxvYWQgb2Ygb3RoZXIgY29kZXBhdGhzLg0K
DQo+ICBDb252ZXJ0IHRoZQ0KPiBhc3NlcnRpb24gdG8gYSBjb25kaXRpb25hbDogQXMgbG9uZyBh
cyB0aGVyZSBhcmUgbm8gdkNQVS1zLCB0aGVyZSdzDQo+IG5vdGhpbmcgdG8gYmxvdyBhd2F5Lg0K
Pg0KPiBGaXhlczogZTdhYTU1YzBhYWIzICgieDg2L3AybTogZnJlZSB0aGUgcGFnaW5nIG1lbW9y
eSBwb29sIHByZWVtcHRpdmVseSIpDQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPg0KPiBBIHNpbWlsYXIgYXNzZXJ0aW9uL2NvbW1lbnQg
cGFpciBleGlzdHMgaW4gX3NoYWRvd19wcmVhbGxvYygpOyB0aGUNCj4gY29tbWVudCBpcyBzaW1p
bGFybHkgYm9ndXMsIGFuZCB0aGUgYXNzZXJ0aW9uIGNvdWxkIGluIHByaW5jaXBsZSB0cmlnZ2Vy
DQo+IGUuZy4gd2hlbiBzaGFkb3dfYWxsb2NfcDJtX3BhZ2UoKSBpcyBjYWxsZWQgZWFybHkgZW5v
dWdoLiBSZXBsYWNlIHRob3NlDQo+IGF0IHRoZSBzYW1lIHRpbWUgYnkgYSBzaW1pbGFyIGVhcmx5
IHJldHVybiwgaGVyZSBpbmRpY2F0aW5nIGZhaWx1cmUgdG8NCj4gdGhlIGNhbGxlciAod2hpY2gg
d2lsbCBnZW5lcmFsbHkgbGVhZCB0byB0aGUgZG9tYWluIGJlaW5nIGNyYXNoZWQgaW4NCj4gc2hh
ZG93X3ByZWFsbG9jKCkpLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBXaGlsZSBpbiBzaGFkb3dfYmxvd190YWJsZXMoKSB0aGUg
b3B0aW9uIGV4aXN0cyB0byBzaW1wbHkgcmVtb3ZlIHRoZQ0KPiBhc3NlcnRpb24gd2l0aG91dCBh
ZGRpbmcgYSBuZXcgY29uZGl0aW9uYWwgKHRoZSB0d28gbG9vcHMgc2ltcGx5IHdpbGwNCj4gZG8g
bm90aGluZyksIHRoZSBzYW1lIGlzbid0IHRydWUgZm9yIF9zaGFkb3dfcHJlYWxsb2MoKTogVGhl
cmUgd2UNCj4gd291bGQgdGhlbiB0cmlnZ2VyIHRoZSBBU1NFUlRfVU5SRUFDSEFCTEUoKSBuZWFy
IHRoZSBlbmQgb2YgdGhlDQo+IGZ1bmN0aW9uLg0KDQpJTU8sIGJsb3dfdGFibGVzKCkgaGFzIG5v
IGJ1c2luZXNzIGNhcmluZyBhYm91dCB2Y3B1cy7CoCBJdCBzaG91bGQgYmUNCmlkZW1wb3RlbnQs
IGFuZCBpZGVhbGx5IHdhbnRzIHRvIGJlIGxlZnQgaW4gYSBzdGF0ZSB3aGVyZSBpdCBkb2Vzbid0
DQpuZWVkIG1vZGlmeWluZyB3aGVuIHRoZSBhZm9ybWVudGlvbmVkIGNyZWF0ZSBjaGFuZ2VzIGhh
cHBlbi4NCg0KRm9yIHByZWFsbG9jKCksIEknZCBhcmd1ZSB0aGF0IGl0IHNob3VsZG4ndCBjYXJl
LCBidXQgYXMgdGhpcyBpcyBhDQpidWdmaXggdG8gYW4gWFNBLCBsZWF2aW5nIGl0IGluIHRoaXMg
Zm9ybSBmb3Igbm93IGlzIHRoZSBzYWZlciBjb3Vyc2Ugb2YNCmFjdGlvbi7CoCBXaG9tZXZlciBj
bGVhbnMgdXAgdGhlIGNyZWF0ZSBwYXRoIGNhbiBkbyB0aGUgd29yayB0byBlbnN1cmUNCnRoYXQg
YWxsIHByZWFsbG9jKCkgcGF0aHMgYXJlIHNhZmUgYmVmb3JlIHZjcHVzIGFyZSBhbGxvY2F0ZWQu
DQoNCn5BbmRyZXcNCg==

