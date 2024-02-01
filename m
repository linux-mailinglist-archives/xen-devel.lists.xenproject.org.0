Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E41845FF0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 19:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674671.1049764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpo-0002rA-VI; Thu, 01 Feb 2024 18:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674671.1049764; Thu, 01 Feb 2024 18:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpo-0002pO-QW; Thu, 01 Feb 2024 18:30:48 +0000
Received: by outflank-mailman (input) for mailman id 674671;
 Thu, 01 Feb 2024 18:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVbpm-0002Wb-SE
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 18:30:46 +0000
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [2607:f8b0:4864:20::a32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02bc14c8-c130-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 19:30:45 +0100 (CET)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4c009d2053fso59430e0c.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 10:30:45 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 pf8-20020a056214498800b0068c75141e73sm25824qvb.2.2024.02.01.10.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:30:42 -0800 (PST)
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
X-Inumbo-ID: 02bc14c8-c130-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706812243; x=1707417043; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/WTpgrQ9hdXXsQXJiReaHAHfLb66CO+RLEPfZJBiuA=;
        b=lT4AttseEeqf8kimHVc0cSwdcwGh7MYXgg7ygfsACQp19gyx1AEQ3W5P+7saEY4DW4
         u5rRqsbglRMCCUrA4jmkIQGwz7P2kgQNAjtgyDmXzqPhKIptlg8IBVQAgX4C/JL9FPpt
         Mb6OsV0kulBAVoCLH/OdKNZYicSAeeGsjun7Lx8RNjh4xHGQ58tWdlpzO2ZKTSj3U7zg
         XZVZPCcvMyaZpZCZdl1xaMUyokNR7jSqdKlLBKSZZPjj5LBY7aWw9uMK2jrX3V/qWHk4
         0Rz5MWwa4TrhwWs6J1IgrRMKqg1J/pt1kD7lTFtZUjmEjJOQH5Qxv8sOkX36Oob1X/2h
         lfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706812243; x=1707417043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/WTpgrQ9hdXXsQXJiReaHAHfLb66CO+RLEPfZJBiuA=;
        b=cOjmmF/niaq/blT6IOZVZk1i/rM8TXP7rHuYkJr2eDS+uBoGrOJiDCKkzQfKOkVqtc
         +RfGT/GfudD8pkPfprw854/wcKikSGG4NwWzMe3G7sYwB6wPHBlq3RGLGRPdk4HxhlOc
         WcZKB9i1sMruaxWYwJ8UY7SwJ0EeSbGYf/EKc041+ZCKC7SrBGq+K3EtXlunbZYgtq7l
         pPNTo5wxhQU0fwSSTjy8qETJcT8vVCR7cI+8OfvwVDUOue5hJ6ySrEqceTfOd3AZdRPW
         FaT6YOqOjYy1rOLkqXoq07V8Jdos6nqxGk5gMn8g4FmKUzpFbfi9wtN29I5OpChTFQLL
         yDGg==
X-Gm-Message-State: AOJu0YzffBq7tTpttSXGynEbRdw03dn4CJgVQr3VrFA+HeiDm2dHNjt2
	F5tG2gEtMU2y4cNnyWOLiNYW1gFqwa9eZFsTOLlo+yXOw27Y+RN6mZ0/bP0l
X-Google-Smtp-Source: AGHT+IGRKPQeZ5ZOhUWCupkw2VecP6TbVYfEOTHsu6/G9/NRslWr/0BzNAcbU1uCJGRJ6PNU/TjkzA==
X-Received: by 2002:a05:6122:368e:b0:4b7:8d7c:346f with SMTP id ec14-20020a056122368e00b004b78d7c346fmr4904896vkb.9.1706812243220;
        Thu, 01 Feb 2024 10:30:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUyp/NEkVKDrtZPeVhzmpv+A9M40Qgqn8LMrsBBunY63KJgNr2pTm8jdli00xi81ZFpJmrw1oR5ql//3fkocsBW7AxeIuT4umM2pj1TWRkPrbi6kDEn
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/4] hotplug: Update block-tap
Date: Thu,  1 Feb 2024 13:30:23 -0500
Message-ID: <20240201183024.145424-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201183024.145424-1-jandryuk@gmail.com>
References: <20240201183024.145424-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement a sharing check like the regular block script.

Checking tapback inside block-tap is too late since it needs to be
running to transition the backend to InitWait before block-tap is run.

tap-ctl check will be removed when the requirement for the blktap kernel
driver is removed.  Remove it now as it is of limited use.

find_device() needs to be non-fatal allow a sharing check.

Only write physical-device-path because that is all that tapback needs.
Also write_dev doesn't handled files and would incorrectly store
physical-device as 0:0 which would confuse the minor inside tapback
---
 tools/hotplug/Linux/block-tap | 162 ++++++++++++++++++++++++++++++++--
 1 file changed, 153 insertions(+), 9 deletions(-)

diff --git a/tools/hotplug/Linux/block-tap b/tools/hotplug/Linux/block-tap
index 89247921b9..5eca09f0f6 100755
--- a/tools/hotplug/Linux/block-tap
+++ b/tools/hotplug/Linux/block-tap
@@ -37,10 +37,6 @@ check_tools()
     if ! command -v tap-ctl > /dev/null 2>&1; then
         fatal "Unable to find tap-ctl tool"
     fi
-    modprobe blktap
-    if ! tap-ctl check >& /dev/null ; then
-	fatal "Blocktap kernel module not available"
-    fi
 }
 
 # Sets the following global variables based on the params field passed in as
@@ -81,7 +77,105 @@ find_device()
     done
 
     if [ -z "$pid" ] || [ -z "$minor" ]; then
-        fatal "cannot find required parameters"
+        return 1
+    fi
+
+    return 0
+}
+
+count_using()
+{
+  local file="$1"
+  local f
+
+  local i=0
+  local base_path="$XENBUS_BASE_PATH/$XENBUS_TYPE"
+  for dom in $(xenstore-list "$base_path")
+  do
+    for dev in $(xenstore-list "$base_path/$dom")
+    do
+      f=$(xenstore_read_default "$base_path/$dom/$dev/params" "")
+      f=$(echo "$f" | cut -d ":" -f 2)
+
+      if [ -n "$f" ] && [ "$file" = $f ] ; then
+          i=$(( i + 1 ))
+      fi
+    done
+  done
+
+  echo "$i"
+}
+
+# tap_shared is used to determine if a shared tap can be closed
+# Since a stubdom and a guest both use the same tap, it can only
+# be freed when there is a single one left.
+tap_shared() {
+    [ $( count_using "$file" ) -gt 1 ]
+}
+
+check_tap_sharing()
+{
+  local file="$1"
+  local mode="$2"
+  local dev
+
+  local base_path="$XENBUS_BASE_PATH/$XENBUS_TYPE"
+  for dom in $(xenstore-list "$base_path") ; do
+    for dev in $(xenstore-list "$base_path/$dom") ; do
+      f=$(xenstore_read_default "$base_path/$dom/$dev/params" "")
+      f=$(echo "$f" | cut -d ":" -f 2)
+
+      if [ -n "$f" ] && [ "$file" = "$f" ] ; then
+        if [ "$mode" = 'w' ] ; then
+          if ! same_vm $dom ; then
+            echo "guest $f"
+            return
+          fi
+        else
+          local m=$(xenstore_read_default "$base_path/$dom/$dev/mode" "")
+          m=$(canonicalise_mode "$m")
+
+          if [ "$m" = 'w' ] ; then
+            if ! same_vm $dom ; then
+              echo "guest $f"
+              return
+            fi
+          fi
+        fi
+      fi
+    done
+  done
+
+  echo 'ok'
+}
+
+tap_create()
+{
+    if ! minor=$( tap-ctl allocate ) ; then
+        fatal "Could not allocate minor"
+    fi
+
+    # Handle with or without kernel blktap
+    minor=${minor#/run/blktap-control/tapdisk/tapdisk-}
+    minor=${minor#/dev/xen/blktap-2/tapdev}
+
+    # tap-ctl is spawning tapdisk which would hold the _lockfd open.
+    # Ensure it is closed before running tap-ctl spawn, which needs to be
+    # done in a subshell to continue holding the lock in the parent.
+    if ! pid=$( ( eval "exec $_lockfd>&-" ; tap-ctl spawn ) ) ; then
+        tap-ctl free -m "$minor"
+        fatal "Could not spawn tapdisk for $minor"
+    fi
+
+    if ! tap-ctl attach -p "$pid" -m "$minor" ; then
+        tap-ctl free -m "$minor"
+        fatal "Could not attach $pid and $minor"
+    fi
+
+    if ! tap-ctl open -p "$pid" -m "$minor" -a "$target" ; then
+        tap-ctl detach -p "$pid" -m "$minor"
+        tap-ctl free -m "$minor"
+        fatal "Could not open \"$target\""
     fi
 }
 
@@ -89,15 +183,57 @@ find_device()
 # the device
 add()
 {
-    dev=$(tap-ctl create -a $target)
-    write_dev $dev
+    local minor
+    local pid
+    local res
+
+    claim_lock "block"
+
+    if find_device; then
+        result=$( check_tap_sharing "$file" "$mode" )
+        if [ "$result" != "ok" ] ; then
+            do_ebusy "tap $type file $file in use " "$mode" "${result%% *}"
+        fi
+    else
+        tap_create
+    fi
+
+    # Create nbd unix path
+    dev=$( printf "/run/blktap-control/nbd%ld.%d" "$pid" "$minor" )
+
+    xenstore_write "$XENBUS_PATH/pid" "$pid"
+    xenstore_write "$XENBUS_PATH/minor" "$minor"
+    # dev, as a unix socket, would end up with major:minor 0:0 in
+    # physical-device if write_dev were used.  tapback would be thrown off by
+    # that incorrect minor, so just skip writing physical-device.
+    xenstore_write "$XENBUS_PATH/physical-device-path" "$dev"
+
+    success
+
+    release_lock "block"
 }
 
 # Disconnects the device
 remove()
 {
-    find_device
-    do_or_die tap-ctl destroy -p ${pid} -m ${minor} > /dev/null
+    local minor
+    local pid
+
+    claim_lock "block"
+
+    if tap_shared ; then
+        return
+    fi
+
+    minor=$( xenstore_read "$XENBUS_PATH/minor" )
+    pid=$( xenstore_read "$XENBUS_PATH/pid" )
+
+    [ -n "$minor" ] || fatal "minor missing"
+    [ -n "$pid" ] || fatal "pid missing"
+    do_or_die tap-ctl close -p "$pid" -m "$minor" > /dev/null
+    do_or_die tap-ctl detach -p "$pid" -m "$minor" > /dev/null
+
+    release_lock "block"
 }
 
 command=$1
@@ -110,6 +246,14 @@ parse_target "$target"
 
 check_tools || exit 1
 
+mode=$( xenstore_read $XENBUS_PATH/mode )
+mode=$( canonicalise_mode $mode )
+
+# needed for same_vm
+FRONTEND_ID=$(xenstore_read "$XENBUS_PATH/frontend-id")
+FRONTEND_UUID=$(xenstore_read_default \
+                    "/local/domain/$FRONTEND_ID/vm" 'unknown')
+
 case $command in
 add)
     add
-- 
2.43.0


