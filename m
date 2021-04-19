Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C65364595
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112930.215284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTC-0005z3-DA; Mon, 19 Apr 2021 14:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112930.215284; Mon, 19 Apr 2021 14:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTC-0005ye-9x; Mon, 19 Apr 2021 14:01:46 +0000
Received: by outflank-mailman (input) for mailman id 112930;
 Mon, 19 Apr 2021 14:01:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTA-0005yZ-Ji
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:01:44 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 225eb134-52f5-4e19-af05-b938bc818daf;
 Mon, 19 Apr 2021 14:01:43 +0000 (UTC)
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
X-Inumbo-ID: 225eb134-52f5-4e19-af05-b938bc818daf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hcLgQnEv5YmedkPX8SbOT7ZGxyV1UCkJYZPD9Rw+m9g=;
  b=c2bizUnp9I5wGUjuP8s5/uyZPMrrS6uPF/m+LaLfp3YSxKQTswehNfy1
   B/LyuzIiBf4ErvFHny0iBaFHv1lRwkRJqlR6M/00sgRWATfn9v1C24TKI
   VUfwzI/UHMQNbuWvayEEEAOixH0zn8FjEylce1XuSzCmCqeNJ/j7j/NrP
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: om/z81jF28FP3gxWxSZ+xEi5v7Shp1AbS7DkTVM3TYfsjotMHqzlrs8dMSr/86rbZ+L/3CChf8
 N4OJF2JbUKYC+EQ93hyNK/yjKTlqOE4ZujxtKjVuq+AyiQtbq4HU9mJtGD3hQtkWlLVDpQmhs6
 Jy6aLYwn7tGMcu8URxqjgPeBsO+yi970oBusAsNZ6DqVP/Mzh/5yla2pG+az5T0+FxcGz1GGDW
 xd09XOwUvGF+JnZ7qETjpE5Gy+vY6whVekEKNT83+U1LaxnaOfbGoydgPTdmiPWlNb/bObB7oY
 gmY=
X-SBRS: 5.1
X-MesageID: 42017027
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5vWkZ6EsrGgLMSGBpLqEDseALOonbusQ8zAX/mpaICY1TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFh7U5F7GkQQXgpS+UPJhvhLGSpAHINiXi+odmpM
 RdWodkDtmYNzdHpOLbxCX9LNo62tmA98mT9IPj5lNgVxtjZa0lzyoRMHf4LmRMSANLBYU0Gf
 Onj6ItzVfNRV0tYtmmHX5AZuDfprTw5evbSCQbDB0q4hTmt1OVwYP9eiL34j4uFxdGwbIv6g
 H+4mnE2pk=
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="42017027"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>, Tim Deegan
	<tim@xen.org>
Subject: [PATCH 0/7] xen: Switch to using -Og for debug builds
Date: Mon, 19 Apr 2021 15:01:25 +0100
Message-ID: <20210419140132.16909-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As with the toolstack side, we ought to use -Og for debug builds.

All fixes are trivial.  The first 3 are understandable, given reduced
optimisations.  The next 3 are, AFAICT, bogus diagnostics.

Andrew Cooper (7):
  xen/arm: Make make_cpus_node() compile at -Og
  x86/shim: Fix compilation at -Og
  x86/sysctl: Make arch_do_sysctl() compile at -Og
  x86/irq: Make create_irq() compile at -Og
  xen/efi: Make efi_start() compile at -Og
  x86/shadow: Make _shadow_prealloc() compile at -Og
  xen: Use -Og for debug builds when available

 xen/Makefile                    | 4 +++-
 xen/arch/arm/domain_build.c     | 2 +-
 xen/arch/x86/irq.c              | 2 +-
 xen/arch/x86/mm/shadow/common.c | 2 +-
 xen/arch/x86/pv/shim.c          | 6 +++---
 xen/arch/x86/sysctl.c           | 4 ++--
 xen/common/efi/boot.c           | 2 +-
 7 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.11.0


