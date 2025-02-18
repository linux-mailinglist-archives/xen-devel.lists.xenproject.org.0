Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F1A39AF2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891324.1300381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLoy-0005mC-TB; Tue, 18 Feb 2025 11:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891324.1300381; Tue, 18 Feb 2025 11:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLoy-0005jn-Q2; Tue, 18 Feb 2025 11:31:24 +0000
Received: by outflank-mailman (input) for mailman id 891324;
 Tue, 18 Feb 2025 11:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkLox-0005jf-T5
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:31:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1530bde-edeb-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 12:31:22 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so991061166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:31:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba316dc67sm285280866b.43.2025.02.18.03.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 03:31:22 -0800 (PST)
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
X-Inumbo-ID: e1530bde-edeb-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739878282; x=1740483082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oJEsTqwwOu3aDmVZIl7A4YkjeDO/44/UpQ8yujrK0Ao=;
        b=QM+7Kt4e0ifae43gnStNTsfHkLJV0VDJLPhePZE8xVl0x77X1c9u296nA9kkgovBsz
         +k0+WiNiKfRqkyxsqs1U1FNlGLQZZmj7ERuAM7GUxFSbnGgYdIQNJaEzgIBwtzo8bwj1
         pK1U9PK6G+qeGUQx+9l3Ugp1e9Yrd6RnoesZASAaegiHRjGrOMmSOh5Ck7g89M/wLUOK
         nsyI2iU+zOU8/oDl6BcejVaMSV5kUIIkfGmbdStNuQZqoUiRYbRkTt1cQPhkRYBoh67u
         z2A6vL8srpGKSBJbyNTsDBVpnkU82wBaVR3fm/YThmYFt3N31DE4pwQZg2muSdHgEJq5
         9W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878282; x=1740483082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJEsTqwwOu3aDmVZIl7A4YkjeDO/44/UpQ8yujrK0Ao=;
        b=Q/lfi1bxLSC4//qEkFc+xY2vIDSzlk9Lp6mxfD7Aemo05Q38fP7U6TGswPBQtj8TEd
         +TaTquUSfyT56HLtN03IQbfJYsePTZ95cGYzzGoq0bTqWW4bQwjHyvUYldCEQ0a5Q+P7
         y5lV1+iqgWj9vsubbun0iO0QGE3e+7CHGpflyhM3N2yBEOlDQTEeUx9TQKpa/8KUfQEh
         2yHFZdiPwpXj7Xs0l/6L/nNKi1pqz/KqJmgMaRtZ8EI0st7U18nmA8wBnZa0l0CIBfe7
         JM6kVf4wgaFN0y+brET+NT6Pa22Y6nKUNvbANOhwsj+QylEarvYihgsf6du+rNuAE22W
         R9wA==
X-Forwarded-Encrypted: i=1; AJvYcCXnVXeBL3811Geqos4vT71YzqOaqm4eJ+BTKc3E4SCd6Qhm4mDgXZe/ptifN1C8LNXCbfbfYJxEwJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxni8DeMjFsKvXcOW0LFpCpNl4NK9sGRzXB3SHRbcPuv/1egege
	wfMk0Ga7ZubMa2OIoDmdsFfzyJFQi3OaiDpiGYcOmHVN0c4e7ufn/ewqQc57eQ==
X-Gm-Gg: ASbGnctssCapYZhRjjerAYdjjbu7TqW0kRBo2T4jt6IbmgJ7gBbGtTjBiZadmIDVZJW
	Sv7jbmwPMa1xf7Eoco/3+nAkf6FPkqt0KYPnniMuzWXjNgjovSHTCl34iHdwXrSJ0UrhX8gve5t
	uqvZIQhB8BgS0y1TiCAScNIsteEjXnycoMD38rMfMin/nRT4WGXxqsa0St13hU6ypVzlxuD2GlE
	z/XHqiYauqnxetLV3MlgjACMLxqqsRIP/lp0TM0sph/UPbZ20dhJPSJulh+Dc0V6ldC2P0KcGkT
	8djwz0fyTrV8KHVgNkjvyblHTr5gPmOHiDlx/xv+sYVp327Wn+h04sMLtdEYhQMYWMcaw8JJN3w
	q
X-Google-Smtp-Source: AGHT+IG9+1tkPDIwzjNBhR5C1SDVLS1fFFMhkFtKQTs/lN56NSKGulfehTSz9ik3lJNshpytQQCRAA==
X-Received: by 2002:a17:907:2da0:b0:ab7:d1d0:1a84 with SMTP id a640c23a62f3a-abb706ff7bemr1229589766b.4.1739878282280;
        Tue, 18 Feb 2025 03:31:22 -0800 (PST)
Message-ID: <c24f9d41-1cf4-4cfc-ba11-6ad1d1223e9f@suse.com>
Date: Tue, 18 Feb 2025 12:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen/x86: resolve the last 3 MISRA R16.6 violations
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop>
 <daaf4284-102c-4fc4-819c-2231705ab572@suse.com>
 <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 00:12, Stefano Stabellini wrote:
> On Mon, 17 Feb 2025, Jan Beulich wrote:
>> On 15.02.2025 03:16, Stefano Stabellini wrote:
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
>>>  {
>>>      ASSERT(v == current || !vcpu_runnable(v));
>>>  
>>> -    switch ( reg )
>>> -    {
>>> -    default:
>>> -        return alternative_call(hvm_funcs.get_reg, v, reg);
>>> -    }
>>> +    return alternative_call(hvm_funcs.get_reg, v, reg);
>>>  }
>>>  
>>>  void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>>>  {
>>>      ASSERT(v == current || !vcpu_runnable(v));
>>>  
>>> -    switch ( reg )
>>> -    {
>>> -    default:
>>> -        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>>> -    }
>>> +    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>>>  }
>>
>> Both of these were, iirc, deliberately written using switch(), to ease
>> possible future changes.
> 
> To be honest, I do not see any value in the way they are currently
> written. However, if you prefer, I can add a deviation for this, with
> one SAF comment for each of these two. The reason for the deviation
> would be "deliberate to ease possible future change". Please let me know
> how you would like to proceed.

Well, best next thing you can do is seek input from the person who has
written that code, i.e. Andrew.

Jan

