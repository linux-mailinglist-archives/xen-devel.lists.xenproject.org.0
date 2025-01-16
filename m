Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0FA139CD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 13:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873544.1284550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYOnv-0008Bb-GU; Thu, 16 Jan 2025 12:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873544.1284550; Thu, 16 Jan 2025 12:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYOnv-00088e-DY; Thu, 16 Jan 2025 12:16:55 +0000
Received: by outflank-mailman (input) for mailman id 873544;
 Thu, 16 Jan 2025 12:16:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYOnu-00088Y-F5
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 12:16:54 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c53e6a7f-d403-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 13:16:53 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so1510395a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 04:16:53 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4400sm8902334a12.52.2025.01.16.04.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 04:16:52 -0800 (PST)
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
X-Inumbo-ID: c53e6a7f-d403-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737029813; x=1737634613; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/BI101gbrfPK7SSENpL2wtYlQSOkQlwIA5fX8OmXxQ=;
        b=wDhn7iNj9TmLsJJgSlBRW0FwpNf7Re5cRdF5qPBZeeXo/0UPxfwdNTJZOkdrEnrU25
         arv6XJFmrw3gIrZugrS9DTLIIBGam64u434al5MBK/EKTn97VFb96fRBD3UhSKuC7M2s
         UEM/uVGZXvJxQtantgpy+URbd8LbjKlYr7O7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737029813; x=1737634613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/BI101gbrfPK7SSENpL2wtYlQSOkQlwIA5fX8OmXxQ=;
        b=TSrMeTE5/4YIAYFl8FbWUML1pOsp9Nla0nv+LlF+gPUH8lnKGGV4WlRtkOSR6oFw0z
         hlc3+/6dgBbPz9ZM9JqFO+JQH1yhF1zm877QHewXN0kQeoAWwZsLahmgPv3eOZyrZsom
         SS96dyWCtoGCtK2coWstMrZ3DYGb4ZJCca8QDovTLuNYAtwFwdCS98+3k5xNVkAzvZd/
         ijdftDdbCLEpoKmdwL7bFZ6T89AxGzVu7ISSPj+pZYltlzVWpesn100lWVFy0lzldOuR
         qERsan7cIjbZXCShLFajFMuZrPU3HGds2k3PanfxxJgLRlJrncjci0R1olGZ+B8EVbKU
         e8mQ==
X-Gm-Message-State: AOJu0YxxkfVnqWi9Mm5aJCtCuPA0hmLvwu3TbipZwoqYe2WVtl8f7aWM
	JDoihu47S4FxPZZc9qAuaePUTnRBqX1VdFFF78HpGr8trUz95R+nIbW5RLLp4Hs=
X-Gm-Gg: ASbGnctbXmVEVtajUHuLZwFLszrFTGO8hoc770f17MW2PGvMkw8okOpfW1yeOEyUvtK
	gACEYTJpoG4GSL8BeXaj57Msyovp6ypeckkQPqLJP7ddHCl45BiCcPBIxuoYsH6onvCbBcvfUuE
	h7ooTPJ8ei2+GRPw9uDS9XTJPXaILw77M4y9UH3vz/DCoj647wzhMOPYrwIPT5atAJVILAqe9AZ
	G67mjd7YOvUfd3I/UzWlIorvxj5w6lRjqh7EC2JkqL1oRC2N1tMFsdwkhG+Pg==
X-Google-Smtp-Source: AGHT+IFL0GaKKHxRxrdUgIxwH8vyf1S4XiqYRYea6WhvEdHeExIdgq0YTjX9+F6/t2LlJ7ujQs0PgQ==
X-Received: by 2002:a05:6402:5296:b0:5d1:3da:e6c with SMTP id 4fb4d7f45d1cf-5d972e06b06mr31712709a12.10.1737029812603;
        Thu, 16 Jan 2025 04:16:52 -0800 (PST)
Date: Thu, 16 Jan 2025 13:16:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20 2/2] automation/cirrus-ci: introduce FreeBSD
 randconfig builds
Message-ID: <Z4j4s-1iK2CH4ssK@macbook.local>
References: <20250116085852.78273-1-roger.pau@citrix.com>
 <20250116085852.78273-2-roger.pau@citrix.com>
 <7984d25d-66ac-4791-929b-a3ce037e960c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7984d25d-66ac-4791-929b-a3ce037e960c@citrix.com>

On Thu, Jan 16, 2025 at 09:46:33AM +0000, Andrew Cooper wrote:
> On 16/01/2025 8:58 am, Roger Pau Monne wrote:
> > Add a new randconfig job for each FreeBSD version.  This requires some
> > rework of the template so common parts can be shared between the full and
> > the randconfig builds.  Such randconfig builds are relevant because FreeBSD
> > is the only tested system that has a full non-GNU toolchain.
> >
> > While there remove the stale `python` package install in the full build
> > case: this is no longer needed if `python311` is also specified.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  .cirrus.yml | 64 +++++++++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 50 insertions(+), 14 deletions(-)
> >
> > diff --git a/.cirrus.yml b/.cirrus.yml
> > index ee80152890f2..f3ea29102cbf 100644
> > --- a/.cirrus.yml
> > +++ b/.cirrus.yml
> > @@ -1,11 +1,24 @@
> >  # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
> > -freebsd_template: &FREEBSD_TEMPLATE
> > +freebsd_13: &FREEBSD_13
> > +  freebsd_instance:
> > +    image_family: freebsd-13-4
> > +freebsd_14: &FREEBSD_14
> > +  freebsd_instance:
> > +    image_family: freebsd-14-2
> > +freebsd_15: &FREEBSD_15
> > +  freebsd_instance:
> > +    image_family: freebsd-15-0-snap
> > +
> > +freebsd_template: &FREEBSD_ENV
> >    environment:
> >      APPEND_LIB: /usr/local/lib
> >      APPEND_INCLUDES: /usr/local/include
> >  
> > +freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
> > +  << : *FREEBSD_ENV
> > +
> >    install_script: pkg install -y seabios gmake ninja bash
> > -                                 pkgconf python bison perl5
> > +                                 pkgconf bison perl5
> >                                   yajl lzo2 pixman argp-standalone
> >                                   libxml2 glib git python311
> >  
> > @@ -15,20 +28,43 @@ freebsd_template: &FREEBSD_TEMPLATE
> >      - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
> >      - gmake -j`sysctl -n hw.ncpu` clang=y
> >  
> > +freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
> > +  << : *FREEBSD_ENV
> > +
> > +  install_script: pkg install -y gmake python bison
> 
> It's odd having python311 for the full build but only python for the
> randconfig build.
> 
> IIRC, it's just for Qemu, so there is a split based on whether we build
> tools or not.

Right, this was added by you in order to fix the build with the new
QEMU:

1223375d8b7f CI: Fix builds following qemu-xen update

IIRC you said that on FreeBSD you used 3.11 because it already
includes the required packages (tomllib and ensurepip).

> What will happen when python becomes 3.12?  Does pkg have a way of
> asking "I want any python as long as it's 3.11 or later" ?

Hm, I don't really know.  Maybe we could use a regexp, but that seems
ugly.  Otherwise maybe some shell logic based on the output of `pkg
version`.  I've been told by pkg developers there's no way (yet) to do
such version matching.

One suggestion I've received is to use the python3 meta-package,
which will default to python 3.11 right now (and will keep moving
forward).

Would you be OK with that?

> Relatedly, how likely is python to transform into 3.12 in a bump to the
> minor FreeBSD versions?

It will transform as a result of the change in the ports tree, rather
than a FreeBSD version bump.  When that happens it will affect all
FreeBSD branches mostly equally (as it propagates to the binary package
repositories).

Thanks, Roger.

