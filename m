Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96FA33FF4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:10:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887519.1297016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYzG-0006wz-Pv; Thu, 13 Feb 2025 13:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887519.1297016; Thu, 13 Feb 2025 13:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYzG-0006v8-ND; Thu, 13 Feb 2025 13:10:38 +0000
Received: by outflank-mailman (input) for mailman id 887519;
 Thu, 13 Feb 2025 13:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhyQ=VE=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tiYsO-0000vx-N5
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:03:32 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed172cb1-ea0a-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 14:03:32 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30761be8fa8so9513531fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 05:03:32 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532802a1sm129340366b.76.2025.02.13.05.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 05:03:29 -0800 (PST)
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
X-Inumbo-ID: ed172cb1-ea0a-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739451811; x=1740056611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgCZfMNXCK+7uclJCV9E/LyVULa3BpiDvo0lG79NDfc=;
        b=H4vlAWT2uq/epWwAd50jbdj+V1k6xie4xzX3tKO79dlU3HRoFhic/iBzMuMmhfMH9x
         cJjo6FOzT9XW7OYzzmjBjy8/7Np4ISxMcDBnJE4vvIiRh3VhvbuYATPVyyiTIyjVX1cm
         +cQynDbki1vudXrSYOV6ivVR6b/2gHI8rp4pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451811; x=1740056611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgCZfMNXCK+7uclJCV9E/LyVULa3BpiDvo0lG79NDfc=;
        b=WSWLCqdIqGLVqAjFNFNMACSgO474czfzVJm4bm+jOGfwlNMehBjfpCDtyOPG/SCQCY
         Vr1co81QojNFXJvg/FlFQ2e9VaLEJV13qbfipQ8RqYF5rptTByB0VUxFv6NGmyO/+jdI
         0xxtepCAonN8FniMntFKavpiMDcxxmllBdKk0b4DmbdebQIOmtqQkEs2+gi/bcXzMZQG
         Xax90ZaGm40UU9BiwDMuWfcGy1D1lxzlG+BGjhN4vqZ3Ju869hO72QwCvY4MwkF/lT+8
         TJRvPZHqyp2CAzG38C2JnCosio3ruC7S54YGRs3KLaiMPIkTV3iyNFDlOzciHGrCp4br
         FVIg==
X-Gm-Message-State: AOJu0YyfKUD3z2OQ+TYwX8l/uV0ZCaAgfM+AayKG+8OS4+Xyo+o1d5zY
	LmRJAQNfLA8FTyCZ2Vxn8znc14eTYU05TKsvInZKeA68mVU9oycTiV6OMti8K6gSKqfg24py4Wi
	N
X-Gm-Gg: ASbGnctSHcRdUZGGclhl6+WpkqIDzL0fCWfN/WluUUjOD7lJxJehukC8H27OEBSE4xx
	AF5wJCj955T0bsq6mSm6f/BkH6pv23NQobY+9Nyu+fdOO8TYf8zop63tACJmDeQEZfW4Pr62rN5
	YnpUeSGC0+qvRypOZLFgpU85dkDws1//ZwnsFRXnvFYUaIE2rjPDOLe3Dv2n0WWJm0JIMEX/k81
	UlF8++XWyJptrdx1BscVO13F86tbzFsbcuihlY76LAd3AKZjUSkNFO9gT1jU3qP1jyT1cpNff7M
	aoig+mFmLSejpLGDj5NU8Il5S/wJqB6plWEYn9eCXgSq3hhkc9x7cPazbM+6oBWRJlILRM7PIdv
	oy1VSMVPYXH0Ys8QlREjj0A==
X-Google-Smtp-Source: AGHT+IGmEeXg/l3b3bWpGARZzOKIKWKfFpZrGYwKu52KA7dmHex8KO0bYr5nAnNxbjncE9ocjtW69A==
X-Received: by 2002:a05:6512:33d0:b0:545:169b:9b51 with SMTP id 2adb3069b0e04-5451dd9e135mr1285824e87.24.1739451809577;
        Thu, 13 Feb 2025 05:03:29 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v1 1/1] tools/ocaml: Fix oxenstored build warning
Date: Thu, 13 Feb 2025 13:03:17 +0000
Message-Id: <58a75da8a5e593c67817632622221af2984efc6d.1739451311.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1739451311.git.andrii.sultanov@cloud.com>
References: <cover.1739451311.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OCaml, in preparation for a renaming of the error string associated with
conversion failure in 'int_of_string' functions, started to issue this
warning:
```
File "process.ml", line 440, characters 13-28:
440 |   | (Failure "int_of_string")    -> reply_error "EINVAL"
                   ^^^^^^^^^^^^^^^
Warning 52 [fragile-literal-pattern]: Code should not depend on the actual values of
this constructor's arguments. They are only for information
and may change in future versions. (See manual section 11.5)
```

Deal with this at the source, and instead create our own stable
ConversionFailure exception that's raised on the None case in
'int_of_string_opt'.

'c_int_of_string' is safe and does not raise such exceptions.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 tools/ocaml/xenstored/Makefile     |  1 +
 tools/ocaml/xenstored/perms.ml     |  2 +-
 tools/ocaml/xenstored/poll.ml      |  2 +-
 tools/ocaml/xenstored/process.ml   | 18 +++++++++---------
 tools/ocaml/xenstored/utils.ml     | 10 ++++++++--
 tools/ocaml/xenstored/xenstored.ml | 16 ++++++++--------
 6 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 5e8210a906..c333394a34 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -54,6 +54,7 @@ OBJS = paths \
 	history \
 	parse_arg \
 	process \
+	poll \
 	xenstored
 
 INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
diff --git a/tools/ocaml/xenstored/perms.ml b/tools/ocaml/xenstored/perms.ml
index 14f8e334fe..2c4ee9e617 100644
--- a/tools/ocaml/xenstored/perms.ml
+++ b/tools/ocaml/xenstored/perms.ml
@@ -70,7 +70,7 @@ struct
 
   let perm_of_string s =
     let ty = permty_of_char s.[0]
-    and id = int_of_string (String.sub s 1 (String.length s - 1)) in
+    and id = Utils.int_of_string_exn (String.sub s 1 (String.length s - 1)) in
     (id, ty)
 
   let of_strings ls =
diff --git a/tools/ocaml/xenstored/poll.ml b/tools/ocaml/xenstored/poll.ml
index fefaa6e74c..f8571e4590 100644
--- a/tools/ocaml/xenstored/poll.ml
+++ b/tools/ocaml/xenstored/poll.ml
@@ -30,7 +30,7 @@ external set_fd_limit: int -> unit = "stub_set_fd_limit"
 let get_sys_fs_nr_open () =
   try
     let ch = open_in "/proc/sys/fs/nr_open" in
-    let v = int_of_string (input_line ch) in
+    let v = Utils.int_of_string_exn (input_line ch) in
     close_in_noerr ch; v
   with _ -> 1024 * 1024
 
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 432d66321c..cb4efc0fb5 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -229,7 +229,7 @@ let do_debug con t _domains cons data =
       Logging.xb_op ~tid:0 ~ty:Xenbus.Xb.Op.Debug ~con:"=======>" msg;
       None
     | "quota" :: domid :: _ ->
-      let domid = int_of_string domid in
+      let domid = Utils.int_of_string_exn domid in
       let quota = (Store.get_quota t.Transaction.store) in
       Some (Quota.to_string quota domid ^ "\000")
     | "watches" :: _ ->
@@ -242,7 +242,7 @@ let do_debug con t _domains cons data =
       History.trim ();
       Some "trimmed"
     | "txn" :: domid :: _ ->
-      let domid = int_of_string domid in
+      let domid = Utils.int_of_string_exn domid in
       let con = Connections.find_domain cons domid in
       let b = Buffer.create 128 in
       let () = con.transactions |> Hashtbl.iter @@ fun id tx ->
@@ -253,7 +253,7 @@ let do_debug con t _domains cons data =
       in
       Some (Buffer.contents b)
     | "xenbus" :: domid :: _ ->
-      let domid = int_of_string domid in
+      let domid = Utils.int_of_string_exn domid in
       let con = Connections.find_domain cons domid in
       let s = Printf.sprintf "xenbus: %s; overflow queue length: %d, can_input: %b, has_more_input: %b, has_old_output: %b, has_new_output: %b, has_more_work: %b. pending: %s"
           (Xenbus.Xb.debug con.xb)
@@ -267,7 +267,7 @@ let do_debug con t _domains cons data =
       in
       Some s
     | "mfn" :: domid :: _ ->
-      let domid = int_of_string domid in
+      let domid = Utils.int_of_string_exn domid in
       let con = Connections.find_domain cons domid in
       may (fun dom -> Printf.sprintf "%nd\000" (Domain.get_mfn dom)) (Connection.get_domain con)
     | _ -> None
@@ -340,7 +340,7 @@ let do_isintroduced con _t domains _cons data =
   then raise Define.Permission_denied;
   let domid =
     match (split None '\000' data) with
-    | domid :: _ -> int_of_string domid
+    | domid :: _ -> Utils.int_of_string_exn domid
     | _          -> raise Invalid_Cmd_Args
   in
   if domid = Define.domid_self || Domains.exist domains domid then "T\000" else "F\000"
@@ -437,7 +437,7 @@ let input_handle_error ~cons ~doms ~fct ~con ~t ~req =
   | Quota.Limit_reached          -> reply_error "EQUOTA"
   | Quota.Data_too_big           -> reply_error "E2BIG"
   | Quota.Transaction_opened     -> reply_error "EQUOTA"
-  | (Failure "int_of_string")    -> reply_error "EINVAL"
+  | Utils.ConversionFailed s     -> reply_error (Printf.sprintf "EINVAL: Could not convert '%s' to int" s)
   | Define.Unknown_operation     -> reply_error "ENOSYS"
 
 let write_access_log ~ty ~tid ~con ~data =
@@ -578,7 +578,7 @@ let do_introduce con t domains cons data =
   let (domid, mfn, remote_port) =
     match (split None '\000' data) with
     | domid :: mfn :: remote_port :: _ ->
-      int_of_string domid, Nativeint.of_string mfn, int_of_string remote_port
+      Utils.int_of_string_exn domid, Nativeint.of_string mfn, Utils.int_of_string_exn remote_port
     | _                         -> raise Invalid_Cmd_Args;
   in
   let dom =
@@ -604,7 +604,7 @@ let do_release con t domains cons data =
   then raise Define.Permission_denied;
   let domid =
     match (split None '\000' data) with
-    | [domid;""] -> int_of_string domid
+    | [domid;""] -> Utils.int_of_string_exn domid
     | _          -> raise Invalid_Cmd_Args
   in
   let fire_spec_watches = Domains.exist domains domid in
@@ -620,7 +620,7 @@ let do_resume con _t domains _cons data =
   then raise Define.Permission_denied;
   let domid =
     match (split None '\000' data) with
-    | domid :: _ -> int_of_string domid
+    | domid :: _ -> Utils.int_of_string_exn domid
     | _          -> raise Invalid_Cmd_Args
   in
   if Domains.exist domains domid
diff --git a/tools/ocaml/xenstored/utils.ml b/tools/ocaml/xenstored/utils.ml
index 48d84ef7d3..7a556bce75 100644
--- a/tools/ocaml/xenstored/utils.ml
+++ b/tools/ocaml/xenstored/utils.ml
@@ -53,8 +53,14 @@ let hexify s =
     ) s;
   Bytes.unsafe_to_string hs
 
+exception ConversionFailed of string
+let int_of_string_exn s =
+  match int_of_string_opt s with
+  | Some x -> x
+  | None -> raise (ConversionFailed s)
+
 let unhexify hs =
-  let char_of_hexseq seq0 seq1 = Char.chr (int_of_string (sprintf "0x%c%c" seq0 seq1)) in
+  let char_of_hexseq seq0 seq1 = Char.chr (int_of_string_exn (sprintf "0x%c%c" seq0 seq1)) in
   let b = Bytes.create (String.length hs / 2) in
   for i = 0 to Bytes.length b - 1
   do
@@ -86,7 +92,7 @@ let read_file_single_integer filename =
   let buf = Bytes.make 20 '\000' in
   let sz = Unix.read fd buf 0 20 in
   Unix.close fd;
-  int_of_string (Bytes.sub_string buf 0 sz)
+  int_of_string_exn (Bytes.sub_string buf 0 sz)
 
 (* @path may be guest data and needs its length validating.  @connection_path
  * is generated locally in xenstored and always of the form "/local/domain/$N/" *)
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 1aaa3e995e..84dee622ea 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -167,20 +167,20 @@ module DB = struct
                					   e.g. a RO socket from a previous version: ignore it *)
             global_f ~rw
           | "evtchn-dev" :: fd :: domexc_port :: [] ->
-            evtchn_f ~fd:(int_of_string fd)
-              ~domexc_port:(int_of_string domexc_port)
+            evtchn_f ~fd:(Utils.int_of_string_exn fd)
+              ~domexc_port:(Utils.int_of_string_exn domexc_port)
           | "socket" :: fd :: [] ->
-            socket_f ~fd:(int_of_string fd)
+            socket_f ~fd:(Utils.int_of_string_exn fd)
           | "dom" :: domid :: mfn :: remote_port :: rest ->
             let local_port = match rest with
               | [] -> None (* backward compat: old version didn't have it *)
-              | local_port :: _ -> Some (int_of_string local_port) in
+              | local_port :: _ -> Some (Utils.int_of_string_exn local_port) in
             domain_f ?local_port
-              ~remote_port:(int_of_string remote_port)
-              (int_of_string domid)
+              ~remote_port:(Utils.int_of_string_exn remote_port)
+              (Utils.int_of_string_exn domid)
               (Nativeint.of_string mfn)
           | "watch" :: domid :: path :: token :: [] ->
-            watch_f (int_of_string domid)
+            watch_f (Utils.int_of_string_exn domid)
               (unhexify path) (unhexify token)
           | "store" :: path :: perms :: value :: [] ->
             store_f (getpath path)
@@ -214,7 +214,7 @@ module DB = struct
     in
     let global_f ~rw =
       let get_listen_sock sockfd =
-        let fd = sockfd |> int_of_string |> Utils.FD.of_int in
+        let fd = sockfd |> Utils.int_of_string_exn |> Utils.FD.of_int in
         Unix.listen fd 1;
         Some fd
       in
-- 
2.39.5


