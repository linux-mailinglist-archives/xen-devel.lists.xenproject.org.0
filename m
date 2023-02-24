Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF06A1D0C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 14:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501053.772649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVYFu-0004t2-K8; Fri, 24 Feb 2023 13:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501053.772649; Fri, 24 Feb 2023 13:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVYFu-0004q7-GX; Fri, 24 Feb 2023 13:36:58 +0000
Received: by outflank-mailman (input) for mailman id 501053;
 Fri, 24 Feb 2023 13:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iPiP=6U=citrix.com=prvs=412d30f06=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1pVYFt-0004am-BQ
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 13:36:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bae5d63-b448-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 14:36:54 +0100 (CET)
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
X-Inumbo-ID: 4bae5d63-b448-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677245814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cm/Hn5vaptcJiAlYcN7JDgSNF6QhhER+noAm3OqySF4=;
  b=IMgs2QUuKVdxmH1iFHcAMfSs8mW1kNY2QCsbv0hK28/PVa6iIYMTBjXT
   5jXZvq0b+bb9CR5fxNu6KHHMbytv0kK3lTk1jnIQSrKZEKW3O2Cj+mpVU
   go/ogHYAhgniZ3RtgyekxkU9ue2aAw+TvPyVr6cd4fA4qnC7ayezmifDT
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98321074
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:QWrHOap7bfrWqmO513hF/xN5al5eBmIQZRIvgKrLsJaIsI4StFCzt
 garIBmGbvyCY2TzKoh0OYzkoR8Pv5LTydBjTAZupC8zHn5DpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADYhVC6IurOt+4+mbsdwjJx/cNHyE7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVVpEyUo+wr5HLUzyR60aT3McqTcduPLSlQthfI/
 Tifpzulav0cHIKekySMtVvvuvHOkQ/1AdsXObLlpsc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bCXIDVSVpc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cESRU6RjZU+OLevaUdkhiXEop7CYGM24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ904DNJWfh0B3iM4ldjBM
 SfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlDYpX4xPxHNjjC8+KTJrU3YE
 c3GGftA8F5AUfg3pNZIb7p1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbaeFI+Rzt+Vq6BqV7jEqQ895loei7z1
 inVcidlJJDX3BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:uWYXOKCjBLEML3blHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-IronPort-AV: E=Sophos;i="5.97,324,1669093200"; 
   d="scan'208";a="98321074"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v1 1/2] xc_core_arch_map_p2m_tree_rw: fix memory leak
Date: Fri, 24 Feb 2023 13:36:45 +0000
Message-ID: <c721e627bc74047c0c5e55c0aeae7d72bbc3ce0e.1677245356.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677245356.git.edwin.torok@cloud.com>
References: <cover.1677245356.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

Prior to bd7a29c3d0 'out' would've always been executed and memory
freed, but that commit changed it such that it returns early and leaks.

Found using gcc 12.2.1 `-fanalyzer`:
```
xg_core_x86.c: In function ‘xc_core_arch_map_p2m_tree_rw’:
xg_core_x86.c:300:5: error: leak of ‘p2m_frame_list_list’ [CWE-401] [-Werror=analyzer-malloc-leak]
  300 |     return p2m_frame_list;
      |     ^~~~~~
  ‘xc_core_arch_map_p2m_writable’: events 1-2
    |
    |  378 | xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
    |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |      | |
    |      | (1) entry to ‘xc_core_arch_map_p2m_writable’
    |......
    |  381 |     return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 1);
    |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |      |            |
    |      |            (2) calling ‘xc_core_arch_map_p2m_rw’ from ‘xc_core_arch_map_p2m_writable’
    |
    +--> ‘xc_core_arch_map_p2m_rw’: events 3-10
           |
           |  319 | xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
           |      | ^~~~~~~~~~~~~~~~~~~~~~~
           |      | |
           |      | (3) entry to ‘xc_core_arch_map_p2m_rw’
           |......
           |  328 |     if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
           |      |        ~
           |      |        |
           |      |        (4) following ‘false’ branch...
           |......
           |  334 |     if ( dinfo->p2m_size < info->nr_pages  )
           |      |     ~~ ~
           |      |     |  |
           |      |     |  (6) following ‘false’ branch...
           |      |     (5) ...to here
           |......
           |  340 |     p2m_cr3 = GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_width);
           |      |     ~~~~~~~
           |      |     |
           |      |     (7) ...to here
           |  341 |
           |  342 |     p2m_frame_list = p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
           |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           |  343 |                              : xc_core_arch_map_p2m_tree_rw(xch, dinfo, dom, live_shinfo);
           |      |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           |      |                              | |
           |      |                              | (9) ...to here
           |      |                              | (10) calling ‘xc_core_arch_map_p2m_tree_rw’ from ‘xc_core_arch_map_p2m_rw’
           |      |                              (8) following ‘false’ branch...
           |
           +--> ‘xc_core_arch_map_p2m_tree_rw’: events 11-24
                  |
                  |  228 | xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinfo,
                  |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  |      | |
                  |      | (11) entry to ‘xc_core_arch_map_p2m_tree_rw’
                  |......
                  |  245 |     if ( !live_p2m_frame_list_list )
                  |      |        ~
                  |      |        |
                  |      |        (12) following ‘false’ branch (when ‘live_p2m_frame_list_list’ is non-NULL)...
                  |......
                  |  252 |     if ( !(p2m_frame_list_list = malloc(PAGE_SIZE)) )
                  |      |     ~~ ~                         ~~~~~~~~~~~~~~~~~
                  |      |     |  |                         |
                  |      |     |  |                         (14) allocated here
                  |      |     |  (15) assuming ‘p2m_frame_list_list’ is non-NULL
                  |      |     |  (16) following ‘false’ branch (when ‘p2m_frame_list_list’ is non-NULL)...
                  |      |     (13) ...to here
                  |......
                  |  257 |     memcpy(p2m_frame_list_list, live_p2m_frame_list_list, PAGE_SIZE);
                  |      |     ~~~~~~
                  |      |     |
                  |      |     (17) ...to here
                  |......
                  |  266 |     else if ( dinfo->guest_width < sizeof(unsigned long) )
                  |      |             ~
                  |      |             |
                  |      |             (18) following ‘false’ branch...
                  |......
                  |  270 |     live_p2m_frame_list =
                  |      |     ~~~~~~~~~~~~~~~~~~~
                  |      |     |
                  |      |     (19) ...to here
                  |......
                  |  275 |     if ( !live_p2m_frame_list )
                  |      |        ~
                  |      |        |
                  |      |        (20) following ‘false’ branch (when ‘live_p2m_frame_list’ is non-NULL)...
                  |......
                  |  282 |     if ( !(p2m_frame_list = malloc(P2M_TOOLS_FL_SIZE)) )
                  |      |     ~~ ~
                  |      |     |  |
                  |      |     |  (22) following ‘false’ branch (when ‘p2m_frame_list’ is non-NULL)...
                  |      |     (21) ...to here
                  |......
                  |  287 |     memset(p2m_frame_list, 0, P2M_TOOLS_FL_SIZE);
                  |      |     ~~~~~~
                  |      |     |
                  |      |     (23) ...to here
                  |......
                  |  300 |     return p2m_frame_list;
                  |      |     ~~~~~~
                  |      |     |
                  |      |     (24) ‘p2m_frame_list_list’ leaks here; was allocated at (14)
                  |
```
Fixes: bd7a29c3d0 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/libs/guest/xg_core_x86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/guest/xg_core_x86.c b/tools/libs/guest/xg_core_x86.c
index 61106b98b8..69929879d7 100644
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -297,6 +297,8 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinf
 
     dinfo->p2m_frames = P2M_FL_ENTRIES;
 
+    free(p2m_frame_list_list);
+
     return p2m_frame_list;
 
  out:
-- 
2.39.1


