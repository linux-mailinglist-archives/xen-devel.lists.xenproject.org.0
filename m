Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4365BD11
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 10:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470503.730024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCdUO-0004ko-WD; Tue, 03 Jan 2023 09:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470503.730024; Tue, 03 Jan 2023 09:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCdUO-0004if-Sd; Tue, 03 Jan 2023 09:21:44 +0000
Received: by outflank-mailman (input) for mailman id 470503;
 Tue, 03 Jan 2023 09:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMDV=5A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pCdUN-0004iZ-Cx
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 09:21:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07aebe6f-8b48-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 10:21:41 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 09:21:38 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 09:21:38 +0000
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
X-Inumbo-ID: 07aebe6f-8b48-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L57P4pEsXqa97kttUkByOOOjc/CDl82noJeBFXsgziCBWwbh9BOXZduzWcgBZ+xjMzVSfsU6GWD3p1od5MiW6AmrleEkd3b4SI9y8s2rJCLb/FPVjMs6aJnpEoqnz9B0Y9NSJdJuaThDiQB6pNRdtN8fSgZCyNiprBK4rxhLYJF/YEIrxbky4U0Yx7xHYAKli7YjFw/K/wMDAvcshizyKw5DvuRKC4ndDzuKNEfR7AFPI5zuQtwTKCmtXRZD7RXroWDeXxSYxSTj/olS4E4SrP3Wm0ahBRodY78uQ4KaB9rXURY7AmLbtN18XX2ihSrc9bEkjTUp4ZagraymAf+qJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qkI29jLQQRBYRidEwFXmAcmunYaTX4OpV8a84XMPHA=;
 b=BqqAfsyEMXTP/CABtrHwV5l0aYPGaBDwebePedHap8DFQHHtm+TKh5xJ6sfSKpHbDQ/TfxAIPmBZy4645Eeur0OPb0E87eHSF5s1HCZukb4ndm2OA1TzaEE0VMcC/mF3nPnbgniz40OVtQZUzmdcl7m1eH8BtSKJgiZt64zOPDnInFS33akbTp+Bj7oTcxpYn7wLUeNG06ZbKqV2n4cCSqtiMMLkMGaIObpKpo8vr6UirX7YGUn/T+C9GbRFUyrTZej/3JqnMGIP+7PVOcacPlWfJJH2sZ8SOA8TvFUCzO9bvLZZZBwM8h5OvFTYXyhzg55cvMU8Sdci7PcuR1mGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qkI29jLQQRBYRidEwFXmAcmunYaTX4OpV8a84XMPHA=;
 b=Q2WrKf98MKoFUNBXEDLn4CfYpbVfduh51k6u1T4MY2mez+vd5MpknQ4xfSdmtUR/qdg2/Y9jJSmv/SzpSPLhGM4b9ZSvPz6+csq9EenDN+mzPcFhxviNmQ7jZDA6BsqaCANMJEws7etOKqR7zV3DybHkJN9fkdZVEWZ6GoNvctA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2ddcaf95-03f5-81fb-3091-316b99201a1c@amd.com>
Date: Tue, 3 Jan 2023 09:21:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in construct_domU
To: xen-devel@lists.xenproject.org
References: <20230102144904.17619-1-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230102144904.17619-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN0PR12MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a872c1d-6783-4b2b-95c8-08daed6bea8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nIfBgkVcm5u9+UfjzBEvvfjZ6Pjkz57arRg7sJz2j2QdjO6FmI/RHkDcwIaIMZ7IGgxHLn/GyXFQu+oif42H7G3gMCA2Qi60dJ9QbmflfWOnB3PzuL5+Ua0McJNTaERiEH3t+yWApe/CBYaEDi0ZNsnkLcFlTD7sOV/TTym6+Kq6UvIijNxGpUsiSmPpAMXyBuYV0ah18Z7DlfUUMXGQNLc9gjbhQCDGSCHC8NOdZMH8USLiH1DKw9WXTAJ15CVNZy1rjaGtNhOZ8ATiBqCOXlD0MGjnVcA2mOVPHTsBQ5UIHrmJCqh291Fr5oMHTZNNmeUMgc56SwDvz/Chv1V/tXg8ZypK3w10xNLAnTgfoos2mXVNqt6ewt9EcdkoJgxRxw6G1U0c8T0b3AulWezaf5v2bz6tfg3zqEcLy5vm+zowcteacUKpGeVGuaDLN1/k5vfYp6SSYfjNylXmQeAFvS9a/e/pXg0FOdLbjSpdZENKFjddHxJGreif3ukoWPckckFdwRBRYTH1zsZQRGxHFS89sZc63OOX5u2DVN+L09aXPWh/KDZHKUziumWCvclpPW0JLAJcJHdrGTtlobq8+SlLEGtDmjmKCkPeBk3DAzbt8pFfPnA6l78HkIT8e3mhk+BXqe0Oi0QVDqHgcQ1ODmG3YW1KzYUNZzkbJ1ncxkXIjqlZt9N7h+t2vKsAPNe3Ra+CbkCED9VaznxEoxPqBeISKRGCI3QFym6308rOj0HV7mKr5tWaqRsZdjtNyrZO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(38100700002)(2906002)(8936002)(5660300002)(41300700001)(83380400001)(31696002)(66476007)(66946007)(6486002)(6916009)(31686004)(66556008)(6666004)(53546011)(478600001)(6506007)(8676002)(2616005)(186003)(6512007)(316002)(26005)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWdTTStqZ2RvZ1ZEVUZVYjM2UHNIUnU2aklIQ0Z1YVhXTjF2MXJlanRQMzkr?=
 =?utf-8?B?eTB5QjZCTjZCRmIwc2xWM0Y1L3lIWjZ6SUR5M3p2eWdvZUVtMmduY01sMG53?=
 =?utf-8?B?QSs3S2puUFZBQTNFVzVoekFMTVpDTUJYVzR0ZFk1SGZLc0MwTU1STVdFcThQ?=
 =?utf-8?B?UTN4NWpYVE16RkpKUVczRlJIdHhySG9wUiszYmVrZGN3TVhzYjZmekJIV2Zo?=
 =?utf-8?B?MDZmcGdLQ3MvMWpKRHZtTUcwWkhWU1JuazJxVmJhc2srME4rTFI3eEc5UFVv?=
 =?utf-8?B?MC9oczBOVGZIcTdnaC9Nd3ViTFZxeXBjaWR3WTI1amJRVlVnZ2Jsb25ZZkF6?=
 =?utf-8?B?dVB6dlhkS1Rkd25Lb0d4TEFUZnpIczcvUVp3Q0hDaGFabXo0K3J6cFZRdE15?=
 =?utf-8?B?M2YyWUlhYUJrWk82ZkNkQU5kay9CVkcybEN0eGJuK24yeXFjclRzSWJaeWlR?=
 =?utf-8?B?RitZbE56Mk9leHBrOFpPdkhoVU05UGhxQjRJNi8rVzYyanovYXVIb2t3R2Js?=
 =?utf-8?B?VUtqOWZ4R1dSbC9hTStSSmtEbjdOaVlEQVpjZUZDSEtSWXAxMVh5aFlvVzlD?=
 =?utf-8?B?NWUyTzE2eHBMaDhZVC81Rm9ES29pV21sWThhb3U5dUNXVXlDYkdnMFIwZHhr?=
 =?utf-8?B?TVUwWjRBeWt0YnVOZC9sekpQR2FZWjEvQzNtSnNXaE9qM040ZmFSSXRCTllF?=
 =?utf-8?B?VE1SZis4NDZIMmNMMWFzV3VNQUN6TkhjR3p5ZFgvUXI0NUpUblZ1R0IwN0RX?=
 =?utf-8?B?RVV6LzFYTDIzZHZGbEtEbW41R1hJVmFPK1p3QUpIOFFKdTI3OXk0Z2N3QmJx?=
 =?utf-8?B?MXhsd0d3TmtPendrMTFlNW9yUmFkVmFmZWJ4dm9FZ01ma0M1amVsejRJTzEy?=
 =?utf-8?B?VlQyS0NEajdCZUhJei96dVlUNHNsZ0JHNXd1eGlrN3dZT3dnUFlORk1RYkZ4?=
 =?utf-8?B?MTFwNWpzT011dUxSdmUxOGYvc29DVlludk1DVU9icERlNHBuUnJoazE3dWZk?=
 =?utf-8?B?azJjR1JNOGxaMVRUdGM5V1FRakVQMGkrdHh4cUl2WkFadk5yK0VVcTRnYWxP?=
 =?utf-8?B?YWdZRi8wdFk1U0J1Y0dDN0VHdGRHQ0p2dVowZGdzdGZ1bVR3c1lvWVZza2Rv?=
 =?utf-8?B?V0VnZHcycWhOSWdKcUF0Q0NISDNlNTV2c29VaHI3Y2RrRTFlN2h5RXo0WEJ4?=
 =?utf-8?B?eWFjbTNLVk50NkFUeDZjQW5Ya2xTRW1sMisrQnp0WXNYMUtiOFE5RHhPaWRO?=
 =?utf-8?B?WS8wUzFPbDVDR3R1UVZqcm1PdERYMkduQWxJMU85VkQ3T2xXdXhxd3VDWW1o?=
 =?utf-8?B?K1dESXFNTWt5bVhYTzRzRVNDSDJjQlUzdS9TY2hKMk9STjRGaERQNDdqVCtp?=
 =?utf-8?B?SWhMbjBmUmJieDBxalQ4eWdGN01yL0o0Wkd6bkFYSHhESFI0ODcrUkV4MlhE?=
 =?utf-8?B?ODZDc3pUek5HM0RQRXRuWHN5LzFUTDNGalQ0KzlYRzRwZUpuMkZQUjQyamEr?=
 =?utf-8?B?dHU4Y1RJaDIwZFN4NE93V3E3ZzgyOG9mMDJ3dXlHNUNhbUUwL245WHl1NnNr?=
 =?utf-8?B?dVBvTHlCUk1nWWRqMUI2VkpZWmVNWDk3eEtVR2xBQ1NjL1YyMnowdi9vRlc5?=
 =?utf-8?B?MXJVQTc0U1gyVHlZWjhHRVdIY0FNVjJMTDEvZk1ETGFBdDlBRDhCeGE4bzUx?=
 =?utf-8?B?Zk84WmM4ZWg1bFpJNkJOcTFycktlRHNUVnBrdUN3cmVORUJjVUV6S2liamhx?=
 =?utf-8?B?ZWtrUE5FdUd0clZYZXdadFVwUnVNb3IrUXVxZlRnNk05N0pCa0VOeDJVOXlF?=
 =?utf-8?B?Wk9HTUFubEs2SmE2Q2IwYTdKRDBXUGNQaDE1bmFMdEpVejhqVmNVQXBuQ2pG?=
 =?utf-8?B?ZEk5bzFFd1J1R3ZIeXpMcHg3Wk1TSmJSSml3WGZxczF6eVQzd1A4b2VFUWpM?=
 =?utf-8?B?TWtLQ3RmRFJ5MlVyRTZTZ1FtUURhM1BDZ2NBaURXQk9tRkh5Y21xcDFWbFk4?=
 =?utf-8?B?NmpyMW1zQm9vNG1adytwVzR3cHNzanZRbmVDQnd4Wk4xb3VlWi81dkQxRGd3?=
 =?utf-8?B?UlJCamQ4MUc3czhSc1V5dElvV1VydHBHQks4WW9yc0JSWVI0a2RzRUtOa2FG?=
 =?utf-8?Q?bsQmZNpVQ7J9BOZNa1pLn968b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a872c1d-6783-4b2b-95c8-08daed6bea8d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 09:21:38.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7rTaYPMSVNb0g39rC0awRsPNMP4ookeqzoXF71+YIIV3/bySEy3HXxRRUoNBLTOqjSNLGKUPT6NmY0aqfFC4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6150

Hi Michal,

On 02/01/2023 14:49, Michal Orzel wrote:
> Printing domain's memory size in hex without even prepending it
> with 0x is not very useful and can be misleading. Switch to decimal
> notation.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 829cea8de84f..7e204372368c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
>       if ( rc != 0 )
>           return rc;
>   
> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", d->max_vcpus, mem);

I will prefer it to be printed in hex format with 0x prefixed. The 
reason being the mem is obtained from device-tree domU's 'memory' prop 
where the values are in hex.

It will help the user to debug easily without requiring the the person 
to manually calculate the hex equivalent and then trying to correlate it 
with what is written in dts.

- Ayan

>   
>       kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>   

