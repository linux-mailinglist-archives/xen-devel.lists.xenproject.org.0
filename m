Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B8323D4D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 14:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89338.168171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEtu5-0008BM-NT; Wed, 24 Feb 2021 13:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89338.168171; Wed, 24 Feb 2021 13:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEtu5-0008Ax-KC; Wed, 24 Feb 2021 13:08:33 +0000
Received: by outflank-mailman (input) for mailman id 89338;
 Wed, 24 Feb 2021 13:08:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEtu3-0008As-Kr
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:08:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEtu3-0005qg-IW
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:08:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEtu3-0008Kr-Eq
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:08:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEtu0-0006tE-7O; Wed, 24 Feb 2021 13:08:28 +0000
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
	bh=t9oyT3HlfOULSjznKaqRaJXa222QqsLAnEmpdcIGz8k=; b=CtDkP9sen4ugan+JYeYqJqWacA
	UXVZzgv25BOYnq2G8T9vO+8eSosiS3f/h21l7yFgrRRnOiUUWL7jrvDqQuG9IeUXUoPcOwAHeNM84
	bfYml255hA/wr030YsxcyVlbPl+htkBlUzZgAQOdvhw0uyW8keFpa0+CAC8Acm7iNywI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24630.20427.917602.787877@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 13:08:27 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
In-Reply-To: <ce93bd48-7ef3-cdb1-9429-ccd894895e9e@suse.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
	<24623.56913.290437.499946@mariner.uk.xensource.com>
	<ce93bd48-7ef3-cdb1-9429-ccd894895e9e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
> On 19.02.2021 16:50, Ian Jackson wrote:
> > Jan Beulich writes ("[PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
> >> 4: rename {get,put}_user() to {get,put}_guest()
> >> 5: gdbsx: convert "user" to "guest" accesses
> >> 6: rename copy_{from,to}_user() to copy_{from,to}_guest_pv()
> >> 7: move stac()/clac() from {get,put}_unsafe_asm() ...
> >> 8: PV: use get_unsafe() instead of copy_from_unsafe()
> > 
> > These have not got a maintainer review yet.  To grant a release-ack
> > I'd like an explanation of the downsides and upsides of taking this
> > series in 4.15 ?
> > 
> > You say "consistency" but in practical terms, what will happen if the
> > code is not "conxistent" in this sense ?
> > 
> > I'd also like to hear from aother hypervisor maintainer.
> 
> Meanwhile they have been reviewed by Roger. Are you willing to
> give them, perhaps with the exception of 7, a release ack as
> well?

Sorry, yes.

I found these explanations convincing  Thank you.

For all except 7,
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

For 7, I remember what I think was an IRC conversation where someone
(you, I think) said you had examined the generated asm and it was
unchanged.

If I have remembered that correctly, then for 7 as well:
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

If I have misremembered please do say.

Ian.

