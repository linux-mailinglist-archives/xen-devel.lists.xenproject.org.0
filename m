Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172F42EEFD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210263.367047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKeb-0000Ly-2P; Fri, 15 Oct 2021 10:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210263.367047; Fri, 15 Oct 2021 10:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKea-0000JX-VF; Fri, 15 Oct 2021 10:41:32 +0000
Received: by outflank-mailman (input) for mailman id 210263;
 Fri, 15 Oct 2021 10:41:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbKeZ-0000JN-V6
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:41:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74a0ed4c-2da4-11ec-822d-12813bfff9fa;
 Fri, 15 Oct 2021 10:41:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-aVRJ4kwoNjG2HdeLq6YHrA-1; Fri, 15 Oct 2021 12:41:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 10:41:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:41:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0041.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:41:25 +0000
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
X-Inumbo-ID: 74a0ed4c-2da4-11ec-822d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634294489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8OGBE07PelvuHq6WePHCT6UYhKQsplzwayZfVdsyXc=;
	b=RRT8Ym5BNX/yJWx4oqQdHjQi5yA9hZU/uLdUCsYfFfCWZ4HjTgtdxaE+gfi8Opqe3uLrwb
	t4HUxhv2lxlxdidGxMqRX3K1DunaqeQtG/kgBsghAjkTMk+CsT7ZeMCOexaZ8SfYQw8W0K
	wRprLqNPbSmoLrYBBRtj+9M1gzW8l1Q=
X-MC-Unique: aVRJ4kwoNjG2HdeLq6YHrA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0c9navOkUScl9KwlSCVd77zbeDK/18QxBeEBsJCRRV5Q/yo66PopJ+qccsk10h+dqXeZmgGOem2rPVhVLydgUOatQ8SjXybVQVrSIvCP1Kf8lW/ynkTgQEY1KX81eFUo3/DAMwP7DGeN5AXGYhGg8IaZghs9EwDnDDcGXZiYFA3e4s4VeHmzIrII9yg57M6GC7O33R52Fw85iwJjIjGwcdpVTMaXEPo77HxTV4pxNTLXe5NrpU7MdnLlzx7M4LoFxFjOf680/hvtiRSZH4PPbCXKKFoMH9mUtHFFKIofnKUigwjdDtYw9U4Mh94lPxmKEi63mWDqoFu6eBah87C6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaoPH3CTf7RBPOU2dtXrvzoOfvYv94QQZDguNdtAm/E=;
 b=MqmK9ulRZ+LYKq7PKoJLOD8wK+cVVie3l9iqB2mkhMa1DoN3+ZPv+vUVJVumHS3mb2O0pjTqiR7RhSaUXFuti4j6r16drJVdyAGzlGZ6nyDdDecBwliB8BOLlebXKxbicUlSt1y8sVHY1yG+3qdOqQ77YUFKB2elR8ubhRfdJQxmZ6kU83lbBN0q7j48T60B53UoERljRwlsjVf9HlR8i9vqNljEgNW8B89jWH9iVoJw7QQGjd0zIdWVCNdMmWS7bC9BC7HBQBZMkaqZKX+sSCWmadRiDUrjC0obH0NR4SUFyUCphZqnPNdStAFH5aLpnk8rDfBpHf2BjWXhEJ5LWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
 <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
Date: Fri, 15 Oct 2021 12:41:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0041.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97185701-d385-4a64-a0a1-08d98fc85707
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6671FF376D26E03D57DE46CEB3B99@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRvZg1qWr3bp+excY0BUNcmQIgl2YRElOd9K+q4Lg2eyq99T2NdUa1rehX3lr5dkDdWw1tX/toAPElCLLfKzLaU512X2ZMEA3ZMJrLvrQlWFWtADdzMi7lXUsBUhRuVRD1pHBLCHwMuZMYdkGOZFYInxctF8UUtUmHu9aNEC/ftf8J+HF+fv06nvUrm1OvhqKh7eCqzF2AHp76LvDCy05Ie/8kS6PFDsGivcww4ns3KuYqeaXJ5CNtvYPRvA7Tj6tvf34DeCkPLCmCYRgOZzl/r7KN36UXMlHtrXge0eirtF69pbiC6Hqk5//fYsJZLMUJj5dInkzEh6vOqbWxr3hsYE96+SrzGzf2rxLIuaVCx3Ns7zcXFwcMmIBlx0gj5PtlcxS2OWHdphRFuJIHPewQc0mOg+/CErdM3rmN8zQOFYR3pi6O54DkDq94M+E4PeDhJsZSffL88c8U6EmcdG6oiz5tuEK1acBUVQncVwW1vSCFkQZRszECHFrbqck8Xmg6XEKhE676yomLhC7nUpdNDHROBrUrONHXUPKc5NjMEtNgljw5KUmErfVfS5HrZreBSNM6j8paxKM6ReGiXj/0ta/0e44JsOHU1MvtQ4cErQ5xe5i/tqJJ+ns4jxuFkNtYmdKbBKrRI13V+vI7NqMlNE+GQvMA21RO/s3whViC8skcKvmSYtJvbMqMW0ypEVqBoDdEePQ1AJkSoIt69egvpBnQMLwEAPqb3uIwKxxQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(66476007)(6916009)(66946007)(8936002)(8676002)(4326008)(31686004)(66556008)(316002)(508600001)(16576012)(6486002)(31696002)(38100700002)(54906003)(83380400001)(26005)(186003)(7416002)(86362001)(36756003)(956004)(2616005)(53546011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NDAMCmGAmZyU7U2+PugEmxZ8aCi+r3a6gXXp3aomKsMHOXvBGoEjBA+2EmVJ?=
 =?us-ascii?Q?/GIagLW8JraWcO/nJlNdeWi6u3XSwuD51LgPo1l5haG3p6LQdTtoSs5jy2mT?=
 =?us-ascii?Q?BIoz297GHoDI98DBiOLDDmKYBv5FA7EgrEEuCKxxk3P+Xzl/32S32BWaT077?=
 =?us-ascii?Q?1sbXSGhuYfSpjb5B2Ukl6XRDak9NccO6cmYEPjOVUThV8+fvaKHSJji1ZJTI?=
 =?us-ascii?Q?b11/xWAm9jDDAeEYzUOEpGjul2PnG4AFGH9NHbBe60/wj3A8BVIn2XwP3CU9?=
 =?us-ascii?Q?FUyGUFCnHNnp97psmNuNmz7xeGHZ+Ae3wYclgxz1S4vZHsaV754/xeDT/jv3?=
 =?us-ascii?Q?z3qx+7MNG30Og8yQTZD8wnxmg9pn27PhFgi8JfGTknTMiYhfahuHxoxXA89m?=
 =?us-ascii?Q?wmIfveWq0ciIo10nS6tSqJEPYU/1ST65Ka9IjIUR43Uj677+tMkvpqHi1mXf?=
 =?us-ascii?Q?h91YBbAdt24pxqCkPwjIUUVx1YGc7Ic//gjcIUjDLeALDRPpJgxhBEkBmtv9?=
 =?us-ascii?Q?FJ5vwZePPBEU1oL9ra0WwtCYDgxe9JAumW+SeyoPN9/WVXzA/prUkPtJXlCk?=
 =?us-ascii?Q?9uVRLR8oRxMXXV9SB7j/58GONNyV8U2/XUkyxlFezqIwf8itl2xqLTpVjl2l?=
 =?us-ascii?Q?vc96vrxbAZmX9+H1o7eExBwlf7Hdlj89xWCMKQ3jMF7bORy6oti7MSNCUMG+?=
 =?us-ascii?Q?Ux9mqwec4/zuJef+Qe113MaZ1lyCD06hFfurn4ISKKwcKU/xoEn2BDffHGDd?=
 =?us-ascii?Q?j7GXPxvaiY+YGMYzUp3QOLG2VGU2kja5w2KX37DpzWayBrvCbg7ddBvRkayf?=
 =?us-ascii?Q?Kq/qJ2y56gdlQPNmmh5n1GYhpEOpHqPro7toQN0yX3AUe5ffhonlCkcqXzhd?=
 =?us-ascii?Q?P3augtiPvfYA6uIogdAPA2qYaw6KI0znwYlL96NQjMXaGdGUK+CNkANQHH2o?=
 =?us-ascii?Q?YzAtVKHhpTwui5Svo+zvW7WpvSWM1adoiKKSOyRbANerJZbNV/IKmBYgUYCw?=
 =?us-ascii?Q?jnnRl3JNPDqvGLpZLl8Sq5MWvnRswjlLSmpKWvLsN7g1bBH8Hr4OaXhVQmBH?=
 =?us-ascii?Q?veQ2NUIs9JiNBUgth1NM+6iO7xhmeaHrVYj6ofktDxrCI+vgFikONWF6n6yZ?=
 =?us-ascii?Q?RA+okoW2qccspKZ40N9Fn6epT8FOYoNVtoVXuni9wyQdO+mb+Dt4IbpgoNvJ?=
 =?us-ascii?Q?2KhyKCbq7RM1f9BH99VpAcM7y3Ivsb7Sn/+JGZ9I8gLxSzr9zLT3ZZT7L/Os?=
 =?us-ascii?Q?Q9ZMCmWyKiWtRQFUGroFbNTbw4VwZEf63MKPIj5sDpjT2NeJm+iIU5KtRr8/?=
 =?us-ascii?Q?D+cM4lR4FIa8Oy+pPzeS+fYe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97185701-d385-4a64-a0a1-08d98fc85707
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:41:26.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFUZAWlrlmsP42ko/y3xOL5Y6ziB2iklphfDj3vADWObiVbUZ9jyVxvfkBK0yMBK3x1qwYuFBqBb2mlD9Kn0Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 15.10.2021 12:33, Bertrand Marquis wrote:
>> On 15 Oct 2021, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.10.2021 11:52, Bertrand Marquis wrote:
>>>> On 15 Oct 2021, at 09:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>>>> On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
>>>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>
>>>>>    check_pdev(pdev);
>>>>>
>>>>> +#ifdef CONFIG_ARM
>>>>> +    /*
>>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci h=
andler when
>>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>>>> +     */
>>>>> +    ret =3D vpci_add_handlers(pdev);
>>>>> +    if ( ret )
>>>>> +    {
>>>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>>>> +        goto out;
>>>>> +    }
>>>>> +#endif
>>>>
>>>> I think vpci_add_handlers should be called after checking that
>>>> pdev->domain is !=3D NULL, so I would move this chunk a bit below.
>>>
>>> On arm this would prevent the dom0less use case or to have the PCI
>>> bus enumerated from an other domain.
>>> @oleksandr: can you comment on this one, you might have a better
>>> answer than me on this ?
>>
>> Well, without Xen doing the enumeration, some other entity would need
>> to do so, including the reporting to Xen. Obviously without a Dom0 it
>> would be ambiguous which domain to assign the device to; perhaps it
>> should be the caller in this case? That would make that caller domain
>> a pseudo-hwdom though, as far as PCI is concerned, which may not be
>> desirable according to my (limited) understanding of dom0less.
>=20
> This is not really related to this patch but the plan is the following:
> - enumeration would have to be done by the firmware or boot loader before
> - xen will have some code to detect PCI devices
> - dom0less can be used to assign PCI devices to guest
>=20
> Anyway does not change the fact that this must be called when domain is
> not NULL and I will fix that.

Since we now all seem to agree that the NULL would have been a problem,
may I ask in how far any of this has actually been tested?

Jan


