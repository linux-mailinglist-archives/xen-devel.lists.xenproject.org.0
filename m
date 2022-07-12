Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A454571334
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 09:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365525.595736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBARe-0003O0-8Q; Tue, 12 Jul 2022 07:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365525.595736; Tue, 12 Jul 2022 07:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBARe-0003LQ-44; Tue, 12 Jul 2022 07:36:34 +0000
Received: by outflank-mailman (input) for mailman id 365525;
 Tue, 12 Jul 2022 07:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBARc-0003L8-FC
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 07:36:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5831cd09-01b5-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 09:36:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 07:36:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 07:36:28 +0000
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
X-Inumbo-ID: 5831cd09-01b5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxmX1bxI3IaZgjFtkGduimZkZ0wId5BpO3mONWfNw7v1+/xlKiXWpmw4qw9NiX+qkwcHeQdUACeOGt17sSmtsMk8OUeTP3Xset5iZefSl5jCU+Os6vfmFkuEHv80NRryb8PkLyHy0Jfco4xsMNbcgIkKn0NowFZ1scmOoTWuQxzbtH7E1tIUyMjTcxif0Bwg7pIEkBMvR+N2OCc2pJk7kJ/5Vwo6sdsVV0sdujVaFZQmp2aAYM+neSmEOsmEfwdCJp8UMtohAnLUgAFnDtgmRrmg465+A4332yB6OlOuxxrIPpJRSjVvNA3i2M8mqTdwbu4EfqyG/xOKl6TIarso4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeW4D99XxL+J2gzoYvCyHrctwFrA60QYPh0z2yOz78c=;
 b=EouPwDPDSuIv4CNwIiBhKhM0r0S+UlnDgIeqruqxOA8WCEzgzusQRodqDZdSaq/KXMTD+xO+k338PwUnALosJodi0WcYPFVXIcDdEbAArhh5HPR/Uzmi3j6AAFBLwbfUKucek9qTZRrPuIaVVITHjLdnne00GPEgQfSWDqPubCpc7tG54QI8pxM22vCWxpWxF///z/UaBvInQn62G08PDG0EdXZNAlUxNt8zdKwhxLNU35hikZ/yZa7al2FtXxvOPsWAt2TBHzm7Kya2iY1OKbBaajyxwF42zpOP12dYAjHBqYF2hbyP8ZgzKqyLfuW5CxuM9O+A/6aR2ynTQn29BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeW4D99XxL+J2gzoYvCyHrctwFrA60QYPh0z2yOz78c=;
 b=MDqCmFt/AwGIVd7ArXJV3RDNIWBlC8xb22y6h2/ICIbR+1yULiPoU8c6EnIS9hl+981tGfQj1eRrAiTd+ZpnCLRZIZFfa/9Ag23Qt9qi5q9vuL0TE1ytcVKd00y6YBToQGGAvSd4DHV3fljgyUGrNCX9ts7/zCBPx2lIs+aH/6xUzRK3xoieZjmrkey8WwwpNHzQLoG5tYpORFy6eZTJZxW53OzdH+k0GgQeNtckSZwNPRN3/inW95PNHQGP+yMbA7BVoXY1q3Wd816+3/fTxlaX4fXnW42GLqkAGI+DnY2Yr8M/U05Mr0vnupfRpWVww19q3fSIUf69j/jjQlm78g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b4f7eb9-3a9d-e4f9-809d-7c21726f77cc@suse.com>
Date: Tue, 12 Jul 2022 09:36:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/9] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-5-wei.chen@arm.com>
 <6b1b2694-d46a-7713-6109-99c98fdf6b8e@suse.com>
 <PAXPR08MB742087E3B94FD469F2DBDC5E9E869@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742087E3B94FD469F2DBDC5E9E869@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc9b095-0502-4bd8-4839-08da63d93bbf
X-MS-TrafficTypeDiagnostic: PA4PR04MB8032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fVvvf33qh+Y114qKk+sG+/zJZ9U2U8+4uXoQ9uzTFohdmvqvuhKJL8mpMGuUq++GWmOBoc7axPxF/rJzV/a/GyXdqEeYwqGhoxy/p7KFn1QcIJlk28unjt+VuHO6fyEO7BFNNj82scJ0LyQ+1fCrwgi3oaiFN4JWm+wq/9Ql0Hpn23k6+i1LonDwqggGSRGDeaKF3lWX0r6iDa4X6qzNJc+QwFCuXQjSY/x7EQoN3BQAu0NkAWXw6VcyY4BCa157Kc3VeDyh88bwMQz0yv1FtKSKg7NAxNACJJ/zBJiSGGcS8HO5o5EHsOl/IvEQ0vkigZvZ+iisaVHBjTtcMg2+v7pRnUnFwMyU9tMZ4SjLOvrnZgC/aEfFMzQ3BvjxKp8vgewR/WqX49wSO3+RDE7eDQa60mKySsBaMRB0xE1yGsqh1M4/7PpnJoGE0K3AIoRbAxI0DXQvrAV78Ivy+IsUiWEfo6jvkJku1aRILq4HmOj6ymfH/PJtPxIEybatnwYcElC7T9/ufYUq86or04QPaICsHR7chUAWkL73RSbwaijFr9u/j+fgSlk4U8V6n4o28ydF+HwAL9x+vkUpqa/wkKtnM9gKVqLWjVEYvX7ydidfSMzM0sauilnRfrjFa9XdAx+2YGR8M+I9kdxOCE1Yx7WlZcoSL74jwnPPa61hKgbfuAYE7HPaFd5e5F3yfQvt6071kyytZCxr72Rpt86La0Kgrx0ADx6dHv4V7oTTppy0kSMmnrjGfkXj9mGmTjhwR2K8nSLhPQqoI089S9zfVN7wvZyIcqg6p7zOQLvURn+5YdACnogJ4wfDvVA7Rm2yW3QqMM3X+AnlB1gweh2JvszqclKXmwGiEdVRiCMpOl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(346002)(136003)(186003)(86362001)(83380400001)(478600001)(66946007)(2616005)(38100700002)(66476007)(66556008)(6666004)(26005)(4326008)(316002)(41300700001)(6512007)(6486002)(2906002)(54906003)(31686004)(53546011)(5660300002)(8936002)(6862004)(36756003)(31696002)(6506007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjJyYmhCWmhSdElpYjdHVWNQKy9xaEdOalg5UVMyWG5LM3IvMEgzYWpLcWNW?=
 =?utf-8?B?dXFVWGNQM0gvSW53SUtoQno4Y0U2VjFoaVByWHg1MjAzTGhWNHZDdVhDUHpn?=
 =?utf-8?B?dElSS0FEalRCd2puT0RVN0EycGdvRGxVSFQwcmZlc0N5Zityb0MvWVlWZ0RF?=
 =?utf-8?B?L2o1YnFTVVBZNUNaMUpUY01Vc3VlZktuU254cHpCWkxyZzN0N2o5TjMwQjUr?=
 =?utf-8?B?RmpLSlVESzhkZWdSeXdwQmZneW5JWTBiZGp3Mmd6UnlVMXVBcFE1WnJsZm0z?=
 =?utf-8?B?S29QbmkvZU5SQnNjeWtHa0M0Z09adEVoMGUrc09tVG9VeFZQaU1VaHIvWldJ?=
 =?utf-8?B?RFFhNHlCYlI1TzA1Qzh0elQvQ0ZpQVJiNUFiNXFPSTU0Mjc0MzVlL2E2VVlO?=
 =?utf-8?B?c1QxeDhMREJsaWhvUkZvZUo1MER1QWhMVGFWV3NrQzczallxUStBb29VMUZp?=
 =?utf-8?B?MkxXMFRnR2prVzdHamRwbTROMDhHaHhQREF0MEY2M05UUXVXK21SSmdYSWcz?=
 =?utf-8?B?QTBUb3BVVmVzczdZZ3NDZmJhNzgzU2VXNTlob2NUendUZktKZ0F1MFB1bklV?=
 =?utf-8?B?anFIcU9HczN5QURsRzMzeENkdUlIYXMxdmI4Sk9MZjJmdFByWTY2NS93dTBX?=
 =?utf-8?B?dlh3ZWFtTk82MjRNRVFrSVJjMzZ6aW1oek1FMHBPeTZrSk9LaW5CODM5L0g4?=
 =?utf-8?B?dW8ydkp5cnU3MitDWlVXNXc3UHdXejVhU1ppOU80eEpSYlVXSHBhWUpSTFVM?=
 =?utf-8?B?VTBHeUppUW5UazNXdUp5U2lpbWFZZVFzc1BuWHdQSXV1ODlFTFh0RmxlYnB0?=
 =?utf-8?B?enRXQmozM3FVK0VRUWtxcUZMMVpJNTVXN0h3dkpTaFlwOGdCUklKY3VObE0y?=
 =?utf-8?B?RE5OQklqZVM5ZlZtcXhLNmZZMGJmMEd2WWdDNUJraFk4MzBveTZIUlltVFNi?=
 =?utf-8?B?WW44MWNtTGE4RHg1L0Vkb2VQbHlFSzNEZmh0b1VuWENOQkFlREZacDRjbW93?=
 =?utf-8?B?dGZtRmFCUlltOUNXM3Fnc01JaHNjdFRSUkZPM3hrTzRTTitvVFdsWDZGbU9C?=
 =?utf-8?B?cmVIR1hncXpPV1NMVmZYOFBUcFFkdUxrZ0o3djNUeHFSOHdGeFBPWSs2Z2pU?=
 =?utf-8?B?SWhmcVBMNFJ5RFd4NFVGbWN3K1lwZ3FKdytiTVg5eDJGQzhtQlF1V2xtaTBL?=
 =?utf-8?B?WS9XWHV6UWRKOWF5d0VZY21GSkMwUEFTZE9ZVDdEVVY2dzA3cGZ0UUdGVVNu?=
 =?utf-8?B?Mkg4ajhiN1VNd1I3NW9qT0pYNkpkMGVmSk5HNzRocVdhRTl1bDhJaElQMFBa?=
 =?utf-8?B?a0lmZFc1aTlHM25TTU4zSWwvR3dQTDFCSlNWRmp4SDJzc3Y4aythNFRlYjlB?=
 =?utf-8?B?ZWZBeGJGRTBEOWg0WVM3a3ZmejhEb1Y4ZVFKS25STDNiL0VsSlFydW9GN0VT?=
 =?utf-8?B?bTF0RzhRZmpnOVpoeXVPN0NsNG81RFRSR3U5ZHRsczJkY1JtMTdTSU9nNlQ3?=
 =?utf-8?B?WmtKTFZCNERSa1RoaThYZFNEYkJ3VmhxM0hNY0ZIWG1SMm9memRiN1EvRHZC?=
 =?utf-8?B?TzhQb1pDOTFUNWVKL0pwUnk1RmE4WTBFMzZDU2JUR00rcjV1Ky91bkovWktD?=
 =?utf-8?B?TEhlb290TUpHZ0hwd2VuYTFlMmJQaHZ6WFR3RFRrd0hyY012aEd3SjdkUEdC?=
 =?utf-8?B?WmZZSFpqN2FRbTJKSjh3NDZpeG5EU2JtaHNQUSsxRzZmL0NUZFB2VHVRa3Fp?=
 =?utf-8?B?MnQvWkZ4WlhNbFIwT21sTVdrcEFsSGRxNnJjYThNUGRsVWliYU1XOWRGbW9I?=
 =?utf-8?B?MDlWd3dBQ2dldmlja3dxQS93Ymc2YkJYV25yQXVLMWxVYkYySDdseFNMeUF3?=
 =?utf-8?B?RVl3RHkwOTdGVDZmM2dGUnBCL2o1U3EyajZ3VXNPTUxLVnVoVFpkVGNUQUxB?=
 =?utf-8?B?c3h5aWNFT2lHQmJoTzZWeUMzMDlCVy9pZ2tNQUt3QkNCRU5pK2NsVEVBd3lE?=
 =?utf-8?B?M2U4NUtwTGlqMWtJeElBVWJJR1JEdDdGZ0JKK3BFR0xTbXNxQ0hWZy80am5z?=
 =?utf-8?B?VEJqQTJCL1puZDJHaUtManowUDJQMWZhWVdUalFjazZYMnBtY280ZUc5OUlZ?=
 =?utf-8?Q?FU3ponAjhykumOx1j3LpYjMWt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc9b095-0502-4bd8-4839-08da63d93bbf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:36:28.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pANDJntjUGEkZuiKXCYQcKvXCE6LJuGaby9jiLeq+yPD65aV0W0PZSaW5xzlMZC8i7/liRYwkGv+oLriGum5GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8032

On 12.07.2022 09:20, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月11日 14:32
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George
>> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Jiamei Xie
>> <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 4/9] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
>> for phys_to_nid
>>
>> On 08.07.2022 16:54, Wei Chen wrote:
>>> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
>>> results in two lines of error-checking code in phys_to_nid
>>> that is not actually working and causing two compilation
>>> errors:
>>> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>>>    This is because in the common header file, "MAX_NUMNODES" is
>>>    defined after the common header file includes the ARCH header
>>>    file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>>>    This error was resolved after we moved the phys_to_nid from
>>>    x86 ARCH header file to common header file.
>>> 2. error: wrong type argument to unary exclamation mark.
>>>    This is because, the error-checking code contains !node_data[nid].
>>>    But node_data is a data structure variable, it's not a pointer.
>>>
>>> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
>>> enable the two lines of error-checking code. And fix the left
>>> compilation errors by replacing !node_data[nid] to
>>> !node_data[nid].node_spanned_pages. Although NUMA allows one node
>>> can only have CPUs but without any memory. And node with 0 bytes
>>> of memory might have an entry in memnodemap[] theoretically. But
>>> that doesn't mean phys_to_nid can find any valid address from a
>>> node with 0 bytes memory.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Tested-by: Jiamei Xie <jiamei.xie@arm.com>
>>> ---
>>> v1 -> v2:
>>> 1. Move from part#1 to part#2. (Comment from NUMA part1 series)
>>> 2. Refine the justification of using
>>>    !node_data[nid].node_spanned_pages. (From NUMA part1 series)
>>> 3. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
>>> 4. Adjust the conditional express for ASSERT.
>>> 5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
>>> 6. Use conditional macro to gate MAX_NUMNODES for other architectures.
>>
>> The change looks okay, but can you please clarify what these last two
>> points describe? They don't seem to match any change ...
>>
> 
> I moved this patch form Part#1 to Part#2, but forgot to remove these
> two change logs. In Part#1, we do those changes, but after we moved
> this patch to Part#2, those changes are unnecessary. I will remove
> these two lines of change logs. Sorry for the confusion!

With this clarified
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

