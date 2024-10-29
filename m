Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A529B503A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 18:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827750.1242450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5prC-0003H0-64; Tue, 29 Oct 2024 17:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827750.1242450; Tue, 29 Oct 2024 17:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5prC-0003Dq-2n; Tue, 29 Oct 2024 17:18:14 +0000
Received: by outflank-mailman (input) for mailman id 827750;
 Tue, 29 Oct 2024 17:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Hvw=RZ=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t5prA-0003Dk-II
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 17:18:12 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ec71a7-9619-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 18:18:06 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a3dc089d8so841037366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 10:18:06 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b2fe2af87sm498943366b.143.2024.10.29.10.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 10:18:05 -0700 (PDT)
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
X-Inumbo-ID: c2ec71a7-9619-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyZWM3MWE3LTk2MTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjIyMjg2LjIwNjIxMSwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730222285; x=1730827085; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SVdOokFSetT7oKRAM0gON4dunH/xhPNCxe/un+Db+uI=;
        b=BNOdc6dU7Gt7naA+MEcUQ6DSVQLhBXuI921yL+/ZSl6JVuv8vy674+upiI7igs9oA+
         p5zBUqLjmCVaRiJ5rtfqZoCb0I9A5oTMWEfA076SIn30D4+Kpgqin/1yMHg1jnM42tUJ
         E6T1aoKw02F9RB3dJ2KUqAcj8w/u8EjajL1Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730222285; x=1730827085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVdOokFSetT7oKRAM0gON4dunH/xhPNCxe/un+Db+uI=;
        b=Slzqpi5Z4KNFGInbHQXK4jydNwXIcY/gELQ4lCG8ornoclpKtKnduw224B4Jr1v4D7
         MblH0BRBuTQ3tLSmtFQG89z+Q6vjzovxwy6uz4XDYnXMpGUa1ixptORjN4tLTpSkC9lW
         F78F4OqKCONibOz4+UJF5RA0eTqSOYTH0ZBozF900+blA6rOSPd/ZuJ+UiU9OPHQm6ZI
         3haodnu1zd2iZaNQRSM3o5NsA5oOHyjaZOv9myCGJcCaXduZgHfsaTS7WhxoBZw2IZZq
         Hw98yflITnJx/sIHWiUbRba39OfCwGkhdBJ6TrHLGSjnKoDkP78sDoqrRcmzSA6a1Ilm
         +SNg==
X-Gm-Message-State: AOJu0YwQgWQv5brUxj85QkQYZEiihwYFBeK0QbhQl9wc8HLUVcx6P4BE
	SiL7YXEuVZYHC/lL7aBAr6eiAHxDbICMvIswevror/8PukQym8A+wq8Ae4zRLIg=
X-Google-Smtp-Source: AGHT+IFNHG+5W/NrdiQJz1jDgAQpZJtKe+wGSd1jAyvFDb9AkW4EsMwexpjjg2vl68QUfC+zfR0olQ==
X-Received: by 2002:a17:907:97d4:b0:a9a:a7fd:d840 with SMTP id a640c23a62f3a-a9de5cfea5emr1074065666b.1.1730222285507;
        Tue, 29 Oct 2024 10:18:05 -0700 (PDT)
Date: Tue, 29 Oct 2024 17:18:03 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v1 6/6] CI: Run the builds and tests that use the
 Debian 12 containers as a normal user
Message-ID: <dbqfp4kywi6uuykycdake67ek6q6wjnwygnkhrvvxgfd4gokff@ybjta54ae4a5>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <c6d8547d500ac419ee4590decb9392f32f1f0d02.1729760501.git.javi.merino@cloud.com>
 <alpine.DEB.2.22.394.2410241631250.3833@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2410241631250.3833@ubuntu-linux-20-04-desktop>

Hi Stefano,

On Thu, Oct 24, 2024 at 04:47:28PM -0700, Stefano Stabellini wrote:
> On Thu, 24 Oct 2024, Javi Merino wrote:
> > Use FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR so that GitLab CI clones xen
> > using the user in the image, instead of as root[0].
> > 
> > In qemu-smoke-dom0*.sh and qemu-alpine-x86_64.sh, use fakeroot to
> > create the rootfs images that untar a tarball that create character
> > devices.  cpio replicates the block and character devices, as well as
> > preserving the uid and gid it sees in the current directory.  fakeroot
> > lets tar think that it is creating block and character devices, and
> > all files are owned by root, but it is all smokes and mirrors for
> > cpio.
> > 
> > [0] https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1736
> > 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> > 
> > Regarding building the rootfs, I have chosen to use a fakeroot
> > subshell for the entire process.  automation/scripts/qubes-x86-64.sh
> > takes a different approach, it just uses fakeroot for the tar/cpio
> > commands.  I prefer to do it this way but I am happy to be overridden
> > if `fakeroot -s ../save tar` and `fakeroot -i ../save cpio` are
> > preferred.
> > 
> >  automation/build/debian/12-arm64v8.dockerfile   | 5 ++++-
> >  automation/build/debian/12-x86_64.dockerfile    | 5 ++++-
> >  automation/gitlab-ci/test.yaml                  | 4 ++++
> >  automation/scripts/qemu-alpine-x86_64.sh        | 4 +++-
> >  automation/scripts/qemu-smoke-dom0-arm64.sh     | 7 +++++--
> >  automation/scripts/qemu-smoke-dom0less-arm64.sh | 5 +++--
> >  6 files changed, 23 insertions(+), 7 deletions(-)
> > 
> > diff --git a/automation/build/debian/12-arm64v8.dockerfile b/automation/build/debian/12-arm64v8.dockerfile
> > index 4da1b074aedb..c2617956ed77 100644
> > --- a/automation/build/debian/12-arm64v8.dockerfile
> > +++ b/automation/build/debian/12-arm64v8.dockerfile
> > @@ -10,6 +10,8 @@ RUN <<EOF
> >  #!/bin/bash
> >      set -eu
> >  
> > +    useradd --create-home user
> > +
> >      apt-get update
> >      DEPS=(
> >          # Xen
> > @@ -53,6 +55,7 @@ RUN <<EOF
> >          curl
> >          device-tree-compiler
> >          expect
> > +        fakeroot
> >          u-boot-qemu
> >          # for imagebuilder
> >          file
> > @@ -64,5 +67,5 @@ RUN <<EOF
> >      rm -rf /var/lib/apt/lists*
> >  EOF
> >  
> > -USER root
> > +USER user
> >  WORKDIR /build
> > diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
> > index e0ca8b7e9c91..98b23ea3eaa4 100644
> > --- a/automation/build/debian/12-x86_64.dockerfile
> > +++ b/automation/build/debian/12-x86_64.dockerfile
> > @@ -10,6 +10,8 @@ RUN <<EOF
> >  #!/bin/bash
> >      set -eu
> >  
> > +    useradd --create-home user
> > +
> >      apt-get update
> >      DEPS=(
> >          # Xen
> > @@ -54,6 +56,7 @@ RUN <<EOF
> >          # for qemu-alpine-x86_64-gcc
> >          busybox-static
> >          cpio
> > +        fakeroot
> >  
> >          # For *-efi jobs
> >          ovmf
> > @@ -64,5 +67,5 @@ RUN <<EOF
> >      rm -rf /var/lib/apt/lists*
> >  EOF
> >  
> > -USER root
> > +USER user
> >  WORKDIR /build
> 
> This breaks the xilinx hardware jobs both arm and x86 as they
> require root inside the container at the moment
> 
> 
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index 42baa82fe36f..71f2beb68c4f 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -1,6 +1,10 @@
> >  .test-jobs-common:
> >    stage: test
> >    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > +  variables:
> > +    # Clone xen as the user in the docker images, not root
> > +    # See https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1736
> > +    FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR: true
> >  
> >  .arm64-test-needs: &arm64-test-needs
> >    - alpine-3.18-arm64-rootfs-export
> > diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> > index 1ff689b577e3..2660403ab2b8 100755
> > --- a/automation/scripts/qemu-alpine-x86_64.sh
> > +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > @@ -29,6 +29,7 @@ find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
> >  cd ..
> >  
> >  # initrd.tar.gz is Dom0 rootfs
> > +fakeroot <<EOF
> >  mkdir -p rootfs
> >  cd rootfs
> >  tar xvzf ../initrd.tar.gz
> > @@ -63,7 +64,8 @@ chmod +x etc/local.d/xen.start
> >  echo "rc_verbose=yes" >> etc/rc.conf
> >  # rebuild Dom0 rootfs
> >  find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
> > -cd ../..
> > +EOF
> > +cd ..
> 
> I admit I am not a fan of this as it makes the script harder to read.
> Given that almost everything on this script and similar scripts is
> better run as root because it is all about repackaging cpio archivies,
> instead I would do this:
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 2660403ab2..7c0ec01e05 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/fakeroot
>  
>  set -ex -o pipefail

Running the entire script as a fakeroot subshell is ugly and not
necessary.

A better fix is what I suggested under the commit message, which is
also what the qubes containers do:

--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -31,7 +31,7 @@ cd ..
 # initrd.tar.gz is Dom0 rootfs
 mkdir -p rootfs
 cd rootfs
-tar xvzf ../initrd.tar.gz
+fakeroot -s ../fakeroot-save tar xvzf ../initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
@@ -62,7 +62,7 @@ xl create -c /root/test.cfg
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 # rebuild Dom0 rootfs
-find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+find . | fakeroot -i ../fakeroot-save cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
 cd ../..

 cat >> binaries/pxelinux.0 << EOF


Similar for the dom0 and dom0less scripts and for the xilinx scripts.

> Keeping in mind that anyone could push a branch without fakeroot to
> their personal tree triggering a gitlab-ci pipeline, the advantage of
> using fakeroot would be if we force the container execution envinronment
> (gitlab runner) to run containers as user. This is not currently the
> configuration we have. As of now, it doesn't bring an advantage.
> 
> Given that the gitlab runners are in flux at the moment, and that this
> patch cannot work with the xilinx runners, I would ask you to please
> hold on on this patch until the gitlab runners are settled (~1 month).

Ok, I will hold the patch.  I will also fix the xilinx scripts.

Cheers,
Javi

