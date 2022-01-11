Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE548AF74
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255744.438340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7I4O-0006Ox-Nl; Tue, 11 Jan 2022 14:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255744.438340; Tue, 11 Jan 2022 14:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7I4O-0006Lv-KK; Tue, 11 Jan 2022 14:24:16 +0000
Received: by outflank-mailman (input) for mailman id 255744;
 Tue, 11 Jan 2022 14:24:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr+1=R3=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n7I4N-0006Lp-Ey
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:24:15 +0000
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2672f957-72ea-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:24:14 +0100 (CET)
Received: by mail-io1-f51.google.com with SMTP id o7so22581376ioo.9
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jan 2022 06:24:14 -0800 (PST)
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
X-Inumbo-ID: 2672f957-72ea-11ec-9ce5-af14b9085ebd
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M5ZSXCPHmTdxwWzWG9Oc79LNeZ4RMaX6UfeAsAk5f/c=;
        b=lSIg9VnAD7LaSEJOdOFxBMyb6GkW3eEVVhBxInI1u89X6yttANhV6PHGavhl4IVrz/
         eHMbd2BMV5+Oc5n11Rzuspqu9hgnpYqphUCKGh5byjFg9AOjuTU/rXLhyftwG2Ahlqvt
         fv0VXm2CYG5NHxJaGenqlUghtK0Js9X0pp4+2+cYRmlEBHdllrgYq2AquJvv02JHjfJI
         NdyXm5EFQtvOMFBtOUSdtp3MoBSdp5Gy7+GmLuI0GQycVpYh1MSO6z68GG7uREDrTe0m
         kLnvBD19RPTqF0+tQ01cIpzIN/+6uEUfXfhwN4XhfR32naP1VnDRiuJipr+H8hkev30L
         FYPA==
X-Gm-Message-State: AOAM531I5Mgi7LfvL6Ew2wX91ZHZrogh2Ed6LxKcFYivzTVRdn5S76X6
	wYfpjDDxcj1CPmf3o0IFgAT/4O9gcT+GhIeBBgkh6zgel1I=
X-Google-Smtp-Source: ABdhPJz6bo5GYz/TIik6LmqvcruAAqoMtMKSdLmQ+eL9Tco8LVg9MAGr6p10KCnUja2ZzVzEeZXCQzPWgvK/HRoZxrU=
X-Received: by 2002:a05:6638:411c:: with SMTP id ay28mr2470790jab.183.1641911053020;
 Tue, 11 Jan 2022 06:24:13 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger> <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger> <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger> <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger>
In-Reply-To: <YdxIbLYRYh4hvVGj@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Tue, 11 Jan 2022 22:24:01 +0800
Message-ID: <CAKhsbWbCa49F3y0xwJ6FpewShNnO5iDngTvDmupdY+E_qj3jGw@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 10:54 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>
> On Sat, Jan 08, 2022 at 01:14:26AM +0800, G.R. wrote:
> > On Wed, Jan 5, 2022 at 10:33 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > On Wed, Jan 05, 2022 at 12:05:39AM +0800, G.R. wrote:
> > > > > > > > But seems like this patch is not stable enough yet and has =
its own
> > > > > > > > issue -- memory is not properly released?
> > > > > > >
> > > > > > > I know. I've been working on improving it this morning and I'=
m
> > > > > > > attaching an updated version below.
> > > > > > >
> > > > > > Good news.
> > > > > > With this  new patch, the NAS domU can serve iSCSI disk without=
 OOM
> > > > > > panic, at least for a little while.
> > > > > > I'm going to keep it up and running for a while to see if it's =
stable over time.
> > > > >
> > > > > Thanks again for all the testing. Do you see any difference
> > > > > performance wise?
> > > > I'm still on a *debug* kernel build to capture any potential panic =
--
> > > > none so far -- no performance testing yet.
> > > > Since I'm a home user with a relatively lightweight workload, so fa=
r I
> > > > didn't observe any difference in daily usage.
> > > >
> > > > I did some quick iperf3 testing just now.
> > >
> > > Thanks for doing this.
> > >
> > > > 1. between nas domU <=3D> Linux dom0 running on an old i7-3770 base=
d box.
> > > > The peak is roughly 12 Gbits/s when domU is the server.
> > > > But I do see regression down to ~8.5 Gbits/s when I repeat the test=
 in
> > > > a short burst.
> > > > The regression can recover when I leave the system idle for a while=
.
> > > >
> > > > When dom0 is the iperf3 server, the transfer rate is much lower, do=
wn
> > > > all the way to 1.x Gbits/s.
> > > > Sometimes, I can see the following kernel log repeats during the
> > > > testing, likely contributing to the slowdown.
> > > >              interrupt storm detected on "irq2328:"; throttling int=
errupt source
> > >
> > > I assume the message is in the domU, not the dom0?
> > Yes, in the TrueNAS domU.
> > BTW, I rebooted back to the stock kernel and the message is no longer o=
bserved.
> >
> > With the stock kernel, the transfer rate from dom0 to nas domU can be
> > as high as 30Gbps.
> > The variation is still observed, sometimes down to ~19Gbps. There is
> > no retransmission in this direction.
> >
> > For the reverse direction, the observed low transfer rate still exists.
> > It's still within the range of 1.x Gbps, but should still be better
> > than the previous test.
> > The huge number of re-transmission is still observed.
> > The same behavior can be observed on a stock FreeBSD 12.2 image, so
> > this is not specific to TrueNAS.
>
> So that's domU sending the data, and dom0 receiving it.
Correct.
>
> >
> > According to the packet capture, the re-transmission appears to be
> > caused by packet reorder.
> > Here is one example incident:
> > 1. dom0 sees a sequence jump in the incoming stream and begins to send =
out SACKs
> > 2. When SACK shows up at domU, it begins to re-transmit lost frames
> >    (the re-transmit looks weird since it show up as a mixed stream of
> > 1448 bytes and 12 bytes packets, instead of always 1448 bytes)
> > 3. Suddenly the packets that are believed to have lost show up, dom0
> > accept them as if they are re-transmission
>
> Hm, so there seems to be some kind of issue with ordering I would say.
Agree.

>
> > 4. The actual re-transmission finally shows up in dom0...
> > Should we expect packet reorder on a direct virtual link? Sounds fishy =
to me.
> > Any chance we can get this re-transmission fixed?
>
> Does this still happen with all the extra features disabled? (-rxcsum
> -txcsum -lro -tso)
No obvious impact I would say.
After disabling all extra features:
xn0: flags=3D8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
    ether 00:18:3c:51:6e:4c
    inet 192.168.1.9 netmask 0xffffff00 broadcast 192.168.1.255
    media: Ethernet manual
    status: active
    nd6 options=3D9<PERFORMNUD,IFDISABLED>
The iperf3 result:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  2.04 GBytes  1.75 Gbits/sec  12674             sen=
der
[  5]   0.00-10.14  sec  2.04 GBytes  1.73 Gbits/sec                  recei=
ver
BTW, those extra features have huge impact on the dom0 =3D> domU direction.
It goes all the way down from ~30 / 18 Gbps to 3.5 / 1.8 Gbps
(variation range) without those.
But there is no retransmission at all in both configs for this direction.
I wonder why such a huge difference since the nic is purely virtual
without any HW acceleration?

Any further suggestions on this retransmission issue?

>
> > So looks like at least the imbalance between two directions are not
> > related to your patch.
> > Likely the debug build is a bigger contributor to the perf difference
> > in both directions.
> >
> > I also tried your patch on a release build, and didn't observe any
> > major difference in iperf3 numbers.
> > Roughly match the 30Gbps and 1.xGbps number on the stock release kernel=
.
>
> Thanks a lot, will try to get this upstream then.
>
> Roger.

