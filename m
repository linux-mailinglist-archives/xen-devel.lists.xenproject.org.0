Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22A4F8A62
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 00:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301026.513613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncarg-0005fS-Eq; Thu, 07 Apr 2022 22:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301026.513613; Thu, 07 Apr 2022 22:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncarg-0005bx-B7; Thu, 07 Apr 2022 22:44:32 +0000
Received: by outflank-mailman (input) for mailman id 301026;
 Thu, 07 Apr 2022 22:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJP+=UR=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1ncarf-0005br-0N
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 22:44:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48d636e7-b6c4-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 00:44:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7E8BB82816;
 Thu,  7 Apr 2022 22:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4757EC385A4;
 Thu,  7 Apr 2022 22:44:27 +0000 (UTC)
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
X-Inumbo-ID: 48d636e7-b6c4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1649371467;
	bh=hIvqS6RVxt92RR7xvo4WKRMmb/Y56ZN8tL5vx0hkAGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HM77SMATfGFl5LMW36PL6MtnIJvmB/XAW+fcPCI29k5nWhVpuUTY3HzmBNmIqdg3v
	 uP48N1JWMBDzHVnrKsuoXOsc22VHVDUHOfbrW1ak0p4vMB9ounTiSYUk6QPs7aeNlq
	 SzxKfbBfdjsvz1qfo0G3dGVoLZu5FtkwlT9+a+ME=
Date: Thu, 7 Apr 2022 15:44:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2] mm, page_alloc: fix build_zonerefs_node()
Message-Id: <20220407154426.7076e19f5b80d927dd715de9@linux-foundation.org>
In-Reply-To: <20220407120637.9035-1-jgross@suse.com>
References: <20220407120637.9035-1-jgross@suse.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  7 Apr 2022 14:06:37 +0200 Juergen Gross <jgross@suse.com> wrote:

> Since commit 6aa303defb74 ("mm, vmscan: only allocate and reclaim from
> zones with pages managed by the buddy allocator")

Six years ago!

> only zones with free
> memory are included in a built zonelist. This is problematic when e.g.
> all memory of a zone has been ballooned out when zonelists are being
> rebuilt.
> 
> The decision whether to rebuild the zonelists when onlining new memory
> is done based on populated_zone() returning 0 for the zone the memory
> will be added to. The new zone is added to the zonelists only, if it
> has free memory pages (managed_zone() returns a non-zero value) after
> the memory has been onlined. This implies, that onlining memory will
> always free the added pages to the allocator immediately, but this is
> not true in all cases: when e.g. running as a Xen guest the onlined
> new memory will be added only to the ballooned memory list, it will be
> freed only when the guest is being ballooned up afterwards.
> 
> Another problem with using managed_zone() for the decision whether a
> zone is being added to the zonelists is, that a zone with all memory
> used will in fact be removed from all zonelists in case the zonelists
> happen to be rebuilt.
> 
> Use populated_zone() when building a zonelist as it has been done
> before that commit.
> 
> Cc: stable@vger.kernel.org

Some details, please.  Is this really serious enough to warrant
backporting?  Is some new workload/usage pattern causing people to hit
this?


