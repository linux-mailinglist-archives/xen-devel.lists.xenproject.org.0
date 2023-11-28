Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19897FB591
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:23:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642822.1002552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIU-0004wP-3Q; Tue, 28 Nov 2023 09:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642822.1002552; Tue, 28 Nov 2023 09:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIU-0004tx-0d; Tue, 28 Nov 2023 09:22:26 +0000
Received: by outflank-mailman (input) for mailman id 642822;
 Tue, 28 Nov 2023 09:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uIS-0004tq-Sj
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:22:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a32bb506-8dcf-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 10:22:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b31232bf0so42186155e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 01:22:23 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p34-20020a05600c1da200b00406408dc788sm17535442wms.44.2023.11.28.01.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 01:22:22 -0800 (PST)
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
X-Inumbo-ID: a32bb506-8dcf-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701163343; x=1701768143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgDIL9w5jx+UxCwj2sM5xrPgOrkinlsQKkLBTFvRxoc=;
        b=Yr1o+KfN8zJHB4DoKfB2Nc7tjtBMcDQfRoT6R5TmvS+4oOSj8sAT9OJFyfpZkj5XfQ
         Lly9EKEXkvWBriy6UyAb3EOw1uN9R3ebGwYotkG+DvUDRVNO4X0M2viV/p+uxcpoiPDH
         fDmBqj2O/cLfDaAyjA2y9d0JKVndAFCHd/cfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163343; x=1701768143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgDIL9w5jx+UxCwj2sM5xrPgOrkinlsQKkLBTFvRxoc=;
        b=FINwW9i5TzdJ6Qe73HB4UJ0OAyYmnG7A0hlF/bLFU8V/IpQld46IhR5d1qMG1L3ChU
         sVH55Gqo3Oasi92gG6VwkTNbX52yLRvD6YcNhTIPl8IDfQZfyG/n6UBqZu2eWcNayiFL
         x9QnNSRTjgflMgOQtW+bgd/RzEuJ1XfXpd5Z5A9xlRnzBq+ylPi97QwLIMsAgc4IkMI2
         InIMq/q4uE83/MygRTid0m52BRLwB/P85Xm+HDH2uvru9D/fyPsVEn1Bl4Iy2Z/xrcta
         QyvsXvQmeckl6TIPFvZt5eF8sLcMmP2Z2GzcM2IG8fyO7nV1Zs+CL8m12z2tLUMVE/fG
         ByFw==
X-Gm-Message-State: AOJu0YyD+XwaPsNslqQ5vJBCaHLG0hYU7lcK+EmdcJhWSJQtwvcU/1Sy
	BQz2gEU8m4YZcuU7C4igJwLBOh/DapZlabi+6Qc=
X-Google-Smtp-Source: AGHT+IERTa201gF0CHZeOAYrIVyvM0E4oJr0RIksH0nF29I7usiI6qaKzScDtaVOuV+0vNMPsuXnYg==
X-Received: by 2002:a05:600c:4f16:b0:40b:3857:12f9 with SMTP id l22-20020a05600c4f1600b0040b385712f9mr9408150wmq.5.1701163342885;
        Tue, 28 Nov 2023 01:22:22 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] livepatch-build-tools: do not use readlink -m option
Date: Tue, 28 Nov 2023 10:21:50 +0100
Message-ID: <20231128092152.35039-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128092152.35039-1-roger.pau@citrix.com>
References: <20231128092152.35039-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Busybox readlink implementation only supports the -f option to follow symlinks,
so adjust the logic in order to keep the same behaviour without using the -m
option.

Singed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 livepatch-build | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index 91d203bda0eb..305644037ee7 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -336,8 +336,8 @@ while [[ $# -gt 0 ]]; do
             ;;
         --xen-syms)
             shift
-            XENSYMS="$(readlink -m -- "$1")"
-            [ -f "$XENSYMS" ] || die "xen-syms file does not exist"
+            [ -f "$1" ] || die "xen-syms file does not exist"
+            XENSYMS="$(readlink -f -- "$1")"
             shift
             ;;
         --depends)
@@ -366,22 +366,20 @@ while [[ $# -gt 0 ]]; do
 done
 
 [ -z "$srcarg" ] && die "Xen directory not given"
+[ -d "$srcarg" ] || die "Xen directory does not exist"
 [ -z "$patcharg" ] && die "Patchfile not given"
+[ -f "$patcharg" ] || die "Patchfile does not exist"
 [ -z "$configarg" ] && die ".config not given"
+[ -f "$configarg" ] || die ".config does not exist"
 [ -z "$outputarg" ] && die "Output directory not given"
 [ -z "$DEPENDS" ] && die "Build-id dependency not given"
 [ -z "$XEN_DEPENDS" ] && die "Xen Build-id dependency not given"
 
-SRCDIR="$(readlink -m -- "$srcarg")"
+SRCDIR="$(readlink -f -- "$srcarg")"
 # We need an absolute path because we move around, but we need to
 # retain the name of the symlink (= realpath -s)
 PATCHFILE="$(readlink -f "$(dirname "$patcharg")")/$(basename "$patcharg")"
-CONFIGFILE="$(readlink -m -- "$configarg")"
-OUTPUT="$(readlink -m -- "$outputarg")"
-
-[ -d "${SRCDIR}" ] || die "Xen directory does not exist"
-[ -f "${PATCHFILE}" ] || die "Patchfile does not exist"
-[ -f "${CONFIGFILE}" ] || die ".config does not exist"
+CONFIGFILE="$(readlink -f -- "$configarg")"
 
 PATCHNAME=$(make_patch_name "${PATCHFILE}")
 
@@ -390,17 +388,20 @@ echo
 echo "Xen directory: ${SRCDIR}"
 echo "Patch file: ${PATCHFILE}"
 echo ".config file: ${CONFIGFILE}"
-echo "Output directory: ${OUTPUT}"
+echo "Output directory: $outputarg"
 echo "================================================"
 echo
 
 if [ "${SKIP}" != "build" ]; then
-    [ -e "${OUTPUT}" ] && die "Output directory exists"
+    # Make sure output directory doesn't exist, and create it.
+    [ -e "$outputarg" ] && die "Output directory exists"
+    mkdir -p "$outputarg" || die
+    OUTPUT="$(readlink -f -- "$outputarg")"
+
     grep -q 'CONFIG_LIVEPATCH=y' "${CONFIGFILE}" || die "CONFIG_LIVEPATCH must be enabled"
     cd "$SRCDIR" || die
     patch -s -N -p1 -f --fuzz=0 --dry-run < "$PATCHFILE" || die "Source patch file failed to apply"
 
-    mkdir -p "${OUTPUT}" || die
     cp -f "${CONFIGFILE}" "${OUTPUT}/.config"
     cp -f "${OUTPUT}/.config" "xen/.config"
 
@@ -453,7 +454,9 @@ if [ "${SKIP}" != "build" ]; then
 fi
 
 if [ "${SKIP}" != "diff" ]; then
-    [ -d "${OUTPUT}" ] || die "Output directory does not exist"
+    cd "${SCRIPTDIR}" || die
+    [ -d "$outputarg" ] || die "Output directory does not exist"
+    OUTPUT="$(readlink -f -- "$outputarg")"
 
     cd "${OUTPUT}" || die
     create_patch

base-commit: e588b7914e7afa3abb64b15a32fc2fdb57ded341
-- 
2.43.0


