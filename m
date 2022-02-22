Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE44BFD96
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277103.473527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXSV-0003CQ-22; Tue, 22 Feb 2022 15:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277103.473527; Tue, 22 Feb 2022 15:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXSU-0003A4-Uo; Tue, 22 Feb 2022 15:52:10 +0000
Received: by outflank-mailman (input) for mailman id 277103;
 Tue, 22 Feb 2022 15:52:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMXST-00039y-Fl
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:52:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMXST-0007yb-4e; Tue, 22 Feb 2022 15:52:09 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMXSS-000321-U3; Tue, 22 Feb 2022 15:52:09 +0000
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
	bh=HpekjQHQOvnEKBKtofVotHDgwg2wwhLiAdI4dGWecl0=; b=H4qWuT4rI67L0div2JcxZi5O0W
	I0k464T0GioqqSgWmGo0tpN1EEj/SIbNCqncM5SFZUwU1FzdEPRbmc0CZd6o5/m1hEDEMaaXhjg3K
	OyWahugQvk2VpzIjD9lGEpJzwzslycWq9hynAzLXlMeVzoNICkGgUib0F0LVQpXZoKR4=;
Message-ID: <74edb8fc-3103-78eb-6877-2d2d6bdfa86f@xen.org>
Date: Tue, 22 Feb 2022 15:52:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 01/70] xen/sort: Switch to an extern inline
 implementation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220222152645.8844-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/02/2022 15:26, Andrew Cooper wrote:
> There are exactly 3 callers of sort() in the hypervisor.  Callbacks in a tight
> loop like this are problematic for performance, especially with Spectre v2
> protections, which is why extern inline is used commonly by libraries.
> 
> Both ARM callers pass in NULL for the swap function, and while this might seem
> like an attractive option at first, it causes generic_swap() to be used, which
> forced a byte-wise copy.  Provide real swap functions so the compiler can
> optimise properly, which is very important for ARM downstreams where
> milliseconds until the system is up matters.
After the previous discussion, I was expecting the sentence "Provide 
real..." to be completely dropped. Instead the change should be 
justified with...

> This is also important for Control Flow Integrity schemes (e.g. x86 CET-IBT,
> ARM BTI), because tagged function(s) performing an arbitrary length swap of
> two arbitrary pointers is a very valuable gadget for an attacker.

... this one as this is the real reason of the change. Not the 
performance (unless you have numbers proving it).

> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

To be pedantic, my Nacked-by hasn't been yet revoked (see [1]). So you 
should have kept it in the new version.

Anyway, given that the patch makes sense for BTI, I am willing to 
replace the Nacked-by with an Acked-by:

Acked-by: Julien Grall <jgrall@amazon.com>

[1] 
https://lore.kernel.org/xen-devel/70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org/

Cheers,

-- 
Julien Grall

