Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED17CE5CB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 20:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618762.962822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtAqe-0005uY-Fx; Wed, 18 Oct 2023 18:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618762.962822; Wed, 18 Oct 2023 18:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtAqe-0005s0-DF; Wed, 18 Oct 2023 18:00:48 +0000
Received: by outflank-mailman (input) for mailman id 618762;
 Wed, 18 Oct 2023 18:00:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtAqd-0005ru-Fw
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 18:00:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtAqa-0005Vp-Qu; Wed, 18 Oct 2023 18:00:44 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.7.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtAqa-0006Gh-IC; Wed, 18 Oct 2023 18:00:44 +0000
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
	bh=dZmFyEtccW/jCB1bZ7BhiKX1cYYgHp86OWJlkIjoF9E=; b=5AEw94U3sXnuNac7choBZU9Nm6
	DcHY4DoiTf7kinuyBEtCjHKH8FVEd4QcMS7IJZmCYzCRjk17QbrhhbcD2v+3GuUrBp79i4LS5Qwnj
	d5yO5IntHYagqZIJtG7MhkjOOiN3PAtp4A6x74oS66P2d+MzLjXrXs/AkNXVQ+aX7sf0=;
Message-ID: <f2b51b47-fdeb-45a6-92c7-5b21da1855fe@xen.org>
Date: Wed, 18 Oct 2023 19:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] console: make input work again for pv-shim
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <ed275abf-351f-5237-7e19-a3856f6d4272@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ed275abf-351f-5237-7e19-a3856f6d4272@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/10/2023 15:58, Jan Beulich wrote:
> From: Manuel Bouyer <bouyer@antioche.eu.org>
> 
> The use of rcu_lock_domain_by_id() right in switch_serial_input() makes
> assumptions about domain IDs which don't hold when in shim mode: The
> sole (initial) domain there has a non-zero ID. Obtain the real domain ID
> in that case (generalized as get_initial_domain_id() returns zero when
> not in shim mode).
> 
> Note that console_input_domain() isn't altered, for not being used when
> in shim mode (or more generally on x86).

I think it would be worth to either add a comment in 
console_input_domain() and/or #ifdef the code. In any case...

> 
> Fixes: c2581c58bec9 ("xen/console: skip switching serial input to non existing domains")
> Signed-off-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

...

Reviewed-by: Julien Grall <jgrall@amazon.com>


Also, should we consider it for xen 4.18? (I notice there is no for-4.18 
tag).

Cheers,

-- 
Julien Grall

