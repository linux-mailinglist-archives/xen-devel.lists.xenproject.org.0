Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF54845C5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 17:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253305.434404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4mJu-0000qe-Vf; Tue, 04 Jan 2022 16:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253305.434404; Tue, 04 Jan 2022 16:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4mJu-0000oq-S2; Tue, 04 Jan 2022 16:05:54 +0000
Received: by outflank-mailman (input) for mailman id 253305;
 Tue, 04 Jan 2022 16:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tRCu=RU=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n4mJu-0000ok-32
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 16:05:54 +0000
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3074d1b9-6d78-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 17:05:52 +0100 (CET)
Received: by mail-io1-f48.google.com with SMTP id 19so44196724ioz.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jan 2022 08:05:52 -0800 (PST)
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
X-Inumbo-ID: 3074d1b9-6d78-11ec-9ce5-af14b9085ebd
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWa3gTZ7+l4mkwVh3q0xvfUGnwUonL23BTR02LfqFLs=;
        b=KZHQ1CpqaajlTKA4gRxHv3cDzpp/yYrfnjZeby5hGqJxjGK7KxW3uv+ZXIV12yUWem
         rMbRPYi31jPNFekrCZaHOd6WnVkhPAf0BREQSnWHTPw0VYkYTT4Y6tphw96KlksdOthr
         8BWnE3+/o3NssDtDJZ7Z4jYHQfDQ2LrJc2A1MC3HEweo/3sfiTpFeZ8Vp886bnAXA7kL
         Sn2YDqbyX9PsxecnNlolojiML4NnQ1GU+2O4i7FGunU/PZb0UQI5aFeUTIcruf4p7E6x
         87U5Us5YWByKOnDtTU/Fm32SJp4VYyW08SgUtojkTwm34qKhSWEiS4GzqglfwA5cpiJ8
         OHoA==
X-Gm-Message-State: AOAM533awQ0wPO9Qw4gMnCKqFyHVr/hs10+t+8z5z05o3oPwB26IcqXn
	yRSadSw6cvpjA6pBhoKRBZFjLQEdqHZAWVukpz19e6Pf1Pg=
X-Google-Smtp-Source: ABdhPJxFUEVm5njilJAf6FkFK6MRJkRpF042HvDq/J2YcZKcjYX4vEJq1bO7rb3r68hcmShhAPh7LO5quzDy3Slb7ik=
X-Received: by 2002:a05:6638:411c:: with SMTP id ay28mr24180219jab.183.1641312351433;
 Tue, 04 Jan 2022 08:05:51 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger> <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger> <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger> <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger>
In-Reply-To: <YdQgf2+E467kuTxK@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Wed, 5 Jan 2022 00:05:39 +0800
Message-ID: <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> > > > But seems like this patch is not stable enough yet and has its own
> > > > issue -- memory is not properly released?
> > >
> > > I know. I've been working on improving it this morning and I'm
> > > attaching an updated version below.
> > >
> > Good news.
> > With this  new patch, the NAS domU can serve iSCSI disk without OOM
> > panic, at least for a little while.
> > I'm going to keep it up and running for a while to see if it's stable over time.
>
> Thanks again for all the testing. Do you see any difference
> performance wise?
I'm still on a *debug* kernel build to capture any potential panic --
none so far -- no performance testing yet.
Since I'm a home user with a relatively lightweight workload, so far I
didn't observe any difference in daily usage.

I did some quick iperf3 testing just now.
1. between nas domU <=> Linux dom0 running on an old i7-3770 based box.
The peak is roughly 12 Gbits/s when domU is the server.
But I do see regression down to ~8.5 Gbits/s when I repeat the test in
a short burst.
The regression can recover when I leave the system idle for a while.

When dom0 is the iperf3 server, the transfer rate is much lower, down
all the way to 1.x Gbits/s.
Sometimes, I can see the following kernel log repeats during the
testing, likely contributing to the slowdown.
             interrupt storm detected on "irq2328:"; throttling interrupt source
Another thing that looks alarming is the retransmission is high:
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   212 MBytes  1.78 Gbits/sec  110    231 KBytes
[  5]   1.00-2.00   sec   230 MBytes  1.92 Gbits/sec    1    439 KBytes
[  5]   2.00-3.00   sec   228 MBytes  1.92 Gbits/sec    3    335 KBytes
[  5]   3.00-4.00   sec   204 MBytes  1.71 Gbits/sec    1    486 KBytes
[  5]   4.00-5.00   sec   201 MBytes  1.69 Gbits/sec  812    258 KBytes
[  5]   5.00-6.00   sec   179 MBytes  1.51 Gbits/sec    1    372 KBytes
[  5]   6.00-7.00   sec  50.5 MBytes   423 Mbits/sec    2    154 KBytes
[  5]   7.00-8.00   sec   194 MBytes  1.63 Gbits/sec  339    172 KBytes
[  5]   8.00-9.00   sec   156 MBytes  1.30 Gbits/sec  854    215 KBytes
[  5]   9.00-10.00  sec   143 MBytes  1.20 Gbits/sec  997   93.8 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.76 GBytes  1.51 Gbits/sec  3120             sender
[  5]   0.00-10.45  sec  1.76 GBytes  1.44 Gbits/sec                  receiver

2. between a remote box <=> nas domU, through a 1Gbps ethernet cable.
Roughly saturate the link when domU is the server, without obvious perf drop
When domU running as a client, the achieved BW is ~30Mbps lower than the peak.
Retransmission sometimes also shows up in this scenario, more
seriously when domU is the client.

I cannot test with the stock kernel nor with your patch in release
mode immediately.
But according to the observed imbalance between inbounding and
outgoing path, non-trivial penalty applies I guess?

> > BTW, an irrelevant question:
> > What's the current status of HVM domU on top of storage driver domain?
> > About 7 years ago, one user on the list was able to get this setup up
> > and running with your help (patch).[1]
> > When I attempted to reproduce a similar setup two years later, I
> > discovered that the patch was not submitted.
> > And even with that patch the setup cannot be reproduced successfully.
> > We spent some time debugging on the problem together[2], but didn't
> > bottom out the root cause at that time.
> > In case it's still broken and you still have the interest and time, I
> > can launch a separate thread on this topic and provide required
> > testing environment.
>
> Yes, better as a new thread please.
>
> FWIW, I haven't looked at this since a long time, but I recall some
> fixes in order to be able to use driver domains with HVM guests, which
> require attaching the disk to dom0 in order for the device model
> (QEMU) to access it.
>
> I would give it a try without using stubdomains and see what you get.
> You will need to run `xl devd` inside of the driver domain, so you
> will need to install xen-tools on the domU. There's an init script to
> launch `xl devd` at boot, it's called 'xendriverdomain'.
Looks like I'm unlucky once again. Let's follow up in a separate thread.

> Thanks, Roger.

