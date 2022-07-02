Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2685641ED
	for <lists+xen-devel@lfdr.de>; Sat,  2 Jul 2022 19:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359394.588823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7h9W-0003sF-JF; Sat, 02 Jul 2022 17:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359394.588823; Sat, 02 Jul 2022 17:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7h9W-0003oI-Fm; Sat, 02 Jul 2022 17:43:30 +0000
Received: by outflank-mailman (input) for mailman id 359394;
 Sat, 02 Jul 2022 17:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+e1=XH=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o7h9V-0003kj-2i
 for xen-devel@lists.xen.org; Sat, 02 Jul 2022 17:43:29 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 784b64da-fa2e-11ec-bf74-3be3494bec92;
 Sat, 02 Jul 2022 19:43:26 +0200 (CEST)
Received: by mail-ed1-f47.google.com with SMTP id c65so6553874edf.4;
 Sat, 02 Jul 2022 10:43:23 -0700 (PDT)
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
X-Inumbo-ID: 784b64da-fa2e-11ec-bf74-3be3494bec92
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ghVSNn/o9ecQXueAzNk7+M3SImaH89IEsRIg90uY4yQ=;
        b=VJxCd01RtmVoOf2toBZuCLHZSoqlUxo1LmIMxf1Dh67bHYmOfjp+pQ5PllEk4A036E
         YrKI5bekkpsUDs4PnQdxLvmQZWCnu3L2akznSANoypCSUnJDHmS66fEOddKRFs+kvz3a
         Sb0UpAD0jBETQTAMFEnOvPSsNYXliRAR5b+E9CaBdtWRCeuPwBnb16+RzvefeboDnC/y
         4SXa+qmxE7LhAbm3WJXYZJGCo7W4/F5RgI9uoQ2BPx6MqTMq7cC7R/tfPF2nTYP8ESpw
         +3tyHOvjBZciVdKGikMvHWn5Dbmt7dBgr7z2k+C35RQkpdh7ZeVX+NGE7KPtCiRdfIC3
         KJ+Q==
X-Gm-Message-State: AJIora+Esw+KiDVGo88vm0nkgzIn1ffQgSYCPfE+2hMywuo3o9HYpmpr
	gdJAHpgx7xmHd8aIc86O/7/03MnhO5ckCyM8dKrobU/50hY=
X-Google-Smtp-Source: AGRyM1vrFXKV2CA5Lspi16sj0Ggb2nQiNMC0QQSm0aC7fW0N/I/B7Cs3p9jwEHEVRzbKDOnPXKNOj1Rjd4EWSD3TojM=
X-Received: by 2002:a05:6402:84f:b0:437:6293:d264 with SMTP id
 b15-20020a056402084f00b004376293d264mr26217908edz.317.1656783802751; Sat, 02
 Jul 2022 10:43:22 -0700 (PDT)
MIME-Version: 1.0
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sun, 3 Jul 2022 01:43:11 +0800
Message-ID: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
Subject: PCI pass-through problem for SN570 NVME SSD
To: xen-users <xen-users@lists.xen.org>, xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi everybody,

I run into problems passing through a SN570 NVME SSD to a HVM guest.
So far I have no idea if the problem is with this specific SSD or with
the CPU + motherboard combination or the SW stack.
Looking for some suggestions on troubleshooting.

List of build info:
CPU+motherboard: E-2146G + Gigabyte C246N-WU2
XEN version: 4.14.3
Dom0: Linux Kernel 5.10 (built from Debian 11.2 kernel source package)
The SN570 SSD sits here in the PCI tree:
           +-1d.0-[05]----00.0  Sandisk Corp Device 501a

Syndromes observed:
With ASPM enabled, pciback has problem seizing the device.

Jul  2 00:36:54 gaia kernel: [    1.648270] pciback 0000:05:00.0:
xen_pciback: seizing device
...
Jul  2 00:36:54 gaia kernel: [    1.768646] pcieport 0000:00:1d.0:
AER: enabled with IRQ 150
Jul  2 00:36:54 gaia kernel: [    1.768716] pcieport 0000:00:1d.0:
DPC: enabled with IRQ 150
Jul  2 00:36:54 gaia kernel: [    1.768717] pcieport 0000:00:1d.0:
DPC: error containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+
SwTrigger+ RP PIO Log 4, DL_ActiveErr+
...
Jul  2 00:36:54 gaia kernel: [    1.770039] xen: registering gsi 16
triggering 0 polarity 1
Jul  2 00:36:54 gaia kernel: [    1.770041] Already setup the GSI :16
Jul  2 00:36:54 gaia kernel: [    1.770314] pcieport 0000:00:1d.0:
DPC: containment event, status:0x1f11 source:0x0000
Jul  2 00:36:54 gaia kernel: [    1.770315] pcieport 0000:00:1d.0:
DPC: unmasked uncorrectable error detected
Jul  2 00:36:54 gaia kernel: [    1.770320] pcieport 0000:00:1d.0:
PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction
Layer, (Receiver ID)
Jul  2 00:36:54 gaia kernel: [    1.770371] pcieport 0000:00:1d.0:
device [8086:a330] error status/mask=00200000/00010000
Jul  2 00:36:54 gaia kernel: [    1.770413] pcieport 0000:00:1d.0:
[21] ACSViol                (First)
Jul  2 00:36:54 gaia kernel: [    1.770466] pciback 0000:05:00.0:
xen_pciback: device is not found/assigned
Jul  2 00:36:54 gaia kernel: [    1.920195] pciback 0000:05:00.0:
xen_pciback: device is not found/assigned
Jul  2 00:36:54 gaia kernel: [    1.920260] pcieport 0000:00:1d.0:
AER: device recovery successful
Jul  2 00:36:54 gaia kernel: [    1.920263] pcieport 0000:00:1d.0:
DPC: containment event, status:0x1f01 source:0x0000
Jul  2 00:36:54 gaia kernel: [    1.920264] pcieport 0000:00:1d.0:
DPC: unmasked uncorrectable error detected
Jul  2 00:36:54 gaia kernel: [    1.920267] pciback 0000:05:00.0:
xen_pciback: device is not found/assigned
Jul  2 00:36:54 gaia kernel: [    1.938406] xen: registering gsi 16
triggering 0 polarity 1
Jul  2 00:36:54 gaia kernel: [    1.938408] Already setup the GSI :16
Jul  2 00:36:54 gaia kernel: [    1.938666] xen_pciback: backend is vpci
...
Jul  2 00:43:48 gaia kernel: [  420.231955] pcieport 0000:00:1d.0:
DPC: containment event, status:0x1f01 source:0x0000
Jul  2 00:43:48 gaia kernel: [  420.231961] pcieport 0000:00:1d.0:
DPC: unmasked uncorrectable error detected
Jul  2 00:43:48 gaia kernel: [  420.231993] pcieport 0000:00:1d.0:
PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction
Layer, (Requester ID)
Jul  2 00:43:48 gaia kernel: [  420.235775] pcieport 0000:00:1d.0:
device [8086:a330] error status/mask=00100000/00010000
Jul  2 00:43:48 gaia kernel: [  420.235779] pcieport 0000:00:1d.0:
[20] UnsupReq               (First)
Jul  2 00:43:48 gaia kernel: [  420.235783] pcieport 0000:00:1d.0:
AER:   TLP Header: 34000000 05000010 00000000 88458845
Jul  2 00:43:48 gaia kernel: [  420.235819] pci 0000:05:00.0: AER:
can't recover (no error_detected callback)
Jul  2 00:43:48 gaia kernel: [  420.384349] pcieport 0000:00:1d.0:
AER: device recovery successful
... // The following might relate to an attempt to assign the device
to guest, not very sure...
Jul  2 00:46:06 gaia kernel: [  559.147333] pciback 0000:05:00.0:
xen_pciback: seizing device
Jul  2 00:46:06 gaia kernel: [  559.147435] pciback 0000:05:00.0:
enabling device (0000 -> 0002)
Jul  2 00:46:06 gaia kernel: [  559.147508] xen: registering gsi 16
triggering 0 polarity 1
Jul  2 00:46:06 gaia kernel: [  559.147511] Already setup the GSI :16
Jul  2 00:46:06 gaia kernel: [  559.147558] pciback 0000:05:00.0:
xen_pciback: MSI-X preparation failed (-6)


With pcie_aspm=off, the error log related to pciback goes away.
But I suspect there are still some problems hidden -- since I don't
see any AER enabled messages so errors may be hidden.
I have the xen_pciback built directly into the kernel and assigned the
SSD to it in the kernel command-line.
However, the result from pci-assignable-xxx commands are not very consistent:

root@gaia:~# xl pci-assignable-list
0000:00:17.0
0000:05:00.0
root@gaia:~# xl pci-assignable-remove 05:00.0
libxl: error: libxl_pci.c:853:libxl__device_pci_assignable_remove:
failed to de-quarantine 0000:05:00.0 <===== Here!!!
root@gaia:~# xl pci-assignable-add 05:00.0
libxl: warning: libxl_pci.c:794:libxl__device_pci_assignable_add:
0000:05:00.0 already assigned to pciback <==== Here!!!
root@gaia:~# xl pci-assignable-remove 05:00.0
root@gaia:~# xl pci-assignable-list
0000:00:17.0
root@gaia:~# xl pci-assignable-add 05:00.0
libxl: warning: libxl_pci.c:814:libxl__device_pci_assignable_add:
0000:05:00.0 not bound to a driver, will not be rebound.
root@gaia:~# xl pci-assignable-list
0000:00:17.0
0000:05:00.0


After the 'xl pci-assignable-list' appears to be self-consistent,
creating VM with the SSD assigned still leads to a guest crash:
From qemu log:
[00:06.0] xen_pt_region_update: Error: create new mem mapping failed! (err: 1)
qemu-system-i386: terminating on signal 1 from pid 1192 (xl)

From the 'xl dmesg' output:
(XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
(XEN) domain_crash called from p2m.c:1301
(XEN) Domain 1 reported crashed by domain 0 on cpu#4:
(XEN) memory_map:fail: dom1 gfn=f3078 mfn=a2504 nr=1 ret:-1


Which of the three syndromes are more fundamental?
1. The DPC / AER error log
2. The inconsistency in 'xl pci-assignable-list' state tracking
3. The GFN mapping failure on guest setup

Any suggestions for the next step?


Thanks,
G.R.

