Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994CF843D07
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673885.1048432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV83V-0001qC-J0; Wed, 31 Jan 2024 10:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673885.1048432; Wed, 31 Jan 2024 10:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV83V-0001nW-F8; Wed, 31 Jan 2024 10:42:57 +0000
Received: by outflank-mailman (input) for mailman id 673885;
 Wed, 31 Jan 2024 10:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rV83U-0001KI-Dg
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:42:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e16cc59-c025-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 11:42:55 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e76626170so52544845e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:42:55 -0800 (PST)
Received: from fedora39.edvint-x-u ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 bk24-20020a0560001d9800b0033add8aa1d2sm12678460wrb.44.2024.01.31.02.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 02:42:54 -0800 (PST)
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
X-Inumbo-ID: 7e16cc59-c025-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706697774; x=1707302574; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5AH9yHn3ohWU9F4UULaCJq3ZsnSjizKQQi0XdMgt7A=;
        b=NhSs4QxeeF70Cr5d1VRqSOH3yWnT/jOtnagTQpFXN7j9mtR1vsEhF/AVd9DDTrXiLe
         ETejUMv0TdOiLG3JnyRJOVKVTH8ocVuyWNrT7TlEtTzarv5Z4xJW5NKf1wZl2hmM5qq4
         Een2Q5mZNTdK4GY3XF3b46RUTJNvsWMckYJiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706697774; x=1707302574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5AH9yHn3ohWU9F4UULaCJq3ZsnSjizKQQi0XdMgt7A=;
        b=KkBlCxagrDVVLsXhWrEtHIN77EnmdPil/RFxIm80ZDv/kc+RCgcvy7zHDXfspl5ET+
         ZITTHTBAwNx63WUUUanLzgY27E8bGOq/LwaWHEG2yon25Gk2g/XClViyJTj60TfKjwy4
         aiLmL2oZQtZVrD9yFbJGesHA1/wZI1rYvjFbz0E1kB9kBBo5dVh8HyjpDqKftTzu5FSW
         zLeYZUIu+KtM3a1JDJ3rIEF0+2GtPb2syDpBh8LGFxWFg6GIxYwQpKMj4vpKyMK5DWwE
         dJuYoXbN5YQ7fjZ380KdROzl+O7mWh1z3i6dL915rp+TdASFpytdJs10clmrSYj4Fs3+
         3eNA==
X-Gm-Message-State: AOJu0Yzrz5USWeiPwwe+htQptu/qKLaVQoP0e0a90c87K3q9PAvfjpf6
	1ToFzl1q5sySDV2fHxKlDbSB1SGD5Ins/l9MovrH+P1h0D1qfQoIYr/KBX7YaCOgN9wOJ2p+AsT
	BnY4rrw==
X-Google-Smtp-Source: AGHT+IEEsFlkTWM9bjXW8ZddseJCsuSD+k9xFDx5fKoCcVlcaS1LOuyezQzpDd11BH6oZjgM7PYrxw==
X-Received: by 2002:adf:fb12:0:b0:33a:e950:58fb with SMTP id c18-20020adffb12000000b0033ae95058fbmr773837wrr.57.1706697774482;
        Wed, 31 Jan 2024 02:42:54 -0800 (PST)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 2/2] tools/ocaml: bump minimum version to OCaml 4.05
Date: Wed, 31 Jan 2024 10:42:49 +0000
Message-ID: <11cc8480e6e52d5c2dccc7d8d65e1362c7fba685.1706697216.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706697216.git.edwin.torok@cloud.com>
References: <cover.1706697216.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We tried bumping to 4.06.1 [1] previously, but OSSTest was holding us
back.
So bump to OCaml 4.05 instead, which should match the version on
OSSTest?

[1]: https://patchwork.kernel.org/project/xen-devel/patch/ac885ce2b63159d26d857dc3e53cf8aa63ae3646.1659118200.git.edvin.torok@citrix.com/

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/configure    | 2 +-
 tools/configure.ac | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/configure b/tools/configure
index 5723efaa56..3d557234b3 100755
--- a/tools/configure
+++ b/tools/configure
@@ -6836,7 +6836,7 @@ else
                      -e 's/[^0-9]//g'`
 
 
-  ax_compare_version_B=`echo "4.03.0" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
+  ax_compare_version_B=`echo "4.05.0" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
                      -e 's/Z\([0-9]\)Z/Z0\1Z/g' \
                      -e 's/Z\([0-9][0-9]\)Z/Z0\1Z/g' \
                      -e 's/Z\([0-9][0-9][0-9]\)Z/Z0\1Z/g' \
diff --git a/tools/configure.ac b/tools/configure.ac
index c979c3de7c..851887080c 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -336,7 +336,7 @@ AS_IF([test "x$ocamltools" = "xy"], [
             AC_MSG_ERROR([Ocaml tools enabled, but missing ocamlopt or ocamlfind])])
         ocamltools="n"
     ], [
-        AX_COMPARE_VERSION([$OCAMLVERSION], [lt], [4.03.0], [
+        AX_COMPARE_VERSION([$OCAMLVERSION], [lt], [4.05.0], [
             AS_IF([test "x$enable_ocamltools" = "xyes"], [
                 AC_MSG_ERROR([Your version of OCaml: $OCAMLVERSION is not supported])])
             ocamltools="n"
-- 
2.43.0


