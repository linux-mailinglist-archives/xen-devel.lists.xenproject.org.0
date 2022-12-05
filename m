Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C8642C6F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 17:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454037.711691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DvN-0003sb-KW; Mon, 05 Dec 2022 16:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454037.711691; Mon, 05 Dec 2022 16:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DvN-0003q2-Hr; Mon, 05 Dec 2022 16:02:33 +0000
Received: by outflank-mailman (input) for mailman id 454037;
 Mon, 05 Dec 2022 16:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AS2=4D=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1p2DvM-0003pu-23
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 16:02:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389b1333-74b6-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 17:02:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 822B661188;
 Mon,  5 Dec 2022 16:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59369C433D6;
 Mon,  5 Dec 2022 16:02:28 +0000 (UTC)
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
X-Inumbo-ID: 389b1333-74b6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256148;
	bh=fUCRk5umyyi3F3OQ84Ugjf+XIjegvMCAtqFGwoNUqqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8sllyzqWv2DzA+KUc9+w2ABl/BVpS0Lah/qIWLxT+W/phFpqpqdbXN1oOWepc2y6
	 1CM6I2RlaNDAfcFYCSOSYzTwNVhYoEmdiIQoSi0gEVkPf+sgz5otQ4QNZFNjb4x0YQ
	 NNzgKtGndHDakAGEC+w4etUgbRYKrSRN7qSWH+MA=
Date: Mon, 5 Dec 2022 17:02:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Cc: johannes@sipsolutions.net, robert.jarzmik@free.fr, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	roger.pau@citrix.com, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] xen: make remove callback of xen driver void returned
Message-ID: <Y44WEkKh9tdNjMlW@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB232333CB411691110A8B9D96CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB232333CB411691110A8B9D96CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>

On Mon, Dec 05, 2022 at 11:36:42PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.

Please wrap changelogs at 72 columns.

And this should go through the maintainers of the Xen bus code, not me,
right?

And why wasn't this attached to the 0/6 email properly?  Did you use
different tools?  If so, our tools can't find the link to keep them in
sync either :(

thanks,

greg k-h

