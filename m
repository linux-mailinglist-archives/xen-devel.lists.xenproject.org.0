Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B86FCAF5
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532330.828493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPzj-0004e2-4h; Tue, 09 May 2023 16:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532330.828493; Tue, 09 May 2023 16:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPzj-0004bX-1g; Tue, 09 May 2023 16:15:19 +0000
Received: by outflank-mailman (input) for mailman id 532330;
 Tue, 09 May 2023 16:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwPzh-0004bR-MH
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:15:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae815f62-ee84-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 18:15:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8049.eurprd04.prod.outlook.com (2603:10a6:20b:24c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 16:15:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 16:15:13 +0000
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
X-Inumbo-ID: ae815f62-ee84-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3tMZ6ZYotA8Ewj5tUIu1Zj2u/lpR+hB2P0aeadaas8qRryrHVUOCqK8/QGuYAWCYY4IH//qFulHtVNPO3Jt0IihYewOdHTq5mI5jXSOXdsU/DUl3xyMlWKZi/jdaUE48unrUIjEbmU5KaxTT4C74G6Ik6+XbAsXOGPkhJrrtuXHqqa8I0p0c2p+5vNH4SjoLGsYCoMIgZiLVsnCPkaMA8I3jX1kNq0BcEDZefqIBydVJZy3T5IOziw5JjqvwjfXVE0/att9TRJAPCyIRg10c/qljkYAEAfMhr9xbe9hDCPvHYyOVC4nEhxw09h6qPi2wNGZDC4R0aeugErKfy4+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FgRHNRZj2MMTYp9um+pHQVsDSUaxkxUPLIFhyLAB1k=;
 b=W+V3QvBxqvug9uz+8va+V0BE1iwd3uWMEHJkCIyxUq1fHRFRgNPhbywF6KbiwWSo2H3qUi/MLcH+yjewSal4DqblBqDUBDBULanHgOKkT+XfPvkwahldj+gOYk3DtYfYM4bGHMY79wGybu0FRza1RkxX1us+ATa4qxd7y9M7VQdMkusmTQoKEppsWLkhQnT7BHgvvto/wrW1S6YhOea6qQ4C5Uy6aA/qH+aOVm/EcMyVEoIWeUE77lz4ggE7TXVfKduG2LI/1F+UPrABAABwkZxeVQmE2Q5EXGy8IcoN8+l1lkt/OSS7DmLAihBgY/+PXcSHqdx0oKDSzGXB/z3wCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FgRHNRZj2MMTYp9um+pHQVsDSUaxkxUPLIFhyLAB1k=;
 b=auXvdM3Kgq+oM6v8dAh7iP7im5kzGGj81esxqR0a9w5er7DeqfZ+HVdUYmCThyV5wrUETBXVfB17HZxCb7lPB3avLo7dPSGe/XjCvBBvjJ5t22AiUwmKM7Jo6N+C6D2/RrxPJUbMSIAyn8+HP3lxly4yEXrULLRHCfi1zPmBWw4LpHtGszQ2Bc+XP8R6DATZx17IHV8LeBw77Vr7P85SJynqdbES8o4FR6B/kYnElqMJ7e8MuNIxG+8kCZWxpITakqChoujNRtSU7ghkNR8kyd5te6IlnqRCHLAcDMZMLldQKQ96tICB/unuQv7OTq3opSIaYl61MzopVAYA3ZYwkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8cb1df9-33af-8cae-291d-9a86a3b7f6b9@suse.com>
Date: Tue, 9 May 2023 18:15:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
 <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
 <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
 <bbbd4c8b-e681-f785-b85c-474b380d6160@suse.com>
 <742a5807-dd53-0cd1-d478-aed567d5c4f5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <742a5807-dd53-0cd1-d478-aed567d5c4f5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c28b2d-a34e-4b8e-295b-08db50a891e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l2ldSbNk8sG+PFu2iuDo8u9Ub4ELY6/NQFIIPEdh9BkqiHRcbyFmMaIUZYmhu0Ikoy3DBjhUqwfzbVP3MSmK9dHpaPsoQgcXUrGcAiE6yvoMWJ4/0rPGUGtjLLhtTL+bYFbOzRkWtOQoa7RWVzGT6xhEeReqENpEBpb4cDhpQE18jAGQMUfVs4DgBqvY1BIPpJ60OyrlDikwuOAD8ts8i1+EQqJR3RPGmMk0rCpXWFwODWlXlErytfD7Qc1ItDTGLLIZjCYVDhTqoMQ0iF9VFJflsCSlvaXinkLALqBJ1kHjoo4En4wzEXsM6apTWI9e8Rb0l1W9x1yrBHoEeDWQvoqMjc/WIU9vf1VS4/lqiaNYvQ7MVucaV3fn+W3Ck1ztuBi7/JJ+jDIy5zp9PQBopugyE91Mu4w04DfPgb+G3gu1qg226TVOfKIOzRSoJkXJvC8wB9XmHFfS1MDHiME3NGTibVHO7OAB/+H05VhcZMMFDRTSzxgtYNYkbolxqB8mDVx00xmc4ft6TDevAiPvMz3gss9AEgr9RVwmW01Tkf8mwWEBuQlnhC6VhKhzDRGK2v+Tgr278p6V2TOHdjUTQBwsOWgzxdYQngNfcsi98eHYj1RD5qEsHgPreFRW9Ubvpj9Lm7LXVbufSa0b8T9/RA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(54906003)(86362001)(31696002)(31686004)(316002)(6486002)(66476007)(66946007)(41300700001)(4326008)(66556008)(6916009)(5660300002)(8936002)(8676002)(478600001)(6512007)(186003)(38100700002)(6506007)(26005)(2906002)(53546011)(2616005)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNzRXRMdmpQZEhiUFV5SEl6b1pOQ2o3Z2RNWHBjenZlU2lwaEs2VExtdytp?=
 =?utf-8?B?MGdCU1ZPcFgvb3Jzdk1teHVBME1WRDYzNmRwS1FnT3JoUWRyQjNWU29DY0pU?=
 =?utf-8?B?eVNNdllTMUE3c0VxdExzZDE2VkFaVXBrdXMram13VStyODZJNXgzTHJ4OGlH?=
 =?utf-8?B?b1BHclM3aHRZeG1mdjA4T3hCYUhwazVHLzM5ZGxUa2szQkFDT25HWFFZYWNl?=
 =?utf-8?B?elVpWmdXVUUwSTFXaCtrK204d29oMU1CUjduRXEwK0NOZHA1V3NvWlJKRkNa?=
 =?utf-8?B?RnA0dEQrTU1nckNWeFYvU3ArRlFlQWM0eksyV0NHdlJzMlk2R2pIL2tsdm1X?=
 =?utf-8?B?dXhVOVpUbDU3OXhEaUFsVSt2dWVJaTUyVG1WN05WZjZtbGJVcU90ekUvbG5p?=
 =?utf-8?B?RmxpcWRhZG1oMjh3NXh3aTB1VDJNWVRORHJkSTBQSFBYdnRYdVF1cTAxWWtJ?=
 =?utf-8?B?YUZibjE0S1lFUk1UVDZFaFZsL1pyVEVGOVp6R2dVdy9Za1pRVDFJeURncnlC?=
 =?utf-8?B?bjFxR3lQV0NzcE5Bc2p4dlNtUEVrRWxYSjNETGdrTTZGSFJDVjhCMUk4cU41?=
 =?utf-8?B?QURqaGhWb093OUlzMUZSSi90Qk1WYXRJME9idEE5SXNhS041bmN0ZG9VeXJ2?=
 =?utf-8?B?QmJkVGVHd0ppMStqZXNzdlA0ZnA5amNMOUQxUEhIV0ZvQ1czZXRSb0YyVzVO?=
 =?utf-8?B?emJHU0s1MGtDc1JVa0hiZkplUGhPRVM4dEUxZko4TkxTamNxNEkyazF4S1g3?=
 =?utf-8?B?Q0ZDNU14alI1RFBKSGkrS2d1MHhSOTZvNStHd05GNXNjbFM5YlMzSmtRNEJh?=
 =?utf-8?B?dmcvR0JWTzc5cGFPaFlRMnBvREVqczltNWwxSTVDT3ErcnpIUDlrcGcrNFBF?=
 =?utf-8?B?OG55eER6Z2lrOHRYWVMxVW0xL0JjandLSisrZmFtdURUZG9XYmxSVWoyclha?=
 =?utf-8?B?aFlFQjc4TjMySTYwSHN0RG8raStEbmZsUlMxajdjc0E0MEVRMHFxUUR0WHJr?=
 =?utf-8?B?ak9VUHpIY1FhL2xiazlkZHdMQndqdktVOEpFNWU4dlg1TFFTUmYvQkZBWml5?=
 =?utf-8?B?SmFkV3ZrWVVxSEo1ejJOand1aTV1Tk9EN2xhd1R2TDFOSUV2RDFFLzF6Wlps?=
 =?utf-8?B?MzZ3SFJ4V29vem5YWE1kME9oY3pYNUpRcmswaEsrc1l1K0F2dkY4S1RZVU9V?=
 =?utf-8?B?TUVKdlBVbnhlZnNXZDRhS2hscEs0bUZDT2h5QXpzU210YTFXcDFWNEVEaUZ3?=
 =?utf-8?B?V3JrNEZiWjJNbnhUcmx1TUthbTBENmtBbHpUV1lMbksydmc1YWcwTHpXTVFw?=
 =?utf-8?B?N3V0aFBsTHR3WEhmN2pna3JYZTZrenBQVzFkMDF5RVl1VnpXZ1ZnWDRsR0lt?=
 =?utf-8?B?OWJyREsydGtPd3o2Y1hmNXNWUkZIaHJTOU42UmFIS1c4dFJmWmpBV210dTkz?=
 =?utf-8?B?ZytCUnBwem9nTExKL3Vqb3oxOUFPUWxWSTdOVXptS1NxZ1AxTHJCSjQ5OWV3?=
 =?utf-8?B?OEl0MFRQWEozKzZsclpIa3JaYlUzN0E2SVFKSjk1NVYxWEF0RDVjNFROZ2ZQ?=
 =?utf-8?B?Wkd4WjJacXdoV3A4bkRFc2lUUlVwQTdKdHN5MzBtdllva01yZjkwOHl1RGhP?=
 =?utf-8?B?L25IazRNUzdjNkFHUDVlVXJYOTVSNnp4d0UzMUZnbTJ3dit2VHplNENHUWht?=
 =?utf-8?B?VFdyZVdBZkQrOVFHcitiZkY4N2NvZzc0ZG9rYnFPN01MaDhhZmRHUnZCaXVI?=
 =?utf-8?B?MlRMVnB5UFA3djYwMXkyUmVEaGQxTWgrdEl1K1hjRjE5ckh3Ukg0M3JOQndE?=
 =?utf-8?B?bnN3NVBoR2tVWk1Ld2kzWGsvS2tONmwrVGoycWhqcGF3SjVhWkw5QUlOWkMx?=
 =?utf-8?B?RDNlckw1SEtPOTlGaUpPZG93STNLdS9JeFdtMm1ZTUtudC92RSs0Vk0yZ2xq?=
 =?utf-8?B?NmdoWmpEbjgvK0hmUXoxSTg2U2FMSUZxdmVMbkxPUU9WUWNuMzI2RENMcHl3?=
 =?utf-8?B?TVdEbGtsSnZYYTVPNDJ0bkJIYTlYMVMyWVFmL2pnZE1JR0wyOXZXNW1iMUd4?=
 =?utf-8?B?WUxKbW96OWZIM25QN0ZzOFZzdTNIQ09OanU5c3ZGVkFsVmFDOWRIcU9kTmVk?=
 =?utf-8?Q?dx/2Nk6dp5qH+ic84kz0VgoOs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c28b2d-a34e-4b8e-295b-08db50a891e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 16:15:13.7216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipPCiu5B2TuTPhCBjfCdcOQNnDgDJWUo9lZIpU6hXf5GM5QlQ4hKAns+Zh1whG9notgm9UQYqspQHe3rPD2M0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8049

On 09.05.2023 17:59, Andrew Cooper wrote:
> On 09/05/2023 3:28 pm, Jan Beulich wrote:
>> On 09.05.2023 15:04, Andrew Cooper wrote:
>>> On 08/05/2023 7:47 am, Jan Beulich wrote:
>>>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>>>> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
>>>>> code which looks like:
>>>>>
>>>>>   uint32_t foo[1] = { 1, 2, 3 };
>>>>>
>>>>> However, GCC 12 at least does now warn for this:
>>>>>
>>>>>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>>>>>     884 | uint32_t foo[1] = { 1, 2, 3 };
>>>>>         |                        ^
>>>>>   foo.c:1:24: note: (near initialization for 'foo')
>>>> I'm pretty sure all gcc versions we support diagnose such cases. In turn
>>>> the arrays in question don't have explicit dimensions at their
>>>> definition sites, and hence they derive their dimensions from their
>>>> initializers. So the build-time-checks are about the arrays in fact
>>>> obtaining the right dimensions, i.e. the initializers being suitable.
>>>>
>>>> With the core part of the reasoning not being applicable, I'm afraid I
>>>> can't even say "okay with an adjusted description".
>>> Now I'm extra confused.
>>>
>>> I put those BUILD_BUG_ON()'s in because I was not getting a diagnostic
>>> when I was expecting one, and there was a bug in the original featureset
>>> work caused by this going wrong.
>>>
>>> But godbolt seems to agree that even GCC 4.1 notices.
>>>
>>> Maybe it was some other error (C file not seeing the header properly?)
>>> which disappeared across the upstream review?
>> Or maybe, by mistake, too few initializer fields? But what exactly it
>> was probably doesn't matter. If this patch is to stay (see below), some
>> different description will be needed anyway (or the change be folded
>> into the one actually invalidating those BUILD_BUG_ON()s).
>>
>>> Either way, these aren't appropriate, and need deleting before patch 5,
>>> because the check is no longer valid when a featureset can be longer
>>> than the autogen length.
>> Well, they need deleting if we stick to the approach chosen there right
>> now. If we switched to my proposed alternative, they better would stay.
> 
> Given that all versions of GCC do warn, I don't see any justification
> for them to stay.

All versions warn when the variable declarations / definitions have a
dimension specified, and then there are excess initializers. Yet none
of the five affected arrays have a dimension specified in their
definitions.

Even if dimensions were added, we'd then have only covered half of
what the BUILD_BUG_ON()s cover right now: There could then be fewer
than intended initializer fields, and things may still be screwed. I
think it was for this very reason why BUILD_BUG_ON() was chosen.

Jan

> i.e. this should be committed, even if the commit message says "no idea
> what they were taken originally, but they're superfluous in the logic as
> it exists today".
> 
> ~Andrew


