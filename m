Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC654BEAA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 02:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349482.575584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1GpA-0004bS-4r; Wed, 15 Jun 2022 00:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349482.575584; Wed, 15 Jun 2022 00:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1GpA-0004YP-1e; Wed, 15 Jun 2022 00:23:56 +0000
Received: by outflank-mailman (input) for mailman id 349482;
 Wed, 15 Jun 2022 00:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o1Gp8-0004YJ-Lq
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 00:23:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd34412-ec41-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 02:23:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 729AEB81868;
 Wed, 15 Jun 2022 00:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1097CC3411B;
 Wed, 15 Jun 2022 00:23:47 +0000 (UTC)
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
X-Inumbo-ID: 6dd34412-ec41-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655252627;
	bh=1NY9pf1XkYATiqp4Y50ryTvD10tjD2prZMCB+yj2zmA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kl2CQIC7s/wpCmPjoB1IAk0MOE55o2h3sxzZtMdOGpgt/pCc5WF8S08jmAOTs6vss
	 +2IDf6aQe7JgIZaw7We1Tt8S2nKf7qzpJZaVxcjjoBKFqw2cpMJlHK/+7MWDe+XcWr
	 IVG50fAk8x8IECk1Ceo2MkjW4BbvcnLQqCbSGxOSvKQ6L1qZRdNjYKZ2iNT/XAoBYE
	 arNTWoE+JYbY+pxjMC7X4noklucW038MB0XL+jqKS0W2RsNkuNgSf47EESDQ2b5jIW
	 GlOCSG07cdHIbWk5p5ZkIVOYo/3GeI+hXea4opGbwRUVQb3IUkPDhqEw9EgHOLz7Sw
	 pgXjqkJ6aPxfw==
Date: Tue, 14 Jun 2022 17:23:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smpboot: Allocate the CPU sibling/core maps
 while preparing the CPU
In-Reply-To: <55f45337-2da1-fe8f-b7a5-272577ed4d50@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206141723360.1837490@ubuntu-linux-20-04-desktop>
References: <20220614094119.94720-1-julien@xen.org> <f60bd88a-90bc-60a9-be72-aa533315c55f@arm.com> <3ed8e44f-293d-958f-c144-466e16d034e2@xen.org> <55f45337-2da1-fe8f-b7a5-272577ed4d50@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1894069408-1655252627=:1837490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1894069408-1655252627=:1837490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 14 Jun 2022, Michal Orzel wrote:
> On 14.06.2022 13:08, Julien Grall wrote:
> >>> +    unsigned int rc = 0;
> >> ... here you are setting rc to 0 even though it will be reassigned.
> >> Furthermore, if rc is used only in case of CPU_UP_PREPARE, why not moving the definition there?
> > 
> > Because I forgot to replace "return NOTIFY_DONE;" with :
> > 
> > return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
> That is what I thought.
> With these fixes you can add my Rb.

And also my

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1894069408-1655252627=:1837490--

