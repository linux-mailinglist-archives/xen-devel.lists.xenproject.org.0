Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1D646A0E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456846.714680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Bs1-00061y-Ky; Thu, 08 Dec 2022 08:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456846.714680; Thu, 08 Dec 2022 08:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Bs1-0005zs-Hv; Thu, 08 Dec 2022 08:03:05 +0000
Received: by outflank-mailman (input) for mailman id 456846;
 Thu, 08 Dec 2022 08:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3Bs0-0005zm-9W
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:03:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcdce9b0-76ce-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 09:03:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 8 Dec
 2022 08:03:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:02:59 +0000
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
X-Inumbo-ID: bcdce9b0-76ce-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU/5uNF4yJ0xumZeYIs31PbWg6HOzM+5FmeqKJ9madQukdwSuaEf6LWxMCGcJRnNd8ZEM2nvcoOXl4tDifIhakDz9p/F1OQ9F7u8Nh5+MULtRb/yQuXe/2FRRQbWUFeQO1ZjShv4QAH/ew8lgBhWjUlknlQyYP38S47Ul1cpJiD+vtyIDSkGBoYYENzdVGmTAQYR/QW3CYKLOa5VFl80IX+Cafs2VzHm2zK9VerrulUZTPJy8E4P8B1GvXZRcdanajUdlShrFGhTVVXHagcD/Z+WAavPFjtWkzJ7uIUYzoLhYwdLklW979PAbsWKkYaZkZEvcE1BEYxbMOm0OFMGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHjK7EcmTzGGF2mOc3yajPImEoyMldQucQkrH4CQbNA=;
 b=ROrAY1s4H8oVrcDDFT1I8ryT69aAbHx6Ey0Sexlqs89OLY2sENrRmLNpP4E3GqcxqhgIUE35r6vbz33/JPVVxjB6h+UGml4sL3cqIP+TVpOgkwqSSn09QJJDOllicASiV4spqJvp7PUfY0aZ2N/Llj5pv2sTxJlY9SUKBdcjcDYiRZZfD7tIR68o/qBlE1oGyjQcxrUsSf3/orowTwKu7euQVAxoKW0ZwmPBaLk0pVKyMSNhDVy3j8NxDaNVJPdVQNPisjcUWR/YGkBxX8t0hG9huLMNFS6hp1UtXJzd2MCeOH/8j5dnXCCBTIFhPrl62QUdtR4oEjqhBtfHbV27LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHjK7EcmTzGGF2mOc3yajPImEoyMldQucQkrH4CQbNA=;
 b=1V8kuPNz/SmMCu+1KuX/HN3cNr3paxbQ1ZwCUFF2YhmbB4OkaY+S7sZopy3iwoRKvIbBXoIf14POpn2aG2Cjte7T4rE/RQzpCL7Z1YIxyc8kJhhr9S6SE/xYFhrbjOL64prxDSf54cBwXbjXDjbaDg7GAl/yRuCN4lzxZL11RC9t8LT8/7rnI991jynDvNRWtt2DoAlBtNomMsFuB2kbLPcG+AyiQSVboTGuMuSKtBeQlN+cUDtWQ2LCM7UpvRh+BAsVVhLJ8JePOV2UaLTPMbvs0vbKZMe/7IvIwZ5tXDAtHyLSmuNOnC0kqGWkWg/qLghIsZGQ+PDf0pwG7Cv0OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea19b0b5-93b1-0608-b771-fdddb275f01b@suse.com>
Date: Thu, 8 Dec 2022 09:02:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Validate EFI memory descriptors
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Ard Biesheuvel <ardb@kernel.org>,
 xen-devel@lists.xenproject.org
References: <6936d67461716d8ba37ea8cc78743035c3e54e2d.1668832785.git.demi@invisiblethingslab.com>
 <24a8fb2d-b2a7-b319-ffa9-c5f4e0eca06c@suse.com> <Y5ESt70ylfow4WcQ@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y5ESt70ylfow4WcQ@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: d216d34f-3c57-4ec5-80ee-08dad8f29f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IL+Er870uWNbx3Ho64VKkj5eNz//61N11gSPWo67iiZ/pVw1jTpWaRCw1VVX09Wb66NTLbCL32AGIswhK3xK1yZJSJlD2VJzMuGr209SIXGiEm1KPXlLqcwfuSm/5xFQOpQWAufh1nbErpyiI+ZKX4rl+pjZNmickxIQxNHFaKjuk4pCNjI2cQc+vegB425k/iYx6e59Se1wxIHmXq5EdtUyCqwLnUWXLzwm3kTwFsLDWGeQeGNtbAyLYcGsY1X5u8Rqm++gg1uDYRaLMd7ngd3ag+5s3toTu5SSpVDG8X1wTMaZo2uec8lS0ClbyAWqX//bD7tB9n24ohk6jE8Pg2gWfo6nEA2np1taxMpQeaPBM0S2dVtkcbOV3zZzHzPjixc2uvJx3igqKMDacH9u4w/kXVZdrhmcXyTMqWJcJY5p+gR9bOOdU8yOv9IWk6Aa//YzjLnldrI9LKLK3fP6rcPnoEiZJv0WM80igtchfim+Ya/m9XXscqn3auDlXc9jFLD91aSa31xtQLpgH9IutZjZgaM1Jd7u2d9OBcSZZ8XeHXELzCPpkEgiuosJzlEnD1DemiM5F1lLUT6cZvbnS62ilEOI6v5JzDYfj3V/1cUXhRCoayJhtstYKfygchwoSsUmGIhtQf6qbgiHrtVh5aQwSFVmiXgPDutLKecAOkoFoHcmPyuTrmfm9ghAXjYRG4hjx9JlmcKr7kM9t4y6L4pPUUSHNiueLOj1nhFsVNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(31686004)(36756003)(38100700002)(86362001)(5660300002)(2906002)(41300700001)(8936002)(4326008)(83380400001)(478600001)(66476007)(2616005)(54906003)(66556008)(31696002)(6916009)(66946007)(316002)(6486002)(8676002)(186003)(26005)(6506007)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alU4djBQODhwb1hNcmsrZHk3YUkwYVBpS3VWMXJYZEpqK04zWk14Vm9QNnZI?=
 =?utf-8?B?Qzd6enpaUmQxdzhXYmNFSkJnRjNKT2UyYlJGR2VJWGlCdFBHeGNFUGNnc3hE?=
 =?utf-8?B?eGMzcktlTU93QytQeDl2S1ZwLzIwMGo2UktJOGY4T1M3QUJkS0hMT2wwWFAw?=
 =?utf-8?B?VVNOYzJ3RDBGRDlWT0NET290bEVSOGRpZVFMODRJaUd0NG5FTGhUQkYvSWdm?=
 =?utf-8?B?TUo1cnJHaEhsQy9mMGIvYThJa1RDMWNvMDJRNjM3Z2xMSHRIeUhlVENITlpC?=
 =?utf-8?B?VG9GTVgzRjM0WE9MSzZMNGt5Ujk4eTZLU0NtNU5CaEpQdytHY3NIT284U3dC?=
 =?utf-8?B?ZTBHdFJkd0t4U3FTeDAyQ01BK3R2RzhkQjhnb0hDVTlGelMzeVBXM0c3ajNX?=
 =?utf-8?B?Ti9OS21oU2wzR2xhSGJQZEZVLzVYQUdUeEoyQUpMbnFzc05Gd2xOV2NrQm80?=
 =?utf-8?B?NnFXWEEwZ3NuNkpQaFJTVGxwd2RhcFlnckN6WHUzQWtUSkNxUG9oODRGNWJa?=
 =?utf-8?B?UTRLeFppTUh2ZndYa0RCYUlRMWN1WkZnL1RsUnVGaThVRk8rSjlDb3N1VXBS?=
 =?utf-8?B?WXBUTGNwMHhsSEZuOXFxMjQwMUR5VWE2UFJTek1uUGpMUmNCNmNmVHY5ejBo?=
 =?utf-8?B?VTZlK05tL1pEZ2Q1andybGl0Z21jVEplbkQwODhNbEI5M2tLZzlEYzgwTnE0?=
 =?utf-8?B?bnlCU0FmSDd5aDY3ZVNkZjJYV1BDRWo1bDVrSmkybmR2N3NIdndSWFBPQzhD?=
 =?utf-8?B?MUk4YWFZVHliMFBjdDRkLzlwYk9yM284WktoQXV1eHo5L3dyLzArOG5WYmZF?=
 =?utf-8?B?UkFLRHo1WUxscWJKOXVZdjhyTnkwcitsOGVhOHg3M0ZyNkpaOHFWZzBneVZG?=
 =?utf-8?B?NlRvZEtJa2M4YVA2QklTSExyM3g5SExvMUpGSitEVUJYbHFSTEJrRzhNZ0Ji?=
 =?utf-8?B?NXRMS3JtY2d2ZzZON012elN2SDVyZ2YzUHc1Zm1qUnd3cnlHbkEzclJnbHVr?=
 =?utf-8?B?NWFQN3lLbk93MGNhY0NyYlNsMGYrcjFhM3VPOUdIQmlrLzBjZGd6MDRlQVJv?=
 =?utf-8?B?MHU5RzlkL0hBMXBBcmZKMEJSajh1VE81Q2dHZWtOaTd6eHc5eUxwR3pURm5p?=
 =?utf-8?B?VnFoRGtua2c3SkE2aXliK3ZVVnk5b0VxVzc4dHovTmVwSFpyTmtSRzAzTEwv?=
 =?utf-8?B?QU4wUkJyR0JIWTVYNWVqcittdmM3b20rL01FL21SRWk0aEh6VU9NS000RTZq?=
 =?utf-8?B?QlN0a0hpSDZLb0N6VGkzbGphWC9zZkNyLytzQmQzTnplVWJVbmJQY1dQS3pK?=
 =?utf-8?B?ZVFsdHdvdXFvODBFTXpaa2FPLzV5WmorclcxMVJXQlhETjFFRGFCcHp0Z1Ns?=
 =?utf-8?B?TjJTNS91WmlGdWUzTWVud1ZrY1JNWi9CaTU5c3gyYUFJT25OalhQckZ3RXFI?=
 =?utf-8?B?NG5EbFZZVGpkb0RYRTRsVW93cnJSb3N3VDJTVWxtdU5EQkd5cXRiK0hCYmZY?=
 =?utf-8?B?NXVBTVJZVFhxRzNQNDhrbmsyNkkwMFhQUXIwTXJuYUsrQzhMd21wdTR0SWJQ?=
 =?utf-8?B?eW9OeTVpeHp2TEtEOE54eFFDempDVGJzZSttMkJzejJXZ2tFNk5HaHZQdjRZ?=
 =?utf-8?B?b3diNkZSWi8ra3Z4Y3dzMTE2THNVUEhRRWd4Wk1ySGdJTlVjdWFic3RRd25u?=
 =?utf-8?B?cC9URGNnS3VWbWxSZ0xBcW9nd1FvdzM0aElndFJ3N3V6Z3VXbTMzY2dHOExw?=
 =?utf-8?B?L0NNeHZtZmFJeTRPNW1tZmk4eE40emhQWENIbFc3ZzNEaDJwSlVaNTB0NEk1?=
 =?utf-8?B?UXZnZGVNWnBxQ0F0akR2M05GdnBXVDVERlVKZEp5ajk5MTNxaGFGRVgyb2NV?=
 =?utf-8?B?K0lIRll4UU5WdDRYSDFmYUtiZFp1NFlkRFRKeXBsazNweFphYmh2RjE5bktz?=
 =?utf-8?B?L09qalpRM241Ukp6VGNhNjVBSys5YzYxWEtXOFd3VmhpdFRnNWdtcWxhS0hB?=
 =?utf-8?B?QU10ZWlIN20rbERUY2ZvZUFhb3FodE1WNFg2MldMN096Nm5jMnZuWFg4LzE5?=
 =?utf-8?B?c2FqcHM1NlpxSGcyZ1QzcUtxcE5wc1NkRWxOMlVCcEY3MCt6UTlQcFZkNlh4?=
 =?utf-8?Q?loIEnt1YHgWGdeTzDDeXcLsMK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d216d34f-3c57-4ec5-80ee-08dad8f29f3c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:02:59.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98V7Eu6tC0VlSNGiVFau7ovk1hvd5VIbgt7iy1BQqjjsQvsy0jhGLHuWYQMCJsb1SMuAU0x2O0QQanq+VaesrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880

On 07.12.2022 23:23, Demi Marie Obenour wrote:
> On Wed, Dec 07, 2022 at 11:04:05AM +0100, Jan Beulich wrote:
>> On 07.12.2022 00:57, Demi Marie Obenour wrote:
>>> It turns out that these can be invalid in various ways.  Based on code
>>> Ard Biesheuvel contributed for Linux.
>>>
>>> Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
>>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>
>> This comes with the risk of breaking something that was previously working,
>> despite a descriptor being bogus. This _may_ be deemed acceptable, but it
>> needs calling out and reasoning about in the description. Even more so that
>> elsewhere we're aiming at relaxing things (by default or via command line
>> overrides) to remain compatible with all kinds of flawed implementations.
> 
> I decided to match Ard’s kernel patch, except for ignoring (as opposed
> to using) descriptors that cover the entire 64-bit address space (and
> thus have a length in bytes that overflows uint64_t).
> 
> What do you propose Xen do instead?  A broken memory map is a rather
> serious problem; it means that the actual physical address space is
> unknown.  For Linux I am considering tainting the kernel (with
> TAINT_FIRMWARE_WORKAROUND) if it detects an invalid memory descriptor.

Much here depends on what brokenness we find in practice. I've been
flamed more than once for insisting on strict spec compliance. I'd
be fine with you making things more strict here, but then - as said -
the risks need to be called out in the description, and once you've
done so you'll likely realize yourself that hence there then needs
to be a way out for systems where the new checking turns out too
strict.

Tainting the hypervisor in the event of finding an issue is certainly
an option.

>>> --- a/xen/common/efi/efi.h
>>> +++ b/xen/common/efi/efi.h
>>> @@ -51,3 +51,17 @@ void free_ebmalloc_unused_mem(void);
>>>  
>>>  const void *pe_find_section(const void *image_base, const size_t image_size,
>>>                              const CHAR16 *section_name, UINTN *size_out);
>>> +
>>> +static inline UINT64
>>> +efi_memory_descriptor_len(const EFI_MEMORY_DESCRIPTOR *desc)
>>> +{
>>> +    uint64_t remaining_space = UINT64_MAX - desc->PhysicalStart;
>>
>> This wants to derive from PADDR_BITS (or even paddr_bits) rather than
>> using UINT64_MAX.
> 
> paddr_bits is not available yet, but I can use PADDR_BITS.  That does
> require an explicit overflow check, but that is fine.

paddr_bits may or may not be available yet; it certainly is ...

>>> --- a/xen/common/efi/runtime.c
>>> +++ b/xen/common/efi/runtime.c
>>> @@ -270,18 +270,17 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>>>          for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>>>          {
>>>              EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>>> -            u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
>>> +            uint64_t size, len = efi_memory_descriptor_len(desc);

... for this use.

>>>              if ( info->mem.addr >= desc->PhysicalStart &&
>>> -                 info->mem.addr < desc->PhysicalStart + len )
>>> +                 info->mem.addr - desc->PhysicalStart < len )
>>
>> With what efi_memory_descriptor_len() does I don't see why this expression
>> would need transformation - there's no overflow possible anymore.
> 
> You are correct, but the new version is more idiomatic, IMO.
> 
>>>              {
>>>                  info->mem.type = desc->Type;
>>>                  info->mem.attr = desc->Attribute;
>>> -                if ( info->mem.addr + info->mem.size < info->mem.addr ||
>>
>> This overflow check is not superseded by the use of
>> efi_memory_descriptor_len(), so if you think it is not (or no longer)
>> needed, you will need to justify that in the description.
> 
> The justification is that info->mem.size is no longer used except in
> comparison and assignment, so the overflow check is now redundant.

I don't see what "no longer" refers to - nothing changes in this regard
before and after your patch, afaics.

>>> -                     info->mem.addr + info->mem.size >
>>> -                     desc->PhysicalStart + len )
>>> -                    info->mem.size = desc->PhysicalStart + len -
>>> -                                     info->mem.addr;
>>> +                size = desc->PhysicalStart + len - info->mem.addr;
>>> +                if ( info->mem.size > size )
>>> +                    info->mem.size = size;
>>> +
>>>                  return 0;
>>>              }
>>
>> Is there any functional change in here that I'm overlooking, or are you
>> merely converting this code to meet your personal taste? In the latter
>> case I'd prefer if you left the code untouched, with the 2nd best option
>> being to split it to a separate (style only) patch, and the 3rd option
>> being to at least mention this as a no-op (style only) transformation in
>> the description.
> 
> There should be no functional change here, but IMO the new version is
> much easier to read: first compute the actual size, and if the provided
> size is larger, clamp it.

That's a matter of taste, as already indicated. My taste, for example, is
that you're introducing a new local variable for no good reason.

Jan

