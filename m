Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF63A76B4B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 17:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932795.1334861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHSi-0004dL-6J; Mon, 31 Mar 2025 15:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932795.1334861; Mon, 31 Mar 2025 15:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHSi-0004bs-3G; Mon, 31 Mar 2025 15:54:08 +0000
Received: by outflank-mailman (input) for mailman id 932795;
 Mon, 31 Mar 2025 15:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCWu=WS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzHSh-0004bk-0c
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 15:54:07 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f6e586c-0e48-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 17:54:05 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so31969965e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 08:54:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbbfef2sm125957535e9.11.2025.03.31.08.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 08:54:04 -0700 (PDT)
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
X-Inumbo-ID: 5f6e586c-0e48-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743436444; x=1744041244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FynnFSCloVKD/Si51Mjnsdl7p19Fm7ClUEKps3FTYRA=;
        b=Gj9iUT9+d7lxfdLRcjsrgPUoaLeaM7M2QjNC771f8ZGveg+ElLnht9zTWlb5J784Lh
         pIIuijfHK7N+R+K7jzP8qePKQpURCThAt2UTH/y5tsX1nm7lGHHokYlBQOw1rO2araRU
         cD0H4fChs4q/v6cynKs5zITBRdK3QkVJKMZ5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743436444; x=1744041244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FynnFSCloVKD/Si51Mjnsdl7p19Fm7ClUEKps3FTYRA=;
        b=Fd64gDkz75xq+clvre6Vu5E/I0TYBRYqDtkT6+ocxHjnddB2Rlyoi5Ti9muPtndH5F
         XJw5fBwoRXsPoQoJVN0YXyUaSL48vWuk5gU3bDcjqIrQuWuJHuLwfNMf5uxuNNL7JonM
         YpOgSyfAlts7b92pQG4NSjIYbwEAJhHu9601rdoSHZ+6pkj+eJDfdoHToiztaBUCyOkd
         CF7TAajI3hKLP2edfTePbRS+jF2pS6iutK4o64KcLDdFNHDdzj0h0k4iDLEp0oDttCVn
         9IumCk6+9ftHTW7F7D6VkOyZ8+tWT40E+pPiwCMmaXrUBFcrssxbUScYHcDtxDwHhyFr
         Cgug==
X-Forwarded-Encrypted: i=1; AJvYcCXo/I2unlJWmEAh5HgrUGsCn/0g8Y6+Yzc8DwTtAQOlVrHxeEYkj8rkzu7e+f5bqmza1Jm4V8lJLII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcGVdGqDWyXMpjsAkYKT9KBber8/VXFJhpUnY7nFmEFXu5LRgA
	kFuiTM2VjC2TOZr/z0CRCb8OkH7i6WJvnd8L0yd3qgI+1N8plgeKaxJ3CQiBboE=
X-Gm-Gg: ASbGncsNQ22WTwaf6Ehw+mGZqE7ON++26pQRQFVqQZd7Ovj7+3FjHyj2z4a8wX4qe+v
	W7CnTjRNLLve6PMLJyE/V8oWAApMCCG2RIXwVewuzOBPEt/VTFvvwwqIaBF1zO2VS6KZ3t6rERr
	hBhI8fJZR5Hl0bxE3DvRaDzMizk55470+u0AA0BgX1AT0vD0SmaX6A7NKeaUUGDkEByIAedRsQ/
	3Kop876Oqwg6+TGcCjlwOtt2qdmtLg9HMuBu54jQJsUFq/t37zJgO1XVip9fZPdoR2T86QheRW/
	mBcHPTlPGrMt5gYqU5EstD7SH8TZO67l6mGBbN6ujqJ/bgzaejUOL/lEBju359I1KmVtFOf7j0z
	ZmVyWdoqMvA==
X-Google-Smtp-Source: AGHT+IGnYfdHV4uglTsrx0CY1J6tZQwdlNAE1wOuQ9isbcgP6d/jdmdnnFdX+0XuddQGB9mol5KrkQ==
X-Received: by 2002:a05:600c:5119:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43db60b7966mr75311495e9.4.1743436444582;
        Mon, 31 Mar 2025 08:54:04 -0700 (PDT)
Message-ID: <a2e24072-07c9-494e-bc88-2c9f4c8b240f@citrix.com>
Date: Mon, 31 Mar 2025 16:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: replace _BYTES_PER_LONG
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <09082f8f-5c1a-43c9-9b84-19d832e0849d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <09082f8f-5c1a-43c9-9b84-19d832e0849d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2025 4:52 pm, Jan Beulich wrote:
> We can now easily use __SIZEOF_LONG__ instead. For this to also work in
> the test harness, move hvmloader's STR() to common-macros.h.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

