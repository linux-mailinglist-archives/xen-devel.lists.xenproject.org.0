Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C46C2243
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 21:09:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512116.791806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLoL-0003pU-Pp; Mon, 20 Mar 2023 20:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512116.791806; Mon, 20 Mar 2023 20:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLoL-0003nL-MQ; Mon, 20 Mar 2023 20:08:53 +0000
Received: by outflank-mailman (input) for mailman id 512116;
 Mon, 20 Mar 2023 20:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSrZ=7M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1peLoJ-0003nF-Pm
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 20:08:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0598d0cf-c75b-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 21:08:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26B23B810A7;
 Mon, 20 Mar 2023 20:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C261C433D2;
 Mon, 20 Mar 2023 20:08:44 +0000 (UTC)
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
X-Inumbo-ID: 0598d0cf-c75b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679342924;
	bh=DPP8AZIfqNebb5gjsJGLu2mkGF9Ql7aXErVeNmlYwJg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T21miy+zL3OWegUllHcx4Yc7Q2AhTjGLTVKAUIStvdDkgVFW71kPceHhtBBFJc9mA
	 eK5JoREfgWW/gnoL3Ng9C70rJEw2oG/FrWTdRxNM/KzTRyp1A3K0mtXVj9/N+KqPhf
	 27i3UvNOLbtvEHtmuDRZRCq5+kDWyugrIR9KpCg9bcq15pJZcl3xvQbUO9djgUZtsA
	 XvQ071eyCQ4VTQvcR7FRoh72ZpF0Jmrcnj+681yU/iGymcdop7pcV1hH8lCJkXSY3d
	 jamknQNyHDyvIZJnkl5XWw+4SOBQWMgxCca6bnxOob15QeBcHU7w0KGY+/uMislJkd
	 mfAluGUS5NG2w==
Date: Mon, 20 Mar 2023 13:08:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system
In-Reply-To: <ZBULiU0222GlcC1W@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2303201258140.3359@ubuntu-linux-20-04-desktop>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com> <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2303171539520.3359@ubuntu-linux-20-04-desktop>
 <ZBULiU0222GlcC1W@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-517235040-1679342692=:3359"
Content-ID: <alpine.DEB.2.22.394.2303201304550.3359@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-517235040-1679342692=:3359
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303201304551.3359@ubuntu-linux-20-04-desktop>

On Sat, 18 Mar 2023, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 17, 2023 at 04:10:22PM -0700, Stefano Stabellini wrote:
> > On Fri, 17 Mar 2023, Marek Marczykowski-Górecki wrote:
> > > This is a first test using Qubes OS CI infra. The gitlab-runner has
> > > access to ssh-based control interface (control@thor.testnet, ssh key
> > > exposed to the test via ssh-agent) and pre-configured HTTP dir for boot
> > > files (mapped under /scratch/gitlab-runner/tftp inside the container).
> > > Details about the setup are described on
> > > https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-laptops/
> > > 
> > > This test boots Xen, and try if S3 works. It runs on a ADL-based desktop
> > > system. The test script is based on the Xilinx one.
> > > 
> > > The machine needs newer kernel than other x86 tests run, so use 6.1.x
> > > kernel added in previous commit.
> > > 
> > > When building rootfs, use fakeroot to preserve device files when
> > > repacking rootfs archives in a non-privileged container.
> > > 
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > 
> > This is awesome!! Thanks Marek!
> > 
> > 
> > > ---
> > > I'm bad at naming things. Things that I could use naming suggestions:
> > >  - test script (qubes-x86-64-suspend.sh) - this might be okay?
> > >  - test template job name (.adl-x86-64)
> > >  - test job name (adl-suspend-x86-64-gcc)
> > >  - tag (qubes-hw2)
> > 
> > I think these names are OK. I would maybe rename the tag "qubes-hw2" to
> > "qubes" because so far there is only one but I am fine with qubes-hw2
> > also.
> 
> I have 10 of them (and growing), so I'd like to keep tag name at least
> somehow referencing which runner it uses. For example, this one is
> a desktop with Alder Lake, but some other tests I may want to use a laptop
> with Tiger Lake, for example. The mapping name -> hw spec isn't publicly
> written down (although our openQA publishes all kind of logs from them,
> so it's possible to infer this info).

That's fine by me, use whatever naming scheme works for you :-)


> > > For context, our CI has several machines, named test-X or hwX, each
> > > controlled with matching hal900X RPi (this is where gitlab-runner is).
> > > This test uses only one specific hw, but I plan adding few others too.
> > > ---
> > >  automation/gitlab-ci/test.yaml             |  31 ++++-
> > >  automation/scripts/qubes-x86-64-suspend.sh | 155 ++++++++++++++++++++++-
> > >  2 files changed, 186 insertions(+)
> > >  create mode 100755 automation/scripts/qubes-x86-64-suspend.sh
> > > 
> > > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > > index 2e1a6886df7f..f5511dd6da70 100644
> > > --- a/automation/gitlab-ci/test.yaml
> > > +++ b/automation/gitlab-ci/test.yaml
> > > @@ -15,6 +15,10 @@
> > >  .arm32-test-needs: &arm32-test-needs
> > >    - qemu-system-aarch64-6.0.0-arm32-export
> > >  
> > > +.x86-64-test-needs: &x86-64-test-needs
> > > +  - alpine-3.12-rootfs-export
> > > +  - kernel-6.1.19-export
> > 
> > As you know, the jobs starting with a "." are template jobs to avoid
> > repeating the same things over and over. .x86-64-test-needs could be
> > used in qemu-alpine-x86_64-gcc also.
> 
> Right, when switching all of them to 6.1 kernel, that makes sense.
> 
> > >  .qemu-arm64:
> > >    extends: .test-jobs-common
> > >    variables:
> > > @@ -84,6 +88,25 @@
> > >    tags:
> > >      - xilinx
> > >  
> > > +.adl-x86-64:
> > > +  extends: .test-jobs-common
> > > +  variables:
> > > +    # the test controller runs on RPi4
> > > +    CONTAINER: alpine:3.12-arm64v8
> > > +    LOGFILE: smoke-test.log
> > > +  artifacts:
> > > +    paths:
> > > +      - smoke.serial
> > > +      - '*.log'
> > > +    when: always
> > > +  only:
> > > +    variables:
> > > +      - $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> > 
> > Let me know which trees should have QUBES_JOBS set to true (thus able to
> > start Qubes jobs.) At a minimum, I think we would want
> > https://gitlab.com/xen-project/xen to test "staging" and "master". I can
> > set QUBES_JOBS to true to https://gitlab.com/xen-project/xen if you are
> > OK with it.
> 
> Yes, that's perfectly okay. I'd like at least also staging-4.17, but
> depending on push frequency other staging-* are probably fine too (I
> very much doubt long queue would be an issue). Of course that assumes
> those tests would be backported, which I'm not sure if is planned. I'm
> also okay with allowing committers and/or other maintainers to use it on
> demand, but preferably not all patchew branches.

Yes that makes sense. Let's start with
https://gitlab.com/xen-project/xen for now, then we'll figure out a way
to implement more precisely what you wrote above, which also matches the
requirements for the xilinx runner.


> BTW, if you trigger job manually via a web interface or API, you can
> specify variables for just a single pipeline. And if you use that
> feature, you can also make gitlab present you a bit more convenient
> interface with variables listed already. See example here:
> https://gitlab.com/QubesOS/qubes-continuous-integration/-/blob/main/.gitlab-ci.yml#L15-26
> This could be useful to start only a subset of tests.

Good to know!


> > > +  before_script:
> > > +    - apk --no-cache add openssh-client fakeroot
> > 
> > This would work but we typically try to avoid installing more packages
> > in the test jobs for speed and efficiency. 
> 
> Yes, I was being lazy and wanted to avoid rebuilding container (and
> changing from where it's pulled) when developing the test. Sure, will
> fold that into the dockerfile.

Thanks!


> > Instead, add those packages
> > directly to the build container dockerfile
> > (automation/build/alpine/3.12-arm64v8.dockerfile), e.g.:
> > 
> > diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
> > index 180c978964..3f1e6a3fc6 100644
> > --- a/automation/build/alpine/3.12-arm64v8.dockerfile
> > +++ b/automation/build/alpine/3.12-arm64v8.dockerfile
> > @@ -41,3 +41,6 @@ RUN apk --no-cache add \
> >    libattr \
> >    libcap-ng-dev \
> >    pixman-dev \
> > +  # qubes test deps
> > +  openssh-client \
> > +  fakeroot \
> > 
> > But I am not sure why you need fakeroot, more questions below about it
> > 
> > 
> > > +  tags:
> > > +    - qubes-hw2
> > > +
> > >  # Test jobs
> > >  build-each-commit-gcc:
> > >    extends: .test-jobs-common
> > > @@ -110,6 +133,14 @@ xilinx-smoke-dom0less-arm64-gcc:
> > >      - *arm64-test-needs
> > >      - alpine-3.12-gcc-arm64
> > >  
> > > +adl-suspend-x86-64-gcc:
> > > +  extends: .adl-x86-64
> > > +  script:
> > > +    - ./automation/scripts/qubes-x86-64-suspend.sh s3 2>&1 | tee ${LOGFILE}
> > > +  needs:
> > > +    - *x86-64-test-needs
> > > +    - alpine-3.12-gcc
> > 
> > This up to you, but qubes-x86-64-suspend.sh is very cool and
> > sophisticated and I would use it to create at least 2 jobs:
> > - a plain dom0 + domU boot (no suspend)
> > - a suspend/resume job
> 
> Indeed both tests are implemented there already, just a matter of
> creating another job with a different parameter.
> 
> But then, the script name isn't really accurate. qubes-x86-64.sh then?

Yes good idea to rename the script


> FWIW, next tests I'm planning to contribute:
>  - PCI passthrough to HVM with qemu in dom0
>  - linux stubdomain
>  - PCI passthrough with linux stubdomain
> 
> And possibly some of the above exercising other systems, maybe something
> on AMD (currently only one runner is on AMD, Ryzen 5 4500U specifically,
> and is rather busy because of that, but we can try).

That's very cool! I am looking forward to it.


> I'm not sure yet if putting them all in a single script is a smart idea.
> On the other hand, quite a bit of boilerplate would be duplicated
> otherwise.

There is no hard rule on this. I'd say try to put them on a single
script because it tends to help with maintainability. But if one of the
tests is sufficiently different and would make things complicated is
also OK to move it to a new script.


> > I am happy either way
> > 
> > 
> > >  qemu-smoke-dom0-arm64-gcc:
> > >    extends: .qemu-arm64
> > >    script:
> > > diff --git a/automation/scripts/qubes-x86-64-suspend.sh b/automation/scripts/qubes-x86-64-suspend.sh
> > > new file mode 100755
> > > index 000000000000..fc479c9faaec
> > > --- /dev/null
> > > +++ b/automation/scripts/qubes-x86-64-suspend.sh
> > > @@ -0,0 +1,155 @@
> > > +#!/bin/sh
> > > +
> > > +set -ex
> > > +
> > > +test_variant=$1
> > > +
> > > +wait_and_wakeup=
> > > +if [ -z "${test_variant}" ]; then
> > > +    passed="ping test passed"
> > > +    domU_check="
> > > +until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
> > > +    sleep 30
> > > +done
> > > +echo \"${passed}\"
> > > +"
> > > +elif [ "${test_variant}" = "s3" ]; then
> > > +    passed="suspend test passed"
> > > +    wait_and_wakeup="started, suspending"
> > > +    domU_check="
> > > +ifconfig eth0 192.168.0.2
> > > +echo domU started
> > > +"
> > > +    dom0_check="
> > > +until grep 'domU started' /var/log/xen/console/guest-domU.log; do
> > > +    sleep 1
> > > +done
> > > +echo \"${wait_and_wakeup}\"
> > > +set -x
> > > +echo deep > /sys/power/mem_sleep
> > > +echo mem > /sys/power/state
> > > +# now wait for resume
> > > +sleep 5
> > > +# get domU console content into test log
> > > +tail -n 100 /var/log/xen/console/guest-domU.log
> > > +xl list
> > > +xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
> > > +# check if domU is still alive
> > > +ping -c 10 192.168.0.2 || exit 1
> > > +echo \"${passed}\"
> > > +"
> > > +fi
> > 
> > Very nice!
> > 
> > 
> > > +# DomU
> > > +mkdir -p rootfs
> > > +cd rootfs
> > > +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> > 
> > I am a bit confused about it: are you sure you need fakeroot for this?
> > This script is running inside a container as root already? Are you using
> > Docker on the RPi4 to run this job?
> 
> This is running in a rootless podman container. But even with docker,
> for device files to work (see commit message) it would need to run
> privileged container, which I'd like to avoid.

Are you sure? I can run a non-privileged container with device assigned
just fine with Docker and
 
  devices = ["/dev/ttyUSB0:/dev/ttyUSB0"]

in the gitlab-runner config.toml.

Maybe it is just a matter of access permissions on your devices?


In any case, if your podman environment requires fakeroot, that is a
good enough reason for me. Just please add a note about it in the
commit message or as in-code comment in the script.


> > > +mkdir proc
> > > +mkdir run
> > > +mkdir srv
> > > +mkdir sys
> > > +rm var/run
> > > +echo "#!/bin/sh
> > > +
> > > +${domU_check}
> > > +/bin/sh" > etc/local.d/xen.start
> > > +chmod +x etc/local.d/xen.start
> > > +echo "rc_verbose=yes" >> etc/rc.conf
> > > +find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> > 
> > same here
> 
> Same answer :)
> 
> Specifically it's required to preserve dev/null, dev/console etc.
> 
> > > +cd ..
> > > +rm -rf rootfs
> > > +
> > > +# DOM0 rootfs
> > > +mkdir -p rootfs
> > > +cd rootfs
> > > +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> > > +mkdir boot
> > > +mkdir proc
> > > +mkdir run
> > > +mkdir srv
> > > +mkdir sys
> > > +rm var/run
> > > +cp -ar ../binaries/dist/install/* .
> > > +
> > > +echo "#!/bin/bash
> > > +
> > > +export LD_LIBRARY_PATH=/usr/local/lib
> > > +bash /etc/init.d/xencommons start
> > > +
> > > +brctl addbr xenbr0
> > > +brctl addif xenbr0 eth0
> > > +ifconfig eth0 up
> > > +ifconfig xenbr0 up
> > > +ifconfig xenbr0 192.168.0.1
> > > +
> > > +xl create /etc/xen/domU.cfg
> > > +${dom0_check}
> > > +" > etc/local.d/xen.start
> > > +chmod +x etc/local.d/xen.start
> > > +# just PVH for now
> > > +echo '
> > > +type = "pvh"
> > > +name = "domU"
> > > +kernel = "/boot/vmlinuz"
> > > +ramdisk = "/boot/initrd-domU"
> > > +extra = "root=/dev/ram0 console=hvc0"
> > > +memory = 512
> > > +vif = [ "bridge=xenbr0", ]
> > > +disk = [ ]
> > > +' > etc/xen/domU.cfg
> > > +
> > > +echo "rc_verbose=yes" >> etc/rc.conf
> > > +echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
> > > +echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
> > > +mkdir -p var/log/xen/console
> > > +cp ../binaries/bzImage boot/vmlinuz
> > > +cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> > > +find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> > > +cd ..
> > > +
> > > +
> > > +TFTP=/scratch/gitlab-runner/tftp
> > > +
> > > +echo '
> > > +multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all
> > > +module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
> > > +module2 (http)/gitlab-ci/initrd-dom0
> > > +' > $TFTP/grub.cfg
> > > +
> > > +cp -f binaries/xen $TFTP/xen
> > > +cp -f binaries/bzImage $TFTP/vmlinuz
> > > +cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
> > > +
> > > +# start logging the serial; this gives interactive console, don't close its
> > > +# stdin to not close it; the 'cat' is important, plain redirection would hang
> > > +# until somebody opens the pipe; opening and closing the pipe is used to close
> > > +# the console
> > > +mkfifo /tmp/console-stdin
> > > +cat /tmp/console-stdin |\
> > > +ssh control@thor.testnet console | tee smoke.serial &
> > 
> > For clarity I would add a variable just below TFTP above to store the
> > controller node. This will make it easier to change in the future and
> > also makes it easier to see that it is runner-specific detail, e.g.:
> > 
> > TFTP=/scratch/gitlab-runner/tftp
> > CONTROLLER=control@thor.testnet
> > 
> > then here:
> > 
> > ssh $CONTROLLER console | tee smoke.serial &
> 
> Ok.
> 
> > > +# start the system pointing at gitlab-ci predefined config
> > > +ssh control@thor.testnet gitlabci poweron
> > > +trap "ssh control@thor.testnet poweroff; : > /tmp/console-stdin" EXIT
> > > +
> > > +if [ -n "$wait_and_wakeup" ]; then
> > > +    # wait for suspend or a timeout
> > > +    timeout=120
> > > +    until grep "$wait_and_wakeup" smoke.serial || [ $timeout -le 0 ]; do
> > > +        sleep 1;
> > > +        : $((--timeout))
> > > +    done
> > > +    if [ $timeout -le 0 ]; then
> > > +        echo "ERROR: suspend timeout, aborting"
> > > +        exit 1
> > > +    fi
> > > +    # keep it suspended a bit, then wakeup
> > > +    sleep 30
> > > +    ssh control@thor.testnet wake
> > > +fi
> > 
> > I like this. It will shorten the duration of the test job. I am not
> > asking you to do anything, but I think it would be a good idea to have
> > all test scripts loop around like this if possible to poll for success
> > every second rather than wait a pre-determined amount of time, which is
> > usually several minutes longer than necessary.
> > 
> > 
> > > +# give the test time to run a bit, and then check
> > > +sleep 30
> > > +
> > > +(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> > > +exit 0
> > > -- 
> > > git-series 0.9.1
> > > 
> 
> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab
> 
--8323329-517235040-1679342692=:3359--

