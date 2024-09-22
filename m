Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4A97E0B3
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 11:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801519.1211504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssIkH-0005Ek-7K; Sun, 22 Sep 2024 09:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801519.1211504; Sun, 22 Sep 2024 09:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssIkH-0005C9-4j; Sun, 22 Sep 2024 09:19:09 +0000
Received: by outflank-mailman (input) for mailman id 801519;
 Sun, 22 Sep 2024 09:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=775k=QU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ssIkF-0005C3-8o
 for xen-devel@lists.xenproject.org; Sun, 22 Sep 2024 09:19:07 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5343e06-78c3-11ef-a0b8-8be0dac302b0;
 Sun, 22 Sep 2024 11:19:04 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c5b6161022so2141397a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Sep 2024 02:19:02 -0700 (PDT)
Received: from [192.168.10.236] ([212.222.86.215])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061330d48sm1057916766b.207.2024.09.22.02.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Sep 2024 02:19:01 -0700 (PDT)
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
X-Inumbo-ID: b5343e06-78c3-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726996742; x=1727601542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jro/Nv67R6Uc5IjRma6qtqaW8uL7gMzdliNji4opUVE=;
        b=pCeCi9LqA9owFtjeGPbJxgSMEHq9U41RnuBHxfNpdExmLMD2hJrmW9j3GGvuNsDyUn
         wAYMNo1//YvKwO1mRkum0CeIh1BxHWOeS1rM3iSVG7J/oO+utH/oGguHkLb0tZtcOxv0
         g0L13EVV1Vv+dZvk0mBk5m3uuMMlVvCyEZ8uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726996742; x=1727601542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jro/Nv67R6Uc5IjRma6qtqaW8uL7gMzdliNji4opUVE=;
        b=rBijM7JWJxsynpUfJWu7XOZAncjVjNBwOaxklCU3q2X4L0cktcRUOlmTk9KHhkShv/
         ycDesFn4knecxkNy27dhTEw1qEb0AUgDyE5OQ47H3A4RG/sc0Ls5xRCUiaRZBSXoPCCK
         5JW3Uo4TR70n3Pz3xPW8PvZjK9BK47tDB3lFF6HpL2MlUUU8f0RdeqLVTQVjBiFpjs86
         MsHElfL5mABktIJPVy10DN92dWfoRMQqaXh7LA9rQrKCYmwM2jgfUsoyckQdXS6vvTYQ
         7E8OJzVIrBePLiy5825YqcZN5VTYNkl+zsH1Wi+fEeVU4+zdN8IjcerTQubHdMpdL4jK
         EfKg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ge7E4Xwfeb8irUcGDxEr0d21nbPXn492049XZJC4t6EdjS4N1Jq6txrMxYzG51LsbqflEvHOD7U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7Yq+29ubjTlGHj6YOD8VjbUWYFcs1dlAO8dVFsIG6Ierdn2Vt
	055Qy2HVq2Nu4OYMKPeGkHD79aIlc9NDNARIeFwWdqlkWVyMLV3sEMBP/6YMUtwXTnWP7kwU1jN
	9lN82iw==
X-Google-Smtp-Source: AGHT+IFlka+iwzSmYQOdTP8iyWeC9JigZi84SN7YN1+yYtDzOFRojiBuLK4u4G7Z8SSp42kRc3AFvA==
X-Received: by 2002:a17:907:f1a9:b0:a7a:a46e:dc3f with SMTP id a640c23a62f3a-a90d510a213mr806912466b.45.1726996742048;
        Sun, 22 Sep 2024 02:19:02 -0700 (PDT)
Message-ID: <d7dfa01e-740d-4274-b9fb-8475224ae7a6@citrix.com>
Date: Sun, 22 Sep 2024 11:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/livepatch: simplify and unify logic in
 prepare_payload()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240920093656.48879-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/09/2024 11:36 am, Roger Pau Monne wrote:
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index d93a556bcda2..cea47ffe4c84 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -647,15 +647,37 @@ static inline int livepatch_check_expectations(const struct payload *payload)
>      nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
>  } while (0)
>  
> +static int fetch_buildid(const struct livepatch_elf_sec *sec,
> +                         struct livepatch_build_id *id)

Is this really fetch?  I'd describe it as parse, more than fetch.

> +{
> +    const Elf_Note *n = sec->load_addr;
> +    int rc;
> +
> +    ASSERT(sec);

This needs to turn back into a runtime check.  Now, if a livepatch is
missing one of the sections, we'll dereference NULL below, rather than
leaving no data in the struct livepatch_build_id.

~Andrew

