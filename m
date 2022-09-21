Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5B5BFC3E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 12:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409722.652743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oawrd-0001kS-Ep; Wed, 21 Sep 2022 10:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409722.652743; Wed, 21 Sep 2022 10:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oawrd-0001hH-B7; Wed, 21 Sep 2022 10:21:57 +0000
Received: by outflank-mailman (input) for mailman id 409722;
 Wed, 21 Sep 2022 10:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulJw=ZY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oawrb-0001hB-R2
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 10:21:56 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 356e6599-3997-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 12:21:53 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4516.namprd12.prod.outlook.com (2603:10b6:5:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 10:21:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 10:21:46 +0000
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
X-Inumbo-ID: 356e6599-3997-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhMoL98Wlb3u4B+MzpyxFyyOA03XACEPALc2jDearKI/1J1+9SphB8hVu3M84rqEi6MtIkivxUoeLVUdWGvjsP7I5tne7KjqDcMtz/9eqcSRxaRQOGaz1agdk0OZ7Rmo8aq9achxwCiBGLGUYNCQneekQfD9dnlPljgqpEmnM+X9u7WPWE/ao3xULY73WrdlZcRmWhbWBxINLeW+N+VRh0z179d+ZoQ3S3CVCIJWkknRbmq7r9adV3CjE6rVvy3ZkGnse55csSiZZivwrE1S6Mzg/S1D1wAzgiFaDVWcXsbOh9LtVYNs0inUC9BA7fRXLUT5Q2v5B4dXi3SFzOplXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCO3MdedIa3voLgQuiam0115avqtVdrQxWE5J/jD1QQ=;
 b=mptJHypJHm28EP9qwIBAPbUVc0mehW7VMHmXtEBYEuhTpGAOWfZFHiecx5aG6a2MI4ymcLgJ853qTmmMJujbFUUOhD2p9fo+E5Tp70mKNGVgaumkks7GQXFt8NnOEG5hBue6KjaYZOhYE3IBqAo0lZ9gsZYQDheHJoXOTXyNRQkzpSMIK+S3lfZNtxNVEO2gdlXGXb4cXr/65wIg58Q0SNx78bKnDpLWjgC0NrUUt89pDfxrNcuswSDCGkpapa35kESy+IuYaEt9hKBKgEtlrQcX5Xq2y4T2Ufy8LtvJXLzqgd0Lf3Uu8Q+jV+4B4fN3FOj8qkmMrpNwZDOeDRl1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCO3MdedIa3voLgQuiam0115avqtVdrQxWE5J/jD1QQ=;
 b=hZatmS8DGWjuR6oPlFssYR1ZXWqibD7uKfXExzUoJn3AV7j0W4+JmipNih3oYfXsijNMwSimwyDg1kF1O6tL+KfrSczmSHoiebpqyjhHEdqJ3m5vXsN1izYNj8uLGjVpCwGpaBdB7nRxx4UCg3Avozghd3sh7NCGJxz2oZCkHN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8b200579-8118-25b5-3e36-87ce3f9f9891@amd.com>
Date: Wed, 21 Sep 2022 11:21:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Design session, "Progressing of pending patch series"
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::34) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: 0027c084-e209-46d8-8f31-08da9bbb1611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RinYpBfj8/ja53vRhjJ9E3FGLkIcZtWSwp6iP2qwkKYVJllyk78yO3P8zsaRMOrpbyuMUCV6X7bNzjS3t4+Un4Ka+uvRKTkyGxz9FcQ5PJC0amIQCd0ZfE3Mr3t272pqzz+PHMyAcVoIwJgkgfhm4iB1pU1bKqpa5uSoPYkFiUxeJoXDeKhBsmaBdXOiW0NjrOIboZmZK67eiMzgpUDa9rLhQpwPCEhOfV1914eIdXJFRwG4fs6yHgQ88FlIQtVuvmJtuQpB489a41BbEPnwpHZUkySXkOmEUBQFPjNG1zwN76PMmw1tOhMbKc8bsLzn7XssYhr+cZBORUZYrbRhkLCdN9kHEXXXKkxqDaKmfI7LkH8OwgMGZIrppnenpwO2/mX05iZoBFORI7ydrI+hntBqjHVkzbo6vLZ1NPc+zHFoRVIqUQ37KgXG34o9tU3xeuylog5JXS6yB89IrUYewsPXC6z8c2jRUhhhE/tRJXfLoExQ09fskhl+rZn7c/GVEyTVO4JlgZcemujgJUMXW5UexyCEfjiMgu+J/ujgqPUcJGGVxUc6w7oJWmUMPImp058YaBKrmneYDChXT2LWCi53Sm+xhbw6N/eT2/kqxLiBAmysu+onVIPZPgZRZHnK5RYG26gmr0B8FYVdpzve/KHa+qtSR38wRNafL8XvGOr0xA9n0otfHeiTCPXsDRT0j6kKNV1kfj3id/Cm8nA/Bth1W9eb0JUEahZggsCh3aPSKWSzWxVqVrKgvmFNl3fEgtprMXL13Z7A/YqO3K3MRtrxJq+3xlTGyQEgvxPoz8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199015)(31686004)(478600001)(6666004)(31696002)(66946007)(66556008)(66476007)(6916009)(8676002)(83380400001)(38100700002)(36756003)(2906002)(6506007)(26005)(66899012)(5660300002)(6512007)(41300700001)(316002)(8936002)(2616005)(6486002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnUxbzBxK29UMFRzVEhucXZNV2hyeW1nWmJoVG52N1JYTVJZd0duVVZ5V25N?=
 =?utf-8?B?RDM4WmRLMkhKR1J3L3RWMGx5dFQvdGdCUUN5OVNEbEJPdGlaemUzL2tHNXJH?=
 =?utf-8?B?Mm5Rb3FmV3d4K1IvSDVlVjFYNDN4MEdtTlRFYlIrVVQ5d3FaYk5tNFdMeGt3?=
 =?utf-8?B?MTBEUVFMejJuRlNIeXZJcjRONDg4STRDL3pyc3hEdHJtaXlVcHYxMWhseTcx?=
 =?utf-8?B?akdJNFVNNFBOdklUUjRuT2cxb3ZpcU0ySDhOYzhmOGhwQnl5ZnZsOFBjODk5?=
 =?utf-8?B?T0ZCUUhBZjF6M0x6MEo4NWptbDRuU0c3NGxMWWppUTZ1MjRIaHpoRUpPb002?=
 =?utf-8?B?Y3hZK1JpVXJLOG4vN21xK003b0hUd1owdlMyK21MVTFZTzd2U3V5OS9SbDRh?=
 =?utf-8?B?NVJJSVNMcFJ5REQ4dWU2dWJNRjMzazBBNGF2bS93K0dSUzNncjVhWEZFNWNE?=
 =?utf-8?B?a0xwVFMrWjFuR2VJRkxUR0xReGRPUEorSGdxcVNEczdiWGFBSEp1WnBFWWla?=
 =?utf-8?B?MHVzMjBiNkIxRzVOMEZpY0FqYXY5MUlMVFhnd1A1RG92NVpqUllhK3NRYnJO?=
 =?utf-8?B?NXVaM0I3VjUzRnRhOWxMa1dVSFNIbE1haWNBOGFBY0FJN2xiUUptdXNSM3lY?=
 =?utf-8?B?UzdUdHNncFovK0pUT01kZGtnTXBJVUtTNWxFVDFEQ2FZMG9ER2hYRytVVkk5?=
 =?utf-8?B?bnZZTytPMTQ5WVMxTndNVHdBM0FCaGw5eTRIK2JhdGhHT1Z4UEthaHg5YXFj?=
 =?utf-8?B?dEhNcVhWKzZUSkNEMDRPTVNqb3ZUL2VUWVBpcWNrK3dlMzRHTUI0NFpCUkZT?=
 =?utf-8?B?UXdZTjJCcnBtSlFaa0JHL214dm1XZmw1aFhZWUhuODlCRWRYZWR1OGY3ZThI?=
 =?utf-8?B?UEloSFBwSkpTZ3RkR0pWbjdkWEdHa3BETXdSd2FDQ1o3UG9PM1BkekhaKzVT?=
 =?utf-8?B?ZmZQWmZzdkRxR3pNaFNzNTN5dVVZQjdrRklaRDhVUkRGeWU3V3VrajcxZmw4?=
 =?utf-8?B?bHJQSzRsd0wzK0szL1hJMTd2SXF2WFFDQ3N5VWxCSnpLT29pODM2QlErUXM3?=
 =?utf-8?B?U1BUT1ZPYXZLc1ZqTXk0OGRFM3hDL0pxdFNJSGthbVF1VHNMdUlaVmJzYVl3?=
 =?utf-8?B?TjI0V2hjclRZUUkzWjVNQnp4QjVFRTFHR3MrK1FtQjJ0ZDlpL05VQTRSd2d4?=
 =?utf-8?B?SEdlYzh4M3BsQm9TVXYwRXJZNmcxeFVPWEkyQnRnUlNoZ0tocnd2WDFpZzls?=
 =?utf-8?B?QmtOalBWeFFuRXBHek9iQUJJVWRmOTZqc2Z3U29nTjlHYWMvMjdSaElES2NP?=
 =?utf-8?B?V0l1QlMrbUFiYjA1Ym11QTdjYTYrNkl5bDlJc2FockVKRFBqdmhUbjA4STk2?=
 =?utf-8?B?azJmSjRFYWhzeFlBdVdyaUV1V0pOUXdrbCtxZkdBWktrcTZPTE1LTkpibUp4?=
 =?utf-8?B?VWZlY0wxdVBjMzFvWjdFZ1ZkMWVQS1IvaGUxdjg4cjRXWjFLT0RVTVIrVkVL?=
 =?utf-8?B?ZXdJOFVDRCtsd3FkUkVIMGhZSHpkMmkwOTNUWnBML0tZcW1SblN1NnN1S1dL?=
 =?utf-8?B?amNLQVJxc3dYaVF4TlB3d01sNG1nK1J1dkRUcXg3SFhTa1pCQ1FSd295V2U2?=
 =?utf-8?B?R1VTM0FtTTBPeW5OOHYwUngvUEw0Mi96Y2djZ3UrT2FKTWJHMU9QSWxkVG8v?=
 =?utf-8?B?YTFYSnU2N2pFRGlnWjRTMGhkMUFHVlBXWHlLeHBoSUdaYjFZeDVJaXl4dGxN?=
 =?utf-8?B?aHpkbXIvZ1kxNkZyRW5ZTCtodXJhNkkrZW1QdU9BT0tETkRrOWlJbWZsNEpi?=
 =?utf-8?B?ZWttbjJHQzNmeVpuZEhNTXRWb2tNOVhxMitZdmlaWG13UDJsM1Bjdk9MQVdo?=
 =?utf-8?B?NmJ5THZXN0ttU0dZdmE3YVAvRXIyN1N2anhiRDY0azAvSC9IVXlmSHE1R256?=
 =?utf-8?B?T3N4clNSdkFQWHNCRVJrRGx3a3ZBMlJXWVZLalEyQTEzOGNiWmpkQXdhRC9U?=
 =?utf-8?B?WUtFazBLRGYrcGxsMTg0L0pHcHM4M0pjcWRlcDFTWEZnZjIyYnhXRFdHWVVt?=
 =?utf-8?B?TUlhQ1FLU0locDkzZThadDFpMGIrS09hVFJrNkJkVkNvL0xjM2xPL1RXeXZH?=
 =?utf-8?Q?yid5eTF07NoCRNK4MSqiDPvr5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0027c084-e209-46d8-8f31-08da9bbb1611
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:21:45.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jEyBcEjtsnVRYDAZ8wl5fuFhW7NkymfWrvixqgFF52PLM+xccDN8DLHWcLuO3w30gXyYempkp9UJHnMoH0MEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4516

Hi All,

Please find the meeting notes as follows. Please feel free to correct 
anything.

Problem - Patches are not looked in reasonable time. This is an 
unsatisfactory situation for contributors especially if it involves 
effort for creating patches. This is not a new problem. New experts and 
bandwidth will not appear suddenly.

We want to collect thoughts about potential changes to the review 
process. Can we have a possible solution where some patches can be kept 
pending for months / years before it is eligible for review and  
committing ?


Bertrand - Situation improved in last few days, The maintainers can edit 
the commit message before committing instead of pushing back. It reduces 
the probability of further series. Now there is too much activity 
available on the mailing list.

Should we clean up the patches on the mailing list to distinguish 
between the patches to be reviewed vs not to be reviewed ?

George - Sometimes, there is not very actionable feedback or too little 
feedback. Lot of people are bypassing Andrew (unsure if the name is 
correct) for review. There are not enough reviewers. Sometime people 
unrelevant to the patch series are cc-ed. So the pipeline of a reviewer 
increases. How to encourage new people to review ?

Diego - What is the bottleneck from Andrew’s perspective

George - Andrew has taken time to review past patch series. Sometime 
security bugs are discovered quite late. Sometimes, reviewers are super 
busy , so they don’t review. We can have meetings with maintainers where 
people enjoy talking about review rather than writing. Then the reviewer 
can explain the bug.
Roger has been stepping up as reviewer to offload Andrew.

Bertrand - Eg In PCI passthrough, Roger was not available so everything 
was postponed. How to reduce bottlenecks? Can less experienced people 
review , but risks introducing bugs. Accept that some feature might go 
in with potential bugs (Feature marked unsupported), So end user can 
understand risk. Later the unsupported features can be marked supported 
when it is reviewed or tested.

Jan - Some person can review without being an explicit maintainer.

Bertrand - Some PCI passthrough issues are related to x86 . So we are 
blocked by the x86 review.  It is a case that Arm’s PCI passthrough 
feature cannot be upstreamed.

George - Can there be a mentorship program , where new reviewers will be 
paired with maintainers. And improve the review timelines.

Jan - Common code should be improved in all scenarios. What is in tree 
already should not deteriote. Some of the Arm's PCI passthrough changes 
introduces locking problem. Thus, we need to solve locking problem 
before Arm’s changes are introduced.

Bertrand - In an unsupported, you have a first version. If too much 
dependency is added in the first instance, then nothing progress.

Jurgen - Can we add experimental features with timeout. If no correction 
done on an experimental feature, then the feature can be removed

Roger - Who is going to do cleanup

Bertrand - All the new code is bounded by configuration. Xen code is 
modular. Easier to find what to remove.

George - Refactoring other parts of code will make it difficult

Jan - Some parts can still be scattered around. Can’t guard everything.

Bertrand - If 99% percent of code is modular, then probability of bugs 
is reduced.

Anthony - Makefile changes took lot of time.

Bertrand - Differentiate between critical / non critical patches so we 
can make faster progress.

Jan - When I rebase my tree, it took a day to solve problems introduced 
Makefile changes. Do not blindly merge.
Anthony had to take time to make out of tree work.

George - If we wait until a series is perfected, then there is a lower 
chance of bugs but lots of work/time. If we put things faster, then bugs 
may be introduced and breaks. Need to find a sweet mid spot.

Jurgen - Working on the central boot process is hitting everyone. 
Working on specific feature, only affects a limited set. Makefile 
changes (by Anthony) affect everybody.
On PCI issues, the locking issues need to be fixed first. If the locking 
is broken, then lot of side effects are introduced.

Bertrand - Spent lot of time discussion. We have an internal git branch 
with lots of downstream patches. Now we are upstreaming the initial 
features. Then x86 request came. No body looked at downstream gitlab repo.

Roger/Jan - No time to look at private gitlab repos.

Bertrand - How do we then fix things iteratively? Shouldn’t require 
fixing everything in the first instance.

Jan - Regarding checkin new features. There might be limitations , but 
bugs should not be checked in knowingly. FIXME should be used to fix 
severe bugs. Locking problem is a severe bug to be fixed before. No one 
had enough incentive to fix it. Unfortunate that Arm got affected.
EPAM is trying to fix the locking issues. Agree with Bertrand that 
things moved slowly. Should not be bad bugs involved.

Someone - How do we guys deal with scope creep ? When the scope of the 
initial work increases significantly

George - The work of refactoring of existing patch seems a lot of work 
(sometime Arm guys don’t have x86 hardware/knowledge). Who is going to 
do this ?

Jan - Ideally PCI should have been done with only Arm in mind.

George - All issue related to review bottleneck. If I need to review 
something, ping me on irc. Sometime, things slip. If there was system 
to  assign a ticket to person for review (on gitlab). Other projects 
have this philosophy

Jan - People shopuld be picking work, so they can do their best.

George - If the code is common with 6 mantainers, then sometimes I take 
time and review. In the meantime someone else reviewes.

Jan - Double review is good. Different issues can be seen by different 
person.

Bertrand - After one reviewers reviews the patch, should we send v2 or 
wait for another reviewer to see v1. Can’t see the status of review on a 
patch.

Jurgen - When I send a series for common code, Jan reviews , then I am 
confident that no one else will review.
Sometimes, Jan takes few days.

Jan - No problems with a v2 but it address all the open questions on v1.

George - Have mentoring problem for reviewers. Maintainers can mentor 
reviewer. Have a quiz to ask who will pick up the review.

Jurgen - Should I mention that I will do the review so that others will 
know.

George - Know what I need to review from the mailing list. Then I will 
look it.

Jurgen - Sometimes I review things which are related to linux. For other 
parts which I am not confident, I leave it to review.

George - People learn by reviewing code. If they have a mentor, then 
reviewers can do.

Jurgen - Reviewers may have a priority list for review.

Bertrand - Huge history in the mailing list. A rule that if my patch is 
more than 2 months old, resend it

George - Have a system which will track who is reviewing with what

Jan - In my experience, pings do not work at all. If I don’t have 
initial feedback why to send v2.

George - If a comment on v1 does not get addressed in 6 months, then 
what happens.
You can check with maintainers to give feedback in due course of time. 
Send a mail, review check it in two months and do it. Sometime series 
get blocked on a single maintainer. Should not be that someone becomes a 
bootleneck. We should offload things from people who are busy.

Jan - People should not be shy of looking at patches where maintainers 
have already commented. Objections should expire if they are not 
followed with concrete suggestion. So, other people can review and if 
others agree (without maintainers) , then commit it.

Bertrand - New reviewers take time to have confidence for review.

Jan - If I get review from new people, there is some level of mistrust 
if the patch series is intrusive. If the patch series is easy, then I 
can trust review from new people. If new people review frequently, then 
trust increases in due course of time. Also reviewers need to ask 
questions or spot problems on the patch. No blind review.

Kind regards,

Ayan


