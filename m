Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9191D7EAE
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 18:37:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jailW-0002JF-LW; Mon, 18 May 2020 16:37:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jailV-0002JA-2G
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 16:37:21 +0000
X-Inumbo-ID: d7b9d80e-9925-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7b9d80e-9925-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 16:37:20 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EazD7dgrhyln6e9FNS/gLcSpODu/YgR8dXgEJwxvEotcQqESdQu6TuPP9pcquSLEXhD5MuoTIk
 yneyBGzzmhtOB/Zd5wrVTP22UJxpPYuU5iPGS6KwtESQc0ChHYnypj52hTLFkmrOT6EF1toPFW
 o3V8S+d93f976m0Ys41cypvBlN0UO7iPiaj9XNtaI3+Dc6JHia1LdZK1PVWfDNWGvaT08KuKIq
 Dydd0lcQwbUBgu2LgqQ2zJu8AH3I9ZPm3Cgbfrp1PMh+pPA5gtKXFjZhCpB+0iAyI6Sl0sCBZN
 Jbg=
X-SBRS: 2.7
X-MesageID: 18071372
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18071372"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24258.47547.105405.754194@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 17:37:15 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain [and 1 more messages]
In-Reply-To: <CAKf6xpvdSb=fSebzpHaLb1F9zNqsUn3dA03wYoXaZtxSLn0K+w@mail.gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <24253.29524.798802.978257@mariner.uk.xensource.com>
 <CAKf6xpvJMovKMTWipC4gZuBD8FgmBEWbDbkm=ryRWSxNifQcJw@mail.gmail.com>
 <24258.39029.788968.419649@mariner.uk.xensource.com>
 <20200428040433.23504-10-jandryuk@gmail.com>
 <20200518145028.GD98582@mail-itl>
 <24258.42794.136081.367565@mariner.uk.xensource.com>
 <CAKf6xpvdSb=fSebzpHaLb1F9zNqsUn3dA03wYoXaZtxSLn0K+w@mail.gmail.com>
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
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in stubdomain [and 1 more messages]"):
> On Mon, May 18, 2020 at 11:18 AM Ian Jackson <ian.jackson@citrix.com> wrote:
> > [explanation of confusion]
> 
> Do you want the commit message to add a blurb about this?  So the
> message becomes:
> """
> Rely on a wrapper script in stubdomain to attach relevant consoles to
> qemu.  The save console (1) must be attached to fdset/1.  When
> performing a restore, $STUBDOM_RESTORE_INCOMING_ARG must be replaced on
> the qemu command line by "fd:$FD", where $FD is an open file descriptor
> number to the restore console (2).
> 
> Existing libxl code (for dom0) already connects the stubdom's save &
> restore console outputs to the save & restore files.
> """

I think that would be good, thanks, yes but I won't insist on it.

I think I already gave my ack for v6 of this.  If you add the commit
message text above you should obviously keep that ack.

Thanks,
Ian.

