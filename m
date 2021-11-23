Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88445A3A5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 14:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229580.396996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpVjC-0002Zz-3b; Tue, 23 Nov 2021 13:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229580.396996; Tue, 23 Nov 2021 13:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpVjC-0002Y7-0C; Tue, 23 Nov 2021 13:20:54 +0000
Received: by outflank-mailman (input) for mailman id 229580;
 Tue, 23 Nov 2021 13:20:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yj1i=QK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mpVjA-0002Xw-KR
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 13:20:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2daee996-4c60-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 14:20:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A120821940;
 Tue, 23 Nov 2021 13:20:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A6D213DE9;
 Tue, 23 Nov 2021 13:20:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fPTAGLLqnGH9CgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 23 Nov 2021 13:20:50 +0000
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
X-Inumbo-ID: 2daee996-4c60-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637673650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7MFKZbNAVdl2EUgQeeUJA5/cSNPz9947JBoucY3tvZA=;
	b=ldzEZ69g0Qwal/zZhhM52f60Z7cvvWSVyAQPpYuh4bnOgmRkEkBQMMgmvQpcCNp3uGWvuK
	IV21m8dRP++wTEM9SyEP5tRDzQOY+uxBfjVpPueU9loJR9cb2w5WB9URqB/nOK1EOs5A0I
	WS4DFXMVoH6UQuEFad+LbeUJ4ySoVjo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 0/3] xen, usb: support pvUSB frontend driver
Date: Tue, 23 Nov 2021 14:20:45 +0100
Message-Id: <20211123132048.5335-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds XEN guest pvUSB support. With pvUSB it is possible to
use physical USB devices from a XEN domain.

Since V4 a lot of time (several years) has passed. This is a revived
attempt to get the frontend into the kernel.

The support consists of a frontend in form of a virtual hcd driver in
the unprivileged domU passing I/O-requests to the backend in a driver
domain (usually Dom0). The backend is not part of this patch series,
as it is supported via qemu.

The code is taken (and adapted) from the original pvUSB implementation
done for Linux 2.6 in 2008 by Fujitsu.

Normal operation of USB devices by adding and removing them dynamically
to/from a domain has been tested using various USB devices (USB 1.1,
2.0 and 3.0) using the qemu based backend.

Changes in V7:
- use SPDX header in usbif.h

Changes in V6:
- add SPDX line to driver

Changes in V5:
- added interface documentation to patch 1
- frontend no longer trusts backend to return only sane values

Changes in V4:
- remove sysfs file from frontend, as it violated the "one value per file"
  rule and didn't serve any real purpose.

Changes in V3:
- move frontend to drivers/usb/host and rename it to xen-hcd.
- changed name prefixes in patch 1 to "xenusb" as requested by Greg
- use __u<n> types rather than uint<n>_t as requested by Greg

Changes in V2:
- removed backend, as it can be implemented in user land
- added some access macros and definitions to the pvUSB interface
  description to make it independant from linux kernel USB internals
- adapted frontend to newer kernel version and use new pvUSB
  interface macros
- set port status in one chunk as suggested by Oliver Neukum

Juergen Gross (3):
  usb: Add Xen pvUSB protocol description
  usb: Introduce Xen pvUSB frontend (xen hcd)
  xen: add Xen pvUSB maintainer

 MAINTAINERS                      |    8 +
 drivers/usb/host/Kconfig         |   11 +
 drivers/usb/host/Makefile        |    1 +
 drivers/usb/host/xen-hcd.c       | 1606 ++++++++++++++++++++++++++++++
 include/xen/interface/io/usbif.h |  405 ++++++++
 5 files changed, 2031 insertions(+)
 create mode 100644 drivers/usb/host/xen-hcd.c
 create mode 100644 include/xen/interface/io/usbif.h

-- 
2.26.2


