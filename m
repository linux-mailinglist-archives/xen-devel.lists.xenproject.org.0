Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC075EC885
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412798.656254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCpS-0004Ul-TP; Tue, 27 Sep 2022 15:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412798.656254; Tue, 27 Sep 2022 15:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCpS-0004RT-QY; Tue, 27 Sep 2022 15:49:02 +0000
Received: by outflank-mailman (input) for mailman id 412798;
 Tue, 27 Sep 2022 15:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odCpR-0004RK-UK
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:49:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20053.outbound.protection.outlook.com [40.107.2.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7718d1a-3e7b-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 17:49:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6828.eurprd04.prod.outlook.com (2603:10a6:10:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 15:48:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:48:59 +0000
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
X-Inumbo-ID: e7718d1a-3e7b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0xJC0mv7k2I5LilK/pQQDbFBLzkJK+EkJOIIzXNnvqrT8y/d6bqbs7iLuorsGgozY4u0GV4WZub+hYymrsjhVm+B0ACLK3pmc4NQeyozV88TCn5rGtHfYgdOGGkW0I/wQg6dap1/raBn8cdxwFjLtqvPl/w+tByaUIkGOAEt1hcx+dMLaHkjmYZxuM56ZUYkFdLnN14RSWXLziKnggHZGMm4rVTmOHTPdxV/Oql/i/h/wI/RTEr5dL8hUBYSPnlns4C82/QptYbyolmQFFu7uSBwGJG26mCdfJEO7KsU0ff8K5idhfJfH4ZK+JeZAqMCWLXQZPFpeZzpusSIbfz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AOXUC96VkhsXa8dWhvMF0s+t1yabiRdQ4QW+0xtGSQ=;
 b=G9VVSI/9N2oucWBEa3iwpRQbBUVvve48cW/qP5h+5VSuTGwl469j+bDOi3MWD94Co38ME6xls3hwrPfOWcQzzZvxN6A1AFirh7jqTT2YDDO3PvsWycIMgnr/C+x1l93YR32fsY/mCTjybmyUC+g6rTWfKGOZYu3L7JCK/aOgkv8B3QLbM/Tu09rwB5OU7SNgz8Z1m9IHXABd+FTon/fR8HWc2JwYBIcTbDeDR0q8gmTYTuU1BIoJ3q549VRqtoh62z/0vdWC1jndrM/ROyTOee5mfCx0+qRxbjDpJXGyyyCixTpYho50cLrLVtYNVJdCCUH7GfmweEzdSJ0KNRg7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AOXUC96VkhsXa8dWhvMF0s+t1yabiRdQ4QW+0xtGSQ=;
 b=a70KddQ0s/xKeh2v2s13lIG99S678AfZopXhRBF5UmigfYcGrmoiSEaPgkCQSBfWcEGrd/WkJE4nyVeXRzt6tF4M+TEsEJDDR9Pt8nxq4r2Y/JgM40MuT/wZ5huNdoVgCSRHwjxzhIgxFWVn7Iynx+gBes6mSa2otXbf3zLk6m9CmpQRw0o5MLlUOUN5n9ipp1UmnJ/KQhlmDi1FAqITanFXix1YIdHnCi7W+zXLI6WMXLGGk4F29ATmvIaTxuHBt9ce9Psmz39TbvIm/rqHGxPlY7tL/KQw22aVzYntx28d53z6c3PoIQqkK2GCo+bDkxVJe8FVDXbmHICyCtwKUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
Date: Tue, 27 Sep 2022 17:48:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220920091218.1208658-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b02e11b-fe0b-4fcf-deca-08daa09fcadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NmV71Op7B50r3ncKhEdE/NEsYSP0R0EUSKKsGnG5cK8wlVTV74mS7C9i603xUzhPp356zDibxe1blhq4X2t9Q5YFUZmDpTfAxfdRcOfC+/ZNaEMfUyrCgDStuC5z2MV+QO/gYZ17qtcMuucqptHeSutNRKvOoEuOiQGuiIHfpkyowp02ubcSJHaI6RkS4NPLSMYKXbfs6+FsyZdHnsondsHjKOLkAxCUjFBDL+C4aiEjamcYd0MtOADBjELwqLe0FYHcR1MXafqeLPbsupP9P57aLhAUBXaRY8UNdfuHgo5Z/rKT8i5pL0Twk2NZ16/Rz8bi/DK0Roxt3S+i8T8tFqV1cLtemcW4Uue3B/aXs6P5BbiSUXMMlUxbfIlb3wRW6n984uARGxSB8H+ea8invzpyl6Hr/4QbOPjo9jEOKK3yPyKHWlJgFczWSDFWP1HOHHezJMV1uzm/gAxfQCp/Rc2muU1rmxVEFqRqpptLdWzgITsE8mo+cVpLyA6gisJ+O52GAwyGU7Oo34eUq4kow11fRr1upT2p7dXA32djmKTszkpn5aYa8sC/vEe7rWk6GQG0y+t6QmoEDRum81rJsYYGdXCBgKywCRW8pN7Qcf+7h+PfAU7PGoybzzampAjIqutZs5/nqVxmXFnLszyT/K3K+8vGuPahrEHKFoONS0GhQy8qz2cqN7zg5ZrGVy5VGSQzvywDQK0On2an/z35lJiWa0GKzvQr7FVTA9EooqLLMLKe6yjJ+aE0dnOiIAEdwTv//UDC0DnjgRXcSXOke8kaY11P4/4Fhsnu/HbTbtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(41300700001)(478600001)(6486002)(8676002)(2906002)(5660300002)(31696002)(86362001)(36756003)(316002)(4326008)(54906003)(6916009)(8936002)(66476007)(66556008)(66946007)(186003)(31686004)(6512007)(26005)(38100700002)(6506007)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eldLUU9HOStmREVQWjJ1aGh0cGdlclZKdEozeEFvMDBDNWxHQ2E0OGdyVnR6?=
 =?utf-8?B?bGJnTFVMekpyMGdMZjZkZlpIaW9pa2xlV0tNWUYxd3JWK0VSUGQ0VWlNMEk2?=
 =?utf-8?B?MUI1QUkwUmNRaVh4N2swWkFGS0hPckEyU3NzQXhJQ0RNMmNpVkJWdGpVMGxK?=
 =?utf-8?B?QmxrMkw3NGc5ZitZM1JJT1I2SHd1elRxV3g3Y2VOT0NySzRYV1NQQjdoVGQv?=
 =?utf-8?B?T2x1S01ReHA2S1BhN09pRDhrcVBNYTB1NGsxN0p5ZFAyQythc20xMU4xWlFx?=
 =?utf-8?B?aHRMdzZ1SUg3Qjl4ZjA0dmxoMkhXeDZXcHdpczFSSkZVWExBWG1vUy9TN2Jm?=
 =?utf-8?B?V0pXY2tqR0diVWVVdkxHQ2ZpdmdkU1dqdC82UU5hTE9zWkx0RzFnS2h6UkZH?=
 =?utf-8?B?SERRR09uTTNsWFVZNWJud2dDRm8xYWRBOUdmbEl6L2FBdXRHWGxRWXhndEds?=
 =?utf-8?B?aEhYNTlaZlRTcmQ5RmVtYTRZN0ZkRHdvUnJxYzRKb1RKNkxuK1gvSStyQXdE?=
 =?utf-8?B?cXpPc3dweDRIRHQ5WVJpYXdRVzUrWTlXK09UL0NtZE9pendKTDRyemlDWnBv?=
 =?utf-8?B?SlBWbjZlNWsxT2EzVEE5b1JGc1dCUXluenFMZVFXdlpQcTRTVmREQkp5Z1pU?=
 =?utf-8?B?eTlDbURoN0hZV2dWVHVRcVFIZlQzOTJ4a2xoZndOMFdHZW9KVjA5UTlNeHVQ?=
 =?utf-8?B?MlhWMURhb2p3Qi9GVlROYVk3Q013RW42RHFDeExVelEvNE04SGpFQlFCYkVF?=
 =?utf-8?B?ckdQNWF6VGtVdHZEN1pIdW9ySGJadzVRRVJCL29IY2N2NDN6NEVhdUNRMVZ6?=
 =?utf-8?B?aks3UE1FbUVZTWdDdDNmTldjd3IxK0pZUXZ2ZmZqUU1GYmNWbm0weXhRSlJs?=
 =?utf-8?B?MmpReTJPay80eHFSSUVZNU5hZitnL2d6OHRKOFB5ak5nWlV5VmxQUGNSaTN6?=
 =?utf-8?B?Z0ZIdTNwcnRTWGdVK25qSXRZOGNrdk1JSVBkUDhRbUlSU3FlMUkrUFE3dE5B?=
 =?utf-8?B?SUNyRUt0WDkxaTZPU2RIeDB3UE1EWEpuMDhaYzkzZTZiMjNwNE8xYXVDbUFB?=
 =?utf-8?B?UG51MHllT0N6a3NEVHJnbENYdUNXUUVrK2JtZ3VHMUI2WkxXQVdONVNxdmZE?=
 =?utf-8?B?RjB6VUc3eklnYWFxcWUzdmYrRW1NNktCMXNRS2Y4WGptWEhqOFhWMTZTTkl2?=
 =?utf-8?B?SThBeUc0V1ZJYWt4RW95WVFJMEhpK0x1RFk2R0ppU0dEKzFGcTl0NngySndl?=
 =?utf-8?B?RzRZWWdCaTZSSU1hek1yZW5PeHhzQWVqd01Ga3hEd1ZLNGFtWTErcDRhR3Zx?=
 =?utf-8?B?NnhHT0tHTzZ1SHpNV3pKUzNLU2F4akJXT0ZodHRSSUI0NXQ5RUs5c2FCRFdU?=
 =?utf-8?B?bWtoMGhKTEdtRzAvaDZMU1lJbUl1L1BYS2d1WmJKQ0g0MmZXSUVIYVc3blJu?=
 =?utf-8?B?Y04yVE5rU0oxVTRQU3FwSnZKZVV3dXIrUTNKWUFPdUhsajFFK0FUdE9TQlhi?=
 =?utf-8?B?QzFRR0lPWG5iZmwxOXJDM2dpazdJSDZCZkxiWHBkVHpZM01VQUJURmNLRHha?=
 =?utf-8?B?cFNiaHVBWWJMUmlYRUphN2VsM1hWd3Rqc0tUS0VtQzFjazBJdFBReVhqbE1H?=
 =?utf-8?B?S2JkSFI3cm9WS25HTlUrcVg3eTFIdXNhb0lHNVp0dTEyeE9EY1NUWDl0bW5q?=
 =?utf-8?B?Rnp4NG1qNVkzOUMzYUNmcUxaSEt3eTZVcWVmdlZDZGd5WWFUS1VrTHQ3bFlK?=
 =?utf-8?B?WWttc0YyTzd2Uk5LZ1VmaXU1MGJhc2R5d3dJcEJYc0ZuMkIrSUNjUUJnU1h6?=
 =?utf-8?B?UUk4Q05IaFZhbFQxaEp6MU1pZExBaEFjeXBXQVlZRmM5TFU3d3IwempUVTNN?=
 =?utf-8?B?aWd6VjJHdnp5YzA2am1BUnk2UlRSNnFpTEVWNkhuVjdsM1NCNEh5dkdTa09x?=
 =?utf-8?B?MWg0OGN1MFhnZUprNEE3d2MxOVQvbDVSWWdVSlRkQ3J4QVdQeXdNMXVkUDUy?=
 =?utf-8?B?bXBpRGlFUWYwTmF0Y2gwTXN5TDc1VFA1ZTIzTU00bEhOTkMyc3FzUmFnTUZy?=
 =?utf-8?B?VHlKdlI5QTdTRG9nNWtzR0hPZFRmd2FQN0hHaEZvRjlpcVVKTW5Tb1VMRW9C?=
 =?utf-8?Q?yRlOVWviIJ6qB3iy0w5Yx1mIg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b02e11b-fe0b-4fcf-deca-08daa09fcadf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:48:59.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0F1nYZbVi13FpTWFRidQdS5RwJKcBUyRgn3fQcsgz2p0mGINm2oroiSEV5a9OT8mWTH3XdcrvJdZaEqacQkzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6828

On 20.09.2022 11:12, Wei Chen wrote:
> +static bool __init nodes_cover_memory(void)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; ; i++ )
> +    {
> +        int err;
> +        bool found;
> +        unsigned int j;
> +        paddr_t start, end;
> +
> +        /* Try to loop memory map from index 0 to end to get RAM ranges. */
> +        err = arch_get_ram_range(i, &start, &end);
> +
> +        /* Reached the end of the memory map? */
> +        if ( err == -ENOENT )
> +            break;
> +
> +        /* Skip non-RAM entries. */
> +        if ( err )
> +            continue;
> +
> +        do {
> +            found = false;
> +            for_each_node_mask ( j, memory_nodes_parsed )
> +                if ( start < nodes[j].end
> +                    && end > nodes[j].start )

Nit: Style (placement of && and indentation). Does this actually need
splitting across two lines?

> --- a/xen/drivers/acpi/Kconfig
> +++ b/xen/drivers/acpi/Kconfig
> @@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
>  
>  config ACPI_NUMA
>  	bool
> +	select HAS_NUMA_NODE_FWID
>  	select NUMA

While I might guess that you've chosen the insertion point to have
things sorted alphabetically, I think here it would be more natural
to select the wider option first and then also select the more
narrow one.

One further question though: How is this going to work for Arm64
once it wants to support both the form of NUMA you're working to
enable _and_ ACPI-based NUMA? There better wouldn't be a requirement
to pick one of the two at build time - it would be nice for support
of both forms to be able to co-exist in a single binary.

Jan

