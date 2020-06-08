Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4062F1F172C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiFX5-0007gJ-TE; Mon, 08 Jun 2020 11:01:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXsd=7V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiFX4-0007gB-G1
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:01:34 +0000
X-Inumbo-ID: 69b973c0-a977-11ea-9b55-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69b973c0-a977-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 11:01:33 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ifZbNR964yFrd7XAuIQluGtMgKvTWqNSB6993Gum/pgPe7Uqc5oGoLM63y3R2eYbYKREFstAcN
 s2I80MPcNDuLLq1L/kMn8POoPpZcOGlcMvde1YPmzO6c5WE/c3kqNBKzbxrFdQTJJ07UAx3mAM
 INOXYv094s+VMqk6Jr6XXxGiYjQ96UcAPBDioLW2Rh+5MEgG3BAPVl8JqOlRTidhH2IwVDovMV
 75AadluaD+5MCyPfBB9iUH3IynthP2IPjD1osyCBR8h/ehweAYTZVcocdAXffa4RVUqz30rTn1
 Sk4=
X-SBRS: 2.7
X-MesageID: 19811329
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19811329"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24286.6790.983312.672969@mariner.uk.xensource.com>
Date: Mon, 8 Jun 2020 12:01:26 +0100
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] tools: fix usage of strncpy
In-Reply-To: <20200608100051.16be834e.olaf@aepfle.de>
References: <20200608072855.26589-1-olaf@aepfle.de>
 <20200608100051.16be834e.olaf@aepfle.de>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Olaf Hering writes ("Re: [PATCH v1] tools: fix usage of strncpy"):
> Am Mon,  8 Jun 2020 09:28:54 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
> > off-by-one error in libxl__prepare_sockaddr_un
> 
> There is none, I had read the code backwards...

I have just had the same thoughts but in the opposite order.  That is
at first I thought this was not a problem, but now I think there is.

There are some kernel interfaces where a fixed-size buffer is
provided, and the kernel will tolerate a null-terminated string, but
will in any case not read beyond the end of the buffer.  Anything
involving IFNAMSIZ comes to mind.

But I think sun_path is not one of those.  The manpage I have here
says that to be portable you must null-terminate sun_path.  I know
that there are some implementations where it is possible to pass a
longer path, effectively treating sun_path as a trailing vla.

Looking at your diff, its effect seems to be to ensure
null-termination by truncating overlong paths.

I think the right approach is to return an error, not to silently
truncate.

Ian.

