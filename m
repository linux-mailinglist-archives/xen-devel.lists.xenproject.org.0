Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7638430E7CD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 00:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81117.149283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7RsT-0007rf-1F; Wed, 03 Feb 2021 23:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81117.149283; Wed, 03 Feb 2021 23:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7RsS-0007rG-UJ; Wed, 03 Feb 2021 23:48:04 +0000
Received: by outflank-mailman (input) for mailman id 81117;
 Wed, 03 Feb 2021 23:48:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t9I1=HF=kernel.org=kuba@srs-us1.protection.inumbo.net>)
 id 1l7RsR-0007rB-5v
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 23:48:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 296cec91-f91b-4204-ab45-854ab0c743ff;
 Wed, 03 Feb 2021 23:48:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52C8464F60;
 Wed,  3 Feb 2021 23:48:01 +0000 (UTC)
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
X-Inumbo-ID: 296cec91-f91b-4204-ab45-854ab0c743ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612396081;
	bh=+6Wgzo0UAUksPUWapSep533wADw9r5wsvfB8fRBzU/8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UIpgYckud7N2g2qsN2quewUJHN1CUfhAF2xZ2mhebPxmAgTlZ1pFi2i1CsFDlmmtt
	 FV5l4wXK+VlOFUX90qIWpCk/8kGxGxOFbh6e6aTEsMvpxeb5KHUCf3IfB6QWsRf3s3
	 Z4fdA6Q+ICKsQwqSTsnIK7vM3TofwoJjvDpC4SIolrap2mJPZo204ZtyPnB0BblQJv
	 ni/AeyRm9iqFminn9qBX3VTMmeWnuus99o8CnpBVWde/lCR7gwnJ3kSJLcueqXCA2r
	 xeleXlmjwqoauwANKqm8SuyqbtTQPU6bqIPnCupc8Wlz/i2dl3h6diFgdDF6SgymXf
	 DC9/FjRrODCtg==
Date: Wed, 3 Feb 2021 15:48:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, "David S. Miller" <davem@davemloft.net>, Igor Druzhinin
 <igor.druzhinin@citrix.com>, stable@vger.kernel.org
Subject: Re: [PATCH] xen/netback: avoid race in
 xenvif_rx_ring_slots_available()
Message-ID: <20210203154800.4c6959d6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210202070938.7863-1-jgross@suse.com>
References: <20210202070938.7863-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  2 Feb 2021 08:09:38 +0100 Juergen Gross wrote:
> Since commit 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> xenvif_rx_ring_slots_available() is no longer called only from the rx
> queue kernel thread, so it needs to access the rx queue with the
> associated queue held.
> 
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Fixes: 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>

Should we route this change via networking trees? I see the bug did not
go through networking :)

