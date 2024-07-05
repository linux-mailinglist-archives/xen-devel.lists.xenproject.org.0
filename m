Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791F4928B4F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754357.1162772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkac-00064p-08; Fri, 05 Jul 2024 15:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754357.1162772; Fri, 05 Jul 2024 15:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkab-00062p-Te; Fri, 05 Jul 2024 15:11:09 +0000
Received: by outflank-mailman (input) for mailman id 754357;
 Fri, 05 Jul 2024 15:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPkab-00062j-4F
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:11:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab22d53-3ae0-11ef-bbfb-fd08da9f4363;
 Fri, 05 Jul 2024 17:11:02 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77c25beae1so170183766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:11:02 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c25b6b47sm113204366b.199.2024.07.05.08.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 08:11:00 -0700 (PDT)
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
X-Inumbo-ID: cab22d53-3ae0-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720192261; x=1720797061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vJCoI00qKpGiXUWXQaU13hgbroPoQtqjygJFwTXmzLA=;
        b=Mo27UdH6yYC6feAQUN2Qpe51Ae+EkePklCwBEWFuOToWd7Q+L3ObHbET0LYGPmWxzA
         9uYmGVCSNIcl5iGmjRxpt+Gke9lvh+Qrnd4Ta1fI59H5Zj6cAxx8Ax3PabXNNoZRVwNI
         rNsaoN1j2NXS7NEN4REyHwsClECTCk3I4BC/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192261; x=1720797061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJCoI00qKpGiXUWXQaU13hgbroPoQtqjygJFwTXmzLA=;
        b=D50NhGg6QqFh/vc4JarN923yyOOTLFDmRJBI6EiF8VWngyGDPTMLgQbK4OYYR66k11
         DNFJyUEeKgHQ7AYUgx4RUVIPAW4pA7YQ41+oKvdbOC3645wU2X7JTBNNntsNqh62EcbH
         Q6yJuPuHGfZuIRzr6q/mAdphNElXLReb1utd3n92JIKoxKuJbixNpT7xVLRQdKZ0AyiO
         rCAGaVmNLRwruxmMb17CxX94rzHfg3SYhcbnvYI95+WI4C0b+vDyYzsROPlRAqZ3Ow9F
         4nWu6pAoOoTJxdWN7sWRnlbE0f726E8QOTLR5RaC0EGUbK3Omr00MO9jZfL92tS5JRRj
         yLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGBoRB/vGe1FKjtz4WcSyZC2oXKehziRPOglyid5C66zQyj6rE/lIreSdjtjhmfcWnfnHWHQGGTWE96G9NRBBtHgVAP26U/rWBuSgNZ/Q=
X-Gm-Message-State: AOJu0YwLpAzHsfrBVv0It3grKvfO/SaiBpr76BePK6BLdlEfbHM09Yi9
	bSUjM0gR8sFbNxSAIK8TIkK7TzRJzZdwbrfPchaqk3bbOovfmZRMFtWMdNaA7eDRhoYQTsmODFg
	j
X-Google-Smtp-Source: AGHT+IHFvFms7ROglKvWq0wMse4Y6nZBCkzOTw/5bAvU0KmEBu0Fx5JLqUoWgbldSBz0wUxHwNJkKA==
X-Received: by 2002:a17:906:ae97:b0:a77:b516:3026 with SMTP id a640c23a62f3a-a77ba44c954mr311289866b.3.1720192261553;
        Fri, 05 Jul 2024 08:11:01 -0700 (PDT)
Message-ID: <ad8d81a4-4a99-466b-a37e-c4b57e2c7802@citrix.com>
Date: Fri, 5 Jul 2024 16:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] tools/libs/store: add missing USE_PTHREAD to
 target .o
To: Andrei Stan <andreistan2003@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20240705145910.32736-3-andreistan2003@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240705145910.32736-3-andreistan2003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/07/2024 3:59 pm, Andrei Stan wrote:
> Currently only shared libraries build with USE_PTHREAD enabled.
>
> This patch adds the macro also to xs.o.
>
> Backport: 4.18+ # maybe older
> Signed-off-by: Andrei Stan <andreistan2003@gmail.com>
> ---
>  tools/libs/store/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
> index 0649cf8307..c6f147c72f 100644
> --- a/tools/libs/store/Makefile
> +++ b/tools/libs/store/Makefile
> @@ -20,6 +20,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
>  CFLAGS += $(CFLAGS_libxentoolcore)
>  
>  xs.opic: CFLAGS += -DUSE_PTHREAD
> +xs.o: CFLAGS += -DUSE_PTHREAD
>  ifeq ($(CONFIG_Linux),y)
>  xs.opic: CFLAGS += -DUSE_DLSYM
>  endif

Funnily enough, I did wonder whether that mattered recently.  I guess it
does.

CC Oleksii for a view to 4.19.

Also, we should transform the Backport: tag into a Fixes: tag if there's
a suitable one to pick.

~Andrew

