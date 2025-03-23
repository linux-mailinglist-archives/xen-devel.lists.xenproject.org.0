Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC0DA6CFD3
	for <lists+xen-devel@lfdr.de>; Sun, 23 Mar 2025 15:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925019.1327905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twMl0-0004mV-54; Sun, 23 Mar 2025 14:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925019.1327905; Sun, 23 Mar 2025 14:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twMl0-0004jb-1W; Sun, 23 Mar 2025 14:56:58 +0000
Received: by outflank-mailman (input) for mailman id 925019;
 Sun, 23 Mar 2025 14:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6FT=WK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1twMky-0004jC-NY
 for xen-devel@lists.xenproject.org; Sun, 23 Mar 2025 14:56:56 +0000
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [2607:f8b0:4864:20::b36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de23d4f-07f7-11f0-9ffa-bf95429c2676;
 Sun, 23 Mar 2025 15:56:52 +0100 (CET)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e5dc299deb4so3217375276.1
 for <xen-devel@lists.xenproject.org>; Sun, 23 Mar 2025 07:56:52 -0700 (PDT)
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
X-Inumbo-ID: 0de23d4f-07f7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742741811; x=1743346611; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8DKcStIvaxLyy9Yz9mrc7ut/cxNfr85Fb8dAkds4bM=;
        b=VPK8ZvvWwg/8MNheGC5ze3qggWZko5m2Qc5evakZlDs8hh16saG82ctaNYCYDWpqxp
         F5RyEyuDh9aj5qoLyiTrGWKnzmeH6hpmSGLPxdsExygfR+hE858sAEZNr+TdMj4KkAP3
         AbWSGKmc9UghNk/fhxIppl5CSJBh1cFM9wS8ogShqdZSD7BJvmkPYXDrHsVCqYC7182X
         qcOgnIKdejovQxaMk6DAET4ZaqxapIAVxiokf7oe8wLMiC3hIsTbSSgCtwcTgaalvnl8
         8tPXwJgjTub9sK/kxlhzhOAxloYJRtOg4PEfH7j5fFFdcmopJBjfEjhF+T4d+09OwMXU
         kMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742741811; x=1743346611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8DKcStIvaxLyy9Yz9mrc7ut/cxNfr85Fb8dAkds4bM=;
        b=oijE95SvLDs3AQcjH3sQ7E8DO++P5bJSKNQH6Iw2y3B2IlUtkjESyRLD8ctWKFwJVn
         EGYQbOTfBnVnrYTClnDa4TgEwrwm7vTbchQDB0nuPkFg6B59tZaNVbqYE2MPmu5i4a/t
         4U87hLZ1kgGEKiNpZqC+wJZNOr6weHoSmy0DateBgH/bWJZQShas8+ZEpNFG64LUpSuO
         a2kO5sBYZGT70XQRqwNSI8S/c8dxFCXDIVCS7PoavElfC2nyJa1eGlbVFTIMKVHIt4VS
         CYKhL+6A9gR6TKGdgIwlbrzu9+nDHGDMOtUEkgHeRXwsf640CKr4L47OJHmlpmSm9akp
         Wmgw==
X-Gm-Message-State: AOJu0YzYrT04ZiW5kLvll19QUgodLokYFrqmrWDiM8Wen2I5F0n/ZUKR
	7FZxJgw3k7kGAUc8trtisVj8N/gnuZkAIHPowq8W6Pd/T+83hyNH7yT0vm062Gk9rvYjC4gj3nF
	s8YRP9ibbSrM+HnHC7xq1WyXypatUvSk6
X-Gm-Gg: ASbGncshqaGmL58zJ+A4a4ENSrzM9R7s2xX1Y/dBg1qx7zcX1L0yrme3ssjYYhTTrvO
	ggJWA4hn0LJARSe1wz7+o1NaYAQplo8ND6kapXdDbZbPlDo7sCEhxZCviKdUUF4IRx/7leGamYY
	mF84/dORjJtMrV5Mq3IfFeEkE=
X-Google-Smtp-Source: AGHT+IGR+mKCdRNvJ+NVjaFqlhFkz3i1X6s+djSQ5yTsu2pqDQH/9yXHybIQic9OOl1FGniPhbObBXHofyvI7gwi7x4=
X-Received: by 2002:a05:6902:228f:b0:e63:ebc9:656 with SMTP id
 3f1490d57ef6-e66a4fa21e2mr11152540276.35.1742741811373; Sun, 23 Mar 2025
 07:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <f06ad622-4bb7-4a7d-9d11-a3c1456a4aa1@sl.nospam.tangomaris.de>
In-Reply-To: <f06ad622-4bb7-4a7d-9d11-a3c1456a4aa1@sl.nospam.tangomaris.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 23 Mar 2025 10:56:40 -0400
X-Gm-Features: AQ5f1Jq55d6g3bXO4qccMqA50zeqozVu2Rq-9DEYUBZzHwVoMgPGkycU2VCnu90
Message-ID: <CAKf6xptiqnwcsc8q8nFk_XBGjP392o4kvLjc3_GzgaO_XpyJoA@mail.gmail.com>
Subject: Re: VIF network definition does not work with backend=domnet
To: Shen Long <xen-mailinglist@sl.nospam.tangomaris.de>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 8:51=E2=80=AFAM Shen Long
<xen-mailinglist@sl.nospam.tangomaris.de> wrote:
>
> Hello,

Hi Shen,

> Here the test.cfg domu which "works":
>
> name =3D "test"
> builder =3D "hvm"
> vcpus =3D 1
> memory =3D 4096
> #vif =3D [ 'backend=3Dnetbackend,bridge=3Ddmz' ]

Try:
vif =3D [ 'backend=3Dnetbackend,bridge=3Ddmz,type=3Dvif' ]

This will give "test" just a PV nic (and not an emulated nic).

> disk =3D [ 'file:/isos/systemrescue-11.03-amd64.iso,hda:cdrom,r' ]
> usbdevice =3D [ "tablet" ]
> serial =3D "pty"
> on_poweroff =3D "destroy"
> on_reboot =3D "restart"
> on_crash =3D "restart"
>
> It does not have a proper disk yet, because testing.
> The Problem is, if i remove the hash from the vif spec, i get this error
> on `xl create test.cfg`:
>
> # xl create /etc/xen/domuconfig/test.cnf
> Parsing config from /etc/xen/domuconfig/test.cnf
> libxl: error: libxl_dm.c:3157:device_model_spawn_outcome: Domain
> 89:domain 89 device model: spawn failed (rc=3D-3)

/var/log/xen/qemu-dm-test.log probably reports an error about bridge
dmz not existing.

qemu runs in dom0, but your bridge "dmz" is in the driver domain,
"netbackend".  By using type=3Dvif, xl skips creating the emulated nic
with qemu.  I think `xl network-attach` uses type=3Dvif by default,
which also avoids the emulated nic issue.

Regards,
Jason

