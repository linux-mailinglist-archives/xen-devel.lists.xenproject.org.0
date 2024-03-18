Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373FC87EE2F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694958.1084399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHX-0007RP-0t; Mon, 18 Mar 2024 16:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694958.1084399; Mon, 18 Mar 2024 16:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHV-0006yW-U6; Mon, 18 Mar 2024 16:56:13 +0000
Received: by outflank-mailman (input) for mailman id 694958;
 Mon, 18 Mar 2024 16:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHR-0002gq-IH
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae69f0a-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4140efa16caso10029125e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:09 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:07 -0700 (PDT)
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
X-Inumbo-ID: 6ae69f0a-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780968; x=1711385768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRUCir5QMxWCvauYalwhk7w+cXPi5YqEzZUAMUwLH6w=;
        b=PFOKlsl5ujJpoCHaw2IyubF/EZij9PKYxQWAOqhaivVxxHApqLgD/KnhcCSXN9lMlx
         Xy1lnkdf1tPRGcT/DeLsBz3eVCoBdB0DINF9uFBp6PVd8m3TrbA3XHDRBxa5TtqETDA/
         O/WX7Re7KtqkZZF9FZsLnhCpCr2cTnXVoJyMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780968; x=1711385768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRUCir5QMxWCvauYalwhk7w+cXPi5YqEzZUAMUwLH6w=;
        b=bDyi5ZuKlLVRK8ILSh4/99KeelSq8sl7FRNduiPCz75E7PBN2As+fwKTgtJIUzPRlp
         YV8qcGROPIkWO9hOgAIRSu3eFqdREvUqd1+BS86WGUrgC9X2819Y7TmlivTPu0LWSxF3
         7W2JqPkA1F60reYiewUFqPnqp2pJ+CUnRadacVbvsTHH5pVHyipOFvmfB06CwSIoAOXn
         2fMdufylo6c0ReOhIZCVcET8YNtvGNqswnP/RuGOra7/FsO7Gj35Wrj+QhutTQDt1jU7
         VitPpT8mwuUXAZBI9wc3lhvdAfSbVZ4bL2w17iaq07slERFc5dkZO5xfWedms6hvH7b4
         LkSg==
X-Gm-Message-State: AOJu0YwjkVVX33TPC6UR1PSZ6FQ7BVwnkMMORS0ug1/q1p6WqIdzBx4r
	Xz5pO/5gM9cB7vqlyPn5W8tlo5hOpNNMajQnqvtaxKJVOoex3KyxJvGJimFfRK7s0vkNTPKLyMY
	9
X-Google-Smtp-Source: AGHT+IHCSGbNmuTOds0JmXB22ZwHsY5nwpzZhWQQbalycU8NtZvJ6ckR8/JppxSj4dFAsDDGBkJgMg==
X-Received: by 2002:a05:600c:314c:b0:414:1eb:287 with SMTP id h12-20020a05600c314c00b0041401eb0287mr7138883wmo.14.1710780968372;
        Mon, 18 Mar 2024 09:56:08 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 20/36] overlay-bookworm: 20_linux_xen: Fix XSM entries generation
Date: Mon, 18 Mar 2024 16:55:29 +0000
Message-Id: <20240318165545.3898-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that setting $xen_version in linux_entry_xsm() override
$xen_version in the loop over $xen_list. This means that only one
entry per Xen version is going to enable XSM, but all further entries
are going to have "(XSM enabled)" in their titles without enabling
XSM.

When a "xenpolicy-$xen_version" file was found for the current
$xen_version, it would be overwrite $xen_version to add "(XSM
enabled)" to the menu entry title. Once change, the next call to
linux_entry_xsm() would also have this modified $xen_version and would
look for the file "xenpolicy-*(XSM enabled)" and fail.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
(upstream commit: https://git.savannah.gnu.org/cgit/grub.git/commit/?id=db1faedccdce3cf83336155a95c04a8db03744c5)
---
 overlay-bookworm/etc/grub.d/20_linux_xen | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/overlay-bookworm/etc/grub.d/20_linux_xen b/overlay-bookworm/etc/grub.d/20_linux_xen
index 3a27fc6f..85593525 100755
--- a/overlay-bookworm/etc/grub.d/20_linux_xen
+++ b/overlay-bookworm/etc/grub.d/20_linux_xen
@@ -102,7 +102,7 @@ linux_entry_xsm ()
 {
   os="$1"
   version="$2"
-  xen_version="$3"
+  entry_xen_version="$3"
   type="$4"
   args="$5"
   xen_args="$6"
@@ -110,27 +110,27 @@ linux_entry_xsm ()
   # If user wants to enable XSM support, make sure there's
   # corresponding policy file.
   if ${xsm} ; then
-      xenpolicy="xenpolicy-$xen_version"
+      xenpolicy="xenpolicy-$entry_xen_version"
       if test ! -e "${xen_dirname}/${xenpolicy}" ; then
 	  return
       fi
       xen_args="$xen_args flask=enforcing"
-      xen_version="$(gettext_printf "%s (XSM enabled)" "$xen_version")"
-      # xen_version is used for messages only; actual file is xen_basename
+      entry_xen_version="$(gettext_printf "%s (XSM enabled)" "$entry_xen_version")"
+      # entry_xen_version is used for messages only; actual file is xen_basename
   fi
   if [ -z "$boot_device_id" ]; then
       boot_device_id="$(grub_get_device_id "${GRUB_DEVICE}")"
   fi
   if [ x$type != xsimple ] ; then
       if [ x$type = xrecovery ] ; then
-	  title="$(gettext_printf "%s, with Xen %s and Linux %s (%s)" "${os}" "${xen_version}" "${version}" "$(gettext "${GRUB_RECOVERY_TITLE}")")"
+	  title="$(gettext_printf "%s, with Xen %s and Linux %s (%s)" "${os}" "${entry_xen_version}" "${version}" "$(gettext "${GRUB_RECOVERY_TITLE}")")"
       elif [ "${type#init-}" != "$type" ] ; then
-	  title="$(gettext_printf "%s, with Xen %s and Linux %s (%s)" "${os}" "${xen_version}" "${version}" "${type#init-}")"
+	  title="$(gettext_printf "%s, with Xen %s and Linux %s (%s)" "${os}" "${entry_xen_version}" "${version}" "${type#init-}")"
       else
-	  title="$(gettext_printf "%s, with Xen %s and Linux %s" "${os}" "${xen_version}" "${version}")"
+	  title="$(gettext_printf "%s, with Xen %s and Linux %s" "${os}" "${entry_xen_version}" "${version}")"
       fi
       replacement_title="$(echo "Advanced options for ${OS}" | sed 's,>,>>,g')>$(echo "$title" | sed 's,>,>>,g')"
-      if [ x"Xen ${xen_version}>$title" = x"$GRUB_ACTUAL_DEFAULT" ]; then
+      if [ x"Xen ${entry_xen_version}>$title" = x"$GRUB_ACTUAL_DEFAULT" ]; then
          quoted="$(echo "$GRUB_ACTUAL_DEFAULT" | grub_quote)"
          title_correction_code="${title_correction_code}if [ \"x\$default\" = '$quoted' ]; then default='$(echo "$replacement_title" | grub_quote)'; fi;"
          grub_warn "$(gettext_printf "Please don't use old title \`%s' for GRUB_DEFAULT, use \`%s' (for versions before 2.00) or \`%s' (for 2.00 or later)" "$GRUB_ACTUAL_DEFAULT" "$replacement_title" "gnulinux-advanced-$boot_device_id>gnulinux-$version-$type-$boot_device_id")"
@@ -148,7 +148,7 @@ linux_entry_xsm ()
     prepare_boot_cache="$(prepare_grub_to_access_device ${GRUB_DEVICE_BOOT} | grub_add_tab)"
   fi
   printf '%s\n' "${prepare_boot_cache}" | sed "s/^/$submenu_indentation/"
-  xmessage="$(gettext_printf "Loading Xen %s ..." ${xen_version})"
+  xmessage="$(gettext_printf "Loading Xen %s ..." ${entry_xen_version})"
   lmessage="$(gettext_printf "Loading Linux %s ..." ${version})"
   sed "s/^/$submenu_indentation/" << EOF
 	echo	'$(echo "$xmessage" | grub_quote)'
-- 
Anthony PERARD


