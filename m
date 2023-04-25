Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD386EDF7A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 11:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525949.817494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prFCc-0001J7-V0; Tue, 25 Apr 2023 09:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525949.817494; Tue, 25 Apr 2023 09:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prFCc-0001GW-R4; Tue, 25 Apr 2023 09:43:14 +0000
Received: by outflank-mailman (input) for mailman id 525949;
 Tue, 25 Apr 2023 09:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prFCb-0001GE-HZ
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 09:43:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98486422-e34d-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 11:43:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:43:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 09:43:11 +0000
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
X-Inumbo-ID: 98486422-e34d-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6TKfXiTQ6QhEqOIEwe4w4dqK7BnNQh0oN74aylur1gysVWWPtXNonkZOIAjKH3+Bggi67wsUUxcCacfm3Npgr3ocLLIK1Q/QddNDLfp6tyLd4wRYUTF+AL4GjhTLZ93mTZtL03UzelNGYJG4l4/sC47Do1jt+yr2OGN+yRH9hvSdjEB1clAm5HaZV+DgZoBY+GMVBR+EY5hzJMTqfiS2ONqu5KQ1uxaj0bT1w78zhrzBI3urZK7LK+xaj9vR5lr/Q2Hl+Ey3AQESMN4q271F2VReMrjiELN6setpJ90nIgTEVF5SzK3W2IAlzHeme9CFupkhj9+AaA8mYD0YRkm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ysSWlggfX7ar5zc11t8m9pp2LqrWQ4SRh3Kl4aeuI8=;
 b=WsSCKU2f9c3ti0g3iCwudq97SCYVxCf/q+kNwgpP29ifptzgesvKfZ1fVqzWlRN0hPbmqIFH7YWb5f0cMfbnzcwUWghz2tE7lvWD0Cv20iXJD2NzJytE1+JHvN2y/gMQKonU8XJOXZqr9RvvF3UxS7rPw6LZHwG1EruBECv+ThyNrH5PFcTVC0x/5s7gArPVSTzxujoTfLU5EQVJbKHB+6NHnxO4ZjOtF3towQ5QqEAEiYJnVldzChkMpDB4vbVlWO7+QWetR8X62fyPXGPrs51+PbDZ/i3AGgg6VlD4kBbOmQ3v6u82KQ4yKZcaTggbyGgyziOJ2Gx+khlfC/fEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ysSWlggfX7ar5zc11t8m9pp2LqrWQ4SRh3Kl4aeuI8=;
 b=vOFn1YQKQM2AIrk0wsspSfBmYq6lBUhxBuA0G6De0wOJDaJdxhDqiL2T9b2OGDTtr/uhcesEznzaeQiAd33QF5pE5G6QjurOrBrpvO6PGj4aFF/F36mw2zsu+GEtnn6AVr8Rx87dpddGlsfko9/GaK1fYmOXcyLUru9X8QnSFXNHNW5T0fcP+RBzCs4amsfxzbBui+BbtqPOLPoohQFDM4osxItJQ3ruxxPw6QE1JQ/QjHNG6cAMJ28gMT68l+rg05NRbRgTZ7iqLmLTNv1fwKK853R6rvPwQKPW2twBdjUUWaf3KfszFzfCxIbNUsw7c9kiNBXUWFcOYNh//ezeEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <426a6ed3-f0fb-afa5-c685-4f8cdb0d2ff8@suse.com>
Date: Tue, 25 Apr 2023 11:43:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-4-Henry.Wang@arm.com>
 <7d2c221b-745b-109e-af1f-2b78504b2e0e@suse.com>
 <AS8PR08MB799137BF5927B402E7B0069392649@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799137BF5927B402E7B0069392649@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 2767e631-1e04-4058-8790-08db45717b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GkFqLaHC+o7a4w6TiAHLeOPRb5ctNWCmJrnUl01UEz9axasA7dNgrruSdB3hoT2YXQCyGBFmMcNQXUThs6yWsPnQYZQDCHGR/X/QMnPn6doPuC+3MC6UfmqCPbc/8PD8MeZ/ieF/bHwGA1udOQtVqtzwWcQqBvSxbFSFCVjPvuBuAaQ7dgfHEwtvfBFiwb6MdVNUwfA8q6lzvhmWt25MH2gcHgKFbJe9DY42eNHEkhzyhhnIEfmSXvaWQY2+g+tJXbkmBbWug0ki7zTlYXaGxAPlRF/FTc+PgEewMtkv89j3UznyybvxHfpZUJmhNZjgWplZRU4SxUi6UzwvX7aNpHUyZ1/bhO/wKIC7cYYoVs3znkYOpvzbY/2JJzY9uVtfQN4vGhLSkEByNMS5uL1IouLaGfCsoFujXzcupTiBB0mTjP/uvX8P8+Y5ixUlNKFNgj0tuASt6vPI+GcpzP4uRpCquJDaL07CspqSfXH8rdQD0BHSNkjV1nl7D81y4/c3Og4486V24dMDwcc8Jol86Vv5FdfCqdd37IZAoNcuZiiB3L6zYGIOjdgtYL/r+yU0ePPe7wNWfsdQAtVPYNWtygIdH5dxouEppukoBDVRUEwFv6janSXeoICP36fa0wCHDY7wDOrigeX2OCuCWC5PZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(2906002)(6486002)(6512007)(6506007)(2616005)(6666004)(186003)(53546011)(66556008)(66476007)(66946007)(8676002)(8936002)(41300700001)(6916009)(4326008)(316002)(26005)(478600001)(7416002)(5660300002)(54906003)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rkc0MTM3aThadXJjUGp2MGR5cVN4RWY1WXhMR2hlbnJYYTBlUm5rbSt1S0Qx?=
 =?utf-8?B?MmhEa1liMGdQYm13K25VajVBSXFFcG83c0J2V0tJZEllQlUyVGVnQjNuUGZ6?=
 =?utf-8?B?UVJPS05KMFZuZEpJZm04SUpPTHRicDA5NUNtdzAvanNkdExnRGlqTHhocU8z?=
 =?utf-8?B?VGkrMlNyVVNJSjFObWI5MVUvaFZnQ3lobWpKOExydEF2Tm1pdUYvczVQY0JU?=
 =?utf-8?B?aGZYemxmQTF0MG5yeURpczFrbEcxNzdKS2JESlFNSVlHQU9EczFZbDE0dTgv?=
 =?utf-8?B?RytCL1pqVFM2YmhKengreXFidjVBMnJLbkNPeUZXZjRzTEl6VExUSEE1VHRs?=
 =?utf-8?B?bURnTG03WkI1TDhYNTZ5RVlPaXFNZjhSNUkxS1ZrZWNGd2hqQVdXbW5jQWlB?=
 =?utf-8?B?eU9xczl3Z3E0NXJ5SXc3U2YyaVFOOGxiQlM2RUFFeXUvd20xaGxMNk1MZ2cw?=
 =?utf-8?B?ZXo1dGxaMTBVSDlKUU1wZnd4N2dZQkNOZHFwZW8rZjkxTXNQeDUrTW9MR1Bo?=
 =?utf-8?B?TVdCbzFxL0FrL3B2ckFjSU40VnNicXdSemFoUW9rZk1tTXJlc21EckpyOW4w?=
 =?utf-8?B?YWRpdkh1QjdpUkczbXY4b2pVRmhNR1pkK2VESGN5OVBlWEpYeG5QekFDVm45?=
 =?utf-8?B?bEE5R0VGUmVMUjY2N0ZZc2h6cUhQbERrU09lbTNMVkNoZ2ZVTDB2cmN2ZEpx?=
 =?utf-8?B?NExMOUpleWlRODdEdGk0R0ZXZitrV2pBbFBDczlkblZsS0tqdEw0M1VlM3pK?=
 =?utf-8?B?ZGNEeFkvU3ZvcDhXUmpNUklGUWdFNjc3QkJITDQvbTRGbC93bnQrV2pVckNU?=
 =?utf-8?B?T2c2amdMdkdQS2VEcStoL3NyRVdycWpzSUJaS3YxNGhVQWg1cUcxVjZkblpD?=
 =?utf-8?B?YWN3anFoRVo1TzhFak44YTNoeWZIb25adUhFTktIS1N3ZnFRZm8rWDNKdlBT?=
 =?utf-8?B?dGhMbnpqNzVCcjZoQmRweVVCUHJzUG1IODVzbVpNYkVIa0IvdXk0MEFJcmd3?=
 =?utf-8?B?bTQ5a0RhbGhTbUFXMGhNMGRwY3N3ZHNvcGc0SkxNUWJkbkFXS2Fxc0RwUjFQ?=
 =?utf-8?B?UVkvOUdUNEhHNmpRY0c5Y2p0dE1raVljNml2d08rNlJxa3NNWVJmaUpIVnF0?=
 =?utf-8?B?TDZtd3FsbUpPdEZETk9vWWduSXZ4bHcxTjl2YkJNcUtVdllhL1FFYitFSkZ0?=
 =?utf-8?B?MFNWZ3Vjci9SZWQvL2JXMWNLOTlUN1Fyd3AwUXpUazdSOXpvQnlwK3FidmxQ?=
 =?utf-8?B?dTZUeDVuYXREMDIyRGxJd3dacUs4NjlVYUhySiswaWxOSzVVQUdoZStORW1G?=
 =?utf-8?B?cGs3eVVUUW9Kam1PbVJnSHNWL3NMMGRHQWcrZHlFYS91bTJYeTYyemRsM09w?=
 =?utf-8?B?RzJUa0x4SUFVR0w4TW5vSkowRkRhaGlzRjUyY2tuUWQ5akREckx0TlIvZnUv?=
 =?utf-8?B?bU02aU4vVWRYeWl6cHRiNnJmRWxwOU9EM2ZUTGh4R05kcEdlNUtDOUNPVEgx?=
 =?utf-8?B?QnRaU2xMMGVwVjZWbnR4RVYzc2dOQUc3ZnZoMnZuRERLRFNyMGo1WlhOblZP?=
 =?utf-8?B?c2NSbWgvM3JpdXdnMkhZTmc2Ti9qRFZYeVg2Zlhkc3Rhb3Eza09ZK0l4cVY1?=
 =?utf-8?B?QWE1Uk9vOFVNMHNweFhnVFlsUmhsL2NkU2lYeEJiRzJxVU05RFJ5K3NzbVlI?=
 =?utf-8?B?K0F5L21RdUZUVUt0RWo0bFZKQzZUakVQbFdkTVRvemlIVWs1Y1hCOUJFeFEx?=
 =?utf-8?B?NG9MWW5YeHNqNklkcUdUMlE5Qno5bWlrbHJ4SWtsMFEyaDVtQUs0VEtKdk1s?=
 =?utf-8?B?RmNXZ0dBV0VteEFod1dyblhyN2VySzBHSWlCT2JwQ1N5UFRoeGkzS1JFd1NK?=
 =?utf-8?B?akN4RklGMnVUZy9SenVyQXZMaG83a1VsSjZ6bkFRcFNKSHRFYVBnaElmbTJo?=
 =?utf-8?B?MkZXQ1h2NXpoR01ZL2N5YlhycjZNWjJ6ai9yczNlTzhCWHVyT2I1dXc0ZzFJ?=
 =?utf-8?B?ekEvQ05TLy8yRTNiUlhoYTRBR0dFY3puWEk3WnhBTlBrdXNrU2E5a2JlbHZR?=
 =?utf-8?B?ZEZDQVF0UGRMc2x1RExsN2dna3ptS0M5Z2lmRURuT211TnRyOGNGSWlVcklh?=
 =?utf-8?Q?9MOtYhVp/E352Bn6RtvIrysLm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2767e631-1e04-4058-8790-08db45717b85
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 09:43:11.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roTBR/F1wmQsWcASmQ4YbZAsh8xND5XS5eQyvP5aMkkZMlDrk9gIAcOeJI3SFL/ULGzL/g5N91guiIJxZ1VG5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

On 25.04.2023 11:31, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> On 25.04.2023 09:56, Henry Wang wrote:
>>> +    /* NUMA defines NUMA_NO_DISTANCE as unreachable and 0-9 are
>> undefined */
>>> +    if ( distance >= NUMA_NO_DISTANCE || distance <=
>> NUMA_DISTANCE_UDF_MAX ||
>>> +         (from == to && distance != NUMA_LOCAL_DISTANCE) )
>>> +    {
>>> +        printk(KERN_WARNING
>>> +               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8"
>> distance=%"PRIu32"\n",
>>> +               from, to, distance);
>>> +        return;
>>> +    }
>>
>> I appreciate the checking that node-local references are
>> NUMA_LOCAL_DISTANCE,
>> but if they're wrongly passed into here, shouldn't the resulting array still
>> have NUMA_LOCAL_DISTANCE on its diagonal, at least as far as present nodes
>> go?
> 
> Apologies in advance to ask more specific details from you as I am not sure
> if I can correctly understand the "if they're wrongly passed into here" case. Do you
> mean we are always guaranteed that if from == to, the distance will always be
> NUMA_LOCAL_DISTANCE so the (from == to && distance != NUMA_LOCAL_DISTANCE)
> check is redundant and can be removed? Thanks.

It's a little odd that you ask me: It is your code which insists on
NUMA_LOCAL_DISTANCE when from == to. If you insist on your caller to pass
only this one value, then I think it is only logical to also set the
respective table entries to that value (rather than leaving them at
NUMA_NO_DISTANCE).

Jan

