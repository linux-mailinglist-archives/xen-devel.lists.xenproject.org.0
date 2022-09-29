Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345835EF507
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413719.657546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsQu-00089H-N2; Thu, 29 Sep 2022 12:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413719.657546; Thu, 29 Sep 2022 12:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsQu-00087W-Jq; Thu, 29 Sep 2022 12:14:28 +0000
Received: by outflank-mailman (input) for mailman id 413719;
 Thu, 29 Sep 2022 12:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odsQt-00087Q-8I
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:14:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e2d33f1-3ff0-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 14:14:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7826.eurprd04.prod.outlook.com (2603:10a6:20b:234::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 12:14:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 12:14:21 +0000
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
X-Inumbo-ID: 3e2d33f1-3ff0-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMOfPDvj4j/8z0LjBPkgBj6Xm5VfC46Rw3IDDmYOg1M+Dzdt5BpOURS7yBE4NVd/FCKEbsCFAY4v0SE0+hbZzHFGU1OhxKg76B0zOiyfpCqKyhN5cLtrNh1ijKoGei5Uv54c70i8N/E2JMPn7k0xRhzhF4fq9buENGK+ItWlJTcwrYtP0DldsaMEL3U5okl98BW8hnMqp1rLLJ7CXuZsmOYfU9xtWslhgdsMVpVR6EEVLaVqpxI57v7HM08jTNuNtPEfQAFn4TPBCr+O8NSqeCfz/2V22cReqkEP07QWKoJHkMNFCPIcBTM+tRiEjhB/0hZ1hEXNFPuQi16nJ3R9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDU6tXQT2buWFt9FYQoSuPAwWiJbHddAM8qHfvetIcg=;
 b=oewFvrelCFVyPVHDNQ9Gs8O+aC900vBLOdP1sk0FAPZ8y7uyl0R/2kXMIcXW/0703Qcc1ecc3dmYeoeSCM6j3b4wNKKrzZqB+cCNfPrGAsDSKTAabiIYmV1Ae7NUgPHmS+UCz2RyrCVWv4NYvpWgQDz+YhmhByZTec3+Fkf0M68vJuVMQvfocpUmvv7RiBuC9dWRW/I0k8J2kM3m9gwsx6twz61Ga3QEjLGURx30vJ0oJIoZAlgHBCV2l/RYJLLLSREiE2EU0n8Bh3FQ8ZYa5SVVzhLIPm5araWHjK2Ot3o2sfg7ioWfFxLBKIazf5Y4jcMKTEiHhTbqgU+Gc8FVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDU6tXQT2buWFt9FYQoSuPAwWiJbHddAM8qHfvetIcg=;
 b=ByZlflqj3fatG1lKPmfh1J3iyNiF3IdWMzKq9U+f80+6B/8suPUd3dgjE1JHyA9Ipc7UdGpPYHCjRcInKTcQhUFcbMG3SjbYMykIOWaQZ75UqCID1oKDxTG9xDbcqbmFrtfhfjC3QEXScrfCSf5SGodXX5OcGCHQu4XR2TeXjdL1BadLKDPFplgb6sfYcv9KmY5AI3NIhYcz8Q9CGGDKKe5wG9IZu+D+SWlR3csSUF0GsIJC0t034lWOqrdApB86+KSOa5zd+KDgolQqyt19eJCuEyw70wtGmxj3uQR/GO+K9WzCr1GjIj3wgbV8L441teMC89QlcRk9qT25wG27pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce60f432-fed5-0fbb-c544-36b767c22130@suse.com>
Date: Thu, 29 Sep 2022 14:14:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-3-wei.chen@arm.com>
 <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
 <72691b9b-761e-a89b-97df-afd5cf0ddebb@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <72691b9b-761e-a89b-97df-afd5cf0ddebb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: c662ee49-b7af-4ca4-4a29-08daa214241c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sPagWQKikqSYtln1SNTiFLECvrlFfhBAKVGJbJmf7M590+Ln/W9alAlLSaffzZTw31AvBvoN6mFUHepDiBoJpS9lzrMWPkkJozET5fDAP4PdA1NCEAtrghcy5Xo0JKcz+buSEvEDJgRnK7tW8QdMbsq//O9yrW4H8XmL39/WiVE/PW/ptNgreAb8lILPDuNOHNMAvaWghrzXe/KpqJdsgd/DldH2qLnaPQuu6tPxTAV22T1CjENGb89iIJnoGz2nEjICl8ng0G54rLaYdft1Ritm6lLvG8tsc33oyEgeHs42aCRFhvRxiJGeHjcshRk4rd/UZxlpp3DDtKFBBM2YPjyHArVXAVWaDtxnYhRbuQurXRMjJZb9UUxAkIuzxiJPdr/0LBVUOj2BQmtGEJrQqeen/UAAHsKX9Eo6SJ4YB7MBiqQIprt8v76hj73Nqc/TQIhlrYBhaMU4yTzu/k2IGq9JMIIHNj6bavnesMlTYkAdvRcPXX9jMQUuRM+tf4msvX4UnK4sIspadeJbdLUwMXfrGjCCaZi4GsFrAyLMrqZYx/ASyq+wPtwej2uBm2VUn5fNIOup/fddhEinG5fyPOWYaqKVnq+374Ghk2DkMnWBwsMgd+aYaiW7/u7nHfFjkKEopL6VQeKXBrm3Y2iwwYGg5TIzKViDsdLEjE2y8vZOC3LpJJxEOGWBwaEEoqu9VbhQ0G8wUjnAoczRGQkTrwAEEmERs4E31q7norW0V26+UUWB/05jztGZBly1MtN0u9RZjJr8j+SYDnDvLI8fxT1VfWnGFkaHCemrTvE9YQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199015)(316002)(6916009)(54906003)(86362001)(41300700001)(31696002)(8936002)(2616005)(186003)(5660300002)(66946007)(66476007)(66556008)(36756003)(4326008)(8676002)(53546011)(2906002)(6506007)(6512007)(26005)(83380400001)(6486002)(31686004)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cExoMnZmcDJLOEVuY2E0MzI0V05CUDl5dnF6R0RtWVVmU05WRzkvNTJHVXk1?=
 =?utf-8?B?dFFPMUwzTmw2ckUzalVodGVqRDA3MlZ2WHh6MUlOTXJaZ1ZzVUNUeDZwT0lW?=
 =?utf-8?B?eThTcW9ObU5HMXA1YWZuQlo5b01Gd0N6K2MvRUs5ay9GM21DTTc5cVI1Uisr?=
 =?utf-8?B?TmhnNC80MVNING9FUTR2YU9lOFZyNWNuMy9RNjREZWMrbDZvZlRwZEJJU2cr?=
 =?utf-8?B?UFVEdjBmRTVLYnFUaTV3cFZQbXJ3aTV3QWs0Vi9BeDJkcUtZeFhHcnBGbUQv?=
 =?utf-8?B?S2V6RllYUFhJSmE3RGZxYnVETjFuUnJwM0dtcW9xMFQ0MkFONFVwdkVoVGpM?=
 =?utf-8?B?Zlcwd1YwVms3YTZWK3M0cXcxQXA1KzRGSzkxSm9yQXJqdGh3Tkl4NlFyZ3Q4?=
 =?utf-8?B?M3k1K1IzSkdxRFd2YzlHLzdDVEVBaXU2dHVickJxcnlrMkhkNHg5L2IyZGk4?=
 =?utf-8?B?cW1PcDBoaVNrR1piYzYwWjlDQW0xTUVIN0c5aW9wNzJSMzF5cjg4N01NcmZU?=
 =?utf-8?B?OHdTMjRZUEF1VnY4b21zZ0VPNmUzTTdmc0ZIbkZkR3lRb2oycHRCajFLRCtE?=
 =?utf-8?B?aWpjdXJTS1VsbGxoak11K1Rxbnhob3k1SzIrdVhZc2RSOEtWM3ZjK3ZxNUc1?=
 =?utf-8?B?Q0QxVDZBS2lqWFZkRDFQSTZ2dW1TTU1scUtRalQ1M21acGFvdzdTSnpEbkI2?=
 =?utf-8?B?OFNiNUlKVElieXovK043eUJoUGkzM0FKVjc4UXBQRkowZ3JUTVdPcU95ZTJa?=
 =?utf-8?B?dGlwZ1lqOFhUcFlSM2lQODVZV0VyMjl4SUpiV0h5UGJjWTY5U0xGNnJ3cmU3?=
 =?utf-8?B?elhIR2VmVUdmc0hZSnAxeDc0Q0YzY0FXdXFRM2NTQzRTUXNjZmI5Qkx0Q3JH?=
 =?utf-8?B?ZGJEUENVVDYyV3Uwek9MdHhsRjlTUFBaVmhuQW9hTVVlSHY4d2NwUUhsZ1lr?=
 =?utf-8?B?YkhtK1JGTlB6ZGE0bGp1bm9NWTNLWEtZS1lOWTdOclFDdmkrTEVnWjI1Z1Vl?=
 =?utf-8?B?ZlQxcURudFdqSXZ1UXpRTTFUS0haSW5Bamk3dlpqWVRWU01wQUtuazZUcFN0?=
 =?utf-8?B?VFlqUEYxSUlLWVpHQWZuM2lJb0ZaQ3NLQUIzd0xKWkVNUUtOYm42VCt0ZmZP?=
 =?utf-8?B?ZUd6ZURHTDRZK3lQbmxkdm9YdW9JRStHZHZLYyttbXU3Yno1WitpVkdPWnMy?=
 =?utf-8?B?ajZiM090N0hsRXR3eGNrQXlzUE5PZ0U4NlllR2h1aWFWd0poTWJrNkZ2ZWsx?=
 =?utf-8?B?QXBFYm1CYjFjdWs2TEhjQWVDWXJSZUZoU1R4MTJXb0RvV0JNRVNaS1F3Vmkz?=
 =?utf-8?B?Z002RE9odE1tbEprRmhNdkZERFNuQm5TRmlOTUx5VkRhN2ZuSXB0cjlsMC9a?=
 =?utf-8?B?bVJTOFBvNmZsTTI4c3E5K081NElOTHgycHVJTUVuSlU1ZUJsWFNkc2xxQyt6?=
 =?utf-8?B?bFV6TXVUdTZFSzQ1UU9yT3k0cTlVT1dtVEVYZGJzUnBFWnBHOTJESkZKV3c3?=
 =?utf-8?B?ekhQTEVMVGZMUTNGWFduYkRXcWRVY25McVE3aHVWSkp5elFyM25zNTRtWlRD?=
 =?utf-8?B?amw5TUpxdjhDeGpKYnV1M1JwSzlQd1BVclo2UWpKQkVDQis2ZFltaDZBZlk5?=
 =?utf-8?B?Z1FaZHdTYkFpaFZKb2U5aFMwRVA0cmZiL3FPbm1lZUNlREUzcVlQM3hQWko1?=
 =?utf-8?B?NUNqTkNVZ2ZyZVBaTE8vRFJwbnRQaHZXUEMxa1prRmc0RDFUdlh0c3JUVU91?=
 =?utf-8?B?ZzQ5TnllUXR5cVhuaGoyRzR4QWFCQ0FUckNJYldIOHptMFJIZk9qMW5wU1NE?=
 =?utf-8?B?SHFTZ2NqbHRzT0RteEdWdE5Mb1dFOWN1MzdZdFF1Nyt5MldFVnRiNkNDWGxy?=
 =?utf-8?B?NkVpVUMzVUp2cGc4T1BqVmR0anpTb2RlYlcxQ0k5UStmMVhMQVR1Q2J6SjZP?=
 =?utf-8?B?WEZRdmh4bmhzanVjcStaMmFYNlgwT1dCSngzK3lISVpvODNGU2ZacURwUTdP?=
 =?utf-8?B?cEl2RHI2d3JNMmhkc08rdC9BZXRFUWtxeGxsYVpoUm9Nczg1YWcwZTBHRnRq?=
 =?utf-8?B?Z2l1VXZLU0JMdkdYZDZPeHhOOXZjdUI1NjRaVE1ST0Qwa1VIQVpTa3oyRjBs?=
 =?utf-8?Q?+wtvWDZtIFocc4CThfAhUMRRP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c662ee49-b7af-4ca4-4a29-08daa214241c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:14:21.6632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTZk7JX6XFmOfJDjagAG8bC3cIUoL05E36VNQDXchbmEuhiKzcFZYVXjjlCR82NRtz94s86h/8OMwIZM8kEufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7826

On 29.09.2022 09:43, Wei Chen wrote:
> On 2022/9/27 16:19, Jan Beulich wrote:
>> On 20.09.2022 11:12, Wei Chen wrote:
>>> +        nodes_used++;
>>> +        if ( epdx > memtop )
>>> +            memtop = epdx;
>>> +    }
>>> +
>>> +    if ( nodes_used <= 1 )
>>> +        i = BITS_PER_LONG - 1;
>>
>> Is this actually going to be correct for all architectures? Aiui
>> Arm64 has only up to 48 physical address bits, but what about an
>> architecture allowing the use of all 64 bits? I think at the very
>> least we want BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG) here.
>>
> 
> Ok I will add above BUILD_BUG_ON. And I also have question why can't
> we use PADDR_BITS here directly?

Well, if you used PADDR_BITS, then you would use it without subtracting
1, and you'd be in trouble again when PADDR_BITS == BITS_PER_LONG. What
may be possible to do instead of BUILD_BUG_ON() is

    if ( nodes_used <= 1 )
        i = min(PADDR_BITS, BITS_PER_LONG - 1);

>>> +    else
>>> +        i = find_first_bit(&bitfield, sizeof(unsigned long) * 8);
>>> +
>>> +    memnodemapsize = (memtop >> i) + 1;
>>
>> Again perhaps the subject of a separate patch: Isn't there an off-by-1
>> mistake here? memtop is the maximum of all epdx-es, which are
>> calculated to be the first PDX following the region. Hence I'd expect
>>
>>      memnodemapsize = ((memtop - 1) >> i) + 1;
>>
>> here. I guess I'll make patches for both issues, which you may then
>> need to re-base over.
>>
> 
> Thanks, I will wait your patches.

Already sent out yesterday.

>>> +static void cf_check dump_numa(unsigned char key)
>>> +{
>>> +    s_time_t now = NOW();
>>> +    unsigned int i, j, n;
>>> +    struct domain *d;
>>> +    const struct page_info *page;
>>> +    unsigned int page_num_node[MAX_NUMNODES];
>>> +    const struct vnuma_info *vnuma;
>>> +
>>> +    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
>>> +           now);
>>> +
>>> +    for_each_online_node ( i )
>>> +    {
>>> +        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
>>> +
>>> +        printk("NODE%u start->%lu size->%lu free->%lu\n",
>>> +               i, node_start_pfn(i), node_spanned_pages(i),
>>> +               avail_node_heap_pages(i));
>>> +        /* Sanity check phys_to_nid() */
>>> +        if ( phys_to_nid(pa) != i )
>>> +            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
>>> +                   pa, phys_to_nid(pa), i);
>>> +    }
>>> +
>>> +    j = cpumask_first(&cpu_online_map);
>>> +    n = 0;
>>> +    for_each_online_cpu ( i )
>>> +    {
>>> +        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
>>> +        {
>>> +            if ( n > 1 )
>>> +                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
>>> +            else
>>> +                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
>>> +            j = i;
>>> +            n = 1;
>>> +        }
>>> +        else
>>> +            ++n;
>>> +    }
>>> +    if ( n > 1 )
>>> +        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
>>> +    else
>>> +        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
>>> +
>>> +    rcu_read_lock(&domlist_read_lock);
>>> +
>>> +    printk("Memory location of each domain:\n");
>>> +    for_each_domain ( d )
>>> +    {
>>> +        process_pending_softirqs();
>>> +
>>> +        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
>>> +
>>> +        for_each_online_node ( i )
>>> +            page_num_node[i] = 0;
>>
>> I'd be inclined to suggest to use memset() here, but I won't insist
>> on you doing this "on the fly". Along with this would likely go the
>> request to limit the scope of page_num_node[] (and then perhaps also
>> vnuma and page).
>>
> 
> memset for page_num_node makes sense, I will do it before 
> for_each_domain ( d ).

That won't be right - array elements need clearing on every iteration.
Plus ...

> About limit the scope, did you mean, we should move:
> 
> "const struct page_info *page;
> unsigned int page_num_node[MAX_NUMNODES];
> const struct vnuma_info *vnuma;"
> 
> to the block of for_each_domain ( d )?

... this limiting of scope (yes to your question) would also conflict
with the movement you suggest. It is actually (among other things)
such a mistaken movement which the more narrow scope is intended to
prevent.

Jan

