Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4F368081
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 14:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115381.220085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYUa-0006Su-85; Thu, 22 Apr 2021 12:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115381.220085; Thu, 22 Apr 2021 12:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYUa-0006SV-4O; Thu, 22 Apr 2021 12:31:36 +0000
Received: by outflank-mailman (input) for mailman id 115381;
 Thu, 22 Apr 2021 12:31:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZYUY-0006SP-V0
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 12:31:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49491d07-53ea-49b7-998c-87b4d0c197af;
 Thu, 22 Apr 2021 12:31:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC296B016;
 Thu, 22 Apr 2021 12:31:32 +0000 (UTC)
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
X-Inumbo-ID: 49491d07-53ea-49b7-998c-87b4d0c197af
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619094692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouHb3skPbX5Em7vNa90vH8nUgFFI1p8WZ+HEUpoILWY=;
	b=ZfJla6KnH3awd0iIlYsvrhG2zc2BJoSahEfeo1kp7AdAipUe6BzhkmzrbBPjXHjUseY7CF
	ReP6hRpejtcPtvankFboVjViceEbULxwVRTmy09zSb+D4KvRL4YI5hJCIqw91G6iWjVp0A
	F12D1NZKbx786hagfTIrluNZ59PQvDU=
Subject: Re: [PATCH 13/16] xen/page_alloc: add a path for xenheap when there
 is no direct map
To: Hongyan Xia <hx242@xen.org>
Cc: julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1588278317.git.hongyxia@amazon.com>
 <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1bd2c72-1310-f018-dda5-90521be03fe4@suse.com>
Date: Thu, 22 Apr 2021 14:31:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.04.2020 22:44, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When there is not an always-mapped direct map, xenheap allocations need
> to be mapped and unmapped on-demand.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

This series has been left uncommented for far too long - I'm sorry.
While earlier patches here are probably reasonable (but would likely
need re-basing, so I'm not sure whether to try to get to look though
them before that makes much sense), I'd like to spell out that I'm
not really happy with the approach taken here: Simply re-introducing
a direct map entry for individual pages is not the way to go imo.
First and foremost this is rather wasteful in terms of resources (VA
space).

As I don't think we have many cases where code actually depends on
being able to apply __va() (or equivalent) to the address returned
from alloc_xenheap_pages(), I think this should instead involve
vmap(), with the vmap area drastically increased (perhaps taking all
of the space the direct map presently consumes). For any remaining
users of __va() or alike these should perhaps be converted into an
alias / derivation of vmap_to_{mfn,page}() then.

Since the goal of eliminating the direct map is to have unrelated
guests' memory not mapped when running a certain guest, it could
then be further considered to "overmap" what is being requested -
rather than just mapping the single 4k page, the containing 2M or 1G
one could be mapped (provided it all belongs to the running guest),
while unmapping could be deferred until the next context switch to a
different domain (or, if necessary, for 64-bit PV guests until the
next switch to guest user mode). Of course this takes as a prereq a
sufficiently low overhead means to establish whether the larger
containing page of a smaller one is all owned by the same domain.

Jan

