Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA37A5F08
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 12:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604541.941980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXcH-0001zA-3W; Tue, 19 Sep 2023 10:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604541.941980; Tue, 19 Sep 2023 10:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXcH-0001xT-03; Tue, 19 Sep 2023 10:06:01 +0000
Received: by outflank-mailman (input) for mailman id 604541;
 Tue, 19 Sep 2023 10:05:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiXcF-0001xG-2F
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 10:05:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2047.outbound.protection.outlook.com [40.107.13.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f6b9e74-56d4-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 12:05:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 10:05:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 10:05:26 +0000
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
X-Inumbo-ID: 1f6b9e74-56d4-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5PCqxu/ck/v9Q+NsOvp5VnreS7/vx2csr+n+nO0HKpEh5fvVqJbLatctQJfSa13V0ZZmddv+663iZqlMl8XLwMTbcNUDWo/BGTrHlmlJ0gfJhqCXB8uc8GLCDVzcCRrlMt4kRVcIeYHwXaolhT0WshAHKFjbCnbXSsd5iTQxzPTft2d/9L4vZ+sCU0NEGzPRSZISVkNr5eq4aSo9W4kv9+NXYb42LVAfpvhsJvMnVNZtKmL4kxQL+pk1HGavldaR6KUIhjmRqQ4aVVW960FtrcWYBfX1D2htCOKCrYOSwXhDg/0f0o/ac0elKsb+bTLMezlaErijcEmLnOoFG7Vdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JEVKF6+X594PKHlj11lZsB6Nspq8bL6d0PDZTiWEqc=;
 b=jakOPGoy2caBe8VRSsOMEw9M3K9w/Z2reW9flwUB67VKciPBuprhusAJlyxRt8YLMYdnUiPUWJk3LH3kNawa6/itwJM6KaSh+LX2R2cPikc01UtAtcLlKIT0veM7DUQh6g1d4RNobRHqDzmGxdj5GWL3vVvc2z17gRorjMKFmXULGkLGc7EOtQhEJguXH3OPJS4ri3Xuz7iT2CDJmIUz9a2nDzzdPbGYSpuSkWRAFAc7TUnAXULHBYQTv0MSs5blV0YOp50EHRYF2PDe5Cue8uRiheQX3yFbDtyY4fj8oDk/TR6TgTB+GT8yjHJqvXXKa4P6PCb/mH/vXYkYp89l6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JEVKF6+X594PKHlj11lZsB6Nspq8bL6d0PDZTiWEqc=;
 b=YPkgGqiVQJhB0Ozz67MTa7zZZJtZIQ9u/eFbLuUFvl6dbd6wDkKfGxt0JrE6KvyqQRowS31NuGXbxurnGEHbmOxYS2sgOjRqBZCgRFcv+VXU6EaiXIwsKLiGdjy04svKFbJfRA6YSefMv6xuOxWoVL+aOjcnCjMKX7PpZFdljOj3ETXcZyr9ZVxTz+VbUkBHX+Iq3/0VT5MhDFHK++rPVVMZmVSGEKbXUrcJMviqjCFoLJ31+gYnANeOA3jmGWNrjIN9/e6jMZY4FY4ragH1Cn7GV6M4LVvhVHGojcM8pM4OEIGYQ/DAv3CRyguGatP42Sjfw8sjJhwGCQuv/zGTWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5a252a7-47b0-3ee2-3157-0b18e5f0b079@suse.com>
Date: Tue, 19 Sep 2023 12:05:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging | ea36ac0d
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
References: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3731bd-fccf-4eb3-719a-08dbb8f7f214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hrBRpvmoehH3myCmCK4oKFG7TCHpikRjoO476k4z+ZvLfIwiXNnNEiv2cfLj0FAMtx6c9E3oUeJnFW9V0Gmvnk5W0IvqX9Z8O3GDtD5U9QbMOLdSTvDDXstBXFeEJfjx0I/Vv/G51mDwj70GPyTlbqEasggufvZfGhmJZqhZ75RiqKNywuPG2C3c9XG23sb4miq9GxlNXldlk61oGLYlZG7eYo+csUU03BIWNhuDly0rgS31WSbZaeZE5IH5oFd9yAqZl3MhhkLE1vHLZyaTA8FKdJnhs5NJDdq0q/bl/BGo+gz+z3DsAdWh7UggrtIRaJaOTdSkUjkcBCf1mWALOhmvrT9yoXFAU/H12et4kbT/f9WgEEnqwirJmi+c1MPPc75eJNHTAYzV862IVo/QNUoPq54CS8POJkRdxtGje2n8K6aspxuj0n7nQyKZwrNT5HE9QzQ9mKcJ0NLie2BGjMhY9tBGDFBn7UDWvfdBNRh498t6v8A57xySyNPHMHPP/Hmj1JV7wRZtoOXyM0XaGG6Hiap5Cyh2AqjUZBeRjuG3YrRUfpjTfJLEr+ZgxEvPBl28TZVxhOEiF0Ef/X6jJGYaPiwlepuf0u6QKb6wrd5Dpab2Bgt/pTXRztyG8+havaBXd9fcWAHV7OEv+Uwe+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(346002)(396003)(1800799009)(186009)(451199024)(83380400001)(6512007)(53546011)(6486002)(6506007)(36756003)(41300700001)(2906002)(31696002)(66556008)(66476007)(6916009)(4744005)(5660300002)(66946007)(4326008)(8676002)(8936002)(38100700002)(966005)(478600001)(86362001)(316002)(26005)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0s2QldUem5lMU1qeXZLbTcyZkZtdHRLQjZ1SVNVY3BnVEVJTTFtUVNVNlps?=
 =?utf-8?B?L3dscWMzYWsyZGsrTTRKUmFrbzRnb3huaGl6SUs1NmNkV1BkaExPWEc4UmE4?=
 =?utf-8?B?ZUFFRC9zcUlheHc4WFdwcHR3cVdzTzRKUDY1djRPa3hBV3J3NTBCVm9aa1ZE?=
 =?utf-8?B?enFTTU0zT25nU21uaW92V2dTYWU4L1lWOXRuWkcvdWJRbityclFQMGJYMzdz?=
 =?utf-8?B?T0Q4Uy8wck1lSDE0K2RxdGo3cXNaTEk4TGVUek1LZ0NXQ1VidzBhRjBpdDNj?=
 =?utf-8?B?Qk9QeXE1Slkyd2NNanRXRmxGRkZrTVRwdWt5NzFFajBJQUp1K3RrUWxzcEd5?=
 =?utf-8?B?dTZHQ2pZL3RDTE4vUHVrMVlLOHU5M20vOUhpSVhYc3BZT0JxbHc5U01KSDY4?=
 =?utf-8?B?OTRjRmxQd2k5SWloU1VlRjN0M0RrYmdvK0F2SC9Bby8yYVFNcWJyZG5aS0pZ?=
 =?utf-8?B?MVJEVUZBTWNPaWVJdHc0a3R6LytXYi9BYWtnT2ZOUC9CZkRYclNOS2JMM244?=
 =?utf-8?B?Y2gzQUVjR1BvVUxsSEN6Vjh1Sk5uOG13V2tQaWtod0s3cnRNQk9kQUd1aExl?=
 =?utf-8?B?SHNTTjRDdk9UbFBlTXQzSVVONEw1QTNuU1NjNnA4akplR0lCUEprUVdyems3?=
 =?utf-8?B?UmRpVDV1NWh5R2VtbkN4anI0THEvRFV3UFk0MHNyeGV0ZWM1R2c4QmFSM3Zk?=
 =?utf-8?B?THZxREdoM1V4ZkduVkRKeE1FaHEwRlkrK3U3M3ZxdEUrRDdQU3g1MGNVSHMv?=
 =?utf-8?B?N1hWRGJmSDVoL1JLbFMyWGdvdjNGU0dBeFhnUzJRRjdhaFA5OG9OUzNsNk1B?=
 =?utf-8?B?V01FZno4ODNjbFpPMWZqSVlBczJCNlpOYWJFcG9GM1NTOVg2S1VJYTNORzlF?=
 =?utf-8?B?Q3NKMUVqeDFxZk9NVURySWZLcnBseGJESmpub3B0a0F3eC90WUlHYmlMc1hR?=
 =?utf-8?B?UU1mM0ppSkRnYU1qNkRMSm9HMUF6akNFa1hlSCs1WklENjVqemJoaytYRjZp?=
 =?utf-8?B?YXhHOXVrNXVqYy85aVZZODhXUTlYYUZxK1U1aWt3MWhZU3V6OGtjcWRoY1di?=
 =?utf-8?B?TU5nKzdFejQ1OFVjbVRSd1VWTmNoU0syYXdHK0p2ajZyUHB3aTB2cWVSeU92?=
 =?utf-8?B?c0Z4ZW9ZQVVoODRHeFhiUzFpSkNpV3FuWlExVC9EajMwVWhTMkNlb3FHTGRn?=
 =?utf-8?B?VE1XUTJCZ2FvQTVvTGFVWk1LeWUrTnBMZlVqUDk0RFBEV2pNbmFIb3BDTWNP?=
 =?utf-8?B?QkZGaDlnWlg2K2hJK1I0ZHQ2YmZsV2RkUk8yMnpXMmtheC9PME50NmhyM1Jv?=
 =?utf-8?B?eU45M2czQ0t5aDF1VE1UYWtkbC91c2NVOUEyc3BPQnc0aTZKOHJUZ2pYZHNv?=
 =?utf-8?B?bHlWLzFiaHdIL0dQSGhLcDJqdFl2N2dSd0kxQmNucDVnNGNLbFZPWlpZQ1Az?=
 =?utf-8?B?RW5IQzZzbGYvTWw4SFp2MWg1YTdqSHpSY1doTStOTm5HblpQajY3dzE1blpY?=
 =?utf-8?B?M005NVdUTDZCU3pSN21tcFVFTGRhQWdtK3FBdWxjUnE4Y243MzJHK0tkdjJs?=
 =?utf-8?B?T1o5Zm0xT0hEVzZOZDFGRW9TRUhScXo0UEh5VDduUFpYVkpUbUt3Y0FGd01L?=
 =?utf-8?B?d2MwRmlmNGJtVXQrSFNuNk1XVEd2azBGQ3I3bnhpNm9KdXZTaFN1SFZYc2Yy?=
 =?utf-8?B?b3ZXRzNnaEpyYzJ6cmNqS1NEYmlRV1JhQTFJak1hZTVTTWpDMTV2ZlVHY21K?=
 =?utf-8?B?MHlRbWNKcXdzZzNOa2lsSUlqbXMrZWE0bGhkK2ZOTXE3bHpCM1JzVzUwV00y?=
 =?utf-8?B?OUZRRHNoTTNiVTYrZEhWNEVhRVdibTlzWms5YnA5M0ZwZ2loQUxZb0tUMmhs?=
 =?utf-8?B?Z1VjQzE4MnliM1dIaVgyR2REQi9rc2wyYmc4dWsydUMrdjR2a3c3SWZWL1o4?=
 =?utf-8?B?WStBbE9aMThnRXgvcG1mNktiazFWTXFXUHYvTGdEa3F2QVhGL0VZUXQ0cTk2?=
 =?utf-8?B?dDRRdWVndjRXYjFUS25tMWczSVlhYU0wMmx1QVRqU2hucmhSeVRuT2FuNHpt?=
 =?utf-8?B?bVpaVVFkRmtCSEk1UFhyS2c4ZGJwYmVGNk1CcjBhZFBROEc0ekJycUZWVDR6?=
 =?utf-8?Q?2L2HJ0JkfgNb+6tMGpwjxK0Oz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3731bd-fccf-4eb3-719a-08dbb8f7f214
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:05:26.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xugEmksxAW+WALrzwPHz7ymZlZ9pzDm8qbK+oQ5GC53hC5dp5uxmlkZY+tq67KlH+jvAMuHmvRMnMWkI5v9ScQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

On 19.09.2023 11:53, GitLab wrote:
> Job #5118269256 ( https://gitlab.com/xen-project/xen/-/jobs/5118269256/raw )
> 
> Stage: analyze
> Name: eclair-x86_64

Quoting from the log:

...
Success: No unexpected reports.
...
ENOENT: no such file or directory, mkdir '/var/local/eclair/xen-project.ecdf/xen-project/xen/ECLAIR_normal/staging/X86_64/5118269256'
...

If that's the sole reason for the failure, then it doesn't look to be code
related.

Jan

