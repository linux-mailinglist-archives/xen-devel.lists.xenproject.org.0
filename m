Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC8843D06
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673884.1048418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV83U-0001SZ-D4; Wed, 31 Jan 2024 10:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673884.1048418; Wed, 31 Jan 2024 10:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV83U-0001M4-8w; Wed, 31 Jan 2024 10:42:56 +0000
Received: by outflank-mailman (input) for mailman id 673884;
 Wed, 31 Jan 2024 10:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rV83S-0001KI-KH
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:42:54 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d08452e-c025-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 11:42:54 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33ae3be1c37so435100f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:42:54 -0800 (PST)
Received: from fedora39.edvint-x-u ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 bk24-20020a0560001d9800b0033add8aa1d2sm12678460wrb.44.2024.01.31.02.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 02:42:53 -0800 (PST)
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
X-Inumbo-ID: 7d08452e-c025-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706697773; x=1707302573; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlDvwn/xwDXSCmMe/kTB137wQ3seg5CSZJxIiCw9FZo=;
        b=j1sd6Mzi5UQALwEyeHj+zbX+aRiZE35shJBgvILgYF0Wkyqp6txXJvCxpS3M3ThgoG
         nuuHAdsr9UHpQ5ZfhV9LvVYmOxCKpOIcoKghy5wIylGy+yHr3RnMgbl2SfxURzax5tWO
         Nby4/25tzLwuOOjo2JkDyw3bCP/GAcmOTHEhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706697773; x=1707302573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlDvwn/xwDXSCmMe/kTB137wQ3seg5CSZJxIiCw9FZo=;
        b=q9gx4wHO83XB8GX+hlMHyyU9xMlXQMi7UghmfCppWQ8tu//+pL85KV+N2sh3iNeXjC
         e/6AN4yFel3NeLmj25kf87xiSMrpLJ6rawpUXREBpKhLZYlJgX+A4cAcNBcSDzKdsWjx
         fGtZzvsFDVOvn3cOD99imzZk6sO+XDgXArgWYETGrRxcFhXZt6PjWbezyk1xgpCAEu27
         VCLEnXMzACtVul5z7Azu1cnuEp1SFD4//ZJWzdiqdPVaAs6R+cKfC46Ks3zpB+5tFivR
         G9ct1mlFbqdIIgqxwFdMopMVrPl7s4pQFC4uKuPIvyxqPYquIu59N2+1/Uf7KbJ0S3eW
         pCuQ==
X-Gm-Message-State: AOJu0YxIyHD1QHOg1ga1ux9XMtV4o4ViIESh7w0pCoZE0mgzf9jYdbPg
	bCS+jXE9DVhdLoi40TNeBUj5OUtoyZn8DqlpVdjL0LoKdlEhXE0zHdbXCzhFLCadxcoH/bYi7ds
	W910Ulw==
X-Google-Smtp-Source: AGHT+IHPOLG0f2wML2y1vEWWVQlreaVZFlkpTOFcDLELLu7QDtb5Y/usbHBFd0fIOHfswto+nNh0Wg==
X-Received: by 2002:a5d:664d:0:b0:33b:147:7c61 with SMTP id f13-20020a5d664d000000b0033b01477c61mr1301751wrw.5.1706697773360;
        Wed, 31 Jan 2024 02:42:53 -0800 (PST)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v1 1/2] oxenstored: fix build on OCaml 5.x
Date: Wed, 31 Jan 2024 10:42:48 +0000
Message-ID: <e3a8e4361f7e06b61660a4eeeb17f16555a07c6e.1706697216.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706697216.git.edwin.torok@cloud.com>
References: <cover.1706697216.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Char.lowercase got removed in OCaml 5.0 (it has been deprecated since 2014).

Char.lowercase_ascii has existed since OCaml 4.03, so that is the new
minimum version for oxenstored.

(Given the choice between supporting a new release and dropping support
for an 8y+ old release, we drop support for OCaml <4.03)

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/configure               | 2 +-
 tools/configure.ac            | 2 +-
 tools/ocaml/xenstored/disk.ml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/configure b/tools/configure
index 0135a0059a..5723efaa56 100755
--- a/tools/configure
+++ b/tools/configure
@@ -6836,7 +6836,7 @@ else
                      -e 's/[^0-9]//g'`
 
 
-  ax_compare_version_B=`echo "4.02.0" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
+  ax_compare_version_B=`echo "4.03.0" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
                      -e 's/Z\([0-9]\)Z/Z0\1Z/g' \
                      -e 's/Z\([0-9][0-9]\)Z/Z0\1Z/g' \
                      -e 's/Z\([0-9][0-9][0-9]\)Z/Z0\1Z/g' \
diff --git a/tools/configure.ac b/tools/configure.ac
index 618ef8c63f..c979c3de7c 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -336,7 +336,7 @@ AS_IF([test "x$ocamltools" = "xy"], [
             AC_MSG_ERROR([Ocaml tools enabled, but missing ocamlopt or ocamlfind])])
         ocamltools="n"
     ], [
-        AX_COMPARE_VERSION([$OCAMLVERSION], [lt], [4.02.0], [
+        AX_COMPARE_VERSION([$OCAMLVERSION], [lt], [4.03.0], [
             AS_IF([test "x$enable_ocamltools" = "xyes"], [
                 AC_MSG_ERROR([Your version of OCaml: $OCAMLVERSION is not supported])])
             ocamltools="n"
diff --git a/tools/ocaml/xenstored/disk.ml b/tools/ocaml/xenstored/disk.ml
index 91f945f2bd..ccaa048faf 100644
--- a/tools/ocaml/xenstored/disk.ml
+++ b/tools/ocaml/xenstored/disk.ml
@@ -30,7 +30,7 @@ let undec c =
   | _          -> raise (Failure "undecify")
 
 let unhex c =
-  let c = Char.lowercase c in
+  let c = Char.lowercase_ascii c in
   match c with
   | '0' .. '9' -> (Char.code c) - (Char.code '0')
   | 'a' .. 'f' -> (Char.code c) - (Char.code 'a') + 10
-- 
2.43.0


