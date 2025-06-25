Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ABBAE7C45
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 11:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024519.1400370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMI9-0007FJ-Mj; Wed, 25 Jun 2025 09:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024519.1400370; Wed, 25 Jun 2025 09:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMI9-0007DJ-K8; Wed, 25 Jun 2025 09:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1024519;
 Wed, 25 Jun 2025 09:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUMI8-0007DA-Ae
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 09:19:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 851ff450-51a5-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 11:19:39 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2958874f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 02:19:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c88532absm4208139b3a.131.2025.06.25.02.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 02:19:38 -0700 (PDT)
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
X-Inumbo-ID: 851ff450-51a5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750843179; x=1751447979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sYn1x5oEmuiSA6FLdznXxNVrpOZ/8QkMXxM3/RevbEw=;
        b=XbSAi/lIsoeSI6HKEBgsgWvcOTjfIMFPeA6TKBdFaMVUMJOCLyQaMhWxPM3FO39YfP
         oG+fmfHUoSFqN9JMjtkdd6pws1Ux82216HWhOg9tUlKUPixS9EO3JH+w2KqejVsAt/zn
         /t+YKZeAO5TtXWk0cbdqh6aLhDBitWK70x0nl3fVruqoiJKYrwvxkhO2T0OQ/jQUbDlx
         d/JcZuu/rA/f3OTl4TjZr0QRp9LHURwYa1JQ9AIdwR1l2fhS95C9lryWdlq+9nX+1YpC
         Blqy/tmnvMtHq+DkqtFItzNoKWyCQE20bDCDRV3UkS49exb+WPRXYA3O8Gn5PcKgH5dW
         rT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843179; x=1751447979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYn1x5oEmuiSA6FLdznXxNVrpOZ/8QkMXxM3/RevbEw=;
        b=REihmVh9rxh0qHLJZatvIiyDeZitlW9tf3yfRwm2P9mmXYeuoxug108hYQkME3uzrM
         s6n98nF1zzLNW501rVaeeapiWHEl3lGt8P5VXKxEjjp8Gvg/lmUUvq+eehxgKqkcqZI/
         Act39uZ0Mp1RjIBgqUx81inrFTF237IqQ2SnYJFK+c6rL4+wKfEE+4bpJKaYcNnnBHQO
         rAUEZ/tKcmh+N4fHS5D71FxFWZTLheOjWyak3Y01o+ijK9iZNDVpRTkPEpeSxrFobqBO
         f3Dt5wy/YpWMiDi4SDajAtMNcPsZamB7czwGnXdahsdkvYamrL4ycBaFotNUX3pmh0CY
         jF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfbFkXaGYMml/4Dx0o1b6XJMonbb6LYDP5xS6Zrs1auJZnGdkzPS7IN3WGFGS1CjeGxnzqu31mtsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydhFxMmqVa8J9NBtVbj901ddga97rITAUs8mXDB1kt92EGK+JP
	6fr1j4eZYaRg5m24fZJ+2z7fP62M5h55onishighz8ld0jWMlfIjK9ynBvFiuivNQg==
X-Gm-Gg: ASbGncsGM4AGxuiEgNIEzDsdCz2DFlYeWqzs7zIGy9MDntVedXJpF6TaFeiR1scDKHD
	MUwAJUkK/ts2zjO7+yuIA/l42g+Kcd71Wu0+xmVgsc07K+4oaYjx6Guk8ZuBPo+R5MXA/rHf3js
	Oi8t2J8Yc2VwDbjFAav4SY7ShIl0tFHMIs/17CvrokKd9jjoM/HipNPAyneQCq6KN63IKGnaneQ
	3FlVVuNRj4Z/Y3VDbDh1xM17prMBx9ca1EXr8CPlB4agW2uE2gMlVw66pxYPgaGq0OADa0flau2
	zX96n8SRJ1cXYOZlWFxE3/UJgjdjcNWtdoFwgk0Yy1o9TV3B3y1ZhDt7GZH+xdvoYz64c7n9JA2
	B2wIxxQBGbCSWUNQhy7MzjkWqvKPW4E3WxqJVNJdvF1vmIMY=
X-Google-Smtp-Source: AGHT+IG3qua4F0WkdiAGSQC5O7N4zIJl/M9LXQYs2Aw523TbATL/DsYvFbKrDk0v+gK3e+HCDuFs0A==
X-Received: by 2002:a05:6000:18ad:b0:3a3:6b07:20a1 with SMTP id ffacd0b85a97d-3a6ed652850mr1717756f8f.40.1750843178838;
        Wed, 25 Jun 2025 02:19:38 -0700 (PDT)
Message-ID: <ae257f63-c8a6-4f02-a19c-5b3f3a63b620@suse.com>
Date: Wed, 25 Jun 2025 11:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/idle: Move monitor()/mwait() wrappers into
 cpu-idle.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250624163951.301743-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 18:39, Andrew Cooper wrote:
> They're not used by any other translation unit, so shouldn't live in
> asm/processor.h, which is included almost everywhere.
> 
> Our new toolchain baseline knows the MONITOR/MWAIT instructions, so use them
> directly rather than using raw hex.
> 
> Change the hint/extention parameters from long to int.  They're specified to
> remain 32bit operands even 64-bit mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

We may need to undo this though if we ever meant to use mwait elsewhere, like
for spinlocks. Many years ago that idea was entertained some, but it may well
be that it was given up altogether by now.

Jan

