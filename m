Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7D6418A1
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 21:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452772.710570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1YjC-0004Ve-Fx; Sat, 03 Dec 2022 20:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452772.710570; Sat, 03 Dec 2022 20:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1YjC-0004Rz-CZ; Sat, 03 Dec 2022 20:03:14 +0000
Received: by outflank-mailman (input) for mailman id 452772;
 Sat, 03 Dec 2022 20:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vq0y=4B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p1YjA-0004LR-Hb
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 20:03:12 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 828643bb-7345-11ed-8fd2-01056ac49cbb;
 Sat, 03 Dec 2022 21:03:11 +0100 (CET)
Received: from DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) by
 IA1PR12MB6137.namprd12.prod.outlook.com (2603:10b6:208:3eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Sat, 3 Dec
 2022 20:03:04 +0000
Received: from DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::68dd:51a6:396f:db71]) by DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::68dd:51a6:396f:db71%5]) with mapi id 15.20.5880.011; Sat, 3 Dec 2022
 20:03:04 +0000
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
X-Inumbo-ID: 828643bb-7345-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTB+PhtvhKfyohYc4GYUnlnlQyeUbviW6vhwO8mu6pDzegnbRYoPXz1dvWWX990qZtUYEjWI0D36mQKxjF4ZJO5qyBhFF/jOc22COGnajtugcEGzZ9bOu1AVyzCVIJc1KsucE94QpVHlYxj1oDPvl92FY1bFgyCNeOS1wXn28W6fEXH5B5mvguT6qpqkRlFOJ9RYQTkcZ0PsdFUlEXT4XSSnlRwKDG1e76A3f7XV0dNBwsTfqAyjJAlL+gy8pc+wysUdFcNM/JDFp5p2+aTFP1uTMCMeU+Jx7grH2fehuVFpcuLKTw7D7ZI/HHiNJC3DuFFTtvdYZH12RpwLP0wD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwdOQ0oKju64E6xjUwQ/kvK4ppCIRYGMGYNXB4BGS/I=;
 b=fzOo3ADSmK7m6wo+RLhaPAFRnxtI3emDU5K/+2v7gU1LxSrRDUPccE9q5R34mTRl0DvrJNLgeI7ntd6AyXMpT8JhMNLMlf6TP3Y7MopnrKzqkZTLF6weyKcArWwmTOTlRcT5HRbo2YIBwgqOkBkJEVdZQ7rHNECxjFosJCCHht88qdfpnM2GkstvhNhbsya1DaX8rp6AFyFwpwWywzQAXvVq7nX5MTykTDRdf4cUXq9ZnY8YCVmBRG1ZkLnH0QEK8lc/7pAbBRPWZagg3NrqRRUwhNKFGOLrqW2cvqY7RqsfamtOC0x952euZJfWvcOhacKvbqr997prDvGreP0LFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwdOQ0oKju64E6xjUwQ/kvK4ppCIRYGMGYNXB4BGS/I=;
 b=icPHqvck3bwlMwLCOYXGGMYOCh7dsy0vHShiq6gcqUPLMNAXYtVxQFpasv8GbXn2SsDzCF2xrAgXM6O2YoQw7GpdTL7JF5dQrM5lyUJBEVf9i8BveljZez4chvbOdCXfB/pMzexowKWgE4HcUmWCdXyxEapP9xJ2DfXUA9OSQuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <110c7534-0b06-9d0d-92f3-56f51a6cb022@amd.com>
Date: Sat, 3 Dec 2022 20:02:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v4 07/11] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jgrall@amazon.com, burzalodowa@gmail.com
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-8-ayan.kumar.halder@amd.com>
 <0ccfe5e6-960d-2f60-f782-e321c1ea7786@amd.com>
 <bd197b39-a558-7b88-d10d-053846cd5dab@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <bd197b39-a558-7b88-d10d-053846cd5dab@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To DM6PR12MB2618.namprd12.prod.outlook.com
 (2603:10b6:5:49::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:EE_|IA1PR12MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: a076111f-aeda-4408-58a8-08dad5696383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ptgQl0LMXuPH0E+cbsxt8ON3cM6IxtuW7RAZAUBxW1TpEyhfJT1OYL101HeGys8ZDTCVXs3SQJMB8RL+fkbqREjlM0oKT7Bzxylkb/oq0OLnrJhvCrs/k3Rj2zKxpvaFyT5Ghrb2QbCECQSS1zyj5deJuYSYgHFkuWHqg1cpqyQOHWFaZOEIyHd9arZ7yFOsBBD1dmG5QbW4cK4qiuMv6rRpxb54djJwcpNNapblEVJfRX1zbvL6fpswAhDr6UeOHdo6DjgDLXZ7neGT3Au/Kc+zCkq4q87NS87OzaTmwfkmYPTTb8pfmY7DaQBBXp8jxq/9JSl0xBMhbRbtb5PDzk/FNk8pL9HNSBAL9FVRJDrTVmMsoXzl31lFTBcJA/K9petTFgpuKb3ax6Biacvhq8yzVqIY7ADkR3yU9bD1yB9pm2/rli4R2nY94h+0iY6tgjxFHn0gDjwIVHmuqY96Slz0nCZwgwmIj8KVGwzxZxWe3uZIQD5rgazm8XwsfdW3j/TZ7344dJvRGEBtOckjVaXAfaeXmDjoiD/dN8umNL1sRDA198mceg/xcGqrzkcNKt3HOGRuDbR15lJ18c2eMtbzddSGJcerTGA+OPRYrOOL9rT4sPVzdVEvlMC/oGSNrJwuKLor9IG4P+NjYjGl3gMbs2G7S9SuKkAJ+IaLlygqPo2wOrJyxjQI5JQVeuTalJbHhjx/nHuzpUSrkWRLw7Zv2TcBMwGGFhFLs2AsUtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2618.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(31696002)(38100700002)(31686004)(2906002)(5660300002)(478600001)(8936002)(66946007)(66556008)(41300700001)(4326008)(66476007)(8676002)(83380400001)(316002)(110136005)(6486002)(36756003)(2616005)(26005)(6512007)(186003)(53546011)(6666004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkxSK2NiOHVMcXF4WGdKMGVTdk1kdjVoVEFYNThwb0JuZTIxV3N5Nm5wZmxK?=
 =?utf-8?B?U25meC9waW9ZOGJLa1JmUmpmbXFBcjMxUFEyR2R4VmtGZHpoSHJjQWxVSDIz?=
 =?utf-8?B?Y2x1MCsvTVY5K255NVlpcUJ2VlllU0l5QnVNa0hTbzlmSmkwMjZHeEFOSnI3?=
 =?utf-8?B?ditwRUgwMjE4b2l3Lzh5NitGOVRDdHVQWUxZZjFuZ3dHaGVDVHhjOUwrUUt5?=
 =?utf-8?B?ck5Hc1ZUc2dXb3R0STBrV0psSlVSM1Y3OW5oM0ZQbW9lNGNnQWt1SnRiTW1S?=
 =?utf-8?B?RHpja05jaG45NWVGbng0L0JYYWZkeTJxTnlYWTBkTkxXR25RNFNzdkIwZEx1?=
 =?utf-8?B?Q05IblZ1ci9MSTM2VmdObGgyRkJSdk5oTWtUU2IyKzhHcUVHQ2ZtY0IvMEpQ?=
 =?utf-8?B?b3VQdktUZ2E2M0ZWd2pqU2JXVmh3MkVWZ3ppSExSVXNwYjhvemNZRTE1WVhS?=
 =?utf-8?B?VWJyQlE3dEdzUjhLblRVVEhic0haZHZMUlhDRkQvMWVkKy8xRkhEb2xZYWFo?=
 =?utf-8?B?eU80MzZFOXlXUWRoOENicDhydTBvaGZ2Zy9kbURDK0RkWlR5NWVIV0EwTmVo?=
 =?utf-8?B?N3VpUllxTEg0aGZyOEowVVpxQ09ESUoxYTlnVFdISUcvcGh1RG9xZUxtN1Vs?=
 =?utf-8?B?Q1k0dXh4V0VybzdUcVlINjNoQkFmRXlZVnFxOCtMME5xUmZBblBiOUtyYzV1?=
 =?utf-8?B?K3FoOEowK3pwK09KaFNwZXJXTEJoWVNUQVdWZkkrazdQR1k1SUcvZ3ZMbEFt?=
 =?utf-8?B?Q0FIK2FWSDk3blZidWdMbUt1d1d0RGhMdnFhZ1BqaEF3WHRmYmhVWWxva1BX?=
 =?utf-8?B?NnZoclBsOGFMOVhpUlRRSHEwYUhoMjU4WEtmc25GREt4c25vTWxZSVVNeldh?=
 =?utf-8?B?TzloUy9wM1dDUTgxUlJ5YzkrazNXZlIxWktWdXZLYlc1UG54Q1M2UDU4NE1t?=
 =?utf-8?B?a1JBQmpTRkJYOFhBbStKME9QTHpCOThxM0t2NUtNUzlwOTV1SVVmZDliZDJT?=
 =?utf-8?B?M0FKeGovS0tiNThtNlVuemNoeFIrdmVHaE5ZNUJKUDU5SnYvakgzejB2VU5R?=
 =?utf-8?B?MVhvTnA5SERRcnQ0V0RmcFgrbFAwck0zTXpXRUVSMnRkWWNKczRjbjczaU1t?=
 =?utf-8?B?alN4N3ZBd05ZVUR4MVBVTVlYSlRFU1MzZ2htd0hmMFNUeW5oVGh6QWxDOGVn?=
 =?utf-8?B?VG5yaUZXeW9IbEtjWEVqOEVURERCNkRwU3p1SXpWSXIrWkozcU5ib3N5K29B?=
 =?utf-8?B?QXpJeGU3SjdHMUZZWWpaOGFFRmJRNU16aTZxRWpWZGlLYkpTTWdRVXpiaGFS?=
 =?utf-8?B?L2lPdWRoMXdTeUhpbGpNSC9HRjVRdWFXcHd3c1R6aEdLN2ZHaXQxU2puWFhT?=
 =?utf-8?B?bkovSExjcWFUN2owcmFybjFXM0ZKTDZJak5rYmx3OWdXaUJqWlhIcHlONUtx?=
 =?utf-8?B?ZGlTY2xKaW0zclQzTGR3dzVDbVlnWGxGT0E4TnZYczZUVk11TVphTW5kVHFJ?=
 =?utf-8?B?aG5oMEFTeW9OamJneUh5NWRxSkg5WWVGYWFaLzFHdjFCbDZVVktkQTY4Z21G?=
 =?utf-8?B?b1ROdVdHQ3VEcXkxNEZMZURiWE9XQ0UwMWhoWUlRMGZNMnRhSGVueVJCTm5h?=
 =?utf-8?B?MGlwczB6aG42K3JhUUlaaW1xSUxwVFVIR2dBQUlaTlNhVXVoQ3Z1bXBmYUI3?=
 =?utf-8?B?S0Q5MzAxS2VZYkF6dW1kdzcxWXhYMWI1U3J1d1BTZlFNSmMxYUFFTkVBWDNy?=
 =?utf-8?B?RjBSYWxadHVQL2lsbVEwQUFiMHlxdVRNdzFWanlVM3h2SEFBQ1VzdXpxR3h4?=
 =?utf-8?B?OCt2b3Z3dDRGUGVWdjlEMGtSTzJNMTNEbXhxNVBFWVhTUUV0VUFOZmh3QzRU?=
 =?utf-8?B?R3VWcFFqNDRzSFlUZmtkUXF5RFB0WXljOHhnQXd4MjBJTGlzNmJDclFaSHN1?=
 =?utf-8?B?bzdNSG83eTBvMC9hcE1QbW10RjVKNlhIdXRRakRnNGhNbmtGQUFBVmFON09n?=
 =?utf-8?B?Z2NpbVBFV2NjUUVtWU93MzJQRG9iR2JIcG5laTBYYmRwUlViNGs4cmg4ZlJR?=
 =?utf-8?B?UHE3MTc3a2Z2bkR2NVZhMzgrWDIxNk8vdUhaVVdmVkNYQUFHOUtpYUNSMEVB?=
 =?utf-8?Q?UInyXUZbIp7ZY6k2sdR0Aw11a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a076111f-aeda-4408-58a8-08dad5696383
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2618.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2022 20:03:04.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9C9DAWxeXkHXspQNm7DvBFI1sneIaYxYpYJghAFg0UQjj84zxXz8CYnLULTQp7wKJULcd3hptseF3BAQPCG8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6137


On 03/12/2022 18:35, Julien Grall wrote:
> Hi,

Hi Julien,

>
> On 29/11/2022 14:33, Michal Orzel wrote:
>>> @@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu 
>>> *v)
>>>       if ( v == current )
>>>       {
>>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>>> -            printk("   HW_LR[%d]=%lx\n", i, gicv3_ich_read_lr(i));
>>> +            printk("   HW_LR[%d]=%" PRIx64 "\n", i, 
>>> gicv3_ich_read_lr(i));
>> 1. We do not usually add spaces between " and PRIx.
>
> I don't have a strong preference on this one.
ok, I will then keep it as it is.
>
>>
>>>       }
>>>       else
>>>       {
>>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>>> -            printk("   VCPU_LR[%d]=%lx\n", i, v->arch.gic.v3.lr[i]);
>>> +            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, 
>>> v->arch.gic.v3.lr[i]);
>>>       }
>>>   }
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h 
>>> b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> index 6841d5de43..22871999af 100644
>>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> @@ -62,6 +62,25 @@
>>>   #define READ_SYSREG(R...)       READ_SYSREG32(R)
>>>   #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>>>
>>> +/* Wrappers for accessing interrupt controller list registers. */
>>> +#define ICH_LR_REG(index)       ICH_LR ## index ## _EL2
>>> +#define ICH_LRC_REG(index)      ICH_LRC ## index ## _EL2
>>> +
>>> +#define READ_SYSREG_LR(index) ({                            \
>>> +    uint64_t _val;                                          \
>>> +    uint32_t _lrc = READ_CP32(ICH_LRC_REG(index));          \
>>> +    uint32_t _lr = READ_CP32(ICH_LR_REG(index));            \
>>> +                                                            \
>>> +    _val = ((uint64_t) _lrc << 32) | _lr;                   \
>>> +    _val;                                                   \
>>> +})
>>> +
>>> +#define WRITE_SYSREG_LR(v, index) ({                        \
>>> +    uint64_t _val = (v);                                    \
>>> +    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(index));   \
>>> +    WRITE_CP32(_val >> 32, ICH_LRC_REG(index));             \
>>> +})
>>> +
>>>   /* MVFR2 is not defined on ARMv7 */
>>>   #define MVFR2_MAYBE_UNDEFINED
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>>> index 54670084c3..4638999514 100644
>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>> @@ -472,6 +472,11 @@
>>>   #define READ_SYSREG(name)     READ_SYSREG64(name)
>>>   #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
>>>
>>> +/* Wrappers for accessing interrupt controller list registers. */
>>> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
>>> +#define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
>>> +#define READ_SYSREG_LR(index) READ_SYSREG(ICH_LR_REG(index))
>>> +
>>>   #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>>>
>>>   /*
>>> diff --git a/xen/arch/arm/include/asm/cpregs.h 
>>> b/xen/arch/arm/include/asm/cpregs.h
>>> index 6daf2b1a30..b85e811f51 100644
>>> --- a/xen/arch/arm/include/asm/cpregs.h
>>> +++ b/xen/arch/arm/include/asm/cpregs.h
>>> @@ -8,6 +8,8 @@
>>>    * support 32-bit guests.
>>>    */
>>>
>>> +#define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, 
>>> crm, opc2
>> 2. As you are using ___CP32 much later in this file, it could be 
>> moved...
>
> __CP32() is already defined in arm32/sysregs.h which includes 
> cpregs.h. We should not define __CP32() twice and the only reason the 
> compiler doesn't complain is because the definition is the same

The definition is different :-

In xen/arch/arm/include/asm/arm32/sysregs.h

  "#define __CP32(r, coproc, opc1, crn, crm, opc2) coproc, opc1, r, crn, 
crm, opc2"   (Note:- it takes 6 arguments)

And what I have defined in  xen/arch/arm/include/asm/cpregs.h:-

#define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, 
opc2 (It takes 5 arguments, also note it has 3 underscores before CP32).

>
> So one of the two needs to be dropped. Also, I think __CP32(), 
> __CP64(), CP32() and CP64() should be defined together because they 
> are all related.
>
> However...
>
>>> +
>>>   #define __HSR_CPREG_c0  0
>>>   #define __HSR_CPREG_c1  1
>>>   #define __HSR_CPREG_c2  2
>>> @@ -259,6 +261,48 @@
>>>   #define VBAR            p15,0,c12,c0,0  /* Vector Base Address 
>>> Register */
>>>   #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base 
>>> Address Register */
>>
>> ...here, before first use. The remark I gave in v3 was that the 
>> definition should occur before use,
>> but it does not mean placing the macro at the top of the file.
>>
>>>
>>> +/* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
>>> +#define __LR0(x)        ___CP32(p15, 4, c12, c12, x)
>>> +#define __LR8(x)        ___CP32(p15, 4, c12, c13, x)
>
> ... I don't understand why you need to use __CP32 here and everywhere 
> else in this header. In fact I have replaced in my tree all the 
> __CP32(foo) with foo and it still compiles.
I think you mean ___CP32 here (3 underscores).
>
> So can you explain why they are necessary?

Actually, they are not necessary. I will remove ___CP32 definition in 
the v5 patch.

Sorry, I was blindly influenced by the definition of __CP32. :( But, 
there it was needed.

Would you also review 8/11, 9/11, 10/11 and 10/11 before I re-spin a new 
series ? They have been reviewed by Michal (with some minor comments 
which I can address in v5).

- Ayan

>
> Cheers,
>

