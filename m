Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9401F56B8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 16:22:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj1bm-0005US-FP; Wed, 10 Jun 2020 14:21:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5j5l=7X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jj1bk-0005UN-Rf
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 14:21:36 +0000
X-Inumbo-ID: b08605f2-ab25-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b08605f2-ab25-11ea-bca7-bc764e2007e4;
 Wed, 10 Jun 2020 14:21:35 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H9Vs+9QD9Q/3txKlxrcRmQxt3YsaVlpyjmrZS71lHV1YxX7WY6mOU8l2kM7OCFYhNaSq5cfzBA
 zF1aCXxsEt2aILvDo6BVUuNSMZv+m4qPt2vBhD6qe7Ns5Z42qy7PInzqz/89x1JvOxeW6U8ERS
 Y5zGM77UmNrtKovNiZjwgAlMwS9Fn3UZy8WFuyOkQaKvmtag3/BGUiNjiIA4Ce8OJo7b69eeL2
 HpW3UCMRl6vmVcKwXMQv87EiN259sIGJM1AmBoYvQAKzbYhJVp+bAWdlvjihJVkOB/PceohnUi
 itI=
X-SBRS: 2.7
X-MesageID: 20451479
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="20451479"
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
To: Martin Lucina <martin@lucina.net>, <xen-devel@lists.xenproject.org>,
 <mirageos-devel@lists.xenproject.org>
References: <20200609094425.GB9734@nodbug.lucina.net>
 <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
 <20200610132225.GA16839@nodbug.lucina.net>
 <46e87834-bf47-4003-1f32-89a47255155d@citrix.com>
 <20200610135601.GB16839@nodbug.lucina.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6b2a0091-2c56-895c-762d-719e5796985d@citrix.com>
Date: Wed, 10 Jun 2020 15:21:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610135601.GB16839@nodbug.lucina.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 10/06/2020 14:56, Martin Lucina wrote:
> On Wednesday, 10.06.2020 at 14:40, Andrew Cooper wrote:
>>> So, going with the grant v2 ABI, is there a modern equivalent of
>>> GNTTABOP_get_status_frames? Reading memory.h I'm guessing that it might be
>>> XENMEM_add_to_physmap with space=XENMAPSPACE_grant_table and
>>> idx=(XENMAPIDX_grant_table_status + N) where N is the frame I want, but
>>> this is not explicitly mentioned anywhere and Linux uses the GNTTABOP
>>> mechanism.
>>>
>>> Further to that, what is the format of the grant status frames?
>>> grant_table.h doesn't have much to say about it.
>>>
>>> And lastly, given that I want the v2 grant ABI exclusively, I presume it's
>>> sufficient to call GNTTABOP_set_version (version=2) first thing and abort
>>> if it failed? Presumably the default is always v1 at start of day?
>> What kind of guests are you trying to target here?
> PVHv2 only. x86_64 only for now, though the code should remain easily
> portable to at least ARM64, should someone decide they need that.
>
>> Since my reply, I tried to experiment, and I think you're forced to use
>> GNTTABOP_setup_table/GNTTABOP_get_status_frames for x86 PV guests, and
>> XENMEM_add_to_physmap for x86 HVM/PVH guests.
>>
>> You can't depend on version 2 being available.  Its not available for
>> ARM at all, and may be disabled for security reasons on x86 (there was
>> some extended fun with transitive grants in the past, and we offered
>> "totally disable grant v2" as one mitigation).
> I don't need v2 at all, I was just going by the comments in grant_table.h,
> which read: "Version 1 of the grant table entry structure is maintained
> purely for backwards compatibility.  New guests should use version 2."

Ha...

That comment wasn't written with the benefit of hindsight.

IMO, grant v2 is not worth the astounding quantity of XSAs its
implementation actually gave us, or the complexity of the resulting code.

> Grant status frames are a v2-only thing, right?

Correct.

The split status frames was new in v2, in an attempt to reduce cacheline
ping-pong.

The downside is that the guest needs an unbounded loop trying to make a
change to the grant table while ensuring that the flags in the status
frame don't change asynchronously.

~Andrew

P.S. In some theoretical world, I was hoping to have something to live
in https://xenbits.xen.org/docs/latest/guest-guide/index.html on this
subject.  Do you mind if I use you as a retroactive guineapig if/when
some documentation were to appear?

