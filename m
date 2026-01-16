Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E32D2B73C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 05:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206119.1519850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYC-0005U0-Hp; Fri, 16 Jan 2026 04:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206119.1519850; Fri, 16 Jan 2026 04:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYC-0005RV-Dq; Fri, 16 Jan 2026 04:35:08 +0000
Received: by outflank-mailman (input) for mailman id 1206119;
 Fri, 16 Jan 2026 04:35:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vgbYA-0005E6-Pc
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 04:35:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbYA-006Cye-1i;
 Fri, 16 Jan 2026 04:35:06 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbY9-005RC1-2y;
 Fri, 16 Jan 2026 04:35:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=kh21T0kKV5XodX2DHwO7OSuhQ97nSlNN542UIGS2Vhw=; b=Afvnp0XjZ2mG+CkbS9x0iACoZK
	PrjKPb+/yXNdGNStzyPTn2w4WngrnRlVenv07LA9PZnmeYOC1UHdWiHHO4xPuAPrY1oMX8AaXOm4K
	TPiU4fBJWOH/hm847E7n+bq+Sa70rAyccAXyYkF0KANFxIDaLckjrfPXoV4QhEkDd6Eo=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v1 1/4] scripts/config: import Kconfig manipulation tool from Linux
Date: Thu, 15 Jan 2026 20:34:55 -0800
Message-ID: <20260116043458.730728-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116043458.730728-1-dmukhin@ford.com>
References: <20260116043458.730728-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Manipulating Kconfig settings is often required when preparing a custom
Xen build using an external build system (e.g., a Yocto-based workflow).

Import the Kconfig manipulation tool from the Linux kernel
(commit 0f61b1860cc3, Linux v6.19-rc5) to support this use case.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/scripts/config | 236 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100755 xen/scripts/config

diff --git a/xen/scripts/config b/xen/scripts/config
new file mode 100755
index 000000000000..ea475c07de28
--- /dev/null
+++ b/xen/scripts/config
@@ -0,0 +1,236 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0
+# Manipulate options in a .config file from the command line
+
+myname=${0##*/}
+
+# If no prefix forced, use the default CONFIG_
+CONFIG_="${CONFIG_-CONFIG_}"
+
+# We use an uncommon delimiter for sed substitutions
+SED_DELIM=$(echo -en "\001")
+
+usage() {
+	cat >&2 <<EOL
+Manipulate options in a .config file from the command line.
+Usage:
+$myname options command ...
+commands:
+	--enable|-e option   Enable option
+	--disable|-d option  Disable option
+	--module|-m option   Turn option into a module
+	--set-str option string
+	                     Set option to "string"
+	--set-val option value
+	                     Set option to value
+	--undefine|-u option Undefine option
+	--state|-s option    Print state of option (n,y,m,undef)
+
+	--enable-after|-E beforeopt option
+                             Enable option directly after other option
+	--disable-after|-D beforeopt option
+                             Disable option directly after other option
+	--module-after|-M beforeopt option
+                             Turn option into module directly after other option
+	--refresh            Refresh the config using old settings
+
+	commands can be repeated multiple times
+
+options:
+	--file config-file   .config file to change (default .config)
+	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
+
+$myname doesn't check the validity of the .config file. This is done at next
+make time.
+
+By default, $myname will upper-case the given symbol. Use --keep-case to keep
+the case of all following symbols unchanged.
+
+$myname uses 'CONFIG_' as the default symbol prefix. Set the environment
+variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" $myname ...
+EOL
+	exit 1
+}
+
+checkarg() {
+	ARG="$1"
+	if [ "$ARG" = "" ] ; then
+		usage
+	fi
+	case "$ARG" in
+	${CONFIG_}*)
+		ARG="${ARG/${CONFIG_}/}"
+		;;
+	esac
+	if [ "$MUNGE_CASE" = "yes" ] ; then
+		ARG="`echo $ARG | tr a-z A-Z`"
+	fi
+}
+
+txt_append() {
+	local anchor="$1"
+	local insert="$2"
+	local infile="$3"
+	local tmpfile="$infile.swp"
+
+	# sed append cmd: 'a\' + newline + text + newline
+	cmd="$(printf "a\\%b$insert" "\n")"
+
+	sed -e "/$anchor/$cmd" "$infile" >"$tmpfile"
+	# replace original file with the edited one
+	mv "$tmpfile" "$infile"
+}
+
+txt_subst() {
+	local before="$1"
+	local after="$2"
+	local infile="$3"
+	local tmpfile="$infile.swp"
+
+	sed -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
+	# replace original file with the edited one
+	mv "$tmpfile" "$infile"
+}
+
+txt_delete() {
+	local text="$1"
+	local infile="$2"
+	local tmpfile="$infile.swp"
+
+	sed -e "/$text/d" "$infile" >"$tmpfile"
+	# replace original file with the edited one
+	mv "$tmpfile" "$infile"
+}
+
+set_var() {
+	local name=$1 new=$2 before=$3
+
+	name_re="^($name=|# $name is not set)"
+	before_re="^($before=|# $before is not set)"
+	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
+		txt_append "^$before=" "$new" "$FN"
+		txt_append "^# $before is not set" "$new" "$FN"
+	elif grep -Eq "$name_re" "$FN"; then
+		txt_subst "^$name=.*" "$new" "$FN"
+		txt_subst "^# $name is not set" "$new" "$FN"
+	else
+		echo "$new" >>"$FN"
+	fi
+}
+
+undef_var() {
+	local name=$1
+
+	txt_delete "^$name=" "$FN"
+	txt_delete "^# $name is not set" "$FN"
+}
+
+FN=.config
+CMDS=()
+while [[ $# -gt 0 ]]; do
+	if [ "$1" = "--file" ]; then
+		if [ "$2" = "" ]; then
+			usage
+		fi
+		FN="$2"
+		shift 2
+	else
+		CMDS+=("$1")
+		shift
+	fi
+done
+
+set -- "${CMDS[@]}"
+if [ "$1" = "" ] ; then
+	usage
+fi
+
+MUNGE_CASE=yes
+while [ "$1" != "" ] ; do
+	CMD="$1"
+	shift
+	case "$CMD" in
+	--keep-case|-k)
+		MUNGE_CASE=no
+		continue
+		;;
+	--refresh)
+		;;
+	--*-after|-E|-D|-M)
+		checkarg "$1"
+		A=$ARG
+		checkarg "$2"
+		B=$ARG
+		shift 2
+		;;
+	-*)
+		checkarg "$1"
+		shift
+		;;
+	esac
+	case "$CMD" in
+	--enable|-e)
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=y"
+		;;
+
+	--disable|-d)
+		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
+		;;
+
+	--module|-m)
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=m"
+		;;
+
+	--set-str)
+		# sed swallows one level of escaping, so we need double-escaping
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=\"${1//\"/\\\\\"}\""
+		shift
+		;;
+
+	--set-val)
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=$1"
+		shift
+		;;
+	--undefine|-u)
+		undef_var "${CONFIG_}$ARG"
+		;;
+
+	--state|-s)
+		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
+			echo n
+		else
+			V="$(grep "^${CONFIG_}$ARG=" $FN)"
+			if [ $? != 0 ] ; then
+				echo undef
+			else
+				V="${V/#${CONFIG_}$ARG=/}"
+				V="${V/#\"/}"
+				V="${V/%\"/}"
+				V="${V//\\\"/\"}"
+				echo "${V}"
+			fi
+		fi
+		;;
+
+	--enable-after|-E)
+		set_var "${CONFIG_}$B" "${CONFIG_}$B=y" "${CONFIG_}$A"
+		;;
+
+	--disable-after|-D)
+		set_var "${CONFIG_}$B" "# ${CONFIG_}$B is not set" "${CONFIG_}$A"
+		;;
+
+	--module-after|-M)
+		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
+		;;
+
+	--refresh)
+		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		;;
+
+	*)
+		echo "bad command: $CMD" >&2
+		usage
+		;;
+	esac
+done
-- 
2.52.0


