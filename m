Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB6360B29
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111176.212586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2V1-0003Z7-07; Thu, 15 Apr 2021 13:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111176.212586; Thu, 15 Apr 2021 13:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2V0-0003Yi-Sh; Thu, 15 Apr 2021 13:57:38 +0000
Received: by outflank-mailman (input) for mailman id 111176;
 Thu, 15 Apr 2021 13:57:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uKzl=JM=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1lX2Uz-0003Ya-Sn
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:57:38 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 833c651a-936c-433b-9c72-cfaf311eca7b;
 Thu, 15 Apr 2021 13:57:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 88B1E5C0194;
 Thu, 15 Apr 2021 09:57:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 15 Apr 2021 09:57:36 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADEC0240057;
 Thu, 15 Apr 2021 09:57:35 -0400 (EDT)
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
X-Inumbo-ID: 833c651a-936c-433b-9c72-cfaf311eca7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=jfSg5duuUTsC7Zu0OFnc3g37Jmr
	ZtyX1JeECNWT8APg=; b=eJw02QP5SgDmfUXxhsua6b3XvtLIq9aVxluANpWttRs
	Z7V1t9B6eqcN/B4gD7Uq7tF176lw3J7A1glyl/dKHqij09uXsqfN9ArvCYgqEHMi
	Kc+76/HlA7wk0JauDvco/5pFhAaJHEsTMSqbmMqDVss4NKwmp+5iu0Jj243E1iJO
	IL1BiBWftqpIlHEmPPyJN7pL8k3h6UUZNIUMNm4RRW4bwrQcbfkP3HuJb59EP0+J
	p//23UO7Izc6+mnpIz4mwHlNhjjj0goUzZnVqt9BgHgdfUu1W8GZatA/RYNzuOQD
	afEYvkEafvGinyJRI95BXl0k3FClWkqgbsSH9Nilq7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jfSg5d
	uuUTsC7Zu0OFnc3g37JmrZtyX1JeECNWT8APg=; b=BDVbxagipk3EkwKdf9ucJr
	Xntythxjk2r4IBWfDCPtIvH1WjOhQIaeho9jGjss8za7zhY9PmSML1QEoKhUl1+K
	mKla9G+IPbm4JF2c9GnOrvrzmbPYIVN7mo5Rf7cym5ILXtzd3nXN/pJhE+Vw52gA
	UyFMx6CEgzKZC9DWrm4zmxoJ6TIo1Y+BuiZDmYXrZ5uRDZk3iqkP8wqAra/q6KSx
	3xJeTJfz47d+YY19kSLUfWsflelQ+USAN+AwJUdWTZa86sej/26vWdG7+mUJCDbU
	JMTEzIbfRsKENN9qMTVSmoTj0i4SrYYRylPUlFrTGpvKmDflN+Okx6OFNqLjEDmQ
	==
X-ME-Sender: <xms:T0Z4YBRnKDhOmXcowo_JglIbZz22p8nU99lcIQKp3weLGch7F8fykg>
    <xme:T0Z4YKz3NdyTsu5b-6LeyzoRb-NOvdmqycCF9yQkj1RwIsIC4HiDkz4ot12S5Ib8F
    2njL7ujF8apqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:T0Z4YG1Ub7HDFpw-MSJ_PQn6GD0aB3SQqlPTXR1RnjyhSdMT7BifJg>
    <xmx:T0Z4YJBMoDFFTT_GzQw7P0IsLVs2twWbjPGmDO96yKKRAZVOnH7MrQ>
    <xmx:T0Z4YKi9DdfzYbcKBRn4tzZgx68s2kJinVXFpN2Z_ODJo3uu-Ibajg>
    <xmx:UEZ4YNvXo7_PRAacA12fLSOkT1IwBBUjRWux3Z7jSiyh1h7BFT95xA>
Date: Thu, 15 Apr 2021 15:57:33 +0200
From: Greg KH <greg@kroah.com>
To: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/events: fix setting irq affinity
Message-ID: <YHhGTZFXzPg+FaEq@kroah.com>
References: <20210412062845.13946-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412062845.13946-1-jgross@suse.com>

On Mon, Apr 12, 2021 at 08:28:45AM +0200, Juergen Gross wrote:
> The backport of upstream patch 25da4618af240fbec61 ("xen/events: don't
> unmask an event channel when an eoi is pending") introduced a
> regression for stable kernels 5.10 and older: setting IRQ affinity for
> IRQs related to interdomain events would no longer work, as moving the
> IRQ to its new cpu was not included in the irq_ack callback for those
> events.
> 
> Fix that by adding the needed call.
> 
> Note that kernels 5.11 and later don't need the explicit moving of the
> IRQ to the target cpu in the irq_ack callback, due to a rework of the
> affinity setting in kernel 5.11.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> This patch should be applied to all stable kernel branches up to
> (including) linux-5.10.y, where upstream patch 25da4618af240fbec61 has
> been added.

Now queued up, thanks.

greg k-h

