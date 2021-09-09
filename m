Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8CC405AFA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183371.331503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON0v-00012K-RX; Thu, 09 Sep 2021 16:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183371.331503; Thu, 09 Sep 2021 16:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mON0v-0000zU-OY; Thu, 09 Sep 2021 16:35:01 +0000
Received: by outflank-mailman (input) for mailman id 183371;
 Thu, 09 Sep 2021 16:35:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xa6=N7=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mON0u-0000zH-H3
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:35:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df86ced6-118b-11ec-b1cb-12813bfff9fa;
 Thu, 09 Sep 2021 16:34:59 +0000 (UTC)
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
X-Inumbo-ID: df86ced6-118b-11ec-b1cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631205299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jxIDQkKsTXbVItmungXARfHQlLf5LNa97ZaMET1EAnQ=;
  b=ZCrBLm8z12plVurr4U8G2n7uOJ3cMUOnEBwcaAr+h68gZRA5eQqexpxj
   3nDkLnnlE4F8oEVf9/QLZGtKxxo+DjRCqXx7O/0bG2K7PWhQIwk8+AZS0
   r98J6K6qYb6m+qYXyewrYY9jKwfDiWa2UkVB+PVK9L/AjvOIUrcYNgbB3
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WRHW/DJUzgC1I3mxF5Mnk71MyY7xV/GezfWw7jSVLQfqpPVLk98vwMu/+9UeTR66QByRZxFURa
 mcnGydFCkFtmgv/FmiyzxYU0GW/vxBr9SNODtNz3eqQnUeWqHBYNpqg++VJyT6cgjc/zcwc9a8
 FA/4WVMQWztCNxmRaAxaD8A3jTEYNfQY1XVhV5emTuu4NAkJ3IHkssikGBIZCAVQ8xB5kQfcqo
 VNzreqtZ8oHjLjWOuQN7hhuADOivkJtdTsSTs/QtlD0cvBqXRt1hM3Pkh9URbD1NVwQwF0c3uf
 RnylTMDmFGvX4f76lKUzoMod
X-SBRS: 5.1
X-MesageID: 51975736
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7yYLK6NXAmB0ScBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="51975736"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH 0/3] Fix alignment of FACS in guests
Date: Thu, 9 Sep 2021 17:34:38 +0100
Message-ID: <20210909163441.44418-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When booting Xen as a PVH guest, it currently complains:

  (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
  (XEN) ACPI: FACS is not 64-byte aligned: 0xfc001010
  (XEN) ACPI: wakeup_vec[fc00101c], vec_size[20]
  (XEN) ACPI: Local APIC address 0xfee00000

This is caused by several bugs in the toolstack whilst writing ACPI
tables.

Kevin Stefanov (3):
  tools/libacpi: Use 64-byte alignment for FACS
  tools/libxl: Correctly aligned buffer for ACPI tables
  tools/libxl: Only allocate 64 bytes for RSDP

 tools/libacpi/build.c             | 2 +-
 tools/libs/light/libxl_x86_acpi.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1


