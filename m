Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46C3DFC31
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 09:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163682.299781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBBT9-0006zu-9d; Wed, 04 Aug 2021 07:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163682.299781; Wed, 04 Aug 2021 07:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBBT9-0006y5-5S; Wed, 04 Aug 2021 07:37:39 +0000
Received: by outflank-mailman (input) for mailman id 163682;
 Wed, 04 Aug 2021 07:37:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7SU=M3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBBT8-0006xz-CW
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 07:37:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 058d39c5-c75c-4b6c-bd91-9d3e0d6cca60;
 Wed, 04 Aug 2021 07:37:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-2x21OdqGOhWKEV2FsmfXkg-2; Wed, 04 Aug 2021 09:37:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 07:37:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 07:37:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 07:37:30 +0000
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
X-Inumbo-ID: 058d39c5-c75c-4b6c-bd91-9d3e0d6cca60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628062655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eg2yYcuN9CG5ndvKCgGUYbie0vW/nD19AKOKL5s1sqk=;
	b=V77tpTZaxavdTMg8zz2L20l68rrHiCwhNFt8LUtalp6W5cwjzMbpF6jACGh0lGmXZe5i1v
	l67b3lidJqVjFY38lcqZ5uHYkzOtyl8Wx8a1gty5dMa4xTjBQQPrjyBJ6TunC3AyJMEtzi
	PuIE3zMJY6QYjs3qEPvuQTCS68aWFKM=
X-MC-Unique: 2x21OdqGOhWKEV2FsmfXkg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ym5sJLLjEFPUkzTWRWtDsRx95xEJcXxPi80q2xaMd3X5kJNs/a6ta5u38dABVezXbU2YKBb6ek4oemPK9rkL8+j7QQtnu5FNNgYPilaDnBehesgxkfUba53cKhvPg+1hLl4lh5LDocU0ZOrAv4NkeFBNzAbUqZb8P7OX+WRXJgD48/I2z4KEKG8JQgsURbs5A2tRuMXE/NiGK0kLHc75dwexcQzgDvtJbIdPUtio32Qen1em2lIgJ7w3lK/AeDRekG1JpxxMRHNLqsgQMc3f3aPs2eWL3l3Kh9f854Rmmod9gNMyfJPAAT3UDwI3IYrcjr9SI2J7mjbAmT/3qeFQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg2yYcuN9CG5ndvKCgGUYbie0vW/nD19AKOKL5s1sqk=;
 b=eFq0nuf1AsmsJ96Lk5daf6SRZIl44PiYHb1qX7xv/875hyvkHU5tArnPTYvFOtaEuRRrge7XDH+lKwISvsaVs89N57vRlCpIjMJvl27WT67ELL/39J91LgwHOcbNAm1FJqF98EP/JtEeTPYkQJCU/UofNX1suL8TvnQFrY8g+7MkqVp2fim4tj865q+zRqVeoxZJaVHO8mdOn2N1Pbgp6WyI15199RjJ0ytVGfB9OyxSsahlhLvJaIuqVHAstHOGDCksBLdo9kokyqxq38T9gEWl7gbaLoANJBqjR4HdpHpVsoGFKcZNAsvgIos07NQ4wrLewVVPvZXkEBY1pCkM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Xen: credit2: avoid picking a spurious idle unit when
 caps are used
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <162801221667.955.3439735419862661383.stgit@Wayrath>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8c821f4-8cdf-8d77-90cb-5149a70c7741@suse.com>
Date: Wed, 4 Aug 2021 09:37:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <162801221667.955.3439735419862661383.stgit@Wayrath>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ed711c-a71d-46bf-25c1-08d9571ab784
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390771CDFC8E995B6B75787B3F19@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqss7RqXilRl9P8ITqUNSPQoy1TxqNqpJ9vFKvbifsA0c18fnZ465YQs8u+2WvvqtsMADs/FSsksD0Zit8qAmNO2X3OSVWdAsL7tK06ilGd1aOx6LlrifTyf5C2QR8S41IJpIwjLm0DleLoz/CLQSbh4AA2gx3t8zkezCLhfatVrC5CNd8LKSlANALwGsfzmA6XlnaYOkti8x+iCbMOIFqh4/01jMoY7fnyoDEkwIm5bVjiwiI60InPRglys6Clv509snnN8B7Aa9l3GrdOX99RkOo8GpvSZya3sHsHU8uUcA52lvh2gwOGeYUVgLskBYw9ifDiPd51C+84MIR8Oki+7+EbQ5TQ8Ainug3Wa8JzF7I17J2UZ5ZvYMymQw178DBNxy0G8H8y+vdjVRMVs7pXPjR10ws1SsXCCUBV2Fx9KSoJCjyg24wnoPtMk8PKY1Osa7ir1qoKaK2H2qXdnLmO8YxgUqhLlZQyz1mb+c4aB/TezUPrfM8onjGRYAJKJSOKm0zmxXgOJJIFun3op7xzTakGBpl50XCg7B+u7bkbcCkH4oDO3rjwWbBOspoD4SScjWGuF7pAf0VC0Sfv4mO+cs5YyCnF/fgkT96vnTWSWKgo+x56Pq94KUYq65vN+sLZq/nyF/918Cl3na5znl1B/+MwbmnEoczzJblNroNjGZZpo5NvBz9FPUVY+jrVv7SkPz0oNgCjoiE0boZ8iBZ5RSW/N0SQIB450MBWmNa8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(366004)(39850400004)(376002)(26005)(5660300002)(66476007)(66556008)(66946007)(53546011)(8936002)(8676002)(186003)(956004)(2616005)(36756003)(2906002)(31696002)(6486002)(31686004)(16576012)(37006003)(316002)(38100700002)(478600001)(6862004)(86362001)(4326008)(83380400001)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjNhcVB1OWxPU3cyTmJ4WmJ0L0l6VXZJKzZCMmpRM3dkUDhoaEZNZmh5bERk?=
 =?utf-8?B?N3VmVUZEZi8rMUNhdHJUMFNlUjRWV2V6NmxOMjEreWlkZjlNZjJKVFREQjVG?=
 =?utf-8?B?YUd3dzNSSHN1bVk5QVMzRjlCZGVzZDVmdTA2T0wrdk5hZmpoOE1hSG8vVlhu?=
 =?utf-8?B?c0xQandvTVlnZ3JLSVhrbkhKYWJwbThZMWRyWE1tQ0hLcm8zbkx4TDFMT3Jm?=
 =?utf-8?B?M1plRmZjTEwySWtmVmtYYjc4ckJTdzhlVG5nMGM3eWYrVVBaZ292Q2ZEUUlX?=
 =?utf-8?B?MlJ5MTNieVprbkIrenZ5MlorSit5Y21sNDRXRGZwSCtEVG1lK1JzWkkxaWNp?=
 =?utf-8?B?b1FQSW41MGwycDRNTDVITDE1SDgyelZkdmZZYWFFanVKUktTN0puTlVVS2ty?=
 =?utf-8?B?RlE1TTZORnJjWXM4VG0yQ1NYQnlTVmR0RmsyU1NnajhFL0xTVlltSEU3bWtX?=
 =?utf-8?B?NUZmKytXc2pjS2oxNUd0anpMcW9ONEVHMzBuVk5zRGltTlc0aSt6ZUNNZXFJ?=
 =?utf-8?B?cWpqT1cyTTNJR1ZtWmlNa2gzMEVaTUFzYUpicC9lZlNVT1BUZ2hnWktnbVdw?=
 =?utf-8?B?aGFPcWJqQjNuSms1d3R0Q2ZSV1hEMFpkUzdvQ3dhY1BidmhQeGUwVUxmSmhD?=
 =?utf-8?B?anhXdVZacHo1VzYwdTd6NjIwSjlFRG5jV1VFSkF2RHA3Y3ZITkFlb0l1eTdO?=
 =?utf-8?B?ZTFUY0hMdEkrVmlycUdJWUY4d0pJTjEzd3NNZjZwd2JQQ3BqaUxDdWp1MGFh?=
 =?utf-8?B?MmpLVVdYeXNTeGhCRmo1aS9jcVdualRuNnZtYXFhQ2I2c1d0LzE1OXpaQ3lP?=
 =?utf-8?B?MVVJQ3NLOWZTL3BHR2NEdi85V1o5YldmVFVtbzFkd3dScVVKclM4Z1lDQ1E0?=
 =?utf-8?B?UjNRbjZJWXZZdkMrL1ZacURyc0xpKy95ZXFOWmVJVWdoR3l3SDRaWjdSY2Zh?=
 =?utf-8?B?d2QvWEN5YlA3R21MTkp3NFlZZEk4NlJiQlc0eVQzTldnSDdzV3dzWUE3RmFO?=
 =?utf-8?B?dXNsMHU4SnBQMXdSZlNYcEpGdmdCcTQ4VEU0Lzc0ZjVxbjNlaUFGTGhqR3Bs?=
 =?utf-8?B?V2d3U2tHZlRrTWl4R1Q4b0V4aHl3bXpncXpJU0UvK3R5V0ZLTEQ0NmlKQWdG?=
 =?utf-8?B?Qldsb1hyaWFBb2Zpa1d4NXdoa2FGeVduQm1OQ2VZMGdORU5iT0FqTHlQa3VM?=
 =?utf-8?B?a2Y3QkEvd0I4MzRHbVFDei9DYVYyYXNoVWdsRmRjY3RRaGJLcWkxY09JNFp5?=
 =?utf-8?B?dEFSSUV3bFNKUEV0NzkxeW9uY0ozL0Vxb1AzRmRPamgra0hOSXNLQjJGV0Uw?=
 =?utf-8?B?azJKaFd0dDJQQ28vVVpoa0k1UjNJUUJSc3dESnplWW9nZm8zaVVUbnI0S01F?=
 =?utf-8?B?R0ZjYlQ3LzJiUnE3b3pYdVFaYU1jbHIrSkd0ZlRiT21SWk0xWm9Id0YvbWNM?=
 =?utf-8?B?Tm54bVlUbmhWaCt3ODZ1eFl1MmNDekFNUFhRK05BU2hzSVNJbnp5N01QZmNN?=
 =?utf-8?B?KzVCSVNiYUdJWFV0NllWSVhESzhjUVNKUWFnSnVMRGRXbzAwcXdSOXMrSi9s?=
 =?utf-8?B?VE9SbG12azZWaFFNNnZYT1JTTXJCcERWdmxGanYwSGJXb1Y5NjR6d1ROVnVz?=
 =?utf-8?B?YlJyWXowdG45dzRPUUFaTG9VU0tGMVRmME5UNXZQNUlMdEpNRVR3WExZMmQy?=
 =?utf-8?B?N1Nud29xUmFJdk1ORzhsQjBCK2xzRjhmaDBRWWxFZHJHbEJrWFhxa2d5V1lX?=
 =?utf-8?Q?Em6+gaaKpSXdTgFcuVdzh1/QSEWdpQPO64p7Wfq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ed711c-a71d-46bf-25c1-08d9571ab784
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 07:37:31.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NykDJsVvKCgGbWmK+ItihzLha2SjBGbeV28lTnt/IvFUGZ7+6J67xIJ2nABcMGJiwKQD7tdxd6B+4qKSRcwOJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 03.08.2021 19:36, Dario Faggioli wrote:
> Commit 07b0eb5d0ef0 ("credit2: make sure we pick a runnable unit from the
> runq if there is one") did not fix completely the problem of potentially
> selecting a scheduling unit that will then not be able to run.
> 
> In fact, in case caps are used and the unit we are currently looking
> at, during the runqueue scan, does not have budget to be executed, we
> should continue looking instead than giving up and picking the idle
> unit.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> Suggested-by: George Dunlap <george.dunlap@citrix.com>

Minor remark: Generally I think the order of tags should follow the
timeline: Suggestions (or bug reports) come before patch creation,
which in turns comes before reviewing / acking of a patch.

> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>

Since George is on leave and since I was Cc-ed, I thought I'd make an
attempt at reviewing this. The more that ...

> ---
> This is necessary to completely fix the bug that was described in and
> addressed by 07b0eb5d0ef0 ("credit2: make sure we pick a runnable unit
> from the runq if there is one").
> 
> It should, therefore, be backported and applied to all the branches to
> which that commit has been. About backports, it should be
> straigthforward to do that until 4.13.

... for 4.13.4 it would of course be nice to have it in. Things look
plausible overall, but I've got one question which - despite concerning
code you only move - may play into the underlying issue.

> For 4.12 and earlier, it's trickier, but the fix is still necessary.
> Actually, both 07b0eb5d0ef0 and this patch should be backported to that
> branch!

Depends on what you target with this remark: For downstreams - yes. The
stable upstream branch, otoh, is out of general support, and since this
is not a security fix it is not going to be applied to that tree.

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3463,48 +3463,61 @@ runq_candidate(struct csched2_runqueue_data *rqd,
>                          (unsigned char *)&d);
>          }
>  
> -        /* Skip non runnable units that we (temporarily) have in the runq */
> -        if ( unlikely(!unit_runnable_state(svc->unit)) )
> -            continue;
> -
> -        /* Only consider vcpus that are allowed to run on this processor. */
> -        if ( !cpumask_test_cpu(cpu, svc->unit->cpu_hard_affinity) )
> -            continue;
> -
>          /*
> -         * If an unit is meant to be picked up by another processor, and such
> -         * processor has not scheduled yet, leave it in the runqueue for him.
> +         * If the unit in the runqueue has more credit than current (or than
> +         * idle, if current is not runnable) or if current is yielding, we may
> +         * want to pick it up.
>           */
> -        if ( svc->tickled_cpu != -1 && svc->tickled_cpu != cpu &&
> -             cpumask_test_cpu(svc->tickled_cpu, &rqd->tickled) )
> +        if ( (yield || svc->credit > snext->credit) )

The "credit" field is plain "int", i.e. signed. Idle domain's vCPU-s
don't get INT_MIN credit afaict (there's only one use of INT_MIN
throughout the entire file). Hence I can't see why in principle a
vCPU of an ordinary domain couldn't have equal or less credit than
the CPU's idle vCPU. I therefore wonder whether "yield" shouldn't be
set to true whenever snext != scurr (or - see the top of the
function - is_idle_unit() returns true), to make sure this if()'s
body gets entered in such a case.

As a nit, there's no need for the inner parentheses (anymore).

>          {
> -            SCHED_STAT_CRANK(deferred_to_tickled_cpu);
> -            continue;
> -        }
> +            /* Skip non runnable units that we (temporarily) have in the runq */
> +            if ( unlikely(!unit_runnable_state(svc->unit)) )
> +                continue;
>  
> -        /*
> -         * If this is on a different processor, don't pull it unless
> -         * its credit is at least CSCHED2_MIGRATE_RESIST higher.
> -         */
> -        if ( sched_unit_master(svc->unit) != cpu
> -             && snext->credit + CSCHED2_MIGRATE_RESIST > svc->credit )
> -        {
> -            SCHED_STAT_CRANK(migrate_resisted);
> -            continue;
> -        }
> +            /* Only consider vcpus that are allowed to run on this processor. */
> +            if ( !cpumask_test_cpu(cpu, svc->unit->cpu_hard_affinity) )
> +                continue;
>  
> -        /*
> -         * If the one in the runqueue has more credit than current (or idle,
> -         * if current is not runnable), or if current is yielding, and also
> -         * if the one in runqueue either is not capped, or is capped but has
> -         * some budget, then choose it.
> -         */
> -        if ( (yield || svc->credit > snext->credit) &&
> -             (!has_cap(svc) || unit_grab_budget(svc)) )
> -            snext = svc;
> +            /*
> +             * If an unit is meant to be picked up by another processor, and such

Nit: As you move/re-indent (and hence touch) this, would you mind also
replacing "an" by "a"? I'm less certain about "such" and ...

> +             * processor has not scheduled yet, leave it in the runqueue for him.

... "him", but to me "that" and "it" respectively would seem more
suitable.

> +             */
> +            if ( svc->tickled_cpu != -1 && svc->tickled_cpu != cpu &&
> +                 cpumask_test_cpu(svc->tickled_cpu, &rqd->tickled) )
> +            {
> +                SCHED_STAT_CRANK(deferred_to_tickled_cpu);
> +                continue;
> +            }
>  
> -        /* In any case, if we got this far, break. */
> -        break;
> +            /*
> +             * If this is on a different processor, don't pull it unless
> +             * its credit is at least CSCHED2_MIGRATE_RESIST higher.
> +             */
> +            if ( sched_unit_master(svc->unit) != cpu
> +                 && snext->credit + CSCHED2_MIGRATE_RESIST > svc->credit )

Again, despite the code just getting moved/re-indented, please correct
style here ("&&" to be moved to the end of the earlier line) as you
touch the code.

Otoh I'm having trouble seeing why all of this code movement / re-
indentation is necessary in the first place: If the initial if() was
inverted to

        if ( !yield && svc->credit <= snext->credit )
            continue;

less code churn would result afaict, and then the backports likely also
would become less involved (plus my stylistic remarks might evaporate,
as the affected code may then remain untouched altogether).

Jan


