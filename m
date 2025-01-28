Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67442A20BD8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 15:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878498.1288688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmO4-0004mt-7t; Tue, 28 Jan 2025 14:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878498.1288688; Tue, 28 Jan 2025 14:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmO4-0004km-4v; Tue, 28 Jan 2025 14:16:20 +0000
Received: by outflank-mailman (input) for mailman id 878498;
 Tue, 28 Jan 2025 14:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SSIY=UU=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1tcmO1-0004kd-Rx
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 14:16:18 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e01e073-dd82-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 15:16:13 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 51.2.17 AUTH)
 with ESMTPSA id D0534410SEFrwAY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 28 Jan 2025 15:15:53 +0100 (CET)
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
X-Inumbo-ID: 6e01e073-dd82-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1738073753; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SOyMQAtIzj+RwSIcSg6QjiBnex3xT1Ok5vYE8Jag6yer446ZEiuZ4BgL5U7zBnAv/X
    GueasaoSUJqeup+3hol84AS4h3VQfaVKyIBusPFY1v9Hk3lbzupHovqfr3g1jathHEQH
    z9KXzncSzZAMiYxk8dtNWF1BmfS03rEs5w8HpukKXMnwzZfypNCVRkyn67Rnf1GY9T1W
    M9xhWMSSVwOqPKKbi/GuN9xkZ0cHzxvxRn7Xvpe0BAjFsD33TExNugCMzErwk7VgoORd
    QNG22PxZAYeD2XG26JwL9jsVlDaF9bjrbp5SyDt2eWDZkVRvNCRi/LG4S7ouPO8IU+HB
    fMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738073753;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=6+FFDMnFMkrA8wSKIFiEbNLT+sTX2ENPHcGK1OU85ZQ=;
    b=GaMGSgR7TgkvNQEH34iKmvWlh3A08beaWVaHay+wwgxNFHSLR9tY9/FVXDc6gI2F5w
    408zIR7x9bTOt5MR/fp/9BUyKgagiXM6VbaIQjaoM7UDYZpm06VztaDmrhOFuMIL+q3I
    qgkjv30wXjCiz1Jfh2AfvTytF2Wcq5Ilz7SVDMHK8JXtg4BxIeOzZZQ/pQYpWHrwnoNe
    XV2VYK6i2Kkg153S33aB2Mfea58mqcbPN7zNMGXZK34gQzyA6bJ7HICcPxWVhhw2p2xR
    iyrli/a9W5QJQ2Cqege7eKZzMqdHqMqVQi3Ehcqymar4yNtjMmJxkWbOdM4TDudMqbn5
    8KRw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738073753;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=6+FFDMnFMkrA8wSKIFiEbNLT+sTX2ENPHcGK1OU85ZQ=;
    b=E+Tv7aCOWB1/OhUhrS7xsRQeiH6XduGJG+OuK3jutS/X00zL1caFicCfrlYUWh7WFr
    jOk8eFqiPQiNwIKsL4dNulrHtSI5WWfllInD8bH4A2JYfSc/CDo5EucwGnuM0hzEh4+z
    +dBoibm5+NcCRSVbO7Pn345BHv5O0Fwy+dvQaqdRGZ30hXsyqCS6pproEjy/44AVHjlB
    WiFXCG9PWv3z89OcxU5auFwghC/ZPJYf9Ye20snA7atfgbhbxvXSr0jWdZX+SE9eXV5j
    0ECv6Xa8bksz2qNRXReEpINrt5BXDsORl3CcefL4UKniQlGRVE+78W+CC0Nqj87Zvl0k
    a37w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738073753;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=6+FFDMnFMkrA8wSKIFiEbNLT+sTX2ENPHcGK1OU85ZQ=;
    b=DTnr2/AyUXOJF0komU3MnoVlPvFGTpzEJDnPfFNnYS4WnGzIPUdTAiJvSdrNQwZY7p
    3DSVayn8QMVlPaQJk9CA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OmD4uXd0fmxSoJ8/RK6b07KGriu4yBf+6JptMSdiuOzXC/d"
Date: Tue, 28 Jan 2025 15:15:44 +0100
From: Olaf Hering <olaf@aepfle.de>
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, jgross@suse.com,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>
Subject: slow start of Pod HVM domU with qemu 9.1
Message-ID: <20250128151544.26fc827d.olaf@aepfle.de>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3_gYOUqZaZS0d84viqP81qM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/3_gYOUqZaZS0d84viqP81qM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

starting with qemu 9.1 a PoD HVM domU takes a long time to start.
Depending on the domU kernel, it may trigger a warning, which prompted me
to notice this change in behavior:

[    0.000000] Linux version 4.12.14-120-default (geeko@buildhost) (gcc ver=
sion 4.8.5 (SUSE Linux) ) #1 SMP Thu Nov 7 16:39:09 UTC 2019 (fd9dc36)
...
[    1.096432] HPET: 3 timers in total, 0 timers will be used for per-cpu t=
imer
[    1.101636] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.104051] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
[   16.136086] random: crng init done
[   31.712052] BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 n=
ice=3D0 stuck for 30s!
[   31.716029] Showing busy workqueues and worker pools:
[   31.721164] workqueue events: flags=3D0x0
[   31.724054]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2/2=
56
[   31.728000]     in-flight: 17:balloon_process
[   31.728000]     pending: hpet_work
[   31.728023] workqueue mm_percpu_wq: flags=3D0x8
[   31.732987]   pwq 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1/2=
56
[   31.736000]     pending: vmstat_update
[   31.736024] pool 2: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D30s wo=
rkers=3D2 idle: 34
[   50.400102] clocksource: Switched to clocksource xen
[   50.441153] VFS: Disk quotas dquot_6.6.0
...

With qemu 9.0 and older, this domU will start the /init task after 8 second=
s.

The change which caused this commit is qemu.git commit 9ecdd4bf08dfe4a37e16=
b8a8b228575aff641468
Author:     Edgar E. Iglesias <edgar.iglesias@amd.com>
AuthorDate: Tue Apr 30 10:26:45 2024 +0200
Commit:     Edgar E. Iglesias <edgar.iglesias@amd.com>
CommitDate: Sun Jun 9 20:16:14 2024 +0200

    xen: mapcache: Add support for grant mappings

As you can see, v4 instead of v5 was apparently applied.
This was probably unintentional, but would probably not change the result.

With this change the domU starts fast again:

--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -522,6 +522,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     ram_addr_t addr;
=20
     addr =3D xen_ram_addr_from_mapcache_single(mapcache, ptr);
+    if (1)
     if (addr =3D=3D RAM_ADDR_INVALID) {
         addr =3D xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
     }
@@ -626,6 +627,7 @@ static void xen_invalidate_map_cache_entry_single(MapCa=
che *mc, uint8_t *buffer)
 static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
 {
     xen_invalidate_map_cache_entry_single(mapcache, buffer);
+    if (1)
     xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
 }
=20
@@ -700,6 +702,7 @@ void xen_invalidate_map_cache(void)
     bdrv_drain_all();
=20
     xen_invalidate_map_cache_single(mapcache);
+    if (0)
     xen_invalidate_map_cache_single(mapcache_grants);
 }
=20
I did the testing with libvirt, the domU.cfg equivalent looks like this:
maxmem =3D 4096
memory =3D 2048
maxvcpus =3D 4
vcpus =3D 2
pae =3D 1
acpi =3D 1
apic =3D 1
viridian =3D 0
rtc_timeoffset =3D 0
localtime =3D 0
on_poweroff =3D "destroy"
on_reboot =3D "destroy"
on_crash =3D "destroy"
device_model_override =3D "/usr/lib64/qemu-9.1/bin/qemu-system-i386"
sdl =3D 0
vnc =3D 1
vncunused =3D 1
vnclisten =3D "127.0.0.1"
vif =3D [ "mac=3D52:54:01:23:63:29,bridge=3Dbr0,script=3Dvif-bridge" ]
parallel =3D "none"
serial =3D "pty"
builder =3D "hvm"
kernel =3D "/bug1236329/linux"
ramdisk =3D "/bug1236329/initrd"
cmdline =3D "console=3DttyS0,115200n8 quiet ignore_loglevel""
boot =3D "c"=20
disk =3D [ "format=3Dqcow2,vdev=3Dhda,access=3Drw,backendtype=3Dqdisk,targe=
t=3D/bug1236329/sles12sp5.qcow2" ]
usb =3D 1
usbdevice =3D "tablet"

Any idea what can be done to restore boot times?


Olaf

--Sig_/3_gYOUqZaZS0d84viqP81qM
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmeY5pAACgkQ86SN7mm1
DoCFOw//W5Fcozw9uIT8fIzv1P9oQEP/KA/H4M25Z1+GmV9jQE2Teo6ycS7FkL0+
ule3smRYAOS5JOeCuQaomUVMbbMZl8LWOnYKl0cGO6Z+WPWgam6Z0B1Qnkba2KwJ
OWxVewxsDL2LgvBc+B7aw4BYhxtcMQq0DhFqr/9BdFFJmvI7q3iOTyfh8WzoJGXH
uGS53lWtxKf8xS3ZrdlEP0hZJpveFlaMENw1DS9fWvV04TuBQYxnUhQt1uBg0kVg
5ZLlB1W8+gsaHzH9PZuBB0kzmQiYmOQV4KuQw9Yxs5oRvJiiZADvTi2kXmk8ihp3
+DCF1aSk4piqqap1uCgYu7Xow2pd7p8SbpMXh7qjdAN3yqbaJ46hC6cOad/RsMFC
1k8zMSmRuB/zs0Pd0g/ZlPrBk5YMsIth0H9405qYnOcDL2zN+9u614GyZkDhd+JW
POXsphk0ZNPju5ZeVNtQWCRJtGu2LzEVxYziSqoQl9gFT4BYoPzCAKI/Gg5XAQFZ
w9tPJ2mxyiStXStazMIZPcYovMjVxPNB7rPVNUkoHedqIGqHtXJMICLkN3jvub9D
NmrUJvklZp/lMY7qoDL8RZ0H1NYYZ0ycs+LB4LVoILZQk18YrJFT3scyFF3ImpaC
1pYwbfYbh/RBwIu6tQoPRYMy/03XwQubbr77j+NbK9JjjSG0Kv8=
=Duhj
-----END PGP SIGNATURE-----

--Sig_/3_gYOUqZaZS0d84viqP81qM--

