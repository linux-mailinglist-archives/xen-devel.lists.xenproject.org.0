Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D16BB1EB55
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 17:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074779.1437274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOnG-0000lI-BM; Fri, 08 Aug 2025 15:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074779.1437274; Fri, 08 Aug 2025 15:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOnG-0000jf-7b; Fri, 08 Aug 2025 15:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1074779;
 Fri, 08 Aug 2025 15:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukOnF-0000j2-6K
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 15:14:05 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51cdc808-746a-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 17:14:03 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-459e794b331so14349095e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 08:14:03 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459eec47306sm78552235e9.28.2025.08.08.08.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 08:14:02 -0700 (PDT)
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
X-Inumbo-ID: 51cdc808-746a-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754666043; x=1755270843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L6QeaRW+WIW5U2byUpDORJ/8NpY51iUgoECmJTNcRcs=;
        b=QTgoaDbfd/5UoRintq4ZafP/FENg7jE/qa3hNQ2wEjS7pox9BJa9J1mcC/R6MMM79o
         aS8eeo5zVBhUM6hrHIDPitQYdngnZ37Xuyuh8gCsos8JFnzgJCyT/DLCGK6D3BW623qm
         7E2WUUOp9khRqf5FeT96znIdrgbqL6bUitHKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754666043; x=1755270843;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6QeaRW+WIW5U2byUpDORJ/8NpY51iUgoECmJTNcRcs=;
        b=f9StlNWE2ct9/bAacBwoGidoZQ6V77NZvuc2B4swxKo0vKWRJdb4bVyOJhfcW5Mrks
         vmZFQiAfkXIgwSLsBvXcToRLBg6r8w0aSmi1BeG43FkOdYIS1MoZMSW7uNXMwk7M1K9F
         AXJLkgk65/SSWZ6JULhUFVn7SrnTY8/xWJXQMqj8sya9hgVGOGYQzeDL7RfLvhhPt37o
         50XrFgFeJEoJlnnNIoRNMp0qzOiJYw4+UrAWw7pimK7zoF/F0Lw1XltF82TDg7X+sBmi
         CAfNR2fRTPF57QKI70IYRjQoJrKRoa28+yulGKgLQnd5c91StT6CCuqV+8AJpPzeFaji
         aLQw==
X-Forwarded-Encrypted: i=1; AJvYcCVL8/UmyDqAFni4Y1M79XqXytVd+idcydMnP+pGzsekTNfXzw7fjH3pzWOr8DISoR/jIZlqKIauJf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxby+2zwbveZ68izC/n10s96UAzi8BAEQ1J4d7f+QoklCIqBr1z
	P8NYTXm6x/YiTw4kagUgqG3Qn+0+TRA6V2X4JmtmK40H91ci2FduNZrQrF5BJh5ugZw=
X-Gm-Gg: ASbGncsumEx+6WBgV3hlQztSlWK8Shi1qKQrz3dlrl0NW9rdJacyIR72tbzRk0M1Oy3
	QwZ8SZus724z0fkkaIVMEXh+JNQ/B4D6FFo5hRtwa8QQHyMiMnx+VnUqOYds4xJKLLF290rTRiY
	7bJV0akelXNZdzH2TtHz83602uiga0mM60U61zzCeL8iSWmOeZwp/E002/tpYDihWTvg0ycl9bv
	dsw55N6jYzaIXaHdCPK7ZHQnoXDtAj2ijfc/h3rnzuK8G0cQCGueXA9S3otO/+ovGMqd/4zl6pG
	CFEUWLczVAhmEESzWl3OrDKf8Ycjb8x4YcJW06Aw4RjauC854j9otwz7udu8sPOfeFtVKwP/uiY
	jJ2p/NX8qDw3d5rqMzrpKeSx7vHxR9w/8sXrkUohQeSrvyOIxAiK/gX9W1Y0L5xcx+DRd
X-Google-Smtp-Source: AGHT+IHkR7i1Y8Vb6ycDxVG5pZyajuq5FMH49c41KClaugjlQ4md+mMDjVq/Ksc64gieFgg/dvBMMg==
X-Received: by 2002:a05:600c:c493:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-459faf4758bmr7614135e9.11.1754666043131;
        Fri, 08 Aug 2025 08:14:03 -0700 (PDT)
Message-ID: <d3b8235b-38db-4b7c-8bcf-be4122b07b3b@citrix.com>
Date: Fri, 8 Aug 2025 16:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 00/11] Allow to build libxl and other tools with
 json-c instead of yajl
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Community Manager <community.manager@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2025 3:55 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Patch series available in this git branch:
> https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.libxl-libjsonc-v1
>
> Hi,
>
> The library YAJL has been unmaintained for several years, without an obvious
> fork to pick.
>
> On the other and the library json-c is been maintained and use by several other
> project, it's probably already installed on your machine. So this patch series
> intend to allow to build the Xen toolstack again json-c, and forgo yajl.
>
> Just in case, YAJL is can still be used.
>
> There's bit of libxl API that exposes YAJL, mainly so it can be used by `xl` to
> call libxl_domain_config_gen_json(). It was exposed via the "libxl_json.h"
> headers. This functions and others won't be available when libxl is build
> against json-c.
>
> Cheers,
>
> Anthony PERARD (11):
>   xl: move printf_info prototype to an header
>   libxl: Remove duplicate libxl_domain_config_gen_json prototype
>   libxl: remove duplicated libxl__yajl_gen_asciiz() prototype

First three, trivially Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll look at the rest when I've got a bit more time.

