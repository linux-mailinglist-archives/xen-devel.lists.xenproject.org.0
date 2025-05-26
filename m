Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531AAAC43A0
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 20:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997703.1378518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcI6-0003Ld-J7; Mon, 26 May 2025 18:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997703.1378518; Mon, 26 May 2025 18:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcI6-0003J9-GZ; Mon, 26 May 2025 18:11:14 +0000
Received: by outflank-mailman (input) for mailman id 997703;
 Mon, 26 May 2025 18:11:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ifqU=YK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uJcI4-0003J3-NV
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 18:11:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c66a33bd-3a5c-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 20:10:59 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so33037155e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 11:10:59 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142f1sm243665085e9.31.2025.05.26.11.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 11:10:57 -0700 (PDT)
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
X-Inumbo-ID: c66a33bd-3a5c-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748283058; x=1748887858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hX3H0nQ/uRGryOBXGKaAFz/GEsqKixCKRGKQGRw0Nw=;
        b=nlQtU3PmiaVrB3eJWmauJtpcRk49q2yHYuMAqTMRVv9zr3DDX3S4Q1Hn9Iy5lRbsDE
         Cbv3RaJ1XNwkIeLFUsuehhMqWZNNAqB8+ovyvM827+d2EocP6ZZG+/e4zOOBEv+yI5VY
         DTqKDRKN0exeWMEyTbPMVzA4UCR0kZeiLOUr1iZlxIVtqXxp9ja6yDcXVFQj3f4phYpG
         /RgkwQpa6pMn5gL0f4hwIJ7vHYnYEImSpKggX72+gTQ9scrGu0UGCC93xKWOjk5di+hr
         z89qhfHdQ9A1aPMCzUVZufraQ2T92gpz+Yr8LubosOYwsfVtU3v/Hci+cahXGeDAVafI
         hu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748283058; x=1748887858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hX3H0nQ/uRGryOBXGKaAFz/GEsqKixCKRGKQGRw0Nw=;
        b=lw9/4EYydRjaNq7UTKdfqryTauPTjxeqvOi7CETiCeG4SGzUyA1x6d8TUHOpY62AsF
         9seZ+xawQT4BOZkwKghQEr+b3PICeyeX83Bhz1yo5JX5hZTQ2kuLMyncQXQiL3RqC1BT
         TFKp3JTSbvhuBIiHyUSP6XAgAu04d0gxyeUrSUQd+/xGyMp0cGI9XEsOv+Zh2fDo7BNb
         Zx9molUYEIFbK62UJCjfEMwj/xMktmvuM7fQW+MnBMLArzCCcRqGfVg6uziWXhqtTLvb
         j0aL7Bnhz0EtOOlOCBFV/nlcC9nKQ5jZ5KU/gHyIi0g14UZIvLOBFvo94r9jorcE7PXv
         cw0g==
X-Forwarded-Encrypted: i=1; AJvYcCXzrgC4rxzeymCQJSyAurrlko2UZoYhS6hUG65+tf+v2UBblka8sk4qcGJdVrCLczM3G9yIKe620J8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD5PVXI28B31WtwuHcYIeotxVADmcLQPqtxbNeiFNTK2tqxJmi
	VJy4g2nU1Qowg8+fbK9B0kZGEsJhgYEFRgvQJls0s+M1WaYoXyxlwu3uq23k8XWQ4ac=
X-Gm-Gg: ASbGncutn3UymA+Kz3qqORodAokP0gzzcP5Fj1Bg0DjkLOoZj4+kX8FGxs8+K0KmcOy
	Ldrw7h634PBGrynPfvuOH/la/d3UgKYjaFBiPlDulqGl6prua4aa7/Y8f5I6RE0W3gkq+iYGnYK
	Rf1DEFYGf+iUCc/XeTLLcSb7FOD21zX3hmDynNIMmM1OP2Dhn/KjMiFy29FH9tC5KWBrHqA6Sri
	SmypipyB/eYipk8c0wjlYqCsF/WIh4s4JA7XPbqNjyBAgrCRe7yd4w3vGAurijlsWJuqYieEWWa
	pllMfgyngkY/rfcYm/Gyy2pplD0JA41adFjchG/cHFBL5qH4MGwPmTQzwPNMnAqez7RMFxxM1lg
	NKsRcFHgcK5rXIYgcJQDdSmUQ
X-Google-Smtp-Source: AGHT+IFFgr/ne1qcBJDMbJQAu1YEVf6uq+N/Ex3btwBHU7LvVD1MvYujkqcNtnDbggk9BtKqdPocFQ==
X-Received: by 2002:a05:600c:3849:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-44c91dd166bmr82436095e9.19.1748283058397;
        Mon, 26 May 2025 11:10:58 -0700 (PDT)
Message-ID: <3a7386f9-a4ba-4268-a3fe-45c18360d878@linaro.org>
Date: Mon, 26 May 2025 20:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen: Fix trace_xs_node_read() params
To: Liam Merwick <liam.merwick@oracle.com>, dwmw@amazon.co.uk,
 anthony.perard@vates.tech, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <20250523160134.218997-1-liam.merwick@oracle.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250523160134.218997-1-liam.merwick@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/5/25 18:01, Liam Merwick wrote:
> When the '--enable-trace-backends=syslog' build option is configured,
> the following compilation error is encountered.
> 
> In file included from /usr/include/sys/syslog.h:207,
>                   from /usr/include/syslog.h:1,
>                   from ./trace/trace-hw_xen.h:224,
>                   from ../hw/xen/trace.h:1,
>                   from ../hw/xen/xen-bus-helper.c:13:
> In function ‘syslog’,
>      inlined from ‘_nocheck__trace_xs_node_read’ at ../hw/xen/trace-events:41:9,
>      inlined from ‘trace_xs_node_read’ at trace/trace-hw_xen.h:903:9,
>      inlined from ‘xs_node_read’ at ../hw/xen/xen-bus-helper.c:154:5:
> /usr/include/bits/syslog.h:45:3: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
>     45 |   __syslog_chk (__pri, __USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
>        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add a check that 'value' is not null before passing it to trace_xs_node_read().
> 
> Fixes: e6cdeee95990 ("hw/xen: Add xs_node_read() helper function")
> Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
> ---
>   hw/xen/xen-bus-helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
> index 288fad422be3..1087a585cc71 100644
> --- a/hw/xen/xen-bus-helper.c
> +++ b/hw/xen/xen-bus-helper.c
> @@ -151,7 +151,7 @@ char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
>       va_end(ap);
>   
>       value = qemu_xen_xs_read(h, tid, path, len);
> -    trace_xs_node_read(path, value);
> +    trace_xs_node_read(path, value ? value : "<null>");
>       if (!value) {
>           error_setg_errno(errp, errno, "failed to read from '%s'", path);
>       }

Alternatively, since this is an error path:

-- >8 --
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index 288fad422be..1e49e60e147 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -143,7 +143,8 @@ char *xs_node_read(struct qemu_xs_handle *h, 
xs_transaction_t tid,
                     unsigned int *len, Error **errp,
                     const char *path_fmt, ...)
  {
-    char *path, *value;
+    g_autofree char *value;
+    char *path;
      va_list ap;

      va_start(ap, path_fmt);
@@ -151,12 +152,11 @@ char *xs_node_read(struct qemu_xs_handle *h, 
xs_transaction_t tid,
      va_end(ap);

      value = qemu_xen_xs_read(h, tid, path, len);
-    trace_xs_node_read(path, value);
      if (!value) {
          error_setg_errno(errp, errno, "failed to read from '%s'", path);
+        return NULL;
      }
-
-    g_free(path);
+    trace_xs_node_read(path, value);

      return value;
  }
---

But your patch isn't wrong, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


