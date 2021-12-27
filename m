Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6710A47FCB5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 13:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251979.432960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1pLz-0006KY-Ep; Mon, 27 Dec 2021 12:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251979.432960; Mon, 27 Dec 2021 12:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1pLz-0006I1-Ar; Mon, 27 Dec 2021 12:43:51 +0000
Received: by outflank-mailman (input) for mailman id 251979;
 Mon, 27 Dec 2021 12:43:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3qzC=RM=kroah.com=greg@srs-se1.protection.inumbo.net>)
 id 1n1pLx-0006Ht-6b
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 12:43:49 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 920238f1-6712-11ec-bb0b-79c175774b5d;
 Mon, 27 Dec 2021 13:43:21 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 84BB95C02D5;
 Mon, 27 Dec 2021 07:43:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 27 Dec 2021 07:43:44 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Dec 2021 07:43:43 -0500 (EST)
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
X-Inumbo-ID: 920238f1-6712-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=2ROSRJZXuATdJhCcuekJ7Amfp4Z
	tgQ53208KjF4wzZ4=; b=CfNrZA8Z1u28sb53lvtywE/tY4ntmJkA3hklkXe3a/4
	5RJeWoWxfbr8xZs/l4AeDoxL3ZDoIm63OmMSwMUTVMWSa7gzm216F6R3sENhefVr
	abAUN/lbJOL1Vt9prXiMp0fgnbrJKZtE/JyVaB1/+T7dMspNBxaADnIxu31Cg6+u
	VJ50psLPNmJ42ZXSK412R5l35IbcQVdGNUlPdRTnztuw1D2NNPs9PefLOJps4/vK
	I5F1On6uKdLojg6Rrbbz8Ge+7oI95jhjUxrh0BLEnkd8iR0Z2pba9IdqvjvICcLE
	7fY5HZUqra7eF/761WsdwkVw8FtbA3weMj0XcuR2Z9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2ROSRJ
	ZXuATdJhCcuekJ7Amfp4ZtgQ53208KjF4wzZ4=; b=emRGNylp20HrEcLvnbs8Mo
	lkWa5h4kgqElbuxsFvY2xAV6rYWBFt2hHgsG4FqV/SnoSp449MPly0mUz1PW7Klz
	Z1mFGSwf+YGJWobiYwEZvGgibtbjNk+nqlCROvys9M4LerMGY6pOYHYSWVpJ6FaJ
	gywFjaALabqwc6NFmLVt5lXpJ4zdnsubZ3pvXE+c6O9zMqUU5bvw+hryhdqBUZu0
	ryVc25d/nqFuJh1Ak7QpU+Ni5Xp7qyv07C9NEzl8QuqXr1DCcIrkblz+l3iJSRQ9
	FtyUQQ2M5Qh7pyNKB4s5gcoci6fNcsJXcw1vYEf4wg1uyvd0NeS3ornST6eHbtWA
	==
X-ME-Sender: <xms:ALXJYUnCD3L7GzqIb-YRsZom-9mBImeNlv5UUD-pYKEPxKOE9KJ_XQ>
    <xme:ALXJYT1rhWovC6xJHMR4sjQ0r4P1_j7gLgLbmDrW0O8v6su6u-MIKD7alkYXKd2qh
    B61bBCMoZs8dA>
X-ME-Received: <xmr:ALXJYSrPw_LTvlgT009lomCuDODlhFh8GYft7g8fTYEoNuAwIIH-NTxI_KVjwuI96Gz8WMxHmte-SdpaWXFwh8NvJMnazRxz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddujedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:ALXJYQldGvWtYwcu3qMdLIQv4rs8r77jWKhKxMDXL_0-zN9oQyM1FQ>
    <xmx:ALXJYS13X9orHqgRGUSLt0NzPyiKrZz9B_KNWCbTtHJP-E1p0Si3Pw>
    <xmx:ALXJYXvIGiQiTp6DbDfdCh7MjlxNyakTi2RQuBYh0QiOPgsrlhA2Xg>
    <xmx:ALXJYVQ2_-gZZK5SzSdCHr4psXERx40RjWIzDP0YFuOyvvfFJV2rIw>
Date: Mon, 27 Dec 2021 13:43:40 +0100
From: Greg KH <greg@kroah.com>
To: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/blkfront: fix bug in backported patch
Message-ID: <Ycm0/H0L0O69lS7u@kroah.com>
References: <20211223105308.17077-1-jgross@suse.com>
 <YcRWNWtraLXt9W8v@kroah.com>
 <9823fe0a-2db4-bc4b-2d7c-6363856322ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9823fe0a-2db4-bc4b-2d7c-6363856322ff@suse.com>

On Thu, Dec 23, 2021 at 02:40:38PM +0100, Juergen Gross wrote:
> On 23.12.21 11:57, Greg KH wrote:
> > On Thu, Dec 23, 2021 at 11:53:08AM +0100, Juergen Gross wrote:
> > > The backport of commit 8f5a695d99000fc ("xen/blkfront: don't take local
> > > copy of a request from the ring page") to stable 4.4 kernel introduced
> > > a bug when adding the needed blkif_ring_get_request() function, as
> > > info->ring.req_prod_pvt was incremented twice now.
> > > 
> > > Fix that be deleting the now superfluous increments after calling that
> > > function.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   drivers/block/xen-blkfront.c | 4 ----
> > >   1 file changed, 4 deletions(-)
> > 
> > So this is only needed in 4.4.y?  No other backports were incorrect?
> 
> Yes. 4.4 only.

Great, now queued up, thanks.

greg k-h

