Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C442AB9F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 20:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207607.363499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maMBD-0001hu-IF; Tue, 12 Oct 2021 18:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207607.363499; Tue, 12 Oct 2021 18:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maMBD-0001fw-EA; Tue, 12 Oct 2021 18:07:11 +0000
Received: by outflank-mailman (input) for mailman id 207607;
 Tue, 12 Oct 2021 18:07:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maMBC-0001el-Or
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 18:07:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maMBC-0007JW-O7
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 18:07:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maMBC-0001Sr-N0
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 18:07:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maMB9-0005D8-FC; Tue, 12 Oct 2021 19:07:07 +0100
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
	bh=YX0yegc7EwoRGUjuEUlT1uQ7OUqbgelAEDuSKbxYD2U=; b=Rz2U5fqCwJ+RpYmE51GBtI7Vdl
	W3VfnQjxk6fQLmogtF9qfiAOpuPjYlVCrSZ89+gngUBNfHYz4T5/Fo7ykFwcwgtAsGA4bqw5jNQ0A
	AHW4oCstFYywsGbk+0A9H9WdT2+NdeH0NGru+zwEmUXoaABUQR+VXMLoT1AgUTtRNhOk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.52939.127687.784369@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 19:07:07 +0100
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Juergen Gross <jgross@suse.com>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
In-Reply-To: <0392bca6-4eb1-bc07-ecc9-fa1def156bfa@gmail.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
	<1633974539-7380-2-git-send-email-olekstysh@gmail.com>
	<24933.42667.311553.565032@mariner.uk.xensource.com>
	<60541d52-4b44-e212-cc06-bb41e9ce67f9@gmail.com>
	<24933.46428.243423.112077@mariner.uk.xensource.com>
	<0392bca6-4eb1-bc07-ecc9-fa1def156bfa@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr writes ("Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
> Please note, it is going to be a new version of this patch based on 
> today's discussion with Jan.

OK.  Please retain my R-b if you don't change any of the tools parts.

Ian.

