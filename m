Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE191A680
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 14:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749968.1158297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMo9E-0002Ie-G4; Thu, 27 Jun 2024 12:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749968.1158297; Thu, 27 Jun 2024 12:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMo9E-0002Gc-DN; Thu, 27 Jun 2024 12:22:44 +0000
Received: by outflank-mailman (input) for mailman id 749968;
 Thu, 27 Jun 2024 11:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ztCX=N5=gmail.com=gaojunhao0504@srs-se1.protection.inumbo.net>)
 id 1sMmzb-00067W-6g
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 11:08:43 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b7ee4c8-3475-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 13:08:41 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6b5052defa6so37367386d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 04:08:40 -0700 (PDT)
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
X-Inumbo-ID: 9b7ee4c8-3475-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719486519; x=1720091319; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l6MzYtcaVRbqw2Lc3Ihw02cJzZCenCF6o/X+KRohjS8=;
        b=S2NbIdSStRetCki96I8oYupgt9/A7q7lko1hCyeei3giNB/ON8UUKVp7PluavVhrcr
         EcLRQmDRKdvYFYIBQR2KwWzCjLryuvz4YRSn8O/VXGeRTIpMkDlbNvpljCQdNDrT//lo
         OHBHyNjpFTeklJNnbG2zvkoOSXeZrihElmXTTR+qAxNXoISBDo/jlQFMOAzSTCfQAuID
         Br4UsualT6P0Pc64MU1e0BAiSIPy4Oyc9jLCgCVUhMqle8fTZGDbV4LKsv0MH6QkJkdD
         hro0PLx4kE5k0+qOPfw8xJr4y66e64n+0P9c0zvw577f5dSs7S/jc4+PZ5AyIoZWinU2
         S1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486519; x=1720091319;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6MzYtcaVRbqw2Lc3Ihw02cJzZCenCF6o/X+KRohjS8=;
        b=NUQ8Ns5tNJVbBeYcmADwYnvybQ+6Ky27zykPjP33zq2S7LGBYhcsJHhz/KFkdwi8kG
         BBt/gHk7PWF6GtXvq9f7caGgoNjjXQXkPVzaNbsYPj0p+bOa2qM6DmmafqhnE5bOiIiS
         zJqmfQ6D8hzQODRGQU13uSQd73j1UCzTJMLQ0UcKyFrpMh/oLdhjfkyQxeOn13hk72p6
         7lJqTWPKQ29Jz0Z+vcyKa9/MidDnV292WjzcSB3LNKD4LyEbUpU80EmjA9vSYSZxl0qG
         i1WFLODZgoxdosNYTKIenajRyuXIZB3rXlTa7h6qURPy6G80FTKXnWS25grZgDMHwzTa
         wxsQ==
X-Gm-Message-State: AOJu0YwO+wy0luS9IdL7QQvSph3XjCPYpTKV+OlJVDmBcdWw8SuN94tJ
	spT0p7ll8XRmDJuDIEAQz9mZFMTnzIXlmfjFRNA6q89Bjl9Qk4t3/0eG9Gtnp4g0DjX+r+3Nasf
	3LgOSQNaaX/EOslsd8vsq2KzAnXc71qk6Qis=
X-Google-Smtp-Source: AGHT+IHdUOmaHYaKVA3cbK1i58+UbUAuV0eBzRUzFbaY84Bbisu4/lw+7yNMVOenNTVW3+OcOS+5e/LyI0R2MqjtS1Y=
X-Received: by 2002:a05:6214:240d:b0:6b5:4125:415d with SMTP id
 6a1803df08f44-6b54125430fmr193404376d6.13.1719486518841; Thu, 27 Jun 2024
 04:08:38 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6auY6ZKn5rWp?= <gaojunhao0504@gmail.com>
Date: Thu, 27 Jun 2024 19:08:28 +0800
Message-ID: <CAOJPZgnoxUR-58_2DJGwYkW126nbTtC=kWrZ_gCJGcBiEcon7Q@mail.gmail.com>
Subject: domU will hang after reboot in dom0-less arch on arm
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C
I use u-boot, xen, qemu to boot domU, then execute "reboot" command in
domU, domU
will hang. Could someone know this issue and this feature is supported
or not. Thanks.

#####################################hang
info############################################
Welcome to SNPS Mini AArch64 by Buildroot
mini-aarch64 login: root
#
#
# reboot
# Stopping network: ifdown: interface eth0 not configured
OK
Saving random seed: OK
Stopping klogd: OK
Stopping syslogd: OK
umount: devtmpfs busy - remounted read-only
umount: can't unmount /: Invalid argument
The system is going down NOW!
Sent SIGTERM to all processes
Sent SIGKILL to all processes
Requesting system reboot
[   47.461948] Flash device refused suspend due to active operation (state =
20)
[   47.466276] Flash device refused suspend due to active operation (state =
20)
[   47.472966] reboot: Restarting system
(XEN) Hardware Dom0 shutdown: rebooting machine


U-Boot 2024.01 (Jun 04 2024 - 19:56:53 +0800)

DRAM:  4 GiB
Core:  51 devices, 14 uclasses, devicetree: board
Flash: 64 MiB
Loading Environment from Flash... *** Warning - bad CRC, using default
environment

In:    serial,usbkbd
Out:   serial,vidconsole
Err:   serial,vidconsole
No working controllers found
Net:   eth0: virtio-net#32
starting USB...
No working controllers found
Hit any key to stop autoboot:  0
Scanning for bootflows in all bootdevs
Seq  Method       State   Uclass    Part  Name                      Filenam=
e
---  -----------  ------  --------  ----  ------------------------
----------------
Scanning global bootmeth 'efi_mgr':
No EFI system partition
No EFI system partition
Failed to persist EFI variables
Missing TPMv2 device for EFI_TCG_PROTOCOL
Missing RNG device for EFI_RNG_PROTOCOL
Scanning bootdev 'fw-cfg@9020000.bootdev':
fatal: no kernel available
No working controllers found
scanning bus for devices...
BOOTP broadcast 1
###########################################################################=
###############

software version:
u-boot: v2024.01
xen: 4.18.0
qemu: 8.1.3

qemu command:
qemu-system-aarch64 \
-machine virt,gic_version=3D3 \
-machine virtualization=3Dtrue \
-cpu cortex-a57 \
-machine type=3Dvirt \
-m 4096 \
-smp 4 \
-bios u-boot.bin \
-device loader,file=3Dxen,force-raw=3Don,addr=3D0x49000000 \
-device loader,file=3Dvirt-gicv3.dtb,addr=3D0x44000000 \
-device loader,file=3DImage,addr=3D0x54000000 \
-device loader,file=3Drootfs.img.gz,addr=3D0x59000000 \
-device loader,file=3DImage,addr=3D0x64000000 \
-device loader,file=3Drootfs.img.gz,addr=3D0x69000000 \
-nographic \
-chardev socket,id=3Dqemu-monitor,host=3Dlocalhost,port=3D7777,server=3Don,=
wait=3Doff,telnet=3Don
\
-mon qemu-monitor,mode=3Dreadline

Thanks,
Junhao Gao

