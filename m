Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BD9D282E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:30:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840285.1256056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPF2-000361-H7; Tue, 19 Nov 2024 14:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840285.1256056; Tue, 19 Nov 2024 14:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPF2-00033Z-DV; Tue, 19 Nov 2024 14:30:08 +0000
Received: by outflank-mailman (input) for mailman id 840285;
 Tue, 19 Nov 2024 14:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDPF0-0002y9-Nb
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:30:06 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2380e5b-a682-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 15:30:01 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3824aef833bso1372191f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:30:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac0ae45sm197489585e9.30.2024.11.19.06.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 06:29:59 -0800 (PST)
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
X-Inumbo-ID: c2380e5b-a682-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzQiLCJoZWxvIjoibWFpbC13cjEteDQzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyMzgwZTViLWE2ODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDI2NjAxLjYyNjY3Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732026600; x=1732631400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x/bddkpy4qWW31Eozqd4IaMdwqroiR1plc0bvYJpFzI=;
        b=H2fHw8rFD3U6aG9XAzIEfmgV07QNyaET8hldhpsKMTFkmYb9Fq2jE4AbOYmKxaUlV+
         lnPsEdoeavWetPohHj7X5kG49J2n5EfP8Dvmw/2vgXEykgdw2JgLbpID/1kCb1UBP98e
         knp8dvMeCf3cofNeTx++CsRR8zsA/pXHzxYQlv4ffEKG4iANDryvofvXGV5RbJ30pN3Z
         4xo0SsXdTzyf0wFEcJyIy7GeJMWSyKz+hD8nr7LC0HCA2jZ9MhxD5iyw8yn9v2FOBJdd
         +9/SLdnrf0S/LY15TUgVmfniELcHd/5lvrs3ymkPfjFwS6cd6qfK5o0S9BV5y2pXcarH
         /bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732026600; x=1732631400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/bddkpy4qWW31Eozqd4IaMdwqroiR1plc0bvYJpFzI=;
        b=AHjBx5gXh1Q/mBFSd9L5Y6NGh0Hv7QaClv5tjMekca3BSQvAog4lD/SzYXQ8LFHURB
         VdaWnGdid7cKoO5T+E/ZQ6iJXaecmUEvGgW+mqjwFobn1X54kb25Gct32FcfXyIH4zgA
         dj8RJM6/uXc55kp8JKgQm77MzgKTIDue/oZivRS1l3Z7tyBJRVwNo9fpRb2e9FPUS9Oi
         TSkYcaqTnwpDIEyNUsaDQFMuSdHjuGoyl7nXZWlqF6c7curTclxoD4hAlAyOCdVojzcZ
         Y8zrKhVrPTW74pE9s9euUd3exmvjwNx/cvDrh2nPa1V/LZHq7FspMFQHvJoit3WcWqJs
         Q5qw==
X-Forwarded-Encrypted: i=1; AJvYcCWT2WIN/IWeV29K9mTTgpO+D/99P5F+e4RKA92rv1kTALse8BNhtYQast/SVcQfQRa0PB1jsXCz79k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJfJz28d5Gbq/umm71SVy0+ibzfWrsn+9NLWtNU7i69LytAx64
	5LEtzxNa8wQHL3gWf4FLlXCLbkW5nHiR37wc7M7s38rnqOIEDCVcQKsJaTvhs/FFls7YTIRg+6A
	=
X-Google-Smtp-Source: AGHT+IFJwvS6Q8S/Z4Aawi3jfDc/sC9LiLydZZgBdo8xmhurMzqT3qBwOmIKQcdz5Ar536dcDPbCLw==
X-Received: by 2002:a05:6000:400b:b0:382:450c:2607 with SMTP id ffacd0b85a97d-382450c29f3mr6932599f8f.4.1732026600182;
        Tue, 19 Nov 2024 06:30:00 -0800 (PST)
Message-ID: <f733e721-f9b8-4fef-8145-176ebcbdaa01@suse.com>
Date: Tue, 19 Nov 2024 15:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/uaccess: rework user access speculative harden
 guards
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-4-roger.pau@citrix.com>
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
In-Reply-To: <20241119103444.23296-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 11:34, Roger Pau Monne wrote:
> The current guards to select whether user accesses should be speculative
> hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
> parenthesize the 'args' argument.
> 
> Change the logic so the guard is implemented inside the assembly block using
> the .if assembly directive.

Hmm, interesting idea. I don't overly like emitting stuff to pre-processed
and even assembly files, but doing so is probably warranted here. Nevertheless:
Did we consider at all to deviate these macros instead?

> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -11,23 +11,23 @@
>  #include <asm/uaccess.h>
>  
>  #ifndef GUARD
> -# define GUARD UA_KEEP
> +# define GUARD 1
>  #endif

At least in cases like this one I think a comment is necessary, perhaps as
terse as /* Keep */ (and /* Drop */ further down).

Jan

