Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DBA79FE1D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 10:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602119.938501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qghWN-0001li-0p; Thu, 14 Sep 2023 08:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602119.938501; Thu, 14 Sep 2023 08:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qghWM-0001iX-TZ; Thu, 14 Sep 2023 08:16:18 +0000
Received: by outflank-mailman (input) for mailman id 602119;
 Thu, 14 Sep 2023 08:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUwO=E6=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qghWL-0001iR-KQ
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 08:16:17 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a70104-52d6-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 10:16:15 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c3887039d4so5486275ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 01:16:15 -0700 (PDT)
Received: from leoy-huanghe.lan ([128.1.74.161])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902b78400b001b8b73da7b1sm933900pls.227.2023.09.14.01.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:16:13 -0700 (PDT)
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
X-Inumbo-ID: f8a70104-52d6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694679373; x=1695284173; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erZc72uNW5LSdWCcey59N0Lei+G74ikjhkTi45NnJ9I=;
        b=r0o3UYcQqYqfwlAuyVSzLuPhsw/Kar9INQ0NkHffLSgb44Dh0wnQWkoJ+g1DcGLV9g
         K70zs23+VImMq/+2qrWPhygglcyVZLPiWhbQq0VWbihd3jhPWm7JPvzrkDVx/gsMMMDQ
         /JJGFgv6254/6Y5LDGC85uGHX98+Ki/MjUwxNk9DW0KP7RS17Um3B25QlA8w7rosHVTn
         LHM9dXPkEa/sK3G6i/B9GlMU1KJOeLGYYh7K9qUrap8zZHlD0aDCnEMwvY4UZiARBlxr
         4i7FHtPIAsZz2nzNUL5nKkBs6SNbJt+3Ug6Acwn9HYlfkJA5mNAt8TmcqDIi3AhAfQns
         XVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679374; x=1695284174;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erZc72uNW5LSdWCcey59N0Lei+G74ikjhkTi45NnJ9I=;
        b=XOf9eZjlm9rbT2kg+sRMcTTc6sNlscLkl2ydXLJZigNz+wy5j6V97SqEkqsH6x0vZc
         vKp3JjTHRx9ghXE5StfE/n5SGHAnHYa5G6ETwhCXKr8930WG/8b8a/LhYVBl/CzdWWZX
         F3tgO8M4TjZRQO7w3/xhAkIWTq7YgcCU5MpXweR9Kfg1DYBMzDXWDEdijg31mWsItTun
         3PXNCiOlPBXbnB3faYbzMFiIiqwfMwOFvEi8Tpynbps0UuNyW9lhQHGOwj3npXn3CmxJ
         +my5oym//JkyONa8M2YHhIoZ6vcFH0WOiRpuMAcQAUsE0MlW8qkUkUwj/5LyOXj6kkFN
         3bAQ==
X-Gm-Message-State: AOJu0YyHYh8vuH/bH6O2AtGyzeAQYxn+jFICXyCdIC6DQaQjJTEmoAys
	5kUQlDuIrU07GLNbqQKyUoUhzGg2Kl+0o14u9Dtc84Dx
X-Google-Smtp-Source: AGHT+IHztyVwM9QaGgqtaVcJfKKKaoA5VqokkMVCUZQBLjoEzgR1u9S3z89i5dvZf//fnQqEl2vJTg==
X-Received: by 2002:a17:903:1cc:b0:1c3:aef9:872e with SMTP id e12-20020a17090301cc00b001c3aef9872emr4519734plh.34.1694679373638;
        Thu, 14 Sep 2023 01:16:13 -0700 (PDT)
Date: Thu, 14 Sep 2023 16:16:07 +0800
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
Subject: RFC: arm64: Handling reserved memory nodes
Message-ID: <20230914081607.GA1400758@leoy-huanghe.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I'd like to discuss for how to handle the reserved memory nodes in DT
binding on Xen / Arm64.  Note, now I am using DTB when boot Xen but
not UEFI/ACPI (ACPI is disabled in this case).

## Failure

I ported Xen on a platform, after the kernel booting, the Xen hypervisor
reports error:

  (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc

This error is caused by kernel using an invalid memory frame number
0x1a02dc, we can convert it to the address:

  0x1a02dc << PAGE_SHIFT = 0x1_a02d_c000

## Reason

Two important things we need to check.  One is what's the DT binding
passed from the bootloader to Xen hypervisor, and the second thing is
what's the DT binding passed from Xen hypervisor to kernel.

We can see the bootloader passes below memory nodes to Xen hypervisor:

  (XEN) RAM: 0000000020000000 - 00000000bfffffff
  (XEN) RAM: 00000001a0000000 - 00000002ffffffff
  (XEN)
  (XEN) MODULE[0]: 0000000020100000 - 0000000020265000 Xen
  (XEN) MODULE[1]: 0000000023000000 - 0000000023024000 Device Tree
  (XEN) MODULE[2]: 0000000024000000 - 0000000028000000 Kernel
  (XEN)  RESVD[0]: 0000000020000000 - 000000002000ffff
  (XEN)  RESVD[1]: 0000000040000000 - 000000005fffffff
  (XEN)  RESVD[2]: 00000001a0000000 - 00000001bfffffff
  (XEN)  RESVD[3]: 000000002e000000 - 000000002fffffff

We can see the second DDR section is:

  [0x0000_0001_a000_0000 .. 0x0000_0002_ffff_ffff]

And there have reserved memory section is:

  [0x0000_0001_a000_0000 .. 0x0000_0001_bfff_ffff]

When register the boot memory sections, dt_unreserved_regions() will
remove all reserved memory sections, which means the section
[0x0000_0001_a000_0000 .. 0x0000_0001_bfff_ffff] is not managed by Xen
hypervisor at all.  If later kernel uses any pages in this range, Xen
will report the error.

But Dom0 kernel's memory nodes are:

  [    0.000000] Early memory node ranges
  [    0.000000]   node   0: [mem 0x0000000020000000-0x000000002000ffff]
  [    0.000000]   node   0: [mem 0x000000002e000000-0x000000002fffffff]
  [    0.000000]   node   0: [mem 0x0000000040000000-0x000000005fffffff]
  [    0.000000]   node   0: [mem 0x0000000060000000-0x0000000077bfffff]
  [    0.000000]   node   0: [mem 0x00000001a0000000-0x00000001bfffffff]

Based on this log, we can know Xen hypervisor passes the reserved memory
regions to Dom0 kernel, and when Dom0 kernel tries to allocate pages
from these reserved memory regions, Xen hypervisor reports error.

For more specific, this issue is cause by the commit 248faa637d ("xen/arm:
add reserved-memory regions to the dom0 memory node").  When Xen
hypervisor synthesizes DT nodes, it calls below function to generate
_normal_ memory nodes for the reserved memory regions.

  make_memory_node()
  {
     /*
      * Create a second memory node to store the ranges covering
      * reserved-memory regions.
      */
     res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
                            &bootinfo.reserved_mem);
     if ( res )
         return res;

     ...
  }

## Fixes

I think it's wrong to add the reserved memory regions into the DT
binding as normal memory nodes for Dom0 kernel.  On the other hand, we
cannot simply remove these reserved memory regions and don't pass to
Dom0 kernel - we might reserve memory for specific purpose, for example,
ramoops [1] for kernel debugging.

The right thing to do is to keep these reserved memory nodes to Dom0
kernel.  So one task is to record properties for these reserved memory
node name and properties and pass to Dom0 kernel.

The difficulty is how we can avoid allocate these reserved memory
regions in Xen hypervisor.  We cannot register the reserved memory
into the boot pages, otherwise, the reserved memory might be allocated
in the early phase.  But we need to register these pages into the
frame management framework and reserve them in the first place, so
that we can allow Dom0 kernel to use them.  (I checked a bit the static
memory mechanism, seems to me we cannot use it to resolve this issue).

Before I proceed, I'd like to check if Xen community has related
discussion or not?  Or any suggestions or input will be appreciate!

Leo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts#n54

