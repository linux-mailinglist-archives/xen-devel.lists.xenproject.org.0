Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A44609F3A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428834.679374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omutJ-00027z-PP; Mon, 24 Oct 2022 10:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428834.679374; Mon, 24 Oct 2022 10:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omutJ-00024U-Lq; Mon, 24 Oct 2022 10:41:09 +0000
Received: by outflank-mailman (input) for mailman id 428834;
 Mon, 24 Oct 2022 10:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omutH-00024M-Ri
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:41:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ad09b98-5388-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 12:41:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8435.eurprd04.prod.outlook.com (2603:10a6:20b:346::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 24 Oct
 2022 10:41:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 10:41:00 +0000
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
X-Inumbo-ID: 5ad09b98-5388-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3O3udprfWj6SyhVCK5ZuTOiEXCT4qEPAn1CyriG+v9QE7fJk0wmNZS1PiAgZfA4/ZA8wCF/Ifof+zk93wNpfCuKGNKrz7IxQApNvMKK7+yrin1dLTtQ0YLTQqLu7CwmUuIQbGOc/eTb2yKmbI36s/NGzP9jXgLoCJadODEUCaK4ainR5nHQiVKwTnjs60laU2iaTzXu6uchAcLOE6ckbn3+XLvHMZUFPhAGp9esceq3gydwaL1Ek0QhjCl2MwMPClTFO1TtjmF4v5SfO2CbvXe4wrcl+3Bt4Kmp+X2oK2qVBimsMngybBz5K5mtk1OJQ1ycUZ+wPJ/cBQvF9SenEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh+J6624ZaVZldKM+fCNAYKoBTLef+wSp6DgeWmBK04=;
 b=DUmGvty1S27iZXOIykAN3k6kmKx2uH4BKvS3SnwqK+HL75hKKAhlPEVMmNQDgI3v65kVJSfCCHiQP7Zd0BL8jl1ol6AIb4N0DkKbjjXgm7LjyVoU61+sC7EY4Z6eP1LWjeVci4jzVm3OQQ9t4LhN1Zz+A95iJcW8ZGzhP3F3qRvX6h6XVdhZrco9PwckroWKD25dsvIKXmzREQy9mzGborCUvqt+XecSTPXCN01W6Dg5LCZaYmtq4SqkCd1C7Xp3nrnTsBQCNyZteksvdF6oUOlprWcN02K280ixdjNCZCKarXlmhwnO7OYU5PdyJ/uZTGqFRM0HxPQ3bV2w6wwo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh+J6624ZaVZldKM+fCNAYKoBTLef+wSp6DgeWmBK04=;
 b=0B6yaaSN0OPM+g7afdAD4EhJudSpQPzu/d8usSJfsrW6AyEkyaG94iadsOWGWYozbIrOOgS3unf4cDmhZa2/AUcr5dIOfWW7bHQ8PGSgGyT1vCL4DRSYsMHFo8Bg0zGjXnw1KeQK6qM1sImsyzNTJK6s5P7FRvNruzqDNkFz4qynkjpVjyNzQIpwq0N0i25T+/0qI3Im14DS6swQogy1TbJlwgMXDTxc/0OdX1n4iqkScMm+uyj9weKn2yZ9npCE7S7UgQFwgmAKc+oJMCITS8MEjslSBm7lQ8BePobQzAOYgS+HlWF6llezhjlNpDTaeTvQe+n7muQ8+b1FUkZFgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <832b338a-fee5-6334-b91c-d492f3179c8e@suse.com>
Date: Mon, 24 Oct 2022 12:40:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Intended behavior/usage of SSBD setting
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
 <8c7de7ed-6242-f444-55fc-9eb16084b7bf@citrix.com>
 <435610e2-4fc4-6a9c-3fcc-c6d6ab42cdc1@suse.com>
 <Y1ZbyK3ynB0WYS3s@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1ZbyK3ynB0WYS3s@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4161d0-6207-405a-3054-08dab5ac3dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rsgMbjNpsry4Hgsoi/qPn9LrGVoDKvC4ZrygprxoxflJihTJxqVYIewlXw4GWVOCi5fpk+QZqbZhQ7H0fzmFW9dJkidhw5fj4P5slEczm5Kb/MKj25bckTBr/Lo+AA86JTY5kZR5ZzMTQGmb0IK/C3unXCbR8AZJFX4iNpfD2qlITJWqko8jlI+S3ROudoDPrJe9kf329Iw5PdsaKpTlxU3/pgZ3aWJ4sZS0pOXDxh4OpXNznl3u/J0DVf67f3ehE02uHry2zYEk5eEiYhb3VSPmvyibI/zjP7zt6MX+0D9Fe52FxNT4Jbk6NIJBEl1MOoglIGk21EHnfg31auYS93CSDeFVlSh0IY4EdfcytU20oCoZUlgSoEAwwKxEBegZY1CVWJFUVFUdmq1y2v+cfuLDqDRj7ULaYqGVAunCGESTe8bnXQbQUyhnaowDjboBkHtd3draLqYItKMVRit+KW+LyuNyTigUCwaRL2sUB0ws2zBxhzQGdLdOMv0UOkPKv5YsL6fQ3aZaon9GZ8MdobVQs51Ne2gYC4XcUvZHLYmbbdPbjX0cK2kRkhNgWwEV8itl3amVWLEOjhTKJJ8ekKnjBAvHCRt3Hj6OYlrUfZFWB4QV4Ymm2AA9t1K4syKgWxtj6PZg5+DqocuxsQ67p83La7in50aYluUvv5NJDOvCondmzTiONWGEslp+MgPhCg2rNrNQqfx8yf1pzrDWBF95P/0blk5L/K090rO5fHc/ICCmSH4UPljh/pObCUiBqQ00WoNgNxCwgCtqsOowLYBZJO7lozNNIeOs3IHjAkdoiqWO9q/Tjou8B0C6+VQxt8aCb7lg2YQ1HOt6LeCKAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199015)(41300700001)(26005)(66476007)(38100700002)(66899015)(8936002)(4326008)(66946007)(66556008)(31686004)(86362001)(31696002)(186003)(83380400001)(966005)(478600001)(6486002)(6506007)(2616005)(6512007)(53546011)(6916009)(54906003)(316002)(8676002)(2906002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1E4OTZNb2xDSkZuYnA0L2RhMVlERmV4U3RpZ2Q4VnFaSXNQQm80OWdwTDVM?=
 =?utf-8?B?RVgzOFpualNxcVl3a05MNXRDVkViUXZyMUNpV09qaUg3ZnVIOWhiWnR5QUZx?=
 =?utf-8?B?Z3UrVjlKYUJ6dnYrWXB5em4zODBEUkhNUDBQNTFyZVo3VzJsK0lZQjRhREV2?=
 =?utf-8?B?aTFzS1hFb2RQeTVRMkpES3NGdzk4S2kxUEtKdGVLejcrMnZaUGc3WUprZlVa?=
 =?utf-8?B?bTY2WUk1dis4WTFGQ252QnoyRTgyMmluYmhMRHFFSU4zZm5QMk56allWc0pr?=
 =?utf-8?B?R3VQV2VwRXEydFpHcG5ETmIreU41cjdhVklMTmo0OXBMdk9wUEdqeU9jZ3lv?=
 =?utf-8?B?aVVyT0FsRU9yL0J2YTc3M00rTHpKWWRreDB2bTlzdlRGSkVucEJtL1hiS2RU?=
 =?utf-8?B?OUYxQS8zc2FXbkhOdkFjcXBweDFmelIyMEMvYnhhWW55bThDOWQ3dWVNdDVN?=
 =?utf-8?B?YlZ2d1ZZZngyekZ6OUxXWHlxZTIxQzYvV3lqOU5ObzU0Y1ZWdkwwTE41WENm?=
 =?utf-8?B?VVVwZmY2NWVXK05VRFUwWTJvaCtwTU1NcnVMcHhHb3J3SjF1cFoxNGdjcWE2?=
 =?utf-8?B?cUIwenlYUUJvMkxpcDJMcW5WcW1sam1iOTNLQ25KY05rM2s4YkFYR3ZqUEx5?=
 =?utf-8?B?OUdiZjB5STVWZlZBWDNVb0xqVkZtUFZEc3BvenE5dUNnL0xrdm8zbjV2NlNl?=
 =?utf-8?B?aWRveVFaMFMxZVBWV3oxSFRTYVdIVS80R3p2Mm1uVWZSZ25HN3FwTlVCd1V1?=
 =?utf-8?B?MGJ2RVJCMHBYOXM1dXRERjFaaXRZak91bW5GejNkSVlYTWFzbHdTSFI3VExH?=
 =?utf-8?B?ZSt5VUdKdS9zemhKVjlYQVFOZlB4djNCbWEyd2ptdlMrb09aR1JSakcvb2Zm?=
 =?utf-8?B?bUJ6dXkrYTByY3k5R3hVeCs0M2pVVjh4Q0xZMnRaYVRZdzM4WTMyV2dSSXpW?=
 =?utf-8?B?ejZYb3ErQmZyeHRhTXliaFhQMzZqNTA1OU1aQXdnTk9VaXRvMkhwMlVYZkpV?=
 =?utf-8?B?RENVVGV6YmtzQ0FQNVJGdGxaNVFNQm43SVVTdlVBL2RRWEkyUGIzL1p0Q3JI?=
 =?utf-8?B?M1hHV3JKK2JxYUU3OU4wNVByN0dwOGdDZk14MFFrajI1RXE1cXNNbFZDVlhT?=
 =?utf-8?B?VUZkL0piL2p6V1gzdzg4TlowWUN2WlFvVys3blYrS1pFMmQ4VHRRc1lnSUpm?=
 =?utf-8?B?V1pWQnpYVFY0NjdFemJtOUVkRzRndCtlTmtpVHpoSXdjNjkwbW9QVXVwcWxo?=
 =?utf-8?B?TUxYczBpSEVUcVU1Qm00M3FGNEg2MDg4T0pOdDRaeUFjNmJ0QmtxeVpZRVBh?=
 =?utf-8?B?NllkeFFVNlFkUnR1aDhPMzVDeHk5VlVqQVB1UzY2dzFGNW5uRHNSSjQ4SXVR?=
 =?utf-8?B?cnp1RTdpZ25uUWZXK1NjalUyR1ZTUjFoanB3dlpyT1VhbUJHRVIvNS9ka2JM?=
 =?utf-8?B?eEdISkswVk90emEzNjM1K0JDL2dmUkxhYjVhQWc4ZHRIRWlVa1Z4aktEMTN1?=
 =?utf-8?B?ZHQ1UE1LdWowV1I3S29INVUwMGRRZTBIV3psVUdZenlBRStWTTBVK3ZBWVM4?=
 =?utf-8?B?L05XcWxxeS8rMDhRT09zd2h1UUJjek5UMjFOLzd0RzhKSU41V1hJU3ZLTXdt?=
 =?utf-8?B?dC9xaWpBeGhuUnhRODBtZmEwWW9ncTJDUi85cStyOFlaNGZra0VXMmVpL0RK?=
 =?utf-8?B?RkpWUlBxbzVQMnl0OFFJQ1NBYlZkVnNDOHRMMzkrcFlMbHdYampzamxXVUJU?=
 =?utf-8?B?bWVPb1R1OTEwNHpyREROUlRkNnlEek5yTGQ2cTBpUG1rWXQ1dVhZTE1tNEJG?=
 =?utf-8?B?cW03RllUaXZLRVQ0WTJYbkFHQXZGSWcyUHNvTEFDUW96L200M0tCUWIzUjVj?=
 =?utf-8?B?WHlZZmphek84ZDJzb1RuRzRPOFRidE96QzJ6K1p3Mkh5K0VDSVl0Z2tBYUJD?=
 =?utf-8?B?YkhCVlNCOXlxbm9pWk1QL0NNQWo4Sk9sNEErbGJCNlhKY0p2eVlIaWRDMW5W?=
 =?utf-8?B?aXptaS9VWmZQb0lmWk5XNTFjTzZobzgwSndDaGdFT1J6WkRaOElsNHlzQzMz?=
 =?utf-8?B?aGJXRVE5SnBqMGdkYThlZFh1cDBtaVNWMzVBUks0dFdOeTl1cGMyalR1aHR4?=
 =?utf-8?Q?bft1W4IrGAs8A2IZVsoA6IILi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4161d0-6207-405a-3054-08dab5ac3dd8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:41:00.4177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5CvPtzStToIjfeaEh6aeXeKhkMLKKVdmmb/STlKiRyMbbyOCmvn3eZRCje1n3vVEuYmDmJNtaM0LoQAFzajXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8435

On 24.10.2022 11:32, Roger Pau Monné wrote:
> On Mon, Oct 24, 2022 at 08:45:07AM +0200, Jan Beulich wrote:
>> On 21.10.2022 23:54, Andrew Cooper wrote:
>>> On 20/10/2022 12:01, Roger Pau Monné wrote:
>>>> Hello,
>>>>
>>>> As part of some follow up improvements to my VIRT_SPEC_CTRL series we
>>>> have been discussing what the usage of SSBD should be for the
>>>> hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
>>>> that has an out of date description, as now SSBD is always offered to
>>>> guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.
>>>>
>>>> It has been pointed out by Andrew that toggling SSBD on AMD using
>>>> VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
>>>> have a high impact on performance, and hence switching it on every
>>>> guest <-> hypervisor context switch is likely a very high
>>>> performance penalty.
>>>>
>>>> It's been suggested that it could be more appropriate to run Xen with
>>>> the guest SSBD selection on those systems, however that clashes with
>>>> the current intent of the `spec-ctrl=ssbd` option.
>>>>
>>>> I hope I have captured the expressed opinions correctly in the text
>>>> above.
>>>>
>>>> I see two ways to solve this:
>>>>
>>>>  * Keep the current logic for switching SSBD on guest <-> hypervisor
>>>>    context switch, but only use it if `spec-ctrl=ssbd` is set on the
>>>>    command line.
>>>>
>>>>  * Remove the logic for switching SSBD on guest <-> hypervisor context
>>>>    switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
>>>>    hypervisor code with the guest selection of SSBD.
>>>>
>>>> Which has raised me the question of whether there's an use case
>>>> for always running hypervisor code with SSBD enabled, or that's no
>>>> longer relevant if we always offer guests a way for them to toggle the
>>>> setting when required.
>>>>
>>>> I would like to settle on a way forward, so we can get this fixed
>>>> before 4.17.
>>>>
>>>> Thanks, Roger.
>>>>
>>>> [0] https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#spec-ctrl-x86
>>>
>>> There are many issues at play here.  Not least that virt spec ctrl is
>>> technically a leftover task that ought to force a re-issue of XSA-263.
>>>
>>> Accessing MSRs (even reading) is very expensive, typically >1k cycles. 
>>> The core CFG registers are more expensive than most, because they're
>>> intended to be configured once after reset and then left alone.
>>>
>>> Throughout the speculation work, we've seen crippling performance hits
>>> from accessing MSRs in fastpaths.  The fact we're forced to use MSRs in
>>> fastpaths even on new CPUs with built in (rather than retrofitted)
>>> speculation support is is an area of concern still being worked on with
>>> the CPU vendors.
>>>
>>> Case in point.  We found for XSA-398 that toggling AMD's
>>> MSR_SPEC_CTRL.IBRS on the PV entrypath was so bad that setting it
>>> unilaterally behind the back of PV guests was the faster option. 
>>> (Another todo is to stop doing this on Intel eIBRS systems, and this
>>> will recover us a decent chunk of performance.)
>>>
>>>
>>> SSBD mitigations are (rightly or wrongly) off by default for performance
>>> reasons.  AMD are less affected than Intel, for microarchitectural
>>> reasons which are discussed in relevant whitepapers, and which are
>>> expected to remain true for future CPUs.
>>>
>>> When Xen doesn't care about the protecting itself against SSBD by
>>> default, I guarantee you that it will be faster to omit the MSR accesses
>>> and run in the guest kernel's choice, than to clear the SSBD
>>> protection.  We simply don't spend long enough in the hypervisor for the
>>> hit against memory accesses to dwarf the hit for MSR accesses taken on
>>> entry/exit.
>>>
>>> The reason we put in spec-ctrl=ssbd was as a stopgap, because at the
>>> time we didn't know how bad SSB really was, and it was decided that the
>>> admin should have a big hammer to use if they really needed.
>>>
>>> When Xen does care about protecting itself, the above reasoning bites
>>> back hard.  Because we spend (or should be spending!) >99% of time in
>>> the guest, the hit to memory accesses is far more likely to be able
>>> dwarf the hit from the MSR accesses, but now, the dominating factor for
>>> performance is the vmexit rate.
>>>
>>> The problem is that if you've got a completely compute bound workload,
>>> there are very few exits, while if you've got an IO bound workload,
>>> there are plenty of exits.  I honestly don't know if it will be more
>>> efficient to leave SSBD active unilaterally (whether or not we hide
>>> this, e.g. synthesizing SSB_NO), or to let the guest run with it kernels
>>> choice.  I suspect the answer is different with different workloads.
>>>
>>>
>>> But, one other factor helps us.  Given that the default is fast (rather
>>> than secure), anyone opting in to spec-ctrl=ssbd is saying "I care more
>>> about security than performance", at which point we can simplify what we
>>> do because we don't need to cater to everyone.
>>>
>>>
>>> As a slight tangent, there is a cost to having too many options, which
>>> must not be ignored.  Xen's speculation safety is far too complicated
>>> already and needs to get more simple; this has a material impact on how
>>> easy it is to follow, and how easy it to make changes.
>>>
>>> It is the way it is because we've had 6 years of drip feeding one
>>> problem after another, and haven't had the time to take a step and
>>> design something more sensible from having 6 years of
>>> knowledge/learnings as a basis.  There are definitely things which I
>>> would have done differently, if 6 years ago, I'd known what I know now,
>>> and part of the reason why the recent speculation security work has
>>> taken so much effort is because it has involved reworking the effort
>>> which came before, to a deadline which never has enough time to plan
>>> properly within.
>>>
>>>
>>> So, first question, do we care about having an "SSBD active while in
>>> Xen" mode?
>>>
>>> Probably yes, because we a) still don't have a working solution for PV
>>> guests on AMD and b) who knows if there's something far worse lurking in
>>> the future.  Sods law says that if we decide no here, it will be
>>> critical for some future issue.
>>>
>>> But as it's off by default and noone's made has made any noise about
>>> having it on, we ought to prioritise simplicity.
>>>
>>> Given that off is the default, but we know that kernels do offer it to
>>> userspace, and it does get used by certain processes, we need to
>>> prioritise performance.  And here, this is net system performance, not
>>> "ensure it's off whenever it can be".  Having Xen run in the guest
>>> kernel's choice of value will result in much better overall performance,
>>> than trying to modify the setting in the VMentry/exit path.
>>
>> My takeaway from this reply of yours is: By default run with the guest's
>> choice, while (I'm less certain here) you're undecided about the behavior
>> with "spec-ctrl=ssbd". Please could you make explicit whether this is a
>> correct understanding of mine?
> 
>  * spec-ctrl=ssbd -> SSBD always on, expose VIRT_SSBD
>    (VIRT_SPEC_CTRL.SSBD) but guest setting won't be propagated to
>    platform.  As a future improvement also expose SSB_NO in that
>    case.
> 
>  * spec-ctrl=no-ssbd -> Run hypervisor code with guest SSBD selection
>    depending on hardware support.
> 
> Default to `spec-ctrl=no-ssbd`.
> 
> Would that be an accurate?

This matches my view, yes.

Jan

