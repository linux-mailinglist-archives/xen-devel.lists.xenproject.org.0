Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220234665F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 18:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100763.192193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkrB-0007uo-Tg; Tue, 23 Mar 2021 17:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100763.192193; Tue, 23 Mar 2021 17:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkrB-0007uP-Pk; Tue, 23 Mar 2021 17:30:17 +0000
Received: by outflank-mailman (input) for mailman id 100763;
 Tue, 23 Mar 2021 17:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1RZV=IV=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lOkrA-0007uI-86
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:30:16 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 140da63a-728f-4ea6-bd66-34e4cdb7b609;
 Tue, 23 Mar 2021 17:30:14 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id y5so13622641qkl.9
 for <xen-devel@lists.xenproject.org>; Tue, 23 Mar 2021 10:30:13 -0700 (PDT)
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
X-Inumbo-ID: 140da63a-728f-4ea6-bd66-34e4cdb7b609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ziSM+HJ4nYNyql8iGyA9YRXdNLvUCpWt7pacIO7qJes=;
        b=f1nZiT9HFSAxRv0NszJEPC1y5idwqCD5UT6S4IzlEDBghEMlJw7aaJ0pLU/zvkSglY
         uR603/WiHDPjUsTKtHzeGR5r4Vog2hWpUVCizH6NXW1+z+u9vVZjc3K4ZR9HF4i6B/J+
         tkEAeEYIgtz09rY3TdDdZELXdHTB5w/+KA8ijaqafxPSv10LIYS/h7DSBes7n/X3Y7Vi
         rCDAiHyRlyCJvVKxNr0cB4CMqspDGzjS7IbuPcmLVjsPOMhGtxtmEdJJLnZlgDN/gvtL
         pWUlYQzTMjWg+UiBTP1F+t56bTLPmijb8tzFJUqn7Jp8xW15X6MVQitW767fs7BnZGyR
         CBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ziSM+HJ4nYNyql8iGyA9YRXdNLvUCpWt7pacIO7qJes=;
        b=Km9hM6RYdU3a/4zlyaggUmHnGCC28hCiyXBhjje7rSHEnZ8TZX1FsUzkiThqAoMpZL
         pTaTVXUzmwnTIZq/L8/BbYebIwt2m2cr0fjIVEoni6AfNteL2tL5ycSX67xlu08hfa0U
         O0/wb/79ylXDsr5otnrG2qEE8hNgK/9zFSPam2cvRm/34cNQFZSvjHucM8JjAmpkEfgR
         vZLz7Y5UGA3Z2x5bGcYv3q8SzQYLD5a5BPWrRSARMP3AVOk5XN58edxngHb6Z4vjShwD
         bxfbj0/dCjFC9zqrO2IH2Z26GfTT7eOdztVeNPOwxckPPBMHhBuOAYroa/dmSZQzHLk/
         NwlA==
X-Gm-Message-State: AOAM532szZi+czp4RkJfIsTcyHimkdGYcKR84kQe32uApOWAgvV1Jceh
	/rwdrbdP1/dnjGOf4KX3J8vaAfb88kxxrYWme6YdOQ==
X-Google-Smtp-Source: ABdhPJyqMyhMSLuPxWTMJl3ke4iT2aWMiQO6tW9FQsFG/0ZO7OYb60K5kxiKYsKPwo/bjp5Udx5iKVef2G3wg0UeaLs=
X-Received: by 2002:a05:620a:4e6:: with SMTP id b6mr6516819qkh.157.1616520613587;
 Tue, 23 Mar 2021 10:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210322133301.11308-1-jandryuk@gmail.com> <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com> <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
 <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com> <9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com>
 <CAKf6xpvGit4YiuTfGuX2iZ1qPi-a+oNK2bassUxGd8qJADEXyQ@mail.gmail.com> <4b0ac6fa-cbe2-5b3c-fa61-52d743e07390@suse.com>
In-Reply-To: <4b0ac6fa-cbe2-5b3c-fa61-52d743e07390@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 23 Mar 2021 10:30:02 -0700
Message-ID: <CAMmSBy_p83-wysWx0xfvRcUSmjc=+KvBRBySH+bzNBi7N=yonQ@mail.gmail.com>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000f201c805be378878"

--000000000000f201c805be378878
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 6:36 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 23.03.2021 13:34, Jason Andryuk wrote:
> > On Tue, Mar 23, 2021 at 3:23 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 22.03.2021 18:08, Andrew Cooper wrote:
> >>> On 22/03/2021 15:15, Jan Beulich wrote:
> >>>> On 22.03.2021 15:59, Andrew Cooper wrote:
> >>>>> On 22/03/2021 14:52, Jan Beulich wrote:
> >>>>>> On 22.03.2021 14:33, Jason Andryuk wrote:
> >>>>>>> make install-xen fails when EFI_VENDOR is set (=fedora) with:
> >>>>>>> install: cannot create regular file
> '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No
> such file or directory
> >>>>>>>
> >>>>>>> Create the EFI_VENDOR directory so xen.efi can be installed within.
> >>>>>>>
> >>>>>>> This removes the need for Fedora and Qubes xen.spec files to
> manually
> >>>>>>> create the directory in advance.
> >>>>>> While I'm not strictly against, I'd like to point out that it was
> >>>>>> deliberate to not create this directory here. I also didn't expect
> >>>>>> anyone's xen.spec to do so. Instead I'd expect the distro to create
> >>>>>> it during OS installation. If this was a bad assumption, I'd prefer
> >>>>>> if the commit message here could point out why such an expectation
> >>>>>> won't hold in general.
> >>>>> This reasoning is broken for anything other `make install DESTDIR=/`
> on
> >>>>> a live system.
> >>>>>
> >>>>> It is incompatible with how RPM, deb, etc packages work.
> >>>> I'm afraid I don't understand, for both of your statements. If distro
> >>>> installation put in place the designated directory, there wouldn't be
> >>>> any live system lacking it, and there wouldn't be any concern in the
> >>>> packaging of any software.
> >>>>
> >>>> To take a perhaps too extreme example - packages typically expect e.g.
> >>>> /usr to exist as well, don't they?
> >>>
> >>> No.  A buildroot starts out fully empty, by design.
> >>>
> >>> The packaging environment (usually a chroot) invokes `make install
> >>> DESTDIR=/path/to/staging/root` so you don't interfere with any of the
> >>> tools inside the environment, and the resulting tar/cpio has the
> >>> buildroot stripped out of paths.
> >>>
> >>> The failure being discussed here is the build within the packaging
> >>> environment, not the metadata which forms the final package.
> Installing
> >>> a deb/rpm/etc will make directories as applicable.
> >>
> >> Ah, I see. But then this _still_ isn't the right thing to do. In fact,
> >> the package build and installation shouldn't put xen.efi in the EFI
> >> partition _at all_. The build system doing so is for developers only,
> >> so they don't need to invoke boot loader configuration every time they
> >> rebuild and re-install. Hence the packaging build shouldn't set
> >> EFI_VENDOR in the first place. There it instead should be a subsequent
> >> boot loader re-configuration which picks up xen.efi from its install
> >> location (under $(EFI_DIR)) and places it on the EFI partition.
> >
> > On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/fedora/.
> > grub, shim, fwupdate and xen are all packaged that way.  It seems
> > reasonable to have those important binaries tracked by the package
> > manager.
> >
> > Does SuSE populate EFI_VENDOR from EFI_DIR when some boot loader
> > script is called?
>
> Yes. And back at the time, when I consulted our EFI person, I was left
> with the impression that this is the only reasonable approach. The
> primary reason, as said, was that the EFI partition as a whole may get
> rebuilt perhaps even from scratch at any point. Hence it's not
> reasonable to expect package-managed files to live there. (This is
> also expressed by us installing xen.efi into two places, which ought
> to be a clear indication by itself that one of them is only to ease
> things, not for packaging.)
>

Big +1 to the above -- in running our own distro we've come to appreciate
that very point -- EFI partition is basically a cache and the source of
truth
is always elsewhere.

Thanks,
Roman.

--000000000000f201c805be378878
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Mar 23, 2021 at 6:36 AM Jan Beuli=
ch &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;border-left-color:rgb(204,204,204);padding-left:1ex">On 23.03.2021 13:34,=
 Jason Andryuk wrote:<br>
&gt; On Tue, Mar 23, 2021 at 3:23 AM Jan Beulich &lt;<a href=3D"mailto:jbeu=
lich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 22.03.2021 18:08, Andrew Cooper wrote:<br>
&gt;&gt;&gt; On 22/03/2021 15:15, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt; On 22.03.2021 15:59, Andrew Cooper wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 22/03/2021 14:52, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 22.03.2021 14:33, Jason Andryuk wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; make install-xen fails when EFI_VENDOR is set =
(=3Dfedora) with:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; install: cannot create regular file &#39;/home=
/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi&#39;: No such =
file or directory<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Create the EFI_VENDOR directory so xen.efi can=
 be installed within.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; This removes the need for Fedora and Qubes xen=
.spec files to manually<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; create the directory in advance.<br>
&gt;&gt;&gt;&gt;&gt;&gt; While I&#39;m not strictly against, I&#39;d like t=
o point out that it was<br>
&gt;&gt;&gt;&gt;&gt;&gt; deliberate to not create this directory here. I al=
so didn&#39;t expect<br>
&gt;&gt;&gt;&gt;&gt;&gt; anyone&#39;s xen.spec to do so. Instead I&#39;d ex=
pect the distro to create<br>
&gt;&gt;&gt;&gt;&gt;&gt; it during OS installation. If this was a bad assum=
ption, I&#39;d prefer<br>
&gt;&gt;&gt;&gt;&gt;&gt; if the commit message here could point out why suc=
h an expectation<br>
&gt;&gt;&gt;&gt;&gt;&gt; won&#39;t hold in general.<br>
&gt;&gt;&gt;&gt;&gt; This reasoning is broken for anything other `make inst=
all DESTDIR=3D/` on<br>
&gt;&gt;&gt;&gt;&gt; a live system.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; It is incompatible with how RPM, deb, etc packages wor=
k.<br>
&gt;&gt;&gt;&gt; I&#39;m afraid I don&#39;t understand, for both of your st=
atements. If distro<br>
&gt;&gt;&gt;&gt; installation put in place the designated directory, there =
wouldn&#39;t be<br>
&gt;&gt;&gt;&gt; any live system lacking it, and there wouldn&#39;t be any =
concern in the<br>
&gt;&gt;&gt;&gt; packaging of any software.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; To take a perhaps too extreme example - packages typically=
 expect e.g.<br>
&gt;&gt;&gt;&gt; /usr to exist as well, don&#39;t they?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; No.=C2=A0 A buildroot starts out fully empty, by design.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The packaging environment (usually a chroot) invokes `make ins=
tall<br>
&gt;&gt;&gt; DESTDIR=3D/path/to/staging/root` so you don&#39;t interfere wi=
th any of the<br>
&gt;&gt;&gt; tools inside the environment, and the resulting tar/cpio has t=
he<br>
&gt;&gt;&gt; buildroot stripped out of paths.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The failure being discussed here is the build within the packa=
ging<br>
&gt;&gt;&gt; environment, not the metadata which forms the final package.=
=C2=A0 Installing<br>
&gt;&gt;&gt; a deb/rpm/etc will make directories as applicable.<br>
&gt;&gt;<br>
&gt;&gt; Ah, I see. But then this _still_ isn&#39;t the right thing to do. =
In fact,<br>
&gt;&gt; the package build and installation shouldn&#39;t put xen.efi in th=
e EFI<br>
&gt;&gt; partition _at all_. The build system doing so is for developers on=
ly,<br>
&gt;&gt; so they don&#39;t need to invoke boot loader configuration every t=
ime they<br>
&gt;&gt; rebuild and re-install. Hence the packaging build shouldn&#39;t se=
t<br>
&gt;&gt; EFI_VENDOR in the first place. There it instead should be a subseq=
uent<br>
&gt;&gt; boot loader re-configuration which picks up xen.efi from its insta=
ll<br>
&gt;&gt; location (under $(EFI_DIR)) and places it on the EFI partition.<br=
>
&gt; <br>
&gt; On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/fedora/.=
<br>
&gt; grub, shim, fwupdate and xen are all packaged that way.=C2=A0 It seems=
<br>
&gt; reasonable to have those important binaries tracked by the package<br>
&gt; manager.<br>
&gt; <br>
&gt; Does SuSE populate EFI_VENDOR from EFI_DIR when some boot loader<br>
&gt; script is called?<br>
<br>
Yes. And back at the time, when I consulted our EFI person, I was left<br>
with the impression that this is the only reasonable approach. The<br>
primary reason, as said, was that the EFI partition as a whole may get<br>
rebuilt perhaps even from scratch at any point. Hence it&#39;s not<br>
reasonable to expect package-managed files to live there. (This is<br>
also expressed by us installing xen.efi into two places, which ought<br>
to be a clear indication by itself that one of them is only to ease<br>
things, not for packaging.)<br></blockquote><div><br></div><div>Big=C2=A0+1=
 to the above -- in running our own distro we&#39;ve come to appreciate</di=
v><div>that very point -- EFI partition is basically a cache and the source=
 of truth</div><div>is always elsewhere.</div><div><br></div><div>Thanks,</=
div><div>Roman.</div></div></div>

--000000000000f201c805be378878--

