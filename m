Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D801D4AE062
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268585.462466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwG-0004MW-U1; Tue, 08 Feb 2022 18:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268585.462466; Tue, 08 Feb 2022 18:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwG-0004H0-Jv; Tue, 08 Feb 2022 18:10:04 +0000
Received: by outflank-mailman (input) for mailman id 268585;
 Tue, 08 Feb 2022 18:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHUwE-0003Sy-8I
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:10:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 536fc97b-890a-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:10:00 +0100 (CET)
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
X-Inumbo-ID: 536fc97b-890a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644343800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=DN+j1b19UntwqTcT4SnsDIhwfs0fbGijJq0oTfhrAtY=;
  b=bqITvqfJtZPORMHkKN4c7jTZEJ4olXNAtMZR1SguSfiTSx4vIH7rJWhL
   6UdVY+e/5au+Nod4P17HxE17bqfYeGDGYytTif50aXIJmhRFAge7FfEox
   DX304aQxRQhs6icnknSoCb704CYl6V+pYVbGM/LjlZkRumBVEaYtcSMJV
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xPKKKpj7P7kS3oyR+8rIrgQ1Sc20KcOIGGUP5uirGnRu78F1sR2pzl+MjFtrgil/R+dECnK4rW
 G5kCu4BuCIrPTfCAesYGMEB+nFc/8ZDyrZWROPHHf+aygX5e374xqpc0GqhNyyuctlJoqI8mKY
 O9lkQsEDihH+78M7CNrfm3mgkHgBgQkYOkU0c+/X+cQZr50zmJZz71nYEIp91K9WQA/6ZPkqw8
 Tn1M72/D5iKpOkHeFKqYAKBsiEnhDrD+4/XZXpMMZ7svobc1lhEy5F2n3bitKSas29RIu37Bbq
 cjqr7inWzzDqRphcFpa2GFb6
X-SBRS: 5.1
X-MesageID: 63762631
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pxkam6CRNaqJCRVW/wPkw5YqxClBgxIJ4kV8jS/XYbTApDon1jwAy
 mEdUWqHPqqDNDCgfox1a4Tno01SvJLUz98wQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970UI7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/oSSEu81D6
 u93r5G1ezgDAqrFt/o5XEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGh2hu3J4VRJ4yY
 eIkNQQsTQ2RQCRFBXcyA6ADnbqVtHPWJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+f0q2heSLqHSEQd9aG
 XM+xi0ngrYW+xn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mODNERqgGqGoQSRe0MT/BUsLfmc6QAQM+LEPS6lj30uUHr6P/ENY5+AZ+A0cI
 RjX9kDSZJ1J1KbnMplXGnid0lqRSmDhFFJd2+ktYkqr7xlieKmubJGy5F7Q4J5oddjFEgDQ5
 SFaypLHt4ji6K1hcwTXEY0w8EyBva7ZYFUwf3Yzd3Xey9hd0yH6Jt0BiN2PDExoLtwFaVfUj
 Lz74mtsCGtoFCLyN8dfOtvpY+xzlPSIPYm1B5j8M4sVCrAsJVDv1H81Pya4gTuy+HXAZIliY
 P+za9i3N38GBMxPlXzuLwvr+eRwnX5WKKK6bc2T8ilLJpLEPCHMEupeYALVBg37hYvdyDjoH
 x9kH5Pi431ivCfWP0E7KKYfcgIHK2YVH5fzp5AFf+KPOFM+SmogF+XQ0fUqfIk8x/ZZkeLB/
 3ecXE5EyQWg2S2beFvSMn0zOqnyWZtfrG4gOXB+N1ifxHV+M52k670SdsVrcOB/pvBj1/N9U
 9IMZ96EXqZUUj3C9jlENcv9oYVueQ6FnwWLOyb5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqilgrjs2IcleR+W1rzDuNSIEi8opJ3LyHRj+MsJ51eIxv02TbHh
 R2dBg0VpLeRrtZtosXJn62Ns6ygD/B6QhhBB2De4Lu7aXva826kzdMSWeqEZ2mABmb9+aHkb
 uRJ1fDsdvYAmQ8S4YZ7Fr9qy4M45sfu+OAGnlg1Qi2TYgT5EK5kL1mHwdJL5/9EybJusAerX
 l6Cp4tBMrKTNcK5SFMcKWLJtAhYOS34TtUK0ckIHQ==
IronPort-HdrOrdr: A9a23:Cta2y6/Nu9P6t7CZKUpuk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="63762631"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/6] x86/tsx: Move has_rtm_always_abort to an outer scope
Date: Tue, 8 Feb 2022 18:09:38 +0000
Message-ID: <20220208180942.14871-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220208180942.14871-1-andrew.cooper3@citrix.com>
References: <20220208180942.14871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

We are about to introduce a second path which needs to conditionally force the
presence of RTM_ALWAYS_ABORT.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/tsx.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 88adf08c4973..c3b8a7ec0076 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -42,6 +42,7 @@ void tsx_init(void)
     if ( unlikely(cpu_has_tsx_ctrl < 0) )
     {
         uint64_t caps = 0;
+        bool has_rtm_always_abort;
 
         if ( boot_cpu_data.cpuid_level >= 7 )
             boot_cpu_data.x86_capability[cpufeat_word(X86_FEATURE_ARCH_CAPS)]
@@ -51,6 +52,7 @@ void tsx_init(void)
             rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
         cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
+        has_rtm_always_abort = cpu_has_rtm_always_abort;
 
         if ( cpu_has_tsx_force_abort )
         {
@@ -67,11 +69,7 @@ void tsx_init(void)
              * RTM_ALWAYS_ABORT enumerates the new functionality, but is also
              * read as zero if TSX_FORCE_ABORT.ENABLE_RTM has been set before
              * we run.
-             *
-             * Undo this behaviour in Xen's view of the world.
              */
-            bool has_rtm_always_abort = cpu_has_rtm_always_abort;
-
             if ( !has_rtm_always_abort )
             {
                 uint64_t val;
@@ -83,15 +81,6 @@ void tsx_init(void)
             }
 
             /*
-             * Always force RTM_ALWAYS_ABORT, even if it currently visible.
-             * If the user explicitly opts to enable TSX, we'll set
-             * TSX_FORCE_ABORT.ENABLE_RTM and cause RTM_ALWAYS_ABORT to be
-             * hidden from the general CPUID scan later.
-             */
-            if ( has_rtm_always_abort )
-                setup_force_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
-
-            /*
              * If no explicit tsx= option is provided, pick a default.
              *
              * This deliberately overrides the implicit opt_tsx=-3 from
@@ -108,10 +97,19 @@ void tsx_init(void)
              * With RTM_ALWAYS_ABORT, disable TSX.
              */
             if ( opt_tsx < 0 )
-                opt_tsx = !cpu_has_rtm_always_abort;
+                opt_tsx = !has_rtm_always_abort;
         }
 
         /*
+         * Always force RTM_ALWAYS_ABORT, even if it currently visible.  If
+         * the user explicitly opts to enable TSX, we'll set the appropriate
+         * RTM_ENABLE bit and cause RTM_ALWAYS_ABORT to be hidden from the
+         * general CPUID scan later.
+         */
+        if ( has_rtm_always_abort )
+            setup_force_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
+
+        /*
          * The TSX features (HLE/RTM) are handled specially.  They both
          * enumerate features but, on certain parts, have mechanisms to be
          * hidden without disrupting running software.
-- 
2.11.0


