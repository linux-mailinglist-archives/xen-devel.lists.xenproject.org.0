Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD35EA7CA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 15:59:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411829.654911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocodU-0001CF-57; Mon, 26 Sep 2022 13:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411829.654911; Mon, 26 Sep 2022 13:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocodU-0001AS-1o; Mon, 26 Sep 2022 13:59:04 +0000
Received: by outflank-mailman (input) for mailman id 411829;
 Mon, 26 Sep 2022 13:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/6f=Z5=citrix.com=prvs=2614d53bb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ocodS-0001AM-D2
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 13:59:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e3ff980-3da3-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 15:59:00 +0200 (CEST)
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
X-Inumbo-ID: 5e3ff980-3da3-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664200740;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=igOAg8Km36khMPOK3G+/c3ee4TmVBbxeCHM60FnwBcE=;
  b=FnVL3S4j9AZfnaJIR9xwYY6KVsVNfLnli3hw4Nj7OG2yTOPlBUnDkqQs
   0gaXhqX/SFs4AtemJfSCZ4+AjyuZoIGNIT4+SLL26A30Du6faNVjD0D4M
   /p6V/xrRihzNyqmijXWZ8HMQV7v3jKz4bgRfM/YpXz+3lnyFo29AM+OUM
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81782061
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5lInTaJh59MZ+BBRFE+R+5UlxSXFcZb7ZxGr2PjKsXjdYENSgzQAy
 TQcWTiCP/iIZDameN5waInnoEhXvJCGyNQwSQJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/PZ9ks21BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEzKktPkI8I4ki+vtWHjBX+
 L8SGjxUR0XW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCDlVMhiuCzabI5fPTTHtlqg0OG/
 1vh1H3IBRMBLvCmwDmspyfEaujnwnqgBdN6+KeD3t5nhkeCgFMaDhI+XEG+5/K+jyaWUNtFJ
 0sZ0iEnt6Q1+QqgSdyVdxi5q36NulgbQchdF8Uz7Q3Lwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qyPsTq4NCwRLGkDTSwJVw0I55/kuo5bs/7UZo89Sujv1ISzQGyuh
 WDRxMQju1kNpcFXlJe4907DuTKxh4eYVwN27DfbB0vwu2uVe7WZT4Cv7FHa69NJI4CYUkSNs
 RA4piSO0AwdJcrTzXLQGY3hCJnsvq/Ya2OE3TaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C6T7wJtdiONLKih6SdkyfZlByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mHxnnjuCHcGglkjPPV+iiJm9GN843KamNLhlvMtoXi2Mm
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAGOHwCkOQOL7brH+aTMDt+YxMn6e9+JtcNcmU8vrugw
 0xRrWcFkguu2CyZeVrih7IKQOqHYKuTZEkTZUQEVWtEEVB5CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:zocl+KjlVRXJOOCA5ggImTGH43BQX1B13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftWjdySOVxeRZgbcKrAeQfBEWmtQ96U
 4kSdkHNDSSNykwsS+Z2njfLz9I+rDun86VbKXlvg5QpGpRGsNdBnJCe2Km+zpNNWx77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Lk1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoOOCXMsLlbFtzfsHfoWG1TYczDgNnzmpDt1L8eqq
 iDn/7nBbUw15qeRBDxnfKn4Xic7N9n0Q6f9bbfuwqonSWxfkNEN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3am+a/hGrDvAnZMZq59ms1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgn/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9MKOM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaCqDgDKFC66
 gpfGkoxVLaIXied/Fm9Kc7gyzwfA==
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="81782061"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation: Information about running containers for a different arch
Date: Mon, 26 Sep 2022 14:58:38 +0100
Message-ID: <20220926135838.47330-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Adding pointer to 'qemu-user-static'.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/build/README.md | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/automation/build/README.md b/automation/build/README.md
index 00305eed03..5d4734bc77 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -102,3 +102,14 @@ make -C automation/build suse/opensuse-tumbleweed PUSH=1
 
 [registry]: https://gitlab.com/xen-project/xen/container_registry
 [registry help]: https://gitlab.com/help/user/project/container_registry
+
+
+Running container for a different architecture
+----------------------------------------------
+
+To run for example an Arm container on an x86 machine, simply install the
+package `qemu-user-static`, and that it. Then you can start an Arm container on
+x86 host like you would start an x86 container.
+
+If that doesn't work, you might find some information on
+[multiarch/qemu-user-static](https://github.com/multiarch/qemu-user-static).
-- 
Anthony PERARD


