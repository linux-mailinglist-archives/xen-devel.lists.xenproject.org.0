Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C76D4D39
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 18:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517531.802992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMiT-0004rh-Uh; Mon, 03 Apr 2023 16:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517531.802992; Mon, 03 Apr 2023 16:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMiT-0004pB-RB; Mon, 03 Apr 2023 16:07:33 +0000
Received: by outflank-mailman (input) for mailman id 517531;
 Mon, 03 Apr 2023 16:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjMiS-0004p3-Nb
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 16:07:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe12::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a26a9d1e-d239-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 18:07:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 16:07:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 16:07:28 +0000
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
X-Inumbo-ID: a26a9d1e-d239-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDMt1tSrxjGq3q3pB8tz78oVfOG/z9nxrspygX84sXw0kP/+vogkYAMOgB4AE5cFa7fvJpUuzYVXFfv5lTcEWJBFeqt6g/dCS0h7KH4aYCyzDd37zDOhZNlzmpL9IBdca0b8UVRzaze6JXQiruRIdPpMvW5DI++/ABKsBcQXzpdHo5j4yUAS+borJ+/RxJZyaJXlGoPOg5LEaPLzrei8YqQKgzJJuoN0FfNWqbwnSCwwMv6xZ17/p2g9/jLXc1ZLY17N4Xvt43KTwstcwt8wqE4vNubydeiIvFJ5J4+79rHMlCsgjJ53LfQbFdXKQGLWxHgZHGXOaL+edgETpmHoqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQxMB6GjtobwvO42jbp5xpY3uI30G7RbMn/5g4WZk/M=;
 b=aesZRDui6IDoUJ7dwLG5qhRHh3QfOwzDSUEPxT+aXxKg+FWORlriJzD+9bQMXxDMAbXWG/EAgemI7ApME7ra+3ifxyVTMMa2iJjGysF6wMcVNN375kOjEyx0d5taczYF91hBlvMzTDYSmPz0UdvcN4JAQlS0y+WR9b0jzPHUB9DzjoIrDE5mAvQ8DD43huGlXdqPOKr/F7b1hZ8ZNEqhoMts291JthV1Qdrx8hbCJbz7qli/NLkjnQesx2NTGKUiMC0RwTcf72k/kNB4JCRjCiSPZ4YlF1toMMtPV47Fyrj97M3MemB3QDDE9aZqUKL3wuAvSw1dz+L/RPkEGyCPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQxMB6GjtobwvO42jbp5xpY3uI30G7RbMn/5g4WZk/M=;
 b=Y5xGij3RTmGX/SmzUNk+96YBCSzTwgIIpT/SP01q3zR2KRIZ0X6NjARxIajjJXqXg0BVh05afIyBer7qExokq9CSHBkb0N75wQUNc71qjB8D+yf1e4pjLs6GXXRb50sXcOafXUoElIx7wVPee7y0MdHHKJO+1xricy2vqFQs6X6JKBWKmlLr+XiEWXrgnAjP8VDx2leoNI/nMcdjeBh0kVpU7ipLy3n3klTaFPc17Chk+f9len9I63Sq7xXGnFWPiEsbILFIw7rZK2NQlhwmPMpe/zP7EkVq6LER33q2z9gIzOsXKkg+envZ79c8fcngbZkwUuU9jXzU0OAlVCi+YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a247059e-27a8-0569-93af-de03e842e341@suse.com>
Date: Mon, 3 Apr 2023 18:07:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403101449.93323-1-roger.pau@citrix.com>
 <0adcb388-d2a9-e43e-ec20-de1df51f33d7@suse.com>
 <ZCrzD7tH5WXARIvF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCrzD7tH5WXARIvF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: be3aaf3e-6f7d-4270-f90c-08db345d85b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TCYiWYHnlCcQThEkq+rje5+2+F7335plpJIhPgb32k7WStzTKuRlUzSf2SrpMH8JdadYzMl02iFlIRSFeS4LuIsKJ/l67snqdANQe8CF261cNmaRugEmp2gOWSNHAwGIdrrpzbOKhHb1Vp+Peu2nQh1bN1PzgttIjbisN1o1oNRxIZRcUU5PyvcCpGJiiADHSre5fRG95Wh4HGNFkR+XY6J+9x7LtuzbvC11yq2dGuo3wLN0Jrem+x3BQNi6IHgRLw1uiRaM/Sjl21uvs2dq0704JtldTnMtlxrh1S+gPBtGqEgqWI0+HH7UCtdKrFaskYSHBRwX/tBymkaBPuXIHPsKw8XDZCvtwNq41pfAQtDR0ovgGIEAt+Y+pX3rzB4NDGkoSkZABf9eKfDZx2YRl2ppwLQ8Nf51lLuJeTjwChqUnn1hCxtf63MNf3T+C74ipG01q5ntoYs+pWt3JkDgp7qn8/wJnJYnmjxW82I6pSwdRlFAVo6Tvz3gVX/a6BuoJEjxA51tKmRMG8nWmiyUxMvho5j0F52VZt+JAAOES+qQT6LpNKYdWN6Oaqfa06w2/U/TNCRnlYXQ10pN4MI+5TaCwQDNOklenqAZkekhSbxwxyqkcqjIYkGXZlXmiat98RgwD99q75kKI5ygTNYuAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(186003)(66899021)(53546011)(6512007)(6506007)(26005)(31686004)(54906003)(478600001)(38100700002)(36756003)(66556008)(86362001)(66946007)(66476007)(83380400001)(8676002)(4326008)(6916009)(316002)(31696002)(2906002)(41300700001)(5660300002)(6486002)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStQSE4wWEQySUtacURnUDI5amVPN3dOdkhRbUFSbDkrOFJYLzZWMVAycWVF?=
 =?utf-8?B?Mjgybi9jZFYxd3FtSW1RWTYrZVBucytIcjJoNUJSd2UreXQ4eGRTczVCNHFJ?=
 =?utf-8?B?RHRsSjhMSU9Od1FaSURRQzU0bjJhMlJTN2RVVHpDV3VXcHVvL2NoZjZra3Vm?=
 =?utf-8?B?RzhwVE1QVUM0d2dWZFI5VXdKZXhpMDFFZEZ2ZDBRVUFQWjF3WXJKZlFXSlJh?=
 =?utf-8?B?clc0bERlOUZNTm9vcHNTbW1sUnhCN2RERjBKMUpxNGpUa011blk2aHMvcTJP?=
 =?utf-8?B?bmNKZ3MxbXJnUXNYNlVCdUxkNU53ek5YWTczcGl1cm84WXgyS1dnTHZmRGMz?=
 =?utf-8?B?UEZJaWRadjE1Z0ovMTN4OXVNckpXdEhEM0poWGJJb2k5RUZvTk9aZ1p0cUlH?=
 =?utf-8?B?Z0JaaTBpOEZ4elI4WFhxM0ZmQURpSUYyemNrVmJxTXFlMkxjK3VabU82OGY3?=
 =?utf-8?B?VFZPNnhXeGtnR3oxN2ZHbzhhT0xvQUROVW83Q1ZrYmtaZGpTMzFBYTN0eHNN?=
 =?utf-8?B?RDhSVGtEV2F6MUZNamRxYStTQkhnajlVTDV4Yzk5dStRYTVyTUVxNXI3RXNB?=
 =?utf-8?B?amZDU0k2TWpkQ3haTXo1QnVqUUU4c1VwajFaSnpzMXlqV2xCMEE5anRNYnR3?=
 =?utf-8?B?T1FyU21hUUE5bi9yL3o1L0wvTkliSnducENqT0pEVmpaMnp0a1hHTzhnV0pP?=
 =?utf-8?B?V2ZLMUtadW9QWmpCMko2T0RaUHdtMzdFQnNBRzVuY0M2UlN3R1FzOXZIWWZp?=
 =?utf-8?B?YlhCdGk5RGx0Ni9sZldTMGtsZTU4dmRaem1QSk1iUjRhOVJpWGo5cXkrQ202?=
 =?utf-8?B?VCtxRXpVdVk4eGVuYUFrMmErSHArYVBuRVRTSFBuN2F1VW5XL3BLODI5aDlL?=
 =?utf-8?B?WVJMNVl2em1IbU5Kd0hKUkIzeXpTQXB3aE9YUytOUlpUcTdGbjNUN21PRVJs?=
 =?utf-8?B?WGxOdHFMeCtJZyswSHJHczNTWktWTmRWcnVBUEV2ak9VdFdnTFR0RXRsVFJX?=
 =?utf-8?B?Q1QwanpoNGo1R0Z5MHpXb2RUbkFJemxOUG4vcm00dCsvcSt5aU16VHpvQlFp?=
 =?utf-8?B?YVp2V1hERHdXalJiMk9HNkpISEI0bkFIUHJlUFAxai93RndEK1pCNVczSU1F?=
 =?utf-8?B?bHltMkhxM0doS2dDNTRJRmZYS1BWVmR0TFhMeGR4MkdKUnQ2K1FUdDZscEly?=
 =?utf-8?B?NEhFRm9aS0YwenkzQiswanJtSU9PekRRVFk2QnFydjNUck8vZWFPblpabmpB?=
 =?utf-8?B?bnlhdmxka0VybHM4ZHlBeHFRMnlRWUN5VlZzVWMwSUd6TUFVS2hVRjFyaEhp?=
 =?utf-8?B?TE9aN2JvKzJVdHByLzhod3R0QU9KY2xRK2NpOVFCOHZaOURaQzE3YkphYy9k?=
 =?utf-8?B?a2N0dldDRzh1TTBRaGJOZnVXR0ZxR2xGNVFzNjg2ZVV4dmFWUGxWcXFwY3oy?=
 =?utf-8?B?SXRoSGVqbDlLWVNpOUlFSlA5ZU0xWWdoUEFzZ3Z5d1k4eFMzZm10d0dZeE4v?=
 =?utf-8?B?aTU1MFg4aUQxS0p6VjBJRExJZGlOV3lsN3JWdXBUR29rOER4U0NZR2UxOWsz?=
 =?utf-8?B?azRLYnZHMXJqMGtGUGxsekRVbkhERXJucDM2WkNYSytXd296cGd5MHlDK3NL?=
 =?utf-8?B?Q2xTV3l6WnhneW1BVTFXWmRvTVY3Qnp6MmgxTWRPNkplT0NTZEZQMnlnZmNi?=
 =?utf-8?B?VCtPMTFkMGQ1RXBDV1EzdEJSU3JLeVNmNmNPSFN5ZmhmdXVKRGZOZThOclhw?=
 =?utf-8?B?ZHY4aTREQW8yVjcvME9lRkljeGRXdkhqbVF1WGFBY1hNcVMySkRUQTVGdm1x?=
 =?utf-8?B?ek1vcUZVYW10OFkrQXdOUEQxRFM5RnFFcTZaaG9jNy84ZC9wRklGM1Vqci9l?=
 =?utf-8?B?Yjc1aDA0YVN2Vm1xYXI1bnZkTmhkS0lwaUh3dENmMDF4dVVOMjdRRm0xc2pi?=
 =?utf-8?B?aEhpcEt2amdYbnJST2xpakhVM0luRjNDUDhndnB4QnprTzA3MVgwN1JXNnhI?=
 =?utf-8?B?OVRtOTExSlZEdlEwTHVYM1hVdlFVRVV4TjNNWFZwSmJtZ1dMQ3pSSHdHUldy?=
 =?utf-8?B?dUt6M3JucjArQU02ME90SVdHS0JBS0ZJa0pJOWRMOURwb0R6UzNrVHI3ZVps?=
 =?utf-8?Q?55aEb34WbUe3Q4F7B99O3ePt/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3aaf3e-6f7d-4270-f90c-08db345d85b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 16:07:28.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+MRNcqNC+Qvg3LpF4nKwOIfuzA2PPrvVKQ45l8ougXdhIek+Ca8Hffuw6pn0unRZWHg4XCLNogPbdJ8W+zXYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057

On 03.04.2023 17:38, Roger Pau Monné wrote:
> On Mon, Apr 03, 2023 at 05:32:39PM +0200, Jan Beulich wrote:
>> On 03.04.2023 12:14, Roger Pau Monne wrote:
>>> Global p2m type recalculations (as triggered by logdirty) can create
>>> so much contention on the p2m lock that simple guest operations like
>>> VCPUOP_set_singleshot_timer on guests with a high amount of vCPUs (32)
>>> will cease to work in a timely manner, up to the point that Linux
>>> kernel versions that sill use the VCPU_SSHOTTMR_future flag with the
>>> singleshot timer will cease to work:
>>>
>>> [   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
>>> [   82.793075] CE: Reprogramming failure. Giving up
>>> [   82.779470] CE: Reprogramming failure. Giving up
>>> [   82.821864] CE: xen increased min_delta_ns to 506250 nsec
>>> [   82.821864] CE: xen increased min_delta_ns to 759375 nsec
>>> [   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
>>> [   82.821864] CE: Reprogramming failure. Giving up
>>> [   82.856256] CE: Reprogramming failure. Giving up
>>> [   84.566279] CE: Reprogramming failure. Giving up
>>> [   84.649493] Freezing user space processes ...
>>> [  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
>>> [  130.604032] Task dump for CPU 14:
>>> [  130.604032] swapper/14      R  running task        0     0      1 0x00000000
>>> [  130.604032] Call Trace:
>>> [  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
>>> [  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
>>> [  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
>>> [  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
>>> [  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
>>> [  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
>>> [  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
>>> [  549.655463] Task dump for CPU 26:
>>> [  549.655463] swapper/26      R  running task        0     0      1 0x00000000
>>> [  549.655463] Call Trace:
>>> [  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
>>> [  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
>>> [  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
>>> [  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
>>> [  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
>>> [  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
>>> [  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
>>> [  821.888596] Task dump for CPU 26:
>>> [  821.888622] swapper/26      R  running task        0     0      1 0x00000000
>>> [  821.888677] Call Trace:
>>> [  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
>>> [  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
>>> [  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
>>> [  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
>>> [  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
>>> [  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
>>>
>>> This is obviously undesirable.  One way to bodge the issue would be to
>>> ignore VCPU_SSHOTTMR_future, but that's a deliberate breakage of the
>>> hypercall ABI.
>>>
>>> Instead lower the contention in the lock by doing the recalculation
>>> with the lock in read mode.  This is safe because only the flags/type
>>> are changed, there's no PTE mfn change in the AMD recalculation logic.
>>> The Intel (EPT) case is likely more complicated, as superpage
>>> splitting for diverging EMT values must be done with the p2m lock in
>>> taken in write mode.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> I'm unsure whether such modification is fully safe:  I think changing
>>> the flags/type should be fine: the PTE write is performed using
>>> safwrite_p2m_entry() which must be atomic (as the guest is still
>>> running and accessing the page tables).  I'm slightly worried about
>>> all PTE readers not using atomic accesses to do so (ie: pointer
>>> returned by p2m_find_entry() should be read atomicallly), and code
>>> assuming that a gfn type cannot change while holding the p2m lock in
>>> read mode.
>>
>> Coming back to this: Yes, I think reads (at least the ones in do_recalc()
>> which can now be done in parallel) will need to be tightened if this is a
>> road we want to follow.
> 
> There are likely a lot of reads under the p2m read lock outside of
> do_recalc() that will ideally need to be switched to use atomic
> accesses also?

Possibly, perhaps even likely. I specifically said "at least". But ones
clearly on write-locked paths could probably be left alone.

> I'm open to suggestions to other ways to get this sorted.  And that's
> a guest with 'just' 32 vCPUs, as we go up the contention on the p2m
> lock during recalcs/misconfigs is going to increase massively.

I'm afraid I don't have any really good idea, but I'm wondering whether
trylock with (almost?) immediate exit back to guest might make this any
better. At least the guest could then take interrupts before the insn
is retried. Another thought in this direction would be to have a variant
of trylock which "senses" how contended the lock is, to spin if it's the
first one to wait, but exit (fail) otherwise.

Jan

