Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAB4BFD3F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277052.473493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXI4-0000K7-Ds; Tue, 22 Feb 2022 15:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277052.473493; Tue, 22 Feb 2022 15:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXI4-0000Gs-Ak; Tue, 22 Feb 2022 15:41:24 +0000
Received: by outflank-mailman (input) for mailman id 277052;
 Tue, 22 Feb 2022 15:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMXI2-0000Gm-P7
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:41:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1023c65-93f5-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:41:20 +0100 (CET)
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
X-Inumbo-ID: e1023c65-93f5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645544481;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j//yNoyEQH6EQXePyPv7c9hng7R+Q3F6KxnLiVtvXSA=;
  b=KA+G+SOoBSN4+Stp5TJDyqeukXvHPH4XmuQVRjzDJfV2Y6s9TJp7Q8pw
   NarVTlIxh32iQnHnfsikh30hGlJpXfdXmqKBbuZFMNYkbKJFANWubXoNU
   NHWHWiQYXPwCEdggW+OkzlY4AshdZAoowO9GGLO7NRcRXctXvfsAl167n
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65139587
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uyQOZKLgy8oyK8HyFE+RJZUlxSXFcZb7ZxGr2PjKsXjdYENSgTBRx
 mJNUGiEa/nfNGegKNB3aouy80IA68TRxtFgQAFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NQy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Mp9kbKBTRc3B7PNutkYXEdnFRNBYKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6uHP
 JtEOWUHgBLobR8THFMcGc8HxcS0g0vVWABHsWu+nP9ii4TU5FMoi+W8WDbPQfSISt9ShV2wv
 X/d8iLyBRRyHNmW0z+M6H+vru7JgyLgWYgWGaG49/hlm1mazCoYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvAMYWtdWO/037keK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neShM/gDzFrtLyTSFqe+62SoDf0PjIaRUcdYQcUQA1D5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ0Mveol5qGr42nZghCRo5eXcQgH2VjYCzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHQsF5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fW4fTgGfqqNBjarXnSXXFXclM2JTRTNt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGc2nkUX6jODCPSb9pVI53L2mNLtRAESs+li9z
 jqiH5HSl0U3vBPWOEE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZETAy37zgCN9CWtuhY9CH6YKkU4PrrI7lqcsF
 6FfEyhCa9wWIgn6F/0mRcCVhKRpdQixhBLIOCygYTMleIVnSRCP8djhFjYDPgFXZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:6cbn66iTzJ8irOh5yuoY/yT95HBQX3R13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICRF4B8bsYOCUghrVEGgE1/qt/9SAIVyzygc578
 ldmsdFeaTN5DRB/KXHCUyDYqwdKbq8geGVbIXlvg9QpGhRAskKhWYYNu/YKDwMeOAvP+tjKH
 P23Lsim9PUQwVwUi3NPAhjYwGsnayoqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+WemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aKSARcR4Z
 vxSiUbToBOAkDqDyaISNzWqk/dOQMVmjrfIJmj8CLeSILCNWoH4oF69P1km1PimjQdVZdHof
 h2Niuixupq5VmrplWN2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZKIMvW0vFvLA
 BVNrCV2B+WSyLvU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegI28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1D8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/sukaSReoeMM4YDHRfzOmzGyfHQ0Mn3KverLs
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="65139587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz5/IA60GEyyu2qKUdRbxrHn7LUfs97ToTIz+lYAgKbiywOtyguSwZ88/8El6IiHj0dRAdhUd6Nu8GsPqn8jdUQWtvlYPa7jqnemiLcwIgVYttQa3SVMk3hQosRUivOfRTmb7/GKFIivLZOg678xZ/vQFxmI1Mtwyz9UKb4Cw6hQIYQi/+0fPRRxV9obLIcZWDvM65xr1tkhFMRPId/+Utbku7c6pd5Fi22r8Q8fE0dcHO83bkqKyKLXBG0KlzwbxPYeaUd8LvFrKC1uJqh1QxMEJJy2VCF4AJbnt6eRAjqJsdAT6C/lmBmvh4WvGfoIVVVRkPSYUyQjLcXJ97v8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j//yNoyEQH6EQXePyPv7c9hng7R+Q3F6KxnLiVtvXSA=;
 b=JXHdfJtv0uu94b+/7yOdzIyHDQ0JCa42jcZJ9ksYzc6OPGkzPl6mp3spH9+wu0KIvtcqVjrEI3f/9bNUIcxYaz8tiVxGTRJPdQIMGuQPLrFDE078WoK1O7dRau8scwR6voGibzRP3gaOrI/X+kG1BYZO1SRJnQr4wIrzMwxmFxkBtjOR/3DLpQbGsbdcf3+MwXtnTZFxSxJ+ZABJbmc69iQu7I0axoJyAd+zVxqYEjKaKEVXeJjoWmaS9QnRgNAd0Kv4UseyOfnnpvylmif7RRma9F5UTtlNSpffj/H4Zz5EDcowf+iNPW7/h4lvpXvXgk3RPgx5XFiorPlSW13VTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j//yNoyEQH6EQXePyPv7c9hng7R+Q3F6KxnLiVtvXSA=;
 b=Tul+K62tPWSlIsn7cqrq0HzNEM4QytbA3iZ2Zhdb9uIruRsmJWS1RsWFH7eZrpT/ekHg+R4Fys15FxL1S4+3wvzubZx+u1mAiNWNn9aHMNC9XzWEfeDE1vkNXR2wcU1PMlEJ5wWDdAFFSCoSCCxXDrvyPoage0yp7H8eG+qilkU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Julien
 Grall" <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Juergen
 Gross <jgross@suse.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 00/70 (not all posted)] x86: Support for CET Indirect
 Branch Tracking
Thread-Topic: [PATCH v3 00/70 (not all posted)] x86: Support for CET Indirect
 Branch Tracking
Thread-Index: AQHYKADEI2PNE2WXy0mcZVRJyiMFGKyfshiAgAADJoA=
Date: Tue, 22 Feb 2022 15:41:16 +0000
Message-ID: <bbb08d2d-f76d-c21f-34bb-9f6bf711505d@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <a1106b26-ffa8-2b8e-5063-c2e1059b46fe@suse.com>
In-Reply-To: <a1106b26-ffa8-2b8e-5063-c2e1059b46fe@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50c2df19-8116-446b-1289-08d9f619c35d
x-ms-traffictypediagnostic: CO1PR03MB5745:EE_
x-microsoft-antispam-prvs: <CO1PR03MB5745EE385409F6DC08C257FFBA3B9@CO1PR03MB5745.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iuzXYhEt/aUqr2mFlLPcFItadsLjyC7RnWqbbJSOxm8sz8geILkc2ux0NE/Noe/8yaD4lVCnzWjLr6bjyhEA385FkDdn3k6rnPxYHK9I9pfDDGT1VczkjUc0PRm+dyKZf6i2CM0u3jtFz3U/Jzgk8LU95QrN+uOZl+CJ92WXzQvR7ynYKqs1lGE+sC6emEn3yY5w1Yxy2zl9fuoqPS2pgWFu2AYNvDUKLfCocEHuCm7A87x7DYnWvq3erpDbbDktIAcA4Zil1fGyqcggmpEp5+3u4+oSERGHn01giETbX/y6aMDY5QypUFTvZd+uTGdsii57/zI1eeRqb6gBoRkS8AW94cybvgSMEdKWVX5Rx8YrbKp+pPt87lpP71don7+Ikk1yJx6Qkzdfhhm/bWsXKtAQ13HbrHut/9YIUhOv7ZaUOjMP72OPvGeaR5BLEaoL+e1paFNW2pLcl31LvZyPGFlNRvUbxuMj6OFN0ZV0g0y11XSjQER5cvBt0zfGb/ohGwrcPZRUk3e8QVGLj13HnDm0nBdd2hgObvDKbRVo4fnv8ydAcywtnZZ1g0Lu1uBmCs/2N6AYqisE93f6gJcWBFh77LMIhgp+El2f1200TSg0SgrYg2upRcd2dauET7ZTwjtxug5LXtaovfW4HNDvfq5Q8Aap0slFtU0bzFvPRR8MhRt+8q90HMfDdv9gFCx4oRqDWlsiohETgtFRUrPa4ZVxTUgLnFA5Z215EjpPhGqFDT6czrPwCZbn2rAFH4oACOjlhQGm5rlrnGm6hiA3jg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(6916009)(31686004)(31696002)(6506007)(54906003)(53546011)(6512007)(186003)(2906002)(86362001)(71200400001)(508600001)(26005)(316002)(2616005)(36756003)(6486002)(8676002)(76116006)(82960400001)(5660300002)(4326008)(38100700002)(38070700005)(91956017)(122000001)(66946007)(64756008)(66446008)(66476007)(66556008)(4744005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmMxSDgrRUxESGxIY2t5KzRXV3BCaUYyTG5uTU03aDlJWFd6S1NNV09vYXBi?=
 =?utf-8?B?M3FaZ0RpNjJiT1VKTTNvL2kzZHNPaHAxU1hEamRjT1prdDdyZC91Wk04S1di?=
 =?utf-8?B?aXVLVWJyUjByT3RxOGNXaFI4a2hqd3J5UkJESU1palZicy9pYmhEQ1hEYUhr?=
 =?utf-8?B?YTJxdzhHdlNSM2RuR2FEallrNnNuZGhjNldVQzM5V3M2RUFSSHBVT3ZEZlNx?=
 =?utf-8?B?azdCbTZQT0pwOWJvN2ExYWpUY0VqLzhiM0VQMXF6UnRjK1ZtK2I4eFQ4aXlH?=
 =?utf-8?B?WXBLYmhwQ2xNY0I3RTVwTVo5K0FxcjFPUUdqNVdNS1NzL09helNyb3FYMW1u?=
 =?utf-8?B?bW5iZ2RxM1NWbmMrakxMSnMwYlcxTEFpb0tYTHhIRmhrQVpUV1h1MmMxYkU4?=
 =?utf-8?B?L1daOXN6bFE4TWNKZUFKend1TVhTOHl4a3VrdDZsT3ljNVYvMlc3OG9jd2h4?=
 =?utf-8?B?VDhkTXIrTGJSWjc2aEpiajZPbnF2UDJ3aHdsaWpPSk5wTkJobElMWW9ucVlq?=
 =?utf-8?B?MitOdVpQZEp5UlJFZHptajBpcG12RU5ld1F0TGpaZDZrL09zZ2FqYU1hdGs2?=
 =?utf-8?B?cFBvNjNPKzRxeUt3djVnZE5aYnFDS2d1NldWNFlGMFVVV2w3QVZqeFp1VWoy?=
 =?utf-8?B?ZStrSHdjT3dKcXVpZmZ6WmxIdTVoNmNLRWVJYWovOGdDazd1UkpjTU95MDB0?=
 =?utf-8?B?ZzI3T2U1cElUVnQzbWtBQVZ1aFdsclVtOUdQR21Yc0tpOXBZMFpybGU4L09p?=
 =?utf-8?B?QlZrYWcrczNCOTBDOWpkeER0S1lOakI2eEVwMEs0U3RIOHZBUFoxdXhxRFpy?=
 =?utf-8?B?QStkV2d5RG1pTzJIYWVOWGhOcmRlNVpzdkNEcHdCRkRFUXdLdzc3ZzdvSjZP?=
 =?utf-8?B?RjlRVzl6MFhybTlIM1U1R2QwNHBnWkUrR29GdzVCV1d0ZEIvK3NUcEZBR2NM?=
 =?utf-8?B?SXl1ZU95NmlnVXJ2b2MyMmpUZ1M1aGU2Z05mTFVOSVJnNmR3NjF0NHoxcDRJ?=
 =?utf-8?B?QXlzNVRBYUZGNjZzK3kxdlNiQkEvQm9BQytIWEJ1c3duenM4UlBqTXlTZVpN?=
 =?utf-8?B?dTNsTkFrQUxiRjlFQS8wSEtQNTJyTFJrZ3p5OXY1MXM1bE8zUk9yU2pvWFJU?=
 =?utf-8?B?enQ0bFptWlZhcXhKd0RKZE03cElOM2QzeURRVUlNVDlNWFZMdW4yR05OelVX?=
 =?utf-8?B?cE55UkQ1ZElUQnRqbXBpMWdiN0UwYStDZmNqK2ltODBlbXdCU25YOWkvcExo?=
 =?utf-8?B?R0Q1QzFCc25qZ3Z2WEJub25xeVlPTi8vNXBXM1JmMlBuenVDaFhXQTJBVzJI?=
 =?utf-8?B?QVd3WEpUc2k5NU5wV3JReDFFbVRSVFh1dVlOb0g4Q0IyT3RjcUwzRHQ5d2pX?=
 =?utf-8?B?bkkrOExEN29SQWc3UWhHd09WeTMwZWNZcHBYVTNpci9MNVd3TjAyUlJDc1RS?=
 =?utf-8?B?NU5rRmtRbGlSZVNmMDQ4bk5MSjk3R3ZoTThROGRQVithYXNqb2swZWR2TEp6?=
 =?utf-8?B?S1F3N3ZDV1o5RWVSczJYc3hoa0t0WlY1Vmt5aWVFeDBCZDk5ZWU0aGV4cTFU?=
 =?utf-8?B?RDQvMTBkbEtzSkJGcHFwR1lrN3piQkUxZS9sRGFNUXN1d2hoaVNYZXdJcG5u?=
 =?utf-8?B?YUVEcldEYzljcTBoanl5RkRHajFCREZaa05NZmkzOWozZW4zRE0zUldJTDZB?=
 =?utf-8?B?REYrNzFWU0RLTk5WZXR4TUN0UXFNWExEeUl3K1NDNWtsZkZvSVhEM0tFTmlm?=
 =?utf-8?B?a2lESXJEckdFQWpmaVVicFRqbXJGeXZrcGM4UzltZXdUZnNZcWFtR2E1alg2?=
 =?utf-8?B?Z09MT3A1cXhBQUsrcDFnUnlEUk5iQjQrR1Y1OHdWTzZUVU5idFB4TS93azc0?=
 =?utf-8?B?K29EVjhsalgwMjRQS2piSGxSZFlmYUxYbGtmUTNoZmVRT092eUVSUVlUS3Yv?=
 =?utf-8?B?dlNjdC9GeWR4Tkx3bXV0a05iMys2YnRaNnVuT2tZOStnNHRjN1hMTHV2VVor?=
 =?utf-8?B?RytFeHZLRENxNGgwbDg5dDdZdXg4OUhUKy9ZMVFPQlpKeC9ZdkxMa0d5OVhs?=
 =?utf-8?B?R0Fhd3V0R1lSdURZVkJXSE5KQmJFZ2pRSjd0YjNBaWQzM01sc3JUbXQxc1BZ?=
 =?utf-8?B?TU5zdWdSblVXOFpjOUdieFMyaSt6WVJrWDRrdDIvbFF5WjBJYzVyaGdpdU1O?=
 =?utf-8?B?WGlrUWl0QTU0TVV0dFFqV2JYMVBFa2xaR05FWmU5c1drSWU0TGJtSjVvSkM1?=
 =?utf-8?B?eUpyeGozb0JPMVozcDVUUE1TZVh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1B8F4BED09064499197A05DAFC9B28D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c2df19-8116-446b-1289-08d9f619c35d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 15:41:16.0970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b29hfncY5q6IH936eD8JHz/uDTRhGTFJS9b+gC0uSVn7JDnrLrbX8YJB9HcopjTqfIJhv7w1b3Ae6Nfr5R9uBn3fIh9kYyGna64uMWuULv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5745
X-OriginatorOrg: citrix.com

T24gMjIvMDIvMjAyMiAxNToyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjAyLjIwMjIg
MTY6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUbyBhdm9pZCBzcGFtbWluZyBldmVyeW9u
ZSwgSSBoYXZlIG9ubHkgcmUtc2VudCBwYXRjaGVzIHdpdGggY2hhbmdlcyBpbiB2My4NCj4gQ291
bGQgeW91IGVudW1lcmF0ZSB3aGljaCBvbmVzIHRoZXNlIGFyZT8gT3RoZXJ3aXNlIGl0J3MgaGFy
ZCB0byB0ZWxsDQo+IHdoZXRoZXIgZXZlcnl0aGluZyB5b3UgZGlkIHNlbmQgZGlkIGFycml2ZSBp
biB0aGUgcmVjaXBpZW50cycgbWFpbGJveGVzLg0KDQpPb3BzIHNvcnJ5LsKgIDEsIDMsIDUsIDYs
IDgsIDEyLCAyNiwgMjcsIDI5LCAzMywgNDYsIDQ3LCA1OSwgNjAsIDY0Lg0KDQpBbGwgdGhhdCBJ
J20gZXhwZWN0aW5nIHRvIHNlZSBoYXZlIGFwcGVhcmVkIG9uIHRoZSBsaXN0Lg0KDQp+QW5kcmV3
DQo=

