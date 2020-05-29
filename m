Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3E1E82A9
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:59:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehPL-0002Fm-6b; Fri, 29 May 2020 15:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jehPJ-0002Fh-8r
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:58:53 +0000
X-Inumbo-ID: 4a593f92-a1c5-11ea-81bc-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a593f92-a1c5-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 15:58:52 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GPUUh8qB2JwxVxteQ8OryyBqIJynNY/kZSfgGZNZlMbo1aAGACI4TpWS2zeErxjkyWFj6N9+3o
 b752A+WkWkoD78hFcpZZKgNow0XvZx2jvNPfcwAuape1wLYXxYP/FlhIYzW9IOdhrRvRD0SpS+
 0FoZ6Jx2rPhrKsF5AzEeBES8MfU3+LZlLBIrqzcP+3rARGIlpcbXTZyteminyKksxRtTY5bGI7
 Bk2qbHDMM4yoW0A1IfPoGC/icXKQeZY9uN6S0IIlhvs08XHuXUO20WhZvwgHpXgNQiZT1iG+Da
 Dyo=
X-SBRS: 2.7
X-MesageID: 18795323
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="18795323"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24273.12599.136836.514214@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 16:58:47 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 17/20] tools/libx[cl]: Plumb static_data_done() up into
 libxl
In-Reply-To: <dd477627-1c36-ae3f-3c7a-ef15d5b9fa21@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-4-andrew.cooper3@citrix.com>
 <24093.64177.923164.677965@mariner.uk.xensource.com>
 <dd477627-1c36-ae3f-3c7a-ef15d5b9fa21@citrix.com>
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH 17/20] tools/libx[cl]: Plumb static_data_done() up into libxl"):
> There are several things going on here.
> 
> One is the control flow marker of "We reached the end of the static
> data".  A higher level toolstack needs to know this unconditionally,
> which is why the callback is mandatory.
> 
> For v2 compatibility, its callers cope with "this is where an end of
> static data would be in a v3 stream", but that abstracted away so the
> higher level toolstack doesn't know or need to care.
> 
> The missing parameter is "p.s. here are the things we were expecting but
> didn't get - you need to pick up the pieces".  For now, it is synonymous
> with "here is a v2 stream without CPUID data", but that won't be
> accurate in the future if/when new static data records get retrofitted.

Thanks for the explanation.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

