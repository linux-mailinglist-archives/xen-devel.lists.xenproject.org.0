Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73E6A6F71
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504105.776637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXONq-0006wx-AD; Wed, 01 Mar 2023 15:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504105.776637; Wed, 01 Mar 2023 15:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXONq-0006uP-6w; Wed, 01 Mar 2023 15:28:46 +0000
Received: by outflank-mailman (input) for mailman id 504105;
 Wed, 01 Mar 2023 15:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXONp-0006uJ-6B
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:28:45 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c078bb1d-b845-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 16:28:44 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id b10so14441381ljr.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 07:28:43 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 p9-20020a2eba09000000b002934ea0def9sm1677017lja.140.2023.03.01.07.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:28:42 -0800 (PST)
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
X-Inumbo-ID: c078bb1d-b845-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677684523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n7gmqtl4qpWGDlW2BTJ1hihBgTLG1kI/74M//ERNwD8=;
        b=fK/HLgFGbLSKt8gvlXebmO5wsDDlMyQEs2b1Hnn/FosoznX+N5AjJOYCw2eHmL/vbK
         mxMTLNHcz6k/NJiJt/+F1+ffaDpwiRKsBSZelZt/E4+xTQ+mah1iObs7Roj7lE0HGz9B
         ARV6vTiwWeRulA2n6qWpX+GIbuXTO6EAYhQE1G21LIgTyXa9Hl3WZHqqk+fsLSqd3dMO
         30ihCB3iC+5R7mFs7PU6cfS2DjiG5vVLlj965IKc//0VmxzlJpsrv9yxt3Qb7DIEe1eL
         bYOelbSgJL5yjPalw3osL0Ws6qL6Mc1SoXc4csbh60ux/Ke03kbH27CWnOMTJarWETZM
         lLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677684523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7gmqtl4qpWGDlW2BTJ1hihBgTLG1kI/74M//ERNwD8=;
        b=Rn5137WZXpG5g7VfZQrXcYreGt8u/ijVWCkFEudNRhYc3/rkKODiKkquwsObat6Ma0
         sm4jnwQVt5gGHbaPPLgWtrV1vl0XFSZGXNMIJ3Kn34Xlqwor8X5OGCARAaKdByZmcNcA
         B1KedlgXtQzz6csS0ChTF66Y+rPXJlzLrLv2jA136aANhN5EgiChAt+0brtigyuyjaA+
         9dWgpFUGaPdoQiJlQ0zqkfnkDUq4dyLaRXOXt/Vp2PNvwi9+GXFH0TNM0cd0veIfvqv9
         CkGSTrxMSXJqFxZSCuQRnATkPZO/PJzjP1Ozz83wcUv1rAGtXvBQEXwY4dCwrCS8+/ul
         kVRg==
X-Gm-Message-State: AO0yUKW7WhAOMawuIdbNPJdIFgMOixpe/rAsMyk/oGejZkevSQfcWcb0
	RYwV/C60Oj1pghzjW3RAKp0F1I3l3uY=
X-Google-Smtp-Source: AK7set8lu3976CrFsfo2ZaClO015kBKDfiMWMdFoTM3lZoKC3reJfbeNZXA6mA5IB6sLUxVdpG/cPg==
X-Received: by 2002:a2e:9798:0:b0:295:ae71:8e87 with SMTP id y24-20020a2e9798000000b00295ae718e87mr2009201lji.45.1677684523086;
        Wed, 01 Mar 2023 07:28:43 -0800 (PST)
Message-ID: <aa2862eacccfb0574859bf4cda8f4992baa5d2e1.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 01 Mar 2023 17:28:41 +0200
In-Reply-To: <0fd10ac8-6110-8299-b2b1-5e46e0c7b14a@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
	 <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
	 <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
	 <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
	 <3f108af54c7d824f59a7dc1daf7d4d0c23f617ec.camel@gmail.com>
	 <297fb314-7752-fdf6-3003-f5bd1396c1e3@xen.org>
	 <bb5105f462a79bc0136348302407574f1d9f792b.camel@gmail.com>
	 <0fd10ac8-6110-8299-b2b1-5e46e0c7b14a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

> On 01/03/2023 15:16, Oleksii wrote:
> > On Wed, 2023-03-01 at 13:58 +0000, Julien Grall wrote:
> > > On 01/03/2023 12:31, Oleksii wrote:
> > > Given this is an alignment issue (Arm32 is more sensible to this
> > > than
> > > the other architecture, but this is still a potential problem for
> > > the
> > > other archs), I would really like to understand whether this is
> > > an
> > > issue
> > > in the common code or in the Arm linker script.
> > I have a good news.
> >=20
> > Alignment of "*(.proc.info)" helps but I checked only yocto-
> > qemuarm:
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792923264
> >=20
> > I ran all tests here:
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792953524
> >=20
> > Should I create a separate patch with ALIGN if the tests are
> > passed?
>=20
> Yes please. But, to be honest, I am not entirely sure what is not=20
> aligned before hand. Do you know if it is possible to download the
> Xen=20
> binary from gitlab?
It is possible.

Please go to the link of the job:
https://gitlab.com/xen-project/people/olkur/xen/-/jobs/3856617252
And on the right you will find 'Job artificats' where you can click
'Download'.
Or in  case if you need a particular binary can click 'Browse' and go
to Artifcats/Binaries/:
https://gitlab.com/xen-project/people/olkur/xen/-/jobs/3856617252/artifacts=
/browse/binaries/

~ Oleksii

