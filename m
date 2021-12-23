Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FAA47E1D9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 11:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250996.432242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0LnT-0006FU-WB; Thu, 23 Dec 2021 10:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250996.432242; Thu, 23 Dec 2021 10:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0LnT-0006DE-T9; Thu, 23 Dec 2021 10:58:07 +0000
Received: by outflank-mailman (input) for mailman id 250996;
 Thu, 23 Dec 2021 10:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ALw=RI=kroah.com=greg@srs-se1.protection.inumbo.net>)
 id 1n0LnS-0006D8-6n
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 10:58:06 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e4969e-63df-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 11:58:02 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 58E445C00D4;
 Thu, 23 Dec 2021 05:58:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 Dec 2021 05:58:00 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Dec 2021 05:57:59 -0500 (EST)
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
X-Inumbo-ID: 31e4969e-63df-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=c2cKU4iDz/KBtiSAoFHWcks94Il
	IxkFmUpR3FhYa7fc=; b=Muefv8oouQe8WKtDzvdiHDbl9GqaIpQNqutZACZyJ51
	GqmCcqZ/HSrUs+xouyweaozjjwwCB2u72/7O039cyG995I7yV8zHkUceU9fcpX0u
	0zzz8y2kbX3W8T2Q4Xgs+K5sQBlM9TleUzD0+KeKI7a7qBg79XEGr3dkY1uQVeHS
	tFEDEEc0qB4MoiujbWs6tyYg1FmBIX9Ker+DgzB72I5u0BBq4xP0KZoaRnewaJWz
	ZFSeGn7V5tN9e9JCBdvkglA2S/NUwLHPf+Xjhg6XYX9iXap9Gnc2tZ+UW0Z+IOkF
	/heHu25jRbTJv7g0AW+IWi7Pm3IwSPh73vypLHNg2gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=c2cKU4
	iDz/KBtiSAoFHWcks94IlIxkFmUpR3FhYa7fc=; b=VuWQ6SCkt0hLWZnbgtLzjK
	kC6K9ohdrExWZXDFED+pwIuB1PJfhXmvZ9F0GiBzM2ULmP5m9MwuJdcZSWpLCOtl
	tdCEn5nG0BOTSxolOfh47yCUlaQ//nxHvTXBXtG8ZlAmchU47ETQsf2gngYm7rZq
	RRjENk+BPwTFlYSW+jauRFehymMtN72eXLu7/RCfxe+Jk5TVkNUanAcMESp5tzo9
	52t91SKZn0TDV5ZZvw6JHlxhZDuC4+b5vNW6T+fu6H0qGRDdHzfum9xh3puagXg/
	VqC7ifEN6fNU+Pjd1MEWkbZP/AQEDoqWsUk7q5JDloeuhvLBqkPIZLcjbnvXM+8A
	==
X-ME-Sender: <xms:OFbEYbbqNbMVTo53MuRVNcuxUQljs_D5wGYCfvG9CPxhrzEJwwdgkw>
    <xme:OFbEYaaPkjr0yF3TWGrR1nQ44ctjY0rPfpvK4ll9UwFTMXdj3fUWrSo61icnPv5KN
    fo9L6ytoHjdOg>
X-ME-Received: <xmr:OFbEYd-l3vXr5HpZCnfKKjwlVbuM78R3yz-5N8rZYq4LkT-Rw06J2aWIaVQvW0o1nBKl-d8pUM-MFJ8fkC18iKz0HXY36Qx1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:OFbEYRpmSkmy7BpqCTk0DdlcDmFRESoZVPCshm9WCKuqkYwuW9I9Mg>
    <xmx:OFbEYWqZpPTQyjNtxz8WDAQpIv8g7LJ-Pp-gMPG9iwK1UIiXUDL5_g>
    <xmx:OFbEYXQqiebBzjQ4zXG51mfBSakhPfjKNBjNz_AcI2XFuIkthP19RQ>
    <xmx:OFbEYfleLd9dttC3PfSbU26ZC-rs6Rc9mOnN-Qehazv1sn_9Ls8UcA>
Date: Thu, 23 Dec 2021 11:57:57 +0100
From: Greg KH <greg@kroah.com>
To: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/blkfront: fix bug in backported patch
Message-ID: <YcRWNWtraLXt9W8v@kroah.com>
References: <20211223105308.17077-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223105308.17077-1-jgross@suse.com>

On Thu, Dec 23, 2021 at 11:53:08AM +0100, Juergen Gross wrote:
> The backport of commit 8f5a695d99000fc ("xen/blkfront: don't take local
> copy of a request from the ring page") to stable 4.4 kernel introduced
> a bug when adding the needed blkif_ring_get_request() function, as
> info->ring.req_prod_pvt was incremented twice now.
> 
> Fix that be deleting the now superfluous increments after calling that
> function.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/block/xen-blkfront.c | 4 ----
>  1 file changed, 4 deletions(-)

So this is only needed in 4.4.y?  No other backports were incorrect?

thanks,

greg k-h

