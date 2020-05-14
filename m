Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F91D3600
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:08:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGOI-0002mU-8x; Thu, 14 May 2020 16:07:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGOG-0002mP-Sl
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:07:20 +0000
X-Inumbo-ID: fcbb4e52-95fc-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcbb4e52-95fc-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589472439;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=putPDERoXCy+RWMiO+hN6Z1MFytmR+R439LvDv8Q3WQ=;
 b=EWexutKehR2EXLkS/Qcc8u31OE7zJmBmZsVZUQ6cVSySO3E/0nERBVTY
 08bVoU3Cxe3K958kOTtU/EduyrvgPxs99T7ZVHhJc46unxQysq6+MPX8y
 smPmOwIEX3t7nmfm6x1DhdvnlGe3Z3yZvamtbTKCHnt6QMnggAw2LSLRD k=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: q7IabMW/+O4bmabmf8L7K23WpB2sSO1mQil8dqaBBf02/NUm0Ludp47JZjjogP3N8alXa38uRt
 m1IqpkuN1lIMz6H06TlLjnqH3Jl/PI8KjnJ1ln3x9bxJ5jW6NH6KuCnE0a0AOaLlFEemXqt7HE
 rR8dzESgMubJXMbncuqLwINmhkKJMpsSG8nHVXMw3X/EuWAaxgKQBEmodTiur78Ua+zG2Ur0dW
 lWSCD7Ettz+Kb22K2+V+TKOVbX1CdLOInk6atuvR/cLeDTRZJ95FkoApk2dVdUfZHX37qa4Ld/
 kuw=
X-SBRS: 2.7
X-MesageID: 17907121
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17907121"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.27824.82649.907746@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:07:12 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 00/21] Add support for qemu-xen runnning in a
 Linux-based stubdomain
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Eric Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 00/21] Add support for qemu-xen runnning in a Linux-based stubdomain"):
> In coordination with Marek, I'm making a submission of his patches for Linux
> stubdomain device-model support.  I made a few of my own additions, but Marek
> did the heavy lifting.  Thank you, Marek.

Hi.  Thanks very much for this contribution.  Sorry it has taken me so
long to get to review it.

> Later patches add QMP over libvchan connection support. The actual connection
> is made in a separate process. As discussed on Xen Summit 2019, this allows to
> apply some basic checks and/or filtering (not part of this series), to limit
> libxl exposure for potentially malicious stubdomain.

OK.

> Few comments/questions about the stubdomain code:
> 
> 1. There are extra patches for qemu that are necessary to run it in stubdomain.
> While it is desirable to upstream them, I think it can be done after merging
> libxl part. Stubdomain's qemu build will in most cases be separate anyway, to
> limit qemu's dependencies (so the stubdomain size).

Yes.

> 2. By default Linux hvc-xen console frontend is unreliable for data transfer
> (qemu state save/restore) - it drops data sent faster than client is reading
> it. To fix it, console device needs to be switched into raw mode (`stty raw
> /dev/hvc1`). Especially for restoring qemu state it is tricky, as it would need
> to be done before opening the device, but stty (obviously) needs to open the
> device first. To solve this problem, for now the repository contains kernel
> patch which changes the default for all hvc consoles. Again, this isn't
> practical problem, as the kernel for stubdomain is built separately. But it
> would be nice to have something working with vanilla kernel. I see those
> options:
>   - convert it to kernel cmdline parameter (hvc_console_raw=1 ?)
>   - use channels instead of consoles (and on the kernel side change the default
>     to "raw" only for channels); while in theory better design, libxl part will
>     be more complex, as channels can be connected to sockets but not files, so
>     libxl would need to read/write to it exactly when qemu write/read the data,
>     not before/after as it is done now

What a mess.  Thanks for trying to tackle it!

Would it be possible to add a rendenzvous to the console ?  Eg, the
guest could write a "ready" byte after it has set the mode.

I'm not sure I understand the problem with libxl and channels.  Maybe
a helper process (perhaps existing only during migration) could help ?

Or, libxl has the "datacopier" async thing in it which you can spawn
one of and hopefully forget about.  You could teach it channels, or
make a thing like it that uses channels, or something.

> 3. Mini-OS stubdoms use dmargs xenstore key as a string.  Linux stubdoms use
> dmargs as a directory for numbered entries.  Should they be different names?

Yes, I think so.  That way if there's a version mismatch you get
ENOENT rather than an empty argument list...


I'll go and look at the patches now.

Regards,
Ian.

