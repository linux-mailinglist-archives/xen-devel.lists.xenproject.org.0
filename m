Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A20B34607
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093520.1449004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZHs-0003k1-8P; Mon, 25 Aug 2025 15:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093520.1449004; Mon, 25 Aug 2025 15:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZHs-0003h4-5A; Mon, 25 Aug 2025 15:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1093520;
 Mon, 25 Aug 2025 15:39:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uqZHq-0003gy-Km
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:39:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqZHo-005voC-1d;
 Mon, 25 Aug 2025 15:39:08 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqZHo-000bq4-1B;
 Mon, 25 Aug 2025 15:39:08 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=/uqv6/jAGNM2q9I3d3DwqzpTessIKGRFBu+WjNNqJVw=; b=WytB+AmiDLm6e1sRsd+DtT9dcj
	YunYFzA8H3oplw0/LY8FlP4sH7YOC4wAksuC7NG/O8jaOqPLPSwVSK68PnwtcxDsKAk5A6C36t7Aq
	y3HStwmPPR6dZPtBLeS8iRRVhuj5kth8AEMLIBVPgMrsLBWFMVvvHhFNc2UkyJNWDbTQ=;
Date: Mon, 25 Aug 2025 17:39:06 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
	sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator
 for HVM (x86)
Message-ID: <aKyDmsiYxC0kvvGw@l14>
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-7-dmukhin@ford.com>
 <aKx4FtlhAbXxtZlB@l14>
 <844bb7f7-2e56-41e0-b304-77e9e9650eb1@suse.com>
 <aKx9ihn4i0LCq0Bn@l14>
 <48f72997-ba07-4a9c-998e-76b02f2863f0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f72997-ba07-4a9c-998e-76b02f2863f0@suse.com>

On Mon, Aug 25, 2025 at 05:27:41PM +0200, Jan Beulich wrote:
> On 25.08.2025 17:13, Anthony PERARD wrote:
> > On Mon, Aug 25, 2025 at 05:03:40PM +0200, Jan Beulich wrote:
> >> On 25.08.2025 16:49, Anthony PERARD wrote:
> >>> On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
> >>>> -=item B<vuart="uart">
> >>>> +=item B<vuart=[ "sbsa_uart", "ns16550" ]>
> >>>
> >>> This syntax here would inditace that `vuart` takes a list of items. You
> >>> could write instead:
> >>>
> >>>     vuart="UART"
> >>>
> >>> which seems more in line with the rest of the man page. Then you can add
> >>> some thing like "with UART been one of "sbsa_uart" or "ns16550". It's
> >>> possible to also have a sublist, like the `tee` option have.
> >>
> >> But shouldn't the syntax already now allow for multiple items? Possibly
> >> even multiple ones of the same kind?
> > 
> > How does `vuart="uart"` allow for multiple items?
> 
> Precisely. I would have expected it to be e.g.
> 
> vuart = [ "ns16550", "ns16550", "sbsa-uart" ]

This is not an option.

Having mutliple ns16550 would do exactly the same thing as having a
single one. It's not possible to have both ns16550 and sbsa_uart at the
same time, one is for x86, one is for Arm. I don't know if it's possible
to have several sbsa_uart but the code in libxl doesn't have the
capability.

So overall, I don't think having a list in the xl.cfg syntax is useful
right now. It's easy to change later, I think.

> (i.e. the square brackets are part of the necessary syntax).
> 
> Jan

-- 
Anthony PERARD

