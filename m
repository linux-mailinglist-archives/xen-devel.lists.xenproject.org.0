Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCD302487
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 13:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74052.133099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l40Wz-00005x-Mv; Mon, 25 Jan 2021 11:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74052.133099; Mon, 25 Jan 2021 11:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l40Wz-00005X-Ji; Mon, 25 Jan 2021 11:59:41 +0000
Received: by outflank-mailman (input) for mailman id 74052;
 Mon, 25 Jan 2021 11:59:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l40Wy-00005S-4l
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:59:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l40Wy-0003XR-2p
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:59:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l40Wy-000502-0j
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:59:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l40Wt-0003YA-7t; Mon, 25 Jan 2021 11:59:35 +0000
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
	bh=J+d/pOEsWH8udWLxUki8cuZJwH8aP2TtEsfEe99L78Y=; b=l8+sxiOEv5MEaFGr01HjHfAlNe
	N0tlOata37fbr9ES+JHYPRvLxOnPY5KoC4BVkDZvZeGZBe89P2v1E4f8sEejN1VGGQs8NhDHccQ47
	cgohvfe6Jr/ccnRfZZbMwlCnogb9hT2hUJE41MBb2GJ2huhkCIP8vLrxP7Z5zAjG+1qw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24590.45734.945505.310666@mariner.uk.xensource.com>
Date: Mon, 25 Jan 2021 11:59:34 +0000
To: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel
 decompression code
In-Reply-To: <20210121150233.elijzzfud3cftrjm@liuwe-devbox-debian-v2>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<4fb01879-4b9c-e711-ecd0-39b0e4d50878@suse.com>
	<20210121150233.elijzzfud3cftrjm@liuwe-devbox-debian-v2>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Wei Liu writes ("Re: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel decompression code"):
> On Tue, Jan 19, 2021 at 04:16:35PM +0100, Jan Beulich wrote:
> > Add a DOMPRINTF() other methods have, indicating success. To facilitate
> > this, introduce an "outsize" local variable and update *size as well as
> > *blob only once done. The latter then also avoids leaving a pointer to
> > freed memory in dom->kernel_blob in case of a decompression error.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Wei Liu <wl@xen.org>

The latter part of this is a bugfix which ought to go into 4.15, I
think, and be backported.

I don't mind throwing in the DOMPRINTF too.

Ian.

