Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59E5671A0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 16:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361383.590866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jyc-0003o3-7r; Tue, 05 Jul 2022 14:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361383.590866; Tue, 05 Jul 2022 14:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jyc-0003lc-52; Tue, 05 Jul 2022 14:56:34 +0000
Received: by outflank-mailman (input) for mailman id 361383;
 Tue, 05 Jul 2022 14:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8jyb-0003lW-92
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 14:56:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7f12518-fc72-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 16:56:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5331.eurprd04.prod.outlook.com (2603:10a6:208:65::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 14:56:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:56:30 +0000
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
X-Inumbo-ID: a7f12518-fc72-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0L/OOKo7Icn2BhWfz9Xq5Zuvlc3MOqjeZ+rUiAZ6i4BCRSXkZFwWVWPB2AQx+3EqoTXgwYH79CdQ2iEkVKlvtq+nun9wsr0M7WGyZ6W9nwRF358tVZ5Q5Yy1PL3O4vnfj05krRhFrS+Spe9ntLB8KNwRnQasOrMogUHnteIRxaOjm2nSaCVQ+/KumCQzfDOadM9qkle8bCsA+3ovcB8ynkMYxumWB4sJ4I/bOgH35SNeyTtnaYEAqCaRoqIf+IYbpG5UqyOtMdC1aAsjxksvvu2rGCxQzEx7zPhbOtGby8e0o0lK6vLIGEEk3kGYBQ3LvJjbGAGP0LGCaRhGdW/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhJ0XtDk3rChFR5ysA3+pv5k3UeXi2g5eZiEsHNwlSA=;
 b=CdawieJjtECmiFoQ7ZFngqbyNv5hVy2Tx4gX5UmKx8Y3ah2fSJJlSvd0ietxsyguIbfuecdtMShjz/z+AIAQT0z8jkfh78v+zXNFsj/v6lkQhHv3kkmYzGbMTgEoQPBsJ/07rDLG3Ep/diEE596E6AJGsY2YyS6JDp9RFf9Xsi8UX2NsA99nbUshg/fXOa/6GooHVyQM/z0CVNfdmIREOiZaDdb7rl2w9oKkaoWY1tkI8RN0XICfzZX2bXZ7Eu6Va7piSUpXZoulNCgjM6LiRIZA4WN323vq918HxCq2eNRGUqtKzbQKkbwFZR8Quht5HXXn1tPiccxvBQAbu8hqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhJ0XtDk3rChFR5ysA3+pv5k3UeXi2g5eZiEsHNwlSA=;
 b=uJ/Du0Xc0p2UD75Nsdt5wE4hBvec4dwQR28WMC0HaoNSTLBXVwJTKjylUYwUbf/63evLw3uy1gEAXD7lHyMwgCTnIBUxKhgo7PEm/XDlx2pi60t+MhZzxY0RSLR6+2k90NFC/m+sK0ecCtdOYWmC6vkNOBrN6mE53ba25Akw6jGPJZmvs2bCc6mRjPpv2JsmVIDRHuM3PEBWpfQgbMXgwiT1QHnrF88JkOa73XVZ4GfZg9Qv1E4IyjIq7XHOJsGvP6Jv/+bmC0tytvjGFN/k72dR70mHYhDtl30VqxtjXOROCrlq0/tBBHWKVn8a8rpk3L/r1FlfXbjcgLxAynzDEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e75264a9-9938-725f-23d8-4cd968969c7b@suse.com>
Date: Tue, 5 Jul 2022 16:56:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/8] xen/evtchn: make evtchn_bind_interdomain global
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <b8324e47bcbd7feeb992501b22b46f0ede3c2c3d.1655903088.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b8324e47bcbd7feeb992501b22b46f0ede3c2c3d.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f947cf-2989-40d3-a21f-08da5e968b45
X-MS-TrafficTypeDiagnostic: AM0PR04MB5331:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VS8zsRdb8oed7nzhwiZaBwtNKZBsbdFsfy7/K+60BdhmHZmLbpQ/QLSk9d4e7nS3HLn+3fYCetXJ6CGeCsDbJIo6JcSugzzIAI1VWP45FzIbmXHKgi6lwePi9453oZG9pLU8vYNqgmcZwdKzAQlU4WBm3y9BM18jGSb3HoWHpPnyujh37JSNznYdVT/lyehi49A2Iq1rzMEdRUbNoNhpWGMcq78VLHovGJJM0XGabz7BASnhYYhAjf16ylA/bNBGbFVGQtflYcLZ+GN/TDxddxWv/RmW6FQzccewIZdCcoxkImWBA2NSTwo+JI3rsHbu+qYTvgRy/2OsctvvtR6HeVgsAWjtcfeOGTyZ3wAyQ8A/WzRp31vOaB5YTdZzp8ZzM0n7OnJNW6VonpuvQX2ZEsOPaTCFEnqz38LrYq8lHhRWfvaL13KIi51iEKm+cKJJ0g+jmczG1GwRSCexfOC2IakNbnOeWrHvjz3giC1YZ1KVdNODhy74iL48Bh9wbM3qTlhHjbU9+tdcnpGZ1gA2oI37HEXtSjE/8zkZ6F6ie7uvZ2/0zs60EIPqGOPqEnuPMUSYDeybpI3E5LomUvrh5DtKJIbWhwLeQJ6u69hZiI3SliWYuRgP3yEDEN9KuuqluxjtOKcYtlspod7MpVudFFBKNG6iRODV1LQdJsvdXQ+o/LuBJ0egzwla1yi25MOKv0LjBn/UVS7If5PVwHXRx8L7LL1hM5adan0Y978S4PvdEeyS0mzFgLC7CD5tJu0pYGYVTkyazP8qXhr1zOKRf01cxgFDq0n2yKo8CsUi7tFj8apcF4vu2edoDi6yd9Kj+WYhc6m3R8PEbzUbp6xBrGyaov00KIH1zp8Ul/cxN/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(136003)(39860400002)(346002)(8936002)(31696002)(38100700002)(6486002)(86362001)(478600001)(66946007)(6512007)(4326008)(8676002)(66476007)(66556008)(4744005)(5660300002)(2616005)(26005)(186003)(53546011)(316002)(36756003)(6916009)(31686004)(54906003)(2906002)(41300700001)(6506007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2RyZG1TK0NPM2o4SHhXNlpuOThQYlBValQzQnE4RjVmcW8rb3kyY0dOTkRm?=
 =?utf-8?B?NFhlTDhpUmpSaU9QREtxWTYrcG9iOUcvVGpzaXZQTmdmQ0wwUVgrckRnZlFP?=
 =?utf-8?B?elFoR3ZiNmducXJCNTdNZmFrcUVYenIzM3QzMzBmbHlqZ3V2bWhKNWRKQkdF?=
 =?utf-8?B?YVBwN0l2SDcyS3l2dDJiUDVuMm1acUprVWZ3NHFoUHlnbjdCaVYwcTBKN1NH?=
 =?utf-8?B?SzRNbVRHc0xnUThRU3FQVndMMkhFbkhhS2s1Q1lqcittYlFsdS83eEk4K2J1?=
 =?utf-8?B?bmpiK1NpSXJaWk1leVN4TVNqMnM2bllpQ1BGcFdKYkMwNjNRM3pIM1BvOFFY?=
 =?utf-8?B?Z1hkSHdHWUU1eWl4RTJwcVVxSnB5TjNsbTc0VXJQKzdSMnpWYWViOXQwbjZk?=
 =?utf-8?B?Y2VsTldCVndCanJCMXVVNUtjVm8rekIwVGZCU2xaZ2VtS1NDSkI5SkdYL29l?=
 =?utf-8?B?QmVuVndSdzB5d0hyWXNmcmFXSWlxelh0UUhSL1g3Q1pmb3lCdW5RVlFtVHBI?=
 =?utf-8?B?dEtRemNENDh3N3hmUTVlakNac1h6b1NDQTl6bzNwakdueGIvWUhzZVB4Y3hm?=
 =?utf-8?B?NXROYzVzRWQxL09NTzVkSlVIaDZaRmQvREFXbzlUNkEwWUhmQnZaYnFadlg0?=
 =?utf-8?B?R3paYk5seFpnUW1GaEJOTFl6WnVqbm85aXlGblJBWUlxcmVqSTdwM2J2QWNu?=
 =?utf-8?B?amMzejRhVVpPRjNMS2Ewczl5ZnVEbituV0xtdTIwaVV1QmtZVkRTVlRzWWFB?=
 =?utf-8?B?V2kxWGdpTkJNNDFscnB1L21kNzNjWGhUNzRSZDZKRlJ2QUMrdkFwS293RnFw?=
 =?utf-8?B?RGZmNEYvM1k3dFhNVXJ5OUlFbFZlQU1uZWcwUVJzdTJ4UHlPVHJBVGZQREk1?=
 =?utf-8?B?MER0N3JPN3dqSUJLaXJoSWFBaU5IRGxPREJwS3N0bXI0UnBlRW9QY3dHb0E3?=
 =?utf-8?B?MFM1MVhCNUMweTA4RWVTS3MyTjhOdXpoTEpWei9XdFB4MEdmNnZDaFlnVkRP?=
 =?utf-8?B?cFZYRnhocytzemoxTVFGcDNjQTA3OC83aUUyRXNSVmkzV3N0RlFIVXlSc3hG?=
 =?utf-8?B?VG5vQ3JPQm9IRjlNZHZyVEwwL0s5MGhhMnJETUlaN3JKMXlleGpBWFljNStl?=
 =?utf-8?B?SFY5dk1tVExOUzhqZDJNUnJndmJxZnNsWVBQQ3pEOHZ2REovOGN4OGlDUG9o?=
 =?utf-8?B?a3oyWDJuQVB1L3NMNk8zZTRJQW50Ni9BQjFHTXFlY2IwVVA4ajA1OXB3cDlq?=
 =?utf-8?B?VSs3bHNxbDloOFRhdmFDMGRDMng2Qi9uU2tHODN2cnlQY1hRYndWeWdqUDJJ?=
 =?utf-8?B?Y3F6U3R6K20vdXpiNm1nOE83SnJOZ2trQVRkWmJiOVVjbkJjcFR4ekNIOHp1?=
 =?utf-8?B?dm85ciszZk4weGpLZ2llU214eTNKWk81dXRuZHJZQ0VVNlF0d1F5dGpKajJm?=
 =?utf-8?B?ZXRLSCtRYjVSWExJaExabTNPMGdvMmZOeUtQN2NBSU9pcXk4Z1hZNzl3UWZo?=
 =?utf-8?B?TW9qWHVtQldldzZEOTM0SDdzSlBlak4wM3RwVi9oWldockhVdlBuU2VXcDNR?=
 =?utf-8?B?bURCRHRobU9Ed2VzZWNneDB2b3dJRlNrbzREdkNVdmdNbEVmai9jY3NKZHcr?=
 =?utf-8?B?akRWREZzZmVmUkZCa1gzZ1RXbUdTMCtGRHozZEhGeFhBYi9lOFFYVU9oN3lL?=
 =?utf-8?B?UXphcDAyVVlNazJHMVl3SmtxZDBhME5vV2VwL0cvaExkU3dKZGc2ZU5IUzRH?=
 =?utf-8?B?eDYwZ3JQOUYxYjZGTVNKbWxFcFdmb0ZBZkJyMGpXYUZPb2lzUmhGQjZqUTBL?=
 =?utf-8?B?MWFmNzhvejBDRzJnRUN2UmVWM2w4TW9lWjdMbDl0UFBOUksrNzl5MVNSTXEv?=
 =?utf-8?B?UjBNTlhaem10UTFaKzNYWUw1K1dCUFJkZkhjUXoxcVYxQllETUdRS2Q5UUhP?=
 =?utf-8?B?alNHYUxsSEt1dGU4TFRyc1JiQjQrTjIxVTRvU1N4N09DYk56Q2M0NXNQc3Zl?=
 =?utf-8?B?Q01DSHdhT3JlYnBDdEx3QnplOW5oU3Q2MlBidlhlQ0UxRktxeG1UYTE4MFlF?=
 =?utf-8?B?a3I2TFZXbmFDV0FXVU9tajVIeWhnbGM0VmhsVUVabWxDSzk4Ly9MeVVwY3Ay?=
 =?utf-8?Q?HquqSm02XOxf6vHsD/7XrmAJH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f947cf-2989-40d3-a21f-08da5e968b45
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 14:56:30.2454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weoaXUO3/J6xUZkNSq2BI9h/egn3B/0fjjc7OY3eFkcnOOPyf1+tUjVESZqX4WwKCYWHAzjmM9QZbW99hpk0IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5331

On 22.06.2022 16:37, Rahul Singh wrote:
> Event channel support will be added for dom0less domains to allocate
> static event channel. It is necessary to have access to the
> evtchn_bind_interdomain function to do that, so make
> evtchn_bind_interdomain global and also make it __must_check.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

In light of MISRA I don't think this should be a separate change.

Jan

