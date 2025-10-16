Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D0BE2C12
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 12:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144405.1477805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9L9f-0003SF-1i; Thu, 16 Oct 2025 10:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144405.1477805; Thu, 16 Oct 2025 10:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9L9e-0003QP-UY; Thu, 16 Oct 2025 10:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1144405;
 Thu, 16 Oct 2025 10:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9L9d-0003QJ-3D
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 10:24:17 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44532c3d-aa7a-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 12:24:15 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso578832f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 03:24:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e8141sm33354628f8f.48.2025.10.16.03.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 03:24:13 -0700 (PDT)
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
X-Inumbo-ID: 44532c3d-aa7a-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760610255; x=1761215055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PkczD42sw5ccZ5Uf35de0yITdXO5NIlXXmDbwWbWZX4=;
        b=WW8RlvPRTdOzBmmPYeznTw8DbZYahYgIO3Nr/HxMmsUr3CDezU4vF82036INrj2BML
         vMTC7iVHE0LWrhnsXdq8iazPDOjY3y7rHmmsspS5Eirqo5ZavuZFlSahcFiyhAQQ8Csh
         4rQWOcmDX7IlfQDo5NSly7ga1gxvwcnycj3PBkbgA6eSLyff+GIszLgsjvRt3AFezMgs
         lVTK7xMSlP+CtuwXoBo2mBZaaZDVV20//z2ZvHob41PTtjqheMxaT90AKZlHP1TCjgmf
         M9lERc7HgvreYe2VhnS1jIvgl50fY1MC57tJONziDRY3xLNN4PuRMIDqWxhddCPyAm5s
         DZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610255; x=1761215055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkczD42sw5ccZ5Uf35de0yITdXO5NIlXXmDbwWbWZX4=;
        b=Bek6iLj1xvAFBYeAgDr/40/o2yaMLn3Zn4m5/IVfBFKDk2l7tPSq533hDAtLZU8nOI
         wbL+yBT5Mk/9zspb0qte6O1UrPu27cDx90/iX3+6mni52i4l+iVM2CXIsoHc57rfVfU9
         eRfMnVkWQAEqgRLtjWWgSPWgn1aYpvCL2o29MGPYWPZ/0RUhyOIIUxpK4lTw68sot3Z1
         JsQbqiGvU73YGPoUzHArJiDkilqKxBBFhic+4ilfQ3c1gxKyFZrIGHeeYOAPqM6y6JlN
         l87y7Vf4qRHCHfNRRxWfgqWUb/8csKJBaVnBsW9Vy8FjlmRZKBqzNW6/Fq2xTBqivFBf
         v0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv49+g64v8SpuUrCTvlrowtyobuTZMXt0KOvlDCE8AkYN770lQKJ2f3woYBF/F2/LFzSQR5xDFjfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxneY3L5BRP0ewPAzbFq4TtV+diP5uHc5yf4kSRXjEG6ECVKCZy
	SVofD1sxm4IlBMIHZhgZOMWcrFSGeY3LYGRsCGy9LceEsfvbr0OP0vjv4FM3yK2/Bg==
X-Gm-Gg: ASbGncvAOJ7DdUJW5TXjUzlIB3fF3sq5nQNcYPpNQ9tkG9BX3ILebEzrBSFJ8QDtGOa
	gU4hXt0LVVDvAw2BiaRohch052gFaglOygKvDe2PDqywZ3EswPZHLLoQaKWkpnrUdQyYCedO4Rw
	Yo9dul7R49Hv6g1i0VHcQeQKNj5nLtR+1tepyVSJqxMO78WC8tQtKqSzjGWe0KIm/+ddpa8xbs3
	xRiiRE+xHc+w1YNemdwpmcEiJdPPNIsz7oLNNPOBBhh0+xmlT36866npfdMk99mui8fDkOXg3xI
	mA32YzeIlrfPpZt6vHAf4+cBnwU4VhLzGxVyvQwssBszIvThJSg4ItPk7Aa3YRD/O8xPJNspN0F
	f//iqrIiXOv8xYdngcc/GaIlGA+tLGSfpIK/lZslTmwkrcKTzfbWTxKId0MRF2j+ImhT+yv4YXK
	JNfi7bsQgTClT7ILVLVcGDqpDGx6h51Hq3fr0LxFwJ8vi7/3q7JAoQPqc95EXw
X-Google-Smtp-Source: AGHT+IHFCpwnYMCPo93ZGqNuIBF38l+Gq7/nfSm//2b7sY2eurG/R8Xqj7ODe8iWdyUx62ni8hk61Q==
X-Received: by 2002:adf:e18a:0:b0:426:d54e:81a4 with SMTP id ffacd0b85a97d-426d54e81b9mr14696935f8f.56.1760610255287;
        Thu, 16 Oct 2025 03:24:15 -0700 (PDT)
Message-ID: <00e7aac3-0012-4748-b680-f95009b63e93@suse.com>
Date: Thu, 16 Oct 2025 12:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 4/8] libxl: libxl__object_to_json() to json-c
To: Anthony PERARD <anthony@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250929120756.46075-1-anthony@xenproject.org>
 <20250929120756.46075-5-anthony@xenproject.org>
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
In-Reply-To: <20250929120756.46075-5-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.09.2025 14:07, Anthony PERARD wrote:
> @@ -352,6 +376,86 @@ def get_default_expr(f, nparent, fexpr):
>  
>      return "%s" % fexpr
>  
> +# For json-c gen_json functions
> +def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
> +    s = ""
> +    if parent is None:
> +        s += "json_object *jso;\n"
> +        s += "int rc;\n"
> +        sub_scope_object = "jso_sub_1"
> +    else:
> +        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))

removeprefix() was added only in 3.9. I'm now trying to figure out what to replace
its use with to be compatible with older versions.

Jan

