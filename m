Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2535F9457B3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 07:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769949.1181053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZl2P-0006Wk-OL; Fri, 02 Aug 2024 05:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769949.1181053; Fri, 02 Aug 2024 05:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZl2P-0006VJ-Li; Fri, 02 Aug 2024 05:41:13 +0000
Received: by outflank-mailman (input) for mailman id 769949;
 Thu, 01 Aug 2024 19:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jc0v=PA=gmail.com=adobriyan@srs-se1.protection.inumbo.net>)
 id 1sZbIM-0008Aq-72
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 19:17:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a06e5463-503a-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 21:17:00 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7ab5fc975dso671559066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 12:17:00 -0700 (PDT)
Received: from p183 ([46.53.253.212]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecad25sm12474266b.221.2024.08.01.12.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 12:16:58 -0700 (PDT)
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
X-Inumbo-ID: a06e5463-503a-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722539820; x=1723144620; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2lJyLZbucIe5opdiO3kpiQWjoU7HWScAFHcY/FoPqQM=;
        b=WIw7PYVklet8dIh2ULbImhKmZ/dQx3kIq5QC+UgWEbEseyUceXYdUf0pew3A3eWjXW
         KQi8jyu31xB+jOQd1paC9/3pGNZEGstMfiPa1P+Fa53Th/fK5WOp+04hhfhJQc1Kqo0+
         8/pXhuXQy1PXRvmFL2xDPJi7pCec3ma1XoIYgTWsIbfnIBNya0raZUyOSQEXvErMLhbJ
         dlkiSpDRMMQaMcSNnmQbNUum6Cd7gcRzGJKVT79FOiKjjDezifVKZzeP+nMrwiicbyA5
         lEmOFMccJFXfJD/uYFLGLPnuaaEMY9lH+2/DjlQ5RAur2nN/bVNGxmOyKWce8cY0iSY0
         o7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722539820; x=1723144620;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2lJyLZbucIe5opdiO3kpiQWjoU7HWScAFHcY/FoPqQM=;
        b=vy6dsenOJtiX6Vf9Gkb1KOHoC/GuEMO4zk2U4aOr/pbvgVYNo/c0n2WmjRvtfs46Sx
         1IViaMJr5IsTVD+g+VLlc8iRX/usbF68HrvR0Us4x66mpZeRqXOZBmLd6QiN5skDxsS3
         Ho+Y5l9vGHdKkpiYWlUH4PLIR3fi//TZ0/GaGzjdgj201Wy7uRdVc/vJQGoavlsRBjdT
         jCd0bXtitZrcyXoazOiqTaZdc5IxmzU7tNWJjCrfzkeho/dgkyl+FrjePny/mcgXhncL
         QYnUROXZP/3CgXGnmlKRnSeCSKMCCr8BIXxNWzwKvpsXLyvMu0pzQXmNczH5grGby2iq
         dOkQ==
X-Gm-Message-State: AOJu0YzbJz21xguJ4uypsnDArR2u5YfMPPWzCDn+zF+UYmpkSgkBh4g2
	NwEDEHj4Owt5JXoySUAlLRmyvkCUSiUKbOuEQ610/1azuDaTBcY=
X-Google-Smtp-Source: AGHT+IExQa6e27hKb7qI6K5zAXQAkD9NjlnCkP6LIDB8EFr35Vr02bglzhOFdAcC662NfTnh88Mv6g==
X-Received: by 2002:a17:907:7f94:b0:a7a:84f8:eaef with SMTP id a640c23a62f3a-a7dc4e8c3f0mr99005866b.35.1722539819259;
        Thu, 01 Aug 2024 12:16:59 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:16:56 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] xen, pvh: fix unbootable VMs (PVH + KASAN)
Message-ID: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Uninstrument arch/x86/platform/pvh/enlighten.c: KASAN is not setup
_this_ early in the boot process.

Steps to reproduce:

	make allnoconfig
	make sure CONFIG_AMD_MEM_ENCRYPT is disabled
		AMD_MEM_ENCRYPT independently uninstruments lib/string.o
		so PVH boot code calls into uninstrumented memset() and
		memcmp() which can make the bug disappear depending on
		the compiler.
	enable CONFIG_PVH
	enable CONFIG_KASAN
	enable serial console
		this is fun exercise if you never done it from nothing :^)

	make

	qemu-system-x86_64	\
		-enable-kvm	\
		-cpu host	\
		-smp cpus=1	\
		-m 4096		\
		-serial stdio	\
		-kernel vmlinux \
		-append 'console=ttyS0 ignore_loglevel'

Messages on serial console will easily tell OK kernel from unbootable
kernel. In bad case qemu hangs in an infinite loop stroboscoping
"SeaBIOS" message.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/x86/platform/pvh/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/platform/pvh/Makefile b/arch/x86/platform/pvh/Makefile
index 5dec5067c9fb..c43fb7964dc4 100644
--- a/arch/x86/platform/pvh/Makefile
+++ b/arch/x86/platform/pvh/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD_head.o := y
+KASAN_SANITIZE := n
 
 obj-$(CONFIG_PVH) += enlighten.o
 obj-$(CONFIG_PVH) += head.o

