Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659AE7A4FDC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 18:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604148.941378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiHVf-0003aC-Op; Mon, 18 Sep 2023 16:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604148.941378; Mon, 18 Sep 2023 16:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiHVf-0003Xm-MD; Mon, 18 Sep 2023 16:54:07 +0000
Received: by outflank-mailman (input) for mailman id 604148;
 Mon, 18 Sep 2023 16:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCDX=FC=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiHVd-0003Xe-M8
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 16:54:05 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8fd1386-5643-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 18:54:03 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31ff1f3cde5so3320079f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 09:54:03 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a5d6045000000b0032008f99216sm6376269wrt.96.2023.09.18.09.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 09:54:02 -0700 (PDT)
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
X-Inumbo-ID: f8fd1386-5643-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695056043; x=1695660843; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7yqEkZbpgMkxgWhqF/6axGdM3IiKqD4/BtizMbfhzY=;
        b=Bz4UsMkC1nZDxnf/fInWIRSIUh4SqfIrLGrCeqmYDNGw7PCkrCXk5DjZMv3zjyvh3t
         ocV8K1kuCuYlcfIQhRftJ5lhHSNVGowpwdC8ZOWSm0UHFfho3cMjfCpb2TWuWC5orCEB
         zFad/iYmO+kMYRXliHFEJNc/2P8HfRlhMnaD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695056043; x=1695660843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7yqEkZbpgMkxgWhqF/6axGdM3IiKqD4/BtizMbfhzY=;
        b=LCtd2nJdZRZVra1BA4UAldwsup+YEh9nwbTRk28IEQdBVh0TQpAB2ilbKTFzMbawdu
         VHuH0f0rAT8mMSJ9qjRbdrXasM3wX011ZgZOVbVVkPpO6XBTy6Fta6LOSTRToISajH3F
         8uyEpeb3cGT2nz5q+fIzWRktRKn9b3n/jAV+M6TrsPx6NLaJ2uGLanc7EwrDMvmpTzdw
         RSKsRoUDdW4Ca/lEAJqMYBXFzrf15bHJOlsaFZX57zP+8+rofBCzinkzJVzDxQhftKUR
         E5w0RUY6nMaOM1AzDVM6X5ubUuoGLORhyFJ/bavuySSXdf74p749YABL0iyR/o/K5Vdq
         cupQ==
X-Gm-Message-State: AOJu0YwLRL9SkTBJFlQuIOVHVyzMWH8d+DxyQbK238ZxTPL3n5xBliY/
	y2jbwJc7unoerJtJ5Z/px5+jUA==
X-Google-Smtp-Source: AGHT+IExmRNfQei7uhB1yd8QzggWHbkw7XRdbTXTJ6L/PyHhRHE3Mj2HNrFy8IEw6qyIDdHPnjdVdw==
X-Received: by 2002:adf:f741:0:b0:317:f714:3be6 with SMTP id z1-20020adff741000000b00317f7143be6mr8027624wrp.61.1695056043102;
        Mon, 18 Sep 2023 09:54:03 -0700 (PDT)
Date: Mon, 18 Sep 2023 17:24:16 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@cloud.com>
Subject: Re: [XEN PATCH v2 0/5] python: Use setuptools instead of the
 deprecated distutils
Message-ID: <dgiwbuxtmdu6tn4u3pz52pzqrtm7dsxkqtkdoynskoyrsppfs4@grjqnaqowydd>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <06fbfb18-cc1e-4f73-bdf7-8b2be1f92de5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06fbfb18-cc1e-4f73-bdf7-8b2be1f92de5@citrix.com>

On Tue, Sep 12, 2023 at 08:49:04AM +0100, Andrew Cooper wrote:
> On 11/09/2023 5:50 pm, Javi Merino wrote:
> > This series picks up Marek's v1 from
> > https://lore.kernel.org/xen-devel/20230316171634.320626-1-marmarek@invisiblethingslab.com/
> > Changes since v1:
> >   - Update all containers to have setuptools, as python 3.12 depecrates distutils in favour of setuptools
> >   - Keep python2's support by falling back to distutils if setuptools is not installed
> >   - Drop the commit about raising the baseline requirement for python, as we keep supporting python2
> >
> > Javi Merino (2):
> >   automation: add python3's setuptools to containers
> >   README: update to remove old note about the build system's python
> >     expectation
> >
> > Marek Marczykowski-Górecki (3):
> >   tools: convert setup.py to use setuptools
> >   tools: don't use distutils in configure nor Makefile
> >   tools: regenerate configure
> 
> Two general notes.
> 
> First, because you've (re)arranged and posted this series, you need to
> add your own Signed-off-by line to all patches, even unmodified ones
> Marek's that you've included.  SoB needs to be from everyone involved in
> handling the patch.

Sure.

> Second, patch 4 should be dropped, and a note put in patch 2 to the
> committer, who will use autoconf 2.69 and have a far far smaller delta
> to include.

I have regenerated it with 2.69 and the diff for tools/configure is
reduced to:

 tools/configure | 52 ++++++++++++++++++++--------------------------------
 1 file changed, 20 insertions(+), 32 deletions(-)

Cheers,
Javi

