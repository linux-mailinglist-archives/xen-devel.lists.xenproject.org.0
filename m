Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2965CB41
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470812.730442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsIo-0002dM-1B; Wed, 04 Jan 2023 01:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470812.730442; Wed, 04 Jan 2023 01:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsIn-0002a5-Tt; Wed, 04 Jan 2023 01:10:45 +0000
Received: by outflank-mailman (input) for mailman id 470812;
 Wed, 04 Jan 2023 01:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCsIm-0002Ze-KY
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:10:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c77776d-8bcc-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 02:10:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1CFA4B810A5;
 Wed,  4 Jan 2023 01:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4D6C433EF;
 Wed,  4 Jan 2023 01:10:40 +0000 (UTC)
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
X-Inumbo-ID: 9c77776d-8bcc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672794641;
	bh=GDcvH45biK4FMGW3wYmyxksscV4VpSyTbRTo0Z0xoQA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HPSfISB5bqRcObrshfvAhQQJ7L8WUNPmN9FAgm5AXd1J0bW/8B0NEXM3iZgGsbKIJ
	 98r3rcHwzqZVe3gy6+hcSnZpFybisbvCUp2LDwID3sY8mAknXpf555maiIAv7zJ9gJ
	 UP7ZnF5qxmP12xDyY8hSioE3Vl0ZKU0A0MaWcxuxcicCCuUEdMWSd2mEus4WzjEWMs
	 UARo1Oyc9E0qUDqxzVCEt2iGcZBGdbPV9tLVpomcTsfEE43jo00Qcs9lKn4rZTYxDn
	 35Z2EsyfgpvLGRw7snf4QGRBeXUsKBOnG0+VKYx0RUGfiEDiDZFmLReRgBx/ax2aDz
	 rBGyRA2zBqiSQ==
Date: Tue, 3 Jan 2023 17:10:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
In-Reply-To: <20221230003848.3241-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031709570.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Dec 2022, Andrew Cooper wrote:
> Preserve the artefacts based on the `make` rune we actually ran, rather than
> guesswork about which rune we would have run based on other settings.
> 
> Note that the ARM qemu smoke tests depend on finding binaries/xen even from
> full builds.  Also that the Jessie-32 containers build tools but not Xen.
> 
> This means the x86_32 builds now store relevant artefacts.  No change in other
> configurations.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/scripts/build | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 5dafa72ba540..8dee1cbbc251 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -70,18 +70,24 @@ if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
>      cfgargs+=("--with-system-seabios=/bin/false")
>  fi
>  
> +# Directory for the artefacts to be dumped into
> +mkdir binaries
> +
>  if [[ "${hypervisor_only}" == "y" ]]; then
> +    # Xen-only build
>      make -j$(nproc) xen
> +
> +    # Preserve artefacts
> +    cp xen/xen binaries/xen
>  else
> +    # Full build
>      ./configure "${cfgargs[@]}"
>      make -j$(nproc) dist
> -fi
>  
> -# Extract artifacts to avoid getting rewritten by customised builds
> -mkdir binaries
> -if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
> -    cp xen/xen binaries/xen
> -    if [[ "${hypervisor_only}" != "y" ]]; then
> -        cp -r dist binaries/
> -    fi
> +    # Preserve artefacts
> +    # Note: Some smoke tests depending on finding binaries/xen on a full build
> +    # even though dist/ contains everything, while some containers don't even
> +    # build Xen
> +    cp -r dist binaries/
> +    if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi

why the "if" ?

You could just:

cp xen/xen binaries/xen

unconditionally?

If you are OK with this change you can do it on commit

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

