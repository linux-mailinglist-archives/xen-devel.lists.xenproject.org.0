Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1052F93A
	for <lists+xen-devel@lfdr.de>; Sat, 21 May 2022 08:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334396.558680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsIYD-0005kU-02; Sat, 21 May 2022 06:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334396.558680; Sat, 21 May 2022 06:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsIYC-0005hj-Si; Sat, 21 May 2022 06:25:20 +0000
Received: by outflank-mailman (input) for mailman id 334396;
 Fri, 20 May 2022 15:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gipH=V4=efficios.com=mathieu.desnoyers@srs-se1.protection.inumbo.net>)
 id 1ns4JO-0002vj-4X
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 15:13:06 +0000
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 588a82f9-d84f-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 17:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 2CD1E3EF507;
 Fri, 20 May 2022 10:37:54 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id K6z2fUU2BRbM; Fri, 20 May 2022 10:37:53 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id B3B213EF505;
 Fri, 20 May 2022 10:37:51 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eBm25T-A2ldC; Fri, 20 May 2022 10:37:51 -0400 (EDT)
Received: from thinkos.internal.efficios.com (192-222-180-24.qc.cable.ebox.net
 [192.222.180.24])
 by mail.efficios.com (Postfix) with ESMTPSA id 7161A3EF14F;
 Fri, 20 May 2022 10:37:50 -0400 (EDT)
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
X-Inumbo-ID: 588a82f9-d84f-11ec-bd2c-47488cf2e6aa
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B3B213EF505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1653057471;
	bh=eKAcUJ3Vwog/U5pko6aDj4DxDE5BHJKJTsP7eji0qRI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Dalrt/O/csYw6k+1pFLjX1u/7y6LmT2e0VvGO6Z/iLTutpGc44TGfvsfdBK50yhAl
	 dTxcV2n8uOpV7ZXEMI0l33iQ/+au029/3yhJBnpXD0PyRNGvWPK6Hgzd5FZN9rzuT5
	 6q5cFEHY+u8PcEmfJeZ46fV9pVIt323m+nX5n9ywSMtO8uK/Y31yvwYaIIX7/mtA3Y
	 GOV2UpvEfu8AS3gMUcMY4jUDJUkvcZ2f9W6grMHe0zpnNtKTvS2cBVE53VmsECQrPd
	 01J1t2kODSEC9jWxzMArK4IIzDpXyjQktX47Ju6/nVjIumWJs8Da4ySIK9u4Qpnkrs
	 4MHPL49SroLHA==
X-Virus-Scanned: amavisd-new at efficios.com
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: grub-devel@gnu.org
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v3 2/5] grub-mkconfig linux_xen: Fix quadratic algorithm for sorting menu items
Date: Fri, 20 May 2022 10:37:38 -0400
Message-Id: <20220520143741.217690-3-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520143741.217690-1-mathieu.desnoyers@efficios.com>
References: <20220520143741.217690-1-mathieu.desnoyers@efficios.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The current implementation of the 20_linux_xen script implements its
menu items sorting in bash with a quadratic algorithm, calling "sed",
"sort", "head", and "grep" to compare versions between individual lines,
which is annoyingly slow for kernel developers who can easily end up
with 50-100 kernels in their boot partition.

This fix is ported from the 10_linux script, which has a similar
quadratic code pattern.

[ Note: this is untested. I would be grateful if anyone with a Xen
  environment could test it before it is merged. ]

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: xen-devel@lists.xenproject.org
---
 util/grub.d/20_linux_xen.in | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
index f45559ff8..3178eb430 100644
--- a/util/grub.d/20_linux_xen.in
+++ b/util/grub.d/20_linux_xen.in
@@ -237,11 +237,17 @@ esac
 # yet, so it's empty. In a submenu it will be equal to '\t' (one tab).
 submenu_indentation=3D""
=20
+# Perform a reverse version sort on the entire xen_list and linux_list.
+# Temporarily replace the '.old' suffix by ' 1' and append ' 2' for all
+# other files to order the '.old' files after their non-old counterpart
+# in reverse-sorted order.
+
+reverse_sorted_xen_list=3D$(echo ${xen_list} | tr ' ' '\n' | sed -e 's/\=
.old$/ 1/' -e '/ 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/' -=
e 's/ 2$//')
+reverse_sorted_linux_list=3D$(echo ${linux_list} | tr ' ' '\n' | sed -e =
's/\.old$/ 1/' -e '/ 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old=
/' -e 's/ 2$//')
+
 is_top_level=3Dtrue
=20
-while [ "x${xen_list}" !=3D "x" ] ; do
-    list=3D"${linux_list}"
-    current_xen=3D`version_find_latest $xen_list`
+for current_xen in ${reverse_sorted_xen_list}; do
     xen_basename=3D`basename ${current_xen}`
     xen_dirname=3D`dirname ${current_xen}`
     rel_xen_dirname=3D`make_system_path_relative_to_its_root $xen_dirnam=
e`
@@ -273,8 +279,7 @@ while [ "x${xen_list}" !=3D "x" ] ; do
        fi
     done
=20
-    while [ "x$list" !=3D "x" ] ; do
-	linux=3D`version_find_latest $list`
+    for linux in ${reverse_sorted_linux_list}; do
 	gettext_printf "Found linux image: %s\n" "$linux" >&2
 	basename=3D`basename $linux`
 	dirname=3D`dirname $linux`
@@ -349,13 +354,10 @@ while [ "x${xen_list}" !=3D "x" ] ; do
 	    linux_entry "${OS}" "${version}" "${xen_version}" recovery \
 		"${GRUB_CMDLINE_LINUX_RECOVERY} ${GRUB_CMDLINE_LINUX}" "${GRUB_CMDLINE=
_XEN}"
 	fi
-
-	list=3D`echo $list | tr ' ' '\n' | fgrep -vx "$linux" | tr '\n' ' '`
     done
     if [ x"$is_top_level" !=3D xtrue ]; then
 	echo '	}'
     fi
-    xen_list=3D`echo $xen_list | tr ' ' '\n' | fgrep -vx "$current_xen" =
| tr '\n' ' '`
 done
=20
 # If at least one kernel was found, then we need to
--=20
2.30.2


