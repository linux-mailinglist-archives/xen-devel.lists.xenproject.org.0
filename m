Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED58B1AD44
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 06:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069995.1433668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj9cz-0004Bg-O5; Tue, 05 Aug 2025 04:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069995.1433668; Tue, 05 Aug 2025 04:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj9cz-0004AF-KO; Tue, 05 Aug 2025 04:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1069995;
 Tue, 05 Aug 2025 04:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8F9P=2R=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uj9cx-0003L0-Gp
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 04:50:19 +0000
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [2607:f8b0:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acaacf4a-71b7-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 06:50:14 +0200 (CEST)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3e3fdfa4c2aso2790675ab.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 21:50:14 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb90:bf84:45ad:2f41:d127:adbe:c0d6])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e40297c3desm47951335ab.4.2025.08.04.21.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 21:50:12 -0700 (PDT)
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
X-Inumbo-ID: acaacf4a-71b7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754369413; x=1754974213; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nobIoytVmkyyXPb30UPJ/cP8wI2YAhOvo+EJoOF4y6k=;
        b=nQ2bIzbuGXsPsCWcy3yuwAYa1RVymCTo9T7MFgUZhHfSL7kiGcdBqWn6EVaLuej1cB
         qoVDbK7lkQNeBQDPyMN5bk3Jm7FJgjtQ7bH2hN06k/NJHk9TdWXcYrXR6rvsiYQMwVmM
         arPOQPEdxpL8u6C2I8whspY5KQeTLF3aJ50XkS1h1x+T155sgCkNVrVfN3AxQS2IDY1c
         zoEelzISAWtQAXaTfWCoTRSv+UnP+38y1tnsVHjlUZTdXBvA8UVT6atgsKFnwy+IV82x
         5PIpQc0oz0wrCHuLjxUjVk4bfzyxQNNU5msEooC42VLHWFUjtDW6BiTzdEvXkd2/0GDN
         iKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369413; x=1754974213;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nobIoytVmkyyXPb30UPJ/cP8wI2YAhOvo+EJoOF4y6k=;
        b=tPn4THT3vc7/16K0lhiUz0C0KRRoT1s5Tvqfx9/f7oTuSHb5Vq04mVH/iDVPigLl3/
         LrtSXMrhoyohPQ5sVfqG77/mAodHTF6/Pzim/1Lzmr5E/Yz2pzvMW7mdWmo9jTLsDEQd
         Bjk0giZRpKgWPGbi4KPIKvH6M6KiAg+r5v3uX6/rKjlNxCkZ4TXqnix7NUXkZXEXk4b1
         5+nhdGa7/5gk6N4YUeuYfBxsdTX9/r5J1Y+JkYmGfkXf8NuDoTY65JGSuoBXSe+hvnS6
         OTWX6LkSieezDF9WTZVxBxM9e0YwfZqYbdrnO8aH+J09tc5afao8pEl+la36dPLdd93K
         4ACA==
X-Forwarded-Encrypted: i=1; AJvYcCV2AN/sqNbsu+Pw7q/dTnG3tC5G49h1bkN6VuFKQrMLHyk9ekpSmORf1Uj4zwyXyUqDnvSs13VbG6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNR4egw7IcIWm9JNVRj2UrVmNCwN/ybkDY+SWpiYrqsIQkA/KR
	nIsc0msD0+J50iD9wFiOjaROjq+P8cS1CLRtCvtddOmmQpsQV1XVIDRR
X-Gm-Gg: ASbGncuXr/FImn34SbeaKHiZ1k3lPl7rGQj+e6m3vsIU4K3NT1En8sw9G0NWpCK/Pox
	0WLxEhcvSxTQzHImGCVhwulSlTxUrV1NawUqK7O6J9sInUdY4K4k5kd3N+kbADq73wWCLaiLx6R
	srhtN1JaY5hE/aMmTSc6kOzCh0p2KaRPHhveJh6WI7JkMk0PW0BgY8yNT52tMmLV5RW6JmX9Xmw
	I5XNYXxqDbp90O23GCB1wbFJfjScP6FHqZqQnEhsMKy4I6vMg5Dg1Ur1C9Rm4WuVchJ3un0+6fV
	VS1m0pk45QQ8nAUIS1BWLg80LJdlS8rrJTf3/FCvmjqWJo0bkI4HSVuzTUylYF6pocid5do8Znh
	pviXq0ZxneB96h1ZfvyIp+NlOCfHVNr0=
X-Google-Smtp-Source: AGHT+IGhaNezlhq2LxevMzF1cCPsat2A9zqMmRELaHI9a/VJK4nlrPX/Wl6AXiGOUWtg9lWL+kPz8A==
X-Received: by 2002:a05:6e02:350d:b0:3dd:c947:b3a7 with SMTP id e9e14a558f8ab-3e4161b80cdmr61153165ab.5.1754369412881;
        Mon, 04 Aug 2025 21:50:12 -0700 (PDT)
Date: Mon, 4 Aug 2025 23:50:09 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: [PATCH v4 2/2] kern/xen: Add Xen command line parsing
Message-ID: <20250804235009.30e39bd9@kf-m2g5>
In-Reply-To: <20250804234911.3cc3997c@kf-m2g5>
References: <20250804234816.3d14f53f@kf-m2g5>
	<20250804234911.3cc3997c@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZnIhcNgyGpUwofXD.=Muf+N";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/ZnIhcNgyGpUwofXD.=Muf+N
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
 docs/grub.texi                |  51 +++++
 grub-core/Makefile.core.def   |   2 +
 grub-core/kern/i386/xen/pvh.c |  23 +++
 grub-core/kern/xen/cmdline.c  | 376 ++++++++++++++++++++++++++++++++++
 grub-core/kern/xen/init.c     |   2 +
 include/grub/xen.h            |   2 +
 6 files changed, 456 insertions(+)
 create mode 100644 grub-core/kern/xen/cmdline.c

diff --git a/docs/grub.texi b/docs/grub.texi
index 34b3484..b58cf98 100644
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
@@ -3871,6 +3872,56 @@ using BIOS or EFI functions (no ATA, USB or IEEE1275=
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
+spaces. Single quotes will be considered part of a word if inside double
+quotes, and vice versa. Arbitrary characters may be backslash-escaped to m=
ake
+them a literal component of a word rather than being parsed as quotes or w=
ord
+separators. The command line must consist entirely of printable 7-bit ASCII
+characters and spaces. If a non-printing ASCII character is found anywhere=
 in
+the command line, the entire command line will be ignored by GRUB.
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
+extra =3D "xen_grub_env_linux_append=3D'loglevel=3D3'"
+memory =3D 1024
+disk =3D [ "file:/srv/vms/linux_vm.img,sda,w" ]
+
+# In the guest's GRUB configuration file
+menuentry "Linux VM with dom0-specified kernel parameters" @{
+    search --set=3Droot --label linux_vm --hint hd0,msdos1
+    linux /boot/vmlinuz root=3DLABEL=3Dlinux_vm $@{xen_grub_env_linux_appe=
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
index 91fbca8..a8988d2 100644
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
@@ -352,6 +354,27 @@ grub_xen_setup_pvh (void)
   grub_xen_mm_init_regions ();
=20
   grub_rsdp_addr =3D pvh_start_info->rsdp_paddr;
+
+  xen_cmdline =3D (const char *) pvh_start_info->cmdline_paddr;
+  for (i =3D 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
+    {
+      if (xen_cmdline[i] =3D=3D '\0')
+        {
+          grub_strncpy ((char *) grub_xen_start_page_addr->cmd_line,
+			(char *) pvh_start_info->cmdline_paddr,
+			GRUB_XEN_MAX_GUEST_CMDLINE);
+
+          if (grub_xen_start_page_addr->cmd_line[GRUB_XEN_MAX_GUEST_CMDLIN=
E - 1] !=3D '\0')
+            {
+              grub_error (GRUB_ERR_BUG,
+			  "Xen command line is not NUL-terminated");
+              grub_print_error ();
+              grub_exit ();
+            }
+
+          break;
+        }
+    }
 }
=20
 grub_err_t
diff --git a/grub-core/kern/xen/cmdline.c b/grub-core/kern/xen/cmdline.c
new file mode 100644
index 0000000..46a9998
--- /dev/null
+++ b/grub-core/kern/xen/cmdline.c
@@ -0,0 +1,376 @@
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
+enum splitter_state
+{
+  SPLITTER_HIT_BACKSLASH =3D 0x1,
+  SPLITTER_IN_SINGLE_QUOTES =3D 0x2,
+  SPLITTER_IN_DOUBLE_QUOTES =3D 0x4,
+};
+typedef enum splitter_state splitter_state_t;
+
+/*
+ * The initial size of the current_word buffer. The buffer may be resized =
as
+ * needed.
+ */
+#define PARSER_BASE_WORD_SIZE 32
+
+struct parser_state
+{
+  grub_size_t word_list_len;
+  char **word_list;
+  grub_size_t current_word_len;
+  grub_size_t current_word_pos;
+  char *current_word;
+};
+typedef struct parser_state parser_state_t;
+
+static bool
+append_char_to_word (parser_state_t *s, char c, bool allow_null)
+{
+  /*
+   * We ban any chars that are not in the ASCII printable range. If
+   * allow_null =3D=3D true, we make an exception for NUL. (This is needed=
 so that
+   * append_word_to_list can add a NUL terminator to the word).
+   */
+  if (grub_isprint (c) =3D=3D false && allow_null =3D=3D false)
+    return false;
+  else if (allow_null =3D=3D true && c !=3D '\0')
+    return false;
+
+  if (s->current_word_pos =3D=3D s->current_word_len)
+    {
+      s->current_word =3D grub_realloc (s->current_word, s->current_word_l=
en *=3D 2);
+      if (s->current_word =3D=3D NULL)
+        {
+          s->current_word_len /=3D 2;
+          return false;
+        }
+    }
+
+  s->current_word[s->current_word_pos++] =3D c;
+  return true;
+}
+
+static bool
+append_word_to_list (parser_state_t *s)
+{
+  /* No-op on empty words. */
+  if (s->current_word_pos =3D=3D 0)
+    return true;
+
+  if (append_char_to_word (s, '\0', true) =3D=3D false)
+    {
+      grub_error (GRUB_ERR_BUG,
+		  "couldn't append NUL terminator to word during Xen cmdline parsing");
+      grub_print_error ();
+      grub_exit ();
+    }
+
+  s->current_word_len =3D grub_strlen (s->current_word) + 1;
+  s->current_word =3D grub_realloc (s->current_word, s->current_word_len);
+  if (s->current_word =3D=3D NULL)
+    return false;
+  s->word_list =3D grub_realloc (s->word_list, ++s->word_list_len * sizeof=
 (char *));
+  if (s->word_list =3D=3D NULL)
+    return false;
+  s->word_list[s->word_list_len - 1] =3D s->current_word;
+
+  s->current_word_len =3D PARSER_BASE_WORD_SIZE;
+  s->current_word_pos =3D 0;
+  s->current_word =3D grub_malloc (s->current_word_len);
+  if (s->current_word =3D=3D NULL)
+    return false;
+
+  return true;
+}
+
+static bool
+is_key_safe (char *key, grub_size_t len)
+{
+  grub_size_t i;
+
+  for (i =3D 0; i < len; i++)
+    {
+      if (! (grub_isalpha (key[i]) || key[i] =3D=3D '_'))
+        return false;
+    }
+
+  return true;
+}
+
+void
+grub_parse_xen_cmdline (void)
+{
+  parser_state_t *s =3D NULL;
+
+  const char *cmdline =3D (const char *) grub_xen_start_page_addr->cmd_lin=
e;
+  grub_size_t cmdline_len;
+  bool cmdline_valid =3D false;
+  char **param_keys =3D NULL;
+  char **param_vals =3D NULL;
+  grub_size_t param_dict_len =3D 0;
+  grub_size_t param_dict_pos =3D 0;
+  splitter_state_t splitter_state =3D 0;
+  char current_char =3D '\0';
+  grub_size_t i =3D 0;
+
+  s =3D grub_malloc (sizeof (parser_state_t));
+  if (s =3D=3D NULL)
+    goto cleanup_final;
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
+  s->current_word_len =3D PARSER_BASE_WORD_SIZE;
+  s->current_word =3D grub_malloc (s->current_word_len);
+  if (s->current_word =3D=3D NULL)
+    goto cleanup_main;
+
+  for (i =3D 0; i < GRUB_XEN_MAX_GUEST_CMDLINE; i++)
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
+		  "command line from Xen is not NUL-terminated");
+      grub_print_error ();
+      goto cleanup_main;
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
+      if (splitter_state & SPLITTER_HIT_BACKSLASH)
+        {
+          splitter_state &=3D ~SPLITTER_HIT_BACKSLASH;
+          if (append_char_to_word (s, current_char, false) =3D=3D false)
+            goto cleanup_main;
+          continue;
+        }
+
+      switch (current_char)
+        {
+        case '\\':
+          /* Backslashes escape arbitrary characters. */
+          splitter_state |=3D SPLITTER_HIT_BACKSLASH;
+          continue;
+
+        case '\'':
+          /*
+           * Single quotes suppress word splitting and double quoting until
+           * the next single quote is encountered.
+           */
+          if (splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
+            {
+              if (append_char_to_word (s, current_char, false) =3D=3D fals=
e)
+                goto cleanup_main;
+              continue;
+            }
+
+          splitter_state ^=3D SPLITTER_IN_SINGLE_QUOTES;
+          continue;
+
+        case '"':
+          /*
+           * Double quotes suppress word splitting and single quoting until
+           * the next double quote is encountered.
+           */
+          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES)
+            {
+              if (append_char_to_word (s, current_char, false) =3D=3D fals=
e)
+                goto cleanup_main;
+              continue;
+            }
+
+          splitter_state ^=3D SPLITTER_IN_DOUBLE_QUOTES;
+          continue;
+
+        case ' ':
+          /* Spaces separate words in the command line from each other. */
+          if (splitter_state & SPLITTER_IN_SINGLE_QUOTES ||
+              splitter_state & SPLITTER_IN_DOUBLE_QUOTES)
+            {
+              if (append_char_to_word (s, current_char, false) =3D=3D fals=
e)
+                goto cleanup_main;
+              continue;
+            }
+
+          if (append_word_to_list (s) =3D=3D false)
+            goto cleanup_main;
+          continue;
+        }
+
+      if (append_char_to_word (s, current_char, false) =3D=3D false)
+        goto cleanup_main;
+    }
+
+  if (append_word_to_list (s) =3D=3D false)
+    goto cleanup_main;
+
+  param_keys =3D grub_malloc (s->word_list_len * sizeof (char *));
+  if (param_keys =3D=3D NULL)
+    goto cleanup_main;
+  param_vals =3D grub_malloc (s->word_list_len * sizeof (char *));
+  if (param_vals =3D=3D NULL)
+    goto cleanup_main;
+
+  for (i =3D 0; i < s->word_list_len; i++)
+    {
+      char *current_word_eq_ptr;
+
+      s->current_word =3D s->word_list[i];
+      s->current_word_len =3D grub_strlen (s->current_word) + 1;
+      current_word_eq_ptr =3D grub_strchr (s->current_word, '=3D');
+
+      if (current_word_eq_ptr !=3D NULL)
+        {
+          /*
+           * Both pre_eq_len and post_eq_len represent substring lengths
+           * without a NUL terminator.
+           */
+          grub_size_t pre_eq_len =3D (grub_size_t) (current_word_eq_ptr - =
s->current_word);
+          /*
+           * s->current_word_len includes the NUL terminator, so we subtra=
ct
+           * one to get rid of the terminator, and one more to get rid of =
the
+           * equals sign.
+           */
+          grub_size_t post_eq_len =3D (s->current_word_len - 2) - pre_eq_l=
en;
+
+          if (is_key_safe (s->current_word, pre_eq_len) =3D=3D true)
+            {
+              param_dict_pos =3D param_dict_len++;
+              param_keys[param_dict_pos] =3D grub_malloc (pre_eq_len + 1);
+              if (param_keys =3D=3D NULL)
+                goto cleanup_main;
+              param_vals[param_dict_pos] =3D grub_malloc (post_eq_len + 1);
+              if (param_vals =3D=3D NULL)
+                goto cleanup_main;
+
+              grub_strncpy (param_keys[param_dict_pos], s->current_word, p=
re_eq_len);
+              grub_strncpy (param_vals[param_dict_pos],
+			    s->current_word + pre_eq_len + 1, post_eq_len);
+              param_keys[param_dict_pos][pre_eq_len] =3D '\0';
+              param_vals[param_dict_pos][post_eq_len] =3D '\0';
+            }
+        }
+      else
+        {
+          if (is_key_safe (s->current_word, s->current_word_len - 1) =3D=
=3D true)
+            {
+              param_dict_pos =3D param_dict_len++;
+              param_keys[param_dict_pos] =3D grub_malloc (s->current_word_=
len);
+              if (param_keys =3D=3D NULL)
+                goto cleanup_main;
+              param_vals[param_dict_pos] =3D grub_malloc (2);
+              if (param_vals =3D=3D NULL)
+                goto cleanup_main;
+
+              grub_strncpy (param_keys[param_dict_pos], s->current_word,
+			    s->current_word_len);
+              if (param_keys[param_dict_pos][s->current_word_len - 1] !=3D=
 '\0' )
+                {
+                  grub_error (GRUB_ERR_BUG,
+			      "NUL terminator missing from key during Xen cmdline parsing");
+                  grub_print_error ();
+                  grub_exit ();
+                }
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
+
+      if (grub_env_set (param_keys[i], param_vals[i]) !=3D GRUB_ERR_NONE)
+        {
+          grub_printf ("warning: could not set environment variable `%s' t=
o value `%s'\n",
+		       param_keys[i], param_vals[i]);
+          continue;
+        }
+
+      if (grub_env_export (param_keys[i]) !=3D GRUB_ERR_NONE)
+        grub_printf ("warning: could not export environment variable `%s'",
+		     param_keys[i]);
+    }
+
+ cleanup_main:
+  for (i =3D 0; i < s->word_list_len; i++)
+    grub_free (s->word_list[i]);
+
+  for (i =3D 0; i < param_dict_len; i++)
+    {
+      grub_free (param_keys[i]);
+      grub_free (param_vals[i]);
+    }
+
+  grub_free (param_keys);
+  grub_free (param_vals);
+  grub_free (s->word_list);
+
+ cleanup_final:
+  grub_free (s);
+}
diff --git a/grub-core/kern/xen/init.c b/grub-core/kern/xen/init.c
index 782ca72..69cf59f 100644
--- a/grub-core/kern/xen/init.c
+++ b/grub-core/kern/xen/init.c
@@ -581,6 +581,8 @@ grub_machine_init (void)
   grub_xendisk_init ();
=20
   grub_boot_init ();
+
+  grub_parse_xen_cmdline ();
 }
=20
 void
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


--Sig_/ZnIhcNgyGpUwofXD.=Muf+N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmiRjYEACgkQpwkWDXPH
kQn+5xAAlgjplJumo0o1n94QXSoXn+01OtlfBIwAcISNvnW+yev/F/Pz+qK/e6aE
AxC+/P9weLyo0IgdYNSe22SMwgoEX89UgCU8lDkYK3Y0plDlc3QPEmEn9TlzgAwZ
WMcL7zanpfi1+tI+pUDnuyKQSzkrWeBNMHOFK37CKVjCNigNugX5G8QvrYGG2Mw/
dmPQCBiDpfiI4kZHIt8VO2A3kRCp0v1SAzs4UkWX1KG1RlEiL7Iwck59I/Mxs46p
4GMBhNvlCp24INVQExkggn5IMeVqyPEAXNp37UQyVTehCNTIYZFLxRmZy0Rg1jvc
HVI3geUauiPh3YrUPJHzrP/om9vPlcQPxSqh9Ym3ZxfNJLHwHW06292AoqYeu6HX
p2cN0YyA+wThyso0BrIQA2TcsFoDB2iLjIyMwsE1wRETt9YNogZuF2lon4TaHZQn
YJZ7ZDxmmehgQPc+hXBoznxsZV5EEWig92uMH9scHMTQMF3V5bgWmSnf8wrdBB8f
Q7Fw/iO7XeK9ISvrbv2TamGYqwP39QKstxi4OY2IjzcBrr+qYd9pgYcWX6fOmJAp
EMdyp/vsaE6wmqZcYOlqstVwt9LjHvdrBKI9m/jYXEWGCbPlNjIUB96l4K3gXdvU
Ni9cYw9/+2bgtcxdygyH7A8kD4ONUdmtND5M8Aw0LHU9SSduqbs=
=zAQ4
-----END PGP SIGNATURE-----

--Sig_/ZnIhcNgyGpUwofXD.=Muf+N--

