Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF8437ADCE
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125899.236992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWma-00016j-Fn; Tue, 11 May 2021 18:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125899.236992; Tue, 11 May 2021 18:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWma-00013j-C1; Tue, 11 May 2021 18:07:00 +0000
Received: by outflank-mailman (input) for mailman id 125899;
 Tue, 11 May 2021 18:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWmY-0000hb-Pl
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:06:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86efdff2-a848-4969-b83b-8343218ced3c;
 Tue, 11 May 2021 18:06:51 +0000 (UTC)
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
X-Inumbo-ID: 86efdff2-a848-4969-b83b-8343218ced3c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kIHSglxPAwnvzoL5IzOBULzsMXsyyLvM7qOksEaxYCM=;
  b=YMNC1G1Ysy5r2XsAc+Nh97kZq5avg42cvFSB2o+uqSu2ctcMO1WAHhEd
   /v+llB8ozIWL0M2BdOrhxfD5CFA4sfeQYjdObe0lxOAr/xpiGo1xXGXL+
   eyXuHy7BnHCE92yAvUV59MPqCFl1JwFNdUvlZxdwZWdtfMhZg3vAtl9hi
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cl8K5cFZfpjF/NnbS6sFm8sXJGgjZmf4SlKT6+vvWFjC+wuWBU94DAFj/WtLDoNfEZ/Z+joHpX
 n7BMXmNtI+c3UwGTuwnL4ezcOlnhqqrRLoonqp5cj/SKOwoUv+kOZqmRVEm0cAWODUulqKo+K8
 JlyABlGXRh1B0WrP6UA5J/i2aizOZFdzMzeurbL6bpWaGlGHYu4DVjg8vKRRk+g30sCgPLqfth
 8mzZx4cNy4oppVEFtRUl0WywzJkzANjpVpB5PB3utkNVzXtne7WELk7z9ShoDWD/NjcV7/AMiK
 Qys=
X-SBRS: 5.1
X-MesageID: 43579247
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9/6l269oOnbNBBwYLGJuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43579247"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 04/17] tools/ocaml/xenstored: implement the live migration binary format
Date: Tue, 11 May 2021 19:05:17 +0100
Message-ID: <1203d68f34f55b675e64df228c7d45405e1304a8.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is implemented by C xenstored as live update dump format.
oxenstored already has its own (text-based) dump format, but for
compatibility implement one compatible with C xenstored.

This will also be useful in the future for non-cooperative guest live migration.

docs/designs/xenstore-migration.md documents the format

For now this always dumps integers in big endian order, because even old
versions of OCaml have support for that.
The binary format supports both little and big endian orders, so this
should be compatible.

To dump in little endian or native endian order we would
require OCaml 4.08+.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/disk.ml | 318 ++++++++++++++++++++++++++++++++++
 1 file changed, 318 insertions(+)

diff --git a/tools/ocaml/xenstored/disk.ml b/tools/ocaml/xenstored/disk.ml
index 4739967b61..595fdab54a 100644
--- a/tools/ocaml/xenstored/disk.ml
+++ b/tools/ocaml/xenstored/disk.ml
@@ -155,3 +155,321 @@ let write store =
 		Unix.rename tfile xs_daemon_database
 	with exc ->
 		error "caught exn %s" (Printexc.to_string exc)
+
+	module BinaryOut = struct
+		let version = 0x1
+		let endian = 1
+		let padding = String.make 7 '\x00'
+
+		let write_header ch =
+			(* for testing endian order *)
+			output_binary_int ch 0x78656e73;
+			output_binary_int ch 0x746f7265;
+			output_binary_int ch version;
+			output_binary_int ch endian;
+			ch
+
+		let w8 = output_char
+		let w16 ch i =
+			assert (i >= 0 && i lsr 16 = 0);
+			output_byte ch (i lsr 8);
+			output_byte ch i
+
+		let w32 ch v =
+			assert (v >= 0 && v <= 0xFFFF_FFFF);
+			output_binary_int ch v
+
+		let pos = pos_out
+		let wpad ch =
+			let padto = 8 in
+			let padby = (padto - pos ch mod padto) mod padto in
+			if padby > 0 then
+				output_substring ch padding 0 padby
+
+		let wstring = output_string
+	end
+
+	module BinaryIn = struct
+		type t = in_channel
+
+		let read_header t =
+			let h = Bytes.make 8 '\x00' in
+			really_input t h 0 (Bytes.length h);
+			let ver = input_binary_int t in
+			let endian = input_binary_int t in
+			if Bytes.to_string h <> "xenstore" then
+				failwith "Header doesn't begin with 'xenstore'";
+			if ver <> BinaryOut.version then
+				failwith "Incompatible version";
+			if endian <> BinaryOut.endian then
+				failwith "Incompatible endianness"
+
+		let r8 = input_char
+
+		let r16 t = 
+			let r0 = input_byte t in
+			let r1 = input_byte t  in
+			(r0 lsl 8) lor r1
+
+		let r32 t =
+			(* read unsigned 32-bit int *)
+			let r = input_binary_int t land 0xFFFF_FFFF in
+			assert (r >= 0);
+			r
+
+		let rstring = really_input_string
+
+		let rpad t =
+			let padto = 8 in
+			let padby = (padto - pos_in t mod padto) mod padto in
+			if padby > 0 then
+				ignore (really_input_string t padby)
+	end
+
+module FD : sig
+     type t = Unix.file_descr
+     val of_int: int -> t
+     val to_int : t -> int
+end = struct
+    type t = Unix.file_descr
+    (* This is like Obj.magic but just for these types,
+       and relies on Unix.file_descr = int *)
+    external to_int : t -> int = "%identity"
+    external of_int : int -> t = "%identity"
+end
+
+module LiveRecord = struct
+	(* See docs/designs/xenstore-migration.md for binary format *)
+	module Type : sig
+		type t = private int
+		val end_ : t
+		val global_data : t
+		val connection_data : t
+		val watch_data : t
+		val transaction_data : t
+		val node_data: t
+	end = struct
+		type t = int
+		let end_ = 0x0
+		let global_data = 0x01
+		let connection_data = 0x02
+		let watch_data = 0x03
+		let transaction_data = 0x04
+		let node_data = 0x05
+	end
+
+	module I = BinaryIn
+	module O = BinaryOut
+
+	let write_expect msg expected actual =
+		if expected <> actual then
+			let m = Printf.sprintf "expected %d <> %d: %s" expected actual msg in
+			invalid_arg m
+
+	let write_record t (typ: Type.t) len f =
+		assert (O.pos t mod 8 = 0);
+		O.w32 t (typ :> int);
+		O.w32 t len;
+		let p0 = O.pos t in
+		f t;
+		let p1 = O.pos t in
+		write_expect "position and length" len (p1-p0);
+		O.wpad t
+
+	let write_end t =
+		write_record t Type.end_ 0 ignore
+
+	let read_expect t msg expected actual =
+		if expected <> actual then
+			let pos = pos_in t in
+			let m = Printf.sprintf "expected %d <> %d at ~%d: %s" expected actual pos msg in
+			invalid_arg m
+
+	let read_end t ~len f =
+		read_expect t "end" 0 len;
+		f ()
+
+	let write_global_data t ~rw_sock =
+		write_record t Type.global_data 8 @@ fun b ->
+		O.w32 b (FD.to_int rw_sock);
+		O.w32 b (-1)
+
+	let read_global_data t ~len f =
+		read_expect t "global_data" 8 len;
+		let rw_sock = FD.of_int (I.r32 t) in
+		let _ = FD.of_int (I.r32 t) in
+		f ~rw_sock
+
+	let conn_shared_ring = 0x0
+	let conn_socket = 0x1
+	let domid_invalid = 0x7FF4
+
+	(* oxenstored doesn't support readonly sockets yet *)
+	let flags_connection_readonly = 0x1l
+
+	type dom = { id: int; target: int; remote_port: int }
+	type conn = Socket of Unix.file_descr | Domain of dom
+
+	let write_connection_data t ~conid ~conn xb_pktin xb_partialout xb_pktout =
+		let in_data_len = Buffer.length xb_pktin in
+		let out_resp_len = String.length xb_partialout in
+		let out_data_len = Buffer.length xb_pktout in
+		let data_len = in_data_len + out_data_len in
+
+		write_record t Type.connection_data (32 + data_len) @@ fun b ->
+		assert (conid > 0);
+		O.w32 b conid;
+		O.w32 b (match conn with
+		| Socket _ -> conn_socket
+		| Domain _ -> conn_shared_ring
+		);
+		let flags = 0x0 in
+		O.w32 b flags;
+
+		(match conn with
+		| Socket fd ->
+			O.w32 b (FD.to_int fd);
+			O.w32 b 0 (* pad *)
+		| Domain dom ->
+			O.w16 b dom.id;
+			O.w16 b dom.target;
+			O.w32 b dom.remote_port
+			);
+
+		O.w32 b in_data_len;
+		O.w32 b out_resp_len;
+		O.w32 b out_data_len;
+		Buffer.output_buffer b xb_pktin;
+		O.wstring b xb_partialout;
+		Buffer.output_buffer b xb_pktout
+
+	let read_connection_data t ~len f =
+		let conid = I.r32 t in
+		assert (conid > 0);
+		let kind = I.r32 t in
+		let flags = I.r32 t in
+		read_expect t "flags" 0 flags;
+		let conn = (match kind with
+		| x when x = conn_socket ->
+			let fd = FD.of_int (I.r32 t) in
+			I.r32 t |> ignore;
+			Socket fd
+		| x when x = conn_shared_ring ->
+			let id = I.r16 t in
+			let target = I.r16 t in
+			let remote_port = I.r32 t in
+			Domain {id; target; remote_port }
+		| x ->
+			invalid_arg (Printf.sprintf "Unknown connection kind %x" x)
+		) in
+		let in_data_len = I.r32 t in
+		let out_resp_len = I.r32 t in
+		let out_data_len = I.r32 t in
+		let in_data = really_input_string t in_data_len in
+		let out_data = really_input_string t out_data_len in
+		f ~conid ~conn ~in_data ~out_data ~out_resp_len
+
+
+	let write_watch_data t ~conid ~wpath ~token =
+		let wpath_len = String.length wpath in
+		let token_len = String.length token in
+
+		write_record t Type.watch_data (12+wpath_len+token_len) @@ fun b ->
+		O.w32 b conid;
+		O.w32 b (String.length wpath);
+		O.w32 b (String.length token);
+		O.wstring b wpath;
+		O.wstring b token
+
+	let read_watch_data t ~len f =
+		let conid = I.r32 t in
+		let wpathlen = I.r32 t in
+		let tokenlen = I.r32 t in
+		let wpath = I.rstring t wpathlen in
+		let token = I.rstring t tokenlen in
+		f ~conid ~wpath ~token
+
+	let write_transaction_data t ~conid ~txid =
+		write_record t Type.transaction_data 8 @@ fun b ->
+		O.w32 b conid;
+		O.w32 b txid
+
+	let read_transaction_data t ~len f =
+		read_expect t "transaction" 8 len;
+		let conid = I.r32 t in
+		let txid = I.r32 t in
+		f ~conid ~txid
+
+	type access = R | W | RW | Del
+
+	let write_node_data t ~txidaccess ~path ~value ~perms =
+		let path_len = String.length path in
+		let value_len = String.length value in
+		let perms = Perms.Node.acls perms in
+		let len = 24 + (List.length perms)*4 + path_len + value_len in
+
+		write_record t Type.node_data len @@ fun b ->
+		O.w32 b (match txidaccess with None -> 0 | Some (conid, _, _) -> conid);
+		O.w32 b (match txidaccess with None -> 0 | Some (_, txid, _) -> txid);
+		O.w32 b path_len;
+		O.w32 b value_len;
+		O.w32 b (match txidaccess with
+		| None -> 0x0
+		| Some (_, _, Del) -> 0x0
+		| Some (_, _, R) -> 0x1
+		| Some (_, _, W) -> 0x2
+		| Some (_, _, RW) -> 0x3
+		);
+		O.w32 b (List.length perms);
+		List.iter (fun (domid, permty) ->
+			O.w8 b (Perms.char_of_permty permty);
+			O.w8 b '\x00';
+			O.w16 b domid;
+		) perms;
+		O.wstring b path;
+		O.wstring b value
+
+	let read_node_data t ~len f =
+		let conid = I.r32 t in
+		let txid = I.r32 t in
+		let path_len = I.r32 t in
+		let value_len = I.r32 t in
+		let txaccess = match conid, I.r32 t with
+		| 0, _ -> None
+		| _, 0 -> Some (conid, txid, Del)
+		| _, 1 -> Some (conid, txid, R)
+		| _, 2 -> Some (conid, txid, W)
+		| _, 3 -> Some (conid, txid, RW)
+		| _ -> invalid_arg "invalid access flag"
+		in
+		let a = Array.init (I.r32 t) (fun _ ->
+					let perm = Perms.permty_of_char (I.r8 t) in
+					I.r8 t |> ignore;
+					let domid = I.r16 t in
+					domid, perm
+		) in
+		let perms = match Array.to_list a with
+		| [] -> invalid_arg "Permission list cannot be empty";
+		| (owner, other) :: acls ->
+			Perms.Node.create owner other acls
+		in
+		let path = I.rstring t path_len in
+		let value = I.rstring t value_len in
+		f ~txaccess ~perms ~path ~value
+
+	let read_record t ~on_end ~on_global_data ~on_connection_data ~on_watch_data ~on_transaction_data ~on_node_data =
+		I.rpad t; (* if we fail to process a record (e.g. callback raises, ensure we resume at right place *)
+		let typ = I.r32 t in
+		let len = I.r32 t in
+		let p0 = pos_in t in
+		(match typ with
+		| x when x = (Type.end_ :> int) -> read_end t ~len on_end
+		| x when x = (Type.global_data :> int) -> read_global_data t ~len on_global_data
+		| x when x = (Type.connection_data :> int) -> read_connection_data t ~len on_connection_data
+		| x when x = (Type.watch_data :> int) -> read_watch_data t ~len on_watch_data
+		| x when x = (Type.transaction_data :> int) -> read_transaction_data t ~len on_transaction_data
+		| x when x = (Type.node_data :> int) -> read_node_data t ~len on_node_data
+		| x -> failwith (Printf.sprintf "Unknown record type: %x" x));
+		let p1 = pos_in t in
+		read_expect t "record length" len (p1-p0)
+end
-- 
2.25.1


