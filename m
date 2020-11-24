Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E7F2C19CD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 01:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35278.66736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khLvj-0002kN-2O; Tue, 24 Nov 2020 00:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35278.66736; Tue, 24 Nov 2020 00:11:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khLvi-0002jh-Uy; Tue, 24 Nov 2020 00:11:34 +0000
Received: by outflank-mailman (input) for mailman id 35278;
 Tue, 24 Nov 2020 00:11:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khLvh-0002jO-Hu
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:11:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd65b08-e5c0-4bbd-898b-17334643333c;
 Tue, 24 Nov 2020 00:11:32 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D056420729;
 Tue, 24 Nov 2020 00:11:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khLvh-0002jO-Hu
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:11:33 +0000
X-Inumbo-ID: 6bd65b08-e5c0-4bbd-898b-17334643333c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6bd65b08-e5c0-4bbd-898b-17334643333c;
	Tue, 24 Nov 2020 00:11:32 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D056420729;
	Tue, 24 Nov 2020 00:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606176692;
	bh=oS/Xzsk9XvLaGNEPERRM2FAqt1U7+QT5J4rRjREQehQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qUJtNEWk/4onZ3846GyRqO+0fhO6NIsGV12F+Gn7V3HryNN5Xf5DvObz+y/kxj+mB
	 +bf+1awEmmscC7nr/tqQGzyFRmrwHCmipRGSOKTFdxCEuwjQ2JV78iSIdQakFWhOb5
	 bhbKBDeHTIwI8r1wAso7U8ubduAKRi538/denH94=
Date: Mon, 23 Nov 2020 16:11:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 3/3] ns16550: drop stray "#ifdef CONFIG_HAS_PCI"
In-Reply-To: <c5cf7b83-9948-dd87-dfe0-40d36df0db70@suse.com>
Message-ID: <alpine.DEB.2.21.2011231610110.7979@sstabellini-ThinkPad-T480s>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com> <c5cf7b83-9948-dd87-dfe0-40d36df0db70@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2020, Jan Beulich wrote:
> There's no point wrapping the function invocation when
> - the function body is already suitably wrapped,
> - the function itself is unconditionally available.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -662,9 +662,7 @@ static int __init check_existence(struct
>      return 1; /* Everything is MMIO */
>  #endif
>  
> -#ifdef CONFIG_HAS_PCI
>      pci_serial_early_init(uart);
> -#endif
>  
>      /*
>       * Do a simple existence test first; if we fail this,
> 

