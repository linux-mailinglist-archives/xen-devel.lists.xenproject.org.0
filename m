Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FB850FF1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679461.1056911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSuX-0005W8-JU; Mon, 12 Feb 2024 09:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679461.1056911; Mon, 12 Feb 2024 09:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSuX-0005T8-FF; Mon, 12 Feb 2024 09:47:37 +0000
Received: by outflank-mailman (input) for mailman id 679461;
 Mon, 12 Feb 2024 09:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hp+9=JV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rZSuW-0005Sp-12
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:47:36 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfe01837-c98b-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 10:47:35 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d0a0e40672so26129741fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:47:35 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a05651c103500b002d0fad1ed27sm9899ljm.44.2024.02.12.01.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 01:47:34 -0800 (PST)
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
X-Inumbo-ID: bfe01837-c98b-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707731255; x=1708336055; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9gSSYFcIMJkZXjr0kQ/zifKsz/U8RjjYGbhYK+dZAz0=;
        b=ljogK0G8liayvBLzqHBHJB6bEjugjMf30yLnrTdpuL+veKWOv5E1J90KXqITrHKbgr
         Mvdo4+bW/kzFpzeXI3ELjMYlXNW8XhRbYPz5H/hwpfJ0J5OTPhJVhTn8ZW06RCOKAFvd
         JoWFjzrbQkfL594q6FL3onwu+mJe2GGxmvlyZtqZ4cqWlGN09LtI+ttEVKkzdxRb4/EV
         kxUvWCIdHSR58umOh6Rx1w8ZWku/eQLLem/ayegr7XVtvRO1BE/bkZQc2sFa3my4cthH
         t80kAFA2Xs/YfHROsHAKBPdbyRkBe5EP6zcexaVh5o5X/JnZacpBmjyTuVgtnBwL+CF0
         CABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731255; x=1708336055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gSSYFcIMJkZXjr0kQ/zifKsz/U8RjjYGbhYK+dZAz0=;
        b=wkrsssBP8zEprAN1nPiazAUASHPWgdqDScFnwDw1jJutuHJIHyJJ8YySg0ZwT0pZel
         JYDpN3zQjZ0NTnth8IhOuNLIip3qAfZLTmON5Jg87TadOkR6KePlNok+ZnQnU6YM+FGo
         jairu0YrZRo6cwWOov9LB/MxBMylDTZZXFokP+68LLhfGdJ4cMaq7XQUmw659cN8yRXr
         SNdnMGN1N0ZMbxCBK4g76hfPTp+7g3rMVKTjjKin1hZI8FQRndmS4CDBURJ9wT/SDiQH
         gs8r7YA6mwiLFvG9UxUM7X40sahDl8NnFkYj7KeAgEO+Hr3Y986Z/mXL+5/nlz85S7fG
         bYuQ==
X-Gm-Message-State: AOJu0Yx/e/LuQZaY8hAUKVeMTbbGg0SA7mKLue4XFMs5f0RoRlsiMSyY
	n7z00gphTZ8rjHMiMG494T2ls2MAknIlkL2AVjtRpjzEAitmM1lm
X-Google-Smtp-Source: AGHT+IFMX/YroMfcqFxRcBbyvnmYQrWw03ALhQuj2JmQFdD7Ae3k3HrIR7wQ7B8fRBK6tvjcB4PxnQ==
X-Received: by 2002:a2e:964b:0:b0:2d0:7e5b:31d2 with SMTP id z11-20020a2e964b000000b002d07e5b31d2mr3022182ljh.4.1707731254447;
        Mon, 12 Feb 2024 01:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqdxyraeD2aFfW0n4zHvHCreKfJzMI8JziIhm3rhgBYW1gfIaECAYyosUja7SxHCd2JxUeJlkZIG1mjj/JmnjcW838SMGcWb6nwLRZkPemcyvUYs0m2zBMMK5EHmRwXmY6Ebunp1w=
Message-ID: <3d7dd7aa52191752dfbe92374f06fd9742cd55df.camel@gmail.com>
Subject: Re: [PATCH v8 2/7] automation: introduce fixed randconfig for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Mon, 12 Feb 2024 10:47:33 +0100
In-Reply-To: <738a0947-0c54-4c13-b632-a5e711894e7c@amd.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
	 <3f662e3b4ded36d982ff04ed5cdfdd8e36f83594.1707499278.git.oleksii.kurochko@gmail.com>
	 <738a0947-0c54-4c13-b632-a5e711894e7c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 09:39 +0100, Michal Orzel wrote:
> Hi Oleksii,
Hi Michal,

>=20
> On 09/02/2024 19:00, Oleksii Kurochko wrote:
> >=20
> >=20
> > This patch introduces the file riscv-fixed-randconfig.yaml,
> > which includes all configurations that should be disabled for
> > randconfig builds.
> >=20
> > Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > The patch were introduced after discussion in a topic:
> > =C2=A0
> > https://lore.kernel.org/xen-devel/cover.1701966261.git.oleksii.kurochko=
@gmail.com
> > /
> > =C2=A0---
> > Changes in V8:
> > =C2=A0- Nothing changed. Only rebase
> > ---
> > Changes in V7:
> > =C2=A0- Nothing changed. Only rebase
> > ---
> > Changes in V6:
> > =C2=A0- The patch was introduced in this version of patch series.
> > ---
> > =C2=A0automation/gitlab-ci/build.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +=
+++----
> > =C2=A0automation/gitlab-ci/riscv-fixed-randconfig.yaml | 7 +++++++
> > =C2=A02 files changed, 11 insertions(+), 4 deletions(-)
> > =C2=A0create mode 100644 automation/gitlab-ci/riscv-fixed-
> > randconfig.yaml
> >=20
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-
> > ci/build.yaml
> > index 6d2cb18b88..376eb17f9c 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -512,6 +512,8 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_BOOT_TIME_CPUPOOLS=3Dy
> >=20
> > =C2=A0# RISC-V 64 cross-build
> > +include: 'automation/gitlab-ci/riscv-fixed-randconfig.yaml'
> I don't think there is a need to create a new file for that.
> You could define an anchor in build.yaml:
>=20
> # RISC-V 64 cross-build
> .riscv-fixed-randconfig:
> =C2=A0 variables: &riscv-fixed-randconfig
> =C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG: |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_EXPERT=3Dy
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn
>=20
> and reference it in the job:
>=20
> archlinux-current-gcc-riscv64-randconfig:
> =C2=A0 extends: .gcc-riscv64-cross-build
> =C2=A0 variables:
> =C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> =C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> =C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> =C2=A0=C2=A0=C2=A0 <<: *riscv-fixed-randconfig
I've created a new file just for convenience, build.yaml. It is pretty
large, and it's not always easy to navigate, especially when you don't
remember a specific name.
This is not directly related to this patch, but it seems to me that it
would be better to create arch-specific files and include them in
build.yaml.

If it would be better not to create a new file, I am okay to drop it
and add everything to build.yaml.

Thanks.

~ Oleksii


