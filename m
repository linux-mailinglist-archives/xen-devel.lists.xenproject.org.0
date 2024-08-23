Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0295D440
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 19:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782543.1192048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shY2X-0002Rk-6E; Fri, 23 Aug 2024 17:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782543.1192048; Fri, 23 Aug 2024 17:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shY2X-0002P0-3V; Fri, 23 Aug 2024 17:25:33 +0000
Received: by outflank-mailman (input) for mailman id 782543;
 Fri, 23 Aug 2024 17:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shY2V-0002Ou-UJ
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 17:25:31 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1e38f5b-6174-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 19:25:30 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5d5bf833de7so1636482eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:25:30 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f342a80sm197740585a.33.2024.08.23.10.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 10:25:27 -0700 (PDT)
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
X-Inumbo-ID: b1e38f5b-6174-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724433929; x=1725038729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2UxEMWL1PLeHTCBIbdcq3fe9CLARcePLYJpQkQj1bFE=;
        b=YJGmZW1oDWb1W2bYCev7CRWLOGpWemulmMgjLdestsVQh2UoCMK0QFNRnLe/2BgRw4
         Hxkm0eBYn4LTrsAMCbQNG3OxXeYUmAIAqQYGupcXxBdAfQ5u7ko3PcjnydBFAJO7K2cT
         olDMc01NwjZYyjPhaEwD0pja0x0IPxq3WfrRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433929; x=1725038729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UxEMWL1PLeHTCBIbdcq3fe9CLARcePLYJpQkQj1bFE=;
        b=CO4Q75QsQkVmYOHzIeO/fcvr2j7+qkv177BDj0/2cSbuugjZiX2RmzQMMQQsTHvoJk
         n/oFhWT08Yr5xTOkfWxGjF618iITKWlKzeJWMc2VSZK5JIHbB7DTDeQ0dhelMUB9b6DI
         QOi/1bvNHVhlPOD/+dKKu4xtibAbZTaQyaPk2o2ykHBh6sgNQiRpr/fzMHm3U+utWhpZ
         VVDt12L+vz6EAT82Ueea2FAtrxtKPJv2GJFxrGspwh8s+ij8+O83NyD1HN5ZdQTNXuJU
         GUdRk1Vu7ZSnvlV6c3qcOIAjd4GG2GCnK6tzU+kPZo3rmmJ97CqnGMaDZ5xzp2BH/j35
         1XGw==
X-Forwarded-Encrypted: i=1; AJvYcCWyD//KjnV4ZYEP+wOeUKGy8bIP0Fmrr0su46OyXiF1DUvvUdixfzFf6E1tNziLJ/PtENRrst6J1j8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/fCxt87o8AubvzDcDsUAbgA4BqtucQGFhyYcphw2e/GqYfuXY
	ZGrRx/7zi9fWxm2CgKfGakJc7UDXS3Uk0CpcVIwAY0F6vt5awvz+iMLlmrZliNg=
X-Google-Smtp-Source: AGHT+IEvfpcx9eqELvZov4EvGT99gYi02QW1Fmz4+0QzIFNMrehMZFWLqnF9NbnViEEk0FKxPyXMLw==
X-Received: by 2002:a05:6358:2605:b0:1ac:efb0:fb2e with SMTP id e5c5f4694b2df-1b5c21e9050mr347342055d.22.1724433929222;
        Fri, 23 Aug 2024 10:25:29 -0700 (PDT)
Message-ID: <6efb4e1c-429f-4b32-bead-3d84b0e60dd7@citrix.com>
Date: Fri, 23 Aug 2024 18:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] tools/oxenstored: Use the plugin for
 Xenctrl.domain_getinfo
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
 <c40ed2c49f0d72d227a1ab2ef90be0e24e17382c.1724314239.git.andrii.sultanov@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c40ed2c49f0d72d227a1ab2ef90be0e24e17382c.1724314239.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/08/2024 10:06 am, Andrii Sultanov wrote:
> diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
> index 7a3056c364..e3edee6de6 100644
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
> +        Printf.eprintf "ERROR loading plugin '%s': %s\n%!" fname
> +          (Dynlink.error_message err);
> +        raise e
> +    | _ -> fail_with "Unknown error while loading plugin"
> +  else fail_with "Plugin file '%s' does not exist" fname
> +
> +let () =
> +  let filepath = Paths.xen_ctrl_plugin ^ "/domain_getinfo_v1.cmxs" in
> +  Printf.printf "Trying to load plugin '%s'\n%!" filepath;
> +  let list_files = Sys.readdir Paths.xen_ctrl_plugin in
> +  Printf.printf "Directory listing of '%s'\n%!" Paths.xen_ctrl_plugin;
> +  Array.iter (fun x -> Printf.printf "\t%s\n%!" x) list_files;
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

Looking at just this hunk in isolation, I think you want to split this
patch into two; one to load the plugin, and a second to switch away from
using Xenctrl.domain_getinfo.

As this is Oxenstored, rather than a library, assumptions about stdout
are less bad, but it would still be nice if the logging could be plumbed
into the main logging functionality.  Or, does this all run so early on
boot that we haven't parsed oxenstored.conf yet?

~Andrew

