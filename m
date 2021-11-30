Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCB463D70
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 19:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235413.408415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7bf-0000gY-Vv; Tue, 30 Nov 2021 18:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235413.408415; Tue, 30 Nov 2021 18:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7bf-0000e8-S9; Tue, 30 Nov 2021 18:11:55 +0000
Received: by outflank-mailman (input) for mailman id 235413;
 Tue, 30 Nov 2021 18:11:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms7bd-0000OK-TY
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 18:11:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc56d8ec-5208-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 19:11:51 +0100 (CET)
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
X-Inumbo-ID: fc56d8ec-5208-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638295911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kyOL94ZVKxqY//r4+vWiit5CAiZx1BlcznsYktkan5E=;
  b=Q3o2cMj+NQX8mfqX8dA6zKesIdjmumw2KtAmTngfVe34vu2kONkZLAo6
   EDgtpIvUdwVTKmgj8xYGETKmG0MLhjbj3GpU8YMQt+a9dZ6Ghq7YcsSLY
   JS0DGMZpeu+Xnzg3fptbco1ZdBbxejs/mo2WbTLJ08hCCjbXElogLDlpx
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6biRmge/6yoMWTzcNrwpVlgbk+Ua8XexRMsw41ZSXnpp0VGWRK+thtg+ZL5/75CM2ypvoqoK73
 fvdz4Yl3HIz3eWub81nB9vqBql9JOAOfE4+8SAO8+pt777ohR4ZMC9LWRLWRKEJg8iPjm5HgWf
 aRqIaMOJNOSb6aCMe/JYRftvyjmdM4J0Vn3Dtajzcd9AQJnZetpYmixEN5jvO/6vfUu/B8c4mR
 O/Bg0bVBBJlnMbI9JKemB49PuGCB9PiSbNFyRev0XXjyvCzRI2fgXRGS0AgIFVF04/YgsrfB7I
 +NDLWorqVYgkWxIaK8oW8gF8
X-SBRS: 5.1
X-MesageID: 60966838
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ulWjpapgMMa31i3ehPeDEMp4vEFeBmKPYhIvgKrLsJaIsI4StFCzt
 garIBnTa/6NYTSme90lbovj8EIHsZSDxtUyHlFvrS1nEyJE+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IPhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZuhcBY0GKDIodkmcShpLiNvA61N8YaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZJIN2Q/N0SojxtnJUU4T5ETu86R2FKufTF8owm4n4wt2j2GpOB2+Oe0a4eEEjCQfu1Jl0ORv
 Ura/GD0BB4LOdjZwj2Amlqlh/TGnCfycIgTCLG1+PNsjFCJgGcUDXU+TUO6u/Kwjke0RvpVK
 lAY9yQjq6Q/7gqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrptrkICDt5
 T2OlRUFpYQisMwa6aWw9GmS1lpAuaP1ZgIy4wzWWEes4QV4eJOpauSU1LTL0RpTBN3HFwfc5
 RDoj+DbtblTVs/VyERhVc1UROnxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCf6BUOUS9joYyjP8UQGPY++PhwzRoATCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoHLdHiOZwnX5kmTm7qXXHI/KPiuH2iJm9E+ptDbdzRrphsPPsTPv9r
 b6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIxrag1
 izsASdwlQug7UAr3C3XMxiPnpu0Bs0hxZ/6VARxVWuVN48LPdzysfxBLsRvJtHKNoVLlJZJc
 hXMQO3Yatwnd9gN0211gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:FcoDGqFKgurN2jBgpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,276,1631592000"; 
   d="scan'208";a="60966838"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: [PATCH 1/2] x86/hvm: Simplify hvm_enable_msr_interception()
Date: Tue, 30 Nov 2021 18:11:38 +0000
Message-ID: <20211130181139.14398-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130181139.14398-1-andrew.cooper3@citrix.com>
References: <20211130181139.14398-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The sole caller doesn't check the return value, and both vendors implement the
hook.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Alexandru Isaila <aisaila@bitdefender.com>
CC: Petre Pircalabu <ppircalabu@bitdefender.com>
---
 xen/include/asm-x86/hvm/hvm.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index bd2cbb0e7baf..2767427aa938 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -631,15 +631,9 @@ static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
     return hvm_funcs.nhvm_intr_blocked(v);
 }
 
-static inline bool_t hvm_enable_msr_interception(struct domain *d, uint32_t msr)
+static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
-    if ( hvm_funcs.enable_msr_interception )
-    {
-        hvm_funcs.enable_msr_interception(d, msr);
-        return 1;
-    }
-
-    return 0;
+    hvm_funcs.enable_msr_interception(d, msr);
 }
 
 static inline bool_t hvm_is_singlestep_supported(void)
-- 
2.11.0


