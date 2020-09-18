Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05786270164
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 17:53:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJIgj-0001Ga-TU; Fri, 18 Sep 2020 15:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmPg=C3=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kJIgi-0001GV-KP
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 15:52:40 +0000
X-Inumbo-ID: 11da2332-02a2-45fe-9b62-043c6f488464
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [23.103.208.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11da2332-02a2-45fe-9b62-043c6f488464;
 Fri, 18 Sep 2020 15:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=GvbTxY8wN13V2II/adpqghlbPEHp1ReZcT0pnjtARUGIuEM6n6IrdwoV94+rcaRJvLua2BJLeA0lNL0LhRyeRkjknQnxqBSutbUGl1nSOtB7kzt8G0jmSt13Y73x9A1ZbDWZ4F5GbXxbJB8p2Yccf0aI5qQWYBiD7JlFk9shlwBisnGlKl/AjVTuahMxO2sirNNorJQvMX+BlgXOjKvlHxGw9YYx1OMNJSQ51Bm41nFgoKxAJLBXErnHaEtrv1ZCpZX4SacpH0w/y2oN4EF2k1TY32Ac6vJqhsHGDNhdp9U6ywMiaByV51QAcT8OPiCHGmArXrlc1lcWqTG6V9Pv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkFj+gQKkS8Wf+rzmpwOFzT2MJzmSgIYph7oG+SRnRI=;
 b=I5PI90vuaN4ejd5mQ25AVWXMjfl8ZIEVhVzJhXDtLEqWB2i+D7JgrlAfh8/+X+ivCzoxh6Ac+kQwy2Te+7pHOQN6zCYjh5itYuiHe8mXoczQO0siYGH4kh9CzUsK5kBTwygcLjkDQY6omlF+UTQdmHwZktDNiaJxO4Uy19e4gJ0gLpEr0r1X6DdiO0DXg+jLbgouDkpNZvrT7oDyokt1RbhqSm6TPmjdHn6Pauns+rTYrZ1mn8lLiKYMToJrixSsUUHWIZkm9qx86hgWvysZDcbUIsdCU81zm3cX5e63McfuwIGALLnqB2Mrj1I9BFZQvHEJdbplnumk2PGa5Zazog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkFj+gQKkS8Wf+rzmpwOFzT2MJzmSgIYph7oG+SRnRI=;
 b=N2/jbYRr+80/sWHA/UPtbSqA95qW3KuZw1EYB2BhKpUs/56SBDhEesbjdHsSsft93s0DuEMz/Im1umfxJmGQylGNulqRHhkHu1gMluBq6k1TIr3guhcFKppvqvB557O9Ev3oMKDEX0iAKT6jNyMORNGcFSqBVmL7qtIHwK/3ns51oFnxBXym2KJDzWsRLwEi6/llcilL9YZ5uq2Dk7Z7jYNKa8qt2xni+3pWR/WQEamCGD4jCvZF8Z6wqpqggIaGcw/MTIeuzg1xjJ3Vl6gGdD3mV+Je71ryYVp1oOrFgoY4+05y4yfn9JdaX945+mAgKSlzelrREEEwwlqsGjShkg==
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none; citrix.com; dmarc=none action=none header.from=dornerworks.com; 
Received: from DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:411::9)
 by DM3P110MB0476.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:413::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 15:52:35 +0000
Received: from DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a1e8:92c7:27ba:7230]) by DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a1e8:92c7:27ba:7230%10]) with mapi id 15.20.3391.015; Fri, 18 Sep
 2020 15:52:35 +0000
Subject: Re: [PATCH 2/5] sched/arinc653: Rename scheduler private structs
To: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-3-jeff.kubascik@dornerworks.com>
 <fc0b043d-1fe5-8281-fc18-1e1ba26cb127@citrix.com>
 <082ef86ec2ecad5f2b76bf4a055123346d6b85cc.camel@suse.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <049ce557-bcbd-f9ee-3214-5240a3e23c68@dornerworks.com>
Date: Fri, 18 Sep 2020 11:52:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <082ef86ec2ecad5f2b76bf4a055123346d6b85cc.camel@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY1P110CA0059.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::29) To DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:411::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 CY1P110CA0059.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Fri, 18 Sep 2020 15:52:33 +0000
X-Originating-IP: [207.242.234.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18c6a460-0026-49b8-6b35-08d85beadc27
X-MS-TrafficTypeDiagnostic: DM3P110MB0476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB04764BEBBEC8A3D2A6B372EEE93F0@DM3P110MB0476.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(2906002)(8676002)(36756003)(110136005)(8936002)(54906003)(52116002)(6666004)(4326008)(26005)(6486002)(53546011)(186003)(508600001)(44832011)(956004)(16576012)(5660300002)(2616005)(66556008)(66476007)(66946007)(31696002)(31686004)(86362001)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c6a460-0026-49b8-6b35-08d85beadc27
X-MS-Exchange-CrossTenant-AuthSource: DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 15:52:34.8610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3P110MB0476
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

>On Thu, 2020-09-17 at 13:09 +0100, Andrew Cooper wrote:
>> On 16/09/2020 19:18, Jeff Kubascik wrote:
>>> diff --git a/xen/common/sched/arinc653.c
>>> b/xen/common/sched/arinc653.c
>>> index 7bb75ffe2b..d8a23730c3 100644
>>> --- a/xen/common/sched/arinc653.c
>>> +++ b/xen/common/sched/arinc653.c
>>> @@ -50,38 +50,38 @@
>>>   * Return a pointer to the ARINC 653-specific scheduler data
>>> information
>>>   * associated with the given UNIT
>>>   */
>>> -#define AUNIT(unit) ((arinc653_unit_t *)(unit)->priv)
>>> +#define AUNIT(unit) ((struct a653sched_unit *)(unit)->priv)
>>>
>>>  /*
>>>   * Return the global scheduler private data given the scheduler
>>> ops pointer
>>>   */
>>> -#define SCHED_PRIV(s) ((a653sched_priv_t *)((s)->sched_data))
>>> +#define SCHED_PRIV(s) ((struct a653sched_private *)((s)-
>>>> sched_data))
>>
>> While you're cleaning things up, please delete these macros (possibly
>> in
>> this patch, as you touch every almost every user).  They strictly
>> introduce type safety issues, and are in the process of being taken
>> out
>> of the other schedulers.
>>
>Agreed. See, e.g.: a1c329c2828b ("xen: credit2: make accessor helpers
>inline functions instead of macros")

That should be easy enough - I'll make this change.

-Jeff

