Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D74BD8E5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275959.471979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XO-0000iP-G4; Mon, 21 Feb 2022 10:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275959.471979; Mon, 21 Feb 2022 10:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XO-0000ej-CT; Mon, 21 Feb 2022 10:03:22 +0000
Received: by outflank-mailman (input) for mailman id 275959;
 Mon, 21 Feb 2022 10:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nM5XN-00008I-D3
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:03:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f0fbc45-92fd-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 11:03:20 +0100 (CET)
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
X-Inumbo-ID: 7f0fbc45-92fd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645437800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HSRz95RA0iD9ZY3bHdVhf3Vb2e+MAy95oW5EbGSBx8c=;
  b=Je6+j5Ch6fDHjp6yEaQ9FU0q6pEn8PrlrSVsx7KlladOU5P93Cs/PWkO
   5BFE4CRiRq+/ui5XiOOCy7Hf1UYAAwdcpewY6AOprbngNWnWfcRP9TjO9
   MSsf8P0d0W4S4oBTKSd1GgPPXFOzVsxNfzmsyjOTxMj9/zYrAcow85hMV
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66881348
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FEE52Km5bvvTRA36iZaizR/o5gzRJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWmyPPfqJYGD0eI10OY60oEsBsMOBx4RlTFBtqS03FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWVrV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVDooHKLSxMgnVUcbMBBEL/VA+qebLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHN2o/NU+cM3WjPH9IItUBvNn3rUKmUBdktnu0rK4n8zfcmVkZPL/Fb4OOJ43iqd9utlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WFGuVC2QPJgDZJUVtPCAX98aLRZlOCt8x3N
 nEV2CUw8YQI8hLobejHTUW+ombYsUtJMzZPKNES5AaIw6vSxg+WAGkYUzJMAOAbWN8KqS8Cj
 QHQwY6wbdB7mPjMEC/GqO/Ixd+nEXVNdQc/iTk4oRzpCjUJiKU6lVrxQ9lqC8ZZZfWlSGirk
 1hmQMXT7oj/bPLnNY3mpzgrYBr2//AlqzLZAS2NAwqYAvtRPtLNWmBRwQGzAQx8BIiYVEKdm
 3MPhtKT6usDZbnUynDQG7VRTez4uqzUWNE5vbKIN8N8nwlBBlb5JdwAiN2ADBwB3jk4lc/BP
 xaI5FI5CG57N3q2d65nC79d+OxxpZUM4e/ND6iOBvIXO8AZXFbeoElGOB7Bt0iwwRNEufxuZ
 v+mnTOEUC9y5VJPl2HtGY/wENYDm0gD+I8kbcqll0/+ieLGPhZ4i94taTOzUwzw14vcyC29z
 jqVH5fiJ8l3OAEmXhTqzA==
IronPort-HdrOrdr: A9a23:58ab3KOioY/PzMBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="66881348"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] tests/resource: Initialise gnttab before xenforeignmemory_map_resource()
Date: Mon, 21 Feb 2022 10:02:52 +0000
Message-ID: <20220221100254.13661-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220221100254.13661-1-andrew.cooper3@citrix.com>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It the 'addr' input to mmap(), and currently consuming stack rubble.

Coverity-ID: 1500115
Fixes: c7a7f14b9299 ("tests/resource: Extend to check that the grant frames are mapped correctly")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/resource/test-resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 0557f8a1b585..189353ebcb43 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -24,7 +24,7 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
                         unsigned long gfn)
 {
     xenforeignmemory_resource_handle *res;
-    grant_entry_v1_t *gnttab;
+    grant_entry_v1_t *gnttab = NULL;
     size_t size;
     int rc;
     uint32_t refs[nr_frames], domids[nr_frames];
-- 
2.11.0


