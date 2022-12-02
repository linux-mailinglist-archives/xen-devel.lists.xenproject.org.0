Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB866403C8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451744.709516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12hb-0008Uv-Tc; Fri, 02 Dec 2022 09:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451744.709516; Fri, 02 Dec 2022 09:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12hb-0008SO-QX; Fri, 02 Dec 2022 09:51:27 +0000
Received: by outflank-mailman (input) for mailman id 451744;
 Fri, 02 Dec 2022 09:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p12ha-0008RA-2T
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:51:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e212b473-7226-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 10:51:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7616.eurprd04.prod.outlook.com (2603:10a6:102:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 09:51:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:51:22 +0000
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
X-Inumbo-ID: e212b473-7226-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5qRQNYbjzF/xRNNVgGQhD4g1RkO+7nbGpU8QgdqirTMDFIbwnRaxyaNDMYZGZdWdwla38WrfNpDIMb6QJl/hLQb9th3sDXFifU8Bk36sBIVjYGWg39LzgdHALuOduxEJFT882cBMr/IwDyJ8Ku1PFxEY1RMejla4Cv7c509kOPgN21ZXjvibE2x4IoOSXyIoO/MTANLryBhkXTD5ckgNSPj+hi+2pytDiO4VBS9ijS1ZKWoWGsfFIl8S4wDfLN7PcF/e6pZF8dxnVTL/kIBGMweZw1jpIv9Ga4iSu1aRiwpFz48klyAFzPEVGHUahTqwa/Dt3vzf/f/w7JtjL3IIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnrYcpoi+EIwmNJI8pIVh+mWFl/EPyQUHosVtgDwBsA=;
 b=c6DpXJPPBD+DDmDOMrW1Qj86ZfrXY1ES3TIEAwbP3yWkP38ij3AFpIreRSI4J+W2tlF/oy47ixYIq1eFzk5fut2HqPzJOFPpehU6Mjf9SqF96p+C5XdzvCSTmY6u+LdlahcHCR749D8Yl/b7kG/ZYBGvAerpJd4kOfkMppBMBXC4MgGNS3qcJ2CCPqFrWcS3TAbyIPl+PSXumMbRmdYF5Vr1BJYTJRpKbCeTGCz5KH2pNFtMeS6guX1P3fuLZRA2LPbM18ZPyS5OepsVlThoiD0saSBCN/UaAW6qd23RB+tY4O42YzWldf2UN9YnDd2B+my5ytC3oWR1MBzf67lgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnrYcpoi+EIwmNJI8pIVh+mWFl/EPyQUHosVtgDwBsA=;
 b=sxGEEsm8P0z+g3qPlPB5vMpHGdAhzEknqia+Aky6/7aKBm/ejr5Vs3eKBXbhyoPp0UzR8BmlBI4zOV33MNwM5MHOo4fTekMcDuWNK5r5gxB7+D6wWq0R4WUFv1va53wiOZU+HOGFbQFn18xKEj7ytbOnKWEq6yf0nnJPFIFkbgDOwheYRedUfwdaIA92R9sU8I9HKnaybx1fLIMoYlkfkOgjgR/8KfVRVIXuOL5glRnhH2KFUPIKjD3GmMHTMW6+AtC6rTND0sPjnTtZgdoT/YAO5FtuPfiNwxRQKqzLDqrdO8RpyqPFge2R2kQFH9Gpw+l29p1g6iAQ6kKVftyVeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82bbfcf9-d3e5-f1d0-e930-9040f0fce8a4@suse.com>
Date: Fri, 2 Dec 2022 10:51:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v2] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used to
 shift "unsigned long"
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20221201181145.45279-1-ayan.kumar.halder@amd.com>
 <d0d974a8-d463-9362-8b6e-cda1691a3464@suse.com>
 <f431e6c5-5525-2029-81d7-3efdc418990b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f431e6c5-5525-2029-81d7-3efdc418990b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 002a5297-b571-4166-faaa-08dad44ac4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2THZ916yoeuWoWez49MPVx3QBPcy3NFXVD4HwCKVakL8WP+YuDziFyXCmfQsoXsLotrio3IGcZcEXl2XGHPA7Wirez1kxqx13EXi23GPn5bqQrfp/KafgEPq4fz9BPBAcR+rq+INxD1hDorA/aa1UfZets+z7dKoHZrlhErxraB+klLJ/g85AIy9SrCTbMkODSk/YDEwdR0tGl78EWg8AJ4c7LdjhWaODxmxAJ00ahdkBx73tPtpD57PbUoSnzoZ+SpVLWczraEJ9QRyAERTU+GXKpcu+wQr2VmyeSrxvEBUSla5eEfqnk9WkE/ngZieXbBz2dEGR6RTDq6TouDDupVXqBLd3XKlI+X01xArMoS4JMj/neEPI02SBPXGDZQQfzEuTLvWrPPzm4KYr4ZiR+EJDGh8tlllTS/8nqTFWUA6NJ5AyxfGKdHXHYiTqT0qAJfmvY7RzRRoGK6owdH3Wwte4TwdLnlMdIGnolhkrVZRrwqi9n+CgcANs3HgcfK+F5CtYuY5ekgc06ASgCuJwZ7e1/X7VP1R3f86Un9IbhK5JxroXkE9cIahlZzqFQvB2rYSLOyTqZopW7Q8MMUUw4iBzkT3WmEpmjuJgsFIqwzG+fhUJPpcyTKT58EOgh0MaZuEgEaVz9+bWxgdH1f6ConCRvbj3eKWWJfa2o+rsFd4dDfhSnWLkm6VLnkAKc8iPesBGdw48jZ3Jj6u98/avhpV1zJSocN4C7ATw0Vq2no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(2616005)(66556008)(6486002)(66946007)(316002)(66476007)(8676002)(4326008)(2906002)(186003)(38100700002)(36756003)(41300700001)(5660300002)(110136005)(8936002)(31686004)(26005)(31696002)(86362001)(478600001)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3hReGVkN0hlTFY5V0hvK1I3SGNEbWJ5UzdNbWdwVEh1QlBkWDBoQ1NQaHRF?=
 =?utf-8?B?ZkFGTW1SNjE0WlpOaVd3OS9lYTBjWGR6d0doU1RuZUpvcW5SWmh4M0VxSHZX?=
 =?utf-8?B?cmRZYjNEVjFHSzNrdjFrV0RINUFYL0x3dEJGSEl2eExKd2svODhPRk5WeXZh?=
 =?utf-8?B?V2xlQVNQMStib3RRdlRPUzdvekdWN2lERzRUK1J3RTA3WjZWOHAzUUVmQlVx?=
 =?utf-8?B?VTlOYlk3cjgrbmtMN2dwdG0rd0ZTU05lMDFLK2I2dHBvZTJIN1R2RzJyU3Nt?=
 =?utf-8?B?MFNJekVRdEthQzJNaEx4TG5LNzJvaFFiSUVlcjk0MU96RHN6NnZlT0hJZVdy?=
 =?utf-8?B?UEU1Yk9CbENKZ0tDM01aMEdSUjNTVlRIRTBDSWxCcWJINXA5V1ZVMEp1cTQw?=
 =?utf-8?B?OEk0TlhxMHdsTWRyMnE3L3dma3E0NjA4Qm1VM2gyTUl1RmRmcHVCRE5paEpU?=
 =?utf-8?B?T0k1UEt1eHlvbXZvTitmc2xBL0dqeTRicURNb1I1THlJUHpjbXNETmhYUkY5?=
 =?utf-8?B?VGdDai9scDlpZmE4eDJzSVgrWWxETjhCcmZyaTY3c3RpUEJlb0xtdVpzOGtQ?=
 =?utf-8?B?NkxtZmd6R1A4WG9JRDJ2VkFnN1Q1VlJNNXNad1F4ZEpSWWVSbXlSYy9yOVBH?=
 =?utf-8?B?M0g2LzFoNGgybjM2U2JBT2R6QTQ5SThPWU9GYUExWXNUK2cvcHhiaWk2UU4w?=
 =?utf-8?B?eHJXbEVNcmRxb3pHcngydHRxZ2tvVCtCdmJpTkEvRERUME9BQ08rTEo4dExP?=
 =?utf-8?B?bzVSbEROMUQvMXhxT1UxZUdhWXZGaHRkY2orbTJIMXlsMDFidWNVaUV3NVZZ?=
 =?utf-8?B?RU45Ukg5WkVwdTJCRlBrYlIyTEYvV1FpcTBOdWlRQ051UmFyYm5jN2lqWmFG?=
 =?utf-8?B?OFJZb1dEb3BXR2VUQWN6ZHVqTWtpV2RiTndpQmY0NVdhY21ncjd0Nno5dXlV?=
 =?utf-8?B?bGU5d2J1VmJwM1l4SU5FNGhkQVFNYWdHc0NhOFZwTHlOalRrMzIvODZtVzhj?=
 =?utf-8?B?elAxZEVXSG8zNDZFbUVPWGhNNE5tZHc2Q3NreU1DNU5PV2VGSW9SSUxUVDZi?=
 =?utf-8?B?MzR5Mkd1ZVp4ZFVXc2FUdkppN2JQajg2ZGNzWjB0d3Zua3hsbG9jRGd3RW5W?=
 =?utf-8?B?Q21POXdsZ0w5bkZVVDBXaFNzb0xyWXhGemxsQ21LVEJlLzZ2Rk4rQVQ0Ny9E?=
 =?utf-8?B?U282R1NhRUhScXlDaitqSEJUcHlFNlNkbFFqTC8yWldaVnlNaFFlSVBua0ly?=
 =?utf-8?B?TklzS2w1NThQVUFjVll1bUpTSU0rNFR0UEMzU01DK3doRGV5OGNDRzlIZVRl?=
 =?utf-8?B?NHovWUlUTS9Vb0VYNE92Ry9jYkZsSUZIY2l1QzJzeGIyS2tod3QyREtUd21D?=
 =?utf-8?B?QmJvcGIwdlFxZTlQTTZXZ3hEQWkvNmJZRnp6dXFIT3FsV1hrOGx3VUNacnQw?=
 =?utf-8?B?MFRIeUtsUWYvY04vSCtEek1uakhmTVJLaUhYOHlHMyt5TjRsYkZLVElhQXhS?=
 =?utf-8?B?VnZJR3BRQ2Z3SGtycVpWWVZmMnFsclE3Zm1UTGM5eG9SUVpYbWxvUDcvRnBU?=
 =?utf-8?B?bTFycGZYOUNVL3RiSWFlUDVjbHlFQWZZZUFqWXZSSUtYZTR1b0h5MWdSYURW?=
 =?utf-8?B?aEUwMUhjWjhUYXFMang4MnpEYXljWUF6UEN2SGt6aDRkbm9hRHlkYzlYV2Yy?=
 =?utf-8?B?aENPajdqdkU2b2NONTV1NUlUT1NGNENnLzJYVEdDZDRyZnk4UmRzV1NjSE1V?=
 =?utf-8?B?WTl3Q1VldFpjRWJFVUJBbjd0anE3Q0pxNmxnRFpOMnFzMk1pS2lEbFVPWDZE?=
 =?utf-8?B?VEVuVWtrVEV3ZzFwUUhPdC9ZTThXTFoxQWQzQjl4SS95T25qektCdXhHUCs2?=
 =?utf-8?B?cFJRMlV5OEtsVjVURHNrUlUvQWJQejJ6UlJybEZJWGJYRDV5Smhac1Fnekxn?=
 =?utf-8?B?eks1eFBGdlBYMWRjYXB1dkppME56QWl2OSt0YllzYTErMm41dnNwQmxQNitl?=
 =?utf-8?B?UW1nS0M3Ym5jRDVoQTlPZU4wdncwbk5pT1ZjZmVrUU1jNEF3OFkrYmI5TVQ3?=
 =?utf-8?B?SHZ1SFJvdGMrM1VNck40bXRGNkMxcC9vaDg2RFNWdkF0dGZOcjRWSkUzZzNq?=
 =?utf-8?Q?JjdYpTUroUhFDLl+uh66U9U3Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002a5297-b571-4166-faaa-08dad44ac4cb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 09:51:22.1967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lcFrUfDIJM/y/AUaiXHBJgYECiX4E1dw6zn32pzmLIZYKLMEjPLV6FTIIcxTSCu0yB/+j5gZAKvG3zYHA5WIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7616

On 02.12.2022 10:30, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 02/12/2022 08:31, Jan Beulich wrote:
>> On 01.12.2022 19:11, Ayan Kumar Halder wrote:
>>> Machine frame number (mfn) is used to represent the hardware page address.
>>> This is an unsigned long variable. We need to check if it can hold the complete
>>> range of hardware page addresses. To ensure this we check that the count of bits
>>> represented by 'unsigned long' added to the bit index of page size, should be
>>> less than the count of bits required to represent the maximum physical address.
>> I'm afraid I can't connect the description with ...
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>>   {
>>>       ASSERT(!first_node_initialised);
>>>       ASSERT(!xenheap_bits);
>>> -    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>>> +    BUILD_BUG_ON((PADDR_BITS - PAGE_SHIFT) >= BITS_PER_LONG);
>> ... the actual change made. Julien, when replying to v1, already gave
>> a clear hint what is relevant: The use of (xenheap_bits - PAGE_SHIFT)
>> in right hand operands of shift operators. As relevant is of course
>> the absence of uses directly as shift counts, which otherwise could
>> still be UB (and which iirc is why the adjustment by PAGE_SHIFT was
>> left out in the original check).
> 
> I could see the following uses of xenheap_bits in page_alloc.c
> 
> 1. init_node_heap()
> 
>                (!xenheap_bits ||
>                 !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> 
>                 (!xenheap_bits ||
>                 !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> 
> 2. In alloc_xenheap_pages()
> 
>      if ( xenheap_bits && (memflags >> _MEMF_bits) > xenheap_bits )
>          memflags &= ~MEMF_bits(~0U);
>      if ( !(memflags >> _MEMF_bits) )
>          memflags |= MEMF_bits(xenheap_bits);
> 
>  From what I see, whenever "xenheap_bits" is used as a right hand 
> operand of shift operator, it is always used as "(xenheap_bits - 
> PAGE_SHIFT)".
> 
> So, is it correct to say this :-
> 
> Ensure (xenheap_bits - PAGE_SHIFT) can be used as a rhs operand of a 
> shift operator
> 
> We want to ensure that "xenheap_bits - PAGE_SHIFT" is strictly less than 
> the number of bits to represent unsigned long as it is used a rhs 
> operand to shift mfn.

Yes. Plus, as said, it is also important to note that the value is never
used to shift an address (rather than a frame number), and going forward
then also shouldn't be (perhaps unless further precautions are taken).

Jan

