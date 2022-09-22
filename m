Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22365E5EB9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 11:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410055.653037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obIe0-0005yr-Px; Thu, 22 Sep 2022 09:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410055.653037; Thu, 22 Sep 2022 09:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obIe0-0005w7-NA; Thu, 22 Sep 2022 09:37:20 +0000
Received: by outflank-mailman (input) for mailman id 410055;
 Thu, 22 Sep 2022 09:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbTr=ZZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1obIdy-0005w1-OR
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 09:37:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc79c16-3a5a-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 11:37:03 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 09:37:14 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 09:37:10 +0000
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
X-Inumbo-ID: 1cc79c16-3a5a-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3UFUrauKFflgzQA7JbA6vWZTB8lPG7JPtG0HWlDts9kEHDCoMEuvHU2ZROPEDd1Pn5CVY5XgrY0H+EGZNSpf5TPJ13TRzk5H/9H1TnXZRVBh9tzB8VaB+F+FVIO2FLU6KJpdxr0OzQXgggFFR1I/Yj9UiutMD5IfEnqV4a1QjJZ9AbBAkw7NX8LdfoVEKQq6plCu7dCNQGBQpiNivSCTai+vY3tW3Qr4b97ryPfEZcijF8ItnhnmThvknKfTjQEppgYbvAJQTRkzKtp1pzX/ktBBIn6WlTe2QyLrZqI2zOue9OgOQAUukyoQCEvY7GV7XKxHx21uWj47s1P3Ix+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUMi/Rn9XydsAH+mfogIjYI3FWVVY4P88+IiOvCrgFA=;
 b=Q+xhiSUigOrDoH3D9neXW3tuTnuw67qpsY7R/XzsOm6UPM67jm4KaXIRp/EcvMDreSOLrpouWcPi/fWFOYldhqZbi1TNYmkGYWoE/G0hXJ8UJNt0sPMLG9Yfzc3SVbBVU2CyEL0xvH7mB669MV2H0qk+AbHP2lPD/PY6a4LtBHqN8k7z4laCY3WjoVh4LYI7JOzM4VxELa1dwhJZx3pCOprtfpuXw1if6aPRkaE72r9ADnhVuufQXzcDhJnvE36F93gajrOqFIj7fpEPKkPV9GqW7LXaTP35NlGFT7H/bbQo/FJ03Y0HHbyAYKjMTPMQbea23879W9RN5/bui7HBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUMi/Rn9XydsAH+mfogIjYI3FWVVY4P88+IiOvCrgFA=;
 b=TtZnBb5Pj95TXzVpto9/jIQfbK6T1YpSMPKwlmQAL3HTGnDbLlt5M6KWvxJZ4TRyqsK4YA7E31Hl9rCzV6S0JX8L09liSqkHraUety7cVyGpAUvRvA2UC/41PGIAAzpsOyfUCs06L1IPICFDXJ5pI3fPPa3fT5PBxBxLdZX+gFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8b210398-9db9-1279-85fc-40a7cd2403b7@amd.com>
Date: Thu, 22 Sep 2022 10:37:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
From: Ayan Kumar Halder <ayankuma@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: "Address space isolation" - meeting notes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB4310:EE_
X-MS-Office365-Filtering-Correlation-Id: c32fe3ee-39b0-4229-7074-08da9c7e05f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3EtlAG1J3pT4TNDiviZ1RBRdj7p07REJ6gSV7McKoCSiAJeWXc6VFysFswax0bz2y9lU67sQlEhrB4HdDIXoMB9JBFedoUEBgkFK28bsRFnxCm6Yrxcuw+iC4jT3Q1QmZ1BtoAxcUklP0dY2Qfh79eiLLTGPoM+GWgb6Wx5btvBweknFaa6j/ENSItxUQP7PypKNNt+dT8IBa7i0of+nDbVWvEG9LZ7Gt6+BIeiZDevzCCALd+SPm7I7aph+YKfqkjSTJfu7Wj2/Jj5cvzi9W0T+jgkh+XKmHtYjQ2+BbCn9RG4dBDvVxKTcky5MTU8+TYod+SRNYGaE8+EN1TxuFjCaVQMb/tVwNxKGXItQ6yCw2TOgW4kAOzl69fOpghmPpFOr0Oj8qXWzwqqMiag6XHVbzD/TEvo4f3GoBbxl1bXWBvLHsMzY2Gafu8KOdVMrkC1w0nzV9gq5Kmcf+jrEguIU4Vr4f7JDm/uO+OumZT5zs5DJdHDvY4rd8WbAAw3Dv1qZsRdJCUzr5E8JQP+JK2mMas40W31WGQxo9dZMc0BkA52zIYA560qoMMlQkMmby0EfJfR5yYK/64yPG5NM/IGjloPwti+M6jlk1xV9GSjVjdhf5YcjyKx/f7ig2qc6LW9uWHk85QWE5SWAE/plgry1elT29GM+QBY283zaLzR3MPeqL6bkS5QCPMxQkSAcoOLNmSp2Ev0xGmcAuaNoY6TDXnRsWQcP9HhBI0YgMFa4rw7u+g1oGrzHLfyGbYLLtKRWQarGZKm36GuVl5Y9Stw6C8q710lbIGEu9KekipU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(8676002)(5660300002)(2906002)(31686004)(41300700001)(6666004)(6512007)(26005)(6506007)(38100700002)(66476007)(66946007)(66556008)(8936002)(45080400002)(316002)(6916009)(31696002)(478600001)(6486002)(36756003)(83380400001)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEZMWjdmc3BoN3NJSlkzZ2dRckVwdEJtTDJ4T1hNdTZaTGJjZDNhc1c5ZDU2?=
 =?utf-8?B?TS9CbGNKYm5DbkhsVWRlR3oyUTZ6R3JnUzA3SjZWUERQM0FTVk9mMXptL0Zh?=
 =?utf-8?B?bkVDMlREMm5UblFJZTQ2eHRLRU9pR3Zic0ZDb0tGZm1QUk43bGpDVG94Ui9R?=
 =?utf-8?B?N0s0U2Jjd0tCeFE0cGJtdUwvSTJFbTVmQTlxMFA1bDUrcUY3NXVERjl5a1NO?=
 =?utf-8?B?N3lvNFRSb1Z0R05MNXZzTjRSMnhMNFhSWVdrZGg4c0RuaHRvK1FxQ21CVmRK?=
 =?utf-8?B?QVkwVnNkTnZwdktxTzAzS1gxVFlDam1qR0VjNjg5TXpHdmMvVDF1MXpGZ1RT?=
 =?utf-8?B?d1NhdGM0VUVTSTd0YVdsTzBtMlZOdFVJeFNWY1NiSzZaVWF1aFlrSlNOUVFi?=
 =?utf-8?B?REZuUUE3a3FxSXZRTXZoakt3MTBTV01taG16TTl5bTFpTiszZXdWK3RMK0ZI?=
 =?utf-8?B?K2lVWW5RNHJzY3RYS1lKbmZsVWVJWGpBZTJ0WHppTzRvSzZ3LzVVL0FEZzJP?=
 =?utf-8?B?NGlaOG1mVWRkK2NSTWRhOE5vNFJRWmN6WWQvN0VJZ09zY1ViOXpVVGhKc2Y0?=
 =?utf-8?B?RFZlVTRYb1RMN0RzMWd4Y1M1Wm0xUHhOZlI3cWFNWDBuTkNPUndQbVV0cXlj?=
 =?utf-8?B?dVJOYm1yc0VISCthbnZzV1ZVUTdUWkZYQlFkN2hHWkcwRzRrVVdZcmVUV3ZU?=
 =?utf-8?B?UGxxV29DaEdWU0tvWFNabnFuS0VpUmVUcXdYM2tWanBiMVVhYzlkMmJLL3lL?=
 =?utf-8?B?RXNQT3NMNjV5Q2NYalYwWVp4b2E2Ymc1K2lFTmdhQmFIb1AvUEFzcWZzbU1B?=
 =?utf-8?B?eVZFdnM3WG5GZWdzWjU2Zm5jYjBUcTZMWk4rL1F4ZWY4U3FLdUR4aDIrYTIx?=
 =?utf-8?B?VTZHV1dXWTJBeW92TUtDRWpzUUlHOXpkckZyb2NRZkpMNmZralVrOUo5ZWRv?=
 =?utf-8?B?M0V2cHd5dHRIYThCaDRhNnVCMnFDbkxGSC9rVzFTWmlHY2tDTlNsaDhSNVlT?=
 =?utf-8?B?U0Z6azM5dWFTZldzdWhkVUNzYm11R2Rld3lWdG1YaWFJNUV0RFVnSVhoRy9t?=
 =?utf-8?B?VXNJQ05NQnhHdjFmYlE3RHdhWEVzT0ZzemdpT0lIbE5aaitFWFk1bEEraUJB?=
 =?utf-8?B?WUV0Wnh1QSttMHVjU245dlBCaUFyRmZWc2VsakR5eVh2N2pUd0pTS0RUWk1k?=
 =?utf-8?B?TnBHbHA1ZytFOFJQVXBUd3JOSDZkYlI0Z01DbURjenh5ckVFSCtpK1c2YkZE?=
 =?utf-8?B?YVdZU1lyM25rZkNGYUtsZVV2bDJvc0lUTk1lRmpYeFl0ZW9RYXpuNmY1VlZ6?=
 =?utf-8?B?Vzg1a0hTV05peDlVYnlsbWVIeVFGQSt1anIvZkk4QVFtUzVhTEhmNXlJbGRk?=
 =?utf-8?B?UzNwRkFsbUVlK1NPZStkZ1pHamtBYVJXeDAybndWd2dEQ2lqS055ZWFLbVZC?=
 =?utf-8?B?Q1FvSDRKTUpwSHl3SFN1aHE3bmZJeUd1QmthYmtmSzVWY3NydzRYZlVGc0Uw?=
 =?utf-8?B?TmlWR25GUjVjV3Z3R2V4WTBWVDlmV2pKRncxRjVRUjZrT3VhbHFCK3cvMmN3?=
 =?utf-8?B?N1p6bzNCVzVscW1iT0ZCUDJ5UDFPM2VGcFF1R3BaalBJajJvYUx5bTNOSlpq?=
 =?utf-8?B?Wk9xalkwb2RHUlJaUitucjhqNDhXSmFSWmp1WExwc3o3UVNlODRSam1xNFFl?=
 =?utf-8?B?MlRaTGg2QXZERm1SREJTOFdSMm5OSHNlMjF6NFdobStuVlJhVy9lWitrWllH?=
 =?utf-8?B?aG9hWW1XOTBZblkzZERIL1JUMG43c3JEaG1JWFJwZnNrUjBJT0pQSTJOTmhz?=
 =?utf-8?B?NFpIaElySCttcjJIUXBpa0Zzbmt4ay84V01KTmhhZTZyNkZaS0dsVHNFQWJL?=
 =?utf-8?B?VEFEeVB4OVRMY3k3VzRVMlNNQ2dsOEJyRVZTbXFHaE9DalpYUWhOZFZMVFAy?=
 =?utf-8?B?Z2hxQzlMa002cXFjVDNrZk12RFJKeTJDWkZEQ0N6b0wzRlZsbUNOaytYSFA5?=
 =?utf-8?B?blpUeS9ZTllWM1gxQ1FFVFVvZnFOblZuSHB0dllBSW50WGdWaDNmWTNQbDNa?=
 =?utf-8?B?dFZSOThDOGZWMGwwaFFKb2o1MGlUaXEwNkR4NWRUVytGZmpIdjdYbURyNXds?=
 =?utf-8?Q?vabUatg9ROVuwu2oJjlhR6EHj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32fe3ee-39b0-4229-7074-08da9c7e05f3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 09:37:10.7873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYzK/OFahpJsAqqHS4SxnEROzLmCER6i2t3n/pxbgMOq89npZAJdNAruMHSD3fXh5otkuDzSWp9b6PY8CbPgPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310

Hi All,

PFA the notes (credit - Samuel) as below.

Kind regards,

Ayan


Problem :- Bugs in HW speculative execution on modern processors. Leak 
info from one guest to another, from hyp to malicious guest. Some 
mitigation taken in Xen, but have performance penalty. There is also 
core scheduling in Xen. We run Xen on VM exit. Xen try to map minimum 
information in page tables. If some point, Xen needs to access sensitive 
info, it switches to new set of page tables which maps all memory. It 
should use aggressive techniques for security.

The approach inspired by the linux kernel.

Paths used from guests are a limited set of what the hypervisor can 
access. Minimal pagetables for guests, with less mitigations needed 
thanks to this (why?).

Bertrand - Introduce Kernel page table isolation (KPTI) is already in Xen

Jurgen - AWS has submitted some patches in Xen in this regard. It 
applies to x86, may applies to Arm. Not sure of the current state of 
series.

Andrei - Does it related to KVM ? They published some set of patches.

Jurgen - Kernel page table isolation is different to Xen.

Andrei - Split the info into globally confidential, not confidential. 
There are some hooks triggered by this transition. KVM patches may be 
adapted by Xen. Don’t know Amazion patches.

Jurgen - Who was driving at Amazon ?

Bertrand - Mapping the whole memory in Xen was a concern at Arm. KVM 
security patches need to be interesting, but attack surface differs 
between Xen and KVM. We should not repeat what is done by KVM

Jurgen - Need to show the mitigation is better than current approach. 
Mappin all the memory might be interesting. But sometimes we don not 
have enough VA space.

Roger - posted a linked from Microsoft research explaining the work had 
been done. “Rethinking isolation in the age of speculation”. With KVM 
and Microsoft’s work, it may be interesting.

Bertrand - Should find a way not to map everything in Xen. No one 
opposes that in Xen community.

Andrei - Check first the ongoing work in Xen community.

Bertrand - Should do the patches with x86 and Arm in mind.

Jurgen - Agreed. We should do for both architectures. Hypervisor 
resources needed for guest should be kept in mind. Per guest mapping 
should help here.

Bertrand - If we know what memory is mapped for each guest, it should help.

Andrei - Is it a Arm feature ?

Bertrand - Most of the data is stored in guest. A guest should not 
starve Xen so other guests are not affected. All the data pertaining to 
a guest should reside in the guest (not in Xen).

Andrei - Permissive mode should help ?

Bertrand - Per guest heap should make security easier. If we have guest 
heap mapped and Xen heap mapped, that should be preliminary work.

Jurgen - For sys call in linux kernel, map little stuff in the beginning 
and map things in page table on demands. It is still is a idea phase, 
don’t know performance impacts. This was discussed in 2018 in Intel summit.

Andrei - We should gather this techniques in a series of patches

Bertrand - If on Arm when mapping on demand, it will generate exception 
and passes control to Xen.

Jurgen - This should be common across all arch. Exception handler should 
be handled in virtual mode.
The idea is to map all the code initially, and this will reduce 
complexity. Need sys call handler spec and page table

Bertrand - You will generate exception , then it can generate Spectre / 
Meltdown issues

Jurgen - Need to consider flushing buffers in and out of exception. 
Mapping buffers will add penalty.

Bertrand - Spectre / Meltdown mitigation made system slower

Jurgen - On x86, a simple solution is to run without cache.

Bertrand - There are some hooks in ATF. The hyp may call the firmware. 
Some CPU have specific info to flush cache. Like turn on off in MMU, and 
it impacts performance. In some CPU, the mitigation is done in hardware. 
In Arm, the mitigation techniques differ from CPU to CPU.
Mitigation (mapping + page exception) will make Xen complex. Like we 
need to flush TLB when going to gu8est.

Jurgen - in x86, when one core enters hyp mode, other core should also 
enter. Need IPIs.

Bertrand - Need to underatdn how mitigation applies to Xen. Our surface 
attack in smaller. I don’t know if the mitigation techniques solve anything

Jurgen - Mitigation is a nice conceptual project, but don’t practical.

Bertrand - This should be research project in a uni. No immediate 
requirement.

Andrei - What happens on KVM ? Does mitigation lead to better performance ?

Bertrand - Security issues are not discussed widely in Arm

Jurgen - Should be able to find a KVM engineer to give us performance data.

Bertrand - Sometime performance impact may be case specific

Jurgen - We do thorough performance measurement. In one patch series, 
our performance engineers have analysed thoroughly

Olivier - We have to continue to investigate in community. We should 
create a epic for this.

Bertrand - Epic 1 - Reduce the system memory mapped in Xen. All agreed 
(Jurgen - the patch series by Amazon is floating). We need to prioritise 
this and do it across Arm and x86

Epic 2 - Per guest resource mapping. Understand performance impact.

This concept applies when core scheduling is applicable. Isolate guest 
on specific code, then some issues may decrease

Jurgen - Core scheduling depends on cache hierarchy. It is configurable 
in theory. Has a performance impact,

Bertrand - On Arm, the impact may be CPU pipeline dependent. There is no 
easy answer. Sometimes some core are not affected.

There is a NUMA series on Arm sent by Wei. Question to Wei - If the core 
(which core on same socket/platform) topology is available on Xen now or 
after NUMA series ?

Wei - On NUMA support, we have a way to determine which core belongs to 
which resource. We cannot distinguish on hyperscalar. Can’t distinguish 
between logical / physical core.

Bertrand - There is only one core with hyperscaliong available (A65). We 
should check this.

Jurgen - Let’s see how the ongoing project gets done. We need to invest 
some work to measure the upsides and downsides. The approach looks 
promising but needs to be tested. It's a very nice project but this 
*might* be a waste of time - and we don't know by advance.

Bertrand - It is quite some work to be done cleanly.


