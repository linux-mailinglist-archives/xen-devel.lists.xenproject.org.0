Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACE6FF5BE
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 17:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533463.830164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px864-0004TV-3G; Thu, 11 May 2023 15:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533463.830164; Thu, 11 May 2023 15:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px864-0004R6-0A; Thu, 11 May 2023 15:20:48 +0000
Received: by outflank-mailman (input) for mailman id 533463;
 Thu, 11 May 2023 15:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXxA=BA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1px862-0004R0-Gx
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 15:20:46 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6580dff9-f00f-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 17:20:44 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BN9PR12MB5290.namprd12.prod.outlook.com (2603:10b6:408:103::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 15:20:41 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 15:20:41 +0000
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
X-Inumbo-ID: 6580dff9-f00f-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g87zleXaVIEW4oaBKiY0RkQyXilG8X1j19Nj9KZCm2RGp5XU0Y214yXzO6TSR82e/dgDr2aIpPTcWT3w82bljnEsRPHSlS6eyuXkjpwnfEQlXVdyTRc4ubRyBsVPRht1QmjS9unG8b1I+WkcHJwcxqHvJlPzwUDdrMsb2b/hZtwzcr1Dyo6tMg/9+xoB3104dADcR8zI8MgVpBZLaKcDZ8beEonozhoi3MBf4dFCQz0PXVFb1BLmlLeA0ZSZCtN5GLnAUFmQzwSOkpo1ZPHTDzAMhZoQh8uXwfjaip5l+dkeoSK9ckjj//mIK9XW/dpymVWRHsXelHi0J6zIETSX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwKN5ctfo4h345rsU1a5vyrdU45foxlxf5zSETQJSko=;
 b=L8BVRObG0QwtYAOlc4K7jYObI1g0NnqIh/d5YdN0RGXxusa7lvQrQFq1s0M/L1YxlI7qj6Qy3s8ShlQHo64JjsEs75hD39PxZipvx7DnePDAIHmYkH9YWQI0IhJF7Q7UHqsYay28thxOuFQFTh8m6OgdmbyuaHRTQZyo22e/H3PWMfNdzuvByST+7p5wEb+xq2NmFfQKZkLGuDPvI/U0emESLupgHmSYRp00JK3nbqWqO2/lcEMmIYl/gEIMVXhvuqTymH3BSkhH0/8yFlKg9neGdVUBZKkp2IwQYOdpljZrurHUUTmtBvCEYFNyzQnLNT2xw4HTK0bZ7y0vSyBufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwKN5ctfo4h345rsU1a5vyrdU45foxlxf5zSETQJSko=;
 b=Hf9vJQ/EtEdtfefmF8BM+uSEo0puhjWPhcSRRWw/kQwW3yYqIxskuv1bsGPFKHJxKsMkA6sRo/gR5jg+gkWM5HPr8PNNROmxfb/EWGLDzOFK6TxhrO8KWZYas7yF/cn829JsLLMFa38btZg1/fIbeJhrhduMLw8878TKtQ2JDZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <773f3bb2-249d-c6e9-13b4-e7637e1035b3@amd.com>
Date: Thu, 11 May 2023 16:20:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] xen/arm: domain_build: Propagate return code of
 map_irq_to_domain()
To: xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
 <20230511130218.22606-2-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230511130218.22606-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0457.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::13) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BN9PR12MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: fe507d2d-475c-448d-6857-08db52334841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BAtGrjjHghJyYSnJX4RCZ9hPTd7HQxeHyCms6r13SYLYpuG0JD4wbUdSsCzGQ4JNLKvrtN2qyRChsDtRshSN8MIgIicH1EMgt3abnK6TqrFxMJFkQPmLz2hBuXO/lBnsKhKiog0itCgYNviUrB6T7UESMeO9G99d7z2SsbzGFyKM0GrBmsT3kxECJp6HcfbZnheMLJijJvHH5fhWtTn3/UkHyZ/ZOCiM3Tb4fRVHiSKzkwD4YGFGt1Lk1+nhoSsu9LpC6iAbTu5eyvTV0DzhDL7jqIb5xKwTtGG8SrCX/LW5QXYOAjHKWE4xc/MV+wOFwFQIXQFNJ2w6gfqvdpOjIjZH24DSvy3DapuRe083IhCvxk1dp6dPkpfDXTmY2UiGeis9X+/cK3JpHUBpZ+/l4nLEIaT2mYaD8R+rJsIL91x235AlhHC5JP0q/wc9FHKk4DLhEB1Vg7J9IyXuSs/wyiIdl91f03pF446L3/2WV4ZBS4fkeOBlSoATbs/HxUffki3okb8RDcKr30Cq0rOre3FDiEz7CeTXcHaMtLZJTSdXZ/cmA5ddiT1GVSLuvmyqsiNNuS8qP4dgPbe6QaXakh5pUYKR2Y1ucMztM9OBGdScyuFxRtT3d1JhERbrha2J2s90JQW/EyVeixfM8VEPlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(8936002)(8676002)(5660300002)(38100700002)(6486002)(6862004)(6636002)(36756003)(66476007)(66556008)(66946007)(316002)(478600001)(41300700001)(6666004)(37006003)(2906002)(2616005)(31696002)(186003)(6512007)(31686004)(83380400001)(6506007)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDB2bzlHaUYzYkQ4R2dUK3VXTGpJaks5RHo3UVJ1eGh1WEdQeUpPc1ZYaDRW?=
 =?utf-8?B?M0JhSjJQSGVWOXpyWlpCSjlpMmZiaDN5ek9QWVE5bDRYVXpJbGVrVEZELzZl?=
 =?utf-8?B?NlhRaTRaYjZ5cmZ0ckNmLzRlUVVxQVJFcmJ0OGRjT0hqUFRUbHVTditiMzVW?=
 =?utf-8?B?ZElwSmNOZkJKcTFzSVJIUFVkWExtUENTNTVKbnNsdUFxUWV4K01yQk1BSWxa?=
 =?utf-8?B?WVlzOG1VVnNZMjNYZUl6QkJzeFJHbStpYWNBb3lvWEJpQ2VaOTJpVUJnZVJw?=
 =?utf-8?B?TWxNMjE2bVpuU1NtakthK0k4aVZLcEpKdGptY3Z4OGhmeWNxNC81Vlp5VFBa?=
 =?utf-8?B?aUNpdklKWDdqakdSZzJpbFkvQmU0RU1iY1BZdlZLNi93aUpGYUNKSWYvZDR3?=
 =?utf-8?B?MFcyZTA2RFFOa3cyOGVGcGJMNVpFWXFCcnFiM2RrRWk3dUQxcTFXbjVsREJZ?=
 =?utf-8?B?Z0duMmJHSDJNVnFrSCt2WExUN1J4ZFB2aHRNUnI3OTlPNVFPQVVINzVCdlp5?=
 =?utf-8?B?NmNsSTc5TkQwa3VPV1czenNqdDlkZ2ptcm94aXBuUFR5ODQ2Z2Nha2Y1by9Y?=
 =?utf-8?B?djBCMUlZaTE4ZmxPSEpHUFpLalg4R3Awdk5MbzVRZFZFNnQ2elI4bDJtREpv?=
 =?utf-8?B?aEQrdlFCeThlVUhPSmFtSXZYcGhYaVFoS2ZPcDI0Nk80Z0ZvYk1rdjVZMlZF?=
 =?utf-8?B?cjVtSmwyUkl3ejVnL0huVlo3aXlUSVFRSFVKV1ZIS0pWQ3dpb1ZkWTdhWllr?=
 =?utf-8?B?dkM4eVZiRldLVC9WL1lwOWw4NDFnb0pUd01vSWN6UDNPWmMxMnoycENXY0hX?=
 =?utf-8?B?LzdSYUQvdVJ4czZDWjkvRTlLTyt1SUZXQndidXhCaVh6NGtPbldFWTNGbzhk?=
 =?utf-8?B?dHljdDBIU3M0bTNKcm5RNmZZSkExaVRBVElpTkFoZmwvbE8rQlJTeGxOUzV2?=
 =?utf-8?B?aGU5aHdsaloxQnBmbnFmczhwNkROVEljanh2b2h5eGNHbU1tT090dFk5ZWQx?=
 =?utf-8?B?enJBdnY1RnhhMTk1NUNOQi95eDZJZ2orOHZaV0wxQ2lBRVdCOXQ1N2tHMlNq?=
 =?utf-8?B?Zk80REJ0d0tFVFg5bDg0d1RTdHdZVFhoOEhOa1NtcERTZ2FrMnBHSjZFeGdO?=
 =?utf-8?B?TDFUOVpnUXEwcU12ZEp6YUNSVFdDNmM2c1lQaFY2T01SKzBTVVVZV1hlV09z?=
 =?utf-8?B?cmVNZlRxMG5jWFFvTnMzdGc2cW8vRy9hY01rSFJhczJ2cjBLWXBaRUpxak9w?=
 =?utf-8?B?M3ZrMFVUajJCUnVyR21sQmppeUNVdGVhV1pzVjk5SkxvanpjZ0ZpTFpTek0y?=
 =?utf-8?B?b1haOURkS3BLZ05QNG1SWElHL0Jwb1FDYzMzdEVrcWlrN3BCSmtaTC9zckJH?=
 =?utf-8?B?TnlkcjJVMWdoem1GQVVZV09oVmJQVStnYXJMNFRYSC9WQlVuZmk4Wms5ZHM4?=
 =?utf-8?B?QVl1Tlp2V1VZZy9lLzlFS2RSdVpmQlFMZU5TQSt3MzU3cnh2TFdVQ1BxY2xw?=
 =?utf-8?B?UkJBTytWbWpWUFlKM2FLZDQ2TnEvZDdsRURvMnBSNngxRTRxSDNsKzhtVUJq?=
 =?utf-8?B?ck5ya1FwYS93K0tqR2k2UUhWSnFiMThkeWswNVhUK1lhYjBTSS9zTnM3MUh2?=
 =?utf-8?B?TEE1SWlCR0Q1YlBQUU4ybHBIZmplNlRaclhrY1pwWCt1cHR4dzFoblpBYVh1?=
 =?utf-8?B?WXF3bkFlSitVcFJndlE0UndUTThkakhUUVVHMzhCYU9xcnc4ZURMQTk0Tm91?=
 =?utf-8?B?dGRJMGtvdXFWL3NSVzlTZDZBVE0wRWw5SDduRjgyYmFvcW02MWt5Z0w3cDg4?=
 =?utf-8?B?bWsxSlJUSUl5ODlWanllbU4vQXpTek1qWlgzTTE5akt2Nk1oTTNSMGhsTXEz?=
 =?utf-8?B?SVFOVzkyeHEzQXVrazJKVWRxRW9YRzZYY2Q0WlpuZndJYVNSREp6L1d0Mkln?=
 =?utf-8?B?RWxETU95WHJncGdGOThBbDJCUnMzUlpGKzlPNndDdzB2eDB4WU5HOVlVemR0?=
 =?utf-8?B?QjY4N1I4WldVWnRURUZESHkybDdrUlhVN0xSOGpheUprOHRiNjdicXB0STJk?=
 =?utf-8?B?WEJYUlc4c1pVVnlTSnZRVUpucUl4SzRsNEhxT0t4TVNrdG1halRWRkY3cS9M?=
 =?utf-8?Q?HDLZTLy9l8GR2ArrFa9Vmc8C5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe507d2d-475c-448d-6857-08db52334841
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 15:20:41.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o277S/qqTIRJZ0U3YqGerTQEaVwqo6asS5iq7aurkFUWieC9scEGcuzu9kmkGT9gZkGsUSXqeXQ06dMHlT4gtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5290


On 11/05/2023 14:02, Michal Orzel wrote:
>  From map_dt_irq_to_domain() we are assigning a return code of
> map_irq_to_domain() to a variable without checking it for an error.
> Fix it by propagating the return code directly since this is the last
> call.
>
> Fixes: 467e5cbb2ffc ("xen: arm: consolidate mmio and irq mapping to dom0")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes in v2:
>   - split the patch so that a fix alone can be backported
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f80fdd1af206..9dee1bb8f21c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2320,7 +2320,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>   
>       res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
>   
> -    return 0;
> +    return res;
>   }
>   
>   int __init map_range_to_domain(const struct dt_device_node *dev,

