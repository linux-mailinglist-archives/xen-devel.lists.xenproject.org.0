Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6400B810F01
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653854.1020528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMtO-0000Og-9z; Wed, 13 Dec 2023 10:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653854.1020528; Wed, 13 Dec 2023 10:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMtO-0000Ll-6V; Wed, 13 Dec 2023 10:55:06 +0000
Received: by outflank-mailman (input) for mailman id 653854;
 Wed, 13 Dec 2023 10:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrFR=HY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDMtM-0000Lf-Qz
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:55:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11806d46-99a6-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 11:55:03 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-336417c565eso214919f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 02:55:03 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 k13-20020a5d518d000000b003333040e7f3sm13006654wrv.60.2023.12.13.02.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 02:55:01 -0800 (PST)
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
X-Inumbo-ID: 11806d46-99a6-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702464903; x=1703069703; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=luPdNZpMkpgepIMxboFkvJaSyVGV84+b2R+i4MuHydg=;
        b=r9xbiHdowFsSOrOxgkXTR9VmxO9upj2rdCIbxUCGKib5aRW3bzQfa2a5X5hiIeFWk6
         AiDITCVHt6I3/PRzTSIdly9xfV85kBEidi8RPi82h0YvphDDIdBnxx+GFn0cIT736/47
         ykFhn1Trd5qjI81Gvof2vkHQsDpPsgBjse+YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702464903; x=1703069703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luPdNZpMkpgepIMxboFkvJaSyVGV84+b2R+i4MuHydg=;
        b=AnRsqqLz/joRnTrVQZHDsUDeQjEbk8hS0UVidQyEkkl81X4nlXe83kwfMvRKJmY96u
         5yO3q56z8XOppPMtOTJt0jYBRWRac/rpfkzys1Sod1/96DwBgEPee+8nMIell3tkbynW
         3itbh4kdDIyhoksXPrF8IPjz2usB9u7YQy1JCKMZyAI1TsGRLz8g5nRSPVCrNB3zuzPr
         8zdjAD+Bapy4V4T9oW3AGQH2nRkKhaDhUyzSmmwDYWFf5HrrMa5znnsDZKeMOXDfpfsZ
         81jSgiacslsW/c1s5YaIMghDjKJ4sI2qc+lhWpw7KbCc0CJB/4mY/5ivhyJeI2bRQ4/v
         sbow==
X-Gm-Message-State: AOJu0YzvBvqf96m1XIouaAORnBi+nM+hpob+KNRXc6ysaGoiEInxa0hX
	okAcxQurmdXWGnzhl5Iiv+MvejVir5K+RP2TiOc=
X-Google-Smtp-Source: AGHT+IEq36TI76OFEOIF9caUY65XQ51Gmgwyrp/w1cDTndr7i3Xta0ETdPqXUEUaG5iloVHFbQaU6Q==
X-Received: by 2002:adf:e610:0:b0:333:2fd2:3bfa with SMTP id p16-20020adfe610000000b003332fd23bfamr3032461wrm.179.1702464902789;
        Wed, 13 Dec 2023 02:55:02 -0800 (PST)
Date: Wed, 13 Dec 2023 11:55:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 5/5] automation: add x86-64 livepatching test
Message-ID: <ZXmNhK58kveTKT0N@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-6-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311291901250.3533093@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311291901250.3533093@ubuntu-linux-20-04-desktop>

On Wed, Nov 29, 2023 at 07:03:10PM -0800, Stefano Stabellini wrote:
> On Tue, 28 Nov 2023, Roger Pau Monne wrote:
> > Introduce a new gitlab tests for livepatching, using livepatch-build-tools,
> > which better reflects how downstreams build live patches rather than the
> > in-tree tests.
> > 
> > The tests applies the dummy in-tree patch example, checks that the patch is
> > applied correctly and then reverts and unloads it.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  automation/gitlab-ci/build.yaml               |  8 +++
> >  automation/gitlab-ci/test.yaml                |  8 +++
> >  automation/scripts/build                      | 21 ++++++
> >  .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 +++++++++++++++++++
> >  4 files changed, 105 insertions(+)
> >  create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
> > 
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> > index 32af30ccedc9..22026df51b87 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -358,6 +358,14 @@ alpine-3.18-gcc-debug:
> >    variables:
> >      CONTAINER: alpine:3.18
> >  
> > +alpine-3.18-gcc-livepatch:
> > +  extends: .gcc-x86-64-build
> > +  variables:
> > +    CONTAINER: alpine:3.18
> > +    LIVEPATCH: y
> > +    EXTRA_XEN_CONFIG: |
> > +      CONFIG_LIVEPATCH=y
> > +
> >  debian-stretch-gcc-debug:
> >    extends: .gcc-x86-64-build-debug
> >    variables:
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index 6aabdb9d156f..58a90be5ed0e 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -459,3 +459,11 @@ qemu-smoke-ppc64le-powernv9-gcc:
> >    needs:
> >      - qemu-system-ppc64-8.1.0-ppc64-export
> >      - debian-bullseye-gcc-ppc64le-debug
> > +
> > +qemu-alpine-x86_64-gcc-livepatch:
> > +  extends: .qemu-x86-64
> > +  script:
> > +    - ./automation/scripts/qemu-alpine-x86_64-livepatch.sh 2>&1 | tee ${LOGFILE}
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.18-gcc-livepatch
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index b3c71fb6fb60..0a0a6dceb08c 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -103,3 +103,24 @@ else
> >      cp -r dist binaries/
> >      if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
> >  fi
> > +
> > +if [[ "$LIVEPATCH" == "y" ]]; then
> > +    # Build a test livepatch using livepatch-build-tools.
> > +
> > +    if [[ "$XEN_TARGET_ARCH" != "x86_64" ]]; then
> > +        exit 1
> > +    fi
> > +
> > +    # git diff --no-index returns 0 if no differences, otherwise 1.
> > +    git diff --no-index --output=test.patch xen/arch/x86/test-smc-lp.c \
> > +                                            xen/arch/x86/test-smc-lp-alt.c && exit 1
> > +
> > +    BUILDID=$(readelf -Wn xen/xen-syms | sed -n -e 's/^.*Build ID: //p')
> > +
> > +    git clone https://xenbits.xen.org/git-http/livepatch-build-tools.git
> > +    cd livepatch-build-tools
> > +    make
> > +    ./livepatch-build -s ../ -p ../test.patch -o out -c ../xen/.config \
> > +        --depends $BUILDID --xen-depends $BUILDID
> > +    cp out/test.livepatch ../binaries/test.livepatch
> > +fi
> 
> I realize this is a matter of taste but if possible I would move this to
> qemu-alpine-x86_64-livepatch.sh not to make the build script too
> complex.

I've attempted that, but there are some issues.  First, the
elfutils-dev package would need to be added to the test container,
checkout livepatch-build-tools.git from the test script, and do the
differential build in the test script, so all the Xen hypervisor build
dependencies would also be needed in the test container.

> Otherwise, plase create automation/scripts/livepatch and move this code
> there. You can call automation/scripts/livepatch from
> automation/scripts/build.

Unless you have a strong desire to pursue building the livepatch in
the test step, I will go with the route proposed here, and split the
livepatch build into automation/scripts/build-livepatch.

> Other than that, this is great! I'll let other review the livepatch
> specific changes in this series

Thanks, will post a new version soon.

Roger.

