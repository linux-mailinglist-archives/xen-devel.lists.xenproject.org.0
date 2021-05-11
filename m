Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A337ADD2
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125902.237028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmm-00029N-ID; Tue, 11 May 2021 18:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125902.237028; Tue, 11 May 2021 18:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmm-00026F-Cv; Tue, 11 May 2021 18:07:12 +0000
Received: by outflank-mailman (input) for mailman id 125902;
 Tue, 11 May 2021 18:07:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWmk-0001nY-Ej
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:07:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6ea6f30-41ac-4d6b-8f96-044bd00ac273;
 Tue, 11 May 2021 18:07:07 +0000 (UTC)
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
X-Inumbo-ID: f6ea6f30-41ac-4d6b-8f96-044bd00ac273
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7RVILLnjZIWgrnPBH52virpLPiH5emkE0QnosYt8EPU=;
  b=TKAvB5HF3vTRtiVKe2bIvqSPf0WnQwumqf6Hswy6V553XaUKNenbZjy8
   H4FBtYmY1fDJ8HXqD6EKlnUphSagHP6+FJTifZrFI62AJLJUNrAuf2mWK
   o8+Jli/CleY4dmQAYneCqrhONIaTdWuYaHG2N8Kybwg+6e5CHUkQwCAJ2
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LOuE82vKbi49458eLw7TL0Ke43U6+ZNj/8Bqz/NrLuYslddHdwtEr9X2Jjrf/Kf3vLPTLc/vcV
 VSw/S1egbUjyZhq/UIFA0seJ8U+xmVH9wzjBAY+85JFcU1gfaGSwRdgQitwXgfvLsmeSoc6a5O
 oonX0QBAkMQOf/OsfTDWRRALN+mTeCMn8eppPeSCKQVdfa8VAVsNWJKWzb3g+1VyO3cmZIhfq3
 PKouk2YEZW4RkXOyth9FFXylEVhbBjvMdcXzJz0vTPT63x2KPYzxTfAPrSsncAEV442IOcINMg
 2tM=
X-SBRS: 5.1
X-MesageID: 45101007
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4ccXnqyt8H0/fsNrTgiqKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="45101007"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 08/17] Add structured fuzzing unit test
Date: Tue, 11 May 2021 19:05:21 +0100
Message-ID: <a9f057131b75e1bd2dcb49c795630ab5875b7f76.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Based on ideas from qcstm, implemented using Crowbar.

Quickcheck-style property tests that uses AFL for quickly
exploring various values that trigger bugs in the code.

This is structured/guided fuzzing: we read an arbitrary random number,
and use it to generate some valid looking xenstore trees and commands.

There are 2 instances of xenstored: one that runs the live update
command, and one that ignores it.
Live-update should be a no-op wrt to xenstored state: this is our
quicheck property.

When any mismatch is identified it prints the input
(tree+xenstore commands), and a diff of the output:
the internal xenstore tree state + quotas.

afl-cmin can be used to further minimize the testcase.
Crowbar (AFL persistent mode Quickcheck integration) is used due to
speed: this very easily gets us a multi-core parallelizable test.

Currently the Transaction tests fail, which is why live updates with
active transactions are rejected. These tests are commented out.

There is also some incomplete code here that attempts to find functional
bugs in xenstored by interpeting xenstore commands in a simpler way and
comparing states.

This will build the fuzzer and run it single core for sanity test:
make container-fuzz-sanity-test

This will run it multicore (requires all dependencies installed on the host,
including ocaml-bun, the multi-core AFL runner):
make dune-oxenstored-fuzz

'make check' will also run the fuzzer but with input supplied by OCaml's
random number generator, and for a very small number of iterations
(few thousand). This doesn't require any external tools (no AFL, bun).

On failure it prints a base64 encoding of the fuzzer state that can be
used to reproduce the failure instantly, which is very useful for
debugging: one can iterate on the failed fuzzer state until it is fixed,
and then run the fuzzer again to find next failure.

The unit tests here require OCaml 4.06, but the rest of the codebase
doesn't (yet).

See https://lore.kernel.org/xen-devel/cbb2742191e9c1303fdfd95feef4d829ecf33a0d.camel@citrix.com/
for previous discussion of OCaml version.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/Makefile                          |  19 +
 tools/ocaml/xenstored/process.ml              |  12 +-
 tools/ocaml/xenstored/store.ml                |   1 +
 tools/ocaml/xenstored/test/dune               |  12 +
 tools/ocaml/xenstored/test/generator.ml       | 189 +++++
 tools/ocaml/xenstored/test/model.ml           | 253 ++++++
 tools/ocaml/xenstored/test/old/arbitrary.ml   | 261 +++++++
 tools/ocaml/xenstored/test/old/gen_paths.ml   |  66 ++
 .../xenstored/test/old/xenstored_test.ml      | 527 +++++++++++++
 tools/ocaml/xenstored/test/pathtree.ml        |  40 +
 tools/ocaml/xenstored/test/testable.ml        | 379 +++++++++
 tools/ocaml/xenstored/test/types.ml           | 437 +++++++++++
 tools/ocaml/xenstored/test/xenstored_test.ml  | 149 +++-
 tools/ocaml/xenstored/test/xs_protocol.ml     | 733 ++++++++++++++++++
 tools/ocaml/xenstored/transaction.ml          | 119 ++-
 15 files changed, 3188 insertions(+), 9 deletions(-)
 create mode 100644 tools/ocaml/xenstored/test/generator.ml
 create mode 100644 tools/ocaml/xenstored/test/model.ml
 create mode 100644 tools/ocaml/xenstored/test/old/arbitrary.ml
 create mode 100644 tools/ocaml/xenstored/test/old/gen_paths.ml
 create mode 100644 tools/ocaml/xenstored/test/old/xenstored_test.ml
 create mode 100644 tools/ocaml/xenstored/test/pathtree.ml
 create mode 100644 tools/ocaml/xenstored/test/testable.ml
 create mode 100644 tools/ocaml/xenstored/test/types.ml
 create mode 100644 tools/ocaml/xenstored/test/xs_protocol.ml

diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index 53dd0a0f0d..de375820a3 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -67,3 +67,22 @@ dune-syntax-check: dune-pre
 .PHONY: build-oxenstored-dune
 dune-build-oxenstored: dune-pre
 	LD_LIBRARY_PATH=$(LIBRARY_PATH) LIBRARY_PATH=$(LIBRARY_PATH) C_INCLUDE_PATH=$(C_INCLUDE_PATH) dune build --profile=release @all
+
+.PHONY: oxenstored-fuzz1 oxenstored-fuzz
+dune-oxenstored-fuzz: dune-pre
+	# --force is needed, otherwise it would cache a successful run
+	sh -c '. /etc/profile && C_INCLUDE_PATH=$(C_INCLUDE_PATH) dune build --profile=release --no-buffer --force @fuzz'
+
+dune-oxenstored-fuzz1: dune-pre
+	sh -c '. /etc/profile && C_INCLUDE_PATH=$(C_INCLUDE_PATH) dune build --profile=release --no-buffer --force @fuzz1'
+
+.PHONY: container-fuzz
+container-fuzz-sanity-test:
+	dune clean
+	podman build -t oxenstored-fuzz .
+	# if UID is 0 then we get EPERM on setrlimit from inside the container
+	# use containerize script which ensures that uid is not 0
+	# (podman/docker run would get us a uid of 0)
+	# Only do a sanity test with 1 core, actually doing fuzzing inside a container is a bad idea
+	# due to FUSE overlayfs overhead
+	CONTAINER=oxenstored-fuzz CONTAINER_NO_PULL=1 DOCKER_CMD=podman ../../automation/scripts/containerize make -C tools/ocaml dune-oxenstored-fuzz1
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index d573c88685..13b7153536 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -169,7 +169,7 @@ let parse_live_update args =
 				]
 			(fun x -> raise (Arg.Bad x))
 			"live-update -s" ;
-			debug "Live update process queued" ;
+			(* debug "Live update process queued" ; *)
 				{!state with deadline = Unix.gettimeofday () +. float !timeout
 				; force= !force; pending= true})
 		| _ ->
@@ -449,6 +449,8 @@ let transaction_replay c t doms cons =
 		(fun () ->
 			try
 				Logging.start_transaction ~con ~tid;
+				if t.must_fail then
+					raise Transaction_again;
 				List.iter (perform_exn ~wlog:true replay_t) (Transaction.get_operations t); (* May throw EAGAIN *)
 
 				Logging.end_transaction ~con ~tid;
@@ -550,7 +552,7 @@ let do_introduce con t domains cons data =
 		| _                         -> raise Invalid_Cmd_Args;
 		in
 	let dom =
-		if Domains.exist domains domid then
+		if Domains.exist domains domid then begin
 			let edom = Domains.find domains domid in
 			if (Domain.get_mfn edom) = mfn && (Connections.find_domain cons domid) != con then begin
 				(* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
@@ -558,12 +560,16 @@ let do_introduce con t domains cons data =
 				Domain.bind_interdomain edom;
 			end;
 			edom
+		end
 		else try
 			let ndom = Domains.create domains domid mfn port in
 			Connections.add_domain cons ndom;
 			Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path.introduce_domain;
 			ndom
-		with _ -> raise Invalid_Cmd_Args
+		with e ->
+			let bt = Printexc.get_backtrace () in
+			 Logging.debug "process" "do_introduce: %s (%s)" (Printexc.to_string e) bt;
+			 raise Invalid_Cmd_Args
 	in
 	if (Domain.get_remote_port dom) <> port || (Domain.get_mfn dom) <> mfn then
 		raise Domain_not_match
diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index 20e67b1427..85ca3daae9 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -133,6 +133,7 @@ let of_path_and_name path name =
 	| _ -> path @ [name]
 
 let create path connection_path =
+	Logging.debug "store" "Path.create %S %S" path connection_path;
 	of_string (Utils.path_validate path connection_path)
 
 let to_string t =
diff --git a/tools/ocaml/xenstored/test/dune b/tools/ocaml/xenstored/test/dune
index 2a3eb2b7df..cd62926be9 100644
--- a/tools/ocaml/xenstored/test/dune
+++ b/tools/ocaml/xenstored/test/dune
@@ -9,3 +9,15 @@
  (flags (:standard -w -52))
  ;;(action (run %{test} -v --seed 364172147))
  (libraries unix xen.bus xen.mmap xenstubs crowbar xen.store fmt fmt.tty))
+
+(rule
+(alias fuzz1)
+(deps xenstored_test.exe)
+(action (run bun -svv ./xenstored_test.exe))
+)
+
+(rule
+(alias fuzz)
+(deps xenstored_test.exe)
+(action (run bun --no-kill ./xenstored_test.exe))
+)
diff --git a/tools/ocaml/xenstored/test/generator.ml b/tools/ocaml/xenstored/test/generator.ml
new file mode 100644
index 0000000000..6f7dc374f8
--- /dev/null
+++ b/tools/ocaml/xenstored/test/generator.ml
@@ -0,0 +1,189 @@
+module type S = sig
+  type cmd
+
+  type state
+
+  val init_state : state
+
+  val next_state : cmd -> state -> state
+
+  val precond : cmd -> state -> bool
+end
+
+module IntSet = Set.Make (Int)
+module IntMap = Map.Make (Int)
+
+module Pickable (K : sig
+  include Map.OrderedType
+
+  include Hashtbl.HashedType with type t := t
+end) =
+struct
+  (* allow picking a random value from a changing map keys.
+     Store a random value (hash of key) as first element of key,
+     then use find_first to pick an item related to the random element if any.
+     This should be more efficient than converting to a list and using List.nth to pick
+  *)
+  module Key = struct
+    type t = int * K.t
+
+    let of_key k = (K.hash k, k)
+
+    let compare (h, k) (h', k') =
+      match Int.compare h h' with 0 -> K.compare k k' | r -> r
+  end
+
+  module M = Map.Make (Key)
+
+  type 'a t = 'a M.t
+
+  let empty = M.empty
+
+  let singleton k v = M.singleton (Key.of_key k) v
+
+  let add k v m = M.add (Key.of_key k) v m
+
+  let find_opt k m = M.find_opt (Key.of_key k) m
+
+  let mem k m = M.mem (Key.of_key k) m
+
+  let remove k m = M.remove (Key.of_key k) m
+
+  let merge f m m' = M.merge f m m'
+
+  let is_empty = M.is_empty
+
+  let update k f m = M.update (Key.of_key k) f m
+
+  let choose rnd m =
+    (* function needs to be monotonic, so the hash has to be part of the key *)
+    let gte (keyhash, _) = Int.compare keyhash rnd >= 0 in
+    match M.find_first_opt gte m with
+    | Some ((_, k), _) ->
+        k
+    | None ->
+        snd @@ fst @@ M.min_binding m
+end
+
+module PickablePath = Pickable (struct
+  type t = string
+
+  let hash = Hashtbl.hash
+
+  let compare = String.compare
+
+  let equal = String.equal
+end)
+
+module PickableInt = Pickable (struct
+  include Int
+
+  let hash = Hashtbl.hash
+end)
+
+module PathObserver = struct
+  type state =
+    { seen: unit PickablePath.t
+    ; dom_txs: unit PickableInt.t PickableInt.t
+    ; next_tid: int }
+
+  let choose_path t rnd = PickablePath.choose rnd t.seen
+
+  let choose_domid t rnd = PickableInt.choose rnd t.dom_txs
+
+  let choose_txid_opt t domid rnd =
+    match PickableInt.find_opt domid t.dom_txs with
+    | None ->
+        0
+    | Some txs ->
+        if PickableInt.is_empty txs then 0 else PickableInt.choose rnd txs
+
+  let new_domid domid = PickableInt.singleton domid PickableInt.empty
+
+  let both _ _ _ = Some ()
+
+  let merge_txs _ s s' =
+    let s = Option.value ~default:PickableInt.empty s in
+    let s' = Option.value ~default:PickableInt.empty s' in
+    Some (PickableInt.merge both s s')
+
+  let init_state =
+    {seen= PickablePath.singleton "/" (); dom_txs= new_domid 0; next_tid= 1}
+
+  let with_path path t = {t with seen= PickablePath.add path () t.seen}
+
+  let split0 str =
+    match Process.split (Some 2) '\000' str with
+    | [x; y] ->
+        (x, y)
+    | _ ->
+        invalid_arg str
+
+  let next_state (domid, cmd) t =
+    let open Xenbus.Xb in
+    match cmd with
+    | {Xenbus.Packet.ty= Transaction_start; _} ->
+        let update = function
+          | None ->
+              None
+          | Some txs ->
+              Some (PickableInt.add t.next_tid () txs)
+        in
+        { t with
+          dom_txs= PickableInt.update domid update t.dom_txs
+        ; next_tid= t.next_tid + 1 }
+    | { Xenbus.Packet.ty=
+          Op.(
+            ( Rm
+            | Read
+            | Directory
+            | Getperms
+            | Setperms
+            | Unwatch
+            | Reset_watches
+            | Getdomainpath
+            | Isintroduced
+            | Set_target
+            | Debug ))
+      ; _ } ->
+        t
+    | {Xenbus.Packet.ty= Op.(Watchevent | Error | Resume | Invalid); _} ->
+        assert false
+    | {Xenbus.Packet.ty= Op.Transaction_end; tid; _} ->
+        let update = function
+          | None ->
+              None
+          | Some txs ->
+              Some (PickableInt.remove tid txs)
+        in
+        {t with dom_txs= PickableInt.update domid update t.dom_txs}
+    | {Xenbus.Packet.ty= Op.(Write | Mkdir | Watch); data} ->
+        let path, _ = split0 data in
+        with_path path t
+    | {Xenbus.Packet.ty= Introduce; data} ->
+        let domidstr, _ = split0 data in
+        let domid' = int_of_string domidstr in
+        if domid = 0 then
+          { t with
+            dom_txs= PickableInt.merge merge_txs t.dom_txs (new_domid domid') }
+        else t
+    | {Xenbus.Packet.ty= Release; data} ->
+        let domidstr, _ = split0 data in
+        let domid = int_of_string domidstr in
+        {t with dom_txs= PickableInt.remove domid t.dom_txs}
+
+  let precond (domid, cmd) t =
+    ( match PickableInt.find_opt domid t.dom_txs with
+    | None ->
+        false
+    | Some txs ->
+        let tid = cmd.Xenbus.Packet.tid in
+        tid = 0 || PickableInt.mem tid txs )
+    && Testable.Command.precond cmd t
+
+  let pp =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "domid" fst Fmt.int
+      ; Dump.field "cmd" snd Testable.Command.pp_dump ]
+end
diff --git a/tools/ocaml/xenstored/test/model.ml b/tools/ocaml/xenstored/test/model.ml
new file mode 100644
index 0000000000..4b5ae462fb
--- /dev/null
+++ b/tools/ocaml/xenstored/test/model.ml
@@ -0,0 +1,253 @@
+open Xs_protocol
+
+(* Conventions:
+Aim for correctness, use simplest data structure that unambigously represents state.
+
+E.g.:
+* a list when duplicates are allowed, order matters and the empty list is a valid value
+* a set when elements appearing multiple time have the same semantic meaning as them appearing once,
+and the order is unspecified or sorted
+* a map when a single key is mapped to a single value, and order is unspecified or sorted
+
+When we must retain the original order for queries, but semantically it doesn't matter
+then store both a canonical representation and the original order.
+
+*)
+
+let rec string_for_all_from s f pos =
+  pos = String.length s || (f s.[pos] && (string_for_all_from s f @@ (pos + 1)))
+
+type error = [`Msg of string]
+
+module Path : sig
+  (** a valid xenstore path *)
+  type t
+
+  val root : t
+
+  val of_string : string -> t option
+  (** [of_string path] parses [path].
+      @return [None] if the path is syntactically not valid *)
+
+  val to_string : t -> string
+  (** [to_string path] converts path to string. *)
+
+  (** [is_child parent child] returns true if [child] is a child of [parent].
+      A path is considered to be a child of itself *)
+  val is_child : t -> t -> bool
+end = struct
+  type t = string list
+
+  let is_valid_char = function
+    | '0' .. '9' | 'a' .. 'z' | 'A' .. 'Z' | '-' | '/' | '_' | '@' ->
+        true
+    | _ ->
+        false
+
+  let root = [""]
+
+  let nonempty s = String.length s > 0
+
+  let of_string s =
+    let n = String.length s in
+    if
+      n > 0 (* empty path is not permitted *)
+      && n < 1024
+      (* paths cannot exceed 1024 chars, FIXME: relative vs absolute *)
+      && string_for_all_from s is_valid_char 0
+    then
+      match String.split_on_char '/' s with
+      | [] ->
+          assert false
+      | [""; ""] ->
+          Some root
+      | _ :: tl as path ->
+          if List.for_all nonempty tl then Some path else None
+    else None
+
+  let to_string = String.concat "/"
+
+  let rec is_child p c =
+    match (p, c) with
+    | [], [] ->
+        true (* a path is a child of itself *)
+    | [], _ ->
+        true
+    | phd :: ptl, chd :: ctl when phd = chd ->
+        is_child ptl ctl
+    | _ ->
+        false
+end
+
+module PathMap = Map.Make (String)
+module DomidSet = Set.Make (Int)
+module DomidMap = Map.Make (Int)
+
+let preserve_order = ref true
+
+module CanonicalACL = struct
+  module RW = struct
+    type t = {read: bool; write: bool}
+
+    let of_perm = function
+      | ACL.NONE ->
+          {read= false; write= false}
+      | ACL.WRITE ->
+          {read= false; write= true}
+      | ACL.READ ->
+          {read= true; write= false}
+      | ACL.RDWR ->
+          {read= true; write= true}
+
+    let to_perm = function
+      | {read= false; write= false} ->
+          ACL.NONE
+      | {read= false; write= true} ->
+          ACL.WRITE
+      | {read= true; write= false} ->
+          ACL.READ
+      | {read= true; write= true} ->
+          ACL.RDWR
+
+    let full = {read= true; write= true}
+  end
+
+  module RWMap = struct
+    type t = {fallback: RW.t; map: RW.t DomidMap.t}
+
+    let lookup t domid =
+      (* other=RDWR can be overriden by explicitly revoking
+         permissions for a domain, so a read=false,write=false
+         in the DomidMap is not necessarily redundant
+      *)
+      DomidMap.find_opt domid t.map |> Option.value ~default:t.fallback
+
+    let create fallback owner =
+      (* owner always has full permissions, and cannot be overriden *)
+      {fallback; map= DomidMap.singleton owner RW.full}
+
+    let override t (domid, perm) =
+      let rw = RW.of_perm perm in
+      (* first entry wins, see perms.ml, also entries that are same as the fallback are
+         not necessarily redundant: (b1,b2,r2) means that domid 2 has rdwr,
+         but if we remove the seemingly redundant `b2` entry then the override would make it
+         just read which would be wrong. *)
+      if DomidMap.mem domid t.map then t
+      else {t with map= DomidMap.add domid rw t.map}
+  end
+
+  type t = {original: ACL.t; owner: ACL.domid; acl: RWMap.t}
+
+  let can_read t domid = (RWMap.lookup t.acl domid).read
+
+  let can_write t domid = (RWMap.lookup t.acl domid).write
+
+  let owner t = t.owner
+
+  let of_acl original =
+    let fallback = RW.of_perm original.ACL.other in
+    let owner = original.ACL.owner in
+    let acl =
+      let init = RWMap.create fallback owner in
+      List.fold_left RWMap.override init original.ACL.acl
+    in
+    {original; owner; acl}
+
+  let to_acl t =
+    if !preserve_order then t.original
+    else
+      ACL.
+        { owner= t.owner
+        ; other= RW.to_perm t.acl.fallback
+        ; acl= t.acl.map |> DomidMap.map RW.to_perm |> DomidMap.bindings }
+end
+
+module Store = struct
+  type node = {value: string; children: string list; acl: CanonicalACL.t}
+
+  type t = {paths: node PathMap.t}
+
+  let create () = {paths= PathMap.empty}
+
+  let parent x = failwith "TODO"
+
+  let add t key value =
+    let paths = PathMap.add key value t.paths in
+    {paths}
+
+  let remove t key =
+    let paths = PathMap.remove key t.paths in
+    {paths}
+end
+
+type t = Store.t
+
+let create () = Store.create ()
+
+let reply_enoent = Response.Error "ENOENT"
+
+let reply_eexist = Response.Error "EEXIST"
+
+let with_node_read t path f =
+  ( t
+  , match PathMap.find_opt path t.paths with
+    | None ->
+        reply_enoent
+    | Some n ->
+        f n )
+
+(* TODO: perm check *)
+let perform_path t domid path = function
+  | Request.Read ->
+      with_node_read t path @@ fun n -> Response.Read n.value
+  | Request.Directory ->
+      with_node_read t path @@ fun n -> Response.Directory n.children
+  | Request.Directory_part _ ->
+      (t, Response.Error "ENOTSUP")
+  | Request.Getperms ->
+      with_node_read t path @@ fun n -> Response.Getperms n.acl
+  | Request.Write value -> (
+    (* TODO: implicit mkdir *)
+    match PathMap.find_opt path t.paths with
+    | Some _ ->
+        (t, reply_eexist)
+    | None ->
+        let acl = ACL.{owner= domid; other= NONE; acl= []} in
+        let n = {value; children= []; acl} in
+        ({t with paths= PathMap.add path n t.paths}, Response.Write) )
+  | Request.Setperms acl -> (
+    match PathMap.find_opt path t.paths with
+    | Some _ ->
+        (t, reply_enoent)
+    | None ->
+        let update_node = function
+          | None ->
+              None
+          | Some n ->
+              Some {n with acl}
+        in
+        ( {t with paths= PathMap.update path update_node t.paths}
+        , Response.Setperms ) )
+  | Request.Mkdir -> (
+    (* TODO: implicit mkdir *)
+    match PathMap.find_opt path t.paths with
+    | Some _ ->
+        (t, reply_eexist)
+    | None ->
+        let acl = ACL.{owner= domid; other= NONE; acl= []} in
+        let n = {value= ""; children= []; acl} in
+        ({t with paths= PathMap.add path n t.paths}, Response.Mkdir) )
+  | Request.Rm -> (
+    match PathMap.find_opt path t.paths with
+    | None ->
+        (t, reply_enoent)
+    | Some _ ->
+        ({t with paths= PathMap.remove path t.paths}, Response.Rm) )
+
+let perform t domid = function
+  | Request.PathOp (path, op) ->
+      perform_path t domid path op
+  | Request.Getdomainpath domid ->
+      (t, Response.Getdomainpath (Printf.sprintf "/local/domain/%d" domid))
+  | _ ->
+      failwith "TODO"
diff --git a/tools/ocaml/xenstored/test/old/arbitrary.ml b/tools/ocaml/xenstored/test/old/arbitrary.ml
new file mode 100644
index 0000000000..6b0bf9864a
--- /dev/null
+++ b/tools/ocaml/xenstored/test/old/arbitrary.ml
@@ -0,0 +1,261 @@
+open QCheck
+
+(* See https://github.com/gasche/random-generator/blob/51351c16b587a1c4216d158e847dcfa6db15f009/random_generator.mli#L275-L325
+    for background on fueled generators for recursive data structures.
+   The difference here is that we build an N-ary tree, not a binary tree as in the example.
+   So we need to spread the fuel among elements of a list of random size.
+*)
+
+(** [spread fuel] creates an array of a random size, and spreads fuel among array elements.
+  Each array slot uses up at least 1 fuel itself.
+  For example the full list of possible arrays with [4] fuel is:
+  {[ [[|3|]; [|0; 2|]; [|1; 1|]; [|2; 0|]; [|0; 0; 0; 0|]] ]}
+*)
+let spread = function
+  | 0 ->
+      Gen.return [||]
+  | n when n < 0 ->
+      invalid_arg "negative fuel"
+  | n ->
+      Gen.(
+        1 -- n
+        >>= fun per_element ->
+        (* We got n fuel to divide up, such that most elements have [per_element] fuel.
+           Round up the number of elements *)
+        let m = (n + per_element - 1) / per_element in
+        (* each element uses up at least one fuel, this has to be subtracted before propagation *)
+        let a = Array.make m (per_element - 1) in
+        (* handle remainder *)
+        a.(0) <- n - (per_element * (m - 1)) - 1 ;
+        assert (Array.fold_left ( + ) m a = n) ;
+        (* ensure that remainder is in a random position *)
+        Gen.shuffle_a a >|= fun () -> a)
+
+(** [spread_l fuel sized_element] spreads [fuel] among list elements,
+    where each list element is created using [sized_element].
+    [sized_element] needs to create an element of exactly the requested size
+     (which may be a recursive element, that calls [spread_l] in turn).
+    Each list element consumes 1 fuel implicitly and sized_element is called with decreased fuel.
+ *)
+let spread_l fuel (sized_elem : 'a Gen.sized) =
+  Gen.(
+    spread fuel
+    >>= fun a ->
+    a |> Array.map sized_elem |> Gen.flatten_a |> Gen.map Array.to_list)
+
+module Tree = struct
+  (* For better shrinking put the (recursive) list first *)
+  type 'a t = Nodes of ('a t * 'a) list
+
+  (** [empty] the empty tree (of size 1) *)
+  let empty = Nodes []
+
+  (** [nodes subtree] tree constructor *)
+  let nodes children = Nodes children
+
+  (** [tree elem_gen] generates a random tree, with elements generated by [elem_gen] *)
+  let tree elem =
+    Gen.sized @@ Gen.fix
+    @@ fun self fuel ->
+    (* self is the generator for a subtree *)
+    let node fuel = Gen.(pair (self fuel) elem) in
+    (* using spread_l ensures that fuel decreases by at least 1, thus ensuring termination *)
+    Gen.map nodes @@ spread_l fuel node
+
+  (** [zero _] is a default implementation for [small] *)
+  let zero _ = 0
+
+  (** [small elem_size tree] returns the count of nodes in the tree and the sum of element sizes
+      as determined by [elem_size] *)
+  let rec small ?(elem_size = zero) (Nodes tree) =
+    List.fold_left
+      (fun acc (subtree, elem) ->
+        acc + elem_size elem + small ~elem_size subtree)
+      1 tree
+
+  (** [shrink ?elem tree] returns a list of potentially smaller trees based on [tree].
+   *)
+  let shrink ?(elem = Shrink.nil) =
+    (* Shrinking needs to generate smaller trees (as determined by [small]),
+       QCheck will keep iterating until it finds a smaller tree that still reproduces the bug.
+       It will then invoke the shrinker again on the smaller tree to attempt to shrink it further.
+       Once the tree shape cannot be shrunk further individual node elements will be shrunk.
+    *)
+    let rec tree (Nodes t) =
+      (* first try to shrink the subtree to a leaf,
+         and if that doesn't work then recursively shrink the subtree
+      *)
+      Iter.append (Iter.return empty)
+      @@ Iter.map nodes
+      @@ Shrink.list ~shrink:(Shrink.pair tree elem) t
+    in
+    tree
+
+  (** [make arb] creates a tree generator with elements generated by [arb].
+      The tree has a shrinker and size defined.
+   *)
+  let make arb =
+    let gen = tree @@ gen arb in
+    QCheck.make
+      ~small:(small ?elem_size:arb.small)
+      ~shrink:(shrink ?elem:arb.shrink) gen
+
+  (** [paths_of_tree ~join tree] return all paths through the tree,
+      with path elements joined using [join] *)
+  let paths_of_tree ~join t =
+    let rec paths_of_subtree (paths, path) (Nodes nodes) =
+      ListLabels.fold_left nodes ~init:paths ~f:(fun paths (tree, elem) ->
+          let path = elem :: path in
+          paths_of_subtree (join (List.rev path) :: paths, path) tree)
+    in
+    paths_of_subtree ([], []) t
+
+  let paths join arb =
+    make arb
+    (* we need to retain the tree, so that the shrinking is done on the tree,
+       and not on the paths *)
+    |> map_keep_input (paths_of_tree ~join)
+end
+
+module Case = struct
+  type ('a, 'b) t =
+    { case_tag: string
+    ; orig: 'a QCheck.arbitrary
+    ; map: 'a -> 'b
+    ; shrink: 'a -> 'b Iter.t
+    ; print: 'a Print.t
+    ; small: 'a -> int }
+
+  (** [make arb f] defines a new variant case with constructor arguments
+      generated by [arb] and constructor [f]. *)
+  let make case_tag orig map =
+    let shrink a =
+      match orig.QCheck.shrink with
+      | None ->
+          Iter.empty
+      | Some s ->
+          Iter.map map @@ s a
+    in
+    let small a = match orig.QCheck.small with None -> 0 | Some s -> s a in
+    let print a = match orig.QCheck.print with None -> "_" | Some p -> p a in
+    {case_tag; orig; map; shrink; small; print}
+
+  type 'a call =
+    { tag: string
+    ; shrink_lazy: 'a Iter.t Lazy.t
+    ; small_lazy: int Lazy.t
+    ; print: string Lazy.t }
+
+  (** [call tag case args] used by the implementation of [rev] to build a shrinker/small of appropriate type *)
+  let call t a =
+    { tag= t.case_tag
+    ; shrink_lazy= lazy (t.shrink a)
+    ; small_lazy= lazy (t.small a)
+    ; print= lazy (t.print a) }
+
+  (** [to_sum case] converts all variant cases to the same type so they can be put into a list *)
+  let to_sum t = Gen.map t.map @@ QCheck.gen t.orig
+end
+
+(** [sum ~print ~rev cases] defines an arbitrary for a sum type consisting of [cases]
+  variant case generators. [print] converts the sum type to a string.
+  [rev] matches on the sum type and should invoke [Case.call <variant-tag> <variant-case-def> <args>].
+
+  E.g.
+  {|
+  type t = A of int | B of float
+
+  let case_a = Case.make "A" int (fun i -> A i)
+
+  let case_b = Case.make "B" float (fun f -> B f)
+
+  let rev t =
+    match t with A i -> Case.call case_a i | B g -> Case.call case_b g
+
+  let x =
+    sum
+      ~print:(fun _ -> failwith "TODO")
+      [Case.to_sum case_a; Case.to_sum case_b]
+  |}
+ *)
+let sum ~rev lst =
+  let shrink b = Lazy.force (rev b).Case.shrink_lazy in
+  let small b = Lazy.force (rev b).Case.small_lazy in
+  let collect b = (rev b).Case.tag in
+  let print b = let r = rev b in r.Case.tag ^ " " ^ Lazy.force r.print in
+  QCheck.make ~shrink ~small ~collect ~print (Gen.oneof lst)
+
+(*
+let mk_packet op to_string arb =
+  Case.make arb (fun x -> Xenbus.Packet.create 0 0 op (to_string x))
+
+let read_packet =
+  mk_packet Xenbus.Xb.Op.Read Store.Path.to_string (list path_element)
+
+let write_packet =
+  mk_packet Xenbus.Xb.Op.Write
+    (fun (x, y) -> Store.Path.to_string x ^ "\x00" ^ y)
+    (pair (list path_element) binary)
+
+let packet =
+  sum ~print:Xenbus.Packet.to_string
+    [Case.to_sum read_packet; Case.to_sum write_packet]
+*)
+
+(** [binary] is a generator of strings containing \x00 characters. *)
+let binary =
+  (* increase frequency of '\x00' to 10%, otherwise it'd be ~1/256 *)
+  string_gen (Gen.frequency [(10, Gen.return '\x00'); (90, Gen.char)])
+  |> set_print String.escaped
+
+(** [path_chars] valid path characters according to Xenstore protocol. *)
+let path_chars =
+  List.init 256 Char.chr
+  |> List.filter Store.Path.char_is_valid
+  |> Array.of_list |> Gen.oneofa
+
+(** [path_element] a valid path element *)
+let path_element =
+   string_gen_of_size Gen.small_int path_chars
+
+type tree = string Tree.t
+
+let paths = Tree.paths Store.Path.to_string path_element
+
+let with_validate p =
+  map_same_type
+  @@ fun v ->
+  (* reject it in a way known to QCheck: precondition failed,
+     instead of testcase failed *)
+  assume @@ p v ;
+  v
+
+(** [non_nul string_arb] rejects strings generated by [string_arb] that contain '\x00'. *)
+let non_nul = with_validate @@ fun s -> not (String.contains s '\x00')
+
+(** [plus arb] generates a list of 1 or more elements generated by [arb] *)
+let plus arb = list_of_size Gen.(map succ small_int) arb
+
+(** [star arb] generates a list of 0 or more elements generated by [arb] *)
+let star arb = list_of_size Gen.small_int arb
+
+let reserved =
+  string_of_size Gen.(frequency [(90, Gen.return 0); (10, Gen.small_int)])
+
+(** According to xenstore protocol this could go up to 65535, but an actual domid
+    shouldn't go above this value *)
+let domid_first_reserved = 0x7FF0
+
+(** [new_domid] generates DomU domids *)
+let new_domid = 1 -- domid_first_reserved
+
+let permty =
+  let open Perms in
+  oneofl [READ; WRITE; RDWR; NONE]
+
+let perms domid =
+  map
+    (fun (domid, other, acls) -> Perms.Node.create domid other acls)
+    ~rev:(fun n ->
+      (Perms.Node.get_owner n, Perms.Node.get_other n, Perms.Node.get_acl n))
+  @@ triple domid permty (small_list (pair domid permty))
diff --git a/tools/ocaml/xenstored/test/old/gen_paths.ml b/tools/ocaml/xenstored/test/old/gen_paths.ml
new file mode 100644
index 0000000000..b50c5b7cad
--- /dev/null
+++ b/tools/ocaml/xenstored/test/old/gen_paths.ml
@@ -0,0 +1,66 @@
+open QCheck
+open Store
+
+type tree = Leaf | Nodes of (string * tree) list
+
+let nodes children = Nodes children
+let gen_tree = QCheck.Gen.(sized @@ fix
+  (fun self n ->
+    let children = frequency [1, pure 0; 2, int_bound n] >>= fun m ->
+    match m with
+    | 0 -> pure []
+    | _ -> list_repeat m (pair string (self (n/m)))
+    in
+    frequency
+     [ 1, pure Leaf
+     ; 2, map nodes children
+    ]
+    ))
+
+let rec paths_of_tree (acc, path) = function
+| Leaf -> acc
+| Nodes l ->
+  List.fold_left (fun acc (k, children) ->
+    let path = k :: path in
+    paths_of_tree (Store.Path.to_string (List.rev path) :: acc, path) children
+  ) acc l
+
+let gen_paths_choices =
+  Gen.map (fun tree ->
+  tree |> paths_of_tree ([], []) |> Array.of_list
+  ) gen_tree
+
+(*let arb_name = Gen.small_string
+
+let arb_permty = let open Perms in oneofl [ READ; WRITE; RDWR; NONE ]
+
+let arb_domid = oneofl [ 0; 1; 0x7FEF]
+
+let arb_perms =
+   map (fun (domid, other, acls) -> Perms.Node.create domid other acls)
+   ~rev:(fun n -> Perms.Node.get_owner n, Perms.Node.get_other n, Perms.Node.get_acl n)
+   @@ triple arb_domid arb_permty (small_list (pair arb_domid arb_permty))*)
+
+let arb_name = Gen.small_string
+let arb_value = Gen.small_string
+
+let node_of name value children =
+  List.fold_left (fun c acc -> Node.add_child acc c)
+  (Node.create name Perms.Node.default0 value ) children
+
+let g = QCheck.Gen.(sized @@ fix
+  (fun self n ->
+      frequency [1, pure 0; 2, int_bound n] >>= fun m ->
+      let children = match m with
+      | 0 -> pure []
+      | _ -> list_repeat m (self (n/m))
+      in
+      map3 node_of arb_name arb_value children
+    ))
+
+let paths_of_tree t =
+  let paths = ref [] in
+  Store.traversal t (fun path node ->
+    paths := (Store.Path.of_path_and_name path (Node.get_name node) |> Store.Path.to_string) :: !paths
+  );
+  !paths
diff --git a/tools/ocaml/xenstored/test/old/xenstored_test.ml b/tools/ocaml/xenstored/test/old/xenstored_test.ml
new file mode 100644
index 0000000000..84cfc45d4f
--- /dev/null
+++ b/tools/ocaml/xenstored/test/old/xenstored_test.ml
@@ -0,0 +1,527 @@
+open Stdext
+open QCheck
+open Arbitrary
+
+let () =
+  (* Logging.access_log_nb_files := 1 ;
+     Logging.access_log_transaction_ops := true ;
+     Logging.access_log_special_ops := true ;
+     Logging.access_log_destination := File "/tmp/log" ;
+     Logging.init_access_log ignore ;
+     Logging.set_xenstored_log_destination "/dev/stderr";
+     Logging.init_xenstored_log (); *)
+  Domains.xenstored_port := "xenstored-port" ;
+  let f = open_out !Domains.xenstored_port in
+  Printf.fprintf f "%d" 1 ;
+  close_out f ;
+  Domains.xenstored_kva := "/dev/zero"
+
+module Command = struct
+  type value = string
+
+  let value = binary
+
+  type token = string
+
+  type txid = int
+
+  type domid = Xenctrl.domid
+
+  type t =
+    | Read of Store.Path.t
+    | Write of Store.Path.t * value
+    | Mkdir of Store.Path.t
+    | Rm of Store.Path.t
+    | Directory of Store.Path.t
+    (* | Directory_part not implemented *)
+    | Get_perms of Store.Path.t
+    | Set_perms of Store.Path.t * Perms.Node.t
+    | Watch of Store.Path.t * token
+    | Unwatch of Store.Path.t * token
+    | Reset_watches
+    | Transaction_start
+    | Transaction_end of bool
+    | Introduce of domid * nativeint * int
+    | Release of int
+    | Get_domain_path of domid
+    | Is_domain_introduced of domid
+    | Set_target of domid * domid
+    | LiveUpdate
+
+  type state =
+    { store: Store.t
+    ; doms: Domains.domains
+    ; cons: Connections.t
+    ; domids: int array }
+
+  let path = list path_element
+
+  let token = printable_string
+
+  let domid state = oneofa ~print:Print.int state.domids
+
+  let cmd state =
+    let domid = domid state in
+    let cmd_read = Case.make "READ" path (fun path -> Read path) in
+    let cmd_write =
+      Case.make "WRITE" (pair path value) (fun (path, value) ->
+          Write (path, value))
+    in
+    let cmd_mkdir = Case.make "MKDIR" path (fun path -> Mkdir path) in
+    let cmd_rm = Case.make "RM" path (fun path -> Rm path) in
+    let cmd_directory =
+      Case.make "DIRECTORY" path (fun path -> Directory path)
+    in
+    let cmd_get_perms =
+      Case.make "GET_PERMS" path (fun path -> Get_perms path)
+    in
+    let cmd_set_perms =
+      Case.make "SET_PERMS"
+        (pair path (perms domid))
+        (fun (path, perms) -> Set_perms (path, perms))
+    in
+    let cmd_watch =
+      Case.make "WATCH" (pair path token) (fun (path, token) ->
+          Watch (path, token))
+    in
+    let cmd_unwatch =
+      Case.make "UNWATCH" (pair path token) (fun (path, token) ->
+          Unwatch (path, token))
+    in
+    let cmd_reset_watches =
+      Case.make "RESET_WATCHES" unit (fun () -> Reset_watches)
+    in
+    let cmd_tx_start =
+      Case.make "TRANSACTION_START" unit (fun () -> Transaction_start)
+    in
+    let cmd_tx_end =
+      Case.make "TRANSACTION_END" bool (fun commit -> Transaction_end commit)
+    in
+    let cmd_introduce =
+      Case.make "INTRODUCE" (triple domid int int) (fun (domid, gfn, port) ->
+          Introduce (domid, Nativeint.of_int gfn, port))
+    in
+    let cmd_release = Case.make "RELEASE" domid (fun domid -> Release domid) in
+    let cmd_get_domain_path =
+      Case.make "GET_DOMAIN_PATH" domid (fun domid -> Get_domain_path domid)
+    in
+    let cmd_is_domain_introduced =
+      Case.make "IS_DOMAIN_INTRODUCED" domid (fun domid ->
+          Is_domain_introduced domid)
+    in
+    let cmd_set_target =
+      Case.make "SET_TARGET" (pair domid domid) (fun (domid, tdomid) ->
+          Set_target (domid, tdomid))
+    in
+    let cmd_live_update =
+      Case.make "CONTROL live-update" unit (fun () -> LiveUpdate)
+    in
+    let rev = function
+      | Read a ->
+          Case.call cmd_read a
+      | Write (p, v) ->
+          Case.call cmd_write (p, v)
+      | Mkdir a ->
+          Case.call cmd_mkdir a
+      | Rm a ->
+          Case.call cmd_rm a
+      | Directory a ->
+          Case.call cmd_directory a
+      | Get_perms a ->
+          Case.call cmd_get_perms a
+      | Set_perms (p, v) ->
+          Case.call cmd_set_perms (p, v)
+      | Watch (p, t) ->
+          Case.call cmd_watch (p, t)
+      | Unwatch (p, t) ->
+          Case.call cmd_unwatch (p, t)
+      | Reset_watches ->
+          Case.call cmd_reset_watches ()
+      | Transaction_start ->
+          Case.call cmd_tx_start ()
+      | Transaction_end a ->
+          Case.call cmd_tx_end a
+      | Introduce (d, g, p) ->
+          Case.call cmd_introduce (d, Nativeint.to_int g, p)
+      | Release a ->
+          Case.call cmd_release a
+      | Get_domain_path a ->
+          Case.call cmd_get_domain_path a
+      | Is_domain_introduced a ->
+          Case.call cmd_is_domain_introduced a
+      | Set_target (d, t) ->
+          Case.call cmd_set_target (d, t)
+      | LiveUpdate ->
+          Case.call cmd_live_update ()
+    in
+    let open Case in
+    sum ~rev
+      [ to_sum cmd_read
+      ; to_sum cmd_write
+      ; to_sum cmd_mkdir
+      ; to_sum cmd_rm
+      ; to_sum cmd_directory
+      ; to_sum cmd_get_perms
+      ; to_sum cmd_set_perms
+      ; to_sum cmd_watch
+      ; to_sum cmd_unwatch
+      ; to_sum cmd_reset_watches
+      ; to_sum cmd_tx_start
+      ; to_sum cmd_tx_end
+      ; to_sum cmd_introduce
+      ; to_sum cmd_release
+      ; to_sum cmd_get_domain_path
+      ; to_sum cmd_is_domain_introduced
+      ; to_sum cmd_set_target
+      ; to_sum cmd_live_update ]
+
+  let run tid =
+    let open Xenstore.Queueop in
+    function
+    | Read p ->
+        read tid Store.Path.(to_string p)
+    | Write (p, v) ->
+        write tid Store.Path.(to_string p) v
+    | Mkdir p ->
+        mkdir tid Store.Path.(to_string p)
+    | Rm p ->
+        rm tid Store.Path.(to_string p)
+    | Directory p ->
+        directory tid Store.Path.(to_string p)
+    | Get_perms p ->
+        getperms tid Store.Path.(to_string p)
+    | Set_perms (p, v) ->
+        setperms tid Store.Path.(to_string p) Perms.Node.(to_string v)
+    | Watch (p, t) ->
+        watch Store.Path.(to_string p) t
+    | Unwatch (p, t) ->
+        unwatch Store.Path.(to_string p) t
+    | Reset_watches ->
+        let open Xenbus in
+        fun con -> Xb.queue con (Xb.Packet.create 0 0 Xb.Op.Reset_watches "")
+    | Transaction_start ->
+        transaction_start
+    | Transaction_end c ->
+        transaction_end tid c
+    | Release d ->
+        release d
+    | Get_domain_path d ->
+        getdomainpath d
+    | Is_domain_introduced d ->
+        let open Xenbus in
+        fun con ->
+          Xb.queue con
+            (Xb.Packet.create 0 0 Xb.Op.Isintroduced (string_of_int d))
+    | Set_target (d, t) ->
+        let open Xenbus in
+        fun con ->
+          Xb.queue con
+            (Xb.Packet.create 0 0 Xb.Op.Isintroduced
+               (String.concat "\x00" [string_of_int d; string_of_int t]))
+    | LiveUpdate ->
+        debug ["live-update"; "-s"]
+    | Introduce (d, g, p) ->
+        introduce d g p
+end
+
+module Spec = struct
+  type cmd = New | Cmd of Command.domid * int option * Command.t
+
+  type state =
+    { xb: Xenbus.Xb.t
+    ; cnt: int
+    ; cmdstate: Command.state ref option
+    ; failure: (exn * string) option }
+
+  type sut = state ref
+
+  let doms = Domains.init (Event.init ()) ignore
+
+  let dom0 = Domains.create0 doms
+
+  let new_state () =
+    let cons = Connections.create () in
+    Connections.add_domain cons dom0 ;
+    let store = Store.create () in
+    let con = Perms.Connection.create 0 in
+    Store.mkdir store con ["tool"] ;
+    {Command.store; doms; cons; domids= [|0|]}
+
+  let print = function
+    | New ->
+        "NEW"
+    | Cmd (d, t, c) ->
+        let s = new_state () in
+        let cmd = Command.cmd s in
+        (Option.get (triple (Command.domid s) (option int) cmd).print) (d, t, c)
+
+  let shrink = function
+    | New ->
+        Iter.empty
+    | Cmd (d, t, c) ->
+        let s = new_state () in
+        let cmd = Command.cmd s in
+        Iter.map (fun (d, t, c) -> Cmd (d, t, c))
+        @@ (Option.get (triple (Command.domid s) (option int) cmd).shrink)
+             (d, t, c)
+
+  let arb_cmd state =
+    ( match state.cmdstate with
+    | None ->
+        always New
+    | Some s ->
+        let cmd = Command.cmd !s in
+        QCheck.map
+          (fun (d, t, c) -> Cmd (d, t, c))
+          ~rev:(fun (Cmd (d, t, c)) -> (d, t, c))
+        @@ triple (Command.domid !s) (option int) cmd )
+    |> set_print print |> set_shrink shrink
+
+  (*    |> set_collect (fun (_, _, c) -> (Option.get cmd.QCheck.collect) c)*)
+
+  let init_state =
+    {cnt= 0; xb= Xenbus.Xb.open_fd Unix.stdout; cmdstate= None; failure= None}
+
+  let precond cmd s =
+    match (cmd, s.cmdstate) with
+    | New, None ->
+        true
+    | New, _ ->
+        false
+    | Cmd _, None ->
+        false
+    | Cmd (_, _, Command.Release 0), _ ->
+        false
+    | _ ->
+        true
+
+  let next_state cmd state =
+    { ( try
+          assume (precond cmd state) ;
+          match cmd with
+          | New ->
+              {state with cmdstate= Some (ref @@ new_state ())}
+          | Cmd (domid, tid, cmd) ->
+              let tid = match tid with None -> 0 | Some id -> 1 + id in
+              Command.run tid cmd state.xb ;
+              let s = !(Option.get state.cmdstate) in
+              let con = Connections.find_domain s.Command.cons domid in
+              Queue.clear con.xb.pkt_out ;
+              let run_packet packet =
+                let tid, rid, ty, data = Xenbus.Xb.Packet.unpack packet in
+                let req = {Packet.tid; Packet.rid; Packet.ty; Packet.data} in
+                Process.process_packet ~store:s.Command.store
+                  ~cons:s.Command.cons ~doms:s.Command.doms ~con ~req ;
+                Process.write_access_log ~ty ~tid
+                  ~con:(Connection.get_domstr con)
+                  ~data ;
+                let packet = Connection.peek_output con in
+                let tid, _rid, ty, data = Xenbus.Xb.Packet.unpack packet in
+                Process.write_answer_log ~ty ~tid
+                  ~con:(Connection.get_domstr con)
+                  ~data
+              in
+              Queue.iter run_packet state.xb.pkt_out ;
+              Queue.clear state.xb.pkt_out ;
+              state
+        with e ->
+          let bt = Printexc.get_backtrace () in
+          {state with failure= Some (e, bt)} )
+      with
+      cnt= state.cnt + 1 }
+
+  let init_sut () = ref init_state
+
+  let cleanup _ = ()
+
+  module P = struct
+    type t = string list
+
+    let compare = compare
+  end
+
+  module PathMap = Map.Make (P)
+
+  module DomidMap = Map.Make (struct
+    type t = Xenctrl.domid
+
+    let compare = compare
+  end)
+
+  module IntMap = Map.Make (struct
+    type t = int
+
+    let compare = compare
+  end)
+
+  module FDMap = Map.Make (struct
+    type t = Unix.file_descr
+
+    let compare = compare
+  end)
+
+  let map_of_store s =
+    let m = ref PathMap.empty in
+    Store.dump_fct s (fun path node -> m := PathMap.add path node !m) ;
+    !m
+
+  let node_equiv n n' =
+    Perms.equiv (Store.Node.get_perms n) (Store.Node.get_perms n')
+    && Store.Node.get_name n = Store.Node.get_name n'
+    && Store.Node.get_value n = Store.Node.get_value n'
+
+  let store_root_equiv s s' =
+    if not (PathMap.equal node_equiv (map_of_store s) (map_of_store s')) then
+      let b = Store.dump_store_buf s.root in
+      let b' = Store.dump_store_buf s'.root in
+      Test.fail_reportf "Store trees are not equivalent:\n %s\n <>\n %s"
+        (Buffer.contents b) (Buffer.contents b')
+    else true
+
+  let map_of_domid_table tbl = Hashtbl.fold DomidMap.add tbl DomidMap.empty
+
+  let map_of_quota q = map_of_domid_table q.Quota.cur
+
+  let store_quota_equiv root root' q q' =
+    let _ =
+      DomidMap.merge
+        (fun domid q q' ->
+          let q = Option.value ~default:(-1) q in
+          let q' = Option.value ~default:(-1) q' in
+          if q <> q' then
+            let b = Store.dump_store_buf root in
+            let b' = Store.dump_store_buf root' in
+            Test.fail_reportf "quota mismatch on %d: %d <> %d\n%s\n%s\n" domid q
+              q' (Buffer.contents b) (Buffer.contents b')
+          else Some q)
+        (map_of_quota q) (map_of_quota q')
+    in
+    true
+
+  let store_equiv s s' =
+    store_root_equiv s s'
+    && store_quota_equiv s.root s'.root (Store.get_quota s) (Store.get_quota s')
+
+  let map_of_domains d = map_of_domid_table d.Domains.table
+
+  let domain_equiv d d' =
+    Domain.get_id d = Domain.get_id d'
+    && Domain.get_remote_port d = Domain.get_remote_port d'
+
+  let domains_equiv d d' =
+    DomidMap.equal domain_equiv (map_of_domains d) (map_of_domains d')
+
+  let map_of_fd_table tbl = Hashtbl.fold FDMap.add tbl FDMap.empty
+
+  let map_of_int_table tbl = Hashtbl.fold IntMap.add tbl IntMap.empty
+
+  let list_of_queue q = Queue.fold (fun acc e -> e :: acc) [] q
+
+  let connection_equiv c c' =
+    let l = list_of_queue c.Connection.xb.pkt_out in
+    let l' = list_of_queue c'.Connection.xb.pkt_out in
+    if List.length l <> List.length l' || List.exists2 ( <> ) l l' then (
+      let print_packets l =
+        l
+        |> List.rev_map (fun p ->
+               let tid, rid, ty, data = Xenbus.Packet.unpack p in
+               let tystr = Xenbus.Xb.Op.to_string ty in
+               Printf.sprintf "tid=%d, rid=%d, ty=%s, data=%s" tid rid tystr
+                 (String.escaped data))
+        |> String.concat "\n"
+      in
+      let r = print_packets l in
+      let r' = print_packets l' in
+      Test.fail_reportf "Replies not equal:\n%s\n <>\n %s" r r' )
+    else
+      let n = Connection.number_of_transactions c in
+      let n' = Connection.number_of_transactions c' in
+      if n <> n' then Test.fail_reportf "TX count mismatch: %d <> %d" n n'
+      else true
+
+  let connections_equiv c c' =
+    FDMap.equal connection_equiv
+      (map_of_fd_table c.Connections.anonymous)
+      (map_of_fd_table c'.Connections.anonymous)
+    && IntMap.equal connection_equiv
+         (map_of_int_table c.Connections.domains)
+         (map_of_int_table c'.Connections.domains)
+
+  let dump_load s =
+    let tmp = Filename.temp_file "xenstored" "qcheck.dump" in
+    finally
+      (fun () ->
+        let fds = {Xenstored.DB.rw_sock= None; ro_sock= None} in
+        Xenstored.DB.to_file fds !s.Command.store !s.Command.cons tmp ;
+        s := new_state () ;
+        let _fds', errors =
+          Xenstored.DB.from_file ~live:true !s.Command.store !s.Command.doms
+            !s.Command.cons tmp
+        in
+        if errors > 0 then
+          Test.fail_reportf "Errors during live update: %d" errors)
+      (fun () -> Sys.remove tmp)
+
+  let run_cmd cmd state sut =
+    ( match state.failure with
+    | None ->
+        true
+    | Some (e, bt) ->
+        Test.fail_reportf "Exception %s, backtrace: %s" (Printexc.to_string e)
+          bt )
+    &&
+    match cmd with
+    | New ->
+        sut := next_state cmd !sut ;
+        true
+    | Cmd (0, _, Command.LiveUpdate) ->
+        let s = !sut.cmdstate in
+        let store1 = Store.copy !(Option.get s).store in
+        let doms1 = !(Option.get s).doms in
+        dump_load (Option.get s) ;
+        (* reply is expected not to be equivalent, since after live update we got an empty reply queue,
+           so don't compare connections
+        *)
+        store_equiv store1 !(Option.get s).store
+        && domains_equiv doms1 !(Option.get s).doms
+    | Cmd(_, _, cmd') -> (
+        (* TODO: also got same reply, and check for equivalence on the actual Live Update *)
+        sut := next_state cmd !sut ;
+        let ids = Hashtbl.create 47 in
+        Connections.iter !(Option.get state.cmdstate).cons (fun con ->
+            Hashtbl.add ids (Connection.get_id con) con.next_tid) ;
+        let state = next_state cmd state in
+        match (!sut.failure, state.cmdstate, !sut.cmdstate) with
+        | None, Some s, Some s' ->
+            let r = cmd' = Command.Transaction_start (* txid can change *) || 
+               connections_equiv !s.cons !s'.cons in
+            Connections.iter !(Option.get state.cmdstate).cons (fun con ->
+                let tid = Hashtbl.find ids (Connection.get_id con) in
+                if con.next_tid <> tid then (
+                  let (_ : bool) = Connection.end_transaction con tid None in
+                  () ;
+                  con.next_tid <- tid )) ;
+            r
+        | None, None, None ->
+            true
+        | None, None, _ ->
+            Test.fail_report "state uninit"
+        | None, _, None ->
+            Test.fail_report "sut uninit"
+        | Some (e, bt), _, _ ->
+            Test.fail_reportf "Exception %s, backtrace: %s"
+              (Printexc.to_string e) bt )
+end
+
+module States = QCSTM.Make (Spec)
+
+(* && watches_equiv c c' *)
+
+let test = States.agree_test ~count:100 ~name:"live-update"
+
+let test =
+  Test.make ~name:"live-update" ~count:100
+    (States.arb_cmds Spec.init_state)
+    States.agree_prop
+
+let () = QCheck_base_runner.run_tests_main [test]
diff --git a/tools/ocaml/xenstored/test/pathtree.ml b/tools/ocaml/xenstored/test/pathtree.ml
new file mode 100644
index 0000000000..50cbb0302d
--- /dev/null
+++ b/tools/ocaml/xenstored/test/pathtree.ml
@@ -0,0 +1,40 @@
+module M = Map.Make(String)
+type 'a t = { data: 'a; children: 'a t M.t }
+
+type 'a tree = 'a t
+let of_data data = { data; children = M.empty }
+
+let update key f t = { t with children = M.update key f t.children }
+let set t data = { t with data }
+
+module Cursor = struct
+  type 'a t = { tree: 'a tree; up: ('a t * M.key) option }
+
+  let of_tree tree = { tree; up = None }
+
+  let create parent key tree = { tree; up = Some (parent, key) }
+
+  let down cur k =
+    M.find_opt k cur.tree.children |> Option.map @@ create cur k
+
+  let down_implicit_create ~implicit cur k =
+    match down cur k with
+    | Some r -> r
+    | None -> cur.tree.data |> implicit |> of_data |> create cur k
+
+  let rec to_tree t = match t.up with
+    | None -> t.tree
+    | Some (parent, key) ->
+        to_tree { parent with tree = update key (fun _ -> Some t.tree) parent.tree }
+
+  let set cur data = { cur with tree = set cur.tree data }
+  let get cur = cur.tree.data
+
+  let rm_child cur key = { cur with tree = update key (fun _ -> None) cur.tree}
+
+  (* TODO: down with implicit create *)
+end
+
+
+
+let rec map f t = { data = f t.data; children = M.map (map f) t.children }
diff --git a/tools/ocaml/xenstored/test/testable.ml b/tools/ocaml/xenstored/test/testable.ml
new file mode 100644
index 0000000000..2fa749fbb3
--- /dev/null
+++ b/tools/ocaml/xenstored/test/testable.ml
@@ -0,0 +1,379 @@
+let is_output_devnull = Unix.stat "/dev/null" = Unix.fstat Unix.stdout
+
+let () =
+  if not is_output_devnull then (
+    Printexc.record_backtrace true ;
+    Fmt_tty.setup_std_outputs () ;
+    try
+      let cols =
+        let ch = Unix.open_process_in "tput cols" in
+        Stdext.finally
+          (fun () -> input_line ch |> int_of_string)
+          (fun () -> Unix.close_process_in ch)
+      in
+      Format.set_margin cols
+    with _ -> () )
+
+let devnull () = Unix.openfile "/dev/null" [] 0
+
+let xb = Xenbus.Xb.open_fd (devnull ())
+
+module Command = struct
+  type path = Store.Path.t
+
+  type value = string
+
+  type token = string
+
+  type domid = int
+
+  type t = Xenbus.Packet.t
+
+  open Xenstore.Queueop
+
+  let cmd f =
+    Queue.clear xb.pkt_out ;
+    let () = f xb in
+    let p = Xenbus.Xb.peek_output xb in
+    Queue.clear xb.pkt_out ; p
+
+  let pathcmd f pathgen tid state = cmd @@ f tid @@ pathgen state
+
+  let cmd_read gen tid state = pathcmd read gen tid state
+
+  let cmd_write pathgen v tid state = cmd @@ write tid (pathgen state) v
+
+  let cmd_mkdir g t s = pathcmd mkdir g t s
+
+  let cmd_rm g t s = pathcmd rm g t s
+
+  let cmd_directory g t s = pathcmd directory g t s
+
+  let cmd_getperms g t s = pathcmd getperms g t s
+
+  let cmd_setperms pathgen vgen tid state =
+    cmd @@ setperms tid (pathgen state) (Perms.Node.to_string @@ vgen state)
+
+  let cmd_watch pathgen token _ state = cmd @@ watch (pathgen state) token
+
+  let cmd_unwatch pathgen token _ state = cmd @@ unwatch (pathgen state) token
+
+  let cmd_reset_watches tid _state =
+    let open Xenbus in
+    cmd
+    @@ fun con ->
+    Xenbus.Xb.queue con
+      (Xenbus.Xb.Packet.create 0 0 Xenbus.Xb.Op.Reset_watches "")
+
+  let cmd_transaction_start _ _ = cmd @@ transaction_start
+
+  let cmd_transaction_end commit tid _ = cmd @@ transaction_end tid commit
+
+  let domcmd f idgen _ state = cmd @@ f @@ idgen state
+
+  let cmd_release idgen state = domcmd release idgen state
+
+  let cmd_getdomainpath i s = domcmd getdomainpath i s
+
+  let cmd_isintroduced i t s =
+    domcmd
+      (fun d con ->
+        let open Xenbus in
+        Xenbus.Xb.queue con
+          (Xenbus.Xb.Packet.create 0 0 Xenbus.Xb.Op.Isintroduced
+             (string_of_int d)))
+      i t s
+
+  let cmd_set_target idgen1 idgen2 _ state =
+    let d = idgen1 state in
+    let t = idgen2 state in
+    cmd
+    @@ fun con ->
+    Xenbus.Xb.queue con
+      (Xenbus.Xb.Packet.create 0 0 Xenbus.Xb.Op.Isintroduced
+         (String.concat "\x00" [string_of_int d; string_of_int t]))
+
+  let cmd_liveupdate _ _ = cmd @@ debug ["live-update"; "-s"]
+
+  let cmd_introduce id port _ state = cmd @@ introduce id 0n port
+
+  let pp_dump = Types.pp_dump_packet
+
+  let precond cmd _state =
+    match cmd with
+    | {Xenbus.Packet.ty= Xenbus.Xb.Op.Release; data= "0\000"} ->
+        false
+        (* can't release Dom0 in the tests, or we crash due to shared dom0 backend *)
+    | {ty= Xenbus.Xb.Op.Rm; data= ""} ->
+        (* this is expected to cause inconsistencies on pre-created paths like /local *)
+        false
+    | _ ->
+        true
+end
+
+let with_logger ~on_exn f =
+  if is_output_devnull then f ()
+  else
+    let old = (!Logging.xenstored_logger, !Logging.access_logger) in
+    let logs = ref [] in
+    let write ?(level = Logging.Debug) s =
+      let msg = Printf.sprintf "%s %s" (Logging.string_of_level level) s in
+      logs := msg :: !logs
+    in
+    let logger =
+      Some {Logging.stop= ignore; restart= ignore; rotate= ignore; write}
+    in
+    Logging.xenstored_logger := logger ;
+    Logging.access_logger := logger ;
+    Stdext.finally
+      (fun () ->
+        try f ()
+        with e ->
+          let bt = Printexc.get_raw_backtrace () in
+          on_exn e bt (List.rev !logs))
+      (fun () ->
+        Logging.xenstored_logger := fst old ;
+        Logging.access_logger := snd old)
+
+type t =
+  { store: Store.t
+  ; cons: Connections.t
+  ; doms: Domains.domains
+  ; mutable anon: Unix.file_descr option
+  ; live_update: bool
+  ; txidtbl: (int, int) Hashtbl.t }
+
+let () =
+  Logging.xenstored_log_level := Logging.Debug ;
+  Logging.access_log_special_ops := true ;
+  Logging.access_log_transaction_ops := true ;
+  let name, f = Filename.open_temp_file "xenstored" "port" in
+  Domains.xenstored_port := name ;
+  Stdext.finally (fun () -> Printf.fprintf f "%d" 1) (fun () -> close_out f) ;
+  Domains.xenstored_kva := "/dev/zero" ;
+  (* entries from a typical oxenstored.conf *)
+  Transaction.do_coalesce := true ;
+  Perms.activate := true ;
+  Quota.activate := true ;
+  Quota.maxent := 8192 ;
+  Quota.maxsize := 2048 ;
+  Define.maxwatch := 512 ;
+  Define.maxtransaction := 10 ;
+  Define.maxrequests := 1024
+
+(* we MUST NOT release dom0, or we crash,
+   this is shared between multiple tests, because
+   it keeps an FD open, and we want to avoid EMFILE
+*)
+
+let create ?(live_update = false) () =
+  let store = Store.create () in
+  let cons = Connections.create () in
+  let doms = Domains.init (Event.init ()) ignore in
+  let dom0 = Domains.create0 doms in
+  let txidtbl = Hashtbl.create 47 in
+  Connections.add_domain cons dom0 ;
+  {store; cons; doms; anon= None; live_update; txidtbl}
+
+let cleanup t = Connections.iter t.cons Connection.close
+
+let init t =
+  let local = Store.Path.of_string "/local" in
+  let con = Perms.Connection.create 0 in
+  Store.mkdir t.store con local ;
+ (* Store.mkdir t.store con (Store.Path.of_string "/tool") ;*)
+  let fd = devnull () in
+  t.anon <- Some fd ;
+  Connections.add_anonymous t.cons fd
+
+let dump_load s =
+  let tmp = Filename.temp_file "xenstored" "qcheck.dump" in
+  Stdext.finally
+    (fun () ->
+      Xenstored.DB.to_file None s.store s.cons tmp ;
+      let s' = create () in
+      (* preserve FD *)
+      s'.anon <- s.anon ;
+      s.anon <- None ;
+      let _fds', errors =
+        Xenstored.DB.from_file ~live:true s'.store s'.doms s'.cons tmp
+      in
+      if errors > 0 then
+        failwith (Printf.sprintf "Errors during live update: %d" errors) ;
+      s')
+    (fun () -> Sys.remove tmp)
+
+let is_live_update = function
+  | {Xenbus.Packet.ty= Xenbus.Xb.Op.Debug; data= "live-update\000-s\000"} ->
+      true
+  | _ ->
+      false
+
+let is_tx_start p = p.Xenbus.Packet.ty = Xenbus.Xb.Op.Transaction_start
+
+let with_tmpfile prefix write f =
+  let name, ch = Filename.open_temp_file prefix ".txt" in
+  Stdext.finally
+    (fun () ->
+      Stdext.finally (fun () -> write ch) (fun () -> close_out ch) ;
+      f name)
+    (fun () -> Sys.remove name)
+
+let with_pp_to_file prefix pp x f =
+  let write ch =
+    let ppf = Format.formatter_of_out_channel ch in
+    Format.pp_set_margin ppf @@ Format.get_margin () ;
+    pp ppf x ;
+    Fmt.flush ppf ()
+  in
+  with_tmpfile prefix write f
+
+let run_cmd_get_output ?(ok_codes = [0]) cmd =
+  let cmd = Array.of_list cmd in
+  let ch = Unix.open_process_args_in cmd.(0) cmd in
+  Stdext.finally
+    (fun () ->
+      let lines = ref [] in
+      try
+        while true do
+          lines := input_line ch :: !lines
+        done ;
+        assert false
+      with End_of_file -> List.rev !lines |> String.concat "\n")
+    (fun () ->
+      match Unix.close_process_in ch with
+      | Unix.WEXITED code when List.mem code ok_codes ->
+          ()
+      | status ->
+          Crowbar.failf "%a %a" (Fmt.array Fmt.string) cmd
+            Types.pp_process_status status)
+
+let call_diff x y =
+  let ok_codes = [0; 1] in
+  run_cmd_get_output ~ok_codes
+    [ "/usr/bin/git"
+    ; "diff"
+    ; "-U10000" (* we want to see the entire state, where possible *)
+    ; "--no-index"
+    ; ( "--word-diff="
+      ^ if Fmt.style_renderer Fmt.stdout = `Ansi_tty then "color" else "plain"
+      )
+    ; "--color-moved=dimmed-zebra"
+    ; x
+    ; y ]
+
+let check_eq_exn prefix ~pp ~eq x y =
+  if not @@ eq x y then
+    if is_output_devnull then failwith "different"
+    else
+      with_pp_to_file "expected" pp x
+      @@ fun xfile ->
+      with_pp_to_file "actual" pp y
+      @@ fun yfile ->
+      failwith
+      @@ Printf.sprintf "%s agrement: %s" prefix (call_diff xfile yfile)
+
+let run next_tid t (domid, cmd) =
+  let con =
+    match domid with
+    | 0 ->
+        Connections.find !t.cons (Option.get !t.anon)
+    | id ->
+        Connections.find_domain !t.cons domid
+  in
+  (* clear out any watch events, TODO: don't  *)
+  Connections.iter !t.cons (fun con -> Queue.clear con.xb.pkt_out) ;
+  (* TODO: use the global live update state that processing the command sets, but remember to reset it *)
+  if is_live_update cmd then
+    if !t.live_update then (
+      let t0 = !t in
+      let t' = dump_load t0 in
+      Connections.iter t'.cons (fun con ->
+          Connection.iter_transactions con
+          @@ fun _ tx ->
+            (*  if tx.Transaction.operations <> [] then TODO: only if we dump snapshot state
+                correctly *)
+             Transaction.mark_failed tx) ;
+      Logging.info "store" "store: %s" (Fmt.to_to_string Types.pp_dump_store t'.store);
+      Logging.info "store" "store: %s" (Fmt.to_to_string Types.pp_dump_store t0.store);
+      check_eq_exn "store" ~pp:Types.pp_dump_store ~eq:Types.equal_store
+        t0.store t'.store ;
+      (* TODO: now we have a disagreement here... so we can't test this until TX state is restored *)
+      (*check_eq_exn "connections" ~pp:Types.pp_dump_connections
+        ~eq:Types.equal_connections t0.cons t'.cons ;*)
+      check_eq_exn "domains" ~pp:Types.pp_dump_domains ~eq:Types.equal_domains
+        t0.doms t'.doms ;
+      (* avoid double close on anonymous conn *)
+      Connections.iter_domains t0.cons Connection.close ;
+      t := {t' with txidtbl= !t.txidtbl} )
+    else begin
+      Logging.debug "testable" "BEFORE TXMARK";
+      Connections.iter !t.cons (fun con ->
+          Connection.iter_transactions con
+          @@ fun txid tx ->
+             Logging.debug "testable" "marking to fail %d" txid; 
+             (* if tx.Transaction.operations <> [] then see above TODO *)
+             Transaction.mark_failed tx) 
+    end;
+  let run_packet packet =
+    let tid, rid, ty, data = Xenbus.Xb.Packet.unpack packet in
+    Logging.debug "testable" "tid: %d" tid ;
+    let tid = if tid <> 0 then Hashtbl.find !t.txidtbl tid else tid in
+    let req : Packet.request =
+      {Packet.tid; Packet.rid; Packet.ty; Packet.data}
+    in
+    Process.process_packet ~store:!t.store ~cons:!t.cons ~doms:!t.doms ~con ~req ;
+    Process.write_access_log ~ty ~tid ~con:(Connection.get_domstr con) ~data ;
+    let packet = Connection.peek_output con in
+    if ty = Xenbus.Xb.Op.Transaction_start then (
+      Logging.debug "testable" "Adding mapping for tid %d" next_tid ;
+      Hashtbl.add !t.txidtbl next_tid (con.Connection.next_tid - 1) ) ;
+    let tid, _rid, ty, data = Xenbus.Xb.Packet.unpack packet in
+    Process.write_answer_log ~ty ~tid ~con:(Connection.get_domstr con) ~data
+  in
+  (* TODO: also a Nodes command with multiple packets *)
+  run_packet cmd ; (* TODO: act on and clear watches? *)
+                   con
+
+let is_tx_marked_fail con p =
+  let tid = p.Xenbus.Packet.tid in
+  if tid = 0 then false
+  else begin
+    let r = try (Connection.get_transaction con tid).must_fail
+    with Not_found -> false in
+    Logging.info "testable" "TXI %d: %b" tid r;
+    r
+  end
+
+let run2 next_tid t t' (domid, cmd) =
+  let con = run next_tid t (domid, cmd) in
+  let con' = run next_tid t' (domid, cmd) in
+  (* TODO: ignore txid mismatches on transactions *)
+  if not @@ (is_tx_start cmd || is_tx_marked_fail con cmd) then
+    (* TODO: ignore disagreements when transactions are marked as failed *)
+    check_eq_exn "reply packets" ~pp:Types.pp_dump_xb ~eq:Types.equal_xb_pkts
+      con.xb con'.xb ;
+  Queue.clear con'.xb.pkt_out ;
+  Queue.clear con.xb.pkt_out
+
+module type S = sig
+  type cmd
+
+  type state
+
+  type sut
+
+  val init_state : state
+
+  val next_state : cmd -> state -> state
+
+  val init_sut : unit -> sut
+
+  val cleanup : sut -> unit
+
+  val run_cmd : cmd -> state -> sut -> bool
+
+  val precond : cmd -> state -> bool
+
+  val pp : cmd Fmt.t
+end
diff --git a/tools/ocaml/xenstored/test/types.ml b/tools/ocaml/xenstored/test/types.ml
new file mode 100644
index 0000000000..f46d20b245
--- /dev/null
+++ b/tools/ocaml/xenstored/test/types.ml
@@ -0,0 +1,437 @@
+(*
+ * Copyright (C) Citrix Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *)
+
+let domid_first_reserved = 0x7FF0
+
+type 'a eq = 'a -> 'a -> bool
+
+let hashtable_equal (eq : 'a eq) h h' =
+  Hashtbl.length h = Hashtbl.length h'
+  && Hashtbl.fold
+       (fun k v acc ->
+         acc
+         && match Hashtbl.find_opt h' k with Some x -> eq v x | None -> false)
+       h true
+
+let list_equal (eq : 'a eq) l l' =
+  try List.for_all2 eq l l' with Invalid_argument _ -> false
+
+let queue_equal eq q q' =
+  Queue.length q = Queue.length q'
+  &&
+  let list_of_queue q = Queue.fold (fun acc e -> e :: acc) [] q in
+  list_equal eq (list_of_queue q) (list_of_queue q')
+
+let pp_process_status ppf = function
+  | Unix.WEXITED code ->
+      Fmt.pf ppf "exited with code %d" code
+  | Unix.WSIGNALED osig ->
+      Fmt.pf ppf "killed by signal %a" Fmt.Dump.signal osig
+  | Unix.WSTOPPED osig ->
+      Fmt.pf ppf "stopped by signal %a" Fmt.Dump.signal osig
+
+let pp_dump_ref dump =
+  Fmt.using ( ! ) Fmt.(dump |> Fmt.braces |> prefix (const string "ref"))
+
+let pp_file_descr = Fmt.using Disk.FD.to_int Fmt.int
+
+module Quota = struct
+  open Quota
+
+  let pp_dump =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "maxent" (fun q -> q.maxent) int
+      ; Dump.field "maxsize" (fun q -> q.maxsize) int
+      ; Dump.field "cur" (fun q -> q.cur) @@ Dump.hashtbl int int ]
+
+  let drop_dom0 h =
+    (* Quota is ignored for Dom0 and will be wrong in some situations:
+       - when domains die any nodes owned by them get inherited by Dom0
+       - the root node is owned by Dom0, if its ownership is changed Dom0's quota will be off-by-one
+      Since Dom0's quota is not actually used, just drop it when comparing
+     *)
+    let h' = Hashtbl.copy h in
+    Hashtbl.remove h' 0;
+    h'
+
+  let equal q q' =
+    q.maxent = q'.maxent && q.maxsize = q'.maxsize
+    && hashtable_equal Int.equal (drop_dom0 q.cur) (drop_dom0 q'.cur)
+end
+let pp_dump_quota = Quota.pp_dump
+let equal_quota = Quota.equal
+
+module Store = struct
+  open Store
+
+  module Node = struct
+    open Node
+
+    let pp_dump ppf t =
+      let buf = dump_store_buf t in
+      Fmt.lines ppf (Buffer.contents buf)
+
+    let rec equal n n' =
+      Symbol.equal n.name n'.name
+      && Perms.equiv n.perms n'.perms
+      && String.equal n.value n'.value
+      && SymbolMap.equal equal n.children n'.children
+  end
+
+  module Path = struct
+    open Path
+
+    let pp_dump = Fmt.using to_string Fmt.string
+
+    let equal p p' = list_equal String.equal p p'
+
+    let hash (p : t) = Hashtbl.hash p
+
+    let compare (p : t) (p' : t) = compare p p'
+  end
+
+  let pp_dump =
+    let open Fmt in
+    (* only print relevant fields, expected to stay same during live-update. *)
+    Dump.record
+      [ Dump.field "stat_transaction_coalesce"
+          (fun t -> t.stat_transaction_coalesce)
+          int
+      ; Dump.field "stat_transaction_abort"
+          (fun t -> t.stat_transaction_coalesce)
+          int
+      ; Dump.field "store" (fun t -> t.root) Node.pp_dump
+      ; Dump.field "quota" (fun t -> t.quota) Quota.pp_dump ]
+
+  let equal s s' =
+    (* ignore stats *)
+    Node.equal s.root s'.root && Quota.equal s.quota s'.quota
+end
+
+let pp_dump_store = Store.pp_dump
+let equal_store = Store.equal
+
+module Xb = struct
+  open Xenbus.Xb
+
+  module Op = struct
+    open Xenbus.Op
+
+    let pp_dump = Fmt.of_to_string to_string
+
+    let equal (op : t) (op' : t) = op = op'
+  end
+
+  module Packet = struct
+    open Xenbus.Packet
+
+    let pp_dump =
+      let open Fmt in
+      Dump.record
+        [ Dump.field "tid" get_tid int
+        ; Dump.field "rid" get_rid int
+        ; Dump.field "ty" get_ty Op.pp_dump
+        ; Dump.field "data" get_data Dump.string ]
+
+    let equal (p : t) (p' : t) =
+      (* ignore TXID, it can be different after a live-update *)
+      p.rid = p'.rid && p.ty = p'.ty && p.data = p'.data
+  end
+
+  module Partial = struct
+    open Xenbus.Partial
+
+    let pp_dump =
+      let open Fmt in
+      Dump.record
+        [ Dump.field "tid" (fun p -> p.tid) int
+        ; Dump.field "rid" (fun p -> p.rid) int
+        ; Dump.field "ty" (fun p -> p.ty) Op.pp_dump
+        ; Dump.field "len" (fun p -> p.len) int
+        ; Dump.field "buf" (fun p -> p.buf) Fmt.buffer ]
+
+    let equal p p' =
+      p.tid = p'.tid && p.rid = p'.rid && p.ty = p'.ty
+      && Buffer.contents p.buf = Buffer.contents p'.buf
+  end
+
+  let pp_dump_partial_buf ppf = function
+    | HaveHdr pkt ->
+        Fmt.pf ppf "HaveHdr %a" Partial.pp_dump pkt
+    | NoHdr (i, b) ->
+        Fmt.pf ppf "NoHdr(%d, %S)" i (Bytes.to_string b)
+
+  let equal_partial_buf buf buf' =
+    match (buf, buf') with
+    | HaveHdr pkt, HaveHdr pkt' ->
+        Partial.equal pkt pkt'
+    | NoHdr (i, b), NoHdr (i', b') ->
+        i = i' && b = b'
+    | HaveHdr _, NoHdr _ | NoHdr _, HaveHdr _ ->
+        false
+
+  let pp_backend ppf = function
+    | Fd {fd} ->
+        Fmt.prefix (Fmt.const Fmt.string "Fd ") pp_file_descr ppf fd
+    | Xenmmap _ ->
+        Fmt.const Fmt.string "Xenmmap _" ppf ()
+
+  let equal_backend b b' =
+    match (b, b') with
+    | Fd fd, Fd fd' ->
+        fd = fd'
+    | Xenmmap _, Xenmmap _ ->
+        true (* can't extract the FD to compare *)
+    | Fd _, Xenmmap _ | Xenmmap _, Fd _ ->
+        false
+
+  let pp_dump =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "backend" (fun x -> x.backend) pp_backend
+      ; Dump.field "pkt_in" (fun x -> x.pkt_in) @@ Dump.queue Packet.pp_dump
+      ; Dump.field "pkt_out" (fun x -> x.pkt_out) @@ Dump.queue Packet.pp_dump
+      ; Dump.field "partial_in" (fun x -> x.partial_in) pp_dump_partial_buf
+      ; Dump.field "partial_out" (fun x -> x.partial_out) Dump.string ]
+
+  let equal_pkts xb xb' =
+    let queue_eq = queue_equal Packet.equal in
+    queue_eq xb.pkt_in xb'.pkt_in
+    && queue_eq xb.pkt_out xb'.pkt_out
+    && xb.partial_in = xb'.partial_in
+    && xb.partial_out = xb'.partial_out
+
+  let equal xb xb' = equal_backend xb.backend xb'.backend && equal_pkts xb xb'
+end
+
+let pp_dump_packet = Xb.Packet.pp_dump
+let pp_dump_xb = Xb.pp_dump
+let equal_xb = Xb.equal
+let equal_xb_pkts = Xb.equal_pkts
+
+module Packet = struct
+  open Packet
+
+  let pp_dump_request =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "tid" (fun t -> t.tid) int
+      ; Dump.field "rid" (fun t -> t.rid) int
+      ; Dump.field "ty" (fun t -> t.ty) Xb.Op.pp_dump
+      ; Dump.field "data" (fun t -> t.data) Dump.string ]
+
+  let equal_req r r' =
+    r.tid = r'.tid && r.rid = r'.rid && r.ty = r'.ty && r.data = r'.data
+
+  let pp_dump_response ppf = function
+    | Reply str ->
+        Fmt.pf ppf "Reply %S" str
+    | Error str ->
+        Fmt.pf ppf "Error %S" str
+    | Ack _ ->
+        Fmt.string ppf "Ack"
+
+  let equal_response = response_equal
+end
+
+module Transaction = struct
+  open Transaction
+
+  let pp_dump_ty ppf = function
+    | Transaction.No ->
+        Fmt.string ppf "No"
+    | Full (id, orig, canonical) ->
+        Fmt.pf ppf "Full @[(%d, %a, %a)@]" id Store.pp_dump orig Store.pp_dump
+          canonical
+
+  let equal_ty t t' =
+    match (t, t') with
+    | Transaction.No, Transaction.No ->
+        true
+    | Transaction.Full _, Transaction.Full _ ->
+        (* We expect the trees not to be identical, so we ignore any differences here.
+           The reply comparison tests will find any mismatches in observable transaction state
+        *)
+        true
+    | Transaction.No, Transaction.Full _ | Transaction.Full _, Transaction.No ->
+        false
+
+  let equal_pathop (op, path) (op', path') =
+    op = op' && Store.Path.equal path path'
+
+  let pp_dump_op = Fmt.pair Packet.pp_dump_request Packet.pp_dump_response
+
+  let equal_op (req, reply) (req', reply') =
+    Packet.equal_req req req' && Packet.equal_response reply reply'
+
+  let pp_dump =
+    let open Fmt in
+    let open Transaction in
+    Dump.record
+      [ Dump.field "ty" (fun t -> t.ty) pp_dump_ty
+      ; Dump.field "start_count" (fun t -> t.start_count) int64
+      ; Dump.field "store" (fun t -> t.store) Store.pp_dump
+      ; Dump.field "quota" (fun t -> t.quota) Quota.pp_dump
+      ; Dump.field "must_fail" (fun t -> t.must_fail) Fmt.bool
+      ; Dump.field "paths" (fun t -> t.paths)
+        @@ Dump.list (pair Xb.Op.pp_dump Store.Path.pp_dump)
+      ; Dump.field "operations" (fun t -> t.operations)
+        @@ list (pair Packet.pp_dump_request Packet.pp_dump_response)
+      ; Dump.field "read_lowpath" (fun t -> t.read_lowpath)
+        @@ option Store.Path.pp_dump
+      ; Dump.field "write_lowpath" (fun t -> t.write_lowpath)
+        @@ option Store.Path.pp_dump ]
+
+  let equal t t' =
+    equal_ty t.ty t'.ty
+    (* ignored: quota at start of transaction, not relevant
+       && Quota.equal t.quota t'.quota *)
+    (*&& list_equal equal_pathop t.paths t'.paths *)
+    (*&& list_equal equal_op t.operations t'.operations*)
+    && t.must_fail = t'.must_fail
+    (* ignore lowpath, impossible to recreate from limited migration info *)
+    (*&& Option.equal Store.Path.equal t.read_lowpath t'.read_lowpath
+    && Option.equal Store.Path.equal t.write_lowpath t'.write_lowpath *)
+end
+
+module Connection = struct
+  open Connection
+
+  let pp_dump_watch =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "token" (fun w -> w.token) Dump.string
+      ; Dump.field "path" (fun w -> w.path) Dump.string
+      ; Dump.field "base" (fun w -> w.base) Dump.string
+      ; Dump.field "is_relative" (fun w -> w.is_relative) Fmt.bool ]
+
+  let pp_dump =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "xb" (fun c -> c.xb) Xb.pp_dump
+      ; Dump.field "transactions" (fun c -> c.transactions)
+        @@ Dump.hashtbl int Transaction.pp_dump
+      ; Dump.field "next_tid" (fun t -> t.next_tid) int
+      ; Dump.field "nb_watches" (fun c -> c.nb_watches) int
+      ; Dump.field "anonid" (fun c -> c.anonid) int
+      ; Dump.field "watches" (fun c -> c.watches)
+        @@ Dump.hashtbl Dump.string (Dump.list pp_dump_watch)
+      ; Dump.field "perm" (fun c -> c.perm)
+        @@ Fmt.using Perms.Connection.to_string Fmt.string ]
+
+  let equal c c' =
+    let watch_equal w w' =
+      (* avoid recursion, these must be physically equal *)
+      w.con == c && w'.con == c' && w.token = w'.token && w.path = w'.path
+      && w.base = w'.base
+      && w.is_relative = w'.is_relative
+    in
+    Xb.equal c.xb c'.xb
+    && hashtable_equal Transaction.equal c.transactions c'.transactions
+    (* next_tid ignored, not preserved *)
+    && hashtable_equal (list_equal watch_equal) c.watches c'.watches
+    && c.nb_watches = c'.nb_watches
+    (* anonid ignored, not preserved *)
+    (* && c.anonid = c'.anonid *) && c.perm = c'.perm
+
+  let equal_watch w w' =
+    equal w.con w'.con && w.token = w'.token && w.path = w'.path
+    && w.base = w'.base
+    && w.is_relative = w'.is_relative
+end
+
+module Trie = struct
+  open Trie
+
+  let pp_dump dump_elt =
+    Fmt.Dump.iter_bindings Trie.iter (Fmt.any "trie") Fmt.string
+      Fmt.(option dump_elt)
+
+  let plus1 _ _ acc = acc + 1
+
+  let length t = fold plus1 t 0
+
+  (* Trie.iter doesn't give full path so we can't compare the paths/values exactly.
+     They will be compared as part of the individual connections
+  *)
+  let equal _eq t t' = length t = length t'
+end
+
+module Connections = struct
+  open Connections
+
+  let pp_dump =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "anonymous" (fun t -> t.anonymous)
+        @@ Dump.hashtbl Fmt.(any "") Connection.pp_dump
+      ; Dump.field "domains" (fun t -> t.domains)
+        @@ Dump.hashtbl Fmt.int Connection.pp_dump
+      ; Dump.field "ports" (fun t -> t.ports)
+        @@ Dump.hashtbl
+             (Fmt.using Xeneventchn.to_int Fmt.int)
+             Connection.pp_dump
+      ; Dump.field "watches" (fun t -> t.watches)
+        @@ Trie.pp_dump (Dump.list Connection.pp_dump_watch) ]
+
+  let equal c c' =
+    hashtable_equal Connection.equal c.anonymous c'.anonymous
+    && hashtable_equal Connection.equal c.domains c'.domains
+    (* TODO: local port changes for now *)
+    (*&& hashtable_equal Connection.equal c.ports c'.ports *)
+    && Trie.equal (list_equal Connection.equal_watch) c.watches c'.watches
+end
+
+let pp_dump_connections = Connections.pp_dump
+let equal_connections = Connections.equal
+
+module Domain = struct
+  open Domain
+
+  let pp_dump =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "id" Domain.get_id int
+      ; Dump.field "remote_port" Domain.get_remote_port int
+      ; Dump.field "bad_client" Domain.is_bad_domain bool
+      ; Dump.field "io_credit" Domain.get_io_credit int
+      ; Dump.field "conflict_credit" (fun t -> t.conflict_credit) float
+      ; Dump.field "caused_conflicts" (fun t -> t.caused_conflicts) int64 ]
+
+  (* ignore stats fields *)
+  let equal t t' = t.id = t'.id && t.remote_port = t'.remote_port
+end
+
+module Domains = struct
+  open Domains
+
+  let pp_dump =
+    let open Fmt in
+    Dump.record
+      [ Dump.field "table" (fun t -> t.table)
+        @@ Dump.hashtbl Fmt.int Domain.pp_dump
+      ; Dump.field "doms_conflict_paused" (fun t -> t.doms_conflict_paused)
+        @@ Dump.queue (pp_dump_ref @@ Dump.option Domain.pp_dump)
+      ; Dump.field "doms_with_conflict_penalty" (fun t ->
+            t.doms_with_conflict_penalty)
+        @@ Dump.queue (pp_dump_ref @@ Dump.option Domain.pp_dump)
+      ; Dump.field "n_paused" (fun t -> t.n_paused) int
+      ; Dump.field "n_penalised" (fun t -> t.n_penalised) int ]
+
+  (* ignore statistic fields *)
+  let equal t t' = hashtable_equal Domain.equal t.table t'.table
+end
+let pp_dump_domains = Domains.pp_dump
+let equal_domains = Domains.equal
diff --git a/tools/ocaml/xenstored/test/xenstored_test.ml b/tools/ocaml/xenstored/test/xenstored_test.ml
index e86b68e867..acf3209087 100644
--- a/tools/ocaml/xenstored/test/xenstored_test.ml
+++ b/tools/ocaml/xenstored/test/xenstored_test.ml
@@ -1,2 +1,147 @@
-open Xenstored
-let () = ()
+open Testable
+open Generator
+module Cb = Crowbar
+
+let random_path = Cb.list Cb.bytes
+
+let value = Cb.bytes
+
+let token = Cb.bytes
+
+let permty =
+  [Perms.READ; Perms.WRITE; Perms.RDWR; Perms.NONE]
+  |> List.map Cb.const |> Cb.choose
+
+let new_domid = Cb.range ~min:1 Types.domid_first_reserved
+
+let port = Cb.range 0xFFFF_FFFF (*uint32_t*)
+
+let arb_cmd =
+  let open Command in
+  let path =
+    Cb.choose
+      [ Cb.map [Cb.int] (fun rnd state -> PathObserver.choose_path state rnd)
+      ; Cb.map [random_path] (fun x _ -> Store.Path.to_string x) ]
+  in
+  let domid =
+    Cb.map [Cb.int] (fun rnd state -> PathObserver.choose_domid state rnd)
+  in
+  let perms =
+    Cb.map [domid; permty; Cb.pair domid permty |> Cb.list]
+    @@ fun idgen owner other state ->
+    let other = List.map (fun (idgen, ty) -> (idgen state, ty)) other in
+    Perms.Node.create (idgen state) owner other
+  in
+  let guard' ~f gen state =
+    let v = gen state in
+    Cb.guard (f v) ;
+    v
+  in
+  let cmd =
+    let open Testable.Command in
+    Cb.choose
+      [ Cb.map [path] cmd_read
+      ; Cb.map [path; value] cmd_write
+      ; Cb.map [path] cmd_mkdir
+      ; Cb.map [path] (fun p -> cmd_rm @@ guard' ~f:(fun p -> p <> "/") p)
+      ; Cb.map [path] cmd_directory
+      ; Cb.map [path] cmd_getperms
+      ; Cb.map [path; perms] cmd_setperms
+      ; Cb.map [path; token] cmd_watch
+      ; Cb.map [path; token] cmd_unwatch
+      ; Cb.const cmd_reset_watches
+      ; Cb.const cmd_transaction_start
+      ; Cb.map [Cb.bool] cmd_transaction_end
+      ; Cb.map [new_domid; port] cmd_introduce
+      ; Cb.map [domid] (fun idgen ->
+            cmd_release @@ guard' ~f:(fun id -> id <> 0) idgen)
+      ; Cb.map [domid] cmd_getdomainpath
+      ; Cb.map [domid] cmd_isintroduced
+      ; Cb.map [domid; domid] cmd_set_target
+      ; Cb.const cmd_liveupdate ]
+  in
+  Cb.map [domid; Cb.int; cmd] (fun this rnd cmd state ->
+      let this = this state in
+      let txid = PathObserver.choose_txid_opt state this rnd in
+      let cmd = cmd txid state in
+      (this, cmd))
+
+(* based on QCSTM *)
+module Make (Spec : sig
+  include Testable.S
+
+  val arb_cmd : (state -> cmd) Crowbar.gen
+end) =
+struct
+  let arb_cmds =
+    Crowbar.with_printer (Fmt.Dump.list Spec.pp)
+    @@ Crowbar.map [Crowbar.list1 Spec.arb_cmd] (fun cmdgens ->
+           let cmds, _ =
+             List.fold_left
+               (fun (cmds, s) f ->
+                 let cmd = f s in
+                 Crowbar.check (Spec.precond cmd s) ;
+                 (cmd :: cmds, Spec.next_state cmd s))
+               ([], Spec.init_state) cmdgens
+           in
+           List.rev cmds)
+
+  let interp_agree sut cs =
+    List.fold_left
+      (fun s cmd ->
+        Crowbar.check
+          ( try Spec.run_cmd cmd s sut
+            with Failure msg -> Crowbar.failf "%a" Fmt.lines msg ) ;
+        Spec.next_state cmd s)
+      Spec.init_state cs
+
+  let agree_prop cs =
+    let on_exn e bt logs =
+      List.iter prerr_endline logs ;
+      Printexc.raise_with_backtrace e bt
+    in
+    Testable.with_logger ~on_exn (fun () ->
+        let sut = Spec.init_sut () in
+        Stdext.finally (fun () -> 
+        let (_ : Spec.state) = interp_agree sut cs in ())
+        (fun () -> 
+        Spec.cleanup sut))
+
+  let agree_test ~name = Crowbar.add_test ~name [arb_cmds] agree_prop
+end
+
+module LU = Make (struct
+  include PathObserver
+
+  type cmd = int * Testable.Command.t
+
+  type sut = Testable.t ref * Testable.t ref
+
+  let arb_cmd = arb_cmd
+
+  let init_sut () =
+    let sut1 = Testable.create () in
+    Testable.init sut1 ;
+    let sut2 = Testable.create ~live_update:true () in
+    Testable.init sut2 ;
+    let sut1 = ref sut1 in
+    let sut2 = ref sut2 in
+    (sut1, sut2)
+
+  let cleanup (sut1, sut2) =
+    Testable.cleanup !sut1 ; Testable.cleanup !sut2
+
+  let run_cmd cmd state (sut1, sut2) =
+    Testable.run2 state.next_tid sut1 sut2 cmd ;
+    true
+end)
+
+let () =
+  (* Crowbar runs at_exit, and after bisect's coverage dumper,
+     registering an at_exit here would run *before* Crowbar starts,
+     hence the nested at_exit which puts the bisect dumper in the proper place
+     to dump coverage *after* crowbar is finished.
+   *)
+  (* at_exit (fun () -> at_exit Bisect.Runtime.write_coverage_data);*)
+  print_endline "";
+  LU.agree_test ~name:"live-update-agree";
diff --git a/tools/ocaml/xenstored/test/xs_protocol.ml b/tools/ocaml/xenstored/test/xs_protocol.ml
new file mode 100644
index 0000000000..b5da2aff34
--- /dev/null
+++ b/tools/ocaml/xenstored/test/xs_protocol.ml
@@ -0,0 +1,733 @@
+(*
+ * Copyright (C) Citrix Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *)
+
+let ( |> ) f g = g f
+let ( ++ ) f g x = f (g x)
+
+module Op = struct
+  type t =
+    | Debug | Directory | Read | Getperms
+    | Watch | Unwatch | Transaction_start
+    | Transaction_end | Introduce | Release
+    | Getdomainpath | Write | Mkdir | Rm
+    | Setperms | Watchevent | Error | Isintroduced
+    | Resume | Set_target
+    | Reset_watches | Directory_part
+
+  let to_int32 = function
+    | Debug -> 0l
+    | Directory -> 1l
+    | Read -> 2l
+    | Getperms -> 3l
+    | Watch -> 4l
+    | Unwatch -> 5l
+    | Transaction_start -> 6l
+    | Transaction_end -> 7l
+    | Introduce -> 8l
+    | Release -> 9l
+    | Getdomainpath -> 10l
+    | Write -> 11l
+    | Mkdir -> 12l
+    | Rm -> 13l
+    | Setperms -> 14l
+    | Watchevent -> 15l
+    | Error -> 16l
+    | Isintroduced -> 17l
+    | Resume -> 18l
+    | Set_target -> 19l
+    | Reset_watches -> 21l (* 20 is reserved *)
+    | Directory_part -> 22l
+
+  (* The index of the value in the array is the integer representation used
+     by the wire protocol. Every element of t exists exactly once in the array. *)
+  let on_the_wire =
+    let a = Array.make 23 None in
+    ListLabels.iter
+      ~f:(fun v -> a.(v |> to_int32 |> Int32.to_int) <- Some v)
+      [ Debug; Directory; Read; Getperms; Watch; Unwatch; Transaction_start
+      ; Transaction_end; Introduce; Release; Getdomainpath; Write; Mkdir; Rm
+      ; Setperms; Watchevent; Error; Isintroduced; Resume; Set_target
+      ; Reset_watches; Directory_part ] ;
+    a
+
+  let of_int32 i =
+    let i = Int32.to_int i in
+    if i >= 0 && i < Array.length on_the_wire then on_the_wire.(i) else None
+
+  let to_string = function
+    | Debug             -> "debug"
+    | Directory         -> "directory"
+    | Read              -> "read"
+    | Getperms          -> "getperms"
+    | Watch             -> "watch"
+    | Unwatch           -> "unwatch"
+    | Transaction_start -> "transaction_start"
+    | Transaction_end   -> "transaction_end"
+    | Introduce         -> "introduce"
+    | Release           -> "release"
+    | Getdomainpath     -> "getdomainpath"
+    | Write             -> "write"
+    | Mkdir             -> "mkdir"
+    | Rm                -> "rm"
+    | Setperms          -> "setperms"
+    | Watchevent        -> "watchevent"
+    | Error             -> "error"
+    | Isintroduced      -> "isintroduced"
+    | Resume            -> "resume"
+    | Set_target        -> "set_target"
+    | Reset_watches     -> "reset_watches"
+    | Directory_part    -> "directory_part"
+end
+
+let split_string ?limit:(limit=max_int) c s =
+  let len = String.length s in
+  let next_c from =
+    try
+      Some (String.index_from s from c)
+    with
+    | Not_found -> None
+  in
+  let decr n = max 0 (n-1) in
+  let rec loop n from acc =
+    match decr n, next_c from with
+    | 0, _
+    | _, None ->
+      (* No further instances of c, or we've reached limit *)
+      String.sub s from (len - from) :: acc
+    | n', Some idx ->
+      let a = String.sub s from (idx - from) in
+      (loop[@tailcall]) n' (idx + 1) (a :: acc)
+  in loop limit 0 [] |> List.rev
+
+
+module ACL = struct
+  type perm =
+    | NONE
+    | READ
+    | WRITE
+    | RDWR
+
+  let char_of_perm = function
+    | READ -> 'r'
+    | WRITE -> 'w'
+    | RDWR -> 'b'
+    | NONE -> 'n'
+
+  let perm_of_char = function
+    | 'r' -> Some READ
+    | 'w' -> Some WRITE
+    | 'b' -> Some RDWR
+    | 'n' -> Some NONE
+    | _ -> None
+
+  type domid = int
+
+  type t = {
+    owner: domid;             (** domain which "owns", has full access *)
+    other: perm;              (** default permissions for all others... *)
+    acl: (domid * perm) list; (** ... unless overridden in the ACL *)
+  }
+
+  let to_string perms =
+    let string_of_perm (id, perm) = Printf.sprintf "%c%u" (char_of_perm perm) id in
+    String.concat "\000" (List.map string_of_perm ((perms.owner,perms.other) :: perms.acl))
+
+  let of_string s =
+    (* A perm is stored as '<c>domid' *)
+    let perm_of_char_exn x = match (perm_of_char x) with Some y -> y | None -> raise Not_found in
+    try
+      let perm_of_string s =
+        if String.length s < 2
+        then invalid_arg (Printf.sprintf "Permission string too short: '%s'" s);
+        int_of_string (String.sub s 1 (String.length s - 1)), perm_of_char_exn s.[0] in
+      let l = List.map perm_of_string (split_string '\000' s) in
+      match l with
+      | (owner, other) :: l -> Some { owner = owner; other = other; acl = l }
+      | [] -> Some { owner = 0; other = NONE; acl = [] }
+    with _ ->
+      None
+end
+
+type t = {
+  tid: int32;
+  rid: int32;
+  ty: Op.t;
+  len: int;
+  data: Buffer.t;
+}
+
+let sizeof_header = 16
+let get_header_ty v = Cstruct.LE.get_uint32 v 0
+let set_header_ty v x = Cstruct.LE.set_uint32 v 0 x
+let get_header_rid v = Cstruct.LE.get_uint32 v 4
+let set_header_rid v x = Cstruct.LE.set_uint32 v 4 x
+let get_header_tid v = Cstruct.LE.get_uint32 v 8
+let set_header_tid v x = Cstruct.LE.set_uint32 v 8 x
+let get_header_len v = Cstruct.LE.get_uint32 v 12
+let set_header_len v x = Cstruct.LE.set_uint32 v 12 x
+
+let to_bytes pkt =
+  let header = Cstruct.create sizeof_header in
+  let len = Int32.of_int (Buffer.length pkt.data) in
+  let ty = Op.to_int32 pkt.ty in
+  set_header_ty header ty;
+  set_header_rid header pkt.rid;
+  set_header_tid header pkt.tid;
+  set_header_len header len;
+  let result = Buffer.create 64 in
+  Buffer.add_bytes result (Cstruct.to_bytes header);
+  Buffer.add_buffer result pkt.data;
+  Buffer.to_bytes result
+
+let get_tid pkt = pkt.tid
+let get_ty pkt = pkt.ty
+let get_data pkt =
+  if pkt.len > 0 && Buffer.nth pkt.data (pkt.len - 1) = '\000' then
+    Buffer.sub pkt.data 0 (pkt.len - 1)
+  else
+    Buffer.contents pkt.data
+let get_rid pkt = pkt.rid
+
+module Parser = struct
+  (** Incrementally parse packets *)
+
+  let header_size = 16
+
+  let xenstore_payload_max = 4096 (* xen/include/public/io/xs_wire.h *)
+
+  let allow_oversize_packets = ref true
+
+  type state =
+    | Unknown_operation of int32
+    | Parser_failed of string
+    | Need_more_data of int
+    | Packet of t
+
+  type parse =
+    | ReadingHeader of int * bytes
+    | ReadingBody of t
+    | Finished of state
+
+  let start () = ReadingHeader (0, Bytes.make header_size '\000')
+
+  let state = function
+    | ReadingHeader(got_already, _) -> Need_more_data (header_size - got_already)
+    | ReadingBody pkt -> Need_more_data (pkt.len - (Buffer.length pkt.data))
+    | Finished r -> r
+
+  let parse_header str =
+    let header = Cstruct.create sizeof_header in
+    Cstruct.blit_from_string str 0 header 0 sizeof_header;
+    let ty = get_header_ty header in
+    let rid = get_header_rid header in
+    let tid = get_header_tid header in
+    let len = get_header_len header in
+
+    let len = Int32.to_int len in
+    (* A packet which is bigger than xenstore_payload_max is illegal.
+       This will leave the guest connection is a bad state and will
+       be hard to recover from without restarting the connection
+       (ie rebooting the guest) *)
+    let len = if !allow_oversize_packets then len else max 0 (min xenstore_payload_max len) in
+
+    begin match Op.of_int32 ty with
+      | Some ty ->
+        let t = {
+          tid = tid;
+          rid = rid;
+          ty = ty;
+          len = len;
+          data = Buffer.create len;
+        } in
+        if len = 0
+        then Finished (Packet t)
+        else ReadingBody t
+      | None -> Finished (Unknown_operation ty)
+    end
+
+  let input state (bytes : string) =
+    match state with
+    | ReadingHeader(got_already, (str : bytes)) ->
+      Bytes.blit_string bytes 0 str got_already (String.length bytes);
+      let got_already = got_already + (String.length bytes) in
+      if got_already < header_size
+      then ReadingHeader(got_already, str)
+      else parse_header (Bytes.to_string str)
+    | ReadingBody x ->
+      Buffer.add_string x.data bytes;
+      let needed = x.len - (Buffer.length x.data) in
+      if needed > 0
+      then ReadingBody x
+      else Finished (Packet x)
+    | Finished f -> Finished f
+end
+
+(* Should we switch to an explicit stream abstraction here? *)
+module type IO = sig
+  type 'a t
+  val return: 'a -> 'a t
+  val ( >>= ): 'a t -> ('a -> 'b t) -> 'b t
+
+  type channel
+  val read: channel -> bytes -> int -> int -> int t
+  val write: channel -> bytes -> int -> int -> unit t
+end
+
+exception Unknown_xenstore_operation of int32
+exception Response_parser_failed of string
+exception EOF
+
+type ('a, 'b) result =
+  | Ok of 'a
+  | Exception of 'b
+
+module PacketStream = functor(IO: IO) -> struct
+  let ( >>= ) = IO.( >>= )
+  let return = IO.return
+
+  type stream = {
+    channel: IO.channel;
+    mutable incoming_pkt: Parser.parse; (* incrementally parses the next packet *)
+  }
+
+  let make t = {
+    channel = t;
+    incoming_pkt = Parser.start ();
+  }
+
+  (* [recv client] returns a single Packet, or fails *)
+  let rec recv t =
+    let open Parser in match Parser.state t.incoming_pkt with
+    | Packet pkt ->
+      t.incoming_pkt <- start ();
+      return (Ok pkt)
+    | Need_more_data x ->
+      let buf = Bytes.make x '\000' in
+      IO.read t.channel buf 0 x
+      >>= (function
+          | 0 -> return (Exception EOF)
+          | n ->
+            let fragment = Bytes.sub_string buf 0 n in
+            t.incoming_pkt <- input t.incoming_pkt fragment;
+            recv t)
+    | Unknown_operation x -> return (Exception (Unknown_xenstore_operation x))
+    | Parser_failed x -> return (Exception (Response_parser_failed x))
+
+  (* [send client pkt] sends [pkt] and returns (), or fails *)
+  let send t request =
+    let req = to_bytes request in
+    IO.write t.channel req 0 (Bytes.length req)
+end
+
+module Token = struct
+  type t = string
+
+  (** [to_user_string x] returns the user-supplied part of the watch token *)
+  let to_user_string x = Scanf.sscanf x "%d:%s" (fun _ x -> x)
+
+  let to_debug_string x = x
+
+  let of_string x = x
+  let to_string x = x
+end
+
+let data_concat ls = (String.concat "\000" ls) ^ "\000"
+
+let create tid rid ty data =
+  let len = String.length data in
+  let b = Buffer.create len in
+  Buffer.add_string b data;
+  {
+    tid = tid;
+    rid = rid;
+    ty = ty;
+    len = len;
+    data = b;
+  }
+
+module Response = struct
+
+  type payload =
+    | Read of string
+    | Directory of string list
+    | Getperms of ACL.t
+    | Getdomainpath of string
+    | Transaction_start of int32
+    | Write
+    | Mkdir
+    | Rm
+    | Setperms
+    | Watch
+    | Unwatch
+    | Transaction_end
+    | Debug of string list
+    | Introduce
+    | Resume
+    | Release
+    | Set_target
+    | Reset_watches
+    | Directory_part of int * string list
+    | Isintroduced of bool
+    | Error of string
+    | Watchevent of string * string
+
+  let prettyprint_payload =
+    let open Printf in function
+      | Read x -> sprintf "Read %s" x
+      | Directory xs -> sprintf "Directory [ %s ]" (String.concat "; " xs)
+      | Getperms acl -> sprintf "Getperms %s" (ACL.to_string acl)
+      | Getdomainpath p -> sprintf "Getdomainpath %s" p
+      | Transaction_start x -> sprintf "Transaction_start %ld" x
+      | Write -> "Write"
+      | Mkdir -> "Mkdir"
+      | Rm -> "Rm"
+      | Setperms -> "Setperms"
+      | Watch -> "Watch"
+      | Unwatch -> "Unwatch"
+      | Transaction_end -> "Transaction_end"
+      | Debug xs -> sprintf "Debug [ %s ]" (String.concat "; " xs)
+      | Introduce -> "Introduce"
+      | Resume -> "Resume"
+      | Release -> "Release"
+      | Set_target -> "Set_target"
+      | Reset_watches -> "Reset_watches"
+      | Directory_part (gencnt, xs) ->
+          sprintf "Directory_part #%d [ %s ]" gencnt (String.concat "; " xs)
+      | Isintroduced x -> sprintf "Isintroduced %b" x
+      | Error x -> sprintf "Error %s" x
+      | Watchevent (x, y) -> sprintf "Watchevent %s %s" x y
+
+  let ty_of_payload = function
+    | Read _ -> Op.Read
+    | Directory _ -> Op.Directory
+    | Getperms _ -> Op.Getperms
+    | Getdomainpath _ -> Op.Getdomainpath
+    | Transaction_start _ -> Op.Transaction_start
+    | Debug _ -> Op.Debug
+    | Isintroduced _ -> Op.Isintroduced
+    | Watchevent (_, _) -> Op.Watchevent
+    | Error _ -> Op.Error
+    | Write -> Op.Write
+    | Mkdir -> Op.Mkdir
+    | Rm -> Op.Rm
+    | Setperms -> Op.Setperms
+    | Watch -> Op.Watch
+    | Unwatch -> Op.Unwatch
+    | Transaction_end -> Op.Transaction_end
+    | Introduce -> Op.Introduce
+    | Resume -> Op.Resume
+    | Release -> Op.Release
+    | Set_target -> Op.Set_target
+    | Reset_watches -> Op.Reset_watches
+    | Directory_part _ -> Op.Directory_part
+
+  let ok = "OK\000"
+
+  let data_of_payload = function
+    | Read x                   -> x
+    | Directory ls             -> if ls = [] then "" else data_concat ls
+    | Getperms perms           -> data_concat [ ACL.to_string perms ]
+    | Getdomainpath x          -> data_concat [ x ]
+    | Transaction_start tid    -> data_concat [ Int32.to_string tid ]
+    | Debug items              -> data_concat items
+    | Isintroduced b           -> data_concat [ if b then "T" else "F" ]
+    | Watchevent (path, token) -> data_concat [ path; token ]
+    | Error x                  -> data_concat [ x ]
+    | _                        -> ok
+
+  let print x tid rid =
+    create tid rid (ty_of_payload x) (data_of_payload x)
+end
+
+module Request = struct
+
+  type path_op =
+    | Read
+    | Directory
+    | Directory_part of int
+    | Getperms
+    | Write of string
+    | Mkdir
+    | Rm
+    | Setperms of ACL.t
+
+  type payload =
+    | PathOp of string * path_op
+    | Getdomainpath of int
+    | Transaction_start
+    | Watch of string * string
+    | Unwatch of string * string
+    | Transaction_end of bool
+    | Debug of string list
+    | Introduce of int * Nativeint.t * int
+    | Resume of int
+    | Release of int
+    | Set_target of int * int
+    | Reset_watches
+    | Isintroduced of int
+    | Error of string
+    | Watchevent of string
+
+  open Printf
+
+  let prettyprint_pathop x = function
+    | Read -> sprintf "Read %s" x
+    | Directory -> sprintf "Directory %s" x
+    | Directory_part off -> sprintf "Directory %s @%d" x off
+    | Getperms -> sprintf "Getperms %s" x
+    | Write v -> sprintf "Write %s %s" x v
+    | Mkdir -> sprintf "Mkdir %s" x
+    | Rm -> sprintf "Rm %s" x
+    | Setperms acl -> sprintf "Setperms %s %s" x (ACL.to_string acl)
+
+  let prettyprint_payload = function
+    | PathOp (path, op) -> prettyprint_pathop path op
+    | Getdomainpath x -> sprintf "Getdomainpath %d" x
+    | Transaction_start -> "Transaction_start"
+    | Watch (x, y) -> sprintf "Watch %s %s" x y
+    | Unwatch (x, y) -> sprintf "Unwatch %s %s" x y
+    | Transaction_end x -> sprintf "Transaction_end %b" x
+    | Debug xs -> sprintf "Debug [ %s ]" (String.concat "; " xs)
+    | Introduce (x, n, y) -> sprintf "Introduce %d %nu %d" x n y
+    | Resume x -> sprintf "Resume %d" x
+    | Release x -> sprintf "Release %d" x
+    | Set_target (x, y) -> sprintf "Set_target %d %d" x y
+    | Reset_watches -> "Reset_watches"
+    | Isintroduced x -> sprintf "Isintroduced %d" x
+    | Error x -> sprintf "Error %s" x
+    | Watchevent x -> sprintf "Watchevent %s" x
+
+  exception Parse_failure
+
+  let strings data = split_string '\000' data
+
+  let one_string data =
+    let args = split_string ~limit:2 '\000' data in
+    match args with
+    | x :: [] -> x
+    | _       ->
+      raise Parse_failure
+
+  let two_strings data =
+    let args = split_string ~limit:2 '\000' data in
+    match args with
+    | a :: b :: [] -> a, b
+    | a :: [] -> a, "" (* terminating NULL removed by get_data *)
+    | _            ->
+      raise Parse_failure
+
+  let acl x = match ACL.of_string x with
+    | Some x -> x
+    | None ->
+      raise Parse_failure
+
+  let domid s =
+    let v = ref 0 in
+    let is_digit c = c >= '0' && c <= '9' in
+    let len = String.length s in
+    let i = ref 0 in
+    while !i < len && not (is_digit s.[!i]) do incr i done;
+    while !i < len && is_digit s.[!i]
+    do
+      let x = (Char.code s.[!i]) - (Char.code '0') in
+      v := !v * 10 + x;
+      incr i
+    done;
+    !v
+
+  let bool = function
+    | "F" -> false
+    | "T" -> true
+    | _ ->
+      raise Parse_failure
+
+  let parse_exn request =
+    let data = get_data request in
+    match get_ty request with
+    | Op.Read -> PathOp (data |> one_string, Read)
+    | Op.Directory -> PathOp (data |> one_string, Directory)
+    | Op.Getperms -> PathOp (data |> one_string, Getperms)
+    | Op.Getdomainpath -> Getdomainpath (data |> one_string |> domid)
+    | Op.Transaction_start -> Transaction_start
+    | Op.Write ->
+      let path, value = two_strings data in
+      PathOp (path, Write value)
+    | Op.Mkdir -> PathOp (data |> one_string, Mkdir)
+    | Op.Rm -> PathOp (data |> one_string, Rm)
+    | Op.Setperms ->
+      let path, perms = two_strings data in
+      let perms = acl perms in
+      PathOp(path, Setperms perms)
+    | Op.Watch ->
+      let path, token = two_strings data in
+      Watch(path, token)
+    | Op.Unwatch ->
+      let path, token = two_strings data in
+      Unwatch(path, token)
+    | Op.Transaction_end -> Transaction_end(data |> one_string |> bool)
+    | Op.Debug -> Debug (strings data)
+    | Op.Introduce ->
+      begin match strings data with
+        | d :: mfn :: port :: _ ->
+          let d = domid d in
+          let mfn = Nativeint.of_string mfn in
+          let port = int_of_string port in
+          Introduce (d, mfn, port)
+        | _ ->
+          raise Parse_failure
+      end
+    | Op.Resume -> Resume (data |> one_string |> domid)
+    | Op.Release -> Release (data |> one_string |> domid)
+    | Op.Set_target ->
+      let mine, yours = two_strings data in
+      let mine = domid mine and yours = domid yours in
+      Set_target(mine, yours)
+    | Op.Reset_watches -> Reset_watches
+    | Op.Directory_part ->
+        let path, offstr = two_strings data in
+        PathOp (path, Directory_part (int_of_string offstr))
+    | Op.Isintroduced -> Isintroduced (data |> one_string |> domid)
+    | Op.Error -> Error(data |> one_string)
+    | Op.Watchevent -> Watchevent(data |> one_string)
+
+  let parse request =
+    try
+      Some (parse_exn request)
+    with _ -> None
+
+  let prettyprint request =
+    Printf.sprintf "tid = %ld; rid = %ld; payload = %s"
+      (get_tid request) (get_rid request)
+      (match parse request with
+       | None -> "None"
+       | Some x -> "Some " ^ (prettyprint_payload x))
+
+  let ty_of_payload = function
+    | PathOp(_, Directory) -> Op.Directory
+    | PathOp(_, Read) -> Op.Read
+    | PathOp(_, Getperms) -> Op.Getperms
+    | Debug _ -> Op.Debug
+    | Watch (_, _) -> Op.Watch
+    | Unwatch (_, _) -> Op.Unwatch
+    | Transaction_start -> Op.Transaction_start
+    | Transaction_end _ -> Op.Transaction_end
+    | Introduce(_, _, _) -> Op.Introduce
+    | Release _ -> Op.Release
+    | Resume _ -> Op.Resume
+    | Getdomainpath _ -> Op.Getdomainpath
+    | PathOp(_, Write _) -> Op.Write
+    | PathOp(_, Mkdir) -> Op.Mkdir
+    | PathOp(_, Rm) -> Op.Rm
+    | PathOp(_, Setperms _) -> Op.Setperms
+    | Set_target (_, _) -> Op.Set_target
+    | Reset_watches -> Op.Reset_watches
+    | PathOp(_, Directory_part _) -> Op.Directory_part
+    | Isintroduced _ -> Op.Isintroduced
+    | Error _ -> Op.Error
+    | Watchevent _ -> Op.Watchevent
+
+  let transactional_of_payload = function
+    | PathOp(_, _)
+    | Transaction_end _ -> true
+    | _ -> false
+
+  let data_of_payload = function
+    | PathOp(path, Write value) ->
+      path ^ "\000" ^ value (* no NULL at the end *)
+    | PathOp(path, Setperms perms) ->
+      data_concat [ path; ACL.to_string perms ]
+    | PathOp(path, _) -> data_concat [ path ]
+    | Debug commands -> data_concat commands
+    | Watch (path, token)
+    | Unwatch (path, token) -> data_concat [ path; token ]
+    | Transaction_start -> data_concat []
+    | Transaction_end commit -> data_concat [ if commit then "T" else "F" ]
+    | Introduce(domid, mfn, port) ->
+      data_concat [
+        Printf.sprintf "%u" domid;
+        Printf.sprintf "%nu" mfn;
+        string_of_int port;
+      ]
+    | Release domid
+    | Resume domid
+    | Getdomainpath domid
+    | Isintroduced domid ->
+      data_concat [ Printf.sprintf "%u" domid; ]
+    | Reset_watches -> data_concat []
+    | Set_target (mine, yours) ->
+      data_concat [ Printf.sprintf "%u" mine; Printf.sprintf "%u" yours; ]
+    | Error _ ->
+      failwith "Unimplemented: data_of_payload (Error)"
+    | Watchevent _ ->
+      failwith "Unimplemented: data_of_payload (Watchevent)"
+
+  let print x tid rid =
+    create
+      (if transactional_of_payload x then tid else 0l)
+      rid
+      (ty_of_payload x)
+      (data_of_payload x)
+end
+
+module Unmarshal = struct
+  let some x = Some x
+  let int_of_string_opt x = try Some(int_of_string x) with _ -> None
+  let int32_of_string_opt x = try Some(Int32.of_string x) with _ -> None
+  let unit_of_string_opt x = if x = "" then Some () else None
+  let ok x = if x = "OK" then Some () else None
+
+  let string = some ++ get_data
+  let list = some ++ split_string '\000' ++ get_data
+  let acl = ACL.of_string ++ get_data
+  let int = int_of_string_opt ++ get_data
+  let int32 = int32_of_string_opt ++ get_data
+  let unit = unit_of_string_opt ++ get_data
+  let ok = ok ++ get_data
+end
+
+exception Enoent of string
+exception Eagain
+exception Eexist
+exception Invalid
+exception Error of string
+
+let response hint sent received f = match get_ty sent, get_ty received with
+  | _, Op.Error ->
+    begin match get_data received with
+      | "ENOENT" -> raise (Enoent hint)
+      | "EAGAIN" -> raise Eagain
+      | "EINVAL" -> raise Invalid
+      | "EEXIST" -> raise Eexist
+      | s -> raise (Error s)
+    end
+  | x, y when x = y ->
+    begin match f received with
+      | None -> raise (Error (Printf.sprintf "failed to parse response (hint:%s) (payload:%s)" hint (get_data received)))
+      | Some z -> z
+    end
+  | x, y ->
+    raise (Error (Printf.sprintf "unexpected packet: expected %s; got %s" (Op.to_string x) (Op.to_string y)))
+
+type address =
+  | Unix of string
+  | Domain of int
+
+let string_of_address = function
+  | Unix x -> x
+  | Domain x -> string_of_int x
+
+let domain_of_address = function
+  | Unix _ -> 0
+  | Domain x -> x
+
diff --git a/tools/ocaml/xenstored/transaction.ml b/tools/ocaml/xenstored/transaction.ml
index 17b1bdf2ea..0466b04ae3 100644
--- a/tools/ocaml/xenstored/transaction.ml
+++ b/tools/ocaml/xenstored/transaction.ml
@@ -82,6 +82,7 @@ type t = {
 	start_count: int64;
 	store: Store.t; (* This is the store that we change in write operations. *)
 	quota: Quota.t;
+	mutable must_fail: bool;
 	oldroot: Store.Node.t;
 	mutable paths: (Xenbus.Xb.Op.operation * Store.Path.t) list;
 	mutable operations: (Packet.request * Packet.response) list;
@@ -89,7 +90,7 @@ type t = {
 	mutable write_lowpath: Store.Path.t option;
 }
 let get_id t = match t.ty with No -> none | Full (id, _, _) -> id
-
+let mark_failed t = t.must_fail <- true
 let counter = ref 0L
 let failed_commits = ref 0L
 let failed_commits_no_culprit = ref 0L
@@ -117,6 +118,8 @@ let trim_short_running_transactions txn =
 		keep
 		!short_running_txns
 
+let invalid_op = Xenbus.Xb.Op.Invalid, []
+
 let make ?(internal=false) id store =
 	let ty = if id = none then No else Full(id, Store.copy store, store) in
 	let txn = {
@@ -129,6 +132,7 @@ let make ?(internal=false) id store =
 		operations = [];
 		read_lowpath = None;
 		write_lowpath = None;
+		must_fail = false;
 	} in
 	if id <> none && not internal then (
 		let now = Unix.gettimeofday () in
@@ -139,10 +143,11 @@ let make ?(internal=false) id store =
 let get_store t = t.store
 let get_paths t = t.paths
 
+let is_read_only t = t.paths = [] && not t.must_fail
 let get_root t = Store.get_root t.store
 
-let is_read_only t = t.paths = []
 let add_wop t ty path = t.paths <- (ty, path) :: t.paths
+let clear_wops t = t.paths <- []
 let add_operation ~perm t request response =
 	if !Define.maxrequests >= 0
 		&& not (Perms.Connection.is_dom0 perm)
@@ -151,7 +156,9 @@ let add_operation ~perm t request response =
 	t.operations <- (request, response) :: t.operations
 let get_operations t = List.rev t.operations
 let set_read_lowpath t path = t.read_lowpath <- get_lowest path t.read_lowpath
-let set_write_lowpath t path = t.write_lowpath <- get_lowest path t.write_lowpath
+let set_write_lowpath t path =
+	 Logging.debug "transaction" "set_writelowpath (%d) %s" (get_id t)  (Store.Path.to_string path);
+	 t.write_lowpath <- get_lowest path t.write_lowpath
 
 let path_exists t path = Store.path_exists t.store path
 
@@ -200,7 +207,7 @@ let commit ~con t =
 	let has_commited =
 	match t.ty with
 	| No                         -> true
-	| Full (_id, oldstore, cstore) ->       (* "cstore" meaning current canonical store *)
+	| Full (id, oldstore, cstore) ->       (* "cstore" meaning current canonical store *)
 		let commit_partial oldroot cstore store =
 			(* get the lowest path of the query and verify that it hasn't
 			   been modified by others transactions. *)
@@ -240,11 +247,16 @@ let commit ~con t =
 				(* we try a partial commit if possible *)
 				commit_partial oldroot cstore store
 			in
+		if t.must_fail then begin
+			Logging.info "transaction" "Transaction %d was marked to fail (by live-update)" id;
+			false
+		end else
 		if !test_eagain && Random.int 3 = 0 then
 			false
 		else
 			try_commit (Store.get_root oldstore) cstore t.store
 		in
+	Logging.info "transaction" "has_commited: %b" has_commited;
 	if has_commited && has_write_ops then
 		Disk.write t.store;
 	if not has_commited
@@ -252,3 +264,102 @@ let commit ~con t =
 	else if not !has_coalesced
 	then Logging.commit ~tid:(get_id t) ~con;
 	has_commited
+
+module LR = Disk.LiveRecord
+
+(* here instead of Store.ml to avoid dependency cycle *)
+let write_node ch txidaccess path node =
+	let value = Store.Node.get_value node in
+	let perms = Store.Node.get_perms node in
+	let path = Store.Path.of_path_and_name path (Symbol.to_string node.Store.Node.name) |> Store.Path.to_string in
+	LR.write_node_data ch ~txidaccess ~path ~value ~perms
+
+let split limit c s =
+	let limit = match limit with None -> 8 | Some x -> x in
+	String.split ~limit c s
+	
+exception Invalid_Cmd_Args
+let split_one_path data conpath =
+	let args = split (Some 2) '\000' data in
+	match args with
+	| path :: "" :: [] -> Store.Path.create path conpath
+	| _                -> raise Invalid_Cmd_Args
+	
+let dump base conpath ~conid txn ch =
+	(* TODO: implicit paths need to be converted to explicit *)
+	let txid = get_id txn in
+	LR.write_transaction_data ch ~conid ~txid;
+	let store = get_store txn in
+	let write_node_mkdir path =
+   let perms, value =	match Store.get_node store path with
+  | None -> Perms.Node.default0, "" (* need to dump mkdir anyway even if later deleted due to implicit path creation *)
+  | Some node -> Store.Node.get_perms node, Store.Node.get_value node (* not always "", e.g. on EEXIST *) in
+  LR.write_node_data ch ~txidaccess:(Some (conid, txid, LR.W)) ~path:(Store.Path.to_string path) ~value ~perms
+in
+	maybe (fun path ->
+		(* if there were any reads make sure the tree matches, remove all contents and write out subtree *)
+		match Store.get_node store path with
+		| None -> (* we've only read nodes that we ended up deleting, nothing to do *) ()
+		| Some node ->
+			write_node ch (Some (conid, txid, LR.Del)) (Store.Path.get_parent path) node;
+			let path = Store.Path.get_parent path in
+			Store.traversal node @@ fun path' node ->
+			write_node ch (Some (conid,txid, LR.R)) (List.append path path') node
+	) txn.read_lowpath;
+	(* we could do something similar for write_lowpath, but that would become 
+	 	 complicated to handle correctly wrt to permissions and quotas if there are nodes
+		 owned by other domains in the subtree.
+	*)
+	let ops = get_operations txn in
+	if ops <> [] then
+		(* mark that we had some operation, these could be failures, etc.
+			 we want to fail the transaction after a live-update,
+			 unless it is completely a no-op
+		 *)
+		let perms = Store.getperms store Perms.Connection.full_rights [] in
+		let value = Store.get_root store |> Store.Node.get_value in
+  	LR.write_node_data ch ~txidaccess:(Some (conid, txid, LR.R)) ~path:"/" ~value ~perms;
+	ListLabels.iter (fun (req, reply) ->
+		Logging.debug "transaction" "dumpop %s" (Xenbus.Xb.Op.to_string req.Packet.ty); 
+		let data = req.Packet.data in
+		let open Xenbus.Xb.Op in
+		match reply with
+		| Packet.Error _ -> ()
+		| _ ->
+		try match req.Packet.ty with
+| Debug
+| Watch
+| Unwatch
+| Transaction_start
+| Transaction_end
+| Introduce
+| Release
+| Watchevent
+| Getdomainpath
+| Error
+| Isintroduced
+| Resume
+| Set_target
+| Reset_watches
+| Invalid
+| Directory
+| (Read|Getperms) -> ()
+| (Write|Setperms) ->
+		(match (split (Some 2) '\000' data) with
+		| path :: _ :: _ ->
+	let path = Store.Path.create path conpath in
+	if req.Packet.ty = Write then
+  write_node_mkdir (Store.Path.get_parent path);(* implicit mkdir *)
+	(match Store.get_node store path with
+	| None -> ()
+	| Some node ->
+	write_node ch (Some (conid, txid, LR.W)) (Store.Path.get_parent path) node)
+	| _ -> raise Invalid_Cmd_Args)
+| Mkdir ->
+	let path = split_one_path data conpath in
+  write_node_mkdir  path;
+| Rm ->
+	let path = split_one_path data conpath |> Store.Path.to_string in
+	LR.write_node_data ch ~txidaccess:(Some (conid, txid, LR.Del)) ~path ~value:"" ~perms:Perms.Node.default0
+	with Invalid_Cmd_Args|Define.Invalid_path|Not_found-> ()
+	 ) ops
-- 
2.25.1


