Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6B1D3694
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:36:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGpf-0006Kc-Kg; Thu, 14 May 2020 16:35:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGpe-0006KX-UK
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:35:38 +0000
X-Inumbo-ID: f10024da-9600-11ea-a4b1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f10024da-9600-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474138;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=BUwW6yMydQVB8wBk6Rv7WxqzYJXcPZ4UF+HHSswujn4=;
 b=IA9qIytJOjNHsOXqZd7pm3qQpVGP58VTNq1A4ZW8nZ6MVE3L7/NVh/i/
 FC/Im7KdazMqnKAAHVZeOq97RyPR5oQ6qMfZC9Nh/FLimq7s9hg3VTOQw
 qMfYZQsUdUzd0Aa5lHjm1MYkwy9SXzRvJ/a1zdxOSDM3Ldrs7vNAu+xzv c=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: uE/nex3gRMr/YDqD7eUMlz2qjMwwjXp5M6GxbvcKZlfPW2sLFve+Y3A0XhsUXLMxYYvA4X1hys
 wO+2hVOOOdauSUEBY1O3ZNNJ09i93iaBlnFwwOQ3xlOGUe7uSe2t3szpVHii1+VISJi0YjPLMu
 O/iDT8jwp/Y7h47gQW61559vab2C70axo7kHogZmQcZYjf2BH3J9KnLgeevs6JiXeTDQ3imKN0
 Ptmff6i6LZLAY5z/GQdAdX+pWWML27xJlSZ+0tKQIy7wQFfezylbR6uY1DWCwX0Z6Zsd8HvAAu
 T8A=
X-SBRS: 2.7
X-MesageID: 17571195
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17571195"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29524.798802.978257@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:35:32 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain
In-Reply-To: <20200428040433.23504-10-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-10-jandryuk@gmail.com>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 09/21] libxl: add save/restore support for qemu-xen in stubdomain"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Rely on a wrapper script in stubdomain to attach FD 3/4 of qemu to
> relevant consoles.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Address TODO in dm_state_save_to_fdset: Only remove savefile for
> non-stubdom.
...
> +        if (is_stubdom) {
> +            /* Linux stubdomain connects specific FD to STUBDOM_CONSOLE_RESTORE
> +             */
> +            flexarray_append(dm_args, "-incoming");
> +            flexarray_append(dm_args, "fd:3");

Would it be possible to use a different fixed fd number ?  Low numbers
are particularly vulnerable to clashes with autoallocated numbers.

I suggest randomly allocating one in the range [64,192>.  My random
number generator picked 119.  So 118 and 119 ?

Also, why couldn't your wrapper script add this argument ?  If you do
that there then there is one place that knows the fd number and a
slightly less tortuous linkage between libxl and the script...

It's not stated anywhere here that I can see but I think what is
happening here is that your wrapper script knows the qemu savefile
pathname and reads it directly.  Maybbe a comment would be
worthwhile ?

The code looks like a good implementation of what it does, though.

Regards,
Ian.

