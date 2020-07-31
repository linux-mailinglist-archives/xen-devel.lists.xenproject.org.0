Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C3F234912
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 18:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1XkE-0007Xq-IF; Fri, 31 Jul 2020 16:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F22U=BK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1XkD-0007Xl-CK
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 16:18:53 +0000
X-Inumbo-ID: 8613ed60-d349-11ea-8e66-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8613ed60-d349-11ea-8e66-bc764e2007e4;
 Fri, 31 Jul 2020 16:18:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF86522B3F;
 Fri, 31 Jul 2020 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596212332;
 bh=wGcVS68wxyzd53wI3zCnPCufYyT7AXC3KRChuAG9S88=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GRD67L9XqoJZFQ9gPcQwYZxo7jiVioPpnDygvv/5xQUDtmAP4vJlb70r83pFf0wK4
 CfZKmShJgoNRJLtBdkhRYCYdD+f1IhnQVMW2R/RkwWVFWCJ5q8aSH9hwrHq3A7jylC
 vU8Kp282ex1WsDdBRwtair4LDusvBHbR9l8688PE=
Date: Fri, 31 Jul 2020 09:18:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: kernel-doc and xen.git
In-Reply-To: <F09D32F7-4826-421B-99A6-3E94756FFCEF@citrix.com>
Message-ID: <alpine.DEB.2.21.2007310918360.1767@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
 <9421ec73-1ec0-844f-0014-bd5a36a4036f@suse.com>
 <F09D32F7-4826-421B-99A6-3E94756FFCEF@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1155002912-1596212332=:1767"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1155002912-1596212332=:1767
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 31 Jul 2020, George Dunlap wrote:
> > On Jul 31, 2020, at 12:29 PM, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 30.07.2020 03:27, Stefano Stabellini wrote:
> >> Hi all,
> >> 
> >> I would like to ask for your feedback on the adoption of the kernel-doc
> >> format for in-code comments.
> >> 
> >> In the FuSa SIG we have started looking into FuSa documents for Xen. One
> >> of the things we are investigating are ways to link these documents to
> >> in-code comments in xen.git and vice versa.
> >> 
> >> In this context, Andrew Cooper suggested to have a look at "kernel-doc"
> >> [1] during one of the virtual beer sessions at the last Xen Summit.
> >> 
> >> I did give a look at kernel-doc and it is very promising. kernel-doc is
> >> a script that can generate nice rst text documents from in-code
> >> comments. (The generated rst files can then be used as input for sphinx
> >> to generate html docs.) The comment syntax [2] is simple and similar to
> >> Doxygen:
> >> 
> >>    /**
> >>     * function_name() - Brief description of function.
> >>     * @arg1: Describe the first argument.
> >>     * @arg2: Describe the second argument.
> >>     *        One can provide multiple line descriptions
> >>     *        for arguments.
> >>     */
> >> 
> >> kernel-doc is actually better than Doxygen because it is a much simpler
> >> tool, one we could customize to our needs and with predictable output.
> >> Specifically, we could add the tagging, numbering, and referencing
> >> required by FuSa requirement documents.
> >> 
> >> I would like your feedback on whether it would be good to start
> >> converting xen.git in-code comments to the kernel-doc format so that
> >> proper documents can be generated out of them. One day we could import
> >> kernel-doc into xen.git/scripts and use it to generate a set of html
> >> documents via sphinx.
> > 
> > How far is this intended to go? The example is description of a
> > function's parameters, which is definitely fine (albeit I wonder
> > if there's a hidden implication then that _all_ functions
> > whatsoever are supposed to gain such comments). But the text just
> > says much more generally "in-code comments", which could mean all
> > of them. I'd consider the latter as likely going too far.
> 
> I took him to mean comments in the code at the moment, which describe some interface, but aren’t in kernel-doc format.  Naturally we wouldn’t want *all* comments to be stuffed into a document somewhere.

+1
--8323329-1155002912-1596212332=:1767--

