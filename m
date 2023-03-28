Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A76CC743
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515977.799422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBjO-0004rD-09; Tue, 28 Mar 2023 15:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515977.799422; Tue, 28 Mar 2023 15:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBjN-0004pL-Th; Tue, 28 Mar 2023 15:59:29 +0000
Received: by outflank-mailman (input) for mailman id 515977;
 Tue, 28 Mar 2023 15:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phBjL-0004p9-St
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:59:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 835173c7-cd81-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 17:59:26 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8685.eurprd04.prod.outlook.com (2603:10a6:102:21c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:59:23 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 15:59:23 +0000
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
X-Inumbo-ID: 835173c7-cd81-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIy56DHmN3Leqrwu1insYqRkjMIXGfP945O6JBqDdv5GYAU7gqGVv8XPbryc5O3aRgDaufREsBhzMECggC4YVPHxY0cTuPqNo6qpcuAzJV0rFpAWrl6LfiW1NjV/81ZP3/UfrC5IqzgZCW08zw9RmaRds+TM7ZKMzrqb3DPbDhMlQCqbVQli7Vit+WWkEL/Ea+lR/u/VO93pJcXgJR1CxUcLR0o+YrB5GN1nz7J7tAmfFzksG14cL2vPHBMhx/KFoa6DxetfoR+Anm/PtDJ6CRvdZSdWc7c+RX9L9D7/v3vIgmD0+cOKSdwf9p4RcnXjcdoeQqyDObKVn6915n5V4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htNpuA1czaFLb4WrVM1TQeHwuK5LuptGstbAvRYDhFM=;
 b=KTlvGkU7eG8c4ujvS6/uaD+Tnqt5TWUItDfbBEs9VJocooiVBo1aULS0w+TMzXEfcPS4zmwNe3cOZQzf4J52tas3uqo0UVcr4wm2dH0b0ZnwaN/AR3F4OP/kORh6XL0nVwPbp2aAQ6cMHA0K6neWaDPObLpYpKqR62vbYs6lmTdbLjsxOtiNlQmlxKUMxAZxM066AD5l2uKD988OG76ShaYZ/c/+Wd9t5eWVIYEKwTIWBTqSr0jrBERFFMqCOdsB7cUE+L16TRfv0pzX4BPwJGcPtc8A0eUNsLTMG6+9P0hVPuVga5uILl34oAM907XEHgtkhsYr1NGmFEuU+tNg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htNpuA1czaFLb4WrVM1TQeHwuK5LuptGstbAvRYDhFM=;
 b=amwshnWt//XR5hQQzqFmzdMxiixy7NEdvdl0IEHXrOSMkKDZpwBbeS7ukMqV1nZ1iPEJ9p5lUmW9onQ8ia/AuhJwYq25e/CoccO4Hk4gHv3Z1qxt3cJwGzMqdBD/vWPudAG2LZOy6kNhyzwlSNXnty8/wuFpnvDFoFUyphCE5pb3G5goVLsyCtF14l5IpXvErUbIR36lSBACgnxHsRFiUgACJGFh8jPNjAQyX7CUujiWRM7rvVX86sgjAQSjxNqWvh1JSgxMCQTA48iW+Rny7Y7y6s6ogFPf8WoVhxI/ouwG4uiJL6HEqmWl9KPBdSuPHDFw2/sKlNy94Zu/sAm/2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d664d2b4-4e31-143f-3bdc-d0b2f2daf6f3@suse.com>
Date: Tue, 28 Mar 2023 17:59:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] x86/ucode: Fold early_microcode_update_cpu() into
 early_microcode_init()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-4-andrew.cooper3@citrix.com>
 <310d2d40-223b-5cd2-97cb-d9e40441c254@suse.com>
 <1a2acd07-98ec-b23c-07aa-3ff2be825ac9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1a2acd07-98ec-b23c-07aa-3ff2be825ac9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c29314f-e7fd-454d-39dc-08db2fa56653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	24+UvDYwG7aq8Yp6Rwb1ziK6Ggwf/xTdKsqGTTlHAv3R96DkKqy28YybIKtZSUTHFBASwL83X+ZtpKGHhVzOtD/EYr5b9q18RpShQUtJfXy8GpmcJJgWLM4I8r5kYAxjFfw8THJ8CulRRgY7An0wtsJ1QGh81FPEi32BBumE/Ln09Jhna/zg+VtKGlOz5q3mN2cevjJpWb5GEFXu3n6DHIqSluNS7n+k2h2xfzxPDrMqo3Zr21TR40r/jajlykQ2vXD2CvdIos8+AszvQYCnv8z3uxnDD/MUc/5BQh4QOeHzohx4zOfD8eoTsjP2y4z2imlK/Q5liBdbx7kD7sy1XO3p4DbBTxdgNNbTDmZ9VUQVA8b+tZsEuaG07UgI45wHE6gqmCHEIyfqwwcMA5uIY3Yxl2D+O+xyVObabZpcGFDY2sd4ohbX2dvzVabzZvodjpl35cnemq9DZrAE05PwO1qDHVxTa4T9uXYk8H/AX72Kt2fz9tJg8uTK2FbzG13pnFQoHT8vUDLOJa68E13OMEXG91aLP6nnv3CdFS+NV7uVq+5lCEQcytmET2k8rvlp8kHJdkQfCJj01RHP0fEoYpapcQPgYuuSE4qIu4fv6DBIj6A7tXsyomLPu9Vr999svmACqGRnIU3cX91sSQth9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(8936002)(5660300002)(36756003)(38100700002)(41300700001)(2616005)(2906002)(83380400001)(26005)(6506007)(6512007)(316002)(54906003)(53546011)(31696002)(86362001)(478600001)(31686004)(6486002)(66556008)(66476007)(66946007)(8676002)(186003)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWtZL0tFOGdCYWFVazl5bWM2V3VFaVdWN09BSnZNdnYvUFRrUWdma2QvTVNH?=
 =?utf-8?B?SEx1dnFiNU1wNnZoaHV4MWdlYW9tSzNmN1hMeEhtMzVmM2dNQnkwRlVwYkxC?=
 =?utf-8?B?aHFGMS9DTFdXbnZBdW5SUnU0TFNLUlVteDlrc3VCZWVEaTh3YTFzK1V5SDFz?=
 =?utf-8?B?UGlISDBaRGtqYUNGdG5xdDFpanVpR0hMTkQ0Q2lzV2hzR2NNWDRmVGdiUjk2?=
 =?utf-8?B?VzFGTFJqb1loZWh6R09lbzNtdUtKengxOXZiNk5zdGl3K0RHZGZvaHJCMDkw?=
 =?utf-8?B?d0QyclpoLzZSTXFHZzU0Rm9rYmFCUUZmeCtPVWswOE5NNGpndjlxUVA5WktZ?=
 =?utf-8?B?NUdwRmFiaUZmWXltVHJNWHVNditETGlXbUFURGVDcHNqYnlqM0Y4Y1lWNDU4?=
 =?utf-8?B?a281Y2dPVW43VGhkRzltRXprK1hpbGE5dGxQNDdCSTA0YXdVeER3ekRsaitD?=
 =?utf-8?B?ckdxZEdwNnRWTU5abVB6ZVNpNzdlL2dHT3A3cFZCOE9yYVFoVEFKRHNNNUcx?=
 =?utf-8?B?cG8yWDkweHUxWjFqaDBWS2ZFWC8yekNEamJqRUZHZUVLMVNSaTk5M204Ry9X?=
 =?utf-8?B?OHY1azZ3N3BmK2FVZU90YkRPa1VtNmhuSXJtMlQrcjMvN25rSFFKTEM1UHU5?=
 =?utf-8?B?akgxcGtyZ24yZlNyb3JWb2laeXdLT1dBYlpDZlFJVXBuaCtxQUVtdG1GYzll?=
 =?utf-8?B?eHZLUk5BeEJNblBNUkZxcW5OM0VTUWhuY1ZHZUVTNXNvdVAvZ0ZQenovL2dt?=
 =?utf-8?B?NnBHcml2RXBTMTQyQTlTU044WGR2QUFvUG81dW5ZUWI1SEF2VG9RUUhrcjh0?=
 =?utf-8?B?NXlQRmRTQTlXWWUwVSt6VDdDUFlTYlhYVjd4M3dBeXNqQXRkSWFManFDbWtZ?=
 =?utf-8?B?dGhERk1BNzZOemlUa1lGeWFJTGgvQzJLdVpzQjEyRHovcWZvUlRHNEpkZ3FJ?=
 =?utf-8?B?R00yZExyR0VzZ01rclg4ZTAwTTFvTTB3dmRDR1I2MW5nQzBMTTY0ZUdhdXo5?=
 =?utf-8?B?M2duUUt5OXVUclRUUkNCNElSQmNDN1BEcEhrY01BaWVnR1VUKzVtVlVjTitt?=
 =?utf-8?B?OTdtVmJWL0xIdGpjTlpXTnoxUGlqZklSMU5mOG4ySzV0MTVCVGl1R0tVTXBR?=
 =?utf-8?B?eXA5SjJhODV6eXJBVy9PVS8xTGFpdUFpVHpPMmROY2psb0UrUDVBOUpSL0VR?=
 =?utf-8?B?eEZWK3NRVy9uc0FHQkNlWkNzOEhpdm5VOHFtVExrRnVYNzB3T0JWZWFOenZ1?=
 =?utf-8?B?dCt6RWVEVjdLQTUwN3VicnN6NjYxT1hTKzVhY25iOFptOTE2THRpZmR5VXJI?=
 =?utf-8?B?SE9kUzVtUEdtZ29CdkhTbkRCZXhlVEVENlhTUVZqWVFkbHlNWmd3bW51SkN3?=
 =?utf-8?B?KzlYTHpXb2x5TlRyMWhRMnNRcnNQazI2YmpBU09ONlAyS2szU3ZJTGlVeHcv?=
 =?utf-8?B?bFllQlRUV3hhMzhlY1dPSXZmZWpoZUlkTG9nSGpVQlJYVUx4MDgzRGVZSzVW?=
 =?utf-8?B?cUZCdWtFdG5mTnQxRnAwcElkdkhiR3Q5d1BBUzVPS1RpRkZkNFJ2TWc4Y2gv?=
 =?utf-8?B?NEdwOCtlaVVGeVhOanpDbzJ0cmlEZW5YNjBmYWdwdFBaNFUyWEtCeXpseC9G?=
 =?utf-8?B?ZVR4cEQ2YmV1cWRqMmxTQTNFbXJWRVhCYmZOWU5lc0JVc3R3OVVmTVIvSUFu?=
 =?utf-8?B?ajBvdDl5QjUyOVE3cks4aUs5QmdjYnV5WUlMNlFuY3Y1Zzk1OU85YXdXUkFs?=
 =?utf-8?B?RlRKcjg2cnloYy9qSmN1WUlFQy9pWmR3ZUdVRHd0V2oycHgrVyt5NVFiQThq?=
 =?utf-8?B?YmNNTjlKeW5OVXFSZ0cyVUdyS1VMVXI2aXF4V2NkNTZJeHc1VUtPWUNINGJm?=
 =?utf-8?B?c3RFRFk0M2dvYzJtS1laM0phcFkwenZBUXlrcjNBNlEwb0RkdmR3QzJCejZy?=
 =?utf-8?B?b0h5bnB6bit3RnQ0SnJlaWp0Y1ZqT0ZJaDdvamVHU3gvQWhDZ0p6eGFDbTgv?=
 =?utf-8?B?ZXF1YXd2YTFFOEZDNEJ3N2NXQTBxZDdyZCtlVnY5VXN2UFkwRzZnOHhMWndm?=
 =?utf-8?B?RWt4ZUJMRTFXWjFMWVVZS2dwZHFIQXEwTVFyYVBOZTAxcTFpUUVPU09lZGFD?=
 =?utf-8?Q?UP7o1lAQC0aBInnz/neS5dsS3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c29314f-e7fd-454d-39dc-08db2fa56653
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:59:23.7094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyUz1REEDtq+8yIIRsFF3H5yiR266DFdXCfmgnSOv+CxNAye5Y24ZVghT9Hq5eaI4OuLTn481b1o1vvhDWdDFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8685

On 28.03.2023 17:11, Andrew Cooper wrote:
> On 28/03/2023 3:06 pm, Jan Beulich wrote:
>> On 27.03.2023 21:41, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -868,8 +835,37 @@ int __init early_microcode_init(unsigned long *module_map,
>>>  
>>>      ucode_ops.collect_cpu_info();
>>>  
>>> -    if ( ucode_mod.mod_end || ucode_blob.size )
>>> -        rc = early_microcode_update_cpu();
>>> +    if ( ucode_blob.data )
>>> +    {
>>> +        blob = ucode_blob;
>>> +    }
>>> +    else if ( ucode_mod.mod_end )
>>> +    {
>>> +        blob.data = bootstrap_map(&ucode_mod);
>>> +        blob.size = ucode_mod.mod_end;
>>> +    }
>> I wonder whether the order of if/else-if being different between
>> microcode_init_cache() and here (also before your change) is meaningful
>> in any way. I would prefer if the checking was always done in the same
>> order, if I can talk you into re-arranging here and/or in the earlier
>> patch.
> 
> It does matter, yes (well - certainly in patch 2).  (Although I see a
> .size -> .data typo in the moved code, which I need to fix.)
> 
> However, both these chains are deleted in patch 5, so I'm going to keep
> patches 2 and 3 as close to pure code movement as I can.

Right - having seen the last patch, I'm certainly okay with this.

Jan

