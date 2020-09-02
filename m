Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B32525AC20
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 15:37:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDSxM-0005IP-JS; Wed, 02 Sep 2020 13:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cw+i=CL=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1kDSxK-0005I8-Ov
 for xen-devel@lists.xen.org; Wed, 02 Sep 2020 13:37:43 +0000
X-Inumbo-ID: 02be9dcf-64b8-4d79-a54a-ca483837a887
Received: from sonic306-2.consmr.mail.bf2.yahoo.com (unknown [74.6.132.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02be9dcf-64b8-4d79-a54a-ca483837a887;
 Wed, 02 Sep 2020 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1599053861; bh=S2VacIPv7ZzlovKJJlQ/2Q9pvtl8qAFR/57V9eJ/tOM=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=QgMVYmyh/j5EFGTk4AVG2iAg91397FQD8dPi/QTWLfbrUQ723Kyyc/0M0HMKgCNiIr9B82KQBkB10AaNfR/gP21wBfHwRQ5SLTzlwHIiEDqqIIJEpYaxfBH1NvvxSJb9FtIZXpW+RFKhIlrTl8Si/5tjH6Oe8ce/RjjIZWFrvcbzyazt+FUKmUAzbUX+3t3UqSqnWzsEdJprWGodL6a1v1VWBYdxhZsCC6UWeO11O3teYlWotMZUvY8U2UZeKc4itT5EXRUAlmUtFBYQYic8FMsGxGfJctY+NcFROOKLywbhjPl31FbRwK2+lpbLZbPE6kDSTuNTcM0PkyXI3I9LkA==
X-YMail-OSG: G10BVwwVM1nbiDmDQcmJnwthSLbXy4t8B6m6bckxNTfLOVhcAy7QpMkz3oX7VDj
 rf1SjJwaS2MN4q_a3Bl5m4IyZap88T7WnU0Karjx9FUr8h4xALS98tr42IuvbaHjLxPGUhCJ4680
 dlraNuHw7n6Y4HEVP5.E0lcvdxQqw4M88d3X2Hf8Tvv7sM41Bre8lIInBOaih3KN9eARA1YFaS1E
 gs_EiDb.MpvdXwSnW4Q04l2U7OTm1WVkWqvvSQETj4X0Zeyfnw79wmUvxK9kOymKNTWGzpQoxFNE
 E5HnuzBfKnC1o_ajwAYl.uK2ZuIe0is8M7PchGb2bE6M1StH3C89pUeOlLtWW8r3SOnoYG2jVV.4
 TcRwzJZ6cG6qNh5dzVPv1ERLt2VO4EbYWumofnvpJzsQwewULjb8tOyIXp60MI.fN4oMhIILExmc
 rHAG6Jkzi2YykIAa_UK4nztsa00cedLmNfQ.b3ekgFlXoV.C1t6Nnuzct2JELzF2UX4FgcMNzUhG
 452l6znqcBrjVacZN4OSy_GdhyUO1kuF6Itr0dWggN63WGkNaXvUzv2aCaiO_44NN20t1TJgKPdN
 hFZjWBqp10O2ZYcC83eH9l7faYrAer9wH9kZ8frHRKBmV.YmoHwFZmNX1tNRNwv9VUozX2RXsxsI
 k8D50FX2scKsV92MLALNlG1bqHKZ.7GYVHUXWbMDbhzrGNoHM5oFA5RzKuyByvjQZazxiggDOMMP
 A4PWMyoEFuqiRYc41bIU0v_eudOkywIrZKF3mak3CO1RCS686jw6kznMOCugT3zgaVtYhz5lhKNN
 u1EjncBoN2UoUycHWqeOeR4tmg6Ou.vx4P1a.0ZoRpwRnsSBmpyw9A6nOFh6kDekhCfeoaLu0UO_
 KN6rkzLCh8n1sgY3EcvIXXrC3KZ3aPHrYCROUr8ISUGjJRrPWIH1vLoFY8CGl.s9U.UjZbLetz23
 ZYgjZWeJ4XCxdjXl2QLsI8CH4svNmCy55CS8bBfikbq2rz5zysc2Thx2EM7YDY3OVWEIEgG7GXlr
 bPvakjCWi_s64vNsxEagHSxpYJzg_a67x828WEVa0kiV1fndJ_FnhT1_yf42XvQtREzU.6wtDaby
 1VYjEOgpBiY1f0nh3Gy3jkDqjVJb7WkNw13J9DHUdcSyQLztg3fDw_jbEhjq7SzJkgwmbPdpr5KN
 4_V35H6p.a2QgvL6opS4k.GtyjUadLmkJKPRVN1WJxH.UG0jyn5mZJ20P9ueB.dqIOoyamEi5f4R
 6FRzVjhilr3nNFcH19_2NCIbn4ag1yNScx.znLGDEIxFF55jwAdHDnI0fMchgdRz2RqyVn602AQW
 niW9QiWk1bh54JMjN2e20g2sQCbqp9FeX_VpdlwVDpyatngYE9e26r9Fy.EW9Lw6tRXN.0nfCSvv
 vW7mmj8fbVQParjbhDuQxV_lvjYJmxcAHhXeKspjgpz6hvJunqvhbPCUdhD6SQRXqZk.vm2MyYyB
 wuC5m6w--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.bf2.yahoo.com with HTTP; Wed, 2 Sep 2020 13:37:41 +0000
Date: Wed, 2 Sep 2020 13:37:38 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Mario Marietto <marietto2008@gmail.com>, 
 "igvt-g@lists.01.org" <igvt-g@lists.01.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "Li, Susie" <susie.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, 
 "Li, Weinan Z" <weinan.z.li@intel.com>, 
 "Downs, Mike" <mike.downs@intel.com>, 
 "Xu, Terrence" <terrence.xu@intel.com>, 
 "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Message-ID: <2116380713.1512447.1599053858745@mail.yahoo.com>
In-Reply-To: <559F4617-9633-4B40-BA55-E79305E20530@intel.com>
References: <CA+1FSihpq_i-poiihdF0srE3fGXnncGtCMYqAGmNZu7fjNcY=w@mail.gmail.com>
 <CY4PR11MB15594EC5255084B8AE509068F02E0@CY4PR11MB1559.namprd11.prod.outlook.com>
 <1093525083.1169948.1598979998646@mail.yahoo.com>
 <559F4617-9633-4B40-BA55-E79305E20530@intel.com>
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

=EF=BB=BF-----Original Message-----

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




