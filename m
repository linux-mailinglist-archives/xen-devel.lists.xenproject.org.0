Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451869085F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 13:12:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492417.761943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5mo-00045J-U8; Thu, 09 Feb 2023 12:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492417.761943; Thu, 09 Feb 2023 12:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5mo-00043V-Qk; Thu, 09 Feb 2023 12:12:22 +0000
Received: by outflank-mailman (input) for mailman id 492417;
 Thu, 09 Feb 2023 12:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rTn=6F=citrix.com=prvs=3970fcfec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pQ5mn-000433-Ts
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 12:12:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3a5762-a872-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 13:12:19 +0100 (CET)
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
X-Inumbo-ID: ff3a5762-a872-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675944739;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b/weYmisqByS+WOypNaop0HmptEvzBJtExfdTfUZWBY=;
  b=BWJeoGD5G7OsQOMfmIZyzgUUgGYo6nB3lcqL2qjxTlryYQdUX4WZJuWm
   JOOZ1EyfV0GeJEGSTt6jqvHq9ePDBNCZm7F3CnDvRoHHX5WQdmQt+/bDF
   46FC+uRaCBgaCR9LZvl+TcRm0YV/VmWf2NRvm17IFFWtGihyS3ybiK5WQ
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95748331
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:uJO91aLUskIzXp0jFE+RwpUlxSXFcZb7ZxGr2PjKsXjdYENS3j0Oy
 TMXDDyGOK3fNmL1L40gaI3ko00F6sTVzNRlHQNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5ARvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5rIkd2p
 M4CdAlcVQmx1/npkImyd/Rj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbGJoJzh3D/
 woq+UzYLg4ULs6HwwDY+yuHq9TpngeqZY47QejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 04b4C01toAp6VemCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvMEyn1GqqoQS2aJQszFT4wf3M9HDAc0Yn4/9EIhy/SQYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD3271k5JAVdoKiN2bGKuOGphsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRP8ghLVfZrXA0NCZ8OlwBdmB3wcnT3
 r/CLq6R4YsyU/w7nFJauc9CuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/Fqmhmre1c4RDt8VqSIkdvMueVNxsxoqwsBx
 VnlMmcw9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:Jxl9f6CZMCgueG7lHeml55DYdb4zR+YMi2TDtnoBLCC9Hfb1qy
 nDppsmPHzP+VQssRMb+exoUZPoKRmwyXcS2+cs1N+ZLW7bUQCTXeJfBOXZogEIHReUygcn79
 YFT5RD
X-IronPort-AV: E=Sophos;i="5.97,283,1669093200"; 
   d="scan'208";a="95748331"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH] libs/util: Fix parallel build between flex/bison and CC rules
Date: Thu, 9 Feb 2023 12:11:56 +0000
Message-ID: <20230209121156.11040-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

flex/bison generate two targets, and when those targets are
prerequisite of other rules they are considered independently by make.

We can have a situation where the .c file is out-of-date but not the
.h, git checkout for example. In this case, if a rule only have the .h
file as prerequiste, make will procced and start to build the object.
In parallel, another target can have the .c file as prerequisite and
make will find out it need re-generating and do so, changing the .h at
the same time. This parallel task breaks the first one.

To avoid this scenario, we put both the header and the source as
prerequisite for all object even if they only need the header.

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

We could add those new prerequisite as order-only, but since the
header is going to be re-generated anyway, the object will be too.

I tried to simply have something like
"libxlu_cfg_l.h: libxlu_cfg_l.c", but make find it to be a circular
dependency.

I tried to use grouped target ( &: ) with a recent version of make
(4.3), but that didn't work. And we couldn't use it as it's a new
feature.

As reference, this is the minimum dependencies, as not all object
needs all generated headers, but keeping that in sync with source
change could be problematique:

libxlu_cfg_l.o libxlu_cfg_l.opic: libxlu_cfg_y.h
libxlu_cfg_y.o libxlu_cfg_y.opic: libxlu_cfg_l.h

libxlu_cfg.o libxlu_cfg.opic: libxlu_cfg_y.h libxlu_cfg_l.h
libxlu_disk.o libxlu_disk.opic: libxlu_cfg_y.h libxlu_disk_l.h
libxlu_vif.o:
libxlu_pci.o:

    And the .c files prerequisite
libxlu_cfg_l.o libxlu_cfg_l.opic: libxlu_cfg_y.c
libxlu_cfg_y.o libxlu_cfg_y.opic: libxlu_cfg_l.c
libxlu_cfg.o libxlu_cfg.opic: libxlu_cfg_y.c libxlu_cfg_l.c
libxlu_disk.o libxlu_disk.opic: libxlu_cfg_y.c libxlu_disk_l.c
---
 tools/libs/util/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 93ebf930a4..8a8c218eb5 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -28,6 +28,14 @@ include $(XEN_ROOT)/tools/libs/libs.mk
 
 $(OBJS-y) $(PIC_OBJS): $(AUTOINCS)
 
+# Adding the .c conterparts of the headers generated by flex/bison as
+# prerequisite of all objects.
+# This is to tell make that if only the .c file is out-of-date but not the
+# header, it should still wait for the .c file to be rebuilt.
+# Otherwise, make doesn't considered "%.c %.h" as grouped targets, and will run
+# the flex/bison rules in parallel of CC rules which only need the header.
+$(OBJS-y) $(PIC_OBJS): libxlu_cfg_l.c libxlu_cfg_y.c libxlu_disk_l.c
+
 %.c %.h: %.y
 	@rm -f $*.[ch]
 	$(BISON) --output=$*.c $<
-- 
Anthony PERARD


