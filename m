Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AFC6CFD6B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 09:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516439.800515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phn6B-0006NE-9F; Thu, 30 Mar 2023 07:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516439.800515; Thu, 30 Mar 2023 07:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phn6B-0006Kj-6J; Thu, 30 Mar 2023 07:53:31 +0000
Received: by outflank-mailman (input) for mailman id 516439;
 Thu, 30 Mar 2023 07:53:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phn69-0006Kd-J8
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 07:53:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4640ae2-cecf-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 09:53:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9714.eurprd04.prod.outlook.com (2603:10a6:20b:4f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Thu, 30 Mar
 2023 07:53:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 07:53:25 +0000
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
X-Inumbo-ID: f4640ae2-cecf-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAtEcToWzKr9JuDmD075lsgn70h7pQsmIbt0tNOCyoLesJ+A+pnutwe2ebYmorxOWw7UfBBc14CgQO+4Gf1rdKSotKNbbQadcM9++/+MGWqs++Ap+9mO/LS3V9fYRtNRGf8iLXiCr7wdvr3uyraMJ1NwKVNAD/Ny6garjDwg3Ydl1jKtxuqAlrCW5GS3NGVYBCMNkT1vQFoXV0CAy6mChPNFSypgqVOYvsEUEAaKEGI4pLyMe1VzCp2g0NWIwHliSJolLnYIWyT5PUA7IvSb6QGwEh4ex9mchH1GGH3qkUWIGRT6hjn5LejwPkQZoG7nLZNr7NVPcFrpanwqyBRi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmyaIWbGd1F1rkkKU61F9iEiMyNoCr2Iem4Xj6WltIQ=;
 b=A52+QWnQUlUrjjWfBzPZ7PwTYmUDnQ/LeAMEqX6ZjC2L2jPIaJR18BcCEGyYgo/K3mzxIXwh+6KvvYRAPygzcNq/rvTYXy5IgXisf+xqNoqcakg76JL23yi2xgsQKy1VNBHenuBzM0cc6Iilv4qeu8O7HVT7+Hnv/vyM+YiNv6xkl4AWGpQWIYn7vOQ2EjVRld3sSwXwSzOccYqDB8dt1sq1xfTHtt6iKZF0qgvXnWK9MIGkKfP+4lwZ5wwwPVNUNV877t4ZKHeByt916yylGqXRA5MFwG/OiMMX8u3WoJMchPBLiu2ZNCzP5xB1wHD6UJvVxD0HjlCeP3eRLRYlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmyaIWbGd1F1rkkKU61F9iEiMyNoCr2Iem4Xj6WltIQ=;
 b=CibbvvkuxTG4XDWtF9WlRmlbfXDz/u5YLuVMPSu9+V6aqGRaNnwvEfZ1OILJxPzY/rbaVFpTqyYlI1rsIp0arLe82at/loVV8r054DalQByUU1qM1wVdJBvkgt8K1ou7BaBymIdsC86D+mQGyG7YCD2uAm3JxTRHGebi2MYkkQlx61kMqc4m16U0xaFLEJfIpLQNVSWtLyxJcQKXl1K0dP8lh8DXyQpo+z8YvGrKTKnT1ga0yB4nxYdhjj3pb/kkjN/rzGN59kwknjyjqQ1qWPSp9jMQ++BcLQUmVDT88VAriprVixii+q6JjrxYBKnJVgI+DPzEmus9yxYMXVtP/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <600f8643-fddb-e9f8-3d73-41eead3d7cfa@suse.com>
Date: Thu, 30 Mar 2023 09:53:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <ZCL3W/HrwLANuE/0@Air-de-Roger>
 <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
 <ZCRIbKcfi8hn1m8Z@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCRIbKcfi8hn1m8Z@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: a35676f7-8178-4943-2638-08db30f3d732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UmvGDAKeNGXdWH3Wh3ZlwJHelJN2PvvtN6cNnSQvubk3GaaceIbXmGcXuDMIZ6R6DxDonDtehFC/Vma++A6FBQrRPSgifAfnc0SmtVPWUNv5Q/kQcLneQWdp9K8kMVf62XmGO0kbiKTCdmNDvsPCHMkM3IMXsdR/ob1gctx/VskeMGuA8GUykDsYWusPcJL/F2ZfR+1dsSSUNr1e46Dk/k2ZBwz9ejFl4xbujl1ggliKuuUKsCJQg3uVzDftbQk0FdR8RUDeezeBFjzNkdQdKlEuE9nyk8qMj3qSjfLN7V5iInvzbvFGobjInQcGVzo2Z3VQWu0ttnBFEk5ZcPk+LMXi0YzMoP/OfBB+jKwRUwKEMX3/LzjSh/F0ZD4Y08Sy2LfmmZU0XhB5kOoHcnL2t5MhfrvvmUs5nk69nkL4BrJghar7yPKzo0SzT+jI7dOqu+GKesje4nRwGjWjVEze2bZoy3LJ9Aobb+nBiQHeM2BculJaGJp7NS5L5HBRW5zl/9w8E/dKT6yrih5PTlHJrSagwfN3hLjgRxDVu4/Mg/WvEWf9Ce8I7QMjuTfECDKMGa3Y4DFCTgi6DmJM246gQ80f9zpqXSFbk+xDwo7lJgsaVciqThxb+iim5hjTI/13lp8jbIAuoSaZVLWIQAj1Jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(186003)(478600001)(6506007)(38100700002)(66556008)(6916009)(316002)(66946007)(66476007)(8676002)(26005)(54906003)(4326008)(6486002)(2616005)(66899021)(31686004)(41300700001)(53546011)(36756003)(8936002)(6512007)(86362001)(31696002)(5660300002)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFhXVEJHeDZKSG0weDhBK3cySmNTTlpjUFkxajBodERQQmVja1FBems3WTIv?=
 =?utf-8?B?OG0zYmE0WjhaME4xODg2VTZjNlVvZ0ZjeHZZM0ZWakE2VUhXa2pFdTdKTjdG?=
 =?utf-8?B?aGlDbmZ5RkZ0Z2VLWmp1MUhiek9oYVl2c0c3My9wZ2svVCtSdUIvcllydnVQ?=
 =?utf-8?B?Vk9lZkphZ1hyOVBqTjgxQkRlVjNLdnNZV090Sks1bUUxME5GVXc5ZmlMNGJx?=
 =?utf-8?B?dE82YzlyYWNwaDgwOXlMcTRJbTRadFJraFZNMTBjYTJVWjVMSE9lM0E2WlNL?=
 =?utf-8?B?YlZ6bDFoaWcyb2NsZkF6VFNBQVd0OHdUQWtzME0yeHNlckNPZ1VpaDRUM0x4?=
 =?utf-8?B?UHlDMS9BMk1HSkl0enpoL2hnWVFSS2JQcDFtNU5YNm1md21IU1NTdzkvbUQ3?=
 =?utf-8?B?c2c1WmNjeWhlUzVzZ2dGTmJlcVRSelhQMFk1ZjNlbVFkVVFIdER6bk80Ni9z?=
 =?utf-8?B?cXR5Tk1iNDFqRFFWdUZZb3Y0V2x1aS9JUUpPYXFPdW12bkU1dmRGcC9MUkcx?=
 =?utf-8?B?ZkE3WW5GR1o1Q3orWlR6REZtNG82c2ZTZkp0ZCt3Z21EMXZQSWdEY1I0c3Y2?=
 =?utf-8?B?bHN3Z0w0ZjhHV0x4SFQzR1BYeTMyWFNpeUZoUTVLWXk1bnQ5b3YyQjVvNW9F?=
 =?utf-8?B?a0pURnV1dnJ5K2RRVWgxUVFuMXNkVU13c1V1ZFBVQ0ZYZTd1Y2llb0NIcnVl?=
 =?utf-8?B?UUcwdWh5b3hpQ2FrOFNvQnJZcXVjT1dSYUs2M1BxM2Y5VGJsZit5ZS82TDR3?=
 =?utf-8?B?VjRET3E5ekFZbjNSSXFtSVZpUjBkckZCQXAvZmswaG9UQ3d6YitvY2VWTHMy?=
 =?utf-8?B?L2RrR0VPcEp2NFg2YUtHT3VaekpxaHNNTTl4b05PaklIdndSK254ZHhSNEZ4?=
 =?utf-8?B?WTloM0xJajFoZThNdEtjVW40dk4zRFhXUWFYZ1Q0V0VtRVI5UU12N2pZMFRy?=
 =?utf-8?B?WVlkWnZmeU5hQnZlcExiSktML2FxQklDakYwZzk5aEZpTEFadWpQL0puM1dE?=
 =?utf-8?B?SDhXcUJLTXEwbXV6RWZaNGtxZ0tHSk9Kbjg1blBaeWlzbExta0lZMUFDdHAv?=
 =?utf-8?B?M3JDakFjeElHQjlZWndaV3Zyb25yK3gxdVVDT1VDYnNIQVlFYVB4TzN0Y3dM?=
 =?utf-8?B?TmN6d1hVcEpqNVV3alBxVnRUZkhUazN5ajhtYWlWSE1KWm9OZExtWFNqQXhH?=
 =?utf-8?B?cFZ3eDFzS0VKNi9qaDdYdXJvQTVrT0x4Qm5LbVQyT05TV0xaZVFUQVROYkVP?=
 =?utf-8?B?eklQaHdPUlduK0lsUkN3OTFWbTZaenY4MGdkdWNmVXo3MFRWYSt4Mm1JZUpF?=
 =?utf-8?B?WDR6YWM2eGs2RVR6U0RNL3dPOU1PWkM0V3ZJWVBvampnd0IzWkNqcVZ5Wk5O?=
 =?utf-8?B?NVVFYzFPTXRxRk9adTlJenpFbkxjWGc3M3ArNGRjNnQyNkI0djhJUDdIV2JJ?=
 =?utf-8?B?QmxxdnRsWS92L0F6TGtHZXRZaGNwd1Q3YjFpQWc2bHY2czdhamcydXZMcThI?=
 =?utf-8?B?ZXpvcGRHcGJIcWJCM20xRmtIQ3UraGJvSDgvOFliNXdLenpVbUluak5kTHRG?=
 =?utf-8?B?MTdETVg2TFBRREVBek11THRzbjdpNG5YeFZCSm00Q09vaEtVSmdjL3dVWUt1?=
 =?utf-8?B?bGFOUGhpbmFWTkh1cVdUVDloNlgydkczMkk2Z0RtQmNwQUFKTEVoVmwxNjJB?=
 =?utf-8?B?SFFSd2NlSjZ4Q3RXbjBnRTA1WWFSUWx6blNocFlQUVJvTTBaMjNmVU1ZdXAx?=
 =?utf-8?B?RnJ5cWhkUnRXSlkwLzVKenZSbTBVZWVldHo4d3JSdjdEcisvVjdJMGVtaTJN?=
 =?utf-8?B?Zjh3Qm81Z2hYNTdrWDZobHVOUXJSZllzZTlVbkxKdmROeUh6bXVTK3hNa2E2?=
 =?utf-8?B?TE1IU1V5aEd4NDRhYnVYMXFydUg2UUN1NGROU0VGTkl5SmoxUkQ0SmVwZGdN?=
 =?utf-8?B?Umh5WlRhTW5FOWM5cm4rNGlZQkd6dkRON0swdFFZYS90UEg2Nk1PWTlpZ3Vl?=
 =?utf-8?B?bkFNMkdKQjZOdDFwWTIwWWpVNXlUN0o3ZDZjeHc0SmJSTWJDMEEycTl1VFBs?=
 =?utf-8?B?N0RuaVhCekdieEZQQUlETHU3NCtteWpRT2txSGR6QVQyZFZyTEdxTjdJQUpt?=
 =?utf-8?Q?WDzy5/5HVerpnFcx3gHAoXiOQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35676f7-8178-4943-2638-08db30f3d732
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 07:53:24.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg7pI2S/tD3owGBIywgzDQfsfpV2iTfsZWsiDDwJzV9NIfv+jvL3hVrXVc3fubSwLftuq68ETt2XUvccRdhaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9714

On 29.03.2023 16:17, Roger Pau Monné wrote:
> On Tue, Mar 28, 2023 at 04:48:10PM +0200, Jan Beulich wrote:
>> On 28.03.2023 16:19, Roger Pau Monné wrote:
>>> On Wed, Jun 15, 2022 at 11:57:54AM +0200, Jan Beulich wrote:
>>>> ... of the huge monolithic source file. The series is largely code
>>>> movement and hence has the intention of not incurring any functional
>>>> change.
>>>
>>> I take the intention is to make code simpler and easier to follow by
>>> splitting it up into smaller files?
>>
>> Well, I can't say yes or no to "simpler" or "easier to follow", but
>> splitting is the goal, in the hope that these may end up as a side
>> effects. There's always the risk that scattering things around may
>> also make things less obvious. My main motivation, however, is the
>> observation that this huge source file alone consumes a fair part
>> of (non-parallelizable) build time. To the degree that with older
>> gcc building this one file takes ten (or so) times as long as the
> 
> I wouldn't really trade compiler speed for clarity in a piece of code
> like the x86 emulator, which is already very complex.

Of course, and I specifically said "main" motivation. The hope is that
by splitting things become less entangled / convoluted. I guess fpu.c
is a good example where certain non-trivial macros have isolated use,
and hence are no longer cluttering other parts of the emulator sources.

> Do you have some figures of the performance difference this series
> makes when building the emulator?

No, I don't. And the difference isn't going to be significant, I expect,
as the build being slow is - from all I can tell - directly connected to
the huge switch() statement. Yet the number of cases there shrinks only
marginally for now. The series is named "a few small steps" for this
reason, along with others. See below for a first bigger step, which may
then make a noticeable difference.

> A couple of notes from someone that's not familiar with the x86
> emulator.  It would be clearer if the split files where prefixed with
> opcode_ for those that deal with emulation (blk.c, 0f01.c, ...) IMO,
> so that you clearly see this is an opcode family that has been split
> into a separate file, or maybe insn_{opcode,blk,fpu,...}?

Hmm. For one, "blk" isn't really dealing with any opcode family in
particular. It contains a helper function for code using the emulator.
So it falls more in the group of util*.c. For the others may main
objection would be that I'd prefer to keep file names short. At least
at this point of splitting I think file names are sufficiently
descriptive. Nevertheless, insn-0f01.c or opc-0f01.c may be options, if
we really think we want/need to group files visually. However, I don't
expect there are going to be more files paralleling 0f01.c et al: The
opcode groups split out are the ones that are large/heterogeneous
enough to warrant doing it on this basis. Of course new such groups may
appear in the ISA down the road.

FPU is isolated functionally, and I'd expect a simd.c to appear once
it becomes clear if/how to sensibly split out SIMD code. Unlike fpu.c
I'd further expect this to (long term) consist of more than just a
single function, hopefully replacing the massive use of "goto" within
that big switch statement by function calls (but as said, plans here
- if one can call it that way in the first place - are very vague at
this point).

> I've noticed in some of the newly introduced files the original
> copyright notice from Keir is lost, I assume that's on purpose because
> none of the code was contributed by Kier in that file? (see 0f01.c vs
> 0fae.c for example).

Right - 0fae.c contains only code which was added later (mostly by me),
if I'm not mistaken.

> Do we expect to be able to split other opcode handling into separate
> files?

As per above, "expect" is perhaps too optimistic. I'd say "hope", in
particular for SIMD code (which I guess is now the main part of the
ISA as well as the sources, at least number-of-insns-wise). One
possible (likely intermediate) approach might be to move all SIMD code
from the huge switch() statement to its own file/function, invoked
from that huge switch()'s default: case. It may then still be a big
switch() statement in (e.g.) simd.c, but we'd then at least have two
of them, each about half the size of what we have right now. Plus it
may allow some (most?) of the X86EMUL_NO_SIMD #ifdef-ary to be dropped,
as the new file - like fpu.c - could then itself be built only
conditionally.

> I wonder how tied together are the remaining cases, and whether we
> will be able to split more of them into separate units?

That's the big open question indeed. As per above - with some effort
I expect all SIMD code could collectively be moved out; further
splitting would likely end up more involved.

> Overall I don't think the disintegration makes the code harder, as the split
> cases seems to be fully isolated, I do however wonder whether further splits
> might not be so isolated?

And again - indeed. This series, while already a lot of code churn, is
only collecting some of the very low hanging fruit. But at least I
hope that the pieces now separated out won't need a lot of touching
later on, except of course to add support for new insns.

Jan

