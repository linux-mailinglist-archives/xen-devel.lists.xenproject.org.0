Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48489233CD2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 03:16:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Jee-0008QK-IP; Fri, 31 Jul 2020 01:16:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F22U=BK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1Jec-0008QF-OW
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 01:16:10 +0000
X-Inumbo-ID: 6aa3b138-d2cb-11ea-8df9-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aa3b138-d2cb-11ea-8df9-bc764e2007e4;
 Fri, 31 Jul 2020 01:16:10 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20744208E4;
 Fri, 31 Jul 2020 01:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596158169;
 bh=+/WozuFjWE7vvJYgQCOsmMDkf3muLMjbRPBlc7Gn768=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=P6bhlhRb86o/7urfxeC/miJn9H84X7Oh4EKBhkVJqbjc0d/Ec2RIiobcU2qvUjlHb
 oO8+OFwRnfuv+bvax3UVfFkT8JN+bEN6GlYENQwrTDwF/Wfk4ycQY+bKvHCClqjeT4
 cVWCl/ar73l26tW/JkXr15ENMOW7KGZId/xNSeOM=
Date: Thu, 30 Jul 2020 18:16:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: kernel-doc and xen.git
In-Reply-To: <24354.50708.138178.815210@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2007300956020.1767@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
 <785FBD2D-A67C-4740-9C5B-2ECCD0AEBFFC@citrix.com>
 <24354.50708.138178.815210@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1959419991-1596128184=:1767"
Content-ID: <alpine.DEB.2.21.2007300957310.1767@sstabellini-ThinkPad-T480s>
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
 Committers <committers@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1959419991-1596128184=:1767
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007300957311.1767@sstabellini-ThinkPad-T480s>

On Thu, 30 Jul 2020, Ian Jackson wrote:
> George Dunlap writes ("Re: kernel-doc and xen.git"):
> > > On Jul 30, 2020, at 2:27 AM, Stefano Stabellini <sstabellini@kernel.org> wrote:
> ...
> > > I did give a look at kernel-doc and it is very promising. kernel-doc is
> > > a script that can generate nice rst text documents from in-code
> > > comments. (The generated rst files can then be used as input for sphinx
> > > to generate html docs.) The comment syntax [2] is simple and similar to
> > > Doxygen:
> > > 
> > >    /**
> > >     * function_name() - Brief description of function.
> > >     * @arg1: Describe the first argument.
> > >     * @arg2: Describe the second argument.
> > >     *        One can provide multiple line descriptions
> > >     *        for arguments.
> > >     */
> > > 
> > > kernel-doc is actually better than Doxygen because it is a much simpler
> > > tool, one we could customize to our needs and with predictable output.
> > > Specifically, we could add the tagging, numbering, and referencing
> > > required by FuSa requirement documents.
> > > 
> > > I would like your feedback on whether it would be good to start
> > > converting xen.git in-code comments to the kernel-doc format so that
> > > proper documents can be generated out of them. One day we could import
> > > kernel-doc into xen.git/scripts and use it to generate a set of html
> > > documents via sphinx.
> > 
> > `git-grep ‘^/\*\*$’ ` turns up loads of instances of kernel-doc-style comments in the tree already.  I think it makes complete sense to:
> > 
> > 1. Start using tools to pull the existing ones into sphinx docs
> > 2. Skim through the existing ones to make sure they’re accurate / useful
> > 3. Add such comments for elements of key importance to the FUSA SIG
> > 4. Encourage people include documentation for new features, &c
> 
> I have no objection to this.  Indeed switching to something the kernel
> folks find useable is likely to be a good idea.
> 
> We should ideally convert the existing hypercall documentation, which
> is parsed from a bespoke magic comment format by a script in xen.git.

I agree.

Great, thank you both for the feedback!
--8323329-1959419991-1596128184=:1767--

