Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C28815184
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 22:02:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655368.1023137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKC-0003sy-TZ; Fri, 15 Dec 2023 21:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655368.1023137; Fri, 15 Dec 2023 21:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKC-0003r6-Qw; Fri, 15 Dec 2023 21:02:24 +0000
Received: by outflank-mailman (input) for mailman id 655368;
 Fri, 15 Dec 2023 21:02:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rEFKB-0003HQ-Hk
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 21:02:23 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bdc4f1e-9b8d-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 22:02:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6EDD6CE25AD;
 Fri, 15 Dec 2023 21:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956D4C433C7;
 Fri, 15 Dec 2023 21:02:14 +0000 (UTC)
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
X-Inumbo-ID: 3bdc4f1e-9b8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702674135;
	bh=iXoPoN5b1cbk7caU/j7j0FXXkoKjie9kx4ARMYXyul8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=onK4HkDbrK/t7zH8xmwiZKmxIX2MV4tvdwPT8T7I1ZxePD9sa5aAS18riD20RiPZe
	 BWUxSmq52E+obbvoewhvIu2LIjPRQ3vidPn4lP071TMDC7sq4rjdcXe5KYMIlIg+72
	 gRG5BzlT9ek+z8ZRbxQZSBa4piMHEAoQSNn24b8azffRTeVudnARCyA0sIvsbaTGaZ
	 FHcKbj6G3qqQxZ9+Klt9sj86Jrhlaz+HUm0Co4ONX2AEwo+tk58ViIY1FuEJwvIEHv
	 hYOMOtYIOiMIoeglYsqIRP10GkWnKTIEHyM3JlvFUPim8y0cseqbNiQkeGPRvtJWTZ
	 sLpF5Jvr2/BMg==
Date: Fri, 15 Dec 2023 13:02:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [PATCH 1/2] driver/char: Drop run_in_exception_handler()
 ifdefary
In-Reply-To: <20231215181433.1588532-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2312151134270.3175268@ubuntu-linux-20-04-desktop>
References: <20231215181433.1588532-1-andrew.cooper3@citrix.com> <20231215181433.1588532-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Dec 2023, Andrew Cooper wrote:
> Since commit 60a9b0715055 ("xen: introduce CONFIG_GENERIC_BUG_FRAME"), the new
> common bug.h provides an implementation of run_in_exception_handler() in all
> cases, making the #else here dead.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


