Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F161B2A2F3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 15:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086071.1444304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzXU-0000BA-Dw; Mon, 18 Aug 2025 13:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086071.1444304; Mon, 18 Aug 2025 13:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzXU-00007h-AL; Mon, 18 Aug 2025 13:04:40 +0000
Received: by outflank-mailman (input) for mailman id 1086071;
 Mon, 18 Aug 2025 13:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unzXT-00007Z-Ad
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 13:04:39 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e554e1d0-7c33-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 15:04:38 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb7acfde3so555547366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 06:04:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccd5asm803637366b.78.2025.08.18.06.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 06:04:37 -0700 (PDT)
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
X-Inumbo-ID: e554e1d0-7c33-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755522278; x=1756127078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p3u7gZ4ixzFXFm2hX6hi+G9kvmUsrPnys/fYx1AmvDk=;
        b=SbdTPzI8cIAPGGebT303jzwlmcXfMX/1NtefbCevF248j2uqBMs42AX8Y36diWEgdX
         hgNwplz+2gC42pbTEBP54RqS6T7/PkajX1ilkM+Y5EuS7UsEhzL1vOxGqjaghXeTYjtj
         NH6jK8eZS1KeYp4MXN3TasV3z7I1n2+zyumsnORn73tRp6WjY0sIxvKw1qEdIx8aK5jw
         8ajM9B+QVojMqwrR5ubZCYsN5oEKhvXQZot4lxQrxohfRPkHeALXMrM8gp8S1z+exy7r
         2ZC1H2geZz9Qsq68m6FkJfDsBoChVua0ulXYDwFVEyR4ejBnhkEbkqiTZtO8gtDnx/op
         9Alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755522278; x=1756127078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3u7gZ4ixzFXFm2hX6hi+G9kvmUsrPnys/fYx1AmvDk=;
        b=FYO6metylWcp4CKuXWTY3bKcUjqCgv7Mv9yEbQVhZ1yRjYStxnY/DvOis+3rTsYLQR
         x6sDHauFnA3/o5/7RONWND7Pvl5y73+jSqyIJT0KSJQimDImy+EDOdaXcpQnlVxRgiH5
         SEhM8F6k6hX1Xn2Ld1MkohRxes3WZ9KZC/mjCjHMdoEdN/8svJ23ehTa3iAr3dorDrPJ
         rAXg41JAFyGqN/TlZBJYqHMTByFTDMvZAvgRuAgGi3GZOwpGIWS08p9I8pqKZ3nCXT0y
         +ciVCSA4GXVmuGSn5L3yvMnzW01VYKAqMmqP53JAzIsBBrww6E3Cti4906MSsuuxmms2
         MrUw==
X-Forwarded-Encrypted: i=1; AJvYcCUZSPct7sbWhr6p6ODWkLuXNdLcb1S84KWzYEw01T7phLo+7jHRNQVAZXk+JXaPBygYIF9lApaAMro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ9jmGS46hO8gKx4LvpwfALVXhnBhWcp2CJuIgL87KcubdPTwN
	e+uLhrosDmikutYJiJiny70Xe8etj2RrXxgwnd37lHgJg8GjwRJIQdFYSNFpTG+yBQ==
X-Gm-Gg: ASbGncvUI2TEP1fYl1UjRXWlCyereO8MQj3xpdp2ps6vyRnHEjt4KE2yHC9QeWtfK2n
	4karKY2y9HTUzV/vx1CxEM/WxAfK5qQx8pip/3s6pm3ZbpxkdppWeRgWt67ShCLukb8Xv+Dc5eq
	vJYG5pyYGdjqD2nnSysKCtcJWOJFbOjPyb4qBHn5V1X+iIGjxncF9uT19XxeQ8V4n60zXD7zL16
	sAzt65nxSpVAmKeiuROZ6ghH9+keZMgpdycBJawGLNDHFKGNdsco1qh8LnYWkP/tPKFdMDqrBIA
	TDqt+DewlnV/nrkEGbXfluLMeNf3lp4VewBX0Wv3j20eMRl7mAt5bDaMGUExUQ8YMATgdhMunR2
	YLl8qtg9KMBiL59U9ulBYqtw9fWdmMkn7J8HWnxWlI0760edQIZzCr1+aS5YbIhlf1vNS19kYIg
	qGiHVgqdzbm6koya+nDA==
X-Google-Smtp-Source: AGHT+IHhAWmx9OacSk+JHwMasrbyCghP9HLyaQAJtZtAHHH35d/0eJbBj5kv2l2LeTDIjmF447/h3g==
X-Received: by 2002:a17:907:1c09:b0:ad8:914b:7d0b with SMTP id a640c23a62f3a-afcdc206127mr1095686966b.11.1755522277498;
        Mon, 18 Aug 2025 06:04:37 -0700 (PDT)
Message-ID: <db36a7b0-c92d-4512-bfa8-b4a7f5c165e9@suse.com>
Date: Mon, 18 Aug 2025 15:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] x86/msr: Split out fsgsbase.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> It is a large and complex API, but only a handful of translation units need
> access.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


