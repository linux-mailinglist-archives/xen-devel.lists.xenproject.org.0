Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92548CCE21
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 10:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728202.1133048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3in-0002UN-0M; Thu, 23 May 2024 08:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728202.1133048; Thu, 23 May 2024 08:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3im-0002Sd-Tv; Thu, 23 May 2024 08:22:44 +0000
Received: by outflank-mailman (input) for mailman id 728202;
 Thu, 23 May 2024 08:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGfz=M2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sA3il-00026a-88
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 08:22:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a019e07e-18dd-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 10:22:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so1120880366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 01:22:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a616b07164asm564603666b.116.2024.05.23.01.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 01:22:41 -0700 (PDT)
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
X-Inumbo-ID: a019e07e-18dd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716452562; x=1717057362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnnvZryhw0yRCTtGjZKhvo1G7tBBUoE48gETUVXle/4=;
        b=LOFZUm/DyoZPEs5XZLukmrTdcYFnZSha3ir4i8PKep1VPlSgmXaIbKDzp0E5QP5H/R
         grXAY9XkBkVc4KWC4wBn8E/eQVsvB+1S4Jt7OAwC7oVbsIrm99oJWEicUmF4ZqcQET0g
         APkLipN27ZxALFfla6iTfVoNP9I1l/GTa7DDRRCQA9IvoCeziNi4pykcLB7juTCyYhf8
         DuCdU4i/8KNjCp7DdH88Q7raNBeG1u7zxDSETrEGKjpQ62qxiWnwIQoIu6TO1yIsFTwo
         FodIKMfU1vMY2ZZS/+FVTWXQ3yBHZKxoN9+zq6BdG15wlE8RfCyqG3NLqRPCZ+FM/Cwl
         YH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716452562; x=1717057362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnnvZryhw0yRCTtGjZKhvo1G7tBBUoE48gETUVXle/4=;
        b=Qo6q1mPbth4CD+sjbZbcqBchYCOt7dZYISTfioyF7B7ybq2mhqEH7TPC1hwWnHrDot
         OnoGTzsCqXIbuaX5oEGwIb2xb7YZL5O0YWBDBd/Jwr9QxH1OHO0QaMl4njTg15PM2hJQ
         0E5xmbbfAoVH8WuvkzP3viTL0AhEGAcqVAm4FrQy/uhEVs+10GZ+QQDhu8dhUXTqUtnQ
         uEa3Yk1b+Ik782UjLuDcnlZjdISfu3Odmio73JiJpvdyXLH/Oi1nzw7pCFVKS/X6aIC+
         KqlN8zT8xO5l2MmhSBvAWWz4JasH+ByIFtK5XNaVXF+GZfex74CGI7QIYkwHlEuPN0/H
         kdbA==
X-Forwarded-Encrypted: i=1; AJvYcCXAVZEHRdDhhpBYDm8nZSZc6W/IW3Pswvy1S4ueavmMu/Ic11PWM6jugv4jFHOCFeX2jnZKlkx+OnxHTyee+jVrd/ihcfvp1XkLbMx6hzs=
X-Gm-Message-State: AOJu0YwzYdbZy79r31lVKgaRJueBLS5yUPACW6EcbQtXWhMlPT/cdbby
	FVDl59N7ZKwzJCX4+sGQr2xYhlHuGwo53sPXCf1IbjKHnpMEJ0jRNxhHKUMPmDI=
X-Google-Smtp-Source: AGHT+IEjRK8mZUWOCvE4tRb8yz/3DAIX24rSVGFcr9neimXd+6PkVGLlmWjCpqwihbyFsVjMwHsPbg==
X-Received: by 2002:a17:906:6d85:b0:a5a:84f9:df73 with SMTP id a640c23a62f3a-a62280a12e6mr266281566b.38.1716452562064;
        Thu, 23 May 2024 01:22:42 -0700 (PDT)
Message-ID: <b2c66956-97a8-44da-b2fd-c50f84cbc170@suse.com>
Date: Thu, 23 May 2024 10:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tools/{c,o}xenstored: Don't link against
 libsystemd
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240516185804.3309725-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.05.24 20:58, Andrew Cooper wrote:
> Use the local freestanding wrapper instead.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com> # tools/xenstored


Juergen

> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin Török <edwin.torok@cloud.com>
> 
> v2:
>   * Redo almost from scratch, using the freestanding wrapper instead.
> ---
>   tools/ocaml/xenstored/Makefile        | 2 --
>   tools/ocaml/xenstored/systemd_stubs.c | 2 +-
>   tools/xenstored/Makefile              | 5 -----
>   tools/xenstored/posix.c               | 4 ++--
>   4 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
> index e8aaecf2e630..a8b8bb64698e 100644
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
> diff --git a/tools/ocaml/xenstored/systemd_stubs.c b/tools/ocaml/xenstored/systemd_stubs.c
> index f4c875075abe..7dbbdd35bf30 100644
> --- a/tools/ocaml/xenstored/systemd_stubs.c
> +++ b/tools/ocaml/xenstored/systemd_stubs.c
> @@ -25,7 +25,7 @@
>   
>   #if defined(HAVE_SYSTEMD)
>   
> -#include <systemd/sd-daemon.h>
> +#include <xen-sd-notify.h>
>   
>   CAMLprim value ocaml_sd_notify_ready(value ignore)
>   {
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
> index d88c82d972d7..6037d739d013 100644
> --- a/tools/xenstored/posix.c
> +++ b/tools/xenstored/posix.c
> @@ -27,7 +27,7 @@
>   #include <sys/socket.h>
>   #include <sys/un.h>
>   #if defined(HAVE_SYSTEMD)
> -#include <systemd/sd-daemon.h>
> +#include <xen-sd-notify.h>
>   #endif
>   #include <xen-tools/xenstore-common.h>
>   
> @@ -393,7 +393,7 @@ void late_init(bool live_update)
>   #if defined(HAVE_SYSTEMD)
>   	if (!live_update) {
>   		sd_notify(1, "READY=1");
> -		fprintf(stderr, SD_NOTICE "xenstored is ready\n");
> +		fprintf(stderr, "xenstored is ready\n");
>   	}
>   #endif
>   }


