Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21404A818D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 10:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264556.457680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYWh-0005EP-1b; Thu, 03 Feb 2022 09:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264556.457680; Thu, 03 Feb 2022 09:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYWg-0005Ca-Ul; Thu, 03 Feb 2022 09:35:38 +0000
Received: by outflank-mailman (input) for mailman id 264556;
 Thu, 03 Feb 2022 09:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iP5S=SS=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nFYWf-0005CU-Lc
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 09:35:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e4a2e6-84d4-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 10:35:36 +0100 (CET)
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
X-Inumbo-ID: a2e4a2e6-84d4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643880935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hVLBWmA4H4oxQBG73G7hRaLkBdQn+/WEaI9T42E8Jag=;
  b=TaHZn8re9drOXg/T6/lgCUvYZIZ/PmajgsiYfWQSyCf28aN+TVpbxyS4
   OGCZ/XE1rfzz4gjbQTURSNcWRIvC1ubGZaT/H4GRpA0hTI588IPDl4oR+
   ICe5Zagz9ZERfkQcTW0jWQ4bp0UJT0E7eaddXE4rOxD9lak3LvPhoEiQQ
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Duec6gSvMxJxPq06/J7VnkejSZmwPNKJJwFBC6qJ+ZSC/dXSHQXACusSy6/oOLFLmx5i7RaAgu
 1tIFyf3eOf5P03/Z92+hBCkz3A2SY+1OeL7ivniHiwtq/ulZ+1nP0D8EM0AbUpCwEAnoF/+5K+
 KFiB4Yq+WHw5yf/66gG8gKAm+FHkkBpmwQhtsQAVimFvEagEfLI7Isq028UL39pVtx+7yuBOkg
 EggFuKXjPtuyLz2D5Qkf6gd7Oevcq1q8YsZVJcZXB/ZVb7leuL8n3/O/eUzE79SwOGR2FZc9qD
 oobOUvo9JNTdDkElW18tMND+
X-SBRS: 5.2
X-MesageID: 63311742
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:T/70N63kSP1lEBaBP/bD5RN2kn2cJEfYwER7XKvMYLTBsI5bpzcHn
 2cfX2jQaPyPMWD9eY12bIviphsF75DRndZjHAFrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7Vh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhkfxp2
 N99n7uKdxo7LL3jpPUmVDMDKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3ZsXRKmCP
 aL1bxJVVQ7bZDhLK2wWAYAMmfqP2mXucxFH/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnnyn2RYYTH72Q7eNxjRuYwWl7NfENfQLl+7/j0Bf4Ao8Bb
 RxPksYzkUQs3EKHVsn3bzefmkCZrAwMdOZBKOoQszjYn8I4/D2lLmQDSzdAbvkvu8k3WSEm2
 ze1oj/5OdB8mObLECzAr994uRv3YHFIdjFaOUfoWCNYu4GLnW0lsv7Yoj+P+oaRh8a9Jzz/y
 iviQMMW1+RK1p5jO0lWEDn6b9OQSnrhE1ZdCub/BDvNAuZFiGiNPdfABb/ztq4oEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAzRMl6qmrwqiX8Jui8BQ2Swm8zaa7onheyO
 CfuVf55vscPbBNGk4crC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk5kFKeGrlMuZd2lnFW7T6CHvjTkkX4uYdykVbIE9/pxnPUMLBghE5FyS2Im
 +ti2zyikEQCCbCuP3WMrOb+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:9ODdx6uABUKJv6AKne4gGwVT7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,339,1635220800"; 
   d="scan'208";a="63311742"
Date: Thu, 3 Feb 2022 09:35:30 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4.16 / 4.15] MAINTAINERS: Anthony is stable branch tools
 maintainer
Message-ID: <Yfuh4v50Zu9g6UuN@perard>
References: <3a8a7290-5cd1-da7a-46df-5cbe1755036e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3a8a7290-5cd1-da7a-46df-5cbe1755036e@suse.com>

On Thu, Feb 03, 2022 at 09:56:08AM +0100, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -60,7 +60,7 @@ The maintainer for this branch is:
>  
>  Tools backport requests should also be copied to:
>  
> -	TODO - Loooking for new tools stable maintainer
> +	Anthony Perard <anthony.perard@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

