Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8776DBDF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 02:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575909.901439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRLk8-0004mV-E5; Wed, 02 Aug 2023 23:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575909.901439; Wed, 02 Aug 2023 23:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRLk8-0004k4-BK; Wed, 02 Aug 2023 23:59:04 +0000
Received: by outflank-mailman (input) for mailman id 575909;
 Wed, 02 Aug 2023 23:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqe9=DT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRLk6-0004jy-HB
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 23:59:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c6ef2d2-3190-11ee-b267-6b7b168915f2;
 Thu, 03 Aug 2023 01:59:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 091B1601FF;
 Wed,  2 Aug 2023 23:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2A3C433C7;
 Wed,  2 Aug 2023 23:58:56 +0000 (UTC)
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
X-Inumbo-ID: 8c6ef2d2-3190-11ee-b267-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691020738;
	bh=CGf6zLHod+gBC6eVW+X/5kQwWtgG5PS8YiOXAxpMj6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B1G9WbziHbZykkttskmVH/ZyJn0iaSH4zAJXJ3JG3Ybxajyjf+aUm8ieVXTFJsM+V
	 j8xW0MNwoXcudXuvL2E/qcvF4pcyz3f2Jvn3DOGFzSMuM5lna75C+x1ZmFCFaiWc88
	 3jSuvme6y+nMRXMhJV6vUBqO/9MqvQ4jv3wd1Ux7UlMsK74X7xksigSzstAhy9/aV9
	 iCMiX6Ctw7P5E8Vd2ja9c+u1Cp0uc2HHamccll9v0Kn5ztPGD9YZkM2cuEWw5AqwtN
	 5nOcydnK2gGxOUe+QL2MGwKDKq7W/RRX2GL4JMEkP8N89L2WHqUcX7qkaJf9swdwyZ
	 RoCvY0zRu8iMQ==
Date: Wed, 2 Aug 2023 16:58:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] console: generalize the ability for domU access
In-Reply-To: <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308021657290.2127516@ubuntu-linux-20-04-desktop>
References: <20230801160608.19219-1-dpsmith@apertussolutions.com> <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Jan Beulich wrote:
> > -    for ( ; ; )
> > +    if ( d == NULL )
> 
> This covers both Xen receiving input and the domain receiving input having
> gone away. Originally in the latter case the next sequential (in domid
> numbering) domain would be switched to. In the new logic you start over
> from the beginning of the domain list. Such a change in behavior (if
> deemed acceptable at all, which I'm not convinced of) needs calling out in
> the description.

I think it would be best to keep the current behavior as we already
have people using it unless we have strong reasons to change it.

