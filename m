Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273FA4B516E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272002.466800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEH-0000QN-7Y; Mon, 14 Feb 2022 13:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272002.466800; Mon, 14 Feb 2022 13:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEH-0000Ka-3a; Mon, 14 Feb 2022 13:17:21 +0000
Received: by outflank-mailman (input) for mailman id 272002;
 Mon, 14 Feb 2022 13:17:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nJbEF-0000HQ-Sy
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:17:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJbEF-0004tZ-Ev; Mon, 14 Feb 2022 13:17:19 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.31.221]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJbEF-0002rK-8m; Mon, 14 Feb 2022 13:17:19 +0000
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
	bh=5cLKPL0xqeIDc8awr8RsdixcIyQvbQ/S6Qn2BVWVwws=; b=pgc4VSEvALEJzJ1hXr/JOqf0s9
	wgP42FpvwOKHqyz4GP/g2SJ/W1ojjySPIklufsPubxCHMaXyIUFi8zwMSZ49GpjA3daYDmFjr5CO3
	dA6JnSXyFd+AJsPvC8WVgQUONpYDgCJyEOn5v5x+FvSEVR/8qaPROkswaMrbp+zhiCWk=;
Message-ID: <70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org>
Date: Mon, 14 Feb 2022 13:17:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220214125127.17985-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/02/2022 12:50, Andrew Cooper wrote:
> There are exactly 3 callers of sort() in the hypervisor.  Callbacks in a tight
> loop like this are problematic for performance, especially with Spectre v2
> protections, which is why extern inline is used commonly by libraries.
> 
> Both ARM callers pass in NULL for the swap function, and while this might seem
> like an attractive option at first, it causes generic_swap() to be used, which
> forced a byte-wise copy.  Provide real swap functions so the compiler can
> optimise properly, which is very important for ARM downstreams where
> milliseconds until the system is up matters.

Did you actually benchmark it? Both those lists will have < 128 elements 
in them. So I would be extremely surprised if you save more than a few 
hundreds microseconds with this approach.

So, my opinion on this approach hasn't changed. On v1, we discussed an 
approach that would suit both Stefano and I. Jan seemed to confirm that 
would also suit x86.

Therefore, for this approach:

Nacked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

