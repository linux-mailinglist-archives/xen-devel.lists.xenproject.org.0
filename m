Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F1667BF4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 17:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476331.738443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG0op-00014f-FJ; Thu, 12 Jan 2023 16:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476331.738443; Thu, 12 Jan 2023 16:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG0op-00012a-CP; Thu, 12 Jan 2023 16:52:47 +0000
Received: by outflank-mailman (input) for mailman id 476331;
 Thu, 12 Jan 2023 16:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pG0oo-00012U-3y
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 16:52:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2051.outbound.protection.outlook.com [40.107.247.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8856c038-9299-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 17:52:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7341.eurprd04.prod.outlook.com (2603:10a6:800:1a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 16:52:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 16:52:42 +0000
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
X-Inumbo-ID: 8856c038-9299-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGI2V6B29Nomn7kpeBIuZQ6fUCJd5K38tLss5IEkkyzavQm4Nj4bR8S5Im6BnwFxCLIUa/3eJi2R8+5jCb5N6GgiNkHo3WIJPuJ6HbVkY/zfaPxlFK3QW6dU7Vu5pOiLMadwf+Rvg71vnnNTk2M2coUawo76gkudpROwCWtNlWkV45woj4z4uw9pKuET6PynJX5eb61SR0IBWlyksq014MY5kOSoFHkyLVXtxpsAIXp8AWypTV/d/qm0w4BFnlpDqOsMhs3EgUsn2LuL+xGQBJmTrFAhpfkrjArFpODOiGYXK5Q0Uk/aiUJqUNJptfsPmfvvGZzViN92LggFW+5e8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OC2hKCRm5O4+uIq6PdR97qMCPjE2gjFQTP+5K44Pbs=;
 b=XZtIGJjbU+XV5lk8/atUraN69AwGDT+opTz3N5t4hUbL/iPK/oi5P9bdmi7pJtW96W/PvYfgQiFCNfTN1dV8lPeC6q8qKMg77jwcOy1z4qyPQ3X3xLGpK+sG59NknJWed5sS25hAOavH0LwVbImlRtxfR4zWfp9woOV3ham2y1xccLLa/w8Wm7CDM6vvEFYAm0o+aJmzbwRaETZkFh7/hDvJc1sYMh+0m/som90qTwBB2KI1b2rJTI5jb0M0VxFf4FpU1kGbfPlVKWiuSP9ZSbYTfVp5xVujzvCdNULNKYUU/daEDyOQjpggAReAz8MtRrQklxk9JL+1sIrzUm35/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OC2hKCRm5O4+uIq6PdR97qMCPjE2gjFQTP+5K44Pbs=;
 b=TtYxYQ0UEOrfyJce82LpEgcPqNEnLdGUnaobsJj5do5mYkg2z800YuCCAgeN+vN5woMjceI+5MuJyEXqNKFZZYCpr/JEDfZn3hi1FrrO7WRV71ZDM/ke3Y2zs+cEPHpdTKu5NBtSyDWP2JN0yKoCnfY+dVa1nU6LPEWhLZIMXLSkve5krXtrOislr68og8uA7M+TJ80KfjHDnPwBm8jW7VMxZt7Wn7ePLb5bPMq0veqN1IVaCN4oMYhpbjNkQw5tWfQ72J8gJSulXfAuz8r+VDC4CB5XwtR3tVk8LT++X5dI7a6ISxDmGkxF/Pqo5rdITMnf8Ub6TR07cpOtTf7Qzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
Date: Thu, 12 Jan 2023 17:52:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: Proposal for consistent Kconfig usage by the hypervisor build system
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 9201fa6a-66b8-4742-316f-08daf4bd6ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JlAhjOVvsrhesHo9s5tFhvTr0RhRLPPb5lt+GvKUYyE0LEWAtaHVI2E1gEH1way7fbZHmBPrCsMPFrLlUa5iDoalBA6O2hvhx+ZG6cUImi36xWtM775+h8RoTe9FMkf9bTaV5A7QauAuzskQGqhU+Log+Lf3P1r9n6/8KZVfFRRwM4wujhRbiRJYBCdykOs5Fle3U8tvwig5etD048gx4NIOcNB9IllNRdA6dulAOJ7z28aiW0zCQwatVntTTHhKZKSGYl0xFPicAWsd9uMlE3uQkjI8yRh2K+upXFwEVjUAVVZc3aajD7ITmXOB1dtDOLu0ANPgGqd3qnoXDQRm6W1sr5KT9FV1bYIjEB2/0O7RbRWDUh5oT6FfhHZ32NHs1uW6smrnTco9S5SQ4+XfjpzHbDuALwphLZ9aNcGeCAvXG3aVH/Sg+hEa3glUN5ugsV+DRbGTssB69zqYoPUHUdZnYQQrxHDfrhWG683gGiYpqPB+RQos/oOiGiEXxdZHw7m+6VEzRBIlP0VkshexjnohK73hDrgGgpML9Y2Z2uzSVRIMDAAOMN1m/DBGwI+kSpRk/zIQjXsm1LkwALdmLulGi+KbBkEXQUxxE/Zej9caRYudZOXgZMKejM8M0jvoyuNmvFE8ycvzdgz2Dsjpoyn5EejCS3Dun5ck/VcZ8nZbrRXpWdnzJmhzIptBycMQYgs9X3bCQlLoelru7kuTT97opBQhVvlG3G8SKk0zSE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(478600001)(6486002)(41300700001)(38100700002)(54906003)(31696002)(2616005)(316002)(26005)(186003)(66946007)(86362001)(66476007)(36756003)(66899015)(6506007)(6916009)(5660300002)(2906002)(31686004)(66556008)(4326008)(8676002)(6512007)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3V5MklLb091dXlmMitKcTFlRkowUG1Iby9PV25YcHRaNTNvbVdQYWlpd1FX?=
 =?utf-8?B?NGNBUWpKV1E5OW0wNURKOUJvUXY5TUdSWTg1V0JBTE1sOXZ3cVVEV2xLcEs1?=
 =?utf-8?B?bEp3RDBSMERWdlhnRFJpeDJkMXAzeUdycWlPVFlLOGNLbUJZRXJLeitrbGJp?=
 =?utf-8?B?NHVNV3k4VDViQXBmV1g4SEpuT25Cbk9aMjNHWXE0NXRLOURDakFqZ25pMVIx?=
 =?utf-8?B?dlFEdHdjRkh3TGorWWUwUEhKelY0dThsUFJLRmc0UjdSNXo1ZFZIME1RQzF2?=
 =?utf-8?B?aEMyRFRwSEdPcUVTNTlqbFFnODJaZTJqdElJMzA1MWwyQWFWN1NwYkJqS2Na?=
 =?utf-8?B?NDNJYVZkMlV0VUZlaElxeWVOSWpENWd4UlJ0SFBNdG4zN0ZLR0RGVzlraFF4?=
 =?utf-8?B?czNjRk13M2pYaHZxd3dlTEJSWHBCU0VSQzlsT0ppZ3ZVZkVRYUFqeDNWRXN4?=
 =?utf-8?B?M09semIyWTdlYy9Pc2FMWEVuLzNtcUtiRXVGdmdLQ2tZd0cwNEZueHBncXhM?=
 =?utf-8?B?RGxwcFE5QTk0THQ2RmJxRDhFTitrdjhUTHE2cFQ2RFBnT2lDbGYvZ2dCN1Fm?=
 =?utf-8?B?ZjlwVUk1ZlZ2dlB6ZUd4NE1FSmJLT0ZZUTdVcFVOanZhMS9xWEZiS2hBWHVZ?=
 =?utf-8?B?a3RIQkZTWmtoSkphbWZteGJabkdZVlVPelNpTUJUTXpmL1JaYk1oYTJNR1A0?=
 =?utf-8?B?VlZJMU1wNHRlQnNzZ3A4SkNsRzMySVpqMWFzTjZEV2VOc0ZXWkw1cUV1WnNu?=
 =?utf-8?B?VWpsc0RWWnNhTTJaRkVESThHbzBtWGNkZGFjclRoT1FSK3pFNmRBOEczc3dn?=
 =?utf-8?B?Q2orZE82QnNWT255MHhCeDJCNysySkVuRVpoaE5KaEp2TTkvSlRtcHBWZjND?=
 =?utf-8?B?VU5pVHpSTEY4dXNJK2theitobGdyaVBqKys5Qm13YmQ4RG9sNC9nZEpZMXRs?=
 =?utf-8?B?SjRBUDNsYlZ5SGFGRFNIWjU3c2hBa1JyMXlDYkZESFhpY2IvWE1UM2pvcVNL?=
 =?utf-8?B?YnV4eGFXbllHZDlCcmhnaWl6NXpuMCtiWkNPOXQ1MnowVjJkNVZ3bEdhcCtp?=
 =?utf-8?B?MzFGRi9pMWdIVEdGL1hMNW1UemxHWnR0WFhLU3VJdWZnY1g3b1ZLbFZTWmZV?=
 =?utf-8?B?RENDQ0h1bkdVUW9wZGRoOHMvNFJqMHR0a1lXZXFNRlZ3dkpUb3dQWElJZXF2?=
 =?utf-8?B?TzFoR2pEMGJRL214ckZtU2hySWR0di9HejRSY3lRbm5vY0NDc2p5bmc3Q1Vw?=
 =?utf-8?B?djBoRnFQUm5WalRuaUE5a2VoZVFCU2Jycmc2SXE1WFFlNHJaK3hvSkVzUW5C?=
 =?utf-8?B?ejR2aXhNVFVtQWE4Um9qVmpiaDRLZ0VrYVB0ZUxORGJKRUtQT29xamMzdVJi?=
 =?utf-8?B?b081Y3czNWVNL3lnV1Z1TVlmWlV3VTJpZCtOSWRlSFZTRXJJTTZNRjJVd3dv?=
 =?utf-8?B?YXBFVkJralNaQkFqcjJmbXlXRk1PT0tjYXh5VEpzMlV3Y25YUGR0TEdLMm1L?=
 =?utf-8?B?V000aUpwVklzNFVURG9aczFuQmFiUVJhc3AzUDE4N0hKZWlXUExmU2hzNWEw?=
 =?utf-8?B?cVM0b1lBTngvNGN6VnIzVGtaZWYwejdhV1FhcWVySENQb2xBSTVPT2VybTll?=
 =?utf-8?B?T2hFekVqc0NCU3ZmSjBNTEhuSTJOYVdUbkswaVVpRDNjSjRRMks4V0Y0VXlH?=
 =?utf-8?B?UEZXRldxQ0gzd2VKaU9mVGthbUlqK2F0MTJxRkM5dXBTdktrSm1wK3hmekVT?=
 =?utf-8?B?M2pmOVFUd0RqMHNCWnBWL1pMVENHeDBibk5TSloxWlNNWkVzSWpqVmNvdkgw?=
 =?utf-8?B?YkxRUGF5aVc2S3BkbFQxVVJoaTJZemVRTmIvNFJNZDRWMUxqK0lKMU1UK3FQ?=
 =?utf-8?B?Sm4vMnNELzI1cWRuQWJDbVQvaDJ0eXJ2OWtqNXY5aWlYQlRZQy9GMmovc256?=
 =?utf-8?B?T3FLaytyVk03d1cxU3RkbzNEVm81dXhYMGFRbjJDSlp2c25nUkgxT2FJNThN?=
 =?utf-8?B?NlYzV1IvT3J5V0FCY2U0RzFHcFBPbC9vWHorSkh3S3lQMnBOMEF3TUdrNS9J?=
 =?utf-8?B?Q1BzQlhlU3Z1TExnb2QwZnc4dHJFenJ1WGh5MDgzRy9mdzZzQVpUVVErZU5W?=
 =?utf-8?Q?lDKm6rq0zUW3boZf4hicftxho?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9201fa6a-66b8-4742-316f-08daf4bd6ba2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 16:52:41.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgnvxyyty6O414W2mBmEwMtGvnpMKwyg3hgwT2qUGmYuH57gF/Nb8vh1O3MeyIcykZOw9Zx2e+TSuOy3MSLcHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7341

(re-sending with REST on Cc, as requested at the community call)

At present we use a mix of Makefile and Kconfig driven capability checks for
tool chain components involved in the building of the hypervisor.  What approach
is used where is in some part a result of the relatively late introduction of
Kconfig into the build system, but in other places also simply a result of
different taste of different contributors.  Switching to a uniform model,
however, has drawbacks as well:
 - A uniformly Makefile based model is not in line with Linux, where Kconfig is
   actually coming from (at least as far as we're concerned; there may be
   earlier origins).  This model is also being disliked by some community
   members.
 - A uniformly Kconfig based model suffers from a weakness of Kconfig in that
   dependent options are silently turned off when dependencies aren't met.  This
   has the undesirable effect that a carefully crafted .config may be silently
   converted to one with features turned off which were intended to be on.
   While this could be deemed expected behavior when a dependency is also an
   option which was selected by the person configuring the hypervisor, it
   certainly can be surprising when the dependency is an auto-detected tool
   chain capability.  Furthermore there's no automatic re-running of kconfig if
   any part of the tool chain changed.  (Despite knowing of this in principle,
   I've still been hit by this more than once in the past: If one rebuilds a
   tree which wasn't touched for a while, and if some time has already passed
   since the updating to the newer component, one may not immediately make the
   connection.)

Therefore I'd like to propose that we use an intermediate model: Detected tool
chain capabilities (and alike) may only be used to control optimization (i.e.
including their use as dependencies for optimization controls) and to establish
the defaults of options.  They may not be used to control functionality, i.e.
they may in particular not be specified as a dependency of an option controlling
functionality.  This way unless defaults were overridden things will build, and
non-default settings will be honored (albeit potentially resulting in a build
failure).

For example

config AS_VMX
	def_bool $(as-instr,vmcall)

would be okay (as long as we have fallback code to deal with the case of too
old an assembler; raising the baseline there is a separate topic), but instead
of what we have currently

config XEN_SHSTK
	bool "Supervisor Shadow Stacks"
	default HAS_AS_CET_SS

would be the way to go.

It was additionally suggested that, for a better user experience, unmet
dependencies which are known to result in build failures (which at times may be
hard to associate back with the original cause) would be re-checked by Makefile
based logic, leading to an early build failure with a comprehensible error
message.  Personally I'd prefer this to be just warnings (first and foremost to
avoid failing the build just because of a broken or stale check), but I can see
that they might be overlooked when there's a lot of other output.  In any event
we may want to try to figure an approach which would make sufficiently sure that
Makefile and Kconfig checks don't go out of sync.

Jan

