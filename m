Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FC808453
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649657.1014437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAaV-0000ap-Jt; Thu, 07 Dec 2023 09:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649657.1014437; Thu, 07 Dec 2023 09:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAaV-0000Xy-HB; Thu, 07 Dec 2023 09:22:31 +0000
Received: by outflank-mailman (input) for mailman id 649657;
 Thu, 07 Dec 2023 09:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBAaU-0000Xr-Nb
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:22:30 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23dfe646-94e2-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:22:28 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a1f47f91fc0so6853166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 01:22:28 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ov8-20020a170906fc0800b00a1cbb055575sm562069ejb.180.2023.12.07.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 01:22:27 -0800 (PST)
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
X-Inumbo-ID: 23dfe646-94e2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701940948; x=1702545748; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4gcCcVl/OrvlS/H8SXEbCBNlEwdZbATi2HVrc1fSjFI=;
        b=KAoALnXIAajG7yxDFca4Q3D1lQzCtpLUjwYjm2NqR5xjQrVM0FDC9pQ4pufaBIGUt6
         umVCTBrnHVHaH+NNlDU7IbZhw0lEPB76qy03PTHRNOlngVD6HD3ig8y1agP4m9n9Xsen
         E073E+EmMVfI79SiBkMmXmghWIvFemNXYdRIIbBidcbUWXPYiZTutKIXRzzd2wOh0F8V
         zqyrauGwgs4PGuwkwqUpN0Dh/3Wv97HrKNZD4Pw7BM1defH/RyaU6SJZ2dMs1kdofKl9
         plNi1dAGeeK7VYr3mWQ43J5oetptsMGCo5KaMMCAY7UMlNT3XaGzCNF8FDrb5+MD0jFI
         6ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940948; x=1702545748;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gcCcVl/OrvlS/H8SXEbCBNlEwdZbATi2HVrc1fSjFI=;
        b=YOKn9nbhD4D9StxBGuwOgsIhdhQKhCpYPCqbKKobpCGCU9PtkPCcWQsbFf0+2f6edS
         YE12MPQDAith8Eok6PXkKrPmSq3lo6YsosRFm/mQ8XJVW0C7JbBbVyQ0QjSRGmmFzeOD
         1OcHAAIPAG1rT1g3GtgQyJ1MicgSxeIu1gpBDyqKF+exklX9RhINy+XhaCjT4Vx+0cmu
         BTDFrWhgBlv6mApHn2rP97++PCOUBfcH7eXksBD1Kv7LNaE/uHgNXCPvB0tvaBzNDYFN
         2RgInWl7qzken5FbPFgQO8U6r3uoAKemGGXzZnXZjaxDUA9laElU0o307KN6KuwPTHOn
         exJg==
X-Gm-Message-State: AOJu0Yw6mqRUtICIGkWhotSa0eAeDtuutQl9X/ItZ9F9N3dC5TTsln2m
	MLadqdTm5V26rHGyixN1Cb8=
X-Google-Smtp-Source: AGHT+IFJkGUGMtUWw8V6wzSFDUNfFKOBhOTHOg2VC1Nfw19gk8XaiaHHshu7RCSPXTvZ7HhvuSwI9w==
X-Received: by 2002:a17:906:b248:b0:a02:27d9:9f05 with SMTP id ce8-20020a170906b24800b00a0227d99f05mr1392788ejb.42.1701940948116;
        Thu, 07 Dec 2023 01:22:28 -0800 (PST)
Message-ID: <22fa451f7b165a00082443a35077e98e101c22e4.camel@gmail.com>
Subject: Re: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
	Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 07 Dec 2023 11:22:27 +0200
In-Reply-To: <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
	 <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-12-05 at 16:38 +0100, Jan Beulich wrote:
> > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > The patch also fixes the build script as conf util expects
> > > > to have each config on separate line.
> >=20
> > The approach doesn't really scale (it's already odd that you add
> > the
> > (apparently) same set four times. There's also zero justification
> > for
> > this kind of an adjustment (as per discussion elsewhere I don't
> > think
> > we should go this route, and hence arguments towards convincing me
> > [and
> > perhaps others] would be needed here).
I agree that this may not be the best approach, but it seems like we
don't have too many options to turn off a config for randconfig.

To be honest, in my opinion (IMO), randconfig should either be removed
or allowed to fail until most of the functionality is ready. Otherwise,
there should be a need to introduce HAS_* or depend on
'SUPPORTED_ARCHS' for each config, or introduce a lot of stubs.

Could you please suggest a better option?

> >=20
> > > > --- a/automation/gitlab-ci/build.yaml
> > > > +++ b/automation/gitlab-ci/build.yaml
> > > > @@ -522,6 +522,38 @@ archlinux-current-gcc-riscv64:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> > > > +=C2=A0=C2=A0=C2=A0 EXTRA_XEN_CONFIG:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_CREDIT=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_CREDIT2=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_RTDS=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_NULL=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_ARINC653=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_TRACEBUFFER=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HYPFS=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SPECULATIVE_HARDEN_ARRAY=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_ARGO=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HYPFS_CONFIG=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_CORE_PARKING=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_DEBUG_TRACE=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_IOREQ_SERVER=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_CRASH_DEBUG=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_KEXEC=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_LIVEPATCH=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_NUMA=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_PERF_COUNTERS=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HAS_PMAP=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_TRACEBUFFER=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_XENOPROF=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COMPAT=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_UBSAN=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_NEEDS_LIBELF=3Dn
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_XSM=3Dn
> > > > +
> > > > =C2=A0
> > > > =C2=A0archlinux-current-gcc-riscv64-debug:
> > > > =C2=A0=C2=A0 extends: .gcc-riscv64-cross-build-debug
> >=20
> > I think I've said so elsewhere before: Please avoid introducing
> > double
> > blank lines, unless entirely unavoidable (for reasons I cannot
> > think
> > of).
Sorry for that; I am not doing that on purpose. It's just a big patch
series, and I missed that double blank. I will try to be more
attentive.

Do you think it makes sense to add a script to perform basic code style
checks, similar to what Linux has?

> >=20
~ Oleksii


