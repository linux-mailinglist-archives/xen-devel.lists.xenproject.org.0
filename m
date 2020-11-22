Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C872BC35D
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 04:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33148.64238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgfyZ-0007SP-Lt; Sun, 22 Nov 2020 03:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33148.64238; Sun, 22 Nov 2020 03:23:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgfyZ-0007S0-Ii; Sun, 22 Nov 2020 03:23:43 +0000
Received: by outflank-mailman (input) for mailman id 33148;
 Sun, 22 Nov 2020 03:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9StC=E4=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kgfyV-0007RH-HJ
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 03:23:42 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54e51dfc-e980-4aeb-87f2-886d8d9db842;
 Sun, 22 Nov 2020 03:23:35 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kgfxw-0001fc-2G; Sun, 22 Nov 2020 03:23:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9StC=E4=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1kgfyV-0007RH-HJ
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 03:23:42 +0000
X-Inumbo-ID: 54e51dfc-e980-4aeb-87f2-886d8d9db842
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 54e51dfc-e980-4aeb-87f2-886d8d9db842;
	Sun, 22 Nov 2020 03:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t7P1qjxLtvKyLv5lupmc5Zc5j0L3lqaoBXMlGIL9vWk=; b=BCb+FFzpwYCsAL5/GuZs0qQqU7
	2wigu715rAloO1MXfHFDjsI/DCCkjrJ0RLz4Myz+wD98+zNWw6243kPWNzvqzMn6Tn8JVpmOuQv+x
	7EKe3xartwVOhq4ran1ZhW92oaIukRN20h1OI3pPMusUrtae1AY4TqDUCPUPtiDgxz6eQOoVcrvcz
	Ara6lCihfF7KrYMxKPcv522GOw1XE7kmR9pLBWd69WCJIf1380JdPIessAMMrwuE8sqCmQUL7YEHL
	BXN0W+EBw/mKx6JrVL7roopk6K2PnHDj+T1EiV35semdke1klNMJQXZf1Gvzraa/TLsC310jvDxAq
	zJ5cWKdw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgfxw-0001fc-2G; Sun, 22 Nov 2020 03:23:04 +0000
Date: Sun, 22 Nov 2020 03:23:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: trix@redhat.com
Cc: joe@perches.com, clang-built-linux@googlegroups.com,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net,
	kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
	linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
	keyrings@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, alsa-devel@alsa-project.org,
	bpf@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-nfs@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
Message-ID: <20201122032304.GE4327@casper.infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121165058.1644182-1-trix@redhat.com>

On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
> The fixer review is
> https://reviews.llvm.org/D91789
> 
> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
> The false positives are caused by macros passed to other macros and by
> some macro expansions that did not have an extra semicolon.
> 
> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
> warnings in linux-next.

Are any of them not false-positives?  It's all very well to enable
stricter warnings, but if they don't fix any bugs, they're just churn.

