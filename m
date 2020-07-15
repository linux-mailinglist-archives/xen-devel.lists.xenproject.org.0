Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F32217B4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 00:20:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvpkK-0000UP-W7; Wed, 15 Jul 2020 22:19:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szr+=A2=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1jvpkJ-0000UK-Qp
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 22:19:23 +0000
X-Inumbo-ID: 3beba410-c6e9-11ea-bb8b-bc764e2007e4
Received: from mail-oo1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3beba410-c6e9-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 22:19:22 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id t12so787578ooc.10
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 15:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=qfx+yuKlbednJyVorfvp+HJSN+F2bTyRUM8zrY/s2k0=;
 b=vZ25fROQzOV1EB4ilKfBKLfASK4Nofrs2o4/eRG3m3Uu4rl8G5T1YfdoE7E72YHoFp
 8hs0RNxCIHzlmozAOllUEKrvkr+kfPwPEmb6zTVMNk0d1JQnY1dMr+b9WRgPB0+KuJlI
 z1rL08HJxu6nHsk/BdmO9TqmkZKCP3LUYijeysc0d+UJ3r8GNgVVPGBc3epWOlUAS2Pz
 g45m1OLh1LwPsxxTSWNQq+uisW39LeJLyY4LnqUuRVxUJmnLhP6Zb7pQ4lMs/pSZYvyU
 u8fF8du692HxGdFYFR7ZbZVuILDNx4jDQZTBo0mGruHhe6DzmiwPiZD7rU4N+XzipYfQ
 Ba6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=qfx+yuKlbednJyVorfvp+HJSN+F2bTyRUM8zrY/s2k0=;
 b=oQeKWLWL/sbAdQ1G4JXIWubyFJbI1LgP6be/1c9F6+eh4ni9d/Qy/DuyFh+x62l6o9
 1HatB5feVHA47W62cspJMiKljCBPXy80IK3M5iB9l+9+z1s4/edpoMmwrF6N6F41SH8l
 L4e/m2vw/NfhAcsB9eQPJLyhEnRZX3Uu8XjFR2DPrJLhRQaHInhJLpHT+0EVse4UfDAf
 6ojmKYcqJPSNgQPZOlOqCSLcQ01Fp8l62T1MewYHHJJZK7Zs6Kzng5XjI+OJegb8gNnH
 KSJ2dBnzkRxJOjn4ebVXLxWeuafrFDNXvV8iJRxh3EiYkG60XGlYYSthXhBdoPOeWTBE
 Qe6g==
X-Gm-Message-State: AOAM533AHcAGaleYc/I7fZLcQYKRAvFiXKW4DtXDcOEzceocqhD/zp0l
 jVNewoO8fusVfpN/WWQBMu06C0GOM4CA5aZPsUz8K0yY
X-Google-Smtp-Source: ABdhPJzVZk4MFV3ldlIh5dRwFEalmr8n69fgDDy7Y8qquaBSjsALgHSJ3bUgCGZN/VuqbW5o+SMLgQ9wictm2u1fCDw=
X-Received: by 2002:a4a:9630:: with SMTP id q45mr1390129ooi.34.1594851561559; 
 Wed, 15 Jul 2020 15:19:21 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 15 Jul 2020 15:19:07 -0700
Message-ID: <CACMJ4GYLKR99Y-J9L-qAG75BeNL9URSEi3HfYjSrCOCohqsw-A@mail.gmail.com>
Subject: Design Sessions notes: Xen system boot: launching VMs (DomB mode of
 dom0less)
To: xen-devel <xen-devel@lists.xenproject.org>
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
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Adam Schwalm <adam.schwalm@starlab.io>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

# Session Notes on Xen system boot: launching VMs (DomB mode of dom0less)

Sessions Host: Christopher Clark. Scribing: Daniel Smith & Christopher Clar=
k.

The DomB-mode-for-dom0less topic was covered in two design session slots
at the Xen Design & Developer Summit 2020.

## Session 1: Xen system boot: launching VMs (DomB)

A talk presenting background on the project and a progress update on the
development work sponsored by Star Lab Corp. This talk is preparatory
material for the following second session.

> A presentation of progress towards building DomB: a new mode of
> starting Xen with guest workloads launched at host boot - including
> support for x86 platforms, system disaggregation and running without
> dom0, and architecture to support measurement of system launch.

Slides are available here:
https://static.sched.com/hosted_files/xen2020/91/DomB%20-%20Xen%20Design%20=
%26%20Developer%20Summit%202020.pdf

## Session 2: Next steps for Xen system boot: launching VMs (DomB)

A Design Session discussion, discussing forward direction and topics
identified during building the initial prototype work.

### Session seed notes, shared on-screen during the session:

* Basics: general structure:
    - bootloader loads domain materials into RAM (kernels, ramdisks)
    - some metadata, in binary form, describes the domains to be launched
    - hypervisor performs domain construction
        - PVH and PV supported
    - only one guest is unpaused by the hypervisor: domB
    - domB unpauses other domains when ready to do so
        -> allows measurement to be performed by domB
        -> allows configuration to be applied by domB
        -> allows domB to sequence startup of other domains, if necessary
    - domB permissions: no hardware access, limited privileges to do
setup operations
    - hardware domain permissions: subset of the current dom0, no
is_priv for control ops

Needed for usability:
    - support for bringup of PV devices
        -> toolstack needs to be aware of Initial Domains as started
and initiate
           the bringup of backends

* Questions:
    - is claiming the first multiboot module, and dynamically toggling
dom0/domB mode, acceptable?
    - is there a tree + binary format outside of Xen that provides what we =
need?
    - is there momentum behind a technology elsewhere that Xen needs to sup=
port?
    - logic for building ACPI tables:
        - enable DomB to do this for other Initial Domains?
    - how best to implement "atomic handoff":
        - exit of DomB
        - continuation of the Initial Domains after their configuration by =
DomB
    - how best to surface the Launch Control Module contents to DomB?
        - ACPI tables? (PVH)
        - what about PV mode?

* Guidance:
    - how to bringup PV disk and network (etc) for the Initial Domains?
        - A: the toolstack domain interrogates Xen, gets data on the
Initial Domains,
             and then uses its own database to bring them up
            - means coordination between data in the toolstack and
config in the LCM
    - guest kernel decompression
        - complex, and implementation is not shared with anything else
        - would prefer to do the decompress in a guest context rather
than the hypervisor
          and use a bootloader-supplied decompressor binary, outside
the hypervisor

* To Research / Investigate:
    - from Stefano: "system device tree"
    - Implementing support for HVM-mode initial domains:
        - primary use case is "non-PV VMs that can have devices
directly assigned"
            - so PVH with working PCI passthrough would suffice
            - but having the ability to launch HVM too would be nice
        - needs bringup of the device emulator, and Xen configured to conne=
ct it


### Comments and discussion during the session:

_Jason Andryuk, Q: does the hypervisor construct multiple domains or domB o=
nly?_
Christopher, A: the hypervisor constructs multiple domains

_Damien Thenot (dthenot), Q: Could DomB be used to explore hardware
and create domain driver as needed ?_
Christopher: yes it could; but don't want domB to become a dom0 again

> post-session note: this is about wanting to avoid unbounded scope creep f=
or a single domB:
> the domB structure will enable doing these functions in other independent=
 initial domains
> that are also launched and run at host boot. DomB is unlikely to have per=
mission to perform
> any domain creation by default, since it won't need it - it just applies =
configuration and
> unpause to the other domains that Xen builds at host boot.

_Bobby Eshleman, Q: does no hardware access imply no TPM access here?
Just thinking about the measurement capabilities of DomB._
Christopher: yes but is under discussion. a possibility is to put a
minimal tpm driver in xen so that DomB can be measured before launch.
Roger Pau Monn=C3=A9: TPM is just assigned to dom0 (or the hw domain),
there's no special handling of it in Xen
Jason Andryuk: You can have the bootloader measure all the pieces into
the TPM before transitioning to Xen/domB, but those would be the
compressed artifacts.

> post-session note: enabling a strong full-system architecture for measure=
d launch and
> virtual TPM support for domains, where the vTPM is rooted in the physical=
 TPM is
> important and a motivation behind the DomB architecture.

_Bertrand Marquis: Could you explain a bit more the decompression? i
do not quite get why it is done in Xen?_
Christopher: if the dom0 kernel is detected as compressed, Xen will
decompress it.
Andy Cooper: Xen needs to decompress the elf header to get elf notes
to boot a PV domain.
Christopher: one thought is to do it another vmcs context
Andy: yes but adding a lot of overhead to do that

_Christopher: Is the proposed LCM detection a reasonable upstreamable appro=
ach?_
Andy: yes it is acceptable
??: Arm uses device tree
- Christopher: isn't it fixed, to describe hardware?
Bertrand: Xen already has logic to extend the tree
Stefano: could domb use a small key/value device tree with LCM fields
and use existing DTB parser in Arm XEN
Julien: don't use libft on untrusted device trees, not suitable for
the hypervisor

_Christopher: Is it foreign to use ACPI to expose LCM to guests on ARM?_
Bertrand, Stefano: ARM now has ACPI so its not really foreign, is ok

_Topic: Getting device info to the toolstack after launch_
J=C3=BCrgen Gro=C3=9F: xenstore stubdom is upstream/available
xl/libxl is a separate issue
problem with dom0less is issue with getting xenstored up before domU
starts trying to do xenstore/device setups

< xenstore setup discussion >
  - basic conclusion is that it is a bit of mess and needs cleaned up

_Nicolas Poirot, Q: if domB starts guests and quit, will there be no
management (reboot, shutdown) of the guests?_
Rich Persaud [stacktrust]: I think yes for the static partitioning use
case, which overlaps somewhat with dom0less.  If management is needed,
one of the started guests can be a privileged toolstack domain.

> post-session note: domB doesn't host the management, control or toolstack=
 software that does that, and
> it does not have the control domain privileged permissions that are neede=
d to do it.
> However, you can start a control domain at host boot, with the DomB archi=
tecture, and that will handle it.
> You describe the control domain you want in the Launch Control Module, pr=
ovide a kernel and optional ramdisk
> to the bootloader, and then Xen will build it and DomB will assist with c=
onfiguring and starting that domain.


_Rich Persaud [stacktrust] : For those new to domB, some material for
offline reading:_

* Dec 2019 design meeting in Cambridge: https://lists.gt.net/xen/devel/5778=
00
* May 2020 domB design doc v1: https://lists.gt.net/xen/devel/586365
* TrenchBoot (DRTM):
https://github.com/TrenchBoot/documentation/tree/master/presentations
* OpenXT & boot integrity: https://openxt.org/ecosystems/
* PSEC 2019: https://www.platformsecuritysummit.com/2019/videos/
* PSEC 2018: https://www.platformsecuritysummit.com/2018/videos/

We can also schedule a separate conference call after Xen Summit.
You can email rp@stacktrust.org if you're interested in being included
in a future domB conference call to review v2 of the design doc

> post-session note: DomB is being built with intent to support the
> 'Hardened Access Terminals' (HAT) architecture, also presented at the
> summit, with slides available here:

https://static.sched.com/hosted_files/xen2020/46/Reliable%20Platform%20Secu=
rity_%20Xen%20and%20the%20Fidelis%20Platform%20for%20Hardened%20Access%20Te=
rminals%20%28HAT%29.pdf

### Observations

> - general tone was supportive from many sides
> - device tree needs looking at, and if so, will need a security-capable
>   parser (libfdt is specifically not suitable for it)
> - xenstore is a pain point (yet again)
> - we can=E2=80=99t ditch the existing kernel decompressor since PV needs =
to read
>   the ELF notes, which need decompressing to access
> - TPM access needs explaining in our documentation

A big thanks to the conference attendees for the interest expressed in
the two sessions that enabled both of these to be scheduled, and for the
positive and active engagement in the discussions.

