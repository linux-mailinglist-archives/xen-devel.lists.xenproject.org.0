Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C180B11FB9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057905.1425597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJ26-0003F4-Kf; Fri, 25 Jul 2025 14:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057905.1425597; Fri, 25 Jul 2025 14:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJ26-0003Cf-I7; Fri, 25 Jul 2025 14:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1057905;
 Fri, 25 Jul 2025 14:04:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ufJ24-0003CV-L3
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:04:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ufJ24-000f1Y-0G;
 Fri, 25 Jul 2025 14:04:20 +0000
Received: from [2a01:cb15:80df:da00:c70a:43d:5717:e951] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ufJ23-00Bjgg-2a;
 Fri, 25 Jul 2025 14:04:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=QIrkSfowZE7r8lXjZGq6OuJfqaIVRkY7MBavLCwrPJc=; b=f1FxjH7CMqowjgd11HZmr1uP7o
	spDv1vzhxu23uFZi+PxP71hxdI2IKTlB5u58QmISYoyGhedBmPrqAPr0Iz9LXhG6HeyGBopSmmqLX
	rSX61/syIYDRMS+MmvXgfjZ2n+qdnIMCJVBHAC9Wh52esXhstP1sE6zdk00fNWfnh7KA=;
Date: Fri, 25 Jul 2025 16:04:18 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2] systemd: Add hooks to stop/start xen-watchdog on
 suspend/resume
Message-ID: <aIOO4kNKM1cyn6Hf@l14>
References: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>

On Thu, Jul 17, 2025 at 11:16:58PM +0300, Mykola Kvach wrote:
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index ab12ea313d..ee684d3391 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -28,6 +28,12 @@ AC_DEFUN([AX_SYSTEMD_OPTIONS], [
>  		[set directory for systemd modules load files [PREFIX/lib/modules-load.d/]]),
>  		[SYSTEMD_MODULES_LOAD="$withval"], [SYSTEMD_MODULES_LOAD=""])
>  	AC_SUBST(SYSTEMD_MODULES_LOAD)
> +
> +	AC_ARG_WITH(systemd-sleep,
> +		AS_HELP_STRING([--with-systemd-sleep=DIR],
> +		[set directory for systemd sleep script files [PREFIX/lib/systemd/system-sleep/]]),
> +		[SYSTEMD_SLEEP_DIR="$withval"], [SYSTEMD_SLEEP_DIR=""])
> +	AC_SUBST(SYSTEMD_SLEEP_DIR)
>  ])
>  
>  AC_DEFUN([AX_ENABLE_SYSTEMD_OPTS], [
> @@ -69,6 +75,14 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
>  	AS_IF([test "x$SYSTEMD_MODULES_LOAD" = x], [
>  	    AC_MSG_ERROR([SYSTEMD_MODULES_LOAD is unset])
>  	], [])
> +
> +	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
> +	    SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"

While reading this change, and systemd.m4, I notice a comment about
using pkg-config, well it's a comment about using it for $SYSTEMD_DIR,
but I believe it applies here too. It looks like we can replace this
hard-coded path by:

    PKG_CHECK_VAR([SYSTEMD_SLEEP_DIR], [systemd], [systemdsleepdir])

Which will query system-sleep path from the system. (This just run
`pkg-config --variable=systemdsleepdir systemd`, and store the result in
SYSTEMD_SLEEP_DIR) (The variable is now named "systemd_sleep_dir", but the
variable name without underscore is still available, and have been
available for longer.)

Is using PKG_CHECK_VAR would be fine with you?

> +	], [])
> +
> +	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
> +	    AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
> +	], [])

After changing to use PKG_CHECK_VAR, I think this patch would be good to
go, so: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
I can make the change on commit if that's ok.

And I need to remember to run `./autogen.sh` to regen the configure
scripts.

Thanks,

-- 
Anthony PERARD

