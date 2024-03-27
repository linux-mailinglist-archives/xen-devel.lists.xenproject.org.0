Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8254688EB4F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 17:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698649.1090613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWAU-0002xO-9p; Wed, 27 Mar 2024 16:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698649.1090613; Wed, 27 Mar 2024 16:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWAU-0002tc-6K; Wed, 27 Mar 2024 16:30:26 +0000
Received: by outflank-mailman (input) for mailman id 698649;
 Wed, 27 Mar 2024 16:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VkeH=LB=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rpWAS-0002s8-64
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 16:30:24 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dfdf1ee-ec57-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 17:30:22 +0100 (CET)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-430a0d6c876so42817471cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 09:30:21 -0700 (PDT)
Received: from fedora39.edvint-x-u ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05622a17c500b004314f546017sm3652107qtk.79.2024.03.27.09.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 09:30:19 -0700 (PDT)
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
X-Inumbo-ID: 4dfdf1ee-ec57-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711557020; x=1712161820; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lqlXT2RfS86kgsXk3lOacDlRJEjVNtBSA3x1E7m/D8=;
        b=PmRLYGh0pX6RBqEtLnFesnK9Ymok0DQ230l3SMRdbMiqvE5xegu9oELesw87Q3seJy
         kQ5n7/crxJJLTeC0nOuyFqGBQQMnSIyjfiaeD61qatUjKfq2JKrICGajp62b0N5Zc2c5
         Umd0R8GPGkA+qhQGLNPWdWKkxNaSqGxfa0meQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711557020; x=1712161820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lqlXT2RfS86kgsXk3lOacDlRJEjVNtBSA3x1E7m/D8=;
        b=ZgLxTyNANeRwGHMwsLIxPCiz2iYpb2mPkIr5NeYhWv4I39PLkDe5oDSIY1aI/V6Mtr
         qJdMaC3PlU5jzRX5ByLKbXbQv7FMhqft9mM43WSofYP84f8Cf68eHA9K/a4cHJCqa0IT
         0BjcQ1qFMoc28OyVUkRU6Q/+bR1Fkvgw3otKipBRcehnmfGBkXCgxjiwSIX52ZxmThkf
         LID2OSe6KsPxJmw+KPoGO5/fwTwWGW2Vtmn75cbgd2ZyQ9LaPW7OA1CNKUr1/xOUztqn
         lows0i186x9F8VBqildx1vYqCQck0dYY5CIpx2tZf9XsuWn5I+a4jnUsNgQaOEcCJJ//
         xftQ==
X-Gm-Message-State: AOJu0YxWi7XsMl9kr0u8XtzLGX9nVX+9rK0N+5W33WpaGm+MTr98SFo3
	sKEX6QXL9xrAMLx77HUvtmH7V7DEJm99MFH0x3bu3wfK1+xHPHquRcWU3jT5jTC4OC9i59jtVji
	E2MI=
X-Google-Smtp-Source: AGHT+IFUO0nNdGQMmhSk9Rg6FVuw9n3DzXxdWyOGfwkDyrQBPwJsUZfHePu+XeRNbFgfiudytG9drQ==
X-Received: by 2002:a05:622a:3ca:b0:42e:d5a3:e03e with SMTP id k10-20020a05622a03ca00b0042ed5a3e03emr132214qtx.53.1711557019771;
        Wed, 27 Mar 2024 09:30:19 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools/ocaml: fix warnings
Date: Wed, 27 Mar 2024 16:30:21 +0000
Message-ID: <bc752eab0aafd7981634e4f5be7a53f49e1f3cef.1711556875.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not rely on the string values of the `Failure` exception,
 but use the `_opt` functions instead.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/ocaml/xenstored/config.ml | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/ocaml/xenstored/config.ml b/tools/ocaml/xenstored/config.ml
index 95ef745a54..e0df236f73 100644
--- a/tools/ocaml/xenstored/config.ml
+++ b/tools/ocaml/xenstored/config.ml
@@ -83,25 +83,27 @@ let validate cf expected other =
   let err = ref [] in
   let append x = err := x :: !err in
   List.iter (fun (k, v) ->
+      let parse ~err_msg parser v f =
+        match parser v with
+        | None -> append (k, err_msg)
+        | Some r -> f r
+      in
       try
         if not (List.mem_assoc k expected) then
           other k v
         else let ty = List.assoc k expected in
           match ty with
           | Unit f       -> f ()
-          | Bool f       -> f (bool_of_string v)
+          | Bool f       -> parse ~err_msg:"expect bool arg" bool_of_string_opt v f
           | String f     -> f v
-          | Int f        -> f (int_of_string v)
-          | Float f      -> f (float_of_string v)
-          | Set_bool r   -> r := (bool_of_string v)
+          | Int f        -> parse ~err_msg:"expect int arg" int_of_string_opt v f
+          | Float f      -> parse ~err_msg:"expect float arg" float_of_string_opt v f
+          | Set_bool r   -> parse ~err_msg:"expect bool arg" bool_of_string_opt v (fun x -> r := x)
           | Set_string r -> r := v
-          | Set_int r    -> r := int_of_string v
-          | Set_float r  -> r := (float_of_string v)
+          | Set_int r    -> parse ~err_msg:"expect int arg" int_of_string_opt v (fun x -> r:= x)
+          | Set_float r  -> parse ~err_msg:"expect float arg" float_of_string_opt v (fun x -> r := x)
       with
       | Not_found                 -> append (k, "unknown key")
-      | Failure "int_of_string"   -> append (k, "expect int arg")
-      | Failure "bool_of_string"  -> append (k, "expect bool arg")
-      | Failure "float_of_string" -> append (k, "expect float arg")
       | exn                       -> append (k, Printexc.to_string exn)
     ) cf;
   if !err != [] then raise (Error !err)
-- 
2.44.0


