Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27026D8289
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 17:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518579.805287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk5Na-0000cg-Ni; Wed, 05 Apr 2023 15:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518579.805287; Wed, 05 Apr 2023 15:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk5Na-0000a1-Ki; Wed, 05 Apr 2023 15:48:58 +0000
Received: by outflank-mailman (input) for mailman id 518579;
 Wed, 05 Apr 2023 15:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lP2=74=citrix.com=prvs=452340087=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pk5NZ-0000Zu-Be
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 15:48:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c6bc2cc-d3c9-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 17:48:54 +0200 (CEST)
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
X-Inumbo-ID: 5c6bc2cc-d3c9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680709734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8vWpWya0wN4rZ3x0AJ/glU6yInfi2NjKtrZResNFdMc=;
  b=WMhKbBk1POGvT8MOwMgTSPHwTIXjzZVTHhmacbMbkORU4dTA4Rfcs3mF
   l3W3Uq8H0tD9EisJYojgU+CEozK/ZpwSgQ4DzWWQN+MH3NOa8c80nIYcS
   PfrV1llygfSlljBjxHgB+iW/FX53ajL6PyYnq3I5J6nluHloFN2vuj6ZR
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103233005
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GsIbL6CCPiJTIRVW/yHjw5YqxClBgxIJ4kV8jS/XYbTApGwghGBSz
 mRMWTjVOazYZmT3KN9xPN6w8UwO6JOEyoJkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9A4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5+JeKmZu2
 tokISlVUzCD2eOanrm6Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TRH54Oxh7Fz
 o7A1zm6OU8eacOm8zSUrW+iurDFwCnUG6tHQdVU8dY12QbOlwT/EiY+V1G2vP24gU6WQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceTCQnz
 FaTk/v1BDZkt/ueTnf1y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDrSSv9IF46aqOH8AGnN4
 zDUrQRgjLQM2JtjO7qAwbzXv969jsGXHlZrt12GAD3NAhBRP9D8OdHxgbTPxbMZddvCEAHc1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuKGpxeEdMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QeOsYqL1XWp3E/PSZ8OlwBd2B1yMkC1
 WqzK57wXR7294w8pNZJewvt+eBynX1vrY8ibZv60w6mwdKjWZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSNhX8yn8JAKK7Xrz8gPMDhJNsI9CIgJI+RN95m5XM+Sl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:ihJHs6Gzj/JunA9MpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-IronPort-AV: E=Sophos;i="5.98,321,1673931600"; 
   d="scan'208";a="103233005"
Date: Wed, 5 Apr 2023 16:48:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul/test: drop bogus .PHONY
Message-ID: <3d0c36f9-a715-4971-9031-04848bcd2d0d@perard>
References: <515bbf07-91fa-1932-1be1-1411f7814e6e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <515bbf07-91fa-1932-1be1-1411f7814e6e@suse.com>

On Tue, Apr 04, 2023 at 08:37:55AM +0200, Jan Beulich wrote:
> x86_emulate is a real (directory) target.

Indeed, x86_emulate is a directory, so having the target in .PHONY
isn't bogus, but kind of expected in most cases.

Here, the recipe is written with .PHONY been used, as suggest the used
option "-p" from `mkdir` and "-f" from `ln`.

Without .PHONY, the recipe will never be executed if the directory
exist. And, if the content of the original x86_emulate directory
change, the linked directory will never be updated.

So, this patch description needs a reason for removing x86_emulate from
.PHONY. Is there some kind of bug?

> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -278,7 +278,6 @@ else
>  run32 clean32: %32: %
>  endif
>  
> -.PHONY: x86_emulate
>  x86_emulate:
>  	mkdir -p $@
>  	ln -sf $(XEN_ROOT)/xen/arch/x86/$@/*.[ch] $@/

Cheers,

-- 
Anthony PERARD

