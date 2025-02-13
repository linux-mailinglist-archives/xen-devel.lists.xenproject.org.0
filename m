Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1825A334BE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887033.1296612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO7r-0005rr-Qz; Thu, 13 Feb 2025 01:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887033.1296612; Thu, 13 Feb 2025 01:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiO7r-0005oj-Nm; Thu, 13 Feb 2025 01:34:47 +0000
Received: by outflank-mailman (input) for mailman id 887033;
 Thu, 13 Feb 2025 01:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiO7p-0005od-Rx
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:34:45 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b38f7676-e9aa-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 02:34:44 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so2276575e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 17:34:43 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b4335sm463982f8f.15.2025.02.12.17.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 17:34:42 -0800 (PST)
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
X-Inumbo-ID: b38f7676-e9aa-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739410483; x=1740015283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QXhL3yCjNajGXTBvimFymfEIzganVGmH8aiVRhf3nAc=;
        b=tq+NcV4bYlcTJk4lPUvjEhNhD6mfUDUQGB0OdPtS8L/0jemQ9McEf7GCdFZO7s+0si
         9M4ibA+cYo7l8ZDfQkZsBtbijGlsrwnHyzHG+d5gLmkJ/R/MOgyXakx/hJWWvc4jMpua
         jgxptsTd7v91c5fN00G4oN/pe/2tgDsKcvNiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739410483; x=1740015283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXhL3yCjNajGXTBvimFymfEIzganVGmH8aiVRhf3nAc=;
        b=U+Ndjh99PR1Dd7FJ2PmQbTD8nchUNnXlYeGuio9GfUbM+GGZfFsK7bmxRZQFk/PfVN
         zuB+lAmF//7NL/9ev1XqXUxG07SIef/WJ2gJstC4LoDw5cnQD9r18upZVTWfhIwmYnRj
         qWuS4ce/X8IMnKUJ1hyaT4Qz9rErewiCgsZII91TfO1yYtk+1VDn3HYllxs1vbIHKthj
         R2XUyerUlGJNc7MAjRYOhVxvq4cZRHvUubFdwanenwSZn0Bt60i2caWn1RHW3EW8Ebjt
         WFmb076guwr9gsuW462c63iafZLw2COr/U5F0e0+D2tB0Sfe+KbXX0M+CJaflTZG1C49
         4e+g==
X-Forwarded-Encrypted: i=1; AJvYcCW2N3romTrmgxGnyIkiNQEgp0QOqmuBM26b4ze0xjx+NT71uUvSVcB6ESQtURgMMylRuEbfhYJQmqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTAe2M4IoCENBSVgzvByV4MSY4/yj8A158rFMljGduvy5xbr4o
	kYKtiMyweQFgXLz8y4XOJVq0DmnYVVxswDnop7Xo8+lobAmMUqqb10Bd+nUE5YkHK9sUn2vxwFn
	2ALnT+Q==
X-Gm-Gg: ASbGncvrA0iqgdDnAmbNUfvfVdt98inUQrTfHnwUHwBCjzSAeponrIf8shHupNJHgto
	EFVzRRRdFQmtT01of/2QInQe3DkaU9tGETze0FNh+i3NQ1S1uP1OUU126lE9y9zUZMbSwpmGqsX
	1y7OsYsXj6Bi3N3MD1aWi0QV0JH40aqm7X9qxNkmS8vDOzad5Sa161XjsTLubVC5gPERNbqgWrj
	KTTNuKeMPPFTvcy6BfJpzDRw6X7bMjbEnHxDNbLEDcOQZ1rPgLRLYDRrW/3dcShFt9UrbxnzxOU
	xdf7SmQDfYzNsE1qluyhgBqcgq0dGvaGZNaHBtbGApybAQlp/zBWHUM=
X-Google-Smtp-Source: AGHT+IFGlf4JqJBi7NZE+ioH19qXpdwVtqHLZnXvtbv9fDQS5GJfFUchrYJwHqpa5FApnRCzVhmVsQ==
X-Received: by 2002:a05:600c:2294:b0:439:6030:9b8d with SMTP id 5b1f17b1804b1-43960309c5dmr13001445e9.29.1739410483350;
        Wed, 12 Feb 2025 17:34:43 -0800 (PST)
Message-ID: <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
Date: Thu, 13 Feb 2025 01:34:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 1:25 am, Stefano Stabellini wrote:
> Hi all,
>
> I am looking through the few remaining MISRA violations that we have
> left.  One of them is R11.2:
>
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
>
> Specifically, mctelem_cookie_t is a pointer to incomplete type and
> therefore COOKIE2MCTE triggers a "conversion between a pointer to an
> incomplete type and any other type".
>
> mctelem_cookie_t is defined as:
>
> typedef struct mctelem_cookie *mctelem_cookie_t;
>
> I am looking through the code and I genuinely cannot find the definition
> of struct mctelem_cookie.
>
> If mctelem_cookie_t is only used as a pointer, wouldn't it make more
> sense to do:
>
> typedef struct mctelem_ent *mctelem_cookie_t;
>
> ?
>
> What am I missing?

Nothing.  Or perhaps the twisted thinking of the original author.

It is genuinely a pointer type (== known size) which you can't deference
(because there is no definition), and can only operate on by casting to
an integer.  Except the code also requires it to be a uint64_t which is
why there's some fun disabling of relevant hypercalls for compat guests.

If someone could find the time to file it in /dev/null and replace it
with literally anything else, I'd be very thankful.

~Andrew

