Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB71E64EF
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 16:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJxu-0008AN-ON; Thu, 28 May 2020 14:57:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTQv=7K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jeJxt-0008AH-FY
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:57:01 +0000
X-Inumbo-ID: 7b729da8-a0f3-11ea-a7e7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b729da8-a0f3-11ea-a7e7-12813bfff9fa;
 Thu, 28 May 2020 14:57:00 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XPQ4X+dE/6hyPkWA4jyUYtycJBETPYjzKjQDpDV2jMZLl6for62rN6bu0GdRjIapB3p6HWMozN
 3mPz86sCuVkMDn4JNpauqJ5lAmCBPrY7PdaET+A+qs3ZHfaim6TEbz2BC7JDeP9T4fvI2q67ss
 PRDcqCMSI5iCYBxbjoW/KdxpuDaY3e3MAtWZyZW8uT+VDR6rZXNxH0dOIFQ3XWhdbnyZP4LIcZ
 qvliMunFzHgvdI1nI1EizD5vwDLQAuvlUA9MIJQEbberqp91cSAWehT1OpsGDG0k4Q5X+VAKUG
 9wk=
X-SBRS: 2.7
X-MesageID: 18964615
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="18964615"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24271.53557.114994.926329@mariner.uk.xensource.com>
Date: Thu, 28 May 2020 15:56:53 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] libxl: stop libxl_domain_info() consuming massive amounts
 of stack
In-Reply-To: <20200528114801.20241-1-paul@xen.org>
References: <20200528114801.20241-1-paul@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH] libxl: stop libxl_domain_info() consuming massive amounts of stack"):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently an array of 1024 xc_domaininfo_t is declared on stack. That alone
> consumes ~112k.

Wow.

> Since libxl_domain_info() creates a new gc this patch simply
> uses it to allocate the array instead.

Thanks.

> +    info = libxl__calloc(gc, 1024, sizeof(*info));

Wy not GCNEW_ARRAY ?

That avoids a possible bug with wrong number of * to sizeof (although
in this case you seem to have it right...)

Thanks,
Ian.

