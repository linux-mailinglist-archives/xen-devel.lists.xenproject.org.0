Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6BB24D0B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 17:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080043.1440679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umDDs-0001Si-DM; Wed, 13 Aug 2025 15:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080043.1440679; Wed, 13 Aug 2025 15:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umDDs-0001Q7-AA; Wed, 13 Aug 2025 15:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1080043;
 Wed, 13 Aug 2025 15:17:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1umDDq-0001Pv-CR
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 15:17:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umDDp-003PZp-0y;
 Wed, 13 Aug 2025 15:17:01 +0000
Received: from [2a01:cb15:80df:da00:7360:a082:15b4:b94d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umDDo-002Xxi-2z;
 Wed, 13 Aug 2025 15:17:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=5CGFoFkA0da/z0blA5erXGxEsnjl6kQegdpa2LiIwvU=; b=0folAU/1q3OTwntCPIShxjfP88
	kLt7YAZ0Qwv0gvst78dK9BsCy3B68CeCUYUBXRMMs1QEGnEag0d5l26vTseb6jR6ePONRzvOcEnvb
	9MxGxGYNQvTIYMvITZjLVTYwr1a4751p9kRoDAPZXitP/a5KJp4L9WsvJ74D2d501Cac=;
Date: Wed, 13 Aug 2025 17:16:58 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH 2/5] CI: Update ppc64 to use Debian Trixie
Message-ID: <aJysartA4Sh6bdTE@l14>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809221206.1260861-3-andrew.cooper3@citrix.com>

On Sat, Aug 09, 2025 at 11:12:03PM +0100, Andrew Cooper wrote:
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index ab5211f77e5e..3fe539dc5683 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -319,10 +319,10 @@ debian-12-x86_64-clang-debug:
>    variables:
>      CONTAINER: debian:12-x86_64
>  
> -debian-12-ppc64le-gcc-debug:
> +debian-13-ppc64le-gcc-debug:
>    extends: .gcc-ppc64le-cross-build-debug
>    variables:
> -    CONTAINER: debian:12-ppc64le
> +    CONTAINER: debian:13-ppc64le
>      KBUILD_DEFCONFIG: ppc64_defconfig
>      HYPERVISOR_ONLY: y
>      EXTRA_XEN_CONFIG: |
> @@ -705,6 +705,20 @@ debian-12-ppc64le-gcc:
>      KBUILD_DEFCONFIG: ppc64_defconfig
>      HYPERVISOR_ONLY: y
>  
> +debian-12-ppc64le-gcc-debug:
> +  extends: .gcc-ppc64le-cross-build-debug
> +  variables:
> +    CONTAINER: debian:12-ppc64le
> +    KBUILD_DEFCONFIG: ppc64_defconfig
> +    HYPERVISOR_ONLY: y
> +

Why did you remove the EXTRA_XEN_CONFIG from this job? Currently, the
job is setup as:

    debian-12-ppc64le-gcc-debug:
      extends: .gcc-ppc64le-cross-build-debug
      variables:
        CONTAINER: debian:12-ppc64le
        KBUILD_DEFCONFIG: ppc64_defconfig
        HYPERVISOR_ONLY: y
        EXTRA_XEN_CONFIG: |
          CONFIG_UBSAN=y
          CONFIG_UBSAN_FATAL=y

Thanks,

-- 
Anthony PERARD

