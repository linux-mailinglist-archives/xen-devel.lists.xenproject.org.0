Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F09303C77
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 13:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74932.134752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4N6N-0008I8-E4; Tue, 26 Jan 2021 12:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74932.134752; Tue, 26 Jan 2021 12:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4N6N-0008Hj-Ab; Tue, 26 Jan 2021 12:05:43 +0000
Received: by outflank-mailman (input) for mailman id 74932;
 Tue, 26 Jan 2021 12:05:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4N6L-0008He-Kl
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:05:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4N6L-0005OI-E5
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:05:41 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4N6L-0000wu-CX
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 12:05:41 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4N6I-0006ZX-1i; Tue, 26 Jan 2021 12:05:38 +0000
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
	bh=wOwlpKktZz+0GymA+q6iCPqbGs9DZPMhCB2IQb68D20=; b=2x1/gy/lLSf/6qkTiwRQYLH4tv
	Uhd5QzeAQ2eWPlq9UagmL6WhgwMMLA2PHVoaxC6ix14K7Wf7Bve7nRDuXwIw1CTA/iJ0GWYgB+99h
	2oncq82yrfJ3mB7ZJ3CXzLsi+UAanKnpnwsK6DmVOXJN+NrD9xVJFhvh7JgtWtjG+IXo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.1425.471671.120897@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 12:05:37 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 00/15] zstd decompression for DomU-s + fallout /
 consolidation
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3 00/15] zstd decompression for DomU-s + fallout / consolidation"):
> Only patches 1 and 2 are strictly intended for 4.15, paralleling
> the recent Dom0 side work (and re-using many of the files
> introduced there, for the stubdom build), but ones up to at least
> patch 6 may still want considering (and 4 already has a release
> ack).

Thanks.

> 01: libxenguest: add get_unaligned_le32()
> 02: libxenguest: support zstd compressed kernels

So these two are fine.

> 03: xen/decompress: make helper symbols static
> 04: libxenguest: "standardize" LZO kernel decompression code
> 05: libxenguest: drop redundant decompression declarations
> 06: libxenguest: simplify kernel decompression

I approve of cleanups of course.  But:

Which of these cleanups were posted before the LPD ?  I'm not
currently aware of any reason for a freeze exception here, so I think
those patches which didn't meet the LPD should wait.  Ones which *did*
meet the LPD should be considered on their merits.

If you could direct me to which those are I would be happy to review
them.

> 07: gunzip: drop INIT{,DATA} and STATIC

I release-nacked this because I saw you posted it with this Subject
  Subject: [PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC
which made me think you were targeting it for 4.15.  If not then fine.

Thanks,
Ian.

