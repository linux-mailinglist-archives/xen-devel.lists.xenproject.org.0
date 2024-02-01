Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA341845FED
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 19:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674668.1049734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpg-00023J-5K; Thu, 01 Feb 2024 18:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674668.1049734; Thu, 01 Feb 2024 18:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpg-00020r-24; Thu, 01 Feb 2024 18:30:40 +0000
Received: by outflank-mailman (input) for mailman id 674668;
 Thu, 01 Feb 2024 18:30:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVbpe-00020T-ST
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 18:30:38 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe426915-c12f-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 19:30:37 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-59a8b9b327aso588674eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 10:30:37 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 pf8-20020a056214498800b0068c75141e73sm25824qvb.2.2024.02.01.10.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:30:34 -0800 (PST)
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
X-Inumbo-ID: fe426915-c12f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706812235; x=1707417035; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJji4XqXHiQq6UqkyTBADvfuoJ+3mi3CXw1t6K2EPpo=;
        b=CfKu3gHMrURnR5VmyAQeZ5dRpF06sIEGjmVfRwShbWJIMWJ1Th3IiVACbKlRYPTF6R
         1fT78Nt0dAkQs3tY4VscgMIzNl0qoxZRTSP/1Xp8csxzlUdTy5pA1/nUkuJ294bDfuCn
         s2+SzMhYwHu3DQQxhsPVXfMoY/7NpC7Jjwa7YLh9JJJtf9LzryxiLAQCpkkA12GCu2tV
         hv/15wqGQ9jnwqRgQrJQE+3zqF5NBhYbnUiFtmO2oezEELeEaleyL+2VUQZ/XYQW8v4C
         n+sQbzbe/3HbTi1T4kvu7cbp+swVMCXHeKJsy25HLxxo44deqvXZ30eE5LBQfqeeQYWU
         ekCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706812235; x=1707417035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJji4XqXHiQq6UqkyTBADvfuoJ+3mi3CXw1t6K2EPpo=;
        b=qWOHlCCOcFGf+qm8GvdvU+KyISmrEneHBvWfyh1WCJQ052/zlXUng0WowT6VNkCtT+
         lLv5Q1utJ7/956nGUJyAbLyS93QEreMVuL2HBMyrpIu7hlXwmpM1pKUcPSEx9cPFQr7M
         I7ztJ1Yftb1JWC0hG+yRIfrqPlEI+inhgcyTa9Y9nQ7oolpOw0ph2r2DrbS2OX1yj6FX
         MyvdEre0pQ8NmOFekBIKeGikTLKwwYz21VFvtOlay/vXNS47xECffYjufxBjC3nqsAat
         PntEmcuogsNwCxJYpR2i5X9lJI60FtrPeNl5M3CWBZ801y3xzGhnw3RakfsaVYGGNVOH
         yuHw==
X-Gm-Message-State: AOJu0YyL6UVFs/PH7/kTcR9m81xd5Yu18+rYwvmRa2AX2cLSdbNBbqzW
	6EA2m52TZU8BzdM3GmgZIUxkIhebsu5EocNeiN9FhSVX4CblOREMZdtrl1ij
X-Google-Smtp-Source: AGHT+IGV0uyPo9vT0Nu0foAi8DR32p22Pp8jVZK9AlB4genAWqSBAP0FPq2wS6ruxXJ0fQURhtfBsg==
X-Received: by 2002:a05:6358:4b05:b0:175:fc1a:c7df with SMTP id kr5-20020a0563584b0500b00175fc1ac7dfmr5911393rwc.15.1706812235109;
        Thu, 01 Feb 2024 10:30:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUHWpEq/EQiJKqWpN75DGqRJxbJeZ11a8UUSu3X/895bYo+YOko02W7JF9qji9NNesW7KkyvNP51IZNKtxVjIunowdVDL0aXFSem43458xbgSa4FEGGUuvCbTcQWtdIXHcrAb7vpWA=
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/4] libxl: blktap/tapback support
Date: Thu,  1 Feb 2024 13:30:20 -0500
Message-ID: <20240201183024.145424-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch re-introduces blktap support to libxl.  Unlike earlier
versions, it does not link against any blktap library.  libxl changes
are needed to write to the vbd3 backend XenStore nodes.

blktap has three components.  tapdisk is a daemon implementing the disk
IO, NBD (Network Block Device), and Xen PV interfaces.  tap-ctl is a
tool to control tapdisks - creating, starting, stopping and freeing.
tapback manages the XenStore operations and instructs tapdisk to
connect.

It is notable that tapdisk performs the grant and event channel ops, but
doesn't interact with XenStore.  tapback performs XenStore operations
and notifies tapdisks of values and changes.

The flow is: libxl writes to the "vbd3" XenStore nodes and runs the
block-tap script.  The block-tap script runs tap-ctl to create a tapdisk
instance as the physical device.  tapback then sees the tapdisk and
instructs the tapdisk to connect up the PV blkif interface.

This is expected to work without the kernel blktap driver, so the
block-tap script is modified accordingly to write the UNIX NBD path.
(It works with the kernel blktap driver as well - upstream blktap hasn't
removed the blktap driver requirement yet -
https://github.com/xapi-project/blktap/pull/364)

An example command to attach a vhd:
xl block-attach vm 'vdev=xvdf,backendtype=tap,format=vhd,target=/srv/target.vhd'

VHD support is important for OpenXT since there are lots of existing
VHDs which still need supporting.  tapdisk also supports encrypted VHDs
which is not available in QEMU.

blktap's tapback needs minimal changes to work with libxl:
https://github.com/xapi-project/blktap/pull/394

Jason Andryuk (4):
  block-common: Fix same_vm for no targets
  libxl: Add support for blktap vbd3
  hotplug: Update block-tap
  libxl: Support blktap with HVM device model

 docs/man/xl-disk-configuration.5.pod.in   |   4 +-
 tools/hotplug/Linux/block-common.sh       |   8 +-
 tools/hotplug/Linux/block-tap             | 162 ++++++++++++++++++++--
 tools/libs/light/libxl_device.c           |  14 +-
 tools/libs/light/libxl_disk.c             |  37 +++--
 tools/libs/light/libxl_dm.c               |   1 -
 tools/libs/light/libxl_linux.c            |   1 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 9 files changed, 201 insertions(+), 29 deletions(-)

-- 
2.43.0


