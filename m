Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F9D630F2E
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 15:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446114.701604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owOxz-0008BY-Gn; Sat, 19 Nov 2022 14:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446114.701604; Sat, 19 Nov 2022 14:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owOxz-00088a-E0; Sat, 19 Nov 2022 14:37:11 +0000
Received: by outflank-mailman (input) for mailman id 446114;
 Sat, 19 Nov 2022 14:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFTg=3T=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1owOxx-00088P-GU
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 14:37:09 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4b9f479-6817-11ed-91b6-6bf2151ebd3b;
 Sat, 19 Nov 2022 15:37:07 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id gv23so19492807ejb.3
 for <xen-devel@lists.xenproject.org>; Sat, 19 Nov 2022 06:37:07 -0800 (PST)
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
X-Inumbo-ID: a4b9f479-6817-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHOa+D8mpRhpdgnZXN5k9URMGupIKtlcB4yfQ7rRjso=;
        b=YpkFXoMqkgDKSItLrDTJw6yO2The++PAUc34DHgUev0QspSdPd+pa/bAtNixW376AD
         ZyvNOq5ojGPlthrP8SKjYt5Yq6D38pirzObDG7BXRxoYTEEp4AD8Anxv7CAMAEHRr1lz
         AAnkDsEwYodQTWOfGa91DxWw1dfnRDFOiu+NxTC83u5sut1L/X8MlmywQR8xbwm/4NmF
         keEHp4Gq6D76r8mAebQAU/cqDallo76a9I/tSEf6XHSyoOzLCw1i+XngGKcVC+6teT9c
         1QlBbqlCtulxKavNIG8bJIcBBZDH4D8Eb3//Sa5p2CIYrNadZCB53B4w1BPwIWIIAKWu
         7lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHOa+D8mpRhpdgnZXN5k9URMGupIKtlcB4yfQ7rRjso=;
        b=2ILJmKRgDY5TOFGl/vhQRXOAxEf/enntdeIgk6hRIoF9o6Ib074tO7Llyy2OBUtTX7
         QvpeqGkzc9MApqrgIObd0E4l7/bysFcwxow0B/1w3NgK0o2z+sr4WZjB4II6885eb++V
         3s4QhLGmX5Xd7KqrDzFO5ucdIQTJFnmw2b5zAWSrJ1s2O8d3TI1SS7KAHs0CpRyqB7Ha
         +SksIVXGGhyxCEQX1UL5ddirQmVXMpvziXj2z+6GnTwBgERdEq9xojuR2V7MFEJaHZHe
         69Ui1I7KwGlQA5KoppeA2VHrYPKiN0I9oNgNbm4jmSqjJ4ghw4ZyxfWZOX0uQLvFzElG
         jqeg==
X-Gm-Message-State: ANoB5pm6C0YdbjVoXfKYka6ItC/JtvXSTFEL2/K2Ih8RmXayyO968m5Q
	Nm6zGrDScjBh6icVFVJ1hVd0/fInvq8mAGE4hkg=
X-Google-Smtp-Source: AA0mqf4MO12erJ/AziUOpMWmAip6juEbRm46sbjaHB2toJ1l3Odf8nhwsShVU984UjItUKU8PAzbmjNjdUIomTFyPBo=
X-Received: by 2002:a17:906:65c4:b0:7ad:d250:b907 with SMTP id
 z4-20020a17090665c400b007add250b907mr9399864ejn.737.1668868627066; Sat, 19
 Nov 2022 06:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20221118154931.1928298-1-marmarek@invisiblethingslab.com>
 <CAKf6xpuCxftyQ+PKN_ffJ0onsSxcT8kVSwkM7Z10pfjqf0XFgA@mail.gmail.com> <Y3f9O0S8kVXZ+py+@mail-itl>
In-Reply-To: <Y3f9O0S8kVXZ+py+@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 19 Nov 2022 09:36:54 -0500
Message-ID: <CAKf6xpvUcR=rta6SD7mw_pvgQJTxKjN5VHpC6x-zCAiaJ=pKfg@mail.gmail.com>
Subject: Re: [PATCH v3] xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marek,

On Fri, Nov 18, 2022 at 4:46 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Nov 18, 2022 at 03:46:47PM -0500, Jason Andryuk wrote:
> > On Fri, Nov 18, 2022 at 10:50 AM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > Linux enables MSI-X before disabling INTx, but keeps MSI-X masked unt=
il
> > > the table is filled. Then it disables INTx just before clearing MASKA=
LL
> > > bit. Currently this approach is rejected by xen-pciback.
> > > According to the PCIe spec, device cannot use INTx when MSI/MSI-X is
> > > enabled (in other words: enabling MSI/MSI-X implicitly disables INTx)=
.
> > >
> > > Change the logic to consider INTx disabled if MSI/MSI-X is enabled. T=
his
> > > applies to three places:
> > >  - checking currently enabled interrupts type,
> > >  - transition to MSI/MSI-X - where INTx would be implicitly disabled,
> > >  - clearing INTx disable bit - which can be allowed even if MSI/MSI-X=
 is
> > >    enabled, as device should consider INTx disabled anyway in that ca=
se
> > >
> > > Fixes: 5e29500eba2a ("xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKA=
LL too")
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > ---
> > > Changes in v3:
> > >  - allow clearing INTx regardless of MSI/MSI-X state, to be consisten=
t
> > >    with enabling MSI/MSI-X
> > > Changes in v2:
> > >  - restructure the patch to consider not only MASKALL bit, but enabli=
ng
> > >    MSI/MSI-X generally, without explicitly disabling INTx first
> > > ---
> >
> > I was trying to test your xen-pciback v3 patch, and I am having
> > assignment fail consistently now.  It is actually failing to
> > quarantine to domIO in the first place, which matches the failure from
> > the other day (when I more carefully read through the logs).  It now
> > consistently fails to quarantine on every boot unlike the other day
> > where it happened once.
>
> Does this include the very first assignment too, or only after domain
> reboot? If the latter, maybe some cleanup missed clearing MASKALL?

It's the quarantine during dom0 boot that fails.  Later assignment
during VM boot fails.  I tried warm reboots and cold boots and it
happened both times.

I also modified my initrd to halt in there and checked the config
space.  MASKALL wasn't set at that time.  I need to double check -
MASKALL may have been unset after dom0 booted in that case.

I'll test more to figure when and how MASKALL is getting set.

> FWIW, the patch applied to Qubes
> (https://github.com/QubesOS/qubes-linux-kernel/pull/680) seems to work
> fine (the full test run is still in progress, but I see some green marks
> already).

Does Qubes quarantine devices explicitly, or are they in dom0 and
libvirt/libxl just assigns them when a domain boots?

> > I added some printks and it 's getting -EBUSY from pdev_msix_assign()
> > which means pci_reset_msix_state() is failing:
> >     if ( pci_conf_read16(pdev->sbdf, msix_control_reg(pos)) &
> >          PCI_MSIX_FLAGS_MASKALL )
> >         return -EBUSY;
> >
> > # lspci -vv -s 14.3
> > ...
> >     Capabilities: [80] MSI-X: Enable- Count=3D16 Masked+
> >         Vector table: BAR=3D0 offset=3D00002000
> >         PBA: BAR=3D0 offset=3D00003000
> >
> > So it looks like MASKALL is set and prevents assignment.
> >
> > setpci -s 00:14.3 82.W=3Df
> > cleared that out for me and I could assign the device.
> >
> > My dom0 boots, it runs flask-label-pci for a set of PCI devices
> > (including iwlwifi), then xl pci-assignable-add for all PCI devices
> > which will be passed through, then a little later it boots the
> > associated domains.  Dom0 does not have a driver for iwlwifi.
> >
> > I'll have to investigate more to see how MASKALL is getting set.  This
> > had not been an issue before your recent patches.
>
> I guess before the patches nothing set anything in MSI-X capability,
> because it was hidden...

Well, stubdom hasn't even booted when, so it would be the Xen or
pciback change to modify MASKALL?

> Anyway, to support my cleanup hypothesis, I tried to destroy a
> PCI-having domain, and it left MSI-X enabled (at least according to the
> config space). MASKALL was _not_ set, but I haven't checked masking of
> individual vectors. TBH, I'm not sure what should be responsible for the
> MSI-X cleanup after guest destroy. Should it be Xen? Qemu? Pciback?
> Pciback calls PHYSDEVOP_{prepare,release}_msix only when
> binding/unbinding from the device (so - xl pci-assignable-{add,remove}),
> so this isn't the right place.

I need to review all this code to give a meaningful response.  Would
xen-pciback set MASKALL when it binds a device?  That happens before
xl pci-assignable-add tries to quarantine (assign to to domIO).

> Should that be in Xen, in deassign_device() (part of
> DOMCTL_deassign_device)?

It seems to me that Xen needs to ultimately disable the device.

Thanks,
Jason

