Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA6C8F27D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:11:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174035.1499015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdeT-0004uJ-9e; Thu, 27 Nov 2025 15:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174035.1499015; Thu, 27 Nov 2025 15:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdeT-0004sM-6B; Thu, 27 Nov 2025 15:11:21 +0000
Received: by outflank-mailman (input) for mailman id 1174035;
 Thu, 27 Nov 2025 15:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOdeR-0004sG-N6
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:11:19 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52b6a5db-cba3-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 16:11:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so4390175e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 07:11:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1cab9af3sm3997047f8f.41.2025.11.27.07.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 07:11:16 -0800 (PST)
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
X-Inumbo-ID: 52b6a5db-cba3-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764256277; x=1764861077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K12JQHRDQ3wcMbR70nQkJaKHPBUaiQDgZtmyyFVFHkc=;
        b=hD/QEpvqNZmzX8OuUeNprCHS1RmOh8BwpTLNr0BuX2nKgdi2HSmdlHExqhxDl2iTpp
         fsEhiLYqOXPLL3RHAY98ZxitvXyWN+eugX3zs6V9wAKyCO8wDaPUVSJ5LTJWfVW9jNPU
         izudC29mD5A1tgm6HnBmO9j1UUHpYhSz1udYXbj+p87KilQKW3orQl/RO3Hg/M6AJSr4
         pRQNad3ts8VCKmkA95AszVJt0hVFD0oh84mFIFTDmacLuL3LOgb8KIPwpStJCOCHZeof
         A898A3xvdKWC+/KRwTSTMvx+ayprC7evLdBZ26AlQv+YkNxaR+9mgl988R4ot/vxgDpQ
         s/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256277; x=1764861077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K12JQHRDQ3wcMbR70nQkJaKHPBUaiQDgZtmyyFVFHkc=;
        b=SncV/YJNH4webcQweLgfR8MOd6P+lCn6TmGBnW3kTmABX4a4yrqrXeDsJq8v2PMoKG
         /zptiPqBoMt3ekGGf7JxwiE6R03YOqupaQiqM6OqKGukgBn8vc/3d3Aqtv8RHnwxd2JJ
         ZSc2WS4IibkUEsx7DP12ukFm8kG0wQjKsD1DV8bOSFkh8ZRGFSZRKqZkp+KKsdO920rt
         zfnKW5jQfAV0W1yNn55zM71PT5o1mAFy7Tmf5Jgk5XeDsf8nEg3BtXEbGVvrP1XgV00e
         /ZskJNUEnKJ0Wgt3AXrl0a9G9WnDJ6HOeyA9RfnHMZqXZWxox4XVraPl3fxM76sQMihM
         COrQ==
X-Gm-Message-State: AOJu0YydaV6YevR3cfmx9J5cWx2C5C3HToBNhP7ej3pVx9da1taoLaw0
	vxcXfwPmTpVMrLw7fX7EXZQOApmgidI0vkN1lL39JNqkWFxlsvySvXfDVUDYQa7aEQ==
X-Gm-Gg: ASbGncv5xsHdF/qDj9gzxW3G47WimB23fjSpmEZfIn4d6ObdBrXcmtUZATID2EuZTfM
	fhZzx4fmZ8IBsRRKxsnhoChBQx64xLGi18WrbvvOxlreLY8Vtyz8tE6GgW0JJQJ/+0HflKr7LBN
	UWxEbFM83yNIzlj79qcb6aJfGkVF4WKzRb95k0Dd+IrRymo6a1s+nQggA7v+ZgBQruSPqEgR3Cp
	zXtW7cght3XA4QfnsntL/FEZwcec9pPMgKqvVZiKafgc9XZc8E48QLxGKILUeOVLrl6th3vrct/
	8nfh3vH1LxB5Y1eJUHFDfHAZv0hvS2u6ueZP++Bk9Qrm06h/MHgosxEKITO0CkIlDdgdaP4waYb
	qRHAyl9lu861C2h9btz4fxRgULbjbYNdKlYKqDm5Qlx4YiUjrxxpkka+2URlUc7xMUaorZnaLQY
	LYXqmSBCxn3Td7iuDtKJtB2ICtmPo98UQqGNN89Vvtvn0GgyS9UbytJQI6YKgF5KOm3VR0wgGqC
	vY=
X-Google-Smtp-Source: AGHT+IHZgOi7AqH7V1P7Mw4R84RBdiwF9H7cE/K71bfAXwfuJHvBYSRi4785hKszLhnkD2vISP8N5w==
X-Received: by 2002:a05:600c:1914:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-477c112587fmr197059345e9.25.1764256277152;
        Thu, 27 Nov 2025 07:11:17 -0800 (PST)
Message-ID: <d9ad2643-63b8-4d70-8231-b873a77a3859@suse.com>
Date: Thu, 27 Nov 2025 16:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl/json: don't expose internal functions
To: Anthony PERARD <anthony@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <1533aaa3-5065-4214-a920-191a8b174314@suse.com>
 <aShf3WFVns0StoGe@l14>
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
In-Reply-To: <aShf3WFVns0StoGe@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 15:27, Anthony PERARD wrote:
> On Tue, Nov 25, 2025 at 10:11:21AM +0100, Jan Beulich wrote:
>> Ideally internal function declarations wouldn't live in a non-private
>> header. If already they need to, they should be hidden as much as
>> possible. That is (a) their declarations shouldn't be exposed and (b) the
>> symbols shouldn't appear in the shared library's dynamic symbol table.
>> Gate the declarations upon _hidden actually being defined (rather than
>> providing an empty fallback), and apply _hidden also to the libyail
>> variants.
> 
> The YAJL functions needs to stay in the API, they've been exposed on
> purpose in this header... The only user of those I know is `xl`. They
> are limited since your application also needs to use libyajl. I think
> I've butchered this header enough to make it complicated to use for
> applications that are not `xl`.

But xl doesn't use any of them, ...

> libxl_json.h is only part of the header, there's a second part that is
> automatically generated, _libxl_types_json.h.

... it only uses something from that generated header (which isn't being
altered here).

Jan

