Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE9487B27
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 18:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254493.436372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5sp9-0002rz-Ir; Fri, 07 Jan 2022 17:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254493.436372; Fri, 07 Jan 2022 17:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5sp9-0002pb-FC; Fri, 07 Jan 2022 17:14:43 +0000
Received: by outflank-mailman (input) for mailman id 254493;
 Fri, 07 Jan 2022 17:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DHRd=RX=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n5sp7-0002pD-Ia
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 17:14:41 +0000
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b848184-6fdd-11ec-81c1-a30af7de8005;
 Fri, 07 Jan 2022 18:14:39 +0100 (CET)
Received: by mail-il1-f179.google.com with SMTP id m4so5142525ilf.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jan 2022 09:14:39 -0800 (PST)
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
X-Inumbo-ID: 4b848184-6fdd-11ec-81c1-a30af7de8005
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BxvLpEvumeq7N81DVwFgSL9ID6LbwkYK+hL/nppM7TI=;
        b=3d6PhRZeDWCPKqnR3E6hX2MVj7SsZOY2jmWq3YKso2yGqYJoE6IZVyoNWWGDCYrjoT
         a0rCKaLEQdfyKlKC0u/r8PyoF9dFD+qUKVD0zJEAqCWjSYfQJowovKSuzcyTyCucln9O
         dGQbMsaC12Vy9pya3XMgLIJIlWlkpLc9IuXHM0C0Smu5huxCkrgKUwOV6jKr52U3la1l
         Da45aXzM4eH/Ew7LOPV0YFd3XiBPT53mmcgi8BdTpfg1EicDGnPzxS69LFBGWeD9kEvQ
         3nXbAFGB/BfIEN372fkGpogfcPqQeyrx8RPyPgCOkOrsGrzJFPfVUfgEvoO/yK8HO6QD
         jpYw==
X-Gm-Message-State: AOAM533cVtNbMuqyNS8PIOeDF6BjSBvP5+ExM6kYT2a/sKaS4xgVlSuj
	dGkdQx1inVpyPhVIxMpwtdtbFCrN8ut1xBoIOWp0V+yR7POwSQ==
X-Google-Smtp-Source: ABdhPJy04ryzrHMwkvBAHG4I+xq8jxpk9AjK3MD0yIU4MJqMNQPxluAA92iNgG144aWuqSbnWu1wHa8gaIe1Rftf7R4=
X-Received: by 2002:a92:c10e:: with SMTP id p14mr30000694ile.24.1641575678128;
 Fri, 07 Jan 2022 09:14:38 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger> <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger> <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger> <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger>
In-Reply-To: <YdWsPWqALWBRGtqW@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sat, 8 Jan 2022 01:14:26 +0800
Message-ID: <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 5, 2022 at 10:33 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Jan 05, 2022 at 12:05:39AM +0800, G.R. wrote:
> > > > > > But seems like this patch is not stable enough yet and has its =
own
> > > > > > issue -- memory is not properly released?
> > > > >
> > > > > I know. I've been working on improving it this morning and I'm
> > > > > attaching an updated version below.
> > > > >
> > > > Good news.
> > > > With this  new patch, the NAS domU can serve iSCSI disk without OOM
> > > > panic, at least for a little while.
> > > > I'm going to keep it up and running for a while to see if it's stab=
le over time.
> > >
> > > Thanks again for all the testing. Do you see any difference
> > > performance wise?
> > I'm still on a *debug* kernel build to capture any potential panic --
> > none so far -- no performance testing yet.
> > Since I'm a home user with a relatively lightweight workload, so far I
> > didn't observe any difference in daily usage.
> >
> > I did some quick iperf3 testing just now.
>
> Thanks for doing this.
>
> > 1. between nas domU <=3D> Linux dom0 running on an old i7-3770 based bo=
x.
> > The peak is roughly 12 Gbits/s when domU is the server.
> > But I do see regression down to ~8.5 Gbits/s when I repeat the test in
> > a short burst.
> > The regression can recover when I leave the system idle for a while.
> >
> > When dom0 is the iperf3 server, the transfer rate is much lower, down
> > all the way to 1.x Gbits/s.
> > Sometimes, I can see the following kernel log repeats during the
> > testing, likely contributing to the slowdown.
> >              interrupt storm detected on "irq2328:"; throttling interru=
pt source
>
> I assume the message is in the domU, not the dom0?
Yes, in the TrueNAS domU.
BTW, I rebooted back to the stock kernel and the message is no longer obser=
ved.

With the stock kernel, the transfer rate from dom0 to nas domU can be
as high as 30Gbps.
The variation is still observed, sometimes down to ~19Gbps. There is
no retransmission in this direction.

For the reverse direction, the observed low transfer rate still exists.
It's still within the range of 1.x Gbps, but should still be better
than the previous test.
The huge number of re-transmission is still observed.
The same behavior can be observed on a stock FreeBSD 12.2 image, so
this is not specific to TrueNAS.

According to the packet capture, the re-transmission appears to be
caused by packet reorder.
Here is one example incident:
1. dom0 sees a sequence jump in the incoming stream and begins to send out =
SACKs
2. When SACK shows up at domU, it begins to re-transmit lost frames
   (the re-transmit looks weird since it show up as a mixed stream of
1448 bytes and 12 bytes packets, instead of always 1448 bytes)
3. Suddenly the packets that are believed to have lost show up, dom0
accept them as if they are re-transmission
4. The actual re-transmission finally shows up in dom0...
Should we expect packet reorder on a direct virtual link? Sounds fishy to m=
e.
Any chance we can get this re-transmission fixed?

So looks like at least the imbalance between two directions are not
related to your patch.
Likely the debug build is a bigger contributor to the perf difference
in both directions.

I also tried your patch on a release build, and didn't observe any
major difference in iperf3 numbers.
Roughly match the 30Gbps and 1.xGbps number on the stock release kernel.

>
> > Another thing that looks alarming is the retransmission is high:
> > [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> > [  5]   0.00-1.00   sec   212 MBytes  1.78 Gbits/sec  110    231 KBytes
> > [  5]   1.00-2.00   sec   230 MBytes  1.92 Gbits/sec    1    439 KBytes
> > [  5]   2.00-3.00   sec   228 MBytes  1.92 Gbits/sec    3    335 KBytes
> > [  5]   3.00-4.00   sec   204 MBytes  1.71 Gbits/sec    1    486 KBytes
> > [  5]   4.00-5.00   sec   201 MBytes  1.69 Gbits/sec  812    258 KBytes
> > [  5]   5.00-6.00   sec   179 MBytes  1.51 Gbits/sec    1    372 KBytes
> > [  5]   6.00-7.00   sec  50.5 MBytes   423 Mbits/sec    2    154 KBytes
> > [  5]   7.00-8.00   sec   194 MBytes  1.63 Gbits/sec  339    172 KBytes
> > [  5]   8.00-9.00   sec   156 MBytes  1.30 Gbits/sec  854    215 KBytes
> > [  5]   9.00-10.00  sec   143 MBytes  1.20 Gbits/sec  997   93.8 KBytes
> > - - - - - - - - - - - - - - - - - - - - - - - - -
> > [ ID] Interval           Transfer     Bitrate         Retr
> > [  5]   0.00-10.00  sec  1.76 GBytes  1.51 Gbits/sec  3120             =
sender
> > [  5]   0.00-10.45  sec  1.76 GBytes  1.44 Gbits/sec                  r=
eceiver
>
> Do you see the same when running the same tests on a debug kernel
> without my patch applied? (ie: a kernel build yourself from the same
> baseline but just without my patch applied)
>
> I'm mostly interested in knowing whether the patch itself causes any
> regressions from the current state (which might not be great already).
>
> >
> > 2. between a remote box <=3D> nas domU, through a 1Gbps ethernet cable.
> > Roughly saturate the link when domU is the server, without obvious perf=
 drop
> > When domU running as a client, the achieved BW is ~30Mbps lower than th=
e peak.
> > Retransmission sometimes also shows up in this scenario, more
> > seriously when domU is the client.
> >
> > I cannot test with the stock kernel nor with your patch in release
> > mode immediately.
> >
> > But according to the observed imbalance between inbounding and
> > outgoing path, non-trivial penalty applies I guess?
>
> We should get a baseline using the same sources without my path
> applied.
>
> Thanks, Roger.

