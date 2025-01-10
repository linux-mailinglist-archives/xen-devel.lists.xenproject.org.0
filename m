Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E073A088E7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 08:29:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869244.1280700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW9Rc-0000K5-OJ; Fri, 10 Jan 2025 07:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869244.1280700; Fri, 10 Jan 2025 07:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW9Rc-0000HA-LI; Fri, 10 Jan 2025 07:28:36 +0000
Received: by outflank-mailman (input) for mailman id 869244;
 Fri, 10 Jan 2025 07:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tW9Rb-0000Gz-83
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 07:28:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f8dc00a-cf24-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 08:28:34 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso17317045e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 23:28:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37c17sm43086665e9.27.2025.01.09.23.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 23:28:32 -0800 (PST)
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
X-Inumbo-ID: 7f8dc00a-cf24-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736494113; x=1737098913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJRFGM2ZG+coRXTqQCvYs0LKh46U5mjzozm/MQ0XUOY=;
        b=X+clvhukjmjugqwgmKUWIHFhzLTkjvmGDgTqKvCDsJjwHlrpJTkPwCTvCfD+j14lYT
         q5SZRhMdkHZABc17qak+LLLQ5fQnUYN1B3EE3ZUJNdfJ83g3o31tQCtDVUuToyK+bvI/
         natrX5eu20mpY5djWOnxAedJhSDdEGkOjpiZTswXhHWRUPKKMRkPY6jQJuDS0pUGvpsN
         ywJ9M1YC5D9+VqptVrz3bImG2GtGTIVTFH8gfQUFIUu+XQ7HML1Uda5eGdCNEsxZicbZ
         n+Xi2IN027rf3acOI5YtzxDn41fUYmhqSOimhWWGNvVlWbN1siGQP4tNwLv+5RgVtJqx
         yNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736494113; x=1737098913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJRFGM2ZG+coRXTqQCvYs0LKh46U5mjzozm/MQ0XUOY=;
        b=DxKACU2B0d/O6Z7mYRFhIYOvpQatOMfBVZiU3hcR7zhDhYWs6hKgqblTnvbZvfpF5Z
         xfM6CROZ4O0HXLAjmpR2+dxGTUHFAusQltnb3ZY2I7j9xMKdh2eoGEGdQpb/A9lVaDkk
         12163JPmL8DlwT2VXvqu4JsbsCHq1oFRNY/5o8Mjgp/3MQhFcwiEwqv6OTs9pKQ7yieh
         x+ILOo9h8m3FtkfSjyFhG1D3EHVW/whAafMx8HqahBxAkqvZHND+wfdaHcGNM7DGUXhu
         8sqcxKdz0acbu+61Nok1/4AZ0x9JxJpJUhb8/uOIeCcgL66jvnUiqYAy0urVJkSZcDAB
         forA==
X-Forwarded-Encrypted: i=1; AJvYcCUTuB1YqLUbIpz4B+GsFauND4kAct/ClhAssFriFUgxUKzWxeIGcbpeSXEZPownkxDqE49sBGjKx5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5BJapPkTUY1koIr8zTXBOApq+tXfv2Py7uRzrzFX8fs5IDmbw
	roSqNe9+4WPvhvJ3pCg4bBebdjTRSd8bhb1rEfhAiWZ3pyBF37IOh0JSNfaEeQ==
X-Gm-Gg: ASbGncshhkujKud0/+VOYQ/RJ+pFIBeurxU7F3oFUgo/6S0iX+dWg7MlCuAyb6LR7w0
	cp+VNyK+bxG4Qnf9NXUM0JJ+5pn4gZ4NioR/MF3bdI8KASMBSF+2EITHFS/SgVrn2vX2/A/QB2y
	hMwCnjzaqWh6SXNzLksfv1jFRCwEwYfCb6kzXhWlMsKeEoVEhDtiohREKiruA/KafdwPcK+hF1j
	Q44lE2C+JRa/CZu2ECwWoC/c8KcaMa2wfTqo/edVn0UGhfsFQfs1Ejeqp4DPOw5F/m1eXcFpI08
	Eto2LJknPUb25p7fO1WgFyc+BXk1lNE+vbeSZc2eww==
X-Google-Smtp-Source: AGHT+IENrB3MhlnYRLXmvbJQZ89EztD+WkABHcrx/ugwLRvqd+MU+lGMtQyjjAiRCrOMAtmOMl/uWw==
X-Received: by 2002:a05:600c:a45:b0:434:a75b:5f59 with SMTP id 5b1f17b1804b1-436e26adfa2mr80816525e9.3.1736494113247;
        Thu, 09 Jan 2025 23:28:33 -0800 (PST)
Message-ID: <4fbf231b-7389-4956-8c7c-6412aa0c4736@suse.com>
Date: Fri, 10 Jan 2025 08:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: update pvcalls_front_accept prototype
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.22.394.2501061335161.133435@ubuntu-linux-20-04-desktop>
 <0f8fc348-14f5-40ac-912a-1785caedb675@suse.com>
 <alpine.DEB.2.22.394.2501071530180.133435@ubuntu-linux-20-04-desktop>
 <ec92e932-e3b7-40ad-9ed3-2b3391cc63a7@suse.com>
 <alpine.DEB.2.22.394.2501091608090.133435@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501091608090.133435@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 01:10, Stefano Stabellini wrote:
> On Wed, 8 Jan 2025, Jan Beulich wrote:
>> On 08.01.2025 00:30, Stefano Stabellini wrote:
>>> On Tue, 7 Jan 2025, Jan Beulich wrote:
>>>> On 06.01.2025 22:36, Stefano Stabellini wrote:
>>>>> xen: update pvcalls_front_accept prototype
>>>>>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> - also update pvcalls-front.c
>>>>
>>>> The patch still gives the impression of being incomplete: There's no
>>>> caller of the function that you update. However, there's no such caller
>>>> in the first place. Why don't you just delete the function then?
>>>
>>> It is meant to be called from an out-of-tree module, which has not been
>>> upstreamed yet
>>
>> And which then would require an EXPORT_SYMBOL() anyway. In Xen, as you're
>> well aware, such unreachable code would actually constitute a Misra
>> violation.
>>
>> Without any in-tree caller, imo the change needs a non-empty description,
>> clarifying why the adjustment is wanted / needed.
> 
> How about:
> 
> ---
> xen: update pvcalls_front_accept prototype
> 
> While currently there are no in-tree callers of these functions, it is
> best to keep them up-to-date with the latest network API.

SGTM, fwiw.

Jan

