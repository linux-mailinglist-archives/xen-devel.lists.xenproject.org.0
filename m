Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A716BF70F
	for <lists+xen-devel@lfdr.de>; Sat, 18 Mar 2023 01:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511319.790355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdKpH-0005v7-Vf; Sat, 18 Mar 2023 00:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511319.790355; Sat, 18 Mar 2023 00:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdKpH-0005sL-RJ; Sat, 18 Mar 2023 00:53:39 +0000
Received: by outflank-mailman (input) for mailman id 511319;
 Sat, 18 Mar 2023 00:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vRH5=7K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pdKpF-0005sF-Sr
 for xen-devel@lists.xenproject.org; Sat, 18 Mar 2023 00:53:38 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e8b2228-c527-11ed-87f5-c1b5be75604c;
 Sat, 18 Mar 2023 01:53:34 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B791D5C0074;
 Fri, 17 Mar 2023 20:53:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 17 Mar 2023 20:53:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 20:53:31 -0400 (EDT)
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
X-Inumbo-ID: 4e8b2228-c527-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1679100812; x=1679187212; bh=ECzM57txPj9Q7KLy1xZBRDrod5bpSSsqFaB
	FaWarXJs=; b=RM81rAYT3gJcUXrbqo0eH336JdcJnx6p/ba63pJdJTbktGZ4G3H
	WK6ZZiEP49PLCHUSrfN6n5pwO8F7p7guqWn2TKqV/vAaIkeA1DgPdtTVd6hz5qhD
	jURQ+2tH+x/nBPHtsDVkQ+m2LERrMct0aNkzZccsAohFQiKWqkPQexjBUCvO9o2w
	7mBAt+WUphWcQ3ni6S7VwaWV9seTAWCJubMIRU8OGx6VNPOc6nL4+ThFkxWbSykU
	JdHY0XDc+rXpa7TFBIh2Nc92/xUOrJZbJzUA9Q1BgsrngPxnVZZSQaDqUT8jJKaO
	kGYX6VXrjJcpc9UnU38g7lsOXAT4dJDutqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679100812; x=1679187212; bh=ECzM57txPj9Q7
	KLy1xZBRDrod5bpSSsqFaBFaWarXJs=; b=rlyS/F2HXHUfCRrPbBFqjrZTANeNq
	lqZCUmY0BYz+mzygX+EtByganpNzzjAMrvQdyKKhehfE6de5cHOPBzI9nVncIeqS
	2BsLqIDzxCBzBqjLA9LhiVUcm5T0Dj39bJh5xwQasFI+XzB9VHDS6FUmYKDsy2Ve
	Hhd508TBNNJYvinN1WhMkHAIBO0nt3NkqEULxyJxdwlvsBPwLxPPUPOH7XqB36OO
	uszs9yK+N/hawMmvJrO+B8xZzDd7YDhlxWcJu188jUeVC3rRGeYVA3BiF78V7zFp
	HwTARAmec2s4ppHVgGg4v6wCTM/sz02PNegrczMs7pzJpgieEmmbb142Q==
X-ME-Sender: <xms:jAsVZCI7bV-xdWjRJEyVT5qHA50E30YrMnmq8MO-ECQXudRKjulRRw>
    <xme:jAsVZKLV8As7pMp1bXco5KSxVEeNRXnGGOO9w7YIXPmyI8xkCEHHfQjzLadLOpBFe
    Pubvzsb29Ts3g>
X-ME-Received: <xmr:jAsVZCvaMtobHvMggRjYO3nojZx9F4rznB_Fv5jUPABU8YaQVALqRqyouQ0c_sFdpPzS_lmXT9jBT9ZGGwjNe5z6_31eUORvWb4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeffedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeef
    tdffudfgvdduhffgffdvhedvffeifeetieduveduledthfdvleduheelteeknecuffhomh
    grihhnpehquhgsvghsqdhoshdrohhrghdpghhithhlrggsrdgtohhmnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:jAsVZHbyMEZ4cNJl9S1ift3xqzZP9bDliObwib7Gxn60uBCpeuHo4Q>
    <xmx:jAsVZJYEufGhC64CS6C3yyoWSOx7dePz-QA26XjSFqo7vukB3ca9nQ>
    <xmx:jAsVZDBUFPVUUenZN6ZD8U5LlSXF-Eo0mmOlRQjPoHjc75Ajl90f8Q>
    <xmx:jAsVZKDxkhukJ51gjbo1VbMbFCOGqtSnVxVwKrxx4YwHT3OGFG2y6w>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 18 Mar 2023 01:53:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system
Message-ID: <ZBULiU0222GlcC1W@mail-itl>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
 <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2303171539520.3359@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vp6c0prIwREnWQfB"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303171539520.3359@ubuntu-linux-20-04-desktop>


--Vp6c0prIwREnWQfB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Mar 2023 01:53:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system

On Fri, Mar 17, 2023 at 04:10:22PM -0700, Stefano Stabellini wrote:
> On Fri, 17 Mar 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > This is a first test using Qubes OS CI infra. The gitlab-runner has
> > access to ssh-based control interface (control@thor.testnet, ssh key
> > exposed to the test via ssh-agent) and pre-configured HTTP dir for boot
> > files (mapped under /scratch/gitlab-runner/tftp inside the container).
> > Details about the setup are described on
> > https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physic=
al-laptops/
> >=20
> > This test boots Xen, and try if S3 works. It runs on a ADL-based desktop
> > system. The test script is based on the Xilinx one.
> >=20
> > The machine needs newer kernel than other x86 tests run, so use 6.1.x
> > kernel added in previous commit.
> >=20
> > When building rootfs, use fakeroot to preserve device files when
> > repacking rootfs archives in a non-privileged container.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> This is awesome!! Thanks Marek!
>=20
>=20
> > ---
> > I'm bad at naming things. Things that I could use naming suggestions:
> >  - test script (qubes-x86-64-suspend.sh) - this might be okay?
> >  - test template job name (.adl-x86-64)
> >  - test job name (adl-suspend-x86-64-gcc)
> >  - tag (qubes-hw2)
>=20
> I think these names are OK. I would maybe rename the tag "qubes-hw2" to
> "qubes" because so far there is only one but I am fine with qubes-hw2
> also.

I have 10 of them (and growing), so I'd like to keep tag name at least
somehow referencing which runner it uses. For example, this one is
a desktop with Alder Lake, but some other tests I may want to use a laptop
with Tiger Lake, for example. The mapping name -> hw spec isn't publicly
written down (although our openQA publishes all kind of logs from them,
so it's possible to infer this info).

> > For context, our CI has several machines, named test-X or hwX, each
> > controlled with matching hal900X RPi (this is where gitlab-runner is).
> > This test uses only one specific hw, but I plan adding few others too.
> > ---
> >  automation/gitlab-ci/test.yaml             |  31 ++++-
> >  automation/scripts/qubes-x86-64-suspend.sh | 155 +++++++++++++++++++++=
+-
> >  2 files changed, 186 insertions(+)
> >  create mode 100755 automation/scripts/qubes-x86-64-suspend.sh
> >=20
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index 2e1a6886df7f..f5511dd6da70 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -15,6 +15,10 @@
> >  .arm32-test-needs: &arm32-test-needs
> >    - qemu-system-aarch64-6.0.0-arm32-export
> > =20
> > +.x86-64-test-needs: &x86-64-test-needs
> > +  - alpine-3.12-rootfs-export
> > +  - kernel-6.1.19-export
>=20
> As you know, the jobs starting with a "." are template jobs to avoid
> repeating the same things over and over. .x86-64-test-needs could be
> used in qemu-alpine-x86_64-gcc also.

Right, when switching all of them to 6.1 kernel, that makes sense.

> >  .qemu-arm64:
> >    extends: .test-jobs-common
> >    variables:
> > @@ -84,6 +88,25 @@
> >    tags:
> >      - xilinx
> > =20
> > +.adl-x86-64:
> > +  extends: .test-jobs-common
> > +  variables:
> > +    # the test controller runs on RPi4
> > +    CONTAINER: alpine:3.12-arm64v8
> > +    LOGFILE: smoke-test.log
> > +  artifacts:
> > +    paths:
> > +      - smoke.serial
> > +      - '*.log'
> > +    when: always
> > +  only:
> > +    variables:
> > +      - $QUBES_JOBS =3D=3D "true" && $CI_COMMIT_REF_PROTECTED =3D=3D "=
true"
>=20
> Let me know which trees should have QUBES_JOBS set to true (thus able to
> start Qubes jobs.) At a minimum, I think we would want
> https://gitlab.com/xen-project/xen to test "staging" and "master". I can
> set QUBES_JOBS to true to https://gitlab.com/xen-project/xen if you are
> OK with it.

Yes, that's perfectly okay. I'd like at least also staging-4.17, but
depending on push frequency other staging-* are probably fine too (I
very much doubt long queue would be an issue). Of course that assumes
those tests would be backported, which I'm not sure if is planned. I'm
also okay with allowing committers and/or other maintainers to use it on
demand, but preferably not all patchew branches.

BTW, if you trigger job manually via a web interface or API, you can
specify variables for just a single pipeline. And if you use that
feature, you can also make gitlab present you a bit more convenient
interface with variables listed already. See example here:
https://gitlab.com/QubesOS/qubes-continuous-integration/-/blob/main/.gitlab=
-ci.yml#L15-26
This could be useful to start only a subset of tests.

> > +  before_script:
> > +    - apk --no-cache add openssh-client fakeroot
>=20
> This would work but we typically try to avoid installing more packages
> in the test jobs for speed and efficiency.=20

Yes, I was being lazy and wanted to avoid rebuilding container (and
changing from where it's pulled) when developing the test. Sure, will
fold that into the dockerfile.

> Instead, add those packages
> directly to the build container dockerfile
> (automation/build/alpine/3.12-arm64v8.dockerfile), e.g.:
>=20
> diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation=
/build/alpine/3.12-arm64v8.dockerfile
> index 180c978964..3f1e6a3fc6 100644
> --- a/automation/build/alpine/3.12-arm64v8.dockerfile
> +++ b/automation/build/alpine/3.12-arm64v8.dockerfile
> @@ -41,3 +41,6 @@ RUN apk --no-cache add \
>    libattr \
>    libcap-ng-dev \
>    pixman-dev \
> +  # qubes test deps
> +  openssh-client \
> +  fakeroot \
>=20
> But I am not sure why you need fakeroot, more questions below about it
>=20
>=20
> > +  tags:
> > +    - qubes-hw2
> > +
> >  # Test jobs
> >  build-each-commit-gcc:
> >    extends: .test-jobs-common
> > @@ -110,6 +133,14 @@ xilinx-smoke-dom0less-arm64-gcc:
> >      - *arm64-test-needs
> >      - alpine-3.12-gcc-arm64
> > =20
> > +adl-suspend-x86-64-gcc:
> > +  extends: .adl-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64-suspend.sh s3 2>&1 | tee ${LOG=
FILE}
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.12-gcc
>=20
> This up to you, but qubes-x86-64-suspend.sh is very cool and
> sophisticated and I would use it to create at least 2 jobs:
> - a plain dom0 + domU boot (no suspend)
> - a suspend/resume job

Indeed both tests are implemented there already, just a matter of
creating another job with a different parameter.

But then, the script name isn't really accurate. qubes-x86-64.sh then?
FWIW, next tests I'm planning to contribute:
 - PCI passthrough to HVM with qemu in dom0
 - linux stubdomain
 - PCI passthrough with linux stubdomain

And possibly some of the above exercising other systems, maybe something
on AMD (currently only one runner is on AMD, Ryzen 5 4500U specifically,
and is rather busy because of that, but we can try).

I'm not sure yet if putting them all in a single script is a smart idea.
On the other hand, quite a bit of boilerplate would be duplicated
otherwise.

> I am happy either way
>=20
>=20
> >  qemu-smoke-dom0-arm64-gcc:
> >    extends: .qemu-arm64
> >    script:
> > diff --git a/automation/scripts/qubes-x86-64-suspend.sh b/automation/sc=
ripts/qubes-x86-64-suspend.sh
> > new file mode 100755
> > index 000000000000..fc479c9faaec
> > --- /dev/null
> > +++ b/automation/scripts/qubes-x86-64-suspend.sh
> > @@ -0,0 +1,155 @@
> > +#!/bin/sh
> > +
> > +set -ex
> > +
> > +test_variant=3D$1
> > +
> > +wait_and_wakeup=3D
> > +if [ -z "${test_variant}" ]; then
> > +    passed=3D"ping test passed"
> > +    domU_check=3D"
> > +until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1=
; do
> > +    sleep 30
> > +done
> > +echo \"${passed}\"
> > +"
> > +elif [ "${test_variant}" =3D "s3" ]; then
> > +    passed=3D"suspend test passed"
> > +    wait_and_wakeup=3D"started, suspending"
> > +    domU_check=3D"
> > +ifconfig eth0 192.168.0.2
> > +echo domU started
> > +"
> > +    dom0_check=3D"
> > +until grep 'domU started' /var/log/xen/console/guest-domU.log; do
> > +    sleep 1
> > +done
> > +echo \"${wait_and_wakeup}\"
> > +set -x
> > +echo deep > /sys/power/mem_sleep
> > +echo mem > /sys/power/state
> > +# now wait for resume
> > +sleep 5
> > +# get domU console content into test log
> > +tail -n 100 /var/log/xen/console/guest-domU.log
> > +xl list
> > +xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
> > +# check if domU is still alive
> > +ping -c 10 192.168.0.2 || exit 1
> > +echo \"${passed}\"
> > +"
> > +fi
>=20
> Very nice!
>=20
>=20
> > +# DomU
> > +mkdir -p rootfs
> > +cd rootfs
> > +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
>=20
> I am a bit confused about it: are you sure you need fakeroot for this?
> This script is running inside a container as root already? Are you using
> Docker on the RPi4 to run this job?

This is running in a rootless podman container. But even with docker,
for device files to work (see commit message) it would need to run
privileged container, which I'd like to avoid.

> > +mkdir proc
> > +mkdir run
> > +mkdir srv
> > +mkdir sys
> > +rm var/run
> > +echo "#!/bin/sh
> > +
> > +${domU_check}
> > +/bin/sh" > etc/local.d/xen.start
> > +chmod +x etc/local.d/xen.start
> > +echo "rc_verbose=3Dyes" >> etc/rc.conf
> > +find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../bina=
ries/domU-rootfs.cpio.gz
>=20
> same here

Same answer :)

Specifically it's required to preserve dev/null, dev/console etc.

> > +cd ..
> > +rm -rf rootfs
> > +
> > +# DOM0 rootfs
> > +mkdir -p rootfs
> > +cd rootfs
> > +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> > +mkdir boot
> > +mkdir proc
> > +mkdir run
> > +mkdir srv
> > +mkdir sys
> > +rm var/run
> > +cp -ar ../binaries/dist/install/* .
> > +
> > +echo "#!/bin/bash
> > +
> > +export LD_LIBRARY_PATH=3D/usr/local/lib
> > +bash /etc/init.d/xencommons start
> > +
> > +brctl addbr xenbr0
> > +brctl addif xenbr0 eth0
> > +ifconfig eth0 up
> > +ifconfig xenbr0 up
> > +ifconfig xenbr0 192.168.0.1
> > +
> > +xl create /etc/xen/domU.cfg
> > +${dom0_check}
> > +" > etc/local.d/xen.start
> > +chmod +x etc/local.d/xen.start
> > +# just PVH for now
> > +echo '
> > +type =3D "pvh"
> > +name =3D "domU"
> > +kernel =3D "/boot/vmlinuz"
> > +ramdisk =3D "/boot/initrd-domU"
> > +extra =3D "root=3D/dev/ram0 console=3Dhvc0"
> > +memory =3D 512
> > +vif =3D [ "bridge=3Dxenbr0", ]
> > +disk =3D [ ]
> > +' > etc/xen/domU.cfg
> > +
> > +echo "rc_verbose=3Dyes" >> etc/rc.conf
> > +echo "XENCONSOLED_TRACE=3Dall" >> etc/default/xencommons
> > +echo "QEMU_XEN=3D/bin/false" >> etc/default/xencommons
> > +mkdir -p var/log/xen/console
> > +cp ../binaries/bzImage boot/vmlinuz
> > +cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> > +find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../bina=
ries/dom0-rootfs.cpio.gz
> > +cd ..
> > +
> > +
> > +TFTP=3D/scratch/gitlab-runner/tftp
> > +
> > +echo '
> > +multiboot2 (http)/gitlab-ci/xen console=3Dcom1 com1=3D115200,8n1 loglv=
l=3Dall guest_loglvl=3Dall
> > +module2 (http)/gitlab-ci/vmlinuz console=3Dhvc0 root=3D/dev/ram0
> > +module2 (http)/gitlab-ci/initrd-dom0
> > +' > $TFTP/grub.cfg
> > +
> > +cp -f binaries/xen $TFTP/xen
> > +cp -f binaries/bzImage $TFTP/vmlinuz
> > +cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
> > +
> > +# start logging the serial; this gives interactive console, don't clos=
e its
> > +# stdin to not close it; the 'cat' is important, plain redirection wou=
ld hang
> > +# until somebody opens the pipe; opening and closing the pipe is used =
to close
> > +# the console
> > +mkfifo /tmp/console-stdin
> > +cat /tmp/console-stdin |\
> > +ssh control@thor.testnet console | tee smoke.serial &
>=20
> For clarity I would add a variable just below TFTP above to store the
> controller node. This will make it easier to change in the future and
> also makes it easier to see that it is runner-specific detail, e.g.:
>=20
> TFTP=3D/scratch/gitlab-runner/tftp
> CONTROLLER=3Dcontrol@thor.testnet
>=20
> then here:
>=20
> ssh $CONTROLLER console | tee smoke.serial &

Ok.

> > +# start the system pointing at gitlab-ci predefined config
> > +ssh control@thor.testnet gitlabci poweron
> > +trap "ssh control@thor.testnet poweroff; : > /tmp/console-stdin" EXIT
> > +
> > +if [ -n "$wait_and_wakeup" ]; then
> > +    # wait for suspend or a timeout
> > +    timeout=3D120
> > +    until grep "$wait_and_wakeup" smoke.serial || [ $timeout -le 0 ]; =
do
> > +        sleep 1;
> > +        : $((--timeout))
> > +    done
> > +    if [ $timeout -le 0 ]; then
> > +        echo "ERROR: suspend timeout, aborting"
> > +        exit 1
> > +    fi
> > +    # keep it suspended a bit, then wakeup
> > +    sleep 30
> > +    ssh control@thor.testnet wake
> > +fi
>=20
> I like this. It will shorten the duration of the test job. I am not
> asking you to do anything, but I think it would be a good idea to have
> all test scripts loop around like this if possible to poll for success
> every second rather than wait a pre-determined amount of time, which is
> usually several minutes longer than necessary.
>=20
>=20
> > +# give the test time to run a bit, and then check
> > +sleep 30
> > +
> > +(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}=
" smoke.serial) || exit 1
> > +exit 0
> > --=20
> > git-series 0.9.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Vp6c0prIwREnWQfB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQVC4kACgkQ24/THMrX
1yyz3gf9HneZdiFq0jpqMckXzDwNE3XXZZGJMoPZ9MXpTM3gqbHleTCzp6YNadeM
hZ1nilU1KMDGWQRCsexc42mJZAzPuShUlNnCH66LTH4mXA4cx0bQQA1VFOnBZafO
cVBbp5EZ0FJ4wUWfmM4I7RQeKhQCI+feuzhojpVYM0jXpz0xoLqHrJ53OCB8c2cF
ZxjOoIt/ui4J8YI17QgnkXxvLdGmGE7yGd60VvEd7hPsrvcwppRSMxlQX6+WXo30
3GuyWY6PbpF/SKJeFlFC03T3YQ/K1JRjsEZ9mdM23MY/EInYU34p2RvD+Gk/tfcT
Lz3kwAKwTidsB6OQdjkiS7tPfxIfnQ==
=RXpm
-----END PGP SIGNATURE-----

--Vp6c0prIwREnWQfB--

