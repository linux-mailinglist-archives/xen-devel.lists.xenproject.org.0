Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0245485A5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 16:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348346.574631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kjy-00063N-Bd; Mon, 13 Jun 2022 14:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348346.574631; Mon, 13 Jun 2022 14:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kjy-00061a-7h; Mon, 13 Jun 2022 14:08:26 +0000
Received: by outflank-mailman (input) for mailman id 348346;
 Mon, 13 Jun 2022 14:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VFpo=WU=efficios.com=mathieu.desnoyers@srs-se1.protection.inumbo.net>)
 id 1o0kjw-00061U-G1
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 14:08:24 +0000
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48efdc0b-eb22-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 16:08:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 49B723B192F;
 Mon, 13 Jun 2022 10:08:22 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1QIeFPky47dL; Mon, 13 Jun 2022 10:08:22 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id D79103B1917;
 Mon, 13 Jun 2022 10:08:21 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TsoPpi0KGJXB; Mon, 13 Jun 2022 10:08:21 -0400 (EDT)
Received: from thinkos.internal.efficios.com (192-222-180-24.qc.cable.ebox.net
 [192.222.180.24])
 by mail.efficios.com (Postfix) with ESMTPSA id 991733B157E;
 Mon, 13 Jun 2022 10:08:21 -0400 (EDT)
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
X-Inumbo-ID: 48efdc0b-eb22-11ec-bd2c-47488cf2e6aa
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com D79103B1917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1655129301;
	bh=6PhM3UYenJCPijS1HSQZt5FpUV3quhOUIlo9RAf1E/Q=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NEY1W6XLdvjCfizHEE972rv5aAiOd5T32YwP2j6DwPJK26tSZJEbtSjV0gGQkDMfL
	 tBBkPexh+2ASFHWsU6u8wo8SN1msTlHMKIpThfV1gVuEaQJzqsNq4zmFRVWDhmoAa1
	 J6AawhReSY0topnwAMSFldeVhxRqRl/5ha3d2MGITCzH7FTl3p3x8z99f+QryzMx8o
	 wE8VV2IghotAKwytN842o/wlrytOD4vYOEe1jt0ET9ZsAJ2aewBrg5Q/9MTT6IuTIy
	 /jnMIYhlTZY9mXEJMms0k8yp+DVzpfixVQr7jBS8dis03t6y3vhFVSUr+h8znPCIdo
	 nGTys1/7SAlBQ==
X-Virus-Scanned: amavisd-new at efficios.com
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: grub-devel@gnu.org,
	Daniel Kiper <dkiper@net-space.pl>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 2/5] grub-mkconfig linux_xen: Fix quadratic algorithm for sorting menu items
Date: Mon, 13 Jun 2022 10:08:23 -0400
Message-Id: <20220613140826.571036-3-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613140826.571036-1-mathieu.desnoyers@efficios.com>
References: <20220613140826.571036-1-mathieu.desnoyers@efficios.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The current implementation of the 20_linux_xen script implements its
menu items sorting in bash with a quadratic algorithm, calling "sed",
"sort", "head", and "grep" to compare versions between individual lines,
which is annoyingly slow for kernel developers who can easily end up
with 50-100 kernels in their boot partition.

This fix is ported from the 10_linux script, which has a similar
quadratic code pattern.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
---
Changes since v4:
- Combine sed -e '...' -e '...' into sed -e '...; ...'
---
 util/grub.d/20_linux_xen.in | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
index 51a983926..4382303c1 100644
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
.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s/ 2$=
//')
+reverse_sorted_linux_list=3D$(echo ${linux_list} | tr ' ' '\n' | sed -e =
's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s=
/ 2$//')
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
@@ -351,13 +356,10 @@ while [ "x${xen_list}" !=3D "x" ] ; do
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


