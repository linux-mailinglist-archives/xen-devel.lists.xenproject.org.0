Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057C3A5B992
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907212.1314481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trtkL-0001aO-76; Tue, 11 Mar 2025 07:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907212.1314481; Tue, 11 Mar 2025 07:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trtkL-0001Yc-4L; Tue, 11 Mar 2025 07:09:49 +0000
Received: by outflank-mailman (input) for mailman id 907212;
 Tue, 11 Mar 2025 07:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lFlb=V6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1trtkI-0001YW-10
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:09:47 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce34f59f-fe47-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 08:09:42 +0100 (CET)
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
X-Inumbo-ID: ce34f59f-fe47-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741676981; x=1741936181;
	bh=mV9a75nmhMh2/Fuuwr6Zg4EoZlyh62lt04p+OA5Udzo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=edpTw2uRGGRIojpGF/Md1uA78Uy2pTpGbpTw0CPTiLzhIlpLJesCz2nQNvgvFKW0U
	 JnhhT85i3N6k9X8FULOGpLp+2tvSAPCCYc30sKibLgBoePlvCmGqA3CUrSphr6tR4v
	 K2HX1TOUirvkETWpOP1gNNh+IL+1dx/c3HTVCcV/koQuxd2WaVqJ50FF38E+VzB5X7
	 HxpnNV/FMjtOePQUlj4GTTOXhI+CztmfgEdQw2GOoI1iwvuikh30YV1dQ9WGu0rG5e
	 XL1WhOdH3reHleaBat4afD96FdWcl4Jc9+du8fE8BRp3WXTzKzeNO7PrpfAjSl6TYV
	 5l0TIkgE4/3Cw==
Date: Tue, 11 Mar 2025 07:09:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4] xen/console: make console buffer size configurable
Message-ID: <20250311070912.730334-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3b58a56e8d9a01993ce4841f41154431fcb97d3f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer =
size
as a power of 2.

The supported range is [14..27] -> [16KiB..128MiB].

Set default to 15 (32 KiB).

Resolves: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v3->v4:
- s/Link:/Resolves:/ in commit message to auto-close the gitlab ticket
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



