Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FEAA34036
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:23:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887571.1297037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZB8-0001iB-2C; Thu, 13 Feb 2025 13:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887571.1297037; Thu, 13 Feb 2025 13:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZB7-0001g1-US; Thu, 13 Feb 2025 13:22:53 +0000
Received: by outflank-mailman (input) for mailman id 887571;
 Thu, 13 Feb 2025 13:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Beo7=VE=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1tiZB6-0001fv-6K
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:22:52 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eea6aa3-ea0d-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 14:22:50 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso117847066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 05:22:49 -0800 (PST)
Received: from smtpclient.apple ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf5casm129645066b.182.2025.02.13.05.22.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Feb 2025 05:22:48 -0800 (PST)
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
X-Inumbo-ID: 9eea6aa3-ea0d-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739452969; x=1740057769; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA7vjQPJnDwLm4eEbnarCJ0Dm1COAsh/LxG3H4lSN9c=;
        b=AhNt8A9CK2ehizVOc7l7Eu8HeUJPl+WF/RX9SpWu6r5h6gfiT4I+EWKbY62fJyU9uc
         YjKqT2RE6VwJG0XYtzpARychnlD3cPjdkHxJQUi+1rtxHosKR6V2eZNoRTweUxNNfLaG
         XpqCsU+xQZrVEEFHNOd45CroVKVXzr6F6w9aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739452969; x=1740057769;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zA7vjQPJnDwLm4eEbnarCJ0Dm1COAsh/LxG3H4lSN9c=;
        b=If8KE5WSOpn6HZDppAbJRpyfAgc59N17DwMEyf7p5nlaFE5fb1nwzgVMwEh8UFYGL6
         xoEbPYoyIHx/G2mFB3U4mYEtsFfw4OFUgHxJmaZ3wx+NTyIdAMksXVkr4IA+zrnVhEnO
         kf2bCFNXx38SAhMKa4zZIMMXyVFEOQ3dgq1Mm3htQ6NBhz2yiYT3lZXCmtYNec5wFZgc
         Zi7We/ekv34A1OYST5LSqoMbtwzB+h5qm4kpLBEFHW+wghI6Yp4CthPgmAS+cNHVl7hb
         qnk2yC0auPZphYONEFApqU0BbdpRUhEC3fFytlhj0y9f5emj1FGEaA9EiJxMet6Qs4/1
         hSqA==
X-Gm-Message-State: AOJu0Yw10G8YH8NWu85oWvECMTQPu0+bMozGtQLWczqJZNPZhsq1sAcy
	qVuUu81QrcyI6e71cWSiS3uxYuhw+hodrVLSPGUQD8Tfw8yCEaPNhgzD9axes9h3P5IN+Yq+HbH
	2brasSA==
X-Gm-Gg: ASbGncvY+qLYdUWzHpYhngRP2OERzdYvAFMdNmdfgJL12fqfqq7UsU/OFeAsTx8xDwr
	gLKbfFtpOKcjH53LQcYaHuoLCwi+zBpIj7sDByZ9WehTsgIiA/90GeDoYmiHPPkAXtBoqwgURnJ
	mvpmcFig88b2FmYBNx1jBj95gB1YXcPRGurYVgkDdf8gvg5xtsb7UqiZEdB68Da51NuLkYj5T5n
	3X2/hTY2LiH538v9FL6LARAnPauFOMZL8kUqwJTTIxfiyc/uA5N9NLp9v5iAfDrK8WIs7dGiW4p
	r7uxz+jYOYYpeN2bEhIhQGwV24d1gpm7BCSUV6NC
X-Google-Smtp-Source: AGHT+IGpYu9+o/xLFbkaK7YBCw1vwDk7A8uCwqTtpDUTI0weBQ341Oh3TW9X7l0E9e+4wELUAVqaIg==
X-Received: by 2002:a17:906:f58f:b0:ab7:b043:bebd with SMTP id a640c23a62f3a-ab7f336d947mr718193766b.5.1739452968797;
        Thu, 13 Feb 2025 05:22:48 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 1/1] tools/ocaml: Fix oxenstored build warning
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <58a75da8a5e593c67817632622221af2984efc6d.1739451311.git.andrii.sultanov@cloud.com>
Date: Thu, 13 Feb 2025 13:22:37 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5EE40168-A8A8-432F-B4F0-703BD7E5F3BE@cloud.com>
References: <cover.1739451311.git.andrii.sultanov@cloud.com>
 <58a75da8a5e593c67817632622221af2984efc6d.1739451311.git.andrii.sultanov@cloud.com>
To: Andrii Sultanov <andrii.sultanov@cloud.com>
X-Mailer: Apple Mail (2.3774.600.62)

Acked-by: Christian Lindig <christian.lindig@cloud.com>

> On 13 Feb 2025, at 13:03, Andrii Sultanov <andrii.sultanov@cloud.com> =
wrote:
>=20
> OCaml, in preparation for a renaming of the error string associated =
with
> conversion failure in 'int_of_string' functions, started to issue this
> warning:
> ```
> File "process.ml", line 440, characters 13-28:
> 440 |   | (Failure "int_of_string")    -> reply_error "EINVAL"
>                   ^^^^^^^^^^^^^^^
> Warning 52 [fragile-literal-pattern]: Code should not depend on the =
actual values of
> this constructor's arguments. They are only for information
> and may change in future versions. (See manual section 11.5)
> ```
>=20
> Deal with this at the source, and instead create our own stable
> ConversionFailure exception that's raised on the None case in
> 'int_of_string_opt'.
>=20
> 'c_int_of_string' is safe and does not raise such exceptions.
>=20
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> ---
> tools/ocaml/xenstored/Makefile     |  1 +
> tools/ocaml/xenstored/perms.ml     |  2 +-
> tools/ocaml/xenstored/poll.ml      |  2 +-
> tools/ocaml/xenstored/process.ml   | 18 +++++++++---------
> tools/ocaml/xenstored/utils.ml     | 10 ++++++++--
> tools/ocaml/xenstored/xenstored.ml | 16 ++++++++--------
> 6 files changed, 28 insertions(+), 21 deletions(-)
>=20
> diff --git a/tools/ocaml/xenstored/Makefile =
b/tools/ocaml/xenstored/Makefile
> index 5e8210a906..c333394a34 100644
> --- a/tools/ocaml/xenstored/Makefile
> +++ b/tools/ocaml/xenstored/Makefile
> @@ -54,6 +54,7 @@ OBJS =3D paths \
> history \
> parse_arg \
> process \
> + poll \
> xenstored
>=20
> INTF =3D symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
> diff --git a/tools/ocaml/xenstored/perms.ml =
b/tools/ocaml/xenstored/perms.ml
> index 14f8e334fe..2c4ee9e617 100644
> --- a/tools/ocaml/xenstored/perms.ml
> +++ b/tools/ocaml/xenstored/perms.ml
> @@ -70,7 +70,7 @@ struct
>=20
>   let perm_of_string s =3D
>     let ty =3D permty_of_char s.[0]
> -    and id =3D int_of_string (String.sub s 1 (String.length s - 1)) =
in
> +    and id =3D Utils.int_of_string_exn (String.sub s 1 (String.length =
s - 1)) in
>     (id, ty)
>=20
>   let of_strings ls =3D
> diff --git a/tools/ocaml/xenstored/poll.ml =
b/tools/ocaml/xenstored/poll.ml
> index fefaa6e74c..f8571e4590 100644
> --- a/tools/ocaml/xenstored/poll.ml
> +++ b/tools/ocaml/xenstored/poll.ml
> @@ -30,7 +30,7 @@ external set_fd_limit: int -> unit =3D =
"stub_set_fd_limit"
> let get_sys_fs_nr_open () =3D
>   try
>     let ch =3D open_in "/proc/sys/fs/nr_open" in
> -    let v =3D int_of_string (input_line ch) in
> +    let v =3D Utils.int_of_string_exn (input_line ch) in
>     close_in_noerr ch; v
>   with _ -> 1024 * 1024
>=20
> diff --git a/tools/ocaml/xenstored/process.ml =
b/tools/ocaml/xenstored/process.ml
> index 432d66321c..cb4efc0fb5 100644
> --- a/tools/ocaml/xenstored/process.ml
> +++ b/tools/ocaml/xenstored/process.ml
> @@ -229,7 +229,7 @@ let do_debug con t _domains cons data =3D
>       Logging.xb_op ~tid:0 ~ty:Xenbus.Xb.Op.Debug ~con:"=3D=3D=3D=3D=3D=3D=
=3D>" msg;
>       None
>     | "quota" :: domid :: _ ->
> -      let domid =3D int_of_string domid in
> +      let domid =3D Utils.int_of_string_exn domid in
>       let quota =3D (Store.get_quota t.Transaction.store) in
>       Some (Quota.to_string quota domid ^ "\000")
>     | "watches" :: _ ->
> @@ -242,7 +242,7 @@ let do_debug con t _domains cons data =3D
>       History.trim ();
>       Some "trimmed"
>     | "txn" :: domid :: _ ->
> -      let domid =3D int_of_string domid in
> +      let domid =3D Utils.int_of_string_exn domid in
>       let con =3D Connections.find_domain cons domid in
>       let b =3D Buffer.create 128 in
>       let () =3D con.transactions |> Hashtbl.iter @@ fun id tx ->
> @@ -253,7 +253,7 @@ let do_debug con t _domains cons data =3D
>       in
>       Some (Buffer.contents b)
>     | "xenbus" :: domid :: _ ->
> -      let domid =3D int_of_string domid in
> +      let domid =3D Utils.int_of_string_exn domid in
>       let con =3D Connections.find_domain cons domid in
>       let s =3D Printf.sprintf "xenbus: %s; overflow queue length: %d, =
can_input: %b, has_more_input: %b, has_old_output: %b, has_new_output: =
%b, has_more_work: %b. pending: %s"
>           (Xenbus.Xb.debug con.xb)
> @@ -267,7 +267,7 @@ let do_debug con t _domains cons data =3D
>       in
>       Some s
>     | "mfn" :: domid :: _ ->
> -      let domid =3D int_of_string domid in
> +      let domid =3D Utils.int_of_string_exn domid in
>       let con =3D Connections.find_domain cons domid in
>       may (fun dom -> Printf.sprintf "%nd\000" (Domain.get_mfn dom)) =
(Connection.get_domain con)
>     | _ -> None
> @@ -340,7 +340,7 @@ let do_isintroduced con _t domains _cons data =3D
>   then raise Define.Permission_denied;
>   let domid =3D
>     match (split None '\000' data) with
> -    | domid :: _ -> int_of_string domid
> +    | domid :: _ -> Utils.int_of_string_exn domid
>     | _          -> raise Invalid_Cmd_Args
>   in
>   if domid =3D Define.domid_self || Domains.exist domains domid then =
"T\000" else "F\000"
> @@ -437,7 +437,7 @@ let input_handle_error ~cons ~doms ~fct ~con ~t =
~req =3D
>   | Quota.Limit_reached          -> reply_error "EQUOTA"
>   | Quota.Data_too_big           -> reply_error "E2BIG"
>   | Quota.Transaction_opened     -> reply_error "EQUOTA"
> -  | (Failure "int_of_string")    -> reply_error "EINVAL"
> +  | Utils.ConversionFailed s     -> reply_error (Printf.sprintf =
"EINVAL: Could not convert '%s' to int" s)
>   | Define.Unknown_operation     -> reply_error "ENOSYS"
>=20
> let write_access_log ~ty ~tid ~con ~data =3D
> @@ -578,7 +578,7 @@ let do_introduce con t domains cons data =3D
>   let (domid, mfn, remote_port) =3D
>     match (split None '\000' data) with
>     | domid :: mfn :: remote_port :: _ ->
> -      int_of_string domid, Nativeint.of_string mfn, int_of_string =
remote_port
> +      Utils.int_of_string_exn domid, Nativeint.of_string mfn, =
Utils.int_of_string_exn remote_port
>     | _                         -> raise Invalid_Cmd_Args;
>   in
>   let dom =3D
> @@ -604,7 +604,7 @@ let do_release con t domains cons data =3D
>   then raise Define.Permission_denied;
>   let domid =3D
>     match (split None '\000' data) with
> -    | [domid;""] -> int_of_string domid
> +    | [domid;""] -> Utils.int_of_string_exn domid
>     | _          -> raise Invalid_Cmd_Args
>   in
>   let fire_spec_watches =3D Domains.exist domains domid in
> @@ -620,7 +620,7 @@ let do_resume con _t domains _cons data =3D
>   then raise Define.Permission_denied;
>   let domid =3D
>     match (split None '\000' data) with
> -    | domid :: _ -> int_of_string domid
> +    | domid :: _ -> Utils.int_of_string_exn domid
>     | _          -> raise Invalid_Cmd_Args
>   in
>   if Domains.exist domains domid
> diff --git a/tools/ocaml/xenstored/utils.ml =
b/tools/ocaml/xenstored/utils.ml
> index 48d84ef7d3..7a556bce75 100644
> --- a/tools/ocaml/xenstored/utils.ml
> +++ b/tools/ocaml/xenstored/utils.ml
> @@ -53,8 +53,14 @@ let hexify s =3D
>     ) s;
>   Bytes.unsafe_to_string hs
>=20
> +exception ConversionFailed of string
> +let int_of_string_exn s =3D
> +  match int_of_string_opt s with
> +  | Some x -> x
> +  | None -> raise (ConversionFailed s)
> +
> let unhexify hs =3D
> -  let char_of_hexseq seq0 seq1 =3D Char.chr (int_of_string (sprintf =
"0x%c%c" seq0 seq1)) in
> +  let char_of_hexseq seq0 seq1 =3D Char.chr (int_of_string_exn =
(sprintf "0x%c%c" seq0 seq1)) in
>   let b =3D Bytes.create (String.length hs / 2) in
>   for i =3D 0 to Bytes.length b - 1
>   do
> @@ -86,7 +92,7 @@ let read_file_single_integer filename =3D
>   let buf =3D Bytes.make 20 '\000' in
>   let sz =3D Unix.read fd buf 0 20 in
>   Unix.close fd;
> -  int_of_string (Bytes.sub_string buf 0 sz)
> +  int_of_string_exn (Bytes.sub_string buf 0 sz)
>=20
> (* @path may be guest data and needs its length validating.  =
@connection_path
>  * is generated locally in xenstored and always of the form =
"/local/domain/$N/" *)
> diff --git a/tools/ocaml/xenstored/xenstored.ml =
b/tools/ocaml/xenstored/xenstored.ml
> index 1aaa3e995e..84dee622ea 100644
> --- a/tools/ocaml/xenstored/xenstored.ml
> +++ b/tools/ocaml/xenstored/xenstored.ml
> @@ -167,20 +167,20 @@ module DB =3D struct
>                   e.g. a RO socket from a previous version: ignore it =
*)
>             global_f ~rw
>           | "evtchn-dev" :: fd :: domexc_port :: [] ->
> -            evtchn_f ~fd:(int_of_string fd)
> -              ~domexc_port:(int_of_string domexc_port)
> +            evtchn_f ~fd:(Utils.int_of_string_exn fd)
> +              ~domexc_port:(Utils.int_of_string_exn domexc_port)
>           | "socket" :: fd :: [] ->
> -            socket_f ~fd:(int_of_string fd)
> +            socket_f ~fd:(Utils.int_of_string_exn fd)
>           | "dom" :: domid :: mfn :: remote_port :: rest ->
>             let local_port =3D match rest with
>               | [] -> None (* backward compat: old version didn't have =
it *)
> -              | local_port :: _ -> Some (int_of_string local_port) in
> +              | local_port :: _ -> Some (Utils.int_of_string_exn =
local_port) in
>             domain_f ?local_port
> -              ~remote_port:(int_of_string remote_port)
> -              (int_of_string domid)
> +              ~remote_port:(Utils.int_of_string_exn remote_port)
> +              (Utils.int_of_string_exn domid)
>               (Nativeint.of_string mfn)
>           | "watch" :: domid :: path :: token :: [] ->
> -            watch_f (int_of_string domid)
> +            watch_f (Utils.int_of_string_exn domid)
>               (unhexify path) (unhexify token)
>           | "store" :: path :: perms :: value :: [] ->
>             store_f (getpath path)
> @@ -214,7 +214,7 @@ module DB =3D struct
>     in
>     let global_f ~rw =3D
>       let get_listen_sock sockfd =3D
> -        let fd =3D sockfd |> int_of_string |> Utils.FD.of_int in
> +        let fd =3D sockfd |> Utils.int_of_string_exn |> =
Utils.FD.of_int in
>         Unix.listen fd 1;
>         Some fd
>       in
> --=20
> 2.39.5
>=20


