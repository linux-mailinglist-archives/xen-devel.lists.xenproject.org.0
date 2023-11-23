Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C77F63A4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639826.997532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CFs-0003L6-65; Thu, 23 Nov 2023 16:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639826.997532; Thu, 23 Nov 2023 16:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CFs-0003IM-2Y; Thu, 23 Nov 2023 16:08:40 +0000
Received: by outflank-mailman (input) for mailman id 639826;
 Thu, 23 Nov 2023 16:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r6CFq-0002oi-DN
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:08:38 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8efde5f9-8a1a-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 17:08:36 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so11767431fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:08:36 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z4-20020a1c4c04000000b0040b32edf626sm2389446wmf.31.2023.11.23.08.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 08:08:35 -0800 (PST)
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
X-Inumbo-ID: 8efde5f9-8a1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700755716; x=1701360516; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfobU6oQZA/gb41m+Lcagy1PuTHLFIO9Dot16l0EkH8=;
        b=n3/NcrC++yMlQc7SToGcbcGxTQbrfQjd+Oj1O6IF9vwHzVGD2bpiEotcmLvPXVSIgV
         UgS0yq1fusDeYRSYfjVvaTIEEf0eizxBSRToesjCW4YIlbZ2v907U+9mWsyY0Ee2VZtX
         9nAXkeUgRCCI+kFAdz+N742wh1DkkVxIUaGvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755716; x=1701360516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfobU6oQZA/gb41m+Lcagy1PuTHLFIO9Dot16l0EkH8=;
        b=Ov9b16DQcrk5M5UF/r5Bn477l7zjxmesJtREr4tdIV9adxuG+HNzg6ebQtERcBCG75
         j0JQtppOToMT5A2Ou7smbiHLcZ25B5vot8UdIBskaP4Qv2aBOQJlahaZ5o8+FygsswUQ
         xTAUlPNOc37WeJ6DdnubyzDsz2DvZQNxg9aVu/zdOSN+L5fm4X4k5m9K4PZgZVICIdfR
         7Dh+BovYt88NFkKQPmozLZvaglQte/+If0axk0IFEHtPur7bK78i0CUqsKFu+GL72hTR
         0eNiaWopgnkA2VnSylCoJP54djA0VvFABIYqJDDHRaojUj41mffNSuxfZA4cqrlm7+rS
         A2hQ==
X-Gm-Message-State: AOJu0Yz/+1IDQxV+U+1Uf6oXPBPLU6UvjZFKRFq93P6b89FmPKwqpDpN
	Y5jDKpP8djCh91LtuECKa2M66/z7ODz3BpyZrH8=
X-Google-Smtp-Source: AGHT+IErJ5LvfgBLNdXMU2XeRi7CmqTTb4oF0dHB65UIsSG26Lhx5thivbpCT/4zNzHhguujexxr8A==
X-Received: by 2002:a2e:9f4e:0:b0:2c5:f1a:1f31 with SMTP id v14-20020a2e9f4e000000b002c50f1a1f31mr3188351ljk.1.1700755716042;
        Thu, 23 Nov 2023 08:08:36 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/2] livepatch-build-tools: do not use readlink -m option
Date: Thu, 23 Nov 2023 17:05:35 +0100
Message-ID: <20231123160535.18658-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123160535.18658-1-roger.pau@citrix.com>
References: <20231123160535.18658-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Busybox readlink implementation only supports the -f option to follow symlinks,
so adjust the logic in order to keep the same behaviour without using the -m
option.

Singed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-build | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index 26c88a2ed2c3..2f35e98d30a3 100755
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
-- 
2.43.0


