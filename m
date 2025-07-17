Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA68B08C6B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046691.1417080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNMC-0000ty-Oe; Thu, 17 Jul 2025 12:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046691.1417080; Thu, 17 Jul 2025 12:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNMC-0000rg-Lj; Thu, 17 Jul 2025 12:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1046691;
 Thu, 17 Jul 2025 12:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucNMB-0000pu-7k
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 12:04:59 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4197fc4b-6306-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 14:04:57 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso536307f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 05:04:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de43228b3sm146604365ad.135.2025.07.17.05.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 05:04:55 -0700 (PDT)
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
X-Inumbo-ID: 4197fc4b-6306-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752753896; x=1753358696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tm3AQY5snUNJM04Iir1CQrnRHvnoHlcgrh58p36jbUQ=;
        b=HgtCng7aIRnq5q6HNQdC326eha2OEQV5qwUdEX+eSt3FqqgpSVVGMct5wKdT2GOJCn
         K1pV/v/wUPB+jF9X9g8YO9pKiPC+ZUSN05GHagtfoGBPIcxKXEQY7qSEC/R7CbCR/42J
         1CkNmtqxAdyvpDJuBNTaxmwz3+l2IkQnjxknbrlCgHLcgNTgMqDiUrRid1checpAglfS
         uUkvLJloe2+ijarEt9IYBRUL84a/dO+JKj1pRS9ovR0QakPfHFMlFF2gBWPOyusoyBNK
         3kl/x5W07gw1lHswshf4RasjkBtsz/8uCk1kbNa9nBdUsXZVvA/KR1fwp16mUu3qH138
         35gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753896; x=1753358696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm3AQY5snUNJM04Iir1CQrnRHvnoHlcgrh58p36jbUQ=;
        b=glP2Xxpe+VwTorHMmSSB+UjggHXESC7GkBef7HP19qHtEEt01nYUOBEDNE20Z76zWq
         RbqnI+HD6Wx47PXN+9otxSjyixSJ4S2pbji7mBVUfzV61hyRqQ8OYNmTAfGGyMA/5c89
         K6Dc8b7FZmqNw4WNFh0F0GByWWJdau5V3xqHd6ecspo9ohJY3Sjk4e7EvTWNPxbcxcxV
         Rkc1PhILo7eIMrnQPEex/Nb/62D3Dwb0WcLQhMGblJyGvcWE1V7yeBqBULboE6waNXMV
         AlmAqb6xpc+7V/2lvQxPz+e/03eBSwxCYOunBnHWSS0aD7sn6lIBqa/Kf/1mLe6laafR
         X3Jw==
X-Gm-Message-State: AOJu0YzbtnAbgXvXrFyJ+1DOzlgwwBznRUZ/OPq0jr7t3bcvTehmOzb3
	zyOTY7H1wHLDPmliQ1sTVx1JKXVWfqW9q+aw5Wg/1miitl9nM5g3RvPQS8B60pwdVg==
X-Gm-Gg: ASbGncvXq81AQseq6IUZmEnBLOxWc64uNdywCKym8bujq8WeENI6lRAMDIlHsNaLHkO
	A4AeVpl8PLfK7TcSrEv5m3oGS++3GcI+5RJQ5/5y3uOiXkmVK0ZyjGhh9zxZSTl+QC1aN96WzUh
	MMl1Z1cyNfuXCRNbFgwAa4QHoUxDskw7LEeKZgK3C5hSKqh343ca+9F+Vr4KsmS5ReXisMiGXKP
	/CobJHsa9r39lMA5HJt8/IUskSstuI/pJl4M07A4Wm48478CXGaVl3AGdZaLVAY9/kPvBqvlNIV
	/Kqxw0t15rj6rmteFybV/kdmbpr+uyZzWPk5gCRc1da/1QzyR9pq/76Stzqy8IcczOTJkrE42Yu
	YWotfrv+FUDx0/9aHk/efudznJLvqgHpi/S75fHj+yS0GOjtOespUwVtSXXLoK9jsGMKDWTC/c6
	JlL16/f04=
X-Google-Smtp-Source: AGHT+IF/8m9SyuDknt/TqVQ/10+lucQBdICIufGJ+swp2KSfmDJQp4sVxWY+bjTB1+ZnVjIwG/o21w==
X-Received: by 2002:a05:6000:1a8e:b0:3a4:f7e7:416b with SMTP id ffacd0b85a97d-3b613e66f70mr2512817f8f.16.1752753896170;
        Thu, 17 Jul 2025 05:04:56 -0700 (PDT)
Message-ID: <8219b634-c6d8-43e4-82f6-b5622fd7afdd@suse.com>
Date: Thu, 17 Jul 2025 14:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: initialize kexec_page in kexec()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Minios-devel <minios-devel@lists.xenproject.org>
References: <b96d2109-6c84-495c-8efe-f2fcfa95608d@suse.com>
 <7e9a8486-b60d-4929-bb37-275578a53359@suse.com>
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
In-Reply-To: <7e9a8486-b60d-4929-bb37-275578a53359@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 13:58, Jürgen Groß wrote:
> On 17.07.25 13:53, Jan Beulich wrote:
>> For the error patch to not see it uninitialized.
>>
>> Fixes: 560c2a5584c4 ("mini-os: kexec: do the final kexec step")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks.

The revert actually didn't help, the problem was already introduced earlier.
I now don't understand how things built previously. I'll re-apply the patch
bumping the new revision to this about-to-be-committed fix.

Jan

