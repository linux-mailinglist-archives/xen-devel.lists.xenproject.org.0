Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5927C74AFF3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 13:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560463.876393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjmQ-0008J0-3h; Fri, 07 Jul 2023 11:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560463.876393; Fri, 07 Jul 2023 11:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjmQ-0008Go-0l; Fri, 07 Jul 2023 11:37:42 +0000
Received: by outflank-mailman (input) for mailman id 560463;
 Fri, 07 Jul 2023 11:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfgb=CZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qHjmO-0008Gi-Rm
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 11:37:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac3d26fc-1cba-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 13:37:38 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 11:37:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 11:37:34 +0000
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
X-Inumbo-ID: ac3d26fc-1cba-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsDqrYMs3ISP2aj+niy5pl2U0yPKpvkSuRy2v0VsEmTq3qgrS+cuO6BM5MTp765X1zYIiT/lNjcYoXEbgm8jtTHupevhDaNVezwKgJlMxR8sg/9vcR4yTvvNR672ky/YCmHUKhjQ0dZPqldUE1gsqtwwLqVUc95EBYeK+2OyGMaXukU6rrE4cIcoBFcxwa5vbayKj8c3MmrJ7kVUko+rAn2SLO9HZnVPogMXtAefEKRBdmh/Dsx5PIJyJbsuBEFTQr24sVKMQJsqZt7psP2oyxvnEYQZTN++BixtdJOV9tXqxqkDLbofVACCVzxsiuhIMKdj2frQrRa7nicOlo4Sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhM+4wBjZJSY0wYbKlsb1O357a+vxR34+mTXCfmjACM=;
 b=KcqnozKYi/I92YcW8LJKkVxsSRmRj4/0qjb/i7b8if1lCxmbmJRy4MZBXeTn4lGbhdbMSQ1fLAR7Sa8H/AjBU8KPk39POAeb/JeY3McYmQJ5QIWaZ5UR5v18W94/NMDHsywEfhAt6wu0I5BUZLavpiiTEtKU1fX3zEUgnfFXm7q+J0anUGh3RtTMHo4vV6VBUeiBYVEY9d/Ts+EObvTR1HwkKax4+M8orwrsubyKgoDoLo4bibCnJ4Js/axy1tFSJdmeWI7KHXSXrLliXkjPnUpAmGzSfItmMNs5M3M1GdPHCClk+tbmZ0Ww1oOPaR/hsG1vMJ5IjjJp7WNx30OMgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhM+4wBjZJSY0wYbKlsb1O357a+vxR34+mTXCfmjACM=;
 b=SjR7ae38ZjMf3ZonOk5WCLWm48ez6j/g9NrkoIVqn9PrZDCxFHYey3XdA86aQ693sfYnmkgLUUOTiQn/jrHJ6jC/9xgi81Iq91491mdifjZu8Ux0Auw4isRcAPsCKNZyTKF14/Wvd0uaZogFClGTjec+EKD+SdXshhHrGzS+Oek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <915c6a26-f85c-7be6-85be-e8fe6a779347@amd.com>
Date: Fri, 7 Jul 2023 12:37:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
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
 <3e403b20-fa1a-5e0c-8e14-b89afbb10a0f@amd.com>
 <6196e90f-752e-e61a-45ce-37e46c22b812@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6196e90f-752e-e61a-45ce-37e46c22b812@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b136ad-87cf-46f1-c6dc-08db7ede8e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1rN/zfSY1Njq0NDDvv2qiEApBC6P975p22i80DAYl9LshQQbb7wW2Cxv2PkyBg8k7FzACX2j1whmBSYa40DRe/eB8HegNBer360+aggj7Eownorg3ZbSIUcziCaMosXbKR2qDF/AWkkXpvVHpABuTwPz8Um9xaqeb+XxjyTQjRdDzSt21rwy4f220NVIY8DLPBSbZCZoMEIQlU51HfAGwkfWuIf/RpPF0vWbO45yPtgWdP4flPD26Rh1qXfi8E12ebOLVWJtO9HACrXs7ZW3kaCUl5ngYmOBR7YIW2GvxSm+AQpV6W5MYWimTSv8GoGCwVOFYkP15SwNId7D9jxjstGRVohxkrqVoSvHVNdB8ojBGRF5Z8zCb3nI0PMpckwBTCs4yjvovmA4+jQqI6Eu6NCFloWxUgs0iGhhkfnOakWNNWPdzhvAaxj4S4O0DV4SPpXbBKptgV6ax0n6JQS+BdRdA1l0Ol570ON2ic7JGIcLSjonT8Tg32Kjp42ziKWj11tvXr5UC7/LTATskVSCf4fmFFcYTvEYf5jAc7goTrK/0UMp+sfJ36WfHd4JxAqE7L13CuLLhE474hrX0wkKR82HCbxWdXglRCQSeTw5wfgWV+6ueR8k+8SMWuffIS20s8/xW+KmtQmIg8JI7dEEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199021)(41300700001)(5660300002)(110136005)(316002)(2906002)(8936002)(7416002)(8676002)(31686004)(6486002)(66476007)(6636002)(4326008)(66556008)(36756003)(6666004)(478600001)(83380400001)(186003)(31696002)(38100700002)(66946007)(2616005)(26005)(6512007)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnQzcDI1VkozYnNEV3Q0MmNiRFM2bzJDOXpCYVM2eUd0WmxIUHNjWWdMVHZj?=
 =?utf-8?B?b1pQMXowVFpRdnl3VzV2a25EWUxzYUtWR0xVN2pSQ2xPOThJbTlMOGZlQkhx?=
 =?utf-8?B?NE93dkNISTUxSnVnYUxMMFoxNW9Md1RFZU5hZDZPRnBWU2JPZVI0ak91cit6?=
 =?utf-8?B?MStMUFRPbE1XQmhZK25SNjEzYi9jK1VTWDJaVWRGT1p3T284cVc4OSttRG9O?=
 =?utf-8?B?cGVMd2NuM1VISy9tdXk5cEFNVHJhTndFTDEvV01wa2JxMHU2R29hQTd5bEdh?=
 =?utf-8?B?dVZUZ1A0OUV1cXh3Vytxcjd6RWYzdGFKeFoyRWVDOGk4Y0hyZWFQMDd0Mk8x?=
 =?utf-8?B?eVE5ck54V3d4b0JnQWF6Y25oUlkzczg3MDlwU0dqZUtERTIyYlNoc3dPb3pR?=
 =?utf-8?B?SWVpa0dHSnZSQTY2b1ZTVHQ3R2kzVDlFNHNobEk5anRYSCtaWmtGTFp1N3BR?=
 =?utf-8?B?a2dwNEdUQjlLUk5YYnhoZ0E5ZXBCeXY0N2tPandDenVQRGs4aHplMlN1elM3?=
 =?utf-8?B?WjNJWkhKNmNOV2ZEanFGcjJqWXp6dXhVc3lETmhsTnEzYjFmWlYxeG5MSmZW?=
 =?utf-8?B?dnA2dzFjUUN1cG5XTkowWGhiYmhCbmZwZ0pNaktyTExWWjNBdnJ1ajJpcmNy?=
 =?utf-8?B?ek9uYVBiWUlNSmcxdHgrRno3V1VQYnNWRitRcXIwMStHUHdTd3ZldDFWV0o3?=
 =?utf-8?B?c21FN2QxcUVXN3NxNTBOY05xaHpGeDh5SW5TM0JTbktPejJXcE9VMDJlV09p?=
 =?utf-8?B?VHRFQStpUW5Db1Uvc0xPeUhTQ2g0aEg2cTZVT1pFVDZQWUlpT2RyT2F2WlV5?=
 =?utf-8?B?WW10cmFhbEhWUjdlVXpaTTRHWnRFQnVqQUYxNjlrVVRIK1pSZWJpeUVwZktO?=
 =?utf-8?B?Q2ZMMXpGR09sK3h2VlpPZnQ4TlM2d3NvQXVndmFYMkVHQUs4VmpPd3oySDAr?=
 =?utf-8?B?VXd2VXJLQU52YVlrdFFZMU1LT0t4QWl2Zmx2aEdhOUVHS2FTV2tzZHJFN29F?=
 =?utf-8?B?QlFrS1cvd0ZtZ2RRT2tvR1FVdURzS3RSMDlvUU9xdmhOY0d4QUhIVWVSQ2wy?=
 =?utf-8?B?RDl3ZVJGNWl5WlVjNENOK2NPemoxaFY2SWxDWUt0SlhTdXZRSHhWZDFtSytC?=
 =?utf-8?B?WGVoOWloL1JzWHYyTVhtZ0I1UTNpMVdhdm9TSHZnZTRETGtCamthaThjRDJJ?=
 =?utf-8?B?U21JRzJqQ3ljVFBoSUU0Mm5YV1IxR0V5Y0kzV1ljZW40R28zMXdzUEdranNn?=
 =?utf-8?B?a0orUjlrTmFEUXE0VXVmSFl4bXJQQm9mZGh5NUw0eHJCMG9iWmx0SE4xYVcr?=
 =?utf-8?B?T3M3bWU1a1dFQUx6dWd2Y2FybDNmOWxtdFE2MFh0WlpFREdvZkZOaCtVOWt1?=
 =?utf-8?B?MDVVYi9VZlA3ZWJoOGo2OGMzaUExbzMwSTBJRjBjSjNOcmxuZ1NVYWVKbXBI?=
 =?utf-8?B?c0NxZ1crMnN5TlppVi9SMlFsUHZxeHJvUVhUdFhucTY4QnMvak5HNURBR2ZX?=
 =?utf-8?B?S25pc1AzSU5aUU83NFlnVkNyS2NxQWFKKzJWOXk0RFpNci82T1l0NUpEK0VQ?=
 =?utf-8?B?MytXREpFQ2dDeFdBV0NsSlRLOWc2OUdnMitiT05VaHJoNVowdTRnTzZmVWF0?=
 =?utf-8?B?SjNPT2NwVFovaUc1QWN2eWduZy83MFY4bzI5YVEzdkR5cHJPT3NIdTk3OENM?=
 =?utf-8?B?SVNNUTUxa29DQk11ZUJHVHpWU0ZPWWF1UlBVWWI1MllVUjdhU3ZWV3dVSUNk?=
 =?utf-8?B?dXNsZFFVQ3h0VTh2dUMrUHVpUkRSYi83c0xVVThlOHkyanpUVU5FbCtxaE50?=
 =?utf-8?B?SytsNG5ETUdyRTgvSk0wQUFBbEpSUkc2MWM3dlpBNFpoMlVJODdzNHoxOGRw?=
 =?utf-8?B?b3NTektnR2VGdkhaWmxXQzFycDR3d0pUTHZaYkE5M1hiQVhkTlpOMDA0eTly?=
 =?utf-8?B?ZFpTWCtOODhvUXBRYllmdG43M0p5ZFpRNzFCRXhwc2ZCaTlVZVlZUUdhYVhm?=
 =?utf-8?B?K3Qrd1dMWHhSTGpadCthK0FiQVFaQjdEMXR2YjQwRDdLTDJiVVdtNGFHeEs3?=
 =?utf-8?B?RUxBb3cwUmtwTTk5SkZQNEhPMEJLVVM5R2ZyZXNkNXU5cU5iQnQ1K0JEd08x?=
 =?utf-8?Q?9xUocVWRuQu1MkzGhT8Su3PaS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b136ad-87cf-46f1-c6dc-08db7ede8e4f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 11:37:34.1107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: denJIuUFc1Oo4Ypu20Bd0ZWlhyrrBXrVco/Ej9UqmZz8WqiZZRuN1XBHAd6Y7P5AD7ZnYUbhsI+N0qheQg86mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021

Hi Jan,

On 30/03/2023 07:55, Jan Beulich wrote:
> On 29.03.2023 16:35, Ayan Kumar Halder wrote:
>> Please let me know if the below patch looks fine.
> Apart from the comments below there may be formatting issues, which
> I can't sensibly comment on when the patch was mangled by your mailer
> anyway. (Which in turn is why it is generally better to properly send
> a new version, rather than replying with kind-of-a-new-version on an
> earlier thread.)
>
> Additionally, up front: I'm sorry for the extra requests, but I'm
> afraid to sensibly make the changes you want to make some things need
> sorting first, to avoid extending pre-existing clumsiness. This is
> irrespective of the present state of things clearly not being your
> fault.
>
>> @@ -1235,6 +1235,8 @@ pci_uart_config(struct ns16550 *uart, bool_t
>> skip_amt, unsigned int idx)
>>                    /* MMIO based */
>>                    if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
>>                    {
>> +                    uint64_t pci_uart_io_base;
>> +
>>                        pci_conf_write32(PCI_SBDF(0, b, d, f),
>>                                         PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
>>                        len = pci_conf_read32(PCI_SBDF(0, b, d, f),
>> @@ -1259,8 +1261,17 @@ pci_uart_config(struct ns16550 *uart, bool_t
>> skip_amt, unsigned int idx)
>>                        else
>>                            size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>
>> -                    uart->io_base = ((u64)bar_64 << 32) |
>> -                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
>> +                    pci_uart_io_base = ((uint64_t)bar_64 << 32) |
>> +                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
>> +
>> +                    /* Truncation detected while converting to paddr_t */
>> +                    if ( pci_uart_io_base != (paddr_t)pci_uart_io_base )
>> +                    {
>> +                        printk("ERROR: Truncation detected for io_base
>> address");
>> +                        return -EINVAL;
>> +                    }
> Further down the function returns -1, so here you assume EINVAL != 1.
> Such assumptions (and mixing of value spaces) is generally not a good
> idea. Since there are other issues (see below), maybe you really want
> to add a prereq patch addressing those? That would include changing the
> "return -1" to either "return 1" or making it use some sensible and
> properly distinguishable errno value.
>
>> @@ -1519,20 +1530,40 @@ static bool __init parse_positional(struct
>> ns16550 *uart, char **str)
>>    #ifdef CONFIG_HAS_PCI
>>            if ( strncmp(conf, "pci", 3) == 0 )
>>            {
>> -            if ( pci_uart_config(uart, 1/* skip AMT */, uart -
>> ns16550_com) )
>> +            int ret;
>> +
>> +            ret = pci_uart_config(uart, 1/* skip AMT */, uart -
>> ns16550_com);
>> +
>> +            if ( ret == -EINVAL )
>> +                return false;
>> +            else if ( ret )
>>                    return true;
> With skip_amt != 0 the function presently can only return 0. You're
> therefore converting pre-existing dead code to another form of dead
> code. Otoh (and as, I think, previously indicated) ...
>
>> +
>>                conf += 3;
>>            }
>>            else if ( strncmp(conf, "amt", 3) == 0 )
>>            {
>> -            if ( pci_uart_config(uart, 0, uart - ns16550_com) )
>> +            int ret = pci_uart_config(uart, 0, uart - ns16550_com);
>> +
>> +            if ( ret == -EINVAL )
>> +                return false;
>> +            else if ( ret )
>>                    return true;
> ... the equivalent of this in parse_namevalue_pairs() not checking
> the return value is bogus. But it is further bogus that the case
> where skip_amt has passed 1 for it sets dev_set to true
> unconditionally, i.e. even when no device was found. IOW I also
> question the correctness of the final "return 0" in pci_uart_config().
> I looks to me as if this wants to be a skip_amt-independent
> "return -ENODEV". skip_amt would only control whether uart->io_base is
> restored before returning (leaving aside the question of why that is).

I have sent out a patch to fix the return logic pci_uart_config()

[PATCH v1] xen/drivers: ns16550: Fix the return logic for pci_uart_config()

Let me know if I understood you correctly.

- Ayan

>
> Jan

