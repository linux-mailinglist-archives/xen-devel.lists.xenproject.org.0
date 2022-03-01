Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC684C8E0C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281566.479956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3gw-0002qk-9y; Tue, 01 Mar 2022 14:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281566.479956; Tue, 01 Mar 2022 14:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3gw-0002ol-47; Tue, 01 Mar 2022 14:41:30 +0000
Received: by outflank-mailman (input) for mailman id 281566;
 Tue, 01 Mar 2022 14:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP3gt-0002mE-UB
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:41:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6e9db5-996d-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:41:26 +0100 (CET)
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
X-Inumbo-ID: ab6e9db5-996d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646145686;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cYvcvTlc7QjuOAplFLIHIwXoyIbJYXN1vmW4gf/g2bc=;
  b=Py+xDWdEy8ti45laaARgU8exCWwG8zVqUm32PqUyhH22jlYNxe95Kt6d
   3YzuSw5xfuGc57hxLNdyxMLDJ43llOJILSsz5CU0aPeIq2MDn2qt/VRW3
   KRs8lBrZIrSbKyRCSrAeJKlIry2RnhhLkCLQl/mTQM8HulDZr8oFrUr6x
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65224444
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qIwR8K16Mt4cKl+dF/bD5c5xkn2cJEfYwER7XKvMYLTBsI5bpzQHz
 TdNCmiAaamIYzf1f991aozi9E9VsMWDn9FrHANrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1xu76UdFkgPJaShcUhUCECPXljZrZ/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiDP
 ZBFNWYzBPjGSyxCHHgsDao/pcrymSmufTAD+WiNo4NitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoNEJWo+/gsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4L+MYzDzTw6jvvRu4Oms8FBAZdYc9jZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 lBew6ByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs3aplfJ2OwO
 RaC0e+02HO1FCHxBUOQS9jsY/nGMIC6TYi1PhwqRoAmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKPoN5LcAtTdiBT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:q53S1qMSvcrII8BcT2/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90DHpewKSyXcH2/hsAV7EZniphILIFvAv0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUiF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfBLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LPErXoBerR8bMRiA0HkAgMbzaFBOO
 gg5RPpi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4bkWUzxjIdLH47JlOz1GnnKp
 gbMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Tol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+83JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9NllVnQ6dvf22y6IJyIEUHoCbQhFrYGpe5vednw==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65224444"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfgK09031yvhwFnIOkYdYvfK/I7IoMfxVxSlRsKCy96zx9/xFQXt98HzrTCcMOeZ1naDOwLrMARbZ1BH/xt0Lo/hi9ISkHvGG70doUBgOBaRgbEBePbESOggD1q3ecm96saycg2XI+hsgaHa+jqsuuZYQinfibUfOSskqdbgA9nAT04/swulkMdcRX+mDepL/4Vtig9bH8O/q034WqPf7uDChvIg4cFLWzDjfwuzTRHoAALRDLY9lnel5azW0h74HP9TB3tjW6Ru/ZQDJZiSJxWePxFY/6edXYX0cRKXwQq2KRlKU5c9GX5MnGpjHtLsGRX+cF4SyV605Y+PRszRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYvcvTlc7QjuOAplFLIHIwXoyIbJYXN1vmW4gf/g2bc=;
 b=agmSLJzK36lQbCJmCps+t/Tjn1dfh2BtCdK+co+rY/JGXuswbHXmee700g637Yi+WzGSeY7f0pMUpNJjqO1o0ZyCbUrTuWtHd6HMslmWWo8KCjRVx1S+s881of971Nd32bYUFIWFR4GXILugnHOUFiiZTQOoY7YxuC8li7KGj6kbUq5V3H4LOL30Vx9fNzEApkOgnmIJTfTREyXIqqhcEpvCM8/shRv/5pH/20CAi1Jq6/CYsKEHZtRgIq0G/ZpqprCEQTXqXehuLpkkKBKIee1NrsGiFjsTwIlzb3aXa8fVQtlszl9HWT/RDcgwYM8mc+jHNMxXumU/yruCrZh7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYvcvTlc7QjuOAplFLIHIwXoyIbJYXN1vmW4gf/g2bc=;
 b=du93A644cCVGlS4pN8zd7EsVN7VpHY71fZiVLKH8GkDAHafH1OfD/kwYR9pQVFLkAZgVM5mkd/rEEdoIuHv1egwtx3/OwvTgzuoz/wOTCt4AMWsdef+1NB7jHwD13af6qunuMTNSgqBuwVQKJBOucJ/Mbc49oYr5jJJTNwCwMAE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/time: use fake read_tsc()
Thread-Topic: [PATCH 1/2] x86/time: use fake read_tsc()
Thread-Index: AQHYLVxVKor9YtEUbkuWag9T3yUcNqyqf+CAgAAS0gCAAAbHAIAAAKIA
Date: Tue, 1 Mar 2022 14:41:20 +0000
Message-ID: <63fc645b-3a03-d14b-c4a7-d6a46dcb8190@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <f4f0e92c-9586-e021-6ad5-718628f88fcd@suse.com>
 <d1c3822e-bec1-d8ca-8954-a4942f5bb23c@citrix.com>
 <2c3bb06d-e4f4-33d8-7972-71dc7d61c554@suse.com>
 <ea46555b-6ab3-620c-0937-401f6335b842@citrix.com>
In-Reply-To: <ea46555b-6ab3-620c-0937-401f6335b842@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57d00f6a-1840-42c0-407b-08d9fb918d39
x-ms-traffictypediagnostic: MWHPR03MB2528:EE_
x-microsoft-antispam-prvs: <MWHPR03MB252879928D66CB1740B3269BBA029@MWHPR03MB2528.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 18i/SdHIRGoJoMNkmpZbfRYQPlM6P4u4yX12dkPImTLrW/aMW+rGulZcnoMRuMUeSOvrgbVLil3HnNBh0W4t/XUxDk/uRlMVkir/AuZ1vByq1OYR3bIBhz0bwmY6mBCBO/wMgfqxds6kykedKgIHHW4bYeThkRZd9FBruNZM9phrHkqlo7BPybSkcIPBpithZU9bJ6lL0ZXTeGNZbQsGqvO9J2tu4UwUpTyvEwt5p7sjtp1+4+9oDo6ufJGu94rFe46BVAu73d3x3zJ22/1nKbx5kJXRCdBtbCqOhBVMqiHqtsHNelBTb+8UzbbLex0YWCuMgiU5XnVyf1d4mOYfq0zOtlr+64puX4MwHrBleYCd1dGi5YPam5gIzjUHlYtflvHEgHBeCNMeHdJhhzC2KwpdVrjhCAnfDF6gBl3Vc24AHNxq575sbkQFuKKx49gxXza1t26nxOPzRFaYdbOcDtC02cYtwFTEzgVzLy38nhWxhirzi6dEYpyd8jkzqYHc7PLQU5ZZlZBzuH+mjzBoItLHru1dFAKMJyhekYvMqpk4TpngLbg3kEMHbeqXqJTzdomOfNQEm1Y1+oDAslnRIDjBLf2VjLfaFTqb/iPlBGaY214PeILc2CBqXwuIwBtb87rwBdQpTnngX866CMbnYzOXKeRbh+z36ZxjpJhfxl6yAo1Ms9abKfB/ewxOxpGwxSI3THTRAl/i8kRhQdGGlY8EyoWwxiMN5VdnMbU4iMkk/jCuxQj9eAHdDIs4yC0c2uWAoCrsD2pJai5v5bNUrA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(122000001)(38100700002)(6512007)(6506007)(53546011)(2906002)(186003)(2616005)(26005)(83380400001)(71200400001)(316002)(8936002)(6916009)(54906003)(4326008)(6486002)(31686004)(8676002)(64756008)(66446008)(66476007)(36756003)(508600001)(91956017)(66946007)(66556008)(31696002)(4744005)(76116006)(5660300002)(86362001)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkVRU0dXN3lpTGNvWStlMENhRXZuNWtDemJhRjBGdTJxM1JMYTZ1R3VuZTlw?=
 =?utf-8?B?UDhVaSsrOHdabUtZbkFtbXlMWk5KbkM5YmcybitvZDc3dThXUVRsdTZkdmNX?=
 =?utf-8?B?TXNLYS9pOWpUdlpTOU5xdDcyRHhjT1IyWkt1QUtyczJ1L09veXVPUndZazQ2?=
 =?utf-8?B?RkdWa1BVVFVZcVVlQVZwRlFSckhxbG1GcmxWeXBhOFRkNVhoRlRYTEliSE9z?=
 =?utf-8?B?Slg4RnZFaE9xL3l6bUc0YkhyT0RLSTN1UnlWcXNBSG1lVlFTNlVQc3NyRXQv?=
 =?utf-8?B?L2hDbGkxTVkzbzcrb2pBNlkySnc2aE00OU9wRVp4YUpRWks3bzBETEpyVVdK?=
 =?utf-8?B?MERBZnBNRThqZzVwd2xTTFdvNkljNzlYQlFaL2ZINWlZenUxOFVhN1pxQ3p3?=
 =?utf-8?B?KzZqa3k4blV1M0hqSDhPNzZJWW9LRStNMXFSUmZZRFNWckRXWWVVSFBWK2tn?=
 =?utf-8?B?OFEzTlZpUkd1YWJHMkF4Q1VlS05TV1VPeHMxNGZhejhwTnFyT3JwZFI0STIw?=
 =?utf-8?B?cE1zYXpUTW1kaUVEZ3F3WkRncVlHdWMyWENZV2t5RFF1cldkdUI2OGlWeW5i?=
 =?utf-8?B?aXlpU21maUxESWpqVzlXUGZLUEpFeStDbEMvdkFmcmlIcHp0anZOaHdFWGdw?=
 =?utf-8?B?OS9tYjNoUDAya3JGL2Q4M3hiVGtyVjM4UlpZTmRoQVBVY245MmkrVHBOand4?=
 =?utf-8?B?V0RKOWRoaWZNZkFYY3VjZm9aOHhpNzNYeVV5WjZXQXZKdFI0MzlHYThrQnpB?=
 =?utf-8?B?cU4yTGV1MmFIOFZiVnVYbjVQcXFNZXFsSytlYnF6ZFN6dVhZblVNbUxEZ0xq?=
 =?utf-8?B?ekxJc0pJSlNwQXkyTXpOWU5lTEJWOGxLODBnOVc0blJaWHRCRDcrUXpPaXJU?=
 =?utf-8?B?SjdQOWZ6dmRrUnRseDU4eEhZTkNXS25uOVRwdHRxY3lzUVNYOHR4aEZxNmh2?=
 =?utf-8?B?M1RVUlYrb0NoekdVR05LNXZlanJocFcxV203QjYzcUtFRG02ZDgyQ1ZYV1gz?=
 =?utf-8?B?YUxScS82bHROc3ZRelB3dEVHdXpBU1VYcGNGMXJibTMxVS9RbGVuVzhaTnhy?=
 =?utf-8?B?Q2d3RFluQmNabDdvQ1dWK0xlZkxCUzlMdnQ1ZVNGRmwvUjEvYXVlQlFTMjM3?=
 =?utf-8?B?NmMrOGdOTWFqZVJOK0tqMTNtUzI2OVBENHNWWkUrbU9CMHhOQVA1YkEydmhq?=
 =?utf-8?B?ZmFZN0gwVWErVU1mME43TCtQbHJBZTZ2dFNzNVc5UDM2cGhpaXp6eE84a2wv?=
 =?utf-8?B?dEZiQVBZbE1OMEZEQXR6YnN3SDdBT29zdzNsQ0RDbityWXp2SldtRkhkN0pv?=
 =?utf-8?B?M3IxMG8zSkY4R05pUG53emxsZVpXRy9FcVNzVG5TM3ZGZGRGcWY0L2h5Qm5D?=
 =?utf-8?B?bUZFWlVpVFNMbFFMUG1pa1pzSjhCMGdVOG1ON1RnR3VkK2N0YWF5WG1OZElz?=
 =?utf-8?B?MUJPWUNoSXU3eFBGUnZFK2pjcUxLaS9aaU1Hc1BiNk0xM01NR3hJeWMwdy9h?=
 =?utf-8?B?dldUUUVQamJ0UUJaK1VTeitCZTF1RU0wcmtmbkNpR1VSYnM2YnZjOXFNNkVF?=
 =?utf-8?B?U21IanRCT3hKVWlqY2k1ZG1FUnVZckswR296cndPSnlNM1h2QzhMaFVGZDNp?=
 =?utf-8?B?cHZneEREVlJ0c3h4RUVtOFVaZG5hcHhvZzMvRTZ3M3ZOTGtDMHBvb2pqbTc4?=
 =?utf-8?B?OTRlSmZnOGRFcmsrTVRsS1Qrc0hMMkV3YjBMUzhlUVJtWHFWR2plTnRUd1pl?=
 =?utf-8?B?cWp0bUxGZHlKREFtUStoQ0o4RG0rMkRwbTVSemZ2ZldCU29qRW9PQmNpL0Uw?=
 =?utf-8?B?SmJZRlBRSm1oSzUrYW1zNVFiczVlMGRKeml3aUp3UzNpZEZFc2pWMFpTZ3cr?=
 =?utf-8?B?eHZjNW1vaVZzcHREOEhhUlYzTmhuUHhMMTBKc1RMWFpwbDZpQlpJTGtZdGls?=
 =?utf-8?B?a2NxRkdpRzJsYXlGejB5S2xZam9PbjFCbVFXclF2Z2RNVnhWZHlZaDdHMlh2?=
 =?utf-8?B?VTgwS1BWMC92dFc2cmk3YWZBTzJlOHBNc05XZHVBbkhIYW9sTWI4NHlIdzhH?=
 =?utf-8?B?ZENLTlBWdWhBcVpFcGg3cEhtNkJuY1FNUzVHTGJrdFJ0Y29XWGpEdjkwbG1q?=
 =?utf-8?B?OWRHZTRaZkQyVDgzNjk3QmZ2L29xSjJNRE5mNkR2Q09BUGdkWW1ydVpFblRp?=
 =?utf-8?B?RUp2NVg3ZHViZ1NBSE84T1R2VTN1MisvajBZZW9RNnd4NEtvKzRIVDBERzgw?=
 =?utf-8?B?bmp5dEFHN0FtMHp2K1drWnk4VWNBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2172C992CE5EB344B99C3951CFC09BAB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d00f6a-1840-42c0-407b-08d9fb918d39
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 14:41:20.7180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjE3z7Ki+lnoJP6k8mqeQNgPYqORRv13cBSM6eXX2wqNGgICzBr/I2c7PmAJqP/IdPl57nIy3Dtzzh3HwB59+xk0l/gb4icum4aV0IUnx14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2528
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxNDozOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDMvMjAy
MiAxNDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMS4wMy4yMDIyIDE0OjA3LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDAxLzAzLzIwMjIgMTE6MDUsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+IFRoYXQgc2FpZC4uLiB3aGF0J3Mgd3JvbmcgYSBwbGFpbiBOVUxMP8KgIEkgY2Fu
J3Qgc2VlIGFueSBuZWVkIGZvciBhDQo+Pj4gbWFnaWMgY29uc3RhbnQgaGVyZS4NCj4+IEFyZSB5
b3UgZmFuY3lpbmcgYW4gWFNBIGZvciBhIGNhbGwgdGhyb3VnaCBOVUxMIGluIFBWIGd1ZXN0IGNv
bnRleHQ/DQo+IFdoeSBkbyB5b3UgdGhpbmsgdGhhdCBhIHJpc2s/wqAgT25seSBub24tTlVMTCBm
dW5jdGlvbiBwb2ludGVycyBhcmUNCj4gZm9sbG93ZWQsIGFuZCBhbHRjYWxsIHJlc29sdmVzIHNh
ZmVseSBpZiB0aGUgcG9pbnRlciBpcyBzdGlsbCBOVUxMLg0KPg0KPiBBbmQgb24gdGhhdCBzdWJq
ZWN0LCBkb24ndCB3ZSBub3QgaGl0IHRoZSBhbHRjYWxsJ3MgQlVHX09OKCkgZm9yDQo+IGV4Y2Vl
ZGluZyBkaXNwMzI/DQoNCmRvbid0IHdlIGhpdCoNCg0KfkFuZHJldw0K

