Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6EA63269E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446668.702372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox83W-0007Ps-6s; Mon, 21 Nov 2022 14:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446668.702372; Mon, 21 Nov 2022 14:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox83W-0007MQ-41; Mon, 21 Nov 2022 14:45:54 +0000
Received: by outflank-mailman (input) for mailman id 446668;
 Mon, 21 Nov 2022 14:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bhin=3V=citrix.com=prvs=317af203e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ox83V-0007MK-G8
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:45:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 311dfbad-69ab-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 15:45:51 +0100 (CET)
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
X-Inumbo-ID: 311dfbad-69ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669041951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A0ZU3n4nkUZ/GkH/x9oCvJqzeawHZFknP0QjWtUFPRw=;
  b=J9VD08wB0ltp6d7Uu5XGjUWBq/V7DG4RCRU43NqpqspVJiYy4rUuuNzi
   Z6yKT6WBlZH93EGQrSmyiFP4Z5e/UeU+2NtUa7VQv2eE+cAKI6XeQpE9b
   Tpdl5BeGA+P4FQ7DXG7CHPu2FV+KsEGMyRgRt8YJA9zI+dlI1dNA07twH
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85275705
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4A6xKKASqVpeLBVW/0Xjw5YqxClBgxIJ4kV8jS/XYbTApDsi0zwPm
 DdMWzqBbvfYY2L1Ld0nad+z9RwP7ZTXm9JhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpMl7H2JQx
 80hCTUjbQy6jb7nz5GLY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFJ4bVGJoNwy50o
 ErP5yPGMyARF+eylyTcwCiLg/XwnSTCDdd6+LqQqacx3Qz7KnYoID0bU0Gq58awjEGWUshab
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxQxn7GLSmyvx461qB2xJREfcT4NRh8tGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBvazt3NjgbblHQfEcG8yFoSLLQGypyGgWyYcAGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZp6nPaxT4+5CKiIBjarXnSWXFbWlByCmGbKhzy9+KTSufxX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuKLa0WDn2Pj9KjWZJiYe1bawTfNrxlsv7sTce82
 483CvZmAi53CIXWChQ7O6ZKRbzWBRDX3azLlvE=
IronPort-HdrOrdr: A9a23:T9rmQ60oZozy3oES/ygvtAqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85275705"
Date: Mon, 21 Nov 2022 14:45:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH 1/2] tools/libxl: Fixes to
 libxl__domain_set_paging_mempool_size()
Message-ID: <Y3uPFV6wszfgD4Id@perard.uk.xensource.com>
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
 <20221121143731.27545-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221121143731.27545-2-andrew.cooper3@citrix.com>

On Mon, Nov 21, 2022 at 02:37:30PM +0000, Andrew Cooper wrote:
> The error message accidentally printed the bytes value as if it were kB.
> 
> Furthermore, both b_info.shadow_memkb and shadow_mem are uint64_t, meaning
> there is a risk of overflow if the user specified a stupidly large value in
> the vm.cfg file.  Check and reject such a condition.
> 
> Fixes: 7c3bbd940dd8 ("xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> 
> v2:
>  * Retain PRIu64
>  * Check for overflow
> 
> For 4.17.  This is a low risk change, removes one overflow case, and makes an
> error message accurate.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

