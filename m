Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD241D7C97
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:19:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahWs-0002nd-V6; Mon, 18 May 2020 15:18:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jahWq-0002nX-R7
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:18:08 +0000
X-Inumbo-ID: c6d396c0-991a-11ea-a872-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6d396c0-991a-11ea-a872-12813bfff9fa;
 Mon, 18 May 2020 15:18:07 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JkbVuUvGzKnGQQCS/YF3/lx3SQ+gsGc95icrSqD7k1DiojJHjk73/SbTddemRrHOiF6NDI/OTq
 CfJp5ZIkP1FEVbRT78aVgciZNntvv4wycxF+34qjdp2i65LwMUUla4FayYsV+uNZjoIW4uBs3s
 n0BYbdyK/kRdS+4pJlh6wSi57aX/l99Z9vg7B/l/DAxHZqn2DSbhQ1FKgcZpRB9bbvNb7uTwLG
 EzOMMRGxMYTWuA8/Gf3zjHYZfdSpQDJli75cUa1tuCFmTWpdKa3pDnVBCteGeCM3GE1geH/nWj
 Vrk=
X-SBRS: 2.7
X-MesageID: 18502088
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18502088"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24258.42794.136081.367565@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 16:18:02 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain [and 1 more messages]
In-Reply-To: <20200428040433.23504-10-jandryuk@gmail.com>,
 <20200518145028.GD98582@mail-itl>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-10-jandryuk@gmail.com>
 <24253.29524.798802.978257@mariner.uk.xensource.com>
 <CAKf6xpvJMovKMTWipC4gZuBD8FgmBEWbDbkm=ryRWSxNifQcJw@mail.gmail.com>
 <24258.39029.788968.419649@mariner.uk.xensource.com>
 <20200518145028.GD98582@mail-itl>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> 
Marek Marczykowski-Górecki writes ("Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in stubdomain"):
> On Mon, May 18, 2020 at 03:15:17PM +0100, Ian Jackson wrote:
> > Err, by "the qemu savefile pathname" I meant the pathname in dom0.
> > I assume your wrapper script opens that and feeds it to the console.
> > Is that right ?
> 
> Not really a wrapper script. On dom0 side it is console backend (qemu)
> instructed to connect the console to a file, instead of pty. I have
> implemented similar feature in my xenconsoled patch series sent a while
> ago (sent along with v2 of this series), but that series needs some more
> love.
> 
> On the stubdomain side, it is a script that launches qemu - opens a
> /dev/hvc2, then pass the FD to qemu via -incoming option (which is
> really constructed by libxl).

Hi.  Thanks for trying to help me understand.  I was still confused
though.  I tried to explain another way and that helped me see what's
going on.

I think I understand now.

For reference, my confusion was this:

Jason Andryuk writes ("[PATCH v5 09/21] libxl: add save/restore support for qemu-xen in stubdomain"):
> index bdc23554eb..45d0dd56f5 100644
> --- a/tools/libxl/libxl_dm.c
> +++ b/tools/libxl/libxl_dm.c
> @@ -1744,10 +1744,17 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
>      }
>  
>      if (state->saved_state) {
> -        /* This file descriptor is meant to be used by QEMU */
> -        *dm_state_fd = open(state->saved_state, O_RDONLY);
> -        flexarray_append(dm_args, "-incoming");
> -        flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
> +        if (is_stubdom) {
> +            /* Linux stubdomain connects specific FD to STUBDOM_CONSOLE_RESTORE
> +             */
> +            flexarray_append(dm_args, "-incoming");
> +            flexarray_append(dm_args, "fd:3");
> +        } else {
> +            /* This file descriptor is meant to be used by QEMU */
> +            *dm_state_fd = open(state->saved_state, O_RDONLY);
> +            flexarray_append(dm_args, "-incoming");
> +            flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
> +        }

In this hunk, the call
           *dm_state_fd = open(state->saved_state, O_RDONLY);
becomes conditional.  It is no longer executed in the stubdomain
case.

So then, who opens state->saved_state ?  And how do they get told
where it is ?  If it's somewhere else in libxl, why doesn't it show up
in this patch ?

Posing the question liked that allowed me to see that the answer is

           console[i].output = GCSPRINTF("file:%s",
                           libxl__device_model_savefile(gc, guest_domid));

in spawn_stub_launch_dm.  And it doesn't appear in the patch because
it's already used for minios stub trad qemu and the same code is
now going to be executed for linux stub moderm qemu.

Ian.

