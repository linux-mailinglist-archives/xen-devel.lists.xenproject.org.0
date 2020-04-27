Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9B1B9917
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 09:54:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSybC-0003iJ-AE; Mon, 27 Apr 2020 07:54:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7B6=6L=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jSybB-0003iA-Ev
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 07:54:41 +0000
X-Inumbo-ID: 54033638-885c-11ea-9745-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54033638-885c-11ea-9745-12813bfff9fa;
 Mon, 27 Apr 2020 07:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 2AFA8CEF9;
 Mon, 27 Apr 2020 09:54:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nw7wnHQHPFDg; Mon, 27 Apr 2020 09:54:30 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 49EB5C9D2;
 Mon, 27 Apr 2020 09:54:30 +0200 (CEST)
Received: from samy by function with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jSyaz-006Sd2-B3; Mon, 27 Apr 2020 09:54:29 +0200
Date: Mon, 27 Apr 2020 09:54:29 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
Message-ID: <20200427075429.mshevnm2ype7tq32@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20200427034019.6251-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427034019.6251-1-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk, le dim. 26 avril 2020 23:40:19 -0400, a ecrit:
> Commit c96c22f1d94 "mini-os: minimal implementations of some termios
> functions" introduced implementations of tcgetattr and tcsetattr.
> However, they do not check if files[fildes].cons.dev is non-NULL before
> dereferencing.  This is not a problem for FDs allocated through
> alloc_fd, but the files array pre-allocates FDs 0-2 for stdio.  Those
> entries have a NULL .dev, so tc{g,s}etattr on them segfault.
> 
> ioemu-stubdom segfaults when term_init() calls tcgetattr on FD 0.
> 
> Restore tcgetattr and tcsetattr behavior when .dev is NULL equivalent to
> unsupported_function as it was before c96c22f1d94.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
> I can't get ioemu-stubdom to start without this.  With this, the guest
> just reboots immediately, but it does that with a non-stubdom
> device_model_version="qemu-xen-traditional" .  The same guest disk image
> (cirros 0.5.1) boots with a linux stubdom or non-stubdom Ubuntu
> qemu-system-x86_64.
> 
>  lib/sys.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/lib/sys.c b/lib/sys.c
> index da434fc..c6a7b9f 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -1472,6 +1472,11 @@ int tcsetattr(int fildes, int action, const struct termios *tios)
>              return -1;
>      }
>  
> +    if (files[fildes].cons.dev == NULL) {
> +        errno = ENOSYS;
> +        return -1;
> +    }
> +
>      if (tios->c_oflag & OPOST)
>          files[fildes].cons.dev->is_raw = false;
>      else
> @@ -1492,6 +1497,11 @@ int tcgetattr(int fildes, struct termios *tios)
>          return -1;
>      }
>  
> +    if (files[fildes].cons.dev == NULL) {
> +        errno = ENOSYS;
> +        return 0;
> +    }
> +
>      if (tios == NULL) {
>          errno = EINVAL;
>          return -1;
> -- 
> 2.20.1
> 

