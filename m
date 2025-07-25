Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83BB12585
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 22:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058497.1426053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufP4b-0005jD-Qv; Fri, 25 Jul 2025 20:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058497.1426053; Fri, 25 Jul 2025 20:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufP4b-0005gc-OG; Fri, 25 Jul 2025 20:31:21 +0000
Received: by outflank-mailman (input) for mailman id 1058497;
 Fri, 25 Jul 2025 20:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiiL=2G=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1ufP4Z-0004mk-Vs
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 20:31:20 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f89fd3-6996-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 22:31:18 +0200 (CEST)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3df2d0f4363so1741455ab.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 13:31:18 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb90:bf84:45ad:8504:c1a1:d950:5158])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e3cacd77fesm2460895ab.46.2025.07.25.13.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 13:31:16 -0700 (PDT)
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
X-Inumbo-ID: 50f89fd3-6996-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753475477; x=1754080277; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bjqw9+U7896TQtosHPap+DBpBWl+Xn7BRk1i5L/11WQ=;
        b=YtCXeZXzQ+tOMJP7zWZNW+pNs59W4kFNgzOAsOHB/R4ev3Gczblrl/5Jmw9waThXtX
         ncg/O8t80anGh2SmRTWuKCVNaZm4hElvuSZyHHMvEgpDnHKfzuCpyMoedY97Gq3nYTEV
         0xYXxsxH03k/kuurLWz91lwZx7bfFBw8WZZ05fqMPwdA9VVRxgDM7IxUmzJMGV1up8+O
         +cDotFOWeKGjBlBrh3eA5gUvBtbZ7Uiycz0BIxI7pOGyf74I37eug1v1MJl+ORQyRLPy
         uU2R07RM6MhEpiLV9b0Cilu6CDLKrBMGZ2UiJzDeoNnJ0ZdCffHDiqBIZ5Fo1+i6BG4D
         umbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753475477; x=1754080277;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bjqw9+U7896TQtosHPap+DBpBWl+Xn7BRk1i5L/11WQ=;
        b=ZGT54ZcCaMI+EgweJ5kZkdrZ+EEFJOVS7ZHV7vguPe7ppuvhuUa2zKzZnJcrG2Yoe9
         uiu+rI/Tm8cVz0MWpUe/nZhY8mClXaleNA6DsJlRi4NZWxB/XL83fmkD0AS4St18D4p8
         u/HEHgOeWoWYpMGgbTh/trjasy48Ttwxo2ATxHuj12ZoSfmfSXtRdo8vHLtFTKCyHiIa
         cPjMuiHrS7aA1vlBIup96r0fkoxpL+WZNrFrXgPf5jjV/lPa49gIoeHw3axo08W+bqqA
         i2yW2lyU1HsliGQXP0kRExBLck125hYTbx+Volup570rcWg3AzPk0edcm//ORb3mXgka
         HRgA==
X-Forwarded-Encrypted: i=1; AJvYcCUNeZwmIxxi5WgE4uC2wdC0kVG4U0eQzmrczw6X2nh5S1nCIBe0knYyQykf5NExUCSg6nHiTs1Wqm8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcUqWsB+44OmudnwvIVv6Q2fQomHw3bauwOwAo3HYXvT5ioQs1
	1Ti+uzwDifL63SGTltcF6MIW+Ois98u24HfPapBfshGnT7cMdoI2DAI7
X-Gm-Gg: ASbGnctEHqBNqXWSGJIW+WCPp21jB6Ppn2JyArXFMQLY/CYw8EoGlNv3wE/HGrN4qQE
	W8Ze7Hf9GQWXiJFbNAwbgrga+WyCEpDVHZdQzkZlV4wx1VwsFn7uGsplMNn+rZ+RGtCGaxCQG1J
	lQNbNuVdssVn6ka7QJaztWdoxgbkT19vbDLVx2a/7L3eQPry47gI8B0gDOoI8aDz48mkPaRA8el
	h9xzsAiITFevPl75pcR/CjYIrK7+ECm1+YNF3p7648J0OMyVqRiwxcyHDCS4VTaTRQjOOwyGMel
	oJXp7213HiL3iwdFKYpm1rcTvekktAZbCRzsU76XGpIEO7MBBrBXLGIMzghUEa3xYVBSJB/D7BZ
	tDGDPfTPYnO7dS0O3YRW0
X-Google-Smtp-Source: AGHT+IEjQF8f2aYSdBfrWbvVY7UxGA4ygh0OMksoJy8q/uLoO4konMFeN0VZEM++7dK/0NjU3uYzpQ==
X-Received: by 2002:a05:6e02:2590:b0:3e2:a082:7e4b with SMTP id e9e14a558f8ab-3e3c52cde8cmr13933645ab.4.1753475476326;
        Fri, 25 Jul 2025 13:31:16 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:31:12 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: [RESEND PATCH v3 1/1] kern/xen: Add Xen command line parsing
Message-ID: <20250725153112.4ea25243@kf-m2g5>
In-Reply-To: <20250725153012.1dd46644@kf-m2g5>
References: <20250725153012.1dd46644@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BZGhS4B_bxNAMX2dH34y.SN";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/BZGhS4B_bxNAMX2dH34y.SN
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
index b3f7119..df0f266 100644
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
2.50.1


--Sig_/BZGhS4B_bxNAMX2dH34y.SN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmiD6ZAACgkQpwkWDXPH
kQn8pA//V6KVBckKm1E/9BSKYh8jWtk9h+9eDwND5/E8aCtHVzaJCcmb+NO6vpQu
DKvhEXp0BsKlaC0rqi1KOmIl5Xu1fkhnnBbwQHh048s7qUFGz0bf1RXzooDUQ+M8
efqjgAwf9G46a9VKoEMZBuM1Ge7Pvf9ysyCyX6RjJBAdNsiWHx7QkWUe3RrWhmFW
GnvjN0eSoM290wsM6qc/3zqkno0yaXFdKGgamjGygVREEGlpna6WVs7h32lBgO/o
MP73WnE4s3lL/RTUAu56D0FWrTI22Gc5Su27wHPphozJZiBxutM6GtQMOFAltrlR
OEhbKi5STfsdxDL4CNslaaoOyrJKBR9abNplOX/RgRzEDfsrxrsqIiFCFuPDZf4x
flcLwGqAFK7xVRRv4pBk5meH5oT84T+RQESsylt4Kq3PeVCnrpSE0cTRVlUbumEb
vEuodrzBjMAl5YC7fL/s8VS7LyaNQXl2gyTMzesMc5ty+mfoPLd/BYsyU0u+h66v
mcSiJ7kDcNQ/7SgdC5v30hTq7I4rA8j/6EmSqgJd7WyIou1CvUn0H+NiYjI1/yZh
XYm8iZCE70tb2H2EesgFkKUngNjf4qio5x5gx5Csf5pH6hbaP9DsqC+IBiqRNdCT
ZuvkUfw3JITy1HHlF2q9A5nU+NNUMN/hYyxKcvuPihfsx1QqxCU=
=/ToZ
-----END PGP SIGNATURE-----

--Sig_/BZGhS4B_bxNAMX2dH34y.SN--

