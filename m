Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE9855E08
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 10:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681427.1060186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raY0y-00062f-G1; Thu, 15 Feb 2024 09:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681427.1060186; Thu, 15 Feb 2024 09:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raY0y-00060d-Bm; Thu, 15 Feb 2024 09:26:44 +0000
Received: by outflank-mailman (input) for mailman id 681427;
 Thu, 15 Feb 2024 09:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raY0x-00060X-5i
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 09:26:43 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 538b633d-cbe4-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 10:26:41 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d0e5212559so7444391fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 01:26:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d4dce000000b0033cf4a10359sm1170044wru.61.2024.02.15.01.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 01:26:40 -0800 (PST)
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
X-Inumbo-ID: 538b633d-cbe4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707989200; x=1708594000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKGB4E1geMsj83tapJiTWzcJMlLUioOn2ukajXeGsBE=;
        b=c9YL7BLbvWxC02PWHsCZwKrjepOMYaEffeTOMOeKJDt7KCeX53R0qcnBZ9bZ7lIvuZ
         NzmvEf1V3WU8xZMNXIsuPNjHQsDkg8xO3ZXR+B+N9ujie2kXiv8j8Cxr2xJmv6c2vtZe
         00hHc/9Be97rnCA3+2mN1vAZiILcznMUmI9Ox10uHcI2vlKHzGRQ2JFymd3748pS0kib
         nEZOZoHVgOrFOTu9hgLeQMRqTORmdFkb+OyZ++NPAFwX77esPJ0dG5kvciQ2s7Wcp+Bq
         SiQqD60VgSGcBcUGLew8PwE0HrKRr4Ssc6Z+XKtN0WQf/zI5xloe2sdwo5wVjNd0E9Su
         H8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989200; x=1708594000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKGB4E1geMsj83tapJiTWzcJMlLUioOn2ukajXeGsBE=;
        b=gR1LP4mYJeUAtvAV51w/+vkC/wb5+y9yMjqONR7lqVCxz1hUfeB2WVi4TaHeT1bpm7
         CEf7HGrgCPOOgnMM7I9LZ2TZVg/MPK8capYCJQkcxEASyamsdzfIEI4TRv1+V6SUd4iZ
         MkGN/6n5CRf8s6k0d9ol8s+KmtpGsamPo84GB59SnPWqcneVbRcWjUlWHEJ0S25Ztyhj
         WQJaXgQWgfiZOPnwp5KIjRoKqRkez9zLC5LHa84Y1ku6S5U6wVUY9FzJvBHRWmZrEmpn
         nyruZ098zDjt+obJyr8z5Xh0IyGq6MjKtM9c7Bt+KbkuaN8bB0p4Lr0Qab8uYQ5C2tr2
         9VnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmN79SOXTiHupYn0Sv3zVtoMJm2saYksGKHYEqAaL/B4wQUHGGnQwDb3yT3PW7PanaVgNrh+mhzkV+gTXLHg4t1RTm28sFWzMQemYDtq8=
X-Gm-Message-State: AOJu0YwvkiT4oax68daBaW5fAKv06zzhjp1VIVqzTLgHX904tAUg/pen
	P37eCf/7Yh+9pFdL01MvPn8N8BarczGIrYmCQC0AV+CiXxYGn32J7dU7Tor7ZQ==
X-Google-Smtp-Source: AGHT+IGkkU2WGp8QMza03CzMMSRxgbLhfVSFskGhgZqTzLevtx+f8d9TKxgH71j8xfnv8B2609J0zg==
X-Received: by 2002:a2e:8ecf:0:b0:2d0:9cbf:f389 with SMTP id e15-20020a2e8ecf000000b002d09cbff389mr836230ljl.26.1707989200505;
        Thu, 15 Feb 2024 01:26:40 -0800 (PST)
Message-ID: <0923d293-38ed-40ba-8bd8-b37c2b5d22b9@suse.com>
Date: Thu, 15 Feb 2024 10:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
 <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
 <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
 <alpine.DEB.2.22.394.2402141600010.1925432@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402141600010.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 01:05, Stefano Stabellini wrote:
> I don't think is a good idea to add further changes to this patch. I
> think we should go ahead with it as-is.

I didn't suggest adding anything right here; there may want/need to be new
prereq-s, though. I'd like to make sure that we don't (significantly)
regress in terms of being able to diagnose programming mistakes.

Jan

