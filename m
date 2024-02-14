Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32E85517B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 19:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681130.1059749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJec-0006sx-G3; Wed, 14 Feb 2024 18:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681130.1059749; Wed, 14 Feb 2024 18:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJec-0006qA-Ck; Wed, 14 Feb 2024 18:06:42 +0000
Received: by outflank-mailman (input) for mailman id 681130;
 Wed, 14 Feb 2024 18:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raJea-0006q2-K8
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 18:06:40 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cced29aa-cb63-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 19:06:39 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso30573a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 10:06:39 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 eo14-20020a056402530e00b00561f0ce1c91sm1786848edb.31.2024.02.14.10.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 10:06:39 -0800 (PST)
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
X-Inumbo-ID: cced29aa-cb63-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707933999; x=1708538799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37j6eElZ6gYL2fWuf2fnGhbQJvRalCcw79uaKd1ALlw=;
        b=JAc8LLh86WIxxku4lOApAMgb/C85k9X/zMTuveFRFDwo6n4icKp9oIsJOUAIV1LTOJ
         QWf3km481KJt0ieQIAD5uKazK4Q1MpUozuMIq/TrZhBJewvIvucrx4hA9WYbFVfPMeO9
         BYISmklRBWfUhRJhy84RBWL4leT/cMeYqm6Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707933999; x=1708538799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37j6eElZ6gYL2fWuf2fnGhbQJvRalCcw79uaKd1ALlw=;
        b=IUqo7M6Kx9bzV4USvzQF9+jGYcymKbqYEDuH/Btp7q2QB2PiDEh5YHWu6ZeUNDrrN7
         HAFPTR1jCiXSgKRR+DP/YH4SsdsOieeR/oWp7fSYhNYNlskTvqUqBYIG0U3cg0T8B8Ya
         1R6PSejocEglkelO7S5wAhRSLcwxQlflIG8LVA4n0Nl+VbfZm+18GCmD3tSaRmQ3R8rS
         zmP58f8QXdlDPx8E8Jp4wxvB1fcvC3djU71/uegu4NRzII4ZLnNNpeOf3kyy3vXjTRNj
         0iANeY4KuNhBd5DXys6iVmVBPAIn9BNAOpe5h7DD5Y5gTBMNW97o3rtY0kQDAw2Cco/t
         TQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfkdBgfpSIHNg1Xf5fBU8wpP9SrSnDQC3kCQtL9FWFUC6tqQHSNvZEMxoPf1tjjqk6RRyPXkc/aPfI358NAg0RMemlo200uKq5M4/vxx0=
X-Gm-Message-State: AOJu0YyAn+CHiYxtBUt3W2Um83APa6eXCcjUxPdAkcTdo5S59bEpIABl
	p38C39Gii4jfNqhws1nDewjb3M94DNCXoWbzL0pZnA8VnoTWbfyw6TmNvQnMQ6A=
X-Google-Smtp-Source: AGHT+IGzt4oUARh6ueYiUVpLLVllsr4kP3w3oBbf9fwqwCZ2I4oM75yyOkTbYlKZ9wnR54OtBVVViQ==
X-Received: by 2002:a05:6402:1491:b0:562:f95:e501 with SMTP id e17-20020a056402149100b005620f95e501mr2381635edv.26.1707933999219;
        Wed, 14 Feb 2024 10:06:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXo/MSza71iXwHT+vkWpnQm6ZwkM9qHl0NOkakjXvyemALHU/7ByWkGhEXkG9Y0SEIe3ki/l+Ax9A1SDP4eJbGclybSirec4qdgt8J4PWCzTzfXZ5qUrX37BeL/XKVsnWmHTEIjJ/lzwcRORwZgQ9Ns2aIHTfwH5ULo8xMQ2jGKBEp/xprc3VPhgBh3C2SqESrrqOM+VDO+xl9rFCPSHiKo4xVoTZygea3tQhOItCcM
Message-ID: <dca166f1-6b94-46bb-b576-411ef9cce127@citrix.com>
Date: Wed, 14 Feb 2024 18:06:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] build: Replace `which` with `command -v`
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240214180039.57527-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240214180039.57527-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2024 6:00 pm, Anthony PERARD wrote:
> The `which` command is not standard, may not exist on the build host,
> or may not behave as expected by the build system. It is recommended
> to use `command -v` to find out if a command exist and have its path,
> and it's part of a POSIX shell standard (at least, it seems to be
> mandatory since IEEE Std 1003.1-2008, but was optional before).
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I expect we want fixes tags for c8a8645f1ef (python) and 3b47bcdb6d383
(figlet).  Both my fault it turns out...

Happy to fix on commit.

~Andrew

