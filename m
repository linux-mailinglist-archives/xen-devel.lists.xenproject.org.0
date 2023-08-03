Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5CA76DD5F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 03:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575928.901498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNKk-0002to-Qh; Thu, 03 Aug 2023 01:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575928.901498; Thu, 03 Aug 2023 01:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNKk-0002qO-MN; Thu, 03 Aug 2023 01:40:58 +0000
Received: by outflank-mailman (input) for mailman id 575928;
 Thu, 03 Aug 2023 01:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNKj-0002pl-6H
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 01:40:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8cfc42a-319e-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 03:40:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97E4161B71;
 Thu,  3 Aug 2023 01:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61382C433C7;
 Thu,  3 Aug 2023 01:40:51 +0000 (UTC)
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
X-Inumbo-ID: c8cfc42a-319e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691026853;
	bh=Czl4qfeCMTghZNpoaiNGcIqLh3cNDFfqV69KFZU3Np4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pGXLQ0umjDkCzhAPdSjgnRlBjt8qJiwmf5oB7tAbz7FDXFFFyBOlnxbnU77B/4yz6
	 DCAGDPb2IwqRJW58PYTIhEbrWpMUWqPluQXiC0uqsYJ7/cCz3MgQVwDks4MmTaxzY/
	 8X8JOLVMDJwvZwx9Xhww2FiJMG8bHqEgpTT+tBWGwlhq8gAGEk5KhSBNPFrs1nQJb2
	 LiXw1He8NwmRx2GhzW5XmVNK6WG2riheQpidO0ynPvIyFxReYZgM1EFV4yxQkXSeLx
	 owzy3XgDkdF2+G24vJffLLFrfDAi93IaZfLL21q3e/FIdUVWMc0EhHlIRcsz63SXPh
	 8VRjF/2lLE80Q==
Date: Wed, 2 Aug 2023 18:40:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Nathan Studer <nathan.studer@dornerworks.com>, 
    Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, 
    roberto.bagnara@bugseng.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
In-Reply-To: <3f4c0430-42ce-bb2c-3755-d5f6af8e3b40@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308021840220.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-2-dpsmith@apertussolutions.com> <alpine.DEB.2.22.394.2308011721030.2127516@ubuntu-linux-20-04-desktop> <3f4c0430-42ce-bb2c-3755-d5f6af8e3b40@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Jan Beulich wrote:
> On 02.08.2023 02:24, Stefano Stabellini wrote:
> > On Tue, 1 Aug 2023, Daniel P. Smith wrote:
> >> --- a/xen/include/xen/sched.h
> >> +++ b/xen/include/xen/sched.h
> >> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
> >>  void watchdog_domain_init(struct domain *d);
> >>  void watchdog_domain_destroy(struct domain *d);
> >>  
> >> +static always_inline bool is_initial_domain(const struct domain *d)
> > 
> > I know you used always_inline only because is_hardware_domain just below
> > also uses it, but I wonder if we need it.
> > 
> > Also, Robero, it looks like always_inline is missing from
> > docs/misra/C-language-toolchain.rst? Or do we plan to get rid of it?
> 
> Under "Non-standard tokens" we have both __inline__ and __attribute__
> listed, which I think is enough to cover this specific case as well?

I think we should add always_inline explicitely to
docs/misra/C-language-toolchain.rst to avoid any doubts about it

