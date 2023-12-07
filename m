Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFAB8084B6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649664.1014458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAiJ-0003em-Oe; Thu, 07 Dec 2023 09:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649664.1014458; Thu, 07 Dec 2023 09:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAiJ-0003bj-Ly; Thu, 07 Dec 2023 09:30:35 +0000
Received: by outflank-mailman (input) for mailman id 649664;
 Thu, 07 Dec 2023 09:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBAiH-0003bb-G9
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:30:33 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441ddddf-94e3-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 10:30:31 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c09d62b70so8627655e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 01:30:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b0040a3f9862e3sm452187wms.1.2023.12.07.01.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 01:30:31 -0800 (PST)
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
X-Inumbo-ID: 441ddddf-94e3-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701941432; x=1702546232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tRaJkaGrkxCaWKa9Vt2fuICxmF6Alx7gwE7p2GEtRx4=;
        b=NgG/tFDxcRD3+zvalGmWM6d4O82HDqddzo8HsQyeIe6z1WV/X80xzBAoTPfXBm4vLX
         QSoZUbxo2j1Viqhi7zlbmBeFKw7OkojOxFfRFQn/5u8UL7ZS9cTqZ+QY7EKcI58TAznN
         MQKmJmlE0gCRMO12KxZk0tQbS/nwArTb/74KOC4FN5Pxpojm2LaqmECbMRwM//RudV59
         61f2ZvUCnYvAvoRH4Reu8DhWAv0+Ngr33Ynyb7phzedFL0TTWLF0Pp4JRymM7U2qh8Xb
         09r7ic6h62Yvc4J3ZxuzQbhbypAlohaPSqDozIE4vx/G4/sTtizhwqHl5ox6ZZjGjZbn
         S15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701941432; x=1702546232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRaJkaGrkxCaWKa9Vt2fuICxmF6Alx7gwE7p2GEtRx4=;
        b=cQJDZ6LaN3HJ6DTszwaaetP3yEKKEWQ/dB0PWEJSCa7XR9QzEhLNd0gbjm4B6w8hGB
         46QohbgOc5fj7L8kpMn9zYVd7geaKfc9rpsj33jEylFTkxX7PPw8k3XhBh/Br02VCQdG
         ECQ1l0En4STECC6v+ASKIMeDVrOUfJmY3d7IpdDola93sQXX4gt+Yn9wZ/WQ1X8RYhjS
         cQ8clYHrxa9MJhAGz0XXhK6PaUF6Ej1s9Wae1c19xY7K2thM+GA1+KRtTDMLSGbM6aXS
         3aH6rICac3ljwRLuOebc9GHNp9+K8xZJ14qZyYnDmsRNI/a6VHkpkPTQFugUgm2y4JGM
         OePA==
X-Gm-Message-State: AOJu0YxnnxRopmMKzDj1VX6tSSKHFK9mZP/RQRfnTfH0F2jH9K61QdGU
	dVjXb3K6srg4I7HFHbl4DEkS
X-Google-Smtp-Source: AGHT+IGj5jEv6YPUjzNxFDtZ9g7T9nXd1zOEgSkDzBIR3AKEtdXGowMNbIZK16j3ilQE16jySjs1Vg==
X-Received: by 2002:a05:600c:524f:b0:40b:5e21:c5ec with SMTP id fc15-20020a05600c524f00b0040b5e21c5ecmr1025435wmb.186.1701941431832;
        Thu, 07 Dec 2023 01:30:31 -0800 (PST)
Message-ID: <fab5cc9d-d97e-405d-9f7a-1b86de097aab@suse.com>
Date: Thu, 7 Dec 2023 10:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tools/xenstored: remove some command line options
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20231121114048.31294-1-jgross@suse.com>
 <1a6f8027-0e49-4975-8ab1-998a9b4cebee@suse.com>
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
In-Reply-To: <1a6f8027-0e49-4975-8ab1-998a9b4cebee@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 09:26, Juergen Gross wrote:
> On 21.11.23 12:40, Juergen Gross wrote:
>> Remove some command line options which have no real use case.
>>
>> Changes in V2:
>> - moved removal of "-N" into last patch of the series, as this is the
>>    only option which seems to have a use case (OTOH using it has some
>>    downsides as well).
>>
>> Juergen Gross (5):
>>    tools/xenstored: remove "-D" command line parameter
>>    tools/xenstored: remove "-V" command line option
>>    tools/xenstored: remove the "-P" command line option
>>    tools/xenstored: remove the "-R" command line option
>>    tools/xenstored: remove "-N" command line option
>>
>>   tools/xenstored/core.c | 81 +++++++-----------------------------------
>>   1 file changed, 12 insertions(+), 69 deletions(-)
>>
> 
> I think at least patches 1-4 can go in as they all have the required Acks.

I'll try to remember to include them in the next swipe. I was kind of
assuming Julien would be taking care of them.

Jan

