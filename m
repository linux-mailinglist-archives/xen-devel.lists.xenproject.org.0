Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA47A2D145
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 00:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884113.1293911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXQ1-0008Ce-IK; Fri, 07 Feb 2025 23:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884113.1293911; Fri, 07 Feb 2025 23:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXQ1-00089v-F4; Fri, 07 Feb 2025 23:05:53 +0000
Received: by outflank-mailman (input) for mailman id 884113;
 Fri, 07 Feb 2025 23:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgXQ0-00089n-7G
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 23:05:52 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12cb10e1-e5a8-11ef-a073-877d107080fb;
 Sat, 08 Feb 2025 00:05:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 225E0A43D31;
 Fri,  7 Feb 2025 23:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB59C4CED1;
 Fri,  7 Feb 2025 23:05:47 +0000 (UTC)
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
X-Inumbo-ID: 12cb10e1-e5a8-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738969549;
	bh=pOCr/yYOF7I5gr2U/WmPpLvW7YxHUG8btNmSAtU7S3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O3ZTb+AeYrtQwi2iP1/9mBRrjHBRhEjg9NFzbiwLT/6xoxWDhlOK68YwCaWp83J1N
	 eYXWyHZDco+NP5KmmAmkjyFHMhmL2BVces0Q/h5XeODNHKjQoqQ7bagy55D3Rdbzxz
	 P72wpaYOqHhp4sqdcy9OTPeaI8hLvWuT3/cYFmVxbhMEf+1UE7ZkeXGdB8QPqmjv0w
	 iZ3tagQ5bf9mfGmGo4WcODopaZuLu8qjue5h50zNusWggY53eKeuPqWjN2LI++yQCj
	 60h7oS/Xbpgcoa/dpOZ+sU0l3g/Z82RVV9ryUkpfhXy/a15KFnUeMAPFpR3nMnbr2e
	 VWP4W6PgBI4+w==
Date: Fri, 7 Feb 2025 15:05:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, 
    alejandro.vallejo@cloud.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org, 
    roger.pau@citrix.com, bertrand.marquis@arm.com
Subject: Re: [PATCH] automation: enable UBSAN for debug tests
In-Reply-To: <3bb8a7dd-3b3c-43a4-9f50-37c4134eb204@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502071459560.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop> <3bb8a7dd-3b3c-43a4-9f50-37c4134eb204@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Feb 2025, Andrew Cooper wrote:
> On 06/02/2025 2:37 am, Stefano Stabellini wrote:
> > automation: enable UBSAN for debug tests
> >
> > Enable CONFIG_UBSAN and CONFIG_UBSAN_FATAL for the ARM64 and x86_64
> > build jobs, with debug enabled, which are later used for Xen tests on
> > QEMU and/or real hardware.
> >
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, but aren't you
> missing two builds?

Thanks Andrew.

Looking at test.yaml in details, this is the list of debug Xen builds
for ARM64 and x86_64 without UBSAN enabled:

alpine-3.18-gcc-debug-arm64-staticmem
alpine-3.18-gcc-debug-arm64-static-shared-mem
alpine-3.18-gcc-debug-arm64-earlyprintk
debian-12-x86_64-gcc-debug
debian-12-x86_64-clang-debug

Do you think we should enable UBSAN in all of them? I am fine with that.
So far, I have only targeted the two that are used more widely.

