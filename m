Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0232886A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91864.173401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmWe-00038N-T4; Mon, 01 Mar 2021 17:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91864.173401; Mon, 01 Mar 2021 17:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmWe-00036J-PT; Mon, 01 Mar 2021 17:40:08 +0000
Received: by outflank-mailman (input) for mailman id 91864;
 Mon, 01 Mar 2021 17:40:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWd-00034T-52
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:40:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWd-0005KQ-45
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:40:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWd-0004i6-1h
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:40:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmWZ-00056i-NK; Mon, 01 Mar 2021 17:40:03 +0000
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
	bh=qgtapO+c1+Y+53b3XfTDDeXeOJrFPIfE+5uS3cFh9nc=; b=gDBk02pQWy4sCyVyOMAorgiom4
	AlSqNdYKuxIT1e+cOb1/rdlbobmTdlE6VVTEwsG4uvO3jpSs+fdx4Cq/gI+S1DzrLqPvT+7e+cs70
	tdSkt8asYdhnCFlQYqgntTpvs9yhRJndW6jsvTe/XcFl+3ON4QFLg82h1rztRe0kp1Mo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.9971.519283.948123@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:40:03 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: Avoid dereferencing a NULL pointer if LiveUpdate is failing
In-Reply-To: <20210226182655.2499-1-julien@xen.org>
References: <20210226182655.2499-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] tools/xenstored: Avoid dereferencing a NULL pointer if LiveUpdate is failing"):
> From: Julien Grall <jgrall@amazon.com>
> 
> In case of failure in do_lu_start(), XenStored will first free lu_start
> and then try to dereference it.
> 
> This will result to a NULL dereference as the destruction callback will
> set lu_start to NULL.
> 
> The crash can be avoided by freeing lu_start *after* the reply has been
> set.
> 
> Fixes: af216a99fb4a ("tools/xenstore: add the basic framework for doing the live update")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>


