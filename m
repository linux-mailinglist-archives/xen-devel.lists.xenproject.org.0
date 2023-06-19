Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837873561B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 13:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551040.860333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDLt-0002oD-DY; Mon, 19 Jun 2023 11:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551040.860333; Mon, 19 Jun 2023 11:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDLt-0002lv-98; Mon, 19 Jun 2023 11:47:21 +0000
Received: by outflank-mailman (input) for mailman id 551040;
 Mon, 19 Jun 2023 11:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBDLr-0002lp-R4
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 11:47:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6fcf5b-0e97-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 13:47:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9360.eurprd04.prod.outlook.com (2603:10a6:20b:4da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 11:47:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 11:47:15 +0000
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
X-Inumbo-ID: 0a6fcf5b-0e97-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8tonfcrtq/u1VKd28I/9LExJsvqWmnB7phIKSWGKP/s3olnwIUnrACprpqopx60mMCR7tO7zq40m0mnutD4p9cSJ15iBQc8E+hmDwXxyf8IXFhtq+FziF1tJrJtQA8IuuB8rPogTvJ0UejDEeCBNGBJKwrFu3kR3jKQcYC6tMLDqtiLDfP2T1/fsfkqhuIyvu6GDlK4MnULZ+oPtlyHBio6fGUCG0/nrCHNMrdeCd682YhMvghO+Tlxey4aJVrXzxm/nVPisKK075mWw47y/GGlJnS5XED4qU9Vj9r0iOuo5GKyQJS2l+1A4cd7y3dVZMFgdV9jewbzTFKYM3jqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2fofnB+rICKpanQR6oRLBZEmRSm48bomD9i5pl6gEs=;
 b=K1II05NmtFyLyNi8hXQd2Sb7Ap3kBUdQ0lQ3796IfH0QFe0U1GDJg50ntJEFDpNdWzmbhrnZKicdekMGdNa0N9WCNjo0i67Y/VerMKADHL5F8KF1nG2KnXP/DL3/mlescW4dI+WtVEJHL4LoC/MONUsWIIgRpfr+90CeqqN9Qpk8wCoURCKSqYMfkRY2rUmdfngc7tFERVwOF2kmqP0q1IGHcYfNQXZNlizJtlbdd0EGpFjUrY9r9J0ilqWf1qobmE2ItvtQpycVUtwcFL1bsD8nPrBydIrruYoZg2jAeujojrRGAJFjiSNfL7caTp4eer4vA9E3sYs/0rr2UGVSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2fofnB+rICKpanQR6oRLBZEmRSm48bomD9i5pl6gEs=;
 b=ix5Clg3esEcoxlefRx6ViYFDNYygr6rwayxac139Vo7kHUNCJitnPkdCqNvsNdtd8rBchKhTU0kAbWaIXsR2dxPCnRv3EMb3jWmdAbBm0zOP5agMTRQmQF3Q6WyomPN9EFWUCnh89Gmky19AUxkeln3+k6pe1AL6w8sPSAUgkUzqJ5q+GYx/0fOgVt8Fr44fulWePmUckH2PQLcp09mjqniPm9njH67nhnPv7AVCI6cpSuDPfC0n/P89TQQyaGzJX6rIha2551AuPOasMa7AlIRP1ZTAgXu8+04GBQQw+JNhvn+5LwqyyVlN1SYlYYmjjNclyIKcZauLixg/I+MQXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <978fc5da-bad3-c028-d95c-652ed1bcb3f4@suse.com>
Date: Mon, 19 Jun 2023 13:47:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
 <3499c107-ea0d-3a74-4278-86879a9d80e7@bugseng.com>
 <90eec636-7ae5-8e1b-1561-0de62e0bc799@suse.com>
 <5b166e61-1f28-ecb2-7b14-9972cf12aac7@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5b166e61-1f28-ecb2-7b14-9972cf12aac7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee0cb57-652a-4093-a218-08db70baed29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q50BYueFJxlSGEKrZwmeor8iD5B9XxRdt6QyoC+J2DHTkxbm+YGrY93TZ98pNr2KPLWmCDAn7/EG8rwa1XLNLsinwd83UylOA9jVuEKi1AVl/Ym5xjW2d2Gw8jw9RW0R4gRcNZds4eE46cNpPz6dLRRJhcQqAflbv/JqETDjIDR9zH1xZWr+3Pm5pPQRocg2j41EoC7wqR8fqkgtgXG+sYJUyGRkZFyt56U0uwxVboZIDr+3a7ra2AwVmBp5MIIJO8erQJ/rt6abmox/f8gRvkxZnI7SC+NJHvlvZv/Gm32f1OUuFmtlWFxjs3lv+XZUa17btHKMA0bxOPc0R70qKp71qmhond9tx75LKHJXefgU9OXuwcDWzNw2VKMOUMoVGjAxXUmL+Fr3OENbA3vaod//A58EUo9tZ1cjYn6JrrYPT+H3EVdEZxlEdGbrDGvzWKpbygNTE5IzeKONp0jK4OgPm1xeo5x2IdUb96eKffKxXSM0fqu8I/1g3XGj7pXmznUT4fNsIywAB/plHx30Ak9GeecL0l7aor2u1iOQ9R4JQAcur8TReMU8etZ7vX4BpA8ujorG/1S3oyXgREpPfd/BnajpvgIZYWqlnpca8TT7xlfW136IikVuh9ULmLnZQREHM5UE4DZguO3R7JmKIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(2616005)(86362001)(83380400001)(2906002)(31696002)(31686004)(5660300002)(4326008)(54906003)(66946007)(66556008)(186003)(8676002)(8936002)(66476007)(26005)(478600001)(38100700002)(36756003)(41300700001)(6916009)(6506007)(53546011)(6512007)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHZyYlVoVEkzQlQ4WllyNEJoVnVRM1lZdC9JSVQ5cTEzRTU2RkdNRmVCK3NK?=
 =?utf-8?B?MWplUm8rd2JuOWJjYmUwZjBtTWkrSUZUY2JadjZBak1MaVFucWRTRGhlT1ZG?=
 =?utf-8?B?N1B2NWV5RXQ5K2RZMTF1VU5hSUR3WU1uTVNSRmhHSmhGakJncU04QlZkTmZw?=
 =?utf-8?B?TEM0a2hoZXhEaGJzd0p0RmtkVmNSM1d4dXhvNlBxVnd5dGozWEZQN0plclJO?=
 =?utf-8?B?eEtWTDBFQStURUJvYVh4bEZpalpwRkl3N2RPc0RJbnJLUGVBVllGOVVSQmN6?=
 =?utf-8?B?cG00Z0hJcER0d3hQSDVmUk5ycWFrWkRiaXhnM1g2c1FwTWxUaFA3eTdJQTFq?=
 =?utf-8?B?eC9ncXdFWi9CZGdPZFRFRXhEaWcyeHpRS3pscnQrTlNBNlRYNFFLS1dZRUg2?=
 =?utf-8?B?TTFxMTB6cjRLS2U1R1ZXZ3F1bnREdHYrNUxoNjJBRVJVNDE4U3l3em5RQmNm?=
 =?utf-8?B?VzdLOUhiNTRjeWlxQlRrandjS1MzbnNJWkVPUmxGMmZreGc4bXZSZHlNU2p4?=
 =?utf-8?B?eDQwZ25XVm9jZk1TYWN2Wmc5QkR4aDJZWHhZWmt2VXJmNEJkcXhHeHpnUEF2?=
 =?utf-8?B?cEZCd0R0NndJbTlSRy9Ub0tJZ0RpSGtCeU5sN1Z6OUFadUUreHpNUitPVlcx?=
 =?utf-8?B?NXdXZ1BEOUoveXg2cFU2Y3h5YzRRN1JZdHd2dWJYc2gyVHI3NVB1NUtRS1gw?=
 =?utf-8?B?U1dSYkN3UHdhTXh5OTNDcVQyZ3c1VDdHSkF0Mlk4Y21VeXQvbzZheWVXdkxE?=
 =?utf-8?B?VGYyTHh1aXR3am1hcWhSWUhrNGthQ1hTZGxwYll0cTFvVW1oVW1xd0NsbkJr?=
 =?utf-8?B?S1RGL1kxQ1hpT2VOMG9ybDdWMDNlWGNETXM5emJpZGdibWp2elIxUkFuWjZB?=
 =?utf-8?B?VEdpQU81b1ZmdWtMZGJCMmV4emN1aVkxbm84RVZZenBDM2lOd0VScCt4RmpG?=
 =?utf-8?B?OW8zLysrZjVIK004WUxwYng0c2w1RUp5c3BWTGxtcnBiZDJ2R05SOU5nL0lY?=
 =?utf-8?B?NDRkWVk3STZIVzF5cXZpUndRMWdhRjBjckI1S3I3Y1lTVzRCTTZ2ZnRGK1o3?=
 =?utf-8?B?Qnd6Z2dyNGtTakQxalZENEgvOWtRRFFrVVhqRmhjMlU0VW5aR1lpSXVKSWRZ?=
 =?utf-8?B?ZnZIemp5RVIwZTNOZjI1VzNJalBnRWRTcWFTUDJXQzRmQ2R5RmdDOFVpdnVG?=
 =?utf-8?B?ZDFBMDZoVWZHUUk1VGcrVnNkS3AwMXEvclltWWNyM3hyM2hSMHB2cWdIc1M5?=
 =?utf-8?B?R25wYXVsM3drNjdwY2drbVNvSjgyeVZUVVF6RVBXbmd0OVpMS1Qxcldwd1Jx?=
 =?utf-8?B?dDY4QUNNOXRMVjhJUURHSEV5QkE5L0Q1UG4zSmVHNHFuMU44ZVAzWkRMWGFq?=
 =?utf-8?B?U2ZXNWZMNXp2b0x2L3Qyb3UzUzNIVE5MS01yUkdWZHBQTUJGY24zTmp6Vmpp?=
 =?utf-8?B?Q2V0cFk0QnFtYkZFUnNMZmJwVVU1ZHZGTTN6Wm1QaVFvQlJkUzlHZW5EdTlT?=
 =?utf-8?B?d3hxUW5IQ3Radnc4bUVDRFI4TkErcWZQODUwMFpSSDRLOXU2WHJBcVFtV2Vu?=
 =?utf-8?B?L05obHZWRlRvc0taVGI5MzBkQURlVnkwcEI3S3gxQWFpbXA2eFhNcTJkM2Qz?=
 =?utf-8?B?L0wwaUV6Nmh2dEx0NFErTjd2VjJmRUJZYXA0R0djVW1XUmZndG1uNVhhTHVJ?=
 =?utf-8?B?MVlTZHNsdzNVSGdhUXN4WE5NZ2cwd1hxSXZLbmlHcG9XK0szZFhMRFY0R2tX?=
 =?utf-8?B?aGpBaVkranF3dmltb0ZoZy9UL2kxOTlDT0tRcmtIWVZBZWJ1WTNQbDB4b09w?=
 =?utf-8?B?OUJLcGpvUU9UT0c5YTZJUHJGS2RSZGJWWHF5NVR0K1REUjdrNkFXd3pxNys1?=
 =?utf-8?B?ZjJJWk0yajZBRUgxK3BPWU54QlR2bHdWSENhTnFGKzBobUlnL290aDhHMW54?=
 =?utf-8?B?Y2hGWlovZW5aRjV4U2MwbzlDRE5oTGx3b0J1emxZU0ZxYk01VXhVQmEvVkFi?=
 =?utf-8?B?WGVuSkh1S2tpWmlGT3JUMEtGWVNxaGZyY1Q5eXh3WHdpWCtmcEhPczZ5ck4y?=
 =?utf-8?B?M284Q2hkNS9tYkhRQzRJN1FrRHZiV2ZDdVY3M1ErY0hMcktLQXExR1RDVkp4?=
 =?utf-8?Q?M+dxtUpPAtnWlNky7Oo/awmro?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee0cb57-652a-4093-a218-08db70baed29
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:47:14.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuADzXUVW2f87RmVWpd/whqw52cpkrT3yonRmikSTTdAgSdAnatdSvAjzsxRQRiQvNEw1+c1AABY1GekBnOp5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9360

On 19.06.2023 12:53, Roberto Bagnara wrote:
> On 19/06/23 09:54, Jan Beulich wrote:
>> On 16.06.2023 17:54, Roberto Bagnara wrote:
>>> On 16/06/23 01:26, Stefano Stabellini wrote:
>>>> On Thu, 15 Jun 2023, Roberto Bagnara wrote:
>>>>> +       static function is used in an inline function with external linkage:
>>>>> +          non-documented GCC extension.
>>>>
>>>> I am not sure if I follow about this one. Did you mean "static is used
>>>> in an inline function with external linkage" ?
>>>
>>> An inline function with external linkage can be inlined everywhere.
>>> If that calls a static functions, which is not available everywhere,
>>> the behavior is not defined.
>>
>> I guess I could do with an example where this leads to UB. What I'd expect
>> is that it leads to a compilation error.
> 
> Here are the two occurrences we have in ARM64 code:
> 
> violation for rule MC3R1.R1.1: (required) The program shall contain no violations of the standard C syntax and constraints, and shall not exceed the implementation's translation limits.
> xen/common/spinlock.c:316.29-316.40: Loc #1 [culprit: static function `observe_head(spinlock_tickets_t*)' is used in an inline function with external linkage (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser."
> xen/common/spinlock.c:301.26-301.37: Loc #2 [evidence: `observe_head(spinlock_tickets_t*)' declared here]
> xen/include/xen/spinlock.h:180.1-180.4: Loc #3 [evidence: use 'static' to give inline function `_spin_lock_cb(spinlock_t*, void(*)(void*), void*)' internal linkage]
> 
> violation for rule MC3R1.R1.1: (required) The program shall contain no violations of the standard C syntax and constraints, and shall not exceed the implementation's translation limits.
> xen/common/spinlock.c:324.5-324.12: Loc #1 [culprit: static function `got_lock(union lock_debug*)' is used in an inline function with external linkage (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser."
> xen/common/spinlock.c:227.13-227.20: Loc #2 [evidence: `got_lock(union lock_debug*)' declared here]
> xen/include/xen/spinlock.h:180.1-180.4: Loc #3 [evidence: use 'static' to give inline function `_spin_lock_cb(spinlock_t*, void(*)(void*), void*)' internal linkage]

I know _spin_lock_cb() was an example of a violation (it isn't anymore),
but this does not serve as an example for the UB you claim may occur.
The "inline" there was in a .c file, and hence the function could only
be inlined with its (static) helper also in scope.

Jan

