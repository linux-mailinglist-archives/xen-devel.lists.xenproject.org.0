Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB17986A8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 13:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597945.932394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qea9K-0001t9-Sc; Fri, 08 Sep 2023 11:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597945.932394; Fri, 08 Sep 2023 11:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qea9K-0001qj-Pp; Fri, 08 Sep 2023 11:59:46 +0000
Received: by outflank-mailman (input) for mailman id 597945;
 Fri, 08 Sep 2023 11:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qea9I-0001qb-OV
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 11:59:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31c69946-4e3f-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 13:59:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7531.eurprd04.prod.outlook.com (2603:10a6:10:20c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 11:59:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 11:59:40 +0000
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
X-Inumbo-ID: 31c69946-4e3f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrEcbNQ01rwpA9zBz1hsW5npB1Q+ELEc+wgS6/BzP4i8kVB7huEX2UYcVCK1qIX4/SolLt0vcTfokzKtlVBupVFsF6L400y5gVbxf5CHy+1SkKK+FtXO9k2Q2Lf9mlKTSijnDy41CnZYvDF02JaMwp7vRdEQPv5juzgGfuqRnaGY6CKJmqGEOncl2xpIijxienNqNq6a41oTaeanNvj6TJoV+2RK/s2PjVEDppWf8adj1y81bKdPyTdLQwO6prVH7Ve63yynq3NJugZ99lvV/yS9ZcjrWMU70FZEzSsqDSaR2d+QRv2gPc5NCWyurgkACci0iVue+94wnPzhcobk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTYsfaMjEWskN4vEb2EkYfNw05s+SB4EQKcMrJtcfyY=;
 b=QnSkfIJsUSbdY3exjhXfDEvVPU3zf+tn+/bQcfMzeWVFSRx8XGVatC/6E6I6LfQVKpiYpAyq75eQgBtxnPvlMbs8r5c6YGq51cmQrc2rs3Ful1mjnVw5skT+ZHhqFykOzixmKK2njJbTxgxJmeut9Rw9cCOpMQDBQblE2+C5d9cqMZn6zjp0dbcqOAqtXCSC5AHbox8wUCTWZAYmdoXum56UEvSClBDq8p4yjJIWvUuG9qZP74jANiH/NwFfrVRVjubKosJw5Ri9G6NykdC49xCXFcUmW2p5DF94WcSMpsFsUN55tHOOsN/eEo8cl9MHk48FPte7eCy5dLYQck9bqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTYsfaMjEWskN4vEb2EkYfNw05s+SB4EQKcMrJtcfyY=;
 b=ezHCQ466m5yPT3UgKUPBFqaD2vAMeHZ+nJYM0ifx9HVLt4nIVv6iXbuQamprwBWMfsqd65wihZ/yGrt7e83Y+6nl7fMpAFIYffFjLrmAMGyuu1AVfjO3Td1Hq6MqoatLjfkJn5MqCK7wEc10trjbGLeF39h+R0PHgIvc8rXvHyRYfoUhUY34wmqRVq0nU/4Hz1xAVqFCrCgfzBIn3dycVPXV04cik2zK6FfgXVkyNRdyLTY/zBbQF/Mz6UU2u8x5k5dupKF/ZFEe3b28bc45bgsKZ6B3u5ssoehRQ52STRS/a6NGijpV2K+90fy/ukCUsySGXryx50Pw9eBYLjtGSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com>
Date: Fri, 8 Sep 2023 13:59:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
 <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
In-Reply-To: <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c95e82-9e81-4550-9838-08dbb0631506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EzlrfswZKDMOip/YyaQijuSdPJ561zbiX3szjBn1oJNblDD4R3U40oZ2BDPr5I3FdGLBAYLRSQhudITixgGCn+drUJw3hYEmeKIBVXLBFMD68boIkYaNml++A3zOLJAfzQqiplCg6eF7CWegcTbYzV9DEfpWkqugnyh+tm6ikG4NihDNsnvrGrAWVosZ3jizQQTJqE8bWDaVjLBMk6tNB25ncKBDlH24Eskxz+1T8zc/4+/RIiOgdMblC+ZX7/Tcvkj7PfFd+j4R3D26dKfzI/+Y+Q45t/G+sDBfry+rDX7MfmOaGaLfuOSPaRlt90BW51mF62J9vqNN3zUrzME1NU5klNSS6t5rB+RyG2lUeADoHaqeIg/eR949WSZouasHj+rM9yfViZ4KsEVnf2E3mh93knMGBIvU2Yer8nF62UUp+zDQJIe6SzKaTmnrXDCzYkQn+dmCW9nrB8UC76hQWL9N0rQU6cpo0wd9Ac5igCDwLMkgR3edB4QuqvMOWFAiK5LprL/Fbd54nZizHalnTW4KsBsVp1Ga2Nmj7PN1vKZxK3w+Z/E9shZfvVbm7rL1OZnAl0kI7zf2GESh1fvvbPCeYqhE+IOy7JgKrNzIKPLNiBTi8pWbnvxsh9IXBDKNLRSyeVyH3GChvMZh7ZFZ8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(5660300002)(6486002)(8936002)(6506007)(8676002)(4326008)(54906003)(316002)(66556008)(66476007)(4744005)(6916009)(41300700001)(66946007)(31686004)(478600001)(2906002)(53546011)(6512007)(26005)(2616005)(7416002)(83380400001)(66899024)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qy9LRGV1NE1TWEx6R3dUams4MFhQcU04cmlJK2xDRTlZV1hPZ2tFT1BEVzRZ?=
 =?utf-8?B?a2V5THI1bTRVR2hpakdKZ3Q5OUsrZFVZb2UybXdVWDlsamdpdDlmNXcvSU1n?=
 =?utf-8?B?NityS0FUZWJBUEdxWjhERTkwYTlmR2NsTGFHd0xscWxwQS9jMUFhK1BPaGF4?=
 =?utf-8?B?ZDRyL01nUXl1WDdObnV6bW9CWFY4bHF6Y1RTazJZMVFQaHgrV3VNWS9Fc2Yw?=
 =?utf-8?B?NGZ3RGpHa2lNSUlBNEpFUTdGSkQ1TUgrSDZNUnVTVEdRSHprNkhuRXBLcTNy?=
 =?utf-8?B?TnFQSGEzUFluakt0YmJwZlRlNGpkNmZwTCtnNThScDkvMmRIbEFCaWVBWmlx?=
 =?utf-8?B?K2NaWTM0NEZEWEV6d3dDcjljNGwwUkRNNUN5MFAxNEQ2eUlETDlGYVE5T1B2?=
 =?utf-8?B?cUtxWkh5YVBnRUFORzA1cVprTWJJanBrZy9ON3FMK2kxQXVhZXM0WjJzTjh0?=
 =?utf-8?B?U3pwdStnc2RpN0VXVUtKOHIyaldhcVdIMitLTkIyaFl1Y3hYS2pQaXVMNW5R?=
 =?utf-8?B?U1JwYlZweXRRdlN0Mm9GSm1aUG1EWXY1akxDbytqSkhUZjFROWdRQThzU0ox?=
 =?utf-8?B?L0dMTHdvS3RXbmdRYk9DVnNQSWNPd3kyQXMwSHVWSGNHOWFBUVJaR0VEWVFh?=
 =?utf-8?B?OHVqaWJQWnl6b1VrM01ZV3cyUlF0MHdxZFduaS9SVW1icDdSS3QzcW8yNDNm?=
 =?utf-8?B?cmNqSU9QZ1Vtd1BMMFBmT3hSMm1FVHR4UExkeDZHTFpLOGh0NjFUcGtQNngv?=
 =?utf-8?B?UzR3Qmc5K2dWcmkxZitIMm01ZG0za1Q2WE5McUZtMUZ2b0hMWW4raSthd0Jr?=
 =?utf-8?B?clZkVUpKeThMQk1Hb0t2a2ExdEVUaWYyZzhhOTQ5a1kzcm1LZjU1M0lWUkxn?=
 =?utf-8?B?RExleEdWdUZ5Tm84cUF1c1Iwb0lRREF1bWIxSmFXdlJZK0ZjWjdKSjJtbWU0?=
 =?utf-8?B?MVFFTjZoZSs0RVNxSnFiOW9RaTAyNkgwWjNWSmI1bGpBeHVHVWR6dUcrMzVV?=
 =?utf-8?B?bkxGemtmdGNUOElKZ3pNbXM5b254N1JiMWtVQ3EyMlV6TFU1OVdYVjZRZE0x?=
 =?utf-8?B?SzQ1czIxalRyM29URFVhbVlZTlF4VjVvSXJFMWFtS1RRRUFYbWt6bkxvcGFM?=
 =?utf-8?B?bTQzdWRQUm91dkpHall6b3ZERFBVSlRrcVdIU3E1UVdXMmMzd3RFS2RxUTdw?=
 =?utf-8?B?RVlmcWU2ekJrZlZRSThuMUhwV2R6WG9nK0RveTMxeGxIVW9DTVBzb2RRei9V?=
 =?utf-8?B?UXpOTlpoR1IwaC9lM0JjbndNUmFnTlN5YWRiL0dLeEl4dWFHaEZUanlRRHdH?=
 =?utf-8?B?QUtxMHNxMldrRml1VVhrWGN1eE1IZSs4MUhXa0graXNrdnFLOE5tWWpML1JG?=
 =?utf-8?B?MDlFcHNFN3ZBbUxIb2hhMTd2bDFrTExpYkVxVzZNbFpMdW9JREtzMlV2SHB0?=
 =?utf-8?B?dTdRa3FxNTN5MkEvM2VDYkRCNlZKSnhsNVN0RGJtay9ZWVpMWld6Qk81NXkx?=
 =?utf-8?B?dFM1TkVHeDhkRHNqTDZKcnlUZGdpTzlKUTdZRVc2YW0xeGErSExKL1hBWXAw?=
 =?utf-8?B?cS90aFdBK1hZaXBmRHdobkVTS1JTWDNTOEJPTDhNSFFKMnd3Y01TbnFGRTBC?=
 =?utf-8?B?TFlYajVSUGx4Ynhqamt2QUVHejBtcmV5ZjdveldTK3NjWU1MNm4yaGxreXoz?=
 =?utf-8?B?OGR5dy9hd3oyOXhNbmhzUVRYbHE5SVN1aXF0VjVMTlpxbzNOY211V1lNOWlk?=
 =?utf-8?B?dWdyMHpaMEZaUHF6bTlqVWRDL0x2ZjZ0bmY5VUpUaVZqd2paV3NnYitTVUVN?=
 =?utf-8?B?dmREYWxMMjhrcUNwbURIUXpxUTg0ZDdDNkd6Mm1YcHJESzY0RlZLSzBaM2pl?=
 =?utf-8?B?Umc4ekU4TU80Z3pPNnVwRG5zL0tNQytxK2tiRkkwUGRac25YT1pTQVpGeS9B?=
 =?utf-8?B?MWRmLzhDNURndW1aS0FKcnR2QnNBa2xNbW1DaUY0aFpVYTZRdVpXVExaZExX?=
 =?utf-8?B?eFJnUjU3TFhtdGJ5Q2dsY2d5dDRNQWlOeEpkSnh0YTN4bjBVSlcxVUNoMnZV?=
 =?utf-8?B?UEw5MjllZ3UzTERrdC81UmtFa0Z5N1ZrL0prTHQwai9TalJsQ3pYZU55c2tY?=
 =?utf-8?Q?qijdS64Lb7Qgqn0qROd0VnFal?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c95e82-9e81-4550-9838-08dbb0631506
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 11:59:40.5032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAAcbCnzA4wXYIW2BZJQrTFw9DJUJ2Nk1JfaSNfKsNg3HFYLNdA4NHUyTbjgeR0MLJ6jZXgXWqUfjRTnPV6fNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7531

On 08.09.2023 13:57, Jan Beulich wrote:
> On 08.09.2023 10:48, Nicola Vetrini wrote:
>> There is a build error due to -Werror because of a pointer comparison at 
>> line 469 of common/numa.c:
>> i = min(PADDR_BITS, BITS_PER_LONG - 1);
>> where
>> #define PADDR_BITS              52
>>
>> I guess PADDR_BITS can become unsigned or gain a cast
> 
> While generally converting constants to unsigned comes with a certain
> risk, I think for this (and its siblings) this ought to be okay. As to
> the alternative of a cast - before considering that, please consider
> e.g. adding 0u (as we do elsewhere in the code base to deal with such
> cases).

And just after sending I realized that this would still be disliked by
Misra's type system. (Much like then aiui the 1 above will need to
become 1u. Which is all pretty horrible.)

Jan

