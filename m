Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60E3F1607
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 11:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168461.307580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGeBo-0006uN-Mp; Thu, 19 Aug 2021 09:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168461.307580; Thu, 19 Aug 2021 09:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGeBo-0006sW-Hd; Thu, 19 Aug 2021 09:18:20 +0000
Received: by outflank-mailman (input) for mailman id 168461;
 Thu, 19 Aug 2021 09:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGeBm-0006sQ-OB
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 09:18:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 633bfc54-00ce-11ec-a5ce-12813bfff9fa;
 Thu, 19 Aug 2021 09:18:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-fNGtMgJMNKqAI71Ej0JK7A-1; Thu, 19 Aug 2021 11:18:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 19 Aug
 2021 09:18:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 09:18:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.11 via Frontend Transport; Thu, 19 Aug 2021 09:18:13 +0000
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
X-Inumbo-ID: 633bfc54-00ce-11ec-a5ce-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629364696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eNkU/PCHKhwQV6NsClqvI7IV6mjqRHpXJ7Ye0upecUk=;
	b=CdV9ydkpis0rDPvcnP1rvgc31RztfoLOmeQ1RmZxH+WG4FFy8JXYx9ar3nxQAjFBKsysOG
	nqRiF8bOx3+M1z0/74ssbw7uRqqOE6v6Y1l4ZZDvD+jWW3IswwiSPuZ2gCERYM771+WoIS
	9GyJqTIvcEiLzXBYoZi9RBqgR63Jqzk=
X-MC-Unique: fNGtMgJMNKqAI71Ej0JK7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnFJubYXbWX9yN19aQ1OZqUmBT07fAlauMXeWP5TRn26Xg5j2dkftu1tsvYxSDDAPKl+sDjz5ESVy40wfdMbilaa0Et2Y+cj3V31DE+b9oaTMFqMIBhkT+vRn7fNi3BUiDTSRDAHV4wVOOCOtB85qqP4e0AzlwjzTQ+LMGKmYQmSUiRgJkIP0jLPU24KWyT2NMdOv0Wex5/+GeeowXVQp9snDpnTzLzMAMtfha9sFo2iu3atLZu3iWvxE74fKvnvliPyDa/7Z+BeY/hLQdv+CsFvv1XrLBKL9ECpam3zU7FXRVF4mqjE+K05pkghYkA1u8OEoRDlXctkmbagohaJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNkU/PCHKhwQV6NsClqvI7IV6mjqRHpXJ7Ye0upecUk=;
 b=Xsi5+Ip8Um3Tzu22uCAvsyb6CILEbmlQuuW7t4dJVGKo7J/QJoMwJFsCv1hp/1VXm+za0ttOrQ/bMhg4WOvvKKqLuwOBDiDvRqgQtjZgSo2tV3bcnP3hmXG04FvboYipGJeGuou5MJxyRh0XWdHLEJHxe/BX8TOveajoHPpEq34VcgITHs1n7uWSNC2fQxm5FomMd4axisTgixDF/pnzFgez4cTABUwfD8coHUo2BYeIikzhmyu+J9KiFf0idI44U86kQWe5OAinJTBfDazKs0g5NJCEpc5sR/kr6ICLRqVyLc/93cMZck0PGEr53QX8vxP7PTaoakjUg5OzL5ao8g==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
Date: Thu, 19 Aug 2021 11:18:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210813113727.6028-1-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1ac2ba-792f-4c79-e373-08d962f2454d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70878616CB3018444354C8B2B3C09@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	laFtcWxe33i7UqMsh+T43864VdbxN8etvLaQ52xNIyY+VmFfOYn6qCxWqgTdPjR150+4Lcdg3BBqjDxcG2DNXQGHrZVoDSJUKokJk3UfIeeYuRWYLh6aRpEFFI67MwwVDZSomesWxsXwINd6nPup947TrH2NqqY4doNiceLbgSyn4tdl5Q5jNT6J8o+/whOSpQwIiMHmo31DEEPOhsmDTU2LDumllkhOr4/xtGqj7e5MqhQMgV+i2pjiwE5KudwMarnrD/H/zbzC1nZjcIOBghMmTmekK6mrjd/a90OWuGsx8UIjOLEDwx32OznmFnEL/rMFzqZLcP4Ej/nIbIfpauaA0rwjqjsoRpshuxYQuUSNOlEXkK+5ul8ydgPvUs0H8o9X7IhBwp6PYNwQTgkK/jq+XOlE5a8sUp1XtL00fSWmO589p/bZkorQce7cnyDlgwfH2zOo5IvL146DTNb+6uVbeJgcOTpPikOjwoTstga6BgtS9huSxDUyPQKbTw5OuC5ApbHTsWaxC3OxjuYmYMapuF1KWkJE1l1Jl/wr4axtf3yz1AlvHBUwbt12KWaOy6fes/9myAxZ3Fh67DcgZuTgMcOYKcEk3MufrkKILDbw80we4wQXTvmkK/M++7RnY8fCrRqeushJciEbNQuIgkgPhDChEgJvTcR3qOzPbF9W5fkcKMdwxI50DgplXnADNiyyP0BiYZ++9bnI6kTPdydP93X7iliqPajCVXHmN3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39850400004)(16576012)(5660300002)(6916009)(186003)(54906003)(316002)(36756003)(66556008)(86362001)(2906002)(8936002)(66476007)(38100700002)(956004)(478600001)(2616005)(31686004)(6486002)(31696002)(4326008)(8676002)(66946007)(53546011)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K05oa2p1VTRzQ2ZTWWxqQ05tQlhTSWl6MFJVQ0doQUppUFNFMllPK2xpMCtB?=
 =?utf-8?B?ZUFBMG1YS1RJVUhJRThzL0NoU1JpZUcyQzM0WlcrVjRVYmNaWmRla3JHQlJM?=
 =?utf-8?B?a29YaTRDd0FnODg1YjI1dFhtaXBjZVJ6ME9adTlzcnFma3FBWUQycERzZzBn?=
 =?utf-8?B?eCtnak9oOXpNd1FOVHlSZ3pQczB2M0tMdVI2T2pYRFhZbThvR1ZuRE5kSG9D?=
 =?utf-8?B?ZW1INDRsT0g5T09RTWE3WlRtVlFxUVNBSFZZdmtaNjF6UFk2VFF6c0FlRkVi?=
 =?utf-8?B?ZWt0UWMvZCthbEYxdFNySVFQblhHakhUcyt5VmJlOHo3ZDcxeVJnT1FBUGo3?=
 =?utf-8?B?VkxVUGF0b2IwU2hpMUQ2anNFTkVrTnRvc2d6ZkpLZEZJMXdWUEZOcWtoMUdQ?=
 =?utf-8?B?eEVwZFBCZndKZ0JUYWNoa0pmbUxFWERMMVVCVm8wSTl4bFQ5d2FhcnFqZ2l2?=
 =?utf-8?B?UXBHYmxNY3J5RW15L3I3eUI0Z2dMR0lpb1lnVTB2TDNaTkpGNUxSRnBHMlYx?=
 =?utf-8?B?dUlFcnp0dTNxajZ5c3QwMDExek5raFBrNnY3MzlyNTBoVXV4TDRuL1JaRWl6?=
 =?utf-8?B?bXFFb0Foek5YdzNIcHBNU0JxODFTWmpnNFkrYWxlck9raE5vY0V4NFpEWTRM?=
 =?utf-8?B?TGVTeXRqUkZrMDlxYlJuaTNOYzRweUcxVWMxODNrWEFaZlQ3cjQzUXphZWRQ?=
 =?utf-8?B?THlBU282b3BuM2EvUW1iRmVmcHhmc3FpZ3poVlJ0ZlFaTXk4WkFWU2srVjBz?=
 =?utf-8?B?R2tHZXRTN2pJd1Jja0lFOThETjlsUzdhRlI2WG9jM2MzbGMzQzVRenhzV0NY?=
 =?utf-8?B?OGVIaVdRaTRLT3R3UkV4YzBLYzNnWG9vcDk5WHBiRlpKQmo2RmtRVFFmWUJ4?=
 =?utf-8?B?Slc4a3F4bS9mZ3RKMDNnbXduS1hkTWYyMnZtRnlBQURUR2F3Wkx1TzJGaFl4?=
 =?utf-8?B?YUU3MFpxd0FIT0ZuQlhNcndHTW85Rld1czVtRE9OUHppWG1GYUhNaUUzYW9p?=
 =?utf-8?B?aHlIdThZeWRQSTd4ODBpeG1yRkRtakw3YUY1WTM4SGxJRGVCVExrRFpMVG5O?=
 =?utf-8?B?QndrSEVSSzRpUWpNeUxBTGhVWnJGZVplNHpscUZVc2JrdlJReDVxdWFmRkMv?=
 =?utf-8?B?dm9nK09qNVVaMVJYcTM0MUViZkhTLzBraUMwdURnZ2NIeUVXRnhPMXFtQUky?=
 =?utf-8?B?ZEZ2Rk9vdVNraFU4OTV0N0ZUazY0WVlRN3hBWUIwYkgzOG8vakFnSkNMODYz?=
 =?utf-8?B?dTZSNDVmU3c5Uk1aNHNvMHNnK3EycXgyZk5Id1dpZkZYaGIwU01DanNJK0hK?=
 =?utf-8?B?UU5lZUxGa3EvZkhoTEJqMFRScVBZZ1J5cGM3eTlVamxNRlRETVJ0eDl5ZkNp?=
 =?utf-8?B?WkdWNDlnMEJyazV3Z2VGYXBoRllyT0R5TG1nWVdWOVo5ZHprbVZWTFVWc2w4?=
 =?utf-8?B?SFZBWGFHdXAzc0lCVW5OWDNUb29XRWVaMllQSmxmOVhGRSt2bjZ5RElUZHln?=
 =?utf-8?B?VTR2Q0wvV3h5YVlWTzhIZDMvUHNGWHZTbUs1M21ydC95bisyZHd2QWR6Ly95?=
 =?utf-8?B?clFHWm5Lcm5iZ3doOWN2U0d2NnM2M1hJMzZnVTJFMVduZjRCUkt6ZWg3eUN5?=
 =?utf-8?B?TW1hc0NYRFBLbUdINHhuYlpGNGpUTzg0RFVtL1QvZWFGSXFQWkRFWmduSkVr?=
 =?utf-8?B?TXhYekh5SERjSlUySlBrTHEwNnhJOTNJU2VDZExmeFlkVmFpUmRHZklwZ3Jz?=
 =?utf-8?Q?snLx5HPcIAqZ7394hjqG/QWdsuTGGfsHh7Ib7zp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1ac2ba-792f-4c79-e373-08d962f2454d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 09:18:13.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hj4vRVP/7VVvhV1CSvNAMBZWGTlsCcF9piHlzWrt9Pu/EapgFxmXYIh+PBzV/rG25+1LKV5KSZolv7mRbpu7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 13.08.2021 13:37, Ian Jackson wrote:
> The current policy for minimum supported versions of tools, compilers,
> etc. is unsatisfactory: For many dependencies no minimum version is
> specified.  For those where a version is stated, updating it is a
> decision that has to be explicitly taken for that tool.

Considering your submission of this having been close to a glibc
version issue you and I have been discussing, I wonder whether
"etc" above includes library dependencies as well.

In any event the precise scope of what is meant to be covered is
quite important to me: There are affected entities that I'm happy
to replace on older distros (binutils, gcc). There are potentially
affected entities that I'm less happy to replace, but at the time
I did work my way through it for example for Python (to still be
able to build qemu, the community of which doesn't appear to care
at all to have their stuff buildable in older environments). The
point where I'd be really in trouble would be when base platform
libraries like glibc are required to be a certain minimum version:
I'd then be (potentially severely) restricted in what systems I
can actually test stuff on.

In addition I see a difference between actively breaking e.g.
building with older tool chains vs (like you have it in your
README adjustment) merely a statement about what we believe
things may work with, leaving room for people to fix issues with
their (older) environments, and such changes then not getting
rejected simply because of policy.

> The result is persistent debates over what is good to support,
> conducted in detail in the context of individual patches.
> 
> Decisions about support involve tradeoffs, often tradeoffs between the
> interests of different people.  Currently we don't have anything
> resembling a guideline.  The result is that the individual debates are
> inconclusive; and also, this framework does not lead to good feelings
> amongst participants.
> 
> I suggest instead that we adopt a date-based policy: we define a
> maximum *age* of dependencies that we will support.
> 
> The existing documentation about actually known working versions
> then becomes a practical consequence of that policy.
> 
> In this patch I propose a cutoff of 6 years.
> Obviously there will be debate about the precise value.

Indeed I consider this way too short. Purely as a personal (and
abstract) view (realizing this isn't really practical, and knowing
there are reasons why I'd actually like to see a bump of the
baseline) I'd prefer if there weren't minimum version requirements
at all (apart from maybe - along the lines of ...

> It will also be necessary to make exceptions, and/or to make different
> rules for different architectures.  In particular, new architectures,
> new configurations, or new features, may need an absolute earliest
> tooling date which is considerably less than the usual limit.

... this - a baseline determined when Xen became an open source
project). Advanced features may of course be dependent on better
capabilities, as long as there's a way to disable building or
use of these features.

While generally I find Marek's proposal better to tie the baseline
to distros of interest, in a way it only shifts the issue, I'm
afraid.

Jan


