Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5405E6F50
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 00:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410481.653499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUIW-0008Mb-R9; Thu, 22 Sep 2022 22:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410481.653499; Thu, 22 Sep 2022 22:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUIW-0008J9-Mp; Thu, 22 Sep 2022 22:03:56 +0000
Received: by outflank-mailman (input) for mailman id 410481;
 Thu, 22 Sep 2022 22:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obUIU-0008J3-Vn
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 22:03:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7262a24c-3ac2-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 00:03:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFFA7B837BC;
 Thu, 22 Sep 2022 22:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E080DC433C1;
 Thu, 22 Sep 2022 22:03:50 +0000 (UTC)
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
X-Inumbo-ID: 7262a24c-3ac2-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663884231;
	bh=jp1er+xOHNqKQ40+sgixSqwla1WuL0oJ4UZWRqZp80E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pP36H8jeD7hSDDieybUXA0df90FuvrSv455kjAeRIYWCKKw1J6q/VOV747D+aA7vg
	 xUM6rvlbA0r63JkGAKXm+3zAtZ2a0ofIP4iUwwAQg86nEsRX/6pu8SbBBnuMJG0u4J
	 0TCi+d4G2CBsxiYsJ3s+H+rbSX5jWaLvf+xlPLvLQkwq+iY9wRZ576N9MWL/sCmcrL
	 K8GOHhY5X3i03wE90AMBgmjx/ppofHHc0ZEcskNxxIypPtHgqDbFUcUVWCyJwz/B/B
	 tn3/HyGbHzdl9XISUPVrKhLILDdlzSdG5JvMtVclLWYdUONTpF/Lzc5vf5im0Tti8c
	 DcP5vtVVLYLTQ==
Date: Thu, 22 Sep 2022 15:03:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/9] automation: Add Arm containers to containerize
 script
In-Reply-To: <20220922134058.1410-5-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221503410.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-5-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> Script automation/scripts/containerize makes it easy to build Xen within
> predefined containers from gitlab container registry. However, it is
> currently not possible to use it with Arm containers because they are not
> listed in the script. Populate the necessary entries.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/containerize | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index 9d4beca4fa4b..0f4645c4cccb 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -25,6 +25,7 @@ die() {
>  BASE="registry.gitlab.com/xen-project/xen"
>  case "_${CONTAINER}" in
>      _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
> +    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
>      _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
>      _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
>      _centos7) CONTAINER="${BASE}/centos:7" ;;
> @@ -35,6 +36,8 @@ case "_${CONTAINER}" in
>      _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
>      _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
>      _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
> +    _unstable-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm32-gcc" ;;
> +    _unstable-arm64v8) CONTAINER="${BASE}/debian:unstable-arm64v8" ;;
>      _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
>      _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
>      _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
> -- 
> 2.25.1
> 

