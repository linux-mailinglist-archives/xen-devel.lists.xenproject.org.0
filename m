Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0AE46BA21
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240975.417779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYjO-0004tW-Sa; Tue, 07 Dec 2021 11:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240975.417779; Tue, 07 Dec 2021 11:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYjO-0004re-Oi; Tue, 07 Dec 2021 11:33:58 +0000
Received: by outflank-mailman (input) for mailman id 240975;
 Tue, 07 Dec 2021 11:33:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjJF=QY=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muYjM-0004rY-LY
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:33:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ebe19d4-5751-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 12:33:55 +0100 (CET)
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
X-Inumbo-ID: 8ebe19d4-5751-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638876835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4DyWk46PSHaxgjtXS+uinNibz9uA3IDi75AAOqgJ5k=;
  b=ZIAnsV5pgt6kk4UTQ1Lhd6o9d3SD8IBoMcaFrpk0Fdz5e6CwLrJZg6Cu
   XHt8tXtYveATq9HMyTSAQJSKwTanVeElRhLq7ff/X3rG8/xmaoQvBQ3Vv
   Bt4Lh7qQFvveIBWARx4lwgk3zMkOD72SBkiMBGV+euknSz8PaQAURJ5ip
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JMecT7lzKNVLu3V9t2+51oDmUTHTXK3a4EDfiZodenfTFYZWHNbMz325KtU4bbHaUMn6Xg8pTL
 b+OGqpE7dmq3hVmFl+CwrvomgP14OGnUmCEH2MdRClJPlbQ1NAkP+Lt+GeaTj4G/A4cO6ucpFn
 0Ubbbh+n14UUGCxW7EEYOivY/A42xnLU2iC8LSdH2lyvdNHqTH2GS4IM2PBTlQzlLhOVi4J82H
 5S1wGNQPo8GGFYHc9cbeuaXOpxedG5Tc7UHKLaeB0Y0X4LAYcmMW2cKtEGKYII8ZxYNk5mwB+r
 st9YadJ6BuKZ4k7Dmpq89+tV
X-SBRS: 5.1
X-MesageID: 59387228
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:b59DK69rx3sM7UJ1qTIRDrUDfXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 DQdDzuAO/aKMzb1KdFyaty19xxX65eAndY2GgJqrXg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgr8
 Nh2lLmuTDsRfamUwsdDVAZiGg5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0fRqaBP
 ZBJAdZpRDKeM0d/C3c0Mptkh7j4l1TZMB10uWvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0WsVSO/037hmXzajZ6BrfAXILJhZDddgnuckeVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsFzMI2PjGvoQPtlHLFoxATqmqtNTaIGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgDZ5
 CBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWeBYB3iUsI2aBj
 KrvVeR5vsA7AZdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDLjzC0zhZ0y/ljZ
 /93lPpA6l5AVsxaIMeeHb9BgdfHOAhgrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1afBATWMGtw+QKJ7HrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcEkgei3iOedl3RAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:hn+sQ680YFsSu/J3cwNuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="59387228"
Date: Tue, 7 Dec 2021 11:33:50 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 11/47] build: fix enforce unique symbols for
 recent clang version
Message-ID: <Ya9GnjMXU8YNDP3x@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-12-anthony.perard@citrix.com>
 <6b92c237-9ca9-813c-615a-74a2f3e858d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6b92c237-9ca9-813c-615a-74a2f3e858d3@suse.com>

On Tue, Dec 07, 2021 at 11:23:26AM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
> > only the filename rather than the full path to the source file.
> > 
> > clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
> > (in our debian:jessie container) do store the full path to the source
> > file in the FILE symbol.
> > 
> > This means that we also need to check clang version to figure out
> > which command we need to use to redefine symbol.
> > 
> > I don't know which version of clang change behavior, we will guess
> > 4.0.
> 
> When I did this earlier work, it was clang5 that I used. Which would seem
> to mean the change in behavior was in version 6.

Thanks, I forgot this fact. I'll make change in the patch, and replace
the last paragraph of the patch description and add something link this
instead:

    Also, based on commit 81ecb38b83 ("build: provide option to
    disambiguate symbol names"), which were using clang 5, the change of
    behavior likely happened in clang 6.0.

Thanks,

-- 
Anthony PERARD

