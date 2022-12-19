Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B266509D1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 11:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465952.724778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7D8D-0002sH-RJ; Mon, 19 Dec 2022 10:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465952.724778; Mon, 19 Dec 2022 10:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7D8D-0002km-MC; Mon, 19 Dec 2022 10:12:25 +0000
Received: by outflank-mailman (input) for mailman id 465952;
 Mon, 19 Dec 2022 09:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S2HB=4R=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1p7CuD-0000Gb-JZ
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 09:57:57 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ab084b0-7f83-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 10:57:53 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id h16so8015752wrz.12
 for <xen-devel@lists.xenproject.org>; Mon, 19 Dec 2022 01:57:55 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff94f000000b002368a6deaf8sm9429092wrr.57.2022.12.19.01.57.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:57:54 -0800 (PST)
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
X-Inumbo-ID: 9ab084b0-7f83-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8QxQCsmIRAeOYBnoDHckZghYDVXBqa5X1/cfVaiq90=;
        b=Jz3fxgVnTmgzvZ4nscd+B131GVmFEcegh4iSvgEJW2/Xjy9kdlYNGgBJIJW/9UJEPY
         9aHv5HDaHTCsYSIOm57rFbdlgWro8GSatkX8S6mU8jzbG4vDIlcuw5pFvdxxUtAo0SQl
         X/befPUhQ78m9g9HLAo+IbfGtVhxewPaFrNaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8QxQCsmIRAeOYBnoDHckZghYDVXBqa5X1/cfVaiq90=;
        b=EQrqK2GBJXeARStNt4PhSvHaXpKqcjuL6Uf+LJqyoBK4qRhdFgKOKcqSr6J4a0pa6N
         NDvwvqvGDK4Qf5HYlqEeHsgPPXIwYH1GOuJAdbF/nbWKkQVXaoLmww9W9FOlsTmUt1IE
         GUS6YF1YKcbiK9iybGKYVwPYzgvvhBhwzfJBMzapAGtd5mbpzPmo3zIUb3Ps8qA2jOQF
         2aI19n7hhLB5Hm/LC0TqVfn6hgGM+82f/JCLFUIWSSTcAPJT4Tk3TuLvkXPLTIvaBl0X
         6HN+zwLMHfo88pz6C+0gUMEkHMRfk15xyjcYedOZSg7S1O3GBQri+ODIXTxAmyUxOi/F
         rK8A==
X-Gm-Message-State: ANoB5pkSiOGgQnmGzak1+v90cflt/J55uyy3yh9w+IdPFrwFdhYoAJ8i
	k50E95sZIr/Kscps/xgQ4KAlag==
X-Google-Smtp-Source: AA0mqf6P097HuZVuUn58VW6LOiN6h5l9Mwewi7JRR7Nanp6qxRSpvzL39KIYaoIYimd7PfyMtiSYIQ==
X-Received: by 2002:a5d:4ad1:0:b0:242:20c9:437f with SMTP id y17-20020a5d4ad1000000b0024220c9437fmr25812243wrs.38.1671443875198;
        Mon, 19 Dec 2022 01:57:55 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v4 10/11] tools/ocaml/xenstored: validate config file
 before live update
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <421BC7DB-EA22-4EB2-883A-21E136367820@citrix.com>
Date: Mon, 19 Dec 2022 09:57:44 +0000
Cc: Edwin Torok <edvin.torok@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <081E2E6A-1DC4-422B-9568-9465C27E4943@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <a9414ef542c7c5c7f1423efdf1a117431ae569b6.1671214525.git.edwin.torok@cloud.com>
 <421BC7DB-EA22-4EB2-883A-21E136367820@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)



> On 19 Dec 2022, at 09:37, Christian Lindig =
<christian.lindig@citrix.com> wrote:
>=20
>=20
>=20
>> On 16 Dec 2022, at 18:25, Edwin T=C3=B6r=C3=B6k =
<edvin.torok@citrix.com> wrote:
>>=20
>> The configuration file can contain typos or various errors that could =
prevent
>> live update from succeeding (e.g. a flag only valid on a different =
version).
>> Unknown entries in the config file would be ignored on startup =
normally,
>> add a strict --config-test that live-update can use to check that the =
config file
>> is valid *for the new binary*.
>=20
> Is the configuration tested, checked, or validated? If feel =E2=80=9Cche=
ck" or =E2=80=9Cvalidate" would convey better what is happening.

The rest of the code talks about validation, so I've renamed this to =
config-validate.

>=20
>=20
>> For compatibility with running old code during live update recognize
>> --live --help as an equivalent to --config-test.
>>=20
>> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.com
>=20
> Acked-by: Christian Lindig <christian.lindig@citrix.com>


Thanks, I've pushed an update commit with this change here: =
https://github.com/edwintorok/xen/compare/staging...private/edvint/review5=
,
in particular =
https://github.com/edwintorok/xen/commit/f1a9153bb867bbb5df0f5e17b1ed3348e=
7ea79f8

Best regards,
--Edwin
>=20
>>>=20
>> ---
>> Changes since v2:
>> * repost of lost patch from 2021: =
https://patchwork.kernel.org/project/xen-devel/patch/a53934dfa8ef984bffa85=
8cc573cc7a6445bbdc0.1620755942.git.edvin.torok@citrix.com/
>> ---
>> tools/ocaml/xenstored/parse_arg.ml | 26 ++++++++++++++++++++++++++
>> tools/ocaml/xenstored/xenstored.ml | 11 +++++++++--
>> 2 files changed, 35 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/ocaml/xenstored/parse_arg.ml =
b/tools/ocaml/xenstored/parse_arg.ml
>> index 1a85b14ef5..b159b91f00 100644
>> --- a/tools/ocaml/xenstored/parse_arg.ml
>> +++ b/tools/ocaml/xenstored/parse_arg.ml
>> @@ -26,8 +26,14 @@ type config =3D
>>    restart: bool;
>>    live_reload: bool;
>>    disable_socket: bool;
>> +    config_test: bool;
>>  }
>>=20
>> +let get_config_filename config_file =3D
>> +  match config_file with
>> +  | Some name -> name
>> +  | None      -> Define.default_config_dir ^ "/oxenstored.conf"
>=20
> I=E2=80=99d use Filename.concat.
>=20
>> +
>> let do_argv =3D
>>  let pidfile =3D ref "" and tracefile =3D ref "" (* old xenstored =
compatibility *)
>>  and domain_init =3D ref true
>> @@ -38,6 +44,8 @@ let do_argv =3D
>>  and restart =3D ref false
>>  and live_reload =3D ref false
>>  and disable_socket =3D ref false
>> +  and config_test =3D ref false
>> +  and help =3D ref false
>>  in
>>=20
>>  let speclist =3D
>> @@ -55,10 +63,27 @@ let do_argv =3D
>>      ("-T", Arg.Set_string tracefile, ""); (* for compatibility *)
>>      ("--restart", Arg.Set restart, "Read database on starting");
>>      ("--live", Arg.Set live_reload, "Read live dump on startup");
>> +      ("--config-test", Arg.Set config_test, "Test validity of =
config file");
>=20
> I see the logic how this flag was named but feel starting with a verb =
(=E2=80=9Cvalidate=E2=80=9D, =E2=80=9Ccheck=E2=80=9D, =E2=80=9Ctest=E2=80=9D=
) leads to a clearer invocation pattern.
>=20
>>      ("--disable-socket", Arg.Unit (fun () -> disable_socket :=3D =
true), "Disable socket");
>> +      ("--help", Arg.Set help, "Display this list of options")
>>    ] in
>>  let usage_msg =3D "usage : xenstored [--config-file <filename>] =
[--no-domain-init] [--help] [--no-fork] [--reraise-top-level] =
[--restart] [--disable-socket]" in
>>  Arg.parse speclist (fun _ -> ()) usage_msg;
>> +  let () =3D
>> +    if !help then begin
>> +      if !live_reload then
>> +        (*
>> +          Transform --live --help into --config-test for backward =
compat with
>> +          running code during live update.
>> +          Caller will validate config and exit
>> +        *)
>> +        config_test :=3D true
>> +      else begin
>> +        Arg.usage_string speclist usage_msg |> print_endline;
>> +        exit 0
>> +      end
>> +    end
>> +  in
>>  {
>>    domain_init =3D !domain_init;
>>    activate_access_log =3D !activate_access_log;
>> @@ -70,4 +95,5 @@ let do_argv =3D
>>    restart =3D !restart;
>>    live_reload =3D !live_reload;
>>    disable_socket =3D !disable_socket;
>> +    config_test =3D !config_test;
>>  }
>> diff --git a/tools/ocaml/xenstored/xenstored.ml =
b/tools/ocaml/xenstored/xenstored.ml
>> index 366437b396..1aaa3e995e 100644
>> --- a/tools/ocaml/xenstored/xenstored.ml
>> +++ b/tools/ocaml/xenstored/xenstored.ml
>> @@ -88,7 +88,7 @@ let default_pidfile =3D Paths.xen_run_dir ^ =
"/xenstored.pid"
>>=20
>> let ring_scan_interval =3D ref 20
>>=20
>> -let parse_config filename =3D
>> +let parse_config ?(strict=3Dfalse) filename =3D
>>  let pidfile =3D ref default_pidfile in
>>  let options =3D [
>>    ("merge-activate", Config.Set_bool Transaction.do_coalesce);
>> @@ -129,11 +129,12 @@ let parse_config filename =3D
>>    ("xenstored-port", Config.Set_string Domains.xenstored_port); ] in
>>  begin try Config.read filename options (fun _ _ -> raise Not_found)
>>    with
>> -    | Config.Error err -> List.iter (fun (k, e) ->
>> +    | Config.Error err as e -> List.iter (fun (k, e) ->
>>        match e with
>>        | "unknown key" -> eprintf "config: unknown key %s\n" k
>>        | _             -> eprintf "config: %s: %s\n" k e
>>      ) err;
>> +      if strict then raise e
>>    | Sys_error m -> eprintf "error: config: %s\n" m;
>>  end;
>>  !pidfile
>> @@ -358,6 +359,12 @@ let tweak_gc () =3D
>> let () =3D
>>  Printexc.set_uncaught_exception_handler =
Logging.fallback_exception_handler;
>>  let cf =3D do_argv in
>> +  if cf.config_test then begin
>> +    let path =3D config_filename cf in
>> +    let _pidfile:string =3D parse_config ~strict:true path in
>> +    Printf.printf "Configuration valid at %s\n%!" path;
>> +    exit 0
>> +  end;
>>  let pidfile =3D
>>    if Sys.file_exists (config_filename cf) then
>>      parse_config (config_filename cf)
>> --=20
>> 2.34.1
>>=20
>=20


