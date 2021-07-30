Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E83DB89D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 14:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162537.298053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Rdt-0006HJ-Gh; Fri, 30 Jul 2021 12:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162537.298053; Fri, 30 Jul 2021 12:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Rdt-0006FA-DI; Fri, 30 Jul 2021 12:29:33 +0000
Received: by outflank-mailman (input) for mailman id 162537;
 Fri, 30 Jul 2021 12:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9Rdr-0006Et-QP
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 12:29:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9Rdr-0002sD-Ot
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 12:29:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9Rdr-0003tX-Nv
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 12:29:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m9Rdn-000649-3N; Fri, 30 Jul 2021 13:29:27 +0100
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
	bh=wOEIBWg82PBgSQJAoaCRwCgbaQ7dfZ6sa50uzvvEC2I=; b=V+L1m3Q5qmma9l6i/Xh6t2nQV9
	+gokR6vO9TG9IUV4MKFvg4B7p5Xe2DFGd/0InFL+5Bv+taB99OlDZIVQvrVma5PpiqdeHdoreorGa
	k52UYV8qWNbhxT8fU9RT3a30o2plv78qE2Qc+LdY7iL5ViaGrbhekoUf+I/xY5TsOxA4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24835.61606.911288.447053@mariner.uk.xensource.com>
Date: Fri, 30 Jul 2021 13:29:26 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jane Malalane <jane.malalane@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/lib: Fix strcmp() and strncmp()
In-Reply-To: <f5ef0640-4975-1306-0a40-d3fd7cbf52d3@citrix.com>
References: <20210727184715.17699-1-jane.malalane@citrix.com>
	<f5ef0640-4975-1306-0a40-d3fd7cbf52d3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] xen/lib: Fix strcmp() and strncmp()"):
> On 27/07/2021 19:47, Jane Malalane wrote:
> > -	register signed char __res;
> > +	unsigned char *csu = (unsigned char *)cs;
> > +	unsigned char *ctu = (unsigned char *)ct;
> 
> So there was actually one final thing, but it is holiday season, hence
> the lack of replies from others.

Oh.

> We should not be casting away const-ness on the pointers, because that
> is undefined behaviour and compilers are starting to warn about it. 

I don't think casting away const is UB.  Perhaps you (and perhaps
others) are seeing this in 6.3.2.3(2):

 | For any qualifier q, a pointer to a non-q-qualified type may be
 | converted to a pointer to the q-qualified version of the type; the
 | values stored in the original and converted pointers shall compare
 | equal.p

This does indeed define the meaning of *adding* qualifiers to a
pointer type but not define the meaning of removing them.  But that
whole paragraph is almost redundant, because in 6.3.2.3(7):

 | A pointer to an object or incomplete type may be converted to a
 | pointer to a different object or incomplete type. If the resulting
 | pointer is not correctly aligned57) for the pointed-to type, the
 | behavior is undefined. Otherwise, when converted back again, the
 | result shall compare equal to the original pointer.

This defines the meaning of conversions of pointers to object types
(like char*) regardless of the qualifiers.

I read that as "a pointer to an object type or to an incomplete type".
But the precise reading doesn't matter because these pointers are
actually to objects.

There's also this in 6.7.3(5):

 | If an attempt is made to modify an object defined with a
 | const-qualified type through use of an lvalue with
 | non-const-qualified type, the behavior is undefined.  made to refer
 | to an object defined with a volatile-qualified type through

But there is no attempt to modify.  (Also this paragraph doesn't apply
because characters in string literals have type char, not type const
char, but 6.4.6(6) directly prohibits modification of characters in
string literals.)

6.2.7(2) says

 | All declarations that refer to the same object or function shall
 | have compatible type; otherwise, the behavior is undefined.

but I don't think these pointers variables are declarations of the
chars pointed to.

> Therefore, we want something like:
> 
> const unsigned char *csu = (const unsigned char *)cs;

Having said all thst, I agree that that not casting away const would
be better (especially if it generates compiler warnings).

I pushed it already.  If thios is UB we should revert it but as I say
I think it isn't, so we can wait for a followup.

Thanks,
Ian.

