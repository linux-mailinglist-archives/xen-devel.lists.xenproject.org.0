Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29998693FC3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494197.764184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRUKc-0003Zk-2a; Mon, 13 Feb 2023 08:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494197.764184; Mon, 13 Feb 2023 08:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRUKb-0003Wn-VX; Mon, 13 Feb 2023 08:37:01 +0000
Received: by outflank-mailman (input) for mailman id 494197;
 Mon, 13 Feb 2023 08:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRUKa-0003Wh-PU
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:37:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 939b1d56-ab79-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 09:36:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:36:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 08:36:55 +0000
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
X-Inumbo-ID: 939b1d56-ab79-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA7rLSeNHaEmJHvHkG9Ky7XzO1ZAKSVhVrGD9L7tUGRc5iifP2tupaWFkX1N4lu1DbUyhML8ayCpEO2TKUL7Wc+150GWX1rtdZ/8xRWBnud+5h1yi52pY2Kmm/vHMnfHLKYR9/1e6+ZDcBE6iUfNezaN/6CFIVmR7A9wXpThNCiZZlz0yzfjxRrTyoa8l27unvpKWgkxsseWfGNZuvz9vFdsLuf0Il1ycEiYelR6PImDrYkassLHcXJuQsNpa1PcApAbiVCfEkNSnxU9pNUjiYXUk1C8dDf99vulKmCJT2xzkALmlmbnFBahZ8byx6CmD5si6dDfdUl4n8BzUJNWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHgOL/5PiMClizKFsipE6Yy9FpulTtf5ZXXjt5l6f1A=;
 b=bqs20xim/dugxTmAi5EB/SuR66EILGbaA9YryjL6wom1BqbCiVfNX58tQe0eF+O2/lz5N4r+XtQ9sgNvL2l910OJ//gngXxOpxLfNgPrxxduGiOPWFcPFPc5yo9H9xADpxIV8Lfxpws1NwVVUlRAeviH7f5MQyv9hws+uoFBbnrQBAiU0t7x/dAYjpI1X6lysa3Q//rtzXwGsU8aEuTn9IL1gPscqCN+hgPdWhV3IqspkJy/iSvmOLLCSCpgx8nPSK3F9hTV4yQElxHyQdHFqwwNB8HNXpxJL3ealt1hdUr/viYCwE1Bc+mvQSUdhWVXRYFcCrYg3DdkA7HCLY+M/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHgOL/5PiMClizKFsipE6Yy9FpulTtf5ZXXjt5l6f1A=;
 b=oRDgoyiqssuaxxtO2mg0bscr0SW9gYC1JSvuh5ofZGk05kumgYc2HdVb/DnvGqOv0dd1cfvv+L/GSDu9AU5vEwv3ng7xUUxhHbc+IxHvmnVsZTX7rjcpvcHYwGtmvI7GhlJKLeiCHQMEkMvQO90UcYGq2BAFvPEaww2I+hUIe6egQsnpWNP6Ziw1WvFUyWbkTOjhs5dbb7s+rim9E21zaGJnLs0gvosOLk2sAVDyU144jaw+QdUl51kdi8rLpxs05cSkwA7+8MehfzkSvdVbRmDu6CnhagNyhxeZN7tOpVycVIa8DnNV3xyB86nFLv5JNyIC2AJ6WmDLuXbLBXvxgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <083e8a1f-8db6-350a-9138-58751c3fb44b@suse.com>
Date: Mon, 13 Feb 2023 09:36:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and
 vector length
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
 <20230202110816.1252419-8-luca.fancellu@arm.com>
 <f1673cb6-6f4f-be53-ef82-2ea2045533fa@suse.com>
 <781EDC8B-B24C-431F-AB08-F2ACF64E4D4E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <781EDC8B-B24C-431F-AB08-F2ACF64E4D4E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba24c4e-6f70-498a-19a5-08db0d9d763b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SiEXlE/mBp6tvZLUPBOpZOX0zPNJhoOO8mUs7tN53gWq81ZQEXZb65hTVOCXAnhNB1JwGHnkNp0XqT8t8B89ILhCvyeLjgOQIPNCsGgywnhL4KTfJyV4TfNPdkKJsUNOaOIE0ELs9fdQtmu/w3yuVrxz8HGyqKqu5MGZYD48kZkVNDl61QV0C/BO8wJuRZH6dd6v7d0aexLy8Xhgo+FQtyR+2OiiNYtnY4i10b0VDlfNePN5XZHNARMYfJDH55NxeBGGnFWV690wib1ylBWVGToqy1e8DBG0MQXLarnWVTq8C5TLJ/aHcf6yUMesmohp1MPy8Zor3FRoX1GcdMf2DVnDrKnaer2becFk3g5QdrChfSI+WU4kXZi9z2LWndOqvDwBzqh9phELADyqnSrc1M7KD8aCSB9NLHwozOkhsKGrXXmrHf7cPx1Ejzn5QlEm3otQRjdrhX8HefAXS0PhcIS1J5CGOjczZ7qi0bl+h8pf7MBJh0l6twoSnbQ6nqJAyN2FLdukdbgXOewGK8GJ9vxIPUfF/6TulL18qJXkvUYQM00aLV8qqVJkXYJja6S87op+zfT4is9BlT5xx25f8DtQyd8Rt03r1AWkSX8CTDvdKc3yJFXY1SSc7EvBxDpAesMiOIWF8IIrBp+GfV/VtTyLrA0qZpZPyIW5XY5OKUOYAvhnBu2I9jZ+zCoQDq+RujlzpiVuslDaofyrvHDBOzDhuy3nTiMxJwQVOifjgDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199018)(4326008)(41300700001)(6916009)(83380400001)(86362001)(31696002)(38100700002)(54906003)(316002)(66556008)(66476007)(8676002)(186003)(66946007)(6512007)(2616005)(6506007)(53546011)(26005)(478600001)(6486002)(36756003)(2906002)(31686004)(7416002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3VaWVpUOVVOS0M0b3I0QWtSNTBXbkFyZHJRNDdNSGNrcmxBM293dTkxSnFQ?=
 =?utf-8?B?QXo0bGc0MDVJTWlsUzh2Q1ROekNpS2NMMTZXUFB5ZGdYTjB4K2JRRkliZkJx?=
 =?utf-8?B?OUt2cDU5RkQ3K2hjSWN5SElyREovTGQ1QVc4S1dBQ1NKVlFmdnlVSDlLdnhu?=
 =?utf-8?B?VDE3ZjJsaTJVd0tTMHl1dGUrNFN0cWZaaVVQcmR2NGN3SGpIWFhXUmdKamtu?=
 =?utf-8?B?TEgzMVZzeDYxenYzb2IxZmxCN0hDNTA3ODc1N1pobi9jVVlLbkxCT1gxRHVj?=
 =?utf-8?B?akoxTjdOd2twTE5BOURLQmRmRFZSbHNTWC93RzFhT3BzblhPVkx0MlBCeU1H?=
 =?utf-8?B?cnpKaTZGM1YrYzFpWmJJdEhFTDFNSzh5RHVKb1BUb21GMEFLdlNxOFN3NE1C?=
 =?utf-8?B?TkFLNkk2SHZqWmswN2thdTg5NEVJbm00QWdqZmJ0V2ZqcFZBVmR5MzB4d0VU?=
 =?utf-8?B?Q1hMQnRzamJxWHZWOW9QVmloa0xwQ0dNR1RYMU1HVC9RbDRaNm9WYi9RTnJ0?=
 =?utf-8?B?ck9OdGpDZUpiSW9rdVhhWHE5SXZTQkZIV25VbzRaS000NGU0b21Tc1A4cVNK?=
 =?utf-8?B?aitneVJ5TytkbHUySUJyOGxVOW82WHhBQlVENXlady9URWpuMnNxenlVSUZ0?=
 =?utf-8?B?bEEyWGlUVGprQXYrODJFa0hsSWFNdkQ2b3ZOSkY3NmZ3VjVhRFljalo0S0Qv?=
 =?utf-8?B?alNPNDUvMENEZStkZzk1QklucVI4VEJTalFpc2dtSkdMZEVUcm53WEpleTNZ?=
 =?utf-8?B?Q0NYYURLSWxjTm5Lc1pVOUVoK0IxN3piS2xPVVRsTEhNMXJBSm5mYWYvMGVM?=
 =?utf-8?B?Mk9rd3RSK0xjbkF4RjhvWmdsd0cwQzhjVjZIRWhzUVV6ZERsUkdadW55Njc4?=
 =?utf-8?B?MXZlaUJieWQrdlVpUVNHbXVsWUtMa1ZxN3MwaXcxWDlLeW5OOVpud3hIZDNp?=
 =?utf-8?B?TkJtZjBlV3JyL01lQ290UHZPM29DZm1GWmlnd21zTENIUEJjZlFaQ0pQOEdN?=
 =?utf-8?B?cVNwYStTSmdtWnBWZEFqd25ZNzlhdG5QajBYdVMwVFdBTE1PdkI2L3MzZVhk?=
 =?utf-8?B?aW03R1NGUVlGcXdMS3NxbHJKNUdma2kwMDVHWTdQNm5qMGJIMit0WVdaT3RM?=
 =?utf-8?B?eVVrRjdjUFlrS1F0bW5uY1VHRmRXN2ExcTRORHNuRGtRcjRzVkMrbnF3SytG?=
 =?utf-8?B?SVhmZ2ZrczB0bjkwVlRrMGNEbVN3M1NiMDZDN1ljQ2huZVQxVU53VFBRN0FT?=
 =?utf-8?B?YTl2MDF3QllqT2xLTWlKdG4zTWlVd00wQXlMcUQzMC9wT0c0eHJpN1VJWm9V?=
 =?utf-8?B?dVZ3WXBQNjBxb1AzcWpaMHdLbHFWNUYrY25rd09nSWk1RTV4NjZtZjRkZ0dY?=
 =?utf-8?B?TTJhSFNWVDRudE9uZjlNNDJSR2U2UFE4Z2kwd3REWEl0UEIrSmFCY1pOYlRm?=
 =?utf-8?B?TXJ4elRsUlBaN3BXa25aek5YR0pqcUNmRGRwR0JqNlBreXdaQi9wdXJ0bkcx?=
 =?utf-8?B?ZGN3TkwzdGNLVDM4b0lyM1cyYXlEbHk0OUU2YlhaSFR0VnNLa1N2MlVJMVd3?=
 =?utf-8?B?bGRqUHdhUVhIT0ZNZlJDdDhnak5JbTF2WVlzRW85bXgwSEhwQVYzNTFuakQw?=
 =?utf-8?B?UXR5Y25XWG0zK1I2RUcvZnNTNVNtQnVzR3FycXEwT21UUzBrZU9Ed1NNeGtP?=
 =?utf-8?B?c0Z1K3hzR1dGR1dlZzAzRzQ2UzR6TS9mWUN1U3ljOGRVVEh0dGYzWFdnMUJS?=
 =?utf-8?B?SWlsTW1yOWpPR1N1WU9YdE1iWDl2RGI5aW5mOUxZakd6VVFJNGpVbmw1ZmVB?=
 =?utf-8?B?Q2x1RFFuRFJwQzVRNUtQZXVkWEc4bHZQS3VPVnkzTFB4dHg5MW5WT0ZVR1hl?=
 =?utf-8?B?SG9XQVdaMXdMYkFueUVONGtxTnFmY1hpU3k5SXU4S0wwSmpJYk1sa0NPTUlO?=
 =?utf-8?B?d0VCbnd5eUZEN1NOQ3JxOXFZMDljSTdSZmY3cHBHZmpVMnRXclhaWnhRWndZ?=
 =?utf-8?B?TXo4Q2dLenkzT0czcnVUV2xLd1pHM3dtNE9qR2VhYzQ5NTBvWHo0UjFVSmo4?=
 =?utf-8?B?QkgvYVVCU3BnSVdRa1FPR09jUklMNVo1Z3NzbmJXNWhaRnJXYWhkSXA3YTVz?=
 =?utf-8?Q?BAT7SEqPlzvAwZ452QH/MdIag?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba24c4e-6f70-498a-19a5-08db0d9d763b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:36:54.9543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wzoBnzulcFnL3BB/AOFdnuM0odSQq47959D8YFnaOSFymXMfljTSqZWnJ9mskL6HZQu963ORI8AVdMhlLjgnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278

On 10.02.2023 16:54, Luca Fancellu wrote:
>> On 2 Feb 2023, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>> On 02.02.2023 12:08, Luca Fancellu wrote:
>>> (is hw_cap only for x86?)
>>
>> I suppose it is, but I also expect it would better go away than be moved.
>> It doesn't hold a complete set of information, and it has been superseded.
>>
>> Question is (and I think I did raise this before, perhaps in different
>> context) whether Arm wouldn't want to follow x86 in how hardware as well
>> as hypervisor derived / used ones are exposed to the tool stack
>> (XEN_SYSCTL_get_cpu_featureset). I guess there's nothing really precluding
>> that data to consist of more than just boolean fields.
> 
> Yes I guess that infrastructure could work, however I don’t have the bandwidth to
> put it in place at the moment, so I would like the Arm maintainers to give me a
> suggestion on how I can expose the vector length to XL if putting its value here
> needs to be avoided

Since you've got a reply from Andrew boiling down to the same suggestion
(or should I even say request), I guess it wants seriously considering
to introduce abstract base infrastructure first. As Andrew says, time not
invested now will very likely mean yet more time to be invested later.

>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -18,7 +18,7 @@
>>> #include "domctl.h"
>>> #include "physdev.h"
>>>
>>> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
>>> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000016
>>
>> Why? You ...
>>
>>> @@ -104,7 +110,8 @@ struct xen_sysctl_physinfo {
>>>     uint32_t cpu_khz;
>>>     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
>>>     uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
>>> -    uint32_t pad;
>>> +    uint16_t arm_sve_vl_bits;
>>> +    uint16_t pad;
>>>     uint64_aligned_t total_pages;
>>>     uint64_aligned_t free_pages;
>>>     uint64_aligned_t scrub_pages;
>>
>> ... add no new fields, and the only producer of the data zero-fills the
>> struct first thing.
> 
> Yes that is right, I will wait to understand how I can proceed here:
> 
> 1) rename arch_capabilities to arm_sve_vl_bits and put vector length there.
> 2) leave arch_capabilities untouched, no flag creation/setting, create uint32_t arm_sve_vl_bits field removing “pad”,
>     Use its value to determine if SVE is present or not.
> 3) ??

3) Introduce suitable #define(s) to use part of arch_capabilities for your
purpose, without renaming the field. (But that's of course only if Arm
maintainers agree with you on _not_ going the proper feature handling route
right away.)

Jan

