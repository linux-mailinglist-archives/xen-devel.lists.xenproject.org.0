Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1110C2CD9DB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43732.78569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqEB-0008BZ-UQ; Thu, 03 Dec 2020 15:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43732.78569; Thu, 03 Dec 2020 15:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqEB-0008BA-R3; Thu, 03 Dec 2020 15:09:03 +0000
Received: by outflank-mailman (input) for mailman id 43732;
 Thu, 03 Dec 2020 15:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkqEA-0008B5-2X
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:09:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18f79b02-6b1e-48a9-bd20-206abfa09bd4;
 Thu, 03 Dec 2020 15:09:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83195AC65;
 Thu,  3 Dec 2020 15:09:00 +0000 (UTC)
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
X-Inumbo-ID: 18f79b02-6b1e-48a9-bd20-206abfa09bd4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607008140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5UIsF9sXAtXCzAtuI+A+nPX35jXeoAr0MhfRJx9RzA=;
	b=WsQMwAni4+N4f5bMcesMYaqH8z/JkljNA210SbDeooYdDiADe7bJR8LZa76DXr/eTmQX7o
	8663IbNjL42IK90KSaNcNMIB7pLZvPcfZNFXka/y7G9/Zi78g7YC637sUnOWF1NvBClrks
	ktxaf2oHpjf0I+ypxIImhYbgMAJEAms=
Subject: Re: [PATCH v2 13/17] xen/hypfs: support dynamic hypfs nodes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-14-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a02fe2e6-428f-9bea-0108-92fa03729420@suse.com>
Date: Thu, 3 Dec 2020 16:08:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-14-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> Add a HYPFS_VARDIR_INIT() macro for initializing such a directory
> statically, taking a struct hypfs_funcs pointer as parameter additional
> to those of HYPFS_DIR_INIT().
> 
> Modify HYPFS_VARSIZE_INIT() to take the function vector pointer as an
> additional parameter as this will be needed for dynamical entries.
> 
> For being able to let the generic hypfs coding continue to work on
> normal struct hypfs_entry entities even for dynamical nodes add some
> infrastructure for allocating a working area for the current hypfs
> request in order to store needed information for traversing the tree.
> This area is anchored in a percpu pointer and can be retrieved by any
> level of the dynamic entries. The normal way to handle allocation and
> freeing is to allocate the data in the enter() callback of a node and
> to free it in the related exit() callback.
> 
> Add a hypfs_add_dyndir() function for adding a dynamic directory
> template to the tree, which is needed for having the correct reference
> to its position in hypfs.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - switch to xzalloc_bytes() in hypfs_alloc_dyndata() (Jan Beulich)
> - carved out from previous patch
> - use enter() and exit() callbacks for allocating and freeing
>   dyndata memory

I can't seem to be able to spot what this describes, and the
respective part of the description therefore also remains unclear
to me. Not the least again when considering multi-level templates,
where potentially each of the handlers may want to allocate dyndata,
yet only one party can at a time.

> - add hypfs_add_dyndir()

Overall this patch adds a lot of (for now) dead code, which makes it
hard to judge whether this is what's needed. I guess I'll again
learn more by reding further patches.

Jan

