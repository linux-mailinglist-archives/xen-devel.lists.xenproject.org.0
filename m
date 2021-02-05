Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C482B31027B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 02:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81486.150693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7qML-00028n-GP; Fri, 05 Feb 2021 01:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81486.150693; Fri, 05 Feb 2021 01:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7qML-00028R-81; Fri, 05 Feb 2021 01:56:33 +0000
Received: by outflank-mailman (input) for mailman id 81486;
 Fri, 05 Feb 2021 01:56:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=srdo=HH=kernel.org=kuba@srs-us1.protection.inumbo.net>)
 id 1l7qMK-000286-2Q
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 01:56:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8af0d0b7-7fb0-4765-af12-991bfb7797ef;
 Fri, 05 Feb 2021 01:56:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D19C264DC4;
 Fri,  5 Feb 2021 01:56:29 +0000 (UTC)
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
X-Inumbo-ID: 8af0d0b7-7fb0-4765-af12-991bfb7797ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612490190;
	bh=ZlbTbixiZ/VEvhe2cB1BDy9leTlPGZZcyvIJqx6f2UI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tu6SJbXUsHBFLZamGifs83f3CijLyOjFBee5L2c4iFeuoBlcqfKvKIhvZc3L22Z+R
	 tj4OtzBNvXCd1gkay1lHs/nd57rPGEKXSgmcitvQJXpqPVESKx7TaT9aWCvHxfyh2C
	 OyTPEq5RzCUwfuqgsZjB9f7ng3IutikF/4Ce+tym0NfiWfuPmmdETry1Hco4C8u2kN
	 1Z+wjDtqiMrg0kz/fDOSsnZ/MxzHEO6WHMBtOinAwVe5DoAXBo6xc6PbgQAIbqFkGv
	 VhYGfuPZusMTknZUlZiZpuAFqgJZPFbNt3gXaqN1e+SUFquG0GafJv6BIFuRLsnot2
	 BkL2UbiwyKmNQ==
Date: Thu, 4 Feb 2021 17:56:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, "David S. Miller" <davem@davemloft.net>, Igor Druzhinin
 <igor.druzhinin@citrix.com>, stable@vger.kernel.org
Subject: Re: [PATCH] xen/netback: avoid race in
 xenvif_rx_ring_slots_available()
Message-ID: <20210204175628.7904d1da@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <f6fa1533-0646-e8b1-b7f8-51ad70691cae@suse.com>
References: <20210202070938.7863-1-jgross@suse.com>
	<20210203154800.4c6959d6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<f6fa1533-0646-e8b1-b7f8-51ad70691cae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Feb 2021 06:32:32 +0100 J=C3=BCrgen Gro=C3=9F wrote:
> On 04.02.21 00:48, Jakub Kicinski wrote:
> > On Tue,  2 Feb 2021 08:09:38 +0100 Juergen Gross wrote: =20
> >> Since commit 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> >> xenvif_rx_ring_slots_available() is no longer called only from the rx
> >> queue kernel thread, so it needs to access the rx queue with the
> >> associated queue held.
> >>
> >> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Fixes: 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Juergen Gross <jgross@suse.com> =20
> >=20
> > Should we route this change via networking trees? I see the bug did not
> > go through networking :)
>=20
> I'm fine with either networking or the Xen tree. It should be included
> in 5.11, though. So if you are willing to take it, please do so.

All right, applied to net, it'll most likely hit Linus's tree on Tue.

Thanks!

