Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C936A541B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 09:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503073.775217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuzr-0008Qs-0m; Tue, 28 Feb 2023 08:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503073.775217; Tue, 28 Feb 2023 08:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuzq-0008OP-Tf; Tue, 28 Feb 2023 08:06:02 +0000
Received: by outflank-mailman (input) for mailman id 503073;
 Tue, 28 Feb 2023 08:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWuzp-0008OH-A3
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:06:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd84ecb-b73e-11ed-9692-2f268f93b82a;
 Tue, 28 Feb 2023 09:06:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9222.eurprd04.prod.outlook.com (2603:10a6:102:2a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 08:05:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 08:05:58 +0000
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
X-Inumbo-ID: bcd84ecb-b73e-11ed-9692-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djpdxQGO6nqURVHb8OnVqpIjdGvrAcXifJ1GI8rz/aXeDCe3Dq6XfyFW1oSt96DD6siafFT2upe1Uli8rCY8wWybQtLIUvu6p532SYFT45OVzJH05xBNSNtLYnmLWQJqQaR61xLbalZdYY8FZ6J4b8tAkAtP29uwrRnCiwURQ9ccwmU7vvTVYprKp43g4nBkot9PQRNCCSkIh2HIUwaNA8MKkm3jSrRNFmis18/8cfOETl/5jkEsCJXTBZDIqhCt6v9Xpdy42xmhJ411CL4NvEioFZDtkSDU2Kkkp4kY6vmng/89fcLZWwl1LrFHqRLppAMdzp3aSIOlYh4ptu37Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViZO164QXL7VhNXQ52sU14Q8GwFpea/e/CMUIxCpHME=;
 b=g1bwVU3UlAdXGjJ6B7vPSvy9qv7RkkJRoKXp5WFud+HNklx5FfYXN7/vguuezrZ5skF6wK+XO+w2b/FVrvx+uDcSC+BPqvAz3YimQlS56eVtN6SQFB95yvu0Siaapys8DqPLiQIBjK8lQ3MI/t3TEe8zaFPIFSotr1sjPX1hpMzZw3wQcdmZjmkWzsU6JPC+j1SV9+n3AqnhAhP8rk2B4n9gYiqazud1vfGOTtjubqyMo3nTOYI0Z2kM4EJRDzj0j6UeNxqpnkoxHsJIGJCnORPkKA38bEl8vBnkmaoRE7avapw64cnbuZJWnfnwDMrf3xmSyk4dgmIxssZZ0hIxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViZO164QXL7VhNXQ52sU14Q8GwFpea/e/CMUIxCpHME=;
 b=BlGDlvHPoqB/MoLr/x0tsVDDdU4lNZGGoyzjkvIHGplu5hVFwFN6kVDNicXZzCp43D8JtUJnHHinKG2vVMHwvxJzX82EUH9rvELBj1A8tFT7arEAb1/w5SpWbvZol4OmY5iHpjD1Jbgt5ue2TWuuv1V/nyy1KF/sk93uEHX4VImFw/gq5aexfPS2ORn0UJGDbiesOQAB9wBk8xKxhA6f7hTE677o+SLIy8WNzNw7Ay0DVDBrJApMqWvglEAOfFaWiUCzCiCvzSWWeWfigGyuByV5WvEPlco3PZWaeYV4Znoqj0vfxbdzchIHyU0sJeNXJYNziOeb4ed4sj2QNUDZbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dac350b-58f5-1407-15a1-5e38de017248@suse.com>
Date: Tue, 28 Feb 2023 09:05:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 10/14] x86/vmx: move declarations used only by vmx code
 from vmx.h to private headers
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-11-burzalodowa@gmail.com>
 <c864c3a9-be96-a304-12e9-2015c2f2360b@suse.com>
 <a8d67495-534f-db75-0019-41ca1e328bef@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8d67495-534f-db75-0019-41ca1e328bef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e26744-ee45-4bb0-a4ff-08db19629ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mygwOhURDQjQWRwTKlY6sWAZIZ8niDjN6mL4bR/Vnur/57eEGjy4upDbt+HuypVZRKWETnAI4na9WqHw7Qz29hA6WMRP72TBlpC3xe0UYtHiLBB/YJiSkJH2+z28jUd1g2kJrzTbMPyM06DHRHLJqcxr/tGaJZRzSpuVBGXuRnjMkKtjLK9RJTpJ6Nos3AKCKA52OawO5lv7QBTLxRJrEcsFD7sLB98QUGhC8XmkWy7/S9k6Zq21UmPhEggx0KNDfJp/jrzzRiKo9AxRYMkmhJ6qanCP+zTjnok1yc9hIjzX2dzTtnpfrvdRSNztUsL8X9Dnh2zRLELxD08xeiYgrXLtMcIgkCI4PSJaRMw7OWCvlQYUamv+YR2Pt6HCpEC9baYUBf+FUVm1WV25JVo/gJaxumRjaq0eqJiDT9nfzkxP+e4nSE3E3RrzBFbVM1yWAGM386zzqxkbF8y/WMvHHwYO0RbZMuS6X/fbXVCEaCqWm0YUuEnNmPWx5SSimQT6YN2RqHCDS2uszfWW8O+HkwD8BSkq3dogYFZ3GSXuvejwSoOPsJnFLvdxRKLBmKMn6X+oG+EBrwzyCoq+DZLt8NKg5fCXb8LVr478MZHN6gcZ4CeoCNC4sV8gpQRf8xe767vkJg0Nn6yYI+3q8KYKBIrN8+swMsFeIe5OcMCBaROsqzUjscd/9/J1JvsQYgEnIMkbf3cVvZUGYFmbNIT3ijxlXMGdqVAY4+yapWslgnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199018)(31686004)(8676002)(54906003)(316002)(66556008)(66946007)(66476007)(41300700001)(6916009)(36756003)(31696002)(86362001)(38100700002)(4326008)(186003)(26005)(53546011)(6486002)(6506007)(6512007)(2906002)(5660300002)(8936002)(478600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlF4OFhqRFpWRmVqKys2Mk13aTEyRFJBNVRUT2lzMXhTcy9BMkMyenJBNUp2?=
 =?utf-8?B?ZGdPQzJUcTRVWXJaREU3L2EybWdhT0ZpalRGb0ZEQm1yN25kZ3J2YlRCeU5j?=
 =?utf-8?B?NkcwbWhueFJ3Ui9xM3dEL2V3ck5rS1NuSnNpVlBvWTBEZEdyR3NyQnRnWVAr?=
 =?utf-8?B?ZGt2YWwrQnkyWmV0SmxiMFlzdlhmTlRITCtFVmU1aVFDMEVIT090L1U4aVMw?=
 =?utf-8?B?QXl4MmZzUWljaE5ZS05oMXRTUU95MG13YmV2UzFtaEJSWFp4R3RBcS8wVmdF?=
 =?utf-8?B?dHhQOU5hSkdiVlRZT3F4cE1pWXRPNUJIU0FhdlhFRnMzNlB0SW9ERzBOVzVl?=
 =?utf-8?B?U2NjNk5PL1lQRTBXdnRVZzlaWWdYR1BqaDhQcG9KKzdQNTRXYzU5clczcEtr?=
 =?utf-8?B?OUJQWHA2eEp0V3NMWjJLL2IyL1I0Nm9JV1FONElTQTdhQzZ6TjBHVk9kc2dl?=
 =?utf-8?B?ZE43K3pIMWdrd0ZLcVIwUFBHY0s5d2JDbzBjV3dLRlNXV3d4L2ljWmtpWTdu?=
 =?utf-8?B?RmFJWnZFeTIyN0hsdlp1NTQrWGNHTThzMFhpbEU0MWZRUFRVTkJTcHFOQUZl?=
 =?utf-8?B?WGNKQkUwSThJMU4yekRhaWFSUFlLM25mQmlUYVFhSnFlL3p5cjdwaXB1YUFD?=
 =?utf-8?B?OUt3a0tySjFzbjBpcU9XU01kRWxpbmQ3R3A2TUZtek8zdlBMM3kzYTdqNHF0?=
 =?utf-8?B?REMzejVpNkUxbVRBOGltMHZTcytiamM2YnBUV2pITGp3c3RROXJEZEZVWHF1?=
 =?utf-8?B?MWN2M0dDU3VuNElxdUFTMFo1c2J3NkpjN1MvMG5maUtrZ2lHZkQzakhHNjBK?=
 =?utf-8?B?Z3dzVkR3WW44d1N4VEMvSXQ0ZnhBUzhubHBvemR6QkZyZnBEMkZqNGRaM2Ni?=
 =?utf-8?B?UnpDblBBZU9VNDVweEhnSWJKQzdSQUpYSXBOdWVRRlV3aFBPd1kxK3dUZEJY?=
 =?utf-8?B?OWc1YjV3L05YVTVPUFdHVkFrK3BzajNldldLZGtZWE5BeWk0SEFkRlY4ZmZh?=
 =?utf-8?B?c3VzQXJ5dTRMV00xNUc4cGJRaDN6dHVyb3RMWTRNbWVZOEN4NkMxd1VqZWwr?=
 =?utf-8?B?NVFCbVVMelovQUVOQURCQWtyS0s3ZU5USzBiQ1gwZ2Y5NE85bExZRVN1VnlY?=
 =?utf-8?B?SWxRbXowanlHdEVuY2ttNTEvRnlWVHhuZ2ZHWmE5THdKdHZkRzlmeE80WFdH?=
 =?utf-8?B?T3d3QW90NTNNWXE4RXJBbnFXczU2bmNKQ09tWjhvM1hKNTZhK3BFMU1hUzFa?=
 =?utf-8?B?VWVuQUhsYzgzUCt4VWFSbXpvUUdRcHhrRjI1TGljY1RQL3VaWS9mTW93Smov?=
 =?utf-8?B?QkhtYlRmZ2pXTFlXalQyelBNUElPRlM3L2k5MWUxdDVzZ0tHemZJaFYxU2FG?=
 =?utf-8?B?aGxnQTY1TkNCeHpjbE9uWVQ2NkJTUDcwNGQxODBBVW5QREtVenUxL2ttSGZz?=
 =?utf-8?B?MkdwdjlMckVlV1hsL3ZQQ3JLR2lKNWRMSkwzV1EyV3hJUjU5MTNwaXNOaGYr?=
 =?utf-8?B?VEN4RnpXNmh5ZHg1U2lnNFB5Skl2ZU95RzRJVjNqMUFTNmVsbmI3aHRybGFi?=
 =?utf-8?B?NFo4R3ExSVpIbkZmMGJDaHozTTdpcFUvNHluVFoxdW9mdC9qeDVqS3krRldt?=
 =?utf-8?B?K0lFc1p3dlVwVU9VTU1JL1RuRHFVTGp5YU5LQ2JzUmszN0V4b0U5TStNOGRD?=
 =?utf-8?B?U05xZkRwSkNucC8wMDRuUlhvZjlweXZMTXZMWjRSMmtIc1J2NHQzblowV1dY?=
 =?utf-8?B?OUJ6QkRINTZrdVA0RFgrQWM3ZG5WemFtNWdNTS95WlJ6bnY4QTluREtJWkNt?=
 =?utf-8?B?YjBZcEJBaGs4MUFwZzAyUEV1SlBtKzF1U0hjZ2Y1WG5sUnhjbGNMT3J0VGM2?=
 =?utf-8?B?SyttazBlM2FmQ1JrTWl1NmVROWljMS8wd1AwRmNuRjJGVHhlZTRnR2IySng2?=
 =?utf-8?B?b1ptYTFEVWc4ZExkVEQwNDkvWlZnN04ybzZnTHJ6R3NWSWVFNURKQzVHN29U?=
 =?utf-8?B?aGdtQ0E4cEU4c3g2TGtSNG03UkFpUGRYcVVIR2xiR0FjM25Ea3JIdzVDa0Fk?=
 =?utf-8?B?SWdIVGNoV0JKdENiL1gyQWhMWllIQ0I1S2xmc2tlcGdvbWdVUXpwcnBvZjNK?=
 =?utf-8?Q?JinLHMyzWo0kUYSwr0MCrUt5r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e26744-ee45-4bb0-a4ff-08db19629ff7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 08:05:58.5603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiyCSMXcHHKJbcshahDxfp7xoWyAonr/rwltJdScyqJfXceFlxTt/fcTmMy3JP2Fuz6GUummBaAbIrm4HE3FEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9222

On 28.02.2023 08:36, Xenia Ragiadakou wrote:
> 
> On 2/27/23 17:25, Jan Beulich wrote:
>> On 24.02.2023 19:50, Xenia Ragiadakou wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/hvm/vmx/pi.h
>>> @@ -0,0 +1,78 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * pi.h: VMX Posted Interrupts
>>> + *
>>> + * Copyright (c) 2004, Intel Corporation.
>>> + */
>>> +
>>> +#ifndef __X86_HVM_VMX_PI_PRIV_H__
>>> +#define __X86_HVM_VMX_PI_PRIV_H__
>>
>> I can see that you need something to disambiguate the two vmx.h. But
>> here you don't need the PRIV infix, do you? Even in the private vmx.h
>> I'd like to ask to consider e.g. __VMX_H__ as the guard (and then
>> __PI_H__ here), rather than one which doesn't really match the
>> filename.
> 
> I do agree that adding _PRIV_ is off target.
> For the purpose of disambiguation, the header guards need to conform to 
> a well specified pattern guaranteed not to be used for anything else.
> For that reason I would suggest the guard to include the path, not just 
> the file name.

But as we see the path can be ambiguous, unless all non-private headers
had an "INCLUDE" infix. Hence my proposal would be no path at all for
private headers, and path (as we frequently but perhaps not consistently
have it) for non-private ones.

> In any case, the pattern that is used to generate the header guards 
> should be mentioned in the coding style doc.

Perhaps.

Jan


