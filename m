Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D4578C1F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 22:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370095.601730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhL-0007rc-Hf; Mon, 18 Jul 2022 20:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370095.601730; Mon, 18 Jul 2022 20:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhL-0007oV-ES; Mon, 18 Jul 2022 20:50:35 +0000
Received: by outflank-mailman (input) for mailman id 370095;
 Mon, 18 Jul 2022 20:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDXhK-0007oP-QY
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 20:50:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42149ae2-06db-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 22:50:31 +0200 (CEST)
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
X-Inumbo-ID: 42149ae2-06db-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658177431;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T7kJeaP2bv2ixVwBzfYJaiBnw9YXwCrF8wG9VPOu/xU=;
  b=LcZV69kvdHepOJq62033kahyoPEdk7w5SrKBG2DNYtuhdR+iN1MqayuZ
   kFwxFG1yAlT73QNLwtQwV1f7FDPECAN8MbmElNfJrSpILZLBZxTW3XS2F
   6/XXs1GZWt9NwAL0nslBMIjRFS60nuHvJGc/UR801c3FINO1ObBLqStwn
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76506563
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Gtsw/6+QlY3bGFIunzsFDrUD936TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GAaWmuPb/aMZDb0Kt53a4q+8RkPsJXQndJnHlFqpSk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gVaYDkpOs/jZ8Ew27Kyo0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGJ38vbJQz38ZODUJir
 6ZFERwJfjXemLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoShtDIFoITrk5m/+lnCLXeDxEslOF46Ew5gA/ySQujuW1boeLIbRmQ+1soHqor
 ECa+l3FOTU7NfyG2z2PyXWF07qncSTTB9tJSezQGuRRqEKX7nweDlsRT1TTiduTh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVmj7+aNhhaSACQ2ATVYOBYoSRsgvsa29enfkSnzosZf/L+d14OoRmCok
 mHW9kDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK514BvcECZCrzPf8tC25UNyjM5fK4fTgCfqmOBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZynkgWmDKMLa0XOjz9jtJyklbJFupeWLZPB8hlhJ65TPL9q
 YYGa5TTlEgFAIUToED/qOYuELzDFlBjbbieliCdXrTrztZOcI35N8Ls/A==
IronPort-HdrOrdr: A9a23:QDPI5q4nYvj8Nsc5pgPXwXOBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qADnhOJICOgqTPqftWzd1ldAQ7sSlLcKrweQeBEWs9Qtr5
 uIEJIOROEYb2IK9foSiTPQe71Lobm6GeKT9JzjJh9WPEdXgspbnmNE43OgYytLrX59dP0E/f
 Snl6h6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKXCSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8xPT9aw+cyzpAVr4RGIFqjwpF4t1HL2xa1e
 Ukli1Qf/ibLUmhOl1d7yGdnDUImwxelEMKgWXo/0cL5/aJHQ7SQvAx9b6wfnbimjsdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwI/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFnxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiIuiYfzQTObNSSj5uw4zvmWehTPYd3E8LAq26RE
X-IronPort-AV: E=Sophos;i="5.92,282,1650945600"; 
   d="scan'208";a="76506563"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] XSA-407 followon fixes
Date: Mon, 18 Jul 2022 21:50:06 +0100
Message-ID: <20220718205009.3557-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes accumulated during XSA-407 which weren't security worthy in and of
themselves.

Andrew Cooper (3):
  x86/spec-ctrl: Consistently halt speculation using int3
  x86/spec-ctrl: Make svm_vmexit_spec_ctrl conditional
  x86/spec-ctrl: Shrink further entry paths due to %rdx being 0

 xen/arch/x86/hvm/svm/entry.S             | 10 +++++-----
 xen/arch/x86/hvm/vmx/entry.S             |  4 +---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 14 ++++----------
 xen/arch/x86/indirect-thunk.S            |  6 ++----
 4 files changed, 12 insertions(+), 22 deletions(-)

-- 
2.11.0


