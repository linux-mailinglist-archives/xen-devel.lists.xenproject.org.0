Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D44434F3D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 17:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213997.372396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdDmO-00039Z-JS; Wed, 20 Oct 2021 15:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213997.372396; Wed, 20 Oct 2021 15:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdDmO-00037l-GH; Wed, 20 Oct 2021 15:45:24 +0000
Received: by outflank-mailman (input) for mailman id 213997;
 Wed, 20 Oct 2021 15:45:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdDmN-00037f-Ki
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 15:45:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdDmN-0008SW-Fy
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 15:45:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdDmN-0001Df-Et
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 15:45:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mdDmJ-0004If-UX; Wed, 20 Oct 2021 16:45:20 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=jcjgEwRsGmmjSzP3LNYUdjU7tG4+MlDKfHG44Xp3RFw=; b=cZ99fqUh4tWDwI+VkzhCkz0W4Q
	NyDzBATF4o54dVn8z4iJaD2Ys+ZtZX8Pp8TqF/wyqYFb9bRp+RKfn5cqG5VA6a+QXZne+PJFkciG5
	K7G/9uNkvp6cu3Sm+sV80AxCkBHQKOXDAYu3lpf5oT+GB098V1vltwqi2pd3wrUHWWf0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24944.14735.525284.612126@mariner.uk.xensource.com>
Date: Wed, 20 Oct 2021 16:45:19 +0100
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.16] tools/xenstored: Ignore domain we were unable to restore
In-Reply-To: <20211020144519.10362-1-julien@xen.org>
References: <20211020144519.10362-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.16] tools/xenstored: Ignore domain we were unable to restore"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 939775cfd3 "handle dying domains in live update" was meant to
> handle gracefully dying domain. However, the @releaseDomain watch
> will end up to be sent as soon as we finished to restore Xenstored
> state.
> 
> This may be before Xen reports the domain to be dying (such as if
> the guest decided to revoke access to the xenstore page). Consequently
> daemon like xenconsoled will not clean-up the domain and it will be
> left as a zombie.
> 
> To avoid the problem, mark the connection as ignored. This also
> requires to tweak conn_can_write() and conn_can_read() to prevent
> dereferencing a NULL pointer (the interface will not mapped).
> 
> The check conn->is_ignored was originally added after the callbacks
> because the helpers for a socket connection may close the fd. However,
> ignore_connection() will close a socket connection directly. So it is
> fine to do the re-order.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

