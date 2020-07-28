Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB22307D0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 12:40:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0N17-00012P-UM; Tue, 28 Jul 2020 10:39:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ae7q=BH=gmail.com=alejandro.gonzalez.correo@srs-us1.protection.inumbo.net>)
 id 1k0N16-00011t-Dn
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 10:39:28 +0000
X-Inumbo-ID: 9c0495c6-d0be-11ea-8b26-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c0495c6-d0be-11ea-8b26-bc764e2007e4;
 Tue, 28 Jul 2020 10:39:27 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w17so17035004oie.6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F/Ok6kXKD7ZtkHsiCRqYn+tABQDkmCdFMgWtmQnzruE=;
 b=eQpT/2ug3/kbEtXJOQ7V5qGPweHBgcxFFc7N00o3Rpa9ON4x1LK9VN2xCpFMuJZWfM
 5K5/A6HJmFxKYIwHA0c0+pJShojFAUa26adaGlNLTJBcwPebOfHm6KAX0wmT1Ny/Irhs
 6/UINtNGAnLal1iDkijIW8dslyV/JTtVtWd3AplR78s0j/eLA3xoFA2uxb3KPvhBRD7W
 mPQsB49HZL4g8w6hQEL2wFl6QJQ4Tv0wTPxCproOHcBdwigtYu+ZHsI79mxxT8OPbSYO
 D36See2l5Ykrb+t83SP+5ou+EXUTDLrWnfAZOw/sdLC21yySCI2QVxN7PsOST1lD1jNg
 gGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F/Ok6kXKD7ZtkHsiCRqYn+tABQDkmCdFMgWtmQnzruE=;
 b=I0Pb8e/e85Z20arQ8KHlMBSx8s8NiyamrxvP5XOlqnB9mp8lAXknij1jegJ3a7qwWJ
 2nsCq7x7Az9a3T3jXhmzO704hGW1wJLCgiZCY1Gnydu1V+yFEuQJMwho7sLNxOakErWO
 O9JoJv8RAcWWP+hxVoLExE9Jihpzv8lqvn61heRIX8CFVc2xqOGBpv+ZAVIKju/g1MPd
 T7IViCqAbxUnYV7tzkzcngQ56pYSiQeGuceL0T553rGl/NI/1QvH3rV0eNY4cphkiPYq
 YPmkgyzme6zv2exPLHddbYYddW+27pKDIXlejkYVDvRD+St4j4taqNBnYGJYPO5fbFFJ
 fR5A==
X-Gm-Message-State: AOAM533c0ubhoDJbg2PLA9sy3HWECcg+j63uhTLRK/zjpABCwzh3GLFv
 oe/Ea6qL6xwjWKm1J4pr4NsWD8kxDqZHioIXImU=
X-Google-Smtp-Source: ABdhPJx9Jr+sG7cAAE0/zaQ15n0JwVIsrHMvEFSnuFvRl87JtK6CVw3FRDNn5yNZCc42ywq7qCcC28BN1ePQM1o+Wo0=
X-Received: by 2002:a05:6808:3b8:: with SMTP id
 n24mr2807719oie.84.1595932766515; 
 Tue, 28 Jul 2020 03:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
 <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
 <02b630bd-22e0-afde-6784-be068d0948ae@arm.com>
In-Reply-To: <02b630bd-22e0-afde-6784-be068d0948ae@arm.com>
From: Alejandro <alejandro.gonzalez.correo@gmail.com>
Date: Tue, 28 Jul 2020 12:39:14 +0200
Message-ID: <CA+wirGoG+im2mwb2ye6j4MpcVtfQ-prhhmVgdBTosus7hjeu=w@mail.gmail.com>
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

El dom., 26 jul. 2020 a las 22:25, Andr=C3=A9 Przywara
(<andre.przywara@arm.com>) escribi=C3=B3:
> So this was actually my first thought: The firmware (U-Boot SPL) sets up
> some basic CPU frequency (888 MHz for H6 [1]), which is known to never
> overheat the chip, even under full load. So any concern from your side
> about the board or SoC overheating could be dismissed, with the current
> mainline code, at least. However you lose the full speed, by quite a
> margin on the H6 (on the A64 it's only 816 vs 1200(ish) MHz).
> However, without the clock entries in the CPU node, the frequency would
> never be changed by Dom0 anyway (nor by Xen, which doesn't even know how
> to do this).
> So from a practical point of view: unless you hack Xen to pass on more
> cpu node properties, you are stuck at 888 MHz anyway, and don't need to
> worry about overheating.
Thank you. Knowing that at least it won't overheat is a relief. But
the performance definitely suffers from the current situation, and
quite a bit. I'm thinking about using KVM instead: even if it does
less paravirtualization of guests, I'm sure that the ability to use
the maximum frequency of the CPU would offset the additional overhead,
and in general offer better performance. But with KVM I lose the
ability to have individual domU's dedicated to some device driver,
which is a nice thing to have from a security standpoint.

> Now if you would pass on the CPU clock frequency control to Dom0, you
> run into more issues: the Linux governors would probably try to setup
> both frequency and voltage based on load, BUT this would be Dom0's bogus
> perception of the actual system load. Even with pinned Dom0 vCPUs, a
> busy system might spend most of its CPU time in DomU VCPUs, which
> probably makes it look mostly idle in Dom0. Using a fixed governor
> (performance) would avoid this, at the cost of running full speed all of
> the time, probably needlessly.
>
> So fixing the CPU clocking issue is more complex and requires more
> ground work in Xen first, probably involving some enlightenend Dom0
> drivers as well. I didn't follow latest developments in this area, nor
> do I remember x86's answer to this, but it's not something easy, I would
> presume.
I understand, thanks :). I know that recent Intel CPUs (from Sandy
Bridge onwards) use P-states to manage frequencies, and even have a
mode of operation that lets the CPU select the P-states by itself. On
older processors, Xen can probably rely on ACPI data to do the
frequency scaling. But the most similar "standard thing" that my board
has, a AR100 coprocessor that with the (work in progress) Crust
firmware can be used with SCMI, doesn't even seem to support the use
case of changing CPU frequency... and SCMI is the most promising
approach for adding DVFS support in Xen for ARM, according to this
previous work: https://www.slideshare.net/xen_com_mgr/xpdds18-cpufreq-in-xe=
n-on-arm-oleksandr-tyshchenko-epam-systems

> Alejandro: can you try to measure the actual CPU frequency in Dom0?
> Maybe some easy benchmark? "mhz" from lmbench does a great job in
> telling you the actual frequency, just by clever measurement. But any
> other CPU bound benchmark would do, if you compare bare metal Linux vs.
> Dom0.
I have measured the CPU frequency in Dom0 using lmbench several times
and it seems to be stuck at 888 MHz, the frequency set by U-Boot.
Overall, the system feels more sluggish than when using bare Linux,
too. It doesn't matter if I apply the "hacky fix" I mentioned before
or not.

> Also, does cpufreq come up in Dom0 at all? Can you select governors and
> frequencies?
It doesn't come up, and no sysfs entries are created for cpufreq. With
the "fix", the kernel prints an error message complaining that it
couldn't probe cpufreq-dt, but it still doesn't come up, and sysfs
entries for cpufreq aren't created either.

