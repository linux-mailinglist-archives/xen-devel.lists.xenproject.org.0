Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9997A42EE40
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210083.366810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK02-00081G-Ib; Fri, 15 Oct 2021 09:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210083.366810; Fri, 15 Oct 2021 09:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK02-0007zM-Dp; Fri, 15 Oct 2021 09:59:38 +0000
Received: by outflank-mailman (input) for mailman id 210083;
 Fri, 15 Oct 2021 09:59:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK00-0007yV-DQ
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:59:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK00-0000us-AS
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:59:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbK00-0001tY-8r
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:59:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbJzt-0005Ed-HL; Fri, 15 Oct 2021 10:59:29 +0100
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
	bh=Vqw3aVQWcHjwZB6ejJhU2o21G6uco6OlVwp1rzUv06M=; b=SR24suf7Kt93E1p+amkmoF7JjA
	oKOIPuMtYZ9M/sRMY391cCcs3RVD07DHrurhvpCp6qXuIw2ZIxPp7zif4FaCX0pgmxwPZCcIjLfBp
	6LrexNRPZ+5DsChD/Hn4o1MUHbMpKmFIyFoKYTo8dj3I+WLwKk7zNgobIR0NhRri/ElY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24937.20736.976552.479677@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 10:59:28 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    xen-devel@lists.xenproject.org,
    Rahul Singh <rahul.singh@arm.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <e4eeaa45-e473-9cb1-a65e-70cb0fdfc443@suse.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
	<396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
	<alpine.DEB.2.21.2110141331310.9408@sstabellini-ThinkPad-T480s>
	<e4eeaa45-e473-9cb1-a65e-70cb0fdfc443@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI support for ARM."):
> On 15.10.2021 01:49, Stefano Stabellini wrote:
> > Replacing the 3 characters with 'x' solves the problem.
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/388721262
> 
> Interesting. I thought we permit UTF-8 in the sources; see e.g.
> tools/tests/x86_emulator/simd-sha.c using Σ. Is mkheader.py in need
> of adjustment? Of course I can see that right now the easiest is to
> use ASCII x, but I think it was deliberate to use × here.

I think in general we should permit UTF-8 in sources.

But:

> Then again, with the goal of the public headers being usable with
> pretty old compilers as well (C89 being the assumed baseline),
> excluding them from the permission to use UTF-8 may also be quite
> reasonable.

This is a good reason to do otherwise for the public headers.
Maybe this should be documented in CODING_STYLE (can be done after
feature freeze obviously).

That python has such botched unicode handling is a bug of course but
we could decide we think it's a feature :-).  In which case maybe
mkheaders should be adjusted to explicitly set IO to ascii so that
this will fail in local builds too.

Anyway, for now we need to replace the UTF-8 in this patch.

Thanks,
Ian.

