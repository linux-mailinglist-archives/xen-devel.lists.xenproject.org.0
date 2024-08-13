Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A909950F5D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 23:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776661.1186835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdzTE-0001cD-Qa; Tue, 13 Aug 2024 21:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776661.1186835; Tue, 13 Aug 2024 21:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdzTE-0001Z3-Mo; Tue, 13 Aug 2024 21:54:24 +0000
Received: by outflank-mailman (input) for mailman id 776661;
 Tue, 13 Aug 2024 21:54:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sdzTC-0001Yx-SW
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 21:54:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdzTC-000845-Ni; Tue, 13 Aug 2024 21:54:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdzTC-0003M8-GA; Tue, 13 Aug 2024 21:54:22 +0000
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
	bh=9yjWaBUzIYYpLIC9M6S+4PyjyVfmBd5yhRGPIT5E1Rk=; b=XrVDIWHNUE0cofEeqyMbyCUrxK
	8yglafKV38fhWqqklo7PbmBIUvWwLXuyqNqyW0POk3OdczMFx37RqkKKfzNeDr5+ODUl1LYNpJGDl
	g6G/XlBxaCF8RkAhLE2JBoCWPc/18OVcZnoqYS1urRKDWSIf93VthmX4qKuvOfmHicIg=;
Message-ID: <c369efed-6607-461f-a76e-049d6bf28ae5@xen.org>
Date: Tue, 13 Aug 2024 22:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: introduce xvmalloc() et al and use for grant table
 allocations
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <300f7bb3-3ab6-44ec-9663-b9934c3e123c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <300f7bb3-3ab6-44ec-9663-b9934c3e123c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/08/2024 07:30, Jan Beulich wrote:
> All of the array allocations in grant_table_init() can exceed a page's
> worth of memory, which xmalloc()-based interfaces aren't really suitable
> for after boot. We also don't need any of these allocations to be
> physically contiguous. Introduce interfaces dynamically switching
> between xmalloc() et al and vmalloc() et al, based on requested size,
> and use them instead.
> 
> All the wrappers in the new header are cloned mostly verbatim from
> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
> for sizes and to unsigned int for alignments, and with the cloning of
> x[mz]alloc_bytes() avoided. The exception is xvmemdup(), where the
> const related comment on xmemdup() is actually addressed and hence
> dropped.
> 
> While adjusting grant_table_destroy() also move ahead the clearing of
> the struct domain field.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

