Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226CD9A9350
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 00:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823964.1238054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30su-00040B-4m; Mon, 21 Oct 2024 22:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823964.1238054; Mon, 21 Oct 2024 22:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30su-0003yR-2D; Mon, 21 Oct 2024 22:28:20 +0000
Received: by outflank-mailman (input) for mailman id 823964;
 Mon, 21 Oct 2024 22:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pwn9=RR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t30ss-0003yG-G0
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 22:28:18 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c46880f2-8ffb-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 00:28:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A3C43A43B3D;
 Mon, 21 Oct 2024 22:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE87C4CEE6;
 Mon, 21 Oct 2024 22:28:14 +0000 (UTC)
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
X-Inumbo-ID: c46880f2-8ffb-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729549695;
	bh=+byfss9ay9GfFzFJTLCAlbgY5ZE5Pl2ZOEomuj5sfHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RmqwH83h3zeG1blDxKeFKRZrEGqJ3YonW/M7IfAyJcfdxBq95Uc1z+wPSlo8G8hF3
	 SzWLa1vfb7/iLGmRbrwtr1DBsTer5uTL0zA+WoAdFhVLsaAMke6bK/uoUsVuyyErUB
	 5ed9Q63pQpdmYZZl76TsUyl48h59+ZHwjU2rSZLkbUg1c6PDP6l9Pr/33Oc42ZzgG3
	 0pCwJSjzOgEuDUFRjHAJA51h5Z/7BhAu3eHMcUV50eeapkvXEgLOq3/3k0xMuTShKz
	 B5JDiIRadFQqH80U2GgVwYTWf9cmiAgqHFxM4OzDi04AlrS6OcYH+vqZKKVmQUEWne
	 MWxL4FA6hFWFA==
Date: Mon, 21 Oct 2024 15:28:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/3] CI: Add {adl,zen3p}-pvshim-* tests
In-Reply-To: <5d02722a-eccd-43f9-9d6e-2e845d9757d9@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410211524170.3833@ubuntu-linux-20-04-desktop>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com> <20241021143539.3898995-4-andrew.cooper3@citrix.com> <78116f34-2448-4b08-9eb3-50d70a18074e@citrix.com> <5d02722a-eccd-43f9-9d6e-2e845d9757d9@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-601275253-1729549695=:3833"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-601275253-1729549695=:3833
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 21 Oct 2024, Andrew Cooper wrote:
> > Bah - serves me right for some last minute refactoring.  The domain type
> > should be pvh for pvshim=1 to work.
> >
> > New pipeline:
> > https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1505540810
> 
> And from the same bit of refactoring, a mismatch between
> domU_extra_{cfg,config}.  Consolidated on the latter.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/8143613752

I reviewed the commit c80e9241209cc9ed7f66c3f45275f837ddafc21c from your
branch instead. See below.


> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index b27c2be174..e76a37bef3 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -240,6 +240,14 @@ adl-pci-hvm-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +adl-pvshim-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  zen3p-smoke-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> @@ -272,6 +280,14 @@ zen3p-pci-hvm-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +zen3p-pvshim-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 76fbafac84..95090eb12c 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -8,6 +8,7 @@ set -ex
>  #  - dom0pvh-hvm    PVH dom0, HVM domU
>  #  - pci-hvm        PV dom0,  HVM domU + PCI Passthrough
>  #  - pci-pv         PV dom0,  PV domU + PCI Passthrough
> +#  - pvshim         PV dom0,  PVSHIM domU
>  #  - s3             PV dom0,  S3 suspend/resume
>  test_variant=$1
>  
> @@ -20,8 +21,8 @@ domU_vif="'bridge=xenbr0',"
>  domU_extra_config=
>  
>  case "${test_variant}" in
> -    ### test: smoke test & smoke test PVH & smoke test HVM
> -    ""|"dom0pvh"|"dom0pvh-hvm")
> +    ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
> +    ""|"dom0pvh"|"dom0pvh-hvm"|"pvshim")
>          passed="ping test passed"
>          domU_check="
>  ifconfig eth0 192.168.0.2
> @@ -44,6 +45,11 @@ echo \"${passed}\"
>  
>          if [ "${test_variant}" = "dom0pvh-hvm" ]; then
>              domU_type="hvm"
> +        elif [ "${test_variant}" = "pvshim" ]; then
> +            domU_type="pvh"

This is not necessary since PVH is already the default. In theory, it is
harmless, but it caused me to do a double-take because I initially
thought I was missing something, given that PVH is expected to be the
default at this point.


> +            domU_extra_config='
> +pvshim = 1
> +'

Is there a reason this cannot be:

    domU_extra_config='pvshim = 1'

?

These are just minor cosmetics.


>          fi
>          ;;
>  
--8323329-601275253-1729549695=:3833--

