Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D295589E26
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 17:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380520.614737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPP-0002et-Gx; Thu, 04 Aug 2022 15:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380520.614737; Thu, 04 Aug 2022 15:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPP-0002b1-By; Thu, 04 Aug 2022 15:05:11 +0000
Received: by outflank-mailman (input) for mailman id 380520;
 Thu, 04 Aug 2022 15:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMPZ=YI=citrix.com=prvs=2084bc4d8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oJcPN-0001pR-Tb
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 15:05:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d33b262a-1406-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 17:05:08 +0200 (CEST)
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
X-Inumbo-ID: d33b262a-1406-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659625508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o5iccEivDKlcTxNxatFjrVJPq9arILcmjVDpwc+JipU=;
  b=a/20Qmf25f7d4fi/46KEMWAiHhm3TJSgrPyEFtVXBWG0dGRcdVmEgmiG
   2n02f9RH61o5ggDlVG1U8yUHYLFdmNzVOjlZiKX/Pj2SnpYu0lFiZnyG/
   unnD/Rrim3W1ngD+7jMD6oxZ8L6Vc6Uwm09mPg09wCwNg6CguNyl0SOz0
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77150536
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xdS+qatmRQWq5MfCngdOfdptSufnVBleMUV32f8akzHdYApBsoF/q
 tZmKWGHPv2MZzT1fIp2YY3n9RgFvpfTyNJqTwdqri0zEioV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4G9A5TTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FdIe5txUWD11z
 8c/Bwsza0uy2/O9g4vuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEnUeDp94ue6sj332dTBwo1OJv6snpWPUyWSd1ZCyb4OIIoHRG625mG64/
 lj75Gv0UitZKeS+0gjb9CyFnurQyHaTtIU6S+Tjq68CbEeo7nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixWW4YdB0YNOccj+gZfgIvj
 W7VjtiqPGk62FGKck5x5ot4vBvrZ3VEcTdfPHJeJecWy4K9+d9u13ojWv4mSffo1YOtRFkc1
 hjQ9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3Dt4ade51tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQsh8qm3yqyXzIts4DNRCyKBBYq45lcLBO
 heP6Wu9GrcJVJdVUUOHS93oUJl7pUQRPd/kSurVfrJzX3SFTyfepXkGTRPBgAjQfL0Ey/5X1
 WGzLZnxVh73yM1PkFKLegvq+eBxl31mlDqDGPgWDX2PiNKjWZJccp9dWHPmUwzzxPnsTNn9m
 zqHC/a39g==
IronPort-HdrOrdr: A9a23:4Cwl8akCTBfjv9GLu8PVafokRX3pDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77150536"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH 0/4] xen/x86: import linkage.h and clean up x86/kexec.S and x86/entry.S
Date: Thu, 4 Aug 2022 16:04:20 +0100
Message-ID: <20220804150424.17584-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (4):
  x86/kexec: Add the '.L_' prefix to is_* and call_* labels
  xen: Port linkage.h from kernel code
  x86/entry: move .init.text section higher up in the code for
    readability
  x86: Use linkage.h helpers to add tags to symbols

 xen/arch/x86/x86_64/entry.S       | 124 +++++++++++-------
 xen/arch/x86/x86_64/kexec_reloc.S |  85 ++++++-------
 xen/include/xen/linkage.h         | 260 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 376 insertions(+), 93 deletions(-)
 create mode 100644 xen/include/xen/linkage.h

-- 
2.11.0


