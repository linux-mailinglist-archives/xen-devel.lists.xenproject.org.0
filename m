Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE614793545
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 08:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596224.930027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdm22-0004N8-KU; Wed, 06 Sep 2023 06:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596224.930027; Wed, 06 Sep 2023 06:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdm22-0004Kv-HF; Wed, 06 Sep 2023 06:28:54 +0000
Received: by outflank-mailman (input) for mailman id 596224;
 Wed, 06 Sep 2023 06:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdm20-0004Kp-L3
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 06:28:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4c5295d-4c7e-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 08:28:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 06:28:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 06:28:46 +0000
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
X-Inumbo-ID: a4c5295d-4c7e-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwp+vRxmohLt156SPCA1LXo//vaeoNBhmpXZT2aDPjxuchNWoWXHE3TgVOZKxift7UiHopyrnnX29y7IDYw3F/ufg2JSd+3dUvPS82BM37LBE+NIRHA0m9DkATcsvCmFEU0yMVfhH2NJbQKHI5Z5vL8bWUyAb9BMueBPijZZkvG8nZTlvhxt+FAncxfBjnb19a1by/Shs3e+VNcLT6oCTl/YYsOo4aQEgXKGNp3Wf7alyobCeDvTWPLBJ636uz/IR7t4p7XnDda/UPyZFhtxRil8QgTmMUNuhW22+eq9z1LxF2BhGgdiZvgGiYqQ3u8Dwi5/EYqlmZyiNZN//asYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwrJ9v0tPmlWK4vV3wJoLU6KbLFOGLut1bdotv1hGhI=;
 b=TxY9cVm8bSrJmoGyn85Y9+qtpbrYK0zpzH+ViOiAH72b8SjpYTMuZFs1PWEmVtYAxsOVBEiAmLRqQcz5GARCLA/fIjVKZ7ASIubllYQeECr5dAFcOllVFxDDUByPtBX163LXv+MTKqnDkc+ADUZlmrGkpaK1u8F2hmWglYdXxsyY9Cltr/zhNZ/dv9Co6XXvT538xpzJDwx7F6AHC5T4KSbryvtS8eV8ou6jBS3losXM6W4moGciv71ceFpIIPwEA3Ckkns6tZ7HLGS3rGG57cV6LmAWGvh6BkOn/vELnH04N8YPRTyx51d5GKnfeN9im0aQkYi/dNpQyy7fLxfaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwrJ9v0tPmlWK4vV3wJoLU6KbLFOGLut1bdotv1hGhI=;
 b=oNdp0r6uK7cFN9BI/yqf85cfe5CohgIpWrBOWTfXcpOvrgbVlITT+opZOEwLgjiRWa5fcv9QKqCsMuzgApS+jUUdrOqUfu7L1W1bhL/61ysQJjhSUPk9/hhHtxVVLd8UBjUBvuNJ01XmUB+gwH8GB2ZVoqIHGzyg8URluuT8mFPjS9LBVMI492xzGDR1wfglHQ3foc01CR7sWu3LtGj64EITBBqzFWULkBk7InTpEaYiohLcXTB7FstRiTLEswczdBbvYHbTQnxPn+SjA+hwPPWy1Oma4xb2dPZJZ9G3ptN+MGurYCnoqbHp2LUT6gGtL/ZQjk16CSGzjLIGiRDHcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b782cf54-246c-9226-7246-47ffbd00dea9@suse.com>
Date: Wed, 6 Sep 2023 08:28:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
 <00d67696-7895-f4cd-de0d-0c24f937deb9@suse.com>
 <be7ba4ea-b5e9-cc00-a8d1-0fec82248b8f@bugseng.com>
 <00866371-7adb-9cfa-267d-ee78cf14e68c@suse.com>
 <7d5244fe-d89c-8878-b16a-a3345426de1e@bugseng.com>
 <6ea28c90-68aa-4a14-e352-2bcb6e42a76a@suse.com>
 <814c3aa1-dbce-97d2-f526-93e185d61438@bugseng.com>
 <alpine.DEB.2.22.394.2309051514200.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309051514200.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f3861b-c956-4100-7a56-08dbaea285db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rR0oKzl133WI9bJx3lKwz0UIWdA7wIJnd3miSk5kwfMqNmNVSs/nepBc9SXdqrJseZVymCUVEIfeNnF/av5hrVoOBSNg58p9qwd7Awse8hk5mCgu1CbMRKQB0+E+mtcdk3gXFvE5oqMvfyb+6hsbVfa8/TtN6I2XXNvmReGCGMxedpQq1WjVnKWuWYmqW6r38/W6ebrGfo3jHpD+R2kbAdjxS/Yh374+5gGQS1IwIw6YTCqkp6s08wEc1Has7RNNLcIMakfY8MOq+cGZFwBgawpxagKeZGsPVjgrlKaflcWCjbeidoGFtVSuS2T02EVGf0OathDnQS49qtDVToZ5r6vZANMjvRNCAnWTnjcPcv5bY9b/amTFm5kGiYmoeP4GjSj6Oa2tLAniRbvEWZR4WdLjOdf+jvgwpaI40arF8IRUyydP1uS5E3gyyd8aXj/EmkqngLtreLWLXdAgwC+gZY62kgORULeNTRdJOGkbd0NAAICpxTDX8adlrsIi7UkWOqfC9d1DnNu8D+PhLjDdL1HC7MAofIgKSAhPkPu0T81HaPb7VXPJmBGdoB3Ccr8TLGp4EATZMFmKw9UiqZWwYXsYbpvV0waZvI3LKXbRzKEvEE8Cqoy57KGi0tKcAMaHDeY4YEMM+zq2iEy5IZRzDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(186009)(1800799009)(451199024)(6486002)(53546011)(6666004)(6506007)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(41300700001)(66476007)(66556008)(54906003)(66946007)(8936002)(110136005)(8676002)(316002)(5660300002)(4326008)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3Rqd0NrVWxhUE5qeUhqanBtRzFLenNDYXg4TWxLTDZ6Y0JHOU8rbmpEaU1w?=
 =?utf-8?B?dSs2ZHZ5ZXFlS2VJTXdjOGk5dGNPK1hacU83azN3amlSRlNIYnNyYlh1RXNh?=
 =?utf-8?B?Y0RURDVIMVkyTjl5bW55WW5kTXJTYU9vck5RWDZyVjVoWW9ON3dBNVFXcTlZ?=
 =?utf-8?B?NHR0QjhCSEVVZk5zL0hPYUhURFA5SWhwNFVDK3NBNFc5SWswUjJ6VWt6R1c5?=
 =?utf-8?B?QTJDQ2tyWDlaOFM1bXJDUForRi9oRVRtME1aYnY4REFEWHVOQUt2WnR1S3Jn?=
 =?utf-8?B?cndyclM3REp4SjhtK0doejM4OTJENVY4bC80Z3NUQTRBQmZza2s4TnI2aDlE?=
 =?utf-8?B?b29jaUwzMXFZQTB5d0lzbTdNV2s1cWlibzVqVFNZa1BkbXV3T3lqM2xtTHJn?=
 =?utf-8?B?aTZycDdIYWlyOXJjVG1jc2gzanovbGIrZVRHdzlIbnNIWkhvOFpVUFFqN1p5?=
 =?utf-8?B?bXJFbmJON2dsZ0pEOG8xbWFxM2dHa21aeEtqcVhIdmtFeHgvTjJIdXIwclBK?=
 =?utf-8?B?TE5DN0YwNUs5emxNZmoySWNPczVPYzB4SzcyanlXNmhkQTVNS2N1MVJkUDIr?=
 =?utf-8?B?LzdveXJ2anQ3dDFKL2NTZVNVM0ZUbVQ3TWlPVDA5ak9ZTHh0QzE3SEdGM0pl?=
 =?utf-8?B?YUhZeGFCSXdKSTFUYkJWVFhraXEvNVdCRVdIbjF4ODlKUzNRNmI0UkY1cmEz?=
 =?utf-8?B?RmR2VzZGKzlYcWVBaUNYaUN0ZHdmS2N0RTcwTG00QndNdFFGMml6ZFZPckFj?=
 =?utf-8?B?QjVhY0pYTFNrbmcwOVB4dnhRUTY4NW9Idk1nUnJCZld3ekt4S1NsSVFwbGd1?=
 =?utf-8?B?cHBybG5TamlGdG5jc3JlOTg3S0ZvZ1VWU09zKzlpT2w0dDBlWk53eFBVMmJ0?=
 =?utf-8?B?WFcvMnl0bE50OUhUeWhsMUVFb1FxRkl2V1FIZVpsMXZYZDhWOTRENGRSQmUy?=
 =?utf-8?B?Y0hZa040RzNSTVM2RGo4T1pFdEJqTTQvTzQ2WkZKNVVXMzNQdlN6TkpRV2Qz?=
 =?utf-8?B?bUxQREVMOTBRbndpcGxNNElDRzVjTDRySTZDQk1UVTMrcHdDM05aRW5GcE04?=
 =?utf-8?B?d3ZXbFBwRXJuM2QydDlwRGVLUGZ5QTR3YWpWZnFDREUzMDA0a3pkOWhSb3ZE?=
 =?utf-8?B?SHN5L2NRQ2l3S1BPYnpWTjM3VkM2U0dIekhIYkxTOU5lZTRkK1RBSkkvVDRN?=
 =?utf-8?B?WitwVE1lVFNtNGlvOGNYcGl5ZDZaQjVhcmZvNWNEeWhuN0FTakczMTh6R0FI?=
 =?utf-8?B?ZHlsOTVEdXA1LzZQLzN4SFZPZDBKOTB1RXpRZXdEN0QvY205MWtBc0JwZlhP?=
 =?utf-8?B?bG4wNFJLS3RNWnJqUmdPc013b0ZxZ0ZBL0lRMENvVFVEUnF6dXU1cURwU1hn?=
 =?utf-8?B?a3VFQ2QvaFU5QjBTL25EZC95M0RuSEloYnhkUW5GRzBveXU2VVZnTkw1NlFm?=
 =?utf-8?B?SW5VeG52YllVODZUdnMxR3JJTVRiUE53MitxMWEvTFJQTVlUMVJ3b1dsRkpP?=
 =?utf-8?B?bDlpbW1YRGZaWHBEaHhOc3o4MDZRUHh3d0VIT0p1ZzhZa3dVQ25rY0lJeUU1?=
 =?utf-8?B?d0VXdzRDMXBGUjI4bjBUSE0wRXpDQWp3dkowT0JyUmlzenA5VUs3N2lLRjQ0?=
 =?utf-8?B?VDBqV3JqUWVxZDJEYjVOQ01xdjZXVGZEOWl6TFlwNEtoTFo1bmxSanVONkZF?=
 =?utf-8?B?Mjhmci93Z05TUElGdFkwY2g5M3lVREtDYjZRdERRcEwwaEZTUldxbjgyNTN0?=
 =?utf-8?B?UEkvNGFjNFZQZEp0Qm0rbERmWTZrQzltc2FZS25jZEZtZUJjNHdsVkVCNkY4?=
 =?utf-8?B?QUZDa3dhQU93eEw1aXltRTdEcHVUZlZJei9kRDUraVo4SHF4emMxUzJPVUtu?=
 =?utf-8?B?K01HanEvaE5MTXhXb0ZXYjdvdERLd3hxbEFPYkl0dG9NMHcxZ0tVc2VGYVlN?=
 =?utf-8?B?MjMyYnQ4VDhwK3pNeGMyNUYzcXZ6SVhYTkxVblQ3RklIYmJKNDZoQUhXaE9i?=
 =?utf-8?B?QTRzS29qNmNEbGVEd0tTanMwa2MrajNVNFN4UkxndU5oWTc1M1NxTmwyQk43?=
 =?utf-8?B?d0dSTkVoTlFhbndMUHhjTXpOUEIxK0hHSTNRRnBKZTVNTU5hVlBEV3cyZDZw?=
 =?utf-8?Q?Ba93aC5YAKqabdRhRdRhjLTNT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f3861b-c956-4100-7a56-08dbaea285db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 06:28:45.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AG73fRn6ImAbscTc07wlgENM2FqgQ3G385DKzN88i8Lt9feurBdUqOHWpgIL7tJLwuQzBLRuSPGkmlio3W1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On 06.09.2023 00:18, Stefano Stabellini wrote:
> On Thu, 31 Aug 2023, Simone Ballarin wrote:
>> On 31/08/23 15:05, Jan Beulich wrote:
>>> On 31.08.2023 14:54, Simone Ballarin wrote:
>>>> On 31/08/23 13:10, Jan Beulich wrote:
>>>>> On 31.08.2023 12:08, Simone Ballarin wrote:
>>>>>> The danger of multi-inclusion also exists for .c files, why do you
>>>>>> want
>>>>>> to avoid guards for them?
>>>>>
>>>>> Counter question: Why only add guards to some of them? (My personal
>>>>> answer is "Because it's extra clutter.")
>>>>
>>>> It's not "some of them", it's exactly the ones used in an #include
>>>> directive, so I'm not getting your objection.
>>>
>>> My point is that by adding guards only for files we presently use in some
>>> #include directive, we set us up for introducing new violations as soon
>>> as another .c file becomes the subject of an #include.The more that it
>>> is unusual to add guards in .c files, i.e. it is to be expected that
>>> people wouldn't think about this extra Misra requirement.
>>
>> I can agree to partially adopt the directive: I will add a deviation for C
>> files in rules.txt.
> 
> Sorry for the late reply as I was OOO. Please hold on before adding a
> deviation for C files.
> 
> In general, I think including .c files is not common behavior, and
> should be restricted to special cases. We could say that exactly because
> they are special, they follow different rules so we can skip the guards.
> Or we could say that they are still at risk of double-inclusion, hence
> we should be consistent and protect them too. I think we should discuss
> the topic during the next MISRA C meeting.

Just one further remark right here: While including a header file a 2nd
time stands a fair chance of working (i.e. the compiler not spitting out
errors), that would be very unusual for a .c file: Every function or
data item it defines would (in the common case) be already defined.

Jan

