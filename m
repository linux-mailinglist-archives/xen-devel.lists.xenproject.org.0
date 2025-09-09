Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABDB50663
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 21:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117291.1463452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw3xt-0000xg-NB; Tue, 09 Sep 2025 19:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117291.1463452; Tue, 09 Sep 2025 19:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw3xt-0000wA-KB; Tue, 09 Sep 2025 19:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1117291;
 Tue, 09 Sep 2025 19:25:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uw3xs-0000w2-1o
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 19:25:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw3xr-001o1h-2Q;
 Tue, 09 Sep 2025 19:25:15 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw3xr-001yU5-2c;
 Tue, 09 Sep 2025 19:25:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=OexK4p8Ifzjl3kdRxgkg5QWNesTe1yyMw4MnYMEBVHE=; b=RWf3T/9B/rF3aP/QpQ8d1U12B8
	CYoue24FJstUUwZtD0cpehIw9A104lsIUWohfaIxWq/xtn6kS1TSo0/6G8jFYlnISn/Co8/P+JA0g
	vOQpHwOyLiBbiphlIDeFc/0b898z2tDYdJFo9Wuu31xE3L/ajlYmBdjcRvgfnRjQ/mJw=;
From: dmukhin@xen.org
Date: Tue, 9 Sep 2025 12:25:14 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Be explicit about root in
 scripts/alpine-rootfs.sh
Message-ID: <aMB/GpG7/VZRqVK9@kraken>
References: <20250909170111.1810147-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909170111.1810147-1-andrew.cooper3@citrix.com>

On Tue, Sep 09, 2025 at 06:01:11PM +0100, Andrew Cooper wrote:
> The container is running as root, but be explicit anyway.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  scripts/alpine-rootfs.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index c999b89dbcd8..6fa1d56775bc 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -84,7 +84,7 @@ cd /
>      PATHS="bin etc home init lib mnt opt root sbin srv usr var"
>      find $PATHS -print0
>      echo -ne "dev\0proc\0run\0sys\0"
> -} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
> +} | cpio -0 -R 0:0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
>  
>  # Print the contents for the build log
>  zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
> 
> base-commit: d7434697deec41ddf31a2f3d189dee75d4d2486f
> -- 
> 2.39.5
> 
> 

