Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E69C4538
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834138.1249657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAZQY-0008Hp-Cm; Mon, 11 Nov 2024 18:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834138.1249657; Mon, 11 Nov 2024 18:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAZQY-0008GJ-9o; Mon, 11 Nov 2024 18:46:18 +0000
Received: by outflank-mailman (input) for mailman id 834138;
 Mon, 11 Nov 2024 18:46:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAZQX-0008GD-7H
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:46:17 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37226c7a-a05d-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 19:46:09 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso841384466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 10:46:09 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0defafasm625939066b.142.2024.11.11.10.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 10:46:08 -0800 (PST)
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
X-Inumbo-ID: 37226c7a-a05d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM3MjI2YzdhLWEwNWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzUwNzY5LjE0MTQ3MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731350768; x=1731955568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8xCsbe2GYL7JEUT+LV4R6IXXlRnYNXvVPJhGFkecZyM=;
        b=OHh7SpOk3nyhrNGRafJj8ooE4ckMWkmC5xr4nbSe+Unh2GGltQqYrLOjKU1VmCf262
         YnUwu+yK9b8z64QAj0k4VMiRtgGihu7vwo6mvXBHpIEDcu6jHRtdQPXLkbkSx2mNxqqV
         zTnLSDIlzHugRR2QHXVotCBQCw6SBevG1foz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731350768; x=1731955568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xCsbe2GYL7JEUT+LV4R6IXXlRnYNXvVPJhGFkecZyM=;
        b=XCfmcmuG0zaoNrrW8yMdUsA5YQ+oF1BPiFsw7BL7qiqQjeUsN3DYgCrjK59dN+HObo
         n2hJAR97RdO8Zcmqt6qc/X/WX3ltfb+A5U072bW7wemPtq2y0oNLUDcGuQXMS5bdbVnI
         0jXwQxgPdNSqQdwJUPdPpN9ddgelBRvsFB3+n1W8CPKBLvaEHfY1m7cxd+1R+cYEtlKy
         GjOyZSPxKtYctDRF5EkeEeLX0pGdPdLudFFVOFxMZfkKEbZzaW6Ep92LW9i4/rL5UJZm
         F04G9QNReCoHfdcUhM+4xVHyJ6t8+/bpxJbIXFGoVtwOcoJ6xMtp2ZsMWSmRYDcUURYT
         9FUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmslciFjhBPnlKDU9OKCuEJyQ0gdH51rgT9oV+AewXaTbpqthTVS3L6Y+GTyeO9Pms6jRu7ahMDIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWdaVYAogqngHoliV+mYEENX8jPlY8tI5FgVJAgHmtYjlgZWFl
	x+IWShO/44Ih8gkdHC8VIY7dDispkUoMTJFbxU8qpcmd05S0GnLZaUrmU3olRIo=
X-Google-Smtp-Source: AGHT+IEPbhHNEvG79E1DsP7C7SM0qcWwS6vpckKgd/ojHrGprTXNv9twGh3yyU8WmjnPVUY/zSzPZA==
X-Received: by 2002:a17:907:1c20:b0:a9d:e01c:470c with SMTP id a640c23a62f3a-a9ef001b432mr1415256766b.39.1731350768455;
        Mon, 11 Nov 2024 10:46:08 -0800 (PST)
Message-ID: <b8932f69-e50a-460a-9aac-d16f0d8de083@citrix.com>
Date: Mon, 11 Nov 2024 18:46:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 04/15] x86: Initialize mapcache for PV, HVM, and idle
 domains
To: Elias El Yandouzi <eliasely@amazon.com>, xen-devel@lists.xenproject.org
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Wei Wang <wawei@amazon.de>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
 <20241111131148.52568-5-eliasely@amazon.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241111131148.52568-5-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2024 1:11 pm, Elias El Yandouzi wrote:
> From: Wei Liu <wei.liu2@citrix.com>
>
> To support the transition away from the direct map, the mapcache will now
> be used by HVM and idle domains as well. This patch lifts the `mapcache`
> to the arch level and moves its initialization earlier in
> `arch_domain_create()` to cover PV, HVM, and idle domains.

This part of the commit message is a correct description of how the
logic wants to end up, but ...


> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 92263a4fbdc5..a7f4929b5893 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -738,6 +738,11 @@ struct domain *domain_create(domid_t domid,
>  
>      rangeset_domain_initialise(d);
>  
> +#ifdef CONFIG_X86
> +    if ( (err = mapcache_domain_init(d)) != 0)
> +        goto fail;
> +#endif
> +
>      if ( is_idle_domain(d) )
>          arch_init_idle_domain(d);
>  
> @@ -820,6 +825,10 @@ struct domain *domain_create(domid_t domid,
>      ASSERT(err < 0);      /* Sanity check paths leading here. */
>      err = err ?: -EILSEQ; /* Release build safety. */
>  
> +#ifdef CONFIG_X86
> +    free_perdomain_mappings(d);
> +#endif
> +
>      d->is_dying = DOMDYING_dead;
>      if ( hardware_domain == d )
>          hardware_domain = old_hwdom;

... this is not what the commit message says.

These should be implemented as per the commit message. i.e. living in
arch_*() functions, not ifdef'd in common code.

If there are not arch functions in the right places, we can make the
appear.  It looks like arch_init_idle_domain() needs to grow a failure
case, but that seems to be the extent of the changes needed in order to
move these calls into arch-specific code.

~Andrew

