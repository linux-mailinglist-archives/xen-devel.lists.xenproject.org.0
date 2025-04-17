Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F14A928D3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 20:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958439.1351279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5U7h-00061f-Ek; Thu, 17 Apr 2025 18:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958439.1351279; Thu, 17 Apr 2025 18:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5U7h-0005zF-CD; Thu, 17 Apr 2025 18:38:05 +0000
Received: by outflank-mailman (input) for mailman id 958439;
 Thu, 17 Apr 2025 18:38:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnA5=XD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5U7g-0005z9-4V
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 18:38:04 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1806e79b-1bbb-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 20:38:02 +0200 (CEST)
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
X-Inumbo-ID: 1806e79b-1bbb-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744915081; x=1745174281;
	bh=JgFdV5bxosIj76/HXwpDX+S+jkbp6EIiAhzf8PJdnkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QjZHzTTDL5TBU1nK1b4AowRKjAJjT8s0w5PkxC9SAzlln4RnFAEliExjn+a2hGoRJ
	 aJ0L8cqJFyU9FBT6KhPRzgDSI2mUUEH447O/DzrX5+7oFN09HWVKSEmdnrBezjOBfO
	 cXCaazu2cQ9jIdHQMyvx6aVL6QAmyb7eL5xaT7PVY06hnY+ftlKlrySRoLIXxoGzBN
	 +t4tOXFxx/Hg7MM2/5QVy9kEljM/OjdaAdujnG9gA6ONqYFtNW4zB0opL3hZTfuG2W
	 QoAeiJ10d17enMAqkBhAWg/gr32trDRsMSzsKHW0pvfWEil2/ye4RFm8SDrNO6EUeD
	 TKAAuY45tGrjQ==
Date: Thu, 17 Apr 2025 18:37:56 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, dmukhin@ford.com
Subject: Re: [PATCH v1 4/4] CI: add argo x86 XTF test
Message-ID: <aAFKfhGrs0eFAAEA@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2504161708470.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-5-dmukhin@ford.com> <alpine.DEB.2.22.394.2504161708470.8008@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e7708f719da3f66dd05c457233d9c2e6f8219bba
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 05:11:51PM -0700, Stefano Stabellini wrote:
> On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Introduce new CI job to run x86 XTF argo test under QEMU to smoke test =
argo
> > feature functionality in upstream CI.
> >
> > The new job lead time is ~30s, limit max job duration to 60s.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  automation/gitlab-ci/test.yaml        | 9 +++++++++
> >  automation/scripts/include/xtf-runner | 7 +++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
.yaml
> > index d6e4a0a622..9001efb45c 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -691,6 +691,15 @@ qemu-smoke-x86-64-gcc-efi:
> >    needs:
> >      - debian-12-x86_64-gcc-debug
> >
> > +qemu-xtf-argo-x86_64-gcc-debug:
> > +  extends: .qemu-smoke-x86-64
> > +  variables:
> > +    TEST_TIMEOUT_OVERRIDE: 60
> > +  script:
> > +    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 argo 2>&1 | tee ${L=
OGFILE}
> > +  needs:
> > +    - alpine-3.18-gcc-debug
> > +
> >  qemu-smoke-riscv64-gcc:
> >    extends: .qemu-riscv64
> >    script:
> > diff --git a/automation/scripts/include/xtf-runner b/automation/scripts=
/include/xtf-runner
> > index 55b7b34b89..12470b3979 100644
> > --- a/automation/scripts/include/xtf-runner
> > +++ b/automation/scripts/include/xtf-runner
> > @@ -70,6 +70,9 @@ function xtf_build_cmdline()
> >      local xtf_variant=3D$1
> >      local xtf_name=3D$2
> >      declare -a cmdline=3D()
> > +    declare -A per_test_args=3D(
> > +        [argo]=3D"argo=3D1 mac-permissive=3D1"
> > +    )
> > +
> >      cmdline+=3D("loglvl=3Dall noreboot console_timestamps=3Dboot")
> >      cmdline+=3D("console=3D${XEN_CONSOLE}")
> > @@ -79,6 +82,10 @@ function xtf_build_cmdline()
> >          cmdline+=3D("dom0-iommu=3Dnone dom0=3Dpvh")
> >      fi
> >
> > +    if [[ -v per_test_args[${xtf_name}] ]]; then
> > +        cmdline+=3D("${per_test_args[${xtf_name}]}")
> > +    fi
> > +
>=20
> This is all within the same bash function so I think we could avoid
> using the per_test_args array and just do:
>=20
> if test "$xtf_name"
> then
>     cmdline+=3D("argo=3D1 mac-permissive=3D1")
> fi
>=20
> The indirection is not required as far as I can tell. I do realize it is
> a matter of taste and it works either way so I wouldn't insist.

Some XTFs may need special configuration.
I added this to be a placeholder for test-specific Xen run-time configurati=
on.

>=20
>=20
>=20
> >      export XEN_CMDLINE=3D"${cmdline[@]}"
> >  }
> >
> > --
> > 2.34.1
> >
> >


