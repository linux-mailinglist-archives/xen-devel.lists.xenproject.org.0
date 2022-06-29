Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6156074E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 19:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358011.586956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bOi-0007X5-PV; Wed, 29 Jun 2022 17:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358011.586956; Wed, 29 Jun 2022 17:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6bOi-0007Ue-Mq; Wed, 29 Jun 2022 17:22:40 +0000
Received: by outflank-mailman (input) for mailman id 358011;
 Wed, 29 Jun 2022 17:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6bOh-0007UY-KM
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 17:22:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13109c5d-f7d0-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 19:22:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F03B7B821D1;
 Wed, 29 Jun 2022 17:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A7EC34114;
 Wed, 29 Jun 2022 17:22:36 +0000 (UTC)
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
X-Inumbo-ID: 13109c5d-f7d0-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656523356;
	bh=3petwhcBcc+OmqawYboWpq3pveWZ6qvP5TZ10HLPmxY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bqzt8SHWvTPw8li1Kcd0KwKHHYKb4SNFmL90kp2GDasgx5Aw98xZQ0Nwhitiibf5n
	 cXrgvaWXj29kpEEnIA+wOLBXHrrjBHo+PiHhJ23RmkkJA9XySHKkNvalnOL358PpjH
	 cEf8CX06LDQRJudndvICC4CVeGyVBhMFd5sscO92spJ4P1JV6YYxRdzpi40Oyg2u2E
	 95KcaY3O0IiwXyCTo6RKRNLU5waBjUZDbFno2EhV8ufecaaSww1TpZTKCpNLojXUbV
	 TX0/vLwBRe1zSpE2IO4GtuvVAfsR5383BbUK7AapEjJtw0dvHf6djfqY2+SOjOL1+a
	 P5j9hRUVwbRow==
Date: Wed, 29 Jun 2022 10:22:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Anthony PERARD <anthony.perard@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
    Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
In-Reply-To: <BF28045C-0848-4B5A-8DAB-57192C7B4A18@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206291019550.4389@ubuntu-linux-20-04-desktop>
References: <20220624160422.53457-1-anthony.perard@citrix.com> <20220624160422.53457-26-anthony.perard@citrix.com> <BF28045C-0848-4B5A-8DAB-57192C7B4A18@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1667198580-1656523357=:4389"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1667198580-1656523357=:4389
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 Jun 2022, Luca Fancellu wrote:
> + CC: Stefano Stabellini
> 
> > On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > 
> > Patch "tools: Add -Werror by default to all tools/" have added
> > "-Werror" to CFLAGS in tools/Rules.mk, remove it from every other
> > makefiles as it is now duplicated.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Hi Anthony,
> 
> I will try to review the serie when I manage to have some time, in the mean time I can say the whole
> serie builds fine in my Yocto setup on arm64 and x86_64, I’ve tried also the tool stack to
> create/destroy/console guests and no problem so far.
> 
> The only problem I have is building for arm32 because, I think, this patch does a great job and it
> discovers a problem here:

That reminds me that we only have arm32 Xen hypervisor builds in
gitlab-ci, we don't have any arm32 Xen tools builds. I'll add it to my
TODO but if someone (not necessarily Luca) has some spare time it could
be a nice project. It could be done with Yocto by adding a Yocto build
container to automation/build/.
--8323329-1667198580-1656523357=:4389--

