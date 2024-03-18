Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B935587EE7B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695053.1084592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGV9-0000NZ-0p; Mon, 18 Mar 2024 17:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695053.1084592; Mon, 18 Mar 2024 17:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGV8-0000Lu-US; Mon, 18 Mar 2024 17:10:18 +0000
Received: by outflank-mailman (input) for mailman id 695053;
 Mon, 18 Mar 2024 17:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHR-0002f9-TW
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:10 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a5c7cb5-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:08 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4146172fb7eso2495315e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:08 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:06 -0700 (PDT)
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
X-Inumbo-ID: 6a5c7cb5-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780967; x=1711385767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUXPAW3FLPo5B8zg0wxT5OYvS3EjbAdIkCVM/s4WpSc=;
        b=htBNCusyWccfWEdbMN4cXS3nrn8KySBg26OXxRrG3/2RBRtBhU5Zd9Kbeqt3r775OR
         l5xFnK7owEz6auWbaClv7Xwrq7Si1lYoVWsBGo3idXvh9YuAZYL4g8yhy2jG1GL120fa
         jKAQzvzw8YlCN0/n+UwVEKYWqD3c2JEIUoUlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780967; x=1711385767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUXPAW3FLPo5B8zg0wxT5OYvS3EjbAdIkCVM/s4WpSc=;
        b=g0wfBbYmlCmuac8XqbKJMYm4z/cNHwGvA+wnr5rDUakKIErDhg6q1rMokz9BwqXR+0
         baAE3qoMRRlx2a2lPEekuQFISBYQuSh6Mzd1X4FGJavdcnKG5fbVmqlmEGWPT1bVqgu1
         wLhQJ7EARStSaYYBRRqZ37Sfj+ifw+JzwqqOzcU7BkcT+85+FsFir2sJqjz5+9zrpSc0
         8NFICuWfTx5/hF/gF9vd0Ox7k5ceqPYYVpKUUGRuAY0+JBcOvEkV7hkstFYbHJXwsTCE
         TTy7cm6POZ3pifep6gyuSmR5/FSe1/FRcPKAZzWry2BI9DqW6x6HqWI1+4moaGm5f3Vi
         vXHg==
X-Gm-Message-State: AOJu0YxHbQ9H/5C21WhflI84AyujH8ggOLJNLpVFGwm6DiiwR6E+GnMd
	f1q5fw8k96ElUo+y21IeKXWIi31QVDEvAAaBBemfL0+JooqS2wNjQa/T6vAYhYWjfjQKvAP0KSG
	c
X-Google-Smtp-Source: AGHT+IEMMYPv3Ei8t1HgtSeYV5cqaFPoLK/jY5+n5K+v01i5UX0uQMizZO6JTdhDa0O1u48GL+n9kA==
X-Received: by 2002:a05:600c:3b87:b0:413:2873:937 with SMTP id n7-20020a05600c3b8700b0041328730937mr5951899wms.35.1710780967257;
        Mon, 18 Mar 2024 09:56:07 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 19/36] overlay-bookworm: Import grub's 20_linux_xen from Debian Bookworm
Date: Mon, 18 Mar 2024 16:55:28 +0000
Message-Id: <20240318165545.3898-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a copy of the file installed, from grub-common package.

We are going to edit it shortly.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 overlay-bookworm/etc/grub.d/20_linux_xen | 379 +++++++++++++++++++++++
 1 file changed, 379 insertions(+)
 create mode 100755 overlay-bookworm/etc/grub.d/20_linux_xen

diff --git a/overlay-bookworm/etc/grub.d/20_linux_xen b/overlay-bookworm/etc/grub.d/20_linux_xen
new file mode 100755
index 00000000..3a27fc6f
--- /dev/null
+++ b/overlay-bookworm/etc/grub.d/20_linux_xen
@@ -0,0 +1,379 @@
+#! /bin/sh
+set -e
+
+# grub-mkconfig helper script.
+# Copyright (C) 2006,2007,2008,2009,2010  Free Software Foundation, Inc.
+#
+# GRUB is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+#
+# GRUB is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
+
+prefix="/usr"
+exec_prefix="/usr"
+datarootdir="/usr/share"
+
+. "$pkgdatadir/grub-mkconfig_lib"
+
+export TEXTDOMAIN=grub
+export TEXTDOMAINDIR="${datarootdir}/locale"
+
+CLASS="--class gnu-linux --class gnu --class os --class xen"
+SUPPORTED_INITS="sysvinit:/lib/sysvinit/init systemd:/lib/systemd/systemd upstart:/sbin/upstart"
+
+if [ "x${GRUB_DISTRIBUTOR}" = "x" ] ; then
+  OS=GNU/Linux
+else
+  OS="${GRUB_DISTRIBUTOR} GNU/Linux"
+  CLASS="--class $(echo ${GRUB_DISTRIBUTOR} | tr 'A-Z' 'a-z' | cut -d' ' -f1|LC_ALL=C sed 's,[^[:alnum:]_],_,g') ${CLASS}"
+fi
+
+# loop-AES arranges things so that /dev/loop/X can be our root device, but
+# the initrds that Linux uses don't like that.
+case ${GRUB_DEVICE} in
+  /dev/loop/*|/dev/loop[0-9])
+    GRUB_DEVICE=`losetup ${GRUB_DEVICE} | sed -e "s/^[^(]*(\([^)]\+\)).*/\1/"`
+    # We can't cope with devices loop-mounted from files here.
+    case ${GRUB_DEVICE} in
+      /dev/*) ;;
+      *) exit 0 ;;
+    esac
+  ;;
+esac
+
+# Default to disabling partition uuid support to maintian compatibility with
+# older kernels.
+GRUB_DISABLE_LINUX_PARTUUID=${GRUB_DISABLE_LINUX_PARTUUID-true}
+
+# btrfs may reside on multiple devices. We cannot pass them as value of root= parameter
+# and mounting btrfs requires user space scanning, so force UUID in this case.
+if ( [ "x${GRUB_DEVICE_UUID}" = "x" ] && [ "x${GRUB_DEVICE_PARTUUID}" = "x" ] ) \
+    || ( [ "x${GRUB_DISABLE_LINUX_UUID}" = "xtrue" ] \
+	&& [ "x${GRUB_DISABLE_LINUX_PARTUUID}" = "xtrue" ] ) \
+    || ( ! test -e "/dev/disk/by-uuid/${GRUB_DEVICE_UUID}" \
+	&& ! test -e "/dev/disk/by-partuuid/${GRUB_DEVICE_PARTUUID}" ) \
+    || ( test -e "${GRUB_DEVICE}" && uses_abstraction "${GRUB_DEVICE}" lvm ); then
+  LINUX_ROOT_DEVICE=${GRUB_DEVICE}
+elif [ "x${GRUB_DEVICE_UUID}" = "x" ] \
+    || [ "x${GRUB_DISABLE_LINUX_UUID}" = "xtrue" ]; then
+  LINUX_ROOT_DEVICE=PARTUUID=${GRUB_DEVICE_PARTUUID}
+else
+  LINUX_ROOT_DEVICE=UUID=${GRUB_DEVICE_UUID}
+fi
+
+# Allow overriding GRUB_CMDLINE_LINUX and GRUB_CMDLINE_LINUX_DEFAULT.
+if [ "${GRUB_CMDLINE_LINUX_XEN_REPLACE}" ]; then
+  GRUB_CMDLINE_LINUX="${GRUB_CMDLINE_LINUX_XEN_REPLACE}"
+fi
+if [ "${GRUB_CMDLINE_LINUX_XEN_REPLACE_DEFAULT}" ]; then
+  GRUB_CMDLINE_LINUX_DEFAULT="${GRUB_CMDLINE_LINUX_XEN_REPLACE_DEFAULT}"
+fi
+
+case x"$GRUB_FS" in
+    xbtrfs)
+	rootsubvol="`make_system_path_relative_to_its_root /`"
+	rootsubvol="${rootsubvol#/}"
+	if [ "x${rootsubvol}" != x ]; then
+	    GRUB_CMDLINE_LINUX="rootflags=subvol=${rootsubvol} ${GRUB_CMDLINE_LINUX}"
+	fi;;
+    xzfs)
+	rpool=`${grub_probe} --device ${GRUB_DEVICE} --target=fs_label 2>/dev/null || true`
+	bootfs="`make_system_path_relative_to_its_root / | sed -e "s,@$,,"`"
+	LINUX_ROOT_DEVICE="ZFS=${rpool}${bootfs%/}"
+	;;
+esac
+
+title_correction_code=
+
+linux_entry ()
+{
+  linux_entry_xsm "$@" false
+  linux_entry_xsm "$@" true
+}
+linux_entry_xsm ()
+{
+  os="$1"
+  version="$2"
+  xen_version="$3"
+  type="$4"
+  args="$5"
+  xen_args="$6"
+  xsm="$7"
+  # If user wants to enable XSM support, make sure there's
+  # corresponding policy file.
+  if ${xsm} ; then
+      xenpolicy="xenpolicy-$xen_version"
+      if test ! -e "${xen_dirname}/${xenpolicy}" ; then
+	  return
+      fi
+      xen_args="$xen_args flask=enforcing"
+      xen_version="$(gettext_printf "%s (XSM enabled)" "$xen_version")"
+      # xen_version is used for messages only; actual file is xen_basename
+  fi
+  if [ -z "$boot_device_id" ]; then
+      boot_device_id="$(grub_get_device_id "${GRUB_DEVICE}")"
+  fi
+  if [ x$type != xsimple ] ; then
+      if [ x$type = xrecovery ] ; then
+	  title="$(gettext_printf "%s, with Xen %s and Linux %s (%s)" "${os}" "${xen_version}" "${version}" "$(gettext "${GRUB_RECOVERY_TITLE}")")"
+      elif [ "${type#init-}" != "$type" ] ; then
+	  title="$(gettext_printf "%s, with Xen %s and Linux %s (%s)" "${os}" "${xen_version}" "${version}" "${type#init-}")"
+      else
+	  title="$(gettext_printf "%s, with Xen %s and Linux %s" "${os}" "${xen_version}" "${version}")"
+      fi
+      replacement_title="$(echo "Advanced options for ${OS}" | sed 's,>,>>,g')>$(echo "$title" | sed 's,>,>>,g')"
+      if [ x"Xen ${xen_version}>$title" = x"$GRUB_ACTUAL_DEFAULT" ]; then
+         quoted="$(echo "$GRUB_ACTUAL_DEFAULT" | grub_quote)"
+         title_correction_code="${title_correction_code}if [ \"x\$default\" = '$quoted' ]; then default='$(echo "$replacement_title" | grub_quote)'; fi;"
+         grub_warn "$(gettext_printf "Please don't use old title \`%s' for GRUB_DEFAULT, use \`%s' (for versions before 2.00) or \`%s' (for 2.00 or later)" "$GRUB_ACTUAL_DEFAULT" "$replacement_title" "gnulinux-advanced-$boot_device_id>gnulinux-$version-$type-$boot_device_id")"
+      fi
+      echo "menuentry '$(echo "$title" | grub_quote)' ${CLASS} \$menuentry_id_option 'xen-gnulinux-$version-$type-$boot_device_id' {" | sed "s/^/$submenu_indentation/"
+  else
+      title="$(gettext_printf "%s, with Xen hypervisor" "${os}")"
+      echo "menuentry '$(echo "$title" | grub_quote)' ${CLASS} \$menuentry_id_option 'xen-gnulinux-simple-$boot_device_id' {" | sed "s/^/$submenu_indentation/"
+  fi
+  if [ x$type != xrecovery ] ; then
+      save_default_entry | grub_add_tab | sed "s/^/$submenu_indentation/"
+  fi
+
+  if [ -z "${prepare_boot_cache}" ]; then
+    prepare_boot_cache="$(prepare_grub_to_access_device ${GRUB_DEVICE_BOOT} | grub_add_tab)"
+  fi
+  printf '%s\n' "${prepare_boot_cache}" | sed "s/^/$submenu_indentation/"
+  xmessage="$(gettext_printf "Loading Xen %s ..." ${xen_version})"
+  lmessage="$(gettext_printf "Loading Linux %s ..." ${version})"
+  sed "s/^/$submenu_indentation/" << EOF
+	echo	'$(echo "$xmessage" | grub_quote)'
+        if [ "\$grub_platform" = "pc" -o "\$grub_platform" = "" ]; then
+            xen_rm_opts=
+        else
+            xen_rm_opts="no-real-mode edd=off"
+        fi
+	${xen_loader}	${rel_xen_dirname}/${xen_basename} placeholder ${xen_args} \${xen_rm_opts}
+	echo	'$(echo "$lmessage" | grub_quote)'
+	${module_loader}	${rel_dirname}/${basename} placeholder root=${linux_root_device_thisversion} ro ${args}
+EOF
+  if test -n "${initrd}" ; then
+    # TRANSLATORS: ramdisk isn't identifier. Should be translated.
+    message="$(gettext_printf "Loading initial ramdisk ...")"
+    initrd_path=
+    for i in ${initrd}; do
+       initrd_path="${initrd_path} ${rel_dirname}/${i}"
+    done
+    sed "s/^/$submenu_indentation/" << EOF
+	echo	'$(echo "$message" | grub_quote)'
+	${module_loader}	--nounzip   $(echo $initrd_path)
+EOF
+  fi
+  if ${xsm} && test -n "${xenpolicy}" ; then
+    message="$(gettext_printf "Loading XSM policy ...")"
+    sed "s/^/$submenu_indentation/" << EOF
+	echo	'$(echo "$message" | grub_quote)'
+	${module_loader}     ${rel_dirname}/${xenpolicy}
+EOF
+  fi
+  sed "s/^/$submenu_indentation/" << EOF
+}
+EOF
+}
+
+linux_list=
+for i in /boot/vmlinu[xz]-* /vmlinu[xz]-* /boot/kernel-*; do
+    if grub_file_is_not_garbage "$i"; then
+    	basename=$(basename $i)
+	version=$(echo $basename | sed -e "s,^[^0-9]*-,,g")
+	dirname=$(dirname $i)
+	config=
+	for j in "${dirname}/config-${version}" "${dirname}/config-${alt_version}" "/etc/kernels/kernel-config-${version}" ; do
+	    if test -e "${j}" ; then
+		config="${j}"
+		break
+	    fi
+	done
+        if (grep -qx "CONFIG_XEN_DOM0=y" "${config}" 2> /dev/null || grep -qx "CONFIG_XEN_PRIVILEGED_GUEST=y" "${config}" 2> /dev/null); then linux_list="$linux_list $i" ; fi
+    fi
+done
+if [ "x${linux_list}" = "x" ] ; then
+    exit 0
+fi
+
+file_is_not_xen_garbage () {
+    case "$1" in
+	*/xen-syms-*)
+	    return 1;;
+	*/xenpolicy-*)
+	    return 1;;
+	*/*.config)
+	    return 1;;
+	*)
+	    return 0;;
+    esac
+}
+
+xen_list=
+for i in /boot/xen*; do
+    if grub_file_is_not_garbage "$i" && file_is_not_xen_garbage "$i" ; then xen_list="$xen_list $i" ; fi
+done
+prepare_boot_cache=
+boot_device_id=
+
+title_correction_code=
+
+machine=`uname -m`
+
+case "$machine" in
+    i?86) GENKERNEL_ARCH="x86" ;;
+    mips|mips64) GENKERNEL_ARCH="mips" ;;
+    mipsel|mips64el) GENKERNEL_ARCH="mipsel" ;;
+    arm*) GENKERNEL_ARCH="arm" ;;
+    *) GENKERNEL_ARCH="$machine" ;;
+esac
+
+# Extra indentation to add to menu entries in a submenu. We're not in a submenu
+# yet, so it's empty. In a submenu it will be equal to '\t' (one tab).
+submenu_indentation=""
+
+is_top_level=true
+
+while [ "x${xen_list}" != "x" ] ; do
+    list="${linux_list}"
+    current_xen=`version_find_latest $xen_list`
+    xen_basename=`basename ${current_xen}`
+    xen_dirname=`dirname ${current_xen}`
+    rel_xen_dirname=`make_system_path_relative_to_its_root $xen_dirname`
+    xen_version=`echo $xen_basename | sed -e "s,.gz$,,g;s,^xen-,,g"`
+    if [ -z "$boot_device_id" ]; then
+	boot_device_id="$(grub_get_device_id "${GRUB_DEVICE}")"
+    fi
+    if [ "x$is_top_level" != xtrue ]; then
+	echo "	submenu '$(gettext_printf "Xen hypervisor, version %s" "${xen_version}" | grub_quote)' \$menuentry_id_option 'xen-hypervisor-$xen_version-$boot_device_id' {"
+    fi
+    if ($grub_file --is-arm64-efi $current_xen); then
+	xen_loader="xen_hypervisor"
+	module_loader="xen_module"
+    else
+	if ($grub_file --is-x86-multiboot2 $current_xen); then
+	    xen_loader="multiboot2"
+	    module_loader="module2"
+	else
+	    xen_loader="multiboot"
+	    module_loader="module"
+        fi
+    fi
+
+    initrd_early=
+    for i in ${GRUB_EARLY_INITRD_LINUX_STOCK} \
+             ${GRUB_EARLY_INITRD_LINUX_CUSTOM}; do
+       if test -e "${xen_dirname}/${i}" ; then
+          initrd_early="${initrd_early} ${i}"
+       fi
+    done
+
+    while [ "x$list" != "x" ] ; do
+	linux=`version_find_latest $list`
+	gettext_printf "Found linux image: %s\n" "$linux" >&2
+	basename=`basename $linux`
+	dirname=`dirname $linux`
+	rel_dirname=`make_system_path_relative_to_its_root $dirname`
+	version=`echo $basename | sed -e "s,^[^0-9]*-,,g"`
+	alt_version=`echo $version | sed -e "s,\.old$,,g"`
+	linux_root_device_thisversion="${LINUX_ROOT_DEVICE}"
+
+	initrd_real=
+	for i in "initrd.img-${version}" "initrd-${version}.img" "initrd-${version}.gz" \
+	   "initrd-${version}" "initramfs-${version}.img" \
+	   "initrd.img-${alt_version}" "initrd-${alt_version}.img" \
+	   "initrd-${alt_version}" "initramfs-${alt_version}.img" \
+	   "initramfs-genkernel-${version}" \
+	   "initramfs-genkernel-${alt_version}" \
+	   "initramfs-genkernel-${GENKERNEL_ARCH}-${version}" \
+	   "initramfs-genkernel-${GENKERNEL_ARCH}-${alt_version}" ; do
+	    if test -e "${dirname}/${i}" ; then
+		initrd_real="$i"
+		break
+	    fi
+	done
+
+	initrd=
+	if test -n "${initrd_early}" || test -n "${initrd_real}"; then
+	    initrd="${initrd_early} ${initrd_real}"
+
+	    initrd_display=
+	    for i in ${initrd}; do
+		initrd_display="${initrd_display} ${dirname}/${i}"
+	    done
+	    gettext_printf "Found initrd image: %s\n" "$(echo $initrd_display)" >&2
+	fi
+
+	if test -z "${initrd_real}"; then
+    # "UUID=" magic is parsed by initrds.  Since there's no initrd, it can't work here.
+	    if [ "x${GRUB_DEVICE_PARTUUID}" = "x" ] \
+		|| [ "x${GRUB_DISABLE_LINUX_PARTUUID}" = "xtrue" ]; then
+
+		linux_root_device_thisversion=${GRUB_DEVICE}
+	    else
+		linux_root_device_thisversion=PARTUUID=${GRUB_DEVICE_PARTUUID}
+	    fi
+	fi
+
+	# The GRUB_DISABLE_SUBMENU option used to be different than others since it was
+	# mentioned in the documentation that has to be set to 'y' instead of 'true' to
+	# enable it. This caused a lot of confusion to users that set the option to 'y',
+	# 'yes' or 'true'. This was fixed but all of these values must be supported now.
+	if [ "x${GRUB_DISABLE_SUBMENU}" = xyes ] || [ "x${GRUB_DISABLE_SUBMENU}" = xy ]; then
+	    GRUB_DISABLE_SUBMENU="true"
+	fi
+
+	if [ "x$is_top_level" = xtrue ] && [ "x${GRUB_DISABLE_SUBMENU}" != xtrue ]; then
+	    linux_entry "${OS}" "${version}" "${xen_version}" simple \
+		"${GRUB_CMDLINE_LINUX} ${GRUB_CMDLINE_LINUX_DEFAULT}" "${GRUB_CMDLINE_XEN} ${GRUB_CMDLINE_XEN_DEFAULT}"
+
+	    submenu_indentation="$grub_tab$grub_tab"
+    
+	    if [ -z "$boot_device_id" ]; then
+		boot_device_id="$(grub_get_device_id "${GRUB_DEVICE}")"
+	    fi
+            # TRANSLATORS: %s is replaced with an OS name
+	    echo "submenu '$(gettext_printf "Advanced options for %s (with Xen hypervisor)" "${OS}" | grub_quote)' \$menuentry_id_option 'gnulinux-advanced-$boot_device_id' {"
+	echo "	submenu '$(gettext_printf "Xen hypervisor, version %s" "${xen_version}" | grub_quote)' \$menuentry_id_option 'xen-hypervisor-$xen_version-$boot_device_id' {"
+	   is_top_level=false
+	fi
+
+	linux_entry "${OS}" "${version}" "${xen_version}" advanced \
+	    "${GRUB_CMDLINE_LINUX} ${GRUB_CMDLINE_LINUX_DEFAULT}" "${GRUB_CMDLINE_XEN} ${GRUB_CMDLINE_XEN_DEFAULT}"
+	for supported_init in ${SUPPORTED_INITS}; do
+	    init_path="${supported_init#*:}"
+	    if [ -x "${init_path}" ] && [ "$(readlink -f /sbin/init)" != "$(readlink -f "${init_path}")" ]; then
+		linux_entry "${OS}" "${version}" "${xen_version}" "init-${supported_init%%:*}" \
+		    "${GRUB_CMDLINE_LINUX} ${GRUB_CMDLINE_LINUX_DEFAULT} init=${init_path}" "${GRUB_CMDLINE_XEN} ${GRUB_CMDLINE_XEN_DEFAULT}"
+
+	    fi
+	done
+	if [ "x${GRUB_DISABLE_RECOVERY}" != "xtrue" ]; then
+	    linux_entry "${OS}" "${version}" "${xen_version}" recovery \
+		"single ${GRUB_CMDLINE_LINUX}" "${GRUB_CMDLINE_XEN}"
+	fi
+
+	list=`echo $list | tr ' ' '\n' | fgrep -vx "$linux" | tr '\n' ' '`
+    done
+    if [ x"$is_top_level" != xtrue ]; then
+	echo '	}'
+    fi
+    xen_list=`echo $xen_list | tr ' ' '\n' | fgrep -vx "$current_xen" | tr '\n' ' '`
+done
+
+# If at least one kernel was found, then we need to
+# add a closing '}' for the submenu command.
+if [ x"$is_top_level" != xtrue ]; then
+  echo '}'
+fi
+
+echo "$title_correction_code"
-- 
Anthony PERARD


