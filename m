Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD07AC98DE
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001764.1381980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBGP-0003EG-Ln; Sat, 31 May 2025 01:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001764.1381980; Sat, 31 May 2025 01:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBGP-000398-IZ; Sat, 31 May 2025 01:43:57 +0000
Received: by outflank-mailman (input) for mailman id 1001764;
 Sat, 31 May 2025 00:54:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yfT0=YP=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uLAUt-0000GH-08
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:54:51 +0000
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [2607:f8b0:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da31296d-3db9-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:54:49 +0200 (CEST)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3dc6c0b0a3fso672555ab.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 17:54:49 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb91:729:c9c7:4a01:2714:55f9:a90c])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-86cf5ecf006sm83956839f.28.2025.05.30.17.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 17:54:47 -0700 (PDT)
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
X-Inumbo-ID: da31296d-3db9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748652888; x=1749257688; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5spsPu6UV7ElyfOSpiYDryfMs8xGGj7JCGQGjfOEpA=;
        b=hVdRYlRMJSoo3Jh0ia/PtFGxTdxfHifdIA8/tZrPxI/42zhc9pqoVN8XqDLY8wGwP9
         VYQRtuqiA0496gSNgeHGA7tQLLo9bo35U7fI5IT1wmi2v+yMHdbMU529RCLLpIIUYUy8
         QZKXEqW3WSwWFbG6iKiYCumvI1in4teyykiiW7InJqd4MKUvAG5cW2IqUADK304UA5Fi
         VV6FMFIOjHQe4Kf47VupnopY0AnN4tvX8cElzKUkhn0MybTTBWMt21CxENeEfyCEKNxy
         +53E6908iCGliZrnz2ljXoPcg560Vt3X38YKfxytfrp7eHJCXz98z1KsBzA/dtx+rZTZ
         1wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748652888; x=1749257688;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5spsPu6UV7ElyfOSpiYDryfMs8xGGj7JCGQGjfOEpA=;
        b=qzdrbSJn0Vo4bT/Ma3SIah/q95jcNZgItA/F/wtM6RJEakFCD5ApVbvfQwKGjdo7A7
         PPX8/mOTX4kYNjn/nA+XRsyT1IHx3htdjy7y/pOvR2G+x89BTpu+rWeuO9YYTrdxvAky
         QKIAWC2ccM38KVzeO7QANZQY6L57eEaZacNM4flGrbn6Jx/1OBYb1DdnGWQDu/pQfEyZ
         O2VnRXD6zHbeyeco3KU0VoIzMIpXLbBsdY7Jp3hOUkkJ/fqAgsmEl9yatiVcuEKFbis4
         mBaQCGTIw/1i69mHfz6Mf6Mhx4hopv2aBpPuDxWkYdSdYp1wzcoj9UAWJh8NZlX1Wl2T
         XeKg==
X-Gm-Message-State: AOJu0Yx6+dW4AX0GxIILu/uY2sl+DuaHcvJpMHdCeKn/L/h3NNFWauhs
	Sh6YQxyezFywpv+p9abeqGSl2Hkyv2t7tgnJrvkxYWZW1ocXKoKbuHzy
X-Gm-Gg: ASbGnctajYOUH1iKBxpAEQ6934w9GbM61N+DzfMx8Synp/ADTpRaG9w/i1MChqA3csq
	I/QCLLx9ZxKIa9AHkscM0lXzo9gJAFvhtr1R1iSF758J+akIAuQqsRlhSVYzC0SBmQzhUbVQMUK
	aojWKb9q5dR+W75bnjoNN52Yr7gwnHeImycn/2bgmGHCC/Yt715tRsed8HaVkB3EtZ/6lzMeOlE
	PrVv4FcdJGsOQwLjTZy2L+1JOj0r21xkOaVg80YNgIahlT1N6rZrbcerl8njmJVJBC9QdzgaXiw
	neccmZd3qe2lP55NR2RtcmxuOaeCJCDsI6nhjVxgu9jQ9DzX
X-Google-Smtp-Source: AGHT+IFw3Vhx6o1QsLR5UHPH2Xom7iLgxpvrWujEYAlYSIWIbpk/xNl2WeC7eTmy4d9409yljloOSA==
X-Received: by 2002:a05:6602:2c87:b0:85a:fd80:df2b with SMTP id ca18e2360f4ac-86d026396f7mr141024039f.2.1748652887963;
        Fri, 30 May 2025 17:54:47 -0700 (PDT)
Date: Fri, 30 May 2025 19:54:38 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org, dkiper@net-space.pl, phcoder@gmail.com
Subject: [PATCH v2 1/1] kern/xen: Add Xen command line parsing
Message-ID: <20250530195438.4d243157@kf-m2g5>
In-Reply-To: <20250530195306.41af4199@kf-m2g5>
References: <20250530195306.41af4199@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XuEbgScqF3BIrX3JSBisdIA";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/XuEbgScqF3BIrX3JSBisdIA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

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
arguments accepted by GRUB in the future, in case additional APIs using
the Xen kernel command line need to be introduced.

Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
---
 docs/grub.texi                |  50 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |  14 ++
 grub-core/kern/main.c         |  12 ++
 grub-core/kern/xen/cmdline.c  | 344 ++++++++++++++++++++++++++++++++++
 include/grub/xen.h            |   2 +
 6 files changed, 424 insertions(+)
 create mode 100644 grub-core/kern/xen/cmdline.c

diff --git a/docs/grub.texi b/docs/grub.texi
index 34b3484..ce82483 100644
--- a/docs/grub.texi
+++ b/docs/grub.texi
@@ -3271,6 +3271,7 @@ GRUB.  Others may be used freely in GRUB configuratio=
n files.
 @menu
 * Special environment variables::
 * Environment block::
+* Passing environment variables through Xen::
 @end menu
=20
=20
@@ -3871,6 +3872,55 @@ using BIOS or EFI functions (no ATA, USB or IEEE1275=
).
 @command{grub-mkconfig} uses this facility to implement
 @samp{GRUB_SAVEDEFAULT} (@pxref{Simple configuration}).
=20
+@node Passing environment variables through Xen
+@section Passing environment variables through Xen
+
+If you are using a GRUB image as the kernel for a PV or PVH Xen virtual
+machine, you can pass environment variables from Xen's dom0 to the VM thro=
ugh
+the Xen-provided kernel command line. When combined with a properly config=
ured
+guest, this can be used to customize the guest's behavior on bootup via the
+VM's Xen configuration file.
+
+GRUB will parse the kernel command line passed to it by Xen during bootup.
+The command line will be split into space-delimited words. Single and
+double quotes may be used to quote words or portions of words that contain
+spaces. Arbitrary characters may be backslash-escaped to make them a liter=
al
+component of a word rather than being parsed as quotes or word separators.=
 The
+command line must consist entirely of printable 7-bit ASCII characters and
+spaces. If a non-printing ASCII character is found anywhere in the command
+line, the entire command line will be ignored by GRUB.
+
+Each word should be a variable assignment in the format ``variable'' or
+``variable=3Dvalue''. Variable names must contain only the characters A-Z,=
 a-z,
+and underscore (``_''). Variable names must begin with the string
+``xen_grub_env_''. Variable values can contain arbitrary printable 7-bit
+ASCII characters and space. If any variable contains an illegal name, that
+variable will be ignored.
+
+If a variable name and value are both specified, the variable will be set =
to
+the specified value. If only a variable name is specified, the variable's
+value will be set to ``1''.
+
+The following is a simple example of how to use this functionality to appe=
nd
+arbitrary variables to a guest's kernel command line:
+
+@example
+# In the Xen configuration file for the guest
+name =3D "linux_vm"
+type =3D "pvh"
+kernel =3D "/path/to/grub-i386-xen_pvh.bin"
+extra =3D "xen_grub_env_kernelappend=3D'loglevel=3D3'"
+memory =3D 1024
+disk =3D [ "file:/srv/vms/linux_vm.img,sda,w" ]
+
+# In the guest's GRUB configuration file
+menuentry "Linux VM with dom0-specified kernel parameters" @{
+    search --set=3Droot --label linux_vm --hint hd0,msdos1
+    linux /boot/vmlinuz root=3DLABEL=3Dlinux_vm $@{xen_grub_env_kernelappe=
nd@}
+    initrd /boot/initrd.img
+@}
+@end example
+
 @node Modules
 @chapter Modules
=20
diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
index f70e02e..79e681a 100644
--- a/grub-core/Makefile.core.def
+++ b/grub-core/Makefile.core.def
@@ -248,6 +248,7 @@ kernel =3D {
   xen =3D term/xen/console.c;
   xen =3D disk/xen/xendisk.c;
   xen =3D commands/boot.c;
+  xen =3D kern/xen/cmdline.c;
=20
   i386_xen_pvh =3D commands/boot.c;
   i386_xen_pvh =3D disk/xen/xendisk.c;
@@ -255,6 +256,7 @@ kernel =3D {
   i386_xen_pvh =3D kern/i386/xen/tsc.c;
   i386_xen_pvh =3D kern/i386/xen/pvh.c;
   i386_xen_pvh =3D kern/xen/init.c;
+  i386_xen_pvh =3D kern/xen/cmdline.c;
   i386_xen_pvh =3D term/xen/console.c;
=20
   ia64_efi =3D kern/ia64/efi/startup.S;
diff --git a/grub-core/kern/i386/xen/pvh.c b/grub-core/kern/i386/xen/pvh.c
index 91fbca8..12df2d8 100644
--- a/grub-core/kern/i386/xen/pvh.c
+++ b/grub-core/kern/i386/xen/pvh.c
@@ -321,6 +321,8 @@ void
 grub_xen_setup_pvh (void)
 {
   grub_addr_t par;
+  const char *xen_cmdline;
+  int i;
=20
   grub_xen_cpuid_base ();
   grub_xen_setup_hypercall_page ();
@@ -352,6 +354,18 @@ grub_xen_setup_pvh (void)
   grub_xen_mm_init_regions ();
=20
   grub_rsdp_addr =3D pvh_start_info->rsdp_paddr;
+
+  xen_cmdline =3D (const char *) pvh_start_info->cmdline_paddr;
+  for (i =3D 0; i < MAX_GUEST_CMDLINE; i++)
+    {
+      if (xen_cmdline[i] =3D=3D '\0')
+        {
+          grub_strncpy ((char *) grub_xen_start_page_addr->cmd_line,
+			(char *) pvh_start_info->cmdline_paddr,
+			MAX_GUEST_CMDLINE);
+          break;
+        }
+    }
 }
=20
 grub_err_t
diff --git a/grub-core/kern/main.c b/grub-core/kern/main.c
index 143a232..f96b16f 100644
--- a/grub-core/kern/main.c
+++ b/grub-core/kern/main.c
@@ -40,6 +40,10 @@
 static bool cli_disabled =3D false;
 static bool cli_need_auth =3D false;
=20
+#if defined (GRUB_MACHINE_XEN) || defined (GRUB_MACHINE_XEN_PVH)
+#include <grub/xen.h>
+#endif
+
 grub_addr_t
 grub_modules_get_end (void)
 {
@@ -351,6 +355,14 @@ grub_main (void)
   grub_env_export ("root");
   grub_env_export ("prefix");
=20
+  /*
+   * Parse command line parameters from Xen and export them as environment
+   * variables
+   */
+#if defined (GRUB_MACHINE_XEN) || defined (GRUB_MACHINE_XEN_PVH)
+  grub_parse_xen_cmdline ();
+#endif
+
   /* Reclaim space used for modules.  */
   reclaim_module_space ();
=20
diff --git a/grub-core/kern/xen/cmdline.c b/grub-core/kern/xen/cmdline.c
new file mode 100644
index 0000000..8d3422d
--- /dev/null
+++ b/grub-core/kern/xen/cmdline.c
@@ -0,0 +1,344 @@
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
+
+enum parse_flags
+{
+  PARSER_HIT_BACKSLASH =3D 0x1,
+  PARSER_IN_SINGLE_QUOTES =3D 0x2,
+  PARSER_IN_DOUBLE_QUOTES =3D 0x4,
+};
+
+#define PARSER_BASE_WORD_LEN 16
+
+static grub_size_t word_list_len;
+static char **word_list;
+static grub_size_t current_word_len;
+static grub_size_t current_word_pos;
+static char *current_word;
+static char current_char;
+
+static bool
+append_char_to_word (bool allow_null)
+{
+  /*
+   * Fail if the current char is outside of the range 0x20 to 0x7E. If
+   * allow_null is true, make an exception for 0x00. This is a safeguard
+   * against likely-invalid data.
+   */
+  if ( (!(current_char >=3D 0x20) || !(current_char <=3D 0x7E) )
+      && (current_char !=3D '\0' || allow_null =3D=3D false))
+    return false;
+
+  if (current_word_pos =3D=3D current_word_len)
+    {
+      current_word_len *=3D 2;
+      current_word =3D grub_realloc (current_word, current_word_len);
+      if (current_word =3D=3D NULL)
+        {
+          current_word_len /=3D 2;
+          return false;
+        }
+    }
+
+  current_word[current_word_pos] =3D current_char;
+  current_word_pos++;
+  return true;
+}
+
+static bool
+append_word_to_list (void)
+{
+  /* No-op on empty words. */
+  if (current_word_pos =3D=3D 0)
+    return true;
+
+  current_char =3D '\0';
+  if (append_char_to_word (true) =3D=3D false)
+    {
+      grub_error (GRUB_ERR_BUG,
+		  "couldn't append null terminator to word during Xen cmdline parsing");
+      grub_print_error ();
+      grub_exit ();
+    }
+
+  current_word_len =3D grub_strlen (current_word) + 1;
+  current_word =3D grub_realloc (current_word, current_word_len);
+  if (current_word =3D=3D NULL)
+    return false;
+  word_list_len++;
+  word_list =3D grub_realloc (word_list, word_list_len * sizeof (char *));
+  if (word_list =3D=3D NULL)
+    return false;
+  word_list[word_list_len - 1] =3D current_word;
+
+  current_word_len =3D PARSER_BASE_WORD_LEN;
+  current_word_pos =3D 0;
+  current_word =3D grub_malloc (current_word_len);
+  if (current_word =3D=3D NULL)
+    return false;
+
+  return true;
+}
+
+static bool
+check_key_is_safe (char *key, grub_size_t len)
+{
+  grub_size_t i;
+
+  for (i =3D 0; i < len; i++)
+  {
+    /*
+     * Ensure only a-z, A-Z, and _ are allowed.
+     */
+    if (! ( (key[i] >=3D 'A' && key[i] <=3D 'Z')
+          || (key[i] >=3D 'a' && key[i] <=3D 'z')
+          || (key[i] =3D=3D '_') ) )
+      return false;
+  }
+  return true;
+}
+
+void
+grub_parse_xen_cmdline (void)
+{
+  const char *cmdline =3D (const char *) grub_xen_start_page_addr->cmd_lin=
e;
+  bool cmdline_valid =3D false;
+  char **param_keys =3D NULL;
+  char **param_vals =3D NULL;
+  grub_size_t param_dict_len =3D 0;
+  grub_size_t param_dict_pos =3D 0;
+  enum parse_flags parse_flags =3D 0;
+  grub_size_t i =3D 0;
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
+   *   - If it does, it is split on the equals sign into a key-value pair.=
 The
+   *     key is then treated as an variable name, and the value is treated=
 as
+   *     the variable's value.
+   *   - If it does not, the entire word is treated as a variable name. The
+   *     variable's value is implicitly considered to be `1`.
+   * - All variables detected on the command line are checked to see if th=
eir
+   *   names begin with the string `xen_grub_env_`. Variables that do not =
pass
+   *   this check are discarded, variables that do pass this check are
+   *   exported so they are available to the GRUB configuration.
+   */
+
+  current_word_len =3D PARSER_BASE_WORD_LEN;
+  current_word =3D grub_malloc (current_word_len);
+  if (current_word =3D=3D NULL)
+    goto cleanup;
+
+  for (i =3D 0; i < MAX_GUEST_CMDLINE; i++)
+    {
+      if (cmdline[i] =3D=3D '\0')
+        {
+          cmdline_valid =3D true;
+          break;
+        }
+    }
+
+  if (cmdline_valid =3D=3D false)
+    {
+      grub_error (GRUB_ERR_BAD_ARGUMENT,
+		  "Command line from Xen is not NUL-terminated");
+      grub_print_error ();
+      goto cleanup;
+    }
+
+  for (i =3D 0; i < grub_strlen (cmdline); i++)
+    {
+      current_char =3D cmdline[i];
+
+      /*
+       * If the previous character was a backslash, append the current
+       * character to the word verbatim
+       */
+      if (parse_flags & PARSER_HIT_BACKSLASH)
+        {
+          parse_flags ^=3D PARSER_HIT_BACKSLASH;
+          if (append_char_to_word (false) =3D=3D false)
+            goto cleanup;
+          continue;
+        }
+
+      switch (current_char)
+        {
+        case '\\':
+          /* Backslashes escape arbitrary characters. */
+          parse_flags ^=3D PARSER_HIT_BACKSLASH;
+          continue;
+
+        case '\'':
+          /*
+           * Single quotes suppress word splitting and double quoting until
+           * the next single quote is encountered.
+           */
+          if (parse_flags & PARSER_IN_DOUBLE_QUOTES)
+            {
+              if (append_char_to_word (false) =3D=3D false)
+                goto cleanup;
+              continue;
+            }
+
+          parse_flags ^=3D PARSER_IN_SINGLE_QUOTES;
+          continue;
+
+        case '"':
+          /*
+           * Double quotes suppress word splitting and single quoting until
+           * the next double quote is encountered.
+           */
+          if (parse_flags & PARSER_IN_SINGLE_QUOTES)
+            {
+              if (append_char_to_word (false) =3D=3D false)
+                goto cleanup;
+              continue;
+            }
+
+          parse_flags ^=3D PARSER_IN_DOUBLE_QUOTES;
+          continue;
+
+        case ' ':
+          /* Spaces separate words in the command line from each other. */
+          if (parse_flags & PARSER_IN_SINGLE_QUOTES
+              || parse_flags & PARSER_IN_DOUBLE_QUOTES)
+            {
+              if (append_char_to_word (false) =3D=3D false)
+                goto cleanup;
+              continue;
+            }
+
+          if (append_word_to_list () =3D=3D false)
+            goto cleanup;
+          continue;
+        }
+
+      if (append_char_to_word (false) =3D=3D false)
+        goto cleanup;
+    }
+
+  if (append_word_to_list () =3D=3D false)
+    goto cleanup;
+
+  param_keys =3D grub_malloc (word_list_len * sizeof (char *));
+  if (param_keys =3D=3D NULL)
+    goto cleanup;
+  param_vals =3D grub_malloc (word_list_len * sizeof (char *));
+  if (param_vals =3D=3D NULL)
+    goto cleanup;
+
+  for (i =3D 0; i < word_list_len; i++)
+    {
+      char *current_word_eq_ptr;
+
+      current_word =3D word_list[i];
+      current_word_len =3D grub_strlen (current_word) + 1;
+      current_word_eq_ptr =3D grub_strchr (current_word, '=3D');
+
+      if (current_word_eq_ptr)
+        {
+          grub_size_t eq_idx =3D (grub_size_t)(current_word_eq_ptr - curre=
nt_word);
+          grub_size_t pre_eq_len =3D current_word_len - (current_word_len =
- eq_idx);
+          grub_size_t post_eq_len =3D current_word_len - (eq_idx);
+
+          if (check_key_is_safe (current_word, pre_eq_len))
+            {
+              param_dict_pos =3D param_dict_len;
+              param_dict_len++;
+              param_keys[param_dict_pos] =3D grub_malloc (pre_eq_len + 1);
+              if (param_keys =3D=3D NULL)
+                goto cleanup;
+              param_vals[param_dict_pos] =3D grub_malloc (post_eq_len + 1);
+              if (param_vals =3D=3D NULL)
+                goto cleanup;
+
+              grub_strncpy (param_keys[param_dict_pos], current_word,
+			    pre_eq_len);
+              grub_strncpy (param_vals[param_dict_pos],
+			    current_word + pre_eq_len + 1, post_eq_len);
+              param_keys[param_dict_pos][pre_eq_len] =3D '\0';
+              param_vals[param_dict_pos][post_eq_len] =3D '\0';
+            }
+        }
+      else
+        {
+          if (check_key_is_safe (current_word, current_word_len - 1))
+            {
+              param_dict_pos =3D param_dict_len;
+              param_dict_len++;
+              param_keys[param_dict_pos] =3D grub_malloc (current_word_len=
);
+              if (param_keys =3D=3D NULL)
+                goto cleanup;
+              param_vals[param_dict_pos] =3D grub_malloc (2);
+              if (param_vals =3D=3D NULL)
+                goto cleanup;
+
+              grub_strncpy (param_keys[param_dict_pos], current_word,
+			    current_word_len);
+              grub_strcpy (param_vals[param_dict_pos], "1\0");
+            }
+        }
+    }
+
+  for (i =3D 0; i < param_dict_len; i++)
+    {
+      /*
+       * Find keys that start with "xen_grub_env_" and export them
+       * as environment variables.
+       */
+      if (grub_strlen (param_keys[i]) < (sizeof ("xen_grub_env_") - 1))
+        continue;
+      if (grub_strncmp (param_keys[i],
+			"xen_grub_env_",
+			sizeof ("xen_grub_env_") - 1) !=3D 0)
+        continue;
+      grub_env_set (param_keys[i], param_vals[i]);
+      grub_env_export (param_keys[i]);
+    }
+
+ cleanup:
+  for (i =3D 0; i < word_list_len; i++)
+    grub_free (word_list[i]);
+
+  for (i =3D 0; i < param_dict_len; i++)
+    {
+      grub_free (param_keys[i]);
+      grub_free (param_vals[i]);
+    }
+
+  grub_free (param_keys);
+  grub_free (param_vals);
+  grub_free (word_list);
+}
diff --git a/include/grub/xen.h b/include/grub/xen.h
index 91cb7cf..7f9efee 100644
--- a/include/grub/xen.h
+++ b/include/grub/xen.h
@@ -89,6 +89,8 @@ void grub_console_init (void);
 void grub_xendisk_fini (void);
 void grub_xendisk_init (void);
=20
+void grub_parse_xen_cmdline (void);
+
 #ifdef __x86_64__
 typedef grub_uint64_t grub_xen_mfn_t;
 #else
--=20
2.49.0


--Sig_/XuEbgScqF3BIrX3JSBisdIA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmg6U04ACgkQpwkWDXPH
kQk6IQ/+L90FdpH/IgOu1TJZJiKkGfO2qfpIBfRgKoF8PT9DIhg1LF1Vl4LgXyWm
sQnQGoBuSLQJMeB6VpOaKmk2YM2EMHpqTWdb8uAXumNrMP1T/j3mh+NH3w/QOtqP
YgmwurY5lvt1Q/9GuJvtlbfJt+4JIxBsxxR+sCymT6mVZejfW/4o/o7rRSucKzKu
+EgSf3NiADA8WyZL3craUTvZM4jRscLMw/VbQ0GZaG/ygnzg3rBc5kO7tPJYG2yd
CpHdUNY1NDarrqFTRNnnZquxs4wr9VRylYSYEGx0p4griOtWXew4FFUtOh4cL4Sw
QvPN2Pb5WgdfIUpq+UDrNJECaWgkxQlRNu+KDN6DEgQ0r8lECjsAK+TzryEiXoIA
oBZpI66zpOVfnb8HQFQeI0woOHJ/0tmrh6ZWP2R8F2SMi4Y26rta0zvecZvcPENK
kbYLlSZsciwA6TbtRC26jPWR7a/+/bHLntWSvu82Pa84q1vccISoifY27M771g9x
01/Cs1OrfwkFeVaXZ1pZjrPIj//xATCUkzAWmS+yuuOrAY3+9bJ7+cJAPxJ+WVra
kHZmSr/TBAEiQJwqu3XI5VaB94lMR+fUgCSSHGDU7oKa+m5Sw4jNev/f2u1J3uOm
7JesK1ceBWc1oRQE2OjYFXRB+DQAxTgbODgMI0edAShIa5MeTbc=
=86HF
-----END PGP SIGNATURE-----

--Sig_/XuEbgScqF3BIrX3JSBisdIA--

