Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BE2FCEB2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 12:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71332.127636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2BGe-0000rk-0B; Wed, 20 Jan 2021 11:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71332.127636; Wed, 20 Jan 2021 11:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2BGd-0000rL-Sa; Wed, 20 Jan 2021 11:03:15 +0000
Received: by outflank-mailman (input) for mailman id 71332;
 Wed, 20 Jan 2021 11:03:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukRc=GX=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1l2BGb-0000rG-TB
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 11:03:14 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b8cebc7-db95-4b30-9889-57706037d7c0;
 Wed, 20 Jan 2021 11:03:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C9B285C00DC;
 Wed, 20 Jan 2021 06:03:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 20 Jan 2021 06:03:12 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 53CBA240068;
 Wed, 20 Jan 2021 06:03:12 -0500 (EST)
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
X-Inumbo-ID: 9b8cebc7-db95-4b30-9889-57706037d7c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=n
	j9c/dzz3CvjK9bcY8q4YjBxdvICEX+2nraw/Vl7viY=; b=M2GAtQ9RIhX8GN2p4
	PIfFEM5zET2tdrkxXAnVYJPJuU6zeIjlkiRxwCmW7bkUONZdnsZE7KKzUYy8WxXW
	TSpf5I3HXrk+13VdMwgUdXKBJDp0KtezheIH+lmvTPbnMlqSdXzkOl8Y5x8QFkgR
	baov9nzv4MikEUjSGYVCmuj4eXDbjcNJoX4xOlLydIKh4opI6E3lAPoleNa4Xm3Q
	LAL9YGPP1a9xj5poeZAsyqCsoCeOqwLXrKUXtpKlUNSaSDFkDGwX+0Qo5eaKPFo/
	9rgjXV1HVba72zu2pSdlyDYMI9HvlElpif4LLhBDO5vTF8MV9E+9S/aRFcDMtZzD
	AdOHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=nj9c/dzz3CvjK9bcY8q4YjBxdvICEX+2nraw/Vl7v
	iY=; b=X6stgKB9I9rjjf7Anj/aMbA1HBUeBKjbCiShZncv2u/WuuBuKsmvwGZys
	Uzujs1Q8RWxlAJx6P9wxlMFzRGo51i4GD0opsuMTwt088PU0ijj1sW5UoHR3HzWK
	ckZGOAJs3rRmdtLfYZMSqmW9Mt6ROLVwZ3553NFzNK8IR1LpxFoOseg6OSvMNZtA
	p7OLu+bls0MNxc79uIOMLHXjdUAUfcWoxF24a6AiCXaS1D0K7Pu6CwsOZWTByRKZ
	4t6O9LAYi1LjuktHLuLOuHat2fEXnW3DCYe+QobRdNpQEatD9GrXlvRy2UfzJL4b
	KrHQ/gdYR2ItHls0JUHX+cHzhqnUQ==
X-ME-Sender: <xms:8A0IYHEqYpsiFcMh-kQ25-gN9gLUaIUWOE9c3-ErMxPVVwnVnTG-5A>
    <xme:8A0IYEW0D8EBo7Am1rUD65vByD6UOvtNkrjnHTqGcLUEDi78D5PS6cXf-rbLaJY1V
    cc-CmGCS3DQvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpedvfffgue
    eiuefhheevheetgfehvdefgeekfeevueejfeeftdetudetiefhheffvdenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
    rdgtohhm
X-ME-Proxy: <xmx:8A0IYJIXokwug8hlc4tvn17bqdcp56ttfw3I9xeyjrlUwF45JSd4cw>
    <xmx:8A0IYFGhrN1j9r8cpQ4SQcxeU9YlnLvqawJgVogyJwY9D7WQfXJjxg>
    <xmx:8A0IYNU5X6zDQ2YvdZb6gi95a7klx_PcvuPx19p3ajn61oQrVViWmQ>
    <xmx:8A0IYAQd9jOflaE1lNmbleu7AJbejwa2_ADfX0Pa3Ah5EtGUFdZQEQ>
Date: Wed, 20 Jan 2021 12:03:10 +0100
From: Greg KH <greg@kroah.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: stable@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for <= 5.4] xen/privcmd: allow fetching resource sizes
Message-ID: <YAgN7hlFe73mrBWE@kroah.com>
References: <20210118140426.80458-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118140426.80458-1-roger.pau@citrix.com>

On Mon, Jan 18, 2021 at 03:04:26PM +0100, Roger Pau Monne wrote:
> commit ef3a575baf53571dc405ee4028e26f50856898e7 upstream
> 
> Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num = 0 and
> addr = 0 in order to fetch the size of a specific resource.
> 
> Add a shortcut to the default map resource path, since fetching the
> size requires no address to be passed in, and thus no VMA to setup.
> 
> This is missing from the initial implementation, and causes issues
> when mapping resources that don't have fixed or known sizes.
> 
> Signed-off-by: Roger Pau Monn� <roger.pau@citrix.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: stable@vger.kernel.org # >= 4.18
> Link: https://lore.kernel.org/r/20210112115358.23346-1-roger.pau@citrix.com
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/xen/privcmd.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)

Now queued up, thanks.

greg k-h

