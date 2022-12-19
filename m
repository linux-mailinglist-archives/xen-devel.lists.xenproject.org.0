Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69AE650EE7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 16:42:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466232.725099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7IHp-0000kJ-Od; Mon, 19 Dec 2022 15:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466232.725099; Mon, 19 Dec 2022 15:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7IHp-0000gz-LQ; Mon, 19 Dec 2022 15:42:41 +0000
Received: by outflank-mailman (input) for mailman id 466232;
 Mon, 19 Dec 2022 15:42:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGe1=4R=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1p7IHn-0000gr-BM
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 15:42:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c31e6a37-7fb3-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 16:42:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F770B80E53;
 Mon, 19 Dec 2022 15:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444B1C433D2;
 Mon, 19 Dec 2022 15:42:34 +0000 (UTC)
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
X-Inumbo-ID: c31e6a37-7fb3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671464554;
	bh=oiRflUUrN9bOaDwDQpqkHsr1lb3UHJCMBAT9e34G5mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5cDx+BtP2K4XWscbCzfdt8AoZagaehZj070cUl5VgcIS1p/YAUbp3ROeQZ192BKX
	 q5AWMzNd7sErqwBkcyVIpBNAjtJrfc6dHqCmORCf8hxBGP6yYMXTxNuk0/ZMYeeqts
	 mjX0w/5SGEE5rWy4bwI/UfZiC+zYiUW+YWBRPBT0=
Date: Mon, 19 Dec 2022 16:42:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: stable@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Jakub Kicinski <kuba@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Puranjay Mohan <pjy@amazon.de>, Maximilian Heyne <mheyne@amazon.de>,
	Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5.4] xen-netback: move removal of "hotplug-status" to the
 right place
Message-ID: <Y6CGaHI554sbb9zt@kroah.com>
References: <20221219153710.23782-1-ptyadav@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219153710.23782-1-ptyadav@amazon.de>

On Mon, Dec 19, 2022 at 04:37:10PM +0100, Pratyush Yadav wrote:
> The removal of "hotplug-status" has moved around a bit. First it was
> moved from netback_remove() to hotplug_status_changed() in upstream
> commit 1f2565780e9b ("xen-netback: remove 'hotplug-status' once it has
> served its purpose"). Then the change was reverted in upstream commit
> 0f4558ae9187 ("Revert "xen-netback: remove 'hotplug-status' once it has
> served its purpose""), but it moved the removal to backend_disconnect().
> Then the upstream commit c55f34b6aec2 ("xen-netback: only remove
> 'hotplug-status' when the vif is actually destroyed") moved it finally
> back to netback_remove(). The thing to note being it is removed
> unconditionally this time around.
> 
> The story on v5.4.y adds to this confusion. Commit 60e4e3198ce8 ("Revert
> "xen-netback: remove 'hotplug-status' once it has served its purpose"")
> is backported to v5.4.y but the original commit that it tries to revert
> was never present on 5.4. So the backport incorrectly ends up just
> adding another xenbus_rm() of "hotplug-status" in backend_disconnect().
> 
> Now in v5.4.y it is removed in both backend_disconnect() and
> netback_remove(). But it should only be removed in netback_remove(), as
> the upstream version does.
> 
> Removing "hotplug-status" in backend_disconnect() causes problems when
> the frontend unilaterally disconnects, as explained in
> c55f34b6aec2 ("xen-netback: only remove 'hotplug-status' when the vif is
> actually destroyed").
> 
> Remove "hotplug-status" in the same place as it is done on the upstream
> version to ensure unilateral re-connection of frontend continues to
> work.
> 
> Fixes: 60e4e3198ce8 ("Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"")
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> ---
>  drivers/net/xen-netback/xenbus.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Now queued up, thanks.

greg k-h

