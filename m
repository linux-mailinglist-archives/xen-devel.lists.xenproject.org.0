Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37252338A19
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 11:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96975.183993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKf32-0007of-2V; Fri, 12 Mar 2021 10:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96975.183993; Fri, 12 Mar 2021 10:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKf31-0007oE-Va; Fri, 12 Mar 2021 10:29:35 +0000
Received: by outflank-mailman (input) for mailman id 96975;
 Fri, 12 Mar 2021 10:29:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKf30-0007o6-Mt
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:29:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKf30-0005bx-Jd
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:29:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKf30-00037i-Ik
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:29:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKf2p-0003Z1-Ah; Fri, 12 Mar 2021 10:29:23 +0000
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
	bh=yGdcISLXILgnM+oQAr1inXBMzVkxhIog+rnf0NeWGWo=; b=WV/14NNTfrMAQ34OURccVv3wn5
	3ZfBYIIVKplbeUiWOb7XNJzS/Lhn0zrRipl86RmdEE43Ig/9kmX4i0AuarwRWFtCC6qixjW49f7gz
	GydeVms6IQMHII4BlwcsjdKyqANI87SqC+EmzY5L9EhhArzJTByHwS63rANKIxMcXcq4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.17027.10811.145589@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 10:29:23 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
In-Reply-To: <7185c052-3e66-6202-f820-76568b2b1228@suse.com>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
	<ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
	<6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
	<e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
	<24651.15544.142804.468744@mariner.uk.xensource.com>
	<7185c052-3e66-6202-f820-76568b2b1228@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] gnttab: work around "may be used uninitialized" warning"):
> On 12.03.2021 11:04, Ian Jackson wrote:
> > Julien Grall writes ("Re: [PATCH][4.15] gnttab: work around "may be used uninitialized" warning"):
> >> This is pretty much what we are already doing slowly by initializing 
> >> values to shut up older compilers. I agree this is more limited, but we 
> >> also waive off diagnostics from every single compiler in that code 
> >> rather than just one version.
> >>
> >> Hence why I suggested dropping -Werror for older compiler. This is not 
> >> ideal but it would give us the ability to keep support for dinausor 
> >> compiler and not hamper our ability to take advantage of newer compiler 
> >> diagnostics.
> > 
> > I agree with Julien.  I think we should avoid adding these redundant
> > initialisers for the reasons he gives.
> 
> I find this odd, not only because it is contrary to what we've done so
> far. What if more modern gcc issues a false-positive warning? If we'd
> fix it there, where would you suggest to draw the line? Imo our tree
> should build without issues on all compiler versions which we state we
> permit to be used.
> 
> Of course in the case here I could add a "default:" to the switch(),
> but this would still only work around the compiler issue. Would the
> two of you consider this any better?
> 
> Also, Ian - do you have any alternative suggestion towards making the
> build work again (in the more general case, i.e. irrespective of the
> alternative suggestion for this specific case just above)? Not using
> -Werror on old compilers (again - where would we draw the line) was
> already objected to by me.

I read your objection to not using -Werror for such old compilers but
I did not agree with it.

I am sympathetic to Julien's desire to try to limit the set of
supported compilers.

Ian.

