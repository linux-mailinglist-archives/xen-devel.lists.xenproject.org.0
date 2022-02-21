Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9568F4BDA91
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 16:32:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276329.472458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMAfG-0006kP-8l; Mon, 21 Feb 2022 15:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276329.472458; Mon, 21 Feb 2022 15:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMAfG-0006iN-5Z; Mon, 21 Feb 2022 15:31:50 +0000
Received: by outflank-mailman (input) for mailman id 276329;
 Mon, 21 Feb 2022 15:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMAfF-0006iH-3o
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 15:31:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61bc446f-932b-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 16:31:47 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-17qGHCAWMGiN693-Uthv9Q-1; Mon, 21 Feb 2022 16:31:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8848.eurprd04.prod.outlook.com (2603:10a6:102:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Mon, 21 Feb
 2022 15:31:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 15:31:44 +0000
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
X-Inumbo-ID: 61bc446f-932b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645457507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRZEcBrAC7IGwEmJrmesAv8oAgOCtQTmkNdtX94df0A=;
	b=TqzSNuiSiNRVZxlhuZjRQufSZLC7fAmMpgBEgHXWrdxNN2Q28s110uKu4ZmlcJEQVeBxMe
	M0eglg03Mk2sTva40T0UXAQWb+L56CZ81WXqYF7O6lujpv5uHfn/IUx1hM+pgtKRdoXx3c
	NBHNu1H1hDH+7kA5xhP4fpf/NBOIGf0=
X-MC-Unique: 17qGHCAWMGiN693-Uthv9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/BtWwfJmmktCCI8Z25RalB3Tt8Z6mUlhYzLu1dJl7ILcGLwBJ1N6r8JHixuGrrK01nJDS4ilXDBcmc7CR5avSvuTM6LMn++0cw7jo2A3V1rpxa+r/he7bMMLEPlRIY+yW4Jt7JfwAt9fJxHm9qgVpWwrtAtvla2XWwRrOsQeAoI2K/gzBUghincLQL3EASwZTeQhG6fm5S3pGiu+SdJDgsejvxHg4lmD+0Er8hoO8/7fRm9C2VTlvnIq+ALdpRoW4OE3WfI0At/2rAxPOD0OSOtrko/3RFp23i8LjpKlh3LKX8ks+cTEWihCnxF99WqvJP+xJu66JTtpVlBjNRAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRZEcBrAC7IGwEmJrmesAv8oAgOCtQTmkNdtX94df0A=;
 b=QAsET4po73mtZcHX0xJFhuCFSdZKrxxsW5nsn9/6GyJKzMJeRia65g1TCkljDiW6O14nKdrJD4vcNAJqeI8EagiDvRpy5aHxf2dPWX30FfnixK5AVcwm+mrSxYvjZ+oX2DZ4wLDPceuBHNI9UjP1HDRn2mHzijrgCc4JU5D1t9XKlxYCUZlvJCFmP7m+EU/3pKy6O6gC7U+tMRva/gHreMFe8ONUPQLBMX1Uo20kpH4Q8pxJkd94NjBjZ8m5R33+SUR/k7Jd0WF1q09Jv9WjwdNGoda4bVt2RVIdkr2cnBcbYZn1CakqdBZHmYcgN4WfBi0/pKWL41n8pBlinzHmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>
Date: Mon, 21 Feb 2022 16:31:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
 <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae52f283-29b1-4da0-6448-08d9f54f43c7
X-MS-TrafficTypeDiagnostic: PAXPR04MB8848:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB88486B2D15C5BDDD950E6CAAB33A9@PAXPR04MB8848.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LcjKLVbyLeK/CKMPQ6qLvyf2qLEIh9IMcoIDbaALZcZJwGmd7eHgPX/8pnBYs9wAScJ9K22d7GO4r7yz/qz26WNWpcN8w615n2f5FG6MV4f8QiBZMmZdPnTqBnFSvN+ms5e4k2m9thJw/1kYob3Srh7TzX9Yo+qUUYLzHvKDxcj5RoCmKSIzlXKHWgx1sniq/pw987GBTEhW3DMCaIirEUoueERR2JyRDv/TC9/H9l9g4h/T2Kol1eVHm7DZ6fme7F9Fboi1tDF2l1Xqst4jO7krQztJx+r3sH9I7/vB+0hhvLBh9CyRpwm5Xe016GLw4SAWQWiW0jYItOV/dttXz0kDKxptj4q9LhVo75WYAYxcOA1M3kIfnwajkfy0QdMzh+CK5dLbxsNBB/aNUZnrTc3M49m/ZCyVH/a1pdUOL3g7CYOKPzbMKl4T/OihPCmOXWxV8vui/AIq/uBA7ms7PWYePavYziU89KI3h3c8knoQwpnYtXHZbcpx+2PZ5oEkap34FJeTv8WqEAwyhSBDiyKqOvVPQhL+Zucx2AHqQ1A2GLG/E+NODqVgklbW6L2y33Ltwj1QK2fMI+ekvzQy1o+x2ttDLjD6CndlhmGPT9H85lPxbphxNzdrmYHE4aMQUgCc01xg8nkccz9vs4JPur/JDfQH5HCevj/X7e8ne1d9e/Wl0AnRL2lIEWNj7KBiFIjlaIpTCstC8NKUjghnApJr/MDD2fQy5p4D+4fkMvo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(6506007)(4326008)(38100700002)(36756003)(66556008)(186003)(6862004)(31686004)(66476007)(53546011)(26005)(6666004)(6486002)(6512007)(8936002)(508600001)(5660300002)(316002)(2616005)(37006003)(83380400001)(54906003)(6636002)(31696002)(2906002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUg2UENGNVRGMFBlTVZDcjN4Z2VPT2lIdysyT1lSTDZocnJ2eG85ODBtTisy?=
 =?utf-8?B?RERTWFBRZm9xbjNFRnE4NzF1WGU5TUpkTFFFbWVIZ0JtZGVSVnFGU1FPUjJM?=
 =?utf-8?B?YVc2MGhMQmhBOG0xYWVVMUZvaElxNWU5WDYxQXV6UEhTMGNzOUNtZXRmM2Qz?=
 =?utf-8?B?SGpuUCtrMWRxcXFRRXRQTGNPdUZsalFDK3hKNmlEZG5sMHNycEpIUU9pNG5a?=
 =?utf-8?B?eGVJaWFWNXZNM241UEc3aHQ3S3VqSExlYXhIZWJqQWYybGNKVERZOTg5elpD?=
 =?utf-8?B?YVEzN1hhaGZudDVGTXVnZlI5djZ2K2pXUWxXaEJNVERTSVFURDArb3pTOStL?=
 =?utf-8?B?dkY0NDhySjFLZlNDeWY2SEdsR2hRa0htbDlHRUlaYnl3bDhWRy80MWtXbnFz?=
 =?utf-8?B?bGFlUlZyZVllcWpDQXFvS0FMSENGQStUQWkzMjM4cmZUWk1LdVFLdnBLU1l4?=
 =?utf-8?B?N2NCaEZqd1Q5OWwyVWRiM1pjWEN2OWJTMkxhYjJRdWs4T05xL2lyMDNlb0lp?=
 =?utf-8?B?Rk1BTTV6NzFZL29ONDkrcXNlYzFqbGRTTndreHA0WS9HUXp2Vy92ejg3MzRx?=
 =?utf-8?B?cnJHNnFnbDc5T0RrMk52eWQvaldlMldPcTlodGhkTzgyZUR6Wm5NUm5LTzdz?=
 =?utf-8?B?NW1oMUt4TFMrb29ldzByYzdSOFNZK3orMzFwUVZDWGFycjhzd3J1UmVpekt6?=
 =?utf-8?B?UmpnM2V0SmI2R3AvZkVGMmxhMTJGNUJ1OC9qcU9tNm9XLzV6MUtGVXhiZkxU?=
 =?utf-8?B?ejY2NjBKRkF4TDNZbGo3dW1BMWF0b2ROR1k1RUR1MlByOVJYNTMvNVRIM1B2?=
 =?utf-8?B?aXZhRnhvblhhNXMxRHNuakt1a2NuRDljaTJ4aUoydS9TMnM5ZFBOZndyUC9C?=
 =?utf-8?B?R1F4azJOS05QZ1grWVMzbk5yQ1dWY01pTmZiL3dwVFNwUVpJTmhsVGVuNldz?=
 =?utf-8?B?YkF5RTlFRU4vVkJ0MmxFTlZFaWJvUmhZaXpZOStkOUo5Z2VLU0htak1KazN5?=
 =?utf-8?B?MFJVd3hMYnJjWWZMak9GNVBheTYraVV4a01vSFVMaHNpaGw4RUhPblFBQmtF?=
 =?utf-8?B?NUM1bEhHekErL3g2MDcyZUxqL3laOTVhT3JYa3ppMmJod1Zna0xXUTZRU0Zi?=
 =?utf-8?B?ZmJ3d2tKUXFySy9WNVRoMGpRQTlFUVRWL0hWS2RpTS9wU3ZCTVp1NGZteGUv?=
 =?utf-8?B?SnJqMklSVGpyTVVJenBwZ200UC9UNUNxYmNsR1BLaFRwQ055by9lNlJZR1Ez?=
 =?utf-8?B?bVBsSlhwUW5Cc1VPY3ZHMEo1N2xES1YwNjhidEJZSk1YZlBabzBUL25IazZR?=
 =?utf-8?B?MHp4SWVwbjhUMUlMZmZmUGdtQWFBV1VYbFYweE8wNk9oTTlrcGhaNU85UkhS?=
 =?utf-8?B?dnhWUkNNem5NVmcxMlVhUW1BbCt0ejlOU3RNQWZKOXVLRkVYU0VkSWRpYjBq?=
 =?utf-8?B?c1kydXRhN0dSUlg0em9DcTNEMFhXaXAydjhhaGR0MkZNdysvMVBKeGdSVUJ4?=
 =?utf-8?B?d3ZDcFkzb1hBWU9XSHBVQVgyZWxrai8vRzlsYlBOMFdCS0kyUXFHcWYrU2x5?=
 =?utf-8?B?RVVPWnlzU0xUSFd5UklGejROTUtyR2M1TFIvTmhPNHQ3YXBvN0x4MUtwZitp?=
 =?utf-8?B?cE9lNGJpalNwSnRocjB1aWtYblVxck5IK1ZFc0pGU01nT1MrWlRSbWk0OGR5?=
 =?utf-8?B?b2JvcjA1U0swNlRNVmtYQmV0a280UjIwSXk0UlVFc2VyU29CQ1oweTRLSHk2?=
 =?utf-8?B?T1FnWGZncnp0OCs1aFB3MHJGR2hDdUFRWXI3RVpROVk1ZG1WbHFrd3RFRmV2?=
 =?utf-8?B?WDdhZnFha1Q0eE9tS1Y2eHhTK3ZtQlp4bWh3RmhuOUxMNW1ESFZjeW90aHMw?=
 =?utf-8?B?ZkgxZlNrSk0rYVVqbXl3TVJpOWZDeWRaQ0dzTXQwNUNvUElRNS94MVYyR1NW?=
 =?utf-8?B?b09jZFhOSkhoOEZEblh4NmxIZzFzdlZPQ0FWaDlxUUVKa1BCUjFyaE1YWmg1?=
 =?utf-8?B?MmFlT0xFOUgrdmxZSTllNXZhdWdod05MVnExRmRubHhOaTZWaXVrNXlkVHRn?=
 =?utf-8?B?K1NZNCs0ZFNudm9RYjJublRBRVpBZFQ5dEF1YVJnUmdoTXRORFNRdHZyMG5S?=
 =?utf-8?B?c09EeGVxandaYUZjakRQSisrWHozWlgxb3BzaU1veno3NVExM3owUGlkUnly?=
 =?utf-8?Q?rUTAAbNtoKF4swI0GnO/DHQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae52f283-29b1-4da0-6448-08d9f54f43c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 15:31:44.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ScB/ioBbXZ/NV9sj/r5Zz0IoO7Ba3BqhbAQBu7Ta7W6BYegQMnzEiPRc8Sv9NPiwJ39RJSp+BPnsMhj+KqxIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8848

On 21.02.2022 16:05, Juergen Gross wrote:
> On 21.02.22 15:31, Jan Beulich wrote:
>> On 21.02.2022 15:27, Juergen Gross wrote:
>>> On 21.02.22 15:18, Jan Beulich wrote:
>>>> On 21.02.2022 13:42, Juergen Gross wrote:
>>>>> Providing a macro for an invalid grant reference would be beneficial
>>>>> for users, especially as some are using the wrong value "0" for that
>>>>> purpose.
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> Over the years I've been considering to add such to the public
>>>> interface, perhaps even more than once. But I'm afraid it's not that
>>>> easy. In principle 0xffffffff (which btw isn't necessarily ~0u) could
>>>
>>> I can change that to use 0xffffffff explicitly.
>>>
>>>> be a valid ref. It is really internal agreement by users of the
>>>> interface to set for themselves that they're not ever going to make
>>>> a valid grant behind that reference.
>>>
>>> As the grant reference is an index into the grant table this would
>>> limit the size of the grant table to "only" UINT_MAX - 1. I don't
>>> think this will be ever a concern (other than an academical one).
>>
>> That wasn't my point. Limiting the table to one less entry is not a
>> big deal indeed. But we have no reason to mandate which gref(s) to
>> consider invalid. A guest could consider gref 0 the invalid one.
> 
> With the gref being an index starting with 0 (gref 0 is valid, as it is
> used for the console ring page), the natural choice for an invalid
> value is the highest one being representable. A gref is of type uint32_t
> resulting in this value being 0xffffffff.
> 
> While in theory a grant table could be that large, in practice this
> will never happen.
> 
>> The hypervisor doesn't care. Imo this simply is an aspect which is
> 
> This isn't true. The hypervisor needs to allocate resources for being
> able to handle the highest possible gref value for a guest. For a v1
> grant table this would mean 32GB of grant table size. Are you really
> concerned we will ever hit this limit? This isn't at the guest's
> choice, after all, as the max grant table size is limited by Xen.

If we're not going to hit that limit, what's wrong with declaring the
entire upper half of uint32_t space "invalid" for use a gref? If we
won't ever go up to 32Gb, we quite certainly also won't ever reach
16Gb. Yes, you probably already guessed it, we can then repeat this
process iteratively until we reach 4kb.

>> not in need of pinning down in the ABI. Yet if it was pinned down
>> like you do, then the hypervisor would need to make sure it refuses
>> to act on this mandated invalid gref.
> 
> This is an easy one. We could just refuse to have a grant table of
> that size. I can add this to the patch if you really think it is
> necessary.

Since grant table size is measured in pages, you'd then have to
refuse use of more than just that single gref. This would still not
be an immediate problem, but demonstrates again that it's unclear
where to draw such a boundary, if one is to be artificially drawn.

> TBH, I think such completely theoretical concerns should not stand
> in the way of additions to the ABI making life easier for consumers.

In case it wasn't clear - my concern isn't that sacrificing this one
entry may cause a problem, or that we'd ever see grant tables grow
this big (albeit for the latter: you never really know). Instead my
concern is that it is conceptually wrong for us to (now) introduce
such a value.

Jan


