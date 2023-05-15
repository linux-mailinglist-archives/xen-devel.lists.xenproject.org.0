Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A650D704143
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 01:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534880.832327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyhCY-00048d-Qc; Mon, 15 May 2023 23:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534880.832327; Mon, 15 May 2023 23:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyhCY-00046d-Nn; Mon, 15 May 2023 23:01:58 +0000
Received: by outflank-mailman (input) for mailman id 534880;
 Mon, 15 May 2023 23:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyhCX-00046V-Dp
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 23:01:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c11c070-f374-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 01:01:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA01F62379;
 Mon, 15 May 2023 23:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F811C433EF;
 Mon, 15 May 2023 23:01:52 +0000 (UTC)
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
X-Inumbo-ID: 7c11c070-f374-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684191713;
	bh=7TItLIrWdztTahWmoph0tQ34Qa9LgDLdmD00FD2ViGs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XQCiWQQqw8De6Ed3H10al8UcfysybMEzABBJpGRmwaA3OKGedn3hVdDfIKUFd/e9t
	 3mJ2dbS2nETzWzShfqj6wih7OJPwm0lTB2dyKO9ob3+8TvsVr4k0o634QRI/83XUh9
	 ZQX4Kf27lVUI5pfIyUjEu7iBUwYHH6vaztBV4h4kXFjqXKZbXY9CmYS+vNQLYELBt2
	 YT4ifNxioIhbhhwr/1YqrghrbCRGVoDeWsAMGhOS1XPlCq8cv10V9CDZBg/bVAGY3f
	 bPhTj4g/0FkDn3JG885uShFip+q5sOu69EJjsFVKF+MjyTeKE0FcAJxuxE43T/OPj9
	 LiEqp/X/id+ug==
Date: Mon, 15 May 2023 16:01:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: provide diffutils and ghostscript in
 opensuse images
In-Reply-To: <20230502054218.15303-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305151533140.4125828@ubuntu-linux-20-04-desktop>
References: <20230502054218.15303-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 May 2023, Olaf Hering wrote:
> The diffutils package is a hard requirement for building xen.
> It was dropped from the Tumbleweed base image in the past 12 months.
> 
> Building with --enable-docs does now require the gs tool.
> 
> Add both packages to the suse dockerfiles.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/suse/opensuse-leap.dockerfile       | 2 ++
>  automation/build/suse/opensuse-tumbleweed.dockerfile | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
> index bac9385412..c7973dd6ab 100644
> --- a/automation/build/suse/opensuse-leap.dockerfile
> +++ b/automation/build/suse/opensuse-leap.dockerfile
> @@ -18,11 +18,13 @@ RUN zypper install -y --no-recommends \
>          clang \
>          cmake \
>          dev86 \
> +        diffutils \
>          discount \
>          flex \
>          gcc \
>          gcc-c++ \
>          git \
> +        ghostscript \
>          glib2-devel \
>          glibc-devel \
>          # glibc-devel-32bit for Xen < 4.15
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index 3e5771fccd..7e5f22acef 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -18,11 +18,13 @@ RUN zypper install -y --no-recommends \
>          clang \
>          cmake \
>          dev86 \
> +        diffutils \
>          discount \
>          flex \
>          gcc \
>          gcc-c++ \
>          git \
> +        ghostscript \
>          glib2-devel \
>          glibc-devel \
>          # glibc-devel-32bit for Xen < 4.15
> 

