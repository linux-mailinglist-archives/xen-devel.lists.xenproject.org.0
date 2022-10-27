Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678FF60F0F5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 09:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430900.683173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onx3Q-0004bf-Gm; Thu, 27 Oct 2022 07:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430900.683173; Thu, 27 Oct 2022 07:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onx3Q-0004Yd-E0; Thu, 27 Oct 2022 07:11:52 +0000
Received: by outflank-mailman (input) for mailman id 430900;
 Thu, 27 Oct 2022 07:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a7vm=24=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onx3O-0004YX-2O
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 07:11:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f09e54a-55c6-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 09:11:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Thu, 27 Oct
 2022 07:11:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 07:11:46 +0000
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
X-Inumbo-ID: 9f09e54a-55c6-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaqXtTgVGE2OSJBIlnH6PYiufJqWKOWKfUZicw7nSx3kToFw1OdkEJRwZu4Md8PnZJuHo18FDpMRp58FypBhBZrddUOp9zvkUozfsaGYUCH0BftN7oOpsd4yZbJd+2c9x85+2wmdM0AbOox1JdQR0hGiPH8XK1vabkZGxuupBzWWLLHk1KbJ1NqAlwhaipZdIW/RBFeIAf1N0Dg74PtElPY4xrqdnKazFKKPHMEW8xKp3VKiMf+YfS0lvAtozB/k2xnlrix48IOOZrdbAWDMcE8Aga05m7TEHY4V5MVN43KZTJiO2qyV1QlEkejLcf0FVdRHiezIgmBKU26RzSg1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGA40ZeBhhgDlmH+qfaS5dlLFuP3Lys15u+4bzXL95I=;
 b=VFMjFpp1/PePaDg2J7VoHHkCuF+6c0Lve3ySdzOtW9nPp4TX7Pi9qWo84NXdphTNMWUhU1Hylb0+3Nks+a/b8GLgdOQ8EqIljs8myLywQ0phRP8UQlQqOvrOsG3BIJiNpU+CQr46VofmuSBym1BR77R83TE2ZO9jycvFfuRtY0o9bdReZgub2qpCvhdzyNuvCRLyheuLuJCcI1HSjCuQTFsWWO2KyRBCccVuuYU1klyB8CqKKW8+m0ADWGd+et+kGNyCOyGyxkTqRmsP+kKneic5u2tWnHahLBv2RsOVjvZnFofnW4BeIowRxdbnvXAepA2WcVW0V8k7dd2w8hVsIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGA40ZeBhhgDlmH+qfaS5dlLFuP3Lys15u+4bzXL95I=;
 b=NAqXhZecN3ED3fDrk/OGog0tn7M7qHfN6jicrsWCHLlSKqO+bzHl76vBieZDeNZn7wk1g9te9A8D5Jdv8MKs5D42p7xuv73rDu3eXWWPav2tDo3KQ8mnC2tTdH2h/ou9n1ChVMJeCV2us4BdYax2zr8ZvZHTB+6R90D2/xc8EvLTdAONgmXK8koCByXxL7L7nHw9/PO6IqReKcjcThkZROk4Q7TJpQptv5qgU16lBRj3WuVbnshLe4okn+nY0lpB5lgwkFk5IZYUuic02nqJREUTgwZaRj07grFKHc5CWPD2ff13WsjMDd1UzvgMPfHSULiR1TPDaNmwb8OORYROaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a8bc184-6237-ed24-8d9f-daa3c36df915@suse.com>
Date: Thu, 27 Oct 2022 09:11:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
 <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: ba51dcae-cc3e-47af-9b23-08dab7ea8256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OK9K10bHZ3qRJCl2TqauiBpeQKIw+tKBjAv8ZL52LXYO5tlgIdxDfzQU0qKK5hxscfpPB1/H7Mtt7iVNbEbAgM+D1kWS9qKktJpfSw73BdQ0S3Kxefka37zS6BdkmqW5H29QUwTP8gy5qp1lTcAhV/yiQEom02N/VcN9bN6To4rUJ4Vu3g2eHL2esx+fguTzN0TKnIYY6jqtPPIE2/ibZdaqXc0Fs0DVzlKbVyuVWTGFSBjtKJh2/TrGQnlJqwhwrb+I85IFkbAdIDgBKMzSX8tr8BmsmRO7xojhOXHfn9lGduL51S1orTVgu6ERAauq61zlk0KYt6YTiwq3f61MmehmUWxqPOrPMuAXMJcDWbTJ1qs0kL7y52gHkXrTBjK+gaM2j9rkYkHjUkSO0FHsd9k3oAV3ZVgn4WAynZtNa3zuyLjL3bpXuL940x7++pMV7aWC8hgIhvdD3mO8AJtoNaCr0uyh8oFpkqlXgwzCgYrrT/TKsldfEPTQ89HqNMusTr2Y/KBt2sPBFHkaVFP7FSHjE9Xe0aiuNZZZKZ3+3+OgAuzCJu2QAjbH4Q/hQ148cRnYJxUWfwXbD96ggdbZFIlMcxNXcK5dYH3cM7wyLyvXmGOhTQcYrV61qRZSDtbi+IRPfvOGGtYixWJuj0yUEpmWpHoi23y3Vn4W6jz2+lBFTOYDL9vyY0caY88elo1ImipLJHKfMOMAkJzntLVW3T945XPcBszYoViutYMZE6oNW+yd0RQ+fe3AV1oW3suHYbIck6ZOjBZsJAIpvDwm27RRTBQ5Tr2RQd3vAMVzU8w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36756003)(31686004)(83380400001)(2906002)(86362001)(31696002)(41300700001)(2616005)(38100700002)(186003)(6506007)(53546011)(6916009)(26005)(4326008)(54906003)(6512007)(316002)(8676002)(66556008)(66946007)(66476007)(5660300002)(478600001)(6486002)(7416002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3krUk40c0d5bkdjSzFqM3NERy9kYU5lYnc4WWxKN3VKMGdybFNQSHFQdDBW?=
 =?utf-8?B?Skk0TlVHTU1KQnp2Q3I0QjlOS3NIQi9Cdk1McjhoK0FKWEY4RnI0UU01Q0tj?=
 =?utf-8?B?RUFXc2F0MzhIWEtlZm1IV1lvck1tNi90MllNUGljampFVStjTXBxcTJ5aWE3?=
 =?utf-8?B?Sk5DRWJ6Q0RJQVYzV1lDcDUxYW5aQmlna1RwdVRvK3MrUmVYZ2hsL3hMaytD?=
 =?utf-8?B?SHZqcXdZT2t1OFEyNFZtenJaRkphcE1TTTJEUkFueEZ5Z3JUSEFheGFXSlBJ?=
 =?utf-8?B?UVJLdklaUHdlMlQ0dnFXM2RyYzJyd0orUisrNDRPVWtEZHdibUI0WGlqMnBi?=
 =?utf-8?B?bzdMQnRxOGcyWTZTQ0IwT0ptL2tiTXRSZGx1Y2UyL21PZTNCQjBsWW1jMGQ0?=
 =?utf-8?B?alhhL1VLTS9PRXdwK0s0dXBOZ3hhbDNkOEc1TEloeitsaTB6NGdzZUNDeFBO?=
 =?utf-8?B?K0czUWNZSG9LMCtpVGc2YmJWV05vMFU1L1RGVWxCQ2VzOGtad0lDMDl0WG9K?=
 =?utf-8?B?N2c2WTJjYXI4UzBFS3NCNXZrcDhVS2VpVGpJYUI3SHNQOThxV1RCUUxqYmZY?=
 =?utf-8?B?NHkxcXE1NkZXV09rNVFUancyOG05Y1YyVWdlaytkL0RIak5leENSdHRsYWw3?=
 =?utf-8?B?aEVSZmNmUEZ4eWU3OStVdSsvM1ZIVmFvN0pIWE84RC80WDJlVTdtRkVucW9O?=
 =?utf-8?B?b1cwRDZnMUxLSVlmUlRJTUMrRTBrWUtNZUovS0pqN25td1pqYnRuRlhWZ1gv?=
 =?utf-8?B?Sks0c240bzZ5MFFlSVdnNmV3TmhiR1RMMmN0U0ZON1E5REhoTXpSRkV3bE9Z?=
 =?utf-8?B?Z0t0NFp2YXBkU0RHa3F2OHlyZmRNWjJvejdpZ2hEblREVEI2R1hYZlE4aThp?=
 =?utf-8?B?dFFFdkg3enBvOTdiNWQ1WUZpb1U5WDU2eTV5SVdwUFpjdUNJVkJBNkk5ZzBt?=
 =?utf-8?B?N2R0VGYySUpRL2wzd2JSZkp4cnZxNzNLUGxLb2o2b21wN3lTWDV3c3BFQ0dr?=
 =?utf-8?B?YWc0cXBMMnRJRmU3TU1mVnBwS0ZtSmJDZDFIcXpCSzQzbk0wWCtLZ3hSRVRS?=
 =?utf-8?B?SU1Ua2lDMlV2U1YwZkVJSCthdlp3b0RZU2Y1SUNHS0oxdTBWSlJEMkgwaXdz?=
 =?utf-8?B?aU1KS1RZRDZMZFJZUmdwaHJpRkFGYnJKQXlmOERodkk2SWNJR1JYTlprSHRV?=
 =?utf-8?B?U0dlWU9EMXptdGVFdENJb1Axa2FmcDdYZ3FFWi9xMWpjc091Z1JHTzdoVUFm?=
 =?utf-8?B?dlphYm03MkRoWVgwd2NWUmdmcDJIeGtnOEdIaXBhWTRqUHRmY0ozdG9xMzF1?=
 =?utf-8?B?WnBvSTdGZm5GWTdHdUM2a1AxeWkvblpHOGh0YXdwdDhDU1laZHhMam5XNWxE?=
 =?utf-8?B?emVzaWg5NkRIdlVvU3dWemFHNXh6Y2dVLytVNjJiczRaUVlMS0xzODNHTWRm?=
 =?utf-8?B?UDVjMDI5YVhSTXRGMEtVaVBWc1Z3KzFKOUhFV0k0dkhQNWgwODRBQkFYVVhS?=
 =?utf-8?B?U08vVTdBVkFGRXFRVWU1Q1c5K1NVV2d1ZEh5b1JHb2FYT0swa1haZ3hRSk4y?=
 =?utf-8?B?cko4MmtRSk15eFkrOWo5YkNJY0RtQ2hTQzM5VDREakZmVjh5RGlCOEJHSytB?=
 =?utf-8?B?MUM4bk9LYnN3aHd0VDBKRDFjajJoNTVtZlo3aXNCaVFkMlBEZGNJOEc4SHNW?=
 =?utf-8?B?UjZUMUJ5eW9mZ2c2NHJIWVJocVJHWHZ3Y0MzcnhvN3JoSlN5bmI1RVBNZnJ2?=
 =?utf-8?B?L0Y5dFNOQ1p4REtPYko3R0d2OEc5b2E4aTBqeUhaeEFRZ09VUFprVkNLTjlx?=
 =?utf-8?B?YVlrYVp3S2hnYVBCTUR5RzRlWGkxSVgrdjIvbWxlcnFDc243OW5jbnYxelVF?=
 =?utf-8?B?aExpbXJtazVMeHp4VmYrNU00Z256bTc4K0E3N0dJTjcrc0xaYXAvOVNIS0E4?=
 =?utf-8?B?clVhZkpqQTRPQ3BNbDhsVjRkeUhGUTFpQUtTOHBOem1RQjcwR3lTcnVFVGNX?=
 =?utf-8?B?V0Y3cnpIdTFMWmRYakQxZGg3OHFpZVFDRmw0dDgvL3hTclk3bVZPbk85SjZh?=
 =?utf-8?B?Z3kwb0R4T200OUZLWTM2b29TWDRURWVJbFFtc2J2d0p0a0x2UmRiczRQbjJn?=
 =?utf-8?Q?N67IS3JSesnh9VU+FBoL4YdbN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba51dcae-cc3e-47af-9b23-08dab7ea8256
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 07:11:46.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsUIeKx8pDejpCQgC2B4lhtyDW+pZCCDJFWFLvlAOUWyxqNDFJA3vuxCskU8XO0PBxEwfNOQJ4TcDzea8VC9Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

On 26.10.2022 21:22, Andrew Cooper wrote:
> On 26/10/2022 14:42, Jan Beulich wrote:
>> On 26.10.2022 12:20, Andrew Cooper wrote:
>>> The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:
>>>
>>>  * All set_allocation() flavours have an overflow-before-widen bug when
>>>    calculating "sc->mb << (20 - PAGE_SHIFT)".
>>>  * All flavours have a granularity of of 1M.  This was tolerable when the size
>>>    of the pool could only be set at the same granularity, but is broken now
>>>    that ARM has a 16-page stopgap allocation in use.
>>>  * All get_allocation() flavours round up, and in particular turn 0 into 1,
>>>    meaning the get op returns junk before a successful set op.
>>>  * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
>>>    despite the pool size being a domain property.
>> I guess this is merely a remnant and could easily be dropped there.
> 
> It's intermixed the other shadow operations.  It wasn't trivially-safe
> enough to do here, and needs coming back to in future work.

Right, and I should have said that this is merely a remark, not a request
for any change here.

>>> Name subject to improvement.
>> paging_{get,set}_mempool_size() for the arch helpers (in particular
>> fitting better with them living in paging.c as well its multi-purpose use
>> on x86) and XEN_DOMCTL_{get,set}_paging_mempool_size? Perhaps even the
>> "mem" could be dropped?
> 
> Yeah, this was a placeholder for "what are we actually going to call it
> in Xen".
> 
> I went with mempool over just simply pool because pool has a very
> different meaning slightly higher in the toolstack where you talk about
> pools of servers.  Admittedly, that's code outside of xen.git, but the
> hypercall names do percolate up into those codebases.
> 
> paging isn't a great name.  While it's what we call the infrastructure
> in x86, it has nothing to do with paging things out to disk (the thing
> everyone associates the name with), nor the xenpaging infrastructure
> (Xen's version of what OS paging supposedly means).

Okay, "paging" can be somewhat misleading. But "p2m" also doesn't fit
the use(s) on x86. Yet we'd like to use a name clearly better than the
previous (and yet more wrong/misleading) "shadow". I have to admit that
I can't think of any other sensible name, and among the ones discussed
I still think "paging" is the one coming closest despite the
generally different meaning of the word elsewhere.

>>>  ABI not.
>> With the comment in the public header saying "Users of this interface are
>> required to identify the granularity by other means" I wonder why the
>> interface needs to be byte-granular. If the caller needs to know page size
>> by whatever means, it can as well pass in a page count.
> 
> Not all architectures have pagetable levels of uniform size.  Not all
> architectures have the mapping granularity equal to the pagetable size. 
> x86 has examples of both of these (and in a rogue move, one x86 hardware
> vendor is trying to add even more pagetable asymmetry).  Other
> architectures substantially more variety.
> 
> Even on x86, there are performance advantages from using 8k or 16k
> arrangements, which could cause us insist upon >4k requirements here. 
> (TBH, not actually for this usecase, but the principle is still valid.)

Perhaps, but that doesn't change the picture: The tool stack still needs
to know how many of the low bits in the request need to be clear (unless
you would accept to go back to rounding an unaligned input value). And
once it knows this value, it can still convert to a count of that-unit-
sized blocks of memory.

> The reason is because this is a size.  Sizes are in bytes, and that's
> how everyone thinks about them.  Its how the value is already specified
> in an xl cfg file, and it entirely unambiguous at all levels of the stack.
> 
> Every translation of the value in the software stack risks breaking
> things, even stuff as simple as debugging.  As proof, count the number
> of translation errors I've already identified in this patch alone.
> 
> This ABI does not require any changes at all (not even recompiling
> userspace) for ARM to decide to use 16k or 64k pagetables in Xen, or for
> x86 to decide that 8k or 16k is beneficial enough to actually require.
> 
> Attempting to compress this uint64_t into something smaller by any means
> will create bugs, or at increased complexity and a high risk of bugs. 
> There isn't enough money on earth right now to afford a 128bit processor
> with enough ram for this current ABI to need changing.

I didn't suggest to use a type other than uint64_t. I'm merely puzzled
by your insistence on byte granularity while at the same time requiring
inputs to be suitable multiples of a base granularity, obtaining of
which is not even specified alongside this new interface.

> This is going to be a reoccurring theme through fixing the ABIs.  Its
> one of a several areas where there is objectively one right answer, both
> in terms of ease of use, and compatibility to future circumstances.

Well, I wouldn't say using whatever base granularity as a unit is
"objectively" less right.

>>> @@ -157,6 +165,25 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>>      return 0;
>>>  }
>>>  
>>> +int arch_set_p2m_mempool_size(struct domain *d, uint64_t size)
>>> +{
>>> +    unsigned long pages = size >> PAGE_SHIFT;
>>> +    bool preempted = false;
>>> +    int rc;
>>> +
>>> +    if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
>>> +         pages != (size >> PAGE_SHIFT) ) /* 32-bit overflow? */
>>> +        return -EINVAL;
>> Simply "(pages << PAGE_SHIFT) != size"? And then move the check into
>> common code?
> 
> These checks are deliberately not in common code.  That's just creating
> work that someone will need to undo in due course.

Would you mind clarifying why you think so? If the base unit isn't PAGE_SIZE
then all it takes is to introduce a suitable #define and/or global
specifying the intended per-arch value. Even if you expected this to become
a domain-dependent property, the corresponding value could still be a field
in (common) struct domain.

>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -977,6 +977,45 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
>>>  }
>>>  #endif
>>>  
>>> +int arch_get_p2m_mempool_size(struct domain *d, uint64_t *size)
>>> +{
>>> +    int rc;
>>> +
>>> +    if ( is_pv_domain(d) )
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    if ( hap_enabled(d) )
>>> +        rc = hap_get_allocation_bytes(d, size);
>>> +    else
>>> +        rc = shadow_get_allocation_bytes(d, size);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +int arch_set_p2m_mempool_size(struct domain *d, uint64_t size)
>>> +{
>>> +    unsigned long pages = size >> PAGE_SHIFT;
>>> +    bool preempted = false;
>>> +    int rc;
>>> +
>>> +    if ( is_pv_domain(d) )
>>> +        return -EOPNOTSUPP;
>> Why? You do say "PV is weird" in a post-commit-message remark, but why
>> do you want to retain this weirdness? Even if today the tool stack
>> doesn't set the size when enabling log-dirty mode, I'd view this as a
>> bug which could be addressed purely in the tool stack if this check
>> wasn't there.
> 
> I want to clean up PV, but again, it wasn't sufficiently trivially-safe
> to do right now.
> 
> PV is weird because it is neither hap_enabled() (fundamentally), nor
> shadow_enabled() when logdirty isn't active.  While the freelist is
> suitably constructed, the get/set operations were previously rejected
> and cleanup is local to the disable op, not domain shutdown.
> 
> I could put in a /* TODO: relax in due course */ if you'd prefer?

Yes please - that would clarify this isn't a hard requirement.

>>> +    if ( size & ~PAGE_MASK )             /* Non page-sized request? */
>>> +        return -EINVAL;
>>> +
>>> +    ASSERT(paging_mode_enabled(d));
>> Not only with the PV aspect in mind - why? It looks reasonable to me
>> to set the pool size before enabling any paging mode.
> 
> Because this is how all the existing logic is expressed, and this patch
> wants backporting.

What do you mean by "is expressed"? I can't seem to be able to find a
similar check on the existing code paths. But given that yesterday I
almost overlooked the d->vcpu check in paging_domctl(), I can easily
accept that I might be overlooking something somewhere.

Jan

