Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6541CB11071
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 19:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056431.1424637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueztJ-0005GO-7Z; Thu, 24 Jul 2025 17:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056431.1424637; Thu, 24 Jul 2025 17:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueztJ-0005F0-4z; Thu, 24 Jul 2025 17:38:01 +0000
Received: by outflank-mailman (input) for mailman id 1056431;
 Thu, 24 Jul 2025 17:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+z6g=2F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueztI-0005Eu-8L
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 17:38:00 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef683ca2-68b4-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 19:37:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 78FCFA501DC;
 Thu, 24 Jul 2025 17:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EBDC4CEED;
 Thu, 24 Jul 2025 17:37:55 +0000 (UTC)
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
X-Inumbo-ID: ef683ca2-68b4-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753378676;
	bh=a/MrZa6GKatbApd4JJJX0NJmi7CVY7qSFIgzEyHh9rM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nEPy/iqZMnvZ+IMnHbcLLrKrLJxrLP0VNbfE49nsFPfhpTpxXsfATy5uU+GCQ47py
	 ZchHYNSjVDBtp4wX17PH5+H028C26/jDRZAxrlkvbrRZ+DtyuESAc3LG+Pns7S5NnN
	 gEEEjWAkn14lm+Y/FKNo8wnDL0F//JSOiVLHCoidBwiv28AtxHh/XBp8hM16vDwkHA
	 szXJQvN7eBFjY9Db1bvYxOJMxEFz0HvUFu7Va/I/eCzXV+pcVx4osLE0qMFjlQrCy/
	 J6oAmJlblH9RunvG7ZVC2fsgFoyFm2LW5sZfqslH5weDOpSOAD61QHziEBXZVbzHQC
	 SCj1bwG+W6OZQ==
Date: Thu, 24 Jul 2025 10:37:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Add and use ccache in build-each-commit job
In-Reply-To: <2d6dc87a-024d-467c-969a-e10459f8b6bf@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2507241037440.2015124@ubuntu-linux-20-04-desktop>
References: <20250724083720.45229-1-anthony@xenproject.org> <2d6dc87a-024d-467c-969a-e10459f8b6bf@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Jul 2025, Andrew Cooper wrote:
> On 24/07/2025 9:37 am, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> > ---
> >
> > Notes:
> >     The job build-each-commit is a bit faster, and can do about twice as
> >     much builds.
> >     
> >         https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/10785719529
> >     
> >     I haven't updated the container yet.
> 
> Very nice.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> That's rather more simple to integrate than I was expecting.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

