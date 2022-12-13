Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7264BA84
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 18:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460938.718966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58gJ-0006ES-JY; Tue, 13 Dec 2022 17:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460938.718966; Tue, 13 Dec 2022 17:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58gJ-0006DD-FS; Tue, 13 Dec 2022 17:03:03 +0000
Received: by outflank-mailman (input) for mailman id 460938;
 Tue, 13 Dec 2022 17:03:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p58gI-0005xu-Cy
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 17:03:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff98daca-7b07-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 18:03:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 13 Dec
 2022 17:02:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 17:02:57 +0000
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
X-Inumbo-ID: ff98daca-7b07-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOcy0X4scPSfzOGnEeWz3Hm4ejvsz2qHYua6F+El4ZV4RJdc4aY/4dsZj0CR44siGBzJ0o1uNcPdn7CWcLEs4MdAIixnIRi1fompKb+gRGEimFnSxRFXTa3o9Jtp+TpO5u252pVmmo3iHq0fcnabibCk64lroL4lylZlWq1jSGbEJK+1McfiwyQIL3mKT6k+Nd5KKp0B8sg3oWWr0e5O9+3qm1YNGpk+QKDR40rtGuXaYdJAI5pxsLi1hBkc3t2nGqvGfzLNutY2lU/cUv/fedQBy+ut1O9iPwBBlkkn7J7VnLmigDYjWEPawYT4ndt4fYEG9qZcJW94B0WJD9O98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCM7S0P3p1mzg3sbyO5EYEk6eyDEULRwMujHuRSaYMY=;
 b=ZL0K9ewv6wzwboibBBiv/gqV8K3krZ431fHEI3kcQ703ZY7/1Fr2owJKvhERZDQ8lCGkL587XGktNOv4WX/sf9WPS2ZFHAMTr+dyqIwcT7PzutV5fZXQzowTcI6wGK0CmE4eOCHQllZTFZx4HgLFFsip5cKAr07FoHOSIZGAMMAs/TTuVzIiujOGNyyawIhUCOde0aZ5jnwKjVbbSi9ZvBlxs+0xFfO9sWvmcumHlAROfD0hhs56N+WwCqKSGpaePZxy0S0cxjUCg4ssvVikCNZxLOL3TJPxLtNzVoF2FqHk547p95CU2hRLqyGa1Cinqy/ZVT4Cf6rgQrsL5yeDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCM7S0P3p1mzg3sbyO5EYEk6eyDEULRwMujHuRSaYMY=;
 b=XIkcwVTUQX51IybLCxzRYyESZCJChRIceFwvJS4cOWKxdjX69ZKQpVSUZu/3W2V2XgDvJy3VRGCeoqBTgb0EDaSD2zBjkGU1LQ4fhL3Y1vmnGoB5bKvcc5ocv37GuMMXGrM+UuMJBgMN0OYjG2vwGToFzZPli19D75LmGStaWfiRcOzaCpr9Tpp+rqqUQSCuPvlCphipvDAmDkYPHY1iu8lq0ystfh9k/ZQowF1gadq8tgdDyn+/dFRGzGA9EfHNDrQo8SVhz9zAOfQQL9RBBUWJzo0wRfSYLDyV42LuSkSMyaCV6P0mJdYvPJmpTHV3djV9YeRfGm5Xk2a/uboUow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <283a8095-3046-3324-3e8a-8671dc1ee8e7@suse.com>
Date: Tue, 13 Dec 2022 18:02:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 79271ac1-d19d-4635-2309-08dadd2be240
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j42aIQ2CvJ3zdKrlNSnUmSaGS/5hdjeW1wKpZ6F5CHDzTczQHJD6N0W08xE/zZfHtlDiwQLBnGROcaDmCHcYuHj8i8e7BUhgKYj3/IjrEUZQMHfqVHucR7xyITJ/dquaiiWGTY0yT3PT6kHNhgQrrTTNyqDxrJkCKdkogza4GiyDrzMG4BN47Lcm905I9nebtA3X996zy+7H1fvZe0nar7Njc7BS5bAuG5Y0Axb9UPibKCNJweNE6ju/LKsIV7++rOCvnx9WMPHzgejhD1ndr+57DSqXiHTCEixZo5ru9MUoBOZnH3evjGl2ZaCn9pCk+91J8fD86dcwcnnBKpFnFEUD5b2hQJQh1aALuQr9IYj6x8TWqzcxcPGLOHvyNvoPH00TjSfpRTXy9n5/M3euOX4W6j1TYRD5TM6PbHVnBmBeim7ApNQx1oLQJGOC3PDd/XMASrrP0nX1Fojo+C9R4gYB380sJz66C2PBIV2TcoLyAfsv1sjWhM0Z+82d/BH/Emk6PPNkxfPESdo7mya2DEd9OtdPa9sMgZ8WTX/nDwxQssqp4rsuwMyamcHiSlJ3WU0AZ0hK4z2b6JeVFl5r3N95nxi0LPEWeDSdUtJxZckNXGGvtSA2Rsz3QuyF/njqV1spPUU+e2iK/BPEpZXFZbZHPcwEEVZrpJOW3EU1wZeY87wsQSDWqFKR3B98OV57JLd+1N4/gjoN5ItM7YQ9Jfl+la/JxtdAFZLgKwISPak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(36756003)(478600001)(41300700001)(66946007)(2906002)(38100700002)(5660300002)(86362001)(6486002)(31696002)(53546011)(31686004)(2616005)(66476007)(6916009)(54906003)(316002)(8676002)(66556008)(4326008)(6512007)(186003)(6506007)(8936002)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2RhVUdrMDlzaFBrcFlFS2l0eTM3VXdGNXhrZWdKNTdNQUpIK0RSRHBad2xN?=
 =?utf-8?B?dmdRZlVoUWVZNGRQak1MNnVpZ2RkZUo3a2dPWE1RdUtib1VKRk9LK2tXSHhG?=
 =?utf-8?B?SmVycmx3cjNlbVVDeVFieW5sRWR5TzNrMnowKzhqS01HbUgrakI2ekxTV29t?=
 =?utf-8?B?Y25IV2FWR0dhTWdFd3gwZzgwdU5RdTJHQXVOazhKaTBQd2E3NTdIT0h5a3dI?=
 =?utf-8?B?MUNTODhSRHQwVUx1TEpvMmc0d04ydGR4TjdwZmwveWJubWVFREg1VGt2Z2Ja?=
 =?utf-8?B?TngyRnhoQm9iODFHUVJ3Q1JhK1FpZGRBRXBQcUFGenM3YXZqYTFWeWVKZkw2?=
 =?utf-8?B?SURhbkNXNnBzWEI5aWZhY2hDdDFJdVU2TjR0T25Mc0wxLytPTU0xUjJJUzB3?=
 =?utf-8?B?ZVp6NXZwUXFzK0ZMZGZYWkZ6K1BjK1JnWGhMdnZZaTJoWTd6Z3Awc1RKSDlp?=
 =?utf-8?B?a00xZzJZd0cxTXdDTllMM3pzVUZhOGkyUEJQcXh5OFAvT2RrUWROdVJBaDJC?=
 =?utf-8?B?N3ZYV1BaYjJPaDMvZEtFa1A4ZnIxcDgraWhaRTBXUDdwWElHZmovV1Fodlc1?=
 =?utf-8?B?QldCeWpJSzdaZnFYUTJOSVBTa2cyeFM4eE4wNGtZaXBMWHZlbVcreXhHT3U1?=
 =?utf-8?B?KzZOclg5YVViSmNKL2ZMRFdka0x3R1A0TndxNXh1SmpwUzFxcWp3V1ViZ0d6?=
 =?utf-8?B?QjkrM21IZHlwcG55YW9mZUdEMUEzMTVybnZhV2lhMjZYb2c0dlJzTmFqZXZo?=
 =?utf-8?B?QjFmUzhpeW42VHdidTZmdFFMUWZQNVBtMWRkV3prKytKc1QrZURkWCtSRFht?=
 =?utf-8?B?Q05tQi9Od3JxNElIZ1VMQUZKazZJWERPcDhsTGxyb0w3MUVhYjNOdDY0V2li?=
 =?utf-8?B?Y2p4L0RWQUhBYnhiNWw2VUdSVnRBSHg2S1IyS3BLT1lFcC9OV2VFcTY2U0pH?=
 =?utf-8?B?TG8rVmdudmZBOFJrSTJ5V3NjVGkyRkIrSHB4UUJnM2pQT1ZvQkRoUm82eXU2?=
 =?utf-8?B?anlnZ2lRelNjTFVvZXd5QmR6VkNheUJvQjhaRktTTk5sRlVWN2FZN0s0bUk3?=
 =?utf-8?B?UkN5MFJnNnJ1S3V1K28wc1UzOGs5REhWMVF4MFo3ZWpSUTI5eDZybGxQbGRN?=
 =?utf-8?B?Zzc1VW1UYmVUdlVHZlQvWmV2YjdHVVhzTkZ5QzlsSkdDTDExZ3J0ajR4V2FM?=
 =?utf-8?B?SjBFZi8xOEJVWEVhSnZjT2FuQzJsOXBkK0RlYmxlaVZRWWJma0FRS3ZxVU12?=
 =?utf-8?B?Ujg1R05ONERab09JSGZ1SzVycVBXM2FVU0JNSDdzUER0dWx3cHNKZHVRTks2?=
 =?utf-8?B?RU82c0ZBOTNuRzNPOE13dFFZU1dUbU1zL2JqYWVPMUVjYW5SRUFNZTAvSUlo?=
 =?utf-8?B?QXFxWkhXM1BTOVFuNEN3S1VyZ3Fua2QwYWVlTU1qcnM4M05Ec1RNYysrSEdx?=
 =?utf-8?B?a2dCN0IrQ2k4WlJGVGY2K29hKzdqYWdzNWpnbjZHc1VFcHNPNVJ6ZVI2NVFN?=
 =?utf-8?B?UXJJUHFHTUttZk00M3RlMW84SXVUMjdlS2Vzc04wVk5FZngvREJOUzc0bUR6?=
 =?utf-8?B?QWNXamJSUnlwZHA3bW9kRUNSeEFHU0Z0R2lOUk93SHhMKzBlWmpGQUdPdXZs?=
 =?utf-8?B?TkJwSUZPSWdpRHlrUmY0R1dWV1RPaUF5dnBCSnhiVEhqNE9XMi80L1JwOG5r?=
 =?utf-8?B?eDhuZFV3OG5yL0ZkaStnbzJDUDJaTmR4ZXAxWDlUSVdHVE05cEVEaHdjUXU1?=
 =?utf-8?B?eURUeHU5dUUzSUtKbzhBd0N5c21DRmdFWEVydEZtQ1p6ajZyWVd1UlIvdFJ3?=
 =?utf-8?B?ZDhIOStVenNYM3BsT3VCc0VXNkM3azFQbExsQmlLcVRvNXBCbDd1RzZEN2RF?=
 =?utf-8?B?aFgzMnAyc1kxMGJxY2VOM3Z1blZUM1JoaDZHNExyeWdvZUVTZGZ2eFdEK3l6?=
 =?utf-8?B?U1hqMU5wSWhCbWdiSHgxR0F5SzVGTXVSYldrVzRyTTA0L0ViZzNjbjlZcE9M?=
 =?utf-8?B?UHI3dGlGN1RWZ3ozQ2dBV1FjZ1VUTWlRa2JWR3lhT1JIUExaVjN0Szljb1No?=
 =?utf-8?B?Vkk5UTBzSXkvSjFPUWZmdzlLSGZJVUcvbWRMTlk1Wm5YSno3bm5OeUd3alN0?=
 =?utf-8?Q?6SmtBloM9M0VAJ3o2+48f4UM7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79271ac1-d19d-4635-2309-08dadd2be240
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 17:02:57.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIVzlvhYIMwMCNjr5Y1t+s/011+PI7cZcpIV87ZpoFOB8IRLqZx7OpkORygoLnVChNnCeFEh/YeufgTAJGTcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783

On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> This commit proposes a new mechanism to query the RUNSTATE_running counter for
> a given vcpu from a dom0 userspace application. This commit proposes to expose
> that counter by using the acquire_resource interface. The current mechanism
> relies on the XEN_DOMCTL_getvcpuinfo and holds a single global domctl_lock for
> the entire hypercall; and iterate over every vcpu in the system for every
> update thus impacting operations that share that lock.
> 
> This commit proposes to expose vcpu RUNSTATE_running via the
> xenforeignmemory interface thus preventing to issue the hypercall and holding
> the lock. For that purpose, a new resource type named stats_table is added. The
> first frame of this resource stores per-vcpu counters. The frame has one entry
> of type struct vcpu_stats per vcpu. The allocation of this frame only happens
> if the resource is requested. The frame is released after the domain is
> destroyed.
> 
> Note that the updating of this counter is in a hot path, thus, in this commit,
> copying only happens if it is specifically required.
> 
> Note that the exposed structure is extensible in two ways. First, the structure
> vcpu_stats can be extended with new per-vcpu counters while it fits in a frame.

I'm afraid I don't see how this is "extensible". I would recommend that
you outline for yourself how a change would look like to actually add
such a 2nd counter. While doing that keep in mind that whatever changes
you make may not break existing consumers.

It's also not clear what you mean with "fits in a frame": struct
shared_vcpustatspage is a container for an array with a single element.
I may guess (looking at just the public interface) that this really is
meant to be a flexible array (and hence should be marked as such - see
other uses of XEN_FLEX_ARRAY_DIM in the public headers). Yet if that's
the case, then a single page already won't suffice for a domain with
sufficiently many vCPU-s.

> Second, new frames can be added in case new counters are required.

Are you talking of "new counters" here which aren't "new per-vcpu
counters"? Or else what's the difference from the 1st way?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -741,6 +741,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>  
>      ioreq_server_destroy_all(d);
>  
> +    stats_free_vcpu_mfn(d);

How come this lives here? Surely this new feature should be not only
guest-type independent, but also arch-agnostic? Clearly you putting
the new data in struct domain (and not struct arch_domain or yet
deeper in the hierarchy) indicates you may have been meaning to make
it so.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1078,6 +1078,12 @@ unsigned int ioreq_server_max_frames(const struct domain *d)
>      return nr;
>  }
>  
> +unsigned int stats_table_max_frames(const struct domain *d)
> +{
> +    /* One frame per 512 vcpus. */
> +    return 1;
> +}

As alluded to earlier already - 1 isn't going to be suitable for
arbitrary size domains. (Yes, HVM domains are presently limited to
128 vCPU-s, but as per above this shouldn't be a HVM-only feature.)

> @@ -1162,6 +1171,88 @@ static int acquire_vmtrace_buf(
>      return nr_frames;
>  }
>  
> +void stats_free_vcpu_mfn(struct domain * d)
> +{
> +    struct page_info *pg = d->vcpustats_page.pg;
> +
> +    if ( !pg )
> +        return;
> +
> +    d->vcpustats_page.pg = NULL;
> +
> +    if ( d->vcpustats_page.va )
> +        unmap_domain_page_global(d->vcpustats_page.va);
> +
> +    d->vcpustats_page.va = NULL;

We ought to gain UNMAP_DOMAIN_PAGE_GLOBAL() for purposes like this one,
paralleling UNMAP_DOMAIN_PAGE().

> +    put_page_alloc_ref(pg);
> +    put_page_and_type(pg);
> +}
> +
> +static int stats_vcpu_alloc_mfn(struct domain *d)
> +{
> +    struct page_info *pg;
> +
> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> +
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {

Style: Brace placement (more elsewhere).

> +        put_page_alloc_ref(pg);

This is not allowed when what you may put is the last reference.
See other examples we have in the tree.

> +        return -ENODATA;
> +    }
> +
> +    d->vcpustats_page.va = __map_domain_page_global(pg);
> +    if ( !d->vcpustats_page.va )
> +        goto fail;
> +
> +    d->vcpustats_page.pg = pg;
> +    clear_page(d->vcpustats_page.va);

I guess this should happen before you globally announce the
address.

> +    return 1;

Functions returning -errno on error want to return 0 on success,
unless e.g. multiple success indicators are needed.

> +fail:

Style: Label indentation.

> +    put_page_alloc_ref(pg);
> +    put_page_and_type(pg);
> +
> +    return -ENOMEM;
> +}
> +
> +static int acquire_stats_table(struct domain *d,
> +                                unsigned int id,
> +                                unsigned int frame,
> +                                unsigned int nr_frames,
> +                                xen_pfn_t mfn_list[])

Style: Indentation.

> +{
> +    mfn_t mfn;
> +    int rc;
> +    unsigned int i;
> +
> +    if ( !d )
> +        return -ENOENT;
> +
> +    for ( i = 0; i < nr_frames; i++ )
> +    {
> +        switch ( i )
> +        {
> +        case XENMEM_resource_stats_frame_vcpustats:

Isn't this supposed to be indexed by "id" (which presently you ignore
altogether, which can't be right)?

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -264,6 +264,8 @@ static inline void vcpu_runstate_change(
>  {
>      s_time_t delta;
>      struct sched_unit *unit = v->sched_unit;
> +    shared_vcpustatspage_t * vcpustats_va;

Style: Stray blank (more elsewhere).

> @@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
>      }
>  
>      v->runstate.state = new_state;
> +
> +    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;

There should be no need for a cast here.

> +    if ( vcpustats_va )
> +    {
> +	vcpustats_va->vcpu_info[v->vcpu_id].version =

Style: Hard tab.

> +	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
> +        smp_wmb();
> +        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
> +               &v->runstate.time[RUNSTATE_running],
> +               sizeof(v->runstate.time[RUNSTATE_running]));

Why memcpy() and not a plain assignment?

> +        smp_wmb();
> +        vcpustats_va->vcpu_info[v->vcpu_id].version =
> +            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
> +    }

Overall latching &vcpustats_va->vcpu_info[v->vcpu_id] into a helper
variable would likely help readability quite a bit.

> --- a/xen/include/public/vcpu.h
> +++ b/xen/include/public/vcpu.h
> @@ -235,6 +235,22 @@ struct vcpu_register_time_memory_area {
>  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
>  
> +struct vcpu_stats{

Style: Missing blank.

> +    /* If the least-significant bit of the version number is set then an update

Style: Comment layout.

Jan

