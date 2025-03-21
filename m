Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61CA6C5B2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 23:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924572.1327705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkdb-0006lJ-Ue; Fri, 21 Mar 2025 22:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924572.1327705; Fri, 21 Mar 2025 22:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkdb-0006jP-RM; Fri, 21 Mar 2025 22:14:47 +0000
Received: by outflank-mailman (input) for mailman id 924572;
 Fri, 21 Mar 2025 22:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvkdZ-0006j7-PF
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 22:14:45 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3f91bf5-06a1-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 23:14:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BEFFCA49476;
 Fri, 21 Mar 2025 22:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7281BC4CEE3;
 Fri, 21 Mar 2025 22:14:41 +0000 (UTC)
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
X-Inumbo-ID: e3f91bf5-06a1-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742595282;
	bh=HrcGxRPowa2EJTY8L9FIFGW9EHYy6la35A3Ou5hkL3s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zxj8jY9N9O+8QMr/RNXW/K7igisXO9Ob25jG0iS8QQiOdQ18s+pOyXD3a18kEQcln
	 bnlhAN6zP4TJH6Dhqjs2UnXDd/uNcNJpKt9p+qaTbU7JAbEodaLL8nvFW/NnoJPbrE
	 k+GIKIh81dV+DTfSgbfiwI+XnZ4vEnAzIputAWl8CO3Os0Sh+q1ltpRO3/+QHfUu2+
	 dl4dP1bgmV60nONbZfNBHNeWUEK3xieM21md5Xnb5B9DxJI+GrsNpyiBFRpv8RYao8
	 AEBtviFkbaFj5x6duoOGZHKnMabw9sgKpaVBvxu1QjuFB8pPJ+fi0NMdFvqhKYP4SB
	 wsZo5N1l5QfgQ==
Date: Fri, 21 Mar 2025 15:14:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 4/4] automation/cirrus-ci: add smoke tests for the
 FreeBSD builds
In-Reply-To: <20250320152020.88526-5-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503211514230.2325679@ubuntu-linux-20-04-desktop>
References: <20250320152020.88526-1-roger.pau@citrix.com> <20250320152020.88526-5-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-229660605-1742595282=:2325679"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-229660605-1742595282=:2325679
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Mar 2025, Roger Pau Monne wrote:
> Introduce a basic set of smoke tests using the XTF selftest image, and run
> them on QEMU.  Use the matrix keyword to create a different task for each
> XTF flavor on each FreeBSD build.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes since v1:
>  - Use production version of FreeBSD to run tests.
> ---
>  .cirrus.yml  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  CHANGELOG.md |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 38b654f75cf2..3163ab8f11d8 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -5,6 +5,8 @@ freebsd_versions: &FREEBSD_VERSIONS
>      FREEBSD_PRODUCTION: freebsd-14-2
>      FREEBSD_CURRENT:    freebsd-15-0-snap
>  
> +# Build jobs
> +
>  freebsd_template: &FREEBSD_ENV
>    environment:
>      APPEND_LIB: /usr/local/lib
> @@ -118,3 +120,55 @@ task:
>    xtf_artifacts:
>      path: xtf/tests/selftest/test-*-selftest
>      type: application/octet-stream
> +
> +# Test jobs
> +
> +task:
> +  name: 'FreeBSD: XTF selftest'
> +
> +  << : *FREEBSD_ENV_PRODUCTION
> +
> +  env:
> +    matrix:
> +      FREEBSD_BUILD: $FREEBSD_LEGACY
> +      FREEBSD_BUILD: $FREEBSD_PRODUCTION
> +      FREEBSD_BUILD: $FREEBSD_CURRENT
> +
> +  depends_on:
> +    - freebsd_full_$FREEBSD_BUILD
> +    - xtf
> +
> +  install_script: pkg install -y qemu-nox11 expect
> +
> +  env:
> +    matrix:
> +      XTF_ARCH: hvm32
> +      XTF_ARCH: hvm32pae
> +      XTF_ARCH: hvm32pse
> +      XTF_ARCH: hvm64
> +      XTF_ARCH: pv64
> +
> +  fetch_script:
> +    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip
> +    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/freebsd_full_$FREEBSD_BUILD/xen.zip
> +    - unzip xtf.zip
> +    - unzip xen.zip
> +
> +  test_script: |
> +    case "$XTF_ARCH" in \
> +      *hvm*) \
> +        XEN_EXTRA_CMD="dom0=pvh dom0-iommu=none" \
> +        ;; \
> +    esac
> +    export TEST_CMD="qemu-system-x86_64 -kernel xen/xen -initrd xtf/tests/selftest/test-${XTF_ARCH}-selftest \
> +                                        -append \"loglvl=all console=com1 noreboot console_timestamps=boot dom0=verbose ${XEN_EXTRA_CMD}\" \
> +                                        -m 512 -nographic -monitor none -serial stdio"
> +    export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
> +    export PASSED="Test result: SUCCESS"
> +    export TEST_TIMEOUT=120
> +    ./automation/scripts/console.exp | sed 's/\r\+$//'
> +
> +  always:
> +    serial_artifacts:
> +      path: serial-*.txt
> +      type: text/plain
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 9a5919585d43..35ab6749241c 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Resizable BARs is supported for PVH dom0.
>     - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
>       capability usage is not yet supported on PVH dom0).
> +   - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>  
>  ### Removed
>  
> -- 
> 2.48.1
> 
--8323329-229660605-1742595282=:2325679--

