Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE17E59FF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 16:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629319.981463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kT8-0002LB-Gj; Wed, 08 Nov 2023 15:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629319.981463; Wed, 08 Nov 2023 15:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kT8-0002HY-Cs; Wed, 08 Nov 2023 15:27:50 +0000
Received: by outflank-mailman (input) for mailman id 629319;
 Wed, 08 Nov 2023 15:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L2E1=GV=citrix.com=prvs=669c226bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r0kT6-0001ly-Ug
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 15:27:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f24f926-7e4b-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 16:27:48 +0100 (CET)
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
X-Inumbo-ID: 5f24f926-7e4b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1699457268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7iglAxJ1pea3nVzftE4nEQ94KmXbS9vQNc+FWozJ1fM=;
  b=QryPlWhFEyCwmMwpQp1maqXmOPz1m6aZ1lAC+iWWq5faeo0B05OgjhIo
   pzhuxYfqagMYvg6kWT1Di4e6Une2yEfKGwr00Hk7h+GWt6bcSGk8xyoiI
   1p7TfbQSwpHEYRPRUJvMOJGnZInXznZ8leksAWBR3mHgj3tZv5NOCCYEP
   0=;
X-CSE-ConnectionGUID: O7ec57rRToercaUqjXa8Kg==
X-CSE-MsgGUID: 9bHeHTWHR0mgSc+U9LIEXQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127132505
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:kFSvdKCehBEF9BVW//njw5YqxClBgxIJ4kV8jS/XYbTApDpw3mdVy
 TYaXWyHOPyMYTH1eIh/bYi08UJTsJKDz94yQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WpA7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3bl6CjwR7
 8YkLz0XZRm+nuCGyeKYRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdIL2U3BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKMIIPTHp8IxhvwS
 mTurm7ZDzEmC/ylkT+KyXnvu77rvA7LYddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiFyuswMYWtFQO/Yn8wzLwa3Riy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLpJw4h1TBR9BoHaqxk/X8AzS2y
 DePxAAeirMJnIg03qO01VndhnSnoZ2hc+IuzlyJBCT/tFo/PdP0IdPwgbTG0RpeBKHGQ1Lc4
 2I+p8+T9usHMIiPpCXdY+pYSdlF+M253C3gbU9HRsdwpmj0pib/LOi88xkkeh01bJxslSvBJ
 R+L410Mvve/KVPzNfcvC79dHfjG2kQJ+T7NfffOZ94GWYBrdQmI50mCjmbLhDiyySDAfUwlU
 Kp3kPpA7l5AUsyLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQP7FivPnc8FqIq
 Yk32y62J/J3CbKWX8Uq2ddOdg5iwYYTXvgaVPC7hsbce1E7SQnN+tfawK87epwNokimvr6gw
 51JYWcBkACXrSSeeW23hoVLNOuHsWBX8ShqYkTB/D+AhxAeXGpYxP5FKMJpJOd4qbcLIDwdZ
 6BtRvhsy89nElzvkwnxp7GkxGC+XHxHXT6zAhc=
IronPort-HdrOrdr: A9a23:WUTDb6yfMZu241kcLPcgKrPxMegkLtp133Aq2lEZdPULSKClfp
 GV8cjziyWftN9IYgBYpTnyAtj5fZq8z+893WB1B9zMYOCIghrMEGgP1+XfKnjbakvDH41mpO
 9dmspFebnN5DFB5K7HCUuDYrEdKbG8geSVbIzlr0uFODsaCZ2ImD0JaTpzfHcWeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeod8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4KIuZj1kIMQjgY1q3M0iFXBuYdc99eXBmcMa+d
 xVfY/hDTBtABGnhj7izyxSKZeXLw8O91+9MzI/U4WuokRrdHwV9Tpk+OUP2ngH754zUJ9C+q
 DNNblpjqhHSosMYbt6H/ppe7rCNoXhe2O/DIupGyWTKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFFdVr3Q7dU7iAdCHmMQjyGG6fEytGTD2js1O7ZlwvbPxALLtLC2YUVgr18+tue8WDMHXU+
 u6fJhWH/jgJ23zHpsh5XyIZ7BCbX0FFMEFsNcyXFyD5srNN43xr+TeNO3eIbL8eAxUKV8Xwk
 FzLAQbCP8wn3xDAEWI/yQ5c0mdBHDCwQ==
X-Talos-CUID: 9a23:RaCBO2zecgIcOofy5hP6BgUzRc0uLyLH9kvXLlWzAFtwSo2cGXyfrfY=
X-Talos-MUID: 9a23:2cHz8wVF31nbc/Hq/G7mpDxCCPhI2fyrB3sG0qhXn+ipBRUlbg==
X-IronPort-AV: E=Sophos;i="6.03,286,1694750400"; 
   d="scan'208";a="127132505"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH for-4.18 2/3] docs/sphinx: Fix syntax issues in exclude-list.rst
Date: Wed, 8 Nov 2023 15:27:26 +0000
Message-ID: <20231108152727.58764-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231108152727.58764-1-andrew.cooper3@citrix.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

sphinx-build reports:

  docs/misra/exclude-list.rst:47: WARNING: Unexpected indentation.
  docs/misra/exclude-list.rst:50: WARNING: Inline emphasis start-string without end-string.

Nested lists require newlines as delimiters, and * either needs escaping, or
put in a literal block.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Luca Fancellu <luca.fancellu@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 docs/misra/exclude-list.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/misra/exclude-list.rst b/docs/misra/exclude-list.rst
index 42dbceb82523..a63b128c3d27 100644
--- a/docs/misra/exclude-list.rst
+++ b/docs/misra/exclude-list.rst
@@ -44,10 +44,11 @@ Here is an explanation of the fields inside an object of the "content" array:
    their results. This field is optional and when not specified, it means every
    checker will use that entry.
    Current implemented values for this field are:
+
     - xen-analysis: the xen-analysis.py script exclude this entry for both MISRA
       and static analysis scan. (Implemented only for Cppcheck tool)
 
 To ease the review and the modifications of the entries, they shall be listed in
 alphabetical order referring to the rel_path field.
-Excluded folder paths shall end with '/*' in order to match everything on that
+Excluded folder paths shall end with ``/*`` in order to match everything on that
 folder.
-- 
2.30.2


