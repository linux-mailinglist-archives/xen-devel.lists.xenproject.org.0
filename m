Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0E9D2801
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840241.1256046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDP91-0000ZV-So; Tue, 19 Nov 2024 14:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840241.1256046; Tue, 19 Nov 2024 14:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDP91-0000X0-Pn; Tue, 19 Nov 2024 14:23:55 +0000
Received: by outflank-mailman (input) for mailman id 840241;
 Tue, 19 Nov 2024 14:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDP8z-0000Ws-W9
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:23:53 +0000
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [2607:f8b0:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e511b93c-a681-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:23:50 +0100 (CET)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a6c2077afcso3529725ab.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:23:50 -0800 (PST)
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
X-Inumbo-ID: e511b93c-a681-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1pbDEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU1MTFiOTNjLWE2ODEtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI2MjMwLjQxNzY5Mywic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732026229; x=1732631029; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbHSjBYmkmM1jutoPn3CtmLMhYMymb2+df1ssYEt8bU=;
        b=Jjhchvgf4sOaTXUFDResGwDoF8xb/XVQVQCB69PgPxJQL73Ky8W75G6k9abb0Txue5
         7eoFEQdIioRrX3cH/QqOnf6NDOZ6q7u7Sslr5HYQXT1D3wUQr+FxdWkUbITpMZhpkof6
         XdlEHQdVNso19I+MTeiiVikusyP1ljBU8CUS+IEgegH6e+F3bIE2WfcXjFI8lol7aS5U
         zpCK/Xt60wGo8IPeZmGrSUkarSadh6DeOn+VKmo+PEF6SX9z4lP5FNcMhJOuR6a5gjXn
         +UhP5OB3DKxNE2bXDMaoUJ0/QynK2A+VLXMpgcuN7GAVSDfEisf+y5qKcn+8t9LF+FND
         qaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732026229; x=1732631029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbHSjBYmkmM1jutoPn3CtmLMhYMymb2+df1ssYEt8bU=;
        b=kswtZJDtAdcwrg1ca2K5cEL7xGVoNif17/8e5GrVBSpKtTcqWFymWLjJ/DVpWdYqqQ
         VRKTDZ6OeiyaZ9MAI9laEbHRtV1iSEN+xgjHE9OJF1PXPuUJRLskvgm4JMAdFWmhKgUu
         Yp/IrT1wNa3mc5diPrcdQhAQNxwXGHkj0stzRtcU90uPvf1+toamlaP4GD/o7W4BZq8p
         6ecVMqEjazwF2jgUBfVG1ms3mXlxwSccHGyFlWgAem2XxFWsfilyB2Bh/cis1MuNMvjP
         DkVX1bO3vnuvDcM9xFdyY5cmCxmZh7sXUCWU/Jb8mzknFiN5GHHDxO6CCcfQvdEBhBaD
         BwWQ==
X-Gm-Message-State: AOJu0YwB5KM6Zhyx9vT/Gz8vtsuSIyNH0b9q//fps+bJxIj5/IIDqrh6
	dMnRxhpcBen4PL3KsZGxmClK3uj8HodFxL+osJqspZwIKD1DKRk2TD9PS8RfXbkSeQ3rfKiNs5T
	IazFR1EaDejSMWrFgoXRO051hvhG9O44xFwXwKQ==
X-Google-Smtp-Source: AGHT+IFMe79JiybuXpZ4Jya9V7wWE3FTMJP+UnoJwcfzbW7/WeBYO9e9dD6N1x4vgHnPk2mZl20ee5et5n9MGYbVpow=
X-Received: by 2002:a05:6602:27c1:b0:835:45f9:c2ee with SMTP id
 ca18e2360f4ac-83e6c272e56mr1705233839f.4.1732026228928; Tue, 19 Nov 2024
 06:23:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
In-Reply-To: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 19 Nov 2024 15:23:37 +0100
Message-ID: <CAG+AhRW8FczMC1S2bzUsGLZozBiKXM1c5DALcAOc4=wuCGYc0Q@mail.gmail.com>
Subject: Re: Xen 4.20 Development Update [August-October]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Kelly Choi <kelly.choi@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I would like to see "Arm cache coloring" in 4.20. I just sent v10.

Best regards.

- Carlo Nonato

On Tue, Nov 12, 2024 at 5:16=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Hello everyone,
>
> This email only tracks big items for xen.git tree. Please reply for items=
 you
> would like to see in 4.20 so that people have an idea what is going on an=
d
> prioritise accordingly.
>
> You're welcome to provide description and use cases of the feature you're
> working on.
>
> =3D Timeline =3D
>
> ---> We are here
> * Last posting date: Nov 29, 2024
> * Feature freeze date: Dec 20, 2024
> * Hard code freeze: Jan 17, 2025
> * RC1: TBD
> * Release: Feb 21, 2025
> ( current release schedule: https://wiki.xenproject.org/wiki/Xen_Project_=
X.YY_Release_Notes )
>
> All patches that wish to go into 4.20 must be posted no later than the la=
st posting
> date. All patches posted after that date will be automatically queued
> into next release.
>
> RCs will be arranged immediately after freeze.
>
> =3D Projects =3D
>
> =3D=3D Hypervisor =3D=3D
>
> *  Remove the directmap (v4)
>   -  Elias El Yandouzi
>   -  https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1d=
fc@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8
>
> *  remove libxenctrl usage from xenstored (v1)
>   -  Juergen Gross
>   -  https://lore.kernel.org/xen-devel/20241023131005.32144-1-jgross@suse=
.com/T/#md016c48a0889740d1822aa68f7f33d4ad48f4805
>
> *  automation: Refresh the remaining Debian containers (v2)
>   -  Javi Merino
>   -  https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@c=
loud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
>
> *  Move gic_preinit() to common code (v2)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/2fe01b5a-aebb-4141-9cdd-887b5984d6=
b8@suse.com/T/#m8144a030ef64a479068482c864c9258a5cb43a87
>
> *  stubdom: reduce xenstore library dependencies (v1)
>   -  Juergen Gross
>   -  https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse=
.com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83
>
> *  xen: address violations of MISRA C Rule 13.6 (v2)
>   -  Federico Serafini
>   -  https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.sera=
fini@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29
>
> =3D=3D=3D x86 =3D=3D=3D
>
> *  Expose consistent topology to guests (v7)
>   -  Alejandro Vallejo
>   -  https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.v=
allejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b
>
> *  Boot modules for Hyperlaunch (v8)
>   -  Daniel P. Smith
>   -  https://lore.kernel.org/xen-devel/20241102172551.17233-1-dpsmith@ape=
rtussolutions.com/T/#m94a2f6b9d410c6d624aaebd7c2bf85584c74383e
>
> *  x86/mm: miscellaneous fixes (v2)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m2df34=
239b793501c6246c85c4b00e52f9c439ac0
>
> *  x86/ucode: Simplify/fix loading paths further (v1)
>   -  Andrew Cooper
>   -  https://lore.kernel.org/xen-devel/20241107122117.4073266-1-andrew.co=
oper3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625d1
>
> *  Address Space Isolation FPU preparations (v2)
>   -  Alejandro Vallejo
>   -  https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.v=
allejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d
>
> *  Fix module-handling use-after-free's (v2)
>   -  Andrew Cooper
>   -  https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.co=
oper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
>
> *  Reuse 32 bit C code more safely (v4)
>   -  Frediano Ziglio
>   -  https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.=
ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7
>
> *  x86/alternatives: Adjust all insn-relative fields (v2)
>   -  Andrew Cooper
>   -  https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.co=
oper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
>
> *  x86: address violations of MISRA C Rule 16.3 (v1)
>   -  Federico Serafini
>   -  https://lore.kernel.org/xen-devel/cover.1725958416.git.federico.sera=
fini@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be01ab6
>
> *  Support device passthrough when dom0 is PVH on Xen (v16)
>   -  Jiqian Chen
>   -  https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Ch=
en@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
>
> *  x86emul: misc additions (v5)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/0b9a0ae8-a39c-49d8-b4e7-f2a4631280=
58@suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe780e
>
> *  x86/HVM: drop stdvga caching mode (v2)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e1=
71@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117
>
> *  x86/HVM: emulation (MMIO) improvements (v1)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/31906cba-8646-4cf9-ab31-1d23654df8=
d1@suse.com/T/#mdae2f21b929170d60a8640e82857700c940e65c7
>
> =3D=3D=3D ARM =3D=3D=3D
>
> *  Enable early bootup of AArch64 MPU systems (v5)
>   -  Ayan Kumar Halder
>   -  https://lore.kernel.org/xen-devel/20241107150330.181143-1-ayan.kumar=
.halder@amd.com/T/#m9cfd8bed109cc703b6ae8b8b6faaa116c08598ee
>
> *  Add support for S32CC platforms and LINFlexD UART (v2)
>   -  Andrei Cherechesu
>   -  https://lore.kernel.org/xen-devel/20240930114715.642978-1-andrei.che=
rechesu@oss.nxp.com/T/#m8452ac342fdcf989fc1e498c097812b50157f2cc
>
> *  Arm cache coloring (v9)
>   -  Carlo Nonato
>   -  https://lore.kernel.org/xen-devel/20241025095014.42376-1-carlo.nonat=
o@minervasys.tech/T/#md18fb02842c4ad2cd61b456be89020affcc452a3
>
> *  ffa: Improvements and fixes (v2)
>   -  Bertrand Marquis
>   -  https://lore.kernel.org/xen-devel/cover.1729066788.git.bertrand.marq=
uis@arm.com/T/#mb0c8aab97d46f9c9e933b3b9b0eef7e717e1f2e5
>
> *  Add Virtio-PCI for dom0less on ARM (v1)
>   -  Edgar E. Iglesias
>   -  https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.igl=
esias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b
>
> =3D=3D=3D RISCV =3D=3D=3D
>
> *  Setup memory management (v5)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kuroc=
hko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28
>
> =3D=3D=3D PPC =3D=3D=3D
>
> *  Early Boot Allocation on Power (v5)
>   -  Shawn Anastasio
>   -  https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@ra=
ptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
>
> =3D=3D Completed =3D=3D
>
> =3D=3D=3D Hypervisor =3D=3D=3D
>
> *  libxl: Implement QEMU command line probe (v1)
>   -  Anthony PERARD
>   -  https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.per=
ard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb
>
> *  xen/bitops: hweight() cleanup/improvements (v3)
>   -  Andrew Cooper
>   -  https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.co=
oper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4
>
> *  Move percpu code to common (v2)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kuroc=
hko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f
>
> *  xen/livepatch: improvements to loading (v3)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau@c=
itrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7
>
> *  Move {acpi_}device_init() and device_get_class() to common code (v5)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5cec=
a0c15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829
>
> *  blkif: reconcile protocol specification with in-use implementations (v=
1)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau@c=
itrix.com/
>
> =3D=3D=3D x86 =3D=3D=3D
>
> *  Drop Xeon Phi support (v1)
>   -  Jan Beulich
>   -  https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53ff=
d0@suse.com/
>
> *  Utilize ucode_force and remove opt_ucode_allow_same (v7)
>   -  Fouad Hilly
>   -  https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hill=
y@cloud.com/
>
> *  Switch flat driver to use phys dst for ext ints (v2)
>   -  Matthew Barnes
>   -  https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d=
26bb5f.1728311378.git.matthew.barnes@cloud.com/
>
> *  x86/shutdown: change default reboot method preference (v1)
>   -  Roger Pau Monne
>   -  https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau@c=
itrix.com/
>
> =3D=3D=3D ARM =3D=3D=3D
>
> *  iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support (v1)
>   -  Grygorii Strashko
>   -  https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd5=
49@xen.org/T/#t
>
> *  xen/arm: dt overlay fixes (v2)
>   -  Michal Orzel
>   -  https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orz=
el@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078
>
> =3D=3D=3D RISC-V =3D=3D=3D
>
> *  initialize bootinfo from dtb (v2)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kuroc=
hko@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316
>
> *  Register Xen's load address as a boot module (v3)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kuroc=
hko@gmail.com/T/#t
>
> *  device tree mapping (v9)
>   -  Oleksii Kurochko
>   -  https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kuroc=
hko@gmail.com/T/#t

