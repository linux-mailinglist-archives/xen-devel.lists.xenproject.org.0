Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA696670C5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476001.737964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvej-00012F-2W; Thu, 12 Jan 2023 11:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476001.737964; Thu, 12 Jan 2023 11:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvei-00010P-Vx; Thu, 12 Jan 2023 11:22:00 +0000
Received: by outflank-mailman (input) for mailman id 476001;
 Thu, 12 Jan 2023 11:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFveh-00010J-Kt
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:21:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53828e1f-926b-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 12:21:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8780.eurprd04.prod.outlook.com (2603:10a6:20b:40b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 11:21:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 11:21:56 +0000
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
X-Inumbo-ID: 53828e1f-926b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIzc44BPZjWDGItMctV5mLhr6+8J7s1YMwyB1U454FWL5hQdt/a8Yr1cQe08gS6VR3qyGL4b5sxb4Do/jGB86lF56sEF7LedZpdiGrOg3Ve9smncYQtNCIQ94+VSEDbkJNSuwCTnLzwKmsI3Luu7cBpwH7USFUMESLVpu0apLX7e2dQQFFHsQoYxHfsVwf6qg0Wu0VFIpkhUmg2G+5Vqbh1Q1QsjN1aFbq7MIWYmSEaC/n0kA9vp0XJugPWzjhiiYa2+aAUdTQH9uTsEZnpytyQXwrN2tD9I/+qw37f5Bi6I+H1QFzxnmNv9SCEAFldGWxlMhvKL00QZ0nOnkYzL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ia2sbsa1r4vbw0b9jirnccNid+oPcdF6VmK/PXk2qcM=;
 b=UPjeHVUUehM0p27YdnRAP7+KKu6wXmKiUPuy4Tnz7cIL/EX9IkGhmTxKvv22oE93ep3RSVHrKNhoyZT55ec7dCuA/weHcHGFfRuN+xlswdGUZpgxcITbZ/0Ji2RxndApBYaOTfBCr3hIofS6pxZOiPN3msa8BgIvYxHZ8fjZExsAB+ZDZQivhJShZJasqmW8gPl7MkroQtnt+oQutxDimwvKh8qLIUSW1oO3dJilqHofTq9hKaQbluXs55n4i/LSk9+xsn+w+lWHB3kmP9VvffyQNIvmzr0Ir6tLH+yLTdEjneJ9jl/E5/xLHDkbh8aKkzvgbn1uZoXOdIe60bKbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ia2sbsa1r4vbw0b9jirnccNid+oPcdF6VmK/PXk2qcM=;
 b=HSQgqFs2uS1Zx+LPtivBSJqlC1X0AF9jz/nf6vatNevpsp4XohxA4FepVBl4vHysUZeVnD/OibSqxOg5I78eRYjOM8olw6dq6PieqACoWHDWRxVZ2Em2Yow2jPc17YL7shPsrIMnwcWwRJSkSrnxR/+WY+i0Zlt2R+lzuD/Nzm1ef27w7thURcUdtvJ6KBcesJBav0PIScikisy3nHJ69MImJyJQ7CyYNLPvjjL3TccG2nw54OPEVJZ5ZDJNj6T0OSjcXEM0xtPpHMUxZFms+V2ovyjba9Aax6NHDmH4tRIZD5pKRjB8W7TCfTIVNPxta639/0u/XLIBaR/+sc76JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6351405-81ff-4ce3-2e94-aef1aee3c40c@suse.com>
Date: Thu, 12 Jan 2023 12:21:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230111181703.30991-1-anthony.perard@citrix.com>
 <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
 <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
 <cf9b3be0-b195-83d8-875f-3ef70e5d9c3b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf9b3be0-b195-83d8-875f-3ef70e5d9c3b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6c5186-a8e0-4a0d-4c90-08daf48f369c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W/ALIPkcwl+tyPK+ctEVA+CASAs/84mk1W7QZuk9bUKpBB+nFxApNwoHIDHTdDhcjL2DqdNsOVfwjyuWDRi4AcF+7EFJgOaUQonDJMxiXI4YooskuMl/XXwoadVVu3MYZw1qgec0gzNCKyGzKzesK4dfUnUHeHPbxxii2n67R8uCUZ04pN20uOgoMhS8msfb6BLPdxMUbL1kRooxpdfscvVqmbYQaNf4/czSs9ckJRShqW2kyQu8WziHpJLNnldPOViXZSEPpnaj7mKZvqD94Qu5tR+sfacV9SOIn07CYbene4WgRnHlbzPD2qEI+sD7c56o0Xundkbkbbun7KeU9V0EUphyTQYh4Ev/iPL7tkFE6kfihcPJuqpshGwZciYICMjqF2kSDRogJhZ1Rm9GLG/0t91Q3Swf/UTs9b5xrY67DuINFv93hEl4s76/u3/vrKClYUbUmnZt80urzzJDcb1bIGfD1CQRKVINcfMJzT+otIJGd/kSx1B/iHxry3Rkq4yQf2NR6tYSz4O2U/JBC7goQdboPao26aazDCU7G5CwBaCAa0PsFC+CoObXhGhG1QnH1Y8MJK1304ZOPlSgKx/aRAahq2rxAc0uTas9guSWXUlPBRH8yZ9b86zrlq19EL8PT0/9tOtFVehvwgdS52JpCB66b0tjBS8cNrMAPLI+gK3xWGvPOOy76jC56mDxOKR5JbJ0vIU22PH6FFYi2w3vMsfbVUliwKVobuV8+xCCS5MIse4cyb5U45LUna8F7Hf6hygGX3bLiLC1FnYIEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(2906002)(83380400001)(478600001)(66476007)(66556008)(5660300002)(66946007)(8936002)(53546011)(26005)(36756003)(186003)(6916009)(6506007)(31686004)(6512007)(6486002)(2616005)(41300700001)(38100700002)(8676002)(54906003)(86362001)(966005)(316002)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDdDQXFVaFNkbUx0dEJ6NGlvTko3TW1pVStxQ2NMZmF6ZEg5UjdGRXFsOENX?=
 =?utf-8?B?bW9uSE1YY2FHNXFCbm1BZm1aTkxvamRRamVRZXN1NEluMmo5a3c4amFWUEZ2?=
 =?utf-8?B?NllZb1lCRENtNWgzL0V0QkNDQmtmWFJPNkNlejlJK09oczQ5VUR4QzFnVFZN?=
 =?utf-8?B?WjhoWDk2OTJKS0xXV2pkRkt4ZU0zV0tBa1N6M2RVZmRTUVJaaHh2WGphYmxE?=
 =?utf-8?B?M1FsN2hwUEk0ZVN6TmtCc3J2M1FLT20rNXJ2VnNoczlPRzUxWXh3azh1dUxt?=
 =?utf-8?B?a3BPN2E0a0QvY0dNYzhqcFpKN2lPcXpkVWNYd3daa2NhaEwreU5rRGVmQU1w?=
 =?utf-8?B?OHNRdGVEeVdqZFRwd1Nib0s2OUVhUFpsTVhOQ3plaWVsR2lqb1cxNDV0MTMv?=
 =?utf-8?B?YWhEODlVamwzUVVJdEdFSThYOXN4eXYySnQ4N3RibDdKK2RBbWJnMzBqOE1G?=
 =?utf-8?B?VmtHZXU2V0NxWG5ndHFZRkpXdDlFNjJKUVpPYTE0dEJ4ckFEeURWRE1pLzBY?=
 =?utf-8?B?ODkxdnA2YWVwZ1RqaDFST1U5eWttZWo3RXpGNmJtNFBLUGFseWdmOU1Qcngy?=
 =?utf-8?B?NWEyWFlRMEZXbFpiYVUvQnBOeDgzSko1NmgwbG1mVUphOThpbjVocmlXUGVP?=
 =?utf-8?B?dWJLYlNJdnBEZ2VwK3JqNnBjR21MblZBTTJwYVA4Z2hLK3hGU2plQUVycHA0?=
 =?utf-8?B?MEJSa1d1VjBLSFFKNVhKRXdQY2oySGpsNUlha0VpYW8xdHFPY3N6dHVMQk82?=
 =?utf-8?B?SWtqSmdKSTNGZHM2OENjamVkbTI0eDQzUkV3RWFkcE1RcFR3b0h0K0hZOHdp?=
 =?utf-8?B?K0pSaSs4YVdmeXBrU1grNjRoZVIzRitFRFBEbWlFL2ZKaDluSXhIaXg5dS9M?=
 =?utf-8?B?RWt1bzFGbUN2Um9KQ01qSUlzS2RUby8ySnpRSmpFdlpjZHk3MjV5ZDU2QVBa?=
 =?utf-8?B?YTdYbDMxdUFUQW1QaStUVjZ6bUNDVGl1Tzg0VkFMbDNtcE5SZDBIaFduVktM?=
 =?utf-8?B?eWlBTHkvVm5vTDhvWEl2b0VjeXRoQUJWVmRIL29JM0dWR1N4V3JQWlcxeGVX?=
 =?utf-8?B?dnAwcjIxOEZRNVlUTndWdDBha2VwYXNBWjhIZHhxOWZHN013L2JORUFCRUwr?=
 =?utf-8?B?UFlCcis3M1VzbHFDaUtESnZmNEord0xVa0hiK0cyZ3VhK2RYa1Vab2lQT1or?=
 =?utf-8?B?eVdrZkx0aFl3aDYxZzJKT2ZNa2NEc2JoSEY4YUtlNHN3RzgzMk85U3BBdktX?=
 =?utf-8?B?V2tweFJDZWdwako3MnBWVGNrdVQ3R09yWUMxQXJkRFJzUFVoakJsV0doaFdl?=
 =?utf-8?B?NmlsM2FCTkxuajl6OHIzSGp0NFIwemxENzIxRmFvcldxZ01tdlVwcTdrR0dP?=
 =?utf-8?B?eFNpRHBmeDFoNmNkZXBVWmFIbmpiVm1jV3JPcGxwSk9nWkdNcjh3QU03LzRk?=
 =?utf-8?B?aW1BTUNDZVkrSHpiTEVLVzdGVi9zZXdWYXh1MFdPc0tYTlpHM0VqbDY4UXdJ?=
 =?utf-8?B?QmtUR2ljWTNYVHFHZnl4Q2crNVE4WEtZOE1wTlZBVHUrYm5IQlptTjUrSnFx?=
 =?utf-8?B?Z1RWRmM3QlMwYWFMdlpEa3pLMlRTNnJUOE5udnlLOEh4U3Z0b1dVTEp5cjZo?=
 =?utf-8?B?M0lQSks4ZTJha1ArRSsrdFhXaUROMVkxU3hUcEhybXl5QnIwaXpGRWlueW1q?=
 =?utf-8?B?eHNNcHNxVnk2VTdmdGlzY1J3N0M4ei9pRmxWTzhxV3Iyd29tL3FJVVMySDd3?=
 =?utf-8?B?dE1LL1d4WStYcVBYYXI4dElrK2xnRkx3R1BUS1JSZkZYTG1mNXdiaVNIam1y?=
 =?utf-8?B?RVlBQ1NYNitMY1JaOVZibG8xSkxiQkVhblhxK1cyemJXRDdGNG9iSmNHQ2dZ?=
 =?utf-8?B?RUxxQ0xyUXhDU0JpVVFwbnI1VTdXM1hEOE5UN3IwTDNST21ITm9vWHY4THdC?=
 =?utf-8?B?SGVmUjJlR1hCOXpkNC83WVlWQzVJbmx6RG13K3BUNVlCWGV6VW5CcnB4aW5R?=
 =?utf-8?B?UkZ2TGhUc2hCSFhlNTF0THFSWTFJYUNYd3VYQTdUVllFbVpzcU91Z3IzcGVD?=
 =?utf-8?B?MlR5YmRxOEFWY0VJeHpaVldoN2lSQXd6VUFVeFZXZVIweXJ5UlNYa0krRU52?=
 =?utf-8?Q?y0qHTzwg8NI/Qv/Pj7RfpKd0x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6c5186-a8e0-4a0d-4c90-08daf48f369c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 11:21:56.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghDypdTZbnglhhC8S69x3+Pd31G/e+CHW7Myyc5k5+TFqSc6alyMUhltP8Y6YZ6ODp9wSX2xaWNHOvoT+2tx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8780

On 12.01.2023 12:02, Andrew Cooper wrote:
> On 12/01/2023 7:46 am, Jan Beulich wrote:
>> On 11.01.2023 23:29, Andrew Cooper wrote:
>>> For posterity,
>>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/3585379553 is
>>> the issue in question.
>>>
>>> In file included from arch/x86/hvm/hvm.c:82:
>>> ./include/compat/hvm/hvm_op.h:6:10: fatal error: ../trace.h: No such
>>> file or directory
>>>     6 | #include "../trace.h"
>>>       |          ^~~~~~~~~~~~
>>> compilation terminated.
>>> make[4]: *** [Rules.mk:246: arch/x86/hvm/hvm.o] Error 1
>>> make[3]: *** [Rules.mk:320: arch/x86/hvm] Error 2
>>> make[3]: *** Waiting for unfinished jobs....
>>>
>>>
>>> All public headers use "../" relative includes for traversing the
>>> public/ hierarchy.  This cannot feasibly change given our "copy this
>>> into your project" stance, but it means the compat headers have the same
>>> structure under compat/.
>>>
>>> This include is supposed to be including compat/trace.h but it was
>>> actually picking up x86's asm/trace.h, hence the build failure now that
>>> I've deleted the file.
>>>
>>> This demonstrates that trying to be clever with -iquote is a mistake. 
>>> Nothing good can possibly come of having the <> and "" include paths
>>> being different.  Therefore we must revert all uses of -iquote.
>> I'm afraid I can't see the connection between use of -iquote and the bug
>> here.
> 
> So I had concluded (wrongly) that it was to do with an asymmetry of
> include paths, but it's not.  <../$x> would behave the same, even if it
> is a bit more obviously wrong.
> 
> The actual problem is the use of ./ or ../ because, despite how they
> read, they are never relative to the current file.  The contents between
> the "" or <> is treated as a string literal and not interpreted by CPP.

First of all the C spec says nothing about how searching is performed.
It's all implementation defined.

Gcc documentation in turn is quite explicit: "By default, the
preprocessor looks for header files included by the quote form of the
directive #include "file" first relative to the directory of the
current file, and then ..." This is behavior I know from all compilers
I've ever worked with, so while not part of the C standard it is
(hopefully) something we can rely upon (or specify as a requirement
for people wanting to use the headers unmodified).

So I agree using ../ inside angle backets would be bogus at best, but
I think using such inside double quotes is sufficient generically okay.
Hence ...

> So furthermore, the public headers are buggy in their use of ../ because
> it is an implicit dependency on -I/path/to/xen/headers/dir/ being
> earlier on the include path than other dirs with these fairly generic
> and not-xen-prefixed file names.

... I don't see any bugginess here.

Jan

