Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3022C447
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 13:20:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyvkg-0001qq-9h; Fri, 24 Jul 2020 11:20:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mtOI=BD=gmail.com=alejandro.gonzalez.correo@srs-us1.protection.inumbo.net>)
 id 1jyvkf-0001qj-42
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 11:20:33 +0000
X-Inumbo-ID: afb02e04-cd9f-11ea-87fc-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afb02e04-cd9f-11ea-87fc-bc764e2007e4;
 Fri, 24 Jul 2020 11:20:32 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id g37so6680679otb.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SmFGggjYg2xKc6nhXweMYQaHBSC3vmhtgUBewHY866Q=;
 b=gYRHl5sLTXnEDls4bpprBiWDlr64ZWXOBJGJ1oR6XdDOoq4nWXbvTYUFkNzOV/ToCx
 XmXfSFm/vL3GUI3013artVLvyBzH7cfRgB+uClQ5ADTABOV1N1kDKHA2tqm0SJdKsMTB
 t81U2MpRT/N7XTnnsLIRDHrkbuIFs5d1NowCZGrzNzZ4+MgxfVavw0oCH6fQHvHKB/hw
 gFw38GMbRMDCnGgSfN0WI7RdPGV9M44G3eFjDsYZazsuKmmezMW08DtjZOt+Lz6t5757
 OERjMo2Diz+za9jZ53MyOMSvjTwh+hHcPSwsvJj5DV73tMG32fQep6jFkBCpKrTz7P6L
 U7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SmFGggjYg2xKc6nhXweMYQaHBSC3vmhtgUBewHY866Q=;
 b=ftnVDTQiIPLVbbb6m2Yuz7Oq08GUCfYjP/w7iOemjAdMG5mZRIrySBsnXoVXk9xVQ7
 8lAL38wEIpASc63F/e1wPyuXV2eubl5uvn2U26kcJPItGg46LB8uEPplwOuKtMz8iEzY
 /svEhiV40zXyqaOt2ZqYPRz6xN4R+8QMRzE0eYFAHmryyyZnCszJiONiwCd8LEZlCqQh
 uYoRgF70T/d9AUz3y364mmcgcvsXWMF1Wols27tWKMnmL+wsyMqI0k0473jXmqM2YhCh
 fgxPDTK0hIRin8709qK2G6Bo9Jv/ThPiYNuQyvRmRjZtSyRRnA//0QM/j6P2FYGkHqoD
 0HfA==
X-Gm-Message-State: AOAM531X6vVjr9SFvCWw1KBSrHCqaiOCzyNF0O6kvYIgxCIPpNvu8ffi
 7IUikAzjSt4fd0QMmBFoZtlU3zT88MaOMRDnVnw=
X-Google-Smtp-Source: ABdhPJxn5ig285p+poPNj4iS9TDjc9OOibS2iWAvBoXPT3a8PGtRy4/d5XDpnDpoVGKD24NXV+i439E1jKuOX8DyoIo=
X-Received: by 2002:a9d:3984:: with SMTP id y4mr2456274otb.92.1595589631504;
 Fri, 24 Jul 2020 04:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
In-Reply-To: <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
From: Alejandro <alejandro.gonzalez.correo@gmail.com>
Date: Fri, 24 Jul 2020 13:20:10 +0200
Message-ID: <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Julien Grall <julien@xen.org>
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello, and thanks for the response.

El vie., 24 jul. 2020 a las 12:45, Julien Grall (<julien@xen.org>) escribi=
=C3=B3:
> > I'm trying Xen 4.13.1 in a Allwinner H6 SoC (more precisely a Pine H64
> > model B, with a ARM Cortex-A53 CPU).
> > I managed to get a dom0 Linux 5.8-rc5 kernel running fine, unpatched,
> > and I'm using the upstream device tree for
> > my board. However, the dom0 kernel has trouble when reading some DT
> > nodes that are related to the CPUs, and
> > it can't initialize the thermal subsystem properly, which is a kind of
> > showstopper for me, because I'm concerned
> > that letting the CPU run at the maximum frequency without watching out
> > its temperature may cause overheating.
>
> I understand this concern, I am aware of some efforts to get CPUFreq
> working on Xen but I am not sure if there is anything available yet. I
> have CCed a couple of more person that may be able to help here.

Thank you for the CCs. I hope they can bring on some insight about this :)

> > The relevant kernel messages are:
> >
> > [  +0.001959] sun50i-cpufreq-nvmem: probe of sun50i-cpufreq-nvmem
> > failed with error -2
> > ...
> > [  +0.003053] hw perfevents: failed to parse interrupt-affinity[0] for =
pmu
> > [  +0.000043] hw perfevents: /pmu: failed to register PMU devices!
> > [  +0.000037] armv8-pmu: probe of pmu failed with error -22
>
> I am not sure the PMU failure is related to the thermal failure below.

I'm not sure either, but after comparing the kernel messages for a
boot with and without Xen, those were the differences (excluding, of
course, the messages that inform that the Xen hypervisor console is
being used and such). For the sake of completeness, I decided to
mention it anyway.

> > [  +0.000163] OF: /thermal-zones/cpu-thermal/cooling-maps/map0: could
> > not find phandle
> > [  +0.000063] thermal_sys: failed to build thermal zone cpu-thermal: -2=
2
> Would it be possible to paste the device-tree node for
> /thermal-zones/cpu-thermal/cooling-maps? I suspect the issue is because
> we recreated /cpus from scratch.
>
> I don't know much about how the thermal subsystem works, but I suspect
> this will not be enough to get it working properly on Xen. For a
> workaround, you would need to create a dom0 with the same numbers of
> vCPU as the numbers of pCPUs. They would also need to be pinned.
>
> I will leave the others to fill in more details.

I think I should mention that I've tried to hackily fix things by
removing the make_cpus_node call on handle_node
(https://github.com/xen-project/xen/blob/master/xen/arch/arm/domain_build.c=
#L1585),
after removing the /cpus node from the skip_matches array. This way,
the original /cpus node was passed through, without being recreated by
Xen. Of course, I made sure that dom0 used the same number of vCPUs as
pCPUs, because otherwise things would probably blow up, which luckily
that was not a compromise for me. The end result was that the
aforementioned kernel error messages were gone, and the thermal
subsystem worked fine again. However, this time the cpufreq-dt probe
failed, with what I think was an ENODEV error. This left the CPU
locked at the boot frequency of less than 1 GHz, compared to the
maximum 1.8 GHz frequency that the SoC supports, which has bad
implications for performance.

Therefore, as it seems that passing more properties (like
#cooling-cells) is enough to get temperatures working, I suspect that
fixing the thermal issue is relatively easy, at least for my SoC. But
maybe I have just been lucky and that's not supposed to work anyway;
I'm not sure.

> >
> > I've searched for issues, code or commits that may be related for this
> > issue. The most relevant things I found are:
> >
> > - A patch that blacklists the A53 PMU:
> > https://patchwork.kernel.org/patch/10899881/
> > - The handle_node function in xen/arch/arm/domain_build.c:
> > https://github.com/xen-project/xen/blob/master/xen/arch/arm/domain_buil=
d.c#L1427
>
> I remember this discussion. The problem was that the PMU is using
> per-CPU interrupts. Xen is not yet able to handle PPIs as they often
> requires more context to be saved/restored (in this case the PMU context)=
.
>
> There was a proposal to look if a device is using PPIs and just remove
> them from the Device-Tree. Unfortunately, I haven't seen any official
> submission for this patch.
>
> Did you have to apply the patch to boot up? If not, then the error above
> shouldn't be a concern. However, if you need PMU support for the using
> thermal devices then it is going to require some work.

No, I didn't apply any patch to Xen whatsoever. It worked fine out of
the box. As I mentioned above, with a more complete /cpus node
declaration, the thermal subsystem works. I guess the PMU worked fine
too, but I didn't test it in any way, so maybe it is just barely able
to probe successfully somehow.

> > I've thought about removing "/cpus" from the skip_matches array in the
> > handle_node function, but I'm not sure
> > that would be a good fix.
>
> The node "/cpus" and its sub-node are recreated by Xen for Dom0. This is
> because Dom0 may have a different numbers of vCPUs and it doesn't seen
> the pCPUs.
>
> If you don't skip "/cpus" from the host DT then you would end up with
> two "/cpus" path in your dom0 DT. Mostly likely, Linux will not be happy
> with it.

Indeed, that is consistent with my observations of how the source code
works. Thanks for the confirmation :)

> I vaguely remember some discussions on how to deal with CPUFreq in Xen.
> IIRC we agreed that Dom0 should be part of the equation because it
> already contains all the drivers. However, I can't remember if we agreed
> how the dom0 would be made aware of the pCPUs.

That makes sense. Supporting every existing thermal and cpufreq method
in every ARM SoC seems like a lot of unneeded duplication of work,
provided that Linux already has pretty good support for that. But, if
that's the case, I guess we should not mark the "dom0-kernel" cpufreq
boot parameter as deprecated in the documentation, at least for the
ARM platform: http://xenbits.xen.org/docs/unstable/misc/xen-command-line.ht=
ml#cpufreq

