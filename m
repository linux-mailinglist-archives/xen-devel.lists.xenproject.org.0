Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3E6E94B0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524253.815040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTYb-00060N-Lk; Thu, 20 Apr 2023 12:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524253.815040; Thu, 20 Apr 2023 12:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTYb-0005yf-Id; Thu, 20 Apr 2023 12:38:37 +0000
Received: by outflank-mailman (input) for mailman id 524253;
 Thu, 20 Apr 2023 12:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppTYa-0005yX-QI
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:38:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44842d9d-df78-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 14:38:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9123.eurprd04.prod.outlook.com (2603:10a6:102:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 12:38:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:38:33 +0000
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
X-Inumbo-ID: 44842d9d-df78-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLp900ZfRDhbiUKwT77Mx2VF15lp1wqI+ZOCjpSv2Wvw/Q6SL3EZGYU5FG1b8m2/TWxu5aydywyNxxhf9GmV9GSdLXvFiAPZGlMOZzPibzCXNkgXhRwNu+/glk4pLVgcdAH6V0xYgzxG8FR3HJNhLkIT2k1C94n9f31BOm2IPFLXLmJUx8E4VDPA1x7Z1PeEaU2eBhNeuUJJc+7LLpg4ypu59vUflabMXe+HxkP9uE2WUKh/LomiF0gDcyzYV73JlGZ1xKEj+b6k8WXsqfQ02J8/+uEm25X4Th+gmg+WNwBN1rmKK1qd66TkRes7OpSVnTDI0yTIiUXEW5lg35r7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4To2x6HVjUmz8BqSUY476S/NfcKyHY0DK5xyL1YWgTU=;
 b=ZryiYXxG8ax7+V8vLQYQ6J8VOd9E9AOIPL4D/2nRLPVK144SxoaX6J/wS826P8IXFsOuVWweSotRq/df7OXfjAB+K6ff5GWzBlLdPU1rVchFFyiZbL9ctJdpYMXNw/HjRwvWUlo5jGbynd+q4TGWrISTBMrkTJ4t0XTPyEcuH39QKswb2X8ijpOMO+SrOEy1QN5QJ8tnubhuEO4/FqG05zjv0EF4Sy64WnzmXZ8rPHqz4ngoEn92tGaAETDWQiYexWHb42QI8Fy9U9vJsNIEYEUdGjnuXNGzHLYMXNva6VZiTcyqUiyekUQwCYbElD95dLm91OdlFzs4RaAyGBvalw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4To2x6HVjUmz8BqSUY476S/NfcKyHY0DK5xyL1YWgTU=;
 b=UCNchg7eq4VwMV+w3E/Ys5ciYBR6bjkbBL/mr/ZlFBKUh6BLr25BHkzHsyKBaSlXgdqrV6AXEJ5x54Do4IfEQgFttVRr4DjbFSw6DP8DXfAGNWEcyMgTcKdaP6VKfFbUIzmbcWVWOC1eotfuFxdODwrvEst8CzgRIWGABP2PTIuEJEyGsrlDfQY031I/yn+RmHXOCrqvb15Sliq8ae95PxQgHOg8Jn9l8cUrmkoOaD819BJyAJJB9YXnxKIPa8P/Wqp6btu6yL17wfjHsAu+At875kGY0fcA82ZWHSU2g/NgNDPl9+bwc7n+gzo4Df4YvRSoBi0lCw/txnawi/TgBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
Date: Thu, 20 Apr 2023 14:38:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230420112521.3272732-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: cb756cda-7ec8-4529-31e8-08db419c2757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUDRYFP1r1gGMYXqDG2f2bs8X1URUkMPYL0Y/+C61lYK3Wlq9a9yv0p8+qEhGWUuD6Bmzupc2ODvVRZkAceDBvCQEJfPuehSSnEuX3y0+3GHQNYWsf48OCpw7m9xuO3lBYa9D9BmngS51gZxvHaKt8oFP82HrxfUadW2jRSMqou3lIaVhp4M0WCdrvIzUd+BsBb2+Hbeoqn9QPNf7AoG0QAVYreXN3CD8pWCVpWgI99Kn8kS/JcO6Y45M+BfBMzjya29N7++bHAfvC2DnrWfWYAvEV5LM5gvhIifOEbY8mzCzlQOU7eBWB5MwnS4vliR0EQDPbigc69WAryQ3+BilzvP7d2uny57Wij7kRzHAZ2x3rGD/g//3rw7vSRiilYZhJGhVxrbkyWguMLvZkFHHS6U29MCIs/g2xvUQbRDB6VMYL4TaUEua0uvAxHIxiEfkMHusv69Eyck47KT6c3U26r4ExN+Wx3rh30XvF01rZOtTUYAYJOjrtluohoDcuFZQW2/UShRvc8k5ySuHYRDVrW3QLAzTCkeh7LmbJ7tMCOk4+E9/NTr7SLtxlmG1+33+zBclyq1CkHi1n+aGj3yvCeXlT07pzULdrfxshjNGx5o44iart7+fwBmHm9mr5uI7NPpFgmzvmMwOfcYZabJ5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199021)(53546011)(2906002)(54906003)(86362001)(2616005)(66556008)(66476007)(66946007)(6916009)(4326008)(38100700002)(36756003)(316002)(31686004)(6486002)(8936002)(8676002)(26005)(186003)(7416002)(6512007)(478600001)(6506007)(5660300002)(41300700001)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzVVcnl4VnJrbUFFcjcwOW9meTl3RTA3REFLMDhCeXk2dGtqOFFzNWJ5VWg2?=
 =?utf-8?B?Z0s2RG5sc3NKTUp6a2VZenhBemI4UXE1M0VQNm9pR3U1MHpSeFY1N1Q4U210?=
 =?utf-8?B?bWZuWUE3MGRVWnNBTUx1WDk3ejdUNzZLZUdiY1FETmpQWWNuNElvNitLU29p?=
 =?utf-8?B?Z00xc1hJQ2cybGZSa0IxeFFwY1hiNUxJaCtaVVpxZlk4T3FQSEFvS09IWHVJ?=
 =?utf-8?B?Z1hqU1hSdHY3aHBLcW9YSHJqWmZvR056TnZPMy9oSE5sRmYzcDRZS1dVeG5J?=
 =?utf-8?B?UkU0MkRuakdLOXZma2dkODVrYmFSQ2ZTbWRtMUt3NCtsMzNDSTdVZTEvbnhL?=
 =?utf-8?B?M2RQaEMwMjEweVVnTGVlK1R1YVN1eGlmOFdycC96akdUM05uTmQzZkxab3V6?=
 =?utf-8?B?TjlxS0dzNlRtQndqTnBvYUF6NlZRWWRMWGppSFB0NW1vWll0YlNXcE9ZQndS?=
 =?utf-8?B?Q3IzSHU2SFlqWDVDRFV1bXB6ZHpBT2hxOFhQZUxvUFI4Ni82YTJYYk1FVUxM?=
 =?utf-8?B?QWJHV1VlM2NMQzFqanpQaXlyRXdxTWRVZC9kWFRsNWg5UGI5WUNjOTRBa043?=
 =?utf-8?B?RVBrOS95SitJZ0VkMHlxR1ZuemdCczdvcVdodWkrVXJ0cFJoeWtKR0FvUDJ2?=
 =?utf-8?B?b2E4a1dmOEVLVjJ4T24wV3dTYUxJYXpiTkJMQnFuYzFyWGZIeGJrandhNER3?=
 =?utf-8?B?Mkt1K0ZqaC9hUmFVa2ZzNUs4L3A2bEZjUnZmUnEzME9VdzVhdDAyVDQ4QWpB?=
 =?utf-8?B?UlVyOE9KeUNwamRXbWxJcnFWTkV2dGk3dHgrTXp2OEFMb0huTmM3ZHpyVkxW?=
 =?utf-8?B?dCtIZFczQkpZTlhzWE1XSFhOMUdPdnpQR2RZTDZLMmpTNWkzNHBybWdsWE5p?=
 =?utf-8?B?Zk9kVVdPSnhHSHBjUDYvTjgzb0dJK2V2ektGSmVVSmRubklzQWdOanBYMXlh?=
 =?utf-8?B?SGYvbjVpb1ljNXoxdVVVMVQ1V2tWc0dHZHV4RmFCMGFVRmk2bS9yQzVRQmVT?=
 =?utf-8?B?TnVzMk9PQzlPTHRBWlgzdTBkOWxlNmIyRkpJWW1iMkNqZ3FMNjM2cUpUampL?=
 =?utf-8?B?Mm4zNzlpYXNqcmY2SmFaM05jbHdRTmVrUm5DbEFNWlNaMmFvNzlQajBod3g2?=
 =?utf-8?B?Uk5WbXExb1FYMFZ3NWFIY2dSSTJIdjMxaGh2TGlIRTdyZWRWRzFIc0hhQlFa?=
 =?utf-8?B?ZmlFbDZueFM0TVlqNXJ6K2VmY2FEc0U5Rms1dzh5M01ZNGhaQjFoTmovMmlt?=
 =?utf-8?B?Y0tnWGpxajlsV1JvTlljTW4zODArQzdCUmFkUW5ZdlRLbkE0SWdEOUVkcGdJ?=
 =?utf-8?B?N3FPdU03MEhuaFI3YVE3RFkzb0NaMVQvcitTSE5QNk1FR1M3c3Fzbk9hQmo3?=
 =?utf-8?B?SGNGL3FQdjlIZzdvOEs0eHg3eXFzQjhjT25qbFM0ejNVeCtNTUYxSDB1bDAv?=
 =?utf-8?B?dnY4NmZZRDYyVFdsdUY2dUFKV3VGTnVpOEROeWw0ajZGa0NBRE1NaEZhVjJM?=
 =?utf-8?B?Nit6NmxBdkt3akxWeFpRMUpGZllGaU1xM3MzMkRDTURtbnREbUplUWZIWW5B?=
 =?utf-8?B?eTJsWHRqM2FDWk15c0d0OE0yVncyQXFNL1k2L2RYRlZteStpR2Y0OW9XY1ZZ?=
 =?utf-8?B?QU1JR1oxSmZJVERMM050T2daT1MzUUhFSTdvZ2NOeGFvbG9oY0Yxc0QzOU9F?=
 =?utf-8?B?NkViL2RnOVYyT1RpcURYVkJKNG9RR3l0NmdIK0VxMjE1OEJoTW1HNitFdjFR?=
 =?utf-8?B?RmJqaGtuR1JTN2h4SURQRGlka0pDVXhwUHJqWjVkNWNWWWZKZC9FTFNJVkVy?=
 =?utf-8?B?WmtCcXVqTnE2QlZYa2d1NDhGWjdnVGRZc2VyQ3lnQnVZYjlYaUFvbHVRU3Vm?=
 =?utf-8?B?TFBYR3lSSXNCL24wS0FObUFwbHFZL2d4UDJ5L2RlY0JSMytuNlZhdzdiZFZO?=
 =?utf-8?B?RjJwS1YyRUowMkt2UnB2TGJLKzN4a3oxZlpIbzNhY2VDbXorRTU0Zk5UR1ox?=
 =?utf-8?B?Q3VxWDhYWkNBYlZHU2xVTVh1WWdNMjBPdHNNZ09PUlMzQ2hjTzkyRUZUOVg2?=
 =?utf-8?B?SlltOG5rYzlEa0tMYktlcWc2OHI3UVB3SlBGVEpVeDMvMGZlckNEMjRLUkpG?=
 =?utf-8?Q?NrtsOJsTbJtW7vc3JdKRheEpp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb756cda-7ec8-4529-31e8-08db419c2757
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:38:33.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmdJu5HQZv1U99DK3pp9dH8jf8AzFYAv0ww6H0lEBh+GRidI7QgGuU1wigrTBUU9zZyqPlzNtoiuVmx+AF7zDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9123

On 20.04.2023 13:25, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> We will parse NUMA nodes distances from device tree. So we need
> a matrix to record the distances between any two nodes we parsed.
> Accordingly, we provide this node_set_distance API for device tree
> NUMA to set the distance for any two nodes in this patch. When
> NUMA initialization failed, __node_distance will return
> NUMA_REMOTE_DISTANCE, this will help us avoid doing rollback
> for distance maxtrix when NUMA initialization failed.
> 
> As both x86 and Arm have implemented __node_distance, so we move
> its definition from asm/numa.h to xen/numa.h.

Nit: You mean "declaration", not "definition".

> At same time, the
> outdated u8 return value of x86 has been changed to unsigned char.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

non-Arm parts; to more it's not applicable anyway:
Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -28,6 +28,11 @@ enum dt_numa_status {
>  
>  static enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
>  
> +static unsigned char __ro_after_init
> +node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> +    { 0 }
> +};

Nit: There's no (incomplete or complete) initializer needed here, if
all you're after is having all slots set to zero.

However, looking at the code below, don't you mean to have the array
pre-set to all NUMA_NO_DISTANCE?

> @@ -48,3 +53,50 @@ int __init arch_numa_setup(const char *opt)
>  {
>      return -EINVAL;
>  }
> +
> +void __init numa_set_distance(nodeid_t from, nodeid_t to,
> +                              unsigned int distance)
> +{
> +    if ( from >= ARRAY_SIZE(node_distance_map) ||
> +         to >= ARRAY_SIZE(node_distance_map[0]) )
> +    {
> +        printk(KERN_WARNING
> +               "NUMA: invalid nodes: from=%"PRIu8" to=%"PRIu8" MAX=%"PRIu8"\n",
> +               from, to, MAX_NUMNODES);
> +        return;
> +    }
> +
> +    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
> +    if ( distance >= NUMA_NO_DISTANCE ||
> +         (distance >= NUMA_DISTANCE_UDF_MIN &&

Compilers may warn about comparison of "unsigned int" to be >= 0. I'm
not sure about the usefulness of the NUMA_DISTANCE_UDF_MIN define in
the first place, so maybe best drop it and its use here?

> +unsigned char __node_distance(nodeid_t from, nodeid_t to)
> +{
> +    /* When NUMA is off, any distance will be treated as remote. */
> +    if ( numa_disabled() )
> +        return NUMA_REMOTE_DISTANCE;

Wouldn't it make sense to have the "from == to" special case ahead of
this (rather than further down), thus yielding a sensible result for
from == to == 0? And else return NUMA_NO_DISTANCE, thus having a
sensible result also for any from/to != 0?

> +    /*
> +     * Check whether the nodes are in the matrix range.
> +     * When any node is out of range, except from and to nodes are the
> +     * same, we treat them as unreachable (return 0xFF)
> +     */
> +    if ( from >= ARRAY_SIZE(node_distance_map) ||
> +         to >= ARRAY_SIZE(node_distance_map[0]) )
> +        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
> +
> +    return node_distance_map[from][to];
> +}
> +
> +EXPORT_SYMBOL(__node_distance);

What is this needed for?

Jan

