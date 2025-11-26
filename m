Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B5C883D4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 07:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172234.1497328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO8pS-0001aL-At; Wed, 26 Nov 2025 06:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172234.1497328; Wed, 26 Nov 2025 06:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO8pS-0001XH-34; Wed, 26 Nov 2025 06:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1172234;
 Wed, 26 Nov 2025 06:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vO8pQ-0001XB-ES
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 06:16:36 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 742b806f-ca8f-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 07:16:33 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42bb288c1bfso3681853f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 22:16:32 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52?
 (p200300cab70c6a15dd939ad410e5cb52.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb8ff3sm40672067f8f.29.2025.11.25.22.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 22:16:31 -0800 (PST)
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
X-Inumbo-ID: 742b806f-ca8f-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764137792; x=1764742592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DjsKStsMT4roJBE4FNWBzAe5ZLozi4WM2e4li+uq12I=;
        b=dbyot/QCEziFvkWbmgGok4LaVygzldeAiDZVXM5KMhslkg+d7QQs6h/IX9jgMlN6FD
         0Tvq8I8r87Zn1jcmwYW7ubzT+RbqipEhb9+qc2vvqbcveNvrqmI8wTbSp/NZramnK4Wz
         JNKKLUtUbiSDHseyavJTZVjte6RUl3SDbA23AEgjcpLeBjRctR3w84bZLMjuRVwSL62n
         xIYXUFWrfyagXwX72KAOXAOOwE1AApp9Y8/wH5JRjdO7FJ5UhkURlEq7qi5ztYuLlYkW
         uhS5lYDrOl8utdwM/ttLQAPhBpZ+B7B+7tpfLi4m1Ka3jyYgcOajyGwm0y6NTrceXSiS
         beFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764137792; x=1764742592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjsKStsMT4roJBE4FNWBzAe5ZLozi4WM2e4li+uq12I=;
        b=O9qr8I8XiMGjMel7hDnZba+wgHzOPHP7YgybDK5IDLPtcq0qcRhKJkSn0y9fq7PJUa
         Uo0hGcg9wLtkomaiBRJtrH7zpHavKCHtBkmKg/89cKYue1e2NSRA3pDQRmOnUuQWBQMY
         nOqbYRYK+huYjNIk/t4Z6mf6AzkRaX+kFQNAsio8GRO1FLnT8PeDo8t6mVlRCr7BhSGU
         3wJCgtss1b3k0sxHKXGSUWWZCuUUjplGpkE1gJP/m9dIB00HWqksEL/F5pF+7LiDxu7k
         MjRSKAMUdOfxPs4KysKi+FBZggbtP/js60ODQjlqxYgX45F1pcEu8zyDT3BWZJhufA79
         ptmA==
X-Forwarded-Encrypted: i=1; AJvYcCWltAhlUjhaBWVUG6Q4t3pvr3yfOlOJKuf6Zl5i7I2tS3jTwavJV+eC6Weycn1qjPf7XlgeYYrZQkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ0r9Fa5jFvx2kJGzbC9/UxxDISMy8ExBKjfOkPka/GR+aZGzy
	PehIv8c5Jy0pOQJDp7ljX22p/iYFNvAz28RbT6k2BNDBg373Nqa2AKEVCQyOuCvVLw==
X-Gm-Gg: ASbGncu1UPJ6aI7vmx8MldBtIrdAJriDrGzBvOsy91tiMkom2JcuKvpn0fkyb8akvfq
	uLtT4eUav9Vo66xAEfyuoAgPU813OOQFY7U7GRYR6X1yaK20qd/T52NVheSQLXl+zuWCAFk1QQi
	ihhnBmyAO6BBzbS8vpaHTzEUc7UbwsZcqgnynlHhRNN57k6/XXGy3YQI56k8RCMS25XUozz+IxF
	0vo6/OSIRXIL04RmdqqSH7hce5XY0uZPETpsj3pXu1+egVvkdk1T6KOgePTS6JLtfiU31nLZ5sp
	xD/MA3SS0zFg7AdPgeD8m4O5EmRw0yl3J1ck4t3dGEEVGkr1q2wxfsroGGgCtV/ueCEunhqdUBU
	Xd7jnOvqoHcee5RLV4+NKCFDs+domvBkoB5VBTmRxgIAqfP7xwyjulv3ZoXOjGvx9sr/ADwHFuV
	WyAWuSB9pKOTuFJmWtzaqH77AA9QnUMieQVNcmsMJSWQlKnfJK+QD3AjsbYI9HSc+zwaBNUojl2
	MkJ+KESjuHkZR71q93/+FM6Xxir8F1caJ2g7gZ4mDsy8PgO
X-Google-Smtp-Source: AGHT+IGjbyQ1iqr8Y7UMB6REmYMbMiDwucqeY7133+PwmTmz8PT/t0nm5CzJwb5GeLS7qqbRf8quXA==
X-Received: by 2002:a05:6000:1a85:b0:42b:3e0a:64b8 with SMTP id ffacd0b85a97d-42e0f22c54amr5755743f8f.24.1764137792213;
        Tue, 25 Nov 2025 22:16:32 -0800 (PST)
Message-ID: <9a65aa59-a7e0-4a7d-beea-05aa04268ef2@suse.com>
Date: Wed, 26 Nov 2025 07:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: Andrew Cooper <andrew.cooper@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251124111942.1325635-1-kevin.lampis@citrix.com>
 <f4741251-0772-4a7a-86ec-951d08b22517@suse.com>
 <BY1PR03MB7996ECF620796C340E0B7537F3D1A@BY1PR03MB7996.namprd03.prod.outlook.com>
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
In-Reply-To: <BY1PR03MB7996ECF620796C340E0B7537F3D1A@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2025 21:12, Kevin Lampis wrote:
>> Bogus indentation would also want adjusting while touching the line
> 
> All this code is using hard tabs that's why it looks wrong. If I convert only
> this single statement `if` to spaces then I get a `misleading-indentation`
> error so I have to convert the `if` block after it to spaces too.
> I hope that's ok.

Well, the request was to switch to a tab and a few spaces, so similar items
on both lines align with one another. That's Linux'es style afaict, i.e.
what surrounding code there uses.

Jan

