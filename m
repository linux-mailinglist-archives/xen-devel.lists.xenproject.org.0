Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5086417889
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 18:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195528.348274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTo5E-00074O-8L; Fri, 24 Sep 2021 16:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195528.348274; Fri, 24 Sep 2021 16:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTo5E-00071e-51; Fri, 24 Sep 2021 16:29:56 +0000
Received: by outflank-mailman (input) for mailman id 195528;
 Fri, 24 Sep 2021 16:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux8n=OO=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mTo5C-00071Y-PI
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 16:29:55 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53515554-81fd-4d5c-904d-a7458f354e79;
 Fri, 24 Sep 2021 16:29:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w29so29088837wra.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Sep 2021 09:29:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u5sm9395511wrg.57.2021.09.24.09.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:29:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9722A1FF96;
 Fri, 24 Sep 2021 17:29:49 +0100 (BST)
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
X-Inumbo-ID: 53515554-81fd-4d5c-904d-a7458f354e79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pK+e0gcZSWyBBOoTvejTaB+/zyvm0r9wyq1cvfaHXU4=;
        b=vQhxZeohU4exu/jwGyxm7tJJGZaGq1dMuhdkp2PAuU72UjELINp3Cv4kuFTRFkA8o+
         MP+WJ/BviYn3eA29rR0ZVCb8VWjFHhlHPMt6TjUg6zYqK9iPRjDYmpTzGKv0oJIfJHF7
         gBeeTPFv3sol0GldPG/WvzaC2TUVCtxXRl5xYTPuUxY5Mq2QlzQP34qAQYCvJSN1yVod
         IFSzLBfxlPMjFvI9twk5BAmYSKMXPwWOOfpBlCnS/szGEX6Kyhq0YzYFQvu5fnKGQtYI
         0MmZerE0WI4mSbebsZ6mPWwBlrEqbSUw57oZ+2Q4jD+v7aTL3/yRB2y3fgEF4buArC97
         sEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=pK+e0gcZSWyBBOoTvejTaB+/zyvm0r9wyq1cvfaHXU4=;
        b=jvjz98WrUmg4+iJb1FF4rH3mMVtFt5aUH56GMWYc72l3cFDazdGjFR8GQczlKvckgt
         KrTdusWwB+gOe7CGxvvrpweM5AHfLdFjqHI6Dcp4I6X65Pwiks+fbM8k8OFrq8/pRBng
         WG8ln2MWuqEsegBS/0ue5O0I3YDb8Iq4baGajQ1kTbxfAQlq5yuVGg5qZNdxx8UaFzD+
         d+xqS8WV20B7vab1fJUQzvIxFe15Qe4Ncw7yEg8GN5oOYXGGTiLooCsTWAsgjWRTqHO/
         K3xiWUJDeJ46EayThDD+AorAtg1g73B1I37Il0tXbvp/nGL1C3E0+fiJsq0nZYxg2rzp
         wqiA==
X-Gm-Message-State: AOAM530f9LKbSK635zj5KNfdxNT5rKgnC5T+tMXEbF9fy6bt7YXGQWQp
	4wNusrQlsGsV0+wwYK8EXVWUHw==
X-Google-Smtp-Source: ABdhPJyr5rsOWUnFfKbQyu5WNqvZfGkfv2j2QIG/rgh9kYWQpaVzAPa8kgY70OTZ+bBraZdbrxBdSg==
X-Received: by 2002:a7b:c191:: with SMTP id y17mr3108178wmi.122.1632500991281;
        Fri, 24 Sep 2021 09:29:51 -0700 (PDT)
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Cc: Mike Holmes <mike.holmes@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 xen-devel@lists.xenproject.org, wl@xen.org,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "Rust-VMM Mailing List" <rust-vmm@lists.opendev.org>,
 Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Xen Rust VirtIO demos work breakdown for Project Stratos
Date: Fri, 24 Sep 2021 17:02:46 +0100
Message-ID: <87pmsylywy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

The following is a breakdown (as best I can figure) of the work needed
to demonstrate VirtIO backends in Rust on the Xen hypervisor. It
requires work across a number of projects but notably core rust and virtio
enabling in the Xen project (building on the work EPAM has already done)
and the start of enabling rust-vmm crate to work with Xen.

The first demo is a fairly simple toy to exercise the direct hypercall
approach for a unikernel backend. On it's own it isn't super impressive
but hopefully serves as a proof of concept for the idea of having
backends running in a single exception level where latency will be
important.

The second is a much more ambitious bridge between Xen and vhost-user to
allow for re-use of the existing vhost-user backends with the bridge
acting as a proxy for what would usually be a full VMM in the type-2
hypervisor case. With that in mind the rust-vmm work is only aimed at
doing the device emulation and doesn't address the larger question of
how type-1 hypervisors can be integrated into the rust-vmm hypervisor
model.

A quick note about the estimates. They are exceedingly rough guesses
plucked out of the air and I would be grateful for feedback from the
appropriate domain experts on if I'm being overly optimistic or
pessimistic.

The links to the Stratos JIRA should be at least read accessible to all
although they contain the same information as the attached document
(albeit with nicer PNG renderings of my ASCII art ;-). There is a
Stratos sync-up call next Thursday:

  https://calendar.google.com/event?action=3DTEMPLATE&tmeid=3DMWpidm5lbzM5N=
jlydnAxdWxvc2s4aGI0ZGpfMjAyMTA5MzBUMTUwMDAwWiBjX2o3bmdpMW84cmxvZmtwZWQ0cjVj=
aDk4bXZnQGc&tmsrc=3Dc_j7ngi1o8rlofkped4r5ch98mvg%40group.calendar.google.com

and I'm sure there will also be discussion in the various projects
(hence the wide CC list). The Stratos calls are open to anyone who wants
to attend and we welcome feedback from all who are interested.

So on with the work breakdown:

                    =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
                     STRATOS PLANNING FOR 21 TO 22

                              Alex Benn=C3=A9e
                    =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81


Table of Contents
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80

1. Xen Rust Bindings ([STR-51])
.. 1. Upstream an "official" rust crate for Xen ([STR-52])
.. 2. Basic Hypervisor Interactions hypercalls ([STR-53])
.. 3. [#10] Access to XenStore service ([STR-54])
.. 4. VirtIO support hypercalls ([STR-55])
2. Xen Hypervisor Support for Stratos ([STR-56])
.. 1. Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
.. 2. Tweaks to tooling to launch VirtIO guests
3. rust-vmm support for Xen VirtIO ([STR-59])
.. 1. Make vm-memory Xen aware ([STR-60])
.. 2. Xen IO notification and IRQ injections ([STR-61])
4. Stratos Demos
.. 1. Rust based stubdomain monitor ([STR-62])
.. 2. Xen aware vhost-user master ([STR-63])





1 Xen Rust Bindings ([STR-51])
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90

  There exists a [placeholder repository] with the start of a set of
  x86_64 bindings for Xen and a very basic hello world uni-kernel
  example. This forms the basis of the initial Xen Rust work and will be
  available as a [xen-sys crate] via cargo.


[STR-51] <https://linaro.atlassian.net/browse/STR-51>

[placeholder repository] <https://gitlab.com/cardoe/oxerun.git>

[xen-sys crate] <https://crates.io/crates/xen-sys>

1.1 Upstream an "official" rust crate for Xen ([STR-52])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80

  To start with we will want an upstream location for future work to be
  based upon. The intention is the crate is independent of the version
  of Xen it runs on (above the baseline version chosen). This will
  entail:

  =E2=80=A2 =E2=98=90 agreeing with upstream the name/location for the sour=
ce
  =E2=80=A2 =E2=98=90 documenting the rules for the "stable" hypercall ABI
  =E2=80=A2 =E2=98=90 establish an internal interface to elide between ioct=
l mediated
    and direct hypercalls
  =E2=80=A2 =E2=98=90 ensure the crate is multi-arch and has feature parity=
 for arm64

  As such we expect the implementation to be standalone, i.e. not
  wrapping the existing Xen libraries for mediation. There should be a
  close (1-to-1) mapping between the interfaces in the crate and the
  eventual hypercall made to the hypervisor.

  Estimate: 4w (elapsed likely longer due to discussion)


[STR-52] <https://linaro.atlassian.net/browse/STR-52>


1.2 Basic Hypervisor Interactions hypercalls ([STR-53])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80

  These are the bare minimum hypercalls implemented as both ioctl and
  direct calls. These allow for a very basic binary to:

  =E2=80=A2 =E2=98=90 console_io - output IO via the Xen console
  =E2=80=A2 =E2=98=90 domctl stub - basic stub for domain control (differen=
t API?)
  =E2=80=A2 =E2=98=90 sysctl stub - basic stub for system control (differen=
t API?)

  The idea would be this provides enough hypercall interface to query
  the list of domains and output their status via the xen console. There
  is an open question about if the domctl and sysctl hypercalls are way
  to go.

  Estimate: 6w


[STR-53] <https://linaro.atlassian.net/browse/STR-53>


1.3 [#10] Access to XenStore service ([STR-54])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80

  This is a shared configuration storage space accessed via either Unix
  sockets (on dom0) or via the Xenbus. This is used to access
  configuration information for the domain.

  Is this needed for a backend though? Can everything just be passed
  direct on the command line?

  Estimate: 4w


[STR-54] <https://linaro.atlassian.net/browse/STR-54>


1.4 VirtIO support hypercalls ([STR-55])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80

  These are the hypercalls that need to be implemented to support a
  VirtIO backend. This includes the ability to map another guests memory
  into the current domains address space, register to receive IOREQ
  events when the guest knocks at the doorbell and inject kicks into the
  guest. The hypercalls we need to support would be:

  =E2=80=A2 =E2=98=90 dmop - device model ops (*_ioreq_server, setirq, nr_v=
pus)
  =E2=80=A2 =E2=98=90 foreignmemory - map and unmap guest memory

  The DMOP space is larger than what we need for an IOREQ backend so
  I've based it just on what arch/arm/dm.c exports which is the subset
  introduced for EPAM's virtio work.

  Estimate: 12w


[STR-55] <https://linaro.atlassian.net/browse/STR-55>


2 Xen Hypervisor Support for Stratos ([STR-56])
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90

  These tasks include tasks needed to support the various different
  deployments of Stratos components in Xen.


[STR-56] <https://linaro.atlassian.net/browse/STR-56>

2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80

  Currently the foreign memory mapping support only works for dom0 due
  to reference counting issues. If we are to support backends running in
  their own domains this will need to get fixed.

  Estimate: 8w


[STR-57] <https://linaro.atlassian.net/browse/STR-57>


2.2 Tweaks to tooling to launch VirtIO guests
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80

  There might not be too much to do here. The EPAM work already did
  something similar for their PoC for virtio-block. Essentially we need
  to ensure:
  =E2=80=A2 =E2=98=90 DT bindings are passed to the guest for virtio-mmio d=
evice
    discovery
  =E2=80=A2 =E2=98=90 Our rust backend can be instantiated before the domU =
is launched

  This currently assumes the tools and the backend are running in dom0.

  Estimate: 4w


3 rust-vmm support for Xen VirtIO ([STR-59])
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90

  This encompasses the tasks required to get a vhost-user server up and
  running while interfacing to the Xen hypervisor. This will require the
  xen-sys.rs crate for the actual interface to the hypervisor.

  We need to work out how a Xen configuration option would be passed to
  the various bits of rust-vmm when something is being built.


[STR-59] <https://linaro.atlassian.net/browse/STR-59>

3.1 Make vm-memory Xen aware ([STR-60])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80

  The vm-memory crate is the root crate for abstracting access to the
  guests memory. It currently has multiple configuration builds to
  handle difference between mmap on Windows and Unix. Although mmap
  isn't directly exposed the public interfaces support a mmap like
  interface. We would need to:

  =E2=80=A2 =E2=98=90 work out how to expose foreign memory via the vm-memo=
ry mechanism

  I'm not sure if this just means implementing the GuestMemory trait for
  a GuestMemoryXen or if we need to present a mmap like interface.

  Estimate: 8w


[STR-60] <https://linaro.atlassian.net/browse/STR-60>


3.2 Xen IO notification and IRQ injections ([STR-61])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80

  The KVM world provides for ioeventfd (notifications) and irqfd
  (injection) to signal asynchronously between the guest and the
  backend. As far a I can tell this is currently handled inside the
  various VMMs which assume a KVM backend.

  While the vhost-user slave code doesn't see the
  register_ioevent/register_irqfd events it does deal with EventFDs
  throughout the code. Perhaps the best approach here would be to create
  a IOREQ crate that can create EventFD descriptors which can then be
  passed to the slaves to use for notification and injection.

  Otherwise there might be an argument for a new crate that can
  encapsulate this behaviour for both KVM/ioeventd and Xen/IOREQ setups?

  Estimate: 8w?


[STR-61] <https://linaro.atlassian.net/browse/STR-61>


4 Stratos Demos
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90

  These tasks cover the creation of demos that brig together all the
  previous bits of work to demonstrate a new area of capability that has
  been opened up by Stratos work.


4.1 Rust based stubdomain monitor ([STR-62])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80

  This is a basic demo that is a proof of concept for a unikernel style
  backend written in pure Rust. This work would be a useful precursor
  for things such as the RTOS Dom0 on a safety island ([STR-11]) or as a
  carrier for the virtio-scmi backend.

  The monitor program will periodically poll the state of the other
  domains and echo their status to the Xen console.

  Estimate: 4w

#+name: stub-domain-example
#+begin_src ditaa :cmdline -o :file stub_domain_example.png
                      Dom0                      |        DomU       |      =
DomStub=20=20=20
                                                |                   |=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                :  /-------------\  :=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                |  |cPNK         |  |=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                |  |             |  |=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                |  |             |  |=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        /------------------------------------\  |  |   GuestOS   |  |=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        |cPNK                                |  |  |             |  |=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  EL0   |   Dom0 Userspace (xl tools, QEMU)  |  |  |             |  |  /---=
------------\
        |                                    |  |  |             |  |  |cYE=
L           |
        \------------------------------------/  |  |             |  |  |   =
            |
        +------------------------------------+  |  |             |  |  | Ru=
st Monitor  |
  EL1   |cA1B        Dom0 Kernel             |  |  |             |  |  |   =
            |
        +------------------------------------+  |  \-------------/  |  \---=
------------/
  -------------------------------------------------------------------------=
------=3D------------------
        +------------------------------------------------------------------=
-------------------+
  EL2   |cC02                              Xen Hypervisor                  =
                   |
        +------------------------------------------------------------------=
-------------------+
#+end_src

[STR-62] <https://linaro.atlassian.net/browse/STR-62>

[STR-11] <https://linaro.atlassian.net/browse/STR-11>


4.2 Xen aware vhost-user master ([STR-63])
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80

  Usually the master side of a vhost-user system is embedded directly in
  the VMM itself. However in a Xen deployment their is no overarching
  VMM but a series of utility programs that query the hypervisor
  directly. The Xen tooling is also responsible for setting up any
  support processes that are responsible for emulating HW for the guest.

  The task aims to bridge the gap between Xen's normal HW emulation path
  (ioreq) and VirtIO's userspace device emulation (vhost-user). The
  process would be started with some information on where the
  virtio-mmio address space is and what the slave binary will be. It
  will then:

  =E2=80=A2 map the guest into Dom0 userspace and attach to a MemFD
  =E2=80=A2 register the appropriate memory regions as IOREQ regions with X=
en
  =E2=80=A2 create EventFD channels for the virtio kick notifications (one =
each
    way)
  =E2=80=A2 spawn the vhost-user slave process and mediate the notification=
s and
    kicks between the slave and Xen itself

#+name: xen-vhost-user-master
#+begin_src ditaa :cmdline -o :file xen_vhost_user_master.png

                          Dom0                                            D=
omU=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                                          |=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                          |=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                          |=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                          |=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                          |=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                          |=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  +-------------------+            +-------------------+  |
  |                   |----------->|                   |  |
  |    vhost-user     | vhost-user |    vhost-user     |  :  /-------------=
-----------------------\
  |      slave        |  protocol  |      master       |  |  |             =
                       |
  |    (existing)     |<-----------|      (rust)       |  |  |             =
                       |
  +-------------------+            +-------------------+  |  |             =
                       |
           ^                           ^   |       ^      |  |             =
Guest Userspace        |
           |                           |   |       |      |  |             =
                       |
           |                           |   | IOREQ |      |  |             =
                       |=20=20=20=20=20=20=20
           |                           |   |       |      |  |             =
                       |=20=20=20=20=20=20=20
           v                           v   V       |      |  \-------------=
-----------------------/=20=20=20=20=20=20=20
   +---------------------------------------------------+  |  +-------------=
-----------------------+
   |       ^                           ^   | ioctl ^   |  |  |             =
                       |
   |       |   iofd/irqfd eventFD      |   |       |   |  |  |             =
 Guest Kernel          |
   |       +---------------------------+   |       |   |  |  | +-----------=
--+                    |
   |                                       |       |   |  |  | | virtio-dev=
  |                    |
   |                       Host Kernel     V       |   |  |  | +-----------=
--+                    |
   +---------------------------------------------------+  |  +-------------=
-----------------------+
                                           |       ^      |      |         =
^=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
                                           | hyper |             |         =
|=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
      ----------------------=3D------------- | -=3D--- | ----=3D------ | --=
---=3D- | --------=3D------------------=20=20
                                           |  call |        Trap |         =
| IRQ=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
                                           V       |             V         =
|=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
            +--------------------------------------------------------------=
-----------------------+=20=20=20=20=20=20=20
            |                              |       ^             |         =
^                      |=20=20=20=20=20=20=20
            |                              |       +-------------+         =
|                      |=20=20=20=20=20=20=20
      EL2   |      Xen Hypervisor          |                               =
|                      |=20=20=20=20=20=20=20
            |                              +-------------------------------=
+                      |=20=20=20=20=20=20=20
            |                                                              =
                       |=20=20=20=20=20=20=20
            +--------------------------------------------------------------=
-----------------------+=20=20=20=20=20=20=20

#+end_src

[STR-63] <https://linaro.atlassian.net/browse/STR-63>

--=20
Alex Benn=C3=A9e

