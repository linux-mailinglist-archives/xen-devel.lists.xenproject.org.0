Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D371A8982DF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 10:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700745.1094343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIBs-0006G7-33; Thu, 04 Apr 2024 08:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700745.1094343; Thu, 04 Apr 2024 08:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIBs-0006E4-0M; Thu, 04 Apr 2024 08:11:20 +0000
Received: by outflank-mailman (input) for mailman id 700745;
 Thu, 04 Apr 2024 08:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsIBp-0006CT-SZ
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 08:11:17 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9305879-f25a-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 10:11:16 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a50f170b7e3so90952566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 01:11:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 xe3-20020a170907318300b00a471481ef3csm8659545ejb.124.2024.04.04.01.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 01:11:16 -0700 (PDT)
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
X-Inumbo-ID: e9305879-f25a-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712218276; x=1712823076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKh7Eu7TVgDxfeBSJtuFzVDUSdL1UAZsb7MOD/RFW9I=;
        b=bVWt04nT7vUaYE4Bq6sX5udxGy4sdrWlwT0MGG9mJDzxwNLPq6kHctHZtkqOGT5MfT
         2TCQ7podbO2Bv3J9Mlz7CD7+V/6zAcLbmfeqsAvJDttbWj0Hchq0BU0Jx36n9EcY4OBO
         xeVl6Lhr4WQe1RKkWSVpupENfyAaCNMXZYBotw0/TkQxpG9wGS0UIjGVA6GfQQ9heu4l
         MuQLz8nMUaBM2PQr5nZEVKjh9I020+QYmQCl0rff2DivyjD9O0EF+SsJatHRi5St+fxd
         YQ1MRR02E5T0GrpqruuwArkwgUCS4JSD6gNTGfqripfghsKaZXDuCL8YjO+7IV5smitW
         ib2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712218276; x=1712823076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKh7Eu7TVgDxfeBSJtuFzVDUSdL1UAZsb7MOD/RFW9I=;
        b=VstBwvI4bnVcgFEHtF6/+zMliqFY9eTFy6/pnxHZnPlBCkGyGdMS/54LkP2R6BmbLg
         q2LIngNaQx50wl9Lecs7SwZznxWn88JoENjLwWn+kUNTEs/DqclUkd1pnZ7t+m/vGvKZ
         NevyFLK2di/3hP5KJeBjOlMXL29jEMwl+fS7lVjk/qa50brjuFIpvJAGpuSGvtYTHRRV
         2GUjsun6KQWIf7KhZu2xr93qTY+1bhin93TO2NK3bND1b0hkBXVh2aW+iyD5ocr83MPA
         IJJpYiB8zMqvK8+sx/Yq8sVX4iv0r9PxIZPYpHb+NRSXyP5JAnwNZXX1fyjg8daakAgo
         3asA==
X-Forwarded-Encrypted: i=1; AJvYcCUB9nUh/CyaRKdWMglC5CyMQg2Jmq3gU3EUoSmk8RgeXsOO/k88DWCurT59G0Z/N5wjQmpLI1OoZKpZSP1OvNJW7NMjL2YyHILMaVJywzA=
X-Gm-Message-State: AOJu0YzV7YkpTxNofAYQbJtG25xm9YU/1yCwxXzVRLib4wtJV0zyudqJ
	8CwqPEv1/Tvy6txu/Xkm6rDPT4avSUkNv3wUI9rEz7haYm3i5vs85yen8RyT4A==
X-Google-Smtp-Source: AGHT+IGqylbQPD+BfjzLoS3D8QdndY7FhmGtJB7hdYKKAcd0E/bufPm0NohLSrss3OfzxQO+fNA31w==
X-Received: by 2002:a17:907:9487:b0:a4e:2cd6:8ac2 with SMTP id dm7-20020a170907948700b00a4e2cd68ac2mr1350990ejc.56.1712218276588;
        Thu, 04 Apr 2024 01:11:16 -0700 (PDT)
Message-ID: <e8755384-89f2-4b42-848a-9ae60d87cc7f@suse.com>
Date: Thu, 4 Apr 2024 10:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <f2b596e6-0aec-4948-ad7a-aa38adaa7dcc@suse.com>
 <3aa0893b-7efd-4ca1-a405-e897edc7402f@apertussolutions.com>
 <3b8ec757-d2f3-4143-a843-de8c6d51944d@suse.com>
 <accf801d-a74b-41c3-a67f-bcbe622e4e34@apertussolutions.com>
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
In-Reply-To: <accf801d-a74b-41c3-a67f-bcbe622e4e34@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 15:31, Daniel P. Smith wrote:
> On 4/3/24 07:54, Jan Beulich wrote:
>> On 03.04.2024 13:50, Daniel P. Smith wrote:
>>> On 4/3/24 02:52, Jan Beulich wrote:
>>>> On 03.04.2024 08:16, Jan Beulich wrote:
>>>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>>>> and it's not acceptable to short circuit the XSM on the matter.
>>>>>
>>>>> I can certainly accept this as one possible view point. As in so many cases
>>>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>>>
>>>> Further to this: Is there even a way to express the same denial in XSM?
>>>> alloc_unbound_xen_event_channel() doesn't specifically "mark" such a
>>>> channel, and (yes, it could in principle be open-coded in Flask code)
>>>> consumer_is_xen() is private to event_channel.c. I also dare to question
>>>> whether in SILO mode status information like this should be available.
>>>
>>> To build on the previous response: if the natural failure return value
>>> is -EACCESS in response to a domain resource access attempt, then the
>>> probability is extremely high that it should be implemented under a XSM
>>> hook and not hard-coded into the resource logic.
>>
>> Possibly. But first of all - could you answer the earlier question I raised?
> 
> Don't need to, this change subverts/violates the access control 
> framework. If the desire is to make this access decision for the 
> default/dummy policy, then codify it there. Otherwise I will be ack'ing 
> this change since it is access control and falls under the purview of XSM.

If Xen internals like this are to be exposable (and controlled by XSM), why
would other Xen internals not similarly be (optionally) exposed?

Further, since above you referred to EACCES being what XSM is supposed to
control: xsm_default_action() used EPERM, and (presumably; too long ago)
EACCES was chosen here precisely to make it not look like an XSM surrogate.

Jan

