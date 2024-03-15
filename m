Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6696687D75C
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 00:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694093.1082946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlH2v-00074K-2s; Fri, 15 Mar 2024 23:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694093.1082946; Fri, 15 Mar 2024 23:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlH2u-00071k-Vl; Fri, 15 Mar 2024 23:33:04 +0000
Received: by outflank-mailman (input) for mailman id 694093;
 Fri, 15 Mar 2024 23:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nznT=KV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlH2t-00071e-Kd
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 23:33:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b75cb2d-e324-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 00:32:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FEAA61807;
 Fri, 15 Mar 2024 23:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F075BC433C7;
 Fri, 15 Mar 2024 23:32:55 +0000 (UTC)
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
X-Inumbo-ID: 5b75cb2d-e324-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710545577;
	bh=H/x2lLzI8P6R+NSkHS4VduyzdzVjwtYv/SKm4YvtS8w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xg/egQJ5VPGfHWaPfbjkASUQgd5veABTLT8iDrq3nNqwxvhIK0uT3oLRuFcWxVxJb
	 UppGiDpf4Kbss+O3NEXXaAh9dmvniW+Fp/npU6CbXdKomTwTuNN+E1MRUWre0Y19PB
	 mx+J3+IwdnTzUOWFBIg3hotaP8H2+hGQkkDA+Ahwslm2gJbI9iwhYgVBk2n55Xhb9S
	 EMl0yjDc5BFtMKv4SxPzV+HpnSAGJbY3/hsIan66jomGxcpbFGapNJlZsUR6E4UBhk
	 sOng1+6AiasIrz7y7WQjDyhxsmr2T5d6MlPCgp6nCguBBi50keFRUp8t0MZGuTrhLz
	 iOeRc53lVC1Ng==
Date: Fri, 15 Mar 2024 16:32:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: LARRIEU Dominique <dominique.larrieu@thalesgroup.com>
cc: Julien Grall <julien@xen.org>, 
    GOURLOT Francois <francois.gourlot@thalesgroup.com>, 
    GRUO Nicolas <nicolas-n.gruo@thalesgroup.com>, 
    Cc <xen-devel@lists.xenproject.org>, Kelly Choi <kelly.choi@cloud.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, 
    WILLEMS Louis <louis.willems@thalesgroup.com>, vikram.garhwal@amd.com, 
    Edgar.Iglesias@amd.com, sstabellini@kernel.org
Subject: RE: IMPORTANT - : Need help on USB port virtualization with Xen
 hypervisor
In-Reply-To: <2e53bd839f904d8a97ee5645ee9e9361@thalesgroup.com>
Message-ID: <alpine.DEB.2.22.394.2403151558480.853156@ubuntu-linux-20-04-desktop>
References: <d2de4ae9ecb34efc962dea7f8b4e7cbd@thalesgroup.com> <bb2485e5-7818-435b-8d9c-dda88100979f@xen.org> <a46ac2e14fa2410eafc26a37a00a442f@thalesgroup.com> <427d2ecb865648b7a459c592c208c0be@thalesgroup.com> <673b2bc630d748e8af0a15d4b553906e@thalesgroup.com>
 <3ee3659afff645cabed86bcc22c44686@thalesgroup.com> <4778822e-582f-4e0d-9933-86d8d49ea3a5@xen.org> <8f2a2bbaf29e41709eeab695efe48f17@thalesgroup.com> <acf5d91425f34721b496cd49f3883ac9@thalesgroup.com> <2e53bd839f904d8a97ee5645ee9e9361@thalesgroup.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1892190326-1710544158=:853156"
Content-ID: <alpine.DEB.2.22.394.2403151628020.853156@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1892190326-1710544158=:853156
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2403151628021.853156@ubuntu-linux-20-04-desktop>

Hi Dominique,

You posted this configuration:

device_model_args = [ "
                      "-device","nec-usb-xhci,id=xhci",
                      "-device","usb-host,bus=xhci.0,hostbus=1,hostport=13",
                      "-device","usb-host,bus=xhci.0,hostbus=1,hostport=10",
                      "-device","usb-host,bus=xhci.0,hostbus=1,hostport=2",
                      "-device","usb-host,bus=xhci.0,hostbus=2,hostport=2",
                      "-device","usb-host,bus=xhci.0,hostbus=2,hostport=1",
                      "-device","usb-host,bus=xhci.0,hostbus=1,hostport=1"]

It looks like you are using QEMU-based USB passthrough. Basically QEMU
(independently from Xen) is accessing the USB device in Dom0 and
exposing a corresponding device to the guest. I am not sure if there is
anything that can be done in QEMU to support USB 3.0 with high speed,
people in CC might know.

There two other alternatives to this approach. You can use PV USB
Passthrough instead. Juergen (CCed) is the original author. I am not
sure if that supports USB 3.0 either.

Finally, you can directly assign the entire USB Controller to the guest
using PCI Passthrough: assign the whole USB Controller, with all the USB
devices connect to it, as a PCI device to the guest. For sure, if this
approach is OK for you, it will lead to the best performance.

Cheers,

Stefano



On Thu, 14 Mar 2024, LARRIEU Dominique wrote:
> Hi Julien,
> 
>  
> 
> You will find here above the answers to your questions.
> 
>  
> 
> Thank you very much for your help.
> 
>  
> 
> Best regards,
> 
> Dominique
> 
>  
> 
>  
> 
>  
> 
> -----Message d'origine-----
> De : Julien Grall <julien@xen.org>
> Envoyé : jeudi 29 février 2024 12:52
> À : LARRIEU Dominique <dominique.larrieu@thalesgroup.com>
> Cc : GOURLOT Francois <francois.gourlot@thalesgroup.com>; GRUO Nicolas <nicolas-n.gruo@thalesgroup.com>; Cc
> <xen-devel@lists.xenproject.org>; Kelly Choi <kelly.choi@cloud.com>; Jan Beulich <jbeulich@suse.com>; Roger Pau Monné
> <roger.pau@citrix.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Juergen Gross
> <jgross@suse.com>; WILLEMS Louis <louis.willems@thalesgroup.com>
> Objet : Re: IMPORTANT - : Need help on USB port virtualization with Xen hypervisor
> 
>  
> 
> Hi Dominique,
> 
>  
> 
> On 29/02/2024 10:33, LARRIEU Dominique wrote:
> 
> > Thank you for your quick answer.
> 
> >
> 
> > You will find below our answers (in red) to your questions.
> 
> >
> 
> > To summarize our request : what we would like is to use USB 3.0 driver with high speed configuration.
> 
> > Today, it is not possible to do that.
> 
> > The driver stay in full speed mode, and more often in USB 1.0 or 2.0 configuration.
> 
> >
> 
> > Is it possible to configure the XEN USB 3.0 driver with the high speed mode ?
> 
> > (read in our answers below the reference to the driver)
> 
>  
> 
> Looking at what you provided below, it is still unclear what you mean by "Xen USB 3.0 driver". By any chance, are you confused with the "x"
> in xhci?
> 
>  
> 
> The drivers "xhci_hcd" and "xhci_pci" are generic and not provided/maintained by Xen. So far, with the information provided, it is unclear
> whether the problem is actually in the driver itself. I have a few more questions. See below.
> 
>  
> 
> >>      We are detecting several issues with USB port virtualization
> 
> >> with the
> 
> >
> 
> >>      Xen hypervisor.
> 
> >
> 
> >
> 
> >
> 
> > Just to clarify, you are assigning the PCI USB bus (rather than just the USB device) to the guest. Is that correct?
> 
> >
> 
> >
> 
> >
> 
> > If so...
> 
> >
> 
> >
> 
> >
> 
> > [Thales] : we are using the USB chipset of the mother board (see below
> 
> > the references)
> 
>  
> 
> Thanks for the clarification. IIUC, you said you are having problem in the guest itself. Have you tried to access the same USB device from
> dom0? Or better without any Xen involved (i.e. booting Debian on baremetal).
> 
>  
> 
> This would help to narrow down the issue.
> 
>  
> 
> [Thales, 14/03/24] We have no difficulty accessing the USB device on the dom0
> 
>  
> 
> >> 
> 
> >
> 
> >>      We needyour helpto find a solution for these problems.
> 
> >
> 
> >> 
> 
> >
> 
> >>      The Software used are :
> 
> >
> 
> >
> 
> >
> 
> > Can you share some details of the HW you are using ?
> 
> >
> 
> >
> 
> >
> 
> > [Thales] : HW :
> 
> >
> 
> > [Thales] : We are using a GETAC X500 using the Mobile Intel QM175
> 
> > Chipset
> 
> >
> 
> > [Thales] : USB controller: Intel Corporation 100 Series/C230 Series
> 
> > Chipset Family USB 3.0 xHCI Controller (rev 31)
> 
> >
> 
> > [Thales] : Subsystem: Mitac 100 Series/C230 Series Chipset Family USB
> 
> > 3.0 xHCI Controller
> 
> >
> 
> >
> 
> >
> 
> > [Thales] : SW :
> 
> >
> 
> > [Thales] : Kernel driver in use: xhci_hcd
> 
> >
> 
> > [Thales] : Kernel modules : xhci_pci
> 
> >
> 
> >
> 
> >
> 
> >> 
> 
> >
> 
> >>      -Debian 11 version5.10.0-20
> 
>  
> 
> IIUC, before you said you had problem with Windows. So is this the software in dom0? Or did you actually try with Debian and still see the
> same issue?
> 
> [Thales, 14/03/24] We are not sure to understand the question. The information we provided to you was the modules on the dom0. The driver
> which is back on the dom guest Windows: controleur hote ReunesasUSB 3.0 extensible
> 
>  
> 
> Regarding the configuration, given you are using the official Debian package. Are you using 'xl' to create your guest?
> 
> [Thales, 14/03/24] yes we do
> 
>  
> 
> The ideal would be if you can paste the full configuration. If you can't can you tell us if you are using any of these options: 'pci',
> 'usbdev', 'usbctrl'?
> 
> [Thales, 14/03/24]
> 
> device_model_args = [ "
> 
>                       "-device","nec-usb-xhci,id=xhci",
> 
>                       "-device","usb-host,bus=xhci.0,hostbus=1,hostport=13",
> 
>                       "-device","usb-host,bus=xhci.0,hostbus=1,hostport=10",
> 
>                       "-device","usb-host,bus=xhci.0,hostbus=1,hostport=2",
> 
>                       "-device","usb-host,bus=xhci.0,hostbus=2,hostport=2",
> 
>                       "-device","usb-host,bus=xhci.0,hostbus=2,hostport=1",
> 
>                       "-device","usb-host,bus=xhci.0,hostbus=1,hostport=1"]
> 
> [end Thales, 14/03/24]
> 
>  
> 
> [...]
> 
>  
> 
> >>      -Xen version4.14
> 
> >
> 
> >
> 
> >
> 
> > Are minor version of Xen 4.14 are you using ? Any patches on top ?
> 
> >
> 
> >
> 
> >
> 
> > Xen 4.14 has also been out of support for a few months now. If that’s
> 
> > possible, I would recommend to try a new Xen version (the last stable
> 
> > is
> 
> >
> 
> > 4.18) just in case your issue as been fixed in newer release.
> 
> >
> 
> >
> 
> >
> 
> > [Thales] : we have to use Xen release that are downloaded from the
> 
> > Debian official repository  (requested by our customer)
> 
> >
> 
> > [Thales] : the last one is version 4.14, but we would like to know if there is one more recent that is compatible with Linux Debian 11 ?
> 
>  
> 
> Newer Xen releases should be compatible with Debian 11. But I am not aware of any "official" package for that specific version.
> 
>  
> 
> Cheers,
> 
>  
> 
> --
> 
> Julien Grall
> 
> 
> 
--8323329-1892190326-1710544158=:853156--

