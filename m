Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2882AB256A4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 00:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080384.1440821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umK2e-0008OH-IX; Wed, 13 Aug 2025 22:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080384.1440821; Wed, 13 Aug 2025 22:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umK2e-0008Mi-Ej; Wed, 13 Aug 2025 22:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1080384;
 Wed, 13 Aug 2025 22:33:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umK2c-0008Mc-TD
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 22:33:54 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b35266-7895-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 00:33:54 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c2f0eso171144f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 15:33:54 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abedesm49490504f8f.3.2025.08.13.15.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 15:33:52 -0700 (PDT)
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
X-Inumbo-ID: 97b35266-7895-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755124433; x=1755729233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4hmgEIVlZGhK3VPLW2Zid7pc2EdMVtlmM8ABR/FV6ZU=;
        b=HObf9VuWKcSZ5/UtaqgkvwyoaYF8NY8pfmmy4CccxuwkqhvPxD+0eSHb42r5j5XUMa
         j5P0lnh4alhFvumyziqBQvVq8BsW3GvNQkKqJJYhvzQdvsXczOMRYgT3gmGinedUv2Qt
         kQCK133hqNOKgwrgVhpXFltFyJ28/cq5NlJcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755124433; x=1755729233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hmgEIVlZGhK3VPLW2Zid7pc2EdMVtlmM8ABR/FV6ZU=;
        b=DUZcpiiPscmybmuVCJpqG8KmqwtDCffdX8mF/2uIgUe6DwQnmx8E3idOX8ha0RiLmX
         SEtucRTqL+Ltki7baLmeOqK4YfM4n9ZPiQHD//pAiJ1cBu7oegiJ7E3rESnBltloWBqr
         PDA215+Viq8pJwRPg3Fzzb/t32jmnNmYgD42iZ/nUYfi4fmG0TdGL+daO6dJ0yNX/LEQ
         svoCVnmGJFS7vPtspP+FSS67P+ylbMzUWouSfjWwNGSlpflj9z7f3AhIQYMqcTjUq+0r
         NuN1PjZvd6KoR3hPp+LF7q00zLduMsVgkfGscqH/3kAVEDS3UfSg+AGt6S3K8C38vK1m
         1u5g==
X-Forwarded-Encrypted: i=1; AJvYcCVprKWa0yzy9jHT5yWIli1C4SZYhgA63prANk0k1PDSXc4D3pf9tkvVDhK8x3/If6Vjae8eLjZkzsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAIEFumd/30JHgArQIL5783a7+WuwDaXwtJ/h8AkhQe/Ne/Ni2
	0wzBrH+ST88kSzM4CVMlWpitj8nzvNJkMqwf7mBwVx/8dx90+e4j0pHte4xxCB7MkQ8=
X-Gm-Gg: ASbGnctVqARJPVpO6uRyE6zOZLS4/yCqgj1qIMjj9wSvnM2/3m9gsbxrH8IsGNelIXb
	QL3rvO/6st0bHR+Z2+qyg3ewPNWvvNmiVTJFXv2ZtwM1a96YO783LM2UFLxkfiQXBIYi9TsgYpa
	SzzW+KY/+9f7rUU/UamInAGR2TbbSBnHuqYfil1E2l9gzw8I16CuDFwOovEb55bf4/MgSS2YitX
	Ho4yN60L8xfy9VUHvcMgd3sWhhNtoy0kckIvNH5i49xumdSqqPl1Xpy1latPN3a3f+8+FUxGnv7
	wxCmkr4xTpRBrA0RaJqAJWHDpuKfGj0rViIXpkAyKalRJS/xpBgFYAUjjYpU6X5dw0HJ8BgSycR
	3QUeZO7bY/f2kfsJaEBuvEsawdGhRzD5GvXaPmUqT12wbKlmUrzXr5EsFS7+KYMYci2Xw
X-Google-Smtp-Source: AGHT+IGsZH07ICk2ccFUD6R15G1gCa60Kv6tOYAEZtBAIRyX1QOWyEJeRS8uMt0D8StSTEEDY5jmKg==
X-Received: by 2002:a05:6000:25c6:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3b9e7438457mr623339f8f.6.1755124433387;
        Wed, 13 Aug 2025 15:33:53 -0700 (PDT)
Message-ID: <fe58d539-c650-4f38-bfe5-7e45c1181f7e@citrix.com>
Date: Wed, 13 Aug 2025 23:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] xen/macros: Drop alternative definition of
 BUILD_BUG_ON(_ZERO)? for old GCC
To: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
 <d716610470ddd7da75789cfa546ed209ff24e1d1.1755111932.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d716610470ddd7da75789cfa546ed209ff24e1d1.1755111932.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2025 8:12 pm, nicola.vetrini@gmail.com wrote:
> From: Nicola Vetrini <nicola.vetrini@gmail.com>
>
> The toolchain baseline for GCC is 5.1, which supports _Static_assert
> in c99 mode
>
> No functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> ---
> Mentioned in https://gitlab.com/xen-project/xen/-/issues/201

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

