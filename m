Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5E2C895B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 17:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41309.74439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjlwH-0006mC-1H; Mon, 30 Nov 2020 16:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41309.74439; Mon, 30 Nov 2020 16:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjlwG-0006ln-U8; Mon, 30 Nov 2020 16:22:08 +0000
Received: by outflank-mailman (input) for mailman id 41309;
 Mon, 30 Nov 2020 16:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMVF=FE=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kjlwF-0006li-CN
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 16:22:07 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57e5423b-c123-432b-a176-0afec2d09a19;
 Mon, 30 Nov 2020 16:22:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id h21so25857497wmb.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 08:22:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o5sm24521025wmh.8.2020.11.30.08.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:22:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BA221FF7E;
 Mon, 30 Nov 2020 16:22:00 +0000 (GMT)
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
X-Inumbo-ID: 57e5423b-c123-432b-a176-0afec2d09a19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=TVxWV15LJeBTnS48HEZkzfLGLUUbk5sUK43fF6RwOIQ=;
        b=dDFy3zREsEBwX/oIgSBzoy2x4SeYW+l6vcHnkdlim/nODhj2xYanYBR81tK5pve5Xs
         POoFxGUkEWQePQ29LfBtdRjGbhrC7C5I6nLZZxpz0GvhWfCFQbko8MuDserSugx/rRJW
         bX7mlHeLoAEaziEPGPrcD0GPCiKXNvspFLLnQHucmtnkSZpHkH0NQsynrVNkU7j5x3Zl
         93SLCGsfFUsMQ2P0AiUtlQmB83HDgn7IyWgYZzCY+NQ4ODswmm0FLJBvs7K5L1+41iMe
         UTAr2HcZtTXBGRpYTCala9Fwpve7yD+cdS80TDVfk0Kd9OcXneVSnyGPjHGcpFHSoeez
         mgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=TVxWV15LJeBTnS48HEZkzfLGLUUbk5sUK43fF6RwOIQ=;
        b=UUVgcRXOuu4nAkAD4A5LuMGTyRhjBXaBfH2BL6oxUeVO7vrFzkt2EScvG7gg9GOzYC
         LClsDbC2vP7tKw2G4EeiNYNiLn2lRsLCrLYzniBTVMVQvNceZg4k+Re7SlbCrWl/EAUJ
         r6YJ5Uk1FXqCrBLOQEStueu3wxNKrgvvM0QWM6HNYIWsXqAwCCRJ0gnDrO2OESGwLaMP
         mUXBZ2LZxSI6FYNW6DuFjWvYtxvCjI6Y2l7lPso9owxQgLNEHjKAUnxPQsPyNmh4Rbyf
         8c6twrDNXeJxM7SNkrKbS77oWo1ArGjQyzV6+nsoiv58Z3oKlEdwVxD8z19J89gOeimn
         r3Ug==
X-Gm-Message-State: AOAM5306CPBlILBByFvj/gbawsaQT3eNoe59jvhCq8NYTPIQnbShSSDf
	ZT4HQCduIe0oYDfCjvQJdT1ZTw==
X-Google-Smtp-Source: ABdhPJwsK3cO2rfZSGuD+pPnZSyL4MGoiEYINLpam63DvVLLHmr0RDzzEXmc3u/m1hu0lOAdaf1IkQ==
X-Received: by 2002:a1c:7d94:: with SMTP id y142mr20047595wmc.105.1606753322901;
        Mon, 30 Nov 2020 08:22:02 -0800 (PST)
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien
 Grall
 <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>
Subject: Re: 
In-reply-to: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
Date: Mon, 30 Nov 2020 16:21:59 +0000
Message-ID: <87h7p6u860.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
>
> Date: Sat, 28 Nov 2020 22:33:51 +0200
> Subject: [PATCH V3 00/23] IOREQ feature (+ virtio-mmio) on Arm
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Hello all.
>
> The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
> You can find an initial discussion at [1] and RFC/V1/V2 series at [2]/[3]=
/[4].
> Xen on Arm requires some implementation to forward guest MMIO access to a=
 device
> model in order to implement virtio-mmio backend or even mediator outside =
of hypervisor.
> As Xen on x86 already contains required support this series tries to make=
 it common
> and introduce Arm specific bits plus some new functionality. Patch series=
 is based on
> Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device em=
ulator".
> Besides splitting existing IOREQ/DM support and introducing Arm side, the=
 series
> also includes virtio-mmio related changes (last 2 patches for toolstack)
> for the reviewers to be able to see how the whole picture could look
> like.

Thanks for posting the latest version.

>
> According to the initial discussion there are a few open questions/concer=
ns
> regarding security, performance in VirtIO solution:
> 1. virtio-mmio vs virtio-pci, SPI vs MSI, different use-cases require dif=
ferent
>    transport...

I think I'm repeating things here I've said in various ephemeral video
chats over the last few weeks but I should probably put things down on
the record.

I think the original intention of the virtio framers is advanced
features would build on virtio-pci because you get a bunch of things
"for free" - notably enumeration and MSI support. There is assumption
that by the time you add these features to virtio-mmio you end up
re-creating your own less well tested version of virtio-pci. I've not
been terribly convinced by the argument that the guest implementation of
PCI presents a sufficiently large blob of code to make the simpler MMIO
desirable. My attempts to build two virtio kernels (PCI/MMIO) with
otherwise the same devices wasn't terribly conclusive either way.

That said virtio-mmio still has life in it because the cloudy slimmed
down guests moved to using it because the enumeration of PCI is a road
block to their fast boot up requirements. I'm sure they would also
appreciate a MSI implementation to reduce the overhead that handling
notifications currently has on trap-and-emulate.

AIUI for Xen the other downside to PCI is you would have to emulate it
in the hypervisor which would be additional code at the most privileged
level.

> 2. virtio backend is able to access all guest memory, some kind of protec=
tion
>    is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys in
>    guest'

This is also an area of interest for Project Stratos and something we
would like to be solved generally for all hypervisors. There is a good
write up of some approaches that Jean Phillipe did on the stratos
mailing list:

  From: Jean-Philippe Brucker <jean-philippe@linaro.org>
  Subject: Limited memory sharing investigation
  Message-ID: <20201002134336.GA2196245@myrica>

I suspect there is a good argument for the simplicity of a combined
virt queue but it is unlikely to be very performance orientated.

> 3. interface between toolstack and 'out-of-qemu' virtio backend, avoid us=
ing
>    Xenstore in virtio backend if possible.

I wonder how much work it would be for a rust expert to make:

  https://github.com/slp/vhost-user-blk

handle an IOREQ signalling pathway instead of the vhost-user/eventfd
pathway? That would give a good indication on how "hypervisor blind"
these daemons could be made.

<snip>
>
> Please note, build-test passed for the following modes:
> 1. x86: CONFIG_HVM=3Dy / CONFIG_IOREQ_SERVER=3Dy (default)
> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
> 3. Arm64: CONFIG_HVM=3Dy / CONFIG_IOREQ_SERVER=3Dy

Forgive my relative newness to Xen, how do I convince the hypervisor to
build with this on? I've tried variants of:

  make -j9 CROSS_COMPILE=3Daarch64-linux-gnu- XEN_TARGET_ARCH=3Darm64 menuc=
onfig XEN_EXPERT=3Dy [CONFIG_|XEN_|_]IOREQ_SERVER=3Dy

with no joy...

> 4. Arm64: CONFIG_HVM=3Dy / #CONFIG_IOREQ_SERVER is not set  (default)
> 5. Arm32: CONFIG_HVM=3Dy / CONFIG_IOREQ_SERVER=3Dy
> 6. Arm32: CONFIG_HVM=3Dy / #CONFIG_IOREQ_SERVER is not set  (default)
>
> ***
>
> Any feedback/help would be highly appreciated.
<snip>

--=20
Alex Benn=C3=A9e

