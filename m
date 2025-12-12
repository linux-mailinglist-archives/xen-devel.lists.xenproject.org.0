Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E7CB8E46
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 14:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185386.1507580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36T-0000t4-Kk; Fri, 12 Dec 2025 13:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185386.1507580; Fri, 12 Dec 2025 13:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36T-0000op-Fm; Fri, 12 Dec 2025 13:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1185386;
 Fri, 12 Dec 2025 13:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjHH=6S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vU36R-0000XM-Id
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 13:22:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9df72b55-d75d-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 14:22:33 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64979bee42aso1708711a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 05:22:33 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f77fbsm5168260a12.19.2025.12.12.05.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 05:22:31 -0800 (PST)
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
X-Inumbo-ID: 9df72b55-d75d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765545752; x=1766150552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKcgpgVhPtaCMEXLSjgtM5Jeo9qa3Adh6wKPCR5tAQ=;
        b=X3g0mvrZzxMpipSENyD51oNnAWI4TK7ED7YAX0Uj+fSLIl3I1IOOeM0in5Bx0C7PCJ
         z8SrZXKoy6lmoWJha9RCWHWsiIRiCtL60ZMBoDeVxtuLsxz/C9SENiOCVd4/9u7gN4e7
         zeGAtu5oRp1sDUU9mM5P7HRg+dcMjjY/WlQodaiKI1FvjZ4fDoN9LPTOUE5x/uB/sx4L
         9mhepllWSO7TbAle0XGgmaNFZpMbJU0CirK3eomTI5HrZ/k/RIAbWclG+fwRvD+dm03U
         PTJZBlMygPfmi36b78ho/TvUh7Ukx7uZo+fzgWDkAzouo+wROuKN5imsT6oMH0Lc+Loj
         BHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765545752; x=1766150552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SjKcgpgVhPtaCMEXLSjgtM5Jeo9qa3Adh6wKPCR5tAQ=;
        b=X5jaz7hpM8TCv+d5Whqd42nasoHa4xW79sCU6cSi2BLtVBHj7zZ7B2ZYxMRiFnn2g2
         Ja0YAExZAKdqbblltThM1a5j7jbnRTA5Mdajw7ussbySGZ2V2ioIHVhEjwE5yDJVBz0y
         ePdGMXYWht1cQj0oHsy5STD9gBRrNcEjx2wtoCb6EiFm7zkGHXKSLv8EN6Yv54kqcREN
         J3gEW7jyeAUbUHIbtCMEy4XdXzWmOPL6fDjitJo0LhlI0ReYVZKm+D6fdqbqB+Wnk7y3
         65JaEBeWyhUMf5X7ziMxQeHljnx4JKS+ENawzIt3Sw9wOCPXEZVZAepUDw6qYeyxxcrM
         Nprg==
X-Gm-Message-State: AOJu0YyNtZcttryARMzSpGiLJJtnRwwA9wpIIvfyEl/8DZQRLdQUjDor
	CW0xJd4CUsU7xBRms3Yz3iOT/n+YP4Ep9mMU9E5UwS+tYzhe/jqps/w4wIwE6dZA
X-Gm-Gg: AY/fxX6KiERxQWnrdxegDfvgU5gd0dcKAympvsHrw4fMOuSSTRmOuQMAVU0kroj02q0
	8lK07hCheyHdrYQBl0X6Vs9XQjgajZzmJzmMzUqXLSJSN3qpBmjNG3nSYo6kdVM8Cp9q7Ifo6Oa
	8qCwirJMFmCW9du1sDT01wALA4yY0jtsOHxA3VAzxQ5anN0YmWsVlbB/h11Gv/ZWiU79d/CSoPd
	Us/QTynEx1Owon2EASpAx4auLIqvlPM9me+mY0ryl6IB5jx+8bHwSznSAnnDxWFwCO6QMfa+PyY
	Q39e92WjRIVdrZQlowHd0PF3Ru9o245rXImU4hIxXASmlyUa2/Ec3hIx4Ed7UB4GFOgu23qCcJ1
	oial/uJNUFNiP3nG/IxPwgRSU4bXWiPpZXNUATUEXDbJawTX0OMhYx3EIHvSpE3IbqngLMzbgJz
	W+yroJX/6WjA9COEbzetyuJ0GlkBNOYhwWJlscaRlDmzlkkIeqhuo=
X-Google-Smtp-Source: AGHT+IG8C9rI5U+m+A9wSFp7RpN80ekmEr/smPOOiIk91E1+Hg5S/5fApusnrdGUTrWDuvO/5JDKHA==
X-Received: by 2002:a17:906:c154:b0:b79:ff73:f3b4 with SMTP id a640c23a62f3a-b7d235c843amr209089966b.13.1765545751932;
        Fri, 12 Dec 2025 05:22:31 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v16 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Fri, 12 Dec 2025 15:18:19 +0200
Message-ID: <673b2f721b93d8d154f3290797dcbb99f9d46104.1765533584.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765533584.git.mykola_kvach@epam.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

The "xl resume" command was previously excluded from Arm builds because
system suspend/resume (e.g., SYSTEM_SUSPEND via vPSCI) was not
implemented. On x86, this command is used for resume.

This change enables compilation of `xl resume` on Arm regardless of the
underlying implementation status, making the tool available for testing
and future feature support. The relevant libxl infrastructure and handler
functions are already present and usable.

Note: This does not imply full system suspend/resume support on Arm.
      The `xl suspend` command still does not work on Arm platforms.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes in v16:
- no chnages
---
 tools/include/libxl.h     |  1 -
 tools/xl/xl.h             |  4 ++--
 tools/xl/xl_cmdtable.c    |  4 ++--
 tools/xl/xl_migrate.c     |  2 +-
 tools/xl/xl_saverestore.c |  2 +-
 tools/xl/xl_vmcontrol.c   | 12 ++++++------
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bc35e412da..14b9e4a859 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1145,7 +1145,6 @@ typedef struct libxl__ctx libxl_ctx;
  * restoring or migrating a domain. In this case the related functions
  * should be expected to return failure. That is:
  *  - libxl_domain_suspend
- *  - libxl_domain_resume
  *  - libxl_domain_remus_start
  */
 #if defined(__arm__) || defined(__aarch64__)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 9000df00de..63db30a6eb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -65,7 +65,7 @@ static const char migrate_permission_to_go[]=
     "domain is yours, you are cleared to unpause";
 static const char migrate_report[]=
     "my copy unpause results are as follows";
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
   /* followed by one byte:
    *     0: everything went well, domain is running
@@ -130,8 +130,8 @@ int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
 int main_suspend(int argc, char **argv);
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 int main_resume(int argc, char **argv);
-#endif
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
 int main_unpause(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 06a0039718..bcb2d233cc 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -198,12 +198,12 @@ const struct cmd_spec cmd_table[] = {
       "Suspend a domain to RAM",
       "<Domain>",
     },
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
     { "resume",
       &main_resume, 0, 1,
       "Resume a domain from RAM",
       "<Domain>",
     },
-#endif
     { "dump-core",
       &main_dump_core, 0, 1,
       "Core dump a domain",
@@ -548,7 +548,7 @@ const struct cmd_spec cmd_table[] = {
       "                        checkpoint must be disabled.\n"
       "-p                      Use COLO userspace proxy."
     },
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
     { "devd",
       &main_devd, 0, 1,
       "Daemon that listens for devices and launches backends",
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index b8594f44a5..4b4a379aa1 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -767,7 +767,7 @@ int main_remus(int argc, char **argv)
     close(send_fd);
     return EXIT_FAILURE;
 }
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
 
 /*
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 953d791d1a..747094ec7b 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -270,7 +270,7 @@ int main_save(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-#endif /* LIBXL_HAVE_NO_SUSPEND_RESUME */
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
 
 
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index c813732838..93766f631b 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -38,11 +38,6 @@ static void suspend_domain(uint32_t domid)
     libxl_domain_suspend_only(ctx, domid, NULL);
 }
 
-static void resume_domain(uint32_t domid)
-{
-    libxl_domain_resume(ctx, domid, 1, NULL);
-}
-
 int main_suspend(int argc, char **argv)
 {
     int opt;
@@ -55,6 +50,12 @@ int main_suspend(int argc, char **argv)
 
     return EXIT_SUCCESS;
 }
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
+
+static void resume_domain(uint32_t domid)
+{
+    libxl_domain_resume(ctx, domid, 1, NULL);
+}
 
 int main_resume(int argc, char **argv)
 {
@@ -68,7 +69,6 @@ int main_resume(int argc, char **argv)
 
     return EXIT_SUCCESS;
 }
-#endif
 
 static void pause_domain(uint32_t domid)
 {
-- 
2.43.0


