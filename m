Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA64455B9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 15:53:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221596.383388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mie69-0001zn-Q6; Thu, 04 Nov 2021 14:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221596.383388; Thu, 04 Nov 2021 14:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mie69-0001xz-Mk; Thu, 04 Nov 2021 14:52:13 +0000
Received: by outflank-mailman (input) for mailman id 221596;
 Thu, 04 Nov 2021 14:52:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mie67-0001xt-HL
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:52:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mie67-00065l-DJ
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:52:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mie67-0000JD-CF
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:52:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mie63-000333-HY; Thu, 04 Nov 2021 14:52:07 +0000
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
	bh=j8g5EwIwoncbJNqOrakepExTYWU+dWSo+hOQMfPfqOE=; b=J2j+jUuS9bZ5MdI9yKJmav7t2S
	UQW2JYinfsn5xX1HkzVgrUVnQgZEomWL9HtF8VM706xYICKb0AKDqZhjdAoX93d7yvAHRj4wgZ78h
	RP53ltS+eTRkhuUy1mSKGCyetInN2qQswMYXx5m1ywpsX0En/HqnAxlVYdPYzl+kEl2c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24963.62355.300645.675596@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 14:52:03 +0000
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH-for-4.16 1/2] configure: modify default of building rombios
In-Reply-To: <20211104120324.9668-2-jgross@suse.com>
References: <20211104120324.9668-1-jgross@suse.com>
	<20211104120324.9668-2-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH-for-4.16 1/2] configure: modify default of building rombios"):
> The tools/configure script will default to build rombios if qemu
> traditional is enabled. If rombios is being built, ipxe will be built
> per default, too.
> 
> This results in rombios and ipxe no longer being built per default when
> disabling qemu traditional.
> 
> Fix that be rearranging the dependencies:
> 
> - build ipxe per default
> - build rombios per default if either ipxe or qemu traditional are
>   being built
> 
> This modification prepares not building qemu traditional per default
> without affecting build of rombios and ipxe.

Thanks.  We had a conversation on irc about this.  In summary:

Reviewed-by: Ian Jackson <iwj@xenproject.org>


Discussion:

Both before and after this patch --with-system-ipxe --disable-ipxe (or
--with-system-ipxe on arm) would set IPXE_PATH but not cause ipxe to
be actually built.  I think that is correct.

We discussed the linkage between rombios and ipxe.  Our understanding
is that thbe intent was to support two configurations:
  qemu-trad + {hvmloader, rombios, ipxe}
  qemu-upstraem + {hvmloader, seabios, pxe rom provided by qemu}

Before this patch, --disable-rombios --enable-ipxe would be an error.
After this patch, it is tolerated (and indeed, it might occur with
only one of those options due to defaulting).  But we think that there
is no actual functional link between these pieces: ie, nothing will
actually go wrong.  You just might not have ipxe support since you
wouldn't be using trad at all.

We think that someone who explicitly manipulates the
--en/disable-rombios and --en/disable-ipxe options so as to construct
such a situation ought to know what they are doing and should get what
the asked for.

Most people will controlling this via --en/disable-qemu-trad, which
will do a plausible. thing.


I think *this* patch is a bugfix, although to rather obscure configure
behaviour.  I am inclined to release ack both this and the followup,
for the reasons I gave previously.

Comments (especially, anything to contradict what I wrote above) ASAP
please.


Thanks,
Ian.

