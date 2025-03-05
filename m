Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76706A4F34E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 02:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901674.1309630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpdJE-0006W9-30; Wed, 05 Mar 2025 01:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901674.1309630; Wed, 05 Mar 2025 01:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpdJD-0006Tk-Vw; Wed, 05 Mar 2025 01:12:27 +0000
Received: by outflank-mailman (input) for mailman id 901674;
 Wed, 05 Mar 2025 01:12:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vvpY=VY=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tpdJB-0006Te-Kj
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 01:12:26 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4266293-f95e-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 02:12:24 +0100 (CET)
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
X-Inumbo-ID: e4266293-f95e-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7msnwpphb5cfvpe577esins6hy.protonmail; t=1741137140; x=1741396340;
	bh=V3j+k1jHDurRGziduvVGb9LeHYCXEotngrDFCp3SnvY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=fO6sORSzaHbXmLc2v581zeeB6UoULwJtU/L5H3X8CnWhUP0ZjVLd68z8H2TkVEh0U
	 v2l6bmsu7tXiwmIHx9jp06C1O4ExcTek9K9rDW26dYCc18REsGomgHd4vAPuzvEDal
	 Etm99XBvgLtK8EqlZkkd0s2iEn/WF9+lAX4z5BQYSQ8pUCN0TAnZp/L0XGMqU2Ayf3
	 YPAueqsbPwiDzA1u+wgbVIaHBfIcK3XhCxmRqbmBLZnJYro61/CxEYTN0dNLFL9FQS
	 Ax7jesdKRpxMEr9tdTkQKvoXe7zCKamChc/wm2uhMXHrPWQUPIIfT0EZTZsPdLcJ0Q
	 iuTxcXHsg2IaA==
Date: Wed, 05 Mar 2025 01:12:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2] xen/console: make console buffer size configurable
Message-ID: <20250305011127.4079670-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 96f650eb570a6a7bb33e783d083fb78a7e447563
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer =
size
as a power of 2.

The supported range is [14..27] -> [16KiB..128MiB].

Set default to 15 (32 KiB).

Link: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v1->v2:
- Switched to using powers of 2 in new Kconfig knob
---
 docs/misc/xen-command-line.pandoc |  5 ++++-
 xen/drivers/char/Kconfig          | 27 +++++++++++++++++++++++++++
 xen/drivers/char/console.c        |  6 +++---
 3 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 0c6225391d..1e12d2c6b5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -425,10 +425,13 @@ The following are examples of correct specifications:
 ### conring_size
 > `=3D <size>`
=20
-> Default: `conring_size=3D16k`
+> Default: `conring_size=3D32k`
=20
 Specify the size of the console ring buffer.
=20
+The console ring buffer size can be selected at build time via
+CONFIG_CONRING_SHIFT.
+
 ### console
 > `=3D List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | n=
one ]`
=20
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e6e12bb413..d3ddb7d87a 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -96,6 +96,33 @@ config SERIAL_TX_BUFSIZE
=20
 =09  Default value is 32768 (32KiB).
=20
+config CONRING_SHIFT
+=09int "Console buffer size (power of 2)"
+=09range 14 27
+=09default 15
+=09help
+=09  Select the boot console buffer size as a power of 2.
+=09  Run-time console buffer size is the same as the boot console size,
+=09  unless overridden via 'conring_size=3D' boot parameter.
+
+=09  Default value is 15 (32KiB).
+
+=09  Examples:
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
+=09    15 =3D>  32 KiB
+=09    14 =3D>  16 KiB
+
 config XHCI
 =09bool "XHCI DbC UART driver"
 =09depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a84932e384..65468109ba 100644
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
+#define _CONRING_SIZE       (1UL << CONFIG_CONRING_SHIFT)
+#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__read_mostly conring =3D _conring;
 static uint32_t __read_mostly conring_size =3D _CONRING_SIZE;
--=20
2.34.1



