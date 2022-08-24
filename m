Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7659F6ED
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392345.630632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQn5m-000745-32; Wed, 24 Aug 2022 09:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392345.630632; Wed, 24 Aug 2022 09:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQn5l-00072I-WA; Wed, 24 Aug 2022 09:54:33 +0000
Received: by outflank-mailman (input) for mailman id 392345;
 Wed, 24 Aug 2022 09:54:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQn5j-00072A-PR
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 09:54:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQn5g-00016v-Ty; Wed, 24 Aug 2022 09:54:28 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQn5g-0002D9-Ms; Wed, 24 Aug 2022 09:54:28 +0000
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
	bh=epns211f1sOY1OvTOeRzRdsWz6PFUMP6WOxXzXAEce0=; b=aVFHaU18A7YzpKQssOtyFKbMmw
	Tp7r3ziS9GQwlXXytVqSN+LzZt/4GggnIYO8zMDeuKKruzsSlE5OAjnFLhmYTXJT5+C6LPIMlQnIN
	nSIcdibh4YRqvL6ShC5hhoOgeJEiaMWXEaA57FdRyFvvviP2bmMOdIUbaxtniZ1s7Gxs=;
Message-ID: <509368c1-e0df-106f-8b15-e0536d19befe@xen.org>
Date: Wed, 24 Aug 2022 10:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v10 0/9] populate/unpopulate memory when domain on static
 allocation
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220816023658.3551936-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/08/2022 03:36, Penny Zheng wrote:
> Penny Zheng (9):
>    xen/arm: rename PGC_reserved to PGC_static

This was committed by Jan a week ago. And ...


>    xen: do not merge reserved pages in free_heap_pages()
>    xen: add field "flags" to cover all internal CDF_XXX

... I have committed those two.

Cheers,

-- 
Julien Grall

