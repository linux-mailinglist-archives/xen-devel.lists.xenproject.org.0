Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192E787CA8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 02:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590412.922689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZL4N-0007QX-43; Fri, 25 Aug 2023 00:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590412.922689; Fri, 25 Aug 2023 00:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZL4N-0007Ns-1I; Fri, 25 Aug 2023 00:52:59 +0000
Received: by outflank-mailman (input) for mailman id 590412;
 Fri, 25 Aug 2023 00:52:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZL4K-0007Nl-Tb
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 00:52:57 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b86e6e88-42e1-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 02:52:53 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 00:52:49 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 00:52:48 +0000
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
X-Inumbo-ID: b86e6e88-42e1-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLdtO3pPfY7/Mrdy3YHlzXH9hBWeaa8cuAH8UUg5KELHUb4bb8nawvbjXctUpJn4XD2HtGxAv6ULP+fdA18yIT0s1PruzDnL1/qiqjhDX36PydmvjZudFbgQlNr0Ielj92t6X3e6oKFZWn5eavJgfHP4eMdI5l2Ml/ZbCtC56jl7JoKn8ZZXJc7pTQOZ2En4djZMxqBbcHiTUI75KxLsKle6CwihLh1YxVNJKri0Ymmbt6iRjuJH99szEG5KEKDdmp0CHQvLurmfimjRhQWYioOepjBL6vuWfZXJh2rRbCMh6kpuUD5M9HVPq3zj0IWfY5K8UnCFSbhFWDCPDXY89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jhyM1bjKLWn9N8gd5GhyxsvdLsPSzVKS4kxSTT2FU0=;
 b=f14TNcTl9aCR+Zko+vWikdJJP/PknQsolExgGi/M1FOc947GWz4hMjv+HHHxenNR9oHlu4JZrv/IM0JrwBoOHq7J0fgxVhI7FXg3GLbvHt8hASWhdmaxTEsDvBF/2+W0J0WAUupWb2AKnVDfikMsae2uZyByTNNbazCC9WQD0/3wVgnlGBDgKs8rY3Zxny5mL6rfLEiT7IJyK5SwCKDI7d0Fj4sDjo8aRntcyjMTKg10A/Dv/DVhGdEa+P3PgKIY69BeGfvp/AMNQX9+6ylphbKsomCWmfbrI3VJehojchYOVcaL+bWO+tydTIU8Zq0IScXi+4jTQaSlObNqf9bUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jhyM1bjKLWn9N8gd5GhyxsvdLsPSzVKS4kxSTT2FU0=;
 b=PFcJt00nFOtv7o7lCXpAc+ebMqSa5y+4T/dfKZncTIZfTFnBVKTv3LXtrurGzOpW+oTncQ7bDIQiW0Xi7fh0LgHOP/MWB9rxwdMr1WLhLM4WNHzagBTfxkbeIOnYcGBgbJAY0e4JNbaIpm9DgCFHHTH3Rs17Wppz0aIoGW3fsd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 24 Aug 2023 17:52:39 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v9 03/19] xen/arm/device: Remove __init from
 function type
Message-ID: <ZOf7V_FsJ_CgeL64@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-4-vikram.garhwal@amd.com>
 <734587ea-4066-4f60-8903-7f43a10bb1b6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <734587ea-4066-4f60-8903-7f43a10bb1b6@xen.org>
X-ClientProxiedBy: SA1PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::8) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbcb7b2-d564-4a73-60b3-08dba5059a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVqo+s3NMsnGYx5qoCfRYyHV85zQFsFJnIPa2RVdX5Dehfc75Hx1YFwDWpNZnnmdQbuqGHkthzL+n+n/s6hcmMSSu8yAduZ4/VY9AGKsNgpArygsEH6qkyDqsfQ0vNQU8Y4VSgss9Ms6Xv6NRwQgBVWXBi/EzbPQdwCZvTwOlbtaeRaBLyMIXUIkAZRcNhpX9tfRg9viERk4YgrZGLDMwGzMVv2zjeby2gzGLjChKQDW8c7RV/3LVHJIR5RsaYeEOu57YBJCylfIZY0Xt1CYzHY0bcbBMDL24Q7j6v9AbZlU4zAzFUfb7XwsOZ1pwxsuWIV5ZpYFSh/bDXv7y2BlVwd2oeenh6XWC+JNrVP6BE8KZh3oLOWfPG7IpSAs4x3INGwVzCjSq83D4zS5rorAG98zjFJRwQNiCfLMOLH8fTSpFPRpPbHKvSU5Yiri5hiwtb2+3YbP389Xk+koINkuaHry5VKD23ZLND3bW3BNzeon8t6ghBxr6LvSpj1XrY4TAHAcqM2Y7KCKKP6I61cwAT5eOANq67CEDFVuciy4qhgJuHWQhiGShL3WUvRZZnfd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(1800799009)(186009)(451199024)(2616005)(4326008)(8676002)(8936002)(83380400001)(66899024)(5660300002)(36756003)(44832011)(26005)(6666004)(38100700002)(66946007)(66556008)(54906003)(66476007)(6916009)(316002)(478600001)(41300700001)(2906002)(6512007)(6486002)(53546011)(86362001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anlqV2pyTFppcDBBdjYyZCtjWVlsVU11NWN0aFBpM3ltc1pkdG1XdEdXckRV?=
 =?utf-8?B?ZUFBNWo1VURCcGtoSHQrN1VkSlV2aXdCdFhpbnB3WHVVZHdCd0E2UjdUdWFE?=
 =?utf-8?B?SUdudmZJdnVHaTRvMllYRUFqWDdaVi9DZkQyQ2JuTWZuWU1GNFU4ejA1SUxM?=
 =?utf-8?B?VTcvdlRDZnNOWlI1YlZ1VWorYy9jMXd4NmF5a2dtU2dQMWtPd2o4WWRjVjVX?=
 =?utf-8?B?S0g5YnFlenV4U3NpeGZkVFk4Q3NYbVR4QVdsd2U0N1h6Um9vcDFUeDZkNlds?=
 =?utf-8?B?YlBmUHRnVnVSQ1ZvYnZJTCtsbDBiSGpNaCtLMVl4UFZkV2pIUGdCRXZzZWQ4?=
 =?utf-8?B?K2VYa1h1bHdERGhBS21DamI2bHpmQ2dxNHdEc0QzNGFwaHpnYzRCRHVKTGsx?=
 =?utf-8?B?cSsyN3BsMmFqdUhIRXZJVFBrN1lySE81SGJlSzB2Mnk4dTRlUVF5SnVMWlYr?=
 =?utf-8?B?dW9zR3pzeWtXaVkxK1MxZHRoK041akpCdHZIejBBakhreEp1aVViYnpvMzR5?=
 =?utf-8?B?cmpCN1lSWGNqMXNiSm9zblRXTEdjWnZEeXNOTFkrOW1vdGphT0FCUU5tN09K?=
 =?utf-8?B?TmJ3eXNwSGZzZWFtUDB3dHBjeitRSWl2UXRIcCtDdWRzdVZIZXd6aWdTaWFB?=
 =?utf-8?B?VVhkMjdvYytBUjJhS0VnckFVOWZqQmFLTTh2U0FEcENYUk1vNmpzeXpQYklN?=
 =?utf-8?B?NEd4SUhKRzJPQy9kZURWakh5RGZSeU9IOWRmS1lZTmlTSFFreUxxdk1udU1u?=
 =?utf-8?B?MS94TnRNaHNEcWhFcHhsUk5WbEFrZG1nKzlLanBUUlMrb0l0aTNvRVdoMjZJ?=
 =?utf-8?B?WlZyT3R6V2FDTW1WQS9EYzJaUXZlL0ZMd1ozaVY0c2RRODA1RHZoUVpVT2Ny?=
 =?utf-8?B?dUpiS0YrLzVoV1BYZjA4NWNKMGF0WUcrRVE5TTNaWitxaStIa2FTZ3RCalEy?=
 =?utf-8?B?c3owWVhuL0VHdXRIYXlRUkRPYmovWmlnR0Eybi8yYmJ5VWVsR1FsQitoaUth?=
 =?utf-8?B?R0g1SWRPWkpLSEYwbFFJdlEvUVQzL2RsMmZwYzNvc0swcU9OUXk2WDZUcko4?=
 =?utf-8?B?UEQrd1Yxa0JmOHluL0lMK2FyVkFYNm1RalVzdnN2bmRyOVZmMWFIR3hxZU5m?=
 =?utf-8?B?YnA1S09SNUZhRXVoa1lnaWpja3JQUnozRzA3QS9CcWE5c1NWcjBiR0Yvem9B?=
 =?utf-8?B?dVhERXU1cWRuU1FHd3o3dHZVNUV1Z3VYOGRERktFSVZoR0tZTHM3V0s3bDlo?=
 =?utf-8?B?U3Nxd3hqNE5KejZBaytFWDdKaURiNEVUWnU3YzlYUDlhYkNZTTNLSE1lMTdE?=
 =?utf-8?B?MFMxL3Jnd09LV3QvOHNRcmF6Mm9vSjNnaVVPWFRueVpGaC9lb3hOVEZsaU04?=
 =?utf-8?B?em5UZGFJQ1puVVMxdTZwTDFTZi9JZEZXOUNoZVFPRGNIWG1lN1ZSaFVVMmFj?=
 =?utf-8?B?V01MYjE1SW53N3lOcTc4bTRROFlsRVhQWXhIQUpINnhxYzF6WTY5ZGYvSmZr?=
 =?utf-8?B?eVpWR2JiZXdsVE5EcmdxUkRxQWlWcllYYmRqQjRWdzA2RDM2Nk9KMTlCZm0r?=
 =?utf-8?B?djhORnVScjRRR2dwU2R5NS9LdVR3TFNaVjdTbGkwSUVlYmlzSmo1V3l2TkEz?=
 =?utf-8?B?ZWRsL0VsLzd6OUFRMVdoWittcnNjb29DcFBJMUM1b09lZlk1cnhQVVozdisr?=
 =?utf-8?B?bE5mcVpvUUd4V1FoVDkwMEJvTVc1K1k3NnBMNElHaVNwQndaZ2daZmhLNTdE?=
 =?utf-8?B?Tnl2VU1oRmhjWTh3ZU1WR2xWTC9nOUhaeGdHYUV4OGFwT3NydHhsOUVCVExt?=
 =?utf-8?B?QnhEbVF3OXlndTdWSDArOHlOUTRwY1lnT3RRY2t3bWpQeDllQ3IyWDdqRTBB?=
 =?utf-8?B?Qk51aUYxK2FDd3RCTHVvOXhlU05ScHRCeittQ1hWWnBxYXlyNmRncVd3OHFT?=
 =?utf-8?B?akJzQW02RHFtN0lPM0RwMlRPZEV3WHBJL1pSS1cyTmQyeXpzWlRId1Y4eUtT?=
 =?utf-8?B?SWg4QndZSGF2QkEwVVB1TTU5bjRhY1B4aThNZjlSVk4yNFZ3c2xmNUh6WS9R?=
 =?utf-8?B?K3hTa1FESWtnN3ErSGovQ0ExNW5mMjlDbmZJbkZicWZSNDVLOGR1aWNPQlNM?=
 =?utf-8?Q?VrtQxWdSMFEsrRIqAN3sDG9m8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbcb7b2-d564-4a73-60b3-08dba5059a05
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 00:52:48.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDlGE9XqrTcZ60YV3fEkkTG2ZDf1pga/8N0k8qIM0XHed/VTFIMBvsrnjvtwQcSxOUVlfvfsCo5ffiyeoPZWAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047

Hi Julien,
On Tue, Aug 22, 2023 at 07:59:13PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 19/08/2023 01:28, Vikram Garhwal wrote:
> > Remove __init from following function to access during runtime:
> >      1. map_irq_to_domain()
> >      2. handle_device_interrupts()
> >      3. map_range_to_domain()
> >      4. unflatten_dt_node()
> 
> We are at v9 now, so this is more a remark for the future. In general we are
> trying to avoid modifying the same code multiple time within the series
> because this makes it more difficult to review. In this case, you could have
> removed the __init in patch #4 where you also export it.
> 
> > 
> > Move map_irq_to_domain() prototype from domain_build.h to setup.h.
> > 
> > To avoid breaking the build, following changes are also done:
> 
> I am guessing by "breaking the build", you mean that you will get an error
> because an non-init function is implemented in domain_build.c. Right? If so,
> I think this should be spelled out.
Yeah, i will change the commit with right reasoning.
> 
> > 1. Move map_irq_to_domain(), handle_device_interrupts() and map_range_to_domain()
> >      to device.c. After removing __init type,  these functions are not specific
> >      to domain building, so moving them out of domain_build.c to device.c.
> > 2. Remove static type from handle_device_interrupt().
> 
> Typo: s/interrupt/interrupts/ to match the function name. But I don't link
> the name when it is exported as it leads to think this is dealing with real
> interrupt.
With using handle_device() in overlay as your below suggestion will anyway need
this handle_device_interrupts() function here.
> 
> Looking at the overlay code, the caller (i.e. add_resources()) is very
> similar to handle_device(). AFAICT the only differences are:
>    1/ add_resources() doesn't deal with mapping (you said it will in the
> future)
>    2/ You need to update some rangeset
> 
> For 1/ it means this is a superset. For 2/, I think this could be abstracted
> by adding a pointer to the rangesets in map_range_data. They could be NULL
> for the domain build case.
> 
> So can you look at abstracting? This will make easier to maintain a single
> place to parse a device node and map it.
> 
> A possible name for the function would be dt_map_resources_to_domain().
For this part of dynamic overlay programming this function can be used.
I updated the overlay code to use handle_device() as per your suggestions. Moved
handle_device() and other relevant function out of domain_build.
About renaming the function name to dt_map_resource_to_domain(): I will see if
i can come with better name else will keep your suggestion.
Now with this case, overlay device tree needs to have "xen,passthrough" enabled
else it will try to map and fail as Xen supports irq_route and mapping only at
the domain creation. In earlier patches this worked fine as we were always skip
the routing and map. Anyway, I will add this in overlay commit message.

I will send v10 tonight. Testing a few things.
> 
> Cheers,
> 
> -- 
> Julien Grall

