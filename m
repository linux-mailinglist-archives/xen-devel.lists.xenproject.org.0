Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06260E31B8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbkt-00037X-Cy; Thu, 24 Oct 2019 11:58:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=W8Wg=YR=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iNbkr-00037S-C5
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 11:58:13 +0000
X-Inumbo-ID: 871eeb46-f655-11e9-949f-12813bfff9fa
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 871eeb46-f655-11e9-949f-12813bfff9fa;
 Thu, 24 Oct 2019 11:58:02 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 0D4642001BA
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 22:58:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1571918280; bh=LnoUUmzfRCYy5aAjh/Nkel15MsaXZkd20UmXVNHXvFY=;
 h=Date:From:Subject:To;
 b=CWBp4lLqc8s5nMif+YLLeqok3OsWrPPViFOPpeUkhAMrPLT0zhdtZ3NntovZnMU0M
 0A2bZSd+d7LhF3NaYdpOIyQQr/m2smARC4195pLlNFc4CHYg6qqD8+iepcv6/cjRoV
 5g0i372v7vPUrLn3KLu+yB+qJG+dHjUG0Kg9dC9M=
Date: Thu, 24 Oct 2019 22:57:56 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-Id: <1571918276.2606.0@crc.id.au>
X-Mailer: geary/3.34.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-P91qW212g3IaS3cM+wCe"
Subject: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series CPUs.
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=-P91qW212g3IaS3cM+wCe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

I've managed to get the git master version of Xen on this affected=20
system and tries to boot a Windows Server 2016 system. It crashes as=20
per normal.

I managed to get these logs, but I'm not quite sure what else to do to=20
debug this issue further.

Suggestions welcome.

The boot log in /var/log/xen/ shows:
Waiting for domain soti.vm (domid 4) to die [pid 9174]
Domain 4 has shut down, reason code 3 0x3
Action for shutdown reason code 3 is destroy
Domain 4 needs to be cleaned up: destroying the domain
Done. Exiting now

For some reason I'm not getting any serial output - so I'll have to=20
take a look at that tomorrow - but if you need anything further, please=20
let me know and I'll see what I can turn up.

Windows config file:

type =3D "hvm"
name =3D "$vmname.vm"
viridian =3D 1
#viridian =3D ['base']
memory =3D 8192
vcpus =3D 4
vif =3D ['bridge=3Dbr51, mac=3D00:16:3E:64:CC:A0']
#disk =3D [ '/dev/vg_hosting/$vmname.vm,raw,xvda,rw',=20
'file:/root/SW_DVD9_NTRL_Windows_Svrs_2016_English_2_Std_DC_FPP_OEM_X21-225=
67.ISO,hdc:cdrom,r'=20
]
disk =3D [ '/dev/vg_hosting/$vmname.vm,raw,hda,rw' ]
boot =3D 'cd'
vnc =3D 2
vnclisten =3D "0.0.0.0"
#vncpasswd =3D ''

## Set the clock to localtime - not UTC...
localtime =3D 1

## Fix the mouse cursor for VNC usage
usbdevice =3D 'tablet'

## Lower CPU prio that other VMs...
cpu_weight =3D 128

on_poweroff =3D 'destroy'
on_reboot =3D 'destroy'
on_crash =3D 'destroy'

Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au     =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +613 9001 6090       =F0=9F=93=B1 +614 1293 5897


=

--=-P91qW212g3IaS3cM+wCe
Content-Type: multipart/mixed; boundary="=-aJeHogJt6b/BlgRqdz1f"

--=-aJeHogJt6b/BlgRqdz1f
Content-Type: text/plain
Content-Disposition: attachment; filename=windows-debug-xl-dmesg.txt

(XEN) HVM d4v0 save: CPU
(XEN) HVM d4v1 save: CPU
(XEN) HVM d4v2 save: CPU
(XEN) HVM d4v3 save: CPU
(XEN) HVM d4 save: PIC
(XEN) HVM d4 save: IOAPIC
(XEN) HVM d4v0 save: LAPIC
(XEN) HVM d4v1 save: LAPIC
(XEN) HVM d4v2 save: LAPIC
(XEN) HVM d4v3 save: LAPIC
(XEN) HVM d4v0 save: LAPIC_REGS
(XEN) HVM d4v1 save: LAPIC_REGS
(XEN) HVM d4v2 save: LAPIC_REGS
(XEN) HVM d4v3 save: LAPIC_REGS
(XEN) HVM d4 save: PCI_IRQ
(XEN) HVM d4 save: ISA_IRQ
(XEN) HVM d4 save: PCI_LINK
(XEN) HVM d4 save: PIT
(XEN) HVM d4 save: RTC
(XEN) HVM d4 save: HPET
(XEN) HVM d4 save: PMTIMER
(XEN) HVM d4v0 save: MTRR
(XEN) HVM d4v1 save: MTRR
(XEN) HVM d4v2 save: MTRR
(XEN) HVM d4v3 save: MTRR
(XEN) HVM d4 save: VIRIDIAN_DOMAIN
(XEN) HVM d4v0 save: CPU_XSAVE
(XEN) HVM d4v1 save: CPU_XSAVE
(XEN) HVM d4v2 save: CPU_XSAVE
(XEN) HVM d4v3 save: CPU_XSAVE
(XEN) HVM d4v0 save: VIRIDIAN_VCPU
(XEN) HVM d4v1 save: VIRIDIAN_VCPU
(XEN) HVM d4v2 save: VIRIDIAN_VCPU
(XEN) HVM d4v3 save: VIRIDIAN_VCPU
(XEN) HVM d4v0 save: VMCE_VCPU
(XEN) HVM d4v1 save: VMCE_VCPU
(XEN) HVM d4v2 save: VMCE_VCPU
(XEN) HVM d4v3 save: VMCE_VCPU
(XEN) HVM d4v0 save: TSC_ADJUST
(XEN) HVM d4v1 save: TSC_ADJUST
(XEN) HVM d4v2 save: TSC_ADJUST
(XEN) HVM d4v3 save: TSC_ADJUST
(XEN) HVM d4v0 save: CPU_MSR
(XEN) HVM d4v1 save: CPU_MSR
(XEN) HVM d4v2 save: CPU_MSR
(XEN) HVM d4v3 save: CPU_MSR
(XEN) HVM4 restore: CPU 0
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(d4) HVM Loader
(d4) Detected Xen v4.13.0-rc
(d4) Xenbus rings @0xfeffc000, event channel 1
(d4) System requested SeaBIOS
(d4) CPU speed is 3800 MHz
(d4) Relocating guest memory for lowmem MMIO space disabled
(XEN) irq.c:373: Dom4 PCI link 0 changed 0 -> 5
(d4) PCI-ISA link 0 routed to IRQ5
(XEN) irq.c:373: Dom4 PCI link 1 changed 0 -> 10
(d4) PCI-ISA link 1 routed to IRQ10
(XEN) irq.c:373: Dom4 PCI link 2 changed 0 -> 11
(d4) PCI-ISA link 2 routed to IRQ11
(XEN) irq.c:373: Dom4 PCI link 3 changed 0 -> 5
(d4) PCI-ISA link 3 routed to IRQ5
(d4) pci dev 01:2 INTD->IRQ5
(d4) pci dev 01:3 INTA->IRQ10
(d4) pci dev 02:0 INTA->IRQ11
(d4) pci dev 04:0 INTA->IRQ5
(d4) RAM in high memory; setting high_mem resource base to 20f800000
(d4) pci dev 03:0 bar 10 size 002000000: 0f0000008
(d4) pci dev 02:0 bar 14 size 001000000: 0f2000008
(d4) pci dev 04:0 bar 30 size 000040000: 0f3000000
(d4) pci dev 03:0 bar 30 size 000010000: 0f3040000
(d4) pci dev 03:0 bar 14 size 000001000: 0f3050000
(d4) pci dev 02:0 bar 10 size 000000100: 00000c001
(d4) pci dev 04:0 bar 10 size 000000100: 00000c101
(d4) pci dev 04:0 bar 14 size 000000100: 0f3051000
(d4) pci dev 01:2 bar 20 size 000000020: 00000c201
(d4) pci dev 01:1 bar 20 size 000000010: 00000c221
(d4) Multiprocessor initialisation:
(d4)  - CPU0 ... 48-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d4)  - CPU1 ... 48-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d4)  - CPU2 ... 48-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d4)  - CPU3 ... 48-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d4) Testing HVM environment:
(d4) Using scratch memory at 400000
(d4)  - REP INSB across page boundaries ... passed
(d4)  - REP INSW across page boundaries ... passed
(d4)  - GS base MSRs and SWAPGS ... passed
(d4) Passed 3 of 3 tests
(d4) Writing SMBIOS tables ...
(d4) Loading SeaBIOS ...
(d4) Creating MP tables ...
(d4) Loading ACPI ...
(d4) vm86 TSS at fc00aa00
(d4) BIOS map:
(d4)  10000-100e3: Scratch space
(d4)  c0000-fffff: Main BIOS
(d4) E820 table:
(d4)  [00]: 00000000:00000000 - 00000000:000a0000: RAM
(d4)  HOLE: 00000000:000a0000 - 00000000:000c0000
(d4)  [01]: 00000000:000c0000 - 00000000:00100000: RESERVED
(d4)  [02]: 00000000:00100000 - 00000000:f0000000: RAM
(d4)  HOLE: 00000000:f0000000 - 00000000:fc000000
(d4)  [03]: 00000000:fc000000 - 00000001:00000000: RESERVED
(d4)  [04]: 00000001:00000000 - 00000002:0f800000: RAM
(d4) Invoking SeaBIOS ...
(d4) SeaBIOS (version rel-1.12.1-0-ga5cab58-Xen)
(d4) BUILD: gcc: (GCC) 9.2.1 20190827 (Red Hat 9.2.1-1) binutils: version 2.32-24.fc31
(d4) 
(d4) Found Xen hypervisor signature at 40000100
(d4) Running on QEMU (i440fx)
(d4) xen: copy e820...
(d4) Relocating init from 0x000d8780 to 0xeffad560 (size 76288)
(d4) Found 8 PCI devices (max PCI bus is 00)
(d4) Allocated Xen hypercall page at effff000
(d4) Detected Xen v4.13.0-rc
(d4) xen: copy BIOS tables...
(d4) Copying SMBIOS entry point from 0x00010020 to 0x000f5c00
(d4) Copying MPTABLE from 0xfc0011e0/fc0011f0 to 0x000f5ae0
(d4) Copying PIR from 0x00010040 to 0x000f5a60
(d4) Copying ACPI RSDP from 0x000100c0 to 0x000f5a30
(d4) Using pmtimer, ioport 0xb008
(d4) Scan for VGA option rom
(d4) Running option rom at c000:0003
(XEN) stdvga.c:173:d4v0 entering stdvga mode
(d4) pmm call arg1=0
(d4) Turning on vga text mode console
(d4) SeaBIOS (version rel-1.12.1-0-ga5cab58-Xen)
(d4) Machine UUID fb791c6a-1ea6-47bd-8ca9-ccd20e08408c
(d4) UHCI init on dev 00:01.2 (io=c200)
(d4) ATA controller 1 at 1f0/3f4/c220 (irq 14 dev 9)
(d4) ATA controller 2 at 170/374/c228 (irq 15 dev 9)
(d4) Found 0 lpt ports
(d4) Found 0 serial ports
(d4) PS2 keyboard initialized
(d4) ata0-0: QEMU HARDDISK ATA-7 Hard-Disk (61440 MiBytes)
(d4) Searching bootorder for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d4) All threads complete.
(d4) Scan for option roms
(d4) Running option rom at c980:0003
(d4) pmm call arg1=1
(d4) pmm call arg1=0
(d4) pmm call arg1=1
(d4) pmm call arg1=0
(d4) Searching bootorder for: /pci@i0cf8/*@4
(d4) 
(d4) Press ESC for boot menu.
(d4) 
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(d4) Searching bootorder for: HALT
(d4) drive 0x000f59c0: PCHS=16383/16/63 translation=lba LCHS=1024/255/63 s=125829120
(d4) Space available for UMB: ca800-ea000, f5420-f59c0
(d4) Returned 258048 bytes of ZoneHigh
(d4) e820 map has 7 items:
(d4)   0: 0000000000000000 - 000000000009fc00 = 1 RAM
(d4)   1: 000000000009fc00 - 00000000000a0000 = 2 RESERVED
(d4)   2: 00000000000f0000 - 0000000000100000 = 2 RESERVED
(d4)   3: 0000000000100000 - 00000000effff000 = 1 RAM
(d4)   4: 00000000effff000 - 00000000f0000000 = 2 RESERVED
(d4)   5: 00000000fc000000 - 0000000100000000 = 2 RESERVED
(d4)   6: 0000000100000000 - 000000020f800000 = 1 RAM
(d4) enter handle_19:
(d4)   NULL
(d4) Booting from Hard Disk...
(d4) Booting from 0000:7c00
(XEN) stdvga.c:178:d4v0 leaving stdvga mode
(XEN) d4: VIRIDIAN GUEST_OS_ID: vendor: 1 os: 4 major: a minor: 0 sp: 0 build: 271b
(XEN) d4: VIRIDIAN HYPERCALL: enabled: 1 pfn: 1c2
(XEN) d4v0: VIRIDIAN VP_ASSIST: pfn: a
(XEN) d4: VIRIDIAN MSR_TIME_REF_COUNT: accessed
(XEN) d4v0 VIRIDIAN CRASH: ac 0 a0a0 fffff801c763d350 aea
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x2600, fault address = 0xfffffffdf8000000, flags = 0x8
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x2600, fault address = 0xfffffffdf8000000, flags = 0x8
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v1 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v3 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v2 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) emul-priv-op.c:1111:d0v0 Domain attempted WRMSR c0011020 from 0x0006404000000000 to 0x0006404000000400
(XEN) AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x2600, fault address = 0xfffffffdf8000000, flags = 0x8

--=-aJeHogJt6b/BlgRqdz1f
Content-Type: text/plain
Content-Disposition: attachment; filename=windows-debug-xl-info.txt

host                   : cly-xen-1.int.umd.com.au
release                : 5.3.6-300.fc31.x86_64
version                : #1 SMP Mon Oct 14 12:26:42 UTC 2019
machine                : x86_64
nr_cpus                : 24
max_cpu_id             : 31
nr_nodes               : 1
cores_per_socket       : 12
threads_per_core       : 2
cpu_mhz                : 3800.030
hw_caps                : 178bf3ff:f6d8320b:2e500800:244037ff:0000000f:219c91a9:00400004:00000500
virt_caps              : pv hvm hvm_directio pv_directio hap shadow
total_memory           : 65485
free_memory            : 52299
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : .0-rc
xen_version            : 4.13.0-rc
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0xffff800000000000
xen_changeset          : Mon Oct 14 11:31:31 2019 +0100 git:518c935fac
xen_commandline        : placeholder dom0_mem=4096M,max:4096M ucode=scan dom0_max_vcpus=4 loglvl=all guest_loglvl=all com1=115200,8n1 console=com1
cc_compiler            : gcc (GCC) 9.2.1 20190827 (Red Hat 9.2.1-1)
cc_compile_by          : root
cc_compile_domain      : int.umd.com.au
cc_compile_date        : Thu Oct 24 18:11:02 AEDT 2019
build_id               : 12253ccd35be24bf9773afbfdc3ae3d704f1af28
xend_config_format     : 4

--=-aJeHogJt6b/BlgRqdz1f--

--=-P91qW212g3IaS3cM+wCe
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=-P91qW212g3IaS3cM+wCe--


