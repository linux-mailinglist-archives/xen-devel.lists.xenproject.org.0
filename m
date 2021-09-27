Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F87E41915D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 11:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196569.349464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmhK-0000JT-Fo; Mon, 27 Sep 2021 09:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196569.349464; Mon, 27 Sep 2021 09:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmhK-0000Go-Bh; Mon, 27 Sep 2021 09:13:18 +0000
Received: by outflank-mailman (input) for mailman id 196569;
 Mon, 27 Sep 2021 09:13:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUmhI-0000Gi-BD
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 09:13:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 246821b8-1f73-11ec-bc43-12813bfff9fa;
 Mon, 27 Sep 2021 09:13:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-85LuPaJpNVuc1bva3LyAbw-1; Mon, 27 Sep 2021 11:13:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 09:13:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:13:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Mon, 27 Sep 2021 09:13:10 +0000
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
X-Inumbo-ID: 246821b8-1f73-11ec-bc43-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632733993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=385TWVhCUgsps16snZlJb/hP9/SXebrRW9F9pdvegDY=;
	b=YIfqw6CL5ZYRx/2UZqU01rMSAmu+1Q/y0f9Z0tz0qH2i7l6Upbf0NKz9CzidzXfMzlbQ9l
	gsj2e/db+O6nO6RfxA2fSHi4/BqswppDZn2ToEgF0mLdlz1x+tvp1Uu97qS7raF6Sfxwji
	Gk6tNzZZppk61LGnxgMxn+PwsQS0LRc=
X-MC-Unique: 85LuPaJpNVuc1bva3LyAbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpOUftQNqAEAjAJk7Nar3ifQWxDMqSKMw8v0DnW6igKWEYabljq9NmDRKm5M8Fr276EPZQO359Ka0OVE012MQYbl3kBqCpzWBFS3C9zxXJV9L/tQmawEAOHlRhRJgLBbau4z3h5RoBxwUDe6fHuJfGOlxac47Se3QXo1+1W6YS5B03w0IQqYUf8m4fK4aJzrNA9L/zC+qr4DPIRzYlBYmZyjAeiMQSWf2dZ+4kFLb1A7FSiUVw1z9Nrrx0IjisOovaUgTQPAhqIZkuW30QmN4dI6CCQIE+f9ruFZ3kIEZ3NAIOgexj504LlPEzDNGd81dABwkbHhdFN7hKI7duQMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DeHaMMvFOqxOkESfpOQMbNvuPqgWjvBdIjraCg0PN5M=;
 b=EpYcuNunX2cfnOycgEsIlWTXs+B3ZJN2YK6Z4CnVFn2mXtUrul5YSOjYxD1pZxRu3AMU8ELpf49awM6n78J/yNpdirZOhq/5vYvV6dgC5DBps18kqrd4pHpzVm1Dqopj4psolDwQULReaZtdjIP9/zm+Z19ETigEA9VP/qO6YWwlxqtzO/GM3Pqgt5W2Q54WR4uIbcTdZ1T1fZPfL0gpIwCnpMnnDKtMQ609OEek+vEkqw8BFfolo0KqmjEyCDxzfdPog3zwakMY5opCz/Kq70o0z0DPJm7wIXNg2m/3LnmiayxAWFY0r5PFsj6cyd6WpGemmSnWwzsaE1OwXJNifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 02/18] VT-d: have callers specify the target level for
 page table walks
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <6d01a401-ac53-d4ca-e0ac-165d045341af@suse.com>
 <YU3kedkf/mSsGcpD@MacBook-Air-de-Roger.local>
 <91745efe-129b-4851-87a2-93eea8f6d63d@suse.com>
Message-ID: <3ba86d34-1e24-7b29-658a-34d8ff7c862c@suse.com>
Date: Mon, 27 Sep 2021 11:13:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <91745efe-129b-4851-87a2-93eea8f6d63d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be2de79e-bad8-4760-1405-08d981970705
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233598B6DCB48D1FCCC31965B3A79@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6repov2BftTXMvpPlYoMaxymDGB8dLvxNs67n9U7rB+DL519LVaUDtsQM+/AXr+oN8/1cZnaVzjfUKSGf0Kf/jPP9LqNkiofk3jiESLT2BKc/byJBIp6lyRIHW9TonbnmoXiv+uPdstaywYbSp0A23j2XCudjLmvkS8FB0B28aI3IR0TGdLpb0a/G9eLuYelP9fUSVDMjoD6Ll2rCNpM4N4OvSphRQh5sR3LSbSf1FC7u+9oLB+c9CxwMrSCbWldRJ3dfLMyknE/XaVTTp2SpJMKNlIQlRyd50ijwU/afkzoVSik7xLXkb2GDtan0CrAE5ZFLir0UnOvmyLsyzGfvbwai6nnybCtg22bFY4sTZYt+hMhhxvlmP2NsLjfltpXktPuDCtEfoqeh+720JBeJAip3/hZfqAOaI4WeHvCy9gHMobN0aOhjkjlT/1bBQTaz5MQluZtNBPj9Jt2J/9h4iBDWkpALu288wRW24mlgT2k/tepQ1gvR18ZW70f7OTfAbwA7oVHqzaI3hvE5YWXa9fFOf1ozpXVmPHxsUSpKy+EKQlCPBl5UFjlTScAYKd6uEDqEJjwvDLNNK8KR6dR1QTOA/pUr/3Wqb40DPGwx9nZAp8xL0guXL+CeOTI3KbB2iwfp9EmAi79+hfyBeEqbl1ru4efns+FoUezP90OXZb87b6U/9KQ8C8HEQXCpswmoPLsE9DefRQoSdy+3frzohXystqvKOVTnUw5+z41ysKc7xFuWwXMLF4TtcTvm4bK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(36756003)(110136005)(86362001)(2616005)(316002)(83380400001)(16576012)(956004)(8676002)(8936002)(31696002)(53546011)(186003)(66946007)(31686004)(26005)(508600001)(54906003)(2906002)(66476007)(66556008)(38100700002)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ar0cM/Ek7DtnA28WPLZ5d7xg4ardWAGtzaAaCHaFbaqu8FqFsgrdvW3H+UNr?=
 =?us-ascii?Q?/diRrFy638i7mAk/CaCc8NGqcZVJYwRnAEQBve6II81VaLyVOXQHW3puxfL8?=
 =?us-ascii?Q?u52k6PzQBZyeOQfHwnNl8VmICkw1majOe+6xRFOiR+UXbCLx7SX83ChY39/9?=
 =?us-ascii?Q?d36neO2MuliNkKTKJlR0C42noybmy94rShc1Ky9ptZRwdcLgHoD04asp9qVo?=
 =?us-ascii?Q?eyoHluMaSe38PtESt55qwAIPQdJLCCIL+RG60bl3d6jSMG9AqrGI4vUWVyXX?=
 =?us-ascii?Q?v/W19YHXMBJRG0IBldIHWkLyOdnNFVlxflI4TvGiUO+UD+zk+evn6k5EcKQe?=
 =?us-ascii?Q?dw/1hSVJjGRuadGD1FWyk8doXUjU5ME1Dz6X/pSMiGXrxDagEBLqP6g3RrkD?=
 =?us-ascii?Q?z03ZhwfK7B5qlHk492+/vwJ8Rvkv3QzVYK+BTY5iKTGz9tfNVU2c5s++9AJD?=
 =?us-ascii?Q?AwcFrVmHnlJyOxxfQ9jWyk+tHqSV6iI5OQkvr/cuFG+8LrnZS6ubRqEzvqN6?=
 =?us-ascii?Q?sIdWpROMjfXVnBaC2JHdW1bZVHg9x0z3z1bYAJkj8NMNHe/O1JHTnmXFuH4C?=
 =?us-ascii?Q?B+atoyl8R+RPFfELZYAe8m6WtoXbiW+ea5lXv3wRIPGyN6ASK0TodDb3oayr?=
 =?us-ascii?Q?7ubo0mOQuMLsqjKoaPiyB5pntqV/GcrKiiEvYpj2HIiLdo07h2AfOTKy83aT?=
 =?us-ascii?Q?dhLheAvpcoPruEsJW8e5AQROBjLUsFUd7WYWSp2yVEFkq1v/Cj7QwwCWHYth?=
 =?us-ascii?Q?7YBwBs1SFTZZ6zPFk4QdcMh5rAdXanOM0+r/gfEY286PKvIWwAOtnsD9o2B7?=
 =?us-ascii?Q?S6h1EgAQidXJWBh3TTnUKbEB++JBeVKawKnjAXNWcLd7CccM4Qid1/2QuVNf?=
 =?us-ascii?Q?8R0Ct4n1tgZ/Wviin6tLCzaa4tPLgYSQqIvjssSQcY3lKpzGAQYjKEEconcC?=
 =?us-ascii?Q?70lRPP+xyR6tWGC0dzmxlueY1WqzRhGmW9GdPZ3qQIjyklXPasY/VrI7/Uc0?=
 =?us-ascii?Q?6fwpnPbVOm+j2W130GsfyNxsYkj3q2Arcmgq0iWO+67QmsgDOUZ4jmYc8Anx?=
 =?us-ascii?Q?ku6e+VkDaqv6pMKxjkDYb5U/A1RdjHpIAuZrI4FLprjwnSS7+wR4dK/WUj2G?=
 =?us-ascii?Q?rjSWoeFbm+oaQ1ELGxJUh0EuKjSCwZ2yeFpouzc0RKn+Lg+f096Vd7B7UE/A?=
 =?us-ascii?Q?8dE/wmyZtOIXw+PX2Mq/CiTV9dT1ht64+hhHe/bBMWoP9oekxL2eY2zdcvvS?=
 =?us-ascii?Q?0ArMhzcaPkQUpmGExV/mq9JO5Zu1aMOwHd4HO6QEaZYzEhdJb3lHHviMNdOs?=
 =?us-ascii?Q?ipGPM3FmCHpBsFvVGsKEHKL+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2de79e-bad8-4760-1405-08d981970705
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 09:13:10.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASqW5eVsvLS3W24W1baRY6BjW1Uq4ItVi0isfGNv2dUyAXFSavArh5M7VTRbfLZoZNZZ8tAu6ZPZPUcBZRpqXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 27.09.2021 11:04, Jan Beulich wrote:
> On 24.09.2021 16:45, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Sep 24, 2021 at 11:42:13AM +0200, Jan Beulich wrote:
>>> In order to be able to insert/remove super-pages we need to allow
>>> callers of the walking function to specify at which point to stop the
>>> walk.
>>>
>>> For intel_iommu_lookup_page() integrate the last level access into
>>> the main walking function.
>>>
>>> dma_pte_clear_one() gets only partly adjusted for now: Error handling
>>> and order parameter get put in place, but the order parameter remains
>>> ignored (just like intel_iommu_map_page()'s order part of the flags).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I have to admit that I don't understand why domain_pgd_maddr() wants to
>>> populate all page table levels for DFN 0.
>>
>> I think it would be enough to create up to the level requested by the
>> caller?
>>
>> Seems like a lazy way to always assert that the level requested by the
>> caller would be present.
>=20
> The caller doesn't request any level here. What the caller passes in
> is the number of levels the respective IOMMU can deal with (varying
> of which across all IOMMUs is somewhat funny anyway). Hence I _guess_
> that it would really be sufficient to install as many levels as are
> necessary for the loop at the end of the function to complete
> successfully. Full depth population then would have happened only
> because until here addr_to_dma_page_maddr() didn't have a way to
> limit the number of levels. But then the comment is misleading. As
> I'm merely guessing here, I'm still hoping for Kevin to have (and
> share) some insight.

I've extended this post-commit-message comment to:

I have to admit that I don't understand why domain_pgd_maddr() wants to
populate all page table levels for DFN 0. I _guess_ that despite the
comment there what is needed is really only population down to
nr_pt_levels (such that the loop at the end of the function would
succeed). Problem is that this gets done only upon first allocating the
root table, yet the loop may later get executed with a smaller
nr_pt_levels. IOW population would need to be done down to the smallest
of all possible iommu->nr_pt_levels. As per a comment in iommu_alloc()
this can be between 2 and 4, yet once again the code there isn't fully
in line with the comment, going all the way down to 0.

Jan


