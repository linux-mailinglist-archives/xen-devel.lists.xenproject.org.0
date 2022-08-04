Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BE2589915
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 10:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380245.614320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJVyZ-0003Lp-HZ; Thu, 04 Aug 2022 08:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380245.614320; Thu, 04 Aug 2022 08:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJVyZ-0003JT-Eg; Thu, 04 Aug 2022 08:13:03 +0000
Received: by outflank-mailman (input) for mailman id 380245;
 Thu, 04 Aug 2022 08:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XeTE=YI=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oJVyX-0003JM-Pk
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 08:13:01 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa73b8e-13cd-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 10:12:59 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id z19so18681104plb.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Aug 2022 01:12:58 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (173.242.113.38.16clouds.com.
 [173.242.113.38]) by smtp.gmail.com with ESMTPSA id
 201-20020a6216d2000000b0052e0bc3ca3asm238352pfw.173.2022.08.04.01.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 01:12:56 -0700 (PDT)
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
X-Inumbo-ID: 3fa73b8e-13cd-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=xX5TwaV3noS6IzNcTaKe+LRxxbvbWWvIr9oaG42dUT4=;
        b=syZx/8nIBPDBnrI82dL9qLgr07eUABN8aMpx6YNedPbSnq0S1EYKGX8FhNCmDYkZ7a
         0SB3wBZdTzIHJYcX0eLxuof5Clh6mskffT28y5nUzJZoYjrW2wrDBLVUZLzOMSEAHx8b
         jfiDWGIo+jONA+RHDm57W2xiIYQ9imOIN9uWv7cGMuBAWlMrA+iBlo8Mk+2BBVCqJ7aK
         mAwNUGwhvcysVRBIeqd5kCZuedvwhISlO+7TyheFkl58zojGIcGRfvZtkoggi1scVAT3
         tP7MqG0JJ7Hkh7Ga6S3y8oPIJUlyUEgLs9wptSBQ5IxI9EDRQ7I0Uvq+RVYCmGwUK+Fp
         t4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=xX5TwaV3noS6IzNcTaKe+LRxxbvbWWvIr9oaG42dUT4=;
        b=GsH/UpdLhaJFz3se+d+/7sk/R1le563kepNUKwotknKQGZ3S14w39M2ajn/ObENdvD
         +nQZq6EEM7KGt4majZoA0byT6zF2eK9/d5VmLzVFEtNBf6C5R4lfCI7RmYWXw73xlnLV
         SC/B9I/O+sxqWbTxg7oh+aHbQhdr8VYsTN4LPRO6BoF9SSO2QY/yFD9qRmQiZaq/uPql
         BGGDm036dHtgLi/qAvIZLYzkURqxtTweQQBk+XludCMUqVeFK3PQyHMRBB/zauZG4lPw
         RlTG5TWdMy/LcyGpYGqrDAteNJf+fnj5Re56qgDaGKARYWZBZETnaOb+t0T0onkK+UVT
         /Gew==
X-Gm-Message-State: ACgBeo3nf3oScQG0z/aKCYAO2wp7+pmcgU7d/dmPKQycHUG1Tn5ADQnb
	4Y7F2UWO7/zFDPQRa6zaA/F865waJTNYdKRS6ow=
X-Google-Smtp-Source: AA6agR61AMJVJFWIjoavp+tTDOa1HAoPpYVYi8knOPucfV8m/Jw7rLUZzJ9iNkpSBx9IPYGjAoT8Fw==
X-Received: by 2002:a17:90b:4c12:b0:1f5:958:c313 with SMTP id na18-20020a17090b4c1200b001f50958c313mr9380394pjb.6.1659600776775;
        Thu, 04 Aug 2022 01:12:56 -0700 (PDT)
Date: Thu, 4 Aug 2022 16:12:53 +0800
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Message-ID: <20220804081253.GA1219098@leoy-ThinkPad-X240s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi there,

Now I am working on Ampere Altra SoC platform, with Xen (4.16) and Linux
kernel (5.15.23).

I observed a warning is reported by Linux kernel in the booting flow:

[    0.403737] ------------[ cut here ]------------
[    0.403738] WARNING: CPU: 30 PID: 0 at drivers/irqchip/irq-gic-v3-its.c:3074 its_cpu_init+0x814/0xae0
[    0.403745] Modules linked in:
[    0.403748] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W         5.15.23-ampere-lts-standard #1
[    0.403752] pstate: 600001c5 (nZCv dAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.403755] pc : its_cpu_init+0x814/0xae0
[    0.403758] lr : its_cpu_init+0x810/0xae0
[    0.403761] sp : ffff800009c03ce0
[    0.403762] x29: ffff800009c03ce0 x28: 000000000000001e x27: ffff880711f43000
[    0.403767] x26: ffff80000a3c0070 x25: fffffc1ffe0a4400 x24: ffff80000a3c0000
[    0.403770] x23: ffff8000095bc998 x22: ffff8000090a6000 x21: ffff800009850cb0
[    0.403774] x20: ffff800009701a10 x19: ffff800009701000 x18: ffffffffffffffff
[    0.403777] x17: 3030303035303031 x16: 3030313030303078 x15: 303a30206e6f6967
[    0.403780] x14: 6572206530312072 x13: 3030303030353030 x12: 3130303130303030
[    0.403784] x11: 78303a30206e6f69 x10: 6765722065303120 x9 : ffff80000870e710
[    0.403788] x8 : 6964657220646e75 x7 : 0000000000000003 x6 : 0000000000000000
[    0.403791] x5 : 0000000000000000 x4 : fffffc0000000000 x3 : 0000000000000010
[    0.403794] x2 : 000000000000ffff x1 : 0000000000010000 x0 : 00000000ffffffed
[    0.403798] Call trace:
[    0.403799]  its_cpu_init+0x814/0xae0
[    0.403802]  gic_starting_cpu+0x48/0x90
[    0.403805]  cpuhp_invoke_callback+0x16c/0x5b0
[    0.403808]  cpuhp_invoke_callback_range+0x78/0xf0
[    0.403811]  notify_cpu_starting+0xbc/0xdc
[    0.403814]  secondary_start_kernel+0xe0/0x170
[    0.403817]  __secondary_switched+0x94/0x98
[    0.403821] ---[ end trace f68728a0d3053b70 ]---

Looked into the code, the GICv3 driver tries to create persistent
reservations for pending pages, and the persistent reservation table
can be used by kexec/kdump.  For the persistent reservations, it
relies on MEMRESERVE EFI configuration table, but this table is not
supported by xen.efi, I think this is the reason for the above oops.

I checked that if I boot a host Linux (without Xen), then the EFI has
provided MEMRESERVE configuration table, I can get below log:

  #  dmesg | grep MEMRESERVE
  [    0.000000] efi: TPMFinalLog=0x807f9ef0000 ACPI 2.0=0x807fa0d0018 ... MEMRESERVE=0x807f8141e98

Just want to confirm, is anyone working on enabling MEMRESERVE EFI
configuration table for Xen?  And welcome any comments and
suggestions!

Thanks,
Leo

