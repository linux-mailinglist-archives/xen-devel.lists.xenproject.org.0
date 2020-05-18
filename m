Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C91D7AD6
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:16:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagYF-0004Pk-1M; Mon, 18 May 2020 14:15:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jagYD-0004Pf-Hw
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:15:29 +0000
X-Inumbo-ID: 05fb1a52-9912-11ea-a86a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05fb1a52-9912-11ea-a86a-12813bfff9fa;
 Mon, 18 May 2020 14:15:28 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BY2xgvnlCalyodz+iXE45gv4FW9rpW8N0PDth5UsoT4uc30prNkruBZA3qODL4gOUoSOIxLr7p
 fPgAAF2jB/gA82R0n06my6dq7XVTaoifauTrrHHzBmA66m/Hd5/j8xjFGCMST2kBJDMroWlzWH
 eQPn/nCkyOWqUGylu6XlmHI952EiWzXrcZN57wqTrewWqWdaxYtjRVnSZkX88nklouo/+brlpZ
 VPEBZpeKQAC6jEyKIpWdfet1wcKDFnot9Use0tq32PR+ndLY1/nfuGP6Qq9SMfs/Y7eXCwmXBG
 YbE=
X-SBRS: 2.7
X-MesageID: 18154567
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18154567"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24258.39029.788968.419649@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 15:15:17 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain
In-Reply-To: <CAKf6xpvJMovKMTWipC4gZuBD8FgmBEWbDbkm=ryRWSxNifQcJw@mail.gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-10-jandryuk@gmail.com>
 <24253.29524.798802.978257@mariner.uk.xensource.com>
 <CAKf6xpvJMovKMTWipC4gZuBD8FgmBEWbDbkm=ryRWSxNifQcJw@mail.gmail.com>
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

Jason Andryuk writes ("Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in stubdomain"):
> On Thu, May 14, 2020 at 12:35 PM Ian Jackson <ian.jackson@citrix.com> wrote:
> > I suggest randomly allocating one in the range [64,192>.  My random
> > number generator picked 119.  So 118 and 119 ?
> 
> This makes sense and would be the easiest change.

Cool.

> > Also, why couldn't your wrapper script add this argument ?  If you do
> > that there then there is one place that knows the fd number and a
> > slightly less tortuous linkage between libxl and the script...
> 
> I like this idea, but there is a complication.  "-incoming" is only
> added when performing a restore, so it cannot just be blindly added to
> all qemu command lines in the stubdom.  Two options I see are to
> either communicate a restore some other way (so the stubdom scripts
> can add the appropriate option), or pass something though dm_args, but
> let the script convert it into something usable.
> 
> There is "-incoming defer" where we can later specify
> "migrate_incoming fd:119".  Another option is to `sed
> s/defer/fd:119/`, but that is a little tricky since we need to look at
> the preceding key to know if we should sed the second.  We could pass
> only "-incoming" and require the stubdom script to modify that option.
> 
> I haven't tested any of this.

Erk.  I see now why you did it the way you did !

> > It's not stated anywhere here that I can see but I think what is
> > happening here is that your wrapper script knows the qemu savefile
> > pathname and reads it directly.  Maybbe a comment would be
> > worthwhile ?
> 
> The existing comment "Linux stubdomain connects specific FD to
> STUBDOM_CONSOLE_RESTORE" is trying to state that.
> STUBDOM_CONSOLE_RESTORE is defined as 2 for console 2 (/dev/hvc2), but
> it is only a libxl_internal.h define.

Err, by "the qemu savefile pathname" I meant the pathname in dom0.
I assume your wrapper script opens that and feeds it to the console.
Is that right ?

Thanks,
Ian.

