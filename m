Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6764D12BF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286634.486228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVXw-0007Q1-Ld; Tue, 08 Mar 2022 08:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286634.486228; Tue, 08 Mar 2022 08:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVXw-0007N5-Ig; Tue, 08 Mar 2022 08:50:20 +0000
Received: by outflank-mailman (input) for mailman id 286634;
 Tue, 08 Mar 2022 08:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRVXu-0007Mz-GU
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:50:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5ed9d61-9ebc-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 09:50:15 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-4mcY9Zu-Ma2d2um1R5WBOQ-2; Tue, 08 Mar 2022 09:50:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 08:50:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 08:50:11 +0000
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
X-Inumbo-ID: c5ed9d61-9ebc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646729416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jI28cgYk4hJftD6jXjMJeM0GHXR3vliy0a6ed7aoD6g=;
	b=BTvb/ZvvMbf3tHXuAbEfMNu/oW/ZgE9szqE1fjmmxnEoS3JUG73aEUYtH+fK5I3Rtaa+Dq
	E2hTrMPf7UI/3EYiPW/lcE8EdT1p4o2O3f1ytC86kX0BaiNUanTNR3DBNBSQxDH4FdpsPO
	sG3egvD6KX+WkL7Z6eqABri4sM2z1Zw=
X-MC-Unique: 4mcY9Zu-Ma2d2um1R5WBOQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4ef7CkFAxGtx7sIJGWrTCSjDOB1ZTBJv/P1DZYdb6KYOp7yHuszF2V415s36stB08FcRtnIS2ghv+ViDi3X6TDRAN1FnoQuTcZtA2V7dWNwy527pYVF78/ItCElTAK4DEz7NrG31RIx8gDH2LSUahCpUOn63fBVzbSdl03xPfpBuWSTufKkkYM3av8clRkBTbuYLE0u2zsavvxS3oE3ricvGNd/Trwyt5/EGMJ644eUBVOdtAQL6L0P9RE9LfLEq1ZDO0i+c1eJrqT+OnB3XR/QJ4RpFoUi3bbwXWwA0w0eyfOUSK5itWto+ARNGpwbMCE1uYsqDLonjf2i9VXH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI28cgYk4hJftD6jXjMJeM0GHXR3vliy0a6ed7aoD6g=;
 b=ghuYi/Hf5Ztv8PReISb4/AOANxlYZw+of+qPF5uVxa2MgZRpKsz/KJcowJ5vBRA49p/AJDQiZnGsi+lgg21JXt7Qe+TLAPicFCS91PF7C8hOmu3IyrqUuODgM+DoI11YDq1uwWS8YIngUuRljcfSv21E/GXv6KzeOB00y+p1MRspa4KDIcpYDBzHNeJamwWWBE41wZQ0tEiEfpY1UgDFOx5+MdrHxN77ew62WQPqVfaHHUKqN2pMDZr1vj0/icDtdE4NcXIFwmRWRHpGxy62ivbZBbkA5QdBDYl+fQ0Nzv5vZG0u1rkERNPVSha0eKG0KsaRgNRmC+e2INB5k3fa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19d9390c-6ba1-ab0b-e582-8b83101b97a7@suse.com>
Date: Tue, 8 Mar 2022 09:50:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
 <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8f45454-3df8-40f1-b227-08da00e0a78c
X-MS-TrafficTypeDiagnostic: PAXPR04MB9024:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB902473793B3923E0F97C11C0B3099@PAXPR04MB9024.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5pNKt3MgppH9ECNW41Ti3lCCkvv52+4vLzz7ujZ4gWk5iSxCRpQI7n9rH7CAHg9GY4VqwlljnvL8EcJ5RMBcYW2F+CrTua9bgqc1gPfD8opFMDlQmsRVtqo1vEXqBdWr5WVwL+i8fnhutZ1enEWZU1hWfY/P8esXTzUjJ+7x3CWEQqOKOJ91npTelhDhxK/XJta+1wYlukki9Hu+OKQt2KUy4YSH2uCA7PsrVV2kgpqqv79/23f00wOR6FUcD10fMlEt7wfFC/AUbHOVDQPitEG7EPkXDMoiOpw2AdeKztSI87z6CQ6wiQlcUmwJDdU9Lqo1L1z0oc3XnmrIls+6N/ztOOD2AzkrmS5ok2WCso/x+uqUKVSzv5FIhgmGdeFUTwORibpvpToXUK+omN7w7waZTt2QpmWxdMiwfaATtvlM6ZfVFSPUlR7RcOlHrSviJxbe9QE28QWIMW/VxxvIgVozaIQCf4h/ycvY1cYcm/VWMKDETh5VBpV1skQTAoFo/KCLNTLISBS6QRNSmSPbHeVOQA7pZxdsCQiG6DTnmTflLaKXBUVSx3Zd30n6T9iVd9rbOL46TMTy4N7OnU9w21duc/PhwMLr7EFGFdLoeNa9BUp+QociQY5L78dHYP8CVIOgz+twtCId5MWLT+K3ZwxrpVOboLmTTceu2DIYVnM06Vo0Y3MdS11Ikjyqq1+6t4cgHPN0C/yI5P7vsGG8bzJm2+Ggfi1aa8OPwY98Qqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6862004)(4326008)(66476007)(66946007)(66556008)(6512007)(2616005)(2906002)(31696002)(38100700002)(86362001)(53546011)(26005)(7416002)(6506007)(5660300002)(186003)(8936002)(83380400001)(6486002)(6636002)(36756003)(31686004)(54906003)(316002)(37006003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy9MbnpiZnFMUTd6anc4cWlROXZTU2NxUHBkTnVoK3VPNVRMdnBtUnp2cEhO?=
 =?utf-8?B?ZURBYnhtaThGTTYrb3VtZExqUXpibTJNTlRDKzh6eHlob1dxTDZ5SnZZcTli?=
 =?utf-8?B?NXMzL1BhQSsrenZtWjF0M040bGpZd1RUbk1pUC9lcDBsZmdNb0hOMEdMWFpR?=
 =?utf-8?B?Ym1FM0lPUzN5VDZwakUrMGZtN1IvaDRJaGI3dGxBVlpPSkZEYmg1dkN2U0Zv?=
 =?utf-8?B?TUpXc2EvUlpialY4em9OQkd0L0JHTHJLelZMTXBjSUIwY2lFa1JFVWVTcVIw?=
 =?utf-8?B?TTF5aUN1TmFreGM2S29NYWFLc2pZMTN6a05lM1kvRHdrM0Rqb1ByZi9UVzVK?=
 =?utf-8?B?bWc1dTJpREtIU3ViUW1lSStMbzJ0NlIyY3NYV3E4WGpZWFRXVHBYREVSOFRw?=
 =?utf-8?B?bnE2dFNyQldMOGpGbEt0bk1RODQydXJCdkV1dGNuZnBnL0VUejhHNVlQZjQ1?=
 =?utf-8?B?RHZycGlMY01mcE41OXRuTTZGRU9Ra1JEWkJYME9BMnhiYnZxOGR6RU8rYXpu?=
 =?utf-8?B?aStVS0oxdVdQV1hHQlZzVlNCZFQvSkhZTDRuYW5QbU50SzRVV21SUDZ3QlFU?=
 =?utf-8?B?RWJpZ0JhVmhvaCtCcnA5dDE2RHltZVBaemJSeTVIMDhDcmlsQmhIcXMyUkZC?=
 =?utf-8?B?U0NNc2JxY1ZwTGdtK3JBS2ZGcWxzaURjUDJLK1RicnZ1QUc2akxITVNQdnVX?=
 =?utf-8?B?OVlGd0ZnK3Zab1lsY24xbzcrdWI3OXBpSkZrSWhHbkN1RisxOHNFQ0g0NDVO?=
 =?utf-8?B?aVZENUhHdFhoaE9iYXkwOFdsN0pQbTkyNEZmSVZ1a2dnNERxVmVEYkdNQm04?=
 =?utf-8?B?ejBSbnUzcFFSck1PRWl0YysrZzFMT25ZaWVpMlB1ZWc2ZEYwdDZ2cWRRM0FB?=
 =?utf-8?B?cmJUTWpHcURwU1cwMFkvQ2VKUWV0ZFYxekcrZDJoQ2NkRmdtaDRsRVQvd1lk?=
 =?utf-8?B?S0p3bTZSVndBS0hlMkpxRzJvZGtmL21KcFNkUU9VaEhFNUhZVEJvRHhTcmxH?=
 =?utf-8?B?ZGFJYmJjZnd1S1p6T2xPWUFjQUVUc3QrRDUra1RNMHc0VzBpdFpVMVpqamVV?=
 =?utf-8?B?VTZVZGpvamVCa2RlcVJkQUVWcjlNQnpSVExESkJ6VHZlc3E0U0lEVjVmemJv?=
 =?utf-8?B?M2wrQkNzRDBnT1dYOEFmN3pxNG11MlNVcjA4NjY3YzBlQ25GTEs4OUxYKzlY?=
 =?utf-8?B?aHJnTEQyek55UnBocnpzZFRDd21kU0h1b0kxZXl0bGQyaXd0c29XRi9tOGhO?=
 =?utf-8?B?M0FzMGtQUFplM3ZBcStFUzkzZ21iK0ptK25ET0lCV2hTZkRGK2VDeEk1S3Za?=
 =?utf-8?B?bE5XcHVINi9CaWNPQmZxR1FObmRUTXhKM3loMXlKVTNCbFEvT1VGRTkwd3hS?=
 =?utf-8?B?TFk4bmhGWkhELzBwU1F3N3kzRkpjelFDZUN4dmtmaUROUU9uZUdyVDJMVDFI?=
 =?utf-8?B?Y0xVZGc1eVVNQkhlYTFkU0Y2Wjl5Qm9VRDE2RkJoMXhZTEZQVldyYkt5VHlS?=
 =?utf-8?B?enRXSGxvSlptaTJiSXdXTkpTSG53K1RBdVNaSzFQL013RlZHRXdRRVpzTnc3?=
 =?utf-8?B?eEtNSW44ZXlOSHFkSG1NNjZNakdMWFFUM3NCd051bk0zWGVxVUg4WHJsNmw5?=
 =?utf-8?B?ZUFYNm01VzFYV3kwTDIyMmNwN25aMnFuUXNoSWhteGRvQnZwbFNKQzU4M3RJ?=
 =?utf-8?B?c205c0FodHB6YWxRYVhLOE1BcjVVNkhOam9rT21KR0VaakJSKy9LcXV5UnpT?=
 =?utf-8?B?Ky9DRlNvZnVkaGFKY1RMc2F5R2RET2ZSNTBQSTlFUHNRdGh4VVI2amVlV3R2?=
 =?utf-8?B?OTZVUEtJSURPSTdONGtPMFRMakh2L1U5TDlNUi9YQitxUGtUcVQwL0c0SUpW?=
 =?utf-8?B?QWo0WStUTkpsRkowdzZmOVBnQWFCa1YyTkE3cUZHVnREcndpK2NKRU1ncjdG?=
 =?utf-8?B?WWlIQzdQUUYvS1grZGFlc1hCTXJuL243dlNIM0s1QTRRZlJ2UkRWdlVJWHBK?=
 =?utf-8?B?RGl0eXk3aFMrRERIc25NcEhjQXJSL0YydGtnSnNZT0FocTFFNmVZRkJIRk9z?=
 =?utf-8?B?T3oxdGNBMG1vcklCM2k4Qy8xWkh1Ti9hc1pidHYvWDliNjA2SHZ4YUJGYnVh?=
 =?utf-8?B?aDJ6alo4blhLdmJveDh4WFJFVDBtOVh1WGUyQ1JIcys5Mzl3QzNIcnAxc1JY?=
 =?utf-8?Q?JUm3drrk/AzK/zqhhWTn0rg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f45454-3df8-40f1-b227-08da00e0a78c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:50:11.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3g8++KpW0Ah1jwrcjMDYTM3eeWiCpKy+6+/Uwbbc2bynGFPraPBjvLQq8T7w5vwg+8zxZAIGDjp7+nZzyHj+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024

On 08.03.2022 09:39, Juergen Gross wrote:
> On 08.03.22 09:34, Jan Beulich wrote:
>> On 08.12.2021 16:55, Juergen Gross wrote:
>>> In order to avoid indirect function calls on the hypercall path as
>>> much as possible this series is removing the hypercall function tables
>>> and is replacing the hypercall handler calls via the function array
>>> by automatically generated call macros.
>>>
>>> Another by-product of generating the call macros is the automatic
>>> generating of the hypercall handler prototypes from the same data base
>>> which is used to generate the macros.
>>>
>>> This has the additional advantage of using type safe calls of the
>>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>>> the same prototypes.
>>>
>>> A very brief performance test (parallel build of the Xen hypervisor
>>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>>> the performance with the patches applied. The test was performed using
>>> a PV and a PVH guest.
>>>
>>> Changes in V2:
>>> - new patches 6, 14, 15
>>> - patch 7: support hypercall priorities for faster code
>>> - comments addressed
>>>
>>> Changes in V3:
>>> - patches 1 and 4 removed as already applied
>>> - comments addressed
>>>
>>> Juergen Gross (13):
>>>    xen: move do_vcpu_op() to arch specific code
>>>    xen: harmonize return types of hypercall handlers
>>>    xen: don't include asm/hypercall.h from C sources
>>>    xen: include compat/platform.h from hypercall.h
>>>    xen: generate hypercall interface related code
>>>    xen: use generated prototypes for hypercall handlers
>>>    x86/pv-shim: don't modify hypercall table
>>>    xen/x86: don't use hypercall table for calling compat hypercalls
>>>    xen/x86: call hypercall handlers via generated macro
>>>    xen/arm: call hypercall handlers via generated macro
>>>    xen/x86: add hypercall performance counters for hvm, correct pv
>>>    xen: drop calls_to_multicall performance counter
>>>    tools/xenperf: update hypercall names
>>
>> As it's pretty certain now that parts of this which didn't go in yet will
>> need re-basing, I'm going to drop this from my waiting-to-be-acked folder,
>> expecting a v4 instead.
> 
> Yes, I was planning to spin that up soon.
> 
> The main remaining question is whether we want to switch the return type
> of all hypercalls (or at least the ones common to all archs) not
> requiring to return 64-bit values to "int", as Julien requested.

Could you remind me of the (sub)thread this was in, to read through the
justification again? Without recalling any details I guess I'd prefer
to stick to long for non-compat flavors.

Jan


