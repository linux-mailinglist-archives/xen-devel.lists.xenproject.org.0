Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DF4B9F81
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 13:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274734.470315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfSh-00018f-F6; Thu, 17 Feb 2022 12:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274734.470315; Thu, 17 Feb 2022 12:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfSh-00016k-Bg; Thu, 17 Feb 2022 12:00:39 +0000
Received: by outflank-mailman (input) for mailman id 274734;
 Thu, 17 Feb 2022 12:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzVd=TA=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nKfSg-00013n-22
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 12:00:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3715389b-8fe9-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 13:00:37 +0100 (CET)
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
X-Inumbo-ID: 3715389b-8fe9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645099236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8aVlUbec5+APin9fmOiz+4RSATpJ+Wu2Uo1xofp6+t0=;
  b=WKSIb56E8BL3QtGaikTyv6gVOzUKUtL9nzfjzEBvKY1GH3j2CTxoBTsW
   BPbIV2Git4LY9emFRhgVwy0s9XCTHBPqb9z3IWdiynBa/oGtAQCnDLaOz
   ocAlhKY7CrAv06FzyynctNYXXqUHAbBmvDTG1o1BkqFtBYtnrFQGtfz4K
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VZQ240aSSnAOwyU6YNTZc978hc503xwiTilpBp4gEgO88u6o1/EFWuIrvfQLWCshOYGldmIhz9
 EGj1LuA9KzMfgRxO/AslEDPzGrLHnJl84AyuZ+rNE4XUd4uBzhz0PanduqYKcsLYzLzGhSqoZe
 yZrURxSFOHOj/swAMueu5V0Q9RrIPgvFTu3pU04C+Nx4Prl5GLFNFwNTbRd6gKg4oFjv3JghJq
 +RmI563+zPOuNpLsuenPE5sxrPdYG7OFhdHCUbTv/8DNK15eHn+LViOeMJcCRrcQl+TbG43cSX
 WR6Hvs26RZ571ZS3w4g1FJGn
X-SBRS: 5.1
X-MesageID: 66663986
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g4Beaqkqn5f28vfwaWZliIro5gwEIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJW2uAbvnfamSkfo0jYYuwoUhVvJCAyNc1HAFqq3hhECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PNfp5KMVTYuAobrmL80cxRkDwBZbbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6iAO
 ZFIOWQHgBLoYzNKPWkTIckErv6h30PUSGcC8Q+aqv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTo/ajjVWlc8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewciXxkL38XSp70YqRKUZ/ZuLLKUqY3qTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxEwHZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyG0vTKuKGpxdEdMMX
 KM1kVkOjHO0FCH3BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzBV0yv5hZ
 crALpvE4ZMm5UJPlmXeqwA1i+JD+8zD7TmLGcCTI+qPitJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid54043bQEKWQGOqdR7BQlTdRATXMmqw+QKJr/rClc3QwkJVq6OqY7NjqQ4xsy5YM+Tp
 SrjMqKZoXKi7UD6xfKiMSE5N+2xDM0u9hrW/0UEZD6V5pTqWq73hI93Snf9VeVPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:oke1n6Etd0lJ9n7UpLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="66663986"
Date: Thu, 17 Feb 2022 12:00:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/xenstore: add error indicator to ring page
Message-ID: <Yg44354PEvJdYiIV@perard.uk.xensource.com>
References: <20220217113016.8260-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220217113016.8260-1-jgross@suse.com>

On Thu, Feb 17, 2022 at 12:30:16PM +0100, Juergen Gross wrote:
> In case Xenstore is detecting a malicious ring page modification (e.g.
> an invalid producer or consumer index set by a guest) it will ignore
> the connection of that guest in future.
> 
> Add a new error field to the ring page indicating that case. Add a new
> feature bit in order to signal the presence of that error field.
> 
> Move the ignore_connection() function to xenstored_domain.c in order
> to be able to access the ring page for setting the error indicator.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add some clarifications (Anthony PERARD)

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

