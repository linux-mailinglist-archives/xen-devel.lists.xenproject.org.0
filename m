Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5173A690AC5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 14:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492454.761987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7DX-0008Md-9J; Thu, 09 Feb 2023 13:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492454.761987; Thu, 09 Feb 2023 13:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7DX-0008Iz-5H; Thu, 09 Feb 2023 13:44:03 +0000
Received: by outflank-mailman (input) for mailman id 492454;
 Thu, 09 Feb 2023 13:44:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ7DU-0008It-Kv
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 13:44:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccc0bace-a87f-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 14:43:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Thu, 9 Feb
 2023 13:43:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:43:27 +0000
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
X-Inumbo-ID: ccc0bace-a87f-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoejXy1Q65jIW8kXPgx6JO3orS3X9vnNNAasqna3R8luVOeyQI3uajLoM4ZBMjy8jU3CSXnDgNd1H+U6yckEvUikwbZ2dV47WXHDogQAfLXPIATQIHT7IANTiqPAs2FX8n0yqAZ35+Wmz3VIgIHD9sx84bu57LYyz+X9xuXxu0McuwNnA+R/6BwYsfwNNmZt0zJP4prpul1PI2EgkKhgW4W1FjkyJDxbT6voRnuejEPPTvh6Bf5pRcwFSSu399KOt3c4eROfc/6E0zzce9Cu3FVU/5hkc77id2d2Ke1PzZz06MDel42IxnPTxkiC6urTitTY1O0MUWGuiS0IqiUZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EB/QdfctYPXrhMft+Ws3yV7LH89cspSGYvVA8BflDKY=;
 b=kLNsZxqy/k8gQZ8pyOX30uAqN4HYw2DaHnGIyo3bsQmR0MUVtYeLkXOddctoxzg6V8wolHbkxMXUPPkfhbykMdjhsqgJdV77MVO0j5+sZWOdzgHJpqXLOcj6TX4IwNi5k5CSkeYCek9zWEqdyr5ixnVkbIMUQwpuzn3Wkzuxe3Dd76RAbZAolrrUcazMLjJoSZ0erF9gtgQJd5jqa8SMk62JyZuipS7GxXUEml3OK36yrdYZ+6jjR4ScDAKJ2x49NIVL1XDJV6pH1OHvcjE6Ryr7lOPk+AkKyZa/sc5g9QA1ZKg50BKMpNVUqw2bB1bllF80X5rVbBJamO65lpDdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EB/QdfctYPXrhMft+Ws3yV7LH89cspSGYvVA8BflDKY=;
 b=UGpktDzKXsikUNoCYS19HyphmWALTKAh8gehBcYr37oHpS5auXyJQ4vZwEnktvcim/oL8eNhJvpgiJJYiCm+QYGdC4BkLwdrRNPDwBHwY0G/zPhxvuKfaYXJdQAaw3PuRhFoXWaQIYHSdDFhGKOErAan7pFgc+Bt4Lk1pOP+XSPM8/tVYCvzrRVHy3QvEAuSr+FipGlkHGgcHaKPZTtryMVl4mU79ycP0FraLIo5UoVoflBKksipKPZ+maC7I64HiJ2Dm/uNwWxfNvKWC+L/3Sd7eaVVvClDE7vIysIcG2nhPk3MT4m9cgV/kG1zIYC1LCfhTR/l1Om1/ErC7fVYJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b899223d-6e13-af64-2359-76d0c30ec46e@suse.com>
Date: Thu, 9 Feb 2023 14:43:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Proposal for consistent Kconfig usage by the hypervisor build
 system
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
 <906028ef-b9cd-93bd-8ee2-f263851496f5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <906028ef-b9cd-93bd-8ee2-f263851496f5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: e883ff24-e22c-422b-3d4f-08db0aa39f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9wC95S0Crcm8rW66iPv/fj2Ku5ycsBWXblAo2VKDGdPkBlz2CHl1M6iXMRqcwlkLG12fEJ1hZ1kXK6TaAxg1qwdGSphwV8m4vDk20rbTuVkNHEr3nmMH0pOhsq5QhV0qyB3875sHgvAHp0+U19QCCFwdN//kR0BmJxCqJdEDDS9fhi3POlXPEezRuVbdZDwnAKBLGb/jmV1IPySBlps49LUaqSkYg9zsFhzk7p1JS74RXwWw+fyHhqHCu8YeBmZMi2WYV1K+DD7Y466ixW3qI3mzWHHe9ChhIKcW71tuTRvpKid+FY9PN04C8Q79l1Tk8hahEwfQwTnfVnnPRpyZvyW2/pZGdEiMkVCxdWuOvfqb5ETbdnK/vqbDF0fyWFAR00GrIdNexV0hn1CWyjEQTltpAI/kRIMoNvv+KjeUR1ftRGoEl9eT/SMDLEFm0jdmDXQl5xx8NXoLc5rR2a9/BG924Z3uSEws9Vkv4l0XyUgjHrZKEP60DrCd97PnLjS/W2WfmdogXodrf1YNK92AaffYYYeh0WKABZEmtgkLcJMVBucGf+3/uBAQkKgIfVJACcCfTjkFmMXe86ncQhVCKvLphHjp47wb00KpjcBxIhWh+sc6nmileboIsHT8OCpjxvMhX3uXV/O9keZXZW/zdgIrlqyKPOqlqOl3xLzkoHaRL3McbjPvgYQG2y8JXZVP+xRWK9+uYVEEduXq0p/bSBRCm5vNYKZwVaG2OVx+TTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(5660300002)(26005)(31696002)(86362001)(186003)(8936002)(2616005)(38100700002)(6512007)(83380400001)(54906003)(66946007)(41300700001)(4326008)(316002)(6916009)(66556008)(8676002)(66476007)(6506007)(53546011)(478600001)(6486002)(36756003)(31686004)(66899018)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXJBaStPeHhoTFBwQmIxSmMzaEwzWnVCOVJGYURoTWZReU5TWG4zK3JpZC9l?=
 =?utf-8?B?K00wdTRwSW5TV0tZMEVjS2hKS2IrVkhaRU1Zb0N2bnhOK0N2Q2FXN0NiLzhD?=
 =?utf-8?B?N1NmRENxSzg2bXZGS3VIYTg2eCtlbjlsSmx1YkhRaHpOb3dwTEhmVDQxdmFV?=
 =?utf-8?B?TXBSNVNrNVZ1SEFLZG1uM2Viai8yYXhEbmwrSVhxWGtxNXFXdEpiM0lNNlIy?=
 =?utf-8?B?VHlEdUJHQWRWTlFCWUhjT2lVZVV4ci9URTZsbXRQanJtL0w0dGNPOXpuRUU2?=
 =?utf-8?B?bGpKN2xaUitSOURhT2R4V2llVktWeWh5em5hTTUxMGs4a1c3Z3dsOHo0ZXdP?=
 =?utf-8?B?QWE2UEhwNXNTaENmVkxKbm50bGNuTGY1cXlTVHdELzByT0ZsZ2JLM1p6L3FO?=
 =?utf-8?B?ZUl3NGJLaDJ4eHFxYVp0NUQzWVh4Y24vMDBYTlRvd0ZYVjRuc3p3aGVvUXJI?=
 =?utf-8?B?M2J2eXVQeFRGb01pVFVxSGk4NlhOeU1kcWpqTmY1SWk5TlFiNmRvdk03bGd2?=
 =?utf-8?B?S0JOTTk0OVhDSHhqeXQ3S2F1SW55VmpuU0MwUDlsSHZHQ2FzSnMyb1dPaVl4?=
 =?utf-8?B?SENKdFlNSm44RWRlSTNmaXdxN3pKaENFUXhGa1g5Qk1icHQ3cmFpMDlxZ1RJ?=
 =?utf-8?B?TmtjbDBlRVk4MitiVXFsU1Y2eHZiNXdzTVRnbDBweDRGTXVOb0pQMUtMSEgz?=
 =?utf-8?B?cE1HTHNPSTRCcEFxN01hd1NxV1hsOFUzRW0vUWRZaDBNVnJjSGJDRERnVy9W?=
 =?utf-8?B?QVdwS1FKOUdDM2pqMkN1a25jRzB5UjVySHZjQisrSWVBYm9oajliZkxXNno0?=
 =?utf-8?B?NUljaFFOcTZHalBYVG1Ba2ZxRjZtQXNra212M0xIT3ljMkZ6enpGS09tRjBk?=
 =?utf-8?B?MlUxejJlRVRmcW9VSjFoMVprQ1NNQ0NXTmMvZUgvbG4xcXViSlR6QXIwL0dH?=
 =?utf-8?B?OUIwQlU5dW0wNXByMFFIZ1BOK3pxYzU5c0xxN3VxaC9jamdZVHExNGEvMUJz?=
 =?utf-8?B?S1RGTElKT2s0NnNaTE5iZHVET1FvUHU4eTNLQkxRUXM2TGpTVEtKcUluN2pL?=
 =?utf-8?B?Rm00aHRjSEtZUWJ0OGVHRWg4NVlqYkFSdFJObEVKZ3Fab1RSUk1oZDNCRWVS?=
 =?utf-8?B?QTZacVNUeTVja0pXWCtUNm5jTDdCa282U1Z3OWJuR2JMZS96eENmWDlTV0Fh?=
 =?utf-8?B?NEtVWlNkZ21KVXZWMlpSeVNqUXpnLzFKR1Via2xXQzdtRWNpM3M4MFJDU2Rl?=
 =?utf-8?B?K3BheGhkb3hIQm01Y3ZUMXZiNUowVytiZjBpeXN1SUNCYUJTKy85OHZLdWZp?=
 =?utf-8?B?aHRXcGw1RGlYaFZnS04vMVZIKzQvcUpldjNCZElDdnFBY3VvV2d2QXlKUk9C?=
 =?utf-8?B?UXhjMGxteXh2aEg0UzM4MkVMT0pBMlRmWEp3MFFBMHJRZUgyWUpKTW5rMlRF?=
 =?utf-8?B?VEFub0ZNRHJGcmx1NFU1aldDdEE5L3NHYXBJR1prQ0R5R2p2dmtGdU4reE4v?=
 =?utf-8?B?eGY2L0Y0eVY2TTVRNFpUbC9VRUIwS1pMclJNU01sZ2ZNWk9nbzdKaGhUTUlj?=
 =?utf-8?B?cTRMNmVVdGJINHN3YVFvczBsellkczJLYXQrd1hITUNxS2xZVHJ0U0VlREZy?=
 =?utf-8?B?bXFyQkNWdkQ0OWtNUFZ6QXczMVRKblBaN1FjbFpGZlNNam53d1NMWFZNbVlu?=
 =?utf-8?B?bmM1OEg5cjlubFUxdlNnTG56b2xHcWZhQ2I0eXV6clNwd3NGYXpXVUh2Rm9p?=
 =?utf-8?B?dm9UZHZsR21WZmw2Z3JYaWM2T09ucTlQc1lFRGVYWEFMcDBWaXo5Rm9RV0dh?=
 =?utf-8?B?MWlBUWpkdXJQeUQ1K2hGN0l5YnpGUG5yZTZ3Nmg0N0Z1N1RsMlR3SnBQbTQ4?=
 =?utf-8?B?V2ZocDFmM3pUcGh5VDZ3MkdzMVNINU9KbkVOVVNxaGRPc1ZkVTMzd0c4L2VN?=
 =?utf-8?B?R3BtK0c0TEhacmkydDJPQmdoWEZJTCtwc2Q2SHhFQkZQU2N2ZUxKbW9MZGJz?=
 =?utf-8?B?a1RBVkhMUU51VUlEaGZGa3lieER5N2F0cmtZTG8yUHZ6VFV0RUd1RVIzaFh4?=
 =?utf-8?B?dU16aVdRTUhQY1MzUjcyQmxGNzRxVGRVdDBmS3NJY3pidUVDbDBaN2R0bEgy?=
 =?utf-8?Q?mU+ArzHbdXi19J2MyUn5l7npb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e883ff24-e22c-422b-3d4f-08db0aa39f98
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:43:27.8433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wdp6awDOqWYa7N8o7aHd4eN0TP9F3yacxUIctYFlFKLeXWrNzoedOi1/m7sw5aXZ56xGS/Ooq5VLSIONY/v0GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974

On 02.02.2023 16:51, Andrew Cooper wrote:
> On 12/01/2023 4:52 pm, Jan Beulich wrote:
>> (re-sending with REST on Cc, as requested at the community call)
>>
>> At present we use a mix of Makefile and Kconfig driven capability checks for
>> tool chain components involved in the building of the hypervisor.  What approach
>> is used where is in some part a result of the relatively late introduction of
>> Kconfig into the build system, but in other places also simply a result of
>> different taste of different contributors.  Switching to a uniform model,
>> however, has drawbacks as well:
>>  - A uniformly Makefile based model is not in line with Linux, where Kconfig is
>>    actually coming from (at least as far as we're concerned; there may be
>>    earlier origins).  This model is also being disliked by some community
>>    members.
>>  - A uniformly Kconfig based model suffers from a weakness of Kconfig in that
>>    dependent options are silently turned off when dependencies aren't met.
> 
> This is deliberate behaviour of Kconfig, and not related to toolchain
> dependences.
> 
> Exactly the same thing happens for a change that edits a regular
> dependency, or inserts/removes an option.

That's sufficiently different: Options depending on one another of course
can have that effect. But we're talking about depending on something
outside of the control of the person doing the configury.

In fact there's a use case where tool chain dependencies get in the way:
Our kernel repo holds (often multiple per arch) pre-built .config files.
Prior to Linux introducing tool chain dependencies, anyone could update
them (without actually trying to build the result right away) using
whatever compiler they had to hand, even cross-arch (as the kconfig
step only requires a host compiler, not also a target [cross] one). The
resulting configs would then be consumed by the build system, using the
proper environment for the targeted code stream, i.e. including that
code stream's tool chain. If the build resulted in a change to .config,
this would be flagged as an error. When the first few tool chain
dependencies appeared upstream, they tries to hack around that. I have
to admit that I don't know what the state there is nowadays.

>>   This
>>    has the undesirable effect that a carefully crafted .config may be silently
>>    converted to one with features turned off which were intended to be on.
> 
> The Makefile model does exactly the same.  It *will* check feature
> availability of the toolchain, and *will* modify code generation as a
> result.
> 
> The programmer just doesn't get to see this because there's no written
> record of it happening when it's not encoded in Kconfig.

I don't think I'm following you here. The Makefile model in particular
won't turn off and CONFIG_* values.

>>    While this could be deemed expected behavior when a dependency is also an
>>    option which was selected by the person configuring the hypervisor, it
>>    certainly can be surprising when the dependency is an auto-detected tool
>>    chain capability.  Furthermore there's no automatic re-running of kconfig if
>>    any part of the tool chain changed.  (Despite knowing of this in principle,
>>    I've still been hit by this more than once in the past: If one rebuilds a
>>    tree which wasn't touched for a while, and if some time has already passed
>>    since the updating to the newer component, one may not immediately make the
>>    connection.)
>>
>> Therefore I'd like to propose that we use an intermediate model: Detected tool
>> chain capabilities (and alike) may only be used to control optimization (i.e.
>> including their use as dependencies for optimization controls) and to establish
>> the defaults of options.  They may not be used to control functionality, i.e.
>> they may in particular not be specified as a dependency of an option controlling
>> functionality.  This way unless defaults were overridden things will build, and
>> non-default settings will be honored (albeit potentially resulting in a build
>> failure).
>>
>> For example
>>
>> config AS_VMX
>> 	def_bool $(as-instr,vmcall)
>>
>> would be okay (as long as we have fallback code to deal with the case of too
>> old an assembler; raising the baseline there is a separate topic), but instead
>> of what we have currently
>>
>> config XEN_SHSTK
>> 	bool "Supervisor Shadow Stacks"
>> 	default HAS_AS_CET_SS
> 
> Yes.  This is very intentional, and is AFAICT an example of something
> which cannot be encoded in the existing Makefile scheme.
> 
> There is a tonne of stuff we can only do with proper toolchain support. 
> CET (both shstk, and ibt) are examples, and plenty more to come, where
> playing around with .byte in older toolchains simply will not work.
> 
> There are also plenty of cases where it would be technically possible,
> but the cost of doing so is so large that it's not going to happen.

Right. Hence there'll still be cases where we simply will fail the build
vs ones where we merely create less optimal code.

>> It was additionally suggested that, for a better user experience, unmet
>> dependencies which are known to result in build failures (which at times may be
>> hard to associate back with the original cause) would be re-checked by Makefile
>> based logic, leading to an early build failure with a comprehensible error
>> message.  Personally I'd prefer this to be just warnings (first and foremost to
>> avoid failing the build just because of a broken or stale check), but I can see
>> that they might be overlooked when there's a lot of other output.  In any event
>> we may want to try to figure an approach which would make sufficiently sure that
>> Makefile and Kconfig checks don't go out of sync.
> 
> This is a brand new feature request.

Not really, no. That's an aspect that should have been considered before
switching any tool chain capability detection to the Kconfig model.

>  But it looks like you're trying to reinvent ./configure without using ./configure.

How that? I'm specifically trying to stay away from pinning down what can
or cannot be built depending on the capabilities of the tool chain used
for the *config step of the build process (which, as said above, may
deliberately happen in an entirely different environment).

Anyway, I have a prototype for the two CET controls mostly ready now, so
I guess we'll continue the discussion there once I've submitted that one.

Jan

