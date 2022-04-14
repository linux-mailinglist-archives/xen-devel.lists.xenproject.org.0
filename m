Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA35500FA5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 15:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304785.519542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezgN-0006Ot-Dz; Thu, 14 Apr 2022 13:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304785.519542; Thu, 14 Apr 2022 13:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezgN-0006LL-93; Thu, 14 Apr 2022 13:38:47 +0000
Received: by outflank-mailman (input) for mailman id 304785;
 Thu, 14 Apr 2022 13:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fq7I=UY=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nezgL-0006L2-2x
 for xen-devel@lists.xen.org; Thu, 14 Apr 2022 13:38:45 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33a27c15-bbf8-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 15:38:43 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso3204451wmz.4
 for <xen-devel@lists.xen.org>; Thu, 14 Apr 2022 06:38:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a056000144f00b002057eac999fsm2065008wrx.76.2022.04.14.06.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 06:38:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0FD221FFB7;
 Thu, 14 Apr 2022 14:38:41 +0100 (BST)
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
X-Inumbo-ID: 33a27c15-bbf8-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=dBeqz0WsltLCKb2+HsQX+wxXNC5FlwtuzHZg2vOsv7s=;
        b=ZB9NtAr1/FToK4NnULEwMLe9jylvqu5IMmaSHd21ggPlwink+yaAGxBJgjHt7Y2Ij0
         DhA+xl+LpPG3AUhYXmGSqH6oL82stgD0amoSmrvkUwIWQDKnYKOx8Q69o96YMEYuoEac
         lkFo/J1fhPM2qYtxI5uHLEelb7IabpS70f2hNpc68Npla7Syi6yWaFXIPlr39d+ZGgPb
         zgD9CT/DPgpQ2j5kEbigT5dDSx86VrK9Fe78YgloFDTEMjF4+jPqkLfu67FqWx32z9UV
         fm1257pqrSYxiJHVnUkRm3DQlvP8mFswoynz2S3XOg+MzvtZ1NP/lQ0C7vxgltBjKKeW
         Xtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=dBeqz0WsltLCKb2+HsQX+wxXNC5FlwtuzHZg2vOsv7s=;
        b=NtpLZZfg3vNW3dD3diaSeHWGzZyyInz2itC59Y7nhRz7DxTSEpZilgFsoaQVH+azQ4
         sj7pKEoPr7jN/COryURJqrVST2wSZbF8CDFlSXCz9Uo4BSfsrDi6/CJ+D1PufDOEm7Rb
         s7bQ+UhMSJKASBf76TTyqkvWdvYxfHOuObbr1yqJ/OsvoPLruAou2sG7ju4QkreWo6p6
         s7qKvcF4V84kXmeNgXcAcwf1S+1/gR+d5+xPZ3aDQI9fHqyGNAbr98CKpOvt2gbaEGi1
         C0QiTb/VMPRoMr7N+zJynaIO5cLP6UkgWTAn/9EzNIbTcfxJvkTdz76SiLmYtFF4vA87
         Eqvw==
X-Gm-Message-State: AOAM5321dFMPMsS8mD5v9OMfJoB5s/+cE9l6qcHKJXRyDCI2kQlsAgzA
	87cMa7VRMHReWcihOT7UklgVTA==
X-Google-Smtp-Source: ABdhPJyOpUFT1vjFFmcS3XRUtYc6u+SYoUOrO7gtVsf9tm6Cleq/iK7Qm2qE4+Nru9nt93pAOcimsg==
X-Received: by 2002:a05:600c:1c89:b0:38e:d1a6:bf7a with SMTP id k9-20020a05600c1c8900b0038ed1a6bf7amr3752757wms.204.1649943523111;
        Thu, 14 Apr 2022 06:38:43 -0700 (PDT)
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <20220414092358.kepxbmnrtycz7mhe@vireshk-i7>
 <20220414114557.4myrs4ud4qi2hnrz@liuwe-devbox-debian-v2>
 <2a735486-a464-3997-642a-3b0660b11b9e@citrix.com>
 <20220414125213.6qqn5wcphau5j3i3@liuwe-devbox-debian-v2>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, "stratos-dev@op-lists.linaro.org"
 <stratos-dev@op-lists.linaro.org>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Doug Goldstein
 <cardoe@cardoe.com>
Subject: Re: Virtio on Xen with Rust
Date: Thu, 14 Apr 2022 14:36:12 +0100
In-reply-to: <20220414125213.6qqn5wcphau5j3i3@liuwe-devbox-debian-v2>
Message-ID: <871qxzyecf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Wei Liu <wl@xen.org> writes:

> On Thu, Apr 14, 2022 at 12:07:10PM +0000, Andrew Cooper wrote:
>> On 14/04/2022 12:45, Wei Liu wrote:
>> > Hi Viresh
>> >
>> > This is very cool.
>> >
>> > On Thu, Apr 14, 2022 at 02:53:58PM +0530, Viresh Kumar wrote:
>> >> +xen-devel
>> >>
>> >> On 14-04-22, 14:45, Viresh Kumar wrote:
>> >>> Hello,
>> >>>
>> >>> We verified our hypervisor-agnostic Rust based vhost-user backends w=
ith Qemu
>> >>> based setup earlier, and there was growing concern if they were truly
>> >>> hypervisor-agnostic.
>> >>>
>> >>> In order to prove that, we decided to give it a try with Xen, a type=
-1
>> >>> bare-metal hypervisor.
>> >>>
>> >>> We are happy to announce that we were able to make progress on that =
front and
>> >>> have a working setup where we can test our existing Rust based backe=
nds, like
>> >>> I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.
>> >>>
>> >>> Key components:
>> >>> --------------
>> >>>
>> >>> - Xen: https://github.com/vireshk/xen
>> >>>
>> >>>   Xen requires MMIO and device specific support in order to populate=
 the
>> >>>   required devices at the guest. This tree contains four patches on =
the top of
>> >>>   mainline Xen, two from Oleksandr (mmio/disk) and two from me (I2C).
>> >>>
>> >>> - libxen-sys: https://github.com/vireshk/libxen-sys
>> >>>
>> >>>   We currently depend on the userspace tools/libraries provided by X=
en, like
>> >>>   xendevicemodel, xenevtchn, xenforeignmemory, etc. This crates prov=
ides Rust
>> >>>   wrappers over those calls, generated automatically with help of bi=
ndgen
>> >>>   utility in Rust, that allow us to use the installed Xen libraries.=
 Though we
>> >>>   plan to replace this with Rust based "oxerun" (find below) in long=
er run.
>> >>>
>> >>> - oxerun (WIP): https://gitlab.com/mathieupoirier/oxerun/-/tree/xen-=
ioctls
>> >>>
>> >>>   This is Rust based implementations for Ioctl and hypercalls to Xen=
. This is WIP
>> >>>   and should eventually replace "libxen-sys" crate entirely (which a=
re C based
>> >>>   implementation of the same).
>> >>>
>> > I'm curious to learn why there is a need to replace libxen-sys with the
>> > pure Rust implementation. Those libraries (xendevicemodel, xenevtchn,
>> > xenforeignmemory) are very stable and battle tested. Their interfaces
>> > are stable.
>>=20
>> Very easy.=C2=A0 The library APIs are mess even if they are technically
>> stable, and violate various commonly-agreed rules of being a libary such
>> as not messing with stdout/stderr behind the applications back, and
>> everything gets more simple when you remove an unnecessary level of C
>> indirection.
>
> You don't have to use the stdio logger FWIW. I don't disagree things can
> be simpler though.

Not directly related to this use case but the Rust API can also be
built to make direct HYP calls which will be useful for building Rust
based unikernels that need to interact with Xen. For example for a
dom0less system running a very minimal heartbeat/healthcheck monitor
written in pure rust.

We would also like to explore unikernel virtio backends but I suspect
currently the rest of the rust-vmm virtio bits assume a degree of POSIX
like userspace to set things up.

--=20
Alex Benn=C3=A9e

