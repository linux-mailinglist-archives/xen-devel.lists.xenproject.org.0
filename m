Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B41CB4F70
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 08:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183562.1506209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTaoj-0007bM-8S; Thu, 11 Dec 2025 07:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183562.1506209; Thu, 11 Dec 2025 07:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTaoj-0007YZ-5Z; Thu, 11 Dec 2025 07:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1183562;
 Thu, 11 Dec 2025 07:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTaoh-0007YS-9R
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 07:10:23 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734a8e06-d660-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 08:10:19 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42e2e628f8aso212794f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 23:10:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a973sm3736468f8f.36.2025.12.10.23.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 23:10:17 -0800 (PST)
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
X-Inumbo-ID: 734a8e06-d660-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765437018; x=1766041818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2KgxQsLHdNymULbr/SuEn7RfD0QTKnAtn1DTFMZDgVw=;
        b=UGumYigsIgzBDibnpoKIGDt/5SM34aI8nLrwhvZZu4F+h3IpMbOGjK05iVVwmMqfS6
         xdH1ZdlcpfIF9ZpKZtFmvVBfnXJzOM9dfKxKUPF4Tyyh+UMMae3gF6H0q/SRSTAn6UIA
         EU9hXWbSHV2lC8v0W0tRA3isJxh9sSG/XQxQVJzC3nAsjDhcPD11S4eYQr6zP70qjp9E
         y3eVpYlckW1wRgD0OaMxCpM1aYrJQ/0Els8QSMV/maRVDxjkKjllTX2BUfOPtOGA9+hb
         3e6x+2brS5Li+okxp0h6It+NqEmjikoJ4ldN59jT3oqWrViOpxlo475HbOSxslxl6ENm
         405g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765437018; x=1766041818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KgxQsLHdNymULbr/SuEn7RfD0QTKnAtn1DTFMZDgVw=;
        b=PDtqaG2EkS5UexxO9bwqRVs+uSvXE6AjTYKgg37PIxmfgBEAnbCMJI19SdMaqtnn0E
         0ZDB3TldAc0xt9gFEjUVxRCdHBQIKJjTGgis1Z+tY1ZR3nXFqPTRz7w+gSV9fPkHFJyb
         gwyvSLb/t18hbPQGnZBi97PDrUZcK6pLtxeWNA7dYMogMMuFDxYQmuDop0OIA4Xhit32
         c6ySaWA/iT5FIhD/meK5y9JNZkKMYsyrh1cpjVxa8y2IlU6SBfZ+ng3sTbUxPiDNQqIR
         n3eR4IppI4H/r7jHgoCGosq8/4MDHDHBjx8CKj3SZEffN8YhFTsxkG2qLw91TY5lQnyC
         GeFA==
X-Forwarded-Encrypted: i=1; AJvYcCW1+mSgfuKYvVzPYPMxcjNcg217iujrtyFXOx6HHfvF63kxrfE0k/q5jcR7cbMV+50Nhqv/PeK9Sl0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkxwKx71dsyy0nq0pJth6SLSHdHz3ovQCIl+nCvZZh4/4pLEQe
	L3ETqej726eOJEiQAQoJ5cP0ATG5XOA4E9L/+UpoH9gXnJoV9nujSReFD4uPjwrc+w==
X-Gm-Gg: AY/fxX4Rl1H6gF4qhS769jA7vpPblr5uqrEEk0BgQQLzlhJtGLEeoDl32pDUMaVIIxT
	DMtJn+pSV6o86ObqAH6wON+tba/Zxejj7whwLYh9RYqWmO2dZfaQJ1zUETB/Ad0bBaD4hqTk2Qd
	8jkhsCapEW4Je6Ggm4clzy/kodEV2boGbbsAbriG4ftZ3Ohx3aBGpPR5jvDyFlvfm/vfW9a+MF1
	Aj/WVHZ0s0g0IPv4h/b1w2xXuB/Sb9hRxCUPOMI9cB4l27m74h6AQ1NVPjP+pk2LXeSSTbv7JnS
	DGHoHFypWHOO0J+keBPnxsuCyAOgogjj0UEZyJOA6neF6FUFzHRgzvSIHeVaXbSc4pcM9JQN6eA
	OaOi4biDvW6AWQXHMJ3szsywUle5KPvzi3jWH0sOqOPniloiumqK0a3XnyVCc23hDK/Y8rTJlhb
	mt60LL88i1oMLZZ7UWnHRtxG9BAgeNz+XAb4+GeOGE7AixdXu7pCoiJkaLRvLPKsermNFWdqOew
	h1lKDOPkHM/aw==
X-Google-Smtp-Source: AGHT+IEQWGqg3n1PYCE8mt2mbF/Z3pOeqi4qVcNaP+Ak59/hQh3aDWjsb9YtLTnnVFH1WNSK/P5MYw==
X-Received: by 2002:a05:6000:2c08:b0:42b:389a:b49 with SMTP id ffacd0b85a97d-42fa39d7eefmr5169406f8f.28.1765437018083;
        Wed, 10 Dec 2025 23:10:18 -0800 (PST)
Message-ID: <e2d5c0b4-a857-4b06-9148-4c7d5d22b44f@suse.com>
Date: Thu, 11 Dec 2025 08:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/svm: Make vmcb_struct private to svm/
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-2-andrew.cooper3@citrix.com>
 <373f19eb-39fc-4a76-95fe-4acb95ba71d8@suse.com>
 <eef80a07-ccde-4948-8213-3ef5352c5283@citrix.com>
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
In-Reply-To: <eef80a07-ccde-4948-8213-3ef5352c5283@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 15:25, Andrew Cooper wrote:
> On 08/12/2025 9:05 am, Jan Beulich wrote:
>> On 28.11.2025 21:19, Andrew Cooper wrote:
>>> The rest of Xen has no buisness knowing this structure, and it is currently
>>> included via xen/sched.h into most code.  Create a new private svm/vmcb.h.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/hvm/svm/asid.c             |   1 +
>>>  xen/arch/x86/hvm/svm/emulate.c          |   1 +
>>>  xen/arch/x86/hvm/svm/intr.c             |   1 +
>>>  xen/arch/x86/hvm/svm/nestedsvm.c        |   1 +
>>>  xen/arch/x86/hvm/svm/svm.c              |   1 +
>>>  xen/arch/x86/hvm/svm/svmdebug.c         |   2 +
>>>  xen/arch/x86/hvm/svm/vmcb.c             |   2 +
>>>  xen/arch/x86/hvm/svm/vmcb.h             | 617 ++++++++++++++++++++++++
>>>  xen/arch/x86/include/asm/hvm/svm/vmcb.h | 606 -----------------------
>>>  9 files changed, 626 insertions(+), 606 deletions(-)
>>>  create mode 100644 xen/arch/x86/hvm/svm/vmcb.h
>> I was actually hoping for the file to be moved. I notice that a few things are
>> left in the original file, and I wonder if they couldn't be moved elsewhere up
>> front.
> 
> No, they can't be moved yet.  There's other cleanup on the list, and
> more header dis-entangling needed first.
> 
> But I do agree the name is wrong and wants to go.

Well, then let's go this route:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

