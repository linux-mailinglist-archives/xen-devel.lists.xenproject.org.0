Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C899671A37
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480498.744951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6QG-00007u-CA; Wed, 18 Jan 2023 11:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480498.744951; Wed, 18 Jan 2023 11:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6QG-00005x-8M; Wed, 18 Jan 2023 11:16:04 +0000
Received: by outflank-mailman (input) for mailman id 480498;
 Wed, 18 Jan 2023 11:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/We=5P=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pI6QE-00005r-AM
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:16:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b8a70fb-9721-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 12:15:59 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 11:15:56 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 11:15:50 +0000
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
X-Inumbo-ID: 7b8a70fb-9721-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGp/lvqnwso4nX054MeGE7/ln/4phO2yPU2TJlJhy7ngd7rP+Qk886VoPAc/dyLwDjdabc2ngyHTTsLELKyiWuHEiplkipldHXdR5V5q6a5qeK0SoRwbX7HaPlZn2tnk/t1NzpBSEouL4lHONaC5JjQdqAvY7/VzfjABh9PIPqZyWazDapRNmR2bR/Vf8TJjMazJPbI2klv3tcNrmQ9/NoJxxjnuxJR5B8CYOlZ9HI+CgmPVqmyCueMdjB6o4jzy4ih3cAbYVdL8i0tI0Q/Jz1/bvia/X1LBbZ1bFGNRD4H60q1i0Pq49bCbNv0ta5y0AL/R7wklK3HeUFLmvwxo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBJjBqcWv+8ocw1cr4BlgRHfFKveyIiU8BbcvwfsM60=;
 b=mDizXWwoDwUcyjL9XJjIaXGev8Bn1MGkxlsiElA6A4IMJzUDtTK3VuTlFWrFMJl//2qQyK4QnuZ4Zh3qo9XLYtiReLbVN9sjLuRZmk3SvGQPLTNRpUGferGOz89bCaw3HGw0EwJJ87Yq86kRTRT/6WtzmRtyfZ9u4nAlRuxyET+Ntr/b8B1ckeihzb2cUjQGrmUqHk1d2SbYj301TDkaVQPQzQMzUfXEap8xXutxqamZz+2HPCcaUTmFKgA6PpolGEhQLGwenbiSKLAT5BaIyL5iuvp5l2YsUzSwbFYPY6kJOuYjqeecdLT31S38cjf6NKNRleOVuRXWmhBM5xwLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBJjBqcWv+8ocw1cr4BlgRHfFKveyIiU8BbcvwfsM60=;
 b=qXMa1ux4CCFGkozF7ZAUT/QCfpzLvU2PrxI+C2cva+IUcWPiwUygaPplHUg5Lroy6JbnPCX456V4VCcROye/Er8GRAUEgrLMyJLCTt5yRmQk1zyFc0M88/FGjXjXd9hdUAqxB///qv/En0+VvitWfZMxL/Cy88qNJzS7oSG95lY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <37719b71-8405-eefd-3bf5-95c7c8639e82@amd.com>
Date: Wed, 18 Jan 2023 11:15:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, julien@xen.org,
 Wei Xu <xuwei5@hisilicon.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
 <926307d3-a354-be87-3885-90681dc5ae24@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <926307d3-a354-be87-3885-90681dc5ae24@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL0PR12MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: bfadd68e-cdab-47ca-9afa-08daf9455aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0EX090AcUvh+vOSgH7x4KemKb80SHIntstVaD1sGH8QwYklSQyqVt0Wvog/nmzDnsBM+Lx/CMIuwBsfiHrp2mvKOLwv6DmcduhRNJ6S9D3TUmluUjoWDW5apgNNintwL0owK3QBe4pWelc7qKpRGOfCdSTTkPXdTW9COtlur0nhwbshs6agvenoJfVmzVmjIEOgumJ9tyX5ucYRdl8eUGwZp7E3gyhIXNTNModf71pWofXWlTZaGIc+Nfw9PlWaA5fL/3XmhtfJN7i+6GUy6YL9CP+s9hzs6wch1iKdyQRA5BpqD0qWu7KFCW2FRIynuWefIJdt1WWKy1t5jy3OVzaM/yABKNl2R1Usq9nJXAX0wNDdx+m/dv7iEgg0tyRlx3GuXvKLfyfDvUP74+DD0JhAJS8av4OrpGwK84WRA7kocC7bMx0lkVIMc/OGMDTP2yIC9Y+cHtIPRqsm+dX/lCBvOjFaoH0sIOHXYMzzC7SIuBkF9QAa/5bGkZ+qyoUFSVXBCPu/htqgvz5Px39kLhKpAYfMB9hvxxvvrLJROkmJbpFqP3Prh1vTJNhv3rHWz2tclanaFEbCa/aevtft1pYGi+RgXS6uU8eYzgMoBLf/o2wyyh9FPFsyTfYx0MBNquXgZNL6D6ByvDhdWoN7XgBJTRBdbDD8tovEfS+NHUHpjHY+Xap6f0zuJ4QYKL2dBjDbxEXohKKlhGuu/CeM0F0i+5NYcKCVbWhn/pUgVBrY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199015)(31686004)(36756003)(7416002)(8936002)(316002)(66476007)(66556008)(8676002)(31696002)(66946007)(5660300002)(2906002)(4326008)(83380400001)(38100700002)(110136005)(6486002)(478600001)(54906003)(6666004)(41300700001)(53546011)(6512007)(6506007)(2616005)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NldMeXlhQjhnK0x0VWNOaXJFU3IvKzVlbnNMQ1dqSEhiSU5VQVpWa0IwT3RH?=
 =?utf-8?B?VDZJQlgycnN2M3NRNWYwMTB2empxSzFEWUtOOHF2Y0pGYlJFVGpUVEhKVi9i?=
 =?utf-8?B?YUhiNTlIM0xrTnpGSWdFcTFIMUNubEtVZ1VIZ081WmVJYXlWak93UGc2UnhU?=
 =?utf-8?B?ekJmRXJGNko3YjBGVTJPcUtBVFJvRFZBeEdHalFLM2EvbGlEd202WS83a2JN?=
 =?utf-8?B?NFZHcFpWbzFZMW1Na0hFSmVmc1JQTzdFbkFTKzVTOCtHQmQxOUxyODBacWw1?=
 =?utf-8?B?U3llUE9vRi84V1Fzb2FaZitDaVJnWDQxcVRsbTlyYkhJczRMSTFlVkpjUHhK?=
 =?utf-8?B?enF4Q25DWUJqejlHK2p1L3l5YzExZU80WjZLRmRNTEJsUWVnMGFRZlQwTnJD?=
 =?utf-8?B?MUJlRk1lUU5DeHFGUEY4ZUNmZVl3VzVXV056MmNpUVkzVnR6OXRSZWNJdHBv?=
 =?utf-8?B?MGJKeHZEOUtya2pKTkw0SEVtVjdLL2Zucm14V3lQcCtaL2FlOFE3Ukk4RG1M?=
 =?utf-8?B?UGtFTkZpTTYwc1ltNThlbitBMnh6RGxnRkNOb3ZVT0JpYWxpaTBhVVRhY0l5?=
 =?utf-8?B?em9OZFlER2VqQU9rNlp5SUpSZFhWQXV1T3JDVEpHcW1ueW43alE2UVg5cnFU?=
 =?utf-8?B?V0s0QjVPblh2UC9BeVRseGI1cExheFUwckhaUVhKWXdwOCtsVXVWMnhNSk1H?=
 =?utf-8?B?aTF2MmpuK29keUVIcmUzOGhRZjZGV251QURBa0RGVXcrU0JsSlZFZndkdUFx?=
 =?utf-8?B?VHE3ejZQWFZuYUdrTU9scWtVVUFKQTNWOFlOWGxJL1pTVUwvZkMwTVlRd25S?=
 =?utf-8?B?SzRLRTB1WU1QcWlPZ0t6d0xtSDdpbS9BMklNZ0tZZllEQVBTSXJ6cGx2WEl4?=
 =?utf-8?B?MTR4SXdFbmtSK3dqTTZZWE9RblpkUVpSUGcyd3pZL0NxWk9EOUZUY3pDMERx?=
 =?utf-8?B?aENVckZvdiswOTE2Z2VwTVNmQk5mUjEwR3NVU3pvb1p5aGoxbXgzYVlCSlk3?=
 =?utf-8?B?Z0xqL1E4bVZDTWwyTXhVdWU0cEc3S0lVbFdtdkJZUm5iMFp6WnNzUkIySzBO?=
 =?utf-8?B?bE5xbC9WY0FnemF1RU5HVUhyV3Y4ZHh3aG1BNTFEaWNKZEJiSlRaeVpQbjgw?=
 =?utf-8?B?MHZ4Y1doV0RMbTN5Q04yYzhDMGlEN0tCU1FHY20veCt3clJjUG9oSU9uT05Q?=
 =?utf-8?B?K2w0dU1oRVkxZGJOVy82TWROdTg0RnJHdDc3VG1UZUliTW1MZGdlaTIvQWty?=
 =?utf-8?B?b2VFNEllU2dxRVNUOEI3MU9hamFZcWJvRmlseStYVVpEVno1V2Z1eHZqanpU?=
 =?utf-8?B?YWtITUJJVWF3N1B3WCtUWCtILzIzajRycDUwMzZha0d4OXJ6M1VnZjJGUXBQ?=
 =?utf-8?B?VWMzMXFSZ3BBMjh1VFVRNWhsazBDUXhQY1BoYlVBMUl3NnRWc3ZYdzNTYzQ2?=
 =?utf-8?B?NjJIQ2MwT3Z0RUNuanpqRzI3eWtDVis0NXNibDBmM1hsb1ZweXRpZHdBdDBu?=
 =?utf-8?B?RTVCVXhYVld2ZkI2UXA0MWhBT3lxYzEyMW1VVVRsQk8yV21wZ1ZmS1Z1ckh0?=
 =?utf-8?B?bHU5YUorWHlOeHM0cmhHTzQ0L3cyRndreWE5djExbWJCUkJ1bFc3UHNLOGtx?=
 =?utf-8?B?NSs0Um8rSnp1QTEwbFdPanA1Z3VKRUl1VDFUTU5kc2oyRyt1NVRER2kzRWpR?=
 =?utf-8?B?WTlrREVWN25LNmdXZ21CSG9rYVYrdWxxTXlsMmQ3Y3FwSnhHUFYzSlcrU2xa?=
 =?utf-8?B?ZERWWUZPUTNFSWV0eWJzbE9GeE5Fd29NVjI5Yk1BZ0dQZnBKT3R0Y005disw?=
 =?utf-8?B?cXVDSFhQTnF1WFFxZnJabUhEWkRMejJZYU9jTU1TYXozRXBWdkJDM0Iya21W?=
 =?utf-8?B?MnJJMmZFck55dVNoaFJ2bDE0OGliZUNFd0h4dzBreXFWVGcrUzJHN3B5Ym84?=
 =?utf-8?B?MnIyRDlqcFBFY1lSYVFNcFNqTTkwc242eEc2dkJ0ZVlvbnRoajh1NWg5MFpC?=
 =?utf-8?B?Zjc5bDdHRG44WWwrY2NOZDhxZHd1WjhGOXNxNlFFdHVUaFZTd3F2RXB3WUQ5?=
 =?utf-8?B?d0d3L21oZkJuOG5USGFid2FHUnI1bWlOb2lPalMwVHBRb3JhcjJTZlRJZitJ?=
 =?utf-8?Q?Ozw2vLzt/5/fY7OLR5MqG5hYB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfadd68e-cdab-47ca-9afa-08daf9455aff
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 11:15:50.3450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyqUVyIlO6y+tq5cII62ShX8f3e7ZpMEDxJ8QuBoZ9sF2b0MBbVAjpALXt16eNGFACw4ulnNxtg2dxDfsWNKIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868

Hi Jan,

On 18/01/2023 08:40, Jan Beulich wrote:
> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
>> One should now be able to use 'paddr_t' to represent address and size.
>> Consequently, one should use 'PRIpaddr' as a format specifier for paddr_t.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from -
>>
>> v1 - 1. Rebased the patch.
>>
>>   xen/arch/arm/domain_build.c        |  9 +++++----
>>   xen/arch/arm/gic-v3.c              |  2 +-
>>   xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
>>   xen/drivers/char/exynos4210-uart.c |  2 +-
>>   xen/drivers/char/ns16550.c         |  8 ++++----
> Please make sure you Cc all maintainers.
Ack.
>
>> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst uart_config[] =
>>   static int __init
>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>   {
>> -    u64 orig_base = uart->io_base;
>> +    paddr_t orig_base = uart->io_base;
>>       unsigned int b, d, f, nextf, i;
>>   
>>       /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
>> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>                       else
>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>   
>> -                    uart->io_base = ((u64)bar_64 << 32) |
>> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
>>                                       (bar & PCI_BASE_ADDRESS_MEM_MASK);
>>                   }
> This looks wrong to me: You shouldn't blindly truncate to 32 bits. You need
> to refuse acting on 64-bit BARs with the upper address bits non-zero.

Yes, I was treating this like others (where Xen does not detect for 
truncation while getting the address/size from device-tree and 
typecasting it to paddr_t).

However in this case, as Xen is reading from PCI registers, so it needs 
to check for truncation.

I think the following change should do good.

@@ -1180,6 +1180,7 @@ pci_uart_config(struct ns16550 *uart, bool_t 
skip_amt, unsigned int idx)
                  unsigned int bar_idx = 0, port_idx = idx;
                  uint32_t bar, bar_64 = 0, len, len_64;
                  u64 size = 0;
+                uint64_t io_base = 0;
                  const struct ns16550_config_param *param = uart_param;

                  nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
@@ -1260,8 +1261,11 @@ pci_uart_config(struct ns16550 *uart, bool_t 
skip_amt, unsigned int idx)
                      else
                          size = len & PCI_BASE_ADDRESS_MEM_MASK;

-                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
+                    io_base = ((u64)bar_64 << 32) |
                                      (bar & PCI_BASE_ADDRESS_MEM_MASK);
+
+                    uart->io_base = (paddr_t) io_base;
+                    ASSERT(uart->io_base == io_base); /* Detect 
truncation */
                  }
                  /* IO based */
                  else if ( !param->mmio && (bar & 
PCI_BASE_ADDRESS_SPACE_IO) )

>
> If already you correct logic even in code not used on Arm (which I appreciate),
> then there's actually also related command line handling which needs adjustment.
> The use of simple_strtoul() to obtain ->io_base is bogus - this then needs to
> be simple_strtoull() (perhaps in a separate prereq patch), and in the 32-bit-
> paddr case you'd again need to check for truncation (in the patch here).
Agreed this needs to be done in a separate prereq patch.
>
> While doing the review I've noticed this
>
>      uart->io_size = spcr->serial_port.bit_width;
>
> in ns16550_acpi_uart_init(). This was introduced in 17b516196c55 ("ns16550:
> add ACPI support for ARM only"), so Wei, Julien: Doesn't the right hand value
> need DIV_ROUND_UP(, 8) to convert from bit count to byte count?

Yes, I think it should be

uart->io_size = DIV_ROUND_UP(spcr->serial_port.bit_width, BITS_PER_BYTE);

However, Julien/Wei can confirm this.

- Ayan

>
> Jan

