Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9D443218
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220380.381641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw6L-0004hl-EY; Tue, 02 Nov 2021 15:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220380.381641; Tue, 02 Nov 2021 15:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw6L-0004fZ-Ay; Tue, 02 Nov 2021 15:53:29 +0000
Received: by outflank-mailman (input) for mailman id 220380;
 Tue, 02 Nov 2021 15:53:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw6J-0004fT-9C
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:53:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw6J-0008Uo-6f
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:53:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw6J-0002hm-5p
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:53:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhw6A-0001UZ-Am; Tue, 02 Nov 2021 15:53:18 +0000
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
	bh=DxLq0cVfeU0Tm/MxmwSBOutW+q/oNYXWgPlqeJtAvd8=; b=ZGBqZWX4rKQkfLpfcCPkLtcClw
	xr1doif9CohFIOl6LYTrgMNhOq4x3cj1nTQW0nlZeUTaNrudW4YP+Zw3N4gcweRImqgWwWwfvaWp7
	k08zJcia9mm7a3ikKMMl0o+2KJZ6c3Xp9LZFvl3bCIvbDZl9X84KFyM7KX0rQXXM2Nss=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24961.24301.445326.724439@mariner.uk.xensource.com>
Date: Tue, 2 Nov 2021 15:53:17 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] x86/shstk: Fix use of shadow stacks with XPTI
 active
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <29c59040-a2bc-69d3-db02-1345b5aa2b8b@suse.com>
References: <20211102143935.17473-1-andrew.cooper3@citrix.com>
	<29c59040-a2bc-69d3-db02-1345b5aa2b8b@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH for-4.16] x86/shstk: Fix use of shadow stacks with XPTI active"):
> On 02.11.2021 15:39, Andrew Cooper wrote:
> > The call to setup_cpu_root_pgt(0) in smp_prepare_cpus() is too early.  It
> > clones the BSP's stack while the .data mapping is still in use, causing all
> > mappings to be fully read read/write (and with no guard pages either).  This
> > ultimately causes #DF when trying to enter the dom0 kernel for the first time.
> > 
> > Defer setting up BSPs XPTI pagetable until reinit_bsp_stack() after we've set
> > up proper shadow stack permissions.
> > 
> > Fixes: 60016604739b ("x86/shstk: Rework the stack layout to support shadow stacks")
> > Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

