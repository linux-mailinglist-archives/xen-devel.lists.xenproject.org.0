Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EC127037B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 19:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJKQC-0003Vl-LQ; Fri, 18 Sep 2020 17:43:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmPg=C3=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kJKQB-0003Vd-27
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 17:43:43 +0000
X-Inumbo-ID: 811af1d2-c926-4810-ae7a-265c581ededb
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [23.103.208.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 811af1d2-c926-4810-ae7a-265c581ededb;
 Fri, 18 Sep 2020 17:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=TUun4kkrf3/StDd5DcXF2tKEVzaSxNRN/shAK42R3iH+zGXtf9L2+mwjyV17jXz0FM5y/Xcru57VsQMIELmeUQVnlJ2AbsSCOB79dMtjm7xGGvaUQVAdtFaetdg8e2m4IPqWMv/VoRI34X4Y5II7eAd2iSMg3eO31Trw4ORMXe8b/67e1Zo3dFakIrYPFi8+TlUWk2uR7keCzhE6XC0cvCgfpEqpLFGzeILRO9OOjmBrkAJUbb8yfWd00do+eArwoJwUh6DSY9IkEMZoyfqzOnAiATgj8A3EHJzrcGkxCD8ZvW2duYhML7AwcvKMX10qrXpqzHQmIOpxUkWHWAxMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQao74t9P05bbxpuvyallW7CgU4wDHuh9HVw7dwlh5o=;
 b=fF8LlISWzLMzapwYUqXedJItON3Ist2vL9oAUn/uxAtB31ZBM6FkKugV789ocu1kGGX5dVd/Ir+NCol3cnM72HjVZeEuD+3ajcNAqOFHoW9XjiXIIa1nqC8X0dmMgvQycqbS7KIgJV524B3Zbi1Uj0iWikPvobpg6a/hxGtn5g0JamjcawQszN8DFHPksSdd9SUpGqBkTijjhToMkCAf5TXgHkUgR0AXMmpDHAU2+LlMjVU2b9xMX6r8OH75ox0u7C6V1YDWyraL4iTyu0SPrIY7QX44o2/RGzVFydJql6DeSwMsALAnRUhVG6jKAosqvduBhpMLike1dHsck3oodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQao74t9P05bbxpuvyallW7CgU4wDHuh9HVw7dwlh5o=;
 b=UrTRBgkYZStVVR3VPlXVx46TNQgVhkmd/LHOrveLjUiNat1D6mSHz/OVUPGmGjC+dV1En58wwPghZeeVkwUkRRRvtpjxWzvtyvtRwJ4iI51zEB33TobbuvfvjUKTevMIO1nLtlUc4FxXiB9ge9zzfSGp/RRXB1WJmghokmZKRAT5hdtkkNdR99ruchFnvk9SIATRderiXaTxnszWxs9+xryMiSPZRCWyGO0RtunUkYwz+uNynlo20Id+kuXAYFTrIEQl05cHkmcEf7R0lLoTQXWNtO5enKm8Nd+stmC7NbwexUvpidRGkuwV3eHhl2wJ7UoakR9RQMCsoY8RQI1a8Q==
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none; citrix.com; dmarc=none action=none header.from=dornerworks.com; 
Received: from DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:411::9)
 by DM3P110MB0522.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:413::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 17:43:37 +0000
Received: from DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a1e8:92c7:27ba:7230]) by DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a1e8:92c7:27ba:7230%10]) with mapi id 15.20.3391.015; Fri, 18 Sep
 2020 17:43:37 +0000
Subject: Re: [PATCH 3/5] sched/arinc653: Clean up function definitions
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-4-jeff.kubascik@dornerworks.com>
 <c3f11088-cf5f-c3c1-d487-f0c719147c17@suse.com>
 <e62053a9494cce5b0385f63e73683b90d7638bf8.camel@suse.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <6dca9856-fbaf-7e05-2cff-1638412c6a58@dornerworks.com>
Date: Fri, 18 Sep 2020 13:43:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <e62053a9494cce5b0385f63e73683b90d7638bf8.camel@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY1P110CA0049.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::19) To DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:411::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 CY1P110CA0049.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17 via Frontend Transport; Fri, 18 Sep 2020 17:43:36 +0000
X-Originating-IP: [207.242.234.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfe8fb74-bdb4-4706-0a10-08d85bfa5f61
X-MS-TrafficTypeDiagnostic: DM3P110MB0522:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB052231A4F9E2CB2AD5FB406CE93F0@DM3P110MB0522.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(26005)(186003)(52116002)(53546011)(44832011)(956004)(2616005)(16576012)(66476007)(66946007)(66556008)(31686004)(31696002)(6486002)(86362001)(6666004)(508600001)(8936002)(8676002)(36756003)(2906002)(110136005)(54906003)(83380400001)(4326008)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe8fb74-bdb4-4706-0a10-08d85bfa5f61
X-MS-Exchange-CrossTenant-AuthSource: DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 17:43:37.5240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3P110MB0522
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

On 9/17/2020 10:40 AM, Dario Faggioli wrote:
>On Thu, 2020-09-17 at 10:09 +0200, Jan Beulich wrote:
>> On 16.09.2020 20:18, Jeff Kubascik wrote:
>>> --- a/xen/common/sched/arinc653.c
>>> +++ b/xen/common/sched/arinc653.c
>>> @@ -119,10 +119,9 @@ static int dom_handle_cmp(const
>>> xen_domain_handle_t h1,
>>>      return memcmp(h1, h2, sizeof(xen_domain_handle_t));
>>>  }
>>>
>>> -static struct sched_unit *find_unit(
>>> -    const struct scheduler *ops,
>>> -    xen_domain_handle_t handle,
>>> -    int unit_id)
>>> +static struct sched_unit *find_unit(const struct scheduler *ops,
>>> +                                    xen_domain_handle_t handle,
>>> +                                    int unit_id)
>>>  {
>>
>> Just fyi, afaict we consider both variants legitimate style as far
>> as Xen as a whole is concerned; I'm unaware of scheduler code
>> specific restrictions (but I'll be happy to be corrected if I'm
>> wrong with this).
>>
>No, you're right, there aren't any additional restrictions. And, as
>many other subsystems, scheduling code is not always 100% consistent.
>There's quite a mix of style. E.g., there are both examples of the
>style that this hunk above is changing and of the one that the patch is
>changing it to.
>
>So I also see limited need for doing it. But of course it's Josh's and
>Stweart's call, I guess.

If that's the case, then I'm thinking keeping the previous style would be
preferred. I'll switch it back.

>> Instead what I'm wondering by merely seeing this piece of code is
>> whether unit_id really can go negative. If not (as would be the
>> common case with IDs), it would want converting to unsigned int,
>> which may be more important than the purely typographical
>> adjustment done here.
>>
>Yep, it's defined as `unsigned int` in `struct sched_unit`.
>
>So this indeed would be valuable. And while you're there, this probably
>applies here as well:
>
>/**
> * The sched_entry_t structure holds a single entry of the
> * ARINC 653 schedule.
> */
>typedef struct sched_entry_s
>{
>    /* dom_handle holds the handle ("UUID") for the domain that this
>     * schedule entry refers to. */
>    xen_domain_handle_t dom_handle;
>    /* unit_id holds the UNIT number for the UNIT that this schedule
>     * entry refers to. */
>    int                 unit_id;
>    ...
>}

Agreed. I'll make this change.

-Jeff

