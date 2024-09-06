Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA596F6B1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 16:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791882.1201904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZyi-0006S3-D3; Fri, 06 Sep 2024 14:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791882.1201904; Fri, 06 Sep 2024 14:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZyi-0006Ps-AE; Fri, 06 Sep 2024 14:30:24 +0000
Received: by outflank-mailman (input) for mailman id 791882;
 Fri, 06 Sep 2024 14:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smZyh-0006Pi-1M
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 14:30:23 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bdb7589-6c5c-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 16:30:21 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5333b2fbedaso3669498e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 07:30:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623a6c68sm286194966b.177.2024.09.06.07.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 07:30:19 -0700 (PDT)
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
X-Inumbo-ID: 8bdb7589-6c5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725633020; x=1726237820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kr2g0rUcBXdOgXKEjApQ2S8t++2z3wfUBGsQjgUsplo=;
        b=WMI3xhqYBMCzEK/xVC80hbMQHeguQd9zBh8vpDgj0sULdW0r89WT4GORWwPjGEUAJM
         tToZ/T+Z87AJTrRiXeYpzLLWyJZXjOM76Wfu33E/4MLuyh1DwXS8PJV0Du/RmsUENj+D
         uS81YpeVsyiYAg5zIQfzt/GgxYLTqalFNLpvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725633020; x=1726237820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr2g0rUcBXdOgXKEjApQ2S8t++2z3wfUBGsQjgUsplo=;
        b=cXQ27OnY0QXIUb5jdDDFywuhEMKtGuIxf/Wq8+HV5FSGx/scJUqodm8QD7TUWHATNI
         /hf8b8rp4UBXQ1i5uRMw2khzgB/c7UY8ZoG3CTl4TxPoKLoCRxYNnh8JnfoMRC6ZSZ8l
         qehvsvEall5GzLdpFBSuXtUncRqf9q2FjtxZSYAdnpyh1i71UCS5x/qvO/IAJH1Mc4hY
         Ohwad/l05FDpz1lrslF9CJm8oe1WtR1Nj5aCEpLL34Oq7e3fHVJsOE4NoZ6RxKmBIa7q
         HQeMtwMD2xKxskJUTgWZMTSRKhVScVTZZ3RSb5G96cgVovviUZtGJ9E97q8D4linWmgl
         X5hg==
X-Forwarded-Encrypted: i=1; AJvYcCUwQYsNwuSGfHGsXEhjGZDzPsxbUE3FrUhIkzyOEeM/SHRr7J5FKoTDEYn7geoogR5hNAZ9aATb3ng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYjUVIfMEY15RqRtCl6dF6kE4KSLTEljzYddBuDsu36m1AOS6c
	2fe8Fo5BjNcMcAMW8XFa6tamDKdHJYQPHiVVQLOZTA13k3MiL4151kBsKswmBhM=
X-Google-Smtp-Source: AGHT+IGNDACKP2xJnvWR6btduIi1rMP4DY3PRVK8NWtC+KnYItyU1H5HdnB9Tb10LD+rGGSCF0roqA==
X-Received: by 2002:a05:6512:694:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-536587ac1abmr1784627e87.22.1725633020148;
        Fri, 06 Sep 2024 07:30:20 -0700 (PDT)
Message-ID: <64ac04d8-73e7-41b2-bab7-9ea84e9d7e17@citrix.com>
Date: Fri, 6 Sep 2024 15:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tools/oxenstored: Use the plugin for
 Xenctrl.domain_getinfo
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
 <ffd83cc13f440605337ff018c9b2ccdd3a4be0c4.1725363427.git.andrii.sultanov@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ffd83cc13f440605337ff018c9b2ccdd3a4be0c4.1725363427.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 12:44 pm, Andrii Sultanov wrote:
> diff --git a/m4/paths.m4 b/m4/paths.m4
> index 3f94c62efb..533bac919b 100644
> --- a/m4/paths.m4
> +++ b/m4/paths.m4
> @@ -144,6 +144,10 @@ XEN_LIB_DIR=$localstatedir/lib/xen
>  AC_SUBST(XEN_LIB_DIR)
>  AC_DEFINE_UNQUOTED([XEN_LIB_DIR], ["$XEN_LIB_DIR"], [Xen's lib dir])
>  
> +XEN_CTRL_DOMAININFO_PLUGIN=$LIBEXEC_BIN/xenstored_glue/xenctrl_plugin
> +AC_SUBST(XEN_CTRL_DOMAININFO_PLUGIN)
> +AC_DEFINE_UNQUOTED([XEN_CTRL_DOMAININFO_PLUGIN], ["$XEN_CTRL_DOMAININFO_PLUGIN"], [Xenctrl's plugin for Oxenstored])
> +

This is somewhat complicated, and I'm not sure what to suggest.

As far as this patch goes, it's "where should Oxenstored look for it's
plugin in the target system"

But, with that intent, the prior patch's install rule needs to know
"where should ocaml plugins be put in the target system".


That said, it isn't really configurable.  It's just a path formed of
other ./configure fragments, so IMO it would be better to not add a
toplevel new path.  Just opencode it on the one line lower down, like
the install rule was in the previous patch.

Finally, looking at the XenServer spec, the path is:

%{_libexecdir}/%{name}/bin/xenstored_glue/xenctrl_plugin/domain_getinfo_v1.cmxs

Its not really /bin/ appropriate, so perhaps this:

%{_libexecdir}/%{name}/ocaml/xenstored_glue/xenctrl_plugin/domain_getinfo_v1.cmxs

which would mean that you just want $LIBEXEC as a base.

> diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
> index 7a3056c364..dfff84c918 100644
> --- a/tools/ocaml/xenstored/domains.ml
> +++ b/tools/ocaml/xenstored/domains.ml
> @@ -20,10 +20,36 @@ let warn fmt  = Logging.warn  "domains" fmt
>  
>  let xc = Xenctrl.interface_open ()
>  
> -type domains = {
> -  eventchn: Event.t;
> -  table: (Xenctrl.domid, Domain.t) Hashtbl.t;
> +let load_plug fname =
> +  let fail_with fmt = Printf.ksprintf failwith fmt in
> +  let fname = Dynlink.adapt_filename fname in
> +  if Sys.file_exists fname then
> +    try Dynlink.loadfile fname with
> +    | Dynlink.Error err as e ->
> +        error "ERROR loading plugin '%s': %s\n%!" fname
> +          (Dynlink.error_message err);
> +        raise e
> +    | _ -> fail_with "Unknown error while loading plugin"
> +  else fail_with "Plugin file '%s' does not exist" fname
> +
> +let () =
> +  let filepath = Paths.xen_ctrl_plugin ^ "/domain_getinfo_v1.cmxs" in
> +  debug "Trying to load plugin '%s'\n%!" filepath;
> +  let list_files = Sys.readdir Paths.xen_ctrl_plugin in
> +  debug "Directory listing of '%s'\n%!" Paths.xen_ctrl_plugin;
> +  Array.iter (fun x -> debug "\t%s\n%!" x) list_files;
> +  Dynlink.allow_only [ "Plugin_interface_v1" ];
> +  load_plug filepath
> +
> +module Plugin =
> +  (val Plugin_interface_v1.get_plugin_v1 ()
> +      : Plugin_interface_v1.Domain_getinfo_V1)
> +
> +let handle = Plugin.interface_open ()
>  
> +type domains = {
> +  eventchn : Event.t;
> +  table : (Plugin.domid, Domain.t) Hashtbl.t;

This will still be better split into two; one patch loading the plugin
and a separate patch switching to use it.

I've got a local branch with the split working (compiling), if you'd like.

That said, one reason why this diff is more complicated to read is that
you've deleted a blank line here, vs the old type

>    (* N.B. the Queue module is not thread-safe but oxenstored is single-threaded. *)
>    (* Domains queue up to regain conflict-credit; we have a queue for
>       	   domains that are carrying some penalty and so are below the
> @@ -93,22 +119,21 @@ let cleanup doms =
>    let notify = ref false in
>    let dead_dom = ref [] in
>  
> -  Hashtbl.iter (fun id _ -> if id <> 0 then
> -                   try
> -                     let info = Xenctrl.domain_getinfo xc id in
> -                     if info.Xenctrl.shutdown || info.Xenctrl.dying then (
> -                       debug "Domain %u died (dying=%b, shutdown %b -- code %d)"
> -                         id info.Xenctrl.dying info.Xenctrl.shutdown info.Xenctrl.shutdown_code;
> -                       if info.Xenctrl.dying then
> -                         dead_dom := id :: !dead_dom
> -                       else
> -                         notify := true;
> -                     )
> -                   with Xenctrl.Error _ ->
> -                     debug "Domain %u died -- no domain info" id;
> -                     dead_dom := id :: !dead_dom;
> -               ) doms.table;
> -  List.iter (fun id ->
> +  Hashtbl.iter
> +    (fun id _ ->
> +      if id <> 0 then (
> +        try
> +          let info = Plugin.domain_getinfo handle id in
> +          if info.Plugin.shutdown || info.Plugin.dying then (
> +            debug "Domain %u died (dying=%b, shutdown %b -- code %d)" id
> +              info.Plugin.dying info.Plugin.shutdown info.Plugin.shutdown_code;
> +            if info.Plugin.dying then dead_dom := id :: !dead_dom else notify := true)
> +        with Plugin.Error _ ->
> +          debug "Domain %u died -- no domain info" id;
> +          dead_dom := id :: !dead_dom))
> +    doms.table;
> +  List.iter
> +    (fun id ->

ocp-indent makes a number of changes to this block.

~Andrew

