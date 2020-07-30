Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFC232986
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 03:28:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0xMQ-0004Gd-Ah; Thu, 30 Jul 2020 01:27:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k0xMP-0004GV-78
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 01:27:53 +0000
X-Inumbo-ID: e2f73c5e-d203-11ea-aa93-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2f73c5e-d203-11ea-aa93-12813bfff9fa;
 Thu, 30 Jul 2020 01:27:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D97042072A;
 Thu, 30 Jul 2020 01:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596072472;
 bh=yYLx8q35/fPrXE1BZgU0sNVrJc+bNHF+soXkDRUvL8o=;
 h=Date:From:To:cc:Subject:From;
 b=Kg1LuCQVFfm7lJnHaWeUtJqa0JkBHW80fDLWRUf4zeADjEYSQFbHbsTmd4/2WQLgD
 EMEXDyLdQTgaAhSe/hBTcTBKo1Tf27vC2rdNib83b6U+hLckUBIGaIavuR5hPTuRbL
 0pScOQfuPshSWFvNhm5rrNKNquDCo2R2fwozQsqE=
Date: Wed, 29 Jul 2020 18:27:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: committers@xenproject.org
Subject: kernel-doc and xen.git
Message-ID: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Bertrand.Marquis@arm.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

I would like to ask for your feedback on the adoption of the kernel-doc
format for in-code comments.

In the FuSa SIG we have started looking into FuSa documents for Xen. One
of the things we are investigating are ways to link these documents to
in-code comments in xen.git and vice versa.

In this context, Andrew Cooper suggested to have a look at "kernel-doc"
[1] during one of the virtual beer sessions at the last Xen Summit.

I did give a look at kernel-doc and it is very promising. kernel-doc is
a script that can generate nice rst text documents from in-code
comments. (The generated rst files can then be used as input for sphinx
to generate html docs.) The comment syntax [2] is simple and similar to
Doxygen:

    /**
     * function_name() - Brief description of function.
     * @arg1: Describe the first argument.
     * @arg2: Describe the second argument.
     *        One can provide multiple line descriptions
     *        for arguments.
     */

kernel-doc is actually better than Doxygen because it is a much simpler
tool, one we could customize to our needs and with predictable output.
Specifically, we could add the tagging, numbering, and referencing
required by FuSa requirement documents.

I would like your feedback on whether it would be good to start
converting xen.git in-code comments to the kernel-doc format so that
proper documents can be generated out of them. One day we could import
kernel-doc into xen.git/scripts and use it to generate a set of html
documents via sphinx.

At a minimum we'll need to start the in-code comment blocks with two
stars:

    /**

There could be also other small changes required to make sure the output
is appropriate.


Feedback is welcome!

Cheers,

Stefano

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kernel-doc
[2] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html

