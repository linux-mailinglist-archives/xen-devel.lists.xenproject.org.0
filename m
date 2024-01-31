Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A3843D4B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673901.1048461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8DM-0005bd-1T; Wed, 31 Jan 2024 10:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673901.1048461; Wed, 31 Jan 2024 10:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8DL-0005a5-V6; Wed, 31 Jan 2024 10:53:07 +0000
Received: by outflank-mailman (input) for mailman id 673901;
 Wed, 31 Jan 2024 10:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rV8DK-0005ZD-0X
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:53:06 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7d22e4e-c026-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 11:53:02 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33ae3cc8a6aso2914616f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:53:02 -0800 (PST)
Received: from fedora39.edvint-x-u ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4081000000b0033ae50e2c6asm10585757wrp.83.2024.01.31.02.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 02:53:01 -0800 (PST)
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
X-Inumbo-ID: e7d22e4e-c026-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706698381; x=1707303181; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa9A5+QxE9tVCCZct9IISsR+fFT6zN3g0plaGL+J3O8=;
        b=OMcTVKm0LZorrgC2o8RBZfd2GFfPGjVE+7YKvqAif0jRnaA2JdsIM8sMTOqFRMfiDQ
         70sZQQdcLeOJa8bW8wUQK3x2Pt+56Oa3QeytVTrIH1x57T5UbBiAEWi7n+S4wi6ZEj1/
         ySgcOzyToAcxLT+9b2uzMIVO6TDWmXuAfJwUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706698381; x=1707303181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sa9A5+QxE9tVCCZct9IISsR+fFT6zN3g0plaGL+J3O8=;
        b=dcUt1vQ73H7FGd+nz93zMAJEy10vnxbweiDUzD7aki2UPbVnu+/qLi0y/pR69+GKWS
         rfJTync64vzDZXwwH+XW0b0w0TQs2REiuana3Bd92IAVHTHLeTV7VtMwURovKKSvOxXz
         UyUpUOEkEIQNAt7XbQANY8SjexaJgR5EHph0+8wGCfG3tbAiR+tPqdUVfnMUYWGUVs0X
         TN00d9aw6I9bkK6R4mzrZ+9wiCfZLiUPaEPPP6+v+rVYYvFXHjnlxGkv0I+bm1qF11/c
         SNrNojlytFYjeezIbddKHUPkP7EFeE9YMwduUyak6JLUUR32Q1qgqZ4Jt7Ynm5/YhdXS
         I1fQ==
X-Gm-Message-State: AOJu0Yx6cl1bsrHrg0D4podKEMU+03eE2WXiNmTaF6myYkSTvf22qOKz
	YtuiVYlrdKqXpEWvpAa0vVfHiaEz2jz3jaW2zl2VOzE707u3dxFQfxUskaT9YXq45dUcOMoKCC3
	hPOf4HA==
X-Google-Smtp-Source: AGHT+IHj2ZpYl1siq/JnQdl8XUH43iMpNaE3SW4WBMxK/9aEO8opZUdsBx1VkvGgbtOsUpBOLM0Zgg==
X-Received: by 2002:a5d:498d:0:b0:33a:ec23:1a22 with SMTP id r13-20020a5d498d000000b0033aec231a22mr895144wrq.32.1706698381427;
        Wed, 31 Jan 2024 02:53:01 -0800 (PST)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 1/2] oxenstored: use Map instead of Hashtbl for quotas
Date: Wed, 31 Jan 2024 10:52:55 +0000
Message-ID: <513931c932fa8d088acefdfc2d3b73d4c3070002.1706697858.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706697858.git.edwin.torok@cloud.com>
References: <cover.1706697858.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On a stress test running 1000 VMs flamegraphs have shown that
`oxenstored` spends a large amount of time in `Hashtbl.copy` and the GC.

Hashtable complexity:
 * read/write: O(1) average
 * copy: O(domains) -- copying the entire table

Map complexity:
 * read/write: O(log n) worst case
 * copy: O(1) -- a word copy

We always perform at least one 'copy' when processing each xenstore
packet (regardless whether it is a readonly operation or inside a
transaction or not), so the actual complexity per packet is:
  * Hashtbl: O(domains)
  * Map: O(log domains)

Maps are the clear winner, and a better fit for the immutable xenstore
tree.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/ocaml/xenstored/quota.ml | 65 ++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/tools/ocaml/xenstored/quota.ml b/tools/ocaml/xenstored/quota.ml
index 300d78a50b..f6e28ecc6a 100644
--- a/tools/ocaml/xenstored/quota.ml
+++ b/tools/ocaml/xenstored/quota.ml
@@ -23,66 +23,69 @@ let activate = ref true
 let maxent = ref (1000)
 let maxsize = ref (2048)
 
+module Domid = struct
+  type t = Xenctrl.domid
+  let compare (a:t) (b:t) = compare a b
+end
+
+module DomidMap = Map.Make(Domid)
+
 type t = {
   maxent: int;               (* max entities per domU *)
   maxsize: int;              (* max size of data store in one node *)
-  cur: (Xenctrl.domid, int) Hashtbl.t; (* current domains quota *)
+  mutable cur: int DomidMap.t; (* current domains quota *)
 }
 
 let to_string quota domid =
-  if Hashtbl.mem quota.cur domid
-  then Printf.sprintf "dom%i quota: %i/%i" domid (Hashtbl.find quota.cur domid) quota.maxent
-  else Printf.sprintf "dom%i quota: not set" domid
+  try
+    Printf.sprintf "dom%i quota: %i/%i" domid (DomidMap.find domid quota.cur) quota.maxent
+  with Not_found ->
+    Printf.sprintf "dom%i quota: not set" domid
 
 let create () =
-  { maxent = !maxent; maxsize = !maxsize; cur = Hashtbl.create 100; }
+  { maxent = !maxent; maxsize = !maxsize; cur = DomidMap.empty; }
 
-let copy quota = { quota with cur = (Hashtbl.copy quota.cur) }
+let copy quota = { quota with cur = quota.cur }
 
-let del quota id = Hashtbl.remove quota.cur id
+let del quota id = { quota with cur = DomidMap.remove id quota.cur }
 
 let _check quota id size =
   if size > quota.maxsize then (
     warn "domain %u err create entry: data too big %d" id size;
     raise Data_too_big
   );
-  if id > 0 && Hashtbl.mem quota.cur id then
-    let entry = Hashtbl.find quota.cur id in
+  if id > 0 then
+  try
+    let entry = DomidMap.find id quota.cur in
     if entry >= quota.maxent then (
       warn "domain %u cannot create entry: quota reached" id;
       raise Limit_reached
     )
+  with Not_found -> ()
 
 let check quota id size =
   if !activate then
     _check quota id size
 
-let get_entry quota id = Hashtbl.find quota.cur id
+let find_or_zero quota_cur id =
+  try DomidMap.find id quota_cur with Not_found -> 0
 
-let set_entry quota id nb =
-  if nb = 0
-  then Hashtbl.remove quota.cur id
-  else begin
-    if Hashtbl.mem quota.cur id then
-      Hashtbl.replace quota.cur id nb
-    else
-      Hashtbl.add quota.cur id nb
-  end
+let update_entry quota_cur id diff =
+  let nb = diff + find_or_zero quota_cur id in
+  if nb = 0 then DomidMap.remove id quota_cur
+  else DomidMap.add id nb quota_cur
 
 let del_entry quota id =
-  try
-    let nb = get_entry quota id in
-    set_entry quota id (nb - 1)
-  with Not_found -> ()
+  quota.cur <- update_entry quota.cur id (-1)
 
 let add_entry quota id =
-  let nb = try get_entry quota id with Not_found -> 0 in
-  set_entry quota id (nb + 1)
-
-let add quota diff =
-  Hashtbl.iter (fun id nb -> set_entry quota id (get_entry quota id + nb)) diff.cur
+  quota.cur <- update_entry quota.cur id (+1)
 
 let merge orig_quota mod_quota dest_quota =
-  Hashtbl.iter (fun id nb -> let diff = nb - (try get_entry orig_quota id with Not_found -> 0) in
-      if diff <> 0 then
-        set_entry dest_quota id ((try get_entry dest_quota id with Not_found -> 0) + diff)) mod_quota.cur
+  let fold_merge id nb dest =
+    match nb - find_or_zero orig_quota.cur id with
+    | 0 -> dest (* not modified *)
+    | diff -> update_entry dest id diff (* update with [x=x+diff] *)
+  in
+  dest_quota.cur <- DomidMap.fold fold_merge mod_quota.cur dest_quota.cur
+  (* dest_quota = dest_quota + (mod_quota - orig_quota) *)
-- 
2.43.0


