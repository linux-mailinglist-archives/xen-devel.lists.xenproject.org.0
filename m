Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129658462B6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 22:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674715.1049833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenL-0005M8-JH; Thu, 01 Feb 2024 21:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674715.1049833; Thu, 01 Feb 2024 21:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenL-0005Jj-Fu; Thu, 01 Feb 2024 21:40:27 +0000
Received: by outflank-mailman (input) for mailman id 674715;
 Thu, 01 Feb 2024 21:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVenK-0005Jd-Aj
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 21:40:26 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812dd29a-c14a-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 22:40:24 +0100 (CET)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6040d9e52b9so14765167b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 13:40:24 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a21c700b007853eb72c49sm154978qka.46.2024.02.01.13.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 13:40:21 -0800 (PST)
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
X-Inumbo-ID: 812dd29a-c14a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706823622; x=1707428422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOBkl/FI31A16UeVSXNN4wI40FVp19VWKB4FKGEq7Co=;
        b=k1JoC9othNW5gzz/XkYnAXF4rEl5+NZBYdNwP4Uu/BRRbIbF0AIkc6HusIr+Gn57i7
         pJ8I6op4aMUk0iEmDrpqtcKJ4STYJWudp9XKKzaMagUxZ6l/Y+bh6608idQzXk49Q63G
         ZPgE5G1wL3D15V9/BK4YLZbHUy8obMXVILRX8CfpSrTw7NRYb49XLtZMKKzefiDkUT81
         J4PnI6XBzSEJ3BjGB7h6Iy6mMu+E2bLAvqKf+y1ZW7Y+nJEfpw4JMqtRHHk6YsUtXLKt
         mmUWF9UYhHT8B3gkD1dhJzLOJ5QHafewFbyATyVionLtRD1SP5/2UL+8WHAmM4O8W8DB
         z/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706823622; x=1707428422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOBkl/FI31A16UeVSXNN4wI40FVp19VWKB4FKGEq7Co=;
        b=ZYHiD9CDzqK72BMFiKMWV1msX+SnPUJdkr+yGUvKBwslkHSO4S3VrhHQfvR47GHiWM
         bTiLzBldw9Mad3yV3F8mLisMBFqpxeHY6jHpcAE4aby43kgXwLlH35nQIIn5w/qH+8O+
         UHJZXksNVzrOhmAY1N4GQANf6Mj21CrCYcoz1uXkwyVJHzKGjPxdyOovWILrqNrhR7rW
         8QDCUNsr4KKvGmPQ5t/zItae/kQhsmwn/rnE1QVsqjTUNimqFcGTJPDMnNoiD2e5QfJP
         yRLgaNF/Q0bx5IsUCAdoinQNLPwS5duBUBVzH+H+AdiLF8VnnqwyWgc04hXgQ1RQogO1
         1u2Q==
X-Gm-Message-State: AOJu0YwTIleOlfVpLTOy+t8o0o7cGSTrqPDS3KKwLOxbGcZqx/0T3oT0
	k2uLOqfq0o85HKbiUiJXuONILw+lQG4WdtwWgpN5nUzTJPlD6eDP5eRix1LR
X-Google-Smtp-Source: AGHT+IHXu0MiyHUQqw/Xz8M9a/POsPkTtJhpLdNaLRvqNDZa39Uf6TbkyqqY5jMPckdRNIhOxZyyvg==
X-Received: by 2002:a81:ad08:0:b0:602:9161:2e73 with SMTP id l8-20020a81ad08000000b0060291612e73mr419591ywh.29.1706823621845;
        Thu, 01 Feb 2024 13:40:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW9l/sZeUwluN+qLJsGDA8KBjAkKBO/JxjefS6jLoalY8FJCijPf3GVLkhcwPr0IY0aHOHSfjxNfvAMrRgsjFRLs7k2lkOMyBNh+5etLeAF4ViLtqqlbBNsM5+y7O++8sGlKBFsl9T6LWgF82dxnFZpcbPKNr+vQtqoqGwUY53VVIe+BKq10oXqWYKJTFMYOnu4VC+FmbX6f0BkpAxRFnJrWJ51te4Z0NfI7xaSwZ8hCJ8hpxZ3HPIyR9pTdbgQUkqCOqNnJn5yvRrU6NTJfjepZh1tmTuANatUvTEG5uAGNAbneF1XlErOYzo=
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] libxl: Stubdom cd-rom changing support
Date: Thu,  1 Feb 2024 16:40:01 -0500
Message-ID: <20240201214004.238858-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches enable cd-rom media changing for an HVM with a linux
stubdom.

v1 didn't support these empty drives.  The code came out of OpenXT which
has a hack - null.iso.  null.iso is an ISO with no contents.  OpenXT
doesn't actually eject the cd-rom, it just inserts null.iso.  This patch
set has QEMU present empty media.

The first patch creates an empty file, /run/xen/empty-cdrom.%u, for Phy
drives that are "empty".  The place holder simplifies things because the
block scripts don't work for an empty params.  Even if the scripts were
modified for that, a stubdom will timeout on startup when the empty
disk/blkback never connects.  The empty file works around these issues.

The second patch allows use of Phy backend drives for a cd-rom.  This
works for non-stubdom HVMs.  Actually special casing stubdoms didn't
work.

The third patch expands the cd-rom changing code to support the stubdom
case.

To change the cd-rom medium, libxl will:
 - QMP eject the medium from QEMU
 - block-detach the old PV disk
 - block-attach the new PV disk
 - QMP change the medium to the new PV disk by fdset-id

xl cd-eject follows the above through connecting the new PV disk,
empty-cdrom.%u.  It skips the QMP media change.  This keeps the xenstore
entries which are needed to identify that a cd-rom drive is present.  If
the xenstore entries were removed on eject, libxl wouldn't find the
device (hdc) for a subsequent cd-insert.

The QMP change insert uses fdset-id STUBDOM_FDSET_CD + $disk - 'a'.
That is, hda -> 'a', so
STUBDOM_FDSET_CD + 'a' - 'a' = STUBDOM_FDSET_CD.
For hdc:
STUBDOM_FDSET_CD + 'c' - 'a' = STUBDOM_FDSET_CD + 2.

The stubdom must internally handle adding /dev/xvdc to the appropriate
fdset inside QEMU.

A script like this:
https://github.com/OpenXT/xenclient-oe/blob/master/recipes-core/initrdscripts/initramfs-stubdomain/qemu-xvdc-add-fd.sh

Can be called by busybox mdev configured like this:
https://github.com/OpenXT/xenclient-oe/blob/master/recipes-core/busybox/files/mdev.conf

(OpenXT mdev as the hotplug helper works, but with a ~Qubes stubdom, I
had to run mdev as a daemon, mdev -d.)

Linux locks the cd-rom by default?  That means the QMP eject commands
fail, but then Linux unlocks.  Re-running a second time works.  Windows
doesn't do that.

There are spurious messages sometimes like:
libxl: error: libxl_qmp.c:1837:qmp_ev_parse_error_messages: Domain 5:Could not dup FD for /dev/fdset/8002 flags 0: No such file or directory

libxl doesn't know when the stubdom has setup the fdset.  Since it gets
those errors, it'll retry adding to the fdset.

Jason Andryuk (3):
  libxl: Create empty cdrom file for stubdom
  libxl: Allow Phy backend for CDROM devices
  libxl: Enable stubdom cdrom changing

 docs/misc/stubdom.txt             |  16 ++
 tools/libs/light/libxl_device.c   |  17 +-
 tools/libs/light/libxl_disk.c     | 345 +++++++++++++++++++++++++++---
 tools/libs/light/libxl_domain.c   |   4 +
 tools/libs/light/libxl_internal.h |   1 +
 5 files changed, 344 insertions(+), 39 deletions(-)

-- 
2.43.0


