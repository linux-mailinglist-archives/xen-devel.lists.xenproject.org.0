Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9EF560989
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 20:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358035.586992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6cgy-0000pR-LB; Wed, 29 Jun 2022 18:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358035.586992; Wed, 29 Jun 2022 18:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6cgy-0000mR-I2; Wed, 29 Jun 2022 18:45:36 +0000
Received: by outflank-mailman (input) for mailman id 358035;
 Wed, 29 Jun 2022 18:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6b1=XE=citrix.com=prvs=172711fe8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o6cgx-0000mL-4o
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 18:45:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a67b003b-f7db-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 20:45:32 +0200 (CEST)
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
X-Inumbo-ID: a67b003b-f7db-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656528332;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bZC+c6jVkNdg+OpYTgJbDfKY8xiUZ80gFTUBVJE8k2k=;
  b=Ly5XpRfng0n66PWXCyEhXjX/1qk/P42S5aGYXA99vKU6r8SeX+xRS9Oh
   q/IZAN8STrrpknkz3tg914fjd1Al7SIr9hXMO6OFUOpbaLCV3+QlrHC4q
   kH+VZf+3MO2URL++XsWkUfHcywOiQH8AsFxcEBH6hN5jG+5PzVOV2dgjg
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75147939
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aV4cM64vL0qxqgbHoopU/AxRtGbHchMFZxGqfqrLsTDasY5as4F+v
 jMaDGjSaf2KZjP0eYxyYdy/p0gF7JHVz9BnGgturys1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjUlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSzbC0iebPql94RaENXPC9mIoJru7/+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5VEMGYwPU+RC/FJEmc5S4o4zOOCv3XcLgAIhmm8iKAr0lGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS6ySnwe3KxQmjClNeQRFPcMMJmYw2fGl/v
 rOWpO8FFQCDoZXMFy/Dq+7F8W/rUcQGBTRcPHFZFGPp9/Gm+dhu1UyXE76PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vh6b/PuREEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3uqjZbGSF3wU/QsVJG9GRF5iLJNE4DNZWdC9U3jssI2e1M
 Cc/RysLjHOsAJdaRfAuON/gYyjb5aPhCc7kRpjpUza6WbAoLFXv1Hg3PSa4hjmx+GBxwPpXE
 crKLq6R4YMyVP0PIMyeHL9Nj9fGB0kWmAvueHwM50/9gebPNCLNFOxt3ZnnRrlR0Z5oaT79q
 753X/ZmAT0GCYUSvgG/HVYvEG03
IronPort-HdrOrdr: A9a23:TbCeuaOch5W53sBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="75147939"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] x86/spec-ctrl: Minor fixes
Date: Wed, 29 Jun 2022 19:45:06 +0100
Message-ID: <20220629184508.15956-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch 2 has been posted before, but ages ago and has been rebased over
subseqent XSAs.  Patch 1 is new.

Andrew Cooper (2):
  x86/spec-ctrl: Only adjust MSR_SPEC_CTRL for idle with legacy IBRS
  x86/spec-ctrl: Knobs for STIBP and PSFD, and follow hardware STIBP hint

 docs/misc/xen-command-line.pandoc      | 21 +++++++---
 xen/arch/x86/hvm/svm/vmcb.c            |  9 ++++
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 xen/arch/x86/include/asm/spec_ctrl.h   |  5 ++-
 xen/arch/x86/spec_ctrl.c               | 75 +++++++++++++++++++++++++++++-----
 5 files changed, 93 insertions(+), 19 deletions(-)

-- 
2.11.0


