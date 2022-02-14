Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAB4B5155
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271910.466635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbD8-000154-PI; Mon, 14 Feb 2022 13:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271910.466635; Mon, 14 Feb 2022 13:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbD8-00012q-Lw; Mon, 14 Feb 2022 13:16:10 +0000
Received: by outflank-mailman (input) for mailman id 271910;
 Mon, 14 Feb 2022 13:16:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3i-0008IH-HG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e951b73e-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:25 +0100 (CET)
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
X-Inumbo-ID: e951b73e-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VDTB6pLtQwW15sO+arBQSOZrTwVU7NXtXfZ8CtNHRX8=;
  b=TxEYX1uObWL0FyPR/G3bKayqc59BmOSB3GcK4mgFj5OMBLH8F+fw1VDX
   mlm7JduY02jKHYybbZnAHpRFgjsc5/n+F04VwaFKgnfwx68rhp4oVIMXv
   dXhqSOU/cjQYiSIuU8LyX3OULLhehUBY3G0F9eH/0WGmCYlJXK/TdnluN
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ++CeWZB0+BNTzNsApzkSIN78zTJBzVpqspVucKLtkx8Nn8wwYLwMhAXdK9i0S/kjjiWTjQ4rln
 TgdYMFWA6r9PnvfS1D42xvK0RcDrNy7Yf/bVaP+EUz3ibL08gZj9vj9xa4oCYyfuxPIotZxCJ9
 4M4cI3RJpH05I/RgtGYkm7V9vhp6keGY1G9GlTv/5f62AA9D6kJDFAB4m/KBjUcG9ZlaTMjOrH
 CLcy7lkD2FMS04sboHJ1XcXBTLUcfQug5HPZ2rhI40WRL/siGeMeP1lZEyq/2B9AdNHnwnU+FU
 dvlXFI1Z2pI6EJt1fOKOgGfi
X-SBRS: 5.1
X-MesageID: 63592704
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HunMRa1ROykz2ogr6vbD5ex2kn2cJEfYwER7XKvMYLTBsI5bpzAOx
 mJNWziCO6rbMGPyct11b4q39E9UuJXdn4BrG1RupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhzulP1
 vVGtKaKVVkGN4/wnNhGdiMFKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3Z0fR6mGO
 6L1bxI1UDfbR0FGB2s8J5Y/o+Kxnl75Sh1x/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalk8lZcRwGOwA0h3T5aP23wKlXU0+EwcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdTNi2+AswGzARN8wGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyHzLd0NuGglfi+F1/ronhezP
 ifuVf55vscPbBNGk4crC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4va/FSLo
 44HbZPiJtc2eLSWXxQ7OLU7dTgiRUXXz7irwyCOXuLccAdgBk87DPrdneEod4B/xvwHnebU5
 HCtHERfzQOn13HALAyLbFFlaa/uAskj/S5qY3R0MAb6wWUnbKau8LwbK8k9c444+bEx1vVzV
 fQEJZmNW6wdVjTd9j0BRpDht4g+Jg+zjAeDMnP9MjgydpJtXSLT/drgcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQKIRfi6olnLSD1n8QbGcBUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcD2BBmP5/KKuO
 bdcw/3maaBVmV9Lt8x3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0La7yGNfTsHEMVOAd4PP+I0usZm2WK4Pk4SKkgCPSbIFZTvZ1uAiSx
IronPort-HdrOrdr: A9a23:nbn1Oa4idQG2A6NCOAPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592704"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 69/70] x86/efi: Disable CET-IBT around Runtime Services calls
Date: Mon, 14 Feb 2022 12:51:26 +0000
Message-ID: <20220214125127.17985-70-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

UEFI Runtime services, at the time of writing, aren't CET-IBT compatible.
Work is ongoing to address this. In the meantime, unconditionally disable IBT.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

https://bugzilla.tianocore.org/show_bug.cgi?id=3726 is the upstream tracking
ticket.

v2:
 * Rewrite to be an unconditional disable.
---
 xen/common/efi/runtime.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index e3ce85d118e4..13b0975866e3 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -21,6 +21,7 @@ struct efi_rs_state {
   * don't strictly need that.
   */
  unsigned long __aligned(32) cr3;
+    unsigned long msr_s_cet;
 #endif
 };
 
@@ -113,6 +114,19 @@ struct efi_rs_state efi_rs_enter(void)
 
     switch_cr3_cr4(mfn_to_maddr(efi_l4_mfn), read_cr4());
 
+    /*
+     * At the time of writing (2022), no UEFI firwmare is CET-IBT compatible.
+     * Work is under way to remedy this.
+     *
+     * Stash MSR_S_CET and clobber ENDBR_EN.  This is necessary because
+     * SHSTK_EN isn't configured until very late on the BSP.
+     */
+    if ( cpu_has_xen_ibt )
+    {
+        rdmsrl(MSR_S_CET, state.msr_s_cet);
+        wrmsrl(MSR_S_CET, state.msr_s_cet & ~CET_ENDBR_EN);
+    }
+
     return state;
 }
 
@@ -122,6 +136,10 @@ void efi_rs_leave(struct efi_rs_state *state)
 
     if ( !state->cr3 )
         return;
+
+    if ( state->msr_s_cet )
+        wrmsrl(MSR_S_CET, state->msr_s_cet);
+
     switch_cr3_cr4(state->cr3, read_cr4());
     if ( is_pv_vcpu(curr) && !is_idle_vcpu(curr) )
     {
-- 
2.11.0


