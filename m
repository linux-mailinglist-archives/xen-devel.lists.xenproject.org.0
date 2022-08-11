Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497C4590058
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 17:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384716.620153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAJN-0001N6-Ek; Thu, 11 Aug 2022 15:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384716.620153; Thu, 11 Aug 2022 15:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMAJN-0001Ki-BV; Thu, 11 Aug 2022 15:41:29 +0000
Received: by outflank-mailman (input) for mailman id 384716;
 Thu, 11 Aug 2022 15:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMAJL-0001Kc-8U
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 15:41:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ef0205d-198c-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 17:41:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6075.eurprd04.prod.outlook.com (2603:10a6:10:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Thu, 11 Aug
 2022 15:41:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 15:41:21 +0000
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
X-Inumbo-ID: 0ef0205d-198c-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBMgLq1IcmSU14wCM2dYe5uxA867opay3GXQbYkc6uumiaNJcFO0Tdcz4TT+SeV7tvUjO4pLB++bXo+xCr8L2yQankwRFcp6hQ3A7gf9US2yZl5JrItrBPFTxzaByQrQEyOYKWFsjyuxHymjRzHudP+I6h7PTq3nVZ/iWELvKdPULSrVS/QO+ptZ7JQdDNqjgBUolIiJnLSuPEBcb+cDR7polKbypMSHddG3gfpBzdNz8ABmeKB2zyBkJ5wfVRFEf/n6fDAPSPslUA4GFEdwQeC91DP5FLKy8vYBi/OJoy9x2v8eUUkSP/vDlwt4YfWaU2I17Khb/typ7qINZOaxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BosLsCCq9eIrx2KkN1hwHB+r3NvIpTzBNuy0p7LarpA=;
 b=CAdYLoOthXIFx5vXSKNw6aIiaU/IaMJCBG4lWSvzovFitCrRNUcPpVpi3GfxJ5KM+sFmMN4cczrfJ8gH9HW+mcyujbhBr8qWzMWPwfCoocADNV63gHq5IUTW6VnbT1WB1CDbQb8q5xJZoYKZLogWntiMEKXrjF26QrcIM8BjeqkE7M/UsB2vvY0nQchnt1C0I9UwysdfohJfYwZxReOYPLZy6JHmY3quZkuNB8iQ3QLrmn9qSOxlRWOkZGR0pswB/2+hOSmppyEkW6dFKuWs+uKDVHUNCTsJArsVi3lD1CyzOqcJJR6HkBcGpVSIM9TSKyu9TSsYuJp9U21Bs1ql4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BosLsCCq9eIrx2KkN1hwHB+r3NvIpTzBNuy0p7LarpA=;
 b=mTP1lvmmjoDLoxgmieGQs1zFEqpaVBmEAgNXbwwFmE8DqCR13U53B+BJu139qx/Cl1lXvgzLf1gaRfQUiC7SIkE7ZLZPdoMt22KuLNpEhgnJINpv+GIpRF8GWvJr+DP7H4Qofk3Ve6hu4JijHqQnbn3nJlIJN0j0MDau/TTMWGopKc6+wpLcvKL65IOSNKAuPGgNeaygvLkW0g4jtl21HbcZ3ZtKcQP23TURS0X70tHpc6JjRIo+yHBGCwPYAGodIarAQ0iQM+ig3SOgCBWNgZDqvfq4R33puzh+rDoCLF896dV5rWYkAFS/mPi5oeGGoYdh91J5rBwzZIvsj+Vv6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <014bd92f-c2ad-820c-7dcd-5ec8cdcd6bf4@suse.com>
Date: Thu, 11 Aug 2022 17:41:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] PCI: fold pci_get_pdev{,_by_domain}()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <0bdd4f3f-965a-fe39-f7af-d8a40b7a68c6@suse.com>
 <48eee228-f7fa-5932-ac93-03cf70de01e8@citrix.com>
 <2ab93940-89c3-1316-a1a4-22daa09f96fd@suse.com>
 <5b11f7b9-7264-0797-0aa5-20a988a04bc8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5b11f7b9-7264-0797-0aa5-20a988a04bc8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 244530bb-4a0c-4f99-a879-08da7baff09d
X-MS-TrafficTypeDiagnostic: DBBPR04MB6075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EUJbF9GwS+Xn/TAvnYnSfkRqLR/T0b9X3ZS8CAfqaC57enz0Ip+zpg0DYnWTq3SlmARQlbOglhmzmL6db1FK7ArVwkDoqVFxe5e280YZTqmxS4S5Ge0TnBVpUXJzcNdniythY+ey6cNi20T+KADhxZZtWt6EMMIEkstRUd4I4McviMWF3FC+YH1q60rOAxUpuPvXAnxhSn9OeOIUuovrJEnZ9sNJ//uFQEAUv+GH1/aPRUHWieEQNq/51rt8OXMw2UdryeIVBfNPwgfwR7aYuZfRyPHte1HW2LNVbgEukkykVlbPpJnjR2LdS8iQivi1JpE/0f3ylqbpYMftCB7Sj7NjqiHpKGRhOifZtmAyvtooEgpSVsqLAGuCmqIFiSRqHMRNBal3kk5MPhzsyNqI0m5MAI02qhd6z6Kosw/WhYz3726MjwzRdASeZ/AvU3NqEIpFCheUkqnBecOOkjSlYBOi1bFLwO63lZugm8GRJqmhijizBPRqmQ0hmlSu1OhflzoTAttiMeGxjXo5nCtFR+SnYYPU1FN861BFHEFSVVW+ZmoydtSQaA7f+EHDhLNIXJX4fRjoRM9BnUmw39CxjySpb7lfK6srdUYx+REHv9l+7J6W6yujV1RLT+qsv41mjQcRon54Efq82aSD8i70ugRunXTdNwi/teYNWAQJIb8deyaXfn+Vwv4XfumY0uvPV1U3TvfjdHNcmrMPOxsvBebrLrI6I+GxcighrXdShUkAYQx2wpbMzD7XQyX1hwWZlD25NpaoBPCpD1abZaqZY6SyYJlSRGAxurzdUHeNxyBj3P4B5tvEG9UI0xTUALLzzUr+vli9PtqPM9p6mQqSEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39860400002)(2906002)(53546011)(6506007)(6512007)(2616005)(38100700002)(26005)(41300700001)(36756003)(8676002)(6486002)(4326008)(66556008)(66476007)(8936002)(186003)(316002)(6916009)(31686004)(86362001)(478600001)(66946007)(54906003)(31696002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU1lczNCV1BGN1ZFUVRCNVVLYk1JZENqZDFTUFZ2Ky9HVm9vaDlYbDFGN3BY?=
 =?utf-8?B?RzkrTUdSRFRSVGUzODN1dzRBOVg0T2loN1dCdnAxYkd0OUVQUy9LT1BGV3Vz?=
 =?utf-8?B?Q3JjUU5xVTh5eXJDQ0JERmpNSFFOeFIvZXRXSmxmR0lBdmxuME43a2JSRkZr?=
 =?utf-8?B?by8rSU1qRDlZQjV3T1VvV3B4bWZGbnFvQUE0SHZHNktFcVpRR1hPa1Z6bThZ?=
 =?utf-8?B?cGcydEFUTVFPZTNrZWNlaXZIUzhUbnB6TzVlK2IxSDFTd3ZsWkExZmExaFFG?=
 =?utf-8?B?aUVFMm1UQUw1Ykp4eEwyM05OVnhsaGFTQUpQWXN0WUF5TmNMcEc5M1VFTmJi?=
 =?utf-8?B?K3dybkJxTVlBWlpCVythSVB5azZqemgwWXpvUFNQMkhKOWdnd0hkdUNrQXhG?=
 =?utf-8?B?TXhadHBnUFFkUVowNUhLMXBLdXk3c0R6dnpzakJhYVpZRlU1QVJicmdycEM2?=
 =?utf-8?B?K205cEUzWWt0QVoyRUVNWVZHdVNmWUNlZmthQlNtTnNpaGNIdUh1cmxJTVVK?=
 =?utf-8?B?Y25uWk5HL1pPT3NQSURBTDRoREhMWnlYSFlhdE92QjV4LzhDdTdkQVBKQUxj?=
 =?utf-8?B?Um5BTnhXelIxdHJ1aUhHUUtmSDdzcUlvUFZXS2NGZHlMMlNaK2I4eTlKL0t5?=
 =?utf-8?B?MGVVcUtJZzMrSThWcmdyYXJ5RktKS2FFWkZ3YWFNei9LTmFMQk83M25BK0Nu?=
 =?utf-8?B?REpWR21zVWRvN0FZQWlNK1ZnSXBPWTI2aUVFWUllV3RtMTkyNytVTXFGOTJC?=
 =?utf-8?B?dlh1dGtsV2JYYmtUU3pnYW9iQi83TllBMFVlWVE4bVhLTzNoblAxTjVIZzJJ?=
 =?utf-8?B?RnJnR2p1ampPVFdpY3dkelZiaFpIYVIvR0NPU2drc1F6aUFBNTlLd0VKZnVY?=
 =?utf-8?B?NFlPTWxHUE1Hb2xxTlIrSFRlakhmT1hVT1ZoR0Rxa295b1lJS1RRb1VMemVa?=
 =?utf-8?B?eGFkNS93cU05Z3JHbk9ydWpkVVptUFNWTXF3dHdHcWZadUowRVV2YTlybXlm?=
 =?utf-8?B?dnVSSnAxaTgwblRYUWJKbWowT2NjcVluUXpzd2ZKR0EzR0crUityRSt5bTIy?=
 =?utf-8?B?MEtHcWk5ZjR1VWIvVFVvbUU0bFZRaW93TmNRaWl5OEI4UVNkYjVqREFDMjVj?=
 =?utf-8?B?cjNJLyttYkV5aTA5bGlWTWFPb2t6NWhWbDNPajV0N01GVGhxR3VrRitrcHJS?=
 =?utf-8?B?dCtMRTBUSGNneGxtelplNG5oVlJzelZ2SXJhN1ptUHNjV0xhNzVMeU1abGx4?=
 =?utf-8?B?a2FYZ2ZlbFhXek9COGZIYVBkaDBpR0ZwTXd0eDBpRWRMbzhqUUdSQWZOUWZW?=
 =?utf-8?B?bUcvd1dxSHV2bmxiRnVRZThJRDc5c3E5WlBCV1g0QjlrSG9UUlhHN0k0SG9v?=
 =?utf-8?B?QVNiSjRzUmVlS0VTODU4OUttazByR2lCWUl0OHJ3VEFpQitBL1BDS00wUWpI?=
 =?utf-8?B?Q1JueS9DTkpodmRNTVpobVozY3JHcTA4VU1MMVFIYTVtVllQdmxNb0RDV1Jt?=
 =?utf-8?B?MkFCYlhGQTBwdFh2OXRidmFrM3hUdDhnSHM3T3ZlaXlQQ0ZCT2tRUmlUZHJx?=
 =?utf-8?B?S0tEcWgvUjFDYVJYbTF6QzJKMmVTV3N1amdPamNJS3VrZjRlQmY2TU5PNDlj?=
 =?utf-8?B?ZkgzYWhKNCs5ZVpVVTZqTXN1L1pMVG0zMFAzKy9RWVNyU1VrTUxpWXh1VnY2?=
 =?utf-8?B?RDNsNy9Dbzc0ZGM2blJwUGNBVHhTOVNhZzNCR3FVQ1VxOWlCblR1M2s4TzM1?=
 =?utf-8?B?RW95QXdrMzN5bVlTVXNuaW1QNW4yWHpWTklvUlBBa3AvUTVSaHVGeDlFLzNH?=
 =?utf-8?B?dlhEaTdtN2prZnY5YXlnK0dqMmIrYThIR1psUGxuMHdJOUk2WVd0Y3hDcmZt?=
 =?utf-8?B?aVRJM1U0WnBKY2VxRW9ablNpSE00TUV0S1VhcUsycElseml0dUx0YlRyaisx?=
 =?utf-8?B?SUR0STRoMXVmMkdHSTBiK0pBNldaekxKeVh3dFJ3cW1rTCtRVW1yK2MrcnpQ?=
 =?utf-8?B?U0lVQVlnYkxkWHlIeTV0alRkckJ0QU9PemFyaTlnWDR3UUNKYklWOXl2TDhk?=
 =?utf-8?B?RmU4RkwyeTV2RzB6aTVHQmVOUW0vNHZkTmZHbHRGSWZoOG82MG1LZWxDNzBn?=
 =?utf-8?Q?XEivpOXJ0NbKyUMWwp39Twfo6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244530bb-4a0c-4f99-a879-08da7baff09d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:41:21.4110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvu72vzPzgsERyAVsrmajScqXloyEy6UFCibihf1N83TJA9zmKx+1JcZ1uKgg8id2hHtVbrcKICig30FEqnUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6075

On 11.08.2022 17:09, Andrew Cooper wrote:
> On 11/08/2022 14:26, Jan Beulich wrote:
>> On 11.08.2022 15:21, Andrew Cooper wrote:
>>> On 11/08/2022 11:52, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/irq.c
>>>> +++ b/xen/arch/x86/irq.c
>>>> @@ -2162,7 +2162,7 @@ int map_domain_pirq(
>>>>          if ( !cpu_has_apic )
>>>>              goto done;
>>>>  
>>>> -        pdev = pci_get_pdev_by_domain(d, msi->seg, msi->bus, msi->devfn);
>>>> +        pdev = pci_get_pdev(d, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
>>> Oh, I should really have read this patch before trying to do the sbdf
>>> conversion in patch 1.
>>>
>>> However, it occurs to me that this:
>>>
>>> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
>>> index 117379318f2c..6f0ab845017c 100644
>>> --- a/xen/arch/x86/include/asm/msi.h
>>> +++ b/xen/arch/x86/include/asm/msi.h
>>> @@ -59,9 +59,14 @@
>>>  #define FIX_MSIX_MAX_PAGES              512
>>>  
>>>  struct msi_info {
>>> -    u16 seg;
>>> -    u8 bus;
>>> -    u8 devfn;
>>> +    union {
>>> +        struct {
>>> +            u8 devfn;
>>> +            u8 bus;
>>> +            u16 seg;
>>> +        };
>>> +        pci_sbdf_t sbdf;
>>> +    };
>>>      int irq;
>>>      int entry_nr;
>>>      uint64_t table_base;
>>>
>>> will simplify several hunks in this patch, because you can just pass
>>> msi->sbdf rather than reconstructing it by reversing 32 bits worth of
>>> data from their in-memory representation.
>> No, I'm strictly against introducing a 2nd instance of such aliasing
>> (we already have one in struct pci_dev, and that's bad enough). There
>> could be _only_ an "sbdf" field here, yes, but that'll have knock-on
>> effects elsewhere, so wants to be a separate change. And there are far
>> more places where imo we'll want to use pci_sbdf_t.
> 
> What's the likelihood of getting to that before 4.17 goes out?

Well, I can try to get to making a patch tomorrow, just in time to meet
the submission deadline. But that's not really a promise ...

Jan

> I'd prefer to see it fixed, and obviously even more conversion to sbdf_t
> is better.
> 
> Basically, I'm happy for the conversion to not be in this patch, as long
> it's not going to get forgotten.
> 
> ~Andrew


