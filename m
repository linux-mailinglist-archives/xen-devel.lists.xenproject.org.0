Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C1C78BED9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591993.924600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qascu-0002wC-1E; Tue, 29 Aug 2023 06:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591993.924600; Tue, 29 Aug 2023 06:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasct-0002tc-UK; Tue, 29 Aug 2023 06:54:59 +0000
Received: by outflank-mailman (input) for mailman id 591993;
 Tue, 29 Aug 2023 06:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qascr-0002tG-Op
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:54:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5f8ccac-4638-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 08:54:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8702.eurprd04.prod.outlook.com (2603:10a6:102:21d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 06:54:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:54:53 +0000
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
X-Inumbo-ID: f5f8ccac-4638-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZd4h80ZhUvkXYLnpMJnOj+o4ariGRtp/KkMn9/2OJxOXnQCsEwd/a81wHpAanHamU7RU388UDoZCOxXJehodJWoILpyul8PY/pcRTYSWbkgolRNOcPFkPMTtdepHPOBBDzTV5OhIOtuMzEuP5pRrevj8lH2SBzomAQIP7EujK7TfLwsPHPzKfNXuvS9BCTF4au1Koapq/TC96HKytJMf3SODgx491MEa52AyAJ7s1rQH//hppXRI7eC9M3kgf3bVynG2y1NSfhGmkn3Su2xsvwfgVayf+2XGq2fDCgUq97ienrg9wYfGlcFDh/6Ebuf98deRm9yE2ajhf5JRA7iDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBdyY7ht4ZrUvUj1VkvWPtywKpiekhbV4az19USI/8Q=;
 b=jHgLFlY1nCT9ow/OZd6Z7iP04aDmgwKMMzPHWnfXNGbHxzQlDeKRmihE2GcNjncZwodi7Wk3Ybhesb41XPiAv+qVnWbU2Xa+vbYk8IBmvU4nElwfRVMTCxcH+0PosabiAUqwaimSIffyhe9btAnm5DI26+ZC1rOMv/RpV++lhffZtz2lz5t5qW8ntOcNl6SHsTWYkZPnrjd9cVXbkG7GFLrlQKhbnzDmkpkDl09OHHxES5dJzExX/TpwCgyWDA29J+zIlHESQXvMyGerZ7c/mYtPkV9shRtElC4rLce2gNIzTdfheJptdOf+Yo3/V98YrT18My35xnzhZL+tZ8TCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBdyY7ht4ZrUvUj1VkvWPtywKpiekhbV4az19USI/8Q=;
 b=DcOx+oVIwjVzaGqJyXpU1DD2gm/hs3bjJRrSgIcQoYBuLlT1K0KPClde5kuskz1mkQ9dc780+LIvICmErTRdXJyp2qsoBB/s728gIqgXzgUmMc0WO4eoXloNvVD230WJ7ynulWcWj7Dr8zBeHUSvErUDX5I1kKRtJe2baHiPNPEbJ1oltyXYuaQwjWqLGNCMIwU8gVozCWSSyQfDDhOcfQJDwDvBvWeclz5XhJQNFdJdG8ChI79SSHMVT5FvQMh0qX6HlsoKwUq6cQ1wL6ve0ohXiSkFbHcu0gZAngpdJdKVCXG9WehakZgQ0vl4RFr2BnvAZWFEq5Udel07K0z7jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4fe77ae9-a9c7-c8ce-2bc1-80cc1107b4b3@suse.com>
Date: Tue, 29 Aug 2023 08:54:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 12/13] xen: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: f68e97be-a6f9-4d0c-74f8-08dba85cd8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	33vv3e3bxNTe3Cv27uJaqn0bxYIyEDy83dfdZoUCosxhpW2vJ/VkJCHoM3ELL7PqsO+LHV7Da2U5lDKCaBUAA1cT99dGaDUkuUcerr8I05RdiHdlnhj1R15wM6huqnWfvt3UaKwAdZQ2z/5K4WFCuz8GyYrBxw6AF778Mkxn3fgDtdnbEw8Pkn27kQvGG6awyWWdBfjfMDi6jMwaOjTvD7edSuOjHKGkm16hEVM/zL/PZc0uqwClpeK1+b/D79pVgwcnnjrmHHdO6Fuz2TY0BBeJ6KcZ7NUAEq5O4Gy+/B34kO4pRALzRg3EAe3yfQu0i8lM4jwGDaGmL9w9qyZbAdRLvTFsBJAfIEDt0iI5odbneDqm+YNkwlMumwW/PiBLuIQO7WnpYK4ZPWJO3yivhw/TiZNNhk0B3K+btahZeJv/jEpaFeh0rMVHd63llk1fe3MB+5PqyOLifUkgIlkF/7B7oQ6SL901/H6pb0zON7aBggsihnhFAGkENX5VOHtHnNt5bXk//+xihkcC4gAL9bfcECpxCWeQByL4jK3qVmrq0L311mb3W38GdiZ0NNeBRcUmoQ3SrHqRTwQyEfGLishMlDkVMYjrltCZ1JJ6+K85wYRf2aarMy4Pd/YfC+EMDaVEgPWZeVGbYaFGs3ZA0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(186009)(1800799009)(451199024)(6512007)(6486002)(6666004)(2906002)(4744005)(26005)(53546011)(478600001)(41300700001)(54906003)(4326008)(8676002)(6916009)(316002)(66946007)(66556008)(66476007)(2616005)(8936002)(5660300002)(38100700002)(36756003)(86362001)(31696002)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTBrUURwY1RjVDhmRm82YkZBMlYyelRIQ1NVTEo2NFBJd21uZFhDdXJ4WEpF?=
 =?utf-8?B?NEQxUWVERlBrZWo1bWh4U3VrZkRsRXBkM1duT3BpVHluSHdwRzF2eXZkVFl1?=
 =?utf-8?B?bmwvVnlmejdSMmFaNkdnMlRiQnlkd3A3MytxTUVOVGtUeHI5RUdZWFBYNHNx?=
 =?utf-8?B?SUpVRHRkNnNIb1ZNdk5seUY0aGZiMlQwbjZ5NHBsYk0vVjRHSk8vcWtEeVpt?=
 =?utf-8?B?UmxxMmQ4SCt0dGoreVFzNDgrdXFaSURtZ1VtZ3VHUlJTYXNUd09CMmgzei83?=
 =?utf-8?B?dUI5cTJ3enNSRktRL1VxbjQ3VHdsTnpXNjhYNFVDQjNoK0FyN3lzNVJJSnhK?=
 =?utf-8?B?dExYUWhCUWlwamUrYlpYaTNpeEJUUURCQnZyMHAxblloczQrcFBlNGNNNDNE?=
 =?utf-8?B?c2NJRWo1M05GRUU0b25Rb0FVUE4vNVYwR0ZUMXlodTNWMU5SbnFPU21vYXBQ?=
 =?utf-8?B?YmxybkE0dHlSYVpETXRRcGZwdUd1N3IxakQxL00wbW1PUE9ZNDNwZ2o2aFNS?=
 =?utf-8?B?WW9zbXVCZ3d2OW1rOVNtTnF1aFlESGJIWjkyQnJNZnl3UFBNNitaamhVTy9t?=
 =?utf-8?B?STNHWkRkY1NKTTBEd3lKQUFxYUxTK2JlK1VIWWRWZURxUTVUTTc2R2t5cDUz?=
 =?utf-8?B?ekJteWNsZHFLYzhtVGh3QkpxQ2phQmplaHBsQlNMTlptaWQ5SWh4WUlXRzZG?=
 =?utf-8?B?d1JlS3NyWlFPUkNQaDk3MG8wemt3ZDBVUktWRGIxdUx1Y01MZGtTVFk1N2RR?=
 =?utf-8?B?c1VpRHVNYkl1Y2JKL3hkUHFEeFhRTVdZY1BOWVJjMjdTdXQ5am8zT3h6bXpO?=
 =?utf-8?B?L3IyL3l6eHl6UmR5WUlJR3lDMGNlVjZEdnpKZTY1SUlncGhrMFNsZWovNUZQ?=
 =?utf-8?B?NUtodDltcWtUTDB3Mms2T29Ld1BDWDdOUVpmNWg2R21xamdPVWRWMjRrTitw?=
 =?utf-8?B?cnRyalhhTGdyemorZ0szK2FKVzVjZEI2dlVTd3MvaTZqQi8yQklsVjJUSG55?=
 =?utf-8?B?Y1hmZ3FqSnk5STBJOGtSRXZFamdjRFNTbHc0NnRrd0FmSC9FbDlpbUlMblow?=
 =?utf-8?B?S1lZQ0tXdzZVM1ZIcS9MT05rZ1RuaGhnV3lsMXg3VWRjOVl4YlF6QVhtNmlD?=
 =?utf-8?B?RVMrUVFoSXZGWjk1SUdobTN6dXBnRGROb0RnWEtxV1FMc3U3cnptZURnQzNu?=
 =?utf-8?B?b1J0OHBVTGMvUVZ5OVA1aUFkL3FOSVZWSUFUNTI4RWVaSkRKc0dYOHRBMDE4?=
 =?utf-8?B?ZWhjQyszQWNFNW5pei9sUFhFaWEwRFRZY1RFUU9vRzlCeVF3ak1BR1lUNklB?=
 =?utf-8?B?OWs3dDNKNXBrQU5sY0VMRGtVaUcvc00wQU9ZbDdvR3pYR2kyZEFadUg2MC8z?=
 =?utf-8?B?cXVRdzdHYmZGWWRMc1RmMEVRYUFxMU5PdXBIWEFIdk5UMnc3dnVXOThGLzN6?=
 =?utf-8?B?T3llTmRGZXVTV25zeCtJMVlndC9qYVhKZ1FKSUh0ampSc05ZZUhnK0Y2dk9R?=
 =?utf-8?B?NU0xa0pNWE5URlpucllnaTl6WUMwS3RVWE12V1c1QWltTnd2NEtMcEYxMzVF?=
 =?utf-8?B?ZkRhU1cxVS9nUnd3a3o3MS9yZ1ZhZUhiQ3hyTW9iM1BweUlMWkF0b1lQdTdn?=
 =?utf-8?B?UkpPQVRNbjNpMW5DRnlremlXZC8zajdTd2s0dWJ5WGRzYUdoaytVMTN5ZFgz?=
 =?utf-8?B?NktlRzNDWEtkVnZLZDEvNUxiNVNtdXhMTVpJdE5UNjBJQ2RoQU1rWTVVNXFW?=
 =?utf-8?B?aEY0Nzg1emFJSXdwY2VNTjdZQVZHTnB4SGs0M3VJUk95RG1NM2JtMW5PQjRj?=
 =?utf-8?B?ZHNHNXBhU0dLWEpCQktwR3JJejdzcHUwUk0zb0x6cVc1WDRVeVZDNjhOeEdG?=
 =?utf-8?B?a2xTRk5Jd2dIQzhUSXBPcDFGZ2RxNzR6N2lkbHBDNUE1SERpWmtUcUVXQzhs?=
 =?utf-8?B?Mm54bGdpdENvK0ZkQXQxQkFncTF2Ni9aWjMrQTVYWG1ycmtCWXMvU3lkRTFl?=
 =?utf-8?B?RDRnT2NQRE91ZWtJcVRmMEVoNjRldVlGY1habXdYeERzRGtpek1ZU0tQOU5K?=
 =?utf-8?B?QUFjSDZTUjl0YTVsRWM0T05YWDl1YWRQUDd6c1pwUEQ2ZDlvRDZMMUgrRUo4?=
 =?utf-8?Q?GQf7Tsw1JHGwvof9FoGgSy1h2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68e97be-a6f9-4d0c-74f8-08dba85cd8e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:54:53.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+u93oIoGaExn+RDHKVGydXG4XY5vyNyqBLWHx8qHwF3ycmICnoxF+YYJcakop3j/Al/nKCPDyZtTKBQGDqqzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8702

On 28.08.2023 15:20, Simone Ballarin wrote:
> --- a/xen/include/xen/unaligned.h
> +++ b/xen/include/xen/unaligned.h
> @@ -3,13 +3,14 @@
>   * without faulting, and at least reasonably efficiently.  Other architectures
>   * will need to have a custom asm/unaligned.h.
>   */
> -#ifndef __ASM_UNALIGNED_H__
> -#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
> -#endif
>  
>  #ifndef __XEN_UNALIGNED_H__
>  #define __XEN_UNALIGNED_H__
>  
> +#ifndef __ASM_UNALIGNED_H__
> +#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
> +#endif

In addition to what Stefano said, this repositioning also is questionable
(as per comments elsewhere). Overall it looks like the entire patch wants
dropping? Or wait, no, the pci_ids.h change would remain.

Jan

