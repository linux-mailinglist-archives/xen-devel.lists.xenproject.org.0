Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C76A694D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503882.776262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIIU-0002vp-B3; Wed, 01 Mar 2023 08:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503882.776262; Wed, 01 Mar 2023 08:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIIU-0002tt-8B; Wed, 01 Mar 2023 08:58:50 +0000
Received: by outflank-mailman (input) for mailman id 503882;
 Wed, 01 Mar 2023 08:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXIIS-0002tn-Tt
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 08:58:49 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 476312c6-b80f-11ed-969f-2f268f93b82a;
 Wed, 01 Mar 2023 09:58:48 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id z42so13153029ljq.13
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 00:58:47 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 f10-20020a2ea0ca000000b00295b9db4302sm1247856ljm.33.2023.03.01.00.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 00:58:46 -0800 (PST)
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
X-Inumbo-ID: 476312c6-b80f-11ed-969f-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677661127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6uT3qU1x60f3c7F7wVSes6L/icFBJH8FmXsYloSy1AE=;
        b=qRj4iJRkF+K0uo+72q09/mTARiBeNR969MH3zpBOzwgtsJsPyGUG8ae/Fh+5ZMRA+V
         7k1RQUyPU3S0SzcjIXFJOfIr9sQtx6uwSmIzaRnJsqH78DwYby4NVia2npz3SbjQKfor
         AeIRFMgQbSSqN9K3ofcsqS6RcQDQCMvr+gfGdTcQwxMYbG3s59LGs92q7HUX3QK3FZQR
         z36vwtC5rBkHb5CU765pi5TSmFzBsP8UnirLBaHXPdRB45w0/ZcuytfQok8ikUj4QftJ
         A8Fv4uL7lTiZ/kIBJaUz6vCjzL3l7aHxO1ozP3/RPfwFo0iRy+oIm2ii+4uoizZNmEYJ
         UCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677661127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uT3qU1x60f3c7F7wVSes6L/icFBJH8FmXsYloSy1AE=;
        b=yeADI/fCZHRe4n2Bsb56AIoaVxqiNQ5Ho0G4iLsSFSxgr/JC6F3iu8E87qbZ+iDVCc
         3cL9i1lW+/kd/ktATSKCQE6SvEbutTDx1QMYHHqFGwS1kIcUbC8SwYPHCm7hrQNWu38l
         skYN24nxLOHz802OVBKNjAnNk1wPCOjGdlhYTG9q/Wue9wsvCKSzMPJva0b4EVdWQA1a
         j4nrktHroptGmiW009pfr+KHVNCkK4EwOgKYMSR0dfUhULpe0I7iKgzKS4I1AJ0wEvfI
         GWirKEPAvBh3qhbquxLbKmxrdPzyUXbUEmIW2MWCtfWBXVxeVa6Gmnwqze4o3an3EeFm
         ZxHw==
X-Gm-Message-State: AO0yUKVTppWmsDzcxib3zgXg9Glj4ZhkmPDeCP0whw20Fc9ctbB0tvHv
	TWR37YWvkhNNGCTpRGmpVHE=
X-Google-Smtp-Source: AK7set+WNWSu2Hrku/f4CuyLaI9SQ5GeoQxiAMWapW/Oj8meQN9+kahHVvXtbeIawxzo+9kOvQx4wA==
X-Received: by 2002:a05:651c:331:b0:295:903b:6a8a with SMTP id b17-20020a05651c033100b00295903b6a8amr1614481ljp.48.1677661126985;
        Wed, 01 Mar 2023 00:58:46 -0800 (PST)
Message-ID: <a2980d855cb11e447a794725163ff120d38fc127.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 01 Mar 2023 10:58:15 +0200
In-Reply-To: <46e96dd9-bcb4-4569-b282-05c019cabcc3@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
	 <c0e628d744f03c70d2e7b66540ea27aa31d90043.camel@gmail.com>
	 <46e96dd9-bcb4-4569-b282-05c019cabcc3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-02-28 at 17:48 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 28/02/2023 15:09, Oleksii wrote:
> > On Sat, 2023-02-25 at 16:49 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > > > The following changes were made:
> > > > * make GENERIC_BUG_FRAME mandatory for ARM
> > >=20
> > > I have asked in patch #1 but will ask it again because I think
> > > this
> > > should be recorded in the commit message. Can you outline why it
> > > is
> > > not
> > > possible to completely switch to the generic version?
> > I haven't tried to switch ARM too because of comment regarding 'i'
> > in
> > <asm/bug.h>:
> > /*
> > =C2=A0 * GCC will not allow to use "i"=C2=A0 when PIE is enabled (Xen d=
oesn't
> > set
> > the
> > =C2=A0 * flag but instead rely on the default value from the compiler).
> > So
> > the
> > =C2=A0 * easiest way to implement run_in_exception_handler() is to pass
> > the
> > to
> > =C2=A0 * be called function in a fixed register.
> > =C2=A0 */
>=20
> I would expect this comment to be valid for any arch. So if there is
> a=20
> need to deal with PIE, then we would not be able to use "i" in the
> BUG=20
> frame.
>=20
> Note that we are now explicitly compiling Xen without PIE (see
> Config.mk).
Then it looks like some architectures isn't expected to be compiled
with PIE. I mean that x86's bug.h is used 'i' and there is no any
alternative version in case of PIE.

If Xen should be compilable with PIE then we have to use ARM
implementation of bug.h everywhere. ( based on comment about 'i' with
PIE ).

Now I am totally confused...

~ Oleksii

