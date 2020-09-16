Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7726C361
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 15:52:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIXr2-0008WK-Fs; Wed, 16 Sep 2020 13:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBSe=CZ=gmail.com=dav.sec.lists@srs-us1.protection.inumbo.net>)
 id 1kIXr0-0008WD-6U
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 13:52:10 +0000
X-Inumbo-ID: cb941674-6dc1-4583-9ef1-a7fc75d1715b
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb941674-6dc1-4583-9ef1-a7fc75d1715b;
 Wed, 16 Sep 2020 13:52:08 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id lo4so10447497ejb.8
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=orsdcno6hT7AxO5AG7LqPEEd9uIfoZTFIUhLHWfjpPk=;
 b=poULHkpCuf8Zjuo4uL5QT6deA+zYzbgzUC3Tyad1y3i3bfPOliWp43P2hEhaS7oYgw
 uO3cL8yyoz3oW45USRJV4Zkquyi58hNITtPBwSEbm9ydnzHEphC+tm7fMpye10SCUvDJ
 S0S0nwlixr/o08q1w9zNHXAcHHDomqn21fOwtmHym9NfKTSe49QEl+TrUR/fE+bnhOqj
 Lx/9O+5mldOfAImTH2ICY09szVJ08bKlBCTWcUlBMe8nLbXoa/aiHmbalME9iP/07dhc
 8TLomdjJ9Yzd8a0ReYnIFku9hmfsdNQoz3e/F9nrWQwmu1EjrAC/Js6i7m9Y+p5nSYr1
 G26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=orsdcno6hT7AxO5AG7LqPEEd9uIfoZTFIUhLHWfjpPk=;
 b=LJYUSeQalG5YU6muEaFqsmgy24MFwIWGZ398oDNOTP44TYzbodgoMAs/cXkE8E6LXG
 jH5yCFYHDnN+2wl/4jDvs1twtFQbPMeNJK/wjT6MuHXzhmLsU8yhP/eHevyUbyS0Vcbo
 auOmGl+t/Z8x5OLofp4VeF3JEccFHd58H1JkARk3/xAziR9dqF6bEzM+2ovwhz8WT9vf
 U6zo/BwNbjC4o+nwSpK6CiV9sa3HZ9Px/saqj583NpBTDa0e1yCsll7R9BYEAFaQE0b5
 Hfi1OxZ04dC18g79YRonCa3rJ0sJqoFIKX4pM5A9XsP4UsG9csLvoFiR60vrH3M98Pal
 ISUQ==
X-Gm-Message-State: AOAM533bfo9MPmouq5V1zzDzUzxpcWszc8rK7FStnrZJLqlKPqJ+36p3
 dQoWg6mEKxjexnnaatYC4eXHSxoYPmC0KuQvBY0=
X-Google-Smtp-Source: ABdhPJxriWfvD5SmyrnQVu7rEHJWAQ7O7blSRU5CVNeu7NV8u7lDotmjVEzEZgCXjX1hQQOxBmvZrw2h55bhzZrUU1I=
X-Received: by 2002:a17:906:d787:: with SMTP id
 pj7mr24442987ejb.340.1600264327311; 
 Wed, 16 Sep 2020 06:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
 <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
 <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
 <CA+js8L=dCJkE6y=GO2WNc0ufLaOXkx1BsMg3soCw+=wyDduPMQ@mail.gmail.com>
In-Reply-To: <CA+js8L=dCJkE6y=GO2WNc0ufLaOXkx1BsMg3soCw+=wyDduPMQ@mail.gmail.com>
From: David I <dav.sec.lists@gmail.com>
Date: Wed, 16 Sep 2020 15:51:56 +0200
Message-ID: <CA+js8LnzTkPtQXhQ-N85rM4Qd3HC2SpRQ5ZoSzh4CVx92tNYNQ@mail.gmail.com>
Subject: Re: Compiling Xen from source
To: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/alternative; boundary="000000000000c6b65f05af6e9250"
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

--000000000000c6b65f05af6e9250
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Examples of compile bugs for xen-stable-4.11
for make dist-tools:

"include/ipxe/uri.h:178:12: error: taking address of packed member of
=E2=80=98struct uri=E2=80=99 may result in an unaligned pointer value
[-Werror=3Daddress-of-packed-member]
  178 |  ref_get ( &uri->refcnt );"
-> fixed by adding the Cflag "-Wno-address-of-packed-member" in the
Makefile (not sure this is the right solution !).

next firmware error:
"drivers/infiniband/flexboot_nodnic.c: In function
=E2=80=98flexboot_nodnic_create_qp=E2=80=99:
drivers/infiniband/flexboot_nodnic.c:368:53: error: implicit conversion
from =E2=80=98enum ib_queue_pair_type=E2=80=99 to =E2=80=98nodnic_queue_pai=
r_type=E2=80=99
[-Werror=3Denum-conversion]"
-> fixed by adding the flag -Wno-enum-conversion in the same
tools/firmware/etherboot/ipxe/src/Makefile

(some other compile errors and dirty tricks not included)

So, how did the debian package was compiled ? is this the same source code
with different options ?

David








Le mer. 16 sept. 2020 =C3=A0 15:22, David I <dav.sec.lists@gmail.com> a =C3=
=A9crit :

> Hello,
>
> thanks for your infos. it appears the compilation process is not really
> straightforward.
> I had to patch some header files. then some of the firmwares were bugged.
> So I disabled some various checks in the firmwares  Makefiles.
> I ended up with a:
> "no target for make all":
> configure passed all tests with werror disabled, but failed some tests
> with werror enabled.
>
> finally "make dist-xen" always succeeds", but "make dist-tools" seems not
> bug-free.
>
> So if you have additional advice I will try further. Also if you need
> volunteers to test extensively maybe i can help.
>
> David
>
>
>
>
> Le mer. 16 sept. 2020 =C3=A0 00:34, Hans van Kranenburg <hans@knorrie.org=
> a
> =C3=A9crit :
>
>> Hi,
>>
>> On 9/16/20 12:00 AM, Andrew Cooper wrote:
>> > On 15/09/2020 21:16, David I wrote:
>> >> Hello,
>> >>
>> >> I am unable to mcompile xen-tools from source.
>> >>
>> >> here is the "stacktrace":
>> >>
>> >> ln -f xenstore xenstore-watch
>> >> gcc xenstore_control.o
>> >>
>>  -Wl,-rpath-link=3D/home/david/xen/xen/tools/xenstore/../../tools/libs/t=
oolcore
>> >> /home/david/xen/xen/tools/xenstore/../../tools/xenstore/libxenstore.s=
o
>> >> -ldl
>> >>
>>  /home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/libxentool=
core.so
>> >>  -o xenstore-control
>> >> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
>> >> -Wstrict-prototypes -Wdeclaration-after-statement
>> >> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
>> >> -fomit-frame-pointer
>> >> -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -=
MF
>> >> .xs_tdb_dump.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror
>> >> -I. -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
>> >> -I./include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >>
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/incl=
ude
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >>
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/includ=
e
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -D__XEN_TOOLS__
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/includ=
e
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -DXEN_LIB_STORED=3D"\"/var/lib/xenstored\""
>> >> -DXEN_RUN_STORED=3D"\"/var/run/xenstored\""   -c -o xs_tdb_dump.o
>> >> xs_tdb_dump.c
>> >> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
>> >> -Wstrict-prototypes -Wdeclaration-after-statement
>> >> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
>> >> -fomit-frame-pointer
>> >> -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -=
MF
>> >> .utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -I.
>> >> -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
>> >> -I./include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >>
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/incl=
ude
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >>
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/includ=
e
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -D__XEN_TOOLS__
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/includ=
e
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> >> -DXEN_LIB_STORED=3D"\"/var/lib/xenstored\""
>> >> -DXEN_RUN_STORED=3D"\"/var/run/xenstored\""
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/gnttab/include
>> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include  -c -o
>> >> utils.o utils.c
>> >> gcc xs_tdb_dump.o utils.o tdb.o talloc.o     -o xs_tdb_dump
>> >> /usr/bin/ld : utils.o:(.data.rel.local+0x0) : d=C3=A9finitions multip=
les de
>> >> =C2=AB xprintf =C2=BB; xs_tdb_dump.o:(.bss+0x0) : d=C3=A9fini pour la=
 premi=C3=A8re fois
>> ici
>> >> collect2: error: ld returned 1 exit status
>> >> make[4]: *** [Makefile:97 : xs_tdb_dump] Erreur 1
>> >> make[4] : on quitte le r=C3=A9pertoire
>> =C2=AB /home/david/xen/xen/tools/xenstore =C2=BB
>> >> make[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 :
>> >> subdir-install-xenstore] Erreur 2
>> >> make[3] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/too=
ls =C2=BB
>> >> make[2]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:244 :
>> >> subdirs-install] Erreur 2
>> >> make[2] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/too=
ls =C2=BB
>> >> make[1]: *** [Makefile:74 : install] Erreur 2
>> >> make[1] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/too=
ls =C2=BB
>> >> make: *** [Makefile:127 : install-tools] Erreur 2
>> >> david@debian:~/xen/xen$ uname -a
>> >> Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64
>> >> GNU/Linux
>> >> david@debian:~/xen/xen$ gcc --version
>> >> gcc (Debian 10.2.0-5) 10.2.0
>> >> Copyright (C) 2020 Free Software Foundation, Inc.
>> >> This is free software; see the source for copying conditions.  There
>> is NO
>> >> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>> >> PURPOSE.
>> >>
>> >> david@debian:~/xen/xen$ /usr/bin/ld --version
>> >> GNU ld (GNU Binutils for Debian) 2.35
>> >> Copyright (C) 2020 Free Software Foundation, Inc.
>> >> Ce logiciel est libre; si vous le redistribuez, vous devez le faire
>> >> selon les termes
>> >> de la licence GNU General Public License version 3 ou post=C3=A9rieur=
e
>> >> selon votre besoin.
>> >> Ce logiciel n'est couvert par aucune GARANTIE.
>> >> david@debian:~/xen/xen$ git branch
>> >>   master
>> >> * stable-4.11
>> >>   staging
>> >> david@debian:~/xen/xen$
>> >>
>> >> I was able to compile dist-xen correctly though. But dist-tools fails
>> >> with this error, I have seen a similar request here:
>> >>
>> https://stackoverflow.com/questions/63525163/usr-bin-ld-utils-o-data-rel=
-local0x0-multiple-definition-of-xprintf-xs
>> >>
>> >> I have tried to compile xen from source also on this same
>> configuration,
>> >> in stable-4.12, stable-4.13, stable-4.14, each time I was able to
>> >> compile xen but failed to compile xen-tools.
>> >> the debian package works fine and is in version 4.11.
>> >>
>> >> So my question would be, is there a patch for this issue ? and how th=
e
>> >> debian team could compile originally the debian source package ? I
>> >> suppose I am not the first user to encounter this.
>> >>
>> >> Thank you for your answers ;-)
>> >
>> > Its a change in the toolchain from -fcommon to -fno-common by default.
>> >
>> > Already fixed upstream by:
>> >
>> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Ddacdbf708=
8d6a3705a9831e73991c2b14c519a65
>> >
>> > Looks like that change wants backporting.
>>
>> Currently, I'm working together with Ian to get Xen 4.14 into Debian
>> unstable. dacdbf708 is in 4.14 already, but we also had to pick
>>
>> d25cc3ec93eb ("libxl: workaround gcc 10.2 maybe-uninitialized warning")
>>
>> and
>>
>> fff1b7f50e75 ("libxl: fix -Werror=3Dstringop-truncation in
>> libxl__prepare_sockaddr_un")
>>
>> into 4.14 to fix further gcc 10 FTBFS (yay, backport candidates). Maybe
>> this info helps a bit if you also run into these issues after fixing the
>> first one.
>>
>> Hans
>>
>

--000000000000c6b65f05af6e9250
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Examples of compile bugs for xen-stable-4.11</div><di=
v>for make dist-tools:</div><div><br></div><div>&quot;include/ipxe/uri.h:17=
8:12: error: taking address of packed member of =E2=80=98struct uri=E2=80=
=99 may result in an unaligned pointer value [-Werror=3Daddress-of-packed-m=
ember]<br>=C2=A0 178 | =C2=A0ref_get ( &amp;uri-&gt;refcnt );&quot;</div><d=
iv>-&gt; fixed by adding the Cflag &quot;-Wno-address-of-packed-member&quot=
; in the Makefile (not sure this is the right solution !).</div><div><br></=
div><div>next firmware error:</div><div>&quot;drivers/infiniband/flexboot_n=
odnic.c: In function =E2=80=98flexboot_nodnic_create_qp=E2=80=99:<br>driver=
s/infiniband/flexboot_nodnic.c:368:53: error: implicit conversion from =E2=
=80=98enum ib_queue_pair_type=E2=80=99 to =E2=80=98nodnic_queue_pair_type=
=E2=80=99 [-Werror=3Denum-conversion]&quot;</div><div>-&gt; fixed by adding=
 the flag -Wno-enum-conversion in the same tools/firmware/etherboot/ipxe/sr=
c/Makefile</div><div><br></div><div>(some other compile errors and dirty tr=
icks not included)</div><div><br></div><div>So, how did the debian package =
was compiled ? is this the same source code with different options ?</div><=
div><br></div><div>David<br></div><div><br></div><div><br></div><div><br></=
div><div><br></div><div><br></div><div><br></div><div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer=
. 16 sept. 2020 =C3=A0=C2=A015:22, David I &lt;<a href=3D"mailto:dav.sec.li=
sts@gmail.com">dav.sec.lists@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>He=
llo,</div><div><br></div><div>thanks for your infos. it appears the compila=
tion process is not really straightforward.</div><div>I had to patch some h=
eader files. then some of the firmwares were bugged.</div><div>So I disable=
d some various checks in the firmwares=C2=A0 Makefiles.</div><div>I ended u=
p with a:</div><div>&quot;no target for make all&quot;:</div><div>configure=
 passed all tests with werror disabled, but failed some tests with werror e=
nabled.</div><div><br></div><div>finally &quot;make dist-xen&quot; always s=
ucceeds&quot;, but &quot;make dist-tools&quot; seems not bug-free.</div><di=
v><br></div><div>So if you have additional advice I will try further. Also =
if you need volunteers to test extensively maybe i can help.</div><div><br>=
</div><div>David<br></div><div><br></div><div><br></div><div><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0mer. 16 sept. 2020 =C3=A0=C2=A000:34, Hans van Kranenburg &lt;<a href=
=3D"mailto:hans@knorrie.org" target=3D"_blank">hans@knorrie.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi,<br>
<br>
On 9/16/20 12:00 AM, Andrew Cooper wrote:<br>
&gt; On 15/09/2020 21:16, David I wrote:<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; I am unable to mcompile xen-tools from source.<br>
&gt;&gt;<br>
&gt;&gt; here is the &quot;stacktrace&quot;:<br>
&gt;&gt;<br>
&gt;&gt; ln -f xenstore xenstore-watch<br>
&gt;&gt; gcc xenstore_control.o =C2=A0 =C2=A0<br>
&gt;&gt; =C2=A0-Wl,-rpath-link=3D/home/david/xen/xen/tools/xenstore/../../t=
ools/libs/toolcore<br>
&gt;&gt; /home/david/xen/xen/tools/xenstore/../../tools/xenstore/libxenstor=
e.so<br>
&gt;&gt; -ldl<br>
&gt;&gt; =C2=A0/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore=
/libxentoolcore.so<br>
&gt;&gt; =C2=A0-o xenstore-control<br>
&gt;&gt; gcc =C2=A0-m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall<=
br>
&gt;&gt; -Wstrict-prototypes -Wdeclaration-after-statement<br>
&gt;&gt; -Wno-unused-but-set-variable -Wno-unused-local-typedefs =C2=A0 -O2=
<br>
&gt;&gt; -fomit-frame-pointer<br>
&gt;&gt; -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MM=
D -MF<br>
&gt;&gt; .xs_tdb_dump.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =C2=A0 =
-Werror<br>
&gt;&gt; -I. -include /home/david/xen/xen/tools/xenstore/../../tools/config=
.h<br>
&gt;&gt; -I./include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/inclu=
de<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/incl=
ude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemor=
y/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/=
include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -D__XEN_TOOLS__<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/inc=
lude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -DXEN_LIB_STORED=3D&quot;\&quot;/var/lib/xenstored\&quot;&quot;<br=
>
&gt;&gt; -DXEN_RUN_STORED=3D&quot;\&quot;/var/run/xenstored\&quot;&quot; =
=C2=A0 -c -o xs_tdb_dump.o<br>
&gt;&gt; xs_tdb_dump.c<br>
&gt;&gt; gcc =C2=A0-m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall<=
br>
&gt;&gt; -Wstrict-prototypes -Wdeclaration-after-statement<br>
&gt;&gt; -Wno-unused-but-set-variable -Wno-unused-local-typedefs =C2=A0 -O2=
<br>
&gt;&gt; -fomit-frame-pointer<br>
&gt;&gt; -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MM=
D -MF<br>
&gt;&gt; .utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =C2=A0 -Werro=
r -I.<br>
&gt;&gt; -include /home/david/xen/xen/tools/xenstore/../../tools/config.h<b=
r>
&gt;&gt; -I./include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/inclu=
de<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/incl=
ude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemor=
y/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/=
include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -D__XEN_TOOLS__<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/inc=
lude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -DXEN_LIB_STORED=3D&quot;\&quot;/var/lib/xenstored\&quot;&quot;<br=
>
&gt;&gt; -DXEN_RUN_STORED=3D&quot;\&quot;/var/run/xenstored\&quot;&quot; =
=C2=A0<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/gnttab/inclu=
de<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include =C2=A0-c =
-o<br>
&gt;&gt; utils.o utils.c<br>
&gt;&gt; gcc xs_tdb_dump.o utils.o tdb.o talloc.o =C2=A0 =C2=A0 -o xs_tdb_d=
ump<br>
&gt;&gt; /usr/bin/ld=C2=A0: utils.o:(.data.rel.local+0x0)=C2=A0: d=C3=A9fin=
itions multiples de<br>
&gt;&gt; =C2=AB=C2=A0xprintf=C2=A0=C2=BB; xs_tdb_dump.o:(.bss+0x0)=C2=A0: d=
=C3=A9fini pour la premi=C3=A8re fois ici<br>
&gt;&gt; collect2: error: ld returned 1 exit status<br>
&gt;&gt; make[4]: *** [Makefile:97 : xs_tdb_dump] Erreur 1<br>
&gt;&gt; make[4]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools/xenstore=C2=A0=C2=BB<br>
&gt;&gt; make[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 :<br=
>
&gt;&gt; subdir-install-xenstore] Erreur 2<br>
&gt;&gt; make[3]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools=C2=A0=C2=BB<br>
&gt;&gt; make[2]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:244 :<br=
>
&gt;&gt; subdirs-install] Erreur 2<br>
&gt;&gt; make[2]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools=C2=A0=C2=BB<br>
&gt;&gt; make[1]: *** [Makefile:74 : install] Erreur 2<br>
&gt;&gt; make[1]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools=C2=A0=C2=BB<br>
&gt;&gt; make: *** [Makefile:127 : install-tools] Erreur 2<br>
&gt;&gt; david@debian:~/xen/xen$ uname -a<br>
&gt;&gt; Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86=
_64<br>
&gt;&gt; GNU/Linux<br>
&gt;&gt; david@debian:~/xen/xen$ gcc --version<br>
&gt;&gt; gcc (Debian 10.2.0-5) 10.2.0<br>
&gt;&gt; Copyright (C) 2020 Free Software Foundation, Inc.<br>
&gt;&gt; This is free software; see the source for copying conditions.=C2=
=A0 There is NO<br>
&gt;&gt; warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR=
<br>
&gt;&gt; PURPOSE.<br>
&gt;&gt;<br>
&gt;&gt; david@debian:~/xen/xen$ /usr/bin/ld --version<br>
&gt;&gt; GNU ld (GNU Binutils for Debian) 2.35<br>
&gt;&gt; Copyright (C) 2020 Free Software Foundation, Inc.<br>
&gt;&gt; Ce logiciel est libre; si vous le redistribuez, vous devez le fair=
e<br>
&gt;&gt; selon les termes<br>
&gt;&gt; de la licence GNU General Public License version 3 ou post=C3=A9ri=
eure<br>
&gt;&gt; selon votre besoin.<br>
&gt;&gt; Ce logiciel n&#39;est couvert par aucune GARANTIE.<br>
&gt;&gt; david@debian:~/xen/xen$ git branch<br>
&gt;&gt; =C2=A0 master<br>
&gt;&gt; * stable-4.11<br>
&gt;&gt; =C2=A0 staging<br>
&gt;&gt; david@debian:~/xen/xen$<br>
&gt;&gt;<br>
&gt;&gt; I was able to compile dist-xen correctly though. But dist-tools fa=
ils<br>
&gt;&gt; with this error, I have seen a similar request here:<br>
&gt;&gt; <a href=3D"https://stackoverflow.com/questions/63525163/usr-bin-ld=
-utils-o-data-rel-local0x0-multiple-definition-of-xprintf-xs" rel=3D"norefe=
rrer" target=3D"_blank">https://stackoverflow.com/questions/63525163/usr-bi=
n-ld-utils-o-data-rel-local0x0-multiple-definition-of-xprintf-xs</a><br>
&gt;&gt;<br>
&gt;&gt; I have tried to compile xen from source also on this same configur=
ation,<br>
&gt;&gt; in stable-4.12, stable-4.13, stable-4.14, each time I was able to=
=C2=A0<br>
&gt;&gt; compile xen but failed to compile xen-tools.<br>
&gt;&gt; the debian package works fine and is in version 4.11.<br>
&gt;&gt;<br>
&gt;&gt; So my question would be, is there a patch for this issue ? and how=
 the<br>
&gt;&gt; debian team could compile originally the debian source package ? I=
<br>
&gt;&gt; suppose I am not the first user to encounter this.<br>
&gt;&gt;<br>
&gt;&gt; Thank you for your answers ;-)<br>
&gt; <br>
&gt; Its a change in the toolchain from -fcommon to -fno-common by default.=
<br>
&gt; <br>
&gt; Already fixed upstream by:=C2=A0<br>
&gt; <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;=
h=3Ddacdbf7088d6a3705a9831e73991c2b14c519a65" rel=3D"noreferrer" target=3D"=
_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Ddacd=
bf7088d6a3705a9831e73991c2b14c519a65</a><br>
&gt; <br>
&gt; Looks like that change wants backporting.<br>
<br>
Currently, I&#39;m working together with Ian to get Xen 4.14 into Debian<br=
>
unstable. dacdbf708 is in 4.14 already, but we also had to pick<br>
<br>
d25cc3ec93eb (&quot;libxl: workaround gcc 10.2 maybe-uninitialized warning&=
quot;)<br>
<br>
and<br>
<br>
fff1b7f50e75 (&quot;libxl: fix -Werror=3Dstringop-truncation in<br>
libxl__prepare_sockaddr_un&quot;)<br>
<br>
into 4.14 to fix further gcc 10 FTBFS (yay, backport candidates). Maybe<br>
this info helps a bit if you also run into these issues after fixing the<br=
>
first one.<br>
<br>
Hans<br>
</blockquote></div>
</blockquote></div>

--000000000000c6b65f05af6e9250--

