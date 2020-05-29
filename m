Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40921E7BE6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedG8-0000zs-F8; Fri, 29 May 2020 11:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedG6-0000yz-Oi
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:33:06 +0000
X-Inumbo-ID: 20c7e036-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20c7e036-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:32:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3T-0003xZ-Ia; Fri, 29 May 2020 12:20:03 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 25/49] 20_linux_xen: Copy Debian buster version into
 our initramfs area
Date: Fri, 29 May 2020 12:19:21 +0100
Message-Id: <20200529111945.21394-26-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is from 41e42571ebc50fa351cd63ce40044946652c5c72 in Debian's grub
package.

We are going to want to modify this to support XSM/FLASK and cope with
upstream build outputs.

In this commit we dump the exact file contents across.  It's not
effective right now because of the ".in" extension.  In fact, the file
is a template.

At the time of writing I am trying to send our substantive changes
upstream via Debian's Gitlab:
  https://salsa.debian.org/grub-team/grub/-/merge_requests/18

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 overlay-buster/etc/grub.d/20_linux_xen.in | 299 ++++++++++++++++++++++
 1 file changed, 299 insertions(+)
 create mode 100644 overlay-buster/etc/grub.d/20_linux_xen.in

diff --git a/overlay-buster/etc/grub.d/20_linux_xen.in b/overlay-buster/etc/grub.d/20_linux_xen.in
new file mode 100644
index 00000000..98ef163c
--- /dev/null
+++ b/overlay-buster/etc/grub.d/20_linux_xen.in
@@ -0,0 +1,299 @@
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
+prefix="@prefix@"
+exec_prefix="@exec_prefix@"
+datarootdir="@datarootdir@"
+
+. "$pkgdatadir/grub-mkconfig_lib"
+
+export TEXTDOMAIN=@PACKAGE@
+export TEXTDOMAINDIR="@localedir@"
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
+# btrfs may reside on multiple devices. We cannot pass them as value of root= parameter
+# and mounting btrfs requires user space scanning, so force UUID in this case.
+if [ "x${GRUB_DEVICE_UUID}" = "x" ] || [ "x${GRUB_DISABLE_LINUX_UUID}" = "xtrue" ] \
+    || ! test -e "/dev/disk/by-uuid/${GRUB_DEVICE_UUID}" \
+    || ( test -e "${GRUB_DEVICE}" && uses_abstraction "${GRUB_DEVICE}" lvm ); then
+  LINUX_ROOT_DEVICE=${GRUB_DEVICE}
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
+  os="$1"
+  version="$2"
+  xen_version="$3"
+  type="$4"
+  args="$5"
+  xen_args="$6"
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
+    sed "s/^/$submenu_indentation/" << EOF
+	echo	'$(echo "$message" | grub_quote)'
+	${module_loader}	--nounzip   ${rel_dirname}/${initrd}
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
+file_is_not_sym () {
+    case "$1" in
+	*/xen-syms-*)
+	    return 1;;
+	*)
+	    return 0;;
+    esac
+}
+
+xen_list=
+for i in /boot/xen*; do
+    if grub_file_is_not_garbage "$i" && file_is_not_sym "$i" ; then xen_list="$xen_list $i" ; fi
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
+    if ($grub_file --is-x86-multiboot2 $current_xen); then
+	xen_loader="multiboot2"
+	module_loader="module2"
+    else
+	xen_loader="multiboot"
+	module_loader="module"
+    fi
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
+	initrd=
+	for i in "initrd.img-${version}" "initrd-${version}.img" "initrd-${version}.gz" \
+	   "initrd-${version}" "initramfs-${version}.img" \
+	   "initrd.img-${alt_version}" "initrd-${alt_version}.img" \
+	   "initrd-${alt_version}" "initramfs-${alt_version}.img" \
+	   "initramfs-genkernel-${version}" \
+	   "initramfs-genkernel-${alt_version}" \
+	   "initramfs-genkernel-${GENKERNEL_ARCH}-${version}" \
+	   "initramfs-genkernel-${GENKERNEL_ARCH}-${alt_version}" ; do
+	    if test -e "${dirname}/${i}" ; then
+		initrd="$i"
+		break
+	    fi
+	done
+	if test -n "${initrd}" ; then
+	    gettext_printf "Found initrd image: %s\n" "${dirname}/${initrd}" >&2
+	else
+    # "UUID=" magic is parsed by initrds.  Since there's no initrd, it can't work here.
+	    linux_root_device_thisversion=${GRUB_DEVICE}
+	fi
+
+	if [ "x$is_top_level" = xtrue ] && [ "x${GRUB_DISABLE_SUBMENU}" != xy ]; then
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
2.20.1


