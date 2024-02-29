Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED886C18C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 08:02:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686852.1069384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfaQI-0005AQ-HK; Thu, 29 Feb 2024 07:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686852.1069384; Thu, 29 Feb 2024 07:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfaQI-00058k-EU; Thu, 29 Feb 2024 07:01:42 +0000
Received: by outflank-mailman (input) for mailman id 686852;
 Thu, 29 Feb 2024 07:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MycN=KG=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rfaQH-00058c-CO
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 07:01:41 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62005e69-d6d0-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 08:01:38 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412b5a3d2e3so3764265e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 23:01:38 -0800 (PST)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 q11-20020a05600c46cb00b00412b4dca795sm1112700wmo.7.2024.02.28.23.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 23:01:36 -0800 (PST)
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
X-Inumbo-ID: 62005e69-d6d0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1709190098; x=1709794898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+XvJ1Fl3pHzHwaInzg8gm5Lb2VaZTApN77ZDCzckBU=;
        b=fIrPaXIHGkz4qgZ1MptkHkIhiYDZoam308A+FgpRjVvKB4fw2MPq+M4ezaneZ9Jgym
         baJ1VWx8PFU5/35KHf6rEHL7p1VVRvtmxkuHNGlc8d+04PQAipGZ/BKTe8P53qYSBRKH
         no7uLgRC0iOlGE6fnWIBqrs38rT5JiwDhEyL2ZPV3UjVXoYm1GsWwKfcA3szls3rOg31
         nbfFQpENhM+Y4Hr7AjP+R+9Vya0YoOdOd5P3q76YWyn+vPvT2X8W73FfdmFfdRdMn9st
         EzAGsh2wJVPVfUs6ZliusB7M+w/IF452zcjmrS11zokVEbXvaIg54z8IXhKpgctWv0pV
         v/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709190098; x=1709794898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+XvJ1Fl3pHzHwaInzg8gm5Lb2VaZTApN77ZDCzckBU=;
        b=axqsM8s2fzHYecAk0O5AUMnBsnDAiFkUINNpk0YS7X2NZJe8XfYEdMItHzSp4PAPHF
         uFJ96eZWs8cxIZTy5DrD43mPGBqlYQN8WKeUKZFBIPx2AQj3rEndEmZQRGXtPBqCpQZc
         TVv71aM0alzGFCZXLa7RqCkyke0klLHQACscTt6qh+bzsPIEllUEPPKQAzgoauriAaTV
         +isq6YMESHFTDp2swT/pb9Cx8oT1nChPOR7jivNBBjCUg2KY0+ycf8SJZ2aZEF/FkkkI
         uoNRHlTpN0uqhRs8eIy1p+TwSk3Cuo6YgcdO2sCZp4xXl2DEQwWbafdQy4eAwPuMzzub
         8oAA==
X-Gm-Message-State: AOJu0YwRfGWxD7seDLy8lLT2pBd0K/mMesmp/pjfhYo1dck1TK+rm0K7
	WtXRYifRg1fm/f3exjXCLUObcqHQVkoacjcfNtGbMOYZX85ADHfcQHdoAyJta3aIQDIT/0pi4LZ
	62htbVw==
X-Google-Smtp-Source: AGHT+IFZfT6xfkRkUXf4s8EmWrprK9vrXBueCfy1deQZH/oAhpSdos9Ld1d/h9tG1HGqp/f1oPyspw==
X-Received: by 2002:a05:600c:1c02:b0:412:65a5:c9f4 with SMTP id j2-20020a05600c1c0200b0041265a5c9f4mr1102154wms.28.1709190097579;
        Wed, 28 Feb 2024 23:01:37 -0800 (PST)
From: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xl: add suspend-to-ram and resume subcommands
Date: Thu, 29 Feb 2024 08:00:10 +0100
Message-Id: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The xl command doesn't provide suspend/resume, so add them :
  xl suspend-to-ram <Domain>
  xl resume <Domain>

This patch follows a discussion on XenDevel: when you want the
virtualized equivalent of "sleep"-ing a host, it's better to
suspend/resume than to pause/unpause a domain.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

---
- Tested on v4.17, x86
- the function "libxl_domain_resume" is called like libvirt does, so
  using a "co-operative resume", but I don't know what it means (:
- there may be a problem with the words resume <-> restore, like
  for "LIBXL_HAVE_NO_SUSPEND_RESUME"
- for the docs, I only slightly adapted a copy/paste from xl pause ...
---
---
 docs/man/xl.1.pod.in    | 10 ++++++++++
 tools/xl/xl.h           |  2 ++
 tools/xl/xl_cmdtable.c  | 10 ++++++++++
 tools/xl/xl_vmcontrol.c | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index bed8393473..63d80f1449 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -682,6 +682,10 @@ Pass the VNC password to vncviewer via stdin.
 
 =back
 
+=item B<resume> I<domain-id>
+
+Resume a domain, after having been suspended to RAM.
+
 =item B<save> [I<OPTIONS>] I<domain-id> I<checkpointfile> [I<configfile>]
 
 Saves a running domain to a state file so that it can be restored
@@ -760,6 +764,12 @@ in response to this event.
 
 =back
 
+=item B<suspend-to-ram> I<domain-id>
+
+Suspend a domain to RAM.  When in a suspended state the domain will still
+consume allocated resources (such as memory), but will not be eligible for
+scheduling by the Xen hypervisor. It is in a shutdown state, but not dying.
+
 =item B<sysrq> I<domain-id> I<letter>
 
 Send a <Magic System Request> to the domain, each type of request is
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 9c86bb1d98..716ad32423 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -133,6 +133,8 @@ int main_migrate(int argc, char **argv);
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
 int main_unpause(int argc, char **argv);
+int main_suspendtoram(int argc, char **argv);
+int main_resume(int argc, char **argv);
 int main_destroy(int argc, char **argv);
 int main_shutdown(int argc, char **argv);
 int main_reboot(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 62bdb2aeaa..1382282252 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -136,6 +136,16 @@ const struct cmd_spec cmd_table[] = {
       "Unpause a paused domain",
       "<Domain>",
     },
+    { "suspend-to-ram",
+      &main_suspendtoram, 0, 1,
+      "Suspend a domain to RAM",
+      "<Domain>",
+    },
+    { "resume",
+      &main_resume, 0, 1,
+      "Resume a domain from RAM",
+      "<Domain>",
+    },
     { "console",
       &main_console, 0, 0,
       "Attach to domain's console",
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 98f6bd2e76..ba45f89c5a 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -42,6 +42,16 @@ static void unpause_domain(uint32_t domid)
     libxl_domain_unpause(ctx, domid, NULL);
 }
 
+static void suspend_domain_toram(uint32_t domid)
+{
+    libxl_domain_suspend_only(ctx, domid, NULL);
+}
+
+static void resume_domain(uint32_t domid)
+{
+    libxl_domain_resume(ctx, domid, 1, NULL);
+}
+
 static void destroy_domain(uint32_t domid, int force)
 {
     int rc;
@@ -82,6 +92,32 @@ int main_unpause(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
+int main_suspendtoram(int argc, char **argv)
+{
+    int opt;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "suspend-to-ram", 1) {
+        /* No options */
+    }
+
+    suspend_domain_toram(find_domain(argv[optind]));
+
+    return EXIT_SUCCESS;
+}
+
+int main_resume(int argc, char **argv)
+{
+    int opt;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "resume", 1) {
+        /* No options */
+    }
+
+    resume_domain(find_domain(argv[optind]));
+
+    return EXIT_SUCCESS;
+}
+
 int main_destroy(int argc, char **argv)
 {
     int opt;
-- 
2.39.2


