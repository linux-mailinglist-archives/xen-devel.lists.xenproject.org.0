Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F962D4E1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 09:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444566.699843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ova6U-0005Sr-17; Thu, 17 Nov 2022 08:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444566.699843; Thu, 17 Nov 2022 08:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ova6T-0005Qj-UP; Thu, 17 Nov 2022 08:18:33 +0000
Received: by outflank-mailman (input) for mailman id 444566;
 Thu, 17 Nov 2022 08:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ova6T-0005Qd-0h
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 08:18:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a75e3e6-6650-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 09:18:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 08:18:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 08:18:27 +0000
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
X-Inumbo-ID: 6a75e3e6-6650-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIBtvIRW560ljuuPyLHWVChTk20MJmUp2lj9cs2MWz2kbGPbUSZnXmf6tU/CLP5pamP9W2cgjBT7sjnYXxQMReOhuGfQHdePy/H3lvFIYdUQGPibR9bQi/rNXaNyLyFw1ZYYU+qQZYGfAWaQcwysmSuKnfcxYsI3GHbkHJsREDr3hjEmWJGnm+tdZjPQHZOHl1QQ3GKa5NnKDhg7qs+prLQwOY+SbXRrpfloDpS0ysPDCOsoojrJVvSDH2MHC6RFGkOsOM5aeBZtNiWhs3KTbZ7dH3HFa39ucOUHwEJ+Colncea2JUdgozTc+Uu7DW4SW4dj1qDWzyG702zzEPWfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV6QUFEY9vlzYTTsEbqFIs+0kvYepxwj+YmoHgkufPM=;
 b=mofRmUUYLvW6tKTpb0NWIO7h/cfom8Rq7FFTciuPoUMIidsyYuwPFhV9zpBgOxwJLeKFzivJ+/YE8SswVPsXyrERdqGtYXxU7FGukIb9YBUMk36dM4mJxQHUwQ8SY+tfL9Wiyommws6R9iGCX0+yiMhsgNfdvdn1WBpbGfmBdlbHyM8CeeREmIarqlrrTZCkDU0tzEaNRfYv8nUngGtikYjSeD2wHVJbPwlZMLenHdAGmqRszKVhQKBfe4cjeMDz3HfPe/K0Iqcm10TeaKVTVOgj+2dwr4ZR4CAPnrTzWgVBBqEB8GdXgJD6Wql/G7kEP4ZIqMb8IhMWfO759bybVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV6QUFEY9vlzYTTsEbqFIs+0kvYepxwj+YmoHgkufPM=;
 b=uROWZ04Nc0bciUzDh0fMJxL0zl88CkmqhKWSwVvFEJQL0VSSjPTOnwaBG1Q62OtVAcCRKHZxfEeqpRvpE1888Ec9M6h/RTCbpWzzDTdDBYnOglKjwMKgU2ht28tyAy8XArUD52O9J5XbJUZybsNKfKOvQHRNj1o0XDrbR9Ob5yJA/Q2Uk4kjw6iHek5glGjnYvGLEy0Nrm/oZzbDiF+YmblfVkBi+rvJP7rYXr3mxmHh4HzsQE6ysUGwKIdNTURGzC8T1qB6ix1SsFB4fmCGH2I8AE83r1ddXpNcNpk+y8X8cVhF3+WNoqexBuauWuE1OU9NYrCyFjpuKPeP9jmOog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e2e79fc-efe0-501b-e80e-c98748c9babe@suse.com>
Date: Thu, 17 Nov 2022 09:18:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Xen Security Team <security@xen.org>, Roger Pau Monne
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2211151724320.4020@ubuntu-linux-20-04-desktop>
 <c0ba7b0f-d91f-74f2-be4a-3cb944392c95@citrix.com>
 <alpine.DEB.2.22.394.2211151759480.4020@ubuntu-linux-20-04-desktop>
 <ddb3dd9b-8697-1fe8-2dcc-2b5b859d18f6@suse.com>
 <269f4e70-07c2-5cf6-f42e-6f98e2ce70dd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <269f4e70-07c2-5cf6-f42e-6f98e2ce70dd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c111cf3-c539-42ef-17db-08dac8744dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lXyaJ9zf9s0gCkKZoo08MdGSjPPiBDyHCtA/IpehU2EOHXdkZO4tdk3K51XyPU/SXap9g3lfKhy0Zf7M3vo9EYmcKN97ALO8UlKe05lkT+/74t4obKz1iE15dTgbJV47LtdMBY82eTwnmvp7xvjNL6B8r7ManMoAk/KgdCfqmepyOpTPF9tI/xHtfEMKAg+ggrzOWE44ZHLV7V+ijcoDnLNoOf/oS62b5BnbnCQk6lxgfShitFRj/78VtwEmy1t/1nGW8LH5+7ofOT7uTGcKlaKiAtYobHUq733/9JgXwZopaZZpbGm9U0hEgdbvmqu8sn9krDgGxnxBGuxy5Rk630q0byn6CtH489LenFCsjlI564BDKmA9dfEL6VDwqxvJrGfW8Vl7oPi/RU5k9thN+oAdyTn0Zo0tTQDzGgHMUMlq8Jr0wFvJckgHERvPU05rZ6svnUf/wJoyEt3CqSnpm7ABmpDGHUwtlLj239Ar/+wF3I/k9qXTk7Y9V17JLvx+1+/KKcXTQUmGuSnCOtVxKyt809KphXpB092rfrzamHF27uBKeEEtBCr4iGG51bxdOkf7vby2cAmkTqJb0fcoF8pHt/4Q0SY1MwoHHRLcjYUeHVNZ2KuhB1S1APq8+W9ldjBTHWi46hSeG1PkOdT/8wuEMi1bHFstNAuB4eLVLW4Tw+BZq4CEsYJLp30adqFRgl/+gQuIcwTnTL9bt4MOSDpchiVam3SAz16v2TO2Jps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(53546011)(6512007)(6506007)(86362001)(54906003)(6486002)(6916009)(36756003)(26005)(478600001)(38100700002)(31696002)(2616005)(2906002)(186003)(83380400001)(7416002)(8936002)(316002)(31686004)(41300700001)(8676002)(66476007)(66556008)(4326008)(66899015)(5660300002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emc0bng0Z1pzZjlvL2RSWXNRTDlxeGdxVHR4SG92ZFlNZUh6eCttQ0NVT3hw?=
 =?utf-8?B?SUlHV3ptZ3c3VFFsTk5wL3FTRU1nY3dGcHVOcGxnR2ZjS2RhU1FiTGJnbmhx?=
 =?utf-8?B?SmFpa0VlcGtoWGpPbTE0MnZDZ0Y1bDNJZmlXcWE5elZsVDYzY3hTc2VHSHhl?=
 =?utf-8?B?L0ZVS2FvZ0lRV1Buc1NjVE5GSUlVRDRxOHBhbHhqc3ZOLzUwT1U0RU5lSTda?=
 =?utf-8?B?VHM0d1JDcUJ5UHdEcHRXUk8wSGhTTDhpeEJwMVhMUCtvUlhtMy9EcTZEYjY3?=
 =?utf-8?B?YnZTbStNaDNueXIvMW43OG9td1Rtb0V2SEdhem1LdEdyYnBCUXJtQW1ESVgy?=
 =?utf-8?B?L0xnTXkxT2svelVvVXVZSklRWGtYNXZYbWRMYkoyQkRxQmpMallRZG5EVXRJ?=
 =?utf-8?B?NklVTThjUTU3RUVwb0h0WnBWZmlsOXc3cWppL0ZNTGMvazdOK3hMWG91K3R5?=
 =?utf-8?B?bG1PWUNQTlhQUVhTeUZUOXMwU2RBdW82Q2lUTm56akNmVnY0cWJzRGdkNmRi?=
 =?utf-8?B?WThvMWN2czRWUFhUejVpQUkvMmtoMTFvSUZxWndqRGFvbGdtQUZ5ZS9nQnJh?=
 =?utf-8?B?dldRZEZwZ2QvdWRZbFI0Z2xpN3RKblZZNDdaeTRSYUg2d1lxK3M0TW1OZEhs?=
 =?utf-8?B?eWFLQ0M5MWhUbFBNdGVYdGxkRFM1cmhWRzJpbm5iQWdIWnRTcXVxMVhpUDNN?=
 =?utf-8?B?aHFXbFRqdGpzMWRQUnYvNDRGRWV4VmRkdWs3VkdyZGJwcnJmV3lTRXE1T0VF?=
 =?utf-8?B?SlNteVZiYUVPOEpzb0piTFhzbVR5bEpVL0xnSXo3ekpnUzdoclNKYWpScGZ4?=
 =?utf-8?B?QmpUV003RDhrS09kUFBWWEpoYVpnZXNPS3dTOWJPRFg0cUVraGRIQ0xpMFUw?=
 =?utf-8?B?TG96clJnSEpRMzBYempOaklSeG8rb3d6bFJrUEdIMlJkY0FOeHRXd0dneUJs?=
 =?utf-8?B?VVNoektmU1lGSEU5aml3Z084SW04M2xBc3VZWHdoby9uZjBsTjlDRGhPdklS?=
 =?utf-8?B?N3ZZN1RwR21qZkVxSTJocWtwTkp1OUdTRDY1WGFsbmJCc2ZibDhLM1Z1eUNF?=
 =?utf-8?B?QzYrVUZpRkNkREpWa0s5M0NHOE5TbkVsekNqRHhHZEFpNWdMMmJtTllvUGZZ?=
 =?utf-8?B?QXdteWdFTGZWdCtFY2RPT2cxTGFQSEhDd1hTQTNrVmZURlZNY1RjcmFDdDB6?=
 =?utf-8?B?THV0L0gzdjFYSFhHd3ZZVm9jazNRUnFuenJzdkJHMU9xRUJ0YWsvdmJCS1JV?=
 =?utf-8?B?d1QrYXhPM0poaUNGQlFNK1BOdzZWek5zK1ZLY0RHQmlxWkZCUXB2Y3dNOWdn?=
 =?utf-8?B?MTBLTVUxYzBHZ08xZGpuRE5NMEV5RS80NDlLeTYydmtFdTBLM2wzdmQySGlS?=
 =?utf-8?B?d2IwaEczZFNTNTJodldkSDVZZTRpSExlYVk0Z0NoS08ybmVYcFQ0UXpaNDl0?=
 =?utf-8?B?bnlGcnRrTnZDWXYyYmhsdzNweXNHaWRBcGpxcGJwZE5NQ3l0YmJaaE81dGtI?=
 =?utf-8?B?QlJybTVkYmQzd29YNHlrVWJzeG96WlJraDdKaWhTcnp3cjhVSExkN1Uwc2pw?=
 =?utf-8?B?bXVXaU94RExDYzkwOGVkOGUwclF6eWx2RmtuSnZXVS9nZGw1UGVaYk92Z3RS?=
 =?utf-8?B?Ymw3eDNxd2JiSU9zcTdkZ1RRK2dZNnk2ajlPS2t2SnhNNmcyMmJRRnJyaGFY?=
 =?utf-8?B?c2Q4Q2VPNXFycG1Sa3NSRldUNzQ2QlJ2VE5QQTVpOHowVytuVTlNblVqK21i?=
 =?utf-8?B?NDdPWEpMKzZxSUU1MUVHbmJXeVRWaG5xWkVmNnZnUTdsOWlkYXJMN2JhMXE4?=
 =?utf-8?B?TmhlZE42QjJIaGY3aTU3S3JYbUNOR3ZNZnlOSU5NVUo1a2VCS3Q2MVNDL1NV?=
 =?utf-8?B?TDFsVnd6eHVjRmRaUG5Rc1QxT1R2WVoxQUV6eExMTGs1d0tlVW1XQUk1R1dq?=
 =?utf-8?B?OU1Bd1BtVTdhNFNRZnNpbURoNExKOHJCT3FFRXBOVmhQYzc2YTZKc1NScWw3?=
 =?utf-8?B?WjJ1azBXOHgrUzlUVW9pNUx1Rm1RTUx4NXhFaGRGL2dZMkZHcnBEMmhkMkJV?=
 =?utf-8?B?eTErVFhYRVpFdHE1NnpxQ0ZCYmxta01tOXpoM0N4WlpndkVidWE4TFBqSTRH?=
 =?utf-8?Q?5tQtMJ62bV8w+iJ/Syb8dHQwD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c111cf3-c539-42ef-17db-08dac8744dec
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 08:18:27.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFp/IRNCtBHCTmcan4/8dN/brxRGDOyAwhH3Qt7/lI6f37SzVFw/jXoFlFfztHzMFnfkIpGmnMxvmA1+YjWyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

On 17.11.2022 00:41, Andrew Cooper wrote:
> On 16/11/2022 08:30, Jan Beulich wrote:
>> On 16.11.2022 03:00, Stefano Stabellini wrote:
>>> On Wed, 16 Nov 2022, Andrew Cooper wrote:
>>>> On 16/11/2022 01:37, Stefano Stabellini wrote:
>>>>> On Wed, 26 Oct 2022, Andrew Cooper wrote:
>>>>>> This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
>>>>>> of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
>>>>>>
>>>>>> First of all, with ARM borrowing x86's implementation, the logic to set the
>>>>>> pool size should have been common, not duplicated.  Introduce
>>>>>> libxl__domain_set_p2m_pool_size() as a shared implementation, and use it from
>>>>>> the ARM and x86 paths.  It is left as an exercise to the reader to judge how
>>>>>> libxl/xl can reasonably function without the ability to query the pool size...
>>>>>>
>>>>>> Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
>>>>>> replaced with a working and unit tested interface.
>>>>>>
>>>>>> This is part of XSA-409 / CVE-2022-33747.
>>>>> Genuine question: I can see this patch removes the implementation of
>>>>> XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION on ARM. It also switches libxl (both
>>>>> ARM and x86) to the new hypercall.
>>>>>
>>>>> Why keep the old hypercall (XEN_DOMCTL_shadow_op and
>>>>> XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION) implementation on x86 (not on ARM)?
>>>>>
>>>>> Is that because it was only recently implemented? And not actually
>>>>> present in any past Xen release?
>>>>>
>>>>> If so, please add a note about this in the commit message. Also, if that
>>>>> is the case, I think this patch series should go in 4.17. If it is too
>>>>> late to get it in before the release, then we should backport it to 4.17
>>>>> as soon as possible. That's because ideally we want to keep the
>>>>> hypercall interface changes down to a minimum.
>>>> On ARM, the hypercall has existed for a little over 4 weeks, and isn't
>>>> in any released version of Xen (yet).
>>>>
>>>> On x86, the hypercall has existed for more than a decade, and has known
>>>> out-of-tree users.  It needs to be deprecated properly, which in this
>>>> case means "phased out in the 4.18 cycle once known callers have been
>>>> adapted to the new hypercall".
>>> Understoon. Then I am in favor of getting all 4 patches in 4.17, either
>>> before the release or via backports.
>> Removing something from the domctl interface generally requires bumping
>> the interface version, so some extra care may need applying if such an
>> interface change was to be backported to any stable branch.
> 
> To be clear, I have no plans to remove the x86 "older" interface in this
> patch series.  It will definitely break out of tree users.
> 
> In the 4.18 timeframe, we can see about retiring the older hypercalls,
> but as a non-backportable change.

Sure, but I was referring to the (pretty new) Arm incarnation thereof.

Jan

