Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9038F29E825
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 11:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14110.35081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY4kP-0002kS-EM; Thu, 29 Oct 2020 10:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14110.35081; Thu, 29 Oct 2020 10:01:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY4kP-0002k3-B8; Thu, 29 Oct 2020 10:01:33 +0000
Received: by outflank-mailman (input) for mailman id 14110;
 Thu, 29 Oct 2020 10:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rF0B=EE=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kY4kN-0002ju-RO
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 10:01:31 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 654e3420-3d3c-40e6-9649-47812afaa44d;
 Thu, 29 Oct 2020 10:01:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k10so722028wrw.13
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 03:01:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m8sm4010179wrw.17.2020.10.29.03.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 03:01:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD4601FF7E;
 Thu, 29 Oct 2020 10:01:27 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rF0B=EE=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kY4kN-0002ju-RO
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 10:01:31 +0000
X-Inumbo-ID: 654e3420-3d3c-40e6-9649-47812afaa44d
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 654e3420-3d3c-40e6-9649-47812afaa44d;
	Thu, 29 Oct 2020 10:01:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k10so722028wrw.13
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=NgsgEF3cxh4a2QJyJ3yz8CSoN5GhmG6ImfMK4QDU38Q=;
        b=eGHuWm7a8YHGoQQJkRVDw9QsDr2F43cQVL2euxj7XBnjYPtt7Ib7g0Fn20LpIHzM47
         AeRkPIcP3DbwaJ6NXZg2r6ecLsBsD6o91apVoD6gYryRRyOKYestNhleAmHqSuM1+qyz
         CYCR7QIFKJXHbeCTDBP3r+bQ1E3vz1F42SOctC7E1xzUbbuFAjnYA/ZXCEOi8hdrXMFo
         j9SIq0z07Vcs/z9RucelrLvYmvli/8Kkkqepvn/93566Ch38fBldRiJk3vo+rjc1jZiU
         WsVXVdM7YuZmZ4BHH+ILPVAmBYZw8oz2yEtuSmn16ftgAavQQNSm3t/moMEUu/ymqq+f
         E1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=NgsgEF3cxh4a2QJyJ3yz8CSoN5GhmG6ImfMK4QDU38Q=;
        b=pz80ILo7qJbyT3qx0c5WrIk2cXJsrtIAqQTIzfpbjtPJemIbVdxrB7Ql+vrKLJSaPx
         w7usuRmLjHeWOyV1+Uz3f7B0b27eXYyTMYCG7iF/aLFb/FCvi5oQihGKYFdOL6zmrGzk
         RUmbsHelBaooIHuDBoQa4ZNRbZZEqk18RC/S1MTpBP45qiktLIHLFnYDGyXV8vEDqnJf
         944osi+Pb/tDMcH/LJoWfeGElG6muJBOY0M5L2h24nVJovaGV7h/uPGSotS0EbWYFwkA
         LpOdO9YJEfyHyACCfqjuorX216XXHXLKF8P19o4R5dyYy2NJ6g9D/1UFomebooYmETOz
         +mLg==
X-Gm-Message-State: AOAM532DQ8DXvZXAP234i/3NWe2cMzwdEBs9YI5JhQwBGLoFmw+D2x0c
	cydr68Rk5RHsQiSklpID5UL19g==
X-Google-Smtp-Source: ABdhPJzWpStp+pVp+vl7p4xVCS8J5Ty0ezaMWiGhF7GJHh+IQlKU+PIE3IZJSNl53jpoBI09DxLgvA==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr4433017wrq.129.1603965689861;
        Thu, 29 Oct 2020 03:01:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m8sm4010179wrw.17.2020.10.29.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 03:01:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CD4601FF7E;
	Thu, 29 Oct 2020 10:01:27 +0000 (GMT)
References: <20201028174406.23424-1-alex.bennee@linaro.org>
 <alpine.DEB.2.21.2010281406080.12247@sstabellini-ThinkPad-T480s>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, Masami Hiramatsu
 <masami.hiramatsu@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] meson.build: fix building of Xen support for aarch64
In-reply-to: <alpine.DEB.2.21.2010281406080.12247@sstabellini-ThinkPad-T480s>
Date: Thu, 29 Oct 2020 10:01:27 +0000
Message-ID: <87d011mjuw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 28 Oct 2020, Alex Benn=C3=A9e wrote:
>> Xen is supported on aarch64 although weirdly using the i386-softmmu
>> model. Checking based on the host CPU meant we never enabled Xen
>> support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
>> make it not seem weird but that will require further build surgery.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> Cc: Paul Durrant <paul@xen.org>
>> Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
>> ---
>>  meson.build | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meson.build b/meson.build
>> index 835424999d..f1fcbfed4c 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
>>      'CONFIG_HVF': ['x86_64-softmmu'],
>>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>>    }
>> +elif cpu in [ 'arm', 'aarch64' ]
>> +  accelerator_targets +=3D { 'CONFIG_XEN': ['i386-softmmu'] }
>>  endif
>
> This looks very reasonable -- the patch makes sense.
>
>
> However I have two questions, mostly for my own understanding. I tried
> to repro the aarch64 build problem but it works at my end, even without
> this patch.

Building on a x86 host or with cross compiler?

> I wonder why. I suspect it works thanks to these lines in
> meson.build:
>
>   if not get_option('xen').disabled() and 'CONFIG_XEN_BACKEND' in config_=
host
>     accelerators +=3D 'CONFIG_XEN'
>     have_xen_pci_passthrough =3D not get_option('xen_pci_passthrough').di=
sabled() and targetos =3D=3D 'linux'
>   else
>     have_xen_pci_passthrough =3D false
>   endif
>
> But I am not entirely sure who is adding CONFIG_XEN_BACKEND to
> config_host.

The is part of the top level configure check - which basically checks
for --enable-xen or autodetects the presence of the userspace libraries.
I'm not sure if we have a slight over proliferation of symbols for Xen
support (although I'm about to add more).

> The other question is: does it make sense to print the value of
> CONFIG_XEN as part of the summary? Something like:
>
> diff --git a/meson.build b/meson.build
> index 47e32e1fcb..c6e7832dc9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2070,6 +2070,7 @@ summary_info +=3D {'KVM support':       config_all.=
has_key('CONFIG_KVM')}
>  summary_info +=3D {'HAX support':       config_all.has_key('CONFIG_HAX')}
>  summary_info +=3D {'HVF support':       config_all.has_key('CONFIG_HVF')}
>  summary_info +=3D {'WHPX support':      config_all.has_key('CONFIG_WHPX'=
)}
> +summary_info +=3D {'XEN support':      config_all.has_key('CONFIG_XEN')}
>  summary_info +=3D {'TCG support':       config_all.has_key('CONFIG_TCG')}
>  if config_all.has_key('CONFIG_TCG')
>    summary_info +=3D {'TCG debug enabled': config_host.has_key('CONFIG_DE=
BUG_TCG')}
>
>
> But I realize there is already:
>
> summary_info +=3D {'xen support':       config_host.has_key('CONFIG_XEN_B=
ACKEND')}
>
> so it would be a bit of a duplicate

Hmm so what we have is:

  CONFIG_XEN_BACKEND
    - ensures that appropriate compiler flags are added
    - pegs RAM_ADDR_MAX at UINT64_MAX (instead of UINTPTR_MAX)
  CONFIG_XEN
    - which controls a bunch of build objects, some of which may be i386 on=
ly?
    ./accel/meson.build:15:specific_ss.add_all(when: ['CONFIG_XEN'], if_tru=
e: dummy_ss)
    ./accel/stubs/meson.build:2:specific_ss.add(when: 'CONFIG_XEN', if_fals=
e: files('xen-stub.c'))
    ./accel/xen/meson.build:1:specific_ss.add(when: 'CONFIG_XEN', if_true: =
files('xen-all.c'))
    ./hw/9pfs/meson.build:17:fs_ss.add(when: 'CONFIG_XEN', if_true: files('=
xen-9p-backend.c'))
    ./hw/block/dataplane/meson.build:2:specific_ss.add(when: 'CONFIG_XEN', =
if_true: files('xen-block.c'))
    ./hw/block/meson.build:14:softmmu_ss.add(when: 'CONFIG_XEN', if_true: f=
iles('xen-block.c'))
    ./hw/char/meson.build:23:softmmu_ss.add(when: 'CONFIG_XEN', if_true: fi=
les('xen_console.c'))
    ./hw/display/meson.build:18:softmmu_ss.add(when: 'CONFIG_XEN', if_true:=
 files('xenfb.c'))
    ./hw/i386/xen/meson.build:1:i386_ss.add(when: 'CONFIG_XEN', if_true: fi=
les('xen-hvm.c',
                                                                           =
    'xen-mapcache.c',
                                                                           =
    'xen_apic.c',
                                                                           =
    'xen_platform.c',
                                                                           =
    'xen_pvdevice.c')
    ./hw/net/meson.build:2:softmmu_ss.add(when: 'CONFIG_XEN', if_true: file=
s('xen_nic.c'))
    ./hw/usb/meson.build:76:softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN=
', libusb], if_true: files('xen-usb.c'))
    ./hw/xen/meson.build:1:softmmu_ss.add(when: ['CONFIG_XEN', xen], if_tru=
e: files(
    ./hw/xen/meson.build:20:specific_ss.add_all(when: ['CONFIG_XEN', xen], =
if_true: xen_specific_ss)
    ./hw/xenpv/meson.build:3:xenpv_ss.add(when: 'CONFIG_XEN', if_true: file=
s('xen_machine_pv.c'))
    - there are also some stubbed inline functions controlled by it
  CONFIG_XEN_IGD_PASSTHROUGH
    - specific x86 PC only feature via Kconfig rule
  CONFIG_XEN_PCI_PASSTHROUGH
    - control Linux specific specific feature (via meson rule)


First obvious question - is everything in hw/i386/xen actually i386
only? APIC seems pretty PC orientated but what about xen_platform and
pvdevice? There seem to be some dependancies on xen-mapcache across the
code.

--=20
Alex Benn=C3=A9e

