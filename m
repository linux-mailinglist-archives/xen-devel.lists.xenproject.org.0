Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2614DDD6E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 16:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292133.496141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVF05-0000vW-QD; Fri, 18 Mar 2022 15:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292133.496141; Fri, 18 Mar 2022 15:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVF05-0000sS-Mz; Fri, 18 Mar 2022 15:58:49 +0000
Received: by outflank-mailman (input) for mailman id 292133;
 Fri, 18 Mar 2022 15:58:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gqp6=T5=citrix.com=prvs=069a58476=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nVF04-0000sH-Go
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 15:58:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a18b401-a6d4-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 16:58:46 +0100 (CET)
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
X-Inumbo-ID: 4a18b401-a6d4-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647619126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vq+7pxKEb2HNAB3hrUWlz1jIOdSDtIYOE8JbSGw9z2o=;
  b=fACZIOC1NihU1+fpkG8dACcFahbVEb5f0Kg8u9YcZyC6MXSCeWpREKOD
   8atpV00briJLdkmUTWluyvj+KRGQ39fTwooLq7bfRtSh6mhyAB9a1DXxF
   T3gOczWuH+dM92sY0HsytmPqwEwVrcs4SCr0UOjlVSzYw/7QYBnHi+26Q
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67016739
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5svBl6/W6l6WjbT8c0SaDrUDVH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2IaXmmCP/fba2P9KY8jOoSypBtQsJOAmoNgSQpqpCk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYCfViAZBIjho8U+Xz1RNCUuG64c6LCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZVBMGQwN0WojxtnOmsvBrM7s/+SjCf0bgVa+A+xoIsIyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkQOcaD0zOD/jSpj/XWgCLgcIsIEfuz8fsCqEaPy2IaDhpQTkeyq/S9jk+4WvpPK
 kgV/Dpopq83nGSwVcX0VRC8pH+CvzYfVsBWHul87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXmU7LuToBu5MDIZKmJEbigBJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RiWgzcZt482oPUq9Kmf9HfD0xSv/IjGG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxZHAsblm4YWl0XXUHb5TRO3BC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fPtrZ5ycCl/GI+THZuhb8NIImjn9ZLlPvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF3mX1gnDqIHc2jlnxLNIZyglbPFd/p13PUM4gEAF6s+l2Jo
 76zyePXo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2reWJb9JUaI6aJm9sJItU994wMz7ug1
 iztCydwlQuk7VWaeFriV5yWQO62NXqJhSlgZnJE0JfB8yVLXLtDG49ELsppJ+Z7rLI/pRO2J
 tFcE/i97j10Ymyv01wggVPV9uSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:zTbuSKBNgTK/MK/lHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.90,192,1643691600"; 
   d="scan'208";a="67016739"
Date: Fri, 18 Mar 2022 15:58:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <cardoe@cardoe.com>, <wl@xen.org>,
	<andrew.cooper3@citrix.com>, <bertrand.marquis@arm.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Message-ID: <YjSsMLl5Isn+OAMO@perard.uk.xensource.com>
References: <alpine.DEB.2.22.394.2203161843230.3497@ubuntu-linux-20-04-desktop>
 <20220317014653.2427386-2-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220317014653.2427386-2-sstabellini@kernel.org>

On Wed, Mar 16, 2022 at 06:46:53PM -0700, Stefano Stabellini wrote:
> +curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
> +curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz

    curl --fail --silent --show-error --location --remote-name

I didn't know what all those short options were, I had to write it
down. In script to be shared with others, I think it's better to use the
long options, as it's kind of self-documenting.

Now, there an issue with the command line, "--remote-name" (or -O) needs
to be replaced. We don't care about how the server calls the file, it is
much more important do know where it is going to be stored. Instead, you
should use "--output" to write the file to the location the script is
going to use. It happened to work now, but we don't have to trust
the Internet when not needed.

Also, maybe use "https"?


Also, maybe as an improvement for later, and to avoid having to rely on
the Internet, we could probably store those artifacts in the container
that's going to run the test. But I'm not asking this for now.

> +timeout -k 1 240 \
> +./qemu-system-arm \

There's probably a better way than waiting for the "timeout" like running an
"init" that print something and shutdown the machine. But I guess
that's ok for now.


Thanks,

-- 
Anthony PERARD

