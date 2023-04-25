Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833826EDE3F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525885.817391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEAq-0005rs-HH; Tue, 25 Apr 2023 08:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525885.817391; Tue, 25 Apr 2023 08:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEAq-0005oy-DY; Tue, 25 Apr 2023 08:37:20 +0000
Received: by outflank-mailman (input) for mailman id 525885;
 Tue, 25 Apr 2023 08:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prEAp-0005oZ-Mg
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:37:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e926a8-e344-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 10:37:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 08:37:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:37:16 +0000
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
X-Inumbo-ID: 62e926a8-e344-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+/n0+itQbSPOE8HeG2HZv8dieSAuecCt/q5/c9RSFeWZtnY/5dM42i7zI1cnRBzAtuCTCP/JWfSz3EhxVMnLR82FLrwHZT3jSbgGYQ1VoQTK39UOOYAHg1EodXodLFr+I81MInpF3vAMYPeoc88NzaX8ZCXCTUDqu+3xlxHfVU3d21wHH4d9Yv3H2wMS6xS1HKJwhtepl8K6NI0VjDCXYS+/CmTAkAnnaf6a+R1bGDZhYDG10UXBGU4gOUY11M55fJRdzLrC6lXnc1l5EvJ3Mrns6av/NFPm17xGUYJyhi5Yq4nWSyD3EEPSuLbi6Fw27VrK3YjFq7b9zQElMuDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJ+p3bW39XOWyNhcAhQW2ne/frfdX1ojC+lG8hv2g6E=;
 b=Ks+VcbVHKBqklxeIZNMb3WuurG7H3BvbOk9OA5tUwiTr1kMw/QvUguRv7ACPspVayeAZF9y3mB//JwVS1InVluV2QIQtFhKx6tct3vOUCz8GUesr6/egnfdMR+n/a6fZXyIkAtOcmks+EkbnLP7Uqt5wTibFfYb5grAfozlm2tw9lqqKGxQny86O1Jf1oJmxLzeXRvmHYhnf5PfBFr/NQJifBIJzbWTWy7Ff6ElpWYER0ETPUL8gRjq6VmXVoXGuBrRrgFsAwsgC56tITFg3oZ/aAX7yva6X3h1ZhVF19O4ekNk+iP8Zoe4H9xz8fX+Qi92mO5sgcA+e6Piw6F9tkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJ+p3bW39XOWyNhcAhQW2ne/frfdX1ojC+lG8hv2g6E=;
 b=LLJpqc85iQRQgJ0QxhZIgHYjgA1t56xtwol6Hdb4QZePwTL3ZMJs0PHSE6jKe7jJT9bBA9KaltNmKu+WEGchMcPNLwhLdioq8PMCsS1VmM7ckV+wi3llYIVK0zBcUgoHnX7GkIyJKsoiMNsYZdALyYc1DU28FwVSsSvK7YCFUWCVv3+x7p8DEPtaTiQ2/5XoVZvii2aDjzv0p7qz48ar1/VHO7QgJS3WnlunF2sOt9Cfa4d+XF0ACoxy9H+5A1gAV2c4f02ydm63GLVr+zGpX1xB022HLahDcdYvSd/W48GcniKqd7GBEo654uv3DGfQ7RdNINbuN6eiPdDHmCi6NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d2c221b-745b-109e-af1f-2b78504b2e0e@suse.com>
Date: Tue, 25 Apr 2023 10:37:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-4-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230425075655.4037980-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf3e90b-73cc-4cdd-1629-08db4568464a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WTecQoHxhSNIYSo1b4b6QcxCkWZXrvPCcr0Th7f/B1zwfQWODUV6pQVJDYBC8P97DRYuTX2Gd7/LjFDloynNnCWTDBDODfmf82faE3Ue+2o7j6ypN+T4TvV9qOCP65H7ouW0HSkvMKpHxyEid1gLaSEkc3MODvf79XMZTDTF/trIc4DeUsm2UXtvK3891jgyEzsySY/TAFT+6DRfgOTMsIehOK/ml43dQsC+LBOjab04DeMMjI2E5K2U2tYyUXQuD7bU0jz1CQ8K+DEkNcwPhjD41d9RcWtZ0tXpACy8jmhehDQeEltA15SKj0I7i7K918MHiVm3IJrOs3CvtyodLB/V2ahYToJqwNCnkRs8zK8KJq3tPVx66wxh/xs/I8DLSUxQ1UfRkMGRS19Us4xNzxKuNpryL8Wjz/TBmanb6fBm5+d5731cmM8q0iNAkMvhEo6Z1QOW5rv97fhc2UWD9lIMmP8Dui2u3gBoMUQY6gcpj62x3eQPkpOi6n1Pt+2V4/3cMUxmXjQcUQxJqAk7DpXIGDc6G6NAvhYUCFBrE8rxS5zEd4IkG1vaFL/POyWeyHdXT789MiyzIpiNsTqPtMutETZvi1ljmIG9AYShjKWd6eD+TlEmuyJKeqgny7dH9u5LDAfTtMdEWprh6POkAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(38100700002)(8936002)(5660300002)(2906002)(8676002)(36756003)(31696002)(86362001)(7416002)(6486002)(6666004)(54906003)(478600001)(2616005)(83380400001)(53546011)(26005)(6506007)(6512007)(31686004)(186003)(316002)(66946007)(41300700001)(6916009)(4326008)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkdlaElUd0I5TlB4YVdObHRuQ0g0VExwWlRIL3hBR2JSWS8rSnpJcGtTWm1P?=
 =?utf-8?B?SmZHMHJXY3NMM0pCQTdJNDlNcFM1dDlTZ05aSDYyWkpEYnpEcCtobG9MZGIv?=
 =?utf-8?B?eUhrQmFvQytWY0xHYy94cTBNMDFreHNLdDNkSG1ESzREODNyWitNSXhmWjRY?=
 =?utf-8?B?S3FTQXZManhubWgvWlpnOXNiVFNOS05SdHNJMDlIR1dlZkV3MDdnS2ZGWEpF?=
 =?utf-8?B?WVFWb0tZak5SVGE2bmhHUmkrSVBCUk9iU0dkQWhudm1NRVQ5RnpZNEFyNUc5?=
 =?utf-8?B?eWs1dHQ1QW1Ua08ydXVMeDlqbDFMVEhxSVpNNWRTWm9tVDRpUnVWQ2R2TEZk?=
 =?utf-8?B?TGJiMUZFYWpkZHh5eVRmcEs0Q1pqODFGeklhcFJ6SXkvdTluMFlSdkg4NVNB?=
 =?utf-8?B?Y1NHT0NxUkNGSGdJK3RKeDRxNndDN3NSaTNZQ0dPL01hQjRpdlhMVkk0VGlN?=
 =?utf-8?B?UlZVQmkraCt4alFQbVJiQmhyWDBlR3BNN2tGZ0FoN0JQVG9VVnlxWHFaeVJi?=
 =?utf-8?B?U3p0N2pQbU5YaDNINEVDemRRSFFWaHhBbmtzRERaakJ5ZXBLdzNhK1hZVytP?=
 =?utf-8?B?MUF5REdKZmFoeEw5dG0wOUFSQ28zMDZjblhWMjBJK1dLYkJySlBYT29qVjlY?=
 =?utf-8?B?T0kxdDN1TlZQckV2aVRCS2hac0N3aE8zc0hpLy9ydG43RzhsWmZsb01UczF0?=
 =?utf-8?B?Z2wwR1pMYlRJR3hsaUF4ZGlyMDkrcCs1U0V1TE0wUEQ1QytSN0YxVERRbnpI?=
 =?utf-8?B?US9nVHc4YTc3RFZiZWdjUjBIL1VDL1E4U1NEalAxTHlIdTZubkpPM1lsRnk4?=
 =?utf-8?B?eVo4YTBVUmE5aG5BK25WZFdRUWl4VlJXeVhIVXVVaFB3ZU1Ob3ppZjNGM3Uy?=
 =?utf-8?B?d0hkZzJoWTUySWpEdlV0SFZ3TjEydWlPREtDYnUrU2VUUkdQd295emlWWU5S?=
 =?utf-8?B?dXNpdmtSU0J6MDN3aVpGM0QxSHlWN28rOWtWNmVYdmxCejFkWVp6Q3ZSZmtw?=
 =?utf-8?B?V0JRYW1YbUJZOXRwZ0wraC9Pazk4anN5OS9JNHFVdmlCZDVHQXdTSVpGZVNx?=
 =?utf-8?B?eXd3MGcrYlVLWGVOTENlMWRKd09ESURFTSs0UXRuUEkxbm9Gb25yNVFEMGtG?=
 =?utf-8?B?Wnp0bVp6bE5CeVdEMnVsQVpDY0x6bGk5OHJPRUtpaTZHUXJEWHBMUTNoMlll?=
 =?utf-8?B?by9EVUJiRXBnR21BSkZHb25ndXpJWEZBeGRXWmJuT3FUam9EVzJpekdpbDdB?=
 =?utf-8?B?L3djOWM1dG5RVnFWNVovTC9uSURYL1M2SEdlVmRBODV1bCtzNzIwcWZzUW1P?=
 =?utf-8?B?OWY2b1RsV0czK0tHSktTemhIOWlhZ014L09ldGtFYnJmR29BOEltTDVLeEQy?=
 =?utf-8?B?ZWwxT01PV1BsTFdKRlB6YzNmS3BHVmp3YTdsTjJwYks1OVhleDd3ckxtclM4?=
 =?utf-8?B?dmxmUlhFV1pkSit4MmRzOEkyR0NONjlCRzdDck0xOGhQSVBPVm5wdmwwVFF0?=
 =?utf-8?B?SGlrWSszU1EyY0tERVRLNUJQekdxZXZIdHNnZTgvbzVNenc4VlFTQlZQSTJZ?=
 =?utf-8?B?QXB1U3JidGNvdXh6dDBBRDU1R1hWVlBuZmQ4Z3BSY3NBWWdkQWpDT0ZvTE5B?=
 =?utf-8?B?UmxtSlEwd3dCUUlDY3hpZjNKakRIUkFmUTV0VEFKakNSQkN0R0hpVGVEZks3?=
 =?utf-8?B?K1g0aU5vcmJQNXNneHZKQWF5S3RQZmphVXpzZUttM0t3TEpnN0V1TXpvcXdW?=
 =?utf-8?B?ZmNab0lHTVBJWVNTRFAxZW0vaGdmRG5DbkVxZWpJT3JrT044bHMvbDFsTncx?=
 =?utf-8?B?dVVUVXpzWmQwTmVpNGlHcy9kTGFLV0ZZWUtNSEt4M3U5aXFLeGFaVk9HK0Zq?=
 =?utf-8?B?cGlxK0RXSnJPNnc1MEsrSkp4SDZORHRUTE8xM0ZJR0pmOTFtV3hZZDZwSmg4?=
 =?utf-8?B?YzJydnhmL2p6OCsyQkRDZEJkQ3FsNDVvcEJxc25qZTVGZ0pJdHMwYkRNSWZK?=
 =?utf-8?B?bjBOVk92REttKytOa0laZmtoSnhXSm5OcTBScVoveVVzT3BkdUwwUkVFLzdJ?=
 =?utf-8?B?ZDgrYW03TitMelZSbVVnNzIzSzFQUkI1Q1FUbTRMYm1lKzJ4ZnhIaWp3aVh4?=
 =?utf-8?Q?bnoHNrEBolWRJ0P0yXa8bkZkl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf3e90b-73cc-4cdd-1629-08db4568464a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:37:16.2636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL8/OFDb5ATXqgyLk8VOG5gxAcJkDL7VajtD727gC8ZUzt/NSBCvsEnOG29zhr1w1kVCwN+o57AdI2sD7MSjHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

On 25.04.2023 09:56, Henry Wang wrote:
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -28,6 +28,12 @@ enum dt_numa_status {
>  
>  static enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
>  
> +static unsigned char __ro_after_init
> +node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> +    [0 ... MAX_NUMNODES - 1] = { [0 ... MAX_NUMNODES - 1] = NUMA_NO_DISTANCE }
> +};
> +
> +

Nit: A stray 2nd blank line has appeared here.

> @@ -48,3 +54,52 @@ int __init arch_numa_setup(const char *opt)
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
> +    /* NUMA defines NUMA_NO_DISTANCE as unreachable and 0-9 are undefined */
> +    if ( distance >= NUMA_NO_DISTANCE || distance <= NUMA_DISTANCE_UDF_MAX ||
> +         (from == to && distance != NUMA_LOCAL_DISTANCE) )
> +    {
> +        printk(KERN_WARNING
> +               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8" distance=%"PRIu32"\n",
> +               from, to, distance);
> +        return;
> +    }

I appreciate the checking that node-local references are NUMA_LOCAL_DISTANCE,
but if they're wrongly passed into here, shouldn't the resulting array still
have NUMA_LOCAL_DISTANCE on its diagonal, at least as far as present nodes
go?

> +    node_distance_map[from][to] = distance;
> +}
> +
> +unsigned char __node_distance(nodeid_t from, nodeid_t to)
> +{
> +    if ( from == to )
> +        return NUMA_LOCAL_DISTANCE;
> +
> +    /*
> +     * When NUMA is off, any distance will be treated as unreachable, so
> +     * directly return NUMA_NO_DISTANCE from here as an optimization.
> +     */
> +    if ( numa_disabled() )
> +        return NUMA_NO_DISTANCE;
> +
> +    /*
> +     * Check whether the nodes are in the matrix range.
> +     * When any node is out of range, except from and to nodes are the
> +     * same, we treat them as unreachable.

I think this "except ..." part is slightly confusing, as it doesn't comment
the subsequent code, but instead refers to the first check in the function.
If you want to keep it, may I suggest to add something like "(see above)"
before the comma?

Jan

