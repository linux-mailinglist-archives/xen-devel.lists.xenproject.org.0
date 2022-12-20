Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE88651C8E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466574.725474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YFi-0008AI-Hm; Tue, 20 Dec 2022 08:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466574.725474; Tue, 20 Dec 2022 08:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YFi-000882-Eg; Tue, 20 Dec 2022 08:45:34 +0000
Received: by outflank-mailman (input) for mailman id 466574;
 Tue, 20 Dec 2022 08:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7YFg-00087s-Oe
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:45:32 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9514112-8042-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:45:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8409.eurprd04.prod.outlook.com (2603:10a6:10:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 08:45:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 08:45:30 +0000
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
X-Inumbo-ID: a9514112-8042-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm1GiYoYe27E2zX3DDVJTKJJTcu7zlSiu8/KPmQf0XGKO+wzmLKFjLpLK5jgGaXgf99sMg9NXMMvzUDN9fq2wXe4wABclsLkmwzeCG5H2xKAUiegvyx7NjxjXUi0ipuqWbop0ZFJvr0q+/lGuofwo+8Ep0mVSMVbSeJR35S3YrCa5mqRuno8clQTlyBQB0vK45IZlI4brhXnVRlNNf1z/+RWpqn5w4t7bgDCgI+bVsL6DP1VN6PjdABFoA8Q3umAQKPYV29JKrSawPrHNOjjwlLGVw7DqulARUjWw3PmYKVbPBc4i2L0aMCHAdmqu7PVrBW1dkU6aC1ABUpnmUUPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE6tA7kXyTSra+PgEhnmQdQDP4peMDzI0mkHeoJ+oYQ=;
 b=WhSlySOSjgz8RZjHQSYabE2cHXxopAX6cw7Op48LZo/mivxZpv6ofwBuhMDeGbDj9hGjKkL0yhH2ykTR/ejHaxwracDlrxguxLJoQPscXj36/Wac914R6l8VgRQXhC4Q6O4QFPjZMpvbOOlyySMQ1pJZqpdK7URce8NJcfw9cm9t13F8IzduhVncLqwgOhh9s1U5p6+JbpS7ZtXdZeH1UHVU98+nsHehPoukH2SHU1Dy9hDCa4GKOEDNJmhcUb/ZF1aijbdlVUw4ukTV/kMYmwpEm2+hkw04Fd1BFo4SkXV5ieP3htE3UW4StW68CDp4PfClvuViNAMcCcxmvKRErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE6tA7kXyTSra+PgEhnmQdQDP4peMDzI0mkHeoJ+oYQ=;
 b=G+cZg9eP6iplg8lG8ERbinY6fkkEok75dvh4uEl48vzkONFM8f9LM1v7VTM/84tZEXrx1TJLDDv+8jBxBRULggh2VtPMZrU0c30kBoDmq7QlH8VKUGAt1pMjtMd2zqS2WQ8BZvUzsOIQTxgtBb0de/lJSUP4Tu9UDcpygB4C65YvW3lNc13MeNft7AeQUyQ6pQ65LeMwQVL1y8vja6rQ8Xfy2lO8WpPIUuDV1ILic0dkFgztrEMymhimZm9AGfmd46bQ6MNAjg/aRaP4CBe2BR1zpNM+2dY31twdy8hykZ4Vt65DZM/1c7U34wuWJutOf2tuVNGDYNTKzsrf/UMVTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9779d15-2f53-87c1-c4c4-745ac709430a@suse.com>
Date: Tue, 20 Dec 2022 09:45:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 04/10] domain: update GADDR based runstate guest area
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
 <33a84c2a-0c94-a62d-3754-4a61aa951c83@xen.org>
 <417c72f4-e9a0-e3cc-1c36-544967d73e34@suse.com>
 <45781a58-61cb-bc8c-c18d-35d054b4b06c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <45781a58-61cb-bc8c-c18d-35d054b4b06c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eed5b45-4a6d-48fa-7149-08dae2668c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OiIsUcCi2MObLvPQ0gFGAm+Rn6Un0Ptt0imHmrOcDllOtuAyiWIiMrFYKzGh0Nu53xVBokQs3os2YeAPtQNhlmKjYdG6L1cXm/CqzlASlITWA2onSEE49PO6I7sYAxkAn6ilUoGfAP2NP5sLW0+YiZSUhYlqxzl9lv0BFtP//SOKBRIHh7xMUDxVnfQJB8iSUxdyPXMUNCwkAWcCjnhUHoqLn/SvvoFiXNAoL7tBcc5NxfmhimqqietUg3q/RIfzu4HeOCx0qrnNht87cYXdX9Tg9G2S+MlvK/y2pv/koYvmi6QiTHhUyVKi76PLIXLkf+BnuA3ZYSnUHzCfGlnpgKEDnQMWhWME0vyGwjG0I8EkXgn9hDG61C3wMmWRO0tL/2lTO1aLHRqqmo0zLm5w3/8mE0D7BXMuHeajld5O8AhPy65PzHQc1p00JN0Y5Dr9wtNZ+bJqutSwhoCQLjet0fzZJ5d2jEUeDo6WHmqwZyd/zQ0/Wcup2vmin4oEJizKtSDvqphmr5Uw7tbztYYzcS7Qm/H0AF3UuFa/QOFHHdJibRaUFt+j4owyqydbLURxFJRm39bBZzuZOujv1IwjZ6OaUiA/YGy6RDFq6GPt6HqkPIUA3p94fKfdlE9AcbhWjFTpxnJTrHU00WaehbrIOncG1XdTZJfC84syT4gOevOsOrFxfO/If5gAH7QBoawUSr9IzY1kyX88JTmLzFOLcluDdxLdRRHWXllbtA19zn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199015)(2616005)(31686004)(86362001)(38100700002)(26005)(6512007)(2906002)(186003)(6506007)(478600001)(36756003)(6486002)(6916009)(8936002)(316002)(54906003)(53546011)(66556008)(31696002)(66946007)(66476007)(4326008)(41300700001)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2MyRFZsNHgrVW1xTmdqbnBCUW5UQnYwZjJabERnK2wzN1NSK3lBY0NVcnI2?=
 =?utf-8?B?cTZHWS80cWVHZE9oWFo5QzFlcXlMc2MyRHR3NzE5ZGVqQUFiWC9rZWV0Uncv?=
 =?utf-8?B?TXdjM2wwaXFaRDkyNjE4TmVVaEhUemdvMVdiRXIyUFA2VnNLSk45QXhNQzdm?=
 =?utf-8?B?aGxMaDM3ZGlmRmRLQnIxRnZDd1F5c2RQRVcwRTh1SElGMkMxWk5KdThMNDR4?=
 =?utf-8?B?YnYycTZvTnFkTEd6NW5Da0Q4T0JpTm41bXg5RkhMeWxsUDZHZXZ3UkRaR2xw?=
 =?utf-8?B?Z3F4K0J2NjhLS0loZlhRcUFSVVEvVjFUazFCT1A4UFpDT1dTRUZVMGNaRWpt?=
 =?utf-8?B?ZkRBR0FXbWVycUdONHpUb1E0a01FTnpubjdWWGtuVTMrdjkvVFVkZjFIbE8v?=
 =?utf-8?B?aThTUk1neVVTYWhQanR6SC9zdkRXMHF2RllER1dBTUduQkV6d2U4QXdVaWJK?=
 =?utf-8?B?NXhVem9WcjkzWHliR092ZXJIMWFMM0dLUmRtMGh0Zy93cW1hUWMzU012czNM?=
 =?utf-8?B?Nk9LVTdseXV5Q0NlL1FKUFlzVFRhdGZsR1ZBM2lMQTJPVkxLb1ZhNFp6REdp?=
 =?utf-8?B?S2ZuaUhGYkFEZktnWWxnOXYyejJKMEZBcmwwYy9uZFZlWlNSdlNBVnBiQlNY?=
 =?utf-8?B?alJLbldwRUtIWGxaK3Z2am1OYlpaYmt3c2dTMzhNMXRrdG5CYmJOMVF5ZXVF?=
 =?utf-8?B?eFBCMmlpRURnWG5SbGNXczNPb2t6c1U1Q293UkdnTzc2eU9OUU9saTFCa0tG?=
 =?utf-8?B?MnFXMDV4K1U4QXk1NXFOcytYb2xJOWdSS0lIc3RYR0lGM0JNc1pwSW4wbFc0?=
 =?utf-8?B?c3NWa0dERXUvdkFmd0NVVEZGZTRCNStheExWRUJuSERuemxGd1d3OWZLVStK?=
 =?utf-8?B?M3JyYnhXUk5zMkN1NGRPMGJRcGRxT0V4bXFtV01qdTltRlpqZUNvUHBia0ta?=
 =?utf-8?B?azdGRVYxZFJJK0JhOU9HcGkwc3E5WDI2RGM2bmp1MWJBZHVHL2MxWHBtdGJM?=
 =?utf-8?B?U1hTdXZKanZhcHAxQmlGK29yTWxiVndJZDd2dFNpTkhXa050VUN5UmtIUUsz?=
 =?utf-8?B?M2V5QWxMNkwxY2JrbFoxMWViSElXMWRFOTBWK0V4SXEwMTlkQk9aem5DdHZn?=
 =?utf-8?B?TTBnZlBFcS9ybVc4T2VhMWlJSS9WQ1oxV3p5aEFUVlowM1BFUGhPdDRsUmNt?=
 =?utf-8?B?Ym1JSnhuK2FwdTllT0lXS1lFc0FHemF1N2Ftd3puQWw0aDlMVFhITDFZMGRW?=
 =?utf-8?B?bnZucHVXdWRwNUthaS9qc3k2RzU4bXF6Mlp1YnZGUVhVZGQ4ZUZqeU1FM2Vr?=
 =?utf-8?B?aEVWRi91TWRhK1N1bFQ4UlJ1ZlF6aHBJbVp5USsxSit1L0tSbGQ3QmowL2li?=
 =?utf-8?B?RnAyaFFIOFVhcTlHM3JaN2p6OEluOUZEeXgzb2gyVmg5TXlIUEpLb0N6Sk52?=
 =?utf-8?B?YlVpT3E2NG1kSnkrTktxVW5hZWJ3MGJWV0VuUHlJZHF6Z2FYZDRvTzNzVnlS?=
 =?utf-8?B?QnlNbmUvaUwraEhpTm5sY3dkRk1tb3pCQ0NhNjlBaTduNGxkU2RTSVlBUVd2?=
 =?utf-8?B?Z2tuMWpBQmxocFZNeXQ5Ynd6VnN1ZFdYT3BPMHFYY0tkdXVOMmpVL29NVERI?=
 =?utf-8?B?ek5JZTY4YzQ3NTdKdGpjcldBeXhCU1g1dGJNbS90WE1wR3NKUWgxSHM5Snha?=
 =?utf-8?B?Rk1lTnZIMTIzN3dpaGh5QkZEZngvb1hNNk5EckxaRmd3enhqQW5tVFdCZ1kx?=
 =?utf-8?B?aTkyeGs1TjZJZjdhWEdmZWV1eGtrTHZHU3JJTCtXNlNEYlFrVE0wcGR6Mi9R?=
 =?utf-8?B?YWY1MEkrRFN2bGtYT1FJV09YWWZCT21MbHdSVytuZE1CUmYvRnlBNGtVamd6?=
 =?utf-8?B?NkFWTkVqMGZKaHpIY3lWdFhBcnovQUVmS0swREZFaDRWbHd5QWNGeHErYisv?=
 =?utf-8?B?dUcxdEw1Y21qWHJiT2NwT1ZEakRUaHk2T3QyNnQrTjMrWnVPUXVSNTRkbnAv?=
 =?utf-8?B?akplTDFOQkJUQ2FEdGpRUEFYK1h6aWVaUHVXWXE5ajk3OCtKbkZGQ1lXLzFZ?=
 =?utf-8?B?OVY3UW9pWEM2V1JqWVMwOFJoaW84UUlZbFgwWTVQclc2ckFiTnN3MXNTVk95?=
 =?utf-8?Q?R87eg9VXKGVTnM2dcn73Q9GRw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eed5b45-4a6d-48fa-7149-08dae2668c88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 08:45:29.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rATD+YhiT13RrErPgwcoAdiDDCkZO7vJZ7lNzcCnIsQlQ6dK0f7ETqNBAfqZjxx5EkoxvBOVAkDfVqK6CLiPhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8409

On 20.12.2022 09:40, Julien Grall wrote:
> On 19/12/2022 12:48, Jan Beulich wrote:
>> On 16.12.2022 13:26, Julien Grall wrote:
>>> On 19/10/2022 08:41, Jan Beulich wrote:
>>>> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>>>>        and alignment) of the runstate area. I don't think it is an option
>>>>        to require 32-bit code to pass a range such that even the 64-bit
>>>>        layout wouldn't cross a page boundary (and be suitably aligned). I
>>>>        also don't see any other good solution, so for now a crude approach
>>>>        with an extra boolean is used (using has_32bit_shinfo() isn't race
>>>>        free and could hence lead to overrunning the mapped space).
>>>
>>> I think the extra check for 32-bit code to pass the check for 64-bit
>>> layout would be better.
>>
>> I'm afraid I can't derive from your reply what it is you actually want.
> 
> I think for 32-bit call, we also want to check the address provide will 
> also pass the 64-bit check (i.e. if used as a 64-bit layout, the area 
> would not cross a page boundary and be suitably aligned).

But that's specifically what I say I don't think is an option. First and
foremost because of the implication on 32-bit callers: They're need to
use magic to get hold of the size of the 64-bit variant of the struct.

Jan

