Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BD9AE9F4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825406.1239630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zU7-0007CK-PK; Thu, 24 Oct 2024 15:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825406.1239630; Thu, 24 Oct 2024 15:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zU7-00079V-Lu; Thu, 24 Oct 2024 15:10:47 +0000
Received: by outflank-mailman (input) for mailman id 825406;
 Thu, 24 Oct 2024 15:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3zU6-0006cH-9R
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:10:46 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2417972b-921a-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 17:10:44 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539f2b95775so1200456e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 08:10:44 -0700 (PDT)
Received: from premium-test ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91572c37sm639201966b.172.2024.10.24.08.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 08:10:43 -0700 (PDT)
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
X-Inumbo-ID: 2417972b-921a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729782644; x=1730387444; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6U6qVw/7irrWEc1i5grqs5ziA+o+lodPJTJABdVRrJ4=;
        b=FsNDsJlPLjp67SDfCi3QjFfqPkueJ4C108Ln72bLAlx3/g3EM11+HAXHWnU6ze/uZs
         q+Ljd8wnaFj9IOZlHYy69nyZRDGFSWjZX9jJM6VuToDFxbNcftTVhBD75WTMhVnalfEu
         p5MZhstAyAm77Ce8XF2ugIrz4NWtooFiJs9aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729782644; x=1730387444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6U6qVw/7irrWEc1i5grqs5ziA+o+lodPJTJABdVRrJ4=;
        b=eJzb2yjifz4VlGVgdMoNbtXwb12WmYJMkdKkcftWERqFxpPlX0fqzEUnbojL0pe4ba
         fhe4VJJKuciCokGNbAC8cy+Jdpr5F/A+wbysNjS2phQbJuRdaj7Q8iSD47zZ65d9gber
         Wbqh+umkHyO9rd42pBvwhkXLglDRe7VbRAmeIihasS10ZUZPn5nnZfPahtnmCsBjiKRs
         ZvM30qdxhFM3gZbPjKfNcoV5XyCabv7JG+jpf9ZoAh+ZWW1uy+SYq4WCjkKmjEgqVD+A
         gY4HVcd4JFwE5CjBHwsu60JoYpkvg6FHEne2WOpQK1o7PGqw0wavarG69bAlJT4CN5CV
         hFMA==
X-Gm-Message-State: AOJu0YxlF2Hq534jEMVVrhfpCgsgYlxuC+PQETrHcZ5+5tCdnyw6KwQg
	CYDLailiX2rN8/Dyx35D5mlllmL0EnImD6olYfdDab7ezpoUxPJiXKTL4/CjarjTma72l9A040m
	og2c=
X-Google-Smtp-Source: AGHT+IGgKWTSPBoH0sbQaL7/zc7PTTTQyYzshtDwS3MpJu8eMCM6UCMlXMW87prnSKWkn80/lUuqfg==
X-Received: by 2002:a05:6512:10d0:b0:538:9e1e:b06f with SMTP id 2adb3069b0e04-53b1a34414emr6196205e87.27.1729782643808;
        Thu, 24 Oct 2024 08:10:43 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:10:42 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 1/6] CI: Refresh the Debian 12 x86_64 container
Message-ID: <opwqn4ewu3pvrmhoikglwzfzu7pwkiht7en4vtnmc755nxphvr@ilgcrk3bo2sa>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <288fcc10dbcbdab1c33ebfb95bedf2366ba64122.1729760501.git.javi.merino@cloud.com>
 <f8452748-067d-48d3-8ed3-3adc98566aa3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8452748-067d-48d3-8ed3-3adc98566aa3@citrix.com>

On Thu, Oct 24, 2024 at 03:04:10PM +0100, Andrew Cooper wrote:
> On 24/10/2024 11:04 am, Javi Merino wrote:
> > Rework the container to use heredocs for readability, and use
> > apt-get --no-install-recommends to keep the size down.
> >
> > This reduces the size of the (uncompressed) container from 3.44GB to 1.67GB.
> 
> !!
> 
> >
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >  automation/build/debian/12-x86_64.dockerfile | 68 ++++++++++++++++++++
> >  automation/build/debian/bookworm.dockerfile  | 57 ----------------
> >  automation/gitlab-ci/build.yaml              | 20 +++---
> >  automation/gitlab-ci/test.yaml               | 14 ++--
> >  automation/scripts/containerize              |  2 +-
> >  5 files changed, 86 insertions(+), 75 deletions(-)
> >  create mode 100644 automation/build/debian/12-x86_64.dockerfile
> >  delete mode 100644 automation/build/debian/bookworm.dockerfile
> >
> > diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
> > new file mode 100644
> > index 000000000000..e0ca8b7e9c91
> > --- /dev/null
> > +++ b/automation/build/debian/12-x86_64.dockerfile
> > @@ -0,0 +1,68 @@
> > +# syntax=docker/dockerfile:1
> > +FROM --platform=linux/amd64 debian:bookworm
> > +LABEL maintainer.name="The Xen Project" \
> > +      maintainer.email="xen-devel@lists.xenproject.org"
> 
> This wants to become two LABEL lines.

Yes, Anthony pointed it out in another patch.  I have fixed all the
dockerfiles in these series.

> > +
> > +ENV DEBIAN_FRONTEND=noninteractive
> > +
> > +# build depends
> > +RUN <<EOF
> > +#!/bin/bash
> > +    set -eu
> 
> Doesn't this need a `useradd --create-home user` here?
> 
> [Edit] Oh, no, because of the script change.  In which case can you note
> this in the commit message and says a root container for now, until some
> other CI scripts can be adjusted.

I put it in the cover letter. I'll add it to the commit message as
well.

> > +
> > +    apt-get update
> 
> apt-get -y

apt-get update refreshes the package lists.  -y doesn't do anything
here.  It is needed for "apt-get install" below but not for
apt-get update.  It would be needed for "apt-get upgrade", but
we don't.

> > +    DEPS=(
> > +        # Xen
> > +        bison
> > +        build-essential
> > +        checkpolicy
> > +        clang
> > +        flex
> > +
> > +        # Tools (general)
> > +        ca-certificates
> 
> Interestingly, we've gained ca-certificates and dropped apt-transport-https.

ca-certificates is needed for curl, wget or anything that tries to
validate tls certificates.  It is a Recommends of libcurl, as
curl by default validates the ca certificate of https servers.

> ca-certificates is a side effect of --no-install-recommends, so is
> fine.  I recall there being a specific reason why we needed
> apt-transport-https, but I can't recall why exactly.  Something about
> the LetsEncrypt Cert used by xenbits IIRC.

I dropped apt-transport-https because it doesn't make sense to have
it.  apt-transport-https allows apt to access package repositories over https,
but we were installing alongside all the other packages.  apt is never
used again, so giving it the ability to install packages over https is
pointless.

> Anthony - do you remember?
> 
> 
> > +        expect
> 
> Expect is only for the test phase, so should move later.

I put it here because ./configure checks for it.

> > +        git-core
> > +        libnl-3-dev
> 
> libnl-3-dev should be down in the #libxl section.  It's only for COLO
> support.

Moved.

> > +        pkg-config
> > +        wget
> > +        # libxenguest dombuilder
> > +        liblzma-dev
> > +        zlib1g-dev
> 
> This is also fun.  In Ubuntu, I've got:
> 
>     libbz2-dev
>     libzstd-dev
>     liblzo2-dev
>     liblzma-dev
>     zlib1g-dev
> 
> which I think is all the algorithms we support in libxenguest.

I did this in the arm64v8 container and forgot to do it here.  Fixed now.

> Any decompressor which we don't find a suitable devel package gets the
> hypervisor form instead.
> 
> > +        # To build the documentation
> > +        pandoc
> 
> I know we had pandoc before, but I'd like to drop it.
> 
> I'm intending to turn off docs generally, and do them separately in a
> single job that has *all* the docs build dependencies, not a misc subset
> that the build system happens not to complain at.

I had the "build the docs as its own job" in my TODO list and was
going to drop pandoc from this dockerfile then.  I can remove pandoc
in this commit if you prefer.

> I'm on the fence about the Qemu build things.  It's off by default now,
> but the container never previously had meson/ninja so it wouldn't have
> built either.  Perhaps leave them out until someone complains.

I thought I had removed them.  Is there anything else that needs to
go?

> One thing you did drop which probably wants to stay is golang.  We have
> golang bindings for libxl which (like Ocaml) are built conditionally on
> finding the toolchain.

Gah.  Another one that I did in the arm64 container that I forgot to
move here.  I will add golang-go in the next version of the series.

Thanks,
Javi

