Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83FA7CA948
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617556.960238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNYb-00008r-VF; Mon, 16 Oct 2023 13:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617556.960238; Mon, 16 Oct 2023 13:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNYb-00006z-SB; Mon, 16 Oct 2023 13:22:53 +0000
Received: by outflank-mailman (input) for mailman id 617556;
 Mon, 16 Oct 2023 13:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsNYa-00006q-LL
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:22:52 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe02::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1abb4e89-6c27-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:22:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:22:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:22:47 +0000
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
X-Inumbo-ID: 1abb4e89-6c27-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLiGDmAIrAmPDBKIOZgMu5KuJOPLMup2lGubOUQIizonr59SXl4LGD0i6ZcIaPRJY6MY7tKC6G0/cgmQ7kyAHYx+4EJzi6BTnW3GxOfFOL1uSDTFW2aeBK+whsVPen4ZWxebCyyatzL8+fYUXvnImCQkp0CZ/a2fuwaDo6zMUEqgnsDRepeeah+1Nn4WaGQSVLkXqwuwo0lTe13t731eDaHiqCe44OQZv7zu3xZ/wkiWjfOZBgO8lTpbeZZELn5qWhMpjy2B4j74t9xxDf3TtWrYOXGTdMRKcFKLm79Srnby/anL/oog6VtxBK+rFUAgCa9YUIESSwNHK/4/hm781Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROKQvp8k9hg7jmiOyCpSosawiXRsyQtxWhBqHNV1fnc=;
 b=F9yL0/aZh0iflR3OZckLhXvn/lfSzOE4i9v01Lr0AmelVY7r9dP4DpyzNiH+n5YbC2WWqdh5+IbYblS87KmVeCPPgRX3QKa+CgbjB6PocFdto564KT4cJBIxcVJd6z4XNrU/xMszHelgnEJowbh4uv7Y6CFojfEYNDPLjZsQxo7yGFmwshZecZQAQwcCuFG5jlIED1jpj4aZ45nSy1ETO232bWjwzObgDgDiytQY3Cyy7hJ2xdHWL/W7mrdbwnSvtGSVVFmsThmZJAHX+lExjABndNmjQEoTmKrranwUCo5IOFQzCgZEgs3XFE2EybSbPUa+UalEfBy1+XreyfgKgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROKQvp8k9hg7jmiOyCpSosawiXRsyQtxWhBqHNV1fnc=;
 b=1veDFNbiQrqkIPmmKZN1L8oXVjvHx8Qf4uv2WqU8NNdJNBUPBTqB/ZJNclF/TGmbKY3KEbp8R6V2TkzNEA++FAbaGERB5YKlD808Abk7MAQO4Ue2l5Rzq3rwUi8QNa7j3e/7oiYCmkI+DhI8GgHpYhlAsM5KY3uZMM8Ci58BhHE2+ZmeU5aofW/2LAoCOuofQsuO7uYrpuQxvdcr1VH3ZuTod0wr+BObgiopWZ4EIwbbRPVRJNAu0Z0s7WfCtrer3IGU0qPFevzz8xcF/IuclSCPKZj6Ctvmv+rYfELtG+VGF5wBQuxu0JzCy4t5csGCgi4HfMohSNsphbHFXrZCeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6ac8be1-c002-f5e0-3b47-059ed26a5359@suse.com>
Date: Mon, 16 Oct 2023 15:22:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a common
 Kconfig option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <jgrall@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Henry Wang <Henry.Wang@arm.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
 <b95fa9cd-2534-4d7a-9843-2bc71695655d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b95fa9cd-2534-4d7a-9843-2bc71695655d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de93126-7293-4b89-0808-08dbce4afd63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a1i0BFd0Fq9a9i4NE90ySM6jGhcDFMvroCQVa2O/RryowQsIX5xFuyuQt5kjM1Rqo9cQ7aKDEi4P0aaKqDdvDEZqWisbugmsyAdGrAwMPv/5jG38COGSzUI+co10eaGHzLbb8p8UpYHL4STPoAkVjIwmAvFlfiwB/2GtDT7E4RzCCweLYSpTGFvdZ5Zcs9jb9P+vsODDOOMqVCPreeNh1JxcuAdsEySBw+/EM3LPDYDc9xEnJpmH/7kXLcv+LjZmrrgmVSNa6anwX6gjZMnsEQjBA7k6TxucO6iAs9Mcg5iORUzm6KQfMI2Cgpq4QiKSkb3w+bwaeL9KWrIQE+pV9sYXIjHJl3uLIUKbgNrDbP2EoXxBcLM2o8PgLfHhuR3tuDZdtH1Vr1IMzyG6uQktHhJlGVd3FoRMKpAoyc/P1nuP1DD87uh9bRibTOyZXil+lJFjCkIwQeO6lr6FJT8VjXv+YQKlUQnY7uJuSIBSiWriWIZpJmZRxjSkkdb7tPtv4JSIhYPCfVS/B+b25v/NRj28HmmKFIDM0U3x9EZ8oTszaeATF7Qf+2PShiV6S7goPwuZs+Z6G7GJFfrmB0RhBbPPdJFqBMvglbf05s72hwy2CRK4Jy2uWb/0JSMEO17Nvlas8KhGzqeYp+Eyuc/HXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(53546011)(5660300002)(2906002)(26005)(36756003)(2616005)(83380400001)(38100700002)(86362001)(31696002)(6512007)(7416002)(6486002)(31686004)(41300700001)(66476007)(316002)(6916009)(54906003)(66946007)(66556008)(8676002)(4326008)(8936002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dC9ESDdxc3VYc2NXVVVnMUhUSHZPMWRpNjBLdkp3cmVPMitxTzl3V05OQVp4?=
 =?utf-8?B?NEx2NlpzRUZFSHRCbXNydzJiUzJGVjZ0a0xUWUxZaEhnVDRNelFkclpTY3Bw?=
 =?utf-8?B?RXdyQnNvMGtLc0Zmajd6M2VQdytHb3NlQmFSRHJUeGFRNHBrTnMxY2lISmlN?=
 =?utf-8?B?R2VVRnFkV1c4M3E0ZDhWT29jMktmRWN3RnpCMzFpSlVmQ1B0SnNvUDEwT3g0?=
 =?utf-8?B?Y1g0bnRsYmp0NlJZQzRBNFJBdjNveU1XYWlqTDNsaEVRVml2UXJLTzR3YWI1?=
 =?utf-8?B?Q0JwNEhvWml6amdPek5XeHJGV3Q4OU1UWHlEemxsZ3dNUHBLS1dZNThkSFA5?=
 =?utf-8?B?RzBwS3JCVnQ1UkN6eGwwQXI3UVZmZk9sNE40NWQxRENJcWdTWFM4WHFzOGJD?=
 =?utf-8?B?NDBxd2VTaFVMclYrU2dURm5Ydkd6eTZuaFg3R0g2eUhDVXlqY3BjdXpBRUww?=
 =?utf-8?B?MkpIMEJnblJRQ3lQcGJPTHhhK3pWYXpHUkhIK3dNQVowZmdXemxJNHM2c3VY?=
 =?utf-8?B?RW5jMG5BaEM3MGFqaGxsSnBNL21VRkJjWVEyam50dG0rdFZISGp6eWcyUHpp?=
 =?utf-8?B?aWhyYW9waDR6eDBRNlBoNENzU1IzL3dLOXpSUVJpbno4YUVGN2QyU2wvV2NM?=
 =?utf-8?B?NkFEdUp5MnIxam92R1NyM1dFaGEyQlM2UGFBek1HdjVVSDlVYm9oQ3NkdHh5?=
 =?utf-8?B?cWd0Z0JjalJQVm15VURGMUpYdzhaeVZtV0ZBanRlS3BUYkc4R0xzSTlFSXZ2?=
 =?utf-8?B?dUFaMndNSnp4YWlZVVdWZWlwS0J4UFVZUHZIQi9XSTFtNHBUdW90ZlRySFM3?=
 =?utf-8?B?QkQvRDhHQzZGWG5zOVRFK3VNTWRTSkNEUU04NEJuTkFqdG1oTjkxRXBhZXFy?=
 =?utf-8?B?bzROaWJwbmVYTnFaaDBHZGVEWmlENUVCaVNYOXo0NlQ0S2FzTmptY0ZMcTAr?=
 =?utf-8?B?QVQ0QUszM25jU1Y2Y1dMb3BvTDRNUkpqQmJOZ3ZJaFlqdnpURUQ5SHlxai96?=
 =?utf-8?B?Z0xlM2ExNklSc3FNalN6VHFjNG5LWTRkeFZvTncwU0Q0akNLTTljVCtiRndC?=
 =?utf-8?B?REJPa3g0VmJHbWJ2MEI0R0wvU3NzNkhEYmxxVHNDTEJPQmFzS004ZWgydWdy?=
 =?utf-8?B?TFpPQnd3QlRuTHN5bEsyeHdSNVNVS1A1bVJCckNTRGcrSlR0eHovTm1CVFdl?=
 =?utf-8?B?UHI0RlZoN3JGWGZJM0xqbHA3YzNmcUR4c1p3dXRPVW5kUngycGhYRHJoL3hl?=
 =?utf-8?B?TjZ5L2Fzam5YWU1VVDZmOS9WeENTRFZlb0RLa3hoZm9DNkFhbHZ5WGx0SVc0?=
 =?utf-8?B?UlVUbmdzYXNIcVlFTXVPWU1aMUdnRnJvc1BNZVdUaHdTL3lsTldXdGxnZFMz?=
 =?utf-8?B?S2pNOVk2RE1wdWZtT2VabGF2ZVl1T0VibjUvbUo2SGNpY2xKS2N0dWVLbmVL?=
 =?utf-8?B?NWxmbXdBZEs4ZmFITS9aclg5djYwZm9JT3MvVTRVYWppa2ZjYzBxTXJ0WjNT?=
 =?utf-8?B?U2xkL3pvQ1BJSFpKMXp6aW1YYnF5ZSs1ZEMwSzNRRzB6Z3lYTGM4MmdqSmRo?=
 =?utf-8?B?NFdLdFJtTUs0SjgwdHR6SEJXMTUrdmtFWU5ZMEFDK3Budi81bkFyV1JqOFV1?=
 =?utf-8?B?RUVoUnExSmFyYjR0QWlweUFKWWE4NTFnenFNNVJQZlNFdUFvdFo5Vjd6Vi94?=
 =?utf-8?B?SUVxS2VZRjFqOE5XNjcrSWE5ZXJLSnFtL29SKzhEQ3g0ejErcW50TmpDVmo3?=
 =?utf-8?B?cmpqbHpHWjFoc1VvRXhyTmJTNlc4S0dSV1F2N3ZBVlcxOXRLSGQ0QmNXdFhJ?=
 =?utf-8?B?WkFHQWNJVFRxQWJTU0RkbDRBN1ZZVXRadURjalBYMVhLTmY5b0JjTDRMTWhK?=
 =?utf-8?B?ZW5vMk5ubUZjMGlMRXJ2MzBwU1EzMjEwb0lkS1IrMmV4VVBHT0JZeVdlc3d1?=
 =?utf-8?B?VEt5NlJIdHBFUVJXVEQ5cGxGY0pKMHhUZ2d4Njh6eDdaUGtxWGQ5d2tBOSsy?=
 =?utf-8?B?WEFScDIxd0Jmd1FYL01aMDZtVkRjWk9pNENNSE52L1MwbkI3VUozZmV2aHlM?=
 =?utf-8?B?VkMvVVhNM01IVkhLTVd4eTJqRkFUNWV4VkJzR2hFbmRScVNpbUh1STVzMVdU?=
 =?utf-8?Q?nexvRxzur7IMIqjQoYHDrWeLR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de93126-7293-4b89-0808-08dbce4afd63
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:22:47.8462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPcaFUIiVGPu7kK+JFm3Z+9Y4F5najwKOvkYT0PDsAdqzKTkVLfdLJLJCJLGNKis39njpBOGHJsdWHJ2lIM+9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

On 06.10.2023 18:01, Andrew Cooper wrote:
> On 06/10/2023 4:09 pm, Julien Grall wrote:
>>
>>
>> On 06/10/2023 15:44, Andrew Cooper wrote:
>>> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>
>>> Adds a new compile-time flag to allow disabling PDX compression and
>>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>>> conversion macros and creates stubs for masking functions.
>>>
>>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag. 
>>> Despite the
>>> illusion of choice, it was not optional.
>>>
>>> There are ARM and PPC platforms with sparse RAM banks - leave compression
>>> active by default there.  OTOH, there are no known production x86
>>> systems with
>>> sparse RAM banks, so disable compression.  This decision can be
>>> revisited if
>>> such a platform comes along.
>>
>> (Process remarks rather than the code itself)
>>
>> Jan is away this week so I want to make sure this doesn't go in without
>> him having a say.
>>
>> While I don't particularly care about the approach taken for x86, Jan
>> voiced concerned with this approach and so far I didn't see any
>> conclusion. If there is any, then please point me to them.
>>
>> For the record, the objections from Jan are in [1]. If we want to ignore
>> them, then I think we need a vote. Possibly only from the x86 folks (?).
> 
> What do you think the 2 x86 maintainer tags on this patch in this exact
> form, following far too much wasted time already, represents.  The vote
> has already concluded.

In a reply separate from his R-b he also said "I would be fine in leaving
the option to be selected if ...", so I don't think you can count tags as
votes. As much as you apparently have a hard time seeing why I want the
option to remain available (despite knowing why I introduced PDX back at
the time), I'm having a hard time seeing why you want it unilaterally off
(and I'm afraid I haven't seen any reasoning beyond you simply not liking
that code, and you also not having liked my earlier attempts to overcome
the undue overhead).

Jan

