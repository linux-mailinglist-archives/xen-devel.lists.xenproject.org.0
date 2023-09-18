Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E49C7A55D4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 00:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604264.941524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiMro-0008J7-KQ; Mon, 18 Sep 2023 22:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604264.941524; Mon, 18 Sep 2023 22:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiMro-0008Gt-Ho; Mon, 18 Sep 2023 22:37:20 +0000
Received: by outflank-mailman (input) for mailman id 604264;
 Mon, 18 Sep 2023 22:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCDX=FC=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiMrm-0008Gn-P2
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 22:37:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb57aab7-5673-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 00:37:16 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-404539209ffso52394375e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 15:37:16 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c068400b004042dbb8925sm13367595wmn.38.2023.09.18.15.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 15:37:15 -0700 (PDT)
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
X-Inumbo-ID: eb57aab7-5673-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695076636; x=1695681436; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ant0kuog40rEnX+vpk5qCevwiuCrfL/tfIulEhfmYjk=;
        b=WpjXh3f8b2avcpy1vaLmfqdCA0p7NkNOQOrphAPU1cDrRbyXgv9T8XDGxGddMi5WFf
         D+tUKkk2LAzYPMUaA15xHgZfFfDmkceAvBic/3lLn7yZsvEpyPT4wRz8NGly2RtQTa5G
         G6f0ZfO0gntlBHlcB/x4HJwlnUMBWd+DKil10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695076636; x=1695681436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ant0kuog40rEnX+vpk5qCevwiuCrfL/tfIulEhfmYjk=;
        b=UoZXj4efA+qSgRiPPKrLW49EYuAXfrHK9HAvpvfPDBCE9VMZfzo0cnaK8gcFkaprp7
         8G4BYlM4M+/he63skTRBvlyOV7GEjgZFu9URxBc8mPJmSNGKpy2IQNG3ED8158G1g/Un
         U0W2T8aZXLLhewpvMBkLcR9G2Xpu0yhk32H5g5VwIftUuJ8hLSFno7xwknHjYtvMcYic
         +KrUkX8lx0fb5k2W9PEY4f2ufk3ehJBXYlsucShGsuCXH4ypINbjnHNcT0HoNjEltN4z
         +c9doJB46NyxsIgdXLHuxIjNhHO9vwD5W7b65WRsa8Hatec6AceHqAL0gjp1wTchd/ph
         aj5Q==
X-Gm-Message-State: AOJu0Yxj3OZhDlQtL3fPWl+OBV5emoiqpBrBx0qdwNrGIu+7lrkdc31s
	yj0nLN/xDAjGE/H+MJNFSMll/A==
X-Google-Smtp-Source: AGHT+IF7zNjnMuMTzYcqRkerfIeEs6A9Icckhv7vNoLtpDIvhBr+ojfh0kDboDBhBbaFKVFCWXjDxw==
X-Received: by 2002:a1c:721a:0:b0:3fc:92:73d6 with SMTP id n26-20020a1c721a000000b003fc009273d6mr9456055wmc.11.1695076636132;
        Mon, 18 Sep 2023 15:37:16 -0700 (PDT)
Date: Mon, 18 Sep 2023 23:37:14 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@cloud.com>, Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 3/5] tools: don't use distutils in configure nor
 Makefile
Message-ID: <lxd2k5zl6oojwukqsqpfep2qyjnwutrs2p4q2az5agga2f3ksp@ehes5ohfjxim>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <7b3ecf211f60e0d6f7a4d146b62f9c28eff003f5.1694450145.git.javi.merino@cloud.com>
 <fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com>
 <ZQBQnGOU/voT6QcV@mail-itl>
 <ac894d3f-c0f2-3928-c8f8-15f87573211f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac894d3f-c0f2-3928-c8f8-15f87573211f@citrix.com>

On Tue, Sep 12, 2023 at 01:17:21PM +0100, Andrew Cooper wrote:
> On 12/09/2023 12:50 pm, Marek Marczykowski-Górecki wrote:
> > On Tue, Sep 12, 2023 at 11:38:04AM +0100, Andrew Cooper wrote:
> >> On 11/09/2023 5:51 pm, Javi Merino wrote:
> >>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >>>
> >>> Python distutils is deprecated and is going to be removed in Python
> >>> 3.12. The distutils.sysconfig is available as sysconfig module in
> >>> stdlib since Python 3.2, so use that directly.
> >>>
> >>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >> This breaks Py2, doesn't it?
> > I was thinking that too, but "sysconfig" module seems to be in Python
> > 2.7 too.

Yes, I forgot to say it.  I tested this with python2 as well as python3.  I did:

  PYTHON=$(which python) ./configure
  make -C tools/pygrub clean && make -C tools/pygrub
  make -C tools/python clean && make -C tools/python

with python being:

  $ python --version
  Python 2.7.18.6

I did the same test with just `./configure` and python3 being:

  $ python3 --version
  Python 3.12.0rc2

> Oh, so it is.  Lovely that the documentation says this...
> 
> It seems to have appeared in Py2.7 and 3.2 together. 
> https://docs.python.org/2.7/library/sysconfig.html
> 
> I notice that README currently says Py2.6.  We can definitely bump that
> to 2.7, and take this patch as-is.

Marek had a patch that bumped the minimum version to 3.2[0] but I
dropped it from the series as we were going to keep the support for python2.

[0] https://lore.kernel.org/xen-devel/20230316171634.320626-4-marmarek@invisiblethingslab.com/

I will bump the minimum version of python to 2.7 in the README.

Cheers,
Javi

