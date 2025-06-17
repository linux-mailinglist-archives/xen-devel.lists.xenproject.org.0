Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0DDADDB06
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 19:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018446.1395349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaaz-0002ES-Sv; Tue, 17 Jun 2025 17:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018446.1395349; Tue, 17 Jun 2025 17:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaaz-0002Ch-OT; Tue, 17 Jun 2025 17:59:41 +0000
Received: by outflank-mailman (input) for mailman id 1018446;
 Tue, 17 Jun 2025 17:59:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRaay-00029n-Rj
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 17:59:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67074ba-4ba4-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 19:59:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D96ABA51830;
 Tue, 17 Jun 2025 17:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AF2C4CEE7;
 Tue, 17 Jun 2025 17:59:37 +0000 (UTC)
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
X-Inumbo-ID: d67074ba-4ba4-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750183178;
	bh=FGszfJXbk0E0WGlrlFXbMX9YMoQiKINJaDgfBZRZyHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aF8yRil56F0r3zxynKcCp9yj1S6vEvOFoRWfe7KyecD5I6CccokV/W80POpqQYUYU
	 0WTausQ67P189R3p2fVAEx+ABk2eoA8y1Ghu75b7nO76DRIOKrDk9/dXnyYsFWyrCH
	 tSk7gVKF1ziqtf/iLHtyzjvV8Q78LjBsmOyq3h55o54MsIOYnx0W+8R2AeuM8xon3J
	 uIto5qz9l99IVtME/nuTVM0kpj+ARXRd6FcFlbZmOykDO52Jg0ZY6bofqB6Pf8NWHL
	 MDbJ2PAcVlAqveZtf7JZlVvh6XdSCikVOt5MDbbSAeX3bJ+TlYiUs8VquSZPY8iKql
	 6o5S37ZTOYmnQ==
Date: Tue, 17 Jun 2025 10:59:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: disable terminal echo in xilinx test
 scripts
In-Reply-To: <20250617164449.3925765-1-victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506171059310.1384757@ubuntu-linux-20-04-desktop>
References: <20250617164449.3925765-1-victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> The default terminal settings in Linux will enable echo which interferes with
> these tests. Set the value in the script to avoid failure caused by a settings
> reset.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 2 +-
>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 71cdb295b2..6970a8658d 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -165,7 +165,7 @@ sleep 5
>  sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
>  sleep 5
>  set +e
> -stty -F ${SERIAL_DEV} 57600
> +stty -F ${SERIAL_DEV} 57600 -echo
> 
>  # Capture test result and power off board before exiting.
>  export PASSED="${PASS_MSG}"
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> index 293232eebf..1d7162f1b3 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -128,7 +128,7 @@ cd $START
>  # connect to serial
>  SERIAL_DEV="/dev/serial/zynq"
>  set +e
> -stty -F ${SERIAL_DEV} 115200
> +stty -F ${SERIAL_DEV} 115200 -echo
> 
>  # Capture test result and power off board before exiting.
>  export PASSED="${passed}"
> --
> 2.34.1
> 

