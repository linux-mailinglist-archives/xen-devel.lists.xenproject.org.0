Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C36F85C8
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 17:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530475.826103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxOp-0006GA-Hp; Fri, 05 May 2023 15:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530475.826103; Fri, 05 May 2023 15:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxOp-0006Df-ES; Fri, 05 May 2023 15:31:11 +0000
Received: by outflank-mailman (input) for mailman id 530475;
 Fri, 05 May 2023 15:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fp4m=A2=citrix.com=prvs=4826eee3f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puxOn-0006DZ-Cm
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 15:31:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91dfa4f-eb59-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 17:31:06 +0200 (CEST)
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
X-Inumbo-ID: d91dfa4f-eb59-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683300666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pd6I1EXHaLBuaVUf35P+v7jHRWsGbpVWYeZwKsxvbI4=;
  b=ZB0YRwaXS9HqLH8x2ILKW0zepcElfgKob2wJGOfujFO+GAavNbVJA/nW
   R5+6Ac5OnoMiG6HLksjs/nw7IL57UStapxr3z5PAFS4G5oxyCoHkduswZ
   8CNU6GR/Ofa1rS7bSYUaDvHLtWOypAPFU/TqY6WTX9uFplb6K8Lbf37ah
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106778848
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:sJsI5KoFxnawG7lFbZlWSLf1km5eBmIyZRIvgKrLsJaIsI4StFCzt
 garIBnXPquDZGPzctslYdm3oUlUucSAnIA2SVNqpS5kFi1Dp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB9TTh+Fndm9+rmiWMln2sMAffPuB4xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jueoTumUkFGZLRzzxKCrW/zvOHEhR/ZXb8KH7+hxNd1jEaMkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hSy2ETgYKykFfyBsZQkY59jupqkjgxSJScxseIa8ltDvECv86
 yyLpiM5wb4UiKY2O76TpA6dxWj2/96QE1Bzv1+MNo640u9nTKH7R4Ou82PQ1/1ZPqaSEl6i7
 UIBoMfLuYjiEqqxeDyxrPQlRe/5vKzYYWSF3jaDDLF6qW3zpifLkZR4pWgneRw3aptslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSia24hTqFfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8CglU75jePPPCXKIVvgDGZik8hjtP/UyOkr2
 4832zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfbeGJOQThxY8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvcFrRMS8/MuOxBf6SbxsTZEQRALph4FB7Ca7H0UvVX8FfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:qVE71q3T0ySNbBavHrvGcgqjBIgkLtp133Aq2lEZdPUCSL3+qy
 nIpoV56faUslYssR4b8uxoVJPrfZq+z/9ICOsqUotKBzOW3FdARbsKhbcKpQeMJ8SUzIBgPM
 lbH5SXp7fLfD5HZWqR2njbLz6AquP3lZyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A9AH+I2iAWrmViYKK6NNScXjCKDJuXSP9w3HKGES?=
 =?us-ascii?q?CAn97aLbJTnzBwqZfnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AbLj8Kw372EAKKl45AHLNV3l0tTUj5PuzV3oDmo0?=
 =?us-ascii?q?6mcy5LSdyIgW0kzisXdpy?=
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="106778848"
Date: Fri, 5 May 2023 16:30:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 2/2] LICENSES: Remove the use of deprecated LGPL SPDX tags
Message-ID: <ZFUhLBm1fzlbpAux@perard>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
 <20230505130533.3580545-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230505130533.3580545-3-andrew.cooper3@citrix.com>

On Fri, May 05, 2023 at 02:05:33PM +0100, Andrew Cooper wrote:
> ---
>  LICENSES/GPL-2.0                    | 12 ++++++------
>  LICENSES/LGPL-2.0                   |  8 ++++----
>  LICENSES/LGPL-2.1                   |  8 ++++----
> 
> diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
> index 0022a7c17788..dcd969aa85b5 100644
> --- a/LICENSES/GPL-2.0
> +++ b/LICENSES/GPL-2.0
> @@ -1,8 +1,9 @@
> -Valid-License-Identifier: GPL-2.0
>  Valid-License-Identifier: GPL-2.0-only
> -Valid-License-Identifier: GPL-2.0+
>  Valid-License-Identifier: GPL-2.0-or-later
>  
> +Deprecated-Identifier: GPL-2.0
> +Deprecated-Identifier: GPL-2.0+
> +
>  SPDX-URL: https://spdx.org/licenses/GPL-2.0.html

You probably want to update the URLs as well, this one point to a page
with a deprecated notice. New url is:
    https://spdx.org/licenses/GPL-2.0-only.html

Same remark for the other licences file changed.

Also, maybe they want to be renamed as well, to match the identifier,
I'm not sure.

Cheers,

-- 
Anthony PERARD

