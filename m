Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C34456CE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221676.383498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifHk-0006Hc-PS; Thu, 04 Nov 2021 16:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221676.383498; Thu, 04 Nov 2021 16:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifHk-0006EG-Lb; Thu, 04 Nov 2021 16:08:16 +0000
Received: by outflank-mailman (input) for mailman id 221676;
 Thu, 04 Nov 2021 16:08:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YH1c=PX=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1mifHj-0006Dr-NT
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:08:15 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a300518-3d89-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 17:08:14 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id o14so9364923wra.12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 09:08:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t8sm5334045wrv.30.2021.11.04.09.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:08:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 879DC1FF96;
 Thu,  4 Nov 2021 16:08:11 +0000 (GMT)
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
X-Inumbo-ID: 6a300518-3d89-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=cDGPwdP+u8gCnff+KSxvJmag59AJbiv/cCo7XUqE5QI=;
        b=sNSHqn6FfR2RH12mYF5ksupi/e884VuL+kPBI3B0q8b+Y3YGMKqSNxXUlgbJmi9AJG
         QnEm1ISIv3VkQQldmSPOTLRwezF79bUanFmwwEpDKb05rlXNWIToONTXyoG+G4G/9r4N
         h/CFg5sxsm90mTNv+WL6rWuU1LU++QMfn/CJd1yuDAoEx8AOs03USuJi6sHMiuhD2Vga
         KR34rBYH4K/rDgi7D2xNK17LD+D4skCeeUfwn9oAo1evxmBKGN73i7aUzC3RLjaOntSQ
         6SfCyZhDGxNoTdRc6YCLwyoQXOkUtPZqDi+kDlXbLx+KjSVbKRYsoX2bJQiVM0I0cylV
         rB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=cDGPwdP+u8gCnff+KSxvJmag59AJbiv/cCo7XUqE5QI=;
        b=f77+c5s/GEWAPhBnQpmLNUaYIBWo/6gAWKkaOuDhuZ5rKC6N9wh5EAyuHOshx0cFy0
         iUoN9FrSWW9zIAfEULWbRHkdQfx/Ok6DBijixJiqPYEJ/h8JmKLOD9BBWPhJASYHpj+S
         ZMJAGvUAg5q1UJ+7mdHGJwMwAXKZ7Mdzo9lM1RReI8h1yDkldMt0EU4TH1YXsS79o/y+
         1WmVa3BYdLBZZM5VwpuvDVqTX9+EnBdLlGCRiyG9oaPL8qdsY/6zw26z/wNyfWOZ4YoI
         a0Hn1aDbS/DIISiYktrPne9r3sclq7KWX7Od+HBFOVXj7yVW3BDa9muNGQPMKyagxdDB
         XNNg==
X-Gm-Message-State: AOAM530vKIbzBEZDMxak6q852m2S8DnJH04fNI5fc2WiYCRkwTxKiJeU
	uku3pXjLZTL0dnTifsRfSRAqWw==
X-Google-Smtp-Source: ABdhPJwTZKb2rqw+OjC1rNMG490fbXsQoqHKNdRRqV5iQGKCJfOGKuWz5aum4S5PhKEOtEBB6ndWlw==
X-Received: by 2002:adf:f012:: with SMTP id j18mr58782958wro.353.1636042093855;
        Thu, 04 Nov 2021 09:08:13 -0700 (PDT)
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Kevin Tian
 <kevin.tian@intel.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Connor Davis <connojdavis@gmail.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Tim Deegan <tim@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Doug
 Goldstein <cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Julien Grall <julien@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Lukasz Hawrylko
 <lukasz.hawrylko@linux.intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
Date: Thu, 04 Nov 2021 15:49:36 +0000
In-reply-to: <20210824105038.1257926-1-anthony.perard@citrix.com>
Message-ID: <871r3vkiok.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Anthony PERARD <anthony.perard@citrix.com> writes:

> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build=
-system-xen-v7
>
> v7:
>     Out-of-tree build!
>
>     This mean many more patches. Everything after patch 27 is new.
>
>     There's a few new patch before that, but otherwise are rework of
>     v6.

This is something I've been looking forward to but obviously my QEMU
focused mind meant I did it wrong. Generally I create a builds subdir in
my tree with subdirs for each build flavour. So with:

  /home/alex/lsrc/xen/xen.git/builds/native

And executing:

  =E2=9E=9C  ../../configure
  checking build system type... x86_64-pc-linux-gnu
  checking host system type... x86_64-pc-linux-gnu
  Will build the following subsystems:
    xen
    tools
    stubdom
    docs
  configure: creating ./config.status
  config.status: creating config/Toplevel.mk
  config.status: creating config/Paths.mk

but this leaves a sparse tree:

  =F0=9F=95=9915:51:22 alex@zen:xen.git/builds/native  on =EE=82=A0 review/=
build-system-v7 (AM) [$?]=20
  =E2=9E=9C  find .
  .
  ./config.log
  ./config.status
  ./config
  ./config/Paths.mk
  ./config/Toplevel.mk

and no top level Makefile to do the build.

In the QEMU world we symlink the Makefile into the build directory and
then add a little bit of logic to the Makefile to detect incongruent
configurations, for example:

  # 0. ensure the build tree is okay

  # Check that we're not trying to do an out-of-tree build from
  # a tree that's been used for an in-tree build.
  ifneq ($(realpath $(SRC_PATH)),$(realpath .))
  ifneq ($(wildcard $(SRC_PATH)/config-host.mak),)
  $(error This is an out of tree build but your source tree ($(SRC_PATH)) \
  seems to have been used for an in-tree build. You can fix this by running=
 \
  "$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree)
  endif
  endif

Of course you need some additional definitions to ensure the Makefile is
clear on where it gets the files from.

In "build: adding out-of-tree support to the xen build" you describe the
Linux kernel style which works well where the config can be done after
the fact but I wonder if the configure approach is better suited to
something that needs a bunch of checks running. Is the configure script
pure autoconf? This should work out of the box IIRC.

--=20
Alex Benn=C3=A9e

