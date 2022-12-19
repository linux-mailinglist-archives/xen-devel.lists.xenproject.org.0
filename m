Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B36650DB6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 15:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466150.725001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOr-0006kv-QJ; Mon, 19 Dec 2022 14:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466150.725001; Mon, 19 Dec 2022 14:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOr-0006im-M6; Mon, 19 Dec 2022 14:45:53 +0000
Received: by outflank-mailman (input) for mailman id 466150;
 Mon, 19 Dec 2022 14:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUwz=4R=citrix.com=prvs=345b0463a=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1p7HOq-0006ib-0N
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 14:45:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38237bf-7fab-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 15:45:50 +0100 (CET)
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
X-Inumbo-ID: d38237bf-7fab-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671461150;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=uvIXRaTqrfksdn5R9FNqNHnkqsEC5sXLQq/zpghTvps=;
  b=OAjhERoncBfgMWNNvYT8dKAHu9ILesoKeI/Kpsu+u9A/nwYQn9s7WkdI
   2eIv8gXnI7JKPeYxyhjS4nN76QqIVil/ybOC0aKbIYPbcc6l6y+SLsNRS
   nGcg9F4nR5H0Zj6el2aTTI3mA847TkH3suPLEREnkinrvrC0zCWym20xP
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88063303
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S9mOIa5fnEFmGqrKgwKYGwxRtDfHchMFZxGqfqrLsTDasY5as4F+v
 jNLWDuCbPmPYWKjKNknaonk8hhUuZPWndRmSgZu/CAyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoS7QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 fxAIWwidjC6tuuGh+yYF+5ypZoqI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAnXTlfDBJ7l6ErLEz4kDYzRBr0airO93QEjCPbZUFxhjD/
 Tqdl4j/KhVBaeCh02KYyW+pnMnJxTzFAr8eGqLto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9CW9abHMrVSs80tDT598Q0xXRbYhqH/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT4FWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YuLVTXrHowOx7BjggBdXTAdolmZ
 f+mnTuEVy5GWcyLMhLtLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaodFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcut+pEIKLLef1IO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:QWuVGqqDL3pCMkDW0nWOkdwaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="88063303"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH v2 0/3] x86: load microcode earlier on boot CPU
Date: Mon, 19 Dec 2022 14:45:30 +0000
Message-ID: <20221219144533.19836-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

The second version of patches. Changelog is available in each patch.

Sergey Dyasli (3):
  xen/multiboot: add proper struct definitions to typedefs
  x86/ucode: allow cpu_request_microcode() to skip memory allocation
  x86/ucode: load microcode earlier on boot CPU

 xen/arch/x86/cpu/microcode/amd.c     | 13 ++++--
 xen/arch/x86/cpu/microcode/core.c    | 70 +++++++++++++++++++++++-----
 xen/arch/x86/cpu/microcode/intel.c   | 13 ++++--
 xen/arch/x86/cpu/microcode/private.h | 15 ++++--
 xen/arch/x86/include/asm/microcode.h |  7 ++-
 xen/arch/x86/include/asm/setup.h     |  3 --
 xen/arch/x86/setup.c                 | 10 ++--
 xen/include/xen/multiboot.h          | 25 ++++++----
 8 files changed, 115 insertions(+), 41 deletions(-)

-- 
2.17.1


