Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B390E0F4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 02:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743346.1150230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJjKw-0003Gk-PS; Wed, 19 Jun 2024 00:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743346.1150230; Wed, 19 Jun 2024 00:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJjKw-0003EH-MH; Wed, 19 Jun 2024 00:38:06 +0000
Received: by outflank-mailman (input) for mailman id 743346;
 Wed, 19 Jun 2024 00:38:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zUHp=NV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sJjKu-0003EB-Hi
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 00:38:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f2f7cb2-2dd4-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 02:38:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6043161908;
 Wed, 19 Jun 2024 00:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73A7C3277B;
 Wed, 19 Jun 2024 00:37:59 +0000 (UTC)
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
X-Inumbo-ID: 2f2f7cb2-2dd4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718757481;
	bh=yBrrMoQUpHToHslhYSOqlIBGUK4AP3EOd3KMNC+pt6w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fZlpiDG9oKXg7HfsERuZOo9sVKKwbymQWJS++SPiojT5dnYF1/sakM6S1XyTyX0vj
	 1LCTev0qohtO/znan/POAhNBJDZ5btnFaJ96mjQwk8EYPcsaZ+gE5oJKNOExqER132
	 qFruw7CKQDmEQSJQ6GYZ81b1bMY3XXyzAimmAyfDwUKbBa2tn/lS96prOWk0LhRs5V
	 OdNgAc1J+ttVys8qEja23KQHkhvWem3pvmWvRoM53Z8bj92M/NGtTmois8kLh8TEZN
	 7KXE6MetE8D+unmCany2e0BqR8ongab8HYsAkFbwomDkoMKrb2vkXwTkrwY7ZPPamB
	 5etIvzvUdi5vQ==
Date: Tue, 18 Jun 2024 17:37:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Oleksii K." <oleksii.kurochko@gmail.com>
cc: Julien Grall <julien@xen.org>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    Henry Wang <xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
In-Reply-To: <b9c8e762af9ca04d9194fdaa0379f2fe9096af29.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2406181734140.2572888@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>  <20240524225522.2878481-2-stefano.stabellini@amd.com>  <697aadfd-a8c1-4f1b-8806-6a5acbf343ba@xen.org> <b9c8e762af9ca04d9194fdaa0379f2fe9096af29.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 May 2024, Oleksii K. wrote:
> > I don't think it is a big problem if this is not merged for the code 
> > freeze as this is technically a bug fix.
>
> Agree, this is not a problem as it is still looks to me as a bug fix.
> 
> ~ Oleksii

Hi Oleksii, this version of the series was already all acked with minor
NITs and you gave the go-ahead for this release as it is a bug fix. Due
to 2 weeks of travels I only managed to commit the series now, sorry for
the delay.

