Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DBA42D849
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 13:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209263.365664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz0j-0002U4-St; Thu, 14 Oct 2021 11:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209263.365664; Thu, 14 Oct 2021 11:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz0j-0002SH-Pb; Thu, 14 Oct 2021 11:34:57 +0000
Received: by outflank-mailman (input) for mailman id 209263;
 Thu, 14 Oct 2021 11:34:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maz0i-0002SB-NU
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 11:34:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maz0i-0007Kl-JB
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 11:34:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maz0i-0008WI-I7
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 11:34:56 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maz0e-0002Fd-Ue; Thu, 14 Oct 2021 12:34:53 +0100
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
	bh=khhwplVHTvRXCWsE6AjUAL0Z2TBNR2tQRRP7dR9X7Oc=; b=sGDy88FxuJ6e9vmgZX+uIkqmjh
	ukqTM9DB0hga9eKWmqaBNUiKO6NXqU24F9Ycn3pv9/UDIB7hL0roSTbTOdVFecBIiRSpporVzhJrq
	3mlOWaWMTd2jtLm6OuJrUr+ClQNWM/7si4G0YS7ose7sBPLoIxe96u2QR1Qepj5FsC9Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24936.5596.598869.471516@mariner.uk.xensource.com>
Date: Thu, 14 Oct 2021 12:34:52 +0100
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Wei Liu <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    bertrand.marquis@arm.com
Subject: Re: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
In-Reply-To: <20211014084718.21733-1-michal.orzel@arm.com>
References: <20211014084718.21733-1-michal.orzel@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Michal Orzel writes ("[PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag""):
> This reverts commit 2075b410ee8087662c880213c3aca196fb7ade22.
> 
> During the discussion [1] that took place after
> the patch was merged it was agreed that it should
> be reverted to avoid introducing a bad interface.
> 
> Furthermore, the patch rejected usage of flag
> XEN_DOMCTL_CDF_vpci for x86 which is not true
> as it should be set for dom0 PVH.
> 
> Due to XEN_DOMCTL_CDF_vpmu being introduced after
> XEN_DOMCTL_CDF_vpci, modify its bit position
> from 8 to 7.
> 
> [1] https://marc.info/?t=163354215300039&r=1&w=2

FTAOD, I don't think this will be necessary, but preemptively,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

