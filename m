Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AB77AE6E4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608298.946686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2Yz-0007gg-Lb; Tue, 26 Sep 2023 07:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608298.946686; Tue, 26 Sep 2023 07:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2Yz-0007e8-Ij; Tue, 26 Sep 2023 07:32:57 +0000
Received: by outflank-mailman (input) for mailman id 608298;
 Tue, 26 Sep 2023 07:32:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JCSl=FK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ql2Yx-0007e2-UG
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:32:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7637425-5c3e-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 09:32:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9387.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 07:32:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 07:32:24 +0000
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
X-Inumbo-ID: e7637425-5c3e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI++HXbPqIMajtCOwdxApFapNNmkRsUacmUohbD6exoVLbHSSap725Ndmv7WFqwx4Tv22ByELblL9asg+GZwUsqLCSqNOGnRjbln0Ud4kfGlDjg7pubceV/viImnxfu/ZaN0aLSMKQtPtFOz2qBALlJa6kN0IpBjq0Yayz4Lv2df18ChFt6zfmC7G5H0idx1OkS2dbzN6bSKXEyQ9vFBBEgoAH5lrfNZZgLY1m8AmOy28NrLWttjUODIcc0MSWvywrgNpTMAcwNYxdiv4vq8/OWsV2RFOZz2JmXrIUHNx9BnKHqlsAT07CUY5dYSbi3enqVy21iU9yjhkD7w2l953w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyxJEsHwmToT1pWzQ6OsbRTzkPir4+aJVLEwtRLkP14=;
 b=kXf8Zumg5eeixBU/WGF6dl4vyt2DsND9/cpUv6JTIU9PVnsOUwmXAgsagdgSBqE2FgED3k0QLcMbrKw/JAdVEtUlKX1GH4sWwJTitMk2fagU+VLKumT8qOH+BEuBLxRLnhqfx9xJNQgExzdg3H32Gm85oJssTqWcrIcaMyFsn1K52ah9AkRrCVCJcy7wxAdTbHr5Xl5bJC/B61ZLcqN/8O+7rZxn7CMvtEfjRz/wrBfBTaDwjMT1H3BFUqSawRaEVEelMrFxCYyollmas8PEAIZQOTigaxjuTPF5YR+6Pg9gmtmPCPsP5Z9bPmMZSiglLbrKqiFZ7o43/zfJbadGrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyxJEsHwmToT1pWzQ6OsbRTzkPir4+aJVLEwtRLkP14=;
 b=dIFVBEApy1PFk6pe4E2X/Pn2XFbRroCKsTuWW3AvlFoecWrsvCbM5AdwaBhaChwdf2VW52+tnnyT9v1KnY2K+7xpNpDthBsnSAwta5kKGMTpncB2rorxuYLqWToKM0zAlQLQ7NzH9XfWECK+b2kRy5IWBYvZGRX8/HTkmTYLNrXMEkiM7h6GlaVzswDY9ni2KY3V5P2VRhNf+j384nCmFpd44dItCtn8pTqjxJu8oG6xDDwx+tW7UBh1yeCouFO7CTnnq/R+2gowvnNZK88MPbTYgLlOncEJtbtu/n0rKms2WVx/D5zkoWs/x6BwNQTrL7pjlgaC5CVQEgP41aYGkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e74d0b4-c2bf-46c2-b3df-515f6934cda1@suse.com>
Date: Tue, 26 Sep 2023 09:32:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: d41cdb89-a4ba-41bd-0112-08dbbe62ba25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9CO+uCnXwmLK7mwuoMVT2MKpipgR5dChdPHrTfhBuuH4ixJ+V5kFCSn7GIQUFyEbWnxVTh0L0YiaVnJcI7kZOsecjfCyeEmMJf0NHUhOTZdB6mD0u8gK/kt2MIuR+wZbOLwDn4d283hn4tyIh+U7zivdzq/aZ3HZHRHuKaaillK+uHViaiTTt48Ka3xKC8xqxwn1a467dAAVRIz0OCzwnpidA4V54dh8Y3OVdZlnVSJY9iBE1i5BVsl9/nDU2WcXQgRxDeKkL9Zab78D5Fl2q94YE2r0+w+HG0av+ndJkQy0Xd4ebYGsKiLcVVzWqXX/nRsaJcGU/tNtssl0TF/WsmpmJ6Kf6VIz4Y9eBZtvrytUB5T9OQcgR6/+1/gL4vTOOqJYPJpwUUQP3iP37Gxr8zNXjDAVciqKVfCwDhpyoYF/YH/DN1DVA7KTFeTRajpWUpIjl4j5kz317j6Ins+mS5mNK0HlTCtKu0x9SSpGJuhjlVJJCIDxSQzRJZqqsKtHDGaOdFxP2V6lUzIu7tFpXB/PWNrNpYQU4GkoAFhSgGbN4lOwKZoXMv7t+ys0M63goIKJZvUYkIj8v0rQMvoGSqC8bkqkiGnFWI+Z8xM3mkGZOVoOtNMbUftSACHooBNOmH9zgytc3nel6fSRPWXmeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(186009)(1800799009)(451199024)(53546011)(66899024)(31696002)(2616005)(38100700002)(41300700001)(478600001)(2906002)(36756003)(86362001)(6506007)(6486002)(66946007)(6512007)(66556008)(6916009)(26005)(83380400001)(316002)(66476007)(54906003)(31686004)(8676002)(8936002)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3F3S3hPTFk2bFJCT3FZejY5WDRBTFdudFIyR3kzd0xBMTVzYUFxN1YwZXgy?=
 =?utf-8?B?WkU3a3hOZW5XMGVGZmRSdUVmTFhYR0JkYW9sN0hFcnU3K3ZGeDdycUxaSkZt?=
 =?utf-8?B?SFJvaS9IblZIUlBlZ0thZTR2b3dXNzB5cHdCM2J2NlpXVGJOK0txdTJHa2g5?=
 =?utf-8?B?MzZHem1DQjJ5cFhvTXcvVkpHMUg5amRpNkF1REJmdkdBS2gySG43eC9VUHhZ?=
 =?utf-8?B?K0hnWWJPME0rM244c2hXZkFoN1VTMVZqSzF2cTdMeVZicm5vYlJrQko1TFlD?=
 =?utf-8?B?UXlTUHorU2E4OWdWbEhqWWhqUCsvRnFvZG1lS0w1TWEzNXJoV3g4b2lTTW5K?=
 =?utf-8?B?V0VuSlpVbTQzWHVldytvYUI2dVcxNUpCUzVuVTNVbHZaZDl2NDRoMVg2Q0Jx?=
 =?utf-8?B?TEJzVFd1UVNHZmY4ZzBpVTZ0TnViNk5xNjVKb3EyTlpFNVNVUHprdGtIWXZC?=
 =?utf-8?B?Vm1iVlVhT09Eb05zVFg0NmQyZmdsQmJjYnNjTnBCYnpwWU9rZmlmVTkzK3Ny?=
 =?utf-8?B?S1g1RzZsM0Z5Wm1wRlRSc3UwQmZMOTQzR1FCc3Q2bndGSUp3VS9VOHdUNUVq?=
 =?utf-8?B?ZXRkWDA1TEdwWmltQXBLYXVtR2NmaFNWemt5a3ZaSGZFVkhvaS8ySEozUUI1?=
 =?utf-8?B?aEE3cG9WSjRzMkxGVlByMk1mYVhENm5jWmtuNElpVDlFaVJ0QlpqaWVTUjVx?=
 =?utf-8?B?Q1g3YXBFQllSVkl3Vy9GVFgwZTBuVzdKRWFLZHdWeUVMalVmWXNTWktNTy9i?=
 =?utf-8?B?MENVZmFHdCtaM3RmRHlNQTRmMFRieHJXVlpPcFJHYlo3QUJWblprbXRsQjRP?=
 =?utf-8?B?VnNxNEtLTlpuNDQvdUlrb2Q5YVMwZUp1RitjRERZbFh2RXdNM2ZSVkVnNzZm?=
 =?utf-8?B?NTdMS2NoaGR3VDBRRlRiaWJjeFY2L3lnamxUM2lOZlFFZnYwYmZhdUxiOXZ6?=
 =?utf-8?B?NGM0MU9Ld3h6TXpGQ0ZVZU5jUEU1cjI1ckFPZEh3Z2VzZnNac083M2FXUmIv?=
 =?utf-8?B?TkJpMks1eU1KSkpFcDB6KzI5U2tsbGFHa2pPV1hXMW9BTmRBNk9EM2Z3bzBE?=
 =?utf-8?B?S2NqL2dBRkVxVVZML3l6TnkwVjJucEF1UGJXYUFyTk1Vd2RWQ21XSlAxczJs?=
 =?utf-8?B?MnlPU2h3cmRsN1l2ck9udmMzZWdqbWhmRXg1YU5kMVFXRW5ZQ0NPMCtidTFQ?=
 =?utf-8?B?a296TzVETUlrYU44VmtiM0RMVFBhZ2dqekpXQjRGOTloelNzU2kwWnA2MDRF?=
 =?utf-8?B?dzFvMmR3KzRIdXZHeDBsVm05WlZYbUo5Mkh0K0dENlhjK1R3VXVZdjczYjEy?=
 =?utf-8?B?RmU4R2Z0eE5Bdks0UW5lQ0FrLzZsUytBS2ZGSUlVOTdPcUM2OUJLMkFsMjBM?=
 =?utf-8?B?VlQwZGNaUGhwK3Avelp4UDZLUVBHZld6U2c4RjhvelJaSEI2K0lYa1Awb01T?=
 =?utf-8?B?ZEVYMnhJNk85aHNJdVdDVVdaMTM3V1o5enNmQ3BaRGpaazBIblo0T2VQdHRR?=
 =?utf-8?B?citQaUcraGEyVjlEQ2h5d1BoU0VlTEtvZWZqYkxkSHZDNlBBbWN4cUxPMU9v?=
 =?utf-8?B?MzUyVWpUR1FyTmNWcjhPM2txUTdaYWJEam54UUNkblhjTnRHcTNub0QzOXdG?=
 =?utf-8?B?bGZyOFFuMmtJTWlVcXlXdEtBZXRxWjd5R1ZIUmpHTDBaa2VVblBRY2MxZmxu?=
 =?utf-8?B?alBPbFZUWmRjSnhqNjJpb0xYZWRsMWdObktWeFFzSWpjUnozemM5RlMrbFlV?=
 =?utf-8?B?TndQemZsY3VVRUdvMFZDbzYyUStSTFU0TjVwQzZaQjBHVEVSR1JxL1dabUxi?=
 =?utf-8?B?TDB4ZUt5elV2V2g1Q2lUM1ZFTkkybFRkSWc2T1hyY09NNHBQQjM4cUQ2dXVi?=
 =?utf-8?B?SE1XRi9Bc05RRkpOMGN0V0tXcWkzZnNGQVZNT29iUXVVcXZwM2xTaTE4dVI2?=
 =?utf-8?B?Yi9tM2ZIMHRxOHdtQVJ4UVZvc1RvTDZORm9uK3ZLZ1QxaEJwVGVNQ3ZLSzUz?=
 =?utf-8?B?V3hyWG9iVXhZaWxMWGNoY1hYalFlSmduTjU2VGgvbWNtOGVqc09HbDFSRlVJ?=
 =?utf-8?B?Ulg1WjRsV0NzcThuUE1pV0trN2pRS2dqVW5SREVGcnZXcWhMMlBQbnZIbGkx?=
 =?utf-8?Q?zxKv8OzftsnZ2o0ktRU1IKjFp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41cdb89-a4ba-41bd-0112-08dbbe62ba25
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 07:32:24.3212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JK194jT9cVrLKODCLCVtKWHdKWjw2HpDvrctXa4L3swd/7q+nZSpMbPEbdr7pxutgz/UQVrV6npZAuglim2Zog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9387

On 26.09.2023 00:42, Shawn Anastasio wrote:
> When building for Power with CONFIG_DEBUG unset, a compiler error gets
> raised inside page_alloc.c's node_to_scrub function, likely due to the
> increased optimization level:
> 
> common/page_alloc.c: In function 'node_to_scrub.part.0':
> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>             bounds of 'long unsigned int[1]' [-Werror=array-bounds]
>  1217 |         if ( node_need_scrub[node] )

That's gcc13?

> It appears that this is a false positive, given that in practice
> cycle_node should never return a node ID >= MAX_NUMNODES as long as the
> architecture's node_online_map is properly defined and initialized, so
> this additional bounds check is only to satisfy GCC.

Looks very similar to the situation that c890499871cc ("timer: fix
NR_CPUS=1 build with gcc13") was dealing with, just that here it's
MAX_NUMNODES. I'd therefore prefer a solution similar to the one
taken there, i.e. make code conditional rather than add yet more
code.

Otherwise, ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1211,6 +1211,9 @@ static unsigned int node_to_scrub(bool get_node)
>          } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>                    (node != local_node) );
> 
> +        if ( node >= MAX_NUMNODES )
> +            break;

... this clearly redundant check would need to gain a comment.

What I'm puzzled by is that on Arm we had no reports of a similar
problem, despite NUMA also not getting selected there (yet).

Jan

