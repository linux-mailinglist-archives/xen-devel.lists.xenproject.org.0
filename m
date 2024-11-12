Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB79C5CFE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 17:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834784.1250619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAtZg-0002Rc-4Y; Tue, 12 Nov 2024 16:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834784.1250619; Tue, 12 Nov 2024 16:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAtZg-0002OP-0N; Tue, 12 Nov 2024 16:17:04 +0000
Received: by outflank-mailman (input) for mailman id 834784;
 Tue, 12 Nov 2024 16:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wkFt=SH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tAtZe-0002O9-Ss
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 16:17:03 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b6adebf-a111-11ef-a0c7-8be0dac302b0;
 Tue, 12 Nov 2024 17:16:59 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fb3c3d5513so52388451fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 08:16:59 -0800 (PST)
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
X-Inumbo-ID: 8b6adebf-a111-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmUiLCJoZWxvIjoibWFpbC1sajEteDIyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhiNmFkZWJmLWExMTEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDI4MjE5LjgzNjA3Mywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731428219; x=1732033019; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BFyKybdgHjLq0U2sDrNggPuZnV0JhhGBzsJ1QhvXXwM=;
        b=iidahvOBXixSNMrOrGe8LDNToCi2i/fb+n++nqzyZvMgxVh897xXJFeenNT08uUveH
         hmufmDmxY6dS2/ZKcaBThzLqB1iexyOFRViJMOPkAOHvdUJ3BTCh8vxik1hFshbKLqfH
         7IxKozS8y6V1UWT7TobJAmVhD44g8aP7X1PifheR8Ai1nzZHC+kNU3/pgahaOWX/f9Pr
         siOu6HzgihAxeACgYZ4HSQoRnXGH5CsIcPqwOqHZyZXIg99V4RktMuok7Ul0AnGHcfGP
         TySxkDi/3mpw3xD2EpFabeThrvfLlm2WGdZN1eZypZH7cHgOnL7Eu4O1W9KU9kVjalXK
         t+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731428219; x=1732033019;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFyKybdgHjLq0U2sDrNggPuZnV0JhhGBzsJ1QhvXXwM=;
        b=VVhAsaKDPhiJL0B0faXTxfmedbe/a7V6xiLPVlNNwaHgMAHB0xBvGk0DXI1IPEZXu7
         5KEO8/IJQtJ3TWSMC2vQdhaU/tWleA8sGU+mX6Dh6ci+TSK0DDt3wF3Mjy3KUkNvi/iP
         iHepJK3X9t5c61zHpGyOuZYmVggnRapeqQkiJlw1u4oQWn3E/Vi7GCiT07JksI9jTYbC
         gMuJs477e+J9aeFOGRh8Cf0vEd5TxoAStRytCpHLEQSMiTVYPKmiO84MgVBPPxLfxoXw
         /PsgTDpkgqPQbb0F2lQySEBGYRDG04n0zPm96oaE9szHDotbVje7W9/HJjz5ac7QwyPr
         KYlw==
X-Gm-Message-State: AOJu0Yy/NCr38a6m6b5F/TEQ+NdZbGQpTxgjpzRaSyjWFJugd3u5awLm
	S7q5qaeB0EPxpIqPyqsTdyT+YlKLJi8RtYtXT+BMOm7bMZzbxAuWGhGF2TR40p/iyl2b6af1tMQ
	z0tI7k1SgZhevo6H5aAKuaCsuH1aHFsO7K1U=
X-Google-Smtp-Source: AGHT+IFbh4aZ0T0Q7oW7VD7laoFL3Qj+T/l6hYJpD7/rVlPyzpsI0GVxhSiHAnIFAZDSFlPy+Dt27yHOVVgKnNo8bYk=
X-Received: by 2002:a05:651c:544:b0:2f6:6074:db71 with SMTP id
 38308e7fff4ca-2ff2016d2a1mr61590561fa.17.1731428217725; Tue, 12 Nov 2024
 08:16:57 -0800 (PST)
MIME-Version: 1.0
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date: Tue, 12 Nov 2024 17:16:21 +0100
Message-ID: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
Subject: Xen 4.20 Development Update [August-October]
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000df32d70626b98bca"

--000000000000df32d70626b98bca
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

This email only tracks big items for xen.git tree. Please reply for items
you
would like to see in 4.20 so that people have an idea what is going on and
prioritise accordingly.

You're welcome to provide description and use cases of the feature you're
working on.

= Timeline =

---> We are here
* Last posting date: Nov 29, 2024
* Feature freeze date: Dec 20, 2024
* Hard code freeze: Jan 17, 2025
* RC1: TBD
* Release: Feb 21, 2025
( current release schedule:
https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes )

All patches that wish to go into 4.20 must be posted no later than the last
posting
date. All patches posted after that date will be automatically queued
into next release.

RCs will be arranged immediately after freeze.

= Projects =

== Hypervisor ==

*  Remove the directmap (v4)
  -  Elias El Yandouzi
  -
https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1dfc@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8

*  remove libxenctrl usage from xenstored (v1)
  -  Juergen Gross
  -
https://lore.kernel.org/xen-devel/20241023131005.32144-1-jgross@suse.com/T/#md016c48a0889740d1822aa68f7f33d4ad48f4805

*  automation: Refresh the remaining Debian containers (v2)
  -  Javi Merino
  -
https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e

*  Move gic_preinit() to common code (v2)
  -  Oleksii Kurochko
  -
https://lore.kernel.org/xen-devel/2fe01b5a-aebb-4141-9cdd-887b5984d6b8@suse.com/T/#m8144a030ef64a479068482c864c9258a5cb43a87

*  stubdom: reduce xenstore library dependencies (v1)
  -  Juergen Gross
  -
https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83

*  xen: address violations of MISRA C Rule 13.6 (v2)
  -  Federico Serafini
  -
https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.serafini@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29

=== x86 ===

*  Expose consistent topology to guests (v7)
  -  Alejandro Vallejo
  -
https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b

*  Boot modules for Hyperlaunch (v8)
  -  Daniel P. Smith
  -
https://lore.kernel.org/xen-devel/20241102172551.17233-1-dpsmith@apertussolutions.com/T/#m94a2f6b9d410c6d624aaebd7c2bf85584c74383e

*  x86/mm: miscellaneous fixes (v2)
  -  Roger Pau Monne
  -
https://lore.kernel.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m2df34239b793501c6246c85c4b00e52f9c439ac0

*  x86/ucode: Simplify/fix loading paths further (v1)
  -  Andrew Cooper
  -
https://lore.kernel.org/xen-devel/20241107122117.4073266-1-andrew.cooper3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625d1

*  Address Space Isolation FPU preparations (v2)
  -  Alejandro Vallejo
  -
https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d

*  Fix module-handling use-after-free's (v2)
  -  Andrew Cooper
  -
https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed

*  Reuse 32 bit C code more safely (v4)
  -  Frediano Ziglio
  -
https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7

*  x86/alternatives: Adjust all insn-relative fields (v2)
  -  Andrew Cooper
  -
https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129

*  x86: address violations of MISRA C Rule 16.3 (v1)
  -  Federico Serafini
  -
https://lore.kernel.org/xen-devel/cover.1725958416.git.federico.serafini@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be01ab6

*  Support device passthrough when dom0 is PVH on Xen (v16)
  -  Jiqian Chen
  -
https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526

*  x86emul: misc additions (v5)
  -  Jan Beulich
  -
https://lore.kernel.org/xen-devel/0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe780e

*  x86/HVM: drop stdvga caching mode (v2)
  -  Jan Beulich
  -
https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117

*  x86/HVM: emulation (MMIO) improvements (v1)
  -  Jan Beulich
  -
https://lore.kernel.org/xen-devel/31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com/T/#mdae2f21b929170d60a8640e82857700c940e65c7

=== ARM ===

*  Enable early bootup of AArch64 MPU systems (v5)
  -  Ayan Kumar Halder
  -
https://lore.kernel.org/xen-devel/20241107150330.181143-1-ayan.kumar.halder@amd.com/T/#m9cfd8bed109cc703b6ae8b8b6faaa116c08598ee

*  Add support for S32CC platforms and LINFlexD UART (v2)
  -  Andrei Cherechesu
  -
https://lore.kernel.org/xen-devel/20240930114715.642978-1-andrei.cherechesu@oss.nxp.com/T/#m8452ac342fdcf989fc1e498c097812b50157f2cc

*  Arm cache coloring (v9)
  -  Carlo Nonato
  -
https://lore.kernel.org/xen-devel/20241025095014.42376-1-carlo.nonato@minervasys.tech/T/#md18fb02842c4ad2cd61b456be89020affcc452a3

*  ffa: Improvements and fixes (v2)
  -  Bertrand Marquis
  -
https://lore.kernel.org/xen-devel/cover.1729066788.git.bertrand.marquis@arm.com/T/#mb0c8aab97d46f9c9e933b3b9b0eef7e717e1f2e5

*  Add Virtio-PCI for dom0less on ARM (v1)
  -  Edgar E. Iglesias
  -
https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b

=== RISCV ===

*  Setup memory management (v5)
  -  Oleksii Kurochko
  -
https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kurochko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28

=== PPC ===

*  Early Boot Allocation on Power (v5)
  -  Shawn Anastasio
  -
https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d

== Completed ==

=== Hypervisor ===

*  libxl: Implement QEMU command line probe (v1)
  -  Anthony PERARD
  -
https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.perard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb

*  xen/bitops: hweight() cleanup/improvements (v3)
  -  Andrew Cooper
  -
https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.cooper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4

*  Move percpu code to common (v2)
  -  Oleksii Kurochko
  -
https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kurochko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f

*  xen/livepatch: improvements to loading (v3)
  -  Roger Pau Monne
  -
https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau@citrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7

*  Move {acpi_}device_init() and device_get_class() to common code (v5)
  -  Oleksii Kurochko
  -
https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5ceca0c15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829

*  blkif: reconcile protocol specification with in-use implementations (v1)
  -  Roger Pau Monne
  -
https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau@citrix.com/

=== x86 ===

*  Drop Xeon Phi support (v1)
  -  Jan Beulich
  -
https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53ffd0@suse.com/

*  Utilize ucode_force and remove opt_ucode_allow_same (v7)
  -  Fouad Hilly
  -
https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hilly@cloud.com/

*  Switch flat driver to use phys dst for ext ints (v2)
  -  Matthew Barnes
  -
https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com/

*  x86/shutdown: change default reboot method preference (v1)
  -  Roger Pau Monne
  -
https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau@citrix.com/

=== ARM ===

*  iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support (v1)
  -  Grygorii Strashko
  -
https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd549@xen.org/T/#t

*  xen/arm: dt overlay fixes (v2)
  -  Michal Orzel
  -
https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orzel@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078

=== RISC-V ===

*  initialize bootinfo from dtb (v2)
  -  Oleksii Kurochko
  -
https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kurochko@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316

*  Register Xen's load address as a boot module (v3)
  -  Oleksii Kurochko
  -
https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kurochko@gmail.com/T/#t

*  device tree mapping (v9)
  -  Oleksii Kurochko
  -
https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kurochko@gmail.com/T/#t

--000000000000df32d70626b98bca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div><br></div>This email only t=
racks big items for xen.git tree. Please reply for items you<br>would like =
to see in 4.20 so that people have an idea what is going on and<br>prioriti=
se accordingly.<br><br>You&#39;re welcome to provide description and use ca=
ses of the feature you&#39;re<br>working on.<br><br>=3D Timeline =3D<br><br=
>---&gt; We are here<br>* Last posting date: Nov 29, 2024<br>* Feature free=
ze date: Dec 20, 2024<br>* Hard code freeze: Jan 17, 2025<br>* RC1: TBD<br>=
* Release: Feb 21, 2025<br>( current release schedule: <a href=3D"https://w=
iki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">https://wiki.xenpro=
ject.org/wiki/Xen_Project_X.YY_Release_Notes</a> )<br><br>All patches that =
wish to go into 4.20 must be posted no later than the last posting<br>date.=
 All patches posted after that date will be automatically queued<br>into ne=
xt release.<br><br>RCs will be arranged immediately after freeze.<br><br>=
=3D Projects =3D<br><br>=3D=3D Hypervisor =3D=3D <br><br>* =C2=A0Remove the=
 directmap (v4)<br>=C2=A0 - =C2=A0Elias El Yandouzi<br>=C2=A0 - =C2=A0<a hr=
ef=3D"https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1df=
c@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8">https://lore.ker=
nel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1dfc@citrix.com/T/#m9733a=
a717edf032db0cf8f8f6763537b4f30c1f8</a><br><br>* =C2=A0remove libxenctrl us=
age from xenstored (v1)<br>=C2=A0 - =C2=A0Juergen Gross<br>=C2=A0 - =C2=A0<=
a href=3D"https://lore.kernel.org/xen-devel/20241023131005.32144-1-jgross@s=
use.com/T/#md016c48a0889740d1822aa68f7f33d4ad48f4805">https://lore.kernel.o=
rg/xen-devel/20241023131005.32144-1-jgross@suse.com/T/#md016c48a0889740d182=
2aa68f7f33d4ad48f4805</a><br><br>* =C2=A0automation: Refresh the remaining =
Debian containers (v2)<br>=C2=A0 - =C2=A0Javi Merino<br>=C2=A0 - =C2=A0<a h=
ref=3D"https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@c=
loud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e">https://lore.kernel.=
org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c=
2be3d6527de14b69b07812314e</a><br><br>* =C2=A0Move gic_preinit() to common =
code (v2)<br>=C2=A0 - =C2=A0Oleksii Kurochko<br>=C2=A0 - =C2=A0<a href=3D"h=
ttps://lore.kernel.org/xen-devel/2fe01b5a-aebb-4141-9cdd-887b5984d6b8@suse.=
com/T/#m8144a030ef64a479068482c864c9258a5cb43a87">https://lore.kernel.org/x=
en-devel/2fe01b5a-aebb-4141-9cdd-887b5984d6b8@suse.com/T/#m8144a030ef64a479=
068482c864c9258a5cb43a87</a><br><br>* =C2=A0stubdom: reduce xenstore librar=
y dependencies (v1)<br>=C2=A0 - =C2=A0Juergen Gross<br>=C2=A0 - =C2=A0<a hr=
ef=3D"https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.=
com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83">https://lore.kernel.org/x=
en-devel/20241010155459.22389-1-jgross@suse.com/T/#m8b5af386e2d288961bb6e8f=
7839650e0cab96a83</a><br><br>* =C2=A0xen: address violations of MISRA C Rul=
e 13.6 (v2)<br>=C2=A0 - =C2=A0Federico Serafini<br>=C2=A0 - =C2=A0<a href=
=3D"https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.serafin=
i@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29">https://lore.ke=
rnel.org/xen-devel/cover.1727690180.git.federico.serafini@bugseng.com/T/#mb=
ec702db211240305e0d35649e65627d9fa75a29</a><br><br>=3D=3D=3D x86 =3D=3D=3D =
<br><br>* =C2=A0Expose consistent topology to guests (v7)<br>=C2=A0 - =C2=
=A0Alejandro Vallejo<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/x=
en-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660=
675039d7789d3af1ba2f292a3a69b">https://lore.kernel.org/xen-devel/2024102115=
4600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2=
f292a3a69b</a><br><br>* =C2=A0Boot modules for Hyperlaunch (v8)<br>=C2=A0 -=
 =C2=A0Daniel P. Smith<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org=
/xen-devel/20241102172551.17233-1-dpsmith@apertussolutions.com/T/#m94a2f6b9=
d410c6d624aaebd7c2bf85584c74383e">https://lore.kernel.org/xen-devel/2024110=
2172551.17233-1-dpsmith@apertussolutions.com/T/#m94a2f6b9d410c6d624aaebd7c2=
bf85584c74383e</a><br><br>* =C2=A0x86/mm: miscellaneous fixes (v2)<br>=C2=
=A0 - =C2=A0Roger Pau Monne<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kerne=
l.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m2df34239b793501c6246c85c4b00e5=
2f9c439ac0">https://lore.kernel.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m=
2df34239b793501c6246c85c4b00e52f9c439ac0</a><br><br>* =C2=A0x86/ucode: Simp=
lify/fix loading paths further (v1)<br>=C2=A0 - =C2=A0Andrew Cooper <br>=C2=
=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/20241107122117.407=
3266-1-andrew.cooper3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625=
d1">https://lore.kernel.org/xen-devel/20241107122117.4073266-1-andrew.coope=
r3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625d1</a><br><br>* =C2=
=A0Address Space Isolation FPU preparations (v2)<br>=C2=A0 - =C2=A0Alejandr=
o Vallejo<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/20=
241105143310.28301-1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005=
a083e5ff28ebe6317d">https://lore.kernel.org/xen-devel/20241105143310.28301-=
1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d<=
/a><br><br>* =C2=A0Fix module-handling use-after-free&#39;s (v2)<br>=C2=A0 =
- =C2=A0Andrew Cooper <br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org=
/xen-devel/20241106003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf6=
3b034a6493bf62beeead280b92a38ed">https://lore.kernel.org/xen-devel/20241106=
003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeea=
d280b92a38ed</a><br><br>* =C2=A0Reuse 32 bit C code more safely (v4)<br>=C2=
=A0 - =C2=A0Frediano Ziglio<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kerne=
l.org/xen-devel/20241014085332.3254546-1-frediano.ziglio@cloud.com/T/#m53e3=
6815ddec2511ddd1fa8d1a7ed9a27c0cd0f7">https://lore.kernel.org/xen-devel/202=
41014085332.3254546-1-frediano.ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8=
d1a7ed9a27c0cd0f7</a><br><br>* =C2=A0x86/alternatives: Adjust all insn-rela=
tive fields (v2)<br>=C2=A0 - =C2=A0Andrew Cooper <br>=C2=A0 - =C2=A0<a href=
=3D"https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.coope=
r3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129">https://lore.ke=
rnel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#ma=
c2deaea7e02a343210d61887486433d946ad129</a><br><br>* =C2=A0x86: address vio=
lations of MISRA C Rule 16.3 (v1)<br>=C2=A0 - =C2=A0Federico Serafini<br>=
=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/cover.172595841=
6.git.federico.serafini@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be=
01ab6">https://lore.kernel.org/xen-devel/cover.1725958416.git.federico.sera=
fini@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be01ab6</a><br><br>* =
=C2=A0Support device passthrough when dom0 is PVH on Xen (v16)<br>=C2=A0 - =
=C2=A0Jiqian Chen<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-=
devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550=
c1443cab5774d397e526">https://lore.kernel.org/xen-devel/20240930034250.2682=
265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526</a><=
br><br>* =C2=A0x86emul: misc additions (v5)<br>=C2=A0 - =C2=A0Jan Beulich<b=
r>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/0b9a0ae8-a39c=
-49d8-b4e7-f2a463128058@suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe78=
0e">https://lore.kernel.org/xen-devel/0b9a0ae8-a39c-49d8-b4e7-f2a463128058@=
suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe780e</a><br><br>* =C2=A0x8=
6/HVM: drop stdvga caching mode (v2)<br>=C2=A0 - =C2=A0Jan Beulich<br>=C2=
=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6=
-8fbc-67a177a1e171@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117">h=
ttps://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.=
com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117</a><br><br>* =C2=A0x86/HVM=
: emulation (MMIO) improvements (v1)<br>=C2=A0 - =C2=A0Jan Beulich<br>=C2=
=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/31906cba-8646-4cf9=
-ab31-1d23654df8d1@suse.com/T/#mdae2f21b929170d60a8640e82857700c940e65c7">h=
ttps://lore.kernel.org/xen-devel/31906cba-8646-4cf9-ab31-1d23654df8d1@suse.=
com/T/#mdae2f21b929170d60a8640e82857700c940e65c7</a><br><br>=3D=3D=3D ARM =
=3D=3D=3D <br><br>* =C2=A0Enable early bootup of AArch64 MPU systems (v5)<b=
r>=C2=A0 - =C2=A0Ayan Kumar Halder<br>=C2=A0 - =C2=A0<a href=3D"https://lor=
e.kernel.org/xen-devel/20241107150330.181143-1-ayan.kumar.halder@amd.com/T/=
#m9cfd8bed109cc703b6ae8b8b6faaa116c08598ee">https://lore.kernel.org/xen-dev=
el/20241107150330.181143-1-ayan.kumar.halder@amd.com/T/#m9cfd8bed109cc703b6=
ae8b8b6faaa116c08598ee</a><br><br>* =C2=A0Add support for S32CC platforms a=
nd LINFlexD UART (v2)<br>=C2=A0 - =C2=A0Andrei Cherechesu <br>=C2=A0 - =C2=
=A0<a href=3D"https://lore.kernel.org/xen-devel/20240930114715.642978-1-and=
rei.cherechesu@oss.nxp.com/T/#m8452ac342fdcf989fc1e498c097812b50157f2cc">ht=
tps://lore.kernel.org/xen-devel/20240930114715.642978-1-andrei.cherechesu@o=
ss.nxp.com/T/#m8452ac342fdcf989fc1e498c097812b50157f2cc</a><br><br>* =C2=A0=
Arm cache coloring (v9)<br>=C2=A0 - =C2=A0Carlo Nonato<br>=C2=A0 - =C2=A0<a=
 href=3D"https://lore.kernel.org/xen-devel/20241025095014.42376-1-carlo.non=
ato@minervasys.tech/T/#md18fb02842c4ad2cd61b456be89020affcc452a3">https://l=
ore.kernel.org/xen-devel/20241025095014.42376-1-carlo.nonato@minervasys.tec=
h/T/#md18fb02842c4ad2cd61b456be89020affcc452a3</a><br><br>* =C2=A0ffa: Impr=
ovements and fixes (v2)<br>=C2=A0 - =C2=A0Bertrand Marquis<br>=C2=A0 - =C2=
=A0<a href=3D"https://lore.kernel.org/xen-devel/cover.1729066788.git.bertra=
nd.marquis@arm.com/T/#mb0c8aab97d46f9c9e933b3b9b0eef7e717e1f2e5">https://lo=
re.kernel.org/xen-devel/cover.1729066788.git.bertrand.marquis@arm.com/T/#mb=
0c8aab97d46f9c9e933b3b9b0eef7e717e1f2e5</a><br><br>* =C2=A0Add Virtio-PCI f=
or dom0less on ARM (v1)<br>=C2=A0 - =C2=A0Edgar E. Iglesias<br>=C2=A0 - =C2=
=A0<a href=3D"https://lore.kernel.org/xen-devel/20240924162359.1390487-1-ed=
gar.iglesias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b">https:=
//lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesias@gmail.c=
om/T/#mfa148991b9408f223a079d4cef610244d5b04c2b</a><br><br>=3D=3D=3D RISCV =
=3D=3D=3D <br><br>* =C2=A0Setup memory management (v5)<br>=C2=A0 - =C2=A0Ol=
eksii Kurochko<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-dev=
el/cover.1731344883.git.oleksii.kurochko@gmail.com/T/#m9f76f1b685896ea603a2=
b153e05104c7405a7d28">https://lore.kernel.org/xen-devel/cover.1731344883.gi=
t.oleksii.kurochko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28</=
a><br><br>=3D=3D=3D PPC =3D=3D=3D <br><br>* =C2=A0Early Boot Allocation on =
Power (v5)<br>=C2=A0 - =C2=A0Shawn Anastasio<br>=C2=A0 - =C2=A0<a href=3D"h=
ttps://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptorengi=
neering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d">https://lore.kern=
el.org/xen-devel/cover.1727388925.git.sanastasio@raptorengineering.com/T/#m=
8cac91a93b56a359fa2d5f08596c4be61dca290d</a><br><br>=3D=3D Completed =3D=3D=
 <br><br>=3D=3D=3D Hypervisor =3D=3D=3D <br><br>* =C2=A0libxl: Implement QE=
MU command line probe (v1)<br>=C2=A0 - =C2=A0Anthony PERARD<br>=C2=A0 - =C2=
=A0<a href=3D"https://lore.kernel.org/xen-devel/20240827100328.23216-1-anth=
ony.perard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb">https:/=
/lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.perard@vates.tech=
/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb</a><br><br>* =C2=A0xen/bitops=
: hweight() cleanup/improvements (v3)<br>=C2=A0 - =C2=A0Andrew Cooper <br>=
=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/20240904225530.=
3888315-1-andrew.cooper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b=
586c4">https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.co=
oper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4</a><br><br>* =
=C2=A0Move percpu code to common (v2)<br>=C2=A0 - =C2=A0Oleksii Kurochko<br=
>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/cover.17271854=
95.git.oleksii.kurochko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70d=
a7f">https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kurochk=
o@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f</a><br><br>* =C2=
=A0xen/livepatch: improvements to loading (v3)<br>=C2=A0 - =C2=A0Roger Pau =
Monne<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/202409=
26101431.97444-1-roger.pau@citrix.com/T/#ma3f65948b065dc443aea2192873a3b3df=
a52a2d7">https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau=
@citrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7</a><br><br>* =C2=
=A0Move {acpi_}device_init() and device_get_class() to common code (v5)<br>=
=C2=A0 - =C2=A0Oleksii Kurochko<br>=C2=A0 - =C2=A0<a href=3D"https://lore.k=
ernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5ceca0c15e.camel@gmail.co=
m/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829">https://lore.kernel.org/xen=
-devel/17c7d988e45d7c82448b81fe66b01a5ceca0c15e.camel@gmail.com/T/#m68bd00d=
4f8b3724e83ba13024e94b15b58a28829</a><br><br>* =C2=A0blkif: reconcile proto=
col specification with in-use implementations (v1)<br>=C2=A0 - =C2=A0Roger =
Pau Monne<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/20=
240903141923.72241-1-roger.pau@citrix.com/">https://lore.kernel.org/xen-dev=
el/20240903141923.72241-1-roger.pau@citrix.com/</a><br><br>=3D=3D=3D x86 =
=3D=3D=3D <br><br>* =C2=A0Drop Xeon Phi support (v1)<br>=C2=A0 - =C2=A0Jan =
Beulich<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/4414=
7507-65a4-4f21-aada-fa647f53ffd0@suse.com/">https://lore.kernel.org/xen-dev=
el/44147507-65a4-4f21-aada-fa647f53ffd0@suse.com/</a><br><br>* =C2=A0Utiliz=
e ucode_force and remove opt_ucode_allow_same (v7)<br>=C2=A0 - =C2=A0Fouad =
Hilly<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/202408=
22130426.492931-4-fouad.hilly@cloud.com/">https://lore.kernel.org/xen-devel=
/20240822130426.492931-4-fouad.hilly@cloud.com/</a><br><br>* =C2=A0Switch f=
lat driver to use phys dst for ext ints (v2)<br>=C2=A0 - =C2=A0Matthew Barn=
es<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/0db68e62f=
fc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com/">h=
ttps://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d26bb5f.1=
728311378.git.matthew.barnes@cloud.com/</a><br><br>* =C2=A0x86/shutdown: ch=
ange default reboot method preference (v1)<br>=C2=A0 - =C2=A0Roger Pau Monn=
e<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/2024080210=
5613.99197-1-roger.pau@citrix.com/">https://lore.kernel.org/xen-devel/20240=
802105613.99197-1-roger.pau@citrix.com/</a><br><br>=3D=3D=3D ARM =3D=3D=3D =
<br><br>* =C2=A0iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support =
(v1)<br>=C2=A0 - =C2=A0Grygorii Strashko<br>=C2=A0 - =C2=A0<a href=3D"https=
://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd549@xen.org/T=
/#t">https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd549=
@xen.org/T/#t</a><br><br>* =C2=A0xen/arm: dt overlay fixes (v2)<br>=C2=A0 -=
 =C2=A0Michal Orzel<br>=C2=A0 - =C2=A0<a href=3D"https://lore.kernel.org/xe=
n-devel/20241004122220.234817-1-michal.orzel@amd.com/T/#md51a060b93fe72f176=
37d6d72e3d4e2296cb4078">https://lore.kernel.org/xen-devel/20241004122220.23=
4817-1-michal.orzel@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078</a=
><br><br>=3D=3D=3D RISC-V =3D=3D=3D <br><br>* =C2=A0initialize bootinfo fro=
m dtb (v2)<br>=C2=A0 - =C2=A0Oleksii Kurochko<br>=C2=A0 - =C2=A0<a href=3D"=
https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kurochko@gma=
il.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316">https://lore.kernel.or=
g/xen-devel/cover.1728481578.git.oleksii.kurochko@gmail.com/T/#m543bf84d47f=
0ea738938a9a442cd144bb34f7316</a><br><br>* =C2=A0Register Xen&#39;s load ad=
dress as a boot module (v3)<br>=C2=A0 - =C2=A0Oleksii Kurochko<br>=C2=A0 - =
=C2=A0<a href=3D"https://lore.kernel.org/xen-devel/cover.1728472163.git.ole=
ksii.kurochko@gmail.com/T/#t">https://lore.kernel.org/xen-devel/cover.17284=
72163.git.oleksii.kurochko@gmail.com/T/#t</a><br><br>* =C2=A0device tree ma=
pping (v9)<br>=C2=A0 - =C2=A0Oleksii Kurochko<br>=C2=A0 - =C2=A0<a href=3D"=
https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kurochko@gma=
il.com/T/#t">https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii=
.kurochko@gmail.com/T/#t</a></div>

--000000000000df32d70626b98bca--

