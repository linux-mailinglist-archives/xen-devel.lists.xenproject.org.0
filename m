Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B442E65367C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 19:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468027.727090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8454-0000e4-8v; Wed, 21 Dec 2022 18:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468027.727090; Wed, 21 Dec 2022 18:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8454-0000b0-5j; Wed, 21 Dec 2022 18:44:42 +0000
Received: by outflank-mailman (input) for mailman id 468027;
 Wed, 21 Dec 2022 18:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p8452-0000aq-L2
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 18:44:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8558a0fc-815f-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 19:44:39 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:44:36 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5922.namprd03.prod.outlook.com (2603:10b6:303:6d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 18:44:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 18:44:34 +0000
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
X-Inumbo-ID: 8558a0fc-815f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671648279;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wF4O0w0qDP1qs4qEbhL0u+BwzXDOD7Xejbnlv4t90Ok=;
  b=KhKSTqv79IqG6YQZ0MF9ETjIEgSYUBywLebKuDKPoAcHVK24qdZUzB6U
   Ns9C6XiQk8Mb7PNo9JTvXPMbj9sPD2Fg67Vgc8euAEO5YxiiTFnph1N4Q
   6T8rBy7yAezaFS8victjoXCMzu5w4S3rYPZMOIUIx6jdbXz/eVoV+2WMA
   s=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 89521354
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QACA3a2V3Kieg9josPbD5eJwkn2cJEfYwER7XKvMYLTBsI5bp2YAn
 TcWWTyHPveNYTSgKdx/PYvn90kOsMPVyoRqHABppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZkPKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfW39H5
 eQ2KxU0NEqFm7qT6pO2TuJsr5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFEZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOqBdhLT+DknhJsqA3Jl14TFic6bkeQ/ebjpHSkQel1d
 FNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLnW0ophfGT9ImGqjqiNTwQGn02
 2rT9HV4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CJsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:Ex2PVK5y5Kvw1vzAhgPXwPzXdLJyesId70hD6qkRc3xom6mj/P
 xG885rsiMc5AxhOk3I5+rwQZVoMEm8yXcd2+B4UYtKOjOW3ldAA7sN0WKI+UyCJ8SRzJ856U
 98GJIQNDW5ZWIRsS6xiDPULz5vq+P3lJxBZY/lvg9QcT0=
X-IronPort-AV: E=Sophos;i="5.96,263,1665460800"; 
   d="scan'208";a="89521354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtgI2jFFWY3RzVwSVVKnjbzN8L7wlys8UR+otGVBrFSkFRcDTk6/GHSpmbaYLsOWa8SuDuhe17MHbYxPfoeHQF9vec8u3ktzL6Ce7LZTE5ot3sGmNM2mpJPUstq0gbft0exRNVGor0iclB/CdPS6sQv9rfansXsnwXG2R1KfmB+8eLz+P56RYrLPU5voq8gbgrhSC9Tnk6mphmGg3xtjzNmgWXZ0qpFDJHbw+LLM/U9qb5A5VXc2VfReU0wv5foEUyi7B5iGKH1E/ufCPkKPBtnMDSwsprj8Gb12Q+RTyUVuaLLgG12BE/WMOeqrHDdzrVJcKtQK+j3IzL13WuZdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF4O0w0qDP1qs4qEbhL0u+BwzXDOD7Xejbnlv4t90Ok=;
 b=WHHZ6lN7sJb2Ymrd35IQYjeeZjVdd9yjDwOJc7pcMQva/NUwP5FWqqpBu4/Sgh5Nc04Pdlk8RuLQhmp7Qe/wxygdMzeJWQYcqwJAYgHb3Rqev+092Vr47Wv38nLXqb1OTnbaMJ4PGafGFNjnSNJN7dnPOE1U1eEr6ix7YU2E8BjziydHtui3et1A7/yORrpu0MRbkvF06N8YRFOr1P3AonPEPXwoIyitfcMy1vIZBy2pSK5yXMkel9csnbROYy5vRHpRimppUEOvHGqoqorChc1ble5xb1DtmroUDCYnOth2hdLiohuk/jfsKajN05nRsoGzI0s/XZkBwqWSjO0YMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF4O0w0qDP1qs4qEbhL0u+BwzXDOD7Xejbnlv4t90Ok=;
 b=FcsnuVhIB18yc2gwsbIyseODA1uYqEpe3ML2S7LEsXk6ITiG5eX9pFIYM1sQ2TD+Mp4JQqvxcphb2ZVo2OyNjrxrrFR4S0v+N8PiDyX6j4r2jHGf9A5QMdmHaiXEBJWtXiVc/Dw6FdEfU1TORJLXs4JqfkUb9NGujKzHQId4k0Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 5/8] x86/PV: drop dead paging_update_paging_modes() call
 during Dom0 construction
Thread-Topic: [PATCH 5/8] x86/PV: drop dead paging_update_paging_modes() call
 during Dom0 construction
Thread-Index: AQHZFT/xSoTihaqcu0mTNTc3tNKJ9q54rgiA
Date: Wed, 21 Dec 2022 18:44:33 +0000
Message-ID: <2fd2c7b9-0000-6907-2f45-a9222190c21d@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <d9a5dc15-d761-9ddf-5c93-ec00218d147f@suse.com>
In-Reply-To: <d9a5dc15-d761-9ddf-5c93-ec00218d147f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5922:EE_
x-ms-office365-filtering-correlation-id: f7750c65-6333-4b64-0cc4-08dae383675c
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SJ1YGR2LEVJHRM6Yn73H+0u//1UZvb99u37ygUMGac3I04Bv8zzZLLGlAkvIjb9it8GhLUGFN7EwGa03jhruiV8wDu4Q2PyRWykLZQ7aa/rvyX5Os8FMl61r8ffPgztw/wgRy7FBvH1x6YPfuQ9TkvwvUr4xdxfn7SMk4PtDmAwU+ttM8I8GKuRj2PS41CzU1W0rD2QbrqDuacs6eqVj4yN6A2wi8dzQtxLyEV3VbkQycbu68ZcbrmLKQfzqB+OupDNCRk7a3I4C7Iyg3As64V3ZHuvwL+F+V8wQco9Dlpl3/qAkWNPxgUx03Yj9yMDmkJiXn5R0kMiAJrFU9mh9iUl06ee2GGiO3LBkctUYkLb2dQJFkLa7bbjU4iI6EEXXn+vyK21HvehIXGwQh+mAN6mBULZ2gqmfB1VB9GLJQlDyBqL767L0VU1ZcatyejO8Am9cg+PZG5eDr9pOie3Vf6qIHxpO7CotrmqEA0zJLKK7fPc0lJjp2Uyvdr0itVgE2J3fj0/RfjJto7nh9G1Mcd0VFEmcSC0u8Otepcq9SMa7TTMyaXAcnIGWY5xneGP9FbqyH3JMVtVGxeiL/B3XZFPHlbNcaOzld/I9w9HGRwQo0fKRXuhhiObn6xrIIFatsYPd3WAln0xdkC2oYB2+6DksiBCjMsT06zoWJOJUQZ6AQZQ/SBu7jNCjYU0gXbzjlxv5aaxxB0F6wmxmwxq/cmbmpsObcU9KAHlifZ0sP2U4GvNO7vacppGuxdvK1SckPRmz53RPXi7elP7rDlhNRw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199015)(31696002)(31686004)(186003)(122000001)(6506007)(6486002)(71200400001)(38100700002)(26005)(6512007)(82960400001)(478600001)(53546011)(4326008)(110136005)(4744005)(41300700001)(54906003)(66446008)(91956017)(2616005)(316002)(66476007)(66556008)(8676002)(64756008)(76116006)(66946007)(2906002)(38070700005)(8936002)(83380400001)(36756003)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1piTjlyMm1WRkx0VGtIVzdiUWY5MDVjd25ZejNaQzVKc2NzMS9yVUI0RVdh?=
 =?utf-8?B?RURUNHNpdDk1TXNRRlhIVXcvNXk5MFVaWitsbEo4bSttZTdiS3VBRFBUWFNu?=
 =?utf-8?B?a0FvNVFKV2g5amNDVWRWZkc2bzAzRVNHZytjcEJXSGQxd3dGOTlHdzRuT3Jz?=
 =?utf-8?B?dVZvZzEvYzg0c1YyYkxsSk5IMW9QTlh3ZDNvSWc1V3g3YWJOS1h2K1hvajVr?=
 =?utf-8?B?QjZhUkhNbmFvTlVwUUp1MmJwWGlHS2U5K1c3dlduMkpTY1FqOXhuVnFCeU9Z?=
 =?utf-8?B?RU5acm9ZdUNVanRBRzhZTlNBVSsyYWVvdkp2cERzZmN1RHp1YStuTGVoMmh4?=
 =?utf-8?B?TkR3YUxqNlB5cURsMStoREdCdExPdG4vWDNQd3VDSWZkNUxrYklyMkpjSDl4?=
 =?utf-8?B?Tm4zR095SWhsc2ZiS2t2MTJoaDhOeUN4bW1MbXZpTGEyZS92aFM4cU94VlBw?=
 =?utf-8?B?eVhJVFpraXpuUjJsZk5waW1ySEV4dCtCdGRkRXFOVHZ0dzJDZGFlMWp1UHFC?=
 =?utf-8?B?R2prTkplVDVxNUxEVThrRndTQXZqRyt5UjlvVndCZk5DalFvL0lKM3BtOGVL?=
 =?utf-8?B?bDBsYS85d1lvaUU4NkFwZGF0NWdOMTJTNFI0MlN6VmZkams2L3Fqb0FPK2tv?=
 =?utf-8?B?K0JhcjJUMTBhRGEzWnl3MXV4Z0ZWL1RsUmFTcDNNNnVHYVcrUC9lWkhyNmRw?=
 =?utf-8?B?eGRDWG5xUkUxMkdCZ2pTa3Z3b3dMV3F5aU9INWFndFFrc3ZNdWxqTVR3cC91?=
 =?utf-8?B?aFUrWEFTMWFZdE90Z3c1SkpwL3g3N1UxVU1kcHBvZWlNd25obGxIZzRyZTcx?=
 =?utf-8?B?WVUwR0hYNy9TdGVVaW1vY2lybDFKZmtaRG5tMXVQNGpxWjMvQ1pOWGc0UVVh?=
 =?utf-8?B?ZVo0L0UzaHVKV2hZQ01NSjNXZ0tMTkhCVjlFRVZadFZ5K2dPRnUvZWsxOHdo?=
 =?utf-8?B?NTk5dGwzNXNnNEJTdEtGbHpDb0ZwNkh6QURxODVET3RPNlE2ZXRvc3IzUGhQ?=
 =?utf-8?B?bEFlT1UzQVpXcFowYXpBZGJSc1lvenh3ZWliTzZwM0VjL2E4bVpjM09VV0k5?=
 =?utf-8?B?OXZ1MXNhNUs3Q1lNUSswL0JheDZObnRDam91N0kwL2xnNXlyZ3hWWXRHeWg4?=
 =?utf-8?B?QXVJWklQWUFJUEttSUxYbkxKMmVxTE45bXh3MzZvMkhRWkdPcmdnajdXSWFi?=
 =?utf-8?B?RzFwT25qSlI0bnVHaUUyaXQ2RnN0SkdhdDFQV0g4T1ZGM2l6NTgwdTQ0S1lE?=
 =?utf-8?B?T3BlREdoYytrcU0xQjMrRmRaaDFtYUVVcWRLdjFxMy9BSUJEc3UxVGlIVWRG?=
 =?utf-8?B?OTgydGQ3djFVUi9MUFEyeW5kMTFYYXI3ZmlKSDdpVUxpVmZtRkxqRDBzMkNq?=
 =?utf-8?B?MFF1UEtuN3lCK0lFQ25ja1lkVkZTOHR0dmJRWFpVNGFibzgwSWJxeXRCd0JP?=
 =?utf-8?B?d2RlRUE3eGtkZmpjTWd3UFlzK05OYmc2Tng1RVZ6dTFrQkdiRUxQbDA0enFp?=
 =?utf-8?B?dDNJMUxaYXAwTkxIVmRnNnJtQXQvUFhacGJod1E0WndxZ3h5TW5oWWFFQStw?=
 =?utf-8?B?cVZxWHNIWEU1cmJITVRZaDdQZXRPN1FJMTNESlV3Y1dKQmJqSGV6NVZtRDkv?=
 =?utf-8?B?SlhnYWpXekVTZy8rdkdBaXRsREQ3cUpVTndGZGpmaFhiVG1uMWx0YkhRSWNr?=
 =?utf-8?B?STZ6TDRuTlZHd0R5TTBYdFZNdm13L0ozanphd3kvSzBaRHlqdk1OQ0xIemFk?=
 =?utf-8?B?dkJneTBtdUppa0RPT1EwbEhsamV6bm05MUVrWFVwRko0SWZPaUpLZmg5Rnpo?=
 =?utf-8?B?dm52eWcrL20xNFJYK3hjalVybjRWZmVyRzVSZmtYM3VaNkVFY0xDa0d1djB3?=
 =?utf-8?B?aDcwVUJUdUxqdjhlSzc2VmNxUGFud2R3ZjZQdzFpMFoyb1dEVDdLbjl2bExm?=
 =?utf-8?B?RlFZZTRQZzV4d0VqLzAvZXc4VHI3Y255bkFncHp5ZitOdHlJWGl3aFpoY2FQ?=
 =?utf-8?B?MFdtMklJSngxNTE1NEIyQVkrb09ESVZZV09yUFViSXA3YUtJUGRPb1ZOL01s?=
 =?utf-8?B?Zmd1ZndkRk91OCtxUVYySlY3Vlc1NGJoRVByT0RRWnp1dzhycjlITUJuQklN?=
 =?utf-8?Q?p2ktYUbyyIdK2PqOd4fWjL1a+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D843DDDF2E99F4FB29A8A684CF0239E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7750c65-6333-4b64-0cc4-08dae383675c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 18:44:34.0028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEwLZLVTahzMEQ3/VBUIVDudt+JX3D70JgZEO8x67I3A647fHGQkUHC0f1lGvTy+OPsg6bvlT8l6MmC+2OP8i0+LKJObIKh1Tjm9nP2zmx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5922

T24gMjEvMTIvMjAyMiAxOjI3IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlIGZ1bmN0aW9u
IHdvbid0IGV2ZXIgYmUgaW52b2tlZCwgYXMgcGFnaW5nX21vZGVfZW5hYmxlZCgpIGFsd2F5cw0K
PiByZXR1cm5zIGZhbHNlIGhlcmUgZHVlIHRvIHRoZSBpbW1lZGlhdGVseSBwcmVjZWRpbmcgY2xl
YXJpbmcgb2YNCj4gZC0+YXJjaC5wYWdpbmcubW9kZS4gV2hpbGUgY29tcGlsZXJzIHJlY29nbml6
ZSB0aGlzIGFuZCBlbGltaW5hdGUgdGhlDQo+IGNhbGwsIG1ha2UgdGhpcyBleHBsaWNpdCBpbiB0
aGUgc291cmNlICh3aGljaCBsaWtlbHkgOWEyODE3MGYyZGEyIFsicHZoDQo+IGRvbTA6IGNvbnN0
cnVjdF9kb20wIGNoYW5nZXMiXSBzaG91bGQgaGF2ZSBkb25lIHJpZ2h0IGF3YXksIGFsYmVpdCBl
dmVuDQo+IGJlZm9yZSB0aGF0IHRoZSBjYWxsIGxvb2tzIHRvIGhhdmUgYmVlbiBwb2ludGxlc3Mg
LSBzaGFkb3cgbW9kZSBlbmFibGluZw0KPiBoYXMgb2NjdXJyZWQgbGF0ZXIgdmlydHVhbGx5IGZv
cmV2ZXIpLg0KPg0KPiBXaGlsZSB0aGVyZSBhbHNvIHVwZGF0ZSBhbiBhZGphY2VudCBwYXJ0bHkg
c3RhbGUgY29tbWVudC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4NCg==

