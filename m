Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A354A77D17
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934416.1336122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcAy-0002vf-JC; Tue, 01 Apr 2025 14:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934416.1336122; Tue, 01 Apr 2025 14:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcAy-0002u3-Ep; Tue, 01 Apr 2025 14:01:12 +0000
Received: by outflank-mailman (input) for mailman id 934416;
 Tue, 01 Apr 2025 14:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzcAw-0002nP-VA
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:01:10 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3388cfa-0f01-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:01:09 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso27306945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:01:09 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e6a63esm201707145e9.11.2025.04.01.07.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:01:08 -0700 (PDT)
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
X-Inumbo-ID: c3388cfa-0f01-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743516069; x=1744120869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lrrWJ7Ow9YuXzKrQqiGgqhvXj8P+5frEc/U+vRyIL4Q=;
        b=D9PfI4xJVnAjYWxI4dWN6/Yandu7yFacDfa1KqovTEgR3QHmuYj+RnNXTCxu0pF505
         kovvfmzIWPe8dK/dm/M2/ZmpdYzlH8u9q1EUeK7pcf75/xWAKoYjxvnNNZqYv9eVM4gY
         ZWqi6wT84UGCAbdpRtJ8eabZid6kwtTfrFnOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516069; x=1744120869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrrWJ7Ow9YuXzKrQqiGgqhvXj8P+5frEc/U+vRyIL4Q=;
        b=PAsGZNKXIjyskDBkn3Wq4jUAOdTHB7gtyWMgiR0GH/lCfnS0Qo1Oumj1gy0SfoIN9j
         ShyeK00FGnIgzgeY5sdgzH76Y8aKWFpa3R4jIe/DNcs7qg/gTwI6u2dOhcXUbRuyzr6k
         EKZGHXOL5lVFb9htt8C2t08Sxm+UnVtBNEAxJFL5HWTirk1XEJK/7yI+MBndIOiKdp8i
         Bl8fkhrTdZ+f34Q2nTlVkXLatuEGe6FSrWT3kjZKMlzgNnMsqKaiUk66xGbkYqWLL/C8
         c0a41XvcqchwT5ry1VvXsenHWl+8e4a0ibs8Qck8g+mnjuz85gXT51ztltwQ08AyWiR5
         CJjg==
X-Forwarded-Encrypted: i=1; AJvYcCXKT9LnBmkjsJS1024Wl1Aj8QnTQ1Jpg1nuparEU+HAe6YTBJFT9hlBfMTsStKwEiD/nLlIOGP4H8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM65a7XxPd+i8ojh4KUDXXXbqg76jf3exhabSuiNyahA43JiLZ
	VSnbC7k2/8KnEVNGekYtrknR8lUOOVQLFBmu4ZufK0RoMsmVNjITeb0eQ38mInYUvp8jhD7zDTF
	gKY4=
X-Gm-Gg: ASbGncvD0Oh2AOlhLc6FDPpPT7eFbddxDsZ5R7rFh/5jvbqFwd74OMf9L0mjiNIXtNs
	FJUqvCJ0FG5pKHex3UNdUm4WJZ9jfgzs1qZbn+4q2pT9bBsdihD56OFgcQVI+X4fB7Pj227GIM1
	yScAHwek/Ay+bFZXQEKxz0gb/w4nkIOkLkVZaHGkmY5DGcXUGjgO4giZ3kmU0c6y0MqBivzqDcE
	AduzP5PWohqxHclJomYF+Tk0WUuzuoZlHpq9ECklfqYixL+uEjgpCWRPo1dDmFvJkge27R8zyqh
	DvX35Qojc8EYV6qh/VFA21u0Q8BCkqh7RecdAzivAqjPCorqGF42Obw/5AMX9BkW0TSgm2YjkwS
	Z58u3D6YdSa/w1WLu5DCP
X-Google-Smtp-Source: AGHT+IHgaWkHQAbX2/CRzog3AHjatdUWK12m8N/8HcS5CLWf85rq5L39Hmo/j50WGw3TxC/l+llnnw==
X-Received: by 2002:a05:600c:3b0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-43ea7bf5717mr36257345e9.0.1743516068473;
        Tue, 01 Apr 2025 07:01:08 -0700 (PDT)
Message-ID: <e4232951-8e26-44d4-9e44-306fc0336208@citrix.com>
Date: Tue, 1 Apr 2025 15:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250401130840.72119-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/04/2025 2:08 pm, Roger Pau Monne wrote:
> The base address is in the pe32_opt_hdr, not after it.
>
> Previous to commit f7f42accbbbb the base was read standalone (as the first

This is slightly awkward grammar. "Prior to commit" is the more normal
phrasing.

> field of pe32_opt_hdr).  However with the addition of reading the full
> contents of pe32_opt_hdr, such read will also fetch the base.  The current
> attempt to read the base after pe32_opt_hdr is bogus, and could only work
> if the file cursor is repositioned using lseek(), but there's no need for
> that as the data is already fetched in pe32_opt_hdr.
>
> Fixes: f7f42accbbbb ('x86/efi: Use generic PE/COFF structures')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

