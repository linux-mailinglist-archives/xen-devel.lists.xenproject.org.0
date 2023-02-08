Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C968F3FE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 18:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491929.761293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPnvT-0004Mo-R9; Wed, 08 Feb 2023 17:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491929.761293; Wed, 08 Feb 2023 17:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPnvT-0004KI-OP; Wed, 08 Feb 2023 17:08:07 +0000
Received: by outflank-mailman (input) for mailman id 491929;
 Wed, 08 Feb 2023 17:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPnvS-0004KC-Ou
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 17:08:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26327d8e-a7d3-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 18:08:05 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH0PR12MB5092.namprd12.prod.outlook.com (2603:10b6:610:bf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 17:08:01 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6064.032; Wed, 8 Feb 2023
 17:08:01 +0000
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
X-Inumbo-ID: 26327d8e-a7d3-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeQxvr6HkLAvdis2BzIOxWv+xNsCGmhNWX+ppvVRrB4Eoi6kjLsEaxBX/SgI6z5/5OqeHsKptT7F71ED9Av2DwwyyrrYJe8qEGGsZ+2PD76TJ4sNU+12PfSJDrEDo6q+N7GX/u+H3eyV+4KtOrwSLpYydv6/Dboz91GTca4alH0MxV4DUpXiAqLGcgoo9iS8Wq4pzPZO6FbT8OQCLc+4vzv8GHK/JG3ypGWmdMcKkYklgr8/4Ta0MEwzPxOtuWbKaZFQxq2+Lmh1kaQWoxm+Z8jZssS8R+2h+cymzq8qDrnFuJGtmp4BPSSj+0kaqAN38sxPMTR8HDLwSZFFbmMrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF+jvPzW/t75K67ZlUkLDlWTJo3FWF0QTAZfcrA4DdE=;
 b=BbCZAE8v+83MHD64G1+kdQRE0yBXZOUMXb2bVWaMZPFCh4duGi3ao6bZayHde9I9cLCkJ6F1XpPSvqBIpPsQLinmvDZLKsWAeY+g1ybARsevKAn/kDHNDAfo5tGW+cRVUW++iWfTwL6Y03Q/axFFfopEu1Tb04Vl5dMN7d6gzrzAkpgqsLt6OhxgkNMEB1ykXrrN6XNmm9HFKDQHg8VHaWXSL+ryJIv6pQLQq7c6WlL18WD09/YBq0vuYKKTVv00W3OhFzmszQ2x8JcbU2AAEnPgPH+mu33/ghrqochGhPp2bpTPzD6wqu+VYuF+AC0vGZB9jpJJwvdVzjw7N3puLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF+jvPzW/t75K67ZlUkLDlWTJo3FWF0QTAZfcrA4DdE=;
 b=JuZa36cUX3qzVMBgXFksDyxjc/cJk2EqjyqgV7lNIYfkBJnSkxqRSDVbcfx8JgwOXB59CfkIX9fjq4yGfO+3pYu+zZfDa/1hSBIwLVX+ZOw1DUQWkRRuTkyndiNZGn5TudRTqvffpLBc+C5CxLvM0BRGDazO3A/c6jWXngpjrrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e3b5c9e5-b03e-eed9-4c28-0dfde9187a02@amd.com>
Date: Wed, 8 Feb 2023 17:07:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v3 3/9] xen/drivers: ns16550: Use paddr_t for
 io_base/io_size
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-4-ayan.kumar.halder@amd.com>
 <216343f3-6045-c6fe-ff4c-3a70d5061b78@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <216343f3-6045-c6fe-ff4c-3a70d5061b78@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH0PR12MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 1037ec46-c80c-40a4-94d5-08db09f708aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yHk3gx6eaMUKKRCCgU5cKWguZ0pn5yonr77v3temw/Go4Wwz9M+Gn4SCNuo1BGFEtUIz72r0D5R0z+uMWFXoBkC3tpamkZZvc18koV5WQ5BbYPBlnQHsSn99p7vlv69Mbh+E007EH2mNuJ7wS1X239daFY4HkobumoEsovxPRGfhW2tl1v1QPoa526D0FSYzhchuHFwlX3s0T34eQzsJqEJSahZ6RkZBDCA1ua44ZhsPdCpet/WXbYMBCelarojAy+Tfq43pu4HtqzWk9bWw9UzucMG3uz9URIGvy1W5kinJQd2JQjPPxQnlHCi695wgCA/ZukqEIGp9LuPP+jkiWC5Emqm0juqMEkKS9nvlxKMXzKc4T0A2vJnfdzE87xS851Gdu3tZ/QnwdJv6q81RD887xEY49YHj8HeySaKFsNyOvSIOyZcn4NoVbdUmyeMpQm3NWfAYzFgkqIDTZxAGLoSN3bLFIxiKp27uzQVBC6pFuD10ZbbakH/cogXevT5GN9XLWca3VBga20NpYAs0BtCakZP6B6bAwtmSaFMDQ8xz1cpsJXX+oGXMSMJQLYsHa3fLyEehIEEnaY6J9cnO8MHZbS5rKJw1XZ6RFhCCwrvHgQFjAvI5oIvPLhz4BOEn0sD8bEYrEw3KZt2hjawjBtjT5tn5no4K0GIRTvN9BM/sUdFrERpfbqv3j0XdUqr2eDlus0azfDN06xUmFFpEdH/wjYx8+6RDk1HqWxg1KeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199018)(110136005)(6636002)(31696002)(6512007)(316002)(2616005)(53546011)(186003)(6506007)(83380400001)(36756003)(26005)(478600001)(6666004)(6486002)(38100700002)(5660300002)(41300700001)(7416002)(31686004)(8936002)(2906002)(66946007)(66556008)(8676002)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlVrTjBFWWZVZnlHSndQL1ZONHo0S3FjUTVKSEI1ZjNHbWlZb1hjNTJSOXIx?=
 =?utf-8?B?c21hTUgwdGYxSkNhcGkrMGdFK2NGWEhGREd2ZFkvdDV2SjdDQkFPQmhDVE9n?=
 =?utf-8?B?VVc5c1ltazc3ZVc1UUd5UERIM2FwNmFjVXRiTVJuVExvMHNsVlNkQXVGajBO?=
 =?utf-8?B?Z01JQmtnQlNjNEVHZW95emVPeG82N3BHTS9VbVptVGUzeUhHeWQyNHJTdHZ5?=
 =?utf-8?B?bTdmOTBTdjZaalR3N1lYOXYrNlRrTnlXUTF1NWl1MkNpMGpTNkhyQ3hFRktx?=
 =?utf-8?B?TjRlYjJGQmRPTFQwSnV3RTBDZnZsb2Nyc1lEMG5NN09sVWJweC8zTlhaU3hM?=
 =?utf-8?B?dFVyUWRvbHZ5N3NEMFF2ajJ0RzYxN2RRVDJaSmdaZGhLOUtBQkZ6ZU9teUdW?=
 =?utf-8?B?ZUFyRW1uUFoyM2lBbE53K0hiK3ljZGpqWVZtU2VYbUFsckJZTGlDbDdNTkVs?=
 =?utf-8?B?RE1mUmdheHpzRVhkc214b1lDZUJmMG4xeFZCaCtELy9VREU5SzRBNTNSem5h?=
 =?utf-8?B?TEs5elp6dFVIa2dRZkpDeHRnT2VORTd5dmd5VFBGa3dKT3hUMVNkazlTSDNn?=
 =?utf-8?B?T0NKZXp0SjZiazQwdnRmaThXUVgvcnAxZzUvSDUrOFRIWDRiYXl6c2ZPalNj?=
 =?utf-8?B?a1Q0T2s2UHB0V083V3N3eXlneWNYT2ozQ1JEQVk0aUl2WkcyVFlra2RMeVRj?=
 =?utf-8?B?RXZESmxRNnVDODRUNmVJek9GNWN4anRmSkhvaldIMktGMHpFSGM4RWJUbHpx?=
 =?utf-8?B?ZC9WejFhTlZMR0Y1QXYzRU11bzdCVjhIZWYvYjN0YlB1aGFTdzYrV1dNSzRG?=
 =?utf-8?B?TXAzM2hvSUtDNjRkV2NMSTBaNnVvVVJSeHRSdGQ2OVVINFJ2dEhVaWJmcUxK?=
 =?utf-8?B?cDN0TWd3b0RiSlVPKzlDRm1jYlA2SWJqdm4wQ1dBZlVuSzNVUXNKcnR1dGcw?=
 =?utf-8?B?SG1SUUx1SDgzR3BaVVZFOSs4dzJkQXhXRGN4RTZDdWNycHpRYnhyYzdrem9z?=
 =?utf-8?B?RkFPRE5XTUdGVldXRmFmL0sxbVFHOUF0MENkUXk3NVFpYmVmMkk5QTFNa2lT?=
 =?utf-8?B?R3pyT3JCT3hodW5abktraTh4dERLTkQ3VWZVK2duRXNYUk41MnhOV3NrM0hu?=
 =?utf-8?B?UEM1RkFTREkrREFmMUY0OHZ4WEkrdk9Ka0RMMGVUdGlXU1g5THhQOUF0bmFz?=
 =?utf-8?B?VHo2cnNuem5kcGJ5TU52cHNQQW5YNmcyVXV2a0dtcXcxN3NrK2QxaTFod1Y0?=
 =?utf-8?B?MDdOVktUZDgzblpRUTAycGQyVUl0dEhmN21FOEVDUmJ5RVZ2VTg2K3RxamdX?=
 =?utf-8?B?VEk2VnNoNVhrNlgzVjQ0U05lMFVCbXByeVM1bWU3a0ZQOE14dzFOS21LUHps?=
 =?utf-8?B?TVIzRGo5NnVOOUo3Ym8xZlVCVkZScGcxYlQrUHcrR0szZDdvY214R0tSMEtI?=
 =?utf-8?B?alBHQzBIVlhjQ2pKbk5xNTl6T0tCcitaVDN6SXJxZkE3QVhNTlpYMVJaQVI1?=
 =?utf-8?B?ZmRHVHk0L1FvZTJRN2RFTnlwUXRObEZzamlydlNsNWdiZVdSOHJVamtnM2sz?=
 =?utf-8?B?T2JzQ0xyMFNhbzlUQkxUZklkMlBwb0RTNExPQnlTQ3UwSFh3TG5idkdoN0tM?=
 =?utf-8?B?VElxMlVzZk5ZVXE3TGlVK2ppOTFrTjVEaXBzNzJpTnpGWGNBUlNNdm5Belcy?=
 =?utf-8?B?Q1lEREh2Rjl3U1BZTGpkS0x2Q2tUY3RwemNyVm9Wd0o0ZkdCU2hIdnhDby9W?=
 =?utf-8?B?U1Evdm5YUkdVUTVMcjhCV2VPZ0xna2xhdXJTK2FiRDdnSDFySmJLUFQ4UWl1?=
 =?utf-8?B?VERsQ0Q2ZWlsN09DTms0T1htWFFyOTd0R0dFM2FBNU1ONzhQQmE2cDhxZkMv?=
 =?utf-8?B?M1VsSTNjemV5OWgyQUNDM1oxbEl6c01SbllBNUFIczlWVTR4b0RRd0pmSkxR?=
 =?utf-8?B?VlVkV0ZLQ0VGSXAvTGY5U3ZyYm9rZk1jdzJSbkdkTEdzeEMxT1BwV09QdFZR?=
 =?utf-8?B?QlJsMmVaWVJieVBwK292aE52YUZ4Z2VqMDhNcnVkQ0o4WGtGTks2Ty9PWmRN?=
 =?utf-8?B?VHNlbDllLzRQU0h6RXIyclJMcyswV3ZXUVo4T2hlTXh1bHk0SzBOdGc0ZUww?=
 =?utf-8?Q?urZtlVOAJaYImy7YO9upjW2ya?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1037ec46-c80c-40a4-94d5-08db09f708aa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 17:08:01.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2H/zpPWNycdjde5XooCFNhjHHjOEO8ZKbXUV3DyqsHuMSJzVpxapjOIR7BVzVuHPsYlxlDv2qM1dqEK2PoKUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5092

Hi Jan,

On 08/02/2023 13:52, Jan Beulich wrote:
> On 08.02.2023 13:05, Ayan Kumar Halder wrote:
>> @@ -1166,8 +1166,9 @@ static const struct ns16550_config __initconst uart_config[] =
>>   static int __init
>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>   {
>> -    u64 orig_base = uart->io_base;
>> +    paddr_t orig_base = uart->io_base;
>>       unsigned int b, d, f, nextf, i;
>> +    u64 pci_uart_io_base;
> uint64_t please (also elsewhere as needed), assuming the variable
> actually needs to survive. And if it needs to, please move it into
> a more narrow scope (and perhaps shorten its name).
Ack.
>
>> @@ -1259,8 +1260,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>                       else
>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>   
>> -                    uart->io_base = ((u64)bar_64 << 32) |
>> -                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
>> +                    pci_uart_io_base = ((u64)bar_64 << 32) |
>> +                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
>> +
>> +                    /* Truncation detected while converting to paddr_t */
>> +                    BUG_ON((pci_uart_io_base >> (PADDR_SHIFT - 1)) > 1);
> Why would we want to crash during early boot at all? And then even at a
> point where it'll be hard to figure out what's going on, as we're only
> in the process of configuring the serial console?

I do not understand the best way to return an error from pci_uart_config().

Out of the 4 invocations of pci_uart_config(), the return value is 
checked in two invocations only like this.

if ( pci_uart_config(uart, 0, uart - ns16550_com) )
                 return true;

pci_uart_config() returns 0 in case of success and -1 in case of error. 
But the caller seems to be checking the opposite.

I could not use domain_crash() as I understand that pci_uart_config() is 
invoked before domain is created.

>
>> @@ -1532,7 +1539,12 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>>           else
>>   #endif
>>           {
>> -            uart->io_base = simple_strtoull(conf, &conf, 0);
>> +            uart_io_base = simple_strtoull(conf, &conf, 0);
>> +
>> +            /* Truncation detected while converting to paddr_t */
>> +            BUG_ON((uart_io_base >> (PADDR_SHIFT - 1)) > 1);
> All the same here.

I can return false from here and let ns16550_parse_port_config() return.

I think that might be the correct thing to do here.

- Ayan

>
> Jan

