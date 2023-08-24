Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E8787585
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 18:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590223.922358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDLL-0000wN-EB; Thu, 24 Aug 2023 16:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590223.922358; Thu, 24 Aug 2023 16:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDLL-0000u7-BD; Thu, 24 Aug 2023 16:37:59 +0000
Received: by outflank-mailman (input) for mailman id 590223;
 Thu, 24 Aug 2023 16:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+mH=EJ=citrix.com=prvs=593bb07b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qZDLK-0000u1-Cr
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 16:37:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93037647-429c-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 18:37:55 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2023 12:37:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5780.namprd03.prod.outlook.com (2603:10b6:303:6d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 24 Aug
 2023 16:37:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 16:37:41 +0000
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
X-Inumbo-ID: 93037647-429c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692895075;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5ducgWibNpWLb3meETgpryRZMrArCAO5kWwUdo4j4kY=;
  b=O2d+DuXnWBxcWQTsmqO0Ub6wRalXIEU13ndbMe93wIjWqFJI/g9VUIqp
   Pf/ebC2EnsPETSEv6YjOVe5Xj+NDB+pyD+EZaMjpFjQI6BZQhsinmgKV2
   6U0yqPWTKI3XKtmlTbhqaZwzbe/W32By7PszuKebQBFM3Uo5GjZXpKwIM
   Q=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 119809999
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OvV/aan8NK1Ws9XJLJ/FsnLo5gxFJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfUW6EPv3ZZmP0fYxzOYm+8RgGsZeHytBqTlNl+ytmQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K6aVA8w5ARkPqgb5gSGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eckGGAmKUynu+ur0L6bG+5nht08K+C+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieCwWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTezorq870Qz7Kmo7K14pXmWVgaCFgG2USs8CB
 WYL6iMcsv1nnKCsZpynN/Gim1aGvxgbW5xTGus1rgKX4qXR6gedQGMDS1ZpSvYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AWkpQN3qDipVTf2Wv0+97OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRtlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:L86YJqBc0j+B+IvlHem755DYdb4zR+YMi2TDsHoBKyC9E/bo9P
 xG+c5xvyMc5wx9ZJheo6HkBEDtex/hHPxOj7X5TI3DYOCOggLBEGgI1+rfKlPbdBEW/9QtsZ
 tdTw==
X-Talos-CUID: 9a23:nhgzoWAZMQo9DD/6EzJbxB4/XZwBTnTA3HvwckizCX92T5TAHA==
X-Talos-MUID: 9a23:8qDYYgZ3aIrBc+BTlHzTjw9MFJ5U6YeEGV1Qv78Zq8C2Knkl
X-IronPort-AV: E=Sophos;i="6.02,195,1688443200"; 
   d="scan'208";a="119809999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl/KL6RZrt+kT6AX7n0xqoDCGhksDS/Y6YpdXzJSSKf9USU3hjVR1Gkkct/VIhYExiWd6dtPAGt4QRawaariUJG5RkK7ZmuA/9Jnjj4holwhmqt3J86koRn7hvs9QCREunkEyqgR5YHb+NLefW+6ezgbeYsjeqxB7ved8YDxCEJpdX+BJUeFcJ72yvuRiW4DXWtCP190a+8Aji614KsCKxKWkRQUsXsUCr6h95jofrh3YGQ8GN33mX2+0uXFygOajpWjOYdxp5pvETc0jhV5CQfRsXKgUI6UkwvgEUjMgBMxSsrm8gxrkZSt5vKT3AViGeNOOC5ZR1pAzvtcsc1wIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVML95lo7T+E3ejYWkbkc8d/35BrEWVoSQXL8+6awIg=;
 b=WJ1+1yB0yJtQ2zelKhMLwizFixLwwNQN64fununaUg0AsyLp0tf9h3WmaDzjMg4Q14UICJ/cxsgec5Z1O4tiER2D7QNPoNerFwvDwaVxJYO5NBqFJ5V42fwRVDQHtQoYM+BBANtpqxstDUGoV6bamwxg1EfPgwYaDCCtM9L1eYpvOE3PWJsIKGLUlovTsVJA9FJ8lBosbh/j7fmQw078smVWcYuulXh/EaVFS58f65yeNdRnKzjGHK/H8VJK34wLDQSsy8tbGpeWG748NEkaZR/L7cLlE/Sp9mdjmhKxSdzh4EqiNvR7lF0HQmLcKqR+5XRSMIAUx8/i+eBg1huDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVML95lo7T+E3ejYWkbkc8d/35BrEWVoSQXL8+6awIg=;
 b=BIzc2AC1lii4QP2IFndGtooqszOqdIQe3dg8+ASstcjzDfo3u+oSP97Scb0cZQ5mVDPCVKHHhFD0eJ7B9GceyLSXcNlj5xhEYTjgKqUhgwfu2vVpsfhjAQtLezoiJfkqbPnDCCea4d+LC7wb2ilOGFprNll5Qgk39oAc42ENfuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <01e5cede-0aee-eff8-ec8f-64b015ee5918@citrix.com>
Date: Thu, 24 Aug 2023 17:37:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/8] x86: Fix calculation of %dr6/7 reserved bits
Content-Language: en-GB
To: Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <8e594d08-9489-5446-525a-526a1f79dc07@gmail.com>
In-Reply-To: <8e594d08-9489-5446-525a-526a1f79dc07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf80d37-25d9-45b5-0985-08dba4c06f1a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iNLUj0RFAH7yd91mSDsV3YrNGYqC1UbztYKkhXPq0xmALOWGvmWicsB5x4gyf7fRnLQTkT08c2a/mVc76/vF1hCSqYAjpEI3RYiTX/6Ht1sc/YVWW3JUFldRlzog59aZdbI/W0QFd3vWVU6rympqbcD/eh9VxIkNdrylsSRGdJVuFJsgvPzwmdy3SqlUIT9QYGJEXOpFZb3D3sNLY/+MvZnZ+kTEv/MAu7djApeTDGsB/htjoNLPq7A3CmwrzYflzvI0p6yaWX3+qgsDI/uW7ov2HiXYiXkwyAj0mChTacuEmE756f/R3EqymKF8AiQO+czUl6qkkumLcxkhmhWA7LMvmwzgOlLWdANpe61kpDl5nJR1fgGIkxiNIUdX5lezfSW5oDTIMh+ojd+i0Jzvd1NJfjJA+a50rk5imhElEaK+fog5QzIF4ZvA3kfJGmlsrzm8ufrZjpTRFh2C+UXOWXLebXWpunx5sr3wWSyRVxpj7AEbgV6Ix7KQzGywtgVH3zxpOLtsC8eG6FjTFG9QOcx7hU/LlcEbdnL1fugrrfTkMCwEpnArZ7T81vKDIPgMryYR2oqgmjnWFxdgyyIrn9KTr9O5w2gv3XQgh7Ml4nz5cOHWxjpERUlYlZ0b/11rlOEy6ubCIzTfE2/bL6W5EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(1800799009)(186009)(451199024)(31696002)(6666004)(86362001)(478600001)(83380400001)(82960400001)(53546011)(6512007)(26005)(2616005)(6506007)(6486002)(38100700002)(41300700001)(66476007)(6916009)(54906003)(66946007)(66556008)(2906002)(36756003)(316002)(8676002)(4326008)(8936002)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVGYTFsNWs5NmpDTlRVZUx1NHlYOFhXcUNVbVF2Vnp5eEVCMHY0YUxwY3FG?=
 =?utf-8?B?c1ZxOXJ2WlhCdkZyVno4ZTJLMFJnMk50bVFuVmtKek1SME1hVnYxbUQ1cTlK?=
 =?utf-8?B?dHNOVlNwY2Y5NkRBRVZWWFlDK0FjVWNtZnJvdXFRcFRpcFNlTzBTSDVBelZF?=
 =?utf-8?B?emo2eVYxdUtDRDN6MDVjKzE1amMyczZLaUYyS1pySEhFTktQS20vSGl5bnow?=
 =?utf-8?B?NUpRWkhIVlFHS3VTUC8vM1ljOHpCZnN2M0FxVHgrcjlrSjhxb242bWRQNnFt?=
 =?utf-8?B?b0w3WkdMdXdvaWl5Q1ZKVDE5RVdmRjRwdE1IUVBlNVFJMCt1dno2dFBNOUhs?=
 =?utf-8?B?UXZGSkVXWFFvbUZSTVc0aFlVTXJiOGVLeFkwdkE4SlNJdHpscG5MMXNtUzdE?=
 =?utf-8?B?RjUwaTU3dHgxNFZuRjl2aUU5SUVhVnZtakh5TkE1enFyblVWUkZRQzNQdFE5?=
 =?utf-8?B?Umx2RkJySER5UEhWa1ZUeDI1VFU4WE90aWJZalAxRzVQWForVVhieXJLejZD?=
 =?utf-8?B?NWFndHVRUFRMdk5nRjgxUXV2cDl5WW5pQmV3V25NaU80YWhydHU3UUtmZTdK?=
 =?utf-8?B?OGhKUHdERlJGb2h3Z0ZKV2FSWEZ2VjMvWFE2cUczSHNwS0x6amI3cVpOSFpE?=
 =?utf-8?B?dnl0WWdSVHIwZ3hKS0NuMFhZVGhoMjJidHZoRExuaHN3WXdRMVYxWWYzTzI3?=
 =?utf-8?B?dkdXZ21Kc3RtZDhPWmxUTkIyUml0UmR3dkFkVHJmYndXZUtMUGxFc0Yycm5M?=
 =?utf-8?B?cktFNUYxd25YWVFza1VBenNubE00QjZ1bHFOYzF4ekt2a01nQ0RJR3dycS8r?=
 =?utf-8?B?Kyt6N3dMaUs4MFc0STR4OWltcURyR2JYRDh5c2c2TlNNMGV4TkFiZXpBZ1A0?=
 =?utf-8?B?UkRDL2k5NHNWN0NpYzhvaHh0VjRpbFhxV3cydnJmTGFxWDgrS1Y5dG43UU9r?=
 =?utf-8?B?U2NDbE5zcE1IMmdoSmI0TTIyRWJpUnE1dnRKYlZMZkZrMGNaekJxUUlxR2wv?=
 =?utf-8?B?TCtXaTZjdFMvdzV0SzE3c0hPZVptS1A0S0ZSQ0UyVTdRTUxINk5vWlpFdkdN?=
 =?utf-8?B?eUVMMXRWRkNjN2ZZY2hkTjQ1MWc0Y2F5TDViY3lvbEZ0TEVLTWdPRHBuQ0ha?=
 =?utf-8?B?OWdRdGFqTVB4VVVXcnFOWHplODN3K0FIczBxekJ3eWcrWkdLaWNuUi9ZRS9R?=
 =?utf-8?B?c1lGUDZxNnZjSUgvbFVjaHZkKzhlSEFPSWtmY054ZTV6V3l6VlA2ZXhPbENT?=
 =?utf-8?B?VytsWmlWN3d3Y3lKNWJtQ2JuTC9DbFBsOHhXd3duQXE2MEJyYksySDJOWFF5?=
 =?utf-8?B?a05DT1cxSXpJN00yQW9MR1NKNGViV2lhU3lRaGFEdXFSLzRFZVB1TllaY0dh?=
 =?utf-8?B?eTVjWjFSR2lFUU1rSUM1d1NMdHhkbXp2KzRsRTZPbGY4N1hGbS9vZXJ4ODFa?=
 =?utf-8?B?clh5eGF4UXdtSzZyeVN0Z090NEliK2V2K1J6ejdtNlhaTnAzUFlHc2FwL0RL?=
 =?utf-8?B?WDZjc1FDOVkzdjFFSDVDdVlCVDJwVmN6bUJ1SWZlVlE5RXc1QVlaeW5FVkR1?=
 =?utf-8?B?SXAwK1lZYXZRN3NBOHY5R2daSllUQXI2R3c4NlNXamFoa0M0cW9rdENPY0xy?=
 =?utf-8?B?TU1KcS9hM09XdkxJVCtENldtSG5vOFRCcVNVWFI3QVJ0VFhwK2dWMml3cVdG?=
 =?utf-8?B?dDJEQXFuQm5ON1dMNU92OE5wTGhIZEE0T1pXTlI4UVpVeWF2RkVOR2pxS2w5?=
 =?utf-8?B?QWlmZU40NUVjUkdyUTAyYWZVVC9vcXFIQzNqdGRpTWhjSlNUaEZUWUV0NzVJ?=
 =?utf-8?B?ZTlYWUFCUjY4TUNQc0pyRkdOYkNlSUZsdzQ4ZXA5VFRLaDBtNjRnSDN5b2NR?=
 =?utf-8?B?VDVTdTZzMXJsMm4renIwTUdMclh5WTUyMnpOcVo4dkdVY0h4QW83UW5XbFpt?=
 =?utf-8?B?aDk0VkxsdjExSVVBUWprT0E3UDIyaHJXS3gxNmdTT2tNbzR6Vy9Ca3g4L3Zw?=
 =?utf-8?B?dkh1allyRzluOGl5ZUd3SkdPUHB1VHlQZld2dkl6M2NoTHYrankvemFGaEZD?=
 =?utf-8?B?eGRFM1RKamlmdDdWeHhhTyswcXRaYm1ya0t5aHVMYUZjZ1FzK2RpS0xGWDBs?=
 =?utf-8?B?NzExL0hqN1B6b2NKRGFNakxPMUF0amZiRU9NUlMvcXpPSmZibEcrczlKenBC?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X6mWDqAHJ9vE9qbhT5aqJsm5PTyMh4XtA3LUc7e4fMEzwpqnX8ZvJ0hmSJ2fjc963pOu6uEWQqcUTAO14cSEAIzGK89JxZiCEFuIPIdgfiMBYg+b9sMZSft0mkUEMb4Whx6XJrrJKs6Mx8Q+7JoqUwdEuf77FuBe3wJWKSCAyOEaVACJu027Lp703gUuu67l5qxkvJAf2GNiBILRwGgjZ56xAXQli9DAnSQnXgi3rNWl6LT6AKJAz9XhLHeetCzcIHfh1eu5NXQJ5vtQ5FMjeUe0lsUC0vICbFYX+3dvsMEItmsn8mWVDpfBZYfQAMu+FahCK3tUzInUmT4z8dQaPpLyrJxo+OQBUyj6jjfq4gNpraNvXvTMPiwOZVeqjhpioVMTB9tbsqMC7o5LoGsq7E2j5oxJX3Lv/VmkiLOI8skJ65TqJ1CIQihivNFeGqVTYxCCAYN0RcfNk240FmPsM7KG4YX3futEP4xCOxpIx6rdmhFRbMmMRgTrl8l+A8wN57i3dZ0FaiNKM49H0UvPnt25Zg3N2MmeVZoc7s/1VXaZJ5BK2O8HrTdGQaQUozaAq66hwyWxxFjO62uxR9S3YSSL0Sd12fa8nPUgg+P9pPq+aqAncK8DSSO1CKG+PGy/7pk9IlF0jfhcl7JUEO+zLmPnLUeCeiL5wi9YL9swgnGVXjfJdG3Q34hRhFqB2grgjqWnCzxmT6pYDXT4CVh/Iwsh4tNRTg+tlffOqUhGsKCaJrCx7HvdxwOyRBrgXwpuK8p01oRpq84P9rPa3YnoSHDAHN7el+2AP0LgevPs5is726fAPl4nqPMkoBdnKKCkJ3NG8tM9Hwk8XcQaCZYotyvExEBGzZfUvJOBf+mzzXk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf80d37-25d9-45b5-0985-08dba4c06f1a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 16:37:41.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5tJcH/aa6Z6Gpl9+CRn0A4JGOyzOkp4NVzvcl3ecxcV+epkZejAlf1e5KrL25uWQ236p6WexM0T9nxS/kavHEyLvnK5N7v/33r8HOr2fCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5780

On 24/08/2023 4:25 pm, Jinoh Kang wrote:
> - Define X86_DR{6,7}_* constants in x86-defns.h instead of open-coding
>   naked numbers (thanks Jan)

Jan - stop insisting of other people things I've already rejected,
particularly on my patches.

> diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
> index 86aa6d7143..74344555d2 100644
> --- a/xen/arch/x86/include/asm/debugreg.h
> +++ b/xen/arch/x86/include/asm/debugreg.h
> @@ -80,4 +78,20 @@
>  long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
>  void activate_debugregs(const struct vcpu *);
>  
> +static inline unsigned long adjust_dr6_rsvd(unsigned long dr6, bool rtm)
> +{
> +    dr6 |= X86_DR6_MBS_BASE | (rtm ? 0 : X86_DR6_MBS_NO_RTM);
> +    dr6 &= ~X86_DR6_MBZ;
> +
> +    return dr6;
> +}
> +
> +static inline unsigned long adjust_dr7_rsvd(unsigned long dr7, bool rtm)
> +{
> +    dr7 |= X86_DR7_MBS;
> +    dr7 &= ~(X86_DR7_MBZ_BASE | (rtm ? 0 : X86_DR7_MBZ_NO_RTM));
> +
> +    return dr7;
> +}

Jinoh, for your benefit, the reason it was the way it was is because of
how the processor manuals describe this logic.  Not this, which is
borderline illegible with double negations all over the place.


However, in the time since I wrote this patch, more inverted bits have
appeared that need accounting for, and this is no longer the best interface.

I'll adjust the patch because it's unfair for you to be caught in the
middle of an an existing fight over code comprehensibility.

~Andrew

