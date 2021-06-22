Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84473B0CC4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146023.268606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1l-00032D-Lh; Tue, 22 Jun 2021 18:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146023.268606; Tue, 22 Jun 2021 18:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1l-0002zs-IJ; Tue, 22 Jun 2021 18:21:37 +0000
Received: by outflank-mailman (input) for mailman id 146023;
 Tue, 22 Jun 2021 18:21:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvl1k-0002zl-7M
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:21:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6423d0e5-51cd-4e5f-b3e0-de17c7735f40;
 Tue, 22 Jun 2021 18:21:34 +0000 (UTC)
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
X-Inumbo-ID: 6423d0e5-51cd-4e5f-b3e0-de17c7735f40
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386094;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xirZ/a/+ZKtgbEaH8f9M+g1BsL/PFi7C3fygtGPi0A4=;
  b=JANuMnmhtVsJXcMo8N0LIqj+teUrvhDkXId4p1FsDAS0C2WSFEVCutKS
   jgnl0Ed9tOzXbCSIfoR03+8fD4CBy0kPU/L+1AQ9qydRZ5uM0SX3RePlJ
   kCXcc1+2clJ7LyaFjgYlepStZ/coad7sF0ZcfoFz4Xr1Cld5othN79mEA
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wGsUtjOtS6zwDe5u4ynUrwyNEwzwy4X/PtNdnicaN8Yg6QKheIJ6wm/cqDgC6V6cYx76ocC7gn
 bbqK63nzl5mm70NxKJYAGW/MUEtX3u8r4iTvOe7AIBnMt3N9epj4Sx6Hexs0tqoufBY4g34QlK
 v097W3azrFmpxIVAeqbObWgdxrWkzKpQTwPj2G5l4bg9r0/Q/UBl12fq62cO+EPU6E6iZmwsBI
 Z+eDSRgSEg+CoUB1SNq74bX8kPDSfySM/DPegWieICcgJmD315JLIuiXOKOSl50XbgtbWzE0wT
 cys=
X-SBRS: 5.1
X-MesageID: 47083114
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:C8gp7amcZw5eDE7O3Scy8LcSXMDpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="47083114"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v2 0/4] tools/tests: More cleanup for automation improvements
Date: Tue, 22 Jun 2021 19:21:20 +0100
Message-ID: <20210622182124.11571-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

v2:
 * Fix CI failures from newly-exposed logic
 * Drop -f's from $(RM)
 * Drop the 'run' rune patch.  Its clearly controvertial, but ignoring the
   problems isn't an available option in the longterm.

All other RFC questions still outstanding.

Andrew Cooper (4):
  tools/tests: Drop obsolete mce-test infrastructure
  tests/resource: Rework Makefile
  tests/cpu-policy: Rework Makefile
  tests/xenstore: Rework Makefile

 .gitignore                                         |   2 -
 tools/misc/.gitignore                              |   1 +
 tools/misc/Makefile                                |   4 +
 tools/{tests/mce-test/tools => misc}/xen-mceinj.c  |  32 +--
 tools/tests/Makefile                               |   1 -
 tools/tests/cpu-policy/Makefile                    |  31 ++-
 tools/tests/mce-test/Makefile                      |  12 -
 tools/tests/mce-test/README                        |  75 ------
 tools/tests/mce-test/cases/srao_llc/dom0/cases.sh  |  73 ------
 tools/tests/mce-test/cases/srao_llc/guest/cases.sh |  94 --------
 tools/tests/mce-test/cases/srao_llc/xen/cases.sh   |  69 ------
 tools/tests/mce-test/cases/srao_mem/dom0/cases.sh  |  73 ------
 tools/tests/mce-test/cases/srao_mem/guest/cases.sh |  94 --------
 tools/tests/mce-test/cases/srao_mem/xen/cases.sh   |  69 ------
 tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh  |  72 ------
 tools/tests/mce-test/cases/ucna_llc/guest/cases.sh |  92 --------
 tools/tests/mce-test/cases/ucna_llc/xen/cases.sh   |  68 ------
 tools/tests/mce-test/config/setup.conf             |  24 --
 tools/tests/mce-test/lib/xen-mceinj-tool.sh        | 260 ---------------------
 tools/tests/mce-test/tools/Makefile                |  24 --
 tools/tests/mce-test/tools/README                  |  24 --
 tools/tests/resource/Makefile                      |  11 +-
 tools/tests/xenstore/.gitignore                    |   1 +
 tools/tests/xenstore/Makefile                      |  31 ++-
 .../tests/xenstore/{xs-test.c => test-xenstore.c}  |   8 +-
 25 files changed, 80 insertions(+), 1165 deletions(-)
 rename tools/{tests/mce-test/tools => misc}/xen-mceinj.c (97%)
 delete mode 100644 tools/tests/mce-test/Makefile
 delete mode 100644 tools/tests/mce-test/README
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/config/setup.conf
 delete mode 100644 tools/tests/mce-test/lib/xen-mceinj-tool.sh
 delete mode 100644 tools/tests/mce-test/tools/Makefile
 delete mode 100644 tools/tests/mce-test/tools/README
 create mode 100644 tools/tests/xenstore/.gitignore
 rename tools/tests/xenstore/{xs-test.c => test-xenstore.c} (98%)

-- 
2.11.0


