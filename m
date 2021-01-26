Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4B93045DA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 19:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75395.135750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4SdQ-00075V-LQ; Tue, 26 Jan 2021 18:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75395.135750; Tue, 26 Jan 2021 18:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4SdQ-000756-Hs; Tue, 26 Jan 2021 18:00:12 +0000
Received: by outflank-mailman (input) for mailman id 75395;
 Tue, 26 Jan 2021 18:00:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4SdP-000751-7E
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 18:00:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4SdP-0003iA-3e
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 18:00:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4SdP-0007dW-2A
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 18:00:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4SdB-0007Ju-AC; Tue, 26 Jan 2021 17:59:57 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=v20vDnA7iol2QTsFv9Zq6fBxOjQkztiDHFVIw61InOQ=; b=cNbD5UGRULmV30qQA33afcke4+
	38olZITizdc5NpcrG9dF8yunQ31ARKTGCxYaWBL6g+6kQLeUJmnWeeEbFpbPm5bkpj08HQl8SdoyU
	WA31CFGb3u6CrRS4rfRD3+Qm4uscWNR9qZobOMQE+I8QhEESd+vBG2SypJhqcuvoHPDk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.22685.67161.585056@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 17:59:57 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>,
    Jan Beulich <jbeulich@suse.com>,
CC: Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
In-Reply-To: <20210126174415.GA21858@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
	<20210114122912.GA2522@antioche.eu.org>
	<1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
	<20210114141615.GA9157@mail.soc.lip6.fr>
	<20210126174415.GA21858@mail.soc.lip6.fr>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH] Fix error: array subscript has type 'char'"):
> On Thu, Jan 14, 2021 at 03:16:15PM +0100, Manuel Bouyer wrote:
> > On Thu, Jan 14, 2021 at 02:25:05PM +0100, Jan Beulich wrote:
> > > Which means you're shifting the undefined-ness from the implementation

The undefined-ness is in the *specification*. [1]

> > > Isn't this something that wants changing in your ctype.h instead?
> > > the functions (or macros), as per the C standard

Jan, can you please check your facts before asserting the existence
of a pretty blatant bug in a platform's implementation of basic C
functions ?

From my copy of C99+TC1+TC2, para 7.4:

 1   In all cases the argument is an int, the value of which shall be
     representable as an unsigned char or shall equal the value of the
     macro EOF.  If the argument has any other value, the behavior is
     undefined. [...]

If char is signed, then it can contain -ve values.  Those values are
promoted to int by the usual integer promotions.  Naturally such
negative values are not representable as unsigned char.  Passing them
to ctype macros is UB.

So Manuel's ctypes.h is conforming and the compiler warning (which I
have seen on Linux too) is correct.

> I guess I'm going to give up on this one. We'll keep it as a local patch.

Manuel, your original patch:

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

(The R-A is FTAOD since IMO this is a bugfix.)

Ian.

[1] I agree that "fixing" ctypes.h everywhere might be nice (eg the
way glibc does it) but that has other implications and it is not
reasonable to expect platforms supporting Xen to do that.

