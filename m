Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCDD7A559D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 00:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604252.941505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiMOd-0002O3-5D; Mon, 18 Sep 2023 22:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604252.941505; Mon, 18 Sep 2023 22:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiMOd-0002L6-1l; Mon, 18 Sep 2023 22:07:11 +0000
Received: by outflank-mailman (input) for mailman id 604252;
 Mon, 18 Sep 2023 22:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCDX=FC=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiMOb-0002L0-PK
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 22:07:09 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b592c5d1-566f-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 00:07:08 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31f7638be6eso4767668f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 15:07:08 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a5d608b000000b0031ad5fb5a0fsm5427233wrt.58.2023.09.18.15.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 15:07:07 -0700 (PDT)
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
X-Inumbo-ID: b592c5d1-566f-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695074828; x=1695679628; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0eIuqhVudrLNm7EY4JRjnY0fob2JkaWzkDEU9UXOdA=;
        b=HfTWrtKNdnhocE/rS0S3bCBjDaFBwCyEhdbRdiIxG/VzP3e7zQh0h3IZdzG5FY3raD
         ygLztMna+q8dI108ONEeLtL1yMqD/CEQ+vIXhSdI0VWWlyc/7O5jFFFvF63yF0CtNAB0
         1g0ofW2f//CwutJPI3LYlR8DARGlaYSox5M0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695074828; x=1695679628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0eIuqhVudrLNm7EY4JRjnY0fob2JkaWzkDEU9UXOdA=;
        b=vDOq/x8TK/g4LR60rDUcWD7eeD9b3VdoW89BLWWczbMSnmfaiDqLhG4ADdxXo85Bep
         IfyTQVtN+hmN/0P2XPSMZBLvHHd7NUaYoow0B5zi08O/4IXTkX/7kDITo7Jg/HYsa9sf
         OwUJBKE1N31ffMVVW5h714+Y8DI0qIQYoVLW1x1XY5OZkmqphldrTh47jmqmV2grTwGn
         dHoyd7wkJsnNteDIQiaiH7V9XebR1PtHSprVpzYhVzWdZpS0BQSzSEEwD/XLWMuFx6G9
         OH6jiMIWWGOTcpGLz7u6S2JxynZmqs8fDrJkOMHdrTJyrdaPH6sFeTQSvq28nNfTwcbm
         eApQ==
X-Gm-Message-State: AOJu0YzlHW3Uq5Vj87434GeeTXv6Mfcl020ganZWhN7LzpWRZie/5P1h
	6Pteo1QvEw0Yrd4OWNbV5jT6VQ==
X-Google-Smtp-Source: AGHT+IFlRChRv/nuAy3zUZ4vfotVIgUnAxWPMMRplUAiaAHOHX9KH/jmPhq3Z2yqbclF4uK5ThARnA==
X-Received: by 2002:a5d:51c9:0:b0:31f:b9ea:76c with SMTP id n9-20020a5d51c9000000b0031fb9ea076cmr8831172wrv.48.1695074827798;
        Mon, 18 Sep 2023 15:07:07 -0700 (PDT)
Date: Mon, 18 Sep 2023 23:07:05 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@cloud.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 1/5] automation: add python3's setuptools to
 containers
Message-ID: <tdjaujfa5g3mc4msfvbicqdfofuccveq2stri33bb5f4nbt6uq@gsswahemejvk>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <4f14ea4aeb44c234d9930578614a35234769fa41.1694450145.git.javi.merino@cloud.com>
 <4a98d2d7-457a-020b-c936-d19b772b626e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a98d2d7-457a-020b-c936-d19b772b626e@citrix.com>

On Tue, Sep 12, 2023 at 11:18:42AM +0100, Andrew Cooper wrote:
> On 11/09/2023 5:51 pm, Javi Merino wrote:
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
> 
> We are not dropping distutils.  We're moving to support both distutils
> and setuptools, because setuptools doesn't support the minimum version
> of python that Xen supports.

Indeed.  I wrote this when the series was about dropping distutils and
forgot to update the commit message when I change it to support both.

> Therefore, it's important to keep some of the containers on distutils
> rather than switching all to setuptools.
> 
> CenOS can stay as is, as can Stretch and probably Bionic/Focal.

I agree for CentOS and Debian. For Ubuntu we have the following containers:
  * 14.04 (trusty)
  * 16.04 (xenial)
  * 18.04 (bionic)
  * 20.04 (focal)

Following the logic of only moving the new ones, I will leave as is
the old ones (trusty, xenial and bionic) and only move focal to
setuptools.

> Any containers with Py3.10 or later definitely need to move, seeing as
> distuils is formally deprecated there
> 
> It's sadly a little too early to make a Py3.12 container, which will
> lack distutils, but we can come back to that in 4.19.

Yes, even python's own 3.12 release candidate still includes it.

  $ podman run --rm -it docker.io/python:3.12-rc-bookworm
  Python 3.12.0rc2 (main, Sep  8 2023, 03:00:59) [GCC 12.2.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>> import distutils
  >>>

> As Stefano points out, you should refresh at least some of the arm64
> containers too.  RISC-V and PPC aren't set up for tools builds set, so
> they're fine to leave.

I have refreshed the arm64 containers.

Cheers,
Javi

