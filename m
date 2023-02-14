Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B8695563
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 01:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494900.765075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRjFG-0008Mf-IP; Tue, 14 Feb 2023 00:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494900.765075; Tue, 14 Feb 2023 00:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRjFG-0008Jm-FV; Tue, 14 Feb 2023 00:32:30 +0000
Received: by outflank-mailman (input) for mailman id 494900;
 Tue, 14 Feb 2023 00:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pRjFE-0008Jd-LD
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 00:32:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d7fd0fa-abff-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 01:32:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E3C861321;
 Tue, 14 Feb 2023 00:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FA4C4339C;
 Tue, 14 Feb 2023 00:32:23 +0000 (UTC)
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
X-Inumbo-ID: 0d7fd0fa-abff-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676334744;
	bh=CmzQ3ydrXF7DAdGULECQXOz0eLrdJLfR7PmGzb35Uzo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B1o8lFwspR/5DbcILwtsqMXDkQcoWscbl1EBvsPG0Wx+3seaR5lHuv0YIwjd0THKx
	 6GR+g7WFWxAcUt3wqbnGIWHrw8HWeunjCPk3H4I2h7lBa02TnK9aoshyMPEKBvIERL
	 1VE15qpLq/plhTtwgoJtDtM3hGvujDuI/PgxSS2UEL0uiwz4+BOxqoi47BJgSBYn5r
	 ENdz3AaVota3zhIWHi6cdAoStRwu1OE6/Ka/1rj+1X7tXlPvUCvN4efFEAml1yMM5/
	 6AcLg6yC6b30abPGK1HBS0CSmkPjUmVyH5xasSgDPIU/XuDnjJcHKzInhwKYOgHk7H
	 viEYgvxhR6jSw==
Date: Mon, 13 Feb 2023 16:32:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] automation: Add a gzip compressed kernel image test
 on arm32
In-Reply-To: <20230213142210.11728-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302131545040.4661@ubuntu-linux-20-04-desktop>
References: <20230213142210.11728-1-michal.orzel@amd.com> <20230213142210.11728-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Feb 2023, Michal Orzel wrote:
> Xen supports booting gzip compressed kernels, therefore add a new test
> job qemu-smoke-dom0less-arm32-gcc-gzip in debug and non-debug variant
> that will execute qemu-smoke-dom0less-arm32.sh script to test booting
> a domU with a gzip compressed kernel image (in our case zImage).
> 
> By passing "gzip" as a test variant, the test will call gzip command
> to compress kernel image and use it in ImageBuilder configuration.
> No need for a specific check to be executed from domU. Being able to
> see a test message from a boot log is sufficient to mark a test as
> passed.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml                  | 16 ++++++++++++++++
>  automation/scripts/qemu-smoke-dom0less-arm32.sh | 13 +++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index c2bcc5d4d3e5..be7a55d89708 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -242,6 +242,22 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug-staticmem
>  
> +qemu-smoke-dom0less-arm32-gcc-gzip:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32
> +
> +qemu-smoke-dom0less-arm32-gcc-debug-gzip:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32-debug
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .qemu-x86-64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index f89ee8b6464a..b420ee444f2a 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -30,6 +30,15 @@ fi
>  "
>  fi
>  
> +if [[ "${test_variant}" == "gzip" ]]; then
> +    # Compress kernel image with gzip
> +    gzip vmlinuz
> +    passed="${test_variant} test passed"
> +    domU_check="
> +echo \"${passed}\"
> +"
> +fi
> +
>  # domU rootfs
>  mkdir rootfs
>  cd rootfs
> @@ -79,6 +88,10 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>      echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> config
>  fi
>  
> +if [[ "${test_variant}" == "gzip" ]]; then
> +    sed -i "s/vmlinuz/vmlinuz.gz/g" config
> +fi
> +
>  rm -rf imagebuilder
>  git clone https://gitlab.com/ViryaOS/imagebuilder
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> -- 
> 2.25.1
> 

