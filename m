Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6D57FEF3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 14:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374558.606629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFx8o-00012B-L5; Mon, 25 Jul 2022 12:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374558.606629; Mon, 25 Jul 2022 12:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFx8o-00010G-IK; Mon, 25 Jul 2022 12:24:54 +0000
Received: by outflank-mailman (input) for mailman id 374558;
 Mon, 25 Jul 2022 12:24:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPkC=X6=citrix.com=prvs=198f8b476=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oFx8m-00010A-AJ
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 12:24:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6a5746b-0c14-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 14:24:50 +0200 (CEST)
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
X-Inumbo-ID: c6a5746b-0c14-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658751890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l0PxjRjAX1Ym8OkRbFYxrFXgDofANdGx3w+3OD5XQKE=;
  b=d+esDhhKIGC3AX8sljjJ+UZPbux6vr6REYwS/h5osnnDvrHDn9uvtC3I
   rMUSualVGkngkJqDdwyLWBUjuJ5IBt8EMXaC7hwtm87SH6Ks7rZVdq85L
   U8trX+O9LNbj9qjdnx4zAWhdSfmD4tBxE9O8Eu9pLbcKaoW4h9hwLY4/y
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 75835577
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TQMUy6n1kd+IjO/SiFr4BGvo5gyQJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOX26FPf3fY2byKttwb4+0pkoCvMWEyYBgHgZp+Ck9EyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk3466v4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k9Iqkhq91+OVtW5
 P5IAzkydC6Kl9+plefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+OewYIGIJ4PVLSlTtmaFm
 iXWoWf0OQE5FdWy72eH0XO0mMaayEsXX6pNTeblp5aGmma73XcPARcbUV+6p/iRiUOkXd9bb
 UsO9UIGsqwa5EGtCN7nUHWQomOAvxMac8pdFas98g7l4qje7hudB2MEZiVcc9Fgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey4C9+sdp1EuJF4s9Vv7u5jHoJd3u6
 zuViBFvvLwrt9Ya1fWQ9G/dvTu8m4ecG2bZ+T7rsnKZAhJRPdD4N9D1tQaAt56sP67CEADf4
 SFsd9y2qblXUMrTzHHlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCHx7ZiLCgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgT29zhhzzvtvY
 cfCGSpJMZr9If08pAdaus9HieN7rszA7Ti7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ65TPHu2
 48Gb6OilkQAONASlwGNrub/23hWciVgbX03wuQLHtO+zv1OQzt6Vq6Lme16I+SIXc19z4/1w
 510YWcAoHKXuJENAVzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:lsKUqKvvsfV+/9UvoYfRWAEo7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.93,192,1654574400"; 
   d="scan'208";a="75835577"
Date: Mon, 25 Jul 2022 13:24:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] include: correct re-building conditions around
 hypercall-defs.h
Message-ID: <Yt6Lg7RmCTj4N21T@perard.uk.xensource.com>
References: <15c8b790-f6a6-42e6-d244-8f7d83c880b2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <15c8b790-f6a6-42e6-d244-8f7d83c880b2@suse.com>

On Mon, Jul 25, 2022 at 02:08:04PM +0200, Jan Beulich wrote:
> For a .cmd file to be picked up, the respective target needs to be
> listed in $(targets). This wasn't the case for hypercall-defs.i, leading
> to permanent re-building even on an entirely unchanged tree (because of
> the command apparently having changed).
> 
> Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -114,7 +114,7 @@ all: $(obj)/xen/hypercall-defs.h
>  $(obj)/xen/hypercall-defs.h: $(obj)/hypercall-defs.i $(srctree)/scripts/gen_hypercall.awk FORCE
>  	$(call if_changed,genhyp)
>  
> -targets += xen/hypercall-defs.h
> +targets += hypercall-defs.i xen/hypercall-defs.h

Do you want to remove "hypercall-defs.i" from $(clean-files) at the same
time?

In any case,
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

