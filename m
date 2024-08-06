Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E2949706
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 19:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773016.1183460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbODY-0004Ny-Vl; Tue, 06 Aug 2024 17:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773016.1183460; Tue, 06 Aug 2024 17:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbODY-0004MF-Su; Tue, 06 Aug 2024 17:43:28 +0000
Received: by outflank-mailman (input) for mailman id 773016;
 Tue, 06 Aug 2024 17:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+gn=PF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sbODX-0004M9-QH
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 17:43:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 619245e2-541b-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 19:43:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 290C060FF0;
 Tue,  6 Aug 2024 17:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39207C32786;
 Tue,  6 Aug 2024 17:43:23 +0000 (UTC)
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
X-Inumbo-ID: 619245e2-541b-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722966203;
	bh=9LnT1RvN6QmNUGJn6ZUTD2Kp4LmNfzlYIhm7wNIhYfM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SOTqO78dPrmW+PqrKd4h4X0i9p8QcbJMfD2L95KxSNxsn+YjzyjOWvF/l6w9/VcCf
	 QX7Dp/c0nvfZROR2/IC6carg1PFI4ZUphiIkGJ5SxoGW41SwTY0UgQBrQ8Ympgjhpl
	 dEBDDnG3AY1sYmBYYwl5lMyIE94BYr7cTMP7fWW+DohVX00ivnsRqQaB8918DlwVnk
	 BWc1/hQ7kokKx8QdaaHI9CB826pI75TzK0ssJRPpLnGqJU6IWKrQYfWvZooN7DzgGI
	 dsn6NNjI63X8rhvFs9ek8CSxuB+jF8PMzvALUX2XaTAhSIB3BPUcP993FyOxPIh96n
	 SN+uDN1IDkZ4w==
Date: Tue, 6 Aug 2024 10:43:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] libxl/disk: avoid aliasing of abs()
In-Reply-To: <ad3b9873-b478-4448-8395-498399040324@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408061043050.4954@ubuntu-linux-20-04-desktop>
References: <ad3b9873-b478-4448-8395-498399040324@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Aug 2024, Jan Beulich wrote:
> Tool chains with -Wshadow enabled by default won't like the function
> parameter name "abs", for aliasing stdlib.h's abs(). Rename the
> parameter to what other similar functions use.
> 
> Fixes: a18b50614d97 ("libxl: Enable stubdom cdrom changing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -935,7 +935,7 @@ static void cdrom_insert_stubdom_disk_ad
>                                               libxl__ao_device *aodev);
>  static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
>                                               libxl__ev_time *ev,
> -                                             const struct timeval *abs,
> +                                             const struct timeval *requested_abs,
>                                               int rc);
>  static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
>                                               libxl__ev_qmp *qmp,
> @@ -1259,7 +1259,7 @@ static void cdrom_insert_stubdom_disk_ad
>  
>  static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
>                                               libxl__ev_time *ev,
> -                                             const struct timeval *abs,
> +                                             const struct timeval *requested_abs,
>                                               int rc)
>  {
>      EGC_GC;
> 

