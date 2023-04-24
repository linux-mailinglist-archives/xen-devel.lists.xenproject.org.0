Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506E6ECBB4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 13:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525326.816460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquqM-0001pT-Vt; Mon, 24 Apr 2023 11:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525326.816460; Mon, 24 Apr 2023 11:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquqM-0001m8-Ra; Mon, 24 Apr 2023 11:58:54 +0000
Received: by outflank-mailman (input) for mailman id 525326;
 Mon, 24 Apr 2023 11:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azYu=AP=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1pquqM-0001m2-1w
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 11:58:54 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ffed148-e297-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 13:58:50 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-51b6d0b9430so3361423a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 04:58:50 -0700 (PDT)
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
X-Inumbo-ID: 5ffed148-e297-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682337529; x=1684929529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KbD1QziJYmCdG7Gp1WnaNfL53EuHpD5qn7OzxM32iAg=;
        b=IQUyCALtvByE9fS44ZHXx8F8RgPMzpRQKR1UOrfcgZH4Xn2mtnlqug0HthbvW2mvZJ
         Wgf9Odcl6vXYKfVLk7Hq1kGs1rEz3guOHjBXuiWV1AyUo7wtMqzrXHu7tV8QNMR0EOnm
         b94UNG9uUv7PPmRc30ZQSDl90kLhI0Ndv+kainf0NY/MyY2QsP9eO5XJYHEhNZFTiSJK
         P1+I2xtKvBPTpDz45Fxl1dzOeshAfQnqLUXmobJb3TAnR6QpuLxJJe3+5LClEyM7jaEf
         AMUSDodCcflaasVPPPFX0kkRMbYrRlVzX6Z4BsqldWcJnNfbLC8GFY2YRwwhhu9wxuV4
         nSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682337529; x=1684929529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbD1QziJYmCdG7Gp1WnaNfL53EuHpD5qn7OzxM32iAg=;
        b=e86v7zlkwXIzucbQsxhSajB4QGkWkThzQKEka9bEdkLQtg5Ly2FXcilk8CmqnwFlDq
         gKeUqp3PGW3CHgLJ9jK2JVlrzc6oSQKQCfcI1i07z6k8mjWq/9Tb0nB5XCd6WOi2pBR1
         UKrvW4k62F+0aTE+A3jypoPB5KsnHLiQQHqiG8LAj/3Ieon/+jUh/QXs5okYSu8g1fkE
         oz7LyEZoPkEZuoxqFrJUXwv2TKUbpzE/fkDHBoLJzDk53ilZSld37i/iWRZ0F9hYT79K
         IlHwAY69pA/adY+sbQhI5gQmBfwf7RfnaYsv+P6IwY5TR8N24lwzjfGebeqePV4CKU9e
         vcKw==
X-Gm-Message-State: AAQBX9dBphnik2YQNPa5JRjLwJlgQyZp9PTpLuTyc4Ns3kGKJ4febIks
	oywmgnt3YPSwZ8fbFplDKrJEYJLa+2ZJJlAQTi0=
X-Google-Smtp-Source: AKy350bSYXclEYX8vXymn6EoUn0+E5A9piaUHJHhvyfA7UKWqiXZ4DvWqfhXm2IKOIR7ZfYTVCtc+139GKbCdL2drFE=
X-Received: by 2002:a17:90b:2248:b0:24b:3295:3e23 with SMTP id
 hk8-20020a17090b224800b0024b32953e23mr13819971pjb.19.1682337528855; Mon, 24
 Apr 2023 04:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com>
 <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com>
 <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com>
 <cc6380b9-b452-6492-75ab-fc0825b223d3@amd.com> <CA+SAi2upd1P=KzbQS2BpD5zr3+OA=mrq7JiC7Zou9XSEJ_OYhA@mail.gmail.com>
 <43f5fdaa-47c7-6ec9-c477-dac62a5bceae@amd.com>
In-Reply-To: <43f5fdaa-47c7-6ec9-c477-dac62a5bceae@amd.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Mon, 24 Apr 2023 15:03:14 +0300
Message-ID: <CA+SAi2uBmnUA0Z=+Ji_jaoOGjS8H8ea1_aRuRm=_B89oidxHCA@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: multipart/alternative; boundary="000000000000ccbfa805fa13ba2e"

--000000000000ccbfa805fa13ba2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks guys.
I found out where the problem was.
Now dom0 booted more. But I have a new one.
This is a kernel panic during Dom0 loading.
Maybe someone is able to suggest something ?

Regards,
O.

[    3.771362] sfp_register_bus: upstream ops attach
[    3.776119] sfp_register_bus: Bus registered
[    3.780459] sfp_register_socket: register sfp_bus succeeded
[    3.789399] of_cfs_init
[    3.789499] of_cfs_init: OK
[    3.791685] clk: Not disabling unused clocks
[   11.010355] SError Interrupt on CPU0, code 0xbe000000 -- SError
[   11.010380] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted
5.15.72-xilinx-v2022.1 #1
[   11.010393] Workqueue: events_unbound async_run_entry_fn
[   11.010414] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
BTYPE=3D--)
[   11.010422] pc : simple_write_end+0xd0/0x130
[   11.010431] lr : generic_perform_write+0x118/0x1e0
[   11.010438] sp : ffffffc00809b910
[   11.010441] x29: ffffffc00809b910 x28: 0000000000000000 x27:
ffffffef69ba88c0
[   11.010451] x26: 0000000000003eec x25: ffffff807515db00 x24:
0000000000000000
[   11.010459] x23: ffffffc00809ba90 x22: 0000000002aac000 x21:
ffffff807315a260
[   11.010472] x20: 0000000000001000 x19: fffffffe02000000 x18:
0000000000000000
[   11.010481] x17: 00000000ffffffff x16: 0000000000008000 x15:
0000000000000000
[   11.010490] x14: 0000000000000000 x13: 0000000000000000 x12:
0000000000000000
[   11.010498] x11: 0000000000000000 x10: 0000000000000000 x9 :
0000000000000000
[   11.010507] x8 : 0000000000000000 x7 : ffffffef693ba680 x6 :
000000002d89b700
[   11.010515] x5 : fffffffe02000000 x4 : ffffff807315a3c8 x3 :
0000000000001000
[   11.010524] x2 : 0000000002aab000 x1 : 0000000000000001 x0 :
0000000000000005
[   11.010534] Kernel panic - not syncing: Asynchronous SError Interrupt
[   11.010539] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted
5.15.72-xilinx-v2022.1 #1
[   11.010545] Hardware name: D14 Viper Board - White Unit (DT)
[   11.010548] Workqueue: events_unbound async_run_entry_fn
[   11.010556] Call trace:
[   11.010558]  dump_backtrace+0x0/0x1c4
[   11.010567]  show_stack+0x18/0x2c
[   11.010574]  dump_stack_lvl+0x7c/0xa0
[   11.010583]  dump_stack+0x18/0x34
[   11.010588]  panic+0x14c/0x2f8
[   11.010597]  print_tainted+0x0/0xb0
[   11.010606]  arm64_serror_panic+0x6c/0x7c
[   11.010614]  do_serror+0x28/0x60
[   11.010621]  el1h_64_error_handler+0x30/0x50
[   11.010628]  el1h_64_error+0x78/0x7c
[   11.010633]  simple_write_end+0xd0/0x130
[   11.010639]  generic_perform_write+0x118/0x1e0
[   11.010644]  __generic_file_write_iter+0x138/0x1c4
[   11.010650]  generic_file_write_iter+0x78/0xd0
[   11.010656]  __kernel_write+0xfc/0x2ac
[   11.010665]  kernel_write+0x88/0x160
[   11.010673]  xwrite+0x44/0x94
[   11.010680]  do_copy+0xa8/0x104
[   11.010686]  write_buffer+0x38/0x58
[   11.010692]  flush_buffer+0x4c/0xbc
[   11.010698]  __gunzip+0x280/0x310
[   11.010704]  gunzip+0x1c/0x28
[   11.010709]  unpack_to_rootfs+0x170/0x2b0
[   11.010715]  do_populate_rootfs+0x80/0x164
[   11.010722]  async_run_entry_fn+0x48/0x164
[   11.010728]  process_one_work+0x1e4/0x3a0
[   11.010736]  worker_thread+0x7c/0x4c0
[   11.010743]  kthread+0x120/0x130
[   11.010750]  ret_from_fork+0x10/0x20
[   11.010757] SMP: stopping secondary CPUs
[   11.010784] Kernel Offset: 0x2f61200000 from 0xffffffc008000000
[   11.010788] PHYS_OFFSET: 0x0
[   11.010790] CPU features: 0x00000401,00000842
[   11.010795] Memory Limit: none
[   11.277509] ---[ end Kernel panic - not syncing: Asynchronous SError
Interrupt ]---

=D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 15:52, Mic=
hal Orzel <michal.orzel@amd.com>:

> Hi Oleg,
>
> On 21/04/2023 14:49, Oleg Nikitenko wrote:
> >
> >
> >
> > Hello Michal,
> >
> > I was not able to enable earlyprintk in the xen for now.
> > I decided to choose another way.
> > This is a xen's command line that I found out completely.
> >
> > (XEN) $$$$ console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_=
vcpus=3D2
> dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dnull timer_slop=3D0
> Yes, adding a printk() in Xen was also a good idea.
>
> >
> > So you are absolutely right about a command line.
> > Now I am going to find out why xen did not have the correct parameters
> from the device tree.
> Maybe you will find this document helpful:
>
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
>
> ~Michal
>
> >
> > Regards,
> > Oleg
> >
> > =D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:16,=
 Michal Orzel <michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>:
> >
> >
> >     On 21/04/2023 10:04, Oleg Nikitenko wrote:
> >     >
> >     >
> >     >
> >     > Hello Michal,
> >     >
> >     > Yes, I use yocto.
> >     >
> >     > Yesterday all day long I tried to follow your suggestions.
> >     > I faced a problem.
> >     > Manually in the xen config build file I pasted the strings:
> >     In the .config file or in some Yocto file (listing additional
> Kconfig options) added to SRC_URI?
> >     You shouldn't really modify .config file but if you do, you should
> execute "make olddefconfig" afterwards.
> >
> >     >
> >     > CONFIG_EARLY_PRINTK
> >     > CONFIG_EARLY_PRINTK_ZYNQMP
> >     > CONFIG_EARLY_UART_CHOICE_CADENCE
> >     I hope you added =3Dy to them.
> >
> >     Anyway, you have at least the following solutions:
> >     1) Run bitbake xen -c menuconfig to properly set early printk
> >     2) Find out how you enable other Kconfig options in your project
> (e.g. CONFIG_COLORING=3Dy that is not enabled by default)
> >     3) Append the following to "xen/arch/arm/configs/arm64_defconfig":
> >     CONFIG_EARLY_PRINTK_ZYNQMP=3Dy
> >
> >     ~Michal
> >
> >     >
> >     > Host hangs in build time.
> >     > Maybe I did not set something in the config build file ?
> >     >
> >     > Regards,
> >     > Oleg
> >     >
> >     > =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 =
11:57, Oleg Nikitenko <oleshiiwood@gmail.com
> <mailto:oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>:
> >     >
> >     >     Thanks Michal,
> >     >
> >     >     You gave me an idea.
> >     >     I am going to try it today.
> >     >
> >     >     Regards,
> >     >     O.
> >     >
> >     >     =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=
=B2 11:56, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
> >     >
> >     >         Thanks Stefano.
> >     >
> >     >         I am going to do it today.
> >     >
> >     >         Regards,
> >     >         O.
> >     >
> >     >         =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3.=
 =D0=B2 23:05, Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>:
> >     >
> >     >             On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
> >     >             > Hi Michal,
> >     >             >
> >     >             > I corrected xen's command line.
> >     >             > Now it is
> >     >             > xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dser=
ial0
> dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dn=
ative
> sched=3Dnull
> >     >             > timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3
> dom0_colors=3D4-7";
> >     >
> >     >             4 colors is way too many for xen, just do
> xen_colors=3D0-0. There is no
> >     >             advantage in using more than 1 color for Xen.
> >     >
> >     >             4 colors is too few for dom0, if you are giving 1600M
> of memory to Dom0.
> >     >             Each color is 256M. For 1600M you should give at leas=
t
> 7 colors. Try:
> >     >
> >     >             xen_colors=3D0-0 dom0_colors=3D1-8
> >     >
> >     >
> >     >
> >     >             > Unfortunately the result was the same.
> >     >             >
> >     >             > (XEN)  - Dom0 mode: Relaxed
> >     >             > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> >     >             > (XEN) P2M: 3 levels with order-1 root, VTCR
> 0x0000000080023558
> >     >             > (XEN) Scheduling granularity: cpu, 1 CPU per
> sched-resource
> >     >             > (XEN) Coloring general information
> >     >             > (XEN) Way size: 64kB
> >     >             > (XEN) Max. number of colors available: 16
> >     >             > (XEN) Xen color(s): [ 0 ]
> >     >             > (XEN) alternatives: Patching with alt table
> 00000000002cc690 -> 00000000002ccc0c
> >     >             > (XEN) Color array allocation failed for dom0
> >     >             > (XEN)
> >     >             > (XEN) ****************************************
> >     >             > (XEN) Panic on CPU 0:
> >     >             > (XEN) Error creating domain 0
> >     >             > (XEN) ****************************************
> >     >             > (XEN)
> >     >             > (XEN) Reboot in five seconds...
> >     >             >
> >     >             > I am going to find out how command line arguments
> passed and parsed.
> >     >             >
> >     >             > Regards,
> >     >             > Oleg
> >     >             >
> >     >             > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=
=D0=B3. =D0=B2 11:25, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
> >     >             >       Hi Michal,
> >     >             >
> >     >             > You put my nose into the problem. Thank you.
> >     >             > I am going to use your point.
> >     >             > Let's see what happens.
> >     >             >
> >     >             > Regards,
> >     >             > Oleg
> >     >             >
> >     >             >
> >     >             > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=
=D0=B3. =D0=B2 10:37, Michal Orzel <
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>:
> >     >             >       Hi Oleg,
> >     >             >
> >     >             >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
> >     >             >       >
> >     >             >       >
> >     >             >       >
> >     >             >       > Hello Stefano,
> >     >             >       >
> >     >             >       > Thanks for the clarification.
> >     >             >       > My company uses yocto for image generation.
> >     >             >       > What kind of information do you need to
> consult me in this case ?
> >     >             >       >
> >     >             >       > Maybe modules sizes/addresses which were
> mentioned by @Julien Grall <mailto:julien@xen.org <mailto:julien@xen.org>
> <mailto:julien@xen.org <mailto:julien@xen.org>>> ?
> >     >             >
> >     >             >       Sorry for jumping into discussion, but FWICS
> the Xen command line you provided seems to be not the one
> >     >             >       Xen booted with. The error you are observing
> most likely is due to dom0 colors configuration not being
> >     >             >       specified (i.e. lack of dom0_colors=3D<>
> parameter). Although in the command line you provided, this parameter
> >     >             >       is set, I strongly doubt that this is the
> actual command line in use.
> >     >             >
> >     >             >       You wrote:
> >     >             >       xen,xen-bootargs =3D "console=3Ddtuart
> dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin boots=
crub=3D0
> vwfi=3Dnative
> >     >             >       sched=3Dnull timer_slop=3D0 way_szize=3D65536
> xen_colors=3D0-3 dom0_colors=3D4-7";
> >     >             >
> >     >             >       but:
> >     >             >       1) way_szize has a typo
> >     >             >       2) you specified 4 colors (0-3) for Xen, but
> the boot log says that Xen has only one:
> >     >             >       (XEN) Xen color(s): [ 0 ]
> >     >             >
> >     >             >       This makes me believe that no colors
> configuration actually end up in command line that Xen booted with.
> >     >             >       Single color for Xen is a "default if not
> specified" and way size was probably calculated by asking HW.
> >     >             >
> >     >             >       So I would suggest to first cross-check the
> command line in use.
> >     >             >
> >     >             >       ~Michal
> >     >             >
> >     >             >
> >     >             >       >
> >     >             >       > Regards,
> >     >             >       > Oleg
> >     >             >       >
> >     >             >       > =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=
=E2=80=AF=D0=B3. =D0=B2 20:44, Stefano
> Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>:
> >     >             >       >
> >     >             >       >     On Tue, 18 Apr 2023, Oleg Nikitenko
> wrote:
> >     >             >       >     > Hi Julien,
> >     >             >       >     >
> >     >             >       >     > >> This feature has not been merged i=
n
> Xen upstream yet
> >     >             >       >     >
> >     >             >       >     > > would assume that upstream + the
> series on the ML [1] work
> >     >             >       >     >
> >     >             >       >     > Please clarify this point.
> >     >             >       >     > Because the two thoughts are
> controversial.
> >     >             >       >
> >     >             >       >     Hi Oleg,
> >     >             >       >
> >     >             >       >     As Julien wrote, there is nothing
> controversial. As you are aware,
> >     >             >       >     Xilinx maintains a separate Xen tree
> specific for Xilinx here:
> >     >             >       >     https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>
> >     >             >       >
> >     >             >       >     and the branch you are using
> (xlnx_rebase_4.16) comes from there.
> >     >             >       >
> >     >             >       >
> >     >             >       >     Instead, the upstream Xen tree lives
> here:
> >     >             >       >
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>
> >     >             >       >
> >     >             >       >
> >     >             >       >     The Cache Coloring feature that you are
> trying to configure is present
> >     >             >       >     in xlnx_rebase_4.16, but not yet presen=
t
> upstream (there is an
> >     >             >       >     outstanding patch series to add cache
> coloring to Xen upstream but it
> >     >             >       >     hasn't been merged yet.)
> >     >             >       >
> >     >             >       >
> >     >             >       >     Anyway, if you are using
> xlnx_rebase_4.16 it doesn't matter too much for
> >     >             >       >     you as you already have Cache Coloring
> as a feature there.
> >     >             >       >
> >     >             >       >
> >     >             >       >     I take you are using ImageBuilder to
> generate the boot configuration? If
> >     >             >       >     so, please post the ImageBuilder config
> file that you are using.
> >     >             >       >
> >     >             >       >     But from the boot message, it looks lik=
e
> the colors configuration for
> >     >             >       >     Dom0 is incorrect.
> >     >             >       >
> >     >             >
> >     >             >
> >     >             >
> >     >
> >
>

--000000000000ccbfa805fa13ba2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, <br></div><div><br></div><div>Thanks guys.</di=
v><div>I found out where the problem was. <br></div><div>Now dom0 booted mo=
re. But I have a new one.</div><div>This is a kernel panic during Dom0 load=
ing.<br></div><div>Maybe someone is able to suggest something ?</div><div><=
br></div><div>Regards,</div><div>O.<br></div><div><br></div><div>[ =C2=A0 =
=C2=A03.771362] sfp_register_bus: upstream ops attach<br>[ =C2=A0 =C2=A03.7=
76119] sfp_register_bus: Bus registered<br>[ =C2=A0 =C2=A03.780459] sfp_reg=
ister_socket: register sfp_bus succeeded <br>[ =C2=A0 =C2=A03.789399] of_cf=
s_init<br>[ =C2=A0 =C2=A03.789499] of_cfs_init: OK<br>[ =C2=A0 =C2=A03.7916=
85] clk: Not disabling unused clocks<br>[ =C2=A0 11.010355] SError Interrup=
t on CPU0, code 0xbe000000 -- SError<br>[ =C2=A0 11.010380] CPU: 0 PID: 9 C=
omm: kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1<br>[ =C2=A0 11.0103=
93] Workqueue: events_unbound async_run_entry_fn<br>[ =C2=A0 11.010414] pst=
ate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)<br>[ =C2=A0 =
11.010422] pc : simple_write_end+0xd0/0x130<br>[ =C2=A0 11.010431] lr : gen=
eric_perform_write+0x118/0x1e0<br>[ =C2=A0 11.010438] sp : ffffffc00809b910=
<br>[ =C2=A0 11.010441] x29: ffffffc00809b910 x28: 0000000000000000 x27: ff=
ffffef69ba88c0<br>[ =C2=A0 11.010451] x26: 0000000000003eec x25: ffffff8075=
15db00 x24: 0000000000000000<br>[ =C2=A0 11.010459] x23: ffffffc00809ba90 x=
22: 0000000002aac000 x21: ffffff807315a260<br>[ =C2=A0 11.010472] x20: 0000=
000000001000 x19: fffffffe02000000 x18: 0000000000000000<br>[ =C2=A0 11.010=
481] x17: 00000000ffffffff x16: 0000000000008000 x15: 0000000000000000<br>[=
 =C2=A0 11.010490] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000=
000000000<br>[ =C2=A0 11.010498] x11: 0000000000000000 x10: 000000000000000=
0 x9 : 0000000000000000<br>[ =C2=A0 11.010507] x8 : 0000000000000000 x7 : f=
fffffef693ba680 x6 : 000000002d89b700<br>[ =C2=A0 11.010515] x5 : fffffffe0=
2000000 x4 : ffffff807315a3c8 x3 : 0000000000001000<br>[ =C2=A0 11.010524] =
x2 : 0000000002aab000 x1 : 0000000000000001 x0 : 0000000000000005<br>[ =C2=
=A0 11.010534] Kernel panic - not syncing: Asynchronous SError Interrupt<br=
>[ =C2=A0 11.010539] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 5.15.72-x=
ilinx-v2022.1 #1<br>[ =C2=A0 11.010545] Hardware name: D14 Viper Board - Wh=
ite Unit (DT)<br>[ =C2=A0 11.010548] Workqueue: events_unbound async_run_en=
try_fn<br>[ =C2=A0 11.010556] Call trace:<br>[ =C2=A0 11.010558] =C2=A0dump=
_backtrace+0x0/0x1c4<br>[ =C2=A0 11.010567] =C2=A0show_stack+0x18/0x2c<br>[=
 =C2=A0 11.010574] =C2=A0dump_stack_lvl+0x7c/0xa0<br>[ =C2=A0 11.010583] =
=C2=A0dump_stack+0x18/0x34<br>[ =C2=A0 11.010588] =C2=A0panic+0x14c/0x2f8<b=
r>[ =C2=A0 11.010597] =C2=A0print_tainted+0x0/0xb0<br>[ =C2=A0 11.010606] =
=C2=A0arm64_serror_panic+0x6c/0x7c<br>[ =C2=A0 11.010614] =C2=A0do_serror+0=
x28/0x60<br>[ =C2=A0 11.010621] =C2=A0el1h_64_error_handler+0x30/0x50<br>[ =
=C2=A0 11.010628] =C2=A0el1h_64_error+0x78/0x7c<br>[ =C2=A0 11.010633] =C2=
=A0simple_write_end+0xd0/0x130<br>[ =C2=A0 11.010639] =C2=A0generic_perform=
_write+0x118/0x1e0<br>[ =C2=A0 11.010644] =C2=A0__generic_file_write_iter+0=
x138/0x1c4<br>[ =C2=A0 11.010650] =C2=A0generic_file_write_iter+0x78/0xd0<b=
r>[ =C2=A0 11.010656] =C2=A0__kernel_write+0xfc/0x2ac<br>[ =C2=A0 11.010665=
] =C2=A0kernel_write+0x88/0x160<br>[ =C2=A0 11.010673] =C2=A0xwrite+0x44/0x=
94<br>[ =C2=A0 11.010680] =C2=A0do_copy+0xa8/0x104<br>[ =C2=A0 11.010686] =
=C2=A0write_buffer+0x38/0x58<br>[ =C2=A0 11.010692] =C2=A0flush_buffer+0x4c=
/0xbc<br>[ =C2=A0 11.010698] =C2=A0__gunzip+0x280/0x310<br>[ =C2=A0 11.0107=
04] =C2=A0gunzip+0x1c/0x28<br>[ =C2=A0 11.010709] =C2=A0unpack_to_rootfs+0x=
170/0x2b0<br>[ =C2=A0 11.010715] =C2=A0do_populate_rootfs+0x80/0x164<br>[ =
=C2=A0 11.010722] =C2=A0async_run_entry_fn+0x48/0x164<br>[ =C2=A0 11.010728=
] =C2=A0process_one_work+0x1e4/0x3a0<br>[ =C2=A0 11.010736] =C2=A0worker_th=
read+0x7c/0x4c0<br>[ =C2=A0 11.010743] =C2=A0kthread+0x120/0x130<br>[ =C2=
=A0 11.010750] =C2=A0ret_from_fork+0x10/0x20<br>[ =C2=A0 11.010757] SMP: st=
opping secondary CPUs<br>[ =C2=A0 11.010784] Kernel Offset: 0x2f61200000 fr=
om 0xffffffc008000000<br>[ =C2=A0 11.010788] PHYS_OFFSET: 0x0<br>[ =C2=A0 1=
1.010790] CPU features: 0x00000401,00000842<br>[ =C2=A0 11.010795] Memory L=
imit: none<br>[ =C2=A0 11.277509] ---[ end Kernel panic - not syncing: Asyn=
chronous SError Interrupt ]---<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80=
. 2023=E2=80=AF=D0=B3. =D0=B2 15:52, Michal Orzel &lt;<a href=3D"mailto:mic=
hal.orzel@amd.com">michal.orzel@amd.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Oleg,<br>
<br>
On 21/04/2023 14:49, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; Hello Michal,<br>
&gt; <br>
&gt; I was not able to enable earlyprintk in the xen for now.<br>
&gt; I decided to choose another way.<br>
&gt; This is a xen&#39;s command line that I found out completely.<br>
&gt; <br>
&gt; (XEN) $$$$ console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M dom0_max=
_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dnull timer_sl=
op=3D0<br>
Yes, adding a printk() in Xen was also a good idea.<br>
<br>
&gt; <br>
&gt; So you are absolutely right about a command line.<br>
&gt; Now I am going to find out why xen did not have the correct parameters=
 from the device tree.<br>
Maybe you will find this document helpful:<br>
<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/ar=
m/device-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.=
txt</a><br>
<br>
~Michal<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; =D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:16=
, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank=
">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.co=
m" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 21/04/2023 10:04, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yes, I use yocto.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yesterday all day long I tried to follow your =
suggestions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I faced a problem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Manually in the xen config build file I pasted=
 the strings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0In the .config file or in some Yocto file (listing =
additional Kconfig options) added to SRC_URI?<br>
&gt;=C2=A0 =C2=A0 =C2=A0You shouldn&#39;t really modify .config file but if=
 you do, you should execute &quot;make olddefconfig&quot; afterwards.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; CONFIG_EARLY_PRINTK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; CONFIG_EARLY_PRINTK_ZYNQMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; CONFIG_EARLY_UART_CHOICE_CADENCE<br>
&gt;=C2=A0 =C2=A0 =C2=A0I hope you added =3Dy to them.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Anyway, you have at least the following solutions:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A01) Run bitbake xen -c menuconfig to properly set ea=
rly printk<br>
&gt;=C2=A0 =C2=A0 =C2=A02) Find out how you enable other Kconfig options in=
 your project (e.g. CONFIG_COLORING=3Dy that is not enabled by default)<br>
&gt;=C2=A0 =C2=A0 =C2=A03) Append the following to &quot;xen/arch/arm/confi=
gs/arm64_defconfig&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_EARLY_PRINTK_ZYNQMP=3Dy<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Host hangs in build time.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Maybe I did not set something in the config bu=
ild file ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=
=80=AF=D0=B3. =D0=B2 11:57, Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwoo=
d@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank=
">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.=
com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Thanks Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0You gave me an idea.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I am going to try it today.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=D1=87=D1=82, 20 =D0=B0=D0=
=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:56, Oleg Nikitenko &lt;<a href=3D=
"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com=
" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:=
oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&=
gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks Stefan=
o.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I am going to=
 do it today.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=D1=81=D1=80,=
 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:05, Stefano Stabelli=
ni &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;ma=
ilto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellin=
i@kernel.org</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0On Wed, 19 Apr 2023, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Hi Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; I corrected xen&#39;s command line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Now it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; xen,xen-bootargs =3D &quot;console=3Ddtuart dtuart=3Dserial0 dom0_m=
em=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sc=
hed=3Dnull<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7&=
quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A04 colors is way too many for xen, just do xen_colors=3D0-0. There is no<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0advantage in using more than 1 color for Xen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A04 colors is too few for dom0, if you are giving 1600M of memory to Dom0.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Each color is 256M. For 1600M you should give at least 7 colors. Try:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0xen_colors=3D0-0 dom0_colors=3D1-8<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Unfortunately the result was the same.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) =C2=A0- Dom0 mode: Relaxed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Coloring general information<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Way size: 64kB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Max. number of colors available: 16<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Xen color(s): [ 0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) alternatives: Patching with alt table 00000000002cc690 -&gt; =
00000000002ccc0c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Color array allocation failed for dom0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) ****************************************<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Panic on CPU 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Error creating domain 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) ****************************************<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; (XEN) Reboot in five seconds...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; I am going to find out how command line arguments passed and parsed=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11=
:25, Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"=
_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@=
gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a hr=
ef=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com=
</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">=
oleshiiwood@gmail.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; You put my nose into the problem. Thank you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; I am going to use your point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Let&#39;s see what happens.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 10=
:37, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_bl=
ank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd=
.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"=
mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt=
;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.or=
zel@amd.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 19/04/2023 09:03, Oleg Nikitenko wrote=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the clarification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; My company uses yocto for image gene=
ration.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; What kind of information do you need=
 to consult me in this case ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Maybe modules sizes/addresses which =
were mentioned by @Julien Grall &lt;mailto:<a href=3D"mailto:julien@xen.org=
" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@=
xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mai=
lto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=
=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt;=
 ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Sorry for jumping into discussion, but FW=
ICS the Xen command line you provided seems to be not the one<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Xen booted with. The error you are observ=
ing most likely is due to dom0 colors configuration not being<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0specified (i.e. lack of dom0_colors=3D&lt=
;&gt; parameter). Although in the command line you provided, this parameter=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is set, I strongly doubt that this is the=
 actual command line in use.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen,xen-bootargs =3D &quot;console=3Ddtua=
rt dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin boot=
scrub=3D0 vwfi=3Dnative<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sched=3Dnull timer_slop=3D0 way_szize=3D6=
5536 xen_colors=3D0-3 dom0_colors=3D4-7&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0but:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01) way_szize has a typo<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02) you specified 4 colors (0-3) for Xen, =
but the boot log says that Xen has only one:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) Xen color(s): [ 0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This makes me believe that no colors conf=
iguration actually end up in command line that Xen booted with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Single color for Xen is a &quot;default i=
f not specified&quot; and way size was probably calculated by asking HW.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0So I would suggest to first cross-check t=
he command line in use.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80.=
 2023=E2=80=AF=D0=B3. =D0=B2 20:44, Stefano Stabellini &lt;<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org"=
 target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt=
; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ss=
tabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"m=
ailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> =
&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ssta=
bellini@kernel.org</a>&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 18 Apr 20=
23, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Julien,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Thi=
s feature has not been merged in Xen upstream yet<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; would a=
ssume that upstream + the series on the ML [1] work<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please clari=
fy this point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Because the =
two thoughts are controversial.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0As Julien wrote, =
there is nothing controversial. As you are aware,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Xilinx maintains =
a separate Xen tree specific for Xilinx here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https:=
//github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a h=
ref=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/=
xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>=
&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://g=
ithub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and the branch yo=
u are using (xlnx_rebase_4.16) comes from there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Instead, the upst=
ream Xen tree lives here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &l=
t;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=
=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" ta=
rget=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>=
&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0The Cache Colorin=
g feature that you are trying to configure is present<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0in xlnx_rebase_4.=
16, but not yet present upstream (there is an<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0outstanding patch=
 series to add cache coloring to Xen upstream but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0hasn&#39;t been m=
erged yet.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Anyway, if you ar=
e using xlnx_rebase_4.16 it doesn&#39;t matter too much for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0you as you alread=
y have Cache Coloring as a feature there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I take you are us=
ing ImageBuilder to generate the boot configuration? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0so, please post t=
he ImageBuilder config file that you are using.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0But from the boot=
 message, it looks like the colors configuration for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Dom0 is incorrect=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000ccbfa805fa13ba2e--

