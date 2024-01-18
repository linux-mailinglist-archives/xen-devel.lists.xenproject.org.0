Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5828314BB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 09:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668640.1040973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQNr2-0006am-NL; Thu, 18 Jan 2024 08:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668640.1040973; Thu, 18 Jan 2024 08:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQNr2-0006ZA-Jk; Thu, 18 Jan 2024 08:34:28 +0000
Received: by outflank-mailman (input) for mailman id 668640;
 Thu, 18 Jan 2024 08:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fErA=I4=gmail.com=simonpatp@srs-se1.protection.inumbo.net>)
 id 1rQNr1-0006Z2-12
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 08:34:27 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6364b6ab-b5dc-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 09:34:26 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd8b661cb8so72887481fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 00:34:26 -0800 (PST)
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
X-Inumbo-ID: 6364b6ab-b5dc-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705566865; x=1706171665; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X0P/v9GSeqllySukQpyKAbHnNpPpvlL6m8f2U2bhNA8=;
        b=bJwCGuYT+YzbV48e4OURAw0D7bDDDaBRU4HP8KkB0vLf4/vM6zzw0PIy4F1+ssEZy/
         DvKvDl6WlY7pSCvOTGLBQ2Ibnim4Q2k1J4ivBzKBj7TrbMI1Ho6lplMymi1S3zUF1YlQ
         KKWhhfG2QrYgbK0c3pASrMtqWaCVU5Gf3x/VmlZXErzl0opfzjr+whRYBalr9ftaBS41
         JJQO4eZIajLgT3cVcCUDtdbmaO9af7clq6x1N1RfELBpEo0g6Vniaau/lzPSjd4k51Zn
         WgADhs1StStUm+pN26WDc18qGSaVRwa+fg78m60KBN5CPKQ6UNy2TSMq8C5hGCq/ABVE
         b+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705566865; x=1706171665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0P/v9GSeqllySukQpyKAbHnNpPpvlL6m8f2U2bhNA8=;
        b=alLi8pchgdLSvQTvcPLZ8EfHgjNaV/WJDcDyhYZc74TfsWJhz++zYIuEwZwpKNb7ts
         Bniiv3CDOGOPtU5vxB1yA0SenCCIU9ukXt8v04Ti30M+Mt4gFR1gCZWLsXb9QQDdjY+J
         uoIdVgljJCPHQGvloqX/Ksbt8VqYgcmQV690PUG6VU/QmZiyEiluDCbXMU16ukwT7xon
         yAnsA9ORYEF7HjgYBPnDhtDWnnQefmwIAFa6G2zERaDwnLleecomZD3kI1MAlVOn1b5q
         pk/cQt/6Y+6nbAgwSmZLn0eN1Su6n5HlUdHegXVshRraG4ak9HFHkdZAcUntkjBwOsXh
         QA9Q==
X-Gm-Message-State: AOJu0YxUkkVdtBxlNl96oqc7yX9oTu4fsyDfFdVg3QfFy8GTVNy1rbmg
	om6aZ3PQXxLCNG5bbNSzY4f6QweOzGQ16CmDYLkBff/KlsKxwHMMXTNx+wSGS9v8eUzRTubZ7u1
	CH7tdsARBACJmLC9vE2LgpCp7qww=
X-Google-Smtp-Source: AGHT+IHnyhkMXu+Nqa1SYcgYtrB3YVcHIB3el58KAlKF0v1gbPQAuSlyE99tyH0pN0VAep/xY29v3J8P4EcHhFhRr80=
X-Received: by 2002:a2e:3e18:0:b0:2cb:2d0f:6c5a with SMTP id
 l24-20020a2e3e18000000b002cb2d0f6c5amr172800lja.41.1705566865269; Thu, 18 Jan
 2024 00:34:25 -0800 (PST)
MIME-Version: 1.0
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com> <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com> <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook>
In-Reply-To: <Zajg1O7Z52VTBq31@macbook>
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Thu, 18 Jan 2024 03:34:13 -0500
Message-ID: <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000252a24060f343b24"

--000000000000252a24060f343b24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 3:27=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com>
wrote:

> On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> > On Wed, Jan 17, 2024 at 3:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >
> > > On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > > > On Tue, Jan 16, 2024 at 4:33=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com>
> wrote:
> > > >
> > > >> On 16.01.2024 01:22, Patrick Plenefisch wrote:
> > For the two logs that actually boooted (linuxoffset), I truncated them
> > during pcie initialization, but they did go all the way to give me a
> login
> > screen
>
> I'm not seeing any Linux output on the provided logs, they just seem
> to contain Xen output ...
>
> > >
> > > > As someone who hasn't built a kernel in over a decade, should I
> figure
> > > out
> > > > how to do a kernel build with CONFIG_PHYSICAL_START=3D0x2000000 and
> report
> > > > back?
> > >
> > > That was largely a suggestion to perhaps allow you to gain some
> > > workable setup. It would be of interest to us largely for completenes=
s.
> > >
> >
> > Typo aside, setting the boot to 2MiB works! It works better for PV, whi=
le
> > PVH has some graphics card issues, namely that I have to interact over
> > serial and dmesg has some concerning radeon errors
>
> ... and so the radeon error mentioned here seem to be missing.  IIRC
> for radeon cards to work on PVH dom0 you will need an hypervisor with
> the following commit:
>
>
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Df69c5991595c92=
756860d038346569464c1b9ea1
>
> (included in 4.18)
>

hmm.. that would mean I was running with them as I used 4.18 for that run


>
> There where also some changes not long ago in order to propagate the
> video console information from Xen into dom0, those are also included
> in 4.18, but I don't recall in which Linux version they landed.
>
> Anyway, would be good if you can provide the full Xen + Linux logs
> when the radeon issue happens.
>

Luckily linux logs are mercifully short. Append this to
xen-4.18p_grub_linuxoffset_pvh.log:

[    0.778770] i2c_designware AMDI0010:00: Unknown Synopsys component type:
0xffffffff
[    0.914664] amd_gpio AMDI0030:00: error -EINVAL: IRQ index 0 not found
[    0.930112] xen_mcelog: Failed to get CPU numbers
[    8.324907] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)
[    8.338604] sp5100-tco sp5100-tco: Watchdog hardware is disabled
[    8.909366] [drm:radeon_get_bios [radeon]] *ERROR* ACPI VFCT table
present but broken (too short #2)

Debian GNU/Linux 12 testos hvc0

[   11.891845] amdgpu 0000:01:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]]
*ERROR* IB test failed on uvd (-110).
[   12.915854] amdgpu 0000:01:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]]
*ERROR* IB test failed on uvd_enc0 (-110).
[   13.939868] amdgpu 0000:01:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]]
*ERROR* IB test failed on uvd_enc1 (-110).
[   15.059840] amdgpu 0000:01:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]]
*ERROR* IB test failed on vce0 (-110).






>
> Regards, Roger.
>

--000000000000252a24060f343b24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 18, 2024 at 3:27=E2=80=AF=
AM Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.p=
au@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch w=
rote:<br>
&gt; On Wed, Jan 17, 2024 at 3:46=E2=80=AFAM Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<b=
r>
&gt; <br>
&gt; &gt; On 17.01.2024 07:12, Patrick Plenefisch wrote:<br>
&gt; &gt; &gt; On Tue, Jan 16, 2024 at 4:33=E2=80=AFAM Jan Beulich &lt;<a h=
ref=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt=
; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; On 16.01.2024 01:22, Patrick Plenefisch wrote:<br>
&gt; For the two logs that actually boooted (linuxoffset), I truncated them=
<br>
&gt; during pcie initialization, but they did go all the way to give me a l=
ogin<br>
&gt; screen<br>
<br>
I&#39;m not seeing any Linux output on the provided logs, they just seem<br=
>
to contain Xen output ...<br>
<br>
&gt; &gt;<br>
&gt; &gt; &gt; As someone who hasn&#39;t built a kernel in over a decade, s=
hould I figure<br>
&gt; &gt; out<br>
&gt; &gt; &gt; how to do a kernel build with CONFIG_PHYSICAL_START=3D0x2000=
000 and report<br>
&gt; &gt; &gt; back?<br>
&gt; &gt;<br>
&gt; &gt; That was largely a suggestion to perhaps allow you to gain some<b=
r>
&gt; &gt; workable setup. It would be of interest to us largely for complet=
eness.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Typo aside, setting the boot to 2MiB works! It works better for PV, wh=
ile<br>
&gt; PVH has some graphics card issues, namely that I have to interact over=
<br>
&gt; serial and dmesg has some concerning radeon errors<br>
<br>
... and so the radeon error mentioned here seem to be missing.=C2=A0 IIRC<b=
r>
for radeon cards to work on PVH dom0 you will need an hypervisor with<br>
the following commit:<br>
<br>
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Df69c5=
991595c92756860d038346569464c1b9ea1" rel=3D"noreferrer" target=3D"_blank">h=
ttps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Df69c5991595c92756=
860d038346569464c1b9ea1</a><br>
<br>
(included in 4.18)<br></blockquote><div><br></div><div>hmm.. that would mea=
n I was running with them as I used 4.18 for that run</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
There where also some changes not long ago in order to propagate the<br>
video console information from Xen into dom0, those are also included<br>
in 4.18, but I don&#39;t recall in which Linux version they landed.<br>
<br>
Anyway, would be good if you can provide the full Xen + Linux logs<br>
when the radeon issue happens.<br></blockquote><div><br></div><div>Luckily =
linux logs are mercifully short. Append this to xen-4.18p_grub_linuxoffset_=
pvh.log:</div><div><br></div><div>[ =C2=A0 =C2=A00.778770] i2c_designware A=
MDI0010:00: Unknown Synopsys component type: 0xffffffff<br>[ =C2=A0 =C2=A00=
.914664] amd_gpio AMDI0030:00: error -EINVAL: IRQ index 0 not found<br>[ =
=C2=A0 =C2=A00.930112] xen_mcelog: Failed to get CPU numbers<br>[ =C2=A0 =
=C2=A08.324907] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)<br>[ =C2=
=A0 =C2=A08.338604] sp5100-tco sp5100-tco: Watchdog hardware is disabled<br=
>[ =C2=A0 =C2=A08.909366] [drm:radeon_get_bios [radeon]] *ERROR* ACPI VFCT =
table present but broken (too short #2)<br><br>Debian GNU/Linux 12 testos h=
vc0<br><br>[ =C2=A0 11.891845] amdgpu 0000:01:00.0: [drm:amdgpu_ib_ring_tes=
ts [amdgpu]] *ERROR* IB test failed on uvd (-110).<br>[ =C2=A0 12.915854] a=
mdgpu 0000:01:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test fai=
led on uvd_enc0 (-110).<br>[ =C2=A0 13.939868] amdgpu 0000:01:00.0: [drm:am=
dgpu_ib_ring_tests [amdgpu]] *ERROR* IB test failed on uvd_enc1 (-110).<br>=
[ =C2=A0 15.059840] amdgpu 0000:01:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]=
] *ERROR* IB test failed on vce0 (-110).</div><div><br></div><div><br></div=
><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Regards, Roger.<br>
</blockquote></div></div>

--000000000000252a24060f343b24--

