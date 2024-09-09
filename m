Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8179718E2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794383.1203307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6o-0001Ps-Ln; Mon, 09 Sep 2024 12:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794383.1203307; Mon, 09 Sep 2024 12:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6o-0001MS-IM; Mon, 09 Sep 2024 12:03:06 +0000
Received: by outflank-mailman (input) for mailman id 794383;
 Mon, 09 Sep 2024 12:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/dp=QH=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1snd6n-0000ce-0W
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:03:05 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77e928c2-6ea3-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 14:03:04 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso5271130a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:03:04 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65742sm331603066b.216.2024.09.09.05.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:03:03 -0700 (PDT)
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
X-Inumbo-ID: 77e928c2-6ea3-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725883383; x=1726488183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dx3O4MBTaAWxPdBDzrYnpKhE+MJx2y5yX5SXZjkXD0g=;
        b=hIkWvxPxIMiep35c3Uu1kHAnpsBwb5Oxoar1Ewv1FR7uhOm62hEpDm9FqCTPHrZrfW
         AGMYf2mdN+7s9olDFZ1kWntKd0Ou+o0O/6lzlJX+NzLvuGuIcF2xT7FKTK2neffnOkG5
         P+DMKItn6/1KzGeCQvam8KILNQTlTfsPTd7Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883383; x=1726488183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dx3O4MBTaAWxPdBDzrYnpKhE+MJx2y5yX5SXZjkXD0g=;
        b=RvysO2HI4LBKnSriiIugqeFpw6KxPIkDCzKj27fY49EjU5Kp8QEfx7KPFY/pMVOciM
         HGvW7DfXmGIQrlcO7gZzJDSSg9qTycigPXosO0/ansLPYdCv+7XgMxmSS4lDVTiVJPao
         u+vMJPLPYMtkMVftJxbbI/j9dgrRly/E1SEAQhB84UCru/7jdTbR8TtctLbeTBw6Xb9D
         SjenTt4AT6i/7/3MbxepANdi4tEZl40snGoxi9OhzyFSryriGSVMVGc788eSETNkcMrK
         Sd5ipNKIXjPw7Vlp/R5k6GnA/QAlILcXNkL2fHdGzCQ3RD8Riu6uULWakOJxoh4ZZ4fA
         N0lA==
X-Gm-Message-State: AOJu0Yy3BYObGgbWqRQ2CR+qjkhgkHOP6WvRa927Wz//PUvx5uDnUW8S
	ywBO45TYlPAaZ4NpyL/N8BkL9+QNAkUcjMgIJ1fuXJSlEc9eMl7tBE5MV1DT5A+Y2L4cZLTHkSe
	e
X-Google-Smtp-Source: AGHT+IEN/G6OLfZtDKoYK25jJ/F4A+BFKt1jKuOHvs7Rc1f6vxHSp0AV604sumzAKQkn63Dwa0/mWg==
X-Received: by 2002:a17:907:e90:b0:a7a:9447:3e8c with SMTP id a640c23a62f3a-a8a885bddf2mr663727566b.3.1725883383362;
        Mon, 09 Sep 2024 05:03:03 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v3 3/3] tools/oxenstored: Switch to using the plugin for Xenctrl.domain_getinfo
Date: Mon,  9 Sep 2024 13:02:42 +0100
Message-Id: <23bc7f3e81dd89f8d5d6fd5f27d5dca0125b69a2.1725881488.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725881488.git.andrii.sultanov@cloud.com>
References: <cover.1725881488.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also run 'make format' on the file to reformat an adjacent block of code
correctly.

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
* This commit is a result of the split of one oxenstored commit into two.

 tools/ocaml/xenstored/domains.ml | 51 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index c233065711..fabca00e6b 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -49,8 +49,8 @@ module Plugin =
 let handle = Plugin.interface_open ()
 
 type domains = {
-  eventchn: Event.t;
-  table: (Xenctrl.domid, Domain.t) Hashtbl.t;
+  eventchn : Event.t;
+  table : (Plugin.domid, Domain.t) Hashtbl.t;
 
   (* N.B. the Queue module is not thread-safe but oxenstored is single-threaded. *)
   (* Domains queue up to regain conflict-credit; we have a queue for
@@ -121,30 +121,29 @@ let cleanup doms =
   let notify = ref false in
   let dead_dom = ref [] in
 
-  Hashtbl.iter (fun id _ -> if id <> 0 then
-                   try
-                     let info = Xenctrl.domain_getinfo xc id in
-                     if info.Xenctrl.shutdown || info.Xenctrl.dying then (
-                       debug "Domain %u died (dying=%b, shutdown %b -- code %d)"
-                         id info.Xenctrl.dying info.Xenctrl.shutdown info.Xenctrl.shutdown_code;
-                       if info.Xenctrl.dying then
-                         dead_dom := id :: !dead_dom
-                       else
-                         notify := true;
-                     )
-                   with Xenctrl.Error _ ->
-                     debug "Domain %u died -- no domain info" id;
-                     dead_dom := id :: !dead_dom;
-               ) doms.table;
-  List.iter (fun id ->
-      let dom = Hashtbl.find doms.table id in
-      Domain.close dom;
-      Hashtbl.remove doms.table id;
-      if dom.Domain.conflict_credit <= !Define.conflict_burst_limit
-      then (
-        remove_from_queue dom doms.doms_with_conflict_penalty;
-        if (dom.Domain.conflict_credit <= 0.) then remove_from_queue dom doms.doms_conflict_paused
-      )
+  Hashtbl.iter
+    (fun id _ ->
+       if id <> 0 then (
+         try
+           let info = Plugin.domain_getinfo handle id in
+           if info.Plugin.shutdown || info.Plugin.dying then (
+             debug "Domain %u died (dying=%b, shutdown %b -- code %d)" id
+               info.Plugin.dying info.Plugin.shutdown info.Plugin.shutdown_code;
+             if info.Plugin.dying then dead_dom := id :: !dead_dom else notify := true)
+         with Plugin.Error _ ->
+           debug "Domain %u died -- no domain info" id;
+           dead_dom := id :: !dead_dom))
+    doms.table;
+  List.iter
+    (fun id ->
+       let dom = Hashtbl.find doms.table id in
+       Domain.close dom;
+       Hashtbl.remove doms.table id;
+       if dom.Domain.conflict_credit <= !Define.conflict_burst_limit
+       then (
+         remove_from_queue dom doms.doms_with_conflict_penalty;
+         if (dom.Domain.conflict_credit <= 0.) then remove_from_queue dom doms.doms_conflict_paused
+       )
     ) !dead_dom;
   !notify, !dead_dom
 
-- 
2.39.2


