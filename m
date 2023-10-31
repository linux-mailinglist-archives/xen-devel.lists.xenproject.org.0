Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633877DCA62
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625584.975004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxleo-0001BE-Vn; Tue, 31 Oct 2023 10:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625584.975004; Tue, 31 Oct 2023 10:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxleo-00017t-S9; Tue, 31 Oct 2023 10:07:34 +0000
Received: by outflank-mailman (input) for mailman id 625584;
 Tue, 31 Oct 2023 10:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4TaJ=GN=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1qxlen-00017n-Bp
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:07:33 +0000
Received: from smarthost01b.sbp.mail.zen.net.uk
 (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d33a229-77d5-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 11:07:30 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1qxlej-005oZv-Ts
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:07:29 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 913E188396D
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 10:07:29 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMEm6G2DdbAN for <xen-devel@lists.xenproject.org>;
 Tue, 31 Oct 2023 10:07:29 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 6847088396A
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 10:07:29 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 5BD79488; Tue, 31 Oct 2023 10:07:29 +0000 (GMT)
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
X-Inumbo-ID: 4d33a229-77d5-11ee-98d6-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Tue, 31 Oct 2023 10:07:29 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: live migration fails: qemu placing pci devices at different locations
Message-ID: <ZUDR4daChIWHZBUo@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

I'm having a bit of trouble performing live migration between hvm guests.  The
sending side is xen 4.14.5 (qemu 5.0), receiving 4.15.5 (qemu 5.1).  The error
message recorded in qemu-dm-<name>--incoming.log:

qemu-system-i386: Unknown savevm section or instance '0000:00:04.0/vga' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices

I have patched libxl_dm.c to explicitly assign `addr=xx` values for various
devices and when these are correct the domain migrates correctly.  However
the configuration differences between guests means that the values are not
consistent.  The domain config file doesn't allow the pci address to be
expressed in the configuration for, e.g. `soundhw="DEVICE"`

e.g. 

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 6e531863ac0..daa7c49846f 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1441,7 +1441,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, "-spice");
             flexarray_append(dm_args, spiceoptions);
             if (libxl_defbool_val(b_info->u.hvm.spice.vdagent)) {
-                flexarray_vappend(dm_args, "-device", "virtio-serial",
+                flexarray_vappend(dm_args, "-device", "virtio-serial,addr=04",
                     "-chardev", "spicevmc,id=vdagent,name=vdagent", "-device",
                     "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
                     NULL);

The order of devices on the qemu command line (below) appears to be the same
so my assumption is that the internals of qemu have resulted in things being
connected in a different order.  The output of a Windows `lspci` tool is
also included.

Could anyone make any additional suggestions on how I could try to gain
consistency between the different qemu versions?

Thanks,
James


xen 4.14.5

/usr/lib/xen/bin/qemu-system-i386 -xen-domid 19 -no-shutdown
  -chardev socket,id=libxl-cmd,fd=19,server,nowait -S 
  -mon chardev=libxl-cmd,mode=control
  -chardev socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-19,server,nowait
  -mon chardev=libxenstat-cmd,mode=control
  -nodefaults -no-user-config -name <name> -vnc 0.0.0.0:93 -display none
  -k en-us
  -spice port=35993,tls-port=0,addr=127.0.0.1,disable-ticketing,agent-mouse=on,disable-copy-paste,image-compression=auto_glz 
  -device virtio-serial -chardev spicevmc,id=vdagent,name=vdagent
  -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
  -device VGA,vgamem_mb=16
  -boot order=cn
  -usb -usbdevice tablet
  -soundhw hda
  -smp 2,maxcpus=2
  -device rtl8139,id=nic0,netdev=net0,mac=00:16:3e:64:c8:68
  -netdev type=tap,id=net0,ifname=vif19.0-emu,script=no,downscript=no
  -object tls-creds-x509,id=tls0,endpoint=client,dir=/etc/certificates/usbredir,verify-peer=yes
  -chardev socket,id=charredir_serial0,host=127.0.0.1,port=48052,reconnect=2,nodelay,keepalive=on,user-timeout=5
  -device isa-serial,chardev=charredir_serial0
  -chardev socket,id=charredir_serial1,host=127.0.0.1,port=48054,reconnect=2,nodelay,keepalive=on,user-timeout=5
  -device isa-serial,chardev=charredir_serial1
  -chardev socket,id=charredir_serial2,host=127.0.0.1,port=48055,reconnect=2,nodelay,keepalive=on,user-timeout=5
  -device pci-serial,chardev=charredir_serial2
  -trace events=/etc/xen/qemu-trace-options -machine xenfv -m 2032
  -drive file=/dev/drbd1002,if=ide,index=0,media=disk,format=raw,cache=writeback
  -drive file=/dev/drbd1003,if=ide,index=1,media=disk,format=raw,cache=writeback
  -runas 131091:131072

00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
00:03.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) High Definition Audio Controller (rev 01)
00:04.0 Communication controller: Red Hat, Inc Virtio console
00:05.0 VGA compatible controller: Device 1234:1111 (rev 02)
00:07.0 Serial controller: Red Hat, Inc. QEMU PCI 16550A Adapter (rev 01)



xen 4.15.5

/usr/lib/xen/bin/qemu-system-i386 -xen-domid 15 -no-shutdown
  -chardev socket,id=libxl-cmd,fd=19,server=on,wait=off -S
  -mon chardev=libxl-cmd,mode=control
  -chardev socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-15,server=on,wait=off
  -mon chardev=libxenstat-cmd,mode=control
  -nodefaults -no-user-config -name <name> -vnc 0.0.0.0:93 -display none
  -k en-us
  -spice port=35993,tls-port=0,addr=127.0.0.1,disable-ticketing=on,agent-mouse=on,disable-copy-paste=on,image-compression=auto_glz
  -device virtio-serial -chardev spicevmc,id=vdagent,name=vdagent
  -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
  -device VGA,vgamem_mb=16
  -boot order=cn
  -usb -usbdevice tablet
  -device intel-hda -device hda-duplex
  -smp 2,maxcpus=2
  -device rtl8139,id=nic0,netdev=net0,mac=00:16:3e:64:c8:68
  -netdev type=tap,id=net0,ifname=vif15.0-emu,br=wan0-00,script=no,downscript=no
  -object tls-creds-x509,id=tls0,endpoint=client,dir=/etc/certificates/usbredir,verify-peer=yes
  -chardev socket,id=charredir_serial0,host=127.0.0.1,port=48052,reconnect=2,nodelay,keepalive=on,user-timeout=5
  -device isa-serial,chardev=charredir_serial0
  -chardev socket,id=charredir_serial1,host=127.0.0.1,port=48054,reconnect=2,nodelay,keepalive=on,user-timeout=5
  -device isa-serial,chardev=charredir_serial1
  -chardev socket,id=charredir_serial2,host=127.0.0.1,port=48055,reconnect=2,nodelay,keepalive=on,user-timeout=5
  -device pci-serial,chardev=charredir_serial2
  -trace events=/etc/xen/qemu-trace-options -machine xenfv,suppress-vmdesc=on -m 2032
  -drive file=/dev/drbd1002,if=ide,index=0,media=disk,format=raw,cache=writeback
  -drive file=/dev/drbd1003,if=ide,index=1,media=disk,format=raw,cache=writeback
  -runas 131087:131072

00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
00:03.0 Communication controller: Red Hat, Inc Virtio console
00:04.0 VGA compatible controller: Device 1234:1111 (rev 02)
00:05.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) High Definition Audio Controller (rev 01)
00:07.0 Serial controller: Red Hat, Inc. QEMU PCI 16550A Adapter (rev 01)


