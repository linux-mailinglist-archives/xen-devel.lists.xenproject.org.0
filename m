Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7D423BF7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202787.357803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4ld-0006in-MN; Wed, 06 Oct 2021 11:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202787.357803; Wed, 06 Oct 2021 11:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4ld-0006gA-Ix; Wed, 06 Oct 2021 11:07:21 +0000
Received: by outflank-mailman (input) for mailman id 202787;
 Wed, 06 Oct 2021 11:07:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY4lc-0006g4-03
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:07:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY4lb-0001df-PJ
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:07:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY4lb-0007Zv-Nq
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:07:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mY4lW-0003Bl-Sh; Wed, 06 Oct 2021 12:07:14 +0100
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
	bh=8YvJL4OWdFD/N1Sw+3f9Jy2wi9KCpLDkJC7zDxfmC0s=; b=fkI5B5akhfz+w0vjhpcF5EDUTs
	wZ8Z01wduvVs+ssnHf1p8cYZ8u0u2mQEci4blIJXyP2eUnnf4EhUI1/BYH4j2CZaFqaAFMLZ58VEx
	67RPbL3aXfJ2u4Z3854vd5gWX68kVkTvx/WVbQ7FHVlWtbKDLyt/07aoIt7afwl/MI14=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24925.33634.554859.2131@mariner.uk.xensource.com>
Date: Wed, 6 Oct 2021 12:07:14 +0100
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Andre Przywara <Andre.Przywara@arm.com>,
    Ian  Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
	<3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com>
	<alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s>
	<11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
	<alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
	<8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Rahul Singh writes ("Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in libxl"):
> libxl_defbool_val(libxl_defbool db) is implemented in such a way that it will assert 
> if db value is the default. Therefore we have to explicitly set it to LIBXL__DEFBOOL_FALSE for x86.
> 
> There are two option either we can have #ifdef or we can move the 
> libxl_defbool_setdefault(&b_info->arch_arm.vpci, false) to common code.

What is wrong with putting it in
libxl__arch_domain_build_info_setdefault
which I think exists precisely for this kind of thing ?

Ian.

