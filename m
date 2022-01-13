Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953CD48CFCE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 01:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256923.441189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oJT-0006zL-T7; Thu, 13 Jan 2022 00:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256923.441189; Thu, 13 Jan 2022 00:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oJT-0006vq-P0; Thu, 13 Jan 2022 00:49:59 +0000
Received: by outflank-mailman (input) for mailman id 256923;
 Thu, 13 Jan 2022 00:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oJR-0006vk-Sv
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 00:49:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba87f453-740a-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:49:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1EB86B82013;
 Thu, 13 Jan 2022 00:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4630AC36AE9;
 Thu, 13 Jan 2022 00:49:54 +0000 (UTC)
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
X-Inumbo-ID: ba87f453-740a-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642034994;
	bh=96rD+4vk6v0WrNCiarjAcPL+Wh3bFfpS+x3V84dtkj8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u3hYqsFvuuxaLfNB2RqKUZ3ohbx60Mahor0BtL6MRu0fOfSQRT+qKdHGxO09CxXnx
	 dcUolnDw/ArplHCMM7jpBBxzAHXVaOdY5nh1C9mQANKV+4IbH4fRB8/i7eyYHSmp8J
	 IJl81P6KGL9CBvcl4UQRUjwjKLC3BUaxvGpFlpQ0euAmBWhrWyN4yas5142qd914ma
	 idc4CRsi5gDZqrlfYkLdCSgErd2FgtsuF0OIbwRI0hVFyPQVditaWelPtw4H9vKdt3
	 f6wn2V1iZRl3INFabqzIeJPuBF3tjwQiNrYzMTfzY04aaViz1b8wemhkYItFcIw6SZ
	 QS8kvZu1D8wfQ==
Date: Wed, 12 Jan 2022 16:49:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org, 
    anthony.perard@citrix.com, jgross@suse.com
Subject: Re: [XEN PATCH 3/7] tools: add a late_init argument to
 xs_introduce_domain
In-Reply-To: <Ydj4ZFQUBjTWfvyZ@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2201121649150.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-3-sstabellini@kernel.org> <Ydj4ZFQUBjTWfvyZ@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-211871323-1642034995=:19362"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-211871323-1642034995=:19362
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 8 Jan 2022, Marek Marczykowski-Górecki wrote:
> On Fri, Jan 07, 2022 at 04:49:08PM -0800, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > Add a late_init argument to xs_introduce_domain to handle dom0less
> > guests whose xenstore interfaces are initialized after boot.
> > 
> > This patch mechanically adds the new parameter; it doesn't change
> > behaviors.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> I realize there is not much sense in making the parameter usable in the
> Python API, since it's only useful for xenstored. So, for the Python part:
> 
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Thanks Marek for the quick comeback and for the ack. This patch will get
dropped in the next version of the series.
--8323329-211871323-1642034995=:19362--

