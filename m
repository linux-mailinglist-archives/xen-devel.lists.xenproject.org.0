Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E0B39829
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097957.1452125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYrm-0000pB-Nw; Thu, 28 Aug 2025 09:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097957.1452125; Thu, 28 Aug 2025 09:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYrm-0000md-LD; Thu, 28 Aug 2025 09:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1097957;
 Thu, 28 Aug 2025 09:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urYrl-0000mP-9r
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:24:21 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c65de450-83f0-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:24:19 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b65469a5bso6642205e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 02:24:19 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0d3073sm72564665e9.7.2025.08.28.02.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 02:24:18 -0700 (PDT)
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
X-Inumbo-ID: c65de450-83f0-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756373059; x=1756977859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FZw2ZxIJ5DAXQzu7ckQMG1wjL3HXSja6gTGUzO3hL+0=;
        b=E6fxw+Novtx8RWnr6G4YNbWs8qAjwETQmb7ob7tz3AI5CxlVLMNElfcmcBKbD3zs+4
         fu3dMk+LTdKmCEg1UPnVRb15qlBVuWgr+p7c9h9El72jv24Ikwv6cKFcMfgOJgHdZqM0
         pwaKJsWzWRbZQJbum3uvXfMlFY5R4FrVOfAUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373059; x=1756977859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZw2ZxIJ5DAXQzu7ckQMG1wjL3HXSja6gTGUzO3hL+0=;
        b=YmH4Nl5KdvdepgTYax9QlamhJT702AH2y/XXm+C/dRDoAHzfPQeGYZLCeI7i5WC6JQ
         s7vvdMIZbA0R9OLXT/zVQFAgep2hnY78VE/PefWlLVTRaoETrmqCIbKmWOTBuoYURe0A
         h6q6ddTdCNJ2qROopI1/RXC7Gh51G+a/v6NWvkY8cs/beOZlqkzs4cGTQ/1RNTNkUjjC
         uhzatXx4aLR5r5ody5d9Jgr1q4dLsAQ+8tDxYeR4+MZk8vIHVLOCslx16Rq1Ir+kndtr
         7GgKI/hRHiqrqRGoJDZNumD3/kptVeaikZmJUitwNNfZcK57pXEsrpJfTxZoupfDWAgo
         joFA==
X-Forwarded-Encrypted: i=1; AJvYcCVd6FLosxbz2+NnTzKYDjAwHgr4ejiK01w7YRsMyHZ4pfcmy9kaOAureci7gMrHcmERFD7kQusUQaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZ4ODlMXmgCZcdYa06xwXl0HcrdXR7e/Riim9j5ec1e355UhQq
	nsB9YZj6743uhRydSJGUUfKm4iexMVQLbFSkGs2Fd690VBWFb7CSTVfl+gXEWkaGa+Q=
X-Gm-Gg: ASbGncvN1V1ofsxxhypUJ1GXSxZU3m9UATbrd5IFZ0g01nY4R8UBqupEyApBYESjytD
	99vQ2Yh8k57MireDMEdn15kgTNJuR5FKQ1zY3cQbDm8fzSIoTNwe6od2NwjEYK6kDwbg1MM1cHs
	jhe7PrKa3nRkLe2dnfy/1Jld4GDXPf7YCrASkI18hV5hUt1SmWKNeJ+JQLK1lD3jR6Br7ev1zFz
	UkjzjrpxlHvKavWbdtJhLQ6ZrADPf23HosDExkhlsFXomxRv/QjL2wbkDlcS940VVJNhExqbmem
	5rZyfUidG5E9HuTP2R47T9QspAsXg8i8mtwN5n25C5lZKhwglnBf3TmpwCrqQBgYGydwkdrVvpk
	EZhYTFO6QNpFa64nm0dGRsAEaHXuCZH44rQFnSNYvMrnDoizFWO3VENAuS6S2P+mKZchnPREe91
	MCGeGV6G2i/Qzknw==
X-Google-Smtp-Source: AGHT+IFDDOijsnN8SE+0T963JMJJQw5DOkjWTXJSF3x2ew99cUFaB5kskZvP3AuqPHWQVvlK7LEh1g==
X-Received: by 2002:a05:600c:1d09:b0:45b:6b0f:caee with SMTP id 5b1f17b1804b1-45b6c58c26bmr54655055e9.6.1756373058703;
        Thu, 28 Aug 2025 02:24:18 -0700 (PDT)
Message-ID: <0bdc4472-8395-4110-a2c1-a7388472d9a6@citrix.com>
Date: Thu, 28 Aug 2025 10:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PSR: move CPUID level check
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a3c768bc-c99f-484e-9e36-f8e03930496e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a3c768bc-c99f-484e-9e36-f8e03930496e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2025 9:16 am, Jan Beulich wrote:
> At the first (and maybe second) glance the call to setup_clear_cpu_cap()
> (which is __init) from psr_cpu_init() (which isn't) looks wrong. The
> earlier cpu_has_pqe makes it safe, though. Nevertheless we can do better,
> by simply moving the check ahead of the BSP invocation of the function.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is still terribly convoluted code.

