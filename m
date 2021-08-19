Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB23F18AF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168589.307809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgj8-0000nK-4m; Thu, 19 Aug 2021 12:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168589.307809; Thu, 19 Aug 2021 12:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgj8-0000ko-1X; Thu, 19 Aug 2021 12:00:54 +0000
Received: by outflank-mailman (input) for mailman id 168589;
 Thu, 19 Aug 2021 12:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGgj6-0000ki-HF
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:00:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5525305-1a37-42c3-9205-81445b4385db;
 Thu, 19 Aug 2021 12:00:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-vs7IynrqNsaKXg0emsb5SA-1; Thu, 19 Aug 2021 14:00:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Thu, 19 Aug
 2021 12:00:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 12:00:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0120.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 12:00:47 +0000
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
X-Inumbo-ID: c5525305-1a37-42c3-9205-81445b4385db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629374450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6E06ProHw9qSsgdiUpk7LEn3Mv9nFwIHSI2203KSsU=;
	b=H8rQ+BW4rwJaXWdpSh+CWhKHgsa53/yw20rd93S6IAOdLDwX14HTGK6i/fN5uaphEcgE6Y
	IDwIXnCPAW5x9lp+Kdvdel7YLANbQAV9qzE77o0BX3+IbB2c2ubL6aQ8yb+9bMoWPRoOjd
	ORh4RnDyuc0CIhH916xJU0pO39f2jo0=
X-MC-Unique: vs7IynrqNsaKXg0emsb5SA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g91OBcpZFItG3VXpu/CEXDBDx3kDBTRav8/5xvoKkngAjbY1jj02ji8gbEfdULPTFZ+HtPRsN5AMMHLARhQo/p9+UCwPGwciPRLR7YCg7FIcpdBaLacARP9F9eFxNKjxlF/zWPJYQIGiAuupvkiQiX7akJCVlvwK3r5wvBiC2A2+Bf4ZqWiaEziMXKOKqYsAhe4O443OzvqN1SK+RSNRsx6nff3Lsd0h7Nu4803YmTbiFsIPYCOjciafGi0JbraXbeeeEF/4+KtILyO79Oi79wzbD2yQ6sGVT/cHLEIfhmSxrSwVB5oBejK7Pig+fAA/gZLgVT9kN1UiNFyJh501eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6E06ProHw9qSsgdiUpk7LEn3Mv9nFwIHSI2203KSsU=;
 b=JWEOWdpMExLsgI4Tr55joQdjhOgDNHnpvJK906+AbeKfnyXMZXXfK1H99y7x3u7stYPr1NvPKGIYxxLBqD2+K4AJTSyvWpiirOu5bzO70hHlBojDu4pUfJvQa8TF1JKLhswUtvt1MvITSgShL6dcozRahab6ZUNWsE1as7tNxCCq+QN7Zua2D8N8LTaju6RlQIVxD+qpCwOgQHh4nPTjLsqcJ3doxA9YDm/K28tvZDEIX1l2YFHG0jV+OMAG5vJIO2OLYE63rwRTU0baagGNnwGiJGz0T98scpHwdAIz37sRn1IV95t4v6Fi99/UuktNmLQoJkZ6jljIC0Z518ORlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] RFC: Version support policy
To: Ian Jackson <iwj@xenproject.org>
Cc: committers@xenproject.org, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <24862.18072.322627.161534@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d107084b-6862-95f6-0df7-2e3c1b99690a@suse.com>
Date: Thu, 19 Aug 2021 14:00:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24862.18072.322627.161534@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0120.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3ebde46-b509-4746-6da2-08d96308fb96
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35357544A65243AE40F7347DB3C09@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tNac8ppIDbcLteLB4b7IfkBgaQglQPUGQUI8bh3Qkyq56KE5agIkDWXCHnjajz4pi4swB9tzvgBDjXOGPKsiYl/+T3oEOdRxCWXEH+++ejFRfw6ITdv+wduvSMP5ey85DXdLSPkglcpYlqmXG4OVdzwjdugOZ2HsJJ48gL8jkBGo5cZpX5TBwNugclmInHLUX6Ysb4iLa9oL283eyIO+8ee6Hqps4sjarTaVM85hm9sanJE+vcaULO4sXHDzDRq12mcVzRsQWaYbhyIRiY6ZMvZ2XSGZbtTqpY7jZqByE8inCtd0hGyYAjq3AsuObbzhNk9Zk934AU6RQAfkawfvr1Os/452a03GHy4NKsh81Biu2kvgUy6ZuL4UzF+tjjtXGxpVzbyeBCrVetAR+sp+v22R/F/mLOBkV8QZ+gbOp4XBXKMIEIOK44PrVmilCEjDamNt9kKVB7dU0yE2onL/gaI9jNBQjyJKKZKZsAwADHSd9KnwmlKvzp7Hzh6AvHoOhrsorFDdttbNUm/pkuWl2lfZvu4sd4aX2+wzL9pD8QuxYX77RFiRz1wnUWI1wx1bGDsc8gzNMZkVyoc2zISj26B/QDKe8ehe0DPBgIh+UADkY2Q+P5KFvaYouuR9LTnkQYoy+AhAp3fLhEqfMOhJ4mpbSHMGQAiX6rvWokeOsYnCyG8eaip5MZ+yEhHkgJvl6+1BlBgRr3wK0gd8WcPgnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(396003)(39860400002)(366004)(5660300002)(31686004)(8936002)(956004)(6486002)(86362001)(316002)(16576012)(36756003)(31696002)(66556008)(2616005)(66946007)(478600001)(38100700002)(66476007)(186003)(2906002)(53546011)(6916009)(26005)(8676002)(83380400001)(54906003)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW45N0tzc2MyQ2RuK2NkallaVENXbkZOV0JmS0lPMmY1TElpMHRmSlducno5?=
 =?utf-8?B?V0lMcHlBTy9oRFBRVzNSUHdzdGRUbVNhMUI2ZGpOYWRqRDVsUnUwVzVVNThO?=
 =?utf-8?B?UHRwZytWUEozWGwvbEEzMWYrbkRLOWpZQXhydkNON1RuaitXeHB5Mi9kL1hy?=
 =?utf-8?B?NmI5ZW51OExSRUEwcFoycXBqMnBMeERBT1dMUDByU0xMR0pUcEFwY3dpWmIx?=
 =?utf-8?B?cjdUWXh1R29meG9weUtmdTBzb2xiSiszQXNQL3E5Q2E2dlQwa0wySVJGV1ho?=
 =?utf-8?B?QkhFZThIVzVIbzcwaGJwNjFiL2hSRDVvRk5iK3lOMFIyMXpWR2djOEdpYStH?=
 =?utf-8?B?aGxHMzlud1N3SExBbkpNSHNETEV2b25mSCtlVHdlQlpXM0Y1aEZWQkxPbEds?=
 =?utf-8?B?OCs2NS9uNDd6bFRhbGRjN2RwZk1ueE9qZXhXUlZybjM2U2xCVzJtbzFKV0lH?=
 =?utf-8?B?RnJtYmNYemNGWU0wUVlQdlIzZUd5K1JkQzFMQnFKN0x1M21MTTFjc2NzSW4z?=
 =?utf-8?B?eTdmZndaSmo3UnFxWThoTUM1dDJVVWpzb0Q4WE13QllZNjVJWm81Z2F0anhx?=
 =?utf-8?B?cXNvVWwzUXRHWkQwUWYxTmVQZFBhUzBhVGlqRmZLRWtmZWt6ajk1eG85MzQ0?=
 =?utf-8?B?cHdnL2ZaRW9CQ2w2ZWxrSnBnWGo2amxRR1lBU0lDMUFpYVpOQ29xd01RMC90?=
 =?utf-8?B?VXhmNXdlekx6K25oMVJPQUFXcm83RG9uM3QvTTI3ZTMxQnhDOU9TL3RGb0x2?=
 =?utf-8?B?ZmtlUWllaHB5NVZBNnR5SVBWL0t3UXdpRlc3ZTNtMDVDS1QzYUJzNVZuN28r?=
 =?utf-8?B?Qlp4Y1dtRXRlR2FPaTJKeS9yQjMvZEdRWitrOXR3VjJGM01kYkdIcUI3UVY4?=
 =?utf-8?B?S2hFZWdLK1lvRUMyTVJNWFpWckhOZWh3aFVIOUFiZEloK0FvS0lTY2orTHZs?=
 =?utf-8?B?d3VIdXJEUzllQlJ2VU9palJxQTNlSmlscGpkaTBueU85NzBMTjUvTkxJQ1hV?=
 =?utf-8?B?b0dkcmp4ZVFWTzI5MGppLzZrS2RYcG5sbFJXYnhLRmMrWGhsa0lDL2M1aXBT?=
 =?utf-8?B?NEVNZkoySWFDS0J0a2wzWjNmSU5UOEVKY05sc09IRzhVSXdFYUJhQVl5ZGZo?=
 =?utf-8?B?dUZXWWt4ZEtZQWp1VVk5TDM2QTNtczRzZklpR1N1ektCRkxkWGQvRE5tU2Fm?=
 =?utf-8?B?c1V3M2NTK2xiVVlFaC9VN0MwUHhKdW5ncnd2NHpNWi9EdkRJTzZxaHBReitR?=
 =?utf-8?B?Mml2NEViZWx2Unpwc3JyOUlwMndGLzJod3BjK2pYQ203UkFOQmplN0R1c05i?=
 =?utf-8?B?ajhVT0E2L2xoTzQwZWVSMFFCUkdaZUk2dXg5Q2pDUnJ0cDQzdHZXM0NXUm1E?=
 =?utf-8?B?c3NTY2YrOEhUWTY0bmhmK21Hai9nYllBN0JocHlLMUxjZHB2cEVQbmtLNFNY?=
 =?utf-8?B?WWw2RDhoaUxqNFpPVk5JZVFvUGJ4cmZSTFYzOEFQSHdHS1ZDVm8xdW9SNm5J?=
 =?utf-8?B?dXFwZS8vS2VBKzQ2Z0pnOFg5UVJtL1RaSnJVS0hiSnBVWllsUkhlaUxiaVJ6?=
 =?utf-8?B?ZStVRWRIMGRzSGNYTnBYeVk3VzlKcWJ2a1BtaE1oWFIwbzJzaXVUcHk4ekI3?=
 =?utf-8?B?aUlGaE0yWXBpZDBPNUszY1I4Q0tkOFpJN0JzcG5RRlpKVjczM3p0Yk9YN05i?=
 =?utf-8?B?ekNlVTdBWjJ6RGdHWFROdXFPWFVBYWNwYUJodlVtTndVMUI5bmZaZk9UaU43?=
 =?utf-8?Q?3KUNRqpWXVD9gEqAcNF05Vm9Ist1c7+JtOEpqtZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ebde46-b509-4746-6da2-08d96308fb96
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 12:00:48.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CVag1KZbOsai4VW7Fq5zcue42E4YTPNiRcc/Sgf1DaWLypb30IRrNNSkeVtYzIXTAwj1m2OKpGurvcG5XYJvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 19.08.2021 13:55, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] RFC: Version support policy"):
>> On 13.08.2021 13:37, Ian Jackson wrote:
>>> In this patch I propose a cutoff of 6 years.
>>> Obviously there will be debate about the precise value.
>>
>> Indeed I consider this way too short. Purely as a personal (and
>> abstract) view (realizing this isn't really practical, and knowing
>> there are reasons why I'd actually like to see a bump of the
>> baseline) I'd prefer if there weren't minimum version requirements
>> at all (apart from maybe - along the lines of ...
>>
>>> It will also be necessary to make exceptions, and/or to make different
>>> rules for different architectures.  In particular, new architectures,
>>> new configurations, or new features, may need an absolute earliest
>>> tooling date which is considerably less than the usual limit.
>>
>> ... this - a baseline determined when Xen became an open source
>> project).
> 
> I don't think that is workable.  Effectively, it means we are
> targeting a constantly-obsolescing dependency environment.  It
> would prevent us from adopting even very-well-established facilities
> and improvements in our dependencies.
> 
> Effectively, it would force us to continue to write using 10- or
> 20-year-old idioms.  Idioms many of which have been found to be
> suboptimal, and which in some cases are becoming unsupported.

Right - that's why I did write "knowing there are reasons why I'd
actually like to see a bump of the baseline". I'm really of two
minds here, and either route has perhaps severe drawbacks.

Jan


