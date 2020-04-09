Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA21A2D90
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 04:15:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMMiu-00080A-Bl; Thu, 09 Apr 2020 02:15:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JlmV=5Z=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jMMit-000805-Do
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 02:15:19 +0000
X-Inumbo-ID: f4d98282-7a07-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4d98282-7a07-11ea-83d8-bc764e2007e4;
 Thu, 09 Apr 2020 02:15:18 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id de14so11346394edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2020 19:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/ZTzRBMT/z8axlNjU2tqX/Vh8WlckNT6HnenloXRvY=;
 b=P/ViD9F7phyD9N1INX7lCreWwcWtU6+kttvpJHay3n71amr2IgboOUc1VJc4xZqUDX
 o5jGKbbRL/ofwzUrd1FMCgIA1ZPQRpNlhvmuhVqqOb1ubYHwLTQwPIFpT7dmNfALDqkj
 /wt4z+UBzDdDgMSZhCkSZs7/cesgq4ATH51omt/vTxSZdRd9XosZgfpwL+6E9HustzSO
 0X/IGzwi81DI6fs7dNNKhdJiWa4MNVSruE5oCOJDmbSeHJt0YSokJDVU7uI4IZgAEvCy
 O/3pvVJgRehiL9L7sUvREL1G1vpVqMwTFZ2bwuWkzz+saFz/xFCluSd/wIEeFLQVR5UE
 1yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/ZTzRBMT/z8axlNjU2tqX/Vh8WlckNT6HnenloXRvY=;
 b=R7GIAUFg8KDPeqRXmPhhCz0HdOzKUoKbzbqvAaYZtTBPJ/t1ctLwvMXRoAgeakfV18
 IxPnjFa9ereqZbrFgmKq7Vn6MPzK5sd9NNyCjXYDRph29pM1KWYehL0Q0GlPU2vAk/EN
 sQzcnqK8wbdqs4qfsPeW7kuJX576vtRIsZsSSqmVPFpefrPGdqTM2oZkXliisb0wZWpx
 1bGY1vJ/A44tW2VbsYA5ta1cZrpgaXPocKlPEggEciRIZl7HL8ofKv7qegXi/6jICZ7K
 uoWka6jho1AFML8RYfIrv6q0lPU4Bkr2BN+zV+qcdv5e/3YlPP+VPqvxG36krGfTvXGD
 Fp8A==
X-Gm-Message-State: AGi0PuY3Iym7DRQADU9hYdOrHqzaNOiHYWJpVH/abdE8xbU8InwCOReE
 nPWVNuItsKaZIcLu0Rl0jRwyPWnnBK4=
X-Google-Smtp-Source: APiQypLVi9swsaQcLypLzsuZQi5Qwsxp0hyNHRga+PVQfsea/UE+0DX4aIyVw2a747eElbXdtsaLAw==
X-Received: by 2002:a17:906:eb98:: with SMTP id
 mh24mr9092222ejb.375.1586398517162; 
 Wed, 08 Apr 2020 19:15:17 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id c19sm2868439ejd.48.2020.04.08.19.15.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2020 19:15:15 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id w10so10032829wrm.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2020 19:15:15 -0700 (PDT)
X-Received: by 2002:adf:ea06:: with SMTP id q6mr8725001wrm.301.1586398515103; 
 Wed, 08 Apr 2020 19:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586185752.git.tamas.lengyel@intel.com>
 <3dcb79f6-7d90-ced1-51d4-f5b6a32a64e9@suse.com>
In-Reply-To: <3dcb79f6-7d90-ced1-51d4-f5b6a32a64e9@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 Apr 2020 20:14:38 -0600
X-Gmail-Original-Message-ID: <CABfawhmyvx04+CTPaDaKXN4vuSJw8t2gx9ow3ZFhv5A62Ue4Jg@mail.gmail.com>
Message-ID: <CABfawhmyvx04+CTPaDaKXN4vuSJw8t2gx9ow3ZFhv5A62Ue4Jg@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] VM forking
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 8, 2020 at 5:15 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.04.2020 17:20, Tamas K Lengyel wrote:
> > The following series implements VM forking for Intel HVM guests to allow for
> > the fast creation of identical VMs without the assosciated high startup costs
> > of booting or restoring the VM from a savefile.
> >
> > JIRA issue: https://xenproject.atlassian.net/browse/XEN-89
> >
> > The fork operation is implemented as part of the "xl fork-vm" command:
> >     xl fork-vm -C <config> -Q <qemu-save-file> -m <max-vcpus> <parent_domid>
> >
> > By default a fully functional fork is created. The user is in charge however to
> > create the appropriate config file for the fork and to generate the QEMU save
> > file before the fork-vm call is made. The config file needs to give the
> > fork a new name at minimum but other settings may also require changes. Certain
> > settings in the config file of both the parent and the fork have to be set to
> > default. Details are documented.
> >
> > The interface also allows to split the forking into two steps:
> >     xl fork-vm --launch-dm no \
> >                -m <max-vcpus> \
> >                -p <parent_domid>
> >     xl fork-vm --launch-dm late \
> >                -C <config_file_for_fork> \
> >                -Q <qemu_save_file> \
> >                <fork_domid>
> >
> > The split creation model is useful when the VM needs to be created as fast as
> > possible. The forked VM can be unpaused without the device model being launched
> > to be monitored and accessed via VMI. Note however that without its device
> > model running (depending on what is executing in the VM) it is bound to
> > misbehave or even crash when its trying to access devices that would be
> > emulated by QEMU. We anticipate that for certain use-cases this would be an
> > acceptable situation, in case for example when fuzzing is performed of code
> > segments that don't access such devices.
> >
> > Launching the device model requires the QEMU Xen savefile to be generated
> > manually from the parent VM. This can be accomplished simply by connecting to
> > its QMP socket and issuing the "xen-save-devices-state" command. For example
> > using the standard tool socat these commands can be used to generate the file:
> >     socat - UNIX-CONNECT:/var/run/xen/qmp-libxl-<parent_domid>
> >     { "execute": "qmp_capabilities" }
> >     { "execute": "xen-save-devices-state", \
> >         "arguments": { "filename": "/path/to/save/qemu_state", \
> >                         "live": false} }
> >
> > At runtime the forked VM starts running with an empty p2m which gets lazily
> > populated when the VM generates EPT faults, similar to how altp2m views are
> > populated. If the memory access is a read-only access, the p2m entry is
> > populated with a memory shared entry with its parent. For write memory accesses
> > or in case memory sharing wasn't possible (for example in case a reference is
> > held by a third party), a new page is allocated and the page contents are
> > copied over from the parent VM. Forks can be further forked if needed, thus
> > allowing for further memory savings.
> >
> > A VM fork reset hypercall is also added that allows the fork to be reset to the
> > state it was just after a fork, also accessible via xl:
> >     xl fork-vm --fork-reset -p <fork_domid>
> >
> > This is an optimization for cases where the forks are very short-lived and run
> > without a device model, so resetting saves some time compared to creating a
> > brand new fork provided the fork has not aquired a lot of memory. If the fork
> > has a lot of memory deduplicated it is likely going to be faster to create a
> > new fork from scratch and asynchronously destroying the old one.
> >
> > The series has been tested with Windows VMs and functions as expected. Linux
> > VMs when forked from a running VM will have a frozen VNC screen. Linux VMs at
> > this time can only be forked with a working device model when the parent VM was
> > restored from a snapshot using "xl restore -p". This is a known limitation.
> > Also note that PVHVM/PVH Linux guests have not been tested. Forking most likely
> > works but PV devices and drivers would require additional wiring to set things
> > up properly since the guests are unaware of the forking taking place, unlike
> > the save/restore routine where the guest is made aware of the procedure.
> >
> > Forking time has been measured to be 0.0007s, device model launch to be around
> > 1s depending largely on the number of devices being emulated. Fork resets have
> > been measured to be 0.0001s under the optimal circumstances.
> >
> > New in v14:
> >     minor adjustments
> >
> > Patch 1 implements the VM fork
> > Patch 2 implements fork reset operation
> > Patch 3 adds the toolstack-side code implementing VM forking and reset
> >
> > Tamas K Lengyel (3):
> >   xen/mem_sharing: VM forking
> >   x86/mem_sharing: reset a fork
>
> I've applied these two, but ...
>
> >   xen/tools: VM forking toolstack side
>
> ... since this one doesn't have any ack or alike I'll defer to
> the tool stack maintainers here.
>

Thanks! I haven't got much feedback on the toolstack side in a while
now. We had a discussion on the design of the xl interface early on
but that was about it. Hopefully the tool stack maintainers get a
chance to look at it and get it merged now that the hypervisor side is
done.

Tamas

