Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F42731870
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 14:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549554.858134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9lrW-0005Cf-3Y; Thu, 15 Jun 2023 12:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549554.858134; Thu, 15 Jun 2023 12:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9lrW-0005An-05; Thu, 15 Jun 2023 12:14:02 +0000
Received: by outflank-mailman (input) for mailman id 549554;
 Thu, 15 Jun 2023 12:14:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9lrU-0005Ah-D7
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 12:14:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a9a60ec-0b76-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 14:13:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9255.eurprd04.prod.outlook.com (2603:10a6:102:2bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 12:13:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 12:13:56 +0000
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
X-Inumbo-ID: 1a9a60ec-0b76-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvajeFiRAF/tjnzJ8sf+pkvbyXX2ley68oI7CMCid+8PXG6bt1L68Pt4LSNNwi0/b5QBGOQ8r4NOpY2FdrzmsTyj4YXqq4VuVH3dWjUozmZuajdhj0gG6ibq9izhv1pFzIcRTk+nyfF9cXAPZ8Ye5ZGLF+RLimKjYNALqVL+pNOCwsLhl6T32hic41jaP1RET8CnuRs8Okr6ml8xsYZLjWksCPSE/nH/GjPCR+8QPWze26CYBu56HbEnUg4NZvmRYIgnqMdKXBXpc6cEnRha7t4n/gpaOV6R7ILt2gzs7w9RdlKW3bFbPSZc+WNJcoqKqXlBLlPa/AAktJaGYy9ulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUi551lm4BRhVLFxi737l/DCWqxATAKVq3LGR+0ap6E=;
 b=a1tfkuNqxIOQXYcRTefhe8pQtqpTkzIhlVTGw70DPEEozUOlBrWFP5hTOvJA0eHDGNuUrWVHncjY3XmDRz0fz4NxqtKpYdTyCZv7wjDojhc6533/dJjeOwgZrzr/211/ubL8TnMbfov6GmYTaX6495mN61aZiiOJaOMVoWDcSEDtxtXOicfgxnD0vGxYxT4fR/DQXpKrwPdXRP83RD44fhaJCnNO6ELw5/fITqk3F/EuDYN0cJsqWP4cKnYQrT1VE9jZXNSifTJLZoVgP0i0IQaA+OSUx2vvEFmO8RKxbuuL36QnM/SxyI2oHLMuJyMPWhuG61xoxyXZ0IK8cxSLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUi551lm4BRhVLFxi737l/DCWqxATAKVq3LGR+0ap6E=;
 b=VfqK+XmeG/cB94bCcW9/wBp0BEbUlYcKC34Hjn5bK/b/XABAAuYFlWuBmnKFP2IZND3397tiMRDYbo/mz0EXZOuUPDF+eDicf1XCJrW3lnbdxjcC8p0cKiARfD0vQLuSmwoHlhNWhMYIesC5s9Z4bUz/J/Oy8gCmEbevpGa9BgZqan3tkN/YXLNiWmDYHblUnstOTYEkPU8D1CVkCfr6kZbhUcFn7gZrK8NJjkD+B5n0U/vA+Fv2kAYmFumFr88G01/lzdbmXPIqMmpTsWJNZODUqBdVR8cUX1YizaWwg86XscrNp2qDZqC8YSkGKTn6grv/g44wu5LtCNCV8zIJqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35ac1ede-73ed-c748-9eae-06b156145274@suse.com>
Date: Thu, 15 Jun 2023 14:13:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
 <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
 <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
 <cf30658c-daa9-7e4a-11e2-c56e4513fd8a@suse.com>
 <8a44c577-07e4-fbc4-d402-efa581042079@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8a44c577-07e4-fbc4-d402-efa581042079@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c6ab4e-5b81-4b15-4d87-08db6d99fdbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z8i2/udHsYPYhGm91zxe5swRSp8BeUdda6byqi+7QTLrsWMz2AiUxEnkJoXXA6kB0R4po1APcCbdg8Bd8mhICetacgVxlOai6GWmPT4Wyuz0bX9Uwg4eGgPdBIw/WEvtlZeJ/lb7ScZVd4LUMmpL/tuMM0bQP5yoQtzTpyrF3muRhxhm45X7iUBrb+Yh0+Fo5kmZ+KKUm0LS2ynvC/ltsa5bMhfyTsMlE2i5fYMH+aRMxyRasVrW0HsHiaSbifJRNQMH858ddrSpJdhbZ8IOegecLABt4h2I8rcn76IUt3XLeuTxchTIFepxTGGE//73BO8ju/NXOmz2kzwg2DngWBk3dNNA7+9DLMM3YyuDmqm8vV5IxuXPbbGW4FyFUCHBr93Zfa7ikkmIEWBIDDuwch8qOcpinQbvKF2k127Y72APzddY/Xb9qQBnRmr6wNlGLMoZSm/CfsHGRiDlWIbt9YK+4lEIdG50P9Rs0/kkTN1K+HqkbbvJgMrdCfQM9OXDKCqLFCof7R/pCJOzdNvw58hyppVmTSnEAI//BAHdGdPzhMF+tK1BOKr2dK7KEZ/7EDKDUabvsydR2n8DTB97hdjdn/okhsYbGFkN3NpWacdPh3Z0GyHQwMJPyDXNfA4zeonNnARrTXhk2kXYJ/UHIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(36756003)(86362001)(31696002)(2906002)(31686004)(6486002)(83380400001)(6666004)(186003)(6506007)(26005)(53546011)(6512007)(478600001)(54906003)(4326008)(66556008)(6916009)(66476007)(316002)(38100700002)(66946007)(2616005)(8676002)(41300700001)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2g0bkJSTWthSUpma05hbGVQRkR4azhHaDJoVWtUSUxCS0dhSWcrVENXaTRn?=
 =?utf-8?B?Vm1acVVnODVMZWlxSUp2YzF6OWZpT0pzd29sQkxZOTU5dncvNWJyQkRHWW1t?=
 =?utf-8?B?bisrSkZYb0tvUnZvZ044SUpXdWZGNk5DdDZsbmJPdjVjLzRTUmhLRjhxT0ZF?=
 =?utf-8?B?Vnd5ZHpubGtobWVUTHRTK082amJ2OFdKR05KbkhaRm5ncUJVeEVqT0pqMTJO?=
 =?utf-8?B?LzNab29PMm9RcU5rS3JIVWtLQ0Z4aWxQdGpXbkFlbDVVVnFoWWdsVTlYKy9Z?=
 =?utf-8?B?ZDV6Q0RqVmFmK3BmSWh4Z0grUzlWTEhWNDNuMWY4S0ZGYjNPMDdyclVXMng5?=
 =?utf-8?B?U1AvS29LWDJrZVVaZGZNNFJ2YXhSTHIvUU9iaEk4cmkyWlpWVDBmYkI5NDZl?=
 =?utf-8?B?ckFQZVJ4cmxyQ0pPY3dnNHRVSWcrMDV5Y1VoR2xVcHdOeERBL2lSWEx3OFI2?=
 =?utf-8?B?TFlwcnF4aXJ3bGZzVVdJZGI0ZDczSUx3T3RiNTFlWUc3SnFOTXhVQ3Foc1Ur?=
 =?utf-8?B?QnRuWGdLODZhMzhERmpUdFJoaW9UelBYZkVmZW5Cb25HOXRwMjN5RDhnUnJC?=
 =?utf-8?B?K3B0M3BCQ2JOcDZodWFYMzFLZzQ3Q0RJbHNFdzV3bm8wTklNYytHdjRRZlY0?=
 =?utf-8?B?bWxCTW1Dejdla2ZwNWVBQTNjN040bGRVMmJpV2hoS1dQczZTQ3J6UFRySFVv?=
 =?utf-8?B?WFRPZHl2UkFnNmJHaUdkeERSdFdxUTJGeEVGZzJWSE54QjdrNkRUNDF0NGl1?=
 =?utf-8?B?NEF5NTdsNVA4OG9ReW1tbUNTOHFBbGZzazZFMkJqbmFLbTVzVzR2UU1EWFF2?=
 =?utf-8?B?a1NTMCtNRVNkY3dVVWtabTNsdFlWak9EWUxqVDRHeEwwcGhyVGl1NmJCVDBD?=
 =?utf-8?B?bWc1RWZKTlpjNGhucjFSTUkvcnZ4VXBxNXJCRXRQbmdBZlNINlYxWU5mcnNI?=
 =?utf-8?B?cTVoYVk3aVZQaWJVWEpIc3RVaEtGUFVsanNzOGUyVWw3OUFPSStJNml5MTZV?=
 =?utf-8?B?ZEV2SU0xeFl0MjR6c1M0dUQ2TnNXRzcvODhVeUVWZm1tMVQ3cjd1aUNOWCtw?=
 =?utf-8?B?TWpLSCtCNzZhZWVaT3NPQ0NzQTJuOS9mQnE3dWliT0dEaUVya05RYTBGbTZ5?=
 =?utf-8?B?eHB6RU1TTmhCNGtkSndZR2dtZEc2Q1I0eitYMm00T3d4Sy9ySVZySldBTkp2?=
 =?utf-8?B?U2NadGVqQVJDOGJLRWs4K241cEhZM1M0cjFhTU5XRjlzaDNvSG45V1Y1UER0?=
 =?utf-8?B?U1JicXNva01USGRUNnhoS0VSSUM1RFFiVktNMEk1cU1GdU5udlkvbXIvcFJI?=
 =?utf-8?B?Wm9QTGlIZFBzWitaUi96SjExWTFSNFNYM1kxS1lBRlAxdmpvRW1yQ005bG9l?=
 =?utf-8?B?SVdIQWR2MU9ZRFhhNzFKQkxpRlVxN3pEYkpyb0VseGNJRUVoWFRWKzB3ZWFD?=
 =?utf-8?B?UWhCeUVhRVBVU3NMeTNUQ1Rza1Z2cXROV1dFczdHdmpOaFQzUmR6dmIveXJJ?=
 =?utf-8?B?TGFjL2NobHRQYjFsWWh4d09hVE05NUdMQkhhSCtIZXRkbmYzMjdKckV5Vmcz?=
 =?utf-8?B?K3hTNEdJV2tocHhURE9NY1k3MGtvN1BGTVBsMDRnS2NFOXF4YXJFbU5ERVZK?=
 =?utf-8?B?ZGgrT0FGRENnWU85L1NlbzVEZnRzbVpDNFcyYWJoaUtRejdlanVwNHI3Zk5p?=
 =?utf-8?B?UTV3Z3M3U2l0eUQrOHFBTGJrTkxGOUx6eDJXaEhoOC93cUt1MXlESDdEaFVx?=
 =?utf-8?B?clc0S0lxZU5QRnArUTZBUnlKazVQYWxMT2ZFL01VdWliRFZFbUgzNlIyemFn?=
 =?utf-8?B?N01ISkhmWm83VXpZRU05ZEtkZDREUlZWN0FSU0N4Y2dOZG5oWkI2OURiUUhP?=
 =?utf-8?B?a0x0d0dPODdnMG5FR1ovZmVnRDk5SGw5NkVCczFRS3d1TVU0UW42SmRkQlFI?=
 =?utf-8?B?RE9ITTdZWGdGQlA4aVd0QjJhcVVVclFvSklVL0Uxd0ZMeGpaa3NObFRKQmhQ?=
 =?utf-8?B?Qk96anp2NnpaVnZvTmFnSEQ3RDZqQWZHbmYwVlRBekQ1WC9Oa3lPTmNPMnRU?=
 =?utf-8?B?dGpBK2FQTDdhb2JpRDBOdEJFY3NUYTVHRmdkOFIxclZiRSs0cG1raFAvYmNN?=
 =?utf-8?Q?HJLHockdGWFzrUlG+qnIAt4rZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c6ab4e-5b81-4b15-4d87-08db6d99fdbf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 12:13:55.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2KInLrdh1WFHhzZ0trs1cUJtafJd6vqQQDb4cfgaoO4/vfgP6C1bj2Oj/6D+RijQYEPXifyC/Cuz3LT7JOh0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9255

On 15.06.2023 12:41, Andrew Cooper wrote:
> On 15/06/2023 9:30 am, Jan Beulich wrote:
>> On 14.06.2023 20:12, Andrew Cooper wrote:
>>> On 13/06/2023 10:59 am, Jan Beulich wrote:
>>>> On 12.06.2023 18:13, Andrew Cooper wrote:
>>>>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>>>>> predictors when empty.  From a practical point of view, this mean "Retpoline
>>>>> not safe".
>>>>>
>>>>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>>>>> statement that IBRS is implemented in hardware (as opposed to the form
>>>>> retrofitted to existing CPUs in microcode).
>>>>>
>>>>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>>>>> property that predictions are tagged with the mode in which they were learnt.
>>>>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>>>>> alternative predictors but restricted to the current prediction mode".  As
>>>>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>>>>
>>>>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>>>>
>>>>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>>>>> linked, absolutely nothing good can come of letting the guest see RRSBA
>>>>> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
>>>>> this dependency to simplify the max derivation logic.
>>>>>
>>>>> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
>>>>> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
>>>>> "somewhere you might run, Retpoline isn't safe".
>>>>>
>>>>> The default policies are more complicated.  A guest shouldn't see both bits,
>>>>> but it needs to see one if the current host suffers from any form of RSBA, and
>>>>> which bit it needs to see depends on whether eIBRS is visible or not.
>>>>> Therefore, the calculation must be performed after sanitise_featureset().
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>> CC: Wei Liu <wl@xen.org>
>>>>>
>>>>> v3:
>>>>>  * Minor commit message adjustment.
>>>>>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.
>>>> With this dropped, with the title not saying "max/default", and with
>>>> the description also not mentioning "live" policies at all, I don't
>>>> think this patch is self-consistent (meaning in particular: leaving
>>>> aside the fact that there's no way right now to requests e.g. both
>>>> RSBA and RRSBA for a guest; aiui it is possible for Dom0).
>>>>
>>>> As you may imagine I'm also curious why you decided to drop this.
>>> Because when I tried doing levelling in Xapi, I remembered why I did it
>>> the way I did in v1, and why the v2 way was wrong.
>>>
>>> Xen cannot safely edit what the toolstack provides, so must not. 
>> And this is the part I don't understand: Why can't we correct the
>> (EIBRS,RSBA,RRSBA) tuple to a combination that is "legal"? At least
>> as long as ...
>>
>>> Instead, failing the set_policy() call is an option, and is what we want
>>> to do longterm,
>> ... we aren't there.
>>
>>> but also happens to be wrong too in this case. An admin
>>> may know that a VM isn't using retpoline, and may need to migrate it
>>> anyway for a number of reasons, so any safety checks need to be in the
>>> toolstack, and need to be overrideable with something like --force.
>> Possibly leading to an inconsistent policy exposed to a guest? I
>> guess this may be the only option when we can't really resolve an
>> ambiguity, but that isn't the case here, is it?
> 
> Wrong.  Xen does not have any knowledge of other hosts the VM might
> migrate to.
> 
> So while Xen can spot problem combinations *on this host*, which way to
> correct the problem combination depends on where the VM might migrate to.

I actually view this as two different levels: With a flawed policy, the
guest is liable to not work correctly at all. No point thinking about
it being able to migrate. With a fixed up policy it may fail to migrate,
but it'll at least work otherwise.

Jan

