Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B3F812AD4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654346.1021162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhUU-0008Qi-7l; Thu, 14 Dec 2023 08:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654346.1021162; Thu, 14 Dec 2023 08:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhUU-0008NK-54; Thu, 14 Dec 2023 08:54:46 +0000
Received: by outflank-mailman (input) for mailman id 654346;
 Thu, 14 Dec 2023 08:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDhUS-0008NC-NF
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:54:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c631de5-9a5e-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 09:54:43 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3333131e08dso8273516f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 00:54:43 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05600000c900b0033330846e76sm15512801wrx.86.2023.12.14.00.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 00:54:41 -0800 (PST)
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
X-Inumbo-ID: 6c631de5-9a5e-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702544082; x=1703148882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvgrAtAP6VYVedQI8IfKjme4qoauzMRvA4DIc1jKOdw=;
        b=Ztf/xUt9RuQGq7gEiJBGCnfhZ12abaA6xgyEk6hWUonY3wgCLdt/XfYhe3UIBnhMdk
         w+jzpc3KWbHiYPt+s/2jrqzeb0ezZz1VBP3QOFZ7dU5s73UQhUmzPwj+fAGOZiyCipNo
         9KE0LDH4DJA2sOaJBej1lURc4lP3tBpQx7APc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702544082; x=1703148882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvgrAtAP6VYVedQI8IfKjme4qoauzMRvA4DIc1jKOdw=;
        b=ROIobfAziuRHsz5FlAwiQPczsKJBbNvOAn+C4uO8Gr9p1wrKMOY7CUmLe51jyEDQud
         qcGZJfaD/dLx9xBI35SeVfv1q0s0po7j057UnU2WTEjJEu1q0VWibfsLS6P324dv60aG
         U6Bc6PoqfUJZhN5MeUhsZEIQuHcFE/mo6SyynJVntbTzkOyTckn0xh9Ut7kSnkel+vxK
         pPw0/ZxfBWR5bBfqonWRM8zJiZiEf5sMUC9fOXMg6ZEn39kSrEJ5EvfQ1aDI9D0Eov5B
         3ZPkqs/xgwms6cgEkZi7qvcVRxUMtL8QhrrOzonW6giZKwF4NV6CGH6UbEMi5pAFw1U4
         /quw==
X-Gm-Message-State: AOJu0Ywbz826lcfvLsv00KAOXR/YJ5bl7Frq8FseMky9o0GdTJhQT6NY
	UljxY7zOTTYM8kcA6WgVrnIsN2O5w/9fBvCEat4=
X-Google-Smtp-Source: AGHT+IFU8Qv/tdCnT5BeSTEX/hkrxGa9t0zfcoWcV+Xqvp15vnK39v0RQF4OE00yGG4MnkqHBsQhaQ==
X-Received: by 2002:a05:6000:1370:b0:336:49da:57f with SMTP id q16-20020a056000137000b0033649da057fmr170089wrz.51.1702544082073;
        Thu, 14 Dec 2023 00:54:42 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] livepatch-build-tools: allow livepatching version.c
Date: Thu, 14 Dec 2023 09:54:24 +0100
Message-ID: <20231214085424.16890-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently version.o is explicitly ignored as the file would change as a result
of the orignal and the patched build having possibly different dates, times or
changeset strings (by the patched build appending -dirty).

Fix such difference by exporting the date and time from the build script, so
that both builds share the same build time.  The changeset string gets set in
.scmversion, and is cleaned on script exit if it wasn't present initially. This
allows checking for changes in version.c, since the rest of fields need to be
manually changed in order to produce different output.

Setting XEN_BUILD_{DATE,TIME} as an environment variable and .scmversion has
been supported since before livepatch support was added to Xen, so it's safe to
export those variables unconditionally.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Also ensure consistent changeset version.
---
 livepatch-build | 14 ++++++++++++++
 livepatch-gcc   |  2 --
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index e2ccce4f7fd7..332d26f5c6b6 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -392,6 +392,10 @@ echo "Output directory: $outputarg"
 echo "================================================"
 echo
 
+cleanup_version() {
+    rm -rf "${SRCDIR}/xen/.scmversion"
+}
+
 if [ "${SKIP}" != "build" ]; then
     # Make sure output directory doesn't exist, and create it.
     [ -e "$outputarg" ] && die "Output directory exists"
@@ -417,6 +421,16 @@ if [ "${SKIP}" != "build" ]; then
 
     export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
 
+    # Force same date and time to prevent unwanted changes in version.c
+    export XEN_BUILD_DATE=`LC_ALL=C date`
+    export XEN_BUILD_TIME=`LC_ALL=C date +%T`
+
+    # Ensure uniform changeset between builds
+    if [ ! -e "${SRCDIR}/xen/.scmversion" ]; then
+        trap cleanup_version EXIT
+        echo "unavailable" > "${SRCDIR}/xen/.scmversion"
+    fi
+
     echo "Perform full initial build with ${CPUS} CPU(s)..."
     build_full
 
diff --git a/livepatch-gcc b/livepatch-gcc
index fcad80551aa0..e4cb6fb59029 100755
--- a/livepatch-gcc
+++ b/livepatch-gcc
@@ -33,7 +33,6 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
             obj=$2
             [[ $2 = */.tmp_*.o ]] && obj=${2/.tmp_/}
             case "$(basename $obj)" in
-            version.o|\
             debug.o|\
             check.o|\
             *.xen-syms.*.o|\
@@ -63,7 +62,6 @@ done
 elif [[ "$TOOLCHAINCMD" =~ $OBJCOPY_RE ]] ; then
     obj="${!#}"
     case "$(basename $obj)" in
-        version.o|\
         debug.o|\
         check.o|\
         boot.o|\

base-commit: 0ed8ef88dc300750696a64e89efa3b82502f6dc7
-- 
2.43.0


