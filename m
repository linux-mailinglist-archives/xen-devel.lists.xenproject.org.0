Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7432A7B1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 18:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92512.174426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH8kn-0005Bf-UC; Tue, 02 Mar 2021 17:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92512.174426; Tue, 02 Mar 2021 17:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH8kn-0005BI-Qi; Tue, 02 Mar 2021 17:24:13 +0000
Received: by outflank-mailman (input) for mailman id 92512;
 Tue, 02 Mar 2021 17:24:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH8km-0005BD-6Y
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 17:24:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH8km-0001US-2D
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 17:24:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH8kl-0005AM-Vt
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 17:24:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lH8kh-00083h-4I; Tue, 02 Mar 2021 17:24:07 +0000
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
	bh=IUwfGLAvyw3DaspY6ewRjpbKrYG7c3TLvx2V98rwIsc=; b=gILBC3Qfv5OBpXA9U1xoRgalwp
	M9Z/bq3NRdrglfYQGNSrgamxcHoE0glTi28Jhr1BorXdDThXzAoABpd9Mx4dppIFV6RA9T1V09QRX
	/Eg8M3vXfgGMs6Ev80OkUJ+nEK9zokQ+NLUz32vTShNSbP2y0cpgrvTyJwx1Ev0sinZM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24638.29878.870671.474761@mariner.uk.xensource.com>
Date: Tue, 2 Mar 2021 17:24:06 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: xenstore_lib.h and libxenstore API/ABI problems
In-Reply-To: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>
References: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("xenstore_lib.h and libxenstore API/ABI problems"):
> libxenstored does not have a stable ABI.  xenstore_lib.h contains:
> 
> * struct xs_permissions, which contains an enum - one of the very common
> ABI traps.

enums are a problem when used as paraeter or return values or in
structs.  The mere *definition* of an enum is not a problem, although
it is a programmer hazard because it's an invitation to ABI fail.

But I think this is less bad in practice than we fear because we need
only concern ourselves with ABIs which can run on Xen-supported CPUs,
and for which these tools libraries might plausibly have been
compiled.

That means modern 32- and 64-bit x86 and ARM.  I think on all such
systems, an enum with values that will fit into an int, is precisely
an int in the ABI.  (I checked that this is true in practice on an
ARM32 Linux poerterbox belonging to the Debian Project.)

In which case we can change all of the formal parameters and struct
members from "enum xs_perm_type" to "int" and their ABI will remain
the same on all supported platforms.

> * the prototypes for expanding_buffer_ensure(), sanitise_value() and
> unsanitise_value(), which are inappropriately-namespaced symbols in
> libxenstore

I think it is unlikely that anything outside the Xen tools libraries
will link against these.  If anything, it is more likely that any such
linkage is a name clash.

I also think that a breach of ABI rules has no actual bad consequences
unless the symbol is actually referenced from a different executable
or DSO - and, specifically, an executable or DSO which is not
co-upgraded with the one at issue.

> * struct expanding_buffer with a classic string-handling trap (int len).

You mean that it should be a size_t, I suppose.  But I think this is
academic given that we want to de-publicise this.

> * Various xenstored-internal details such as struct xs_tdb_record_hdr,
> the internal permission bits, as well as stuff like
> xs_daemon_{root,run}dir(), and worse xs_daemon_tdb(),  which have
> absolutely no business being external to xenstored.

I think it is almost inconceivable that anyone has linked against
these symbols.

> My best suggestion is that we freeze 3.0.3 where it is, and create a 4.0
> which has all of the xenstore_lib.h content deleted.  That, AFAICT, gets
> us something which is 99% compatible, and stands a chance of being able
> to kept properly stable.

I suggest, instead, that we:

In 4.15:

 * Retain the current soname, but:
 * Delete the tdb internals from the header file and cease to export
   those symbols.
 * Rename the expanding_buffer and sanitise_value functions, to
   properly namespace them, and move them to a private header.

This is of course technically a breach of the ABI stability rules but
for the reasons I giveabove I don't think it will cause anyone any
trouble.

In xen-next:

 * Prophilactically change the uses of "enum xs_perm_type" to "int"
 * Or, add   XS__PERM_TYPE_ENSURE_ABI = 0x7fffffff  to the enum.

Ian.

