Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2BB17011
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065421.1430781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR3V-0000Hu-Pr; Thu, 31 Jul 2025 11:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065421.1430781; Thu, 31 Jul 2025 11:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR3V-0000FW-Mp; Thu, 31 Jul 2025 11:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1065421;
 Thu, 31 Jul 2025 11:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhR3U-0000Cq-0x
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:02:36 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd1dac19-6dfd-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 13:02:35 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so14239975e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 04:02:35 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edfd950sm22600885e9.14.2025.07.31.04.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 04:02:34 -0700 (PDT)
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
X-Inumbo-ID: dd1dac19-6dfd-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753959755; x=1754564555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWt5Dpqvqzj0zL1Zk4f9u61iGVBpij4iFWFjYrHm2eo=;
        b=XigPXAvIjLX97H75I0xTStyPULMP0sOt2832ZQV1SkiOfU0llMVNigKUAjG1SoO3l/
         p100KM3mIokPqQolG2CC2cjZsWs8AFxUghlrOeZ1GMp14ThEYGsewb8KimpvQakf0lR6
         k1pkJw6Qv6RwB35PZS2UJrAGbgD2vOD9dD9YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753959755; x=1754564555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWt5Dpqvqzj0zL1Zk4f9u61iGVBpij4iFWFjYrHm2eo=;
        b=dElBrRXVJ10vlq17txmFq3QbbJ+UU6FwRFHPY77XYZYVpgkf8Ipt3vGO5DtN80eDl9
         V4hx24wSdXvL21J6Ddvz85/eZPV8KujcQu3D1AYYnh/KAyWIX4MiJ0koNqs4ncQkMagK
         NWsW+B/S7T/2XlT/vBvar5TyIMbkqD9/ZrPmKmCQtEk0DWdYRsfhzFCl552GpM/8SQL7
         QhVH9LF7fcU2lr/5MnIqpK1VGJ9mKoWCbnlVqDZI+LIDxyvAsnlYhlmpie6ORygxYvTg
         mO/1APpTk20C6Nm8w5PANoSMa66iV4i36aVW5P0ed5YWYqJ+GV3rMiVIka5Qg1TnsYyp
         QRLA==
X-Gm-Message-State: AOJu0Yzy5WKsp1Q4PEr2kKlP1Og7KMdp5rk2Hoh0VCkOmoZOkM/jlrJ7
	gOnOUFHb0azYr/x+fjOXvNjUkXZKB5bfb+luHgMcwj57zrZWejP7njE8QiZuYWycCieC68Qtf4p
	zIw9N7Ik=
X-Gm-Gg: ASbGncvH/Jvc7J50QNbkGs6DWaVWyWwfRPr2/UE8weJbifcw0el0RrZofS2Fg9e7I99
	f54wEW2VvHENri4yabqRc0twBiSYxeQSEVJ/izLEkJdRasbLRCMh2HcVdQcci9TSFo1Mj5Jw7WP
	k6wAoNtL9HARxE3QT5lD2fhUQWZTTShUOk8lVoUU60upsGzuVBHyjSSEraHXOvXpjqRDKVoM2nk
	46P8DY9eW8z9pbX/VMW74ZhFSaiP/SGogg6qQ/jYdIZsqpMV4/7L90ULwdpgJfPlCj0qucK0Dce
	EVPHdk5LFW2prC94gu3Je71UpvYfmXpakFUy5QUJ/EvZ9wwedfmqC9cVec0qgyGm89u5fchUYsm
	ir6+Xu/pwkFm2YBU9npGoDZUxDnne0sE3RJpiszqVL9Q1YaxRVlhpXFMb0in4xRkBBfRKJQX2iW
	tH
X-Google-Smtp-Source: AGHT+IFEYzVeFcJA819w73cJgtejXrdoYKy4DuPwCL0KZzVVVsJlbTKt4gLlxK3chz0DJPtaPWKPhA==
X-Received: by 2002:a05:600c:1d01:b0:453:7713:476c with SMTP id 5b1f17b1804b1-458a2016e4amr16925995e9.2.1753959754611;
        Thu, 31 Jul 2025 04:02:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/2] xen/version: Fold print_build_id() into print_version()
Date: Thu, 31 Jul 2025 12:02:30 +0100
Message-Id: <20250731110231.3551636-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731110231.3551636-1-andrew.cooper3@citrix.com>
References: <20250731110231.3551636-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both callsites call them as a pair, and the buildid really is as much a part
of the version as the changeset.

This involves rearranging console_init_preirq() to ensure xen_build_init() is
ahead of print_version().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/keyhandler.c    |  1 -
 xen/common/version.c       | 19 ++++++-------------
 xen/drivers/char/console.c |  7 +++----
 xen/include/xen/lib.h      |  1 -
 4 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index b0a2051408d5..cb6df2823b00 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -131,7 +131,6 @@ static void cf_check show_handlers(unsigned char key)
     printk("'%c' pressed -> showing installed handlers\n", key);
 
     print_version();
-    print_build_id();
 
     for ( i = 0; i < ARRAY_SIZE(key_table); i++ )
         if ( key_table[i].fn )
diff --git a/xen/common/version.c b/xen/common/version.c
index 56b51c81d2fc..84bd77e74653 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -94,6 +94,9 @@ const char *xen_build_info(void)
     return build_info;
 }
 
+static const void *build_id_p __read_mostly;
+static unsigned int build_id_len __read_mostly;
+
 void print_version(void)
 {
     printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
@@ -102,10 +105,10 @@ void print_version(void)
            xen_build_info(), xen_compile_date());
 
     printk("Latest ChangeSet: %s\n", xen_changeset());
-}
 
-static const void *build_id_p __read_mostly;
-static unsigned int build_id_len __read_mostly;
+    if ( build_id_len )
+        printk("build-id: %*phN\n", build_id_len, build_id_p);
+}
 
 int xen_build_id(const void **p, unsigned int *len)
 {
@@ -118,16 +121,6 @@ int xen_build_id(const void **p, unsigned int *len)
     return 0;
 }
 
-void print_build_id(void)
-{
-    /*
-     * NB: build_id_len may be 0 if XEN_HAS_BUILD_ID=n.
-     * Do not print empty build-id.
-     */
-    if ( build_id_len )
-        printk("build-id: %*phN\n", build_id_len, build_id_p);
-}
-
 #ifdef BUILD_ID
 /* Defined in linker script. */
 extern const Elf_Note __note_gnu_build_id_start[], __note_gnu_build_id_end[];
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 963c7b043cd8..a5af66023975 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1105,11 +1105,10 @@ void __init console_init_preirq(void)
     __putstr(xen_banner());
     nrspin_unlock(&console_lock);
 
-    print_version();
-
-    /* Locate and print the buildid, if applicable. */
+    /* Locate the buildid, if possible. */
     xen_build_init();
-    print_build_id();
+
+    print_version();
 
     if ( opt_sync_console )
     {
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index e63ec5039f92..36d904ba1a3c 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -48,7 +48,6 @@ int parse_signed_integer(const char *name, const char *s, const char *e,
 int cmdline_strcmp(const char *frag, const char *name);
 
 void print_version(void);
-void print_build_id(void);
 
 #ifdef CONFIG_DEBUG_TRACE
 extern void debugtrace_dump(void);
-- 
2.39.5


