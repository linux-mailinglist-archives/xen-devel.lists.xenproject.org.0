Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2FE64FB74
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 18:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465341.724002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6bSm-0006nV-O8; Sat, 17 Dec 2022 17:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465341.724002; Sat, 17 Dec 2022 17:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6bSm-0006k4-KW; Sat, 17 Dec 2022 17:59:08 +0000
Received: by outflank-mailman (input) for mailman id 465341;
 Sat, 17 Dec 2022 17:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1nnt=4P=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1p6bSl-0006jy-I0
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 17:59:07 +0000
Received: from neowutran.ovh (vps-eb112777.vps.ovh.net [51.83.40.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f74988e-7e34-11ed-8fd4-01056ac49cbb;
 Sat, 17 Dec 2022 18:59:06 +0100 (CET)
Received: from localhost.localdomain (82-65-208-184.subs.proxad.net
 [82.65.208.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id DF59660BCE;
 Sat, 17 Dec 2022 17:43:55 +0000 (UTC)
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
X-Inumbo-ID: 7f74988e-7e34-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh;
	s=my-selector-name; t=1671299036;
	bh=ScL+wM/r2vV7V3L6+5UAoO4L6OG34lleNzEkgMi2sEE=;
	h=From:To:Cc:Subject:Date;
	b=FxroflgekMr6WzByZ9sHoKq0bxc385HZi3FOLmxt4BZiPZ1xik00icFllTFXezu+g
	 ZWB/nV4wEwwyOfMDCKsNWsYpX0t3fFmXyYP679nvmpMAr89A0cASPjfGC0Xuka90/6
	 OpeoZSP/elMBAb2TqeJhpZXhSeun1vRrPNg1xwCexf8EMzm8BZrnMttB9seKVJ9ceE
	 8U4LSPPHUSx/jstGyYYJP9YAsHUs22aUWnuhb+BZWESxO78m3YHosb+v1j4vO2ocZN
	 /33SHlWXzJbcMwtcfjo4fM0zhVh6SGN5FwLXR8nnulh1QfI09bI2fGTTSplTIVs1X8
	 JoHsXJWjvIIgTJ3gjvvDrYGqDbQ41ZduZHsYvRBLlz/VYga4MTyItNKZXB3e86xAJq
	 GVyWAj/A/pn6EB5Jea6Ie34RBEO1BggYF0WZfwvq6xKgJBmCjkUepNYdxmpXZJwByK
	 UloI/qnJUzJIVl3VRNCKLecK28b/GLZQFGpduDNKnzqqtEkcsp0GG8F1r1A9pg22aG
	 7Ycw0ZU2wBkZ9SJOSheId5rwmY7qmIyhPxr6ErM9Up6QpuM66MugwbahNErjpsOuYY
	 m9cQVlCmQNLwCRYq8601hfbH8GKwW947rQh6Ue/OoeLnws4hr9SPANNNrgbD+lLcri
	 0FnFsqsTvSCtAaOEDA/VjHaM=
From: Neowutran <xen@neowutran.ovh>
To: xen-devel@lists.xenproject.org
Cc: Neowutran <xen@neowutran.ovh>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [Patch v1] Bug fix - Integer overflow when cpu frequency > u32 max value.
Date: Sat, 17 Dec 2022 18:42:05 +0100
Message-Id: <c1535eba0bba6fc1b91f975f434af0929d9d7c96.1671298923.git.git@neowutran.ovh>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen/arch/x86/time.c: Bug fix - Integer overflow when cpu frequency > u32 max value.

What is was trying to do: I was trying to install QubesOS on my new computer
(AMD zen4 processor). Guest VM were unusably slow / unusable.

What is the issue: The cpu frequency reported is wrong for linux guest in HVM
and PVH mode, and it cause issue with the TSC clocksource (for example).

Why this patch solved my issue:
The root cause it that "d->arch.tsc_khz" is a unsigned integer storing
the cpu frequency in khz. It get multiplied by 1000, so if the cpu frequency
is over ~4,294 Mhz (u32 max value), then it overflow.
I am solving the issue by adding an explicit cast to u64 to avoid the overflow.

---
 xen/arch/x86/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index b01acd390d..7c77ec8902 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2585,7 +2585,7 @@ int tsc_set_info(struct domain *d,
     case TSC_MODE_ALWAYS_EMULATE:
         d->arch.vtsc_offset = get_s_time() - elapsed_nsec;
         d->arch.tsc_khz = gtsc_khz ?: cpu_khz;
-        set_time_scale(&d->arch.vtsc_to_ns, d->arch.tsc_khz * 1000);
+        set_time_scale(&d->arch.vtsc_to_ns, (u64)d->arch.tsc_khz * 1000);
 
         /*
          * In default mode use native TSC if the host has safe TSC and
-- 
2.38.1


