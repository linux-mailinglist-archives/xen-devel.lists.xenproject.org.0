Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53164570873
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 18:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365308.595436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAwP8-0000r0-6D; Mon, 11 Jul 2022 16:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365308.595436; Mon, 11 Jul 2022 16:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAwP8-0000p8-35; Mon, 11 Jul 2022 16:37:02 +0000
Received: by outflank-mailman (input) for mailman id 365308;
 Mon, 11 Jul 2022 16:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79kg=XQ=citrix.com=prvs=184793b5a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oAwP6-0000ou-If
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 16:37:00 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad45da98-0137-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 18:36:58 +0200 (CEST)
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
X-Inumbo-ID: ad45da98-0137-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657557418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i8VLoWg1z9FnUM9x+aYhPQLcf56zWhlC8YjEQsF46EU=;
  b=XOZbBdHhG3xmndKiQ+QNMLhUQHrRlWQ19KsOp/5iOcJAQtkXnCdDjkQY
   pQOXN53qs1VTXTVqUY39qCX+yvaKDqoP+j5oc6SZNIw7PeqNWMxeGhywL
   KnJpxuXqt7OqxGg9LmCQ3Dr6cCbqQtLV1TlsC5UyrMb0Ju1nK+QYpMm1l
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75960082
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AakqIatFUZPA/2IJwxb1nqE5B+fnVF1eMUV32f8akzHdYApBsoF/q
 tZmKW+AOPmMZmuhfIp2aNni8xwBu8eGn9U2QQNorS1kH3tA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW1zU4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8JLJTJlMohFCVnGiBsYJdA/bjAGSKg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWUyPUqYO00VUrsRILIbjsCn12TfSR9BhFuKnIkt0U//8gMkhdABN/KKI4fXFK25hH2wp
 H/C/mn/KgEXMpqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IAISfUu2p7++kEHWc9BQM
 UsP4QI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkvsIrQT0h1
 neSgsjkQzdotdWopWm1r+nO62noYG5McDFENXRsoRY5D8fLgJMKix7hcpFfL6e0nIDPHzT3x
 AjQs31r71kMtvLnx5lX7Hie3W/z/cCTE1dsjunEdjn7t10kPeZJc6TtsAGGtqgYce51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AxkkfS+Fyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27C6+IMYoXPcQgLlPvEMRSiam4hjqFraTRuftnZ
 cfznTiEVx729piLPBLpHrxAgNfHNwg1xH/JRICT8ilLJYG2PSbPIZ9caQPmRrlgsMus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVLfQ5iwLlSLc2elvG7gcbaf1A2STF/W6+MqV7jEqQ895loei7z1
 inVcidlJJDX3BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:8ih1Z62hphZust2bf9kAPQqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.92,263,1650945600"; 
   d="scan'208";a="75960082"
Date: Mon, 11 Jul 2022 17:36:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/build: remove unneeded enumeration in clean-files
Message-ID: <YsxRnWgYdXOtJ1Fd@perard.uk.xensource.com>
References: <20220711105840.10533-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220711105840.10533-1-jgross@suse.com>

On Mon, Jul 11, 2022 at 12:58:40PM +0200, Juergen Gross wrote:
> Enumerating a file from $(targets) in $(clean-files) isn't needed.
> 
> Remove xen/include/xen/hypercall-defs.h from $(clean-files).
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 39d9f5556c..fa0d454ab7 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -225,4 +225,4 @@ all: lib-x86-all
>  endif
>  
>  clean-files := compat config generated headers*.chk xen/lib/x86/cpuid-autogen.h
> -clean-files += xen/hypercall-defs.h hypercall-defs.i
> +clean-files += hypercall-defs.i

The patch title is a bit too broad and only correct a recent patch. It
doesn't really matter I think if `rm -f` tries to remove the same file
twice, but maybe this patch should actually do what it is explained in
the description ;-).
There is also "headers*.chk" that is listed in both $(targets) and
$(clean-files) which could be unlisted from the latter as well.

Thanks,

-- 
Anthony PERARD

