Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364434B50CF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271581.466090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauY-00028b-Pz; Mon, 14 Feb 2022 12:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271581.466090; Mon, 14 Feb 2022 12:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauY-00024F-IN; Mon, 14 Feb 2022 12:56:58 +0000
Received: by outflank-mailman (input) for mailman id 271581;
 Mon, 14 Feb 2022 12:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJauW-0001Wb-TF
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:56:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94ef0e1e-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:53 +0100 (CET)
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
X-Inumbo-ID: 94ef0e1e-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KtRbcAVnwSg90xFfImO++msF+yEET8LbZ8bFNj96oow=;
  b=XnpxBPus1N/rk/ODoaX71cZCNOvJYiSeGfpRmfGirqw3Lvp7yZWxT2P0
   KREbQNt9ZKeOccuzybgjQmPsvi/eQmMXEg+8ANT1c9O/4USO7ogfPlXqM
   JpSo/q8d2QpB2jsEqAgr45kG6uPwM4Wc4QaqbX/9OALVvLcwSG4OAZd2y
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dKn9DAspMXze6wdPTIGSTGLdIP4NAM7WUYNbmq8tRPm+h4w8jbiRpI7BSzM8c7NvOaxd1400wo
 r9t/Xfqym7h/0UNTRS7V9JKhxdOlGHY8Vv0M0xFnj4/fYoTcntRDCTkzP09Gu/fuEbkV9H8Riu
 nlxASVxCFzgIWqNCkE1fobiNpN1jvnFB7hk333c2k5ZFR838NNm76lehM10U3fwzudlbnzDkt2
 HlZx0tN1U094bXNMvuolH2z5ramWfdwat2pV+MaNKWhoOZzwQk5B8QQX0qEtikCZUKpnHQXkkr
 lSHNd/bccUIHvYCcYLqmykhw
X-SBRS: 5.1
X-MesageID: 63591331
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E39jq6zvnrYqYvO/ibd6t+cLwSrEfRIJ4+MujC+fZmUNrF6WrkVSz
 GsfWD/VPfuMZTahLo0naI7n/EMEvJbczIU1SFNu/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9wy6
 tZ2tsKAc14sMaTzoMARUgl5CS4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JsTTK+FP
 JNxhTxHPD/LQRBmAlUsLZ8Gmvj3iWL8IjkftwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYQGPhTKO5k2DvUz6Xd3D69CmkUbyROPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP/D2BLwQKChRqlEGp+ZgPf1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyL8LdANvWknfx0B3iM4ldjBO
 hG7hO+szMULYCvCgVFfP+pd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/lmLr
 YYFapfiJtc2eLSWXxQ7OLU7dTgiRUXXz7iswyCOXuLccAdgBk87DPrdneEod4B/xvwHnebU5
 HCtHERfzQOn13HALAyLbFFlaa/uAskj/S5qY3R0MAb6wWUnbKau8LwbK8k9c444+bEx1vVzV
 fQEJZmNW6wdVjTd9j0BRpDht4g+Jg+zjAeDMnP9MjgydpJtXSLT/drgcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQKIRfi6olnLSD1n8QbGcBUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcD2BBmP5/KKuO
 bdcw/3maaBVmV9Lt8x3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0La7yGNfTsHEMVOAd4PP+I0usZm2WK4Pk4SKkgCPSbIFZTvZ1uAiSx
IronPort-HdrOrdr: A9a23:mJT8lKAKX1KZImnlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63591331"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/7] xen/altcall: Use __ro_after_init now that it exists
Date: Mon, 14 Feb 2022 12:56:26 +0000
Message-ID: <20220214125632.24563-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For the !CONFIG_ALTERNATIVE_CALL case, the use of __read_mostly was only a
stopgap while nothing better existed.  __ro_after_init now does, so it use.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/include/xen/alternative-call.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
index c2d3b70e312e..5c6b9a562b92 100644
--- a/xen/include/xen/alternative-call.h
+++ b/xen/include/xen/alternative-call.h
@@ -57,7 +57,7 @@
 #define alternative_call(func, args...)  (func)(args)
 #define alternative_vcall(func, args...) (func)(args)
 
-#define __alt_call_maybe_initdata __read_mostly
+#define __alt_call_maybe_initdata __ro_after_init
 
 #endif /* !CONFIG_ALTERNATIVE_CALL */
 #endif /* XEN_ALTERNATIVE_CALL */
-- 
2.11.0


