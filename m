Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF607B2592D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 03:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080521.1440882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMtu-0006x6-0J; Thu, 14 Aug 2025 01:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080521.1440882; Thu, 14 Aug 2025 01:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMtt-0006vZ-Tk; Thu, 14 Aug 2025 01:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1080521;
 Thu, 14 Aug 2025 01:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7ku=22=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1umMts-0006vN-QC
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 01:37:04 +0000
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [2607:f8b0:4864:20::d34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d168cc3-78af-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 03:37:02 +0200 (CEST)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-88432d124e0so655039f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 18:37:02 -0700 (PDT)
Received: from kf-m2g5.. ([2607:fb91:1183:972:ee53:76c5:e875:9619])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-883f198db02sm467297239f.16.2025.08.13.18.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 18:37:00 -0700 (PDT)
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
X-Inumbo-ID: 2d168cc3-78af-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755135421; x=1755740221; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YhWcxECTsyvnQsJ7LChw0cYe53xNGGE4aZqEdFjnPwo=;
        b=ZP+/GrFk8812C+NjayMalxIaJ+UyPVstwkRDJwOuOklIIZZOcNPUl5rxkNCsun9ftl
         ODxyQ0vCCtnw0iTsNSGi9mEAUprt3PrGq775UhJ98x9bd1UngZxnmT5Ms7ca1c+Lqzfl
         rgyAKKLruoT3P6vdD3/NknFHaPRgOSV2idmvVCsU58dLuQ5OblhmDXHEUNZQK9YSjnDo
         JorIo8wGDZ8UVu9tjxnk+sc7143x59e9N59LXE81il03ZbXiAl02bZ2GzfNzVgmzIqmJ
         ypl47MWa2T08BlPvxqUYMFrWgs+QH+B7KnzW5qjYE7ivBXnSxV3+cvMTe+nb0092Q5wX
         2iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755135421; x=1755740221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhWcxECTsyvnQsJ7LChw0cYe53xNGGE4aZqEdFjnPwo=;
        b=lVK/Vk5vLz1CJ/yjo9s/9hCopAARu/8SbsMbc1Jl5iwA4gaLvvEszHqqYheDwbTX0L
         TeSgu6reTWDXe5kWQStRryvxgFZU9nyhq/h2/drbH3TWaDOXM3IHunofhOix88s8KVjr
         uzj7RdZj5yJLdM1ofdjRyNkmGdFMBmhGllsl5Au6guaX96mEUFT/hqd/qagFtxHHUtCT
         sW2Zf3cgxLzptnxzBJCnjhPawGDq7D9rdjHU5oF+PnPnkDOJ56mH0rGIpecv/igra6QS
         PZMwg7XCEukeT1c+srAO4C2DeKr9jsucTeOAhWjFqqhOflLT/G2g5wclVyuaRsl8ZUiR
         MsJg==
X-Forwarded-Encrypted: i=1; AJvYcCWJuGhzFneN+iJ3G0i9+hHSU2tItYQ/CqZp2vqWBCHP2p9Jh44xaDYyuf6MDKZXf0PTeNaDWKC2QXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxGw8JxMSyUtZEdkLagbF+vdwouzSNfLkbsmjkXUz3j/P0lcV1
	HXNZdlDm6I9FIfvvcyhvi6PoTHyH3/3+0109ocmheAYR1DBCtn159tUg
X-Gm-Gg: ASbGncsa+curyzTAl7cu7/Uh8/1d3wqpL31dRSTd9528idfdk3Iob7yU6Z/Ba8VfWoJ
	bCmxsR1JyF+ox5Tg7Ptg5Pq25KstK0Ou9ffironnbpnYn97rtC8hIqmRxFToKqpPtzUGOrBM7EB
	ehIEyW0wBfQ3GkCXF9wl3kloQ7Xe4RgtgUxfCOMPtpPyG/uV8TUCs6B9677c9r2apVCoywCWdGX
	3r9CveLTW2Rl7/gYgmOPF6C8Lldjh1kmQazfzVLPbmB6JRa2eKJJGTXBUBnPp27v4Ie0IP41X37
	pT2JXYU+nOHpS2ycaltmJ768CnwmV+cduVd4qpveAy2+keNs6H/6k2hqVXeMI2iMRnkc6kJYq4l
	oeLTMuIIDksO7oQXVsBNRnA==
X-Google-Smtp-Source: AGHT+IFQkAP33m52LBfGZ7HHZAwhTRI7DuDKvGYk0rFli5FQhFa6aMbNAaPUt+2gf8/I9y3OTzEiVg==
X-Received: by 2002:a05:6602:6d18:b0:87c:2f2e:7ddf with SMTP id ca18e2360f4ac-884334ea275mr79870439f.0.1755135421314;
        Wed, 13 Aug 2025 18:37:01 -0700 (PDT)
From: arraybolt3@gmail.com
To: grub-devel@gnu.org,
	xen-devel@lists.xenproject.org
Cc: Aaron Rainbolt <arraybolt3@gmail.com>
Subject: [PATCH v5 0/3] kern/xen: Add Xen command line parsing
Date: Wed, 13 Aug 2025 20:36:42 -0500
Message-ID: <20250814013645.2488043-1-arraybolt3@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aaron Rainbolt <arraybolt3@gmail.com>

The purpose of this patch is to allow the Xen hypervisor to pass extra
data to GRUB in the form of a kernel command line, allowing the host to
customize the boot process of the guest. The command line from Xen is
parsed, and any variables within that start with the string
`xen_grub_env_` are exposed as environment variables. The grub.cfg
script can then use those environment variables as it sees fit.

The main reason for doing this is to allow implementing boot modes in
Qubes OS while also using in-VM kernels. For more context on Qubes boot
modes, see [1]. In order for this to work with in-VM kernels, it is
necessary for dom0 to pass kernel parameters to the guest without
modifying the guest's grub.cfg manually. This patch allows this to be
done, by allowing dom0 to pass kernel parameters to GRUB, which then
provides them to grub.cfg as an environment variable. The grub.cfg
script within the VM can then append those parameters to the kernel
command line.

All of the changes from version 4 of the patch are simply refinements
after review from Daniel Kiper. The patch's functionality is unchanged.

Since there are substantial changes since version 4, I've re-run the
entire battery of tests that were used against the v4 patch. All tests
pass. As previously, the tests were done by booting a patched GRUB in
Xen with various different parameters passed to it via the Xen-provided
kernel command line. The effects of these parameters on the
bootloader's environment were then tested, and then an Arch Linux image
was booted to ensure that boot still worked.

[1] https://github.com/QubesOS/qubes-linux-pvgrub2/pull/16

Aaron Rainbolt (3):
  include/xen: Rename MAX_GUEST_CMDLINE to GRUB_XEN_MAX_GUEST_CMDLINE
  include/xen: Add warning comment for cmd_line
  kern/xen: Add Xen command line parsing

 docs/grub.texi                |  52 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |   4 +
 grub-core/kern/xen/cmdline.c  | 361 ++++++++++++++++++++++++++++++++++
 grub-core/kern/xen/init.c     |   2 +
 include/grub/xen.h            |   2 +
 include/xen/xen.h             |   9 +-
 7 files changed, 430 insertions(+), 2 deletions(-)
 create mode 100644 grub-core/kern/xen/cmdline.c

--
2.50.1


