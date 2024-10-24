Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209B9AF5A8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 01:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825569.1239833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t46s7-0004hA-8i; Thu, 24 Oct 2024 23:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825569.1239833; Thu, 24 Oct 2024 23:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t46s7-0004fY-55; Thu, 24 Oct 2024 23:04:03 +0000
Received: by outflank-mailman (input) for mailman id 825569;
 Thu, 24 Oct 2024 23:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9Wq=RU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t46s6-0004fS-Bc
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 23:04:02 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40f568d4-925c-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 01:04:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 529CAA42A8E;
 Thu, 24 Oct 2024 23:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD184C4CEC7;
 Thu, 24 Oct 2024 23:03:57 +0000 (UTC)
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
X-Inumbo-ID: 40f568d4-925c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729811038;
	bh=69xkGBy86Y1KNVknzhmmc/TThQsTDEvn9KVscxFXZ68=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sRx4bDrg6jXwEz4tp+mbUcWp0HWjXpAZ9dwQ6A1+9c23tPlAUEFDfjLbnxyQx8yNv
	 AxdOFhGd1e+YNnqGs1xykggHd1qCBQe7wXyvvlw0ewvrmVjw0bpSf5cT4hNR548S8J
	 MIfKmeQ34ibpbLQTgsUtZV/DxCmCpbPtjibPeHTrhBqYSh9u+WL3Sxe0a/9s46AP2Q
	 7i6rRNEdIaba4O8JTW2xYmk8yTzIVbzBzcVA7+/AoDcmrYRV1JLUi/qvc1WVgn9aK4
	 jlNOeTizk1hR5lRT9AMvNrBZydvsDwz7J8mWaesAub8inGTFUvmA4U8AbLkiS/Zhrp
	 D5vN/sdMHXnsQ==
Date: Thu, 24 Oct 2024 16:03:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Javi Merino <javi.merino@cloud.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 3/6] CI: Refresh the Debian 12 arm64 container
In-Reply-To: <50c1ec986787c8fe3bf975b0003069b67e885032.1729760501.git.javi.merino@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2410241601480.3833@ubuntu-linux-20-04-desktop>
References: <cover.1729760501.git.javi.merino@cloud.com> <50c1ec986787c8fe3bf975b0003069b67e885032.1729760501.git.javi.merino@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Oct 2024, Javi Merino wrote:
> Rework the container to use heredocs for readability and use apt-get
> --no-install-recommends to keep the size down.  Rename the job to
> debian-12-arm64-* to follow the naming scheme of all the other CI jobs.
> 
> This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.

Hi Javi, I am a bit confused by the new list of packages. I diff'ed the
old list with the new list, and I appended the difference below. Maybe I
ask how did you manage to make the new list? As an example, are bcc and
bin86 necessary?

 acpica-tools
+bcc
+bin86
 bison
 build-essential
 busybox-static
-ca-certificates
 checkpolicy
+clang
 cpio
 curl
 device-tree-compiler
 expect
-file
 flex
-git-core
-golang-go
-libbz2-dev
-libext2fs-dev
+git
+libaio-dev
 libfdt-dev
+libfindlib-ocaml-dev
 libglib2.0-dev
 liblzma-dev
-liblzo2-dev
+libncurses5-dev
+libnl-3-dev
 libpixman-1-dev
 libyajl-dev
-libzstd-dev
-ocaml-findlib
+markdown
+nasm
 ocaml-nox
+pandoc
 pkg-config
 python3-dev
 python3-setuptools
+transfig
 u-boot-qemu
 u-boot-tools
 uuid-dev
 wget
+zlib1g-dev

