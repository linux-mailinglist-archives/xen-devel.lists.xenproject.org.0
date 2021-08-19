Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8A3F1E3F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168951.308543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGl8P-0008SB-Og; Thu, 19 Aug 2021 16:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168951.308543; Thu, 19 Aug 2021 16:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGl8P-0008Ot-LX; Thu, 19 Aug 2021 16:43:17 +0000
Received: by outflank-mailman (input) for mailman id 168951;
 Thu, 19 Aug 2021 16:43:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGl8O-0008Ok-3J
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:43:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGl8O-0004RQ-2F
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:43:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGl8O-0005m7-1E
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:43:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGl8J-0002Iy-AO; Thu, 19 Aug 2021 17:43:11 +0100
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
	bh=U/JedYRgAVFfXGAzwBX4nxL0YLb67ajOy+X9NzwzsQc=; b=MsgO8BBvccqE9gTXTBrcOyUHmn
	rODZzoQQoUjp3mxWQh1dSRzr78C+ROp2PPLdghMcdrQFvcqwCDQ+m7myiPhYRd/CnC6PN+nSgYFx+
	1kzxoMCt04XWi4HtLGO/11XSBYv++1PYtMzAuNoBam7q+mvc6FZoAxKxMjL2GTxaaJ2U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24862.35359.95257.223452@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 17:43:11 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Ian Jackson <ian.jackson@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.15.1 and 4.13.4 [and 1 more messages]
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>,
	<8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("preparations for 4.15.1 and 4.13.4"):
> Ian: I did take the liberty to backport Anthony's
> 
> 5d3e4ebb5c71 libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype

Thanks.

> Beyond this I'd like the following to be considered:
> 
> 6409210a5f51 libxencall: osdep_hypercall() should return long
> bef64f2c0019 libxencall: introduce variant of xencall2() returning long
> 01a2d001dea2 libxencall: Bump SONAME following new functionality
> 6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)

I agree these are needed.

Don't we need these, or something like them in 4.14 and earlier too ?

> If those are to be taken (which means in particular if the question of
> the .so versioning can be properly sorted),
> 
> 198a2bc6f149 x86/HVM: wire up multicalls
> 
> is going to be required as a prereq. I have backports of all of the
> above ready (so I could put them in if you tell me to), but for
> 01a2d001dea2 only in its straightforward but simplistic form, which I'm
> not sure is the right thing to do.

So, I have queued 198a2bc6f149 too.

As for the ABI: 01a2d001dea2 introduces VERS_1.3 with xencall2L.
I think backporting it to 4.15 means declaring that that is precisely
what VERS_1.3 is, and that any future changes must be in VERS_1.4.

I checked that after the backport of 198a2bc6f149, the two files
defining VERS_1.3 are the same.  Well, they are different because of
  7ffbed8681a0
  libxencall: drop bogus mentioning of xencall6()
which is fine, since that symbol didn't exist in any version.

So I propose to bump xencall to 1.4 in staging, to make sure we don't
break the ABI for 1.3 by mistake.

Andrew Cooper writes ("Re: preparations for 4.15.1 and 4.13.4"):
> We can backport changes in SONAME safely so long as:
> 
> 1) We declare VERS_1.2 to be fixed and released.  This means that we
> bump to 1.3 for the next change, even if it is ahead of Xen 4.16 being
> release, and
> 
> 2) *All* ABI changes up to VERS_1.2 are backported.

I think this is what I am doing, except that I think Andy wrote "1.2"
instead of "1.3".  "1.2" is currently in staging-4.15, without my
queued series.

> The ABI called VERS_1.2 must be identical on all older branches to avoid
> binary problems when rebuilding a package against old-xen+updates, and
> then updating to a newer Xen.

Indeed.  But that is less relevant than the fact that this must also
be true for VERS_1.3 which is what we are introducing to 4.15 here :-).

Andy, I usually agree with you on ABI matters.  I think I am doing
what you mean.  Please correct me if I have misunderstood you.  If
what I hnve done is wrong, we should revert and/or fix it quickly on
staging-4.15.

(I'll ping you in IRC when I have pushed my queue to staging-4.15.)

Ian.

