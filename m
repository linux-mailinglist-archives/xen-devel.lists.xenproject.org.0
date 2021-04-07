Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96754356815
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 11:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106553.203774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4Wt-0005Gk-9f; Wed, 07 Apr 2021 09:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106553.203774; Wed, 07 Apr 2021 09:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4Wt-0005GL-6A; Wed, 07 Apr 2021 09:31:19 +0000
Received: by outflank-mailman (input) for mailman id 106553;
 Wed, 07 Apr 2021 09:31:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU4Wr-0005GG-Oo
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 09:31:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcdd9b0b-2cac-4fb0-b250-1bde47ce1df9;
 Wed, 07 Apr 2021 09:31:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 038C5B06A;
 Wed,  7 Apr 2021 09:31:16 +0000 (UTC)
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
X-Inumbo-ID: dcdd9b0b-2cac-4fb0-b250-1bde47ce1df9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617787876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/ThV8W3CSBtQEZA9sD7HLLVdJCK7g+cTmPh3/5rDcI=;
	b=V8eScDm0JCr67RLjpgxTjKQFAcr0PNE3FQiQbcisET4Vze2CRm8O+BAe9O2xWWKvdrx1kB
	QQrFtyQlAOpNnPitT5CWOnYFT/DtRaveWFKUuG01qsHfcqeTYZ5ClvMrnS9P1D4ehDE46c
	lu21A8NgKMwYW1csLF0Jm+uLKFj3j7g=
Subject: Re: [PATCH] xen/page_alloc: Don't hold the heap_lock when clearing
 PGC_need_scrub
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210406193032.16976-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <35e0d1df-7aac-4205-4545-3218601bae4e@suse.com>
Date: Wed, 7 Apr 2021 11:31:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406193032.16976-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 21:30, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, the heap_lock is held when clearing PGC_need_scrub in
> alloc_heap_pages(). However, this is unnecessary because the only caller
> (mark_page_offline()) that can concurrently modify the count_info is
> using cmpxchg() in a loop.
> 
> Therefore, rework the code to avoid holding the heap_lock and use
> test_and_clear_bit() instead.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

