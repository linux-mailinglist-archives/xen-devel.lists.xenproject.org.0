Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594BA3E9159
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166031.303231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnP8-0003w7-JX; Wed, 11 Aug 2021 12:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166031.303231; Wed, 11 Aug 2021 12:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnP8-0003t0-FO; Wed, 11 Aug 2021 12:32:18 +0000
Received: by outflank-mailman (input) for mailman id 166031;
 Wed, 11 Aug 2021 12:32:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u8Eh=NC=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mDnP7-0003bF-Is
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:32:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2748ab20-faa0-11eb-a06f-12813bfff9fa;
 Wed, 11 Aug 2021 12:32:12 +0000 (UTC)
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
X-Inumbo-ID: 2748ab20-faa0-11eb-a06f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628685132;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GBzA1+2lZDZlrrlohE88WS+JoD2bi5tDNkhXE97v/oI=;
  b=MxRUYRa62XGTywlYPJYn3KZMCCP+PvdkYuLuLUGaSdFoOgBFgtqfGWrs
   a/wwD7yKtUmq3lto4aMoYgxGdq0M7hrWk7TEcfUVA+caxQqJT4zfQNEd+
   aeM1O+ispgtj3C/7Ofr95Mb7YLICjB+dcYA8st82VRnqR7o4phn/pGThc
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: b12C4qJVA38ITLJICEkZn+PiTz9iRkhBIxZ1aIWl2ahUx0lBuyE5PksigatYW6oqK2uXMkWZ19
 IG/RI1XrdMc9bmcJ7+95ecjmIFE1m4H+M69dqc6MH7wuazCTU8QG4D9i8LbwqsVY4L0j2hWPvf
 UksNvPEevw76m6fZSgoQycwRjflDZm49aGzv3JzEqdY1c062GfLhpG2TzXWAsxTlw26ExSMSw3
 /3z5LZMa8h0TJq7BKt+j1lv6f5gWw0oiy3iX4fqKGMqQtiopVj6SdZZWeix7AIb9yqNUeDVZUp
 I2gEayGFHUCHF4ZUj+9H0xjP
X-SBRS: 5.1
X-MesageID: 51909381
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yrGBpq9ps785zN5ceupuk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+sjztCWE7wr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQYhEWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.84,311,1620705600"; 
   d="scan'208";a="51909381"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 0/2] xen: Replace uses of TRUE/FALSE
Date: Wed, 11 Aug 2021 13:31:33 +0100
Message-ID: <20210811123135.18195-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Kevin Stefanov (2):
  xen/kexec: Remove use of TRUE/FALSE
  x86/ioapic: Remove use of TRUE/FALSE/1/0

 xen/arch/x86/io_apic.c                 | 38 +++++++++++++-------------
 xen/common/kexec.c                     |  6 ++--
 xen/drivers/passthrough/vtd/intremap.c |  6 ++--
 xen/drivers/passthrough/vtd/utils.c    |  2 +-
 xen/include/xen/kexec.h                |  4 +--
 5 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.25.1


