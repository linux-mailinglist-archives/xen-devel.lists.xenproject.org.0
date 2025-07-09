Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67914AFE0CA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 09:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037748.1410286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZOr8-0001nh-KX; Wed, 09 Jul 2025 07:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037748.1410286; Wed, 09 Jul 2025 07:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZOr8-0001lU-Hd; Wed, 09 Jul 2025 07:04:38 +0000
Received: by outflank-mailman (input) for mailman id 1037748;
 Wed, 09 Jul 2025 07:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZOr7-0001lO-5c
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 07:04:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f85aca46-5c92-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 09:04:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3537724f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 00:04:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8419269dsm129848065ad.0.2025.07.09.00.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 00:04:34 -0700 (PDT)
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
X-Inumbo-ID: f85aca46-5c92-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752044674; x=1752649474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dzcbsHe1nu6CI7jmOWggdYhnzU2OSxOXrNqoMA5Opuc=;
        b=aaOpfFKZUsQ2Y23icx89CyeIgGWitAiajP4JYsFWjtgRv7el0K14Ey8bN4iJg4v6Nf
         GK3FJQ8XlC5KZuVscpckeqsBKmI6rM7qIw3b7JRlxoU58EA/fr9UJ8AxXMQqeNhzG2dA
         UapdYnyifbHd+uaMKOTdKhGFfjnsBc8z1v5wcYLW1GO58LW3K3bYWmPQjsMy6L8Yko+Q
         ywBgPU2QuszOCk+eA6t/Hd772Br9YuG8l0BppFxjKFKx3Ct5QC+vx6NldY4M6rZp81OI
         eZvEGws82t84kjGPyQw4HLswPQARNiTUfCjdyK2GAERwZEKDnwrWBWRTa+Y05lfkD2bL
         T9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752044674; x=1752649474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzcbsHe1nu6CI7jmOWggdYhnzU2OSxOXrNqoMA5Opuc=;
        b=P2QpI7Zpf+Xrl6icb9LCfkR4/40Rt5PIoXrl5++KjhbxB+V3/qRdwPsjFhJWRcfMXF
         TxcsCpb/MVuVFy/NaNtmBeY7g0206LreOWh2d79Wp0JagBaurtn3bTK68vfoCzTwA2GT
         QWy9bX8aHgkzsW2V056UQHBeCMucL60w/JOYNHcqaZdhJiSIWFmfb7hYh9ZPft5ccDik
         NXoqjlZDb9IZW/E7Vs+LT+ZLEsIEldWdMkQKEpTfOR3p2N5gPJfeXlqrUTYwTGGBB7nf
         eJ6+q1qpcj14xD1gmjxZd7Ge5Xo5AkVC3I/HM3/7OCQA6rUzwoLLH9gpakKWlM4k45X3
         8DDw==
X-Forwarded-Encrypted: i=1; AJvYcCX7BBJYwn6tf5TbPdnLueNw7JPOWXCC1tvDXPtN6aouxpsem0CWaNQF+KmRlbZneGlazFsZczLXcHg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznOadETo3pP8Y/T6Dp007PUiWKq+HZZqDZXT2lsFov6ZKoE9w6
	A6wcYA3Eu3l80ytxN5VAtGcpaCpqpKh4utu/q8+mE+cY5MYOvDAKJfTlXWSAIDzXvw==
X-Gm-Gg: ASbGncsVFv8kEK3nHOkeC0wpMdboxcq6s9Zj9bBUuwSHKyqHCFBITVncgGwM9xqOl8b
	QWue6hU7CkhDA1jtfXUlDHpxm0SY1gW1i2v6N6S+k+SzH2BypGRnmCXkfjIkRG3f8KOFpK3MB0j
	qTPcixmGzqqSZZC/L8WHkkZGsg5y6OblGY4rDtVSwOF1w/12UG1gNafOGuN5rWYr5vD+QCJ8qdJ
	mZWCMYn0KMPtLNMV8KgBe87PKqKxzybp/Q/XBRjOJztCNoX3p4NbsKF3mq7zRs5oSsKORe2jE+P
	Ujd8WCaoudiLottzxemMHZFwWvl70LNQkzJiMrfqDegA36IySlG2c087SWhXqweY6jtG97n2NZn
	Le8pxdJIhhxMwgoxm6W2V3ujq4uSLcKoyzzn9mVXtdf0U2XA=
X-Google-Smtp-Source: AGHT+IFZHYrnqxn05CIIciQzQkHrSCiHkRP9q3dPumW/m2lsjMSsiuRIRPof45n3H07uUNhKBbCbPQ==
X-Received: by 2002:a05:6000:2906:b0:3b5:dc05:79b with SMTP id ffacd0b85a97d-3b5e4527159mr873435f8f.14.1752044674521;
        Wed, 09 Jul 2025 00:04:34 -0700 (PDT)
Message-ID: <5e5921ce-e186-4e7b-b759-5285c9b8ac19@suse.com>
Date: Wed, 9 Jul 2025 09:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Xenia.Ragiadakou@amd.com, alejandro.garciavallejo@amd.com,
 Jason.Andryuk@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <20250708000712.2731666-1-stefano.stabellini@amd.com>
 <e677f691-f158-4c7f-97bf-13bd157fcb54@suse.com>
 <alpine.DEB.2.22.394.2507081020560.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507081020560.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 19:40, Stefano Stabellini wrote:
> On Tue, 8 Jul 2025, Jan Beulich wrote:
>> On 08.07.2025 02:07, Stefano Stabellini wrote:
>>> On real time configuration with the null scheduler, we shouldn't
>>> interrupt the guest execution unless strictly necessary: the guest could
>>> be a real time guest (e.g. FreeRTOS) and interrupting its execution
>>> could lead to a missed deadline.
>>>
>>> The principal source of interruptions is IPIs. Remove the unnecessary
>>> IPI on all physical CPUs to sync the TSC when the TSC is known to be
>>> reliable.
>>
>> If it had been truly unnecessary for all the time, I'm sure someone would
>> have suggested to get rid of the overhead.
> 
> I am not so sure someone else would have suggested it given that Xen on
> x86 has been mostly used on the datacenter where real-time is not a
> requirement. 

What I mean to indicate is that we're generally always on the hunt of
unnecessary overhead that can be eliminated.

Jan

