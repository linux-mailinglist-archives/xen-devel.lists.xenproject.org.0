Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704DF5B2A76
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 01:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403723.645924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWR34-00071U-An; Thu, 08 Sep 2022 23:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403723.645924; Thu, 08 Sep 2022 23:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWR34-0006yV-80; Thu, 08 Sep 2022 23:35:06 +0000
Received: by outflank-mailman (input) for mailman id 403723;
 Thu, 08 Sep 2022 23:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWR32-0006yP-S4
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 23:35:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd10429a-2fce-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 01:35:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C30EB822C8;
 Thu,  8 Sep 2022 23:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FEFC433C1;
 Thu,  8 Sep 2022 23:35:00 +0000 (UTC)
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
X-Inumbo-ID: dd10429a-2fce-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662680101;
	bh=e+eQtgHjxpTmdLL7dpEky523hZqj2sLSlk9F73e5Agg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lupDRy8cERSlE1kgRyi0pRV+FCafk2TI9st7Gv6CGCpIgA91sbk+sJJ6YZFR5nLW5
	 Fa7a8TJqCaoQu5SzD8cekvqOqmqZO3dVN9yAP315wndbWwNVYWiukvJj/wpoDjsieb
	 QwXh8MI/AmZ0fS07H5VhD/+Fr4TzKBLMTiJSEKIqC0+PL2c0a2Uhixg41A9hjCDhL2
	 JXZlrFZfBnUI2ItHj675o3vmeJCbNXPAeDGa/lSY/rIk7icqBlt9/9eYLEGPWb4F3Z
	 8PZhtYSK8G4ZjVKhr21l1r5yFJzpI6lXIXXVu0tP469XKnZJbKRFCzLzze3OBngeRk
	 /1V7zeTdEGsHg==
Date: Thu, 8 Sep 2022 16:34:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Henry.Wang@arm.com
Subject: Gitlab breakage: [PATCH] Config.mk: correct PIE-related option(s)
 in EMBEDDED_EXTRA_CFLAGS
In-Reply-To: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209081633430.157835@ubuntu-linux-20-04-desktop>
References: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Jan,

This patch breaks the gitlab-ci pipeline, specifically it breaks the
hvmloader build with clang:


https://gitlab.com/xen-project/xen/-/pipelines/634274727
https://gitlab.com/xen-project/xen/-/jobs/2996114313

make[7]: Entering directory '/builds/xen-project/xen/tools/firmware/hvmloader'
clang   -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-local-typedefs   -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .hvmloader.o.d -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs  -DNDEBUG -Werror -fno-pie -no-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -fcf-protection=none -ffreestanding -msoft-float -nostdinc -I/builds/xen-project/xen/tools/firmware/hvmloader/../../../tools/firmware/include -I/builds/xen-project/xen/tools/firmware/hvmloader/../../../tools/include -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -I../../libacpi  -c -o hvmloader.o hvmloader.c 
clang: error: argument unused during compilation: '-nopie' [-Werror,-Wunused-command-line-argument]

Cheers,

Stefano


On Thu, 25 Aug 2022, Jan Beulich wrote:
> I haven't been able to find evidence of "-nopie" ever having been a
> supported compiler option. The correct spelling is "-no-pie".
> Furthermore like "-pie" this is an option which is solely passed to the
> linker. The compiler only recognizes "-fpie" / "-fPIE" / "-fno-pie", and
> it doesn't infer these options from "-pie" / "-no-pie".
> 
> Add the compiler recognized form, but for the possible case of the
> variable also being used somewhere for linking keep the linker option as
> well (with corrected spelling).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- unstable.orig/Config.mk	2022-04-07 12:23:27.000000000 +0200
> +++ unstable/Config.mk	2022-08-25 08:58:00.044287451 +0200
> @@ -188,7 +188,7 @@ endif
>  APPEND_LDFLAGS += $(foreach i, $(APPEND_LIB), -L$(i))
>  APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
>  
> -EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
> +EMBEDDED_EXTRA_CFLAGS := -fno-pie -no-pie -fno-stack-protector -fno-stack-protector-all
>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
>  
>  XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
> 

