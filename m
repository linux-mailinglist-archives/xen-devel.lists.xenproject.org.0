Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CA37A3A3
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 11:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125660.236508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgc-0003J3-Ro; Tue, 11 May 2021 09:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125660.236508; Tue, 11 May 2021 09:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgc-0003Es-MU; Tue, 11 May 2021 09:28:18 +0000
Received: by outflank-mailman (input) for mailman id 125660;
 Tue, 11 May 2021 09:28:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOga-0003CR-Rx
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8be17c6-3df0-41f8-b820-c3ba412f30a1;
 Tue, 11 May 2021 09:28:14 +0000 (UTC)
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
X-Inumbo-ID: f8be17c6-3df0-41f8-b820-c3ba412f30a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725294;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ig18it7r326gV2XAUVuedZDlWR+ZhbMI7srkYdlqQWk=;
  b=C0tU7UnRHJDhUeMDGv5DSymZIkN69qjXx4+jOUopufA3H/gcx2SgsiAh
   e6wOTE7w+Ph5/3oTDbpN5IjBVaiwMEertn6NnH8rX6lSdg3cxpnb4LDqM
   yLMQqhMLLb+y4n4tTZ/+c1bJlKRwaOoR5fc8qqeoiMGPjjZU58lOE66Iu
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FKZMmZTfuOHzCSOphczn+T+cD8ZzpmOGjfvJtrlD4OdnQSgVio+HHTdMIIP1FeN+yCwNLiiECJ
 Fyab+38y9gvxkZ6PAu44w/1heJM9dTTRcFKqUy8IEJpiqf40qTgkmd+jVAqSILpwogCyGxsYQQ
 6LbUNo4JgOvOAAQiKXBs87T0ilfVKot1xygXGD3N3pvGKuwU51FRcHvQi9TcoOfU+JWXDi25lG
 u7sXGgWrQKDRW3TQ3j0/Ecm2HogfT9bR6dY9HitdrEnb3dFx6i2t2bI/OcY+Lb/PJCcHZtKTvw
 L/Q=
X-SBRS: 5.1
X-MesageID: 43902497
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FxMQt68r8nyF5+MpT1Zuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+MjztCWE7gr5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslrd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="43902497"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 0/8] Fix libxl with QEMU 6.0 + remove some more deprecated usages.
Date: Tue, 11 May 2021 10:28:02 +0100
Message-ID: <20210511092810.13759-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.deprecated-qemu-qmp-and-cmd-v2

v2:
- fix coding style in patch 3
- all reviewed

The Xen 4.15 release that went out just before QEMU 6.0 won't be compaptible
with the latter. This patch series fixes libxl to replace use of QMP commands
that have been removed from QEMU and to fix usage of deprecated command and
parameters that well be remove from QEMU in the future.

All of the series should be backported to at least Xen 4.15 or it won't be
possible to migrate, hotplug cpu or change cdrom on HVM guest when QEMU 6.0 and
newer is used. QEMU 6.0 is about to be release, within a week.

Backport: 4.15

Anthony PERARD (8):
  libxl: Replace deprecated QMP command by "query-cpus-fast"
  libxl: Replace QEMU's command line short-form boolean option
  libxl: Replace deprecated "cpu-add" QMP command by "device_add"
  libxl: Use -device for cd-rom drives
  libxl: Assert qmp_ev's state in qmp_ev_qemu_compare_version
  libxl: Export libxl__qmp_ev_qemu_compare_version
  libxl: Use `id` with the "eject" QMP command
  libxl: Replace QMP command "change" by "blockdev-change-media"

 tools/libs/light/libxl_disk.c     |  67 +++++++++--
 tools/libs/light/libxl_dm.c       |  30 +++--
 tools/libs/light/libxl_domain.c   | 192 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |   8 ++
 tools/libs/light/libxl_qmp.c      |   6 +-
 5 files changed, 272 insertions(+), 31 deletions(-)

-- 
Anthony PERARD


