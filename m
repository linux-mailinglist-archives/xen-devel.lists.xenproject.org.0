Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F85F42EC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 14:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415510.660105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofh2N-00072P-1O; Tue, 04 Oct 2022 12:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415510.660105; Tue, 04 Oct 2022 12:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofh2M-0006zw-Uq; Tue, 04 Oct 2022 12:28:38 +0000
Received: by outflank-mailman (input) for mailman id 415510;
 Tue, 04 Oct 2022 12:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofh2L-0006zX-84
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 12:28:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 112c0c85-43e0-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 14:28:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9519.eurprd04.prod.outlook.com (2603:10a6:102:22e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 12:28:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 12:28:31 +0000
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
X-Inumbo-ID: 112c0c85-43e0-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IinflnMNCNUZY0HFtoIsAbIOkGNmkH9VB9a19vFHHo2e8LM3SRjliNRDpoyr7seMsfzsGob+31NubGvFc/B/+PzkYTZEAKC6YFJRvXyN5kE2DuYTzd1aYm3KOSfXxnGO5+B2uF5F/KbOKFG0whhF4ZsR/IMUqWU2PFTmmlH0JEoKdgA0qd1GaHZcnmMJccC5VZ+nPefZxZCZ1viBN7hofYxgTsJO17eT4qlz4UQAS8aW2c8IA8ipOkjXI0QfJwq4FOzKRX6ztbwjdrZrm+0sBtyUKKPq13YrlP0Q2amoiR/ETf9GhnFPBCkZl3nx5n4GFim0Xj+jksB9lex7jxccQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpGeEeVraeJSWAt2zRJbWgXPtx6MwofautsqUtDuqMg=;
 b=lIXcYhIVWzpha0HLBrmJb4MCYPYpfIIigf05Z5wTyMywjFTeO8Qv7XkZgayhN1HbDPv0FdKR0dmxZgDPFYz2Oh1uVEInI+uIE3CQCqSJRLMgy8MVkWRnY73c+bw1Y+gkSQ84aVv9PD+7CEy4VkVWa0kXQDR8aX+ZrX8/p5FT5/PMvnGOhoQ+JJCOzUiJnSEAa6Q1aUY2wl7cg3UykF7AU6NII+/FIrk5KFGM8dSJCSpjHDrvBD5ezlLSem/Fc3Z0f4B4V6Ze9XulouMSdw31LyDuT7QbXP0Z7I7EjOBwIiaElEYEMsWx2earRmJAOuSdhGcpM+plhrekcDik9+bEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpGeEeVraeJSWAt2zRJbWgXPtx6MwofautsqUtDuqMg=;
 b=HXUp9dHsQbLWbymUXEqMwRxZRWImqKG/NJvlX99E0c5M72ilnUKSxjo+RpsI6i7j5z1XhCNjGktRrKLY31YJGkmgvr0AdB9lc6krmv78VfJf3VsVynYHu4q74Ssbcp3LM/v1eWNsY471RIrd7RTCW49Yflw0MUVD3c/ErOib2WuQNPtnV7jcs/pEsO9v5NSC0LJ2J7HQv9GJXl3xyk5e9rvd2wqdbBczYww6umvAP0RLFcGJ38IWy8iRelcGBbR60c6tInFqZUz2/9qCDVdA4/z02/zBQtgAMctKFQyg1W2Kgj1IKDI2YVZFlH61/6RAp2+wFKx2ZTh9hp7gO9NfNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77fa836a-421e-f1a8-7009-663f97f764b0@suse.com>
Date: Tue, 4 Oct 2022 14:28:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] Build: Drop -no-pie from EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220927154708.15787-1-andrew.cooper3@citrix.com>
 <77d1bd6f-fce6-bcd2-96f1-a672aedaa7f6@suse.com>
 <764f281d-fd97-7413-02d9-f856c0a5771b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <764f281d-fd97-7413-02d9-f856c0a5771b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cfa1608-f3ad-4fd8-0f6b-08daa603f274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FsUh/XltfUl00vlEUYJtZ248vXYAtDU0Jsm6kaw2GXrJl+hENHqbm7oOJhHkl60e2q3KK8VVr1zZnY2Pun/vISwvArbAcGebGInwulFK3m/PUjki+XVWvQCA0LZb4gPzrcuUE6rPGq/42s2iDbjALOpxbjktJK7M99Oh0BZRUNQL/NjJ2IkmfwcBp7WKC8tROgjnp4jd/HiQZi+19F7RNcgkvwPjcjTWjStCvKsHKYa8x0e572Og9nLCkQWcoWUILgn4bu5OIFn3SOL5LDrlzpxKw8LVNfhzHUO+/Nx27EVGS2zUxw6SyW7DfqjlvJlMCZJsq6k7bvDeBOgXlMp0QFN7yx6X7FUn9sRthBYTTCJJDTEx5dWqBaKAnJFOXKbCl4l9S4SR3jqVewHfh9KQLtGsRV6UzjI/jbyor+nqGt/pTd5f7ILMT4v5Rm0z8CbtxaBVeisQJi/bgxeVlhN1pb5CiJcq5IsxJ6ragDt6UTldNWSnfV/FycU2iWUnSt9zgtlQ8x1Pqq9iDZucAw8p8gpM7Y9hi7TMDYwvwdRrfIplTfxAmROjb0WkEpnBvYU2Cz1zTmKj/VBVFMJPnQj7vkCIUC07XEEt7yrs0wzVkBOy/YbWIqFuadw5w8sYmSJIZjDsgSI4ffLtsqnQbcZhBUtKhYrBc2OMYf60LMFJM5XdiSQu7SY/1Xdwx0E9YzjidCvCXQB+upOAqUUbz6NGzjLiGLlL9cfuQ932oMYot3+nBmU+VnGotOX3mjX2Maoo4flaXqgdIH0v5cQk0QNSIV7LuVaR5TbdH0ypMMMaUuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199015)(54906003)(26005)(53546011)(2616005)(6506007)(6512007)(6916009)(66946007)(316002)(8676002)(36756003)(66556008)(478600001)(66476007)(4326008)(38100700002)(31696002)(86362001)(6486002)(83380400001)(186003)(31686004)(4744005)(5660300002)(8936002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHE0UXkyRlVkUzJpaHVYRkhJYm1yYnk3VEQ4K1VmTWt2Tmhjc3Q3eXpYeEsr?=
 =?utf-8?B?dVRXM0NXNWhRYk5JVmtaSlBrb1d1SlhIZFhnemN4b0hoNU1ndGxuN3IzVzNT?=
 =?utf-8?B?Y3FLckJUOXY1OVVYT0tNMndadU9obVFjUU12TVl6WTNlTXIwRHlTZlZYME9l?=
 =?utf-8?B?ZXNjcERsSDlOSUUzVkRFYk5uN212Z2lzcmVoNmphbUFoL1JrQUo2R0NMeHJ0?=
 =?utf-8?B?SVhtZm1pUTJvdTVGZTVrVzE0S0VJNmVUTFJXWDh3b01MMXNDVHVFRWNobUJO?=
 =?utf-8?B?REk4Qk1Cc1NoWWNtZjFUUHd4Qng0N3R1VHBFM0NlSW1Nb3RuUFFVQVNxTXZN?=
 =?utf-8?B?bEVQdm1JZDV4U1JTOXlZQUM3bGVFRHZKdzkyeEoxcTJvQjQ0NTBML1BrbWJI?=
 =?utf-8?B?bVhDQ1pMY0F5QXp1bE9NZ1Z3Z0cwSTZkZ0VjNEdOTXlFRWhYTitQSDM1ZWYr?=
 =?utf-8?B?bWZuaGlyOWxic29tZlExL240QUI3dGltK01qSWZGUmVVU2Y1UXJSSENPSU1Z?=
 =?utf-8?B?YlkwUjZBRmUvRmF4d3ZMOVc1K1RQZDlaWXl2QlgzUCt2S3RtR29PMjN1UGxT?=
 =?utf-8?B?WE9rZDFIZXU5Mmo3cW9tRGtRZnRBbzFXK1VqNVprZWdKZTQvQ3dkMm1YOEZM?=
 =?utf-8?B?amc5VnpmakQ2aG5rNHU3M2lKVmZwR2tOSHhBN3c2eWtyTXBDTXRsN3JzcFpn?=
 =?utf-8?B?SjZzeCtEVC9tRitTZllOL3dFdDlrdU84Ymd4S3lieER3ZGVBd3dadDVuM3Vl?=
 =?utf-8?B?dU1GYWlHV2Zrd0o2Z05BRG9ySUwyaTFwTXBqR2FHQmhMWnJydmd0Y1RObHNa?=
 =?utf-8?B?aUFrV1gxSFhhd2tzMlVUZmVtTHFDajEraE5IcXFQK1JQbk4xTXZRRjQreVYz?=
 =?utf-8?B?STB0SmxPMzE0UTNESWwveSt3TG0yVkd2VXhmQlNjUUwyU2podkRVTHVJNncz?=
 =?utf-8?B?RjZJRmlSZkpQSGJvejVGYkU0U0pybEpTa09vNjNzVHJRdE5mbUw4aG1heGZN?=
 =?utf-8?B?NGVFZkpEaVF6OVdwbjkwQkg3Tm9KMUdPWkxnc1Jlb2d3ZmVHdnN3VzAxZ1RS?=
 =?utf-8?B?YWZSaU9OYXloKzVQOFBNTmxIY2ZTajM1QVhGNXBVZDJ2UWZYSFY0bHNicjli?=
 =?utf-8?B?N2J0eGdNV1A2ZWpJTTBKSkdsUWtTb0JNdXQvZXZzWkpTbDc5ZkZWS2U0UERn?=
 =?utf-8?B?YmJlV1poNVJ1dXRPYS9ENWhZakxwcEZ4SHltaCszUVJheUlmRy8zMnFaL016?=
 =?utf-8?B?MDMxbEFVeHh3RDBKUzVUcDc3WFpuRmVhaHVORkF4TGNGT0cyRTNURUljUzlO?=
 =?utf-8?B?dVpROFlzMlduTzFZdmFDKzI4bU44b1F2NHdRVmdtSWtQOTVHbm5IbHNoR2ZB?=
 =?utf-8?B?QXJxelRpdnRwbEZGNUhLQ21nR3ZaekpFczJOZjBGbHFYWmtoUGY0cDB3WHR4?=
 =?utf-8?B?d1JZeTJsb2lvbk9tRlpDRUZjdzN3cmZPcjE3UUZnenJ5aU5VbE5pSVNaWTZ5?=
 =?utf-8?B?K1FEaWVpV3hQRitNSVBnT3BnS2tUTkl0a0lXRUU2eDRPVXA5eGFac3U5ZGc2?=
 =?utf-8?B?dGFOMjZ3NmRsL3Q3ZW81ck0xWHRRZnlLekxxNHlnamo1a2hpTElZRWdOcDZY?=
 =?utf-8?B?R2lyTUR2Nzg5UnVyNXMya0hERFlXRVdSelYzUm0xZjdvaHFBMllhbFN5YjhY?=
 =?utf-8?B?b25MOGdEb1hmaWRpUUVFckU3T3RzcmhYR0dVRWJMRGdwWStMc1hlSzNNRFZI?=
 =?utf-8?B?Qkl4NEdRVzYwUFNzWjlUblltWWZNVGFnSHo3WSsvS3crNW5kQ0p4NVZtcFRj?=
 =?utf-8?B?Z2QrZHBQNDB5N0FIWW1TUmV0Skh6bUVBRTRZeEcxTWcwNXg0T3lXUUlqMlls?=
 =?utf-8?B?UFh2cjErUk1SYk1wYk8vM1FhNlhpUG9FSy8zTVhIS283a09aY0xiZStYb201?=
 =?utf-8?B?eTZENzBTRllFbGJadXpTbEkvajVaT084UUY2UXBJZ3EyckxqNWFoVldHVEdX?=
 =?utf-8?B?ZFJRL3hZRit6REgrQ2dFWFdoNnBCQnZwSExYb0JDQlZqQnJzNzJOSG9xMkIv?=
 =?utf-8?B?Y3UrdzRldEtFUW4zQzJDRTBqcG0wbUNMT2VraGRXSzhUekJVMEwrUHRiWS9o?=
 =?utf-8?Q?hJYUMJ7OugKcDshHc1scmt3ib?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfa1608-f3ad-4fd8-0f6b-08daa603f274
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 12:28:31.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5IYeWRmQZfU6511XfDhzQH8iVg/X3LBQvtCTaBBx//kC4N7xuFdgBl6mdj0em6rxhhz8ElsmmDM1OpBug5JDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9519

On 03.10.2022 13:20, Andrew Cooper wrote:
> On 29/09/2022 11:07, Jan Beulich wrote:
>> On 27.09.2022 17:47, Andrew Cooper wrote:
>>> This breaks all Clang builds, as demostrated by Gitlab CI.
>>>
>>> Contrary to the description in ecd6b9759919, -no-pie is not even an option
>>> passed to the linker.  GCC's actual behaviour is to inhibit the passing of
>>> -pie to the linker, as well as selecting different cr0 artefacts to be linked.
>>>
>>> EMBEDDED_EXTRA_CFLAGS is not used for $(CC)-doing-linking, and not liable to
>>> gain such a usecase.
>> Since it was largely unavoidable for me to notice this while putting
>> together the two XTF patches just sent - isn't the current way of using
>> -no-pie there bogus then as well?
> 
> Hmm, it is now.  In the past, XTF did use $(CC) for linking, but that is
> not the case now.  I'll drop it.

I notice you've dropped it without replacement - don't you want -fno-pie in
its place?

Jan


