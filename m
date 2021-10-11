Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95982428A23
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205653.361025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrvB-0007IJ-CY; Mon, 11 Oct 2021 09:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205653.361025; Mon, 11 Oct 2021 09:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrvB-0007FK-94; Mon, 11 Oct 2021 09:48:37 +0000
Received: by outflank-mailman (input) for mailman id 205653;
 Mon, 11 Oct 2021 09:48:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZrvA-0007F7-4X
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:48:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZrvA-00023T-1a
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:48:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZrvA-0001GX-0V
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:48:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mZrv6-0000eQ-7m; Mon, 11 Oct 2021 10:48:32 +0100
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
	bh=Ng3hqqfwgfFQ/6WKuuXxllUNR+zKFeMHWw3MTOYoe8E=; b=RTbfTOrSUmN81cWzAXtyOuYezf
	VlfwaoTaQ7Rh5EUYJWN4nnRuCT25ypyq0P3Ej6x93D+eLPymXcOxvvSLTctOgzJHLLG4dvlfqkMjS
	lUlkKmumRH3q2hGbsG+Sj0F2cfyIRWiar+Ue2Q7zDzTcjfp5RyuGbp04vgpDFQJd9WE0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24932.2159.627949.196364@mariner.uk.xensource.com>
Date: Mon, 11 Oct 2021 10:48:31 +0100
To: Rahul Singh <rahul.singh@arm.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    <bertrand.marquis@arm.com>,
    <Andre.Przywara@arm.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Volodymyr  Babchuk <Volodymyr_Babchuk@epam.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
In-Reply-To: <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
	<548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"):
> Ian, for the 4.16 release, this series either needs completing with the
> additional flag implemented, or this patch needs reverting to avoid us
> shipping a broken interface.

I have caught up on this thread.  I think (hope?) it's converging.
If not please let me know and maybe I can help.

Can I ask to please be CC'd on the whole series for the patch(es) to
sort this out.  Please also make sure that those who commented are
CC'd.  I want the fixes that ultimately get committed to be the final
fixes (probably that means they should have consensus).

FTAOD, from a formal release management point of view: I regard those
putative fixes as bugfixes so they can go in after the feature freeze
(which is this Friday).  But if suitable fixes don't make it in within
the first few weeks of the freeze (and, as I expect, the maintainers
or I still regard this as an RC bug) then a revert of the new feature
will be the only option.

Ian.

