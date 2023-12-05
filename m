Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611D805438
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 13:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647736.1011312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUcy-0007Id-CX; Tue, 05 Dec 2023 12:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647736.1011312; Tue, 05 Dec 2023 12:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUcy-0007H1-9z; Tue, 05 Dec 2023 12:34:16 +0000
Received: by outflank-mailman (input) for mailman id 647736;
 Tue, 05 Dec 2023 12:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAUcw-0007Ff-OY
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 12:34:14 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98551dbd-936a-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 13:34:12 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c0a074e71so22245895e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 04:34:12 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b0040b481222e3sm22391417wmo.41.2023.12.05.04.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 04:34:11 -0800 (PST)
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
X-Inumbo-ID: 98551dbd-936a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701779651; x=1702384451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Fqyc6JPbEffc12vul4iA7D2vP1qKTReNpKbh0bHSQk=;
        b=ek+HHtanF1HVj8WaY2h3Jm0YJY2F8Uo/DVkKrAXx3BH+COWQAZ6Y3fOG0Mys/1CgaF
         Cr09ldLlAE55calNBnKjQjPO9gRazXiTsiZhdA6XORE8es2jKdOcvqy2+co/dQk6lLDz
         nbyLSbrAGuwqXre/qwoRxKgz8EOTNeGYrMeVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701779651; x=1702384451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Fqyc6JPbEffc12vul4iA7D2vP1qKTReNpKbh0bHSQk=;
        b=G8DCK3l9H71VpsndV0T4xlZPEfhTMB7EFmz7JaaIe0V8a98du5I7FaCnckau3Uez/T
         BhG3L5TrsPF7jjnAoqE+vTqy9t2Bg/eraH91RV6aw+rLbS9Qllf/rzZBJmy4vpsgwO6C
         D8+tmRu+NQyESFAOFG58uckdN0UD+VoGq2xhn7hAVjualp4iWGU/kQGxdVN0Xu3Je17f
         Y0wP6RImPpeIZKM0PcrBvCsp5/JVBhx25l3cL4ahAGNJ/JQGvuN2zybWqDgCACR7coTH
         GLGan4G3ru1Zs+ihaMQ+1pTx9C0ezGG8oXraaf47tMuU7+NRHSHnIa7ll3Mq1qJ2tk42
         Fg+w==
X-Gm-Message-State: AOJu0YxXIeTpjR5q9X+BN3YBElKOWdr5kTWn/kayTtJzlWeHVmB12jw0
	tFpdbfZ7DtMJcmmAQzGNXN8FD9KUQ9MGmfpnJhg=
X-Google-Smtp-Source: AGHT+IGwhpyT+obAY0DLw8knajDvfpkmX2em2qFn945caqLNO7JwwU99i8l9Y8hoecsCb95BAcQP1A==
X-Received: by 2002:a05:600c:35c4:b0:40b:5e22:96f with SMTP id r4-20020a05600c35c400b0040b5e22096fmr4098727wmq.94.1701779651627;
        Tue, 05 Dec 2023 04:34:11 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] livepatch-build-tools: allow livepatching version.c
Date: Tue,  5 Dec 2023 13:34:03 +0100
Message-ID: <20231205123403.63813-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently version.o is explicitly ignored as the file would change as a result
of the orignal and the patched build having possibly different dates and
times.

Fix such difference by exporting the date and time from the build script, so
that both builds share the same build time.  This allows checking for changes
in version.c, since the rest of fields need to be manually changed in order to
produce different output.

Setting XEN_BUILD_{DATE,TIME} as an environment variable has been supported
since before livepatch support was added to Xen, so it's safe to export those
variables unconditionally.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-build | 4 ++++
 livepatch-gcc   | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index e2ccce4f7fd7..f622683fc56c 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -417,6 +417,10 @@ if [ "${SKIP}" != "build" ]; then
 
     export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
 
+    # Force same date and time to prevent unwanted changes in version.c
+    export XEN_BUILD_DATE=`LC_ALL=C date`
+    export XEN_BUILD_TIME=`LC_ALL=C date +%T`
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

base-commit: e588b7914e7afa3abb64b15a32fc2fdb57ded341
prerequisite-patch-id: 3419543c1c7c96b551db398518dbb10d81b3d5d9
prerequisite-patch-id: 640658ca7a1a21a540bfd6a862ff83669f70a065
prerequisite-patch-id: 650cd4210c2e73e9d2588b048be2c8278ae96acd
-- 
2.43.0


