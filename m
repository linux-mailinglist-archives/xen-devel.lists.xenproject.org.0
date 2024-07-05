Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A0928B94
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754409.1162862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPklo-0003ta-Vo; Fri, 05 Jul 2024 15:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754409.1162862; Fri, 05 Jul 2024 15:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPklo-0003rJ-Sr; Fri, 05 Jul 2024 15:22:44 +0000
Received: by outflank-mailman (input) for mailman id 754409;
 Fri, 05 Jul 2024 15:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwCH=OF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sPkln-0003bk-8g
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:22:43 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c15d25b-3ae2-11ef-bbfb-fd08da9f4363;
 Fri, 05 Jul 2024 17:22:42 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77c2d89af8so163622366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:22:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c9925463sm74555066b.69.2024.07.05.08.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 08:22:41 -0700 (PDT)
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
X-Inumbo-ID: 6c15d25b-3ae2-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720192962; x=1720797762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gx82JRugbBZFJqvXyfDeEFnrGg8wk6oy2FrBYJAu6Yo=;
        b=OCBx+P6VI3T243DkjjOAoP3sz43KGOvQ+Lmc+L0euzVvlTFY1/02bAwapnX5fnKbxU
         wPssQVTMDz8U0m7O/LpUgqRGizZp3z/IRlHUt5/x2C/NF3uJjGRQUm5JZKoIkXL+bh2w
         SJ9vPmD94uzVvSPSVWK3bYHEoKEMBK6Xy0AVenfcyPqXlNfARveUM7P2BW6A7i+6dy2R
         kg///EJR9YMUUIGqr1K6QyCnApI3YXRsk6y7b4cWbDxZ204n5rNP7dF1LrSYGItjpH9T
         p4Lx9LvDKKZMnvD9Iv32QBIs7XI6LDOn0Vaj0wPFdtQfWnfHEHvOe6x08hpbTL68jvnD
         xP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192962; x=1720797762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gx82JRugbBZFJqvXyfDeEFnrGg8wk6oy2FrBYJAu6Yo=;
        b=QlmrgRA2CiIiN0yT9FafsNt8lThg+liFRytBqWL4wpH0kTsiaVWIxNuGmSqae9G3Kq
         Q8Vci1CiHe2rOZmLOHeiLiCSwqhWz4b/8IVYfiQNCfdCmXxdKSz0wZW9NvvFZlpeCcZW
         f4m6pxyKQtr6ooz4InL8eUX+YnHriNvciGHXLzM71gxurfJZmcHEvH6rtEvdbK2viWLM
         vPtEPgK15RvfE+UEVAER0dHG3ThEv93MMkVaxTEdjKTlAN9DsVABhrGSrboGQ/d6es6P
         O+WnhSsff5KDwb8nt4AUEwflDNIBwOWZUKIW8xMKzJpjbYStpTPRwWoLFy6+zHYN3hhH
         IABA==
X-Forwarded-Encrypted: i=1; AJvYcCWgxSzygIN1IDLpNK+aV6PGMCtbxFuUDPv1LH2zCwIKWLDXIrIRA+1BvTJpo1WW8tkp2oTBU57T66YVFQmc9/qT2HA7/OXsxuK9l7iK+AE=
X-Gm-Message-State: AOJu0YzladjYXNZaI3K2fjFejBoXTq8Yad3i5IsJ8ehllLOVg2pYpp4I
	FKI+dViiUau76VesMnKGN1n7tW4+oKXMdRlGi2RA2tlXayw9Li00ge+TeF5XkkYj9I/Hmahxdpy
	6
X-Google-Smtp-Source: AGHT+IFi+Nv1DpU/3POkqycbBMkQpbLuIb4mybWNK1ktmemCBgsHmaDyPT5JFTTgs90xu5vj8DMCEQ==
X-Received: by 2002:a17:907:969e:b0:a75:110d:fa53 with SMTP id a640c23a62f3a-a77ba70baf4mr423629666b.49.1720192961840;
        Fri, 05 Jul 2024 08:22:41 -0700 (PDT)
Message-ID: <36ad6b62-9186-41e3-bfa7-7a6d81d9efe1@suse.com>
Date: Fri, 5 Jul 2024 17:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libs/store: add missing USE_PTHREAD to target .o
To: Andrei Stan <andreistan2003@gmail.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20240705145910.32736-3-andreistan2003@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240705145910.32736-3-andreistan2003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.07.24 16:59, Andrei Stan wrote:
> Currently only shared libraries build with USE_PTHREAD enabled.
> 
> This patch adds the macro also to xs.o.
> 
> Backport: 4.18+ # maybe older
> Signed-off-by: Andrei Stan <andreistan2003@gmail.com>

Commit dde3e02b7068 did that explicitly, stating that phtreads are
not compatible with static linking.

Was that reasoning wrong?


Juergen

> ---
>   tools/libs/store/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
> index 0649cf8307..c6f147c72f 100644
> --- a/tools/libs/store/Makefile
> +++ b/tools/libs/store/Makefile
> @@ -20,6 +20,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
>   CFLAGS += $(CFLAGS_libxentoolcore)
>   
>   xs.opic: CFLAGS += -DUSE_PTHREAD
> +xs.o: CFLAGS += -DUSE_PTHREAD
>   ifeq ($(CONFIG_Linux),y)
>   xs.opic: CFLAGS += -DUSE_DLSYM
>   endif


