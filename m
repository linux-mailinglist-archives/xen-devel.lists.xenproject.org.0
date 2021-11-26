Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171945EECE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232895.404192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxo-0006NW-3G; Fri, 26 Nov 2021 13:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232895.404192; Fri, 26 Nov 2021 13:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxm-0005xb-7h; Fri, 26 Nov 2021 13:08:26 +0000
Received: by outflank-mailman (input) for mailman id 232895;
 Fri, 26 Nov 2021 13:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaus-0003W9-CN
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 827943f7-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:22 +0100 (CET)
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
X-Inumbo-ID: 827943f7-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aOPxwPbEuVDUU/7ny7Nc1lwWXehixxmxhczRU20X228=;
  b=Ug80rd4/6m+cIaw8wNVjx9jC3dRfaZt117E/zbmysFdBbtIvquKSEF/+
   qxnpN/alAGt8DO4TLHHBTBXH3WXWrkPajeLGJPDY9uSex3z6P5a8lYRR9
   qgvZN+p1Ruw17J/BMDkx5RD11zuwovWLYpraJypg3oTILkpXfNAKNXZfx
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RaBzP1Ct+zqp3D/WYQ0bOnB5QQhIOC7By7f4KKyDcfUSo2Yu2CggadFQgyQJk5CWxt6/5VAWP5
 dcHqInpTGrQtHna6pX3RCzMySR4P/YeA0ebFH3ng48Ny+ScNdjI+RCoQpiKsZ0fafcP3Kx617j
 Lxeww12q4BHUnsm9YxUU/8GMSe1hClBvQEVrxUbCu0sqI0qVMpKZj9S1u+Q9dJwxA9wowILsr7
 pV0HiIDK8wGf6yjNScDc36NMDZb+Vj8blQ3GIaM2VF3jCfPp3iqTkKVSQj+UwRwrU461fYKTVf
 L05KaVzOyYWJp0g70nBMaFP0
X-SBRS: 5.1
X-MesageID: 58676375
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N0Q8vauAjCvmykCQGoLdzBzKKOfnVJtZMUV32f8akzHdYApBsoF/q
 tZmKT2GO/iOMTejc9h3bYWw8hhT7J+Bz4JlSQRq/ioxRn4V+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7ZngYhU0M5H1psc0cwZ/PwR9OPwW9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5RGN2EwMXwsZTVWZGdLJa43xd6xpWmvVjxB+Wy4p5YOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO7U/uCqf16fo2ji6L0gbaRJka9l35MBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:48fDrqs5ylNCdbSiW0K5HrmY7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676375"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 56/65] x86: Use control flow typechecking where possible
Date: Fri, 26 Nov 2021 12:34:37 +0000
Message-ID: <20211126123446.32324-57-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

RFC.  This is still an experimental compiler extention
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102953

However, it is also the entire basis of being able to sanely use
-mmanual-endbr in the first place, so is very important.
---
 xen/arch/x86/arch.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 1c8381f7c9d8..429a9ea00f92 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -48,6 +48,7 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
 ifdef CONFIG_HAS_CC_CET_IBT
 CFLAGS += -fcf-protection=branch -mmanual-endbr
+$(call cc-option-add,CFLAGS,CC,-fcf-check-attribute=no)
 else
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
 endif
-- 
2.11.0


