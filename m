Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A062879449C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 22:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596865.930941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdzGs-00034F-8y; Wed, 06 Sep 2023 20:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596865.930941; Wed, 06 Sep 2023 20:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdzGs-00031U-5k; Wed, 06 Sep 2023 20:37:06 +0000
Received: by outflank-mailman (input) for mailman id 596865;
 Wed, 06 Sep 2023 20:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdzGq-00031O-BR
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 20:37:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f053aa-4cf5-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 22:37:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA9F2B81C64;
 Wed,  6 Sep 2023 20:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8AFC433C8;
 Wed,  6 Sep 2023 20:37:00 +0000 (UTC)
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
X-Inumbo-ID: 22f053aa-4cf5-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694032621;
	bh=lFxGViauqWhm+2jjxoMvcY72XJzzXFQlCyVQR0IwWt4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LGW3un12+1J5XvTxLVcFWBo5/YLN/hycSbdgSe2CEMlF6JZJZ/bS168AD47FQf3vy
	 bFlYPQUDM9QDdOGxX2i/Is1sLnYiKs4tJVXRB0br9vltlJYOeT6iIWkKIPGSNWfhUu
	 B4tfbJNgSSJSo+LntKRGGXXMOnPQGpHG9kvU7Ab1dYhNUQugb21DFqyn9T2csKRkQA
	 csxvc8mEJ0Sx9aCn0RRx8144mqUdZH/WpHpVBM+ZpS7l1nTSiGCTlAXvkA4RShS8Ly
	 LGVg7XCEjAw37Pe4oeCkiFAWqnC6dwApRObkSQSxDUeLjdWokIytcsrBVRNUpWNPqz
	 AJIeY4znCYzAQ==
Date: Wed, 6 Sep 2023 13:36:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2] Arm: constrain {,u}int64_aligned_t in public header
In-Reply-To: <DAF26DA2-3438-4B44-B783-2C7445618CF1@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309061336532.6458@ubuntu-linux-20-04-desktop>
References: <6bea2061-e6df-2cea-4bff-858b0f44a0c2@suse.com> <DAF26DA2-3438-4B44-B783-2C7445618CF1@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Sep 2023, Henry Wang wrote:
> Hi Jan,
> 
> > On Sep 5, 2023, at 16:26, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > For using a GNU extension, it may not be exposed in general, just like
> > is done on x86 (except that here we need to also work around not all of
> > the tool stack actually defining __XEN_TOOLS__). External consumers (not
> > using gcc or a compatible compiler) need to make this type available up
> > front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
> > the type is actually needed outside of tools-only interfaces, because
> > guest handle definitions use it.
> > 
> > While there also add underscores around "aligned".
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I used the same testing approach to redo the test for v2, and everything
> works fine this time.
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

