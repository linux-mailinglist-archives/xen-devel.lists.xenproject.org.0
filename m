Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDC93FD7BF
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 12:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176290.320794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLNY2-0005Bw-BM; Wed, 01 Sep 2021 10:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176290.320794; Wed, 01 Sep 2021 10:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLNY2-00059L-7v; Wed, 01 Sep 2021 10:32:50 +0000
Received: by outflank-mailman (input) for mailman id 176290;
 Wed, 01 Sep 2021 10:32:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLNY0-00059F-D7
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 10:32:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLNY0-0008BJ-BW
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 10:32:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLNY0-00079q-AT
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 10:32:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLNXn-00088q-W7; Wed, 01 Sep 2021 11:32:36 +0100
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
	bh=cwyy9inWMU2OFz4WdY/TbmnH7ieKYhzdnQ4z+pCsQBM=; b=fywikXv1TWe3rr4D8XCHI+zxMy
	BXOIy+KbegKgUFnGfLRq14O8RvOsuqm317+hru5SmnPvh9bcvwNtWHoVHleooPTQo72kqdRBswcpI
	8Vh5MrOy02knzvP218+jLlR4UDadge/A/68oMp/P99OXiGPpUnzQcB0IBMaWxd4Axfkw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24879.22211.552820.121035@mariner.uk.xensource.com>
Date: Wed, 1 Sep 2021 11:32:35 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Config: use Mini-OS master for xen-unstable
In-Reply-To: <d610c89b-fb46-338f-e4b6-5e1d5a0b5040@suse.com>
References: <20210831073039.7101-1-jgross@suse.com>
	<6837d551-6473-e34d-c0ae-043fcaa9482b@suse.com>
	<d610c89b-fb46-338f-e4b6-5e1d5a0b5040@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] Config: use Mini-OS master for xen-unstable"):
> How do you suggest to proceed then?
> 
> Will every Mini-OS commit require to be followed by a Xen commit then,
> which will either result in a test success, or in a revert of that Xen
> commit?

That is how the current arrangement works.  That's strict coupling.

If you want to decouple it, that's possible.  Ie, run a separate
osstest "branch" (ie, series of flights) for mini-os; have a separate
osstest-tested mini-os output branch, etc.

Wei, if we were to do that, should we have a "staging" and "main" for
mini-os in the main mini-os tree, or what ?

Ian.

