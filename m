Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296A843D4A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673902.1048469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8DM-0005hq-Df; Wed, 31 Jan 2024 10:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673902.1048469; Wed, 31 Jan 2024 10:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8DM-0005bg-7z; Wed, 31 Jan 2024 10:53:08 +0000
Received: by outflank-mailman (input) for mailman id 673902;
 Wed, 31 Jan 2024 10:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rV8DK-0005ZD-M6
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:53:06 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e87c9b25-c026-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 11:53:03 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3977363f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:53:03 -0800 (PST)
Received: from fedora39.edvint-x-u ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4081000000b0033ae50e2c6asm10585757wrp.83.2024.01.31.02.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 02:53:02 -0800 (PST)
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
X-Inumbo-ID: e87c9b25-c026-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706698382; x=1707303182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEOJ3dKfDa3jEbqZ0msr8PUUdDA4TmMKdDalOhPmKw4=;
        b=bUydjSuXSmCol8BThYnEUKsS+x8gOHcyovnHC4oZ6urjMt49XLhzNp2IkklEwL2zfo
         DELrWWuhLdX13YdZdmmcnTZJ3wQozt92+PUvlUSjzqmg8UTJzkW6MB6HtPxyX84Bbm2M
         DG9+xlLCx38Jdj3qtIW64VFdbM5d/GHpxGGxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706698382; x=1707303182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEOJ3dKfDa3jEbqZ0msr8PUUdDA4TmMKdDalOhPmKw4=;
        b=NFgwotV3CmXICNzuM9KRzOGfJ93HiC1RAzGCnhQ5mX7zzkYnFvKKXV5juNEh9NqU7H
         Yfj0EyUhsf9ddiaDjQZZ1rQdUtXp/SQV1aeuRHv22gLt64FOOHZ6silgN7IBuhezHoxb
         oTvFkyoGNzTK+X7oWMYq5grAPPNQOrm3GWbGFMxf/8goLlaGZmEtp7dguilVXKyjnthh
         v5aQtfU+a9BebikcuWJJrz9svjRXKXxzBTnAtkxJxZA77R4qXKWghUz3QdwHpFUI0uBO
         paNBm+c6GpMg41XRT9D0kl7m8Z6lwa2w7PsX6NXPv1YEWpyE90qLwhWV9IYwpNZ1XTMI
         WP3w==
X-Gm-Message-State: AOJu0Yw5h8f8q3jkNaoO0g7NB94D/jVuDaEOH5q9j6OkvEPjzw9aTT+n
	shaCOCfQJsnyU/K5l2Y7tQy/zavHkuOq3PzuQP+/DsmzLm799c6m+Y4cE89kNUi4OZy1VKg1DUD
	ttc87ew==
X-Google-Smtp-Source: AGHT+IErnvggzIIJIqkmJKISVmMAepy9lUitEB9v6/O/w4NFnemd6oGnJwTS6QTKsDxkkGRS0NjoYA==
X-Received: by 2002:a5d:630f:0:b0:33a:eb24:8383 with SMTP id i15-20020a5d630f000000b0033aeb248383mr891032wru.13.1706698382705;
        Wed, 31 Jan 2024 02:53:02 -0800 (PST)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 2/2] oxenstored: make Quota.t pure
Date: Wed, 31 Jan 2024 10:52:56 +0000
Message-ID: <f98edc633527b6d9a6855af0aff4fb77970454cc.1706697858.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706697858.git.edwin.torok@cloud.com>
References: <cover.1706697858.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we no longer have a hashtable inside we can make Quota.t pure,
and push the mutable update to its callers.
Store.t already had a mutable Quota.t field.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/ocaml/xenstored/quota.ml |  8 ++++----
 tools/ocaml/xenstored/store.ml | 17 ++++++++++-------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/tools/ocaml/xenstored/quota.ml b/tools/ocaml/xenstored/quota.ml
index f6e28ecc6a..1f652040d8 100644
--- a/tools/ocaml/xenstored/quota.ml
+++ b/tools/ocaml/xenstored/quota.ml
@@ -33,7 +33,7 @@ module DomidMap = Map.Make(Domid)
 type t = {
   maxent: int;               (* max entities per domU *)
   maxsize: int;              (* max size of data store in one node *)
-  mutable cur: int DomidMap.t; (* current domains quota *)
+  cur: int DomidMap.t; (* current domains quota *)
 }
 
 let to_string quota domid =
@@ -76,10 +76,10 @@ let update_entry quota_cur id diff =
   else DomidMap.add id nb quota_cur
 
 let del_entry quota id =
-  quota.cur <- update_entry quota.cur id (-1)
+  {quota with cur = update_entry quota.cur id (-1)}
 
 let add_entry quota id =
-  quota.cur <- update_entry quota.cur id (+1)
+  {quota with cur = update_entry quota.cur id (+1)}
 
 let merge orig_quota mod_quota dest_quota =
   let fold_merge id nb dest =
@@ -87,5 +87,5 @@ let merge orig_quota mod_quota dest_quota =
     | 0 -> dest (* not modified *)
     | diff -> update_entry dest id diff (* update with [x=x+diff] *)
   in
-  dest_quota.cur <- DomidMap.fold fold_merge mod_quota.cur dest_quota.cur
+  {dest_quota with cur = DomidMap.fold fold_merge mod_quota.cur dest_quota.cur}
   (* dest_quota = dest_quota + (mod_quota - orig_quota) *)
diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index 38a4945372..9b8dd2812d 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -85,7 +85,9 @@ module Node = struct
       raise Define.Permission_denied;
     end
 
-  let rec recurse fct node = fct node; SymbolMap.iter (fun _ -> recurse fct) node.children
+  let rec recurse fct node acc =
+    let acc = fct node acc in
+    SymbolMap.fold (fun _ -> recurse fct) node.children acc
 
   (** [recurse_filter_map f tree] applies [f] on each node in the tree recursively,
       possibly removing some nodes.
@@ -408,7 +410,7 @@ let dump_buffer store = dump_store_buf store.root
 let set_node store path node orig_quota mod_quota =
   let root = Path.set_node store.root path node in
   store.root <- root;
-  Quota.merge orig_quota mod_quota store.quota
+  store.quota <- Quota.merge orig_quota mod_quota store.quota
 
 let write store perm path value =
   let node, existing = get_deepest_existing_node store path in
@@ -422,7 +424,7 @@ let write store perm path value =
   let root, node_created = path_write store perm path value in
   store.root <- root;
   if node_created
-  then Quota.add_entry store.quota owner
+  then store.quota <- Quota.add_entry store.quota owner
 
 let mkdir store perm path =
   let node, existing = get_deepest_existing_node store path in
@@ -431,7 +433,7 @@ let mkdir store perm path =
   if not (existing || (Perms.Connection.is_dom0 perm)) then Quota.check store.quota owner 0;
   store.root <- path_mkdir store perm path;
   if not existing then
-    Quota.add_entry store.quota owner
+    store.quota <- Quota.add_entry store.quota owner
 
 let rm store perm path =
   let rmed_node = Path.get_node store.root path in
@@ -439,7 +441,7 @@ let rm store perm path =
   | None -> raise Define.Doesnt_exist
   | Some rmed_node ->
     store.root <- path_rm store perm path;
-    Node.recurse (fun node -> Quota.del_entry store.quota (Node.get_owner node)) rmed_node
+    store.quota <- Node.recurse (fun node quota -> Quota.del_entry quota (Node.get_owner node)) rmed_node store.quota
 
 let setperms store perm path nperms =
   match Path.get_node store.root path with
@@ -450,8 +452,9 @@ let setperms store perm path nperms =
     if not ((old_owner = new_owner) || (Perms.Connection.is_dom0 perm)) then
       raise Define.Permission_denied;
     store.root <- path_setperms store perm path nperms;
-    Quota.del_entry store.quota old_owner;
-    Quota.add_entry store.quota new_owner
+    store.quota <-
+      let quota = Quota.del_entry store.quota old_owner in
+      Quota.add_entry quota new_owner
 
 let reset_permissions store domid =
   Logging.info "store|node" "Cleaning up xenstore ACLs for domid %d" domid;
-- 
2.43.0


