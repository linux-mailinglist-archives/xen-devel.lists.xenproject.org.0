Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799DEA54424
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903042.1310960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6E9-0008Fo-TM; Thu, 06 Mar 2025 08:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903042.1310960; Thu, 06 Mar 2025 08:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6E9-0008EC-Pl; Thu, 06 Mar 2025 08:05:09 +0000
Received: by outflank-mailman (input) for mailman id 903042;
 Thu, 06 Mar 2025 08:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z0IF=VZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tq6E8-0008E6-5Y
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:05:08 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b74ef109-fa61-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:05:06 +0100 (CET)
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
X-Inumbo-ID: b74ef109-fa61-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741248305; x=1741507505;
	bh=4Ez26kVAu7/8IYnKCvdVsFVzLzouYCgFENTvWnYTR3I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=O83Cg9w2i37+c/W3eECU7iERp5V10loBfTQwECRR7X8ciy88J0jW50P3EZ7qpU3CI
	 MdU0O4ke64BR+u/S8JpjJk2H6wuNlGoXPMyN72emU/eGsCi0fU32d4W7el6RonoiXG
	 uMqfS9K/7+st4uMI0OIZVuzPnToQe7mVYfRavryJgSGhyYxsjuIxh3tfqH4py4cMuQ
	 cm43hlConsVFhsDVpM10SyrSpMg3n28ss9u8YGgHMvrhWRTV7gdEqCaBICLmhc3Ar2
	 5wkdsPH4OZiu57Q4lm2FWY3Wa3CyZYyzkzSX14QEjHxdPUcYhORLWQ8cddS2aJMHRQ
	 kR/iaXONjk9fA==
Date: Thu, 06 Mar 2025 08:05:01 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3] xen/console: make console buffer size configurable
Message-ID: <20250306080428.155039-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 469511223ac0582c1b88a316520622531da5bca4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer =
size
as a power of 2.

The supported range is [14..27] -> [16KiB..128MiB].

Set default to 15 (32 KiB).

Link: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v2->v3:
- Corrected xen-command-line.pandoc and Kconfig setting descriptions
- Corrected _CONRING_SIZE definition
---
 docs/misc/xen-command-line.pandoc |  5 +++--
 xen/drivers/char/Kconfig          | 24 ++++++++++++++++++++++++
 xen/drivers/char/console.c        |  6 +++---
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 89db6e83be..a471a9f7ce 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -425,10 +425,11 @@ The following are examples of correct specifications:
 ### conring_size
 > `=3D <size>`
=20
-> Default: `conring_size=3D16k`
-
 Specify the size of the console ring buffer.
=20
+The default console ring buffer size is selected at build time via
+CONFIG_CONRING_SHIFT setting.
+
 ### console
 > `=3D List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | n=
one ]`
=20
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e6e12bb413..e238d4eccf 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -96,6 +96,30 @@ config SERIAL_TX_BUFSIZE
=20
 =09  Default value is 32768 (32KiB).
=20
+config CONRING_SHIFT
+=09int "Console ring buffer size (power of 2)"
+=09range 14 27
+=09default 15
+=09help
+=09  Select the boot console ring buffer size as a power of 2.
+=09  Run-time console ring buffer size is the same as the boot console rin=
g
+=09  buffer size, unless overridden via 'conring_size=3D' boot parameter.
+
+=09    27 =3D> 128 MiB
+=09    26 =3D>  64 MiB
+=09    25 =3D>  32 MiB
+=09    24 =3D>  16 MiB
+=09    23 =3D>   8 MiB
+=09    22 =3D>   4 MiB
+=09    21 =3D>   2 MiB
+=09    20 =3D>   1 MiB
+=09    19 =3D> 512 KiB
+=09    18 =3D> 256 KiB
+=09    17 =3D> 128 KiB
+=09    16 =3D>  64 KiB
+=09    15 =3D>  32 KiB (default)
+=09    14 =3D>  16 KiB
+
 config XHCI
 =09bool "XHCI DbC UART driver"
 =09depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ba428199d2..78794b74e9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -101,12 +101,12 @@ static int cf_check parse_console_timestamps(const ch=
ar *s);
 custom_runtime_param("console_timestamps", parse_console_timestamps,
                      con_timestamp_mode_upd);
=20
-/* conring_size: allows a large console ring than default (16kB). */
+/* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
 static uint32_t __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
=20
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+#define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
+#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__read_mostly conring =3D _conring;
 static uint32_t __read_mostly conring_size =3D _CONRING_SIZE;
--=20
2.34.1



