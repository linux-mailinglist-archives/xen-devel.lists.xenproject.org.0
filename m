Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D853715CC
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 15:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121585.229285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldYPg-0004Ns-Lb; Mon, 03 May 2021 13:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121585.229285; Mon, 03 May 2021 13:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldYPg-0004Ml-IE; Mon, 03 May 2021 13:15:04 +0000
Received: by outflank-mailman (input) for mailman id 121585;
 Mon, 03 May 2021 13:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldYPe-0004Mg-LU
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 13:15:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3d095fb-48af-42ac-a637-02a3aaf78041;
 Mon, 03 May 2021 13:15:01 +0000 (UTC)
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
X-Inumbo-ID: d3d095fb-48af-42ac-a637-02a3aaf78041
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620047700;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8BD5KPdi1LE76JuB/81Z+5hisx8uZi7CZ3Ap1mjbNus=;
  b=ZH9JY/vdd+hHPok+y4hvOPWld72abVGMqebeXGvA/wPBTO+I7DMpjiBk
   VqPQZhtrmhkuE/OarKvHQ8LOeXcId/x4EzDVY9VjDE3q69MBlduWFNfsu
   InR0PTmXIVwvYoQ6xPBegmyG21RxhUcmFOz+dgHyk2cdbnlNqHYQV1PYU
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LqPKTZNzNWi38lZ6Qvveb1feCTSnvjbsyovASPoBXtk8ZHk4NdtP7utWmjecQTpiNU2GeuJZRu
 DOqQvBkWzv9l5ulSnZcqm+1yH0BOTV6nR0toWnAGl3LI6+qKIXbKpaZkzPDkwn6x37ODGZoHfr
 xBsS7H18QiisIRPSamCCIqt7YRfoRYhRmKDuG5uAhJatcJbYivc5asEuvZMcZjv0yXOD1UyAFR
 94wjQPUuluGsa4rooD8XR2o/zpv0PapjooQ5ygl7I8+tZX3hlQ5VSYxs89xEXpf5zyBoJJMzm/
 Imk=
X-SBRS: 5.1
X-MesageID: 42945044
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UyyloKMNCyaaBsBcT2zw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQijtRIACdD0FwWU1iDZ02CJ
 KT6qN81kWdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LV1JfRFR+E0hACFw5e2LtKyx
 m5ryXVxIWG98u6xBjVynPJ4/1t9ufJ59NfCKW3+7AoAxr2jALAXvUHZ5Sju3QPrPir+BIWlr
 D30m0dFuBSz1+UQW2vuxvq3GDboUUTwlvv00WRj3emgeGRfkNCN+N7iYhUcgTU5iMb1bkWus
 I7vBPti7NtARzNhyj77dTTPisa8nacmnY+jfUVy0VWTIp2Us4gkaUk4EhXHJ0cdRiKjrwPLe
 8GNrC/2N9ra1+AK1jWsm5zqebcJUgbL1OtR0gPvdGtyD5GnHx15Ftw/r1vol4wsL06UJVK/O
 LCL+BBk6xPVNYfaeZHCP4GWtbfMB2DfTv8dEapZXj3HqAOPHzA77bx/bUO/emvPLgF1oE7lp
 jtWE5R3FRCNX7GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDYEpGqbrin9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObVEDTcwuvMohUV7mmLOKFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqm+xXHvVhwXQRmPNdkTz8YkYKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJPr+5nL4VWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIms9WbcmZC4WufKnZEPoTrOT
 8ag24y1bO8LpSWyyxnIcmgKHimg3wao2/PaJsAhKuZ54PAdokjBpgrHIx9fD+7ViBdqEJPki
 NueQUETkjQGnfFkqO+lqEZA+nZap1bmwekIcldrFrFrkWCrcQTRn8WNgTeE/K/sEILfX55l1
 dx+6gQjP6rgjC0M1Yyh+w+LRlxcmiNOalHCw6EfY1QvbjudGhLPCG3rA3fryt2Vnvh9k0UiG
 CkCSGPY/nEDmBQvW1i3r/w/El5cXiceExMeml32LcNZ1juizJW66umd6Cz22yeZh85zuYRPC
 rsTBESLgltrurHniK9qXKnLzEL158uNuvSAPAfaLnVwGqqM5DNv7oBBeVo8JFsM83OvucHXf
 mEQRKcKCr1BooSqlWoj0dgHBMxhGgvkPvu1hGg0XOx22QnB+HOZHthXLMWLrinniHZbsfN9K
 88q907veG9aDqsLvGHzLzadD5FJFf4p3WsQ+QhtJBTuuYTudJIbu7meAqN8EsC+hM0aPrQvg
 c5Zo9Q5bjaII9hf8AIYUtijxEUveXKCHFuixD8B+81QEokgHDaNe6Y+ragk8taPmSx4C/LfW
 SF+yJT//35TzKO+L4TBaU3O3lXYiEHmQJf1dLHU43bEwOxce5fuHK8L3+mabdYIZL1VIk4n1
 Jf49uSmfWQeDe98AfMvSFjKqYL12q8W8u9DEatHuFPmubKdWiks++P4MSpii3wRib+Q0MEhZ
 ddfUhVV/99sFAZ/cUK+xn3bLf2rEIjm0Zf5j8itmeF4PnZ3E7rWWdcMQPYhZ1KWyJ0KXbgt7
 WczdSl
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="42945044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yc8+lG531LPjT8Or0AkHWUfvh3Z5sWiPlG34Wtl8If9jSvcIWnT1/vz4loxg3/g2Bgc1sJg2WZ5Mdmbl3WK7kmSaLF8Q+s1T7XlobKyHCBC70ojnG58f/dmVnc5xnuYeAIEdFbk8Kegw7C+ggG7KSIZ+cvKVxQiKmHfZm5radLYbyWpAG1Qj/jAj8bVNxz+kulndvFsKo0ARYmN/O1zepKSQ8SKcug5MgNZ2A7uKq8UK9CX1RGNiGm/r+3TRO0mh70q4CCGHZevfCLMcOob38Rt5eGZu2HcDFRSUNiIGCJxanq55fkbcAiLRGJNN/vd7GkNvpId8KGcRq1bdykyLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5m17tToisrf52j6nqdrPs9TooiC3tVzUWmKZJAxMao=;
 b=EsLV8+LwD5n3lkf176LOfgD5b/7Yj8P+xrhShnjW34hrQjTVG0Vkl1XYSeER2wWWmbzQoq3xd4LWtcT0xgr/aKdgH+nmCNe0JWfZx6/wtAP/BsWFd+ooe3CLJzLEVqaAp71LXqKo6ubKHmRKHl2aMAfdm4WYimWKDMx/KVyUo0r/EMMdkDP1simCJGLhMlXYr32m0Ud+Ds2wk9w9dfCp/hBqxDH6RLbVs9uGcpWPGlFYXFSrwEqPQlllI6gUr46FQAg6b6lcg4+Rn//SuTgQPn0NgyKUEeEosk05GRulFlnfnzTEgBlM9j4WxwVZShmThoiBuNMf/7m4z/mNh96IQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5m17tToisrf52j6nqdrPs9TooiC3tVzUWmKZJAxMao=;
 b=gwq2AlzQw/Qrt5fugm7dIXm+B7KkjoEpb2dJLZzvDdh8vrAC2KepXa8+wiyCTXG0FhQITQjQTqiReZQq2GnG0ia1fG98UHUUQ4mwY2hF8XpLXZn6fF3flUtGbGSaBZ+DUWoh6lQ7nXmW7Wmhc/0AgSQDSnetxri+8dFmqG3Um+Y=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210429221223.28348-1-andrew.cooper3@citrix.com>
 <1bc9a7f7-0bf7-2894-1272-3eec6dbf5a8f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Always have CR4.PKE set in HVM context
Message-ID: <13a257b8-bb0d-cf4b-c198-576516b549f4@citrix.com>
Date: Mon, 3 May 2021 14:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1bc9a7f7-0bf7-2894-1272-3eec6dbf5a8f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d871a406-5703-47e2-ac9a-08d90e3572e6
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5566714F52A348F99CE42140BA5B9@SJ0PR03MB5566.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/jLQ8dLyi3FH1woMhZtxtzN+aK1/fqCYN2jlJfN3wj5JQ3UvGIEqtAzgcNzl9GpkF2qtaCoVoMhaPbLRDTJ2obwQgW/O4IlmNgKzflrdzmj0KkH6g4gP7cGwqKI/RcTKXbbkVlsD8WnLkBx1jBzN5Kfx+HDrRn4hwk/WBCJ7+yAl2jJBB0NVAdoqeUpnUvAzdNdKNHzMGs5XNZ7b99ke7YK9noH1lNiUHQb2ycgvAp0zqxiLYwNKV8/TtOSu3U/2d3Dj9wHQXLRFdD79s0AZ7FB/L4yLSRtF9Ir9Gu+vyxPTzc9nAvynzeSrM6S7+yO1kEfE+DP75SpMKy2wGT7hjKr8HQxg7F8M15dkthbwV3oD2TidiBGIHHnQBzW6VFWuett7fIRb5TtzN1LACiaAnttUFJ2bhAb36tnfBlGETENlS9qxBxtvKt+oddafsk5mCLYIT7f26KF2u3oEY7j7VRL+JZems1ldALkjp41ssYtQXq+U8w3IFbIkn/61sjCGvQYkfWTNCDTRDej86eBJ1DM5TrZEGW0jnOXit9A8cSQZG0Yj/guyVx/D7nEVYZBPPd8uW2z12JgvgiJVC9i87H17raFp9m7OOvqwtQHKizH2bQsZsZb/YGytg5S/iVzc+SwgThvxkOu5p6XIbykmuE7MVTC4v3vkbqR94SaHXrA6UFm4Zz3iWJMphXN6HIO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(66946007)(2616005)(66556008)(53546011)(5660300002)(66476007)(36756003)(86362001)(54906003)(6916009)(38100700002)(478600001)(186003)(6666004)(956004)(6486002)(31696002)(26005)(8936002)(16576012)(4326008)(316002)(2906002)(8676002)(16526019)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WE9jNjB3NEJJcXlrZDh2TmtaMFVUVWhTRGxIQjJVaU5YSUJtV3BqcVE4NmNI?=
 =?utf-8?B?dFJLbHNsdllXSnRheGEwd2ZZSURQSjlHb2ZOZlFuZDhOUUI1NlMxZkZNVDlL?=
 =?utf-8?B?NUVsNjVsUXhBWHpkWWNpeXhndGh5Vm8yczIrL3VhNGRBbitLanlWVi9zaGp4?=
 =?utf-8?B?WUErcUYyWnE4OHVMVHk0OUp1c3QyQXUrRS8xNy85OVdxSWpIZ0dMZmZIR2NX?=
 =?utf-8?B?NVFJWnBRcEVMUkpxblRWZTNyZTZtdjBQTEhjNlo4UDVGSGZZQmxESi9iZHlZ?=
 =?utf-8?B?QmtGQnk1QVdUb2VEdlVuMm1GRWc1bjZhVXdIL3BDdnBERjN2ZGFuTDJwaElN?=
 =?utf-8?B?OXBFUzRWUGVZcExvSDROSUZmZmdnbGZMUXdHYXNseGZVaWd5by8zdWlwVVRJ?=
 =?utf-8?B?Y3VVY2tiT2puVFdRZGd5dXEvU1RNOWxEazlnamUrV1VSVEFjYU0xMSs5S2JD?=
 =?utf-8?B?ZUhoRWxPY3FPY3prZVdaT3A1d09zdytVSE5tOHE3a2d4MG5CV2xLWmhRM1o3?=
 =?utf-8?B?TTJmbWMvTUhLcktaYkZ4UVVpZ1JaUkFJNlRnK2lBRHR0S09aNFFvQ2ptdjdZ?=
 =?utf-8?B?UGQ1eXo1ZllWYjAxN2hsTGw0WGcwUVk0MHJMY3laNU1xVWJmTlBseU13YUMr?=
 =?utf-8?B?MUlCQ2ZYRzVqNVMzSlh0bzJpU1NDQTdhRVJ3NGtvMzB1enhWdFkzamxabHFP?=
 =?utf-8?B?YlJkYk13aDZQN3V0VFZMYmMxU1V4VFFTUlZuUmkrQ3JWdnVMN0I1YjhJaUFW?=
 =?utf-8?B?Mk9CeTJjTzJTN05hOE1vK0hNd0lVVloySlhDN2RHeXpDbjVyNFh6azVsWlY3?=
 =?utf-8?B?OGp0cSthZVNlM2t1ZE1hU0FLODViZFk5dkxXR2g4ZXMwajJzZmZSUll0SU8y?=
 =?utf-8?B?WGJSNERsTE0rUnR0cEV4QzNsUGZlckF6cG0xVW15RVNqOU9DckxIamtMbnpj?=
 =?utf-8?B?dkh1M01qNk01bUMxNm5ORUZQK3lGWnlTN1JpNVRxbkV3cmEzZnhZdk5TUVBP?=
 =?utf-8?B?TDY4aS93NmduYUJqYm5pNUNKTGtzK0NxK3ZEUDd3aGZ4VGEwKzNPYzZYYkJB?=
 =?utf-8?B?TzZCaXJKelhpa1kwdnZhOWlWT0dUcm4xVDJ2MlVUN3U4VWNmZU5WU0lIZlZp?=
 =?utf-8?B?WURtTU50TDhjTndYUUI0OVo4ak1WbjNyVGJlV1RucHJQUWp5RTJWK3ZlcmRp?=
 =?utf-8?B?MkIxcHBHem9DM21LR3hVUTVXTm11VlF6aWtNL1VqNkVTRU9jMk1IME8rYTFJ?=
 =?utf-8?B?Y3R4NmVwSWI1YmRrdld4NE93SnJDM2hJWEhVMU1aZVFQT3lBQ0Q1alhBVHJK?=
 =?utf-8?B?QmpxK0N5WHkwUHkydGxWVmZ2NTFRbERsbjlYWWZ1c3NVQnEvTEFuZ2RBUmF1?=
 =?utf-8?B?d0tGaTlKMWdEMU5UMmZicVYxalNuL29nRVo1Y25UczA0dWtjUktSVkI0YnR4?=
 =?utf-8?B?ZlJSQkFKZU9VZCtRSmE2cE5aMTcrN3p5azBkVFYrbUJ4T2F6RkxNRldBUnZt?=
 =?utf-8?B?ekN1bTZiSUNNUld4OWQ5SEprVm1BcmhrSFB4b2tVVTFTN3BuczlZT2NNZmtJ?=
 =?utf-8?B?eG1hYXM3UStqQk10UmNlUW9Nb2NVeU9rMmd3YjUvTWFYVDFBTHpRU0xaZjQ5?=
 =?utf-8?B?d0pqaVErdWp6K25sSnpxdlpSQ0kzNFY0YnJzSy9UUWcxYUxYV0JSdU1mM2xx?=
 =?utf-8?B?TDBZWlhkVSt0emtKaHNaWEE3WFJhd09zRDlyL2FuU2l1L2szYWh3TzJhVEVN?=
 =?utf-8?Q?+9rSqxovNNHuDJTraVrJwc4kWFQAE3FK6Y+eHTP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d871a406-5703-47e2-ac9a-08d90e3572e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 13:14:57.4710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hwxc9tEwwhfdb8pdbX0e/+UFSu9b0LB8mt8FngrbodkRFYarUF32GE+7La/GlOMCug/t5103RiCJ4/wGgySWBE0b/HY90z9GaSIg2FEB8EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5566
X-OriginatorOrg: citrix.com

On 03/05/2021 13:42, Jan Beulich wrote:
> On 30.04.2021 00:12, Andrew Cooper wrote:
>> The sole user of read_pkru() is the emulated pagewalk, and guarded behin=
d
>> guest_pku_enabled() which restricts the path to HVM (hap, even) context =
only.
>>
>> The commentary in read_pkru() concerning _PAGE_GNTTAB overlapping with
>> _PAGE_PKEY_BITS is only applicable to PV guests.
>>
>> The context switch path, via write_ptbase() unconditionally writes CR4 o=
n any
>> context switch.
>>
>> Therefore, we can guarantee to separate CR4.PKE between PV and HVM conte=
xt at
>> no extra cost.  Set PKE in mmu_cr4_features on boot, so it becomes set i=
n HVM
>> context, and clear it in pv_make_cr4().
>>
>> Rename read_pkru() to rdpkru() now that it is a simple wrapper around th=
e
>> instruction.  This saves two CR4 writes on every pagewalk, which typical=
ly
>> occur more than one per emulation.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> It also occurs to me that for HVM/Idle =3D> HVM/Idle context switches, w=
e never
>> need to change CR4.  I think this is substantially clearer following XSA=
-293 /
>> c/s b2dd00574a4f ("x86/pv: Rewrite guest %cr4 handling from scratch") wh=
ich
>> introduced pv_make_cr4().
> Never needing to change CR4 doesn't uniformly mean writes can be avoided.
> Part of the purpose of the writes is to flush the TLB. Per-domain as well
> as shadow mappings may be in need of such if global mappings are used
> anywhere.

Per domain are not global.=C2=A0 Shadows from HVM guests are a) surely not
global given their changeability, and b) in a non-root TLB tag.

Details like this do need checking, but it shouldn't be hard to improve
on what we've currently got.

~Andrew


