Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C492A38FD27
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 10:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132107.246543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llSkI-0001o6-9W; Tue, 25 May 2021 08:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132107.246543; Tue, 25 May 2021 08:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llSkI-0001ld-6I; Tue, 25 May 2021 08:49:02 +0000
Received: by outflank-mailman (input) for mailman id 132107;
 Tue, 25 May 2021 08:49:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llSkG-0001lX-SP
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 08:49:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 532b9c9a-cfb9-4ca5-82bc-23556e280172;
 Tue, 25 May 2021 08:49:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6247DAEA8;
 Tue, 25 May 2021 08:48:59 +0000 (UTC)
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
X-Inumbo-ID: 532b9c9a-cfb9-4ca5-82bc-23556e280172
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621932539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMDhAc0r2bOfyLmnNhMnj8wp/38X8vrpzZWKMua1bAw=;
	b=GeSknq+g4TzaoWu4b0jvgZ+RVcm2jn0IrqbOKkSVP8QYgGH8JQoyawE5hlJKA6yRVQhumR
	lG3osOfgsVsqmntgypxou5QGH8ggZEObrBkcJSU2DQC9oDIXbZFy0YjhsMsQww7kkDQSQA
	nAvQPGs/H8GyfnMrMR5xbTvbasMhmkI=
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com>
Date: Tue, 25 May 2021 10:48:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.05.2021 16:34, Connor Davis wrote:
> Add arch-specific makefiles and configs needed to build for
> riscv. Also add a minimal head.S that is a simple infinite loop.
> head.o can be built with
> 
> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
> 
> No other TARGET is supported at the moment.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  config/riscv.mk                         |  4 +++
>  xen/Makefile                            |  8 +++--
>  xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>  xen/arch/riscv/Kconfig.debug            |  0
>  xen/arch/riscv/Makefile                 |  0
>  xen/arch/riscv/Rules.mk                 |  0
>  xen/arch/riscv/arch.mk                  | 14 ++++++++
>  xen/arch/riscv/asm-offsets.c            |  0
>  xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>  xen/arch/riscv/head.S                   |  6 ++++
>  xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>  11 files changed, 137 insertions(+), 2 deletions(-)
>  create mode 100644 config/riscv.mk
>  create mode 100644 xen/arch/riscv/Kconfig
>  create mode 100644 xen/arch/riscv/Kconfig.debug
>  create mode 100644 xen/arch/riscv/Makefile
>  create mode 100644 xen/arch/riscv/Rules.mk
>  create mode 100644 xen/arch/riscv/arch.mk
>  create mode 100644 xen/arch/riscv/asm-offsets.c
>  create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>  create mode 100644 xen/arch/riscv/head.S
>  create mode 100644 xen/include/asm-riscv/config.h

I think this wants to be accompanied by an addition to ./MAINTAINERS
right away, such that future RISC-V patches can be acked by the
respective designated maintainers, rather than falling under "THE REST".
Question is whether you / we have settled yet who's to become arch
maintainer there.

Jan

