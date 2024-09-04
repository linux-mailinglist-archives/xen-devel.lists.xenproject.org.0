Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D388C96B893
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790075.1199767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnIE-000851-Tt; Wed, 04 Sep 2024 10:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790075.1199767; Wed, 04 Sep 2024 10:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnIE-00083J-R6; Wed, 04 Sep 2024 10:31:18 +0000
Received: by outflank-mailman (input) for mailman id 790075;
 Wed, 04 Sep 2024 10:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slnIC-00083D-U7
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:31:16 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d00a64ca-6aa8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:31:15 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a16c53d3cso316144166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:31:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891968e9sm785840766b.120.2024.09.04.03.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:31:14 -0700 (PDT)
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
X-Inumbo-ID: d00a64ca-6aa8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725445874; x=1726050674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+ey4vvsXkb4BGizOHIk8N0Q0Pl1AkMOTKH1Tb5LXSw0=;
        b=N/Mgc1dJw8DZMrHdY16dGF7EcEteFG9G9P1TI1l862d3ncwi8dnjqEkmrzANFyIRdr
         yeeE4W6RrfbfohB9FtAtKf/wi4arNey5fV9cUID6mfH/Fe3/LvkG5OyJX6aLo7UawUlI
         Udl0w1NZo6Ost+bv9MK8WPblHYFQCcEBGiq5U8APxNOVaeSfokDvZ+/sUtI6Okn6onS8
         DfrNEn3jBreXyaHe1ILohmpMCWo2+JH18/nqTlHJnGpNJnRNjmrnWT7qfJRoPbm1P+Sx
         BAgyNjj98wLWh5d7RQbJcWExjDJcDd9oI65oDyFk95XXh0zvGpJOF9VhaisGpewz7thh
         rRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445874; x=1726050674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ey4vvsXkb4BGizOHIk8N0Q0Pl1AkMOTKH1Tb5LXSw0=;
        b=u4bwHsUMa5Yt2P4lKgBu6XSZdSO+V6DI4p1MwV8KtlAENFuta2iv0g5tLqVmmm93S5
         OM2lpKDw7n5sRSLOJqU8rLF5CPvr5IsQiQLeHIu9VcWEWS7KO/JHRSOT7LJEP5c1QIxI
         JCVzp8F8yZKlVRdVKILW2aHVACm0eW2rsymQVWBXpBuYI2yTWxRIb2Noxc4E99ZKS033
         xwXy5GbUa++6ifBlivsE+PtGlEwl5UIR/W3tJTukm4Bp07wQUqyr2d9lc2u+uqSEPLW2
         6H8fqnwp0zGl+4lPp6Ho7+4fxVztqnyQ8bPWDoI5eEbOAELgcoXUR/72ZGpC7NK+TkXu
         IUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQD69wEDBN1EMQ1pOfeygDg44hes/tSyFluscWssz7LFfCDQuGSJtuYaK4gfRAfS/iU0CgD/FqaqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXyXJsAwhu7QFbaYcuHu4j/+eZJW9/i/JN3gTKJWxBx0f+zeOW
	zRkQaG3cG6lqIamgWDAoxAQntkyQEQ/eyjFDHlEBNfKBBWDGRVuk0Yuf+eyEMA==
X-Google-Smtp-Source: AGHT+IEY4H06amUU/I+tIwgC/n275EZcEE51ZLg7F8mR2Hy6tfAVLQsEGCbW9ANC89eG0vWkKFZXAw==
X-Received: by 2002:a17:907:7295:b0:a86:9d3d:edef with SMTP id a640c23a62f3a-a897f77fa48mr1625800166b.12.1725445874289;
        Wed, 04 Sep 2024 03:31:14 -0700 (PDT)
Message-ID: <6ee1f2b0-80a9-4dee-b048-870ea450b431@suse.com>
Date: Wed, 4 Sep 2024 12:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/tboot: add Intel dependency
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240903074134.305012-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240903074134.305012-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 09:41, Sergiy Kibrik wrote:
> Make the Intel-specific Trusted Boot implementation dependant on general Intel CPU support.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



