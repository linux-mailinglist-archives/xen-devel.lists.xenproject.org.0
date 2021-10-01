Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516D041F033
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 17:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200702.355246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWK1q-0006a0-M6; Fri, 01 Oct 2021 15:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200702.355246; Fri, 01 Oct 2021 15:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWK1q-0006Wn-IN; Fri, 01 Oct 2021 15:00:50 +0000
Received: by outflank-mailman (input) for mailman id 200702;
 Fri, 01 Oct 2021 15:00:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kuDH=OV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mWK1o-0006Wg-MZ
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 15:00:48 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1f0ca15-7fb3-4013-aef2-accd8260ee8a;
 Fri, 01 Oct 2021 15:00:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0B441FEDA;
 Fri,  1 Oct 2021 15:00:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AEA8013C6D;
 Fri,  1 Oct 2021 15:00:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k+lWKJ0iV2G5OgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Oct 2021 15:00:45 +0000
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
X-Inumbo-ID: e1f0ca15-7fb3-4013-aef2-accd8260ee8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633100445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6xWZoy2a5K0CyrmBK/cVhYbX7E69zDWhy7ff7dORPUU=;
	b=ZMIuyG/UzkBdS4Z6/2OmD79XnIC6522CSe/v7FuBL+11XhxC+pU2Kv698BPIAMRvkWZfXJ
	lGQWS9Zac+HWBPC9/YSSWYrGfHS1zao6wfPFT3a9fad1LZ8wGJvRt6URdvy83xhCyXy29X
	8YK1VaTp5Tm3ehoBjQJWa6o9+w/tv+o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 0/3] xen, usb: support pvUSB frontend driver
Date: Fri,  1 Oct 2021 17:00:36 +0200
Message-Id: <20211001150039.15921-1-jgross@suse.com>
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
 drivers/usb/host/xen-hcd.c       | 1641 ++++++++++++++++++++++++++++++
 include/xen/interface/io/usbif.h |  421 ++++++++
 5 files changed, 2082 insertions(+)
 create mode 100644 drivers/usb/host/xen-hcd.c
 create mode 100644 include/xen/interface/io/usbif.h

-- 
2.26.2


