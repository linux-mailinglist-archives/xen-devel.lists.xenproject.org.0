Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B12293B450
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764397.1174830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeIg-0002J9-En; Wed, 24 Jul 2024 15:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764397.1174830; Wed, 24 Jul 2024 15:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeIg-0002H5-BI; Wed, 24 Jul 2024 15:53:10 +0000
Received: by outflank-mailman (input) for mailman id 764397;
 Wed, 24 Jul 2024 15:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWeIf-0002Gz-Po
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:53:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1cd845f-49d4-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:53:07 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7a9185e1c0so168866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:53:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7ab757bbf4sm57989566b.40.2024.07.24.08.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 08:53:06 -0700 (PDT)
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
X-Inumbo-ID: d1cd845f-49d4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721836387; x=1722441187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CBfzmgzpnPfZuQTH7G4ZGzMYX9lIkGizPnCKJTfbn+8=;
        b=WEXZTIfCKSIF99SGgiExIAWDMJWQbdZyYXzIZivyu15TvlUQzcuWGXMgZEbx8O3fY4
         Gj7JNFayfpGC757ocqrnDNSjBc9gmjuQOgGsCNyGi37VB1sn7i969jotfEHbMvRC1fdp
         eUzA0cT+fxt5QIGDIhFEMqpRv9WiDGNkHPV+pNo3K1VFTFTD0riJOOc4shpgDStiSWg8
         CC5JgLtJo+yg8uZOHCbvdniiwX0d5DWRIDYPz5tE98XsOGAQOw8EtckQN8DJwRnAHKle
         X9HQh5aBtuKN8nqC5ZLRC+BpqUqYNMX/8qfJxqcXcHCh9Yt1DavewGrpV9ucpfGk83M5
         /6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721836387; x=1722441187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBfzmgzpnPfZuQTH7G4ZGzMYX9lIkGizPnCKJTfbn+8=;
        b=TCgQPuvTMnGb+GZmMLUgqfys9CQYpZb5dMaI/tUK+iv5S7vDh5568tH6UWfoqOGrlU
         hDiu0w9LGNA6W5y8qJd3NllA//PhdsDmmElzYmBO3T/ziZrGHJMlzlXo61NZfbAgHwyh
         AO1FJlySbjGhOOZZysG3s+TE+cvwsGbqQGe78e2Baf6QvG7YQHMLpb9n/ofp8Da7IpAl
         Z8OKds4LLJ6U/iF9Lk1b7BUZxXc18QLhn8d0UcNBTZL9lE55Gy9E0jm83tOEqYLrKOsv
         vBf4aZJny0TVrIQcfKmOa1RISzjaG5f+slMi+1q5D1iAmWLwfLXoqznzJHQkk8HqI47W
         WJfA==
X-Forwarded-Encrypted: i=1; AJvYcCUa5EldksZR5e51Mt1u2AI8MxjJyqOCPzUiUXBmjYTGbyBWPfSyRum/IjFHyhC9GWctplX/wV0+eaZydLPfwwi9p/65NNlbc0aJ5K9D/NM=
X-Gm-Message-State: AOJu0Yx2iKeZ5Zv5DTJU/B3MrKE6PsYATpnxEoTZrPeTHklA4x6rEtZF
	cco7kD2m4zjEQs2mK+P164koHU+aA6v4YQOOQ2rxfr4UoQUDhq2w1g3JvdgeZw==
X-Google-Smtp-Source: AGHT+IESuc1HnGQfC2wevBP2iYTiR6dLcnM5L3p3eKEwU1dV6s0qzP1ET4vdp8AAlIY2xb8/wjyFIw==
X-Received: by 2002:a17:907:7e81:b0:a7a:a46e:dc3f with SMTP id a640c23a62f3a-a7ab0f9ccffmr213146866b.45.1721836386944;
        Wed, 24 Jul 2024 08:53:06 -0700 (PDT)
Message-ID: <10dc5d41-e1da-4222-9334-7de76363adc7@suse.com>
Date: Wed, 24 Jul 2024 17:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 05/17] xen/x86: address violations of MISRA C:2012
 Directive 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <4395577d2a07f6edaebbef937cb96028bb92de31.1721720583.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <4395577d2a07f6edaebbef937cb96028bb92de31.1721720583.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 10:14, Alessandro Zucchelli wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Add or move inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere).
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Provided the description of the scheme itself goes in first:
Acked-by: Jan Beulich <jbeulich@suse.com>


