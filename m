Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F0A46619
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896982.1305727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJxC-0000Xa-Lv; Wed, 26 Feb 2025 16:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896982.1305727; Wed, 26 Feb 2025 16:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJxC-0000VV-Il; Wed, 26 Feb 2025 16:08:10 +0000
Received: by outflank-mailman (input) for mailman id 896982;
 Wed, 26 Feb 2025 16:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnJxB-0000VN-9F
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:08:09 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddd7deff-f45b-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 17:08:07 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f504f087eso5433158f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:08:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd70be4csm6092167f8f.0.2025.02.26.08.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:08:06 -0800 (PST)
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
X-Inumbo-ID: ddd7deff-f45b-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740586087; x=1741190887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z7nyl1j/Yrw2WXSkd2uR+3KvAf9QQTNvgc9tA/tL2WA=;
        b=W4El0wC5QDo29dlDGZ7Zl8fVfHosxC0CmnaBwq2wPVjvO2cvKkLB8PrtdI8iUl/p1f
         WzVJVOxgbFvYHM/cV9/qqV6O5tYAzfjOHCBT1gbcTIunY7OOqqcuDQfFQUeJjshzDxGx
         j4JP6UeuwcBhddRYD3bniKNY3Qt8SKFEm3N2HQ77OQI3pvrbLOkLcDxrh028PUKYsibc
         4Q4UxCFEmBAoMokLvb08flWTsv4airQ7Jg/eXKTmrr1LOcSaoGvjNlptKt8bQfK63mMQ
         hxBNsWxfJ3kQCV4zfjIKJtAhhJYyqixYbrehp/wDdHpWVZrAaKH23D8FihRpT23wkoKr
         RWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586087; x=1741190887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7nyl1j/Yrw2WXSkd2uR+3KvAf9QQTNvgc9tA/tL2WA=;
        b=MVcaTSuxXnQv5F51fdJjiinI5vZB3zwIVhyoBlt5vsacq2g8yXtxQLFvS/NDnHRLj0
         VoSL3Nf6Q3ES9sXLDCBiMI8aj+GNy2GH8N2izrxjl9iIYlo1cRWbX6E6ayZxuhWMOiWM
         MuE7byMykdvRFOm/1sl/tw+0Z4x908uJ9cIqCDn5maTmFBIC7cHqvD8xJXcj0Nh36Ebf
         phjqPCR2Pjrp/vblPOaIAYVQZE+Q835Z85pNS/pGV02FNRdQ/Uw2trf9qp1xwvbcg8Pw
         QtKh5542NjBiR3O93TvjOUN4hFRxR1YBDZJMtJrnbnWj7biDvDHRHVvmw0tkx7O9YaIZ
         kaVg==
X-Forwarded-Encrypted: i=1; AJvYcCWYV8qQnA8Lhbc91/AkODv9vZCKj3xIZkgi/F/TQD348HpsOE1ROJ+Rb1Hz6qB5l63673A+XElKgKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza3eAW8tXICxhnFhG24R3JpsTOhd0+6yisE7QyKmSeNULxfS3Q
	LOXf74Zd/dgrZVvVCokSSgDwyX3tbNXqlnNGGjf/Q/x85BMU3N1q7YhkvQLG6g==
X-Gm-Gg: ASbGncsFDywKosaojpNvOznz4IWz2AqkeZTMDuK8LD7V0J/F6LLhQHpHf3Pn8tnYSVT
	ZXA3BFhKdqymqZCR6K57cXFJz6rnjK3NAZ6TUu3htB0gVFbY8kvXTs1B27hkQs9bpszSGoEQMnK
	EjJyD8nVO3860xFTPoPSvgXVm6+xdX/hqO6R+PGYdTeEOZMDTueWUrMU7AlXSmm+87AaSM/puNW
	6H1eGFPDYuBAwQEhfZbcXoZkK7CHd2UOyaBBxpHJkApwT77NBCPnvlGZ90KNhArjMhGF2eCqVVc
	VHS0l5lJWtQoS9IT6w2TRuy2OEIQ2MkD9/WUYrIaIwD1/THaBI0xV/Xdyg+azCLbuY/pJ9yYv+Q
	As4P96lrTNiE=
X-Google-Smtp-Source: AGHT+IH9geFMpzTq31eWLLhhczfskC3qGw2eE7neBxKsEtdlWLtNjhw0Q4wIoHhaxem8xxJGZ8QNfA==
X-Received: by 2002:a05:6000:4013:b0:38f:3e39:20a1 with SMTP id ffacd0b85a97d-390d4f378d2mr2947842f8f.11.1740586086864;
        Wed, 26 Feb 2025 08:08:06 -0800 (PST)
Message-ID: <1dda12bb-f4ca-442b-972d-2e5b1edf82d7@suse.com>
Date: Wed, 26 Feb 2025 17:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] xen/cpufreq: abstract Energy Performance
 Preference value
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> Intel's hwp Energy Performance Preference value is compatible with
> CPPC's Energy Performance Preference value, so this commit abstracts
> the value and re-place it in common header file cpufreq.h, to be
> used not only for hwp in the future.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

If I'm not mistaken this is independent of earlier patches in the series
and could hence go in right away. Please confirm (or otherwise).

Jan

