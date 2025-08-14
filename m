Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34BBB2592E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 03:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080524.1440911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMu0-0007gu-T3; Thu, 14 Aug 2025 01:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080524.1440911; Thu, 14 Aug 2025 01:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMu0-0007eG-PW; Thu, 14 Aug 2025 01:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1080524;
 Thu, 14 Aug 2025 01:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7ku=22=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1umMtz-0006vN-6m
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 01:37:11 +0000
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [2607:f8b0:4864:20::d2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 317619b0-78af-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 03:37:10 +0200 (CEST)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-88432d99304so500939f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 18:37:10 -0700 (PDT)
Received: from kf-m2g5.. ([2607:fb91:1183:972:ee53:76c5:e875:9619])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-883f198db02sm467297239f.16.2025.08.13.18.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 18:37:08 -0700 (PDT)
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
X-Inumbo-ID: 317619b0-78af-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755135429; x=1755740229; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYjrOnp/98fI4shqR2qZGODzcHFvJmoqS2F7odknl14=;
        b=A5erXSIdSZV9bP/fCQS3DKmWcziIo8AGZySVjkG0Osz6gJYGdOaRUqrIQeQCHjxr4S
         yOos5e//m0lqWuTELmFc0XSvrf8aup0N/xMsGxBTv0YrxUJzBROChjAJeuq7ci8K0gpx
         m5UL4nXY9J4Gwm35fkClPsIuA9JC1UXduMr8IBnu/k3J9U+kOOxJ4BJiWf5B1PegJwHH
         8k7UFi3/9H/ky57mu5MwWVB+M3yR63DAns9hsBJ6mjRyaz5kgeWan6tMnG3RcAJ/Oye9
         6vJ1nMD1Jf8JlKf9goenx93oS88jRIWZbEk0d/+wSH0FMgyNriwnH560Nz0hFkBmQZkP
         mJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755135429; x=1755740229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYjrOnp/98fI4shqR2qZGODzcHFvJmoqS2F7odknl14=;
        b=qfben4jSfMdfQ9yhbUwaemJ4c5WFmTDEdF8eOnYo1rlC7d3dpO4KkfQAJymn4tAcca
         iiXEtRZQR86fYwKNvmWmVb/syCm9vg3fNtkZFYSKCDScL1I+66MBEHzjV+X4HQwRvhII
         HFgL4qrRE/HO67v1plIYCM1jCFm9Dgxih9mxKbtzBxfq0AmnOUMRVYhLMXtj1tbbcAvM
         yTRaaTBq3Vxtzmh5yZFK4HJdlsRfoTtnJ8k5xEm/t8k+frXJV7W3ShsOD538He99cHbl
         2/9A8WfZ6I36+0gVSGW/ILQ871OJlIepGTdlhy/FGU+Bj22sFnO4b9B2Zb5eMPIa8d+z
         ZNfA==
X-Forwarded-Encrypted: i=1; AJvYcCX+nyGSGF0VmZ6j6Pf477XdMK14eEO9VQ5RHjBXes4043BIykdEdKXreJfQUfYu6xyWkAVij1uj/to=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUbm/wmsIdSI3O3gyoXR3vHipLKmnXFl7WjONPA38RPge4LFua
	ONpFHs4HdmaM1EdXPCiD/JrqYRGXNnTznpAJD5v+CVNsBcauLmIz9OB2
X-Gm-Gg: ASbGncuTwm0eCuhwu/xNpG/4yOdee0iAfp2tkviR98BsZSMaqeaEBx9tA8YWKSIHT+O
	DKk158pOY9/zNyPIOymRsXFBdwMO/3xqdroYQxOJ+WJx4eQswjUxTVsObaied7N5RRD6JlxfCCx
	K9VuR0Yd/LU1K1HvR3b7zWjpiXdDqZXqaO7gR9k4pqXJ1T7wdSZFmcfxyYpDhSQS23CuWROH6Lp
	Ty97u9e+Jy89E3J2rBexYM/wurRoNoJElJK8rQUuXLaWKgmmCXB3GURy9NFLunLaUbj7DP4tEPb
	njOKRUIouRaEyL2z901fE2cZ45aDyy0xJgziBuRQMoWSjIjKP2Zq8o+YkVjSplN0tVbwE1ngtCg
	iNOne9Wi2zW/4hCnMN1P82MoPOe+pFIkH
X-Google-Smtp-Source: AGHT+IHoWdWVHYfsNfkHl6TNhXloRZxAVR1T8eFqwX+ooSg0nIZDMOVQaMkmROyH5boiVh3HNDm0RA==
X-Received: by 2002:a05:6602:6011:b0:881:8274:c398 with SMTP id ca18e2360f4ac-884339c2238mr70250039f.4.1755135428621;
        Wed, 13 Aug 2025 18:37:08 -0700 (PDT)
From: arraybolt3@gmail.com
To: grub-devel@gnu.org,
	xen-devel@lists.xenproject.org
Cc: Aaron Rainbolt <arraybolt3@gmail.com>
Subject: [PATCH v5 3/3] kern/xen: Add Xen command line parsing
Date: Wed, 13 Aug 2025 20:36:45 -0500
Message-ID: <20250814013645.2488043-4-arraybolt3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814013645.2488043-1-arraybolt3@gmail.com>
References: <20250814013645.2488043-1-arraybolt3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aaron Rainbolt <arraybolt3@gmail.com>

Xen traditionally allows customizing guest behavior by passing arguments
to the VM kernel via the kernel command line. This is no longer possible
when using GRUB with Xen, as the kernel command line is decided by the
GRUB configuration file within the guest, not data passed to the guest
by Xen.

To work around this limitation, enable GRUB to parse a command line
passed to it by Xen, and expose data from the command line to the GRUB
configuration as environment variables. These variables can be used in
the GRUB configuration for any desired purpose, such as extending the
kernel command line passed to the guest. The command line format is
inspired by the Linux kernel's command line format.

To reduce the risk of misuse, abuse, or accidents in production, the
command line will only be parsed if it consists entirely of 7-bit ASCII
characters, only alphabetical characters and underscores are permitted
in variable names, and all variable names must start with the string
"xen_grub_env_". This also allows room for expanding the command line
arguments accepted by GRUB in the future, should other arguments end up
becoming desirable in the future.

Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
---
 docs/grub.texi                |  52 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |   4 +
 grub-core/kern/xen/cmdline.c  | 361 ++++++++++++++++++++++++++++++++++
 grub-core/kern/xen/init.c     |   2 +
 include/grub/xen.h            |   2 +
 6 files changed, 423 insertions(+)
 create mode 100644 grub-core/kern/xen/cmdline.c

diff --git a/docs/grub.texi b/docs/grub.texi
index 34b3484..cd4e539 100644
--- a/docs/grub.texi
+++ b/docs/grub.texi
@@ -3271,6 +3271,7 @@ GRUB.  Others may be used freely in GRUB configuration files.
 @menu
 * Special environment variables::
 * Environment block::
+* Passing environment variables through Xen::
 @end menu
 
 
@@ -3871,6 +3872,57 @@ using BIOS or EFI functions (no ATA, USB or IEEE1275).
 @command{grub-mkconfig} uses this facility to implement
 @samp{GRUB_SAVEDEFAULT} (@pxref{Simple configuration}).
 
+@node Passing environment variables through Xen
+@section Passing environment variables through Xen
+
+If you are using a GRUB image as the kernel for a PV or PVH Xen virtual
+machine, you can pass environment variables from Xen's dom0 to the VM through
+the Xen-provided kernel command line. When combined with a properly configured
+guest, this can be used to customize the guest's behavior on bootup via the
+VM's Xen configuration file.
+
+GRUB will parse the kernel command line passed to it by Xen during bootup.
+The command line will be split into space-delimited words. Single and
+double quotes may be used to quote words or portions of words that contain
+spaces. Single quotes will be considered part of a word if inside double
+quotes, and vice versa. Arbitrary characters may be backslash-escaped to make
+them a literal component of a word rather than being parsed as quotes or word
+separators. The command line must consist entirely of printable 7-bit ASCII
+characters and spaces. If a non-printing ASCII character is found anywhere in
+the command line, the entire command line will be ignored by GRUB. (This
+splitter algorithm is meant to behave somewhat like Bash's word splitting.)
+
+Each word should be a variable assignment in the format ``variable'' or
+``variable=value''. Variable names must contain only the characters A-Z, a-z,
+and underscore (``_''). Variable names must begin with the string
+``xen_grub_env_''. Variable values can contain arbitrary printable 7-bit
+ASCII characters and space. If any variable contains an illegal name, that
+variable will be ignored.
+
+If a variable name and value are both specified, the variable will be set to
+the specified value. If only a variable name is specified, the variable's
+value will be set to ``1''.
+
+The following is a simple example of how to use this functionality to append
+arbitrary variables to a guest's kernel command line:
+
+@example
+# In the Xen configuration file for the guest
+name = "linux_vm"
+type = "pvh"
+kernel = "/path/to/grub-i386-xen_pvh.bin"
+extra = "xen_grub_env_linux_append='loglevel=3'"
+memory = 1024
+disk = [ "file:/srv/vms/linux_vm.img,sda,w" ]
+
+# In the guest's GRUB configuration file
+menuentry "Linux VM with dom0-specified kernel parameters" @{
+    search --set=root --label linux_vm --hint hd0,msdos1
+    linux /boot/vmlinuz root=LABEL=linux_vm $@{xen_grub_env_linux_append@}
+    initrd /boot/initrd.img
+@}
+@end example
+
 @node Modules
 @chapter Modules
 
diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
index b3f7119..df0f266 100644
--- a/grub-core/Makefile.core.def
+++ b/grub-core/Makefile.core.def
@@ -248,6 +248,7 @@ kernel = {
   xen = term/xen/console.c;
   xen = disk/xen/xendisk.c;
   xen = commands/boot.c;
+  xen = kern/xen/cmdline.c;
 
   i386_xen_pvh = commands/boot.c;
   i386_xen_pvh = disk/xen/xendisk.c;
@@ -255,6 +256,7 @@ kernel = {
   i386_xen_pvh = kern/i386/xen/tsc.c;
   i386_xen_pvh = kern/i386/xen/pvh.c;
   i386_xen_pvh = kern/xen/init.c;
+  i386_xen_pvh = kern/xen/cmdline.c;
   i386_xen_pvh = term/xen/console.c;
 
   ia64_efi = kern/ia64/efi/startup.S;
diff --git a/grub-core/kern/i386/xen/pvh.c b/grub-core/kern/i386/xen/pvh.c
index 91fbca8..52020b7 100644
--- a/grub-core/kern/i386/xen/pvh.c
+++ b/grub-core/kern/i386/xen/pvh.c
@@ -352,6 +352,10 @@ grub_xen_setup_pvh (void)
   grub_xen_mm_init_regions ();
 
   grub_rsdp_addr = pvh_start_info->rsdp_paddr;
+
+  grub_strncpy ((char *) grub_xen_start_page_addr->cmd_line,
+		(const char *) pvh_start_info->cmdline_paddr,
+		GRUB_XEN_MAX_GUEST_CMDLINE);
 }
 
 grub_err_t
diff --git a/grub-core/kern/xen/cmdline.c b/grub-core/kern/xen/cmdline.c
new file mode 100644
index 0000000..8021bf8
--- /dev/null
+++ b/grub-core/kern/xen/cmdline.c
@@ -0,0 +1,361 @@
+/*
+ *  GRUB  --  GRand Unified Bootloader
+ *  Copyright (C) 2025  Free Software Foundation, Inc.
+ *
+ *  GRUB is free software: you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation, either version 3 of the License, or
+ *  (at your option) any later version.
+ *
+ *  GRUB is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <grub/env.h>
+#include <grub/misc.h>
+#include <grub/mm.h>
+#include <grub/xen.h>
+#include <grub/err.h>
+
+enum splitter_state
+{
+  SPLITTER_NORMAL = 0x0,
+  SPLITTER_HIT_BACKSLASH = 0x1,
+  SPLITTER_IN_SINGLE_QUOTES = 0x2,
+  SPLITTER_IN_DOUBLE_QUOTES = 0x4,
+};
+typedef enum splitter_state splitter_state_t;
+
+/*
+ * The initial size of the current_word buffer. The buffer may be resized as
+ * needed.
+ */
+#define PARSER_BASE_WORD_SIZE 32
+
+struct parser_state
+{
+  char **words;
+  grub_size_t words_count;
+  char *current_word;
+  grub_size_t current_word_len;
+  grub_size_t current_word_pos;
+};
+typedef struct parser_state parser_state_t;
+
+static grub_err_t
+append_char_to_word (parser_state_t *ps, char c, bool allow_null)
+{
+  /*
+   * We ban any chars that are not in the ASCII printable range. If
+   * allow_null == true, we make an exception for NUL. (This is needed so that
+   * append_word_to_list can add a NUL terminator to the word).
+   */
+  if (!grub_isprint (c) && allow_null == false)
+    return GRUB_ERR_BAD_ARGUMENT;
+  else if (allow_null == true && c != '\0')
+    return GRUB_ERR_BAD_ARGUMENT;
+
+  if (ps->current_word_pos == ps->current_word_len)
+    {
+      ps->current_word = grub_realloc (ps->current_word, ps->current_word_len *= 2);
+      if (ps->current_word == NULL)
+        {
+          ps->current_word_len /= 2;
+          return grub_errno;
+        }
+    }
+
+  ps->current_word[ps->current_word_pos++] = c;
+  return GRUB_ERR_NONE;
+}
+
+static grub_err_t
+append_word_to_list (parser_state_t *ps)
+{
+  /* No-op on empty words. */
+  if (ps->current_word_pos == 0)
+    return GRUB_ERR_NONE;
+
+  if (append_char_to_word (ps, '\0', true) != GRUB_ERR_NONE)
+    grub_fatal ("couldn't append NUL terminator to word during Xen cmdline parsing");
+
+  ps->current_word_len = grub_strlen (ps->current_word) + 1;
+  ps->current_word = grub_realloc (ps->current_word, ps->current_word_len);
+  if (ps->current_word == NULL)
+    return grub_errno;
+  ps->words = grub_realloc (ps->words, ++ps->words_count * sizeof (char *));
+  if (ps->words == NULL)
+    return grub_errno;
+  ps->words[ps->words_count - 1] = ps->current_word;
+
+  ps->current_word_len = PARSER_BASE_WORD_SIZE;
+  ps->current_word_pos = 0;
+  ps->current_word = grub_malloc (ps->current_word_len);
+  if (ps->current_word == NULL)
+    return grub_errno;
+
+  return GRUB_ERR_NONE;
+}
+
+static bool
+is_key_safe (char *key, grub_size_t len)
+{
+  grub_size_t i;
+
+  for (i = 0; i < len; i++)
+    if (!grub_isalpha (key[i]) && key[i] != '_')
+      return false;
+
+  return true;
+}
+
+void
+grub_parse_xen_cmdline (void)
+{
+  parser_state_t ps = {0};
+  splitter_state_t ss = SPLITTER_NORMAL;
+
+  const char *cmdline = (const char *) grub_xen_start_page_addr->cmd_line;
+  grub_size_t cmdline_len;
+  bool cmdline_valid = false;
+  char **param_keys = NULL;
+  char **param_vals = NULL;
+  grub_size_t param_dict_len = 0;
+  grub_size_t param_dict_pos = 0;
+  char current_char = '\0';
+  grub_size_t i = 0;
+
+  /*
+   * The following algorithm is used to parse the Xen command line:
+   *
+   * - The command line is split into space-separated words.
+   *   - Single and double quotes may be used to suppress the splitting
+   *     behavior of spaces.
+   *   - Double quotes are appended to the current word verbatim if they
+   *     appear within a single-quoted string portion, and vice versa.
+   *   - Backslashes may be used to cause the next character to be
+   *     appended to the current word verbatim. This is only useful when
+   *     used to escape quotes, spaces, and backslashes, but for simplicity
+   *     we allow backslash-escaping anything.
+   * - After splitting the command line into words, each word is checked to
+   *   see if it contains an equals sign.
+   *   - If it does, it is split on the equals sign into a key-value pair. The
+   *     key is then treated as an variable name, and the value is treated as
+   *     the variable's value.
+   *   - If it does not, the entire word is treated as a variable name. The
+   *     variable's value is implicitly considered to be `1`.
+   * - All variables detected on the command line are checked to see if their
+   *   names begin with the string `xen_grub_env_`. Variables that do not pass
+   *   this check are discarded, variables that do pass this check are
+   *   exported so they are available to the GRUB configuration.
+   *
+   * This behavior is intended to somewhat mimic the splitter behavior in Bash
+   * and in GRUB's config file parser.
+   */
+
+  ps.current_word_len = PARSER_BASE_WORD_SIZE;
+  ps.current_word = grub_malloc (ps.current_word_len);
+  if (ps.current_word == NULL)
+    goto cleanup_main;
+
+  for (i = 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
+    {
+      if (cmdline[i] == '\0')
+        {
+          cmdline_valid = true;
+          break;
+        }
+    }
+
+  if (cmdline_valid == false)
+    {
+      grub_error (GRUB_ERR_BAD_ARGUMENT,
+		  "command line from Xen is not NUL-terminated");
+      grub_print_error ();
+      goto cleanup_main;
+    }
+
+  cmdline_len = grub_strlen (cmdline);
+  for (i = 0; i < cmdline_len; i++)
+    {
+      current_char = cmdline[i];
+
+      /*
+       * If the previous character was a backslash, append the current
+       * character to the word verbatim
+       */
+      if (ss & SPLITTER_HIT_BACKSLASH)
+        {
+          ss &= ~SPLITTER_HIT_BACKSLASH;
+          if (append_char_to_word (&ps, current_char, false) != GRUB_ERR_NONE)
+            goto cleanup_main;
+          continue;
+        }
+
+      switch (current_char)
+        {
+        case '\\':
+          /* Backslashes escape arbitrary characters. */
+          ss |= SPLITTER_HIT_BACKSLASH;
+          break;
+
+        case '\'':
+          /*
+           * Single quotes suppress word splitting and double quoting until
+           * the next single quote is encountered.
+           */
+          if (ss & SPLITTER_IN_DOUBLE_QUOTES)
+            {
+              if (append_char_to_word (&ps, current_char, false) != GRUB_ERR_NONE)
+                goto cleanup_main;
+              break;
+            }
+
+          ss ^= SPLITTER_IN_SINGLE_QUOTES;
+          break;
+
+        case '"':
+          /*
+           * Double quotes suppress word splitting and single quoting until
+           * the next double quote is encountered.
+           */
+          if (ss & SPLITTER_IN_SINGLE_QUOTES)
+            {
+              if (append_char_to_word (&ps, current_char, false) != GRUB_ERR_NONE)
+                goto cleanup_main;
+              break;
+            }
+
+          ss ^= SPLITTER_IN_DOUBLE_QUOTES;
+          break;
+
+        case ' ':
+          /* Spaces separate words in the command line from each other. */
+          if (ss & SPLITTER_IN_SINGLE_QUOTES ||
+              ss & SPLITTER_IN_DOUBLE_QUOTES)
+            {
+              if (append_char_to_word (&ps, current_char, false) != GRUB_ERR_NONE)
+                goto cleanup_main;
+              break;
+            }
+
+          if (append_word_to_list (&ps) != GRUB_ERR_NONE)
+            goto cleanup_main;
+          break;
+
+        default:
+          if (append_char_to_word (&ps, current_char, false) != GRUB_ERR_NONE)
+            goto cleanup_main;
+        }
+    }
+
+  if (append_word_to_list (&ps) != GRUB_ERR_NONE)
+    goto cleanup_main;
+
+  param_keys = grub_malloc (ps.words_count * sizeof (char *));
+  if (param_keys == NULL)
+    goto cleanup_main;
+  param_vals = grub_malloc (ps.words_count * sizeof (char *));
+  if (param_vals == NULL)
+    goto cleanup_main;
+
+  for (i = 0; i < ps.words_count; i++)
+    {
+      char *eq_pos;
+
+      ps.current_word = ps.words[i];
+      ps.current_word_len = grub_strlen (ps.current_word) + 1;
+      eq_pos = grub_strchr (ps.current_word, '=');
+
+      if (eq_pos != NULL)
+        {
+          /*
+           * Both pre_eq_len and post_eq_len represent substring lengths
+           * without a NUL terminator.
+           */
+          grub_size_t pre_eq_len = (grub_size_t) (eq_pos - ps.current_word);
+          /*
+           * ps.current_word_len includes the NUL terminator, so we subtract
+           * one to get rid of the terminator, and one more to get rid of the
+           * equals sign.
+           */
+          grub_size_t post_eq_len = (ps.current_word_len - 2) - pre_eq_len;
+
+          if (is_key_safe (ps.current_word, pre_eq_len) == true)
+            {
+              param_dict_pos = param_dict_len++;
+              param_keys[param_dict_pos] = grub_malloc (pre_eq_len + 1);
+              if (param_keys == NULL)
+                goto cleanup_main;
+              param_vals[param_dict_pos] = grub_malloc (post_eq_len + 1);
+              if (param_vals == NULL)
+                goto cleanup_main;
+
+              grub_strncpy (param_keys[param_dict_pos], ps.current_word, pre_eq_len);
+              grub_strncpy (param_vals[param_dict_pos],
+			    ps.current_word + pre_eq_len + 1, post_eq_len);
+              param_keys[param_dict_pos][pre_eq_len] = '\0';
+              param_vals[param_dict_pos][post_eq_len] = '\0';
+            }
+        }
+      else if (is_key_safe (ps.current_word, ps.current_word_len - 1) == true)
+        {
+          param_dict_pos = param_dict_len++;
+          param_keys[param_dict_pos] = grub_malloc (ps.current_word_len);
+          if (param_keys == NULL)
+            goto cleanup_main;
+          param_vals[param_dict_pos] = grub_malloc (2);
+          if (param_vals == NULL)
+            goto cleanup_main;
+
+          grub_strncpy (param_keys[param_dict_pos], ps.current_word,
+			ps.current_word_len);
+          if (param_keys[param_dict_pos][ps.current_word_len - 1] != '\0' )
+            grub_fatal ("NUL terminator missing from key during Xen cmdline parsing");
+          grub_strcpy (param_vals[param_dict_pos], "1");
+        }
+     
+    }
+
+  for (i = 0; i < param_dict_len; i++)
+    {
+      /*
+       * Find keys that start with "xen_grub_env_" and export them
+       * as environment variables.
+       */
+      if (grub_strncmp (param_keys[i],
+			"xen_grub_env_",
+			sizeof ("xen_grub_env_") - 1) != 0)
+        continue;
+
+      if (grub_env_set (param_keys[i], param_vals[i]) != GRUB_ERR_NONE)
+        {
+          grub_printf ("warning: could not set environment variable `%s' to value `%s'\n",
+		       param_keys[i], param_vals[i]);
+          continue;
+        }
+
+      if (grub_env_export (param_keys[i]) != GRUB_ERR_NONE)
+        grub_printf ("warning: could not export environment variable `%s'",
+		     param_keys[i]);
+    }
+
+ cleanup_main:
+  for (i = 0; i < ps.words_count; i++)
+    grub_free (ps.words[i]);
+
+  for (i = 0; i < param_dict_len; i++)
+    {
+      grub_free (param_keys[i]);
+      grub_free (param_vals[i]);
+    }
+
+  grub_free (param_keys);
+  grub_free (param_vals);
+  grub_free (ps.words);
+}
diff --git a/grub-core/kern/xen/init.c b/grub-core/kern/xen/init.c
index 782ca72..69cf59f 100644
--- a/grub-core/kern/xen/init.c
+++ b/grub-core/kern/xen/init.c
@@ -581,6 +581,8 @@ grub_machine_init (void)
   grub_xendisk_init ();
 
   grub_boot_init ();
+
+  grub_parse_xen_cmdline ();
 }
 
 void
diff --git a/include/grub/xen.h b/include/grub/xen.h
index 91cb7cf..7f9efee 100644
--- a/include/grub/xen.h
+++ b/include/grub/xen.h
@@ -89,6 +89,8 @@ void grub_console_init (void);
 void grub_xendisk_fini (void);
 void grub_xendisk_init (void);
 
+void grub_parse_xen_cmdline (void);
+
 #ifdef __x86_64__
 typedef grub_uint64_t grub_xen_mfn_t;
 #else
-- 
2.50.1


