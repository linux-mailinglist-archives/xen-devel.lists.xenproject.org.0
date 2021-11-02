Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72429443224
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220393.381674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw8s-0006Tl-Cf; Tue, 02 Nov 2021 15:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220393.381674; Tue, 02 Nov 2021 15:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw8s-0006Qv-88; Tue, 02 Nov 2021 15:56:06 +0000
Received: by outflank-mailman (input) for mailman id 220393;
 Tue, 02 Nov 2021 15:56:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw8q-0006Qi-KN
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:56:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw8q-00006X-JY
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:56:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw8q-00030c-Ib
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:56:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhw8i-0001X8-4d; Tue, 02 Nov 2021 15:55:56 +0000
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
	bh=VPgzcvP9jLRZCcOlZbU69nGyvW5xQL1G2vHbhzY9N1E=; b=qWWM4d+SE6ki5+KVtyLBd6FmZZ
	gThmd5T/1iz0K2BsBCHdABuSc9mg8RNG/HwxM+ry3B26JiXmKwxj1L2od4oqTI3I74LtqZwcek+kP
	He/iRkjzKtPM57WcbbuzmBmMviptRlik9w/8QUIa1DKTLVkfh1bY5zv5Kf2pS2PkMVwg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24961.24458.443619.742444@mariner.uk.xensource.com>
Date: Tue, 2 Nov 2021 15:55:54 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Bertrand  Marquis <bertrand.marquis@arm.com>,
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
 [and 2 more messages]
In-Reply-To: <alpine.DEB.2.21.2111011402320.20134@sstabellini-ThinkPad-T480s>
References: <20211027082533.1406015-1-andr2000@gmail.com>
	<cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
	<d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
	<65886734-7333-4469-fcc1-6916db708f13@xen.org>
	<b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
	<6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org>
	<38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
	<a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
	<24954.51153.588540.850154@mariner.uk.xensource.com>
	<d7e4ae66-f648-e18e-79c8-fae6eb896f00@xen.org>
	<YXkU+DKYmvwo+kak@Air-de-Roger>
	<0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
	<24953.34635.645112.279110@mariner.uk.xensource.com>
	<24959.49313.936961.936820@mariner.uk.xensource.com>
	<alpine.DEB.2.21.2111011402320.20134@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers [and 2 more messages]"):
> This patch [1] is a straightforward 2 lines fix for vpci on ARM.  There
> is no risk for the release as the source file affected only builds when
> CONFIG_HAS_VPCI is enabled, and it is currently disabled on ARM.
> 
> At the same time, as we know vpci is not complete in 4.16 anyway, so the
> counter argument is that we don't need to fix it.
> 
> Given how trivial the fix is, and that it cannot break the build or
> runtime, I would take it.

Thanks, that is helpful.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

