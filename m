Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD6739866
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 09:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553303.863784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCF3f-0005lN-6T; Thu, 22 Jun 2023 07:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553303.863784; Thu, 22 Jun 2023 07:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCF3f-0005jb-2S; Thu, 22 Jun 2023 07:48:47 +0000
Received: by outflank-mailman (input) for mailman id 553303;
 Thu, 22 Jun 2023 07:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCF3e-0005jV-2E
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 07:48:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36728ef7-10d1-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 09:48:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9352.eurprd04.prod.outlook.com (2603:10a6:102:2b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 07:48:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 07:48:14 +0000
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
X-Inumbo-ID: 36728ef7-10d1-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcnJn6BmKUpDjHw5dacMu2q6q6uM8IOQKluRFsdy9LrovnM9mPlI/WSt5Cx4diEWsaHd8AxEf+0355+vTblQlEgCUwNLTeIcT0TcZXc+Ddid3JoPrH9jmm+8k2G4wMKyMwnmXB/DzOR0qhycrVLr//l3IJOoEVL5kk4VHaHbgAwAOTg13uKLmFpTNwH1uniFCv9nO6R8A63OjoW0E90QL95MT27YUA8+XByl8RTDT7/Wij1cw1yGLSeu5p5H8JPbfvzv3Bp0nSYjWBhaghHQyHrOQx2HKMs9PCL6KW4DL1RSb9RK8o6xpmLS8UiD4BKwc5f9s0NEIk/wmg39pyYAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz9y1Ju8Yka5CwlcdKDt/cwdP3CvIvtD/8JF4fnSVas=;
 b=R/JojIJdoF8yrWSw1qHP2dr7mfuXd69g16wXAJUXafxiIRMDolDNm3hIsNkVGFaiMvaqnqbvnJjgNjcp6ruWLdvm3QwA7ZWoHLrvzQPksjsTWWVhlRsEfeIsPOVRzQZ0+5SBKFJxBQKoueHaDsvEFUQ3e3UKY+UroA5DDIMnvrP5iMazl1cTCmqCdKFEgi1c80SNWVcXGWoPJ4NWi3eZts34mqRc77oYap8VPP3eI8HnIoZO09is6ynIk/nyxSlhg2Vrd0+Tiu0sqKGVHjWWqvPaE+xBhqvarQFLFRdCj88nrxEMNQqwTz0H0BL1hpKmRC5eYKuQGiDMDO3s/VmMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz9y1Ju8Yka5CwlcdKDt/cwdP3CvIvtD/8JF4fnSVas=;
 b=T6qk4e14Ipw3r2Llj6IU/HjNEgCerXnf0SJNNBzodRSM4gd1v7EDUa0aa56STIaIU4w1YsufDNDiQKru7hq16Zt2ypDNIt5af6mDvnYOUtlDcl64wCEOzeHmOpNx2BuIJ5dUKTsH9up1hSewajtL2MAtx4UruQIEdYDQCZyWEb4FIZh2URMjd0/Qhh2TJ9Dr86dtmqB3C30r9BiW/e1aP8mr10wA96EAONoIIcuUDeld9VMohCaD8Sq7NInfvjoPLlie/WPhQoJoSRfswgXMfXMOkVV2JwMvBNP6b3xB8ex9d75h1L5V9lFr/cX1yDg4XvgDeuwVuYXrKfri6GNThw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e880c72e-58cc-91c1-4630-f0ce9dca3a89@suse.com>
Date: Thu, 22 Jun 2023 09:48:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <fcde45a6-9da8-4dfd-83cc-cd03e05a68bd@amd.com> <875y7p9ia2.fsf@epam.com>
 <ca2b82aa-0910-d065-a6b1-9e3105b33380@suse.com> <87v8fgo48c.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87v8fgo48c.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a547f0-22ea-4ab9-cc11-08db72f508a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDFLJlW+tpDw4VGcvwseUwZcYcHjKPMQU546zSkxk2VlQoasYGPibw0oefKZqKhHP8ao1SQjmRHHZwt6/fMpx7P1pDdhDI5vjyADSGBASFFOugqO7bmUrlsu1sAjvd9mXzytHbE9TaHj/tMN6lxX2rCO8NM2hEbzs/AATGU3C9ymrqGECcLmHdj5AMsmlKnYEFB+oJYxb88zjGMilO9EAZ7AkojIFt0cqnjdZ2mJuWbox0xIVMzZ/W8Q6ldPmyISDaXdLVk27/kU6ddS/JZBEDJA8VZmx/XqOO5tLFCKWpW2fHoWV2AkMezBmJ5ayGpKUPegyQoaBPDmbtW7mSmbO1mGul5qQCh7KUURVTsm1r37FKXZnP6jxb05athJqijteW5zQyXDTNAKajMbEBlNkATRPbsOzJxgSM02RYsAOrnhrcdzeACCsWGwFS96T2W7OtCbRFNA5pvhuOUTXXQMfOqL5Jdy3CiLtbJSy9PWZXgUHwuJduA6D/M+rv/9ULuJXYSPymX7lTNvYZgI2MClYYg/bMv0tYs71m/cq3Bdb2H5xnXATDdltU/jUwHNAIcAyeDOzLmtRyUZJV2DMZwHOy/qPrmei/Vd/yJu+udi8jSVTp0ocbpulZGgFCxVyWxzIW7b0qzTu0mIZtL/HYcpdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(31686004)(966005)(5660300002)(7416002)(2906002)(53546011)(6506007)(26005)(6512007)(8676002)(186003)(8936002)(41300700001)(2616005)(83380400001)(36756003)(478600001)(38100700002)(86362001)(66476007)(316002)(66946007)(66556008)(4326008)(6916009)(54906003)(6486002)(31696002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWQzQ0NvTndvS2hYeUVxRXF1TExyS2ZlMzZlcHhZRXZ4SldvT1hMeTVYSXpR?=
 =?utf-8?B?KzJjL2ptWStVMWk5UDBoWndtbERwb2k0RHdwa1FQYisrRVE3R3hDbEdoZ3pC?=
 =?utf-8?B?bUJUVHRiQndpVUFJNWNFM1NpUTd6NFZ6R3F2TEx3aVIxL2lqdHRpV254SkFW?=
 =?utf-8?B?blFIaG4wL2NnS2M1RitMbE5rcVpxSVpDdlZ4ZVhuZDY1WWt5KzFUMFd4K3ND?=
 =?utf-8?B?UVBvV2ZETGhJT1M2QTlBa3A2d3FQblkzWGZNenE2cUdINkpSd2lRS0FPVjRT?=
 =?utf-8?B?ZEh0eUZ3VFIwZDdGbnJ1NnNSQUx6aE9sRU9sa29HaXdVcnIyR1dxNnlXVEg4?=
 =?utf-8?B?ckFHOXgrQWR0M3JGeUduUWRTV3lxRDQ3OUhUazlEcGUrTHUwQllFSGJyYWlE?=
 =?utf-8?B?ZjhMbnB0dzhaSXFaODFnYUh0MThYM0FxdkJRdCttekpLTjhrbGtTZW9jeHpH?=
 =?utf-8?B?RE1JdkNQYmJZeVdzc0ovbEZzLzVFVit5N2NuNC9MaUcrMXlvR0l6UkFodnIy?=
 =?utf-8?B?Ylc3b2ZaSnYrME0zaWNEb1lIaGRtbStabEVOSUZhZmx4anBGSmtuL2IvdHp1?=
 =?utf-8?B?d1BSaCt3cFBIY0Y5S1BWMFRCeHhkdGlFUHNHT09KcUo1bUNzbEFFa2NFUVUz?=
 =?utf-8?B?QnRWRmdBTmsxT2VJeGJkazVvUUY1L3VUTXBnaHVvREtaQmExMDQxTjAxdmZE?=
 =?utf-8?B?ckQ3UWV4U1pFMkxzblpNWmQ1R0RXRXhpZXVSRnd5ZHp1RVpTS3RRZWhiZFVO?=
 =?utf-8?B?Mmoyd1hlVnE5RmYwd1NKbDRUNHk4bmduY3M2LzU0KzYvVFdSeXpEVG5ZZVJh?=
 =?utf-8?B?UC9yQWZJbjlGR0tFTEdBRlJJL0xVMGU4Z3BNblBwNzJkMVdrRDV2TThOczky?=
 =?utf-8?B?N0JSY2ZjQlY1WkhuL2FnaEZnd0JkRndobDVqYU95OWhBUERveHFGdGxnRGk3?=
 =?utf-8?B?NFFSUWlGVVBQbXE3dlN1SGtPZENCSmFkUU8yNy9iYkphNVhPbVpsV3BLaUNs?=
 =?utf-8?B?YWJTV01QR1IwVmxJd25SemVEUjY3dCtXQXd0dDh6LzBoVEVYMGFsSWZXMHNG?=
 =?utf-8?B?aWtWU1lMMFlIRHpOZXpHZDUrazJBbG85UEZuTEJtNHJ2NnlpM1BwTitEOUkv?=
 =?utf-8?B?bzcvSHA2RWJQdlg1a0hkWHNIVVg2VXBCYmVmZjBpTHdrV1lRNTNBS0lPdjBv?=
 =?utf-8?B?aXpIWkYxZ3RZQmNtSitNQjEwcm45bzhBSUpDM1kzQU1TbThYVlgrZ0lrQTlM?=
 =?utf-8?B?TG9rYUdqTXAyM2xlN0grSkd1TFMrMW1RM0dCSGJMNjA5RlVIbDFxRDNKc2J1?=
 =?utf-8?B?aGNRbkN3cHpCZEc4b1BGZmV0RXZGOHFNWkwzQnVCSHF3K3Fjd25tQ1pNWVFq?=
 =?utf-8?B?Y3A4T0dMdVB2U09PVXNaRGZTd1lkNkl5VXU3NWlNSDJOZkpiMzJGUHlFSVpo?=
 =?utf-8?B?eDRqT2JaTzR3VUFEbFM0ZGxaZk4xdEpKdVdTY3F6YldDVFhneGNVS0FSY2I0?=
 =?utf-8?B?L1NJalRsT01KaHhnaEk1RTFiVGYwVThqaFBBSkNMUjZLRlFSZlBYeDJ0bmw5?=
 =?utf-8?B?MnlYZlVlWFo3QUJyVTRKZGo3VmUwRlViNWE0TWhWUTE0cCtNcW8vSWxhWEVD?=
 =?utf-8?B?dWhoaFZhQUlreXcxMkd1dVBkV3lvbEtWQy8wbE9la0M2eDRsUGJzMmtBV2s5?=
 =?utf-8?B?NEhtRUE3OUQ0eXRvWVduWCt6SzlabmFmbUxIb1Budis0Z2hCYUMxS0NJblEw?=
 =?utf-8?B?UXM1VG5KRUtkanVRdmFNSnFrV0c4MitramN1YjRrK0h4SUNUQ0VBUldxR3ox?=
 =?utf-8?B?QW1jUGZrTCtobWN6ZUNKeHViYTJyWWFmcXlkeWJrYUFuQXBzbVMyT3liN3Qr?=
 =?utf-8?B?T3hGeDVsam5FMnk0UHFtTlJpcDQxcGhDYlF4cUdEcXU0b1hqRTh6eHJoano4?=
 =?utf-8?B?U2RydHhOM3hOOTlPb0ZIbzJ0SEQ1WXdpOUtERUIyTGx5WktJM3FEUjViOVJ6?=
 =?utf-8?B?Ky9CcklZWHFRdzNFVlFGQlJRMXAyTzdJTTJueDVDRzQ1SjBqTVJzdWJaUFhJ?=
 =?utf-8?B?dStzR2VkZ0JqNEZCbFk4UU5uTXM3aDBCR3ZSQnNTSEhJcURMNVd5anVndlll?=
 =?utf-8?Q?SdvWZpcn8EGsLzMj8YZCkB4gm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a547f0-22ea-4ab9-cc11-08db72f508a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 07:48:14.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdM4LUst9DBAlq8Zh6cU5q3hdNinCGLgO0Lms5Ji2Sr4mZ//QbAYVUfNcjVl/19aPTlfQsYC1bqJgp97x99thA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9352

On 22.06.2023 00:11, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 15.06.2023 11:39, Volodymyr Babchuk wrote:
>>> Stewart Hildebrand <stewart.hildebrand@amd.com> writes:
>>>> On 6/13/23 06:32, Volodymyr Babchuk wrote:
>>>>> Hello,
>>>>>
>>>>> This is another another version of vPCI rework (previous one can be
>>>>> found at [1]). The biggest change is how vPCI locking is done. This
>>>>> series uses per-domain vPCI rwlock.
>>>>>
>>>>> Note that this series does not include my work on reference counting
>>>>> for PCI devices because this counting does not resolve isses we are
>>>>> having for vPCI. While it is (maybe) nice to have PCI refcounting, it
>>>>> does not moves us towards PCI on ARM.
>>>>>
>>>>>
>>>>> [1]
>>>>> https://urldefense.com/v3/__https://lore.kernel.org/all/20220204063459.680961-1-andr2000@gmail.com/__;!!GF_29dbcQIUBPA!0BUqPos1zFKUoPwbKLLwKItNgBVPaBgxmH1Y6zXpms2bngrlWrzB-qMNvIaiAy2WSWMa93UrlvRi0ijYP8X4Ymx07GXYPO1W$
>>>>> [lore[.]kernel[.]org]
>>>>
>>>> Thanks for sending this!
>>>>
>>>> Should this be v8? I see v7 at [2].
>>>
>>> Oops, my bad. 
>>>
>>>> I had to rewind my xen.git back to 67c28bfc5245 for this series to apply cleanly (just before ee045f3a4a6d "vpci/header: cope with devices not having vpci allocated").
>>>
>>> I rebased this series onto staging about two weeks ago. Looks like
>>> there was new changes into the PCI code after that.
>>>
>>> Should I send a new, real v8 which is rebased onto current staging, or
>>> we'll wait for review for the current set of patches?
>>
>> Please send a version which, at least at the time of posting, actually
>> applies. Taking into account Stewart's observation on the version
>> number makes it even more desirable to have a re-post.
> 
> I am terribly sorry about version mishmash. But Roger made valuable
> comments for the first patch already.
> 
> So I'll post the updated version with an additional lock and other
> fixes. Should it be v8 or v9 in that case?

I don't think that matters, unless you have v8 changelog entries already
which were posted with the 2nd v7. Otherwise all that's relevant is that
the version be clearly distinguishable from earlier ones.

Jan

