Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AFB61145F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 16:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432104.684826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQFl-0002su-6S; Fri, 28 Oct 2022 14:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432104.684826; Fri, 28 Oct 2022 14:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQFl-0002qs-2f; Fri, 28 Oct 2022 14:22:33 +0000
Received: by outflank-mailman (input) for mailman id 432104;
 Fri, 28 Oct 2022 14:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFjJ=25=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ooQFj-0002qm-9l
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 14:22:31 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a1bca5-56cb-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 16:22:29 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 14:22:23 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 14:22:23 +0000
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
X-Inumbo-ID: f3a1bca5-56cb-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGomFMOxsHPiNdRVLwAP++ZBBAeQptoHEg4py8x0T20ECIn4wq/4ujOBTwn30p8le7zntS+iaPRmmJFthJJTTCYHkdAtWYeuq+4geDKlATnhRNvsdxIz8rx6OEmqVpA8YdJ29wkJVW70Z0B7Y7mINEXa87OG5u3w290HEZGl6R1ncEihoSdLL1UyaBhVTRW71YFryDwsjahvPc5j82NtXsivOMb3KfNuemYC06CDE7IultwihTr5NgyeUVlejJ4Hh309eoix6tSBt8ko31calrczg3IsqT9SK8P9Fu75OAQMEWZA/cyWg/yjc7BXF1Kp08uIxPFnvECJ6NgnPLI+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DThRTzhvhBxTkuh04hZkGbUEAmJUzUIP+5exOn6G0+E=;
 b=NbIIsw8qVgedYYpxUHXtbU9Qd7wjW2EdyzRsIxHNz6WuulX5YYByDqo2jAlszhsofRQQ4wW+/RdKP8KhY+D13jE3I5uMhwLekxy3604L5jTHg1hYvRfc9QldQ8Ko3Qae/jCdbxrIPJF67SxAIFy1bfk4jsovkFF6inwFib08Tu+PkFl7Xp809bBTsdsE2E37v74TFp4K9gBlHV5b6Pf+uOLcKFCJzb0a1dNsgq6RFJ0OZ5z52aKoH8Ny6WtLDFzAEVIpGnJUDeIDLJt0vXesWxzeW71Xn72bAEyscKf4DgQppZl6F/P62Qny5WPRGi++WGKRZLbb/OtKm/JUXhnvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DThRTzhvhBxTkuh04hZkGbUEAmJUzUIP+5exOn6G0+E=;
 b=SVmBXKE9k6dHtxSK/nBZvBKwro3SWZtrGqEckFBu1WUUFyj/mX/K4qgiE1yEMiuHc3snPnLdICKpbs9Eg4UxygP2jbmAyVNBtyEvRMuVqaka58KzKr8nYwNX8ogApvjeg0Np29UVW7KXqwXq62rwJez//qtOrxzqwJWXzswLvOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <65168ade-6730-b90b-b927-86535b18bdcb@amd.com>
Date: Fri, 28 Oct 2022 15:22:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 07/12] Arm: GICv3: Emulate ICH_LR<n>_EL2 on AArch32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-8-ayankuma@amd.com>
 <c1290406-9ec4-97f7-efad-8279dec39123@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c1290406-9ec4-97f7-efad-8279dec39123@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ef5130-1d7f-459a-29f8-08dab8efd49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WxPoxTejQeoE+WI1SB6DoyZ9ppKm4wKcEN3Z6/xXFBp3SMaoAWSHeNj2S8DSSAPJYt5vJzCYgac1xDUZuaUug1glzQxO1FnXzabseXUHAoaVz/HyzHWwCa6EMdBijFh9g38HSNibfr5V8/SFwmGTEoxqMGrw1uQSQJEnBsMyazS2TMSqdvbXCycuDVMd+lv7uSizKDhCwpj7EmjsS255umSIRQRwSAN2isRz0VIX2b0Z4Y9XIE0WbdUy3nBC6P+fuhI4uX3AzjnngYAmT76Vd8jO2bWYUawvMe2AkbDXCotaR6ymoRozb+fUSoknU2iJwdXitpTDRJqta6DGx4hREmkuqmNfT3NAyS7coJygqUGS/7B6zMMfM8/+cb7l6MD56J8YWIiVjkeWpXxYn/MLKbV1ZzUMgPXb+sL7i30sGpGO28hMgY0/U4+2wnu5CBilvUmlW03dBTVLKvhG5b4T9axe3JNNAR7wFiHDVWfC/G7Siqagg9aJCSm8YXGOb+Cc1hdG4k2jx/f5QRE4se5GpdRePRrty3nUEGQQtKniazGfJY897WfHx1lntltVQaRU+ZaVZ9d0oUx+oVy5yvRd0NoM4tOEloCWRfd1980v513fw60MBChFFUhLIWZPOxlQvsE1uluJpKcEoJS3gU/GUPZ1i2Xq/NzSAXgTeBDe6YyuH/ptIBxlvKOIDsD9uOhmYzVmhtLidQQpzvFB2hIg2Cwy1ib9OX/nBu88e3NdShjQ5a5JeT+SSQ5lQwD4i8PUcfI1OkPh5q4QsBV3oz2z1jcF6MIqg59N+B3rYUzDXsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199015)(478600001)(8936002)(5660300002)(41300700001)(2906002)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(316002)(83380400001)(38100700002)(6666004)(53546011)(6506007)(31696002)(6512007)(26005)(2616005)(186003)(31686004)(66899015)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckk2VWQ2WFZMSG9DdjJhZS9aNjBzQm1tbURWazVvYWJQK29qc2tuSS9uUUor?=
 =?utf-8?B?RERPUlRNUlc0SVJEZjVZS1o5VGF5eEFPSitiU1c1UXI2MUFIQmRVYnRQNFB0?=
 =?utf-8?B?akpwOXNzQnlOazJaRno0QTVQQ0JUaVFxaUpjTm1pd2VUOVJJRTFsakJvb2xv?=
 =?utf-8?B?TElKdThEVlpoUDJzSWU2TXA5V3BMbWlQZFFFd1JXMTkxUnhZdEdrRTBKLzRq?=
 =?utf-8?B?RVJxTmR5NUNtUnd6Qlc0bGJLU1NCdkxINlo3dkJPb1JQcjY5V1pOWVdQQzU2?=
 =?utf-8?B?dGZ4eVd6bElqVnhlNDhvb1V2T1RzTTlXYkM3V01wdlNHTGlnNXBBZzE3SFI0?=
 =?utf-8?B?YW0xLzBsWUc4MTkwcDY0dnVUekxQRVllNkNhNFBkK1Fab3NmR2JWWmxwYzlj?=
 =?utf-8?B?THNJaVVNRk1DSHhuQkEvYU9HRDlMVzZQWGY2WE1VUFB2dFpZWUg5Ny9kdy9C?=
 =?utf-8?B?YWZQWmExd1BsQ0svd1hDTnljcUZhcHJpeHZUbEdRTnF3aFNtbFZSdlpKa2dy?=
 =?utf-8?B?UklYdjd4VmZiUWNQYXR6bm9tU2JhL1pubG83b0FvVVlQUmR1MkVzN1pOeGs2?=
 =?utf-8?B?MEk4YndhU2M3cGJQNTc2ZXlid0RCdlFCRXdhZnp0c0N3d0RFRHFTSkx6UG9D?=
 =?utf-8?B?MzY3dlE5V0hIU3V4VEVIMkJiK2JISjJheTZodkp0eGtmeHdrVnM4ZEZmM1BC?=
 =?utf-8?B?dksza0l3THpxQVBJNGJmQ3FKNDVwQ3FibHFRYU9qNmUwQW44MjFjM1lUaG5y?=
 =?utf-8?B?ZjFYL1BBTTRSa01xbldmTDlzSSttS0FQMS9FUkZkL3IzRk1ucjhET2ViTk5l?=
 =?utf-8?B?aUNzZFZjV0hBeUFpQzlVUEdycitQeXRVaVRwK1hvMVJwZmdzNnBOUU1JZ1p4?=
 =?utf-8?B?RytORGJsaENMUWJ0Vjl0dm5iQ1JRSUdJNUdQSDgreU01NlVWYTZxVE9DTUJr?=
 =?utf-8?B?MVgzdk9nYkplbGhhNWNxWnp0SXJGSmo0SVhnV2g3VzNWaWlUZFduSWlXWXBP?=
 =?utf-8?B?RWpYbnpmVkxpb0I0NFM2TVlzOE95bVFWa1N0bnArc01yNEFsZ2pzamQ4UzVu?=
 =?utf-8?B?UGIwdnZZTCtkLzlhUnFMWEFZOHdIcW8zWEttY0ZoYUt6RmMwdkkyajFzODA5?=
 =?utf-8?B?V2Nzd0VSc1VGN3JjNmYvRjhScnNyOSs3UXh3c2FKTkliWHRwNDRwNHlhT0pD?=
 =?utf-8?B?UXZuMW00Y2dUT2FSNzN6WDhFRzhqZVJyTmxrblR0Qmt6UGk0NFFqT0psb1Vz?=
 =?utf-8?B?bGVqOWk5eS8rdm5vMWVNVE81NU9Ocjk3SzM1VGhZeDhoWXBwTjhnRGZ2TFdl?=
 =?utf-8?B?T2VneFZKYnMrNlMyU25XMkZQRTgzWGRPTnRveGRSWEhuY3BuV2hMaWk3cHRw?=
 =?utf-8?B?Ykp0TUlEdEpnTFJZVG5OV0RjeVRhQXpsQWtVRHVqSnBIbHBQZlZQVHBpaVRx?=
 =?utf-8?B?RXJwTzcycmRHeWQzQWtaTCtPMWZPU2gxUjVId0wxamZLYzNsVlhFTVYzQVRL?=
 =?utf-8?B?TGp5Yk1ZOHR4aEsyN0QrWVh1NFJ3eVU3UVBhNk50OEhvaXlMQ2dJMmZRSkdk?=
 =?utf-8?B?aVkrSFA2dHRnQVF1d1VYOTI1NjllUUZGT3kzc2tibFpXSmlsUVBVbGhJeFVy?=
 =?utf-8?B?TkYvRzdHNllXd1NJVzc1YnBJSCtpYkpMb1BiWFNaVUdYYy9YTFRZRU9YQ3Bj?=
 =?utf-8?B?dmRCbnpnM3NvWk5XQStzVjBobXFpNUliNWdZdTFZQXcxRTBGV2RpUnVwckkv?=
 =?utf-8?B?VWhOcGV0dG9lU0MrQUkwZ2VXSjZWTFVUNjJCNW5nd1FtK3hUdHhPWnVtaG9z?=
 =?utf-8?B?ODFld0ZMWkxJL2orR2xidnlLTGlKTmJvR0VrMTFxcGZGL1pNMHExZmVOZ0RG?=
 =?utf-8?B?Rjh0Tmhxek1LZUt3WHQwTm16RTA1Sk96TXVCWERzVndkaUtrK1BjZFNGenBD?=
 =?utf-8?B?OFVPK3NmSnpjTEYrN1YxVXBsWS9wYzJCZDFBQkFwTU81bjE2b3Bjd0xNbThZ?=
 =?utf-8?B?ZEhONTVQUWJSODFuRk5iZzJVYTNhc0lWU2VtWEExTDRZT2Y4ZEUyYTB3VkVy?=
 =?utf-8?B?bSs0bGlnWlhKc3NPakRLMGJzc2lTSGIwb1l1SWovbHJmUE9IMW12bklhNDVs?=
 =?utf-8?Q?dtkMLJt5KiyFUK4SvLzOyOHj3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ef5130-1d7f-459a-29f8-08dab8efd49b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 14:22:23.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaEm8JvCBFZOcKYpVjEoAU3zeGvYGyuMImz4lNwfx8CxAJ5J4U2poRU89pRnY8om0f9ZqwiaF+IK6TQavEXXJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620


On 22/10/2022 12:03, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need a clarification.

>
> Title: Xen doesn't emulate ICH_LR* (we don't expose them to the 
> guest). Instead Xen will use the registers and your patch provides 
> wrappers to use access the registers on 32-bit host.
>
> On 21/10/2022 16:31, Ayan Kumar Halder wrote:
>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h 
>> b/xen/arch/arm/include/asm/arm32/sysregs.h
>> index 6841d5de43..f3b4dfbca8 100644
>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>> @@ -62,9 +62,61 @@
>>   #define READ_SYSREG(R...)       READ_SYSREG32(R)
>>   #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>>   +#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
>> +#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
>> +
>> +#define READ_SYSREG_LR(INDEX)    ((((uint64_t) \
>> + (READ_SYSREG(ICH_LRC_REG(INDEX)))) << 32) | \
>> + (READ_SYSREG(ICH_LR_REG(INDEX))))
>
> This is a bit dense to read. Also, we should use READ_CP64() when 
> dealing with arm32 only code. So how about (formatting will need to be 
> done):
>
> #define READ_SYSREG_LR(INDEX) ({   \
>     uint32_t lrc_ = READ_CP64(ICH_LRC_REG(INDEX)); \
>     uint32_t lr_ = READ_CP64(ICH_LR_REG(INDEX));   \
>                                                    \

I think this looks incorrect. These are read using 'mrc' so they should 
be READ_CP32(). They are 32 bit registers.

However, READ_SYSREG is defined as READ_CP32(), so should we use 
READ_CP32() or READ_SYSREG() ?

- Ayan

> (uint64_t)(lrc_ << 32) | lr_;
> })
>
>> +
>> +#define WRITE_SYSREG_LR(INDEX, V) WRITE_SYSREG \
>> +                                  (V&0xFFFFFFFF, ICH_LR_REG(INDEX)); \
>> +                                  WRITE_SYSREG(V>>32, 
>> ICH_LRC_REG(INDEX));
> This code is fragile. If V is a function call, then you will call it 
> twice. You want something like:
>
> do {
>   uint64_t v_ = (V);
>
>   WRITE_SYSREG(v_ & 0xFFFFFFFF, ICH_LR_REG(INDEX));
>   WRITE_SYSREG(v_ >> 32, ICH_LRC_REG(INDEX));
> } while(0);
>
> And maybe replacing the opencoding Fs with GENMASK.
>
>> +
>>   /* MVFR2 is not defined on ARMv7 */
>>   #define MVFR2_MAYBE_UNDEFINED
>>   +#define ___CP32(a,b,c,d,e)   a,b,c,d,e
>
> I am not entirely sure why you need to define __CP32() here. However, 
> co-processors registers should be defined in asm/cpregs.h rather than 
> arm32/sysregs.h.
>
>> +#define __LR0_EL2(x) ___CP32(p15,4,c12,c12,x)
>> +#define __LR8_EL2(x)              ___CP32(p15,4,c12,c13,x)
>> +
>> +#define __LRC0_EL2(x)             ___CP32(p15,4,c12,c14,x)
>> +#define __LRC8_EL2(x)             ___CP32(p15,4,c12,c15,x)
>> +
>> +#define ICH_LR0_EL2               __LR0_EL2(0)
>> +#define ICH_LR1_EL2               __LR0_EL2(1)
>> +#define ICH_LR2_EL2               __LR0_EL2(2)
>> +#define ICH_LR3_EL2               __LR0_EL2(3)
>> +#define ICH_LR4_EL2               __LR0_EL2(4)
>> +#define ICH_LR5_EL2               __LR0_EL2(5)
>> +#define ICH_LR6_EL2               __LR0_EL2(6)
>> +#define ICH_LR7_EL2               __LR0_EL2(7)
>> +#define ICH_LR8_EL2               __LR8_EL2(0)
>> +#define ICH_LR9_EL2               __LR8_EL2(1)
>> +#define ICH_LR10_EL2              __LR8_EL2(2)
>> +#define ICH_LR11_EL2              __LR8_EL2(3)
>> +#define ICH_LR12_EL2              __LR8_EL2(4)
>> +#define ICH_LR13_EL2              __LR8_EL2(5)
>> +#define ICH_LR14_EL2              __LR8_EL2(6)
>> +#define ICH_LR15_EL2              __LR8_EL2(7)
>> +
>> +#define ICH_LRC0_EL2               __LRC0_EL2(0)
>> +#define ICH_LRC1_EL2               __LRC0_EL2(1)
>> +#define ICH_LRC2_EL2               __LRC0_EL2(2)
>> +#define ICH_LRC3_EL2               __LRC0_EL2(3)
>> +#define ICH_LRC4_EL2               __LRC0_EL2(4)
>> +#define ICH_LRC5_EL2               __LRC0_EL2(5)
>> +#define ICH_LRC6_EL2               __LRC0_EL2(6)
>> +#define ICH_LRC7_EL2               __LRC0_EL2(7)
>> +#define ICH_LRC8_EL2               __LRC8_EL2(0)
>> +#define ICH_LRC9_EL2               __LRC8_EL2(1)
>> +#define ICH_LRC10_EL2              __LRC8_EL2(2)
>> +#define ICH_LRC11_EL2              __LRC8_EL2(3)
>> +#define ICH_LRC12_EL2              __LRC8_EL2(4)
>> +#define ICH_LRC13_EL2              __LRC8_EL2(5)
>> +#define ICH_LRC14_EL2              __LRC8_EL2(6)
>> +#define ICH_LRC15_EL2              __LRC8_EL2(7)
>> +
>>   #endif /* __ASSEMBLY__ */
>>     #endif /* __ASM_ARM_ARM32_SYSREGS_H */
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index 54670084c3..d45fe815f9 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -469,8 +469,11 @@
>>       asm volatile("mrs  %0, "__stringify(name) : "=r" (_r));         \
>>       _r; })
>>   -#define READ_SYSREG(name)     READ_SYSREG64(name)
>> -#define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
>> +#define READ_SYSREG(name)          READ_SYSREG64(name)
>> +#define WRITE_SYSREG(v, name)      WRITE_SYSREG64(v, name)
>
> Please don't re-indent existing macro. This is only introducing 
> unnecessary extra churn.
>
>> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
>> +#define WRITE_SYSREG_LR(index, v)  WRITE_SYSREG(v, ICH_LR_REG(index))
>> +#define READ_SYSREG_LR(index) READ_SYSREG(ICH_LR_REG(index))
>>     #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>>   diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h 
>> b/xen/arch/arm/include/asm/gic_v3_defs.h
>> index 48a1bc401e..87115f8b25 100644
>> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
>> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
>> @@ -185,9 +185,9 @@
>>   #define ICH_LR_HW_SHIFT              61
>>   #define ICH_LR_GRP_MASK              0x1
>>   #define ICH_LR_GRP_SHIFT             60
>> -#define ICH_LR_MAINTENANCE_IRQ       (1UL<<41)
>> -#define ICH_LR_GRP1                  (1UL<<60)
>> -#define ICH_LR_HW                    (1UL<<61)
>> +#define ICH_LR_MAINTENANCE_IRQ       (1ULL<<41)
>> +#define ICH_LR_GRP1                  (1ULL<<60)
>> +#define ICH_LR_HW                    (1ULL<<61)
>>     #define ICH_VTR_NRLRGS               0x3f
>>   #define ICH_VTR_PRIBITS_MASK         0x7
>
> Cheers,
>

