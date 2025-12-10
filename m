Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC8CB2A17
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 11:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182783.1505614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTH69-0003ud-MF; Wed, 10 Dec 2025 10:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182783.1505614; Wed, 10 Dec 2025 10:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTH69-0003rW-Iz; Wed, 10 Dec 2025 10:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1182783;
 Wed, 10 Dec 2025 10:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTH68-0003rQ-H8
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 10:07:04 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f97d3b19-d5af-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 11:07:03 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42e2e77f519so4160608f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 02:07:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353be1sm35740335f8f.39.2025.12.10.02.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 02:07:02 -0800 (PST)
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
X-Inumbo-ID: f97d3b19-d5af-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765361222; x=1765966022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AiGhIHkOLGBDp15t69gRrd1nNQ9jVUe3UHEhAu+yrXE=;
        b=B3YfHnvM/7rqkbJCx2XnIdoyPK10Dk/k58c7aBVP/NyHLYCyFdHn7BpQBKe03zgx8h
         t+9oHy1HCA1Lgx9egqQSBwRb4x9Yddr/AC53SabkOk28bDK+OIogG9V2Xv/07eg0/aHy
         CGqR0+XDD3YZePTwhSXbZZcKCGlFOitiQM2hZD9AigLS74CusgmjInMQWY/V5cSpwOQv
         vnvIcA+GCg60+iTbxaB7Aa5+TZxZzMXzIxSmBfZBn3znFvmYXYSBEc70zJPdWbbCSzPt
         gwD5VdF405EMgwaGoAix20Z4j8fKWX19JMp3HIZmRJ4drkP8Sh3V+lCTznBLHCBjgbvp
         Tk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765361222; x=1765966022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiGhIHkOLGBDp15t69gRrd1nNQ9jVUe3UHEhAu+yrXE=;
        b=HaCVbngiKRjlpROYxVWugml92JHjhdKUn+tnbLbwyZEEzauHAXXumf+LZ20XTuYJrA
         YzGL36cmZZAoAGcX/6hevMY8Pfozmow2Cei3JWotfVA/WHPJf+quxeHSUj9BbgnD6R1Y
         RZDPaQOJAm88iKQO00oMaJdBgZBrgiu/0MSXZVOukzKBW9oUy0/Wq0u0GFhKJ6IoofoW
         qY61QAEAU2UU8YGvA9Ay3RC/7rmDPEL9KVLDuDye1K3hM4i0ZK5yDCUXrOABNMoA//Jr
         a0VbChFAq8DvHXZYyQoYa2/KnH9CHWnNzANUOoHZkpBMvaBNVaNKb5vnl44YnuN/sKOK
         WLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm6RSaAsgLnGmKTUK4K5Ebsv+l8JW6bzQ711YwWeYkofRNQ6quuzmPzLRthb+SMZ2jVuLk8sWDFXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz50BY7Xl+f8a3AKLfZcA7TojBA37O23IA0NLk+IZPU3tjZ6B1a
	q1/EgYgm3CAjDUK84OExl1a8RkcAPutH9o5jN6cqXKmY+JVhlitEchbi0Z9EopLN5Q==
X-Gm-Gg: AY/fxX6BLYwzj5FIJysHT7L7AyV9Qo/3l1jtElGZNdxVAdqOKHHyl30/gJa7kRdZIqT
	BI26rm4xsacsaXqhKeQXpJscnwIQxefoFMK8InqHrvHXVt9LDA8t+y+9aoTO/Gnsf7B1Oj0D3kZ
	xSG1/QFENGk75odZ1uIXH43UJY9W8Yp0eTThJLtpZ4774kALYF7V1WJnG6iiBEExumcPW4eOYw2
	EPyjTt6ZK5vitd+nFitEZ++6PIoglvFhxGskr7V63P01ndEx/vZw43Kpebp3Vi4l9Ve6tq+ziEF
	7ekDgW/U00hdFanPOxPNC9lVUpTaCX7iItDYQqQ0jOpt3rrMkFg2pQM1Xwkpz2sou4y3F1pFRD9
	eu1Sj4vvd4zmuGC/CCwgn9hKAzs7sCK5+8bxjqhN4AXHPPPuEfUMyG2YLJ/noQPvWAmLijRO14e
	wB8obpPIi9hKYxu0wmeupzw3Rck69w2F73INrNRzBZu7S8+F/oUIDNI1eLQ1TfpXdKqXQc27fOI
	5Q=
X-Google-Smtp-Source: AGHT+IHviIM7vilwuoBtd9w3bKe62DSMi3DO+EmVDAOLyJmFmN4fNxupzX5hpqVGCMFFWsec4qHkMg==
X-Received: by 2002:a05:6000:2c0a:b0:42b:3907:a38b with SMTP id ffacd0b85a97d-42fa3b07c77mr1752638f8f.44.1765361222545;
        Wed, 10 Dec 2025 02:07:02 -0800 (PST)
Message-ID: <d6830fb8-ea86-45c5-95dd-d76a1d39b162@suse.com>
Date: Wed, 10 Dec 2025 11:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pod: fix decrease_reservation() clearing of M2P
 entries
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251210093513.59534-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20251210093513.59534-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 10:35, Roger Pau Monne wrote:
> Add the missing index increase in the M2P clearing loop, otherwise the loop
> keeps pointlessly setting the same MFN entry repeatedly.  This seems to be
> an oversight from the change that introduced support to process high order
> pages in one go.

Ouch.

> Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'd like to note that things were broken in the same way before that commit,
too, simply because the order wasn't taken into account all. (This is not a
request to change the Fixes: tag, though. It's just an observation.)

Jan

