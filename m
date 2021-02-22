Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628B321515
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87986.165308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9MZ-00084h-0e; Mon, 22 Feb 2021 11:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87986.165308; Mon, 22 Feb 2021 11:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9MY-00084H-Tm; Mon, 22 Feb 2021 11:26:50 +0000
Received: by outflank-mailman (input) for mailman id 87986;
 Mon, 22 Feb 2021 11:26:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9MX-00084C-SN
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:26:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9MX-0006zP-Rf
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:26:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9MX-00075a-Qu
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:26:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lE9MU-0000p2-LY; Mon, 22 Feb 2021 11:26:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=8gKJB4I4ITKySHnLFO8xtUprqhdgsEyu6r0sBZf/LRY=; b=jmXAAYyzehF2eUeWrw54nxl/47
	xguTi1JBiTo4Ae04e34aEiNAu+e5DN3Ud/BvhQaFqvXa2i+0VBqxvKovoEOSKe0pA2etHOu5CiO2O
	vZKO4H5Yus7fPwGHTdQxukOCSmOkP7jJtz4v8XSWByFqqkPdjDY0Xv/SExhL9II5ZoHE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24627.38134.451961.515628@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 11:26:46 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for 32-bit
 PV
In-Reply-To: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH][4.15] x86: mirror compat argument translation area for 32-bit PV"):
> Now that we guard the entire Xen VA space against speculative abuse
> through hypervisor accesses to guest memory, the argument translation
> area's VA also needs to live outside this range, at least for 32-bit PV
> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> uniformly.
> 
> While this could be conditionalized upon CONFIG_PV32 &&
> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
> keeps the code more legible imo.
> 
> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Despite the fact that this is trying to fix the current breakage, I
would still want to see a full maintainer review.

Thanks,
Ian.

