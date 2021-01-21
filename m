Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE612FEF5E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72220.129865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cBZ-0000TX-Iu; Thu, 21 Jan 2021 15:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72220.129865; Thu, 21 Jan 2021 15:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cBZ-0000T8-Fj; Thu, 21 Jan 2021 15:47:49 +0000
Received: by outflank-mailman (input) for mailman id 72220;
 Thu, 21 Jan 2021 15:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2cBY-0000T3-AC
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:47:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d0b4ed2-c7d4-49d8-9f2b-1bae961fc427;
 Thu, 21 Jan 2021 15:47:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99A9BAB7A;
 Thu, 21 Jan 2021 15:47:46 +0000 (UTC)
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
X-Inumbo-ID: 9d0b4ed2-c7d4-49d8-9f2b-1bae961fc427
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611244066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeet7Shbkf4034PlKL3X2pbgVosATAoI5kcHBz2Lz+k=;
	b=hE0+6atAV3MRJ9LML51mQIFfdDqtVll+0HDLW/OD76Xw4fjo4Mm0uWkt3JsVu6sZvnwnF8
	SfgjM7z5qkedxcWSHp9JSxDeIQaWs1sOJ55JqC/jadzwlaJlzWvraV7dSYdJxV7lilzacY
	PZconuRRv362mRNox0eL4y06HpOOlv4=
Subject: Re: [PATCH v4 1/5] xen/hypfs: support dynamic hypfs nodes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210118115516.11001-1-jgross@suse.com>
 <20210118115516.11001-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0073ebf-7404-2924-6a11-05ac0cbc9939@suse.com>
Date: Thu, 21 Jan 2021 16:47:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118115516.11001-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 12:55, Juergen Gross wrote:
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

Reviewed-by: Jan Beulich <jbeulich@suse.com>

