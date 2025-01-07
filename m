Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D9A039E9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 09:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866122.1277396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV58c-0004hW-Q5; Tue, 07 Jan 2025 08:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866122.1277396; Tue, 07 Jan 2025 08:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV58c-0004fq-Mu; Tue, 07 Jan 2025 08:40:34 +0000
Received: by outflank-mailman (input) for mailman id 866122;
 Tue, 07 Jan 2025 08:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV58b-0004fk-V6
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 08:40:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e2b0cea-ccd3-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 09:40:32 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so53300075e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 00:40:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847214sm49722762f8f.46.2025.01.07.00.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:40:31 -0800 (PST)
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
X-Inumbo-ID: 0e2b0cea-ccd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736239231; x=1736844031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PyeZNr7dYL1BRBhi7oa3C4MvptWLYqA9NZuV0E10Iv8=;
        b=SCX1RvIsqI186RBmB6nhKCr5rlR58fLCQSNSk9soEcIZcETNsEj+Mz4v7N3Dngenrl
         xW9IoMLUStgmsiPNHPJvAG9RSDE53WBEHQq+wKEX9UcIi04uK1u69zpG5SYiwxVKFZH3
         SVmvCQGD7FU7xkOCXxfPIyiZPyQH3d3xRxCtiA7ANUlsVn6vaadYmAQV6cyLhOiMxZbf
         47zfg7ZQY8D4eKTiK/B45vKLyKgetG051gS0QLhSeK3aoTTqoDIKgLp7OmY3WZcU7tVa
         FQOz2hzlvtfyUx+j1u5DhrrJucr7kHOolEKpzxPmqcuwdlVT+Tsb+CdukvXhgwNzy/4n
         lkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239231; x=1736844031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyeZNr7dYL1BRBhi7oa3C4MvptWLYqA9NZuV0E10Iv8=;
        b=LOXb54WqnnRKlOXEECyh6szlQyRngQiTWTOyQBanJFP3nTRXXLY8O78QPMdmBQPgWt
         94o+VZTHQCzIKbQ0r8huczrK6MkqFwTg8K1H9xfqW0AeBAlbiLg2Xhe+aoCkTBn3wmiv
         OJ6HGbYY0AOjHJSAQpSEOIvtoTYiz2T3iLhjgYBVi6klwfC95hRrPfbMrHGmUVe6ltvR
         fiK+yfQb2q6uQxAu9oE3bf3iuvbKjJMZOylFWU2oFDi9u3ESRbn8KpT5oEk4anFbIwo3
         qameyfE4lPZLeYJWExYTacJVdt15AGNGNiKx+7Z2ICReEDbVIctkxbl8kguohHNTgglk
         Yc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzD/TrWcEOsDrLJYmUxNP0245uerQGbfUTOglPeVQEG7UXeOr8nmGBSe25MBIf/cM6rugluRNWHU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxmtPK3zZWf5Iznv0DSASQagqqs5I55KYUNOpfASplP4MWB5lV
	+/zy0/SbsVv5fw2l9wigvufeDEvjADj9m0Llx4ViKQs/XC+I0BKMvnJIs80mUPKVhboCOi13dWQ
	=
X-Gm-Gg: ASbGnctfngYIz0hD5C+YUDsBT7olmeun1fjfTPaWT5E/we0Iln25HyoaQigzRKV4Jki
	axDAc6XRqyt8Fql4PDglXs+JootJ83lhT6FDodSLfNKYoFnwI8uciv+FLWlx47zAiKO5ijM+3P+
	5o11LA4ol0UG0PX/2HjURh+9kuxy5sOfF9ORYyW/sK1v+auF3MFutKZw/9vfJ2BV4MGRcvueImK
	TgejqsBv9+/eN+2FQI+chLgqQGuvQkcLP3+ncY0APS2YWbu7qaeyxcK/csMQ1ZzBg63gMUifcoV
	KhXJNbio734d0wLxovkPzCJyyUEXvQZDKH9M6Bg/3w==
X-Google-Smtp-Source: AGHT+IET6/PlMP+lQyTZqv4ik1fWRxXXaT8GgFa3aoqvjvtSjWdlgKuoQQOM8xiloatfh/O6U6LWSQ==
X-Received: by 2002:a05:6000:481e:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-38a2220120dmr54735887f8f.35.1736239231441;
        Tue, 07 Jan 2025 00:40:31 -0800 (PST)
Message-ID: <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
Date: Tue, 7 Jan 2025 09:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Denis Mukhin <dmkhn@proton.me>, dmukhin@ford.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
 <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
 <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2025 19:48, Stefano Stabellini wrote:
> On Mon, 6 Jan 2025, Jan Beulich wrote:
>> On 04.01.2025 05:15, Denis Mukhin wrote:
>>>
>>> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>>>
>>>>
>>>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>>>
>>>>> From: Denis Mukhin dmukhin@ford.com
>>>>>
>>>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
>>>>>
>>>>> The call is used in NS8250 emulator to identify the case when physical xen
>>>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
>>>>> messages from guest OS are formatted w/o '(XEN)' prefix.
>>>>
>>>>
>>>> Such messages ought to be processed through guest_printk(), which wants a
>>>> domain pointer, not a domid_t anyway. Plus isn't that going to be
>>>> current->domain anyway at the callsite, eliminating the need for such a
>>>>
>>>> helper altogether?
>>>
>>> If the current domain is owning the physical console and printing, say, Linux
>>> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
>>> can be disabled from Xen command line.
>>
>> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
>> which domain a message came from. As long as only Dom0 messages are left un-
>> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
>> messages (and have console "focus") I think the prefix needs to be there.
> 
> It looks like we are aligned on the desired behavior,

Hmm, no, I don't think we are. I don't ...

> but for clarity,
> see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
> here:
> 
> I think we should provide a consistent behavior across architectures.
> The current behavior with vpl011 and dom0less on ARM is the following:
> 
> - no prefix for Dom0 output
> - DOM$NUM for DomUs when not in focus, otherwise no prefix

... view this model as a desirable one. It leaves room for ambiguity.

Jan

