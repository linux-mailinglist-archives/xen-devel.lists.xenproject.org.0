Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4C1FC079
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 22:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlIe1-0006l5-IX; Tue, 16 Jun 2020 20:57:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jlIe0-0006l0-Ad
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 20:57:20 +0000
X-Inumbo-ID: f751d194-b013-11ea-b94f-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f751d194-b013-11ea-b94f-12813bfff9fa;
 Tue, 16 Jun 2020 20:57:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E245E207DD;
 Tue, 16 Jun 2020 20:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592341038;
 bh=Brg6lcDmWmGFAdocTb50l+iamy8nImIVbXsNyMt2UMQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=knFYrKdEqTayb8ciCvaoWT8LOB85KiNKGWoe1PuImaB82y4GlUpSyoCTLHPtEJc6X
 B5ro9eyOmugU+xQv0D0+Hn/FxfS21tlDL0pKQUNzC/hNwVAHVpaCkqnrs/SCFveldp
 KpsKh0q4A/7vLIratzoTQLf6DLpVVVhaFKkyKjdg=
Date: Tue, 16 Jun 2020 13:57:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
In-Reply-To: <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
Message-ID: <alpine.DEB.2.21.2006161322210.24982@sstabellini-ThinkPad-T480s>
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
 <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 16 Jun 2020, Julien Grall wrote:
> On 16/06/2020 02:00, Stefano Stabellini wrote:
> > On Sat, 13 Jun 2020, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > The documentation of pvcalls suggests there is padding for 32-bit x86
> > > at the end of most the structure. However, they are not described in
> > > in the public header.
> > > 
> > > Because of that all the structures would be 32-bit aligned and not
> > > 64-bit aligned for 32-bit x86.
> > > 
> > > For all the other architectures supported (Arm and 64-bit x86), the
> > > structure are aligned to 64-bit because they contain uint64_t field.
> > > Therefore all the structures contain implicit padding.
> > > 
> > > The paddings are now corrected for 32-bit x86 and written explicitly for
> > > all the architectures.
> > > 
> > > While the structure size between 32-bit and 64-bit x86 is different, it
> > > shouldn't cause any incompatibility between a 32-bit and 64-bit
> > > frontend/backend because the commands are always 56 bits and the padding
> > > are at the end of the structure.
> > > 
> > > As an aside, the padding sadly cannot be mandated to be 0 as they are
> > > already present. So it is not going to be possible to use the padding
> > > for extending a command in the future.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > ---
> > >      Changes in v3:
> > >          - Use __i386__ rather than CONFIG_X86_32
> > > 
> > >      Changes in v2:
> > >          - It is not possible to use the same padding for 32-bit x86 and
> > >          all the other supported architectures.
> > > ---
> > >   docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
> > >   xen/include/public/io/pvcalls.h | 14 ++++++++++++++
> > >   2 files changed, 24 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
> > > index 665dad556c39..caa71b36d78b 100644
> > > --- a/docs/misc/pvcalls.pandoc
> > > +++ b/docs/misc/pvcalls.pandoc
> > > @@ -246,9 +246,9 @@ The format is defined as follows:
> > >       			uint32_t domain;
> > >       			uint32_t type;
> > >       			uint32_t protocol;
> > > -    			#ifdef CONFIG_X86_32
> > > +			#ifndef __i386__
> > >       			uint8_t pad[4];
> > > -    			#endif
> > > +			#endif
> > 
> > 
> > Hi Julien,
> > 
> > Thank you for doing this, and sorry for having missed v2 of this patch, I
> > should have replied earlier.
> > 
> > The intention of the #ifdef blocks like:
> > 
> >    #ifdef CONFIG_X86_32
> >      uint8_t pad[4];
> >    #endif
> > 
> > in pvcalls.pandoc was to make sure that these structs would be 64bit
> > aligned on x86_32 too.
> > 
> > I realize that the public header doesn't match, but the spec is the
> > "master copy". 
> 
> So far, the public headers are the defacto official ABI. So did you mark the
> pvcall header as just a reference?

No, there is no document that says that the canonical copy of the
interface is pvcalls.pandoc. However, it was clearly spelled out from
the start on xen-devel (see below.) In fact, if you notice, this is the
first document under docs/misc that goes into this level of details in
describing a new PV protocol. Also note the title of the document which
is "PV Calls Protocol version 1".


In reply to Jan:
> A public header can't be "fixed" if it may already be in use by
> anyone. We can only do as Andrew and you suggest (mandate textual
> descriptions to be "the ABI") when we do so for _new_ interfaces from
> the very beginning, making clear that the public header (if any)
> exists just for reference.

What if somebody took the specification of the interface from
pvcalls.pandoc and wrote their own headers and code? It is definitely
possible. At the time, it was clarified that the purpose of writing such
a detailed specification document was that the document was the
specification :-)

See for instance this email (there are others):

https://marc.info/?l=linux-kernel&m=149815619513930&w=2

"""
This was done differently in the past, but now that we have a formal
process, a person in charge of new PV drivers reviews, and design
documents with clearly spelled out ABIs, I consider the design docs
under docs/misc as the official specification. We don't need headers
anymore, they are redundant. In fact, we cannot have two specifications,
and the design docs are certainly the official ones (we don't want the
specs to be written as header files in C). To me, the headers under
xen/include/public/io/ are optional helpers. It doesn't matter what's in
there, or if frontends and backends use them or not.

There is really an argument for removing those headers, because they
might get out of sync with the spec by mistake, and in those cases, then
we really end up with two specifications for the same protocol. I would
be in favor of `git rm'ing all files under xen/include/public/io/ for
which we have a complete design doc under docs/misc.
"""

(Andy and Roger agreed on the thread if you look at the follow-up
emails.)

