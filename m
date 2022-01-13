Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C63748CFCF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 01:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256927.441199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oL5-0008HG-8R; Thu, 13 Jan 2022 00:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256927.441199; Thu, 13 Jan 2022 00:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oL5-0008Ez-4g; Thu, 13 Jan 2022 00:51:39 +0000
Received: by outflank-mailman (input) for mailman id 256927;
 Thu, 13 Jan 2022 00:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oL3-0008Et-NL
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 00:51:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f57fd495-740a-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:51:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74E2261B29;
 Thu, 13 Jan 2022 00:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89534C36AE5;
 Thu, 13 Jan 2022 00:51:33 +0000 (UTC)
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
X-Inumbo-ID: f57fd495-740a-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642035094;
	bh=1f0qG7gUbl43fQQLnMjB1yjy+M9CjIjFf1mfKEBmfho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PInrcdraAL57kWK/fckdFlJhSwioOPJLb/10f2n/aZ/zTdE5+5NvABSesAJYvNPv7
	 5peW2J/MfYT4Lq3iAuObGH33nFY9Aj+m2vudqTBhwr/lKuhddAKHpieEU2vHtchuiE
	 yXV9YGbwQx7WEt3cmRtlSb4S6JJyvkeEbYoYOCmYtwZqucYK+KGk+M5hFtVeQwtSQK
	 jellUYxwRm2IYxCiUg+bhGRYtVYvEARJybfNKoyL846v36sMQ4QmhvJB/TLpn9XtcG
	 j7iOFoe3jCHTJ2LuCyHc6SD5W5Sx70EcTAkbrgn3AV32IEt9qsgDysHejHY4ymJJgj
	 1d+xAYyY6fDPg==
Date: Wed, 12 Jan 2022 16:51:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 6/7] xenstored: do_introduce: handle the late_init
 case
In-Reply-To: <Ydj5WW6bBp6hMTOL@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2201121650000.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-6-sstabellini@kernel.org> <Ydj5WW6bBp6hMTOL@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1676405939-1642035095=:19362"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1676405939-1642035095=:19362
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 8 Jan 2022, Marek Marczykowski-Górecki wrote:
> On Fri, Jan 07, 2022 at 04:49:11PM -0800, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > If the function is called with late_init set then also notify the domain
> > using the xenstore event channel.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: wl@xen.org
> > CC: Anthony PERARD <anthony.perard@citrix.com>
> > CC: Juergen Gross <jgross@suse.com>
> > CC: julien@xen.org
> > ---
> >  tools/xenstore/xenstored_domain.c | 15 ++++++++++-----
> 
> Isn't the same necessary in oxenstored too? Otherwise, I think it needs
> some explicit documentation, that late PV with dom0less requires
> cxenstored.

You have a point here, thanks for the heads up. Given my lack of OCaml
skills, I'll re-submit without the oxenstored part. Once we are settled
on the cxenstored changes, I'll attempt to change oxenstored too.
--8323329-1676405939-1642035095=:19362--

