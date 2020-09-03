Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25325C667
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 18:14:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDrro-0003t5-Cd; Thu, 03 Sep 2020 16:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqMu=CM=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1kDrrm-0003sq-Ap
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 16:13:38 +0000
X-Inumbo-ID: b95887fa-b706-44db-b928-581e49cc0b89
Received: from sonic306-2.consmr.mail.bf2.yahoo.com (unknown [74.6.132.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b95887fa-b706-44db-b928-581e49cc0b89;
 Thu, 03 Sep 2020 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1599149616; bh=9CXPrU6Bdv5dnL0qEUTtYlay2Z5x0NGRA1+3xt/F29w=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=SKgjKFWx98taMEl/rwJrSlFdeApp4fC7tElN/SjvVsFfioEgnP+SSUlsuMToc1Rup+GM6TvEW8/SHIBYvIyBaG7WiixWB90LlOATAxxiaOrd1a5M4N0wHCQPGI9GnBaMRcXV2ugAHCyhonXw6711R4R2w61CWkOPwZPW218kuTVAngo5YXSE8lFh9Q/JbRK0B2iPztKwNLz7yZjPCYalYxp91fYioA0EqDHcC6PZnALyc40s29TgwQtk0awfJxdmcPj6Rylhx+ZS16i5m6wbD/Ly8iswFyvPZmQB2w3tsOU9EjmeX/DsuSE0NVCc3tB5wJy5PMEiLZMRwt0IL6jSlg==
X-YMail-OSG: RkXamzIVM1m65hjn2FEkCakwweLUara9BjW23NpvgqS1fyzgY.xGhX.hYnLe6QQ
 UGyXaHAl8p_GU_Ptr1.aeO9l15LVUxfj99FPOqH2LMZgXLg6g37R_9QBlLy5SLaDKruiv.3BA5Fc
 8PWAqnLAewdNkzoc.bQOXKC0Hps1uBtl6qGwwLOT4UwH2dHuHU5StpzpOF04p14hURxkbCS80mJ7
 AID0M5eE_jIuoafesLOFWciktmnhFUAWPH065MEjgZrL_SoF3M9SmZdAMQgF3Rdx4iPui_0baKcJ
 E04FeayTAFPqf3HBSB3CLr8QMGDzkDw.XfOv0m_AiLyxqpdxuMISvmt5T67ra_k19YKKNBQ7DcKw
 iEQSprxHje1oWMfp4duzAtkbZRzPukFbcr5X9y3VAvSMK.Gz4qfGGRC.Z4HmuTWYbzQcrxnwnOUT
 NvOa1.8UZQQ6Bchegn5nmdESKs5RQHHKQiraqa0__jO7Y0pe6ntitOvRwQoctChCESrMSmEykLWf
 ycxvWjTFHYXYBIHGbHmRVfPStj4UHxr9z7Z92Teu7scJL9_nKwyc5EpjA1cHkBj6PiC4I3Nb3BwH
 B1wNYIpRRTyrvPAPOZnH6RxvPlKrck5nFR5uSLDgYQTRDRVdGKFN8qloWJjD7VH_3XI9Tfg_JMtP
 lK1su_enhnTF51Fm6O5QEA3jz6snwF5cuSIgnIkwsQP0li2raOmgss3cN53xxJIIPFsX4zUS_nBk
 5PGG7bQUKzQSAFZYUCkzDSHCxuJNOsvat20Bz0k2XLntPUQ0nTM1g6Y._eGGIIE0NihjE_2M.mu0
 BXJKYta9y5LmEHfkyHpOm11jyT6BaIt7lftZlTcs5115dvNuZiXZztefp5TINfzwKWf76VD2o22z
 S_TqDhDMEQ05JbncuwEHS7UfG4TLzIMUWoKvSmWVkqLeN4ApjZPE6TItcG8sRbP2UeCtKbC8HIWw
 gFXYDk53mC_HoKpoXVJw5j9N01WoXoadTYnVK29bxqR7SRiVBu9rtMtJmdyknapoSQymJ7at3qzw
 YL3MsvZ82nEiLeFetbI1IVS303gLzhTDG3W2HMW.AgPAozvngAfAdj_bc.fvI4_V83J4CLV87SJm
 lVhOQHEvGSf9eKIFrRfxD3ZNHETKcHxysAUwSevaT8waNqUD_3JqfZtZKO.R.AU64nEluzEMDvvy
 i7gvZ5KOeO8iHoSyK0AWaYVq3kMDs5EVsoM4KdZBSEBVZxtBncI5j9nIlDrnJ3WwV5q6.Ye_Ey0K
 8Y9QhrJRzTyPUwtlsnG8t0_KHapasblWZMV4hO.ZIoUI93Up.EAc8eQqeStzgS2C4YloYWv2yMQW
 EXxixjGoC7UfhWhzbWaNaafnV57IFHhN_ho2Cxf9FMY2zLCsP28CFwK3sKE476wyrx1MvVYXNvQg
 eSwgr6pULzKYszSfYubo9z2j1WSmM6eQRfLHOxPARkn.m9nCKJ.xacPQDMArtaMKatQu_oFxDmyT
 Vtw--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.bf2.yahoo.com with HTTP; Thu, 3 Sep 2020 16:13:36 +0000
Date: Thu, 3 Sep 2020 16:13:33 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Mario Marietto <marietto2008@gmail.com>, 
 "igvt-g@lists.01.org" <igvt-g@lists.01.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "Li, Susie" <susie.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, 
 "Downs, Mike" <mike.downs@intel.com>, 
 "Xu, Terrence" <terrence.xu@intel.com>, 
 "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Message-ID: <562995531.2017776.1599149613580@mail.yahoo.com>
In-Reply-To: <F1815FD4-C7F3-41A3-B9C5-BD17A64A70A9@intel.com>
References: <CA+1FSihpq_i-poiihdF0srE3fGXnncGtCMYqAGmNZu7fjNcY=w@mail.gmail.com>
 <CY4PR11MB15594EC5255084B8AE509068F02E0@CY4PR11MB1559.namprd11.prod.outlook.com>
 <1093525083.1169948.1598979998646@mail.yahoo.com>
 <559F4617-9633-4B40-BA55-E79305E20530@intel.com>
 <2116380713.1512447.1599053858745@mail.yahoo.com>
 <F1815FD4-C7F3-41A3-B9C5-BD17A64A70A9@intel.com>
Subject: Re: Various problems for the Xen for XenGT code and guide.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16565 YMailNorrin Mozilla/5.0 (Windows NT 6.1; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83
 Safari/537.36
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

Thank you.
If someone wants to use XenGT with new GPU then?






On Thursday, September 3, 2020, 03:04:21 PM GMT+4:30, Lv, Zhiyuan <zhiyuan.=
lv@intel.com> wrote:=20





Hi Jason,

We ever supported both XenGT and KVMGT for data center usages. Right now KV=
MGT is still used in client side for GPU sharing. That's why we are support=
ing KVMGT. Thanks!

Regards,
-Zhiyuan

=EF=BB=BF-----Original Message-----

From: Jason Long <hack3rcon@yahoo.com>
Date: Wednesday, September 2, 2020 at 9:38 PM
To: Mario Marietto <marietto2008@gmail.com>, "igvt-g@lists.01.org" <igvt-g@=
lists.01.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject=
.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "intel-gfx@list=
s.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.ke=
rnel.org" <linux-kernel@vger.kernel.org>, Susie Li <susie.li@intel.com>, "T=
ian, Kevin" <kevin.tian@intel.com>, "Li, Weinan Z" <weinan.z.li@intel.com>,=
 "Downs, Mike" <mike.downs@intel.com>, "Xu, Terrence" <terrence.xu@intel.co=
m>, Zhiyuan Lv <zhiyuan.lv@intel.com>
Subject: Re: Various problems for the Xen for XenGT code and guide.

Why not new XenGT for new GPU?
Intel migrated to the KVM?






On Wednesday, September 2, 2020, 05:19:18 PM GMT+4:30, Lv, Zhiyuan <zhiyuan=
.lv@intel.com> wrote:=20





Hi,

It is mainly due to the business priority change. XenGT project was origina=
lly created for data center usages with XEON E3 servers which have integrat=
ed processor graphics. After SkyLake E3, there are no new servers capable o=
f running GVT-g, and Intel future graphics for data center will have differ=
ent approaches for GPU sharing. Another reason is the XenGT upstream diffic=
ulty. Different from KVMGT which has been fully merged to upstream, Xen par=
t of GVT-g still has technical opens that are hard to close quickly.

Sorry that we did not sync up with community in time the XenGT ramping down=
 plan. Internally we have been testing XenGT until November 2019. We will u=
pdate our setup guide for XenGT part to reflect the information. Going forw=
ard we will try our best to do XenGT consultant, but will not be able to do=
 code rebase/test or debugging. Meanwhile, we are still maintaining KVMGT m=
ainly for client integrated GPU usages. We will continue to fix issues that=
 can be reproduced with KVMGT.

https://github.com/intel/gvt-linux/tree/topic/gvt-xengt
https://github.com/intel/Igvtg-xen/tree/xengt-stable-4.10

Hi Marietto, we appreciate your efforts trying GVT-g (XenGT). Hope Terrence=
's reply helps. By switching back to old gcc those compile errors should be=
 gone. Meanwhile please be kindly noticed that we can only provide limited =
support on XenGT with old versions. Thanks!

Regards,
-Zhiyuan

-----Original Message-----

From: Jason Long <hack3rcon@yahoo.com>
Date: Wednesday, September 2, 2020 at 1:07 AM
To: Mario Marietto <marietto2008@gmail.com>, "igvt-g@lists.01.org" <igvt-g@=
lists.01.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject=
.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "intel-gfx@list=
s.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.ke=
rnel.org" <linux-kernel@vger.kernel.org>, Susie Li <susie.li@intel.com>, "T=
ian, Kevin" <kevin.tian@intel.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>, "Li,=
 Weinan Z" <weinan.z.li@intel.com>, "Downs, Mike" <mike.downs@intel.com>, "=
Xu, Terrence" <terrence.xu@intel.com>
Subject: Re: Various problems for the Xen for XenGT code and guide.

Hello,
Why XenGT doesn't have any new version?






On Tuesday, September 1, 2020, 09:21:27 PM GMT+4:30, Xu, Terrence <terrence=
.xu@intel.com> wrote:=20








Hi Mario,



Sorry to make you feel uncomfortable.



I think it is not setup guide problem, the main reason is the Xen code is v=
ery old (We are upgrading GVT-g code on Linux kernel side and we haven=E2=
=80=99t upgraded the Xen and Qemu source for XenGT for at least 2 years) bu=
t your GCC is new (You are using Ubuntu 20.4, the gcc version is 9+).

I have a way to workaround it, as below:

1.=C2=A0 apt-get install gcc-72.=C2=A0 ln -fs gcc-7 /usr/bin/gcc



Any more problem just let us know!



Thanks

Terrence





From: Mario Marietto <marietto2008@gmail.com>=20
Sent: Thursday, August 27, 2020 9:52 PM
To: Xu, Terrence <terrence.xu@intel.com>; igvt-g@lists.01.org; xen-devel@li=
sts.xenproject.org; xen-devel@lists.xen.org; intel-gfx@lists.freedesktop.or=
g; linux-kernel@vger.kernel.org; Li, Susie <susie.li@intel.com>; Tian, Kevi=
n <kevin.tian@intel.com>; Lv, Zhiyuan <zhiyuan.lv@intel.com>; Li, Weinan Z =
<weinan.z.li@intel.com>; Downs, Mike <mike.downs@intel.com>
Subject: Various problems for the Xen for XenGT code and guide.







Hello.










I would like to pass the integrated gpu from the host os (ubuntu 20.04) to =
the windows 10 guest os with xen. This is because xen works great for me,be=
tter than qemu-kvm for my specific needs and because I have only two graphi=
c cards. The nvidia rtx 2080 ti that I have already passed to the guest,and=
 the intel UHD 630,that can be duplicated from the host to the guest so tha=
t it can be used in both places without interruptions. So I'm trying to bui=
ld this repository :

https://github.com/intel/gvt-linux/wiki/GVTg_Setup_Guide#332-build-qemu--xe=
n-for-xengt

I have to say that this guide is totally not very well written. And the cod=
e is full of unpatched bugs. It's a month that I'm working on that,trying t=
o fix the bugs that are came out from the 2015 until today. This is not my =
job. This is my hobby. But,I need to activate the pass through for my integ=
rated GPU so I don't to give up. I'm also very angry with those coders who =
do not do their job well and with those coders who do not respond to help m=
essages. It is not enough to write good code to be a good programmer. It is=
 also important to keep the documentation updated, to help those who cannot=
 get the code to work. Anyway,I've documented every step that I did to make=
 it work here :

https://github.com/intel/gvt-linux/issues/168

right now I'm trying to fix the bug n. 434544,that you can see below.

CC util/qemu-error.o/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c=
: In function =E2=80=98vreport=E2=80=99:/etc/xen/igvtg-xen/tools/qemu-xen-d=
ir/util/qemu-error.c:201:5: error: =E2=80=98GTimeVal=E2=80=99 is deprecated=
: Use 'GDateTime' instead [-Werror=3Ddeprecated-declarations]201 | GTimeVal=
 tv;| ^~~~~~~~In file included from /usr/include/glib-2.0/glib/galloca.h:32=
,from /usr/include/glib-2.0/glib.h:30,from /etc/xen/igvtg-xen/tools/qemu-xe=
n-dir/include/glib-compat.h:19,from /etc/xen/igvtg-xen/tools/qemu-xen-dir/i=
nclude/qemu/osdep.h:107,from /etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qem=
u-error.c:13:/usr/include/glib-2.0/glib/gtypes.h:547:8: note: declared here=
547 | struct GTimeVal| ^~~~~~~~~/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/=
qemu-error.c:205:9: error: =E2=80=98g_get_current_time=E2=80=99 is deprecat=
ed: Use 'g_get_real_time' instead [-Werror=3Ddeprecated-declarations]205 | =
g_get_current_time(&tv);| ^~~~~~~~~~~~~~~~~~In file included from /usr/incl=
ude/glib-2.0/glib/giochannel.h:33,from /usr/include/glib-2.0/glib.h:54,from=
 /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/glib-compat.h:19,from /etc/x=
en/igvtg-xen/tools/qemu-xen-dir/include/qemu/osdep.h:107,from /etc/xen/igvt=
g-xen/tools/qemu-xen-dir/util/qemu-error.c:13:/usr/include/glib-2.0/glib/gm=
ain.h:679:8: note: declared here679 | void g_get_current_time (GTimeVal res=
ult);| ^~~~~~~~~~~~~~~~~~/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-er=
ror.c:206:9: error: =E2=80=98g_time_val_to_iso8601=E2=80=99 is deprecated: =
Use 'g_date_time_format' instead [-Werror=3Ddeprecated-declarations]206 | t=
imestr =3D g_time_val_to_iso8601(&tv);| ^~~~~~~In file included from /usr/i=
nclude/glib-2.0/glib.h:88,from /etc/xen/igvtg-xen/tools/qemu-xen-dir/includ=
e/glib-compat.h:19,from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/qemu/=
osdep.h:107,from /etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:13=
:/usr/include/glib-2.0/glib/gtimer.h:73:10: note: declared here73 | gchar g=
_time_val_to_iso8601 (GTimeVal *time) G_GNUC_MALLOC;| ^~~~~~~~~~~~~~~~~~~~~=
cc1: all warnings being treated as errors




any help is appreciated.=C2=A0 Someone must help me, thanking me for all th=
e efforts I am making to make work a code full of errors. I would also know=
 if I can activate the passthrough of the intel integrated gpu using the pr=
ecompiled xen-hypervisor package that's on ubuntu. Right now I tried to com=
pile it from scratch because I've thought that it was a necessary step,as d=
escribed on the guide. But Im not sure on this point.







--=20


Mario.





