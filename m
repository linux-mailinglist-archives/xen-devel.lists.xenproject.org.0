Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2598FB2066E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077320.1438386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQBI-0007CG-OV; Mon, 11 Aug 2025 10:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077320.1438386; Mon, 11 Aug 2025 10:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQBI-0007Al-LQ; Mon, 11 Aug 2025 10:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1077320;
 Mon, 11 Aug 2025 10:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulQBG-00077e-Le
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:55:06 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3c419ac-76a1-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 12:55:06 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so2217484f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:55:06 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c45346asm40154974f8f.39.2025.08.11.03.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:55:04 -0700 (PDT)
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
X-Inumbo-ID: a3c419ac-76a1-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754909705; x=1755514505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3y1G0o9q7WkoHWUqFPzY0iITIhOqZA3q0hcyApoZFpo=;
        b=FU9dRL2Jj6lxRplgB5hJtEEJwXzqz4wylqs3Z3zKAVbsJTHY8SzgOZ3+wzzDnDq9FJ
         2ztrmYYMM0KpSWH6tSagSu+RqSl6Sqqe58FQYRXY1EVov6bHRbYf6dyDYB4x5s+hIMT9
         GrS71DA6g/j0PbqFNFRON9uWs8Zih7vd/PI50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909705; x=1755514505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y1G0o9q7WkoHWUqFPzY0iITIhOqZA3q0hcyApoZFpo=;
        b=hbiwdhR4tyjRsLQ+xGNF1nAb22w3fkjfQgzw5Bt3xVRAzDcTzM9oN8IZxIUKkuozd5
         ZQwr1dG+c1Fm0NkbQByW6+7838dxo/3AZCViZLH3e2TshvjFXvbh8/GsLyo+pQefGGD7
         hfTo1wqqhF2UOMpXJ0CFciL/d07Vs6R2JFHq6MNIFTxxW0Kb8d5Tqt3IjF4RbkJdcKZk
         YMvaCJx8JVXTHxi+8uCuSUg4CmBmzG0oNv37NZfUtXs+VCPScA3H5Zqq8vSvKRvGM8jg
         U0X2kYr5Xyd17xFCxinzXQw45nkG/Tiq2ofJlayvuwkWKJ1Mkk5L6XYYwuiuz9uaDz9d
         UjLA==
X-Forwarded-Encrypted: i=1; AJvYcCV83PrSsvgN6UDNhxeKSs75uFO5CryyIc/7gWLrFhuZMCvR8iPpMqhDh8XDtEeOhFjjuN3Ht/ROQDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmOq0hLo+3GYaQEfFtAored13yiPhiItfuXoroKUryKArZ35WE
	LtKOR2rl+xm7TN/2k9nN70p6APlLDuChtNFVCVqZ5urvsxRObxzDTt7vscnR0iSFBEc=
X-Gm-Gg: ASbGncvtuUnu9VL5nocIw0wL59xRdHKuQTtxxg4rPzYQSbkFyCFO2QxaMFp6ugIVhXw
	mlKfFuGX15rz+7saxW4etIl7qG2VMaUFo+C7ZsCSTEK1jtSWApEZvqu5UP47j5xK4JlUurGDrbH
	Jl1wYhFE4uEYBnSZOz4DiVzMe9WZvQC2pK1o8EvbVLfVzl4dFTmHEa8msyGAU1lI8PlJdzqPiML
	BKYckQUV7E4hnMH/44/zm8gmoR51haCRzz0pSlTHRjtCK2N9xzMcd8dHHzkqpEa10GXcLUE7Ep4
	xArM0am50cIj9CZHPP2KbEkeM7F3vZ0eG0L6ARSGU9GeCq3jQZ2l2lRLd4TVGMoUYmN8243v0mP
	ejZ+W0HWf6dywgfjrFQ+ks8aGfefBM+uyOpSWxLnebHNvBeuJarcI2UqWbNE+EAzpj7dk
X-Google-Smtp-Source: AGHT+IGZGrgAx6eXpBSvlAk4LgvuGLqG8uyelBpfNSZd7VYVMaHyhvFwYtj0lHPYh/CdZFqajTB2wA==
X-Received: by 2002:a05:6000:2301:b0:3b7:9bfe:4f64 with SMTP id ffacd0b85a97d-3b900b6a9cbmr10593236f8f.54.1754909705275;
        Mon, 11 Aug 2025 03:55:05 -0700 (PDT)
Message-ID: <2f073fa0-5064-4cd2-b332-c3a6ceaf537a@citrix.com>
Date: Mon, 11 Aug 2025 11:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 11/11] Update CHANGELOG and README with dependency on
 json-c
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-12-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808145602.41716-12-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2025 3:56 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  CHANGELOG.md | 2 ++
>  README       | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5f31ca08fe..83195e2dae 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>     - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>   - Linux based device model stubdomains are now fully supported.
> + - New dependency on library json-c, the toolstack will prefer it to `YAJL`
> +   when available.
>  
>   - On x86:
>     - Restrict the cache flushing done as a result of guest physical memory map
> diff --git a/README b/README
> index 6ee58f7b35..9329f30e13 100644
> --- a/README
> +++ b/README
> @@ -53,7 +53,7 @@ provided by your OS distributor:
>      * Development install of Python 2.7 or later (e.g., python-dev)
>      * Development install of curses (e.g., libncurses-dev)
>      * Development install of uuid (e.g. uuid-dev)
> -    * Development install of yajl (e.g. libyajl-dev)
> +    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)
>      * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
>        greater.
>      * Development install of GLib v2.0 (e.g. libglib2.0-dev)

What are we going to do about testing this?

We should add libjson-c to some build containers.  We need to annotate #
Xen < 4.21 in the existing containers so we can drop it in due course.

Also, for a container we don't intend to backport to stable trees, we
should have libjson-c only and no yajl.  Probably best to do this in the
Alpine update which is long overdue.

~Andrew

