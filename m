Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008834A6DB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101757.194792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlEe-0003yj-CR; Fri, 26 Mar 2021 12:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101757.194792; Fri, 26 Mar 2021 12:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlEe-0003yK-9K; Fri, 26 Mar 2021 12:06:40 +0000
Received: by outflank-mailman (input) for mailman id 101757;
 Fri, 26 Mar 2021 12:06:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlEd-0003yD-Ci
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:06:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlEd-0006AD-Bu
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:06:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlEd-0000pJ-BD
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:06:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPlEa-0002QG-09; Fri, 26 Mar 2021 12:06:36 +0000
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
	bh=Wz8piiJHDK2vi4SkKPPmew2L/Pp6ebgSx6gSK567z9M=; b=nfDFUL74BRj7vBzQzxXChBetMX
	mKXli+M+d1ozE2D7gwhcE5jXMOn0FfbAORezJp6EnRBbwmpqVp3TCTpoQJkj8xKV6H0ePzlEHIKku
	tp3/IeCovH5rj6XK1dBdQuGH2ZiH199MxV8Hr2SOjOgxBp6Bl2Vs7mAq9uoVI11b2o0A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.52811.830365.356741@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 12:06:35 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    raphning@gmail.com,
    edvin.torok@citrix.com,
    jgross@suse.com
Subject: Re: [PATCH for-4.15?] docs/design: Update xenstore-migration.md
In-Reply-To: <20210325111255.16330-1-julien@xen.org>
References: <20210325111255.16330-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15?] docs/design: Update xenstore-migration.md"):
> From: Julien Grall <jgrall@amazon.com>
> 
> It is not very clear the shared page adddress is not contained in the
> connection record. Additionally, it is misleading to say the grant
> will always point to the share paged as a domain is free to revoke the
> permission. The restore code would need to make sure it doesn't
> fail/crash if this is happening.
> 
> The sentence is now replaced with a paragraph explaining why the GFN is
> not preserved and that the grant is not guarantee to exist during
> restore.
> 
> Take the opportunity to replace "code" with "node" when description the
> permission.
> 
> Reported-by: Raphael Ning <raphning@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

