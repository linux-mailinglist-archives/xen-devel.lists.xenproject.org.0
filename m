Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A28B55A8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 12:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713984.1114930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1OVA-0006g3-Jl; Mon, 29 Apr 2024 10:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713984.1114930; Mon, 29 Apr 2024 10:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1OVA-0006dm-GJ; Mon, 29 Apr 2024 10:44:52 +0000
Received: by outflank-mailman (input) for mailman id 713984;
 Mon, 29 Apr 2024 10:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nq9P=MC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s1OV9-0006dg-1t
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 10:44:51 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80dc2923-0615-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 12:44:49 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d8a24f8a3cso51791841fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 03:44:49 -0700 (PDT)
Received: from ?IPV6:2003:e5:8738:9a00:3771:d6c0:aec6:f5ea?
 (p200300e587389a003771d6c0aec6f5ea.dip0.t-ipconnect.de.
 [2003:e5:8738:9a00:3771:d6c0:aec6:f5ea])
 by smtp.gmail.com with ESMTPSA id
 je1-20020a05600c1f8100b0041adf358058sm21169570wmb.27.2024.04.29.03.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 03:44:48 -0700 (PDT)
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
X-Inumbo-ID: 80dc2923-0615-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714387489; x=1714992289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxvqPM0VUAqsKGO2txPCNsmg2rNM1LmBDjo9RIJRz/k=;
        b=eK9FRG2Y7AHJP44rdbGo0tgbm3G8LWzF84YYgV9DGeUf89WsV0cK9gqGxAZmOlbdJM
         +yoW0BONUWNfJba3Y3yvjJeBolKloGhehtsiba0gIClaSEtMuzOezHnJ+WUAJdJbaq6k
         Z/RIRcFsQfmBC7tKxKrXxGIbOmTEidbgjIspSux2Hek5GP5PFzHPLp9RpwouPCuBy77Y
         qwDXWAOFf+096fdz30EQjxUfmfsd9s4VSpf43+vgGSJrnCihXY8Xe+/o+7C+w4uE0VPN
         S0Uejs5HFAK3k6eV6tSlL96r5ZjHVMC3U3Wtj4EgO4iNnbSd0Ib3L5La9coFsEvbVZ3f
         1x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387489; x=1714992289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PxvqPM0VUAqsKGO2txPCNsmg2rNM1LmBDjo9RIJRz/k=;
        b=d1g6y1HAFYDc+Z5BIBtBYtjC0zUhl8cXO4ZilwXRbUq84h8mwFCSxzo5pVfJ1OYqm2
         liEHY/30hJl91sn4G2d50A2VxfDhMkHBZipWpaIJDX3uWrydpLE6tE+aQnqCwFDpoaRK
         0kG0n7y0v+ilbLPh1WW4eTdtSThXtuSwba+VZDGfsPvMyVowy13jKfk6H0IzUn7WGmal
         mqCffSmlPw17eB07xVA/sUfwDyI96JJlHKKCqKAMRbFl7hfpSkGLMrTVWc2/RhUGk9nB
         6buDAIJsPhjeBA0UEBCXOS6n6Crqu7kLoh+fVEnwBALPY7RNiYXRGYHloDpnmwpe70UD
         22lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGBGIdB5kTIY1eLW4Wq8IfPQSapPPHfkMsvNnIem0H60ej+ouDUf4GBxIbvREDR9xGYhR8axytoxXA5ZFMAEaXIPVNyZqUuMarIkAYQ2M=
X-Gm-Message-State: AOJu0YzQFBS4W8hInG6FlVeSnCY+Ty+tcKq+sKZhwx/zeS8pR7gcd3rF
	C9xhsW87g9rf0wvA9EIUHxsgoTHnMDgzgtFeThIU6Ejn7JAX8VmgKadJ6NB6dJc=
X-Google-Smtp-Source: AGHT+IELWD5B9cy68FyLmP6Wj7lQplbce+v0kH61K/vYuD3O2Cdd+Ei2aykgwouDwq4VL7qpqmpwCA==
X-Received: by 2002:a2e:b018:0:b0:2d5:9703:263f with SMTP id y24-20020a2eb018000000b002d59703263fmr5564178ljk.44.1714387489295;
        Mon, 29 Apr 2024 03:44:49 -0700 (PDT)
Message-ID: <ed2e5418-147a-4d5e-a646-980953832de7@suse.com>
Date: Mon, 29 Apr 2024 12:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240425173216.410940-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.04.24 19:32, Andrew Cooper wrote:
> libsystemd is a giant dependency for one single function, but in the wake of
> the xz backdoor, it turns out that even systemd leadership recommend against
> linking against libsystemd for sd_notify().
> 
> Since commit 7b61011e1450 ("tools: make xenstore domain easy configurable") in
> Xen 4.8, the launch-xenstore script invokes systemd-notify directly, so its
> not even necessary for the xenstored's to call sd_notify() themselves.

You are aware that in the daemon case the call of systemd-notify does not
signal readyness of xenstored? It is just called with the "--booted" parameter
in order to detect whether systemd is active or not.

So in order to just drop the sd_notify() call from xenstored you need to
modify the launch-xenstore script, too.


Juergen

> 
> Therefore, just drop the calls to sd_notify() and stop linking against
> libsystemd.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin Török <edwin.torok@cloud.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   tools/ocaml/xenstored/Makefile        | 12 +------
>   tools/ocaml/xenstored/systemd.ml      | 15 ---------
>   tools/ocaml/xenstored/systemd.mli     | 16 ---------
>   tools/ocaml/xenstored/systemd_stubs.c | 47 ---------------------------
>   tools/ocaml/xenstored/xenstored.ml    |  1 -
>   tools/xenstored/Makefile              |  5 ---
>   tools/xenstored/posix.c               |  9 -----
>   7 files changed, 1 insertion(+), 104 deletions(-)
>   delete mode 100644 tools/ocaml/xenstored/systemd.ml
>   delete mode 100644 tools/ocaml/xenstored/systemd.mli
>   delete mode 100644 tools/ocaml/xenstored/systemd_stubs.c
> 
> diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
> index e8aaecf2e630..1e4b51cc5432 100644
> --- a/tools/ocaml/xenstored/Makefile
> +++ b/tools/ocaml/xenstored/Makefile
> @@ -4,8 +4,6 @@ include $(OCAML_TOPLEVEL)/common.make
>   
>   # Include configure output (config.h)
>   CFLAGS += -include $(XEN_ROOT)/tools/config.h
> -CFLAGS-$(CONFIG_SYSTEMD)  += $(SYSTEMD_CFLAGS)
> -LDFLAGS-$(CONFIG_SYSTEMD) += $(SYSTEMD_LIBS)
>   
>   CFLAGS  += $(CFLAGS-y)
>   CFLAGS  += $(APPEND_CFLAGS)
> @@ -25,13 +23,6 @@ poll_OBJS = poll
>   poll_C_OBJS = select_stubs
>   OCAML_LIBRARY = syslog poll
>   
> -LIBS += systemd.cma systemd.cmxa
> -systemd_OBJS = systemd
> -systemd_C_OBJS = systemd_stubs
> -OCAML_LIBRARY += systemd
> -
> -LIBS_systemd += $(LDFLAGS-y)
> -
>   OBJS = paths \
>   	define \
>   	stdext \
> @@ -56,12 +47,11 @@ OBJS = paths \
>   	process \
>   	xenstored
>   
> -INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
> +INTF = symbol.cmi trie.cmi syslog.cmi poll.cmi
>   
>   XENSTOREDLIBS = \
>   	unix.cmxa \
>   	-ccopt -L -ccopt . syslog.cmxa \
> -	-ccopt -L -ccopt . systemd.cmxa \
>   	-ccopt -L -ccopt . poll.cmxa \
>   	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
>   	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
> diff --git a/tools/ocaml/xenstored/systemd.ml b/tools/ocaml/xenstored/systemd.ml
> deleted file mode 100644
> index 39127f712d72..000000000000
> --- a/tools/ocaml/xenstored/systemd.ml
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -(*
> - * Copyright (C) 2014 Luis R. Rodriguez <mcgrof@suse.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU Lesser General Public License as published
> - * by the Free Software Foundation; version 2.1 only. with the special
> - * exception on linking described in file LICENSE.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU Lesser General Public License for more details.
> - *)
> -
> -external sd_notify_ready: unit -> unit = "ocaml_sd_notify_ready"
> diff --git a/tools/ocaml/xenstored/systemd.mli b/tools/ocaml/xenstored/systemd.mli
> deleted file mode 100644
> index 18b9331031f9..000000000000
> --- a/tools/ocaml/xenstored/systemd.mli
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -(*
> - * Copyright (C) 2014 Luis R. Rodriguez <mcgrof@suse.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU Lesser General Public License as published
> - * by the Free Software Foundation; version 2.1 only. with the special
> - * exception on linking described in file LICENSE.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU Lesser General Public License for more details.
> - *)
> -
> -(** Tells systemd we're ready *)
> -external sd_notify_ready: unit -> unit = "ocaml_sd_notify_ready"
> diff --git a/tools/ocaml/xenstored/systemd_stubs.c b/tools/ocaml/xenstored/systemd_stubs.c
> deleted file mode 100644
> index f4c875075abe..000000000000
> --- a/tools/ocaml/xenstored/systemd_stubs.c
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -/*
> - * Copyright (C) 2014 Luis R. Rodriguez <mcgrof@suse.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU Lesser General Public License as published
> - * by the Free Software Foundation; version 2.1 only. with the special
> - * exception on linking described in file LICENSE.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU Lesser General Public License for more details.
> - */
> -
> -#include <string.h>
> -#include <stdio.h>
> -#include <stdbool.h>
> -#include <errno.h>
> -#include <caml/mlvalues.h>
> -#include <caml/memory.h>
> -#include <caml/alloc.h>
> -#include <caml/custom.h>
> -#include <caml/signals.h>
> -#include <caml/fail.h>
> -
> -#if defined(HAVE_SYSTEMD)
> -
> -#include <systemd/sd-daemon.h>
> -
> -CAMLprim value ocaml_sd_notify_ready(value ignore)
> -{
> -	CAMLparam1(ignore);
> -
> -	sd_notify(1, "READY=1");
> -
> -	CAMLreturn(Val_unit);
> -}
> -
> -#else
> -
> -CAMLprim value ocaml_sd_notify_ready(value ignore)
> -{
> -	CAMLparam1(ignore);
> -
> -	CAMLreturn(Val_unit);
> -}
> -#endif
> diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
> index 1aaa3e995e1f..6bcd6d11da55 100644
> --- a/tools/ocaml/xenstored/xenstored.ml
> +++ b/tools/ocaml/xenstored/xenstored.ml
> @@ -621,7 +621,6 @@ let () =
>       process_domains store cons domains
>     in
>   
> -  Systemd.sd_notify_ready ();
>     let live_update = ref false in
>     while not (!quit && Connections.prevents_quit cons = [])
>     do
> diff --git a/tools/xenstored/Makefile b/tools/xenstored/Makefile
> index e0897ed1ba30..09adfe1d5064 100644
> --- a/tools/xenstored/Makefile
> +++ b/tools/xenstored/Makefile
> @@ -9,11 +9,6 @@ xenstored: LDLIBS += $(LDLIBS_libxenctrl)
>   xenstored: LDLIBS += -lrt
>   xenstored: LDLIBS += $(SOCKET_LIBS)
>   
> -ifeq ($(CONFIG_SYSTEMD),y)
> -$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
> -xenstored: LDLIBS += $(SYSTEMD_LIBS)
> -endif
> -
>   TARGETS := xenstored
>   
>   .PHONY: all
> diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
> index d88c82d972d7..dc4ed8db591f 100644
> --- a/tools/xenstored/posix.c
> +++ b/tools/xenstored/posix.c
> @@ -26,9 +26,6 @@
>   #include <sys/mman.h>
>   #include <sys/socket.h>
>   #include <sys/un.h>
> -#if defined(HAVE_SYSTEMD)
> -#include <systemd/sd-daemon.h>
> -#endif
>   #include <xen-tools/xenstore-common.h>
>   
>   #include "utils.h"
> @@ -390,12 +387,6 @@ void handle_special_fds(void)
>   
>   void late_init(bool live_update)
>   {
> -#if defined(HAVE_SYSTEMD)
> -	if (!live_update) {
> -		sd_notify(1, "READY=1");
> -		fprintf(stderr, SD_NOTICE "xenstored is ready\n");
> -	}
> -#endif
>   }
>   
>   int get_socket_fd(void)


