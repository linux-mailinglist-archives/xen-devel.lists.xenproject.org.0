Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE4609F49
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428840.679385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuyv-0002rD-Gh; Mon, 24 Oct 2022 10:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428840.679385; Mon, 24 Oct 2022 10:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuyv-0002oX-Cz; Mon, 24 Oct 2022 10:46:57 +0000
Received: by outflank-mailman (input) for mailman id 428840;
 Mon, 24 Oct 2022 10:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OUsB=2Z=gmail.com=liu.denton@srs-se1.protection.inumbo.net>)
 id 1omuyt-0002oP-Ge
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:46:55 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c01eb98-5389-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 12:46:54 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id y13so4080469pfp.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 03:46:54 -0700 (PDT)
Received: from archbookpro.localdomain (136-25-1-99.cab.webpass.net.
 [136.25.1.99]) by smtp.gmail.com with ESMTPSA id
 t2-20020a170902e84200b00185002f0c6csm19475666plg.134.2022.10.24.03.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 03:46:51 -0700 (PDT)
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
X-Inumbo-ID: 2c01eb98-5389-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6AhY/GgocFiQsWx0GNRklZOZuEHSlyNVvfWDCYvBt0=;
        b=XEhzvuofVs+dNCgTlS0QKjX/d4rsXWAJPOwktzpAp81cOU/sZbjL4IMDYEH+y7El7o
         wLJSaYMmFNt+75Ze3Kv0wgfIoKbRZGV8A6LsMdhBM2GRiCpnG9kNhnpv3meNNle7EvsR
         kdeNZAsi0T9vkIzNV2sXWFrRAs/GdKBKpqp9EbxntjxgJJEFAN/JGfaxaymw9vDPDWfV
         Ikxn78mXFd9+1aw0Vps66kVSp8tZEB+PlCpxyw27xKX2xvUV4Ijt/bm2E3LIXoqGaiCd
         YkxHRTAHdyI+raELOL9qwMNWlFO8+HpL6th5KYJHDCkBYzL6gtkXW2hVSD3PjMSWnX8Z
         4Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6AhY/GgocFiQsWx0GNRklZOZuEHSlyNVvfWDCYvBt0=;
        b=BOw5lZfxG8tgw4+PE2Eg+Qx13+x7tK2xDJANlJlkfkaWXtbIKVPhLhGCGTLLMJbOW7
         aGsOYpNqV0gSj3pnG5vCx4nYVgH1i5Gh/S2DiGg9Se+Hde6JMOHCAEuBIOCMPJ0/9/pU
         ouo/WgZlP7ez2Vxq5Omz/T6CFNv/1J6DSZ6/Ufy5tZ9JeBeYtJ2qUDkKTKBfDO+xalRR
         JZa4WlC+pAPSFFdz9EeS151k2C56CMzTrb81CxKsFGJgNVrCGseI++KV2qEHAkTx0Glq
         W9qntUvKINBWPtEWta6n7wnKpGZFAPgeib1zYYp2mA92kpyYDL9pHL3qlX6ON5ky/AMY
         qX9g==
X-Gm-Message-State: ACrzQf0Ymn18chzR+TUDj0fEPVCOpMdeJrmDVGK1T4KIV6cNocCiqe3/
	5HrIjzjYJoRFB34GarmcIL0=
X-Google-Smtp-Source: AMsMyM4dGhnPStWHW5POV8kLzymbFegcb19ywLGDoRz5SJzAZ0n8VsXrumn6qPQY1KEQSle9OFgAfQ==
X-Received: by 2002:a63:804a:0:b0:461:25fe:e7c5 with SMTP id j71-20020a63804a000000b0046125fee7c5mr28185203pgd.395.1666608412430;
        Mon, 24 Oct 2022 03:46:52 -0700 (PDT)
From: Denton Liu <liu.denton@gmail.com>
To: grub-devel@gnu.org
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
	Oskari Pirhonen <xxc3ncoredxx@gmail.com>,
	mathieu.desnoyers@efficios.com,
	rharwood@redhat.com,
	samuel.thibault@ens-lyon.org,
	debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org,
	Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v5] templates: introduce GRUB_TOP_LEVEL_* vars
Date: Mon, 24 Oct 2022 03:46:42 -0700
Message-Id: <20221024104642.251016-1-liu.denton@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A user may wish to use an image that is not sorted as the "latest"
version as the top-level entry. For example, in Arch Linux, if a user
has the LTS and regular kernels installed, `/boot/vmlinuz-linux-lts`
gets sorted as the "latest" compared to `/boot/vmlinuz-linux`, meaning
the LTS kernel becomes the top-level entry. However, a user may wish to
use the regular kernel as the top-level default with the LTS only
existing as a backup.

This need can be seen in Arch Linux's AUR with two user-submitted
packages[0][1] providing an update hook which patches
/etc/grub.d/10_linux to move the desired kernel to the top-level. This
patch serves to solve this in a more generic way.

Introduce the GRUB_TOP_LEVEL, GRUB_TOP_LEVEL_XEN and
GRUB_TOP_LEVEL_OS_PROBER variables to allow users to specify the
top-level entry.

Create grub_move_to_front() as a helper function which moves entries to
the front of a list. This function does the heavy lifting of moving
the menu entry to the front in each script.

In 10_netbsd, since there isn't an explicit list variable, extract the
items that are being iterated through into a list so that we can
optionally apply grub_move_to_front() to the list before the loop.

[0]: https://aur.archlinux.org/packages/grub-linux-default-hook
[1]: https://aur.archlinux.org/packages/grub-linux-rt-default-hook

Signed-off-by: Denton Liu <liu.denton@gmail.com>
---

Notes:
    The only file that was tested is 10_linux. I do not have access to any
    of the other images or systems so they remain untested.
    
    Changes since v4:
    
    * Update docs to specify that GRUB_TOP_LEVEL and GRUB_TOP_LEVEL_XEN take
      an absolute path
    
    * Add more justification in the commit message
    
    Changes since v3:
    
    * Fix if formatting nit
    
    * Rebase on top of latest 'master'
    
    Changes since v2:
    
    * Added more detail to GRUB_TOP_LEVEL docs
    
    * Moved GRUB_TOP_LEVEL_OS_PROBER to separate section in docs
    
    * Renamed grub_move_entry_to_front() to grub_move_to_front() and added
      code comment
    
    * Give 10_netbsd an intermediate list of images to interact with

Range-diff against v4:
1:  d3a693804 ! 1:  ee633189b templates: introduce GRUB_TOP_LEVEL_* vars
    @@ Commit message
         A user may wish to use an image that is not sorted as the "latest"
         version as the top-level entry. For example, in Arch Linux, if a user
         has the LTS and regular kernels installed, `/boot/vmlinuz-linux-lts`
    -    gets sorted as the "latest" compared to `/boot/vmlinuz-linux`. However,
    -    a user may wish to use the regular kernel as the default with the LTS
    -    only existing as a backup.
    +    gets sorted as the "latest" compared to `/boot/vmlinuz-linux`, meaning
    +    the LTS kernel becomes the top-level entry. However, a user may wish to
    +    use the regular kernel as the top-level default with the LTS only
    +    existing as a backup.
    +
    +    This need can be seen in Arch Linux's AUR with two user-submitted
    +    packages[0][1] providing an update hook which patches
    +    /etc/grub.d/10_linux to move the desired kernel to the top-level. This
    +    patch serves to solve this in a more generic way.
     
         Introduce the GRUB_TOP_LEVEL, GRUB_TOP_LEVEL_XEN and
         GRUB_TOP_LEVEL_OS_PROBER variables to allow users to specify the
    @@ Commit message
         items that are being iterated through into a list so that we can
         optionally apply grub_move_to_front() to the list before the loop.
     
    +    [0]: https://aur.archlinux.org/packages/grub-linux-default-hook
    +    [1]: https://aur.archlinux.org/packages/grub-linux-rt-default-hook
    +
         Signed-off-by: Denton Liu <liu.denton@gmail.com>
     
     
    @@ Notes
         The only file that was tested is 10_linux. I do not have access to any
         of the other images or systems so they remain untested.
     
    +    Changes since v4:
    +
    +    * Update docs to specify that GRUB_TOP_LEVEL and GRUB_TOP_LEVEL_XEN take
    +      an absolute path
    +
    +    * Add more justification in the commit message
    +
         Changes since v3:
     
         * Fix if formatting nit
    @@ docs/grub.texi: for all respectively normal entries.
      
     +@item GRUB_TOP_LEVEL
     +@item GRUB_TOP_LEVEL_XEN
    -+This option should be a path to a kernel image. If provided, the image
    -+specified will be made the top-level entry if it is found in the scan.
    ++This option should be an absolute path to a kernel image. If provided, the
    ++image specified will be made the top-level entry if it is found in the scan.
     +
     +@item GRUB_TOP_LEVEL_OS_PROBER
     +This option should be a line of output from @command{os-prober}. As

 docs/grub.texi              | 10 ++++++++++
 util/grub-mkconfig.in       |  3 +++
 util/grub-mkconfig_lib.in   | 26 ++++++++++++++++++++++++++
 util/grub.d/10_hurd.in      |  4 ++++
 util/grub.d/10_kfreebsd.in  |  4 ++++
 util/grub.d/10_linux.in     |  4 ++++
 util/grub.d/10_netbsd.in    |  8 +++++++-
 util/grub.d/20_linux_xen.in |  7 +++++++
 util/grub.d/30_os-prober.in |  4 ++++
 9 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/docs/grub.texi b/docs/grub.texi
index 0dbbdc374..641fb4ad3 100644
--- a/docs/grub.texi
+++ b/docs/grub.texi
@@ -1444,6 +1444,16 @@ for all respectively normal entries.
 The values of these options replace the values of @samp{GRUB_CMDLINE_LINUX}
 and @samp{GRUB_CMDLINE_LINUX_DEFAULT} for Linux and Xen menu entries.
 
+@item GRUB_TOP_LEVEL
+@item GRUB_TOP_LEVEL_XEN
+This option should be an absolute path to a kernel image. If provided, the
+image specified will be made the top-level entry if it is found in the scan.
+
+@item GRUB_TOP_LEVEL_OS_PROBER
+This option should be a line of output from @command{os-prober}. As
+@samp{GRUB_TOP_LEVEL}, if provided, the image specified will be made the
+top-level entry if it is found in the scan.
+
 @item GRUB_EARLY_INITRD_LINUX_CUSTOM
 @itemx GRUB_EARLY_INITRD_LINUX_STOCK
 List of space-separated early initrd images to be loaded from @samp{/boot}.
diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
index 62335d027..32c480dae 100644
--- a/util/grub-mkconfig.in
+++ b/util/grub-mkconfig.in
@@ -233,6 +233,9 @@ export GRUB_DEFAULT \
   GRUB_CMDLINE_NETBSD \
   GRUB_CMDLINE_NETBSD_DEFAULT \
   GRUB_CMDLINE_GNUMACH \
+  GRUB_TOP_LEVEL \
+  GRUB_TOP_LEVEL_XEN \
+  GRUB_TOP_LEVEL_OS_PROBER \
   GRUB_EARLY_INITRD_LINUX_CUSTOM \
   GRUB_EARLY_INITRD_LINUX_STOCK \
   GRUB_TERMINAL_INPUT \
diff --git a/util/grub-mkconfig_lib.in b/util/grub-mkconfig_lib.in
index 634bc8a50..08953287c 100644
--- a/util/grub-mkconfig_lib.in
+++ b/util/grub-mkconfig_lib.in
@@ -218,6 +218,32 @@ version_sort ()
    esac
 }
 
+# Given an item as the first argument and a list as the subsequent arguments,
+# returns the list with the first argument moved to the front if it exists in
+# the list.
+grub_move_to_front ()
+{
+  item="$1"
+  shift
+
+  item_found=false
+  for i in "$@"; do
+    if [ "x$i" = "x$item" ]; then
+      item_found=true
+    fi
+  done
+
+  if [ "x$item_found" = xtrue ]; then
+    echo "$item"
+  fi
+  for i in "$@"; do
+    if [ "x$i" = "x$item" ]; then
+      continue
+    fi
+    echo "$i"
+  done
+}
+
 # One layer of quotation is eaten by "" and the second by sed; so this turns
 # ' into \'.
 grub_quote () {
diff --git a/util/grub.d/10_hurd.in b/util/grub.d/10_hurd.in
index a021d02c2..b317a4b14 100644
--- a/util/grub.d/10_hurd.in
+++ b/util/grub.d/10_hurd.in
@@ -229,6 +229,10 @@ submenu_indentation=""
 
 reverse_sorted_kernels=$(echo ${kernels} | tr ' ' '\n' | sed -e 's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s/ 2$//')
 
+if [ "x$GRUB_TOP_LEVEL" != x ]; then
+  reverse_sorted_kernels=$(grub_move_to_front "$GRUB_TOP_LEVEL" ${reverse_sorted_kernels})
+fi
+
 is_top_level=true
 
 for kernel in ${reverse_sorted_kernels}; do
diff --git a/util/grub.d/10_kfreebsd.in b/util/grub.d/10_kfreebsd.in
index 0a67decaa..83e9636e8 100644
--- a/util/grub.d/10_kfreebsd.in
+++ b/util/grub.d/10_kfreebsd.in
@@ -164,6 +164,10 @@ submenu_indentation=""
 
 reverse_sorted_list=$(echo ${list} | tr ' ' '\n' | sed -e 's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s/ 2$//')
 
+if [ "x$GRUB_TOP_LEVEL" != x ]; then
+  reverse_sorted_list=$(grub_move_to_front "$GRUB_TOP_LEVEL" ${reverse_sorted_list})
+fi
+
 is_top_level=true
 
 for kfreebsd in ${reverse_sorted_list}; do
diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
index c6a1ec935..7263f2983 100644
--- a/util/grub.d/10_linux.in
+++ b/util/grub.d/10_linux.in
@@ -202,6 +202,10 @@ submenu_indentation=""
 
 reverse_sorted_list=$(echo $list | tr ' ' '\n' | sed -e 's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s/ 2$//')
 
+if [ "x$GRUB_TOP_LEVEL" != x ]; then
+  reverse_sorted_list=$(grub_move_to_front "$GRUB_TOP_LEVEL" ${reverse_sorted_list})
+fi
+
 is_top_level=true
 for linux in ${reverse_sorted_list}; do
   gettext_printf "Found linux image: %s\n" "$linux" >&2
diff --git a/util/grub.d/10_netbsd.in b/util/grub.d/10_netbsd.in
index dc0cd1b17..3154e9e15 100644
--- a/util/grub.d/10_netbsd.in
+++ b/util/grub.d/10_netbsd.in
@@ -146,8 +146,14 @@ pattern="^ELF[^,]*executable.*statically linked"
 # yet, so it's empty. In a submenu it will be equal to '\t' (one tab).
 submenu_indentation=""
 
+list="/netbsd $(ls -t /netbsd?* 2>/dev/null)"
+
+if [ "x$GRUB_TOP_LEVEL" != x ]; then
+  list=$(grub_move_to_front "$GRUB_TOP_LEVEL" ${list})
+fi
+
 is_top_level=true
-for k in /netbsd $(ls -t /netbsd?* 2>/dev/null) ; do
+for k in ${list}; do
   if ! grub_file_is_not_garbage "$k" ; then
     continue
   fi
diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
index 626aed40c..386bfb9be 100644
--- a/util/grub.d/20_linux_xen.in
+++ b/util/grub.d/20_linux_xen.in
@@ -245,6 +245,13 @@ submenu_indentation=""
 reverse_sorted_xen_list=$(echo ${xen_list} | tr ' ' '\n' | sed -e 's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s/ 2$//')
 reverse_sorted_linux_list=$(echo ${linux_list} | tr ' ' '\n' | sed -e 's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s/ 2$//')
 
+if [ "x$GRUB_TOP_LEVEL_XEN" != x ]; then
+  reverse_sorted_xen_list=$(grub_move_to_front "$GRUB_TOP_LEVEL_XEN" ${reverse_sorted_xen_list})
+fi
+if [ "x$GRUB_TOP_LEVEL" != x ]; then
+  reverse_sorted_linux_list=$(grub_move_to_front "$GRUB_TOP_LEVEL" ${reverse_sorted_linux_list})
+fi
+
 is_top_level=true
 
 for current_xen in ${reverse_sorted_xen_list}; do
diff --git a/util/grub.d/30_os-prober.in b/util/grub.d/30_os-prober.in
index daa603778..656301eaf 100644
--- a/util/grub.d/30_os-prober.in
+++ b/util/grub.d/30_os-prober.in
@@ -113,6 +113,10 @@ EOF
 
 used_osprober_linux_ids=
 
+if [ "x$GRUB_TOP_LEVEL_OS_PROBER" != x ]; then
+  OSPROBED=$(grub_move_to_front "$GRUB_TOP_LEVEL_OS_PROBER" ${OSPROBED})
+fi
+
 for OS in ${OSPROBED} ; do
   DEVICE="`echo ${OS} | cut -d ':' -f 1`"
   LONGNAME="`echo ${OS} | cut -d ':' -f 2 | tr '^' ' '`"
-- 
2.38.1


