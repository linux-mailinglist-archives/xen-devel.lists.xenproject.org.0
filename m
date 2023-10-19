Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCD87CF429
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619058.963601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPUu-0004Hh-Bc; Thu, 19 Oct 2023 09:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619058.963601; Thu, 19 Oct 2023 09:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPUu-0004EY-8Z; Thu, 19 Oct 2023 09:39:20 +0000
Received: by outflank-mailman (input) for mailman id 619058;
 Thu, 19 Oct 2023 09:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPUs-0004ES-Gm
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:39:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e7a6a30-6e63-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:39:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7242.eurprd04.prod.outlook.com (2603:10a6:102:91::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 09:39:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:39:13 +0000
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
X-Inumbo-ID: 5e7a6a30-6e63-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4sR/8XZ4Qh5lR1yPNMl1aVgUEFjP6mhXb4x9XoJGBvcwkemJHu/3H9syW8HOLUqM29qEFEXagPhwjpJ1VOtBovTov/3g5O9N70t90cIeRqfoYCQ4DGFhDqgPndPf/uwfDMpL+EtrcTWfavID8RUHBI2sZxHUV/dz8PYxbyPbJJgdyCRZsJZUnNHkSuMY/Vwv4Rg/iIxTdV7z7ObDEiQ/InrooLLuzhvENOLlDNXAR6cdb1pBbBbdkxRUwF1HV7oEHX9lpu7H5RMjJyh0lYsJlL5e+gy2mjnDpkMVpcL62Il4i7MROsDSncoQAiX8j3053WDqu+6ML2K436z3OdUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qm88oEBNO0LiB1sEOG6JScxDgICrDIMAREiLW/pv+O4=;
 b=GRl7N53aIoPWmEUcO/g3m37DdRl8LmjIuiPx2KIL8XUcHTZTDKDIBwMR1aUAAZ4swGPJwEPrnvBLtl8Q3zwdbiiWK1UpfIoFPJTIRTauljoIl3EvdjD/YDPYXp97mxuJXPL7xNtgZq9edmqp8cPQkixMPbGF4c6DoMS7aYDyffuNXLO8Yl6HcNlf4j7LJBMXTOtTiwiXQI2WncsKDxfTMIGQYb0WPjt6ahEz1WPDmQ71mymmfZ55CE+WA5W+ETcGGUxDiNo4DX9KuDq+sPNw/tRqwQ4pyNkuNZCjHorJ8Bz97LqwW1SbLVNHZs7hW/AFV6OWztmvy3y7Kd6XuTbDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm88oEBNO0LiB1sEOG6JScxDgICrDIMAREiLW/pv+O4=;
 b=txDeDWqSNkEzyt8UFdVQpgDVj3LBIjHara6n2/M1eTUdXYoMt453HnV8ejTYmQ1qpmcnLfOp1HzSRztrtwB/8GYtrq1P3rFz6i3Ng0Uo/9JJjphf42+wgT3KfCbmz/ITHql6SlSE/QHDeK2mrezhL/5FO9omB9xBGoUnNcidPVLHnxO7OWUXSObfZJ0t1EGJkeXeG5jq5yzPyHOfirrxQDQs1LdJ0+sGWem5/thPL0NWIe4E9RDzDZExpT+l0u7reX34JV23kITV1ob8A9TiqaSIGFa5jkP/+lClCGixyBrGduc9oR0p70XI4mZTyI07iYOYAjyoD6/5HR1XXvS8+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2efe4ba4-e94c-a5fd-008c-df8e0dc661b5@suse.com>
Date: Thu, 19 Oct 2023 11:39:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 00/13] xen/spinlock: make recursive spinlocks a
 dedicated type
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: javi.merino@cloud.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231013094224.7060-1-jgross@suse.com>
 <c86cb866-b795-b6af-0ad7-38e68c7d35c4@suse.com>
 <5f0cecef-8600-40b7-8e59-77d8e33750a7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5f0cecef-8600-40b7-8e59-77d8e33750a7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: ddecb520-dba5-4810-656b-08dbd087410f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cZ5jPD6kbimM3cFKw9vAKJTVxHyyHA1eaJW68pBk6u5pqMMxqacAFinMTlgN/+T5ilrTFpjncD6zFVxncw+HaIr8uFM5mIqb6cY2X5C34xPIUGb8BBz99bLl11ewIOwOnCXgO4friv5UF48FXa+8m024pkKOIKQyJQaRjSPn++YWtOosGi+eyucc7DPAEsAhgfIBHwwf2FehUr0l9AYNv34L599vwy73OZuqeT8ly68Jly/kGqf5lFuUHQNYvLm0QuSQVUh3n7Mv4Tz/essO0AALgkeyxim8lLs1rB0rS2B835LEhJZlVCw2VCpZVXcdqKwASN+7hcFf+f++ZTB/0SQREAq6LBUEdSUiqzCisX+0mKJH14rsSrnU7sVZ4RwVpMoWlhQ2mHOQuz/2EwoUfUDCXY6Naddj78rV1dj73k1OUMprJQkqrJkT418XJs6Ys3L7D2SAVTc64B/kkma2zUQHDGJFZZHpDUFEc56D1PmXv0ICYiGem7iiE87keS/SaWYStF9UzF+HMBnrpKsEbonzflwg7HQzwlXg5B2ZUGXoGiP9+xF/lEwamFcWWv9qdlwjrqqlUivhOSeF92B2npboByMTXlEx/zip1eypHo7Csd9oEYn1eSssHeg4Ip7RYL9gZtsWmAEuI3VHc+lJQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(107886003)(2616005)(6512007)(6506007)(26005)(53546011)(83380400001)(41300700001)(4326008)(5660300002)(7416002)(8676002)(6486002)(8936002)(2906002)(478600001)(54906003)(6916009)(66946007)(66556008)(66476007)(316002)(31696002)(86362001)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWp6SGxocmxxT0N6L01lOWNOWVFGcmdsWmtNbG9ucW1lUHZDWUhjaUcwWGxz?=
 =?utf-8?B?ZHJjZ2NXRUpuNGxoNTR1ZkVRL2d2MVpZYXdpcXJ4WlRJS0RwS0ttK1ZUR2U4?=
 =?utf-8?B?dUJDOU9lbktYcTVHYS9NVnlFcEhWMXZyYzhicXRNdEw5QmxqVHZOUEdUMyti?=
 =?utf-8?B?ZzVnOXR4R25OYU95SVZreVM1Z2lSUHhxWFlHV0FzQS90OWNuc1BUeGVtQWRh?=
 =?utf-8?B?UzdoWjI0NUZXMXpwQ2tKT3Nxd3l5dG80VVRlK0hNd2NMaWJFb0creHozdjZD?=
 =?utf-8?B?N2ovTG4wY29QNlNCOVIrdS9yMVFZQ21meGhJRm90STVrRlk4VlRiUjJjYmJU?=
 =?utf-8?B?TnRHdENrT3prU2E1RTI1dUVzbm1HQW5zYlgxNDFyeEEwSG80WEVrMmVhRUoy?=
 =?utf-8?B?b2pIQm1vZnNiRmRtcVVubzYzSy93bzkycUZLcU9sSlltejEwNmE1aExHVjJK?=
 =?utf-8?B?UStDSUdxdlF4Q1IzemhMQlMxc1psNXlZK2FLWkVjRDZMc3EzVU9meGZsMkRV?=
 =?utf-8?B?cnJPUWpuUHdqb2VKTTVoeHFjblp2S3M2OENsYVJ5OElwa25IV1U4S1VNcVZk?=
 =?utf-8?B?SDE3Tkp2d3N3UXhweHdSQW9mYVBmT2dxWE9qanlFMEsvVkx3K25aamM4azlN?=
 =?utf-8?B?dmNad3FOYTRFRjJqenlyWGF1QkhMVm83Wit0WHUxQWtSVFluUWRuaG1nZWl0?=
 =?utf-8?B?V0dKSjlsM2cxZ2F5TkUrRmVNMkRTWWVCa2paSS90eWlLZG9VSWY2d252UER2?=
 =?utf-8?B?NTl1UDdhUDkvNzlVQ3hVaDZ0SWpnTytSd28zcEhGQ293K1I5cnNybnYzaGls?=
 =?utf-8?B?SWhNTEtwa2N5M05mU3VodHU2MlZ1WFpJNmNUSHljN0VHTHBEY3hNL0FuZWdN?=
 =?utf-8?B?R1k2V1JrYW9zUDBYY2hTTGppQnZXbU5MdFlvMVdUS0hhTTQ0NkQyMGszRTBS?=
 =?utf-8?B?bDZncFRmY1JsV29wWGd6K0ZIUG44cU1zWVllWUVzVlFiTWFlVkN6b3pOeEJU?=
 =?utf-8?B?VGNrWkdsVnRaRVlMU29FcEFrNTFvaS9HYzBCSkVTWERiU21XR0NSWEpoQ3Uz?=
 =?utf-8?B?Z3U3elgvd1ViNlpvZ2YwU2VOa1c3VkQybVRSeDgyVEpYdnMwQ2htZkNrTHJV?=
 =?utf-8?B?VlE5bnd4MkVjVjVvRHV4WlJ6TXh6WVpydVpCaVk3UFNGMzRYUU56RjJQV2tx?=
 =?utf-8?B?V3JGR0Q2UWpvbGFYcnZMS2Z5cWs4WTE3TWdlenBKUXFqYkRsT3lkN1pveUdx?=
 =?utf-8?B?dkprdklyeWtHRW5ZSEdZUlRHdEdSRDlHM3dBZW5rOG53WENSRmVWUW9FWDlt?=
 =?utf-8?B?KzNHWEJmU2FuSDNGOFcvelh4aEMyUEFEdWIxZWJsMWswVnpybVpjdVFhbndF?=
 =?utf-8?B?WnJ5WGpKaUJlR2FodjNXdEE2cEhqZDJ6N2tDdGlUNngvWjBaK0NpUmxjamZH?=
 =?utf-8?B?RktmaGt4Z28vTVlHSE10SW83YVVCN2N5UkFsOWlMVHNkQ0RRM08zL1RzUEJG?=
 =?utf-8?B?ajk3TXBFT3YvV3gvSnVVWllkdEVoc3BVUGZtaFR1NTJtVGpUejhIb3lNTkFn?=
 =?utf-8?B?MGc4Mm9nbTg1UHROTUZkZFdXVVp3MjdmOHBnZFNaaUhwbjkvMnBZbWx0MlV5?=
 =?utf-8?B?NnpvY0VMZldOcU5YRzNBSE0vTSt4d1V3Y3VpcHo5bm0xZXMwNUk2Rm9qZVd5?=
 =?utf-8?B?RzBMS0FBL3RPc25IWk5OVFlzSUpEWDd0UFZEelM5SjF1MktUc2ZwNGZySnBX?=
 =?utf-8?B?czl3cU9ydGlvUlVnTkpWRE5aY2NRRkhhaWVHZDdROXpkdXVmbXdrUytJaWhQ?=
 =?utf-8?B?R3BDbGZpMyt6NjBrNlA1TE9abVBpcko5YWlpaE43MmRXWXA2WWlwTXFIclh1?=
 =?utf-8?B?ZkJ3QUFHbGg3STNrNk9JcFNoeEpDMFZtcWcrTTdrNlYvUFdCeEFtSEFrSHNH?=
 =?utf-8?B?WTVMb0pITFdmMkZOWTcwRm1NeGlRMFFyWnl5ZkQrdXNpR1YvVEYrR2lNeU5k?=
 =?utf-8?B?QUMraG9Fb3Vndmc3V1JNMGtYb1lsWHBZcThLdHRkakNmQnhmMTN6WXVnay82?=
 =?utf-8?B?UjVkenZmbUxtSzByNmZWWWdxdWpzbHFTMUJMT0RmdXNtaHA3UWltajl0dTlT?=
 =?utf-8?Q?At9ovItFeq+a3mYxAg9KPs6hT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddecb520-dba5-4810-656b-08dbd087410f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:39:13.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYOA5Hpz5dboWhQDETPphJvdJx1pQf07UVVesp9Qiei46BD6/GCeepDZdZYaPQYtw4GU+ZSzPe5DrCHXVoqZ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7242

On 19.10.2023 11:35, Andrew Cooper wrote:
> On 19/10/2023 8:48 am, Jan Beulich wrote:
>> On 13.10.2023 11:42, Juergen Gross wrote:
>>> Instead of being able to use normal spinlocks as recursive ones, too,
>>> make recursive spinlocks a special lock type.
>>>
>>> This will make the spinlock structure smaller in production builds and
>>> add type-safety.
>>>
>>> This allows to increase the maximum number of physical cpus from 8191
>>> to 65535 without increasing the size of the lock structure in production
>>> builds (the size of recursive spinlocks in debug builds will grow to
>>> 12 bytes due to that change).
>>>
>>> Changes in V2:
>>> - addressed comments by Jan Beulich
>>> - lots of additional cleanups
>>> - reorganized complete series
>>>
>>> Juergen Gross (13):
>>>   xen/spinlock: fix coding style issues
>>>   xen/spinlock: reduce lock profile ifdefs
>>>   xen/spinlock: make spinlock initializers more readable
>>>   xen/spinlock: introduce new type for recursive spinlocks
>>>   xen/spinlock: rename recursive lock functions
>>>   xen/spinlock: add rspin_[un]lock_irq[save|restore]()
>>>   xen/spinlock: make struct lock_profile rspinlock_t aware
>>>   xen/spinlock: add explicit non-recursive locking functions
>>>   xen/spinlock: add another function level
>>>   xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
>>>   xen/spinlock: split recursive spinlocks from normal ones
>>>   xen/spinlock: remove indirection through macros for spin_*() functions
>>>   xen/spinlock: support higher number of cpus
>> Before looking at patches 4 and onwards, I'd like us to settle on the future
>> of recursive locking in Xen, considering in particular Andrew's objections
>> to their use in the code base. If the plan was to eliminate them, I'd see
>> little point in reworking the infrastructure. I'd like to suggest that one
>> of us tries to remember to put this up as an agenda item for the next
>> Community Call. But of course the discussion can also happen right here; I
>> merely expect there might not be much of a reaction.
> 
> Actually, I consider this series an improvement.  The CPU limit is the
> most urgent problem to fix.
> 
> XenServer has just jumped to NR_CPUS=2k in order to support 2024's range
> of hardware, and it's only going to be a couple of years more before
> we're stuck given the current spinlocks.
> 
> I do genuinely think the code and logic would be better without
> recursive locks, but making that happen is going to be very invasive and
> complicated.
> 
> But in the meantime with spinlocks properly separated from recursive
> locks, it becomes easier IMO to dissuade the introduction of new cases
> while we unpick the existing ones.
> 
> And so what if we do end up deleting recursive locks in a few years
> time?  That's not an argument against doing this untangling now.

Of course if that was happening only in a few years time, the series
here is still worthwhile to have. My question was rather towards us
possibly eliminating recursive locks in the next release cycle.

Jan

