Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60FB64F66E
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 01:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465118.723714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6LHh-0000aI-Nz; Sat, 17 Dec 2022 00:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465118.723714; Sat, 17 Dec 2022 00:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6LHh-0000Xk-LJ; Sat, 17 Dec 2022 00:42:37 +0000
Received: by outflank-mailman (input) for mailman id 465118;
 Sat, 17 Dec 2022 00:42:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/B0D=4P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p6LHg-0000Xa-AM
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 00:42:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f64ca7-7da3-11ed-91b6-6bf2151ebd3b;
 Sat, 17 Dec 2022 01:42:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35F56622DC;
 Sat, 17 Dec 2022 00:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B5BC433EF;
 Sat, 17 Dec 2022 00:42:31 +0000 (UTC)
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
X-Inumbo-ID: b1f64ca7-7da3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671237752;
	bh=txrVQmYOSs/Ctu0dZVPjN+hTTiJ/oAoHeSr02ZL1RGU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=piirMocI9h1m/NLCwit896tz73e/Hjlzukxbu7ESTBRcsSSSqcemoJwFSJW0EDorD
	 cdDUcs+PoaWX//Og/e7uez0lEJ+mYv1+B3E2nJDSLoL8FTprF9u0PnGrVztokQMjDN
	 JRAa7099TbYf+yQv8GFrtDqZQqFXCzTu5ui68QKyBVg32Bdirg0yQpUEZERhdEX1wM
	 MjTVgIsezH3n14DG8WfvIi1D2PxiZnXXae2xinNA28Ajwyer0n/SzfeTgmJS/s7oXw
	 SWKNml7jr3DKbCHLkqLN3YfgGz8+THiIy8RmWBb85SN78ZBsaf2lyQzdTnbZVAtAoA
	 2XGdabuCjYYjQ==
Date: Fri, 16 Dec 2022 16:42:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] automation: Add test jobs to run XTF hypercall
 xen_version test
In-Reply-To: <20221216133012.19927-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212161642240.315094@ubuntu-linux-20-04-desktop>
References: <20221216133012.19927-1-michal.orzel@amd.com> <20221216133012.19927-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Michal Orzel wrote:
> Add test jobs in both debug and non-debug versions to run hyp-xen-version
> XTF test as a dom0less domU on arm64. The purpose of this test is to
> validate the functional behavior of xen_version hypercall.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - as we are going to run XTF in pure dom0less configuration, specify only
>    the need for Xen and Qemu
> ---
>  automation/gitlab-ci/test.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 2d57f4feb74a..afd80adfe17c 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -165,6 +165,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-boot-cpupools
>  
> +qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - alpine-3.12-gcc-arm64
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +
> +qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +
>  qemu-smoke-dom0-arm32-gcc:
>    extends: .qemu-arm32
>    script:
> -- 
> 2.25.1
> 

