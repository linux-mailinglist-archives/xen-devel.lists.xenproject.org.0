Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866AD7170E0
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 00:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541512.844353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q483C-00022q-Ad; Tue, 30 May 2023 22:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541512.844353; Tue, 30 May 2023 22:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q483C-00021B-7X; Tue, 30 May 2023 22:42:46 +0000
Received: by outflank-mailman (input) for mailman id 541512;
 Tue, 30 May 2023 22:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FU5e=BT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q483A-000215-JS
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 22:42:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49503ac8-ff3b-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 00:42:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 679B262A61;
 Tue, 30 May 2023 22:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F78C433D2;
 Tue, 30 May 2023 22:42:40 +0000 (UTC)
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
X-Inumbo-ID: 49503ac8-ff3b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685486560;
	bh=N4oTt86dadx0ez5kyAZNyZZ2y/GRALdDROiBl6Ky8mo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pqhcoHwv/ofw+vAEPajoEV6o0quBc5+Vu2gt1HteBD9WcjMKYow6Xykh9bgPqInRX
	 9y+CONEx7ZyhxjRogSSGCG29BFbIlslWKgoSxrd+jJgK3ymMjzZzi7KJpV4WCzINOp
	 4qmLa3JQZyyYMSjsL5lc0fZM8frD1Ih+cax9z2+FgjwLF4QShHJZj1niSRsPEdbZY7
	 Z9K/k+zdh64QTHazg59Z78VvyNnZl2NpawtTyfAvNjU4//IdK9GwpMulmN8m/1cVP5
	 Z6184ye49g94b3c+C9XNfavTgqQDYMGchsX6MzJ2KqJ3mb0HHC9Zq8YMUC6G9oWI0d
	 ahygfzfVzodlg==
Date: Tue, 30 May 2023 15:42:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
In-Reply-To: <03127618-13a2-872e-82e9-b23ce8095f70@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305301539180.44000@ubuntu-linux-20-04-desktop>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com> <ZG4dmJuzNVUE5UIY@Air-de-Roger> <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com> <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop> <8956af09-9ba4-11bf-a272-25f508bbbb3c@suse.com>
 <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2305251226000.44000@ubuntu-linux-20-04-desktop> <03127618-13a2-872e-82e9-b23ce8095f70@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 May 2023, Jan Beulich wrote:
> On 25.05.2023 21:32, Stefano Stabellini wrote:
> > Like I wrote, personally I am happy with whatever gets us to have the PVH
> > test in gitlab-ci faster.
> > 
> > However, on the specific problem of PCI devices used by Xen and how to
> > deal with them for Dom0 PVH, I think they should be completely hidden.
> > Hidden in the sense that they don't appear on the Dom0 PCI bus. If the
> > hidden device is a function of a multi-function PCI device, then the
> > entire multi-function PCI device should be hidden.
> > 
> > I don't think this case is very important because devices used by Xen
> > are timers, IOMMUs, UARTs,
> 
> ... USB debug ports (EHCI, XHCI), ...
> 
> > all devices that typically are not multi-function,
> 
> except for the ones added. Furthermore see video_endboot() for a case
> of also hiding the VGA device, which isn't unlikely to have secondary
> functions (sound controllers are not uncommon). Hence ...
> 
> > so it is OK to be extra careful and remove the entire
> > device from Dom0 in the odd case that the device is both multi-function
> > and only partially used by Xen. This is what I would do for Xen on ARM
> > too.
> 
> ... at best I would see this as a non-default mode of operation. Of
> course we could also play more funny games with vPCI, like surfacing
> a "stub" device in place of a hidden one, so the other functions can
> still be found.

From our use-case point of view, non-default is OK. The PCI stub idea is
a cool trick that might work but hopefully we won't need it at least
initially. But it is something to consider if it turns out there is an
important multi-function device with one of the devices hidden.

