Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEC746A248
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239478.415203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSl-0001Lm-9E; Mon, 06 Dec 2021 17:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239478.415203; Mon, 06 Dec 2021 17:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSk-00015v-Sa; Mon, 06 Dec 2021 17:07:38 +0000
Received: by outflank-mailman (input) for mailman id 239478;
 Mon, 06 Dec 2021 17:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPq-0005ti-Ks
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9735eac8-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:37 +0100 (CET)
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
X-Inumbo-ID: 9735eac8-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V6q43yBVZCXzj8p3r41jU3G4+oX+b+ENWb++VEuZ+aU=;
  b=FMwMRMQdElWlrMQNn7SmLn9RRX08mqbAFdYPyFkhBuZr1BdEA6WFAliz
   0LdRcXPA21PRJ3niQmnSSDvY1+hj+deeDVatozF/rwcYusHjUTXeoSlFP
   6lbSWk2ytQTM4PtGOWn4BViROTiKq62b6WIwNkKDs1jeCA3ni6rTyN2Cb
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3WMfjEkaPwGHAycu7VCXq3LyrKnRM1dLtKl1FM/AuvZ8zQmJ+6Qs5coSO8fm2xX4e4kA10ZkB9
 OmEe5yFOwNwR5mZCsWfg3I/imuaCaeyolTc6sezXRW/i3Jt5JPjaVDdZ/yqO+nMQAff7/X3WBt
 LQxbn3bGhQJiQP56F1oB1QuyrztdTdgrvaHSpWJYNmIh7MrY6foU8rEuIQIcaSuxIoSNZ0OWCf
 tz4Qq8FOzMokEMObF7nIK9d1gsNNcvO8a6vlVjMz8mrfU5iI6vk4ICVbYmVxTZET7qTdqWj9sR
 p66nHAxpYvimm0OZhKUsLcg8
X-SBRS: 5.1
X-MesageID: 58884528
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IvAgGa+RDRV3dB+CeF4XDrUDG3mTJUtcMsCJ2f8bNWPcYEJGY0x3z
 GJLCjuEaPjZZTHxKNgnbNvj9ksEvMKBm981HlNs/CE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhhx
 ZIXl6WbdzwvL7ORnuAjQgEBTg9HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0eTaaCO
 pBJAdZpRAnFMkweIlMVNLU7hvemlFn6SD9XtGvA8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3uFuqE2ewCoUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmECUj5Gbs1grMIsTCYm/
 lCMltLtQzdotdW9SG2f3qeZqyuoPioYJnNEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RiaoW9kpYw4s/UNxrvm+1T5kir1+7bwG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxZHAsblm4YWl0XXUHb5TRO3BC+OtaWWE2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarsUqzGLoC6TLwJs8w4iPIUOPCdkyfdo0lTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHtumjmCGMqhkUv3uVZ7WJJzYe1fWLdpRrpmhJ5oXS2Pq
 4oPXyd040s3vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtNv0SI9cFzN/8T5mOt7E6Q8xvw9vr6Ro
 hmVBx8JoHKi1CavAVjbNRhehEbHAM8XQYQTZnd3Yz5FGhELPO6S0UvoX8dtIOR8qrU8laUco
 jtsU5zoP8mjgw/vo1w1BaQRZqQ+HPhyrQ7RbSejfhYleJtsG17A9tP+J1O9/ygSFCun88A5p
 uT4hA/cRJMCQSVkDdrXN63znw/g4yBFlbIgRVbML/lSZF7orNpgJRvug6JlOMoLMxjCmGeXj
 l7EHRcCqODRiIYp692V17ucpoKkHrImTEpXFmXW95isMize8jbxyINMSr/QLzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IDl1ZqBnTGaVivG4hMGHje0JkdrLBJy59YpRCyB
 hCF9O5FNOjbI8jiClMQelYoN7zRyfEOlzDOxv0pO0GmtjRv9b+KXEgObRmBjCtRcOl8PI8/m
 LpzvccX70q0iwYwM8bAhSdRrjzeInsFWqQhl5cbHI601VZ7lgAcOcTRWn3s/ZWCS9RQKU17c
 DabiZ3Li6lY2kefIWE4EmLA3LYFiJkD0PyQIITu+7hddgL5u8IK
IronPort-HdrOrdr: A9a23:ycY4K6CqxUfGaX3lHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8v
 xG/c5rsiMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAH0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884528"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 51/57] .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
Date: Mon, 6 Dec 2021 17:02:34 +0000
Message-ID: <20211206170241.13165-52-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitignore | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/.gitignore b/.gitignore
index 8fb74a4c94..d494d1125a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -105,26 +105,10 @@ tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
-tools/libs/toolcore/headers.chk
-tools/libs/toolcore/xentoolcore.pc
-tools/libs/toollog/headers.chk
-tools/libs/toollog/xentoollog.pc
-tools/libs/evtchn/headers.chk
-tools/libs/evtchn/xenevtchn.pc
-tools/libs/gnttab/headers.chk
-tools/libs/gnttab/xengnttab.pc
-tools/libs/hypfs/headers.chk
-tools/libs/hypfs/xenhypfs.pc
-tools/libs/call/headers.chk
-tools/libs/call/xencall.pc
+tools/libs/*/headers.chk
+tools/libs/*/*.pc
 tools/libs/ctrl/libxenctrl.map
-tools/libs/ctrl/xencontrol.pc
-tools/libs/foreignmemory/headers.chk
-tools/libs/foreignmemory/xenforeignmemory.pc
-tools/libs/devicemodel/headers.chk
-tools/libs/devicemodel/xendevicemodel.pc
 tools/libs/guest/libxenguest.map
-tools/libs/guest/xenguest.pc
 tools/libs/guest/xc_bitops.h
 tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
@@ -144,21 +128,13 @@ tools/libs/light/testidl.c
 tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
-tools/libs/light/xenlight.pc
-tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
-tools/libs/stat/xenstat.pc
-tools/libs/store/headers.chk
 tools/libs/store/list.h
 tools/libs/store/utils.h
-tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
-tools/libs/util/*.pc
 tools/libs/util/libxlu_cfg_y.output
 tools/libs/util/libxenutil.map
-tools/libs/vchan/headers.chk
 tools/libs/vchan/libxenvchan.map
-tools/libs/vchan/xenvchan.pc
 tools/console/client/xenconsole
 tools/console/daemon/xenconsoled
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
-- 
Anthony PERARD


