Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ECF1915EF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:18:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmBd-0001xK-80; Tue, 24 Mar 2020 16:13:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmBc-0001xE-9m
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:13:52 +0000
X-Inumbo-ID: 734495a0-6dea-11ea-8471-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 734495a0-6dea-11ea-8471-12813bfff9fa;
 Tue, 24 Mar 2020 16:13:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6A07ACC2;
 Tue, 24 Mar 2020 16:13:50 +0000 (UTC)
To: Hongyan Xia <hx242@xen.org>
References: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37dcd2d8-8ffe-a58e-4c7a-6dafc935b1c1@suse.com>
Date: Tue, 24 Mar 2020 17:13:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] Revert "domctl: improve locking during
 domain destruction"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.2020 16:21, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Unfortunately, even though that commit dropped the domctl lock and
> allowed other domctl to continue, it created severe lock contention
> within domain destructions themselves. Multiple domain destructions in
> parallel now spin for the global heap lock when freeing memory and could
> spend a long time before the next hypercall continuation.

I'm not at all happy to see this reverted; instead I was hoping that
we could drop the domctl lock in further cases. If a lack of
continuations is the problem, did you try forcing them to occur more
frequently?

> In contrast,
> after dropping that commit, parallel domain destructions will just fail
> to take the domctl lock, creating a hypercall continuation and backing
> off immediately, allowing the thread that holds the lock to destroy a
> domain much more quickly and allowing backed-off threads to process
> events and irqs.
> 
> On a 144-core server with 4TiB of memory, destroying 32 guests (each
> with 4 vcpus and 122GiB memory) simultaneously takes:
> 
> before the revert: 29 minutes
> after the revert: 6 minutes

This wants comparing against numbers demonstrating the bad effects of
the global domctl lock. Iirc they were quite a bit higher than 6 min,
perhaps depending on guest properties.

Jan

