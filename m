Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E9339367
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 17:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97237.184633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkg2-0007Tx-Bm; Fri, 12 Mar 2021 16:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97237.184633; Fri, 12 Mar 2021 16:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkg2-0007Tb-8a; Fri, 12 Mar 2021 16:30:14 +0000
Received: by outflank-mailman (input) for mailman id 97237;
 Fri, 12 Mar 2021 16:30:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKkg0-0007TW-30
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:30:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKkfz-0003t3-VU
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:30:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKkfz-00017v-QI
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:30:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKkfq-0004PV-BQ; Fri, 12 Mar 2021 16:30:02 +0000
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
	bh=11VfRNUtWbl28Ty/YLVizfM8Yp/Q6vEhy6Izlmh3BfU=; b=BTp9kcuvztufkfFs3EHs+YMeWE
	mZmccxoJFZen8yE9DWVHI7uh6zzUrjAE+0nNkeg/xjnLa3xm2B9epyrh/PhJR8Wfhm+XdwYvkWD/6
	y9HQdNQVb8O51zcUB8lHOovSzvFCcsiO2lPxoJIUlthF9G5Kqd0bpwsvOeMFFGCk9SGI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.38665.981069.53322@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 16:30:01 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
In-Reply-To: <46176065-8ae3-cb42-f031-aad12512d29e@suse.com>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
	<ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
	<6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
	<e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
	<24651.15544.142804.468744@mariner.uk.xensource.com>
	<46176065-8ae3-cb42-f031-aad12512d29e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] gnttab: work around "may be used uninitialized" warning"):
> On 12.03.2021 11:04, Ian Jackson wrote:
> > But this is outside my usual area so I won't nack it either.
> 
> But would you be willing to release-ack v2?

Good question.  I don't think my code quality/style qualms etc. have
any bearing on the release question.

So, I will do that now:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

