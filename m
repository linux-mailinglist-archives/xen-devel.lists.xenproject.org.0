Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFCA500C6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 14:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902282.1310233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpp0U-000364-IW; Wed, 05 Mar 2025 13:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902282.1310233; Wed, 05 Mar 2025 13:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpp0U-00034X-Ek; Wed, 05 Mar 2025 13:41:54 +0000
Received: by outflank-mailman (input) for mailman id 902282;
 Wed, 05 Mar 2025 13:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpp0T-00034R-4N
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 13:41:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 985fc914-f9c7-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 14:41:52 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bd45e4d91so3940775e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 05:41:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435c836sm17620085e9.37.2025.03.05.05.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 05:41:51 -0800 (PST)
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
X-Inumbo-ID: 985fc914-f9c7-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741182112; x=1741786912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rw0TGQO5st4pbOhQCBnB7znXr7PwXGpg/h4j7bkjPPs=;
        b=gWwZKurbvCE5dMqHqjZb0t0oFF1EOn9oTuu1glOdX7kE6koqCKiOUsmp2gX1WvZJ/p
         uRfoML+Kzx8qyCqftIbWPTPiuZJvd8Bhkk1iQnWxD1PEPF99IpEfnXj88QAi/XLmR0nt
         SQG5sBpILwCliPhXv4O2zv2Do8xVhznkEv3RgMRRhixgf6I/WhTMvjnAQ+QLL4QM6mx9
         gbhw7Jqzm77EEmaeP82VJHtffw39ok2HbIPIbJj+JwKJ4H1PzNEYk4+qaDsUcl9vodv7
         DNNhNz76ZRNpEztFsj5pelXhF06YtsdxZQs9//uM+AZeTYQmamL0jgyMZq+6IeVASzTK
         eIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741182112; x=1741786912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw0TGQO5st4pbOhQCBnB7znXr7PwXGpg/h4j7bkjPPs=;
        b=pjIwa1fK8X8FFq+n7+WuZWX9HzqfWJFzXaN/jhcbWsLR2dEPh4KXm6HUQ0tfkmmeuB
         q1M3MX/6EBG8ZsX55Umat9NLAKzVHXqP7R5D+ABpa3WZZhDvPHyn9QPgVnWPZEQePMrw
         qetEJIXrMxxdc91mnS2Xms0QS32Znxo0DE0MRPcVE2dHNmZ8XY4vnSd7XWLzjsAy0Z+u
         /EcsZhPq/vkgNDrbWpIcTRDaLm+h+A8LT/v3AzCyRnDdlSiz6H+1nillFwp7behlSFpb
         LL/vtHfks7kWg7g13oke0wwYj5fBLuJSDNQjwOs04M8ewAwkSSpzU3Vbmmz+aV70xCiA
         5ELQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHLdHep+MIsJxzgZRxL+wDS0Ky9LTPbRifOelRUA/MDztex8RE/FS+W2opPZwlXkGTX8R2D2nLb9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbI9RAOftJuLDXN5jAagq/9KIWHXOIfUz3zvrx5QW9/d0IokdD
	CbMoOepCxKgPUkQwc5b5skfCEYKVGLgMdcKBg+qjvUO/EHQt+EqW6kjE5cu3Mg==
X-Gm-Gg: ASbGnctz1c1EpAMaiPZjubL8zSZ/2FJYsZLVktfA5gCy/tNdMuV5WizX9r8eoAg0BTM
	L3/gVKOnGsKQAKgYBTgpcjLNRHpcQkn8gMWiTaCUl2czUsDfr4ZOWkjdCUChziGmThraPCSceA7
	t8t/oV+6RRJqaLSQT9gRZgIRPpcaj558msBOHNTedHQ8kXDU/pTFfVmEkK69ggzLvkzlOlBGPy4
	YEJYofWvYVEJsFdS1iLwivRoZnPaIQzPKx5IkMVa3zltXDUmRC7llBGLwPKcI8xNpe4FeUFaiO4
	YvWcNbAb0vwGhTfg0bj43DjdWkd1df/2OlBiqfEJF3ws2Yf1qSIw0grEuyWRkwr5i0uDn0YhUe4
	oz2rXWEZcMbhfZXp1o4GLBMOj4L7KAg==
X-Google-Smtp-Source: AGHT+IFFRQSmQdHGVfIsQHm3h2MrtE3p/9GIvCgRooeNcw2jPT8LPSvZh8e1qwDQMLrr4MyEL+MfYA==
X-Received: by 2002:a05:600c:4e8d:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43bd1fd7903mr25986095e9.0.1741182111644;
        Wed, 05 Mar 2025 05:41:51 -0800 (PST)
Message-ID: <914e1afa-ea45-47c0-b5d0-7a712d6d9dc4@suse.com>
Date: Wed, 5 Mar 2025 14:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/trampoline: Rename entrypoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250303224322.2572611-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250303224322.2572611-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.03.2025 23:43, Andrew Cooper wrote:
> ... to be more concise, and to match our other entrypoints into Xen.
> 
> In acpi_sleep_prepare(), calculate bootsym_phys() once, which GCC seems
> unwilling to of it's own accord.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



