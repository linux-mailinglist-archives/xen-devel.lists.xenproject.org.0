Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D062259BC3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 19:07:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD9k2-0000Ms-Vt; Tue, 01 Sep 2020 17:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4/w=CK=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1kD9k1-0000Mh-NI
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 17:06:41 +0000
X-Inumbo-ID: 7b445dc9-828f-4c98-896d-cd71ea05ef01
Received: from sonic311-14.consmr.mail.bf2.yahoo.com (unknown [74.6.131.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b445dc9-828f-4c98-896d-cd71ea05ef01;
 Tue, 01 Sep 2020 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1598979999; bh=zl4FrZeKOmcyFrECTheiikJ5zZfI8mbfUMlAm3X6yvY=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=BEMO7dDCgq7oJiy2lvXhccN9hwiTGfikRDdmFm/7oEGJkOECZRo5EJD+UZ4kCG5sCEpHMe/wSyhMbejn2We2MvrH7DzIieD6LY3GebBJe5tsoD93R1ZJB/BsK3Ondt71hutCHoTjUZYQ1/S53gPbD8BrlEqxAeHaXzPV6N/sGvagmKrMX5ibfezaW7xmdAu9+SI79HlrpQZQsKQAXCuJ6Q4SySMwxpB5qkm6AvEVY5nonyz6Bmypw15kvDRNTb13ra3dj/+u9/Pl5A+OwLY01DGc+NaMWYjtlZfByopESW4etVZVWi8RdtYuYIudG1LcQtXDH0V0J92qsmc0Ctv1Ew==
X-YMail-OSG: 20QLqzsVM1nX3guUzIPooO1Rsp2I5FHFvhg80JbzqGej7IsNshmobK0GeM5Ptza
 ujNF6J9RSn4bcwRLcOqUiGXmUSza_zHHWKvbwZe8HKf.OWopRr_FTisb.EQH5teBtPM6O5xPeGZ_
 kHho8UT67eEtRcrZ4bGTLTizSgJcjFDsTzWh6bP6bVG69SLIeFl7yBFIjSmkgb1dGaMnVYmCpm_D
 Pgq1fNn.Ud5boKwBPD67kLhL7BvTNlo0JJfZrDXs9BjDXYSnvGGRhrzpuf6bvmOpw7scCEAtE64u
 UyruLMUuWoXhDTEmvmr97eXoN.eaYark.Nxq94pfEJ80cB8LuMsmwav0YcNcNbOrUNsvdMsLn3R8
 mdyFPTlDAnrsG_E0fJ1B5tk0aRTaVL75fCKMOT80yChE2boN2CFILhqx4Jb8.CKy_ZeqZXPm_VB9
 KZGI8lNuC0q6Qm.1SZswloPqXWSRWjHeoJ92amG5xMtDx47A8U9ZQoVj49fULpYRuItBHRqEvI9x
 wt2gRr.tQR9x7CWs0pC3mpt28xdiff8NbshDS3jMX.tTiBk7wulEEtL3RpTZVvT.Dg.JguOoG9z0
 Byy6eEJ78TF2x65BrZtbC4srecIR4eroxiPkW6LscAlbFB0CDorO1etlZ48.F0UoVtoMGkusNIiX
 pLqkI_7tyn9BJhPBvC1QbNXfZjQ.xgufg7Y5CerjyFBcWhTYiPcKBWZiAn0wKKKwgJmcM99Eztal
 WnMa.E6FsAE67BR6BsP08MmGJaIqIfk_BTvFlQBYzQTdIPMGEr8x8FGPhDemO10D4q_578nAZUzW
 o08Fqji1z5H4.v03A0t5eCza1io4Qwry30wSpK5pzaT9UueFBRXK6tXZsM2mlWO7M4o8N.VDt3BX
 k2M1Uj8ZnLcEbYivTVtxKQuIG290zo8M_FT5hezmN0zRQFZHOrSOWisv8qZI1yZpQWH1YsX3urUi
 Yeip3jegQoZerlH4DdpjhSJLBqeEp.xFuj3_CmXEK7QPcLpbwUcDTRiWqHiubrDzcIROllXr48Cg
 fxxrXx8wgYLerT.beb7JUer7.iOsirzovTqniK4RTItBy_jf0ynEAn4QYZVyFtGQG2hoFEsktJUF
 dkbXwplRMntgwFbq1PjngMnbMFBMIVy7aIxo43BsohSZsEWF8Cj2_sRopw.XdIO7Z1FaeLdlo8PK
 nkRm05rGzO6euNb9_BR5UMQmA2VkssVFcHeL1beBRg0vi0XP4e5.orjcHP2W3gVNaJNA7p7xkaXK
 1kbLtws3hIgjkVOqXBgAHUyQusqv.ApCg1fZO_3123aeyv5GWvOhl0RuDBtrEzZVTs9C5CiqkRC3
 OyuJb9EfOgYdgp4cvIUSpxEtbDQPurTHpIcO7J_pG4pXI8VmDs8EM9Tx5rzJFuNsJWtsyi87qcJG
 uO5uIzM4iqGw4bPu82fsj0NtnoWuRZ3d4ibecS1JhGgmsh5Jex20V.3t0GAs3tkOOmnJ._Wg1twW
 rTg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.bf2.yahoo.com with HTTP; Tue, 1 Sep 2020 17:06:39 +0000
Date: Tue, 1 Sep 2020 17:06:38 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Mario Marietto <marietto2008@gmail.com>, 
 "igvt-g@lists.01.org" <igvt-g@lists.01.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "Li, Susie" <susie.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, 
 "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, 
 "Li, Weinan Z" <weinan.z.li@intel.com>, 
 "Downs, Mike" <mike.downs@intel.com>, 
 "Xu, Terrence" <terrence.xu@intel.com>
Message-ID: <1093525083.1169948.1598979998646@mail.yahoo.com>
In-Reply-To: <CY4PR11MB15594EC5255084B8AE509068F02E0@CY4PR11MB1559.namprd11.prod.outlook.com>
References: <CA+1FSihpq_i-poiihdF0srE3fGXnncGtCMYqAGmNZu7fjNcY=w@mail.gmail.com>
 <CY4PR11MB15594EC5255084B8AE509068F02E0@CY4PR11MB1559.namprd11.prod.outlook.com>
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

Hello,
Why XenGT doesn't have any new version?






On Tuesday, September 1, 2020, 09:21:27 PM GMT+4:30, Xu, Terrence <terrence=
.xu@intel.com> wrote:=20








Hi Mario,

=C2=A0

Sorry to make you feel uncomfortable.

=C2=A0

I think it is not setup guide problem, the main reason is the Xen code is v=
ery old (We are upgrading GVT-g code on Linux kernel side and we haven=E2=
=80=99t upgraded the Xen and Qemu source for XenGT for at least 2 years) bu=
t your GCC is new (You are using Ubuntu 20.4, the gcc version is 9+).

I have a way to workaround it, as below:

1. =C2=A0apt-get install gcc-72.=C2=A0 ln -fs gcc-7 /usr/bin/gcc

=C2=A0

Any more problem just let us know!

=C2=A0

Thanks

Terrence

=C2=A0



From: Mario Marietto <marietto2008@gmail.com>=20
Sent: Thursday, August 27, 2020 9:52 PM
To: Xu, Terrence <terrence.xu@intel.com>; igvt-g@lists.01.org; xen-devel@li=
sts.xenproject.org; xen-devel@lists.xen.org; intel-gfx@lists.freedesktop.or=
g; linux-kernel@vger.kernel.org; Li, Susie <susie.li@intel.com>; Tian, Kevi=
n <kevin.tian@intel.com>; Lv, Zhiyuan <zhiyuan.lv@intel.com>; Li, Weinan Z =
<weinan.z.li@intel.com>; Downs, Mike <mike.downs@intel.com>
Subject: Various problems for the Xen for XenGT code and guide.



=C2=A0


=C2=A0=C2=A0
Hello.
=C2=A0=C2=A0









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



=C2=A0



--=20


Mario.



