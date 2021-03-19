Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FAA341E07
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99249.188598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNF4P-0007ZL-OE; Fri, 19 Mar 2021 13:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99249.188598; Fri, 19 Mar 2021 13:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNF4P-0007Yw-KW; Fri, 19 Mar 2021 13:21:41 +0000
Received: by outflank-mailman (input) for mailman id 99249;
 Fri, 19 Mar 2021 13:21:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNF4N-0007Yp-SB
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:21:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNF4N-0003o1-OH
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:21:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNF4N-0007os-NL
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:21:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lNF4H-00089u-Jl; Fri, 19 Mar 2021 13:21:33 +0000
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
	bh=Q8fjqgpZVjoqbFYbjK4175+vAtXULHxyNR7OQW9Lmck=; b=UZohfa8fob4N1k5NA+Noiwl5IS
	Ww5ILT1O1ahme65kvxMcvioPqlrQaxtTWmDQZtIpyV6x+msEku+XUBd5LQky/AvH0knZehMkHG1Cz
	7nmsxbDZX19f4bF+pMbFxaSM9iZTFDlZeupmDYhPo2ugjLD2yRkjUsbhTK7jv+P6d5t8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24660.42333.417431.528632@mariner.uk.xensource.com>
Date: Fri, 19 Mar 2021 13:21:33 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>,
    Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: Call for tools backports (was Re: preparations for 4.13.3)
In-Reply-To: <e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
	<b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
	<24658.6228.390535.850901@mariner.uk.xensource.com>
	<e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: Call for tools backports (was Re: preparations for 4.13.3)"):
> These are general backport requests, not specifically for 4.13

Thanks!

> d92ba1aa7cf8 - tools/ocaml: libxb: Harden stub_header_of_string()
> 59b087e39544 - tools/ocaml: Fix stubs build when OCaml has been compiled
> with -safe-string
> 78686437e949 - tools/ocaml: libxb: Avoid to use String_val() when value
> is bytes

These look straightforward.

> 2b8079610ec5 - tools/libxc: misc: Mark const the parameter 'keys' of
> xc_send_debug_keys()
...
> The penultimate one is an API change, but strictly in a relaxing
> direction.

I am happy with this and will backport it.

> a6ed77f1e033 - oxenstored: fix ABI breakage introduced in Xen 4.9.0
> 
>  The final one is an ABI change, but fixing a regression.

I'm not sure about this but I think the effect can only be on
"Reset_watches" ?  I guess I will take it.

> 5e31789634 - tools/ocaml/libs/xb: Do not crash after xenbus is unmapped
> 2a47797d1f - tools/oxenstored: Trim txhistory on xenbus reconnect
> c8b9670825 - tools/oxenstored: Fix quota calculation for mkdir EEXIST
> dc8caf214fb - tools/oxenstored: Reject invalid watch paths early
> 45dee7d92b - tools/oxenstored: mkdir conflicts were sometimes missed

Ack, thanks.

> Do we want to backport the -Og fixes so we can get ABI checking working?

As Jan says, I think these are still in a state of flux ?

Ian.

