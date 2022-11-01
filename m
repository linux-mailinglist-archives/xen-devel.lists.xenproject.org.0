Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB1614818
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 12:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433425.686389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opozm-00032r-V9; Tue, 01 Nov 2022 10:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433425.686389; Tue, 01 Nov 2022 10:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opozm-00030a-SD; Tue, 01 Nov 2022 10:59:50 +0000
Received: by outflank-mailman (input) for mailman id 433425;
 Tue, 01 Nov 2022 10:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5zcP=3B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opozl-00030U-7i
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 10:59:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b981083-59d4-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 11:59:46 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM8PR12MB5493.namprd12.prod.outlook.com (2603:10b6:8:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 10:59:42 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 10:59:42 +0000
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
X-Inumbo-ID: 4b981083-59d4-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNKTsCdZpfo5JK1kI1PwOlBwdMdzUXS5tcRexGMQ47v6EWL8HCIejc/fHhO6dOmrEbzz7NcIx2LNY/JzuOWNOgGZaXsa6mmT7DteVJbZ8WjL525e+XmlUOTs6T8m2EU/zvaZovXV3c7yS+yqeykShlOJgDTnWPd5gOpUuCABK5BiZPPmRaSDMHdKC1UW67iAlN2AIdn0P9IRnQPZ/KcPQVjnorbnCLZZus9C86YdC6AQVCaPma+DXKA8jxauzrbBGZGVzvBu/EQMERtAZHs5TDiiuMdSMNpWfVKnpgma9xJCvArlruMgi3uVAfhomvewjXGupGtUzhi2ZF5dShHgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92MM6Y3qeU8ZLpoKH5/bRJXDBpmw4g92wlw3A2KNwPk=;
 b=EOxyDz4fiwch+mYXojzjBHnva6kFM9IN2xt/pweTiaYEtd2NLtDS6xxgpvfXRE+aWFiM9jNcSLyn5UKD9Ee5BHHbBxfCtEFV+KsXrLvJVDxu55FlvFnuO3xyA0qPHwi2wL4HA2CyA/Iy5/40YQJkRnJlwTgzjiPV7KDN7lohM42w+adisiyLom3B2jBoVocsOSc4FD0niAgxPNqQHNj4QQm8h/bw9hxdZpDGDJ7eBsHcgdUMXoDmpWh1TPst1KwdkIy/bpKwYy0QWZpk3VYsBfB9uIoVyuKAKnAABSNmqbIUB/eNU1+gQBwE5RqOguOh+6IcEIRAVUJGqoTecTJ8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92MM6Y3qeU8ZLpoKH5/bRJXDBpmw4g92wlw3A2KNwPk=;
 b=kdrQy7kVKb/bj5vVc52xsNZyUrzMip1ousvQMGfxjy/LXz4rSXYOZJFURT41yv0Bcv2/wUqksAjoz0KOZQkJxTU/LU82YzAk81RrZEzQBD9kEKy/mL4ShGKvLu77btxMtASCX0LIaSkqquzH6o7TiRJfIVHQEOtmVsZd9YweyG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5b5df2ee-b1b4-bfd8-b6bf-6bf5cb92f557@amd.com>
Date: Tue, 1 Nov 2022 10:59:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
To: Julien Grall <julien@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-12-ayankuma@amd.com>
 <956195e5-0409-1da0-f0db-a0192061d29d@gmail.com>
 <c2540768-93d7-5023-6203-3885b78d33a0@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c2540768-93d7-5023-6203-3885b78d33a0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0357.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM8PR12MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: aa769f0b-4fc4-446e-aa8c-08dabbf82de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zeSHAq8ODvqLwmuP4N0r7srRlA0MUoqvyu4/uHdvddxZ/Tvp8ANeaH7OlHxjamMiZRoLqLz6zHOxTUL6hgFLweqGvlyRMrBToj/JP65IMpqJi2f289SzEMuSn0/ms5Tl54KgkF5qfvQ38jOYe7taCAj5ttMhiV1H2IfQtWJXdDPQxHSXvYhyMSL/ZAcsL46YlzACl3LajxumHyPVX33Mi+kBgzC49v93PFJn2xervh6Ok6umW+YZEoYCkb+gfXdb1BeUg/dKIhBEwTlSKrp98uX2E1pzhxIqw4Sl+D7VWLGji8hF/LyhSOlpy8XrJ4ycHSnrb/9DTqf4h8556njwOsmg0SIv9qAN0rNp0zP34qUafKSlzfaIQ+fTaTr/47koDR4YRdGUcr3Lz8H6/Ydc9LV+L7Jk4WmtE42abr2ALWG/ERuSMI0PkDGZi+lWTqG3/eb+jexQd43PYOcSxym9JpJpExkYanRnhBZ3ZexmKOdkRyumUzbiqA3QHaa+qC+0ugkGkoCR847Npm+i935VU2s7I81ll4ZrMN+SrQV0UAUFyBOyKouC7HFHg/G26qz4deYIXKWtiZEozkVA8GWD+QPAOn+oBrqxDyF8PE9EpXty55snEQIHIsPx9DYdNz/C42Vu0gMbxq5HCU+tngitxjzeLwubVK95PqqLQ3R468c5BCCbE7++kjXzR1u58cYXnXjFF6QFR0llA5ab2ErfMGTtVlgfl6g0SxlPBPFE45gAF+RoTzvA6PzalWp5JjHBXALHXUAlYw+0v/7GqGtIxy7xAz7ebQrrVnXkDkcQLv5YPMZk4MvqR4GuudEhnzI/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199015)(5660300002)(8936002)(36756003)(6512007)(186003)(38100700002)(2906002)(31696002)(2616005)(83380400001)(41300700001)(31686004)(6486002)(478600001)(966005)(6666004)(53546011)(8676002)(26005)(110136005)(4326008)(66556008)(66476007)(316002)(66946007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVk4SGZRVTQvb0VJeUtCN1FjRS91em5GVUxNejkyWUJzNk00YlBTenNtWG93?=
 =?utf-8?B?eTBxWjQ3bzJyKytiWkE1NmVzbWovYkZTcWY2a1g3Y01Mb1NXTk1PQzFCcUhJ?=
 =?utf-8?B?bENQeFhZc3VSYXlzRnJrNy9yYjdoWTljWXcxL3lkbkx5UnhFTUN5b0FCN1ha?=
 =?utf-8?B?R0F4YXFJWWpOVWR6ZnRJTUxpWndWcmFhUDZTcmRtUFVJbXhaOVJNSzN3UGlB?=
 =?utf-8?B?VTdVR0RHYUJieHE5dytXYXR2SkZUWWR0cmR5ZlRzdURkVG1QY0FVZHNOUnZs?=
 =?utf-8?B?OWs2cmRLVUxRZ2w0RUdiOVhjTWI5NDBLM21JTnlIZ2Jac2gzam1FVTc0TWIw?=
 =?utf-8?B?aDBsR2JZWmVrTDNhSktRaDNaUzdrT3AwQ2hRK1ExT00ydlk3Y0pDNjdub29i?=
 =?utf-8?B?VW85OGtHcWY4cGwxa0U3enhRa084QjdtRnNlVVhjaXFTZmJKZWZxaEpsRGg0?=
 =?utf-8?B?NEU5UVhiVzcvQ0dqZDQ3c21mdm1KRkVRSmQ0dzIwcDBhU2NzY2dHYnFFZ2hI?=
 =?utf-8?B?RlhIN3U4ZDAzdnFsSytyNGlLTFllNHFhSEsyR0Z0TXpBNFZjeFlSUmxadHU4?=
 =?utf-8?B?RHUvVlJtRVhyMlJZWXZsYzZBSkRpSGVncjFDOXc5OU80b1NITjViSlpxQ0tC?=
 =?utf-8?B?dXc3V2xRbTJ0UDhUUFpVaFFlVDNiS25FM2dXTkRVZFNEaFpTNnB3K0pES2hk?=
 =?utf-8?B?L0l3RTBTb21FVlIwOHU5a0xFVlhueXNCT2d0ZzVKMmJCZnQ5VEN0Ry9NU3Ri?=
 =?utf-8?B?Y0RIa2Y2cVFPbFkxWndMVlhhd21wZitCVDlrUzFEdGRqd1EyTWJneU43NFI0?=
 =?utf-8?B?cTNhUzFnbm1RV3lyNUoveWh3WFFKbzh3ZDk2MkRRZlZ1TzVJTW8rb3I2OXFx?=
 =?utf-8?B?TG5wbVBOT3lCc1dGa3FmZjlyMnBGTGx1NHp4OEtvVFRTeTUrZFM3WTFBbk9Q?=
 =?utf-8?B?ZzQyOW9PNGlXdU03UVJkUjA4UHAwL3BTYWp0bWVMNTdPLzhqNVJmOFpiMVZV?=
 =?utf-8?B?ZmNEYlpYVmR5bkpVWHJOL0RXeGtBV1NRbUpyOGNDelQ1RlRjSkd6bWc0VTkv?=
 =?utf-8?B?Umd5NHI2OHhzK1BqY3QvRVRPeUpENjhpSHdESThlMnZRWkhvb01kc09ReGsw?=
 =?utf-8?B?T3JyVzdaRTJVTTBNVGMzSVRKdFR6NXo2L2FiMU90WUhxSm9SRXpMQXA2bFVR?=
 =?utf-8?B?M1IwR2hBc0xxczlyb2dEbzJ1WUVoMUFabkF2VlQ0aXdyekg4alNUUW1Mci9W?=
 =?utf-8?B?V0J3V3JwQmJzVUVGOXZVSHVNblhBSzl4RStHVmhkbmMyaGtTRG4rajJPQVNo?=
 =?utf-8?B?ZlU4d21iL0xwZ0JvN1poQXczWVpnTG01ci9SSjhGM09KZXpOZmp3c2tFYWVR?=
 =?utf-8?B?R0VvSWdWcXYxZWtvSkQ2ZERFd3RYSW1ZclpsbWJTK1NvcWZzZkVQZjR2eUxN?=
 =?utf-8?B?NDVmcTZPYjAzMHhLcTc5a0Q2djhSYisxbzh0VG1NVGZ6ZDRWZU1EZWpUMlRu?=
 =?utf-8?B?QUQ3djBkOTU3RmtxcUovV2t4QlR0TmVRenhyVXd4QU9vQW14bUNCQ3NEK2M5?=
 =?utf-8?B?QVhOeEtZejF4cHB4aXhhd25lUit3WlBGZkFsVTFjSUp2QS9nQmpLSzUxRUxw?=
 =?utf-8?B?STMyRjBRd2owVzA2RWQvZmViQzZWZC9RcXhTcHFPWHpxQnhtK2NGNEFBVUVL?=
 =?utf-8?B?SzJ5MGNNMmxYNUpMcENwLzREK0lGYWEzNWRScGNoM0F5Z0lOSUxmdy9zSmsy?=
 =?utf-8?B?UHFjbVVnTWo4cGxFOGdZYjJYRmF2TzQ5ZVl1SC9lYmpMVUZ1aFJ6cnFFOGxm?=
 =?utf-8?B?MythTlREMVdBY3M4YjVwNk5tenczbGJUTnN6d0RQanhSelBmWjhSdWo1Wmkw?=
 =?utf-8?B?dGdPUXZvcENtVElZRzhZWldodEVXWGpWY2F4ZXNmSWp6aG9EQVlSSmZ4SzNV?=
 =?utf-8?B?WGJMRGJWSU5GMjI5T1NZQTZ4eTNJaURwb0VKNWs4RlZuUFN5cEhiT0dndVRE?=
 =?utf-8?B?a2ZKdGx4M3RXMTZtZFF3SlpWb1pwc0JiWHNCTGMzcmFEVTQvRjJDSExLYWl0?=
 =?utf-8?B?a3hTRnhWTjRLbi9lZXRhckV5RjJMSHNnSnVqRG5vZzJZNUt2M0FOdVUwdWxi?=
 =?utf-8?Q?s8eu0K/6kXHFshjYCQnQ2YQwA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa769f0b-4fc4-446e-aa8c-08dabbf82de7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 10:59:42.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9l1ZZrMG2AO2gblhv0jksJ5py70ziGGq38huOjkunxErzYySnXrJHOyrr1rxr0NW8FUUYZ4KivrE8Tp49Dz1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5493


On 01/11/2022 09:50, Julien Grall wrote:
> Hi,

Hi Xenia, Julien,

I have few clarifications.

>
> On 01/11/2022 07:08, Xenia Ragiadakou wrote:
>> On 10/31/22 17:13, Ayan Kumar Halder wrote:
>>> Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
>>> This uses ldrd/strd instructions.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>>
>>> Changes from :-
>>> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
>>> 2. No need to use le64_to_cpu() as the returned byte order is 
>>> already in cpu
>>> endianess.
>>>
>>>   xen/arch/arm/include/asm/arm32/io.h | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm32/io.h 
>>> b/xen/arch/arm/include/asm/arm32/io.h
>>> index 73a879e9fb..d9d19ad764 100644
>>> --- a/xen/arch/arm/include/asm/arm32/io.h
>>> +++ b/xen/arch/arm/include/asm/arm32/io.h
>>> @@ -72,6 +72,22 @@ static inline u32 __raw_readl(const volatile void 
>>> __iomem *addr)
>>>           return val;
>>>   }
>>> +static inline u64 __raw_readq(const volatile void __iomem *addr)
Rename this to __raw_readq_nonatomic()
>>> +{
>>> +        u64 val;
>>> +        asm volatile("ldrd %Q1, %R1, %0"
>>> +                     : "+Qo" (*(volatile u64 __force *)addr),
>>> +                       "=r" (val));
>>> +        return val;
>>> +}
>>> +
>>> +static inline void __raw_writeq(u64 val, const volatile void 
>>> __iomem *addr)
Rename to __raw_writeq_nonatomic()
>>> +{
>>> +    asm volatile("strd %Q1, %R1, %0"
>>> +                 : "+Q" (*(volatile u64 __force *)addr)
>>> +                 : "r" (val));
>>> +}
>>> +
>>>   #define __iormb()               rmb()
>>>   #define __iowmb()               wmb()
>>> @@ -80,17 +96,22 @@ static inline u32 __raw_readl(const volatile 
>>> void __iomem *addr)
>>>                                           __raw_readw(c)); __r; })
>>>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>>>                                           __raw_readl(c)); __r; })
>>> +#define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
>>> +                                        __raw_readq(c)); __r; })
>>>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>>>   #define writew_relaxed(v,c)     __raw_writew((__force u16) 
>>> cpu_to_le16(v),c)
>>>   #define writel_relaxed(v,c)     __raw_writel((__force u32) 
>>> cpu_to_le32(v),c)
>>> +#define writeq_relaxed(v,c)     __raw_writeq((__force u64) 
>>> cpu_to_le64(v),c)
>>>   #define readb(c)                ({ u8  __v = readb_relaxed(c); 
>>> __iormb(); __v; })
>>>   #define readw(c)                ({ u16 __v = readw_relaxed(c); 
>>> __iormb(); __v; })
>>>   #define readl(c)                ({ u32 __v = readl_relaxed(c); 
>>> __iormb(); __v; })
>>> +#define readq(c)                ({ u64 __v = readq_relaxed(c); 
>>> __iormb(); __v; })
>>>   #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
>>>   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
>>>   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
>>> +#define writeq(v,c)             ({ __iowmb(); writeq_relaxed(v,c); })
>>>   #endif /* _ARM_ARM32_IO_H */
>>
>> AFAIU, ldrd/strd accesses to MMIO are not guaranteed to be 64-bit 
>> single-copy atomic. So, as Julien suggested, you still need to use a 
>> different name to reflect this.

Yes you are correct, ldrd/strd for system ram are guaranteed to be 
atomic. Here we are accessing MMIO, so atomicity is not guaranteed.

I wasn't very sure if {read/write}*_relaxed are always atomic.

Does this look correct ?

#define writeq_relaxed(v,c) __raw_writeq_nonatomic((__force u64) 
cpu_to_le64(v),c)

#define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
                                         __raw_readq_nonatomic(c)); __r; })

We can remove "#define readq()/writeq() ..." as they are not used.

>> Also, having nested virtualization in mind, since these instructions 
>> can't be virtualized, maybe it would be better to avoid using them 
>> for MMIO accesses.

Does nested virtualization apply to Arm ?

Reading https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen , 
I find two points of interest

"Only 64-bit hypervisors are supported at this time."

"See below for more details on tested hypervisior / guest combinations, 
and known issues on Intel CPUs"

Thus, I understand that nested virtualization is supported only on x86 
machines and that too 64bit only. Thus, it does not apply to AArch32.

Let me know if I misunderstood something.

>
> +1. The previous version was actually using 32-bit access and it is 
> not clear to me why the new version is using 64-bit access.

IMO, I made a mistake in my previous patch of using 2 32bit access for a 
64 bit register.

ldrd/strd is not supported for AArch32 guests in EL1 mode when they 
access emulated MMIO region (which traps to EL2).

However, ldrd/strd is supported for AArch32 hypervisors running in EL2 mode.

Let me know if I am missing something.

- Ayan

>
> Cheers,
>

