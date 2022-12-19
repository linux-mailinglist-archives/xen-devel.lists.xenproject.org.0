Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD0650A19
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 11:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465988.724802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7DNY-0005bM-FP; Mon, 19 Dec 2022 10:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465988.724802; Mon, 19 Dec 2022 10:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7DNY-0005YD-CQ; Mon, 19 Dec 2022 10:28:16 +0000
Received: by outflank-mailman (input) for mailman id 465988;
 Mon, 19 Dec 2022 10:28:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7DNW-0005Y7-PN
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 10:28:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7DNV-0003WL-Bb; Mon, 19 Dec 2022 10:28:13 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[192.168.8.73])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7DNV-0008VC-4o; Mon, 19 Dec 2022 10:28:13 +0000
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
	bh=qFgZAhiau7ROPynYpmL9Fn51/YeH3jYYsdVHjaltsjE=; b=vSbqmzi4FA50wXc/dTUrvCUg5v
	jdS1rkgyqYuGtuf8IXb+b4/PpewEdPBtpcfn5HRnoZRt2ey72AQ22RfxJEHer6FgRlsdfzYRAeQYu
	3XDJdSOW3BsqhAyV9FUh7LXIhigbFDQGhBVy4aultVkxrzhZ92hUo7vUwoXXVE1gEKwc=;
Message-ID: <ac02add0-63ba-8360-e5a0-9a9b4d2ae00f@xen.org>
Date: Mon, 19 Dec 2022 10:28:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] NUMA: replace phys_to_nid()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <2e6390d3-d45e-3006-1370-adb0565445d2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2e6390d3-d45e-3006-1370-adb0565445d2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/12/2022 10:19, Jan Beulich wrote:
> All callers convert frame numbers (perhaps in turn derived from struct
> page_info pointers) to an address, just for the function to convert it
> back to a frame number (as the first step of paddr_to_pdx()). Replace
> the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
> call sites by the respectively most suitable one.
> 
> While there also
> - introduce a !NUMA stub, eliminating the need for Arm (and potentially
>    other ports) to carry one individually,
> - drop the (strictly speaking wrong) "pure" attribute from the function,
> - extend a condition in dump_numa() to make sure that none of the
>    assertions would trigger for empty or (unlikely) single-page nodes (at
>    the same time this also prevents the warning printk() to be issued for
>    every empty [e.g. CPU-only] node).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

