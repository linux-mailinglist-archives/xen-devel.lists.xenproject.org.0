Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FAACE951
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 07:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006218.1385411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN39N-0006nt-9x; Thu, 05 Jun 2025 05:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006218.1385411; Thu, 05 Jun 2025 05:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN39N-0006km-6O; Thu, 05 Jun 2025 05:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1006218;
 Thu, 05 Jun 2025 05:28:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjOr=YU=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uN39L-0006ke-6e
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 05:28:23 +0000
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [2607:f8b0:4864:20::d2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e20dfee3-41cd-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 07:28:18 +0200 (CEST)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-864a29cf2daso1731739f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 22:28:17 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb91:729:c9c7:c3e2:180e:e54f:7b49])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fdd7ed81b1sm3137778173.86.2025.06.04.22.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 22:28:14 -0700 (PDT)
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
X-Inumbo-ID: e20dfee3-41cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749101296; x=1749706096; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwCurTopJGv31bpHBjbnnne+gMhFb6BxAc9wg8PtYiw=;
        b=jk5CUwra5LbQld0rGbA/56ZhLAkh8aF5arj/i60R5CroI+Pb8dYaeypolbkCwZqV08
         W5Xkhe6KF5atoAqcbs1TkVNSpRFHEyS+a/8XXvFhmj2rpokIbYTAyD9U/kmCj2edlBEw
         LMNte2YOyshYwJHUzLLCmV8FKUDIIFMX2EH0wF1IkedRDRHMCuDticQ9DtpXFEW1SfGX
         U+CXvzVq4iccpRrNAf9uGN2AYPgTI+ppzff2uk+v7ZS3c0cV0v3f8sWjTGt5wDdVLuzS
         yjXXxGbeWoQ6EXgKQPHIbkmVZr3qbyW4ZriFOZ4JDlKuiFtSKJK+3wud4It6QpfCm31D
         S0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101296; x=1749706096;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwCurTopJGv31bpHBjbnnne+gMhFb6BxAc9wg8PtYiw=;
        b=ms1NWNuys0Zxg8dEctpsTlbg0Vwrss7ivYnAqMstj9DLnr5ORlHSsigPMb3RU4dyrM
         Tr278oGg/WdycsfivQbaKjYWKwlvZx7pVWcsxFg4LHC5ZdWir/fiYjKxDvoaw505vyj0
         8GtRj7y36mbgzl42PZtEPH4rAdjjt7vwe2LVWrCZ5fqwZTeRCwIxZBvLVZumFZ26qbCP
         fe60EQFAqSx9rYY0Gw+nNK9n7Lg68H5hajldcSta4IVlTuWMgH042mlrq1qa1tPH74+M
         WeiyqIipM5fcIBCgDOZjd89NDofEL3MaRbQz24dimewSOM6/weazrnUqh3juh5DTMF7V
         O4oA==
X-Gm-Message-State: AOJu0YwPu8bGSL248FdR2awzYAjMmWlYof8MfZ6/ljcvtwR2USFzwq7k
	bPpkz3x2x2lcylzygKzrWTg59ieoxMXLuSI0mDeCpN/gxhS1mBUrUsp/
X-Gm-Gg: ASbGncu3vOk4UEzQdCDHxLZzWaaeZbQahQe7MCmVYWmrrREj+jq0Cxy5Pw+2G8DqpMA
	x7kCWQ2JnxeUULvPN9wmPA7KUEVOa9T1DDY+ClEAgh4wzfqsK9xcyeNoi761ECQ8+3tfkJOW8yg
	zUfDE+WqA8ibyRsCX78DVIsrR2HfwKvv0mjWbLD7Fok04SAOos5H+swIqCimQOOpXv7pd0WwdCM
	d+g5XCVPHWcLpq/6mVKRdujaOCBKnRPHj+OPk+mnlKfFU/ZaeriwIobIdeMm52cg04VXQ4qkE+P
	e8Y1fz6JU7Te8O7SGJvEeV6X3NJDDz21vHcwqPIB2uXenfwY
X-Google-Smtp-Source: AGHT+IFz5oVr9m8av9462qSk2DpWiOxZTJo++F8KwhpejFtLNXjmbMNdwcfbvP03/XM4OwjUzLJFqw==
X-Received: by 2002:a05:6e02:1526:b0:3d4:6d6f:6e1f with SMTP id e9e14a558f8ab-3ddbedfcfdemr15746365ab.6.1749101295449;
        Wed, 04 Jun 2025 22:28:15 -0700 (PDT)
Date: Thu, 5 Jun 2025 00:28:11 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org, daniel.kiper@oracle.com,
 phcoder@gmail.com, marmarek@invisiblethingslab.com
Subject: [PATCH v3 1/1] kern/xen: Add Xen command line parsing
Message-ID: <20250605002811.216f2ef9@kf-m2g5>
In-Reply-To: <20250605002601.73a34f9b@kf-m2g5>
References: <20250605002601.73a34f9b@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CBBYWyRHjyZxGj6=6xzWhkB";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/CBBYWyRHjyZxGj6=6xzWhkB
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
arguments accepted by GRUB in the future, should other arguments end up
becoming desirable in the future.

Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
---
 docs/grub.texi                |  50 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |  14 ++
 grub-core/kern/main.c         |  12 ++
 grub-core/kern/xen/cmdline.c  | 343 ++++++++++++++++++++++++++++++++++
 include/grub/xen.h            |   2 +
 6 files changed, 423 insertions(+)
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
index 24e8c84..d2208ea 100644
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
index 143a232..b4377d3 100644
--- a/grub-core/kern/main.c
+++ b/grub-core/kern/main.c
@@ -37,6 +37,10 @@
 #include <grub/machine/memory.h>
 #endif
=20
+#if defined (GRUB_MACHINE_XEN) || defined (GRUB_MACHINE_XEN_PVH)
+#include <grub/xen.h>
+#endif
+
 static bool cli_disabled =3D false;
 static bool cli_need_auth =3D false;
=20
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
index 0000000..03dd88f
--- /dev/null
+++ b/grub-core/kern/xen/cmdline.c
@@ -0,0 +1,343 @@
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
+  grub_size_t cmdline_len;
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
+  cmdline_len =3D grub_strlen (cmdline);
+  for (i =3D 0; i < cmdline_len; i++)
+    {
+      current_char =3D cmdline[i];
+
+      /*
+       * If the previous character was a backslash, append the current
+       * character to the word verbatim
+       */
+      if (parse_flags & PARSER_HIT_BACKSLASH)
+        {
+          parse_flags &=3D ~PARSER_HIT_BACKSLASH;
+          if (append_char_to_word (false) =3D=3D false)
+            goto cleanup;
+          continue;
+        }
+
+      switch (current_char)
+        {
+        case '\\':
+          /* Backslashes escape arbitrary characters. */
+          parse_flags |=3D PARSER_HIT_BACKSLASH;
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
+          grub_size_t post_eq_len =3D current_word_len - (eq_idx);
+
+          if (check_key_is_safe (current_word, eq_idx))
+            {
+              param_dict_pos =3D param_dict_len;
+              param_dict_len++;
+              param_keys[param_dict_pos] =3D grub_malloc (eq_idx + 1);
+              if (param_keys =3D=3D NULL)
+                goto cleanup;
+              param_vals[param_dict_pos] =3D grub_malloc (post_eq_len + 1);
+              if (param_vals =3D=3D NULL)
+                goto cleanup;
+
+              grub_strncpy (param_keys[param_dict_pos], current_word,
+			    eq_idx);
+              grub_strncpy (param_vals[param_dict_pos],
+			    current_word + eq_idx + 1, post_eq_len);
+              param_keys[param_dict_pos][eq_idx] =3D '\0';
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
+              grub_strcpy (param_vals[param_dict_pos], "1");
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


--Sig_/CBBYWyRHjyZxGj6=6xzWhkB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmhBKusACgkQpwkWDXPH
kQkREg//RdVFETnbmQLIFMHi63AuLSvq4NDr9Ivc47QpwmDa4poyYEomVtVZ3FtV
AKsKUwXfO5KPMTSouE7u/txnLwOxA0Y1JbfpQ6FJyRjykpUvDcQrMr48ABxpJBqm
pAuVmh+eTdMrBSqzTcCf/J7giPDEYIeArpYgBuSaCVOXk/ZGM8XsUQ09RyUD5Qta
onOJPoollrNg7j2mLb8QrbWx6v7eFdvOOThDZZaajmX32tirXlbih3P0hOCDh21n
UN3sxOqOeQQqojhao80/XHOtOWJ+qB+bI2cUz9+t0nSnS8wkyVlt5zVlly/BPU9e
jgIx+Yf4HFpHyen/GOwGzk0rvO2Jo9U/AmeaZpjzbukm3/bBaILy5c1yBgHbuMgT
/Mguk5Lq6W6FTwnF2ytwyFM7I1GK/VbuwfR4JlqIheMmNTK5dduEHXQRw5Yr9wEU
8cSbXNYVhqDc1yhrNsvHpsPQzbCluHzeW6ffOXoqD1j24VgKvdKnbhBrFsPw13Lj
tyjyvzjA/18tqIlLGSByuO5C9qPXn+YsIXSYA7NyBkw7SoPGOM+AcRHxMXBjVsX+
cE+RLo9yCRUjHJKHcQccjarcLlLeHbbVasGj0C1df/VqeOVmdgeWwawU5rHo4YTi
rj0TM0H/bDg/a4E8fV65HnSy46/uWN8O8RSA0YNfZFIPbSCoTBE=
=n3i2
-----END PGP SIGNATURE-----

--Sig_/CBBYWyRHjyZxGj6=6xzWhkB--

