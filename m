Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A82443AFB1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 12:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216344.375914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJJs-0000KE-PD; Tue, 26 Oct 2021 10:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216344.375914; Tue, 26 Oct 2021 10:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJJs-0000Gu-Lf; Tue, 26 Oct 2021 10:04:36 +0000
Received: by outflank-mailman (input) for mailman id 216344;
 Tue, 26 Oct 2021 10:04:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfJJq-0000Gl-Ki
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 10:04:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfJJq-0005yu-HA
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 10:04:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfJJq-0003EX-G9
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 10:04:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mfJJm-00044f-Oh; Tue, 26 Oct 2021 11:04:30 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Yjl1rcjFEXjSLwz2EKQBWco4zIP0G975jub8mTc1d04=; b=BYJYp7ARy/9MzRC4WXu57u2GaR
	fEs+a3WvCynTYKGmxPDOlQWvMxm82KQ6x1OkO9u5Fg6IKcwl9UW/D9wceUEI809G9Pwkg6EwONoxv
	HCBxOrSLaVsfwrsi2YNFpK2FW79Ml3IsWYdGLxBM4UcPQga1j2xYHP1tFjBkbIiOUbiI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24951.53934.212971.950346@mariner.uk.xensource.com>
Date: Tue, 26 Oct 2021 11:04:30 +0100
To: Juergen Gross <jgross@suse.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] OSStest: explicitly enable building qemu-traditional
In-Reply-To: <24950.53501.802356.661667@mariner.uk.xensource.com>
References: <20211025095438.27599-1-jgross@suse.com>
	<24950.53501.802356.661667@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH v2] OSStest: explicitly enable building qemu-traditional"):
> Juergen Gross writes ("[PATCH v2] OSStest: explicitly enable building qemu-traditional"):
> > It is planned to no longer build qemu-traditional per default.
> > 
> > In order to be able to continue running tests with ioemu-stubdom run
> > configure with --enable-qemu-traditional.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Acked-by: Ian Jackson <iwj@xenproject.org>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> And pushed to osstest pretest.  I will let you know how it goes.

This passed the self-test (so it is in producetion), but, I observe
that it does this[1]:

                   if grep -q --  tools/configure ; then
                       qemutrad=
                   fi
   ...
   + grep -q -- tools/configure

I think this only works because the build has its stdin redirected
from /dev/null.  That's not going to change so it's not a bug but it
seems quite odd and possibly a latent bug.

Thanks,
Ian.

[1]
http://logs.test-lab.xenproject.org/osstest/logs/165863/build-arm64-xsm/6.ts-xen-build.log
http://logs.test-lab.xenproject.org/osstest/logs/165863/build-arm64-xsm/info.html

