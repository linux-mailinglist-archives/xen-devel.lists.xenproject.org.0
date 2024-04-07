Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2AA89B406
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 22:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701683.1096018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSt-0005pS-0h; Sun, 07 Apr 2024 20:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701683.1096018; Sun, 07 Apr 2024 20:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSs-0005mD-TM; Sun, 07 Apr 2024 20:50:10 +0000
Received: by outflank-mailman (input) for mailman id 701683;
 Sun, 07 Apr 2024 20:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtZSr-0005XS-BO
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 20:50:09 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a86dd41-f520-11ee-a1ef-f123f15fe8a2;
 Sun, 07 Apr 2024 22:50:07 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-78d4944e0a9so144364285a.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 13:50:07 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 op3-20020a05620a534300b0078a593b54e6sm2512745qkn.96.2024.04.07.13.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 13:50:05 -0700 (PDT)
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
X-Inumbo-ID: 6a86dd41-f520-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712523005; x=1713127805; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8EbFCk7pyX9KLNJxLbJbXKheVVaGxukhqPZhBhemso=;
        b=mdkPejn+F8rwNeRo0vdNUFdB6FiUf1E6earn8cMUH6RNQmZ7XjKXZjVLHgUWg+9hIU
         Fx61L7g1jv9FamjNtS8OzSq7rx9IdjIv1s6LR4HC9C+gU6xRhrmz+FWiNZxPvpP7IRsj
         KIMthntI04oIMwDVIagWY4OP2EQylcEcQQzIuZ47WSMtt5P8LyR4aJwFvixDatKdrgIK
         ZaMueY6NaPU6dgMq6wkYrjdH4xEU/Jn129Ycb24EAgqnQF9fnDEPWwZYg0vetfNHbmWO
         7DUcCz7VhrvwX/42VATxqD4IqC3bF6nkulIvb3U0qxKsvC0M4dsGRczOor2qGOIdpNEO
         391Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712523005; x=1713127805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8EbFCk7pyX9KLNJxLbJbXKheVVaGxukhqPZhBhemso=;
        b=xHxosAZSJYcBpmcS4QUjPp+bTd9A9XDT5c5RKTq0xG/KIjOtU20OZGAwR715cxnWRD
         JKgvMq7KCKlxk+W6PRcjYaN5kxdTNziKkYiT9ZfcL1O6dMwLz6o/tA2z2NhUr5pfbrRX
         7QCCWdU7MYnPkw3f4hpNpva2Dd2pGXt0vEtAwfwNZW1ckEwumOiJhuY/ECdtufHHvPH9
         5XqjNUig+RSLkZr/LZOt+KOQoH1N8rSjXPApAD8q6GTsGYxQiF3n6fZcwJ2ADFkfG+US
         7ck0Yb2SzJgu0XRABKn4O2vVcIcFAv5/E3aNJbXE6njtMvJan211HDdAcY6SBonZokjF
         O81Q==
X-Gm-Message-State: AOJu0Yy5s3DZt5BGyqyBMdmJKOnyiybJoZ2a7LxTeFZf7O30H8ual8JH
	e7ocicGUfqrLHb/r5Xj/UFJdtSM2Bpg/+sfR4dLqmjfdlExOurWpWB6Ir0CV
X-Google-Smtp-Source: AGHT+IF3lgmcx5KUKZv6afRZZQhja5ZM9Vnojc55e71pmOFMggCiRTrP8zg8/71tRkhG21BOhG30fw==
X-Received: by 2002:a05:620a:8802:b0:78d:640a:4e9a with SMTP id qj2-20020a05620a880200b0078d640a4e9amr2036838qkn.45.1712523005542;
        Sun, 07 Apr 2024 13:50:05 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 1/3] hotplug: Update block-tap
Date: Sun,  7 Apr 2024 16:49:51 -0400
Message-Id: <20240407204953.60442-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407204953.60442-1-jandryuk@gmail.com>
References: <20240407204953.60442-1-jandryuk@gmail.com>
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

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:

Update usage string
Use local more
Don't use local for pid/minor
Use tap-ctl destroy
Use 4 space indent in count_using and check_tap_sharing
---
 tools/hotplug/Linux/block-tap | 169 +++++++++++++++++++++++++++++++---
 1 file changed, 157 insertions(+), 12 deletions(-)

diff --git a/tools/hotplug/Linux/block-tap b/tools/hotplug/Linux/block-tap
index 89247921b9..126e472786 100755
--- a/tools/hotplug/Linux/block-tap
+++ b/tools/hotplug/Linux/block-tap
@@ -18,11 +18,11 @@
 #
 # Usage:
 #
-# Target should be specified using the following syntax:
+# Disks should be specified using the following syntax:
 #
-# script=block-tap,vdev=xvda,target=<type>:<file>
+# vdev=xvda,backendtype=tap,format=vhd,target=/srv/target.vhd
 #
-# Type is either "aio" (for raw files), or "vhd"
+# format is either "aio" (for raw files), or "vhd"
 
 dir=$(dirname "$0")
 . "$dir/block-common.sh"
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
@@ -81,7 +77,109 @@ find_device()
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
+    local file="$1"
+    local dom
+    local dev
+    local f
+
+    local i=0
+    local base_path="$XENBUS_BASE_PATH/$XENBUS_TYPE"
+    for dom in $(xenstore-list "$base_path")
+    do
+        for dev in $(xenstore-list "$base_path/$dom")
+        do
+            f=$(xenstore_read_default "$base_path/$dom/$dev/params" "")
+            f=$(echo "$f" | cut -d ":" -f 2)
+
+            if [ -n "$f" ] && [ "$file" = $f ] ; then
+                i=$(( i + 1 ))
+            fi
+        done
+    done
+
+    echo "$i"
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
+    local file="$1"
+    local mode="$2"
+    local dom
+    local dev
+
+    local base_path="$XENBUS_BASE_PATH/$XENBUS_TYPE"
+    for dom in $(xenstore-list "$base_path") ; do
+        for dev in $(xenstore-list "$base_path/$dom") ; do
+            local f=$(xenstore_read_default "$base_path/$dom/$dev/params" "")
+            f=$(echo "$f" | cut -d ":" -f 2)
+
+            if [ -n "$f" ] && [ "$file" = "$f" ] ; then
+                if [ "$mode" = 'w' ] ; then
+                    if ! same_vm $dom ; then
+                        echo "guest $f"
+                        return
+                    fi
+                else
+                    local m=$(xenstore_read_default "$base_path/$dom/$dev/mode"
+                                                    "")
+                    m=$(canonicalise_mode "$m")
+
+                    if [ "$m" = 'w' ] ; then
+                        if ! same_vm $dom ; then
+                            echo "guest $f"
+                            return
+                        fi
+                    fi
+                fi
+            fi
+        done
+    done
+
+    echo 'ok'
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
 
@@ -89,15 +187,54 @@ find_device()
 # the device
 add()
 {
-    dev=$(tap-ctl create -a $target)
-    write_dev $dev
+    local result
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
+    # Create nbd unix path.  find_device/tap_create set pid & minor
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
+    do_or_die tap-ctl destroy -p "$pid" -m "$minor" > /dev/null
+
+    release_lock "block"
 }
 
 command=$1
@@ -110,6 +247,14 @@ parse_target "$target"
 
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
2.39.2


