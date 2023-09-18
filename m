Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788837A5525
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 23:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604240.941484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiLxO-0005i3-Lc; Mon, 18 Sep 2023 21:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604240.941484; Mon, 18 Sep 2023 21:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiLxO-0005eu-Ic; Mon, 18 Sep 2023 21:39:02 +0000
Received: by outflank-mailman (input) for mailman id 604240;
 Mon, 18 Sep 2023 21:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCDX=FC=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiLxM-0005eo-OO
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 21:39:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c64989d1-566b-11ee-8789-cb3800f73035;
 Mon, 18 Sep 2023 23:38:58 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31c5c06e8bbso4821941f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 14:38:58 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056000124300b0031f34a395e7sm13749528wrx.45.2023.09.18.14.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 14:38:57 -0700 (PDT)
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
X-Inumbo-ID: c64989d1-566b-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695073138; x=1695677938; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCoqJu0Zhun8wrL1924bhTNlpE7X1nLpU44gfzMAISM=;
        b=RvMmjB6Cj+Ao81pkAak8B0OEQVEC4VnqxaN41GPmbuAct6b+JMXLxinVD7R6plfG0h
         lqx3/LOIpGJVOlTyAZHBAheW35eTezsETsZC15AMjcq07Uh5jN1lEzAuzKj/rVK5ZWny
         RPIXi314fN64AKqew0gMUyhNFCTb+AuURP51s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695073138; x=1695677938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCoqJu0Zhun8wrL1924bhTNlpE7X1nLpU44gfzMAISM=;
        b=Ci6Z9GB2aY2OZhaSmrz9aCzwKBGKnaEMbSEBAN8q52KmuVXRQz8qqyuuYbQiGCL3jH
         bCFePo6aowiC/7jRaw9K2gmVUFHVtrn+bd4CyPVjwdI7/4MGkbzlTEGkgHxBqjuCUUL3
         Kp1qjnV88jPZXnuc0odn+w1fCR9hPsodbyDNghFMuiakxjeNyquOuCHznN2+yMvNj6uc
         ypR+YwJ4qz261iVvS/qSlyiOI85Wtbi01QG8KXkV9vkDF1mG1TSOFxYCnj/4ovA1171Z
         30xisJYg9+o6NNAAcVJuBQL05EQ3Ju5sPLAWa6ZLgc3mO4dT/TC6+PAeJ7ok0A8hnx1O
         Rl3Q==
X-Gm-Message-State: AOJu0YwdCjNNd6ilx94SllRAq96h+qsIXhL4YvXSkZ40bxmMsJmmG3me
	HpkQN84eIg5Fmp3fqAqTNUj5kA==
X-Google-Smtp-Source: AGHT+IFi/HjIgfPjSpOovc4MaL7TytLdQs3LP2zlG1Y3eNU46c3LDe3kt3/rxqZlbPkKqcGN42adjQ==
X-Received: by 2002:adf:ab0c:0:b0:31f:fedd:83ad with SMTP id q12-20020adfab0c000000b0031ffedd83admr6033525wrc.4.1695073137910;
        Mon, 18 Sep 2023 14:38:57 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:38:55 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Doug Goldstein <cardoe@cardoe.com>, Bertrand.Marquis@arm.com
Subject: Re: [XEN PATCH v2 1/5] automation: add python3's setuptools to
 containers
Message-ID: <mo3j4l5wynbrb5oz7z6edztqqfhwy5m322hjta72vsoxsz7kce@tej5b2jllgu6>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <4f14ea4aeb44c234d9930578614a35234769fa41.1694450145.git.javi.merino@cloud.com>
 <alpine.DEB.2.22.394.2309111805530.1847660@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2309111805530.1847660@ubuntu-linux-20-04-desktop>

On Mon, Sep 11, 2023 at 06:15:03PM -0700, Stefano Stabellini wrote:
> On Mon, 11 Sep 2023, Javi Merino wrote:
> > In preparation of dropping python distutils and moving to setuptools,
> > add the python3 setuptools module to the containers that need it.
> > 
> > The centos7 container was building using python2.  Change it to build
> > python scripts using python3.
> > 
> > Debian Stretch is no longer debian oldstable, so move to the archive
> > repositories.
> > 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >  automation/build/alpine/3.18.dockerfile        |  1 +
> >  automation/build/archlinux/current.dockerfile  |  1 +
> >  automation/build/centos/7.dockerfile           |  3 ++-
> >  automation/build/debian/bookworm.dockerfile    |  1 +
> >  automation/build/debian/stretch.dockerfile     | 11 ++++++++++-
> >  automation/build/suse/opensuse-leap.dockerfile |  1 +
> >  automation/build/ubuntu/bionic.dockerfile      |  1 +
> >  automation/build/ubuntu/focal.dockerfile       |  1 +
> >  automation/build/ubuntu/trusty.dockerfile      |  1 +
> >  automation/build/ubuntu/xenial.dockerfile      |  1 +
> 
> We are missing:
> automation/build/alpine/3.18-arm64v8.dockerfile
> automation/build/suse/opensuse-tumbleweed.dockerfile
> automation/build/debian/bookworm-i386.dockerfile
> automation/build/debian/bookworm-arm64v8.dockerfile
> automation/build/debian/stretch-i386.dockerfile

Of course! I wasn't able to test it using CI and I missed a bunch of
failed tests.  I have now added it to all of these.

> automation/build/suse/opensuse-leap.dockerfile

Leap is already in the list.

> automation/build/fedora/29.dockerfile

Why? It already has setuptools.

> automation/build/debian/jessie-i386.dockerfile
> automation/build/debian/jessie.dockerfile

Why? The jessie container is not run in automation.  Arguably, the
docker files should be deleted instead.

Cheers,
Javi

