Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA76F31ACA4
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 16:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84643.158732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAwyG-0005QM-LW; Sat, 13 Feb 2021 15:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84643.158732; Sat, 13 Feb 2021 15:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAwyG-0005Px-I5; Sat, 13 Feb 2021 15:36:32 +0000
Received: by outflank-mailman (input) for mailman id 84643;
 Sat, 13 Feb 2021 15:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uKQL=HP=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1lAwyF-0005Ps-IX
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 15:36:31 +0000
Received: from mx1.somlen.de (unknown [89.238.87.226])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1707a3e-872d-46a8-8d6c-797b24671964;
 Sat, 13 Feb 2021 15:36:29 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id A6CECC36AAE;
 Sat, 13 Feb 2021 16:36:27 +0100 (CET)
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
X-Inumbo-ID: d1707a3e-872d-46a8-8d6c-797b24671964
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: pkg-xen-devel@lists.alioth.debian.org
Subject: [BUG] Linux pvh vm not getting destroyed on shutdown
Date: Sat, 13 Feb 2021 16:36:24 +0100
Message-ID: <2195346.r5JaYcbZso@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2014495.WFqFFtlU6v"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2014495.WFqFFtlU6v
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

after a recent upgrade of one of our test systems to Debian Bullseye we 
noticed an issue where on shutdown of a pvh vm the vm was not destroyed by xen 
automatically. It could still be destroyed by manually issuing a 'xl destroy 
$vm' command.

We can reproduce the hang reliably with the following vm configuration:

type = 'pvh'
memory = '512'
kernel = '/usr/lib/grub-xen/grub-i386-xen_pvh.bin'
[... disk/name/vif ]
on_poweroff = 'destroy'
on_reboot   = 'restart'
on_crash    = 'restart'
vcpus = '1'
maxvcpus = '2'

And then issuing a shutdown command in the vm (e.g. by calling 'poweroff')


Here are some things I noticed while trying to debug this issue:

* It happens on a Debian buster dom0 as well as on a bullseye dom0

* It seems to only affect pvh vms.

* shutdown from the pvgrub menu ("c" -> "halt") does work

* the vm seems to shut down normal, the last lines in the console are:

[  228.461167] systemd-shutdown[1]: All filesystems, swaps, loop devices, MD 
devices and DM devices detached.
[  228.476794] systemd-shutdown[1]: Syncing filesystems and block devices.
[  228.477878] systemd-shutdown[1]: Powering off.
[  233.709498] xenbus_probe_frontend: xenbus_frontend_dev_shutdown: device/
vif/0 timeout closing device
[  233.745642] reboot: System halted

* issuing a reboot instead of a shutdown does work fine.

* The issue started with Debian kernel 5.8.3+1~exp1 running in the vm, Debian 
kernel 5.7.17-1 does not show the issue.

* setting vcpus equal to maxvcpus does *not* show the hang.


Below is the output of "xl debug-keys q; xl dmesg" for the affected vm in the 
'hang' state as suggested by andyhhp on #xen to attach to this bug report:

(XEN) General information for domain 55:
(XEN)     refcnt=3 dying=0 pause_count=0
(XEN)     nr_pages=131088 xenheap_pages=4 shared_pages=0 paged_pages=0 
dirty_cpus={} max_pages=131328
(XEN)     handle=275e3a73-247f-4649-af86-6d5c0c72e8e4 vm_assist=00000020
(XEN)     paging assistance: hap refcounts translate external 
(XEN) Rangesets belonging to domain 55:
(XEN)     Interrupts { }
(XEN)     I/O Memory { }
(XEN)     I/O Ports  { }
(XEN)     log-dirty  { }
(XEN) Memory pages belonging to domain 55:
(XEN)     DomPage list too long to display
(XEN)     PoD entries=0 cachesize=0
(XEN)     XenPage 0000000000080125: caf=c000000000000001, taf=e400000000000001
(XEN)     XenPage 00000000001412c9: caf=c000000000000001, taf=e400000000000001
(XEN)     XenPage 0000000000140da0: caf=c000000000000001, taf=e400000000000001
(XEN)     XenPage 0000000000140d9a: caf=c000000000000001, taf=e400000000000001
(XEN)     ExtraPage 00000000001412d3: caf=8040000000000002, 
taf=e400000000000001
(XEN) NODE affinity for domain 55: [0]
(XEN) VCPU information and callbacks for domain 55:
(XEN)   UNIT0 affinities: hard={0-7} soft={0-3}
(XEN)     VCPU0: CPU2 [has=F] poll=0 upcall_pend=01 upcall_mask=00 
(XEN)     pause_count=0 pause_flags=2
(XEN)     paging assistance: hap, 4 levels
(XEN) No periodic timer
(XEN)   UNIT1 affinities: hard={0-7} soft={0-3}
(XEN)     VCPU1: CPU1 [has=F] poll=0 upcall_pend=00 upcall_mask=00 
(XEN)     pause_count=0 pause_flags=1
(XEN)     paging assistance: hap, 4 levels
(XEN) No periodic timer


Please let me know if more information is necessary.

Thanks,
Maxi

--nextPart2014495.WFqFFtlU6v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmAn8fgACgkQgepkfSQr
0hU3pw//SPKfPm7iQHDWRgsciWfTyZeYMDyO34L8YabVmsCkEm4pkvyuTK4DDdry
UjUspkyUtbCHmbRxWQXxa6elLkIeV2J3UMp+/iB8NNS9Kpfmjy1QVxnjWJe8J8uK
vpNs4+43aGdJCemimx9447PQCokBN5e5WPs6f4G+/qlBxdLY0VHSPCWvQHoeBJcq
cC58r13Vt+p0SM5dh6PUAmma9vaw9JbFtvNgTE3j/RZseq3EFWDOfRqpdTY+3rlx
YW1P++WsNMFNxk0wAS/lVURkwxXkSuLM/Aaj2aDFFlS06yU08w0vT9rQ0yORP0QV
ROAzCK4fHYBbs1TLMirEMscX/t/7/CymI/4cr1bKMaQrGAe8+9WnqqYpsThQZhMB
OR68IvVodMVKadYh4erZ7dmLH1VhjbZhSZcFHAGYEbNaRv7AUPP/BFWF+FdEncUk
bvc8A7v5FON206D0jKlyrCowMYAGsKQwYsn0i+8b9dri4Oj9YMtqHA9uWtCrbxyu
t+te0IilXS812b2zFrQDEYPF0od8kHrWb6qxt+29XF27Pp5oGn3VHll3Pf2Inh8U
SaV2aa87ipBShCc34tthWlLOb1x3cAuCCZolNPH1Zrfb3q8mkWelReSBLAfzA5Qt
0Vn+gzONGAOkLRNu8NA8wJomQfplLmjYiPudQH17X7RwLnr5acI=
=x4tO
-----END PGP SIGNATURE-----

--nextPart2014495.WFqFFtlU6v--




