Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C82B3454F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093368.1448888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYsq-0002s6-OP; Mon, 25 Aug 2025 15:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093368.1448888; Mon, 25 Aug 2025 15:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYsq-0002pm-Lg; Mon, 25 Aug 2025 15:13:20 +0000
Received: by outflank-mailman (input) for mailman id 1093368;
 Mon, 25 Aug 2025 15:13:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uqYsp-0002pf-EE
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:13:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqYsn-005vHL-1F;
 Mon, 25 Aug 2025 15:13:17 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqYsn-000a4a-0r;
 Mon, 25 Aug 2025 15:13:17 +0000
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
	bh=lHN57CjYrGfvukxDYWrQmn0ZbJALxAN5jlleJlLHQx8=; b=r67UTa8vnpwxTHglyaTuj/JFQZ
	jTDnL7E+piWcrVssbYrZ+6LdYeB9CJazmW434IKM9rJoaDR4AifIN/UWfZRrcJMtaq85yhicgchiW
	cS1tmNLnoRGYvtzL/9ueQWJ4ga6ut/t2znvRa4pk7DNuFvYhXTrr40TWwbUvmr1HzGq4=;
Date: Mon, 25 Aug 2025 17:13:14 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
	sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator
 for HVM (x86)
Message-ID: <aKx9ihn4i0LCq0Bn@l14>
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-7-dmukhin@ford.com>
 <aKx4FtlhAbXxtZlB@l14>
 <844bb7f7-2e56-41e0-b304-77e9e9650eb1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <844bb7f7-2e56-41e0-b304-77e9e9650eb1@suse.com>

On Mon, Aug 25, 2025 at 05:03:40PM +0200, Jan Beulich wrote:
> On 25.08.2025 16:49, Anthony PERARD wrote:
> > On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
> >> -=item B<vuart="uart">
> >> +=item B<vuart=[ "sbsa_uart", "ns16550" ]>
> > 
> > This syntax here would inditace that `vuart` takes a list of items. You
> > could write instead:
> > 
> >     vuart="UART"
> > 
> > which seems more in line with the rest of the man page. Then you can add
> > some thing like "with UART been one of "sbsa_uart" or "ns16550". It's
> > possible to also have a sublist, like the `tee` option have.
> 
> But shouldn't the syntax already now allow for multiple items? Possibly
> even multiple ones of the same kind?

How does `vuart="uart"` allow for multiple items?

-- 
Anthony PERARD

