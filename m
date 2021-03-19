Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47402341EC1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99272.188658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFVz-0002VJ-5E; Fri, 19 Mar 2021 13:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99272.188658; Fri, 19 Mar 2021 13:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFVz-0002Uu-1s; Fri, 19 Mar 2021 13:50:11 +0000
Received: by outflank-mailman (input) for mailman id 99272;
 Fri, 19 Mar 2021 13:50:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNFVw-0002Up-UT
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:50:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNFVw-0004LC-Su
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:50:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNFVw-0001FM-S0
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:50:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lNFVq-0008GX-JU; Fri, 19 Mar 2021 13:50:02 +0000
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
	bh=l09ndsQ7lTvklq3VAWZpHO+MFG0EPEtlp4PzVaYYYuU=; b=MailvVCpoEZhSnDPBEx58zz2hh
	Wvvoz9gq20MX7Q0e6U9Zw0stcbtNhsXlRTIm+bYW9ql6qKlZAj+qLeJpQ27NhGYba8UM+kkOe6nJ5
	8IzOrog7QactHJATLRk35zYviP5Y5ItZB+KhoTIzS/DKIDvkFzpoTfNwl4yg8r90ztcI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24660.44042.398498.293837@mariner.uk.xensource.com>
Date: Fri, 19 Mar 2021 13:50:02 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>,
    Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: Call for tools backports (was Re: preparations for 4.13.3)
In-Reply-To: <dd291769-9809-d858-1b64-4eca8761be2c@citrix.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
	<b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
	<24658.6228.390535.850901@mariner.uk.xensource.com>
	<e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
	<24660.42333.417431.528632@mariner.uk.xensource.com>
	<dd291769-9809-d858-1b64-4eca8761be2c@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: Call for tools backports (was Re: preparations for 4.13.3)"):
> The effects of the bug were twofold:
>  * A client actually requesting Reset_watches has the request rejected
>  * A client actually requesting Restrict got Reset_watches instead
> 
> We spotted the bug when trying to add soft-reset support to Xapi, where
> a Reset_watches request got a hard error and the guest choked.

Thanks for the info.  What fun.  I have taken it.

> >> Do we want to backport the -Og fixes so we can get ABI checking working?
> > As Jan says, I think these are still in a state of flux ?
> 
> The ABI checking side, yes, but the -Og is a prerequisite which is
> fairly self contained.

I think I would prefer to wait for the ABI checking as a whole to
congeal before backporting even this self-contained prereq.  Feel free
to try to change my mind if you think this is a wrong decision.

Thanks,
Ian.

