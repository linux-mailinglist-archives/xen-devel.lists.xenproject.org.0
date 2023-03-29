Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBC6CDCBA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 16:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516299.800213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWuN-00042q-KM; Wed, 29 Mar 2023 14:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516299.800213; Wed, 29 Mar 2023 14:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWuN-0003zZ-Gv; Wed, 29 Mar 2023 14:36:15 +0000
Received: by outflank-mailman (input) for mailman id 516299;
 Wed, 29 Mar 2023 14:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2RLl=7V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1phWuL-0003zT-UD
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 14:36:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a46c1df-ce3f-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 16:36:08 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 14:36:04 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 14:36:04 +0000
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
X-Inumbo-ID: 0a46c1df-ce3f-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg/bjFNgrV8OL4Li2ITtn8GVsxAkCnNHjCHRojYNTT+Uv9VKRg5az+bLlyLasRq1MzL6UJnAq0Pev0+rS0VilWR7C7cm3LHcAMFJW0f5OZUIoZUI+z6SNrrHel3fwy4YWkun0VsE1L7oi2plTTvR7BBmVqgRx/S6sS3j+A0FTlqtkS5JmdIIXtYU5kcWLYC5JvFm8AYVfPLSOKMoUVBi5PymNVrjXMNfCelH6nSl0qU/yI9rhs+VneWtuCxgMIdYuLsnwNb+oLEdg/9k785b56lQ9X8gEi7QUx0nTkQtSzHQgm1WDqbrQQitIT31BWwApqv9KO7pVUfZFGRK17cIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW3qzO+AR7edhE9Q2mf6SOEqSEyUJ4Af6YeInrJtDno=;
 b=Li8kS9uaqSnti3v496TN/eBprA82pcPm8DriMk6sJPmfHff1/aEqcfodj+t3CEyvAOsRxtTRr19YHcvLVPL4KCcR2c9ddE9KmAssLS2Vxg+UZJofvsGK6LQf9sefazbGVk4UIDoHiNLvcgl1LyW0RE9WHgIcIuxhBxhB7lyko4R5eI9vl9YCKNfAmX4Gy1Gfq7s4bE1YGkMGhyJIyjoXMjx1UTnIFDvYNjd/WBJyJYEH3Jfg8y8R2gRY7C1RlYsmK5D8P2dbj76nQc4lzBzJDDXaWMgv2kbPOg9iMFNf6im9QldxataXl8RjG+T7KRJrKL6LX9A9rcGe0FNRozTYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW3qzO+AR7edhE9Q2mf6SOEqSEyUJ4Af6YeInrJtDno=;
 b=2t63GUqdanpo+tl3ejEJUiPM3NlN9qP6vqKejOov1jN/Q/MpZUcro8QK6zI7FPJdDo/tObe58TlQMRjDxqN4r3THD5PTkqknjczbIuKIp/kbsORakr5ZTDO67x+OdVRjCfsV6qTTxVaQqn2hm22j8laU+om980w8PXX2Vlwwjo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3e403b20-fa1a-5e0c-8e14-b89afbb10a0f@amd.com>
Date: Wed, 29 Mar 2023 15:35:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 04/11] xen/drivers: ns16550: Use paddr_t for
 io_base/io_size
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-5-ayan.kumar.halder@amd.com>
 <197973ce-2361-f3e4-fd38-40b4ad802acf@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <197973ce-2361-f3e4-fd38-40b4ad802acf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: f1370e3f-14b0-4b0e-6598-08db3062ecf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2+3xQ5tDrnjNb3MWO8hucpH2LfDuEIfj86qoGKIgLVgonGimlij7TBPKvBRjS22vhE2HGF7R2AZgXZXJVHDbxbJ+GCCYRLK5b3wF+t3aa0Ax80MDbCAJzdt6RpniR+qv78+CRYJ8KIRPgVruZOw9bvpUgVemNS4Pn/eFckqzO7bVCLHmAsvl70kNDR54rYSBmU6GLm3ZVVcInWIrXfPwk10jhWFrgwVqkV2ABrKgfA9ARjE7kZ6AZl2UUv4kjXSGHhTcNDkDFzlM1cgukVZCpYGoDkhW+VmR/TN3fl0hBpftD8FSyvUsF8rEKKUcUPpsCWAHQqcVJA4CCBT9nFvLsAFkqsynWDI1k7IJEIh5odwcTvUhApwFgVAVrs4+dKt5uuVABxKq2MPZFu2kGQURBAWw5TUetobXNSiLXxFgBeVvsDDWt4rO9jblfQJYdzLQMx+mjoWOx0mrKoJZbcFxD7Fz/TxP4GySDu51SG8Ti7B7w8228hOSqUXeHuVfwqOmBknIelMUyF5UYB9KvUS2QUFaVNgoEW6zGcVG0cGMDzumhxsYdkDiz89eLViuq2TSw9jTu00NqwPEu9q6bpU4Ew+rVWBvRrqF9XYfYbP/ynCA1EJ0fI6qy5TNYNa2Io3rHukwGwAhJTzbGOecoZEQ9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(6666004)(53546011)(26005)(6486002)(38100700002)(6512007)(186003)(2616005)(2906002)(8936002)(5660300002)(36756003)(7416002)(6506007)(478600001)(110136005)(316002)(6636002)(41300700001)(31696002)(66946007)(8676002)(66556008)(66476007)(4326008)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEYzNm14dzl1a2ZmM21pUElVSXdwN1VRQy9qZ2lCQ1MrUjJEWHhNb3VKRjFh?=
 =?utf-8?B?NTFwMVV5RG9iK2lHdmZnNlZLcEE0Ukp1ekNlTjRYcXp0bUdyN1AzMDViUDN1?=
 =?utf-8?B?SVR0VFlaV2dNNitSMmx5VzB6MnVEV1h2c0xPVkhGbFhZTk5DUUdtb0xVdWI5?=
 =?utf-8?B?SElPRlhvOWxJQUVzTkMyYVovNEpud3REdFJiWmROZnNpRnRUenpnUmpkbHg4?=
 =?utf-8?B?bFpYZmRhVXdjaDRSUWQ1UVJtVWtGTTBPQ1VjcS8za3dTVkhzY0h1UXFSbXcw?=
 =?utf-8?B?eFFxWkluaHBqbzUzY21GMi9HWnlvbHR2MnA1bTRHMHFYTXBFMXVoWEpBOVA5?=
 =?utf-8?B?THVoSHBybzllM2lJdGsyeHFNdlJTcytNbUdXSGp4TC9UTm1mMDVtaGYzQ0Y4?=
 =?utf-8?B?bUU3SWV5aUxUYnI4SjVMZloweEVjOWlpQ0dUVTJTT0VmUnN3bVJsTW11S3ZP?=
 =?utf-8?B?T0cranYrVko2dVNZbEFHZWtZVGMyb0pUaHVaT1JBZU5TUXJWYTJ4SEs3cGZH?=
 =?utf-8?B?UzRabCthSDRMa2xFbEdRU3pyajFaanJNTHVnWnNjV0tXc2VEKzYvNElBUjVq?=
 =?utf-8?B?aVNVcW9aajNhL2IrekNYbm5NRUpXQWVRN3Z0RVkwSWFUN0VNTWtPc080WkNH?=
 =?utf-8?B?U2hIblg5MmpvU3dnV1hrazJUR2pEZy9UR1lKWEwxUUhWMWphMDlzaUdtUTlH?=
 =?utf-8?B?SEhkejlvdW9VWTZEYzVLRlJFeVRwWjZ0R01WV3hKU2IvOEJNMWlwNnNOQkxI?=
 =?utf-8?B?Mm1aditxOEh2dHU4VG1abjdKL0JENGphbkR5UWxmdThVY3U3SzhHYVBZRmFq?=
 =?utf-8?B?bW9lLzVsQTFaM2FZZHFNc0w4eUFvMUxzT2lkZmZGaEpsVC9RZ0UzZ2N0Ukt1?=
 =?utf-8?B?a1JpY1R5Z1hYQkJMdlBrRXJKL3hXRW8xQUREQkt1QkhzRzhsZ2pnMm5YS1Qx?=
 =?utf-8?B?WDd5YXJFNWtaSThlQmhGdmZoclkwYU5nbGhDdFJMbTRqVDFLbldmZmthSUF2?=
 =?utf-8?B?S2MxbW51aUk0ZjBZTEJiRjdjblNqSVcrdUFlc1ozdjlVU0NDNUVBZVhuejdR?=
 =?utf-8?B?bjFWRHJMRlFKYUpIQ0JsRHZHV3ZNSWJjd1A0ZkwxdXVnU01UWW45UE5yTUkx?=
 =?utf-8?B?cUI4QzRzcG5HMTJHSHBzSTlZbllxVGNzL3M4b2FWYTF4dk9aa0JWOGN2K1Rm?=
 =?utf-8?B?THQ0cGZ3UDRNblp2N0dMdTMyaHlnWUJnK29MQUtjNWJNMnFsMTRJTjhmZU5Q?=
 =?utf-8?B?WGhpS0lHbCtuOGlDVXB3UUtKSmo5QmZOMFhiamVTaHdhWWhNL0sxTlV3cG9R?=
 =?utf-8?B?Y3FrVUQwL2k4MHFrOTUvckx1QXJ3LzdaVC9oWko4UzBsa1dQSTRYdkRpeWRa?=
 =?utf-8?B?WXR0WFQ0aFFuYjZBTCt3Yi9aV3RpdWRVMk9YQ2xJU1hCUlpoaDZmYWgvbTRN?=
 =?utf-8?B?MXhTc1ZvNDV3TUh5UytYNkJLU3FjeitmRURUTkRrdHAxckNHYnNPbGtXSnNY?=
 =?utf-8?B?M1RLNlhhVU5BVWNYRHBmZWh4UEZlVzFsVUwvWElZcy8xaitMSjVveXZHc0lO?=
 =?utf-8?B?T1I1SzJjTGpRNnE4Ulc1cy9kN2xLdmtsSk1FZUFBKzVBbWhtcnlkR1hkY2k0?=
 =?utf-8?B?MnlBbWdQYXF5MGhMTTNxaHFtNHpGQmtrL2FsTGlPTkJFQWRTUVJkOGNYYzVy?=
 =?utf-8?B?OTFtaGwvNmdpSnBsSzBCcSthaUZEbU5UclBjeXpQK2ZnSndCOXVZMk5iV0VS?=
 =?utf-8?B?MWF2Q2dIcElueWpaY1RBQTNlTHg5WWJuVmJxL2hKUnFIZFRRek8zWmlncHNG?=
 =?utf-8?B?NFFWOHYyWTJiVGpQN3NwUnlJdjVWWm5UZTRnVTNwQzNhbVpXZENIQ0I3SnZo?=
 =?utf-8?B?VDlGeTQxY3NHeWc3bkxoY3hqWm5IYzRTMk94SGtvekRTa2pZeUVzb1FIYWlW?=
 =?utf-8?B?bFo1eExVQkxvVXRGTEJGUWoyQUI1d3cxVGdrOHlaOE5qUm1yT3MyK0s1Z3A2?=
 =?utf-8?B?eExDZXJUSVRMZk5VT2JndWZtc2o4ZC9ML3IwdjRocWZ3ZlJpbU1BMEMwOWNm?=
 =?utf-8?B?dFhLcnRYYWFYUHhDYlpyUG5sMWg5bGpoeVA2NXZTMHJxM2srdVJhbkd1SUp0?=
 =?utf-8?Q?qTiY1cAl+4f7Lf6Cpvt/44Cpx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1370e3f-14b0-4b0e-6598-08db3062ecf6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 14:36:04.5431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwfmf3dSFE3DT3BypluCbH6YpJOY6lKb4cHIiH3aGXYe5W9JV7eZDGEJTFPqNBRZkRxuiX85uT7rO6U5O7+pzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223

Hi Jan,

On 21/03/2023 14:16, Jan Beulich wrote:
> On 21.03.2023 15:03, Ayan Kumar Halder wrote:
>> @@ -1163,10 +1163,16 @@ static const struct ns16550_config __initconst uart_config[] =
>>       },
>>   };
>>   
>> +#define PARSE_ERR_RET(_f, _a...)             \
>> +    do {                                     \
>> +        printk( "ERROR: " _f "\n" , ## _a ); \
>> +        return false;                        \
>> +    } while ( 0 )
> You can't really re-use this construct unchanged (and perhaps it's also
> not worth changing for this single use that you need): Note the "return
> false", which ...
>
>>   static int __init
>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> ... for a function returning "int" is equivalent to "return 0", which
> is kind of a success indicator here. Whatever adjustment you make
> needs to be in line with (at least) the two callers checking the
> return value (the other two not doing so is suspicious, but then the
> way the return values are used is somewhat odd, too).
>
>> @@ -1235,6 +1241,8 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>                   /* MMIO based */
>>                   if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
>>                   {
>> +                    uint64_t pci_uart_io_base;
>> +
>>                       pci_conf_write32(PCI_SBDF(0, b, d, f),
>>                                        PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
>>                       len = pci_conf_read32(PCI_SBDF(0, b, d, f),
>> @@ -1259,8 +1267,14 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>                       else
>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>   
>> -                    uart->io_base = ((u64)bar_64 << 32) |
>> -                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
>> +                    pci_uart_io_base = ((u64)bar_64 << 32) |
> As you touch this code, please be so kind and also switch to using
> uint64_t here.
>
> Also why do you change parse_positional() but not (also)
> parse_namevalue_pairs()?
>
> Jan

Please let me know if the below patch looks fine.

     xen/drivers: ns16550: Use paddr_t for io_base/io_size

     io_base and io_size represent physical addresses. So they should use
     paddr_t (instead of u64).

     However in future, paddr_t may be defined as u32. So when typecasting
     values from u64 to paddr_t, one should always check for any possible
     truncation. If any truncation is discovered, Xen needs to return an
     appropriate an error message for this.

     Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 092f6b9c4b..5c52e7e642 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -42,8 +42,8 @@

  static struct ns16550 {
      int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
-    u64 io_base;   /* I/O port or memory-mapped I/O address. */
-    u64 io_size;
+    paddr_t io_base;   /* I/O port or memory-mapped I/O address. */
+    paddr_t io_size;
      int reg_shift; /* Bits to shift register offset by */
      int reg_width; /* Size of access to use, the registers
                      * themselves are still bytes */
@@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst 
uart_config[] =
  static int __init
  pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
  {
-    u64 orig_base = uart->io_base;
+    paddr_t orig_base = uart->io_base;
      unsigned int b, d, f, nextf, i;

      /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on 
bus 0. */
@@ -1235,6 +1235,8 @@ pci_uart_config(struct ns16550 *uart, bool_t 
skip_amt, unsigned int idx)
                  /* MMIO based */
                  if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
                  {
+                    uint64_t pci_uart_io_base;
+
                      pci_conf_write32(PCI_SBDF(0, b, d, f),
                                       PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
                      len = pci_conf_read32(PCI_SBDF(0, b, d, f),
@@ -1259,8 +1261,17 @@ pci_uart_config(struct ns16550 *uart, bool_t 
skip_amt, unsigned int idx)
                      else
                          size = len & PCI_BASE_ADDRESS_MEM_MASK;

-                    uart->io_base = ((u64)bar_64 << 32) |
-                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
+                    pci_uart_io_base = ((uint64_t)bar_64 << 32) |
+                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
+
+                    /* Truncation detected while converting to paddr_t */
+                    if ( pci_uart_io_base != (paddr_t)pci_uart_io_base )
+                    {
+                        printk("ERROR: Truncation detected for io_base 
address");
+                        return -EINVAL;
+                    }
+
+                    uart->io_base = pci_uart_io_base;
                  }
                  /* IO based */
                  else if ( !param->mmio && (bar & 
PCI_BASE_ADDRESS_SPACE_IO) )
@@ -1519,20 +1530,40 @@ static bool __init parse_positional(struct 
ns16550 *uart, char **str)
  #ifdef CONFIG_HAS_PCI
          if ( strncmp(conf, "pci", 3) == 0 )
          {
-            if ( pci_uart_config(uart, 1/* skip AMT */, uart - 
ns16550_com) )
+            int ret;
+
+            ret = pci_uart_config(uart, 1/* skip AMT */, uart - 
ns16550_com);
+
+            if ( ret == -EINVAL )
+                return false;
+            else if ( ret )
                  return true;
+
              conf += 3;
          }
          else if ( strncmp(conf, "amt", 3) == 0 )
          {
-            if ( pci_uart_config(uart, 0, uart - ns16550_com) )
+            int ret = pci_uart_config(uart, 0, uart - ns16550_com);
+
+            if ( ret == -EINVAL )
+                return false;
+            else if ( ret )
                  return true;
+
              conf += 3;
          }
          else
  #endif
          {
-            uart->io_base = simple_strtoull(conf, &conf, 0);
+            uint64_t uart_io_base;
+
+            uart_io_base = simple_strtoull(conf, &conf, 0);
+
+            /* Truncation detected while converting to paddr_t */
+            if ( uart_io_base != (paddr_t)uart_io_base )
+                PARSE_ERR_RET("Truncation detected for uart_io_base 
address");
+
+            uart->io_base = uart_io_base;
          }
      }

@@ -1577,6 +1608,7 @@ static bool __init parse_namevalue_pairs(char 
*str, struct ns16550 *uart)
      char *token, *start = str;
      char *param_value = NULL;
      bool dev_set = false;
+    uint64_t uart_io_base;

      if ( (str == NULL) || (*str == '\0') )
          return true;
@@ -1603,7 +1635,14 @@ static bool __init parse_namevalue_pairs(char 
*str, struct ns16550 *uart)
                         "Can't use io_base with dev=pci or dev=amt 
options\n");
                  break;
              }
-            uart->io_base = simple_strtoull(param_value, NULL, 0);
+

+            uart_io_base = simple_strtoull(param_value, NULL, 0);

+            uart->io_base = uart_io_base;
+            if ( uart_io_base != uart->io_base )
+                PARSE_ERR_RET("Truncation detected for io_base address");
+
              break;

          case irq:


- Ayan

