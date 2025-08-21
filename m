Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C0BB2EF22
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 09:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087842.1445643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozTM-0005Ki-Tp; Thu, 21 Aug 2025 07:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087842.1445643; Thu, 21 Aug 2025 07:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozTM-0005IR-Qy; Thu, 21 Aug 2025 07:12:32 +0000
Received: by outflank-mailman (input) for mailman id 1087842;
 Thu, 21 Aug 2025 07:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uozTL-0005IJ-GB
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 07:12:31 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32f0c60f-7e5e-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 09:12:29 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad4f0so1041374a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 00:12:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf9be51fdsm220931166b.43.2025.08.21.00.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 00:12:28 -0700 (PDT)
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
X-Inumbo-ID: 32f0c60f-7e5e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755760349; x=1756365149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UkFXBSrPc5deef/aRZ8okRkeMDIVqRrubNrQj0sW7VQ=;
        b=QMKB25Y7nRb2p1DlHgl5choCKEulLYOhCHPlduc3lsF1r1abusPTt/rNc3LEbjOebO
         XxDu9mFh0HMMaoZHdO8JtbIUIKVSPxgMlrwyFwu7R7RuHz8INkKSJLvSYQZQVl/vckzW
         zr18s1f8LItNN3/33aRnotzNf+OaqtRBquccjeWeDj/c5yodl8w6ax8KC0z68cX77rVW
         KQT0aFD6sNUeRjNXm/DeH7SWtL/3HPER/aeA9wq4qtvFGbk3eiJoHRYk/Dn10Al1du/K
         UifHyQAl7maUjNWH8oZsVNw2nU89ohO1GsDj3gRYJqbDd4EqigiSrm6nmJSTLJ/t5tH/
         Iaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760349; x=1756365149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkFXBSrPc5deef/aRZ8okRkeMDIVqRrubNrQj0sW7VQ=;
        b=PsxXKpqDVt92pJfNUVmjNN9xiHNOD6oEbx0RxZfTC9DZwd+aN/am3hZLGfQQfEG3NE
         RNQR2YKRrWg1b4H8L1Z4hKBv97Etrd2X/GjaSSz5gfyH9oQOcxRf4Z8PqsG68NYKUR7n
         fHT9fD+f6f5xv53fTRDINcTpBZWthYNxS+1y1Dc/EU/PlGGciqARZTleJ/kmKwVtwhJ/
         lPP0q/mhAiKnHtRHig2hEt6klnqwh+3zQRjGibJYVthdkY+1YoESyPnhdmkENgIfrdtB
         kyrpOMX8MwMYXN0i/Am6lmypPDbsZmwjDM+tGgbqxVrPdHB9V1VMfNuldm1wO0MFyuct
         3Dpw==
X-Forwarded-Encrypted: i=1; AJvYcCWIjqwRjwTmhyf/2NK52+sfB8+dk5T6l7xn83fJfG/CCqW5UdPKyXq28Gg8G7FkOZEJJo5gb6NUYWM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOgfeHoAsD3u34OvMqokodoJlvOHd1lxsQK+EF/4ZvIS87YaDU
	PRFrni/KTS5K9/qdfPgXs4cADMgnjRgNbJz3MFfVwAhXN2nlTIi5bJoVK7/rHtfMHA==
X-Gm-Gg: ASbGncsb6TxjjfTjOUAj+WAI46h72dFjWJzSh3PTelWw1CIsndEFawAhEWiaMyzra8f
	LfgG3EKXgmAPKHAzPTbF/qiSFFVGRTd0FIU39wHfUIvWazzzPlg6q6Pr/PSnor1kvGHeICdWw81
	84ASgnMjiM+NAaVksQCSf+YGRF3CCHwQS5BhUq/RBi5TbjSIJoTWLK7d9fWbY0eOXLkrOaST+Gu
	qRpjDde2Q9atLs+gt1OXcguhUoP/590rsQfS2p34TRV0YGq6K0k+vOGZfjPUKqu5oaAPo2NjnPW
	dmd77gsJhFS73Jy6kWLLovSMKGv9tbmFb4Bwb4BHgGbiepITEuu2BjweSlVinN6nQKI91Qyslta
	aq/E9V6ubcUx50vhmlXY1dpLlP0agNM+BP6mMNEDiaQhv5L59jc7G7Rpcfy3QZG7cYCR/sAadih
	8JmRDsTLQ=
X-Google-Smtp-Source: AGHT+IGeVGUbt/u18CcoUbQ7mjGGzatj9TDLjcOpuTs5B8cZJt4aDYeuIFyd2jD15WXvET0g2wTV1g==
X-Received: by 2002:a17:907:70c:b0:ad5:1c28:3c4b with SMTP id a640c23a62f3a-afe07e1d5b0mr133292466b.52.1755760349066;
        Thu, 21 Aug 2025 00:12:29 -0700 (PDT)
Message-ID: <56aa9b08-6f82-4c91-9398-fb08746ff76f@suse.com>
Date: Thu, 21 Aug 2025 09:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] x86/msr: Change rdmsr() to have normal API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-12-andrew.cooper3@citrix.com>
 <493d4580-62b7-4ff7-9159-4079b4b98f61@suse.com>
 <7f737ca3-5aba-4ae9-820a-448824174f2e@citrix.com>
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
In-Reply-To: <7f737ca3-5aba-4ae9-820a-448824174f2e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2025 21:45, Andrew Cooper wrote:
> On 19/08/2025 1:04 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/tsx.c
>>> +++ b/xen/arch/x86/tsx.c
>>> @@ -42,6 +42,8 @@ void tsx_init(void)
>>>  {
>>>      static bool __read_mostly once;
>>>  
>>> +    uint64_t val;
>>> +
>>>      /*
>> No real need for yet another newline, I would say.
> 
> Where?  Before?  that's separation of static and not.  After? that's
> separation of variables and code.  All as we do elsewhere.

The latter we do elsewhere too, sure. But separating statics from auto
variables we don't normally do, unless the set of declarations is rather
large.

Jan

