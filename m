Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF44B6FE5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273355.468510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzy0-00061j-Vl; Tue, 15 Feb 2022 15:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273355.468510; Tue, 15 Feb 2022 15:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzy0-0005zJ-St; Tue, 15 Feb 2022 15:42:12 +0000
Received: by outflank-mailman (input) for mailman id 273355;
 Tue, 15 Feb 2022 15:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLD3=S6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nJzxz-0005z7-4F
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:42:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5514165-8e75-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:42:10 +0100 (CET)
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
X-Inumbo-ID: d5514165-8e75-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644939729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kzs71HOKX4l7M6cP7lSwLADhlZsH6L7230tJbZbvKZ0=;
  b=ScZ7e8mQKnsRpL4jYF2CZ8QbS4YTZMnRl6X7vx2lMvCHXgWAu2VQpFWP
   HuMwQ00CVeubtqJcMB8lAX4rn/B6JBgUIZiAtkJ9BrqCjYBEkj7PH6Q1J
   yppYBDGYvD7NRA0+/yQp3SQV2hqhmwtOldLyGednpNSLmWd/VchfrjJPl
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XDpTUGLLQ2qIMvdedmXgCHDqhDwZZVegsV4qYBRYRVwb6kHJv95Dxjs5hUxG4Gx8r7ZfLVaRWP
 ejw3I240mJWteDFcAAXfS8CIrHAH/5k81tZ25n3O2OYUQneudD9kubrXZNcDcOpfmRNXh5ZX79
 TZ2eYqJU//0fh/eahUTXigzErfu5Gfm7geRsMfnCujPQEw/gV/Ik1/Uk8YoZKvzSmBwasiTgDm
 1Ot8WGNCvU0SslgJGAvpKdivqQWH5Hf+pwwvvSfnxdL19l160znyZco6X17cmvb3rwheE9PmDr
 KNOaLGcT+MJexvWVLIG9UdeD
X-SBRS: 5.1
X-MesageID: 64662123
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:twX6gKKSJ3cu5yYqFE+RIJIlxSXFcZb7ZxGr2PjKsXjdYENS1mYHn
 WdNWmHXOqzcYzSkLdpzboW2oB5Vu57WmNNkGQdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6xrZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ikeBSl
 vwTmqeyWAJxPfDXmb8AWh1xRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gls2J4URKyFD
 yYfQQp/aUrKehZNAHAsA75l39v23jqucDIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IB8ZT1ygutGil1WzHdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9BmEyRnEtEyQ+4cjm+IJulROUU99nOfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxasYdO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb+J+i8AxkkfS+F1/ronhezP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlPbo3E+OBPIhju3+KTJrU3YE
 c3FGftA8F5AUfg3pNZIb7t1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivr6To
 C/kAhYCkAWXaL+uAVziV02PoYjHBf5XxU/X9wR3Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:qaSeUqloG7jAIzLUJuB7d94BnZjpDfIu3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5OUtQ/exoV5PtfZqxz/FICMwqTNGftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCFHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="64662123"
Date: Tue, 15 Feb 2022 15:42:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xenstore: add error indicator to ring page
Message-ID: <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>
References: <20220210111620.5256-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220210111620.5256-1-jgross@suse.com>

On Thu, Feb 10, 2022 at 12:16:20PM +0100, Juergen Gross wrote:
> +The "Connection error indicator" is used to let the server indicate it has
> +detected some error that led to deactivation of the connection by the server.
> +If the feature has been advertised then the "Connection error indicator" may
> +take the following values:
> +
> +Value   Description
> +-----------------------------------------------------------------
> +0       No error, connection is valid
> +1       Communication problems (event channel not functional)
> +2       Inconsistent producer or consumer offset
> +3       Protocol violation (client data package too long)

Is this meant to be the only possible error value? If in the future we
want to add more possible error, does it going to need a new feature
bit and maybe a new error field?

Thanks,

-- 
Anthony PERARD

