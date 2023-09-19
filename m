Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB57A5F60
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 12:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604556.942003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXrE-0007IQ-Q9; Tue, 19 Sep 2023 10:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604556.942003; Tue, 19 Sep 2023 10:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXrE-0007F4-N1; Tue, 19 Sep 2023 10:21:28 +0000
Received: by outflank-mailman (input) for mailman id 604556;
 Tue, 19 Sep 2023 10:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiXrD-0007Ey-EA
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 10:21:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a137268-56d6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 12:21:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6924.eurprd04.prod.outlook.com (2603:10a6:10:11e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 10:21:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 10:21:23 +0000
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
X-Inumbo-ID: 4a137268-56d6-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/1Fd/zPJQ4Vym9T1vDxDK7fYAPUiH6276Vw0oVDHWC1RhHl01yc+NGGYyk2HZU2Xuun22sOtT0EN2a2SJtX7WLjefB9GigC4nTEJIdvTuI+VZpZU2YCZiehfmNEdIUDbcVQp6siRQAKue2a9aqiPE1Dxn2uJmii3OewcrzoXSxVUqLEgYUQggTtLxK9lHXOoBwuF/mS3tqmsRTnxTiCzK3JJUA5CfgeEr6Xc3tFLd08YSu/d40ZPiirtjdbV/Iuok3ZeaPb2IIVeTzdcTjbY9sXric+kAhzzdkBh5RjPQ1ZPWH7Pe9twAoAyZFr1Jv/9vDhkV3p2NQ7kBoR1/taWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6UXyCi2RJT+VRcnb7H3dma0yvMwWZGtk9iZyz9IYk0=;
 b=JgfK/xN8JqYozfphBKm3VsqXx8DqrGnUmZrFeRwUwaMNKXd1p6s5yHaDFCR/TeKxpfuMMp9wQTO4jRGR8sZ402FW4vz9mMRP6QWhE9wYsdC2fnTaZTF7cmkav0L9Lxi3m4lNk1+nSQMB1yuXVknu3SZBrN/78mRz0AN9UZxrTv6D206KMSaEIaSN0LqgowKMg3zj9a1uSVTDoul8XprAmvrptoRJ3hlH6qMaj31TBOARBzHTvFmosVk54QF1vJsp7+RwYXVr7vBmIYvflkKGoYK30BqwvLHPGStkDhriO7zWjunkPlDt4WTWZ+NlineAM7xzXV3OvcLSwlsV+75LxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6UXyCi2RJT+VRcnb7H3dma0yvMwWZGtk9iZyz9IYk0=;
 b=26A9P3kovB3Cdjh/U/8TtUir7y21y6fvYw0/xfP0H4q/0vzF8IRvpcTQBlDfATDWYlXcSVRAIajlkGQDtWxeK7rz8Ufx1XpVW14EZ6GjRBzFbJQJJPnZxnH7yEBBh6tcTSGVxKHrUwlHFIEEB5oaTVVuJPvMY9XnakG7+q9lYHQ52xbKaKxSHze7Z4PyR3bRX/vWi2T1Qf9MABfgE3dejEBY8BUwzhw2XoLyMLUKzaIjYmJlktAfyi1JjyVAk6D1SYX60Hi7drIx1moPOqDQAlqURd4tY9X9sWr74LNKBmQUpE5FxLv7roLD+ARb1id4N7FKUfKFFGYy5e/iTTKjDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9aa0fad3-4132-8444-fb3f-8e1d542652e6@suse.com>
Date: Tue, 19 Sep 2023 12:21:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging | ea36ac0d
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c88db6-ed66-444b-923d-08dbb8fa2c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	De2VejzcbILuzF7cZBpr466DYb5x+kOjK/3ZlX8Fop60Rrdn3QMsGBBW9vgxBtcwElYViBhCOinSre12ZnZ7+2eS+bG+bfHPBiPgLJk3AZhSoXaB0vGxjSN/qLqRx6Hx2zYlqjkGMhDSrnBl0GRYTIp6J2Z2sb8ZSu9fGMuSB7DlRxV9DP//4lxXhe4CnAXcAY763clQq7B6N7eEsIyOPXOHUuUftgmYwTIxRHQThvr7OJIZh1fmwdqbicsAooM8DA7LNDzXnd5pW2nbA3LZ6zWAfFrUugeZQ+hKPsqyfZEFS2i6K6zucYTCH6mlF7317XJax/eyD2ieuyHv44s9VebpWHVf+f87JZLrV96CFHVbCeKZ4voThh7HViTQhjxxWOj09CyU/0u0GObdNaTI8+fB2iXXMjT8a+sHegC9V1RFHIWfMjrEMLPJbHP0KSC8EqHef2zPoBmBaFRawCdxCSvoPtkJdiKnyNvbNuz97zTgNWIXl6e6GhkLfTmzYkq3A01MlR/ghoAbyaURL8muV+oIjqnWvm0jAvC6d/aT1WLf8hzEgu59dSQrzZpApcvnlk3HIVknXx50wPPMKSWYbBch1GanppO1msvsBSgN45PGnE5zrKLkepwtB2lvPHLu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(6916009)(316002)(66556008)(66476007)(66946007)(478600001)(38100700002)(2906002)(31696002)(966005)(86362001)(8936002)(41300700001)(8676002)(4326008)(5660300002)(83380400001)(2616005)(53546011)(6486002)(6506007)(6512007)(26005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di9JamQyUU5EakY0dTJmNEVUaXhlUDl5REJrYjZmV0ZVTzVsVnZUeSsvR1VX?=
 =?utf-8?B?cU83eGFYUUkvY3FaMjBuTjY4V3g0UDExWlNBcERHSTB3N0VXNW5zTTVJMUUv?=
 =?utf-8?B?aWNpYjY2NFQ1WW13ZXVHTm5pSXlVNUE4V2hSUnplSUdqb2dRL0ZnK3NUS3Fn?=
 =?utf-8?B?M2g4Z3piZ2hxdDBWWmFTRjV1UVk0NDlzMXk1VWM5T3UyZElDMlNUYU9DMGZv?=
 =?utf-8?B?K2NpdG5DSUhPVnZBWG5rd01UL0w5c3ZYQzJOb29rVEI5aHp6Y3g3R0tJQUFI?=
 =?utf-8?B?SGx6VWNKdDUyRElhWWlnajJ6SmJ0c0xXZ1phUHByYnNObldRald2Qk1rLzhq?=
 =?utf-8?B?SHIvTHByOGM3WVJ6TmhNZmE3VE00STBkYUVZYVhEMFp3L2JtSEZjd0xTUHVz?=
 =?utf-8?B?c0Npa0VPdWh1TGgrNXlNMG80ZFFzdEVkM01TUnRPd0t1cmVTUXYrR0U5NU54?=
 =?utf-8?B?OS9QOGFQMjY1NXJzUUloZCtXei9JbUwybC9UbTltNnBBQkFpQ1ZZRVV0N1dM?=
 =?utf-8?B?ZGg5YmVqTzhVMWFlK1doMDNOb2tWLytUVWxQUWhHc0JERUkvK2JtaUdyU25l?=
 =?utf-8?B?dCtEVjFUalBGbmFUL01yUm8vUlpFT0dKMVd5aE1FenEwaGdkM3V1T0lFL3Jw?=
 =?utf-8?B?SzB2U2pLN1VlKzJYTEgvOU9HbXhDekRXM25qM1BlRU4xUmRJazFzY3EzcVhV?=
 =?utf-8?B?RjcwaXdBcnNBTWlMSUwwaitLQTdUak9pd0t5VTJjc1BWZ2tIbW9DeGFJby93?=
 =?utf-8?B?UmE2TUQyRGFoZ0ZBL2QxbmtNM0FWQUV2ZXh5M0JIN1RETW9ncHd1eGZ4NHBV?=
 =?utf-8?B?VjNnMVBNSVVhLysvdVd6MzBmclZEbURMRDI2TXh1YmprK1IyeEU5dXliS2pF?=
 =?utf-8?B?WE93ZC9wU2VsaU10Y0owem9UVERwYmJLVjJhZUlxZUFWaEVmSWpNZmpZVVhi?=
 =?utf-8?B?bVhEY0NXcFg4NzFpMksza3VETE55VlgvcXZFMCtzZ2JYeHhOMUF4cHBRc3JV?=
 =?utf-8?B?b29BWVpUK2xlTFU1SFQ3OTEwREVOUURmVFFrU2JnYjY5M3FHN0sycHZHU3h3?=
 =?utf-8?B?UTNheVlYdnQwK2xCQ0E5V0NiaDN4OXZRS2JoQ01jMDRFZVdFTDdqTnNPMWhx?=
 =?utf-8?B?cE5UL3REMXdXU01rWjY1YlNObEkwZ21YTkNiSUpKTFZJb1Q0bmFqWW9GV0ky?=
 =?utf-8?B?Qytwa0tUZUR0dDNZQmlqclNPZVZ4MW1wSUFNMXdHMDFRUCtwRWFKcGV2K0lP?=
 =?utf-8?B?NFZYaEgyNzBDb1d3THRtTTNySUNaUlZQZFNUZTRGeEI1TE1FbnlkcFlPTXZs?=
 =?utf-8?B?VVNqdGVGa01vOE5kT3R0RnU5dG8xbXFRNjZkb0NSNlhmYms1cng3MlNLaTJj?=
 =?utf-8?B?T04waHdpQldOUWxNM1d2SnpYZjZFaXJXZUU4Um1Xbm4xZkxTdjEyWXRITVo1?=
 =?utf-8?B?eUxjTzBqV3dWQ3I4OVZPdUhTaWQ1S0xzVEJ2Vysrb0VuenltdnJGeWdNc1Ft?=
 =?utf-8?B?bHFnU3lOeDJWVE05M3pyTGgrcitBY1AzU0tacVo0MVVSNjNmQ3dOckZTL250?=
 =?utf-8?B?bzlrMEFSb0xESUNMdnlYYkxkVEVsaXZoU25NMm9sNHo5YXM2Z2h0NG02WElN?=
 =?utf-8?B?TkRkU2tIeVpxRW9wU2E3cnFJc0x5ekxJQWg1M0wwUlNTV2xoVEdSQy85SmE4?=
 =?utf-8?B?Z2U2NVZ3bld0eEZjTUQ4NmRmY2czeWFqM3Q3eUVTR3RsbWJBWG5aczF0MDJL?=
 =?utf-8?B?TDBiTS83VmpvZU40VWxnbkZDMDRsOUg0dWsxNlFpVXVJbFVmcFJGVlBadzI5?=
 =?utf-8?B?Mm1yUjFEZlc5S01LL1Nhdjd5OEoxVHBmNy9udVRYdHd6L0szMU02Yy9kdVlI?=
 =?utf-8?B?ZG5SbnlKV3dBN2gvR2hzZDhXMW9USlBCc2J1SkUyangwVzBpRzVGNlhSM0hi?=
 =?utf-8?B?Wko2cmx2WUtzQm5nSW15MkpEWW91VHU3Q0xwQytoenZSMXVqUXlyKzhRc1Z3?=
 =?utf-8?B?ZE45aVZaaGZncVlVNlFTVVFpN1h2aGJYUGgwb09PN3JwdnJCOFJGK3NtSXRx?=
 =?utf-8?B?SmRobkdvQitTV1Q0N1hENG9hRUlCbmhLOTl2N29vQWI3eEZYb0pST3lqQVpm?=
 =?utf-8?Q?/lQQe30HcrL87gizdZRBSGFYh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c88db6-ed66-444b-923d-08dbb8fa2c70
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:21:23.0986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K80H17aYpQNfhG3yU0uAyzigB9n3Cz8jnk451fUzfOhDGfCHnRqBMKrHD1NBDAoetDc6bNYu+xB2advj5aSMyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6924

On 19.09.2023 11:53, GitLab wrote:
> 
> 
> Pipeline #1009404353 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: ea36ac0d ( https://gitlab.com/xen-project/xen/-/commit/ea36ac0de27c2a7c847a2a52c3e0f97a45864d81 )
> Commit Message: xen/ppc: Enable full Xen build
> 
> Bring ppc's Mak...
> Commit Author: Shawn Anastasio
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1009404353 ( https://gitlab.com/xen-project/xen/-/pipelines/1009404353 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 5 failed jobs.
> 
> Job #5118269375 ( https://gitlab.com/xen-project/xen/-/jobs/5118269375/raw )
> 
> Stage: build
> Name: debian-bullseye-gcc-ppc64le-debug-randconfig

This and ...

> Job #5118269256 ( https://gitlab.com/xen-project/xen/-/jobs/5118269256/raw )
> 
> Stage: analyze
> Name: eclair-x86_64
> Job #5118269373 ( https://gitlab.com/xen-project/xen/-/jobs/5118269373/raw )
> 
> Stage: build
> Name: debian-bullseye-gcc-ppc64le-randconfig

... this imo can't be expected to work. Is it really useful to run randconfig
tests on ports which are only in the process of being brought up?

> Job #5118269370 ( https://gitlab.com/xen-project/xen/-/jobs/5118269370/raw )
> 
> Stage: build
> Name: debian-bullseye-gcc-ppc64le-debug
> Job #5118269369 ( https://gitlab.com/xen-project/xen/-/jobs/5118269369/raw )
> 
> Stage: build
> Name: debian-bullseye-gcc-ppc64le

These two, otoh, look to be a result of the tests pre-seeding xen/.config with
CONFIG_DEBUG settings, followed by making the olddefconfig goal. That, aiui,
isn't picking up xen/arch/*/configs/*_defconfig, which at this point is
mandatory for PPC (and likely is going to be so also for RISC-V once the full
build is enabled there), at least as far as some of the option disables there
go.

I think this wants switching to making the defconfig goal, and substituting
CONFIG_DEBUG in the resulting .config. Due to x86'es and Arm's defconfig-s
all being empty, this ought to be no change in what exactly is being tested
there.

Jan

