Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D07609B19
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 09:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428751.679219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omrgz-0008On-Es; Mon, 24 Oct 2022 07:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428751.679219; Mon, 24 Oct 2022 07:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omrgz-0008MV-Bw; Mon, 24 Oct 2022 07:16:13 +0000
Received: by outflank-mailman (input) for mailman id 428751;
 Mon, 24 Oct 2022 07:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdD1=2Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1omrgx-0008MP-Qu
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 07:16:11 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7af580d-536b-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 09:16:04 +0200 (CEST)
Received: from DS7PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:3bb::22)
 by DS7PR12MB5911.namprd12.prod.outlook.com (2603:10b6:8:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 24 Oct
 2022 07:15:59 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::74) by DS7PR03CA0077.outlook.office365.com
 (2603:10b6:5:3bb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Mon, 24 Oct 2022 07:15:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:15:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 02:15:57 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 24 Oct 2022 02:15:42 -0500
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
X-Inumbo-ID: b7af580d-536b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUq3C/8/yiKxQy3eoRbLRCZ4q0em8fZ2hpVrGkiHDtXwLlrXpAJgGUlKFdX6GATAbuOYAfJoyQhDhR1KTzFdVywGOVr64wBixolSbbUrt1+j1QoPCWl1xYq6tEHqxWdbq+3c1qIQ6N52DxfENP0mnhUJuglax8adyZbhSwPzlKaHbG+NuG79dLSaIrBsPo5/L4Y5x1jQt5qkqyYpjjb9pnPXT+BCe3gRmCbQ0TdXFaI1/9tsfuJXRrObT1bynBCJcvYulQrkKXUCVmflJzl1kX14t/dkaXE3/8tVq+LsVDweYh0YPcHLrr4CaPulVHhygq4/wDvqB91+5fdJFmrSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgHiBQ/44sNd/SB4hB3n+crBYmw51aO1I6Gz5eztZ9M=;
 b=CCGiBQsPsWboWb32r9/EbSQA13q79JSMr2TmLqtg+dF7DdiDpmfjBv2jILZfyJYJTSVmij74M+9B3HNw88pBrMqi4KQqJT0yIpG/Gfa2TKVZ2BrC3sKMceIGhs3L9H9IDp60oItPXPHdw8Og+tQY3UJp2lEb0BapYmY0mmGGjPoY5z5DqpcoS7WaZQaYfbgAjV0ZP9LjxnTmgLIMy72bAd/HPIyDCbcCKplRSrzcVFjQcYGas19APjAalDQxvp9alLFSX1xoFdxAiL+wR1BFI9PuQpBzBMrk8x7C5U8xNr2iYp5QNstRfoWNeAZRXNr/gzop7vrorV928SfNZCvfFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgHiBQ/44sNd/SB4hB3n+crBYmw51aO1I6Gz5eztZ9M=;
 b=viehAIf7F3cN2GYpnWQwB6xPwc+VMI4NJUEUYukKEeR46SM9ppfdo5b61lw2vAFADi8NUAvHhZWxoblmhy20XpPRtUeYcuzoHvGPfnBQoQO4MvXehv7BFN6mhSwW2HMSqTixpnuRuWaCJSvE99062xbbsbqz3NZDHYxwJ4RmoO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <76b7f236-f99d-7600-3958-6a92943b564c@amd.com>
Date: Mon, 24 Oct 2022 09:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [for-4.17] automation: Do not use null scheduler for boot
 cpupools test
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
References: <20221021165341.7905-1-michal.orzel@amd.com>
 <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
 <alpine.DEB.2.22.394.2210211211090.3873@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2210211211090.3873@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT061:EE_|DS7PR12MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d34c4b-d0ef-4105-f36d-08dab58f99bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	joHy93JEuUE7OiORb2Qj6ZjRXQfrYXnqwHx9mlCi54O6KO0IKz11EVXhCKdlGW2Iv9xtyeU2l36U90Ivfn7ObzqKXgWkT01Hx+DS7nqeayUUrSiNOa8b2d/cpNr2zrICWOWT7hX9oHBVfn2WD24aFrz0P7pxwOOQrlCoKsK8IgdA6sTL4e7gCwlRXjupBY53s8Iiu4zo/h6V68314B5G0kKbIwVzdI2DSu4/gbXaGzYHlSgI7DRwygvKzJdFUL4blIJLOHZ+FRYsqGICUjFI0axUhb6V8jVCOq+C/TZela3/d79iEIpPYn254oUxVZzxB8ri5KqYGHYlpyYSLpleR/0FaLMefp4ySZEJzH2bKQkXzOaBXOUEA3tULvuhVCARINV7NudHxS7zv0wyR157zSQEMkVGs4k4AawhIHrMrmrro69HkKFTkXXgQMUJh+sLpfEzMx2qfeibLsdzrxWLW8uCL26ZK7PHwV4Swz+q0YyAUbcrJmOw8I5TNRI9ikdtw04GuAcLEwfYMb2M7M5p2JWORf6mE+q4MBHjD0vUDpB58LoqHjucg+hZz83Z7XNy/uj6fFUlM+BqNuEQ2X0pxkBcr/JH4EGNB+lqF7lmIm6VOP7IB8T/ZGKZQKIQmhN03FEFY5tJCePvHigr5I7aquZe4hSUlEhlmHCBU2yrtJvblf4iKY2SRxQNY5jaBfSNSliv7emLd18EdfkTPOPnl6j3+zGS67Y3ncDdBIrAhXCfdajiCm6+UQ8k4W8n/FSsgJLtVh9ZsIXob96uHebnoA/Cq72QT3EfadGAivqE1cRjN9UJWPWIYsXRdEnvjTC1uv2FVLU3tC1ncqg92EXviA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(31696002)(81166007)(40460700003)(356005)(83380400001)(47076005)(8936002)(336012)(44832011)(5660300002)(82740400003)(8676002)(186003)(110136005)(86362001)(16576012)(82310400005)(4326008)(53546011)(54906003)(70206006)(316002)(40480700001)(70586007)(2906002)(41300700001)(26005)(2616005)(426003)(36756003)(478600001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:15:58.9813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d34c4b-d0ef-4105-f36d-08dab58f99bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5911

Replying to all,

On 21/10/2022 21:36, Stefano Stabellini wrote:
> 
> 
> On Fri, 21 Oct 2022, Andrew Cooper wrote:
>> On 21/10/2022 17:53, Michal Orzel wrote:
>>> Null scheduler is not enabled on non-debug Xen builds so the current
>>> test can lead to a failure on such jobs. We still want to test that we
>>> can assign the cpupool to a domU with a different scheduler than default
>>> one (credit2). Switch to credit as it is enabled by default.
>>>
>>> Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time cpupools on arm64")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> /sigh - I'm sure I nacked that stupidity to begin with.  apparently not...
>>
>> It is totally bogus for CONFIG_DEBUG to influence logical chunks of
>> functionality like this.  The CI script is good in its current form.
>>
>> RTDS and ARINC should be default n.
>>
>> NULL is more tricky.  PV_SHIM is explicitly security supported, and has
>> been for years, so the "UNSUPPORTED" is bogus, whatever the default is.
>>
>> As NULL is explicitly tested in CI, it's clearly supported, and probably
>> ought to be on default.
>>
>>
>> Please instead fix Kconfig to not be broken.  That will be a far better
>> fix overall for people.
>>
>> As a more general note, tests which are using non-default pieces of
>> logic ought to activate them explicitly.
> 
> 
> I agree with you, but first let me clarify the word "supported".
> 
> 
> In Xen Project "supported" implies extra efforts to follow the security
> process and of course the security team should be on board with it. If
> we say "supported, non security supported" we don't need to follow the
> security process but still we sign up for backporting fixes to the
> stable tree. It is less extra effort but still some extra effort is
> involved.
> 
> So, this specific issue aside, I think that as we expand the testing
> capabilities of gitlab-ci, we'll have tests for things that are not
> necessarily neither "supported" nor "supported, non security supported".
> 
> 
> For the NULL scheduler, it is clearly important to many users so it
> would be valuable to move it to "supported, non security supported" and
> enabling it by default in the build. I don't recall if we still have any
> known outstanding issues with it. I think we need a separate email
> thread for that discussion and I would understand if the decision is not
> to change NULL support status for the 4.17 release (maybe for the 4.18
> release?).
> 
> 
> In any case, we don't need CONFIG_DEBUG to enable CONFIG_UNSUPPORTED. It
> is just that UNSUPPORTED and NULL don't get enabled by default in the
> non-DEBUG build. So to fix gitlab-ci, we can simply enable
> CONFIG_UNSUPPORTED explicitly for the builds where we need it
> (alpine-3.12-gcc-arm64-boot-cpupools).

Given that there are still diverging opinions \wrt making use of DEBUG
to influence enabling/disabling some functionalities in the code, I would
opt for modifying the CI job to explicitly specify the required config options,
just like I did for static-mem test. The necessary options to enable NULL are:
CONFIG_EXPERT=y
CONFIG_UNSUPPORTED=y
CONFIG_SCHED_NULL=y

This will fix the issue and allow us to continue with 4.17 release.
Given the outstanding issues reported by Julien, it would be challenging to
try to mark the NULL scheduler as supported, not security supported for this release.

Besides that, I think that Andrew still has a valid point. We seem to use DEBUG
only in Kconfig.debug (obvious choice) and sched/Kconfig. So this is not something
common to rely on DEBUG to enable logical functionalities (why did we make this exception for schedulers?).
Having said that, I think the discussion on whether to switch to default n
instead of default DEBUG or not is still valid and requires more people to give feedback.

~Michal



