Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A52CB84B0D8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676682.1052896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHZl-0000UI-Iu; Tue, 06 Feb 2024 09:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676682.1052896; Tue, 06 Feb 2024 09:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHZl-0000Rb-GA; Tue, 06 Feb 2024 09:17:09 +0000
Received: by outflank-mailman (input) for mailman id 676682;
 Tue, 06 Feb 2024 09:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXHZk-0000RT-VM
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:17:08 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8014f883-c4d0-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 10:17:07 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fdf17fa89so1884255e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:17:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c45cd00b0040e4733aecbsm1315832wmo.15.2024.02.06.01.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:17:07 -0800 (PST)
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
X-Inumbo-ID: 8014f883-c4d0-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707211027; x=1707815827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=arBGPFrOLwqCftlxAZTfXEpNoXrQlI3w1e8E8Eg7n1w=;
        b=AHMkt1Tum5vSProNBRaH5p7S7cZNts2se5XgXRj9b5CySQREVjUBhIsHkht+VqZvtC
         ngzv9R2bCvSnXlQZSPv88pnB33Y7j4f/Jlkqt7hJg7+7tvZKLa5Ro+7g6KCclrwV7DD3
         rXaVMtW/jLEa2vfb8Bm5Dip/1sywaGtN1J73BFhU724QHmKhyzTUxuY762PRc9BUDR+J
         NkPBEq9npa+7XZbCBAotoxN9fcDlxY3wUu/0McOXLQqwECYPx7mjC5nTPTCp1Xx/JLvy
         Pic21MbL6K0VgWrg+sLtDllrfx48snk30hPai7jAYceQudDy1zoiX17TYX1QlM6QUlWD
         9y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707211027; x=1707815827;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arBGPFrOLwqCftlxAZTfXEpNoXrQlI3w1e8E8Eg7n1w=;
        b=NRDb1P5pe7tciTenH6UjzA65tpTGf/29/0aaxQu7cXb4Tb1pT2UOuV4gy3qZh0KQz2
         9egwMlzmcpb5AgJTM6lH4d9nW9YsnxGDJZ9mZ0bGYlIjNmb+yShWcFuY/b8VjimOr4vG
         nROmEiVdekkiT6wySjcg/074T8tfubJww5dSz1SNwTf8lklRXWEVCJuUFCIXCUfyqlp/
         1zSvnNd8XP4nJabKd3/7zs3xpiuP4SmIbtYx3UlJ4ufU3CcLQIEGxVmeeBnGElj+0B8W
         VrBzlOs7jCYXaep6BZzfzIAylfyNfRuNA7Bnxt8UZ/ix1x0Lx/u0rZ0clFIQAdCqnMMx
         9pTQ==
X-Gm-Message-State: AOJu0YwT+Y2OnLRcR+KQDN46qZDBPNSecigYHWN8HwqLR8tYEjU5x/hm
	senYJA7cj4MZaGquWK8bOFAVjuS4p1ojSoKI34HLOM/4wNAbQKMs0JXxEh7bAA==
X-Google-Smtp-Source: AGHT+IFEpZh0/jizEzpIcYwCMsFRDVOBRr3/+nvor086leDd6s4pqGIVz31Xcc8UEDv8QOWdLEvmHA==
X-Received: by 2002:a05:600c:474f:b0:40f:c234:2006 with SMTP id w15-20020a05600c474f00b0040fc2342006mr1657194wmo.8.1707211027304;
        Tue, 06 Feb 2024 01:17:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVZRKutFXgwgIQVZPbZI4lhx7CqzhIP76aQ9f3DTPUjtDpZmqaOcmAUxBkcivl1MdLMC7K+DL1YXNdY4My4v8XVcjYre9Po/5JQwL5ZIerIyqpP0lF9DsEzCJN5J4sC67MC4cCIMPuWmL2UEzepWDwBNS0Q2bsWYpi7iSPUKzPp8v+vpZVoFT9JvS3zlUscufgMFOgZkBAqjFvzv68qzuY=
Message-ID: <6f8b3145-3e7a-4968-b68b-efa56c99fe55@suse.com>
Date: Tue, 6 Feb 2024 10:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Remove useless assignment
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240205104637.14868-1-frediano.ziglio@cloud.com>
 <alpine.DEB.2.22.394.2402051241240.1925432@ubuntu-linux-20-04-desktop>
 <cbdf382c-a688-45f5-b834-9e3ab70ffc53@xen.org>
 <dfb48bce-378d-478d-b65e-ab8e27aedcf3@suse.com>
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
In-Reply-To: <dfb48bce-378d-478d-b65e-ab8e27aedcf3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 10:15, Jan Beulich wrote:
> On 05.02.2024 22:21, Julien Grall wrote:
>> The tag says '2/5' but I don't see a thread. Is the series meant to 
>> contain more patches?
>>
>> Also, the title is not very specific about where the assignment is 
>> removed. I have committed with the following title:
>>
>> xen/evtchn: Remove useful assignment in evtchn_alloc_unbound
> 
> Luckily in what you committed it is actually "useless" ;-)

Oh, I'm sorry - I see I got To: and Cc: mixed up in the earlier reply.

Jan

