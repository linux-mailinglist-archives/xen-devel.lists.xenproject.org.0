Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3765EA6C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471888.731923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDP1r-00025r-Lu; Thu, 05 Jan 2023 12:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471888.731923; Thu, 05 Jan 2023 12:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDP1r-00023O-Ih; Thu, 05 Jan 2023 12:07:27 +0000
Received: by outflank-mailman (input) for mailman id 471888;
 Thu, 05 Jan 2023 12:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDP1q-000236-F6
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:07:26 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8459670b-8cf1-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 13:07:25 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id bs20so33793004wrb.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 04:07:25 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600001cc00b0027b35baf811sm29936404wrx.57.2023.01.05.04.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:07:24 -0800 (PST)
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
X-Inumbo-ID: 8459670b-8cf1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8wnBL/jmFKxYHcNRdtvyM6TuTfxXm1XjkKh93ADJPd8=;
        b=gUI5XxHfoeoHELRuzdmvS2vOl6ebJkCm30Oo/sEHOSzSoZbPLk4ij+quExGJOn/Puv
         ZnSPCbCR5dvKNEkopnS/tS/17utaV6w35cxpm/TQIX+NAXwe2tJ+wxnlN8R29wWiuy0o
         WHBFutdw0WubFz08UEF6mvFyhitQXGYHIz99ZholPoDi+V/45Ph1hLiOanNJIgknsLZO
         VyswLgpvT6rsgk2ek3NhBvLtOzcps/lj5lpCqGWNBPkZGZESWsK0oKQT5VBwZK0ITYd4
         zrcKpDYTHwLG181NjyYnaBtO2QO2casFeSJMGxunX9H2NFq82dQo2tuvjf1V57NLMYvc
         cFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wnBL/jmFKxYHcNRdtvyM6TuTfxXm1XjkKh93ADJPd8=;
        b=jLCZxK2OBUynSixEKPX5O27KmHOBHVDWmfzdN9Z74TAxVPTSBItEI8MM9ZATkodLEo
         ezjYrF8+MxXmij1MFynZOYs7g38//S9FH9mn0npJ2ekmYiUV/2ii5xfGPymzadnRBFrv
         rGbZ4o2ZY/FtKvAhELgFCBb7Iftj65XF5mxiDIsej+7OeJhGTzC3Xbkp2Q2fhMb8+9Ht
         w3pc1pkjOvM8TOY9tntnZ3gUgfKb1AiRpNTnlRo3TulHEhPUcWySA3hdLpJGSe5h4Osr
         vWcOJ/whFuZOzR74xW1fMK3jJnAi77DckSo9DYdddMKi8ZROMDpuJTzSEQIXRftcaHR9
         +T+Q==
X-Gm-Message-State: AFqh2kpkG1EViqPpGzcV0fQSHj0vYTM2IvMqjF1+aZyt8jQKsyFAEgmp
	KdS4FiZ6/SI/+d8ePDEf+y4=
X-Google-Smtp-Source: AMrXdXuIuwVjNQyHpItyL3RjKI1GzeiriNBFSFhMxVmzPx3yx1C2Ww/4cGLZeUGjAH2jAAQs9kuS6A==
X-Received: by 2002:a05:6000:1109:b0:28d:b028:b16 with SMTP id z9-20020a056000110900b0028db0280b16mr14837756wrw.32.1672920445017;
        Thu, 05 Jan 2023 04:07:25 -0800 (PST)
Message-ID: <b6654ba5ec4002279fe101cf5796604264c18bbe.camel@gmail.com>
Subject: Re: [XEN PATCH v2 2/2] automation: add RISC-V 64 cross-build tests
 for Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Doug Goldstein <cardoe@cardoe.com>, Alistair Francis
	 <alistair.francis@wdc.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Gianluca Guida <gianluca@rivosinc.com>
Date: Thu, 05 Jan 2023 14:07:23 +0200
In-Reply-To: <f05a72a7-9991-ed31-8174-596d5b3f8145@citrix.com>
References: <cover.1672401599.git.oleksii.kurochko@gmail.com>
	 <855e05a0459d44282679f08c8f67e38d35635eb6.1672401599.git.oleksii.kurochko@gmail.com>
	 <f05a72a7-9991-ed31-8174-596d5b3f8145@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-01-04 at 20:39 +0000, Andrew Cooper wrote:
> On 30/12/2022 1:01 pm, Oleksii Kurochko wrote:
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-
> > ci/build.yaml
> > index e6a9357de3..11eb1c6b82 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -617,6 +644,21 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
> > =C2=A0=C2=A0=C2=A0=C2=A0 EXTRA_XEN_CONFIG: |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_BOOT_TIME_CPUPOOLS=3Dy
> > =C2=A0
> > +# RISC-V 64 cross-build
> > +riscv64-cross-gcc:
> > +=C2=A0 extends: .gcc-riscv64-cross-build
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:riscv64
> > +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> > +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> > +
> > +riscv64-cross-gcc-debug:
> > +=C2=A0 extends: .gcc-riscv64-cross-build-debug
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:riscv64
> > +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> > +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> > +
>=20
> Judging by the Kconfig which gets written out, I suggest inserting
> the
> two RANDCONFIG jobs right now.
>=20
> > =C2=A0## Test artifacts common
> > =C2=A0
> > =C2=A0.test-jobs-artifact-common:
> > @@ -692,3 +734,6 @@ kernel-5.10.74-export:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - binaries/bzImage
> > =C2=A0=C2=A0 tags:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - x86_64
> > +
> > +# # RISC-V 64 test artificats
> > +# # TODO: add RISC-V 64 test artitifacts
>=20
> Drop this hunk.=C2=A0 All you're going to be doing is deleting it in the
> next
> series...
>=20

Thanks for the comments.
They were fixed in patch series v4:
[PATCH v4 2/2] automation: add RISC-V 64 cross-build tests for Xen

~ Oleksii
> ~Andrew


