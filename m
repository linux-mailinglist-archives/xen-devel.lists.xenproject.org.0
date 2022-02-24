Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD94C2289
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 04:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277888.474741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN53U-0003hN-GN; Thu, 24 Feb 2022 03:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277888.474741; Thu, 24 Feb 2022 03:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN53U-0003e4-DI; Thu, 24 Feb 2022 03:44:36 +0000
Received: by outflank-mailman (input) for mailman id 277888;
 Thu, 24 Feb 2022 03:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wSSe=TH=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1nN53S-0003dy-GN
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 03:44:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1246a3f2-9524-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 04:44:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD986B821B2;
 Thu, 24 Feb 2022 03:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE95C340E9;
 Thu, 24 Feb 2022 03:44:28 +0000 (UTC)
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
X-Inumbo-ID: 1246a3f2-9524-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645674268;
	bh=jZ6awLcE6M5IwYTyD00u231l2Hv6lyuBrW+r29jU1AU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=InANoN3hy8jAhaH2B3j97Zd8hO6j23VdWyYcfJ9Wsp07n9vZdFBPvgkMSpv6u4jCV
	 xfPjW2tmBsKmRAbyVSDNWHleKvVxbtWB5XL/i9djj0io+zeo0rXe9KPzvgP37/y7Ii
	 hmXRoo2wrXQazsfVWHejRSM/TplI4Qk3/Tu/DXwS8k6Z5uiLopl/4l+zrTbB5tgTcX
	 KckeDPWP5At6RQWXepyTRojXoFjQ22mcOAEL7S4T4/5EBjTjbTngreaeDTg2RGYhpo
	 QXSiNFsOuq1S1/JjueU14B2dynucftb9jssvKCpbbuwEmDIyp09sVSLY08VfzD4IJz
	 YyAUofYAHx3Wg==
Date: Wed, 23 Feb 2022 19:44:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Michael Brown
 <mcb30@ipxe.org>, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, "David S. Miller" <davem@davemloft.net>,
 xen-devel@lists.xenproject.org (moderated list:XEN NETWORK BACKEND DRIVER),
 netdev@vger.kernel.org (open list:XEN NETWORK BACKEND DRIVER)
Subject: Re: [PATCH v2 1/2] Revert "xen-netback: remove 'hotplug-status'
 once it has served its purpose"
Message-ID: <20220223194426.6948b28c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
References: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Feb 2022 01:18:16 +0100 Marek Marczykowski-G=C3=B3recki wrote:
> This reverts commit 1f2565780e9b7218cf92c7630130e82dcc0fe9c2.
>=20
> The 'hotplug-status' node should not be removed as long as the vif
> device remains configured. Otherwise the xen-netback would wait for
> re-running the network script even if it was already called (in case of
> the frontent re-connecting). But also, it _should_ be removed when the
> vif device is destroyed (for example when unbinding the driver) -
> otherwise hotplug script would not configure the device whenever it
> re-appear.
>=20
> Moving removal of the 'hotplug-status' node was a workaround for nothing
> calling network script after xen-netback module is reloaded. But when
> vif interface is re-created (on xen-netback unbind/bind for example),
> the script should be called, regardless of who does that - currently
> this case is not handled by the toolstack, and requires manual
> script call. Keeping hotplug-status=3Dconnected to skip the call is wrong
> and leads to not configured interface.
>=20
> More discussion at
> https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ip=
xe.org/T/#u
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Wei, Paul, do these look good?

