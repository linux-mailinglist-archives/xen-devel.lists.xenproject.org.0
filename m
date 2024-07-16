Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D4932175
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759383.1169090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTctu-0000dA-3R; Tue, 16 Jul 2024 07:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759383.1169090; Tue, 16 Jul 2024 07:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTctu-0000a5-0o; Tue, 16 Jul 2024 07:47:06 +0000
Received: by outflank-mailman (input) for mailman id 759383;
 Tue, 16 Jul 2024 07:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTcts-0000Zz-Li
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:47:04 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96ce4046-4347-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 09:47:02 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eec7e431d9so66802141fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 00:47:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2caedbfadfasm5654356a91.17.2024.07.16.00.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 00:47:01 -0700 (PDT)
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
X-Inumbo-ID: 96ce4046-4347-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721116022; x=1721720822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ66EHYIUc0s29P7LBjRyAoAqYHSXfcfUGFk3Q0Mss0=;
        b=BJNLukprNkZ2UATjvf/Shv0vRg4dfQ/G/WxFBlCVydQ9x0qgfLWUQ9YTzRgNWjnXbH
         tbG+FfMUvRt0CITXdDr43XWUTWLfXeMFQEkDwMK95gh8d8IvmSKZSCGbyKNaDfzS5h7A
         mQDQWuZIC9F9ADsrLRYVDuvEHZ4x8MCpbvlzVRZzAL9LEmR+KPkvQD53VU96qROpKAgz
         KW/0wBImLonIn2NsQTwn+omLrZFWn5M6GDhKm2KX//U2XHfs6+u+r1j/XYJeKSTqx+2f
         xZ4h9+bSPNaqMzfL9sry9gM0aDyQWXNtqFi1IKf6oeays51cLD2F84b1IT9ffqWpLIo1
         jihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721116022; x=1721720822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ66EHYIUc0s29P7LBjRyAoAqYHSXfcfUGFk3Q0Mss0=;
        b=F61Mgh2jwgfSnEYULyFykSEL9VDfWs7tvzhgga/6nXbrjANijDcTe4xBm1e/ML52yq
         Ss3VtUHuxqQLslqTBG3GMYmAaVuMk4XFNtEnw3AaJDKZUBlZ44HM+RarRiFYAOsa4jEV
         J3w3YPY+NnQ2uv/dOjg+IShzL0XYH8QKZfki+d7JPwRHbnh1tLYpZCfTuTchmmHCHlxx
         Zg4tovs0AcZYNto0STldJ241SvQp7otQgBFf83KGwapqcy/VhVafMZdCfNBQgWs5klTl
         B5CX+6xMDPTjj9NPKfjSjSgDPdrpshInwhU1hEWJsanZoXV5DVqzqGEKwfGQIz3r/Jzu
         iM9w==
X-Forwarded-Encrypted: i=1; AJvYcCV90fY9SSV+TeA+AvS8R6nuyDfFWpwMslIKLjg7vqGlnXULrPOHSpNC4Qn9fQzqbp/6wcipheWwgQvoFwKisQ41lS0DsZt91KBv+Gq7iZI=
X-Gm-Message-State: AOJu0YwItvuHirDTckGi/NHXw2X01347hNUEWM2O6mvIck9D+XaRSk/4
	wSsZfg/UO17tOGFMKUJtqrhmxnBz9ifMFJCRO5fkIky0K3+mPmO/QbhLOPCInQ==
X-Google-Smtp-Source: AGHT+IFR/oh+SXvuLTvOsnOhUCasWFpT94JV7kUaHgkdieIvuzq3nra1kTG8cTIJd0XrztVjs6Bakw==
X-Received: by 2002:a2e:8195:0:b0:2ee:bdc8:2ce8 with SMTP id 38308e7fff4ca-2eef4c0d29emr7664691fa.0.1721116021877;
        Tue, 16 Jul 2024 00:47:01 -0700 (PDT)
Message-ID: <94722620-dc9f-4ace-9e3e-070c362d10df@suse.com>
Date: Tue, 16 Jul 2024 09:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
 <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
 <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
 <7920f364-d07d-4004-b2b8-fa43b754e9b9@xen.org>
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
In-Reply-To: <7920f364-d07d-4004-b2b8-fa43b754e9b9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 09:33, Julien Grall wrote:
> Hi,
> 
> On 16/07/2024 08:24, Jan Beulich wrote:
>> On 16.07.2024 09:22, Julien Grall wrote:
>>> On 16/07/2024 07:47, Jan Beulich wrote:
>>>> On 15.07.2024 18:56, Julien Grall wrote:
>>>>> On 15/07/2024 16:50, Andrew Cooper wrote:
>>>>>> An earlier part of the checklist states:
>>>>>>
>>>>>>      * change xen-unstable README. The banner (generated using figlet) should say:
>>>>>>          - "Xen 4.5" in releases and on stable branches
>>>>>>          - "Xen 4.5-unstable" on unstable
>>>>>>          - "Xen 4.5-rc" for release candidate
>>>>>>
>>>>>> Update the notes about XEN_EXTRAVERSION to match.
>>
>> When this is the purpose of the patch, ...
>>
>>>>> We have been tagging the tree with 4.5.0-rcX. So I think it would be
>>>>> better to update the wording so we use a consistent naming.
>>>>
>>>> I find:
>>>>
>>>> 4.18-rc
>>>> 4.17-rc
>>>> 4.16-rc
>>>> 4.15-rc
>>>
>>> Hmmm... I don't think we are looking at the same thing. I was
>>> specifically looking at the tag and *not* XEN_EXTRAVERSION.
>>
>> ... why would we be looking at tags?
> 
> As I wrote, consistency across the naming scheme we use.
> 
>> The tags (necessarily) have RC numbers,
> 
> Right but they also *have* the .0.
> 
>> so are going to be different from XEN_EXTRAVERSION in any event.
> 
> Sure they are not going to be 100% the same. However, they could have 
> some similarity.
> 
> As I pointed out multiple times now, to me it is odd we are tagging the 
> tree with 4.19.0-rcX, but we use 4.19-rc.
> 
> Furthermore, if you look at the history of the document. It is quite 
> clear that the goal was consistency (the commit mentioned by Andrew 
> happened after). Yes it wasn't respected but I can't tell exactly why.
> 
> So as we try to correct the documentation, I think we should also look 
> at consistency. If you *really* want to drop the .0, then I think it 
> should happen for the tag as well (again for consistency).

I don't see why (but I also wouldn't mind the dropping from the tag).
They are going to be different. Whether they're different in one or two
aspects is secondary to me. I rather view the consistency goal to be
with what we've been doing in the last so many releases.

Jan

