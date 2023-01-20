Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BD6750F4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481517.746460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIneF-0001X4-7e; Fri, 20 Jan 2023 09:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481517.746460; Fri, 20 Jan 2023 09:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIneF-0001Ub-4I; Fri, 20 Jan 2023 09:25:23 +0000
Received: by outflank-mailman (input) for mailman id 481517;
 Fri, 20 Jan 2023 09:25:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIneD-0001UU-R9
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:25:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIneD-0000Jb-JM; Fri, 20 Jan 2023 09:25:21 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIneD-0004IY-Ca; Fri, 20 Jan 2023 09:25:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vckqFbR1AK4IWNIgkbK0OB4zTEYkI32iWrrLaBBdHZo=; b=dlbMIoTLFiqT/9CvYe4Aoq2QqZ
	bWc6i7kirGs8EB8QudlT1FuoIAW6T0bmWDY1oi5hVZRvj/yCCGRsNQCYQwkoqEmqZv38OpwNNbimU
	rVxHu/ePLRZWq3JGbW+uItIliCcCryG11yp2JRLkQ8ZB3nme3/JcB7Muu4mF145vpY+s=;
Message-ID: <b5cb6edf-d97a-5a83-09a7-7ef5d154dcb1@xen.org>
Date: Fri, 20 Jan 2023 09:25:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 00/17] tools/xenstore: do some cleanup and fixes
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230118095016.13091-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/01/2023 09:49, Juergen Gross wrote:
> This is a first run of post-XSA patches which piled up during the
> development phase of all the recent Xenstore related XSA patches.
> 
> This is a mixture of small fixes, enhancements and cleanups.
> 
> Changes in V4:
> - reordered the patches a little bit (patch 4 and patch 17 of V4 have
>    been moved)
> - addressed comments
> 
> Changes in V3:
> - patches 2, 3, and 5 of V2 have been applied already
> - new patch 12
> - addressed comments
> 
> Changes in V2:
> - patches 1+2 of V1 have been applied already
> - addressed comments
> - new patch 19
> 
> Juergen Gross (17):
>    tools/xenstore: let talloc_free() preserve errno
>    tools/xenstore: remove all watches when a domain has stopped
>    tools/xenstore: add hashlist for finding struct domain by domid
>    tools/xenstore: make log macro globally available
>    tools/xenstore: introduce dummy nodes for special watch paths
>    tools/xenstore: replace watch->relative_path with a prefix length
>    tools/xenstore: move changed domain handling
>    tools/xenstore: change per-domain node accounting interface
>    tools/xenstore: replace literal domid 0 with dom0_domid
>    tools/xenstore: make domain_is_unprivileged() an inline function
>    tools/xenstore: let chk_domain_generation() return a bool
>    tools/xenstore: don't let hashtable_remove() return the removed value
>    tools/xenstore: switch hashtable to use the talloc framework
>    tools/xenstore: introduce trace classes
>    tools/xenstore: let check_store() check the accounting data
>    tools/xenstore: make output of "xenstore-control help" more pretty

I have committed up to this patch. The last one...

>    tools/xenstore: don't allow creating too many nodes in a transaction

... needs some review which I will do with part 2 of the xenstored series.

Cheers,

-- 
Julien Grall

