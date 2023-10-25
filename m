Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303647D70F2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 17:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623088.970566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvftK-0002O7-GT; Wed, 25 Oct 2023 15:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623088.970566; Wed, 25 Oct 2023 15:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvftK-0002MS-Do; Wed, 25 Oct 2023 15:33:54 +0000
Received: by outflank-mailman (input) for mailman id 623088;
 Wed, 25 Oct 2023 15:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvftI-0002MM-Mu
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 15:33:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e55dc25b-734b-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 17:33:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7153.eurprd04.prod.outlook.com (2603:10a6:208:1a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Wed, 25 Oct
 2023 15:33:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 15:33:20 +0000
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
X-Inumbo-ID: e55dc25b-734b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfWJzwOZZyvsH/1qLmYMx5CIlDM/rOcXfuWiN1xAUkJZIxOTZ+Hro1AsukCnzghFbO+tSpgqnj+NhGwJ0FZrzkvlv6w/liA8ytx9nNNcLzmmVKuL+sNBDep4le0En58IxTdvESHTehcD2FkmP+GyktkhYZR8UhOAeXxOH922CbAMZePBFfpssZfgI4i6fhDLrj5pzIX7t8jY5e9UAh9+tysK4sJ7tyb2sFxblQEY/4lfWy2yAkpImWUtO+hwqISaDgmYZyabb6SMUalCKwt5N32oGXAPoypKyYXaQYkw948vMMDvWV48lG3h/jehOERXN6yvqgHz6D4betDayziuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t/Thl0XEeLJ/joxaDu2iaUZWKqeolnRMT2FhZ6bDMU=;
 b=lZ8Lm+wo3mJozLjhAOyPicezMgzWu0KTYMITODvrRW8OO9l9oBGDekZX2Cop96AVkQ2j86V0LV5anu/ir8bb5E5Hbixs4Cv8eaEFqcPlKAIufXT0yWvWxaoKfhCmI8ojdD3T3lRrc5bjA6cNJOQscJcpMKpel1DhpuSKbXTcLK7zPzV7JdFK88I71DQDiUh6NmCcTgu7vUsKLXn8ZVYso9ks8Q+N+rLMsgZR73+t4heuGkB+1cVpPD/yBugql/rTWFBKLPnVBBoPnRg/xWwuuw/tgPzDsGOEw6d4tNvoyPwQNdY49VGSVjG0venW99HrYfA8BQI/3U5BuC0XiPPTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t/Thl0XEeLJ/joxaDu2iaUZWKqeolnRMT2FhZ6bDMU=;
 b=DeahZAiM3sjq9ngcPdgOK+YEwi1VO51U6valBSi0EoXoNVscV1to+SVY3x1YmwquERmfBKLG5aZfcG4r7i5QcY3/LVtrMGKvsfbocNwUKMTG36bcyfpY4KQS5ADLjVkDoKg/JvmNDzUoeH5x4VaPyTPM1MbhkY2OBnYcqJvFe90GYTK4YtFh21ORlUu+DSih17MXg4OyntGydbxyATibmmiC/Vl7lCj70LiEZWKbePRK8d4kV8U8U5r+nOJbMYftQRB9ZNcHLi4mmDeeiM+2G417ZamsjsI5nV8DqbfFSi0JbDie0/vSeMe+hsMQRhDZyLhm8pVzYKZxI8Gu5jPq5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96dd7efb-c214-2155-c5d1-3b9a47c10d33@suse.com>
Date: Wed, 25 Oct 2023 17:33:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
 <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com>
 <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
 <6d113a237846c7a41aa083e806f172e7@bugseng.com>
 <5475d9e5-ec1c-7f71-ee77-59ec2e6ee01e@suse.com>
 <alpine.DEB.2.22.394.2310231340320.3516@ubuntu-linux-20-04-desktop>
 <dd33e92f-03aa-cf3c-23d7-dcf9cce23c8e@suse.com>
 <2f88afb2383b5fdecf83d311ebe69bb4@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2f88afb2383b5fdecf83d311ebe69bb4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 1169e351-4e3c-4c25-0e52-08dbd56fb7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pc98YC2Wjgw5wTJp9Ru1MEeQYsTo4wSc2AXvszSOv7oxYKTeXOKLAwLpTogdcFVxEt40KCuAPe58LQ7PcEU7iDw/B151oRG0R6vyEy2oeS9Cnc84Pno0YkRb0o6m0GH1es6zHeMKKRMgFNEhqHzRN7b+/tnNTEIvFf7W59wRwkkOC83pQu/qC5xpVnaaLoxF8ayfQWcwTEXvK+x26hT6TMLRW0FC/pCxoiKsLLutkSSd1bg35lJX2TFKnYVGmtTdeVsOmshEh0ZMA1Y+F9bNWuVZ5z8KXecpXjUAjbdiNQ/P0HTb+S4yoxkofu/D1x1Z2YGrYYwCsVu4D4SWoUye4TZMB5IoB6XocpL5gqfOkVa+QJ1TyyhUWiSlYdjRlGYYZEyxX8Iflff38CYRhjsdeRu+4LUWQjyttRBJ22QOwJaJpxrwYRCmX3QVMyfbP2pSzKQO482meQ7yybnrZ3vvcjHKXbODXuogIMSBOTVFtOPNZuiJzkuzlRlWpW99al0hTBaGdMNA/9U+b8pn/48mYBBwENxmywf9PY6us1bNeJzNObgFba/1KK1h2QxJtnPM4MzCXpQFUMbYUOknjTE659eLPcOn/ad+ZETrapI30G3dWcd2X4mXA7WlR2vm6Ezj7QToCsikZn+TcDuOWkZyYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4744005)(54906003)(41300700001)(2906002)(38100700002)(66476007)(66946007)(66556008)(478600001)(6916009)(2616005)(6506007)(316002)(53546011)(6512007)(6486002)(83380400001)(4326008)(86362001)(7416002)(31696002)(36756003)(5660300002)(8676002)(8936002)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c001TzYweW1BUFhXcWpvNHlPdis0NUx3MytscU14a3JUZGE5S0JFdHZ2ZUYw?=
 =?utf-8?B?bzdJblB5amJPQWhIQTAyQVFFd2lMZnhScUZRRWlmRDhlbXZxSC9wZ1ZGNC9I?=
 =?utf-8?B?ek5sdEk1UHRKdkdkUUJvTUNCZVQ4Tklwb2VCbTR6R2k5K2dOQnZKZ1VXL0Z0?=
 =?utf-8?B?enJZdUlIbkg1bDNCR0c2Ymd4NkJBN0RQNEJDUDJzV1J6dC9sdjUrekZ1WlNE?=
 =?utf-8?B?Ukl3aHJSVWlGd1hPNTl6WFVaOGlLZFdlZkw5M0lxVTFZMjJ4T2FSOGVDQi96?=
 =?utf-8?B?VGZrZXVQajkvK0lJQUcyL1EyUkRkM3FwL050Q0t3UkJOYWh4S0tXZURnek0v?=
 =?utf-8?B?T21wL0t1WmUzVlFGNzFORGh0b1pnZllacHlyV2E5cFZrUnZEQzd5QmdveU5U?=
 =?utf-8?B?Y21GZWtpRko1aVR1OE56T1M0cnMyVEhrazRFT0d6WjhlbUJoTHpOMDUzek82?=
 =?utf-8?B?OXc2RHhIWWg0eFM0bEtSZGJSdTVQb29NSHpsREFHUnhNWEVadENva005VFJ0?=
 =?utf-8?B?MGtjK1p4QkJoZUVjTVVYRU95ZGtsMDNLU3k4TVlVQlplQzZIaWxtSTVoTWlI?=
 =?utf-8?B?SWhkb3p2UkVBY0M3c0FWYTNCelpsUllLcytFN0ZiV3RGRVpsWThvUjF6c09N?=
 =?utf-8?B?Q0loblhtc1NsRnhTTlhqSGxlWXpZZENGc2E5L2Q2eE85TVJxN0s5RTQrQ0Vi?=
 =?utf-8?B?ZXhMZ1hsL0NxQmcvMGRGMHhBYVljaGpjRXl4MEFpcHlHcVhkVmRCaTJkS2xB?=
 =?utf-8?B?Tm12UjFDcTR6d3JrZGhvRmNsYlpRdUVDMTd0RGloR3VYaVBFZnRDcHJ5OVFz?=
 =?utf-8?B?RUMrL3JqMGVrbmd4WFZ6K2g2T29xMHEwTFZNOEZuY1JNajdEQ2pYdWY1bkd4?=
 =?utf-8?B?RzV6WUhSd3ZzNjZ3ZmtwNXBQN2hrUHpJaFlWZG1peTJ2RnlGTjVzSFdRdU1S?=
 =?utf-8?B?dGljcFcvRFVOMThsM0YvS05CYlFDNjNHYkZZSzFqMWpTcFZUb1JpOHFLUzVC?=
 =?utf-8?B?NlFOUHZtYU0yV0w2c25NMEdBOVh0SnNXZ1k2d1dSbVBhVko1eWpKcEFTblFB?=
 =?utf-8?B?RHNXZURNSTJvNmwrZ01JU2JFMERORzdJbXRpdkR6bHlkTFo0Vkk3Nm41UHJG?=
 =?utf-8?B?VGcwU2xpa0tzM2R3dFgyaGtTdFQwTWs0aG45NnVHZ2xoU0dSL0RBSU96T2dF?=
 =?utf-8?B?TXM2bm52Z2xpdE1mTnF3VTlLY2RCemFQdjV3ZDQ3SG5SSnhHOVJWbCtEa1Fo?=
 =?utf-8?B?RTBYSnV6NURFNjRydklIdHdpaGFySU9oQVFvTmJEaW1tWFR3Njd4S3pIVFpG?=
 =?utf-8?B?Mm9GWjJpNnVueVAzQXRScFlQdFo2cFBneVUzbWdIakYxcTlodmlNMDJ4YnZz?=
 =?utf-8?B?R3dyN21uNGpnN3NpMGVHakpiVVhUVFR0Z2w3OFRVMUwxMXB6R1dSVU1xeVRa?=
 =?utf-8?B?czRYbGVEM2FNZmxRK2QzV0xvNjYrOE9FZ3dCSzlwcFoveDhpd2UvQlcxNXFq?=
 =?utf-8?B?WTlzQzlWTkRNMEJTVmFQTUI2WXpWd0FlVDZ4QTdxUDZ0UFRaRDN3L1Fkbm9k?=
 =?utf-8?B?bGhFNWppZmNLYXl0alo3anlmaG1qS282a0lIaG0wQ3hCeVgxRzlHaFN6c0VE?=
 =?utf-8?B?U3Vhd0xBYno0Vk1Qb2x6anhIY3ZhaUpoQlhxZlJOOVBGRUJKbW1LVWRLdnhP?=
 =?utf-8?B?QzZac1liTjZvTjcrR01aLzFoVllaTVBTbk1rRFBGTk5KTXpFUnV5bTNOM0ZV?=
 =?utf-8?B?bm9LMHFuQWhRM2REWXduT2ZpMG5YNHNsUDRYUjIzSUpYRlM2ZWFJdEh4c3Zh?=
 =?utf-8?B?MVZ2dnpBdGUxdjllUEhmcEp5cmF6VEplb3B3ZW44WWlTNnFselFGQ0o3QXkz?=
 =?utf-8?B?Q3VoQWY0Q1k2NVQzT3QzMEh2S0IyUG52Ykp2MlRoaVBFYkVER0J1bmY4aHNk?=
 =?utf-8?B?a3VUWktKNlRHSVcvcjEzR3BHbmo3ckJqQTV2bC8wUUJ3MnVvVzZ6alhZMlcw?=
 =?utf-8?B?bzVsZC8xbzlkc3g4eWlCcGtoWjVsbmtmZ01DQVRuUzBOZElJY3I0WmoxU3NS?=
 =?utf-8?B?NlBKZXFyQTJQaDdIZXNHTUsyNkF1Sm44NXhrQ2YyVWlFeDJSNVA1aWU0aUZL?=
 =?utf-8?Q?WrerlSnS/YUZe8WwfAGyOFHpk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1169e351-4e3c-4c25-0e52-08dbd56fb7ed
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 15:33:20.8822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaRfPDTTf/1Xj6S+qfaxgqjX9CwfuHGxgsHDYrzNIzor9Gmu1by8zxgnNdBqDfF0ahe/6rqqEHZ00+h7c0u8aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7153

On 25.10.2023 16:50, Nicola Vetrini wrote:
> Ok, I'll send a revised version using MASK_LOWEST_BIT, taking into 
> account also the
> other comments about the explanation on the macro definition
> (which some IDEs even show when hovering on its usage, which could 
> partially address
> the latter concern).

You're of course free to do so, but since - as indicated before -
MASK_LOWEST_BIT() imo isn't a better name than LOWEST_BIT(), I'll
continue to object.

Jan

