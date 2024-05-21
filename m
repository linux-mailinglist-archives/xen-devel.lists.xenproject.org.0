Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0818CA7E1
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 08:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726585.1130913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Io9-0003T4-7f; Tue, 21 May 2024 06:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726585.1130913; Tue, 21 May 2024 06:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Io9-0003RY-4z; Tue, 21 May 2024 06:17:09 +0000
Received: by outflank-mailman (input) for mailman id 726585;
 Tue, 21 May 2024 06:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9Io7-0003RS-OC
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 06:17:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef42d9f-1739-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 08:17:05 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a599c55055dso774640466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 23:17:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7fdasm1558866466b.128.2024.05.20.23.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 23:17:04 -0700 (PDT)
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
X-Inumbo-ID: bef42d9f-1739-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716272225; x=1716877025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fbuPSgCj+Zx3hOeIkqBZTYf9SaBHpm0cpXaZth3lHM=;
        b=a43ed6n+Rt1zUgJHjWTRh09p84+HqxTo7XdSej1OL1v3p6knUjaeSGKoFLywfeJCB2
         5iD9ONnIP8cNzy3aSSucw+QwaHVE2x9z17Qq9fKgtuwwh1XRWxYDEDfhhsTOE9ye5T5p
         DS5q5Sh5qCXyEakL5+Qzs4uymP/Kvp+PFMsWnwH/76r+kPMedVMo8VSAZ95SzRmXh1qQ
         wgYjSBjdVd7GhBLtWmlo/W/U8lZZIASGI6veyqPLTqdllCKK7QDpWVamQ1yw/Vs3uPIp
         5jrT/bHNvTh7dVYMo9yvGmbZLu54m4JAPHUSl6qczwzoUzlKGkLOXsJOt8gSN7y8CT3f
         u5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716272225; x=1716877025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fbuPSgCj+Zx3hOeIkqBZTYf9SaBHpm0cpXaZth3lHM=;
        b=cvEec81n9WQMlgXR10O+bkxAn5BqjKlgFAjbs7X44L+YiZ/a9Xfdok+LoJJYbr3phY
         lQHoBfGWsPeQTZqYse8LMPI/Z+Zk1CZnEXzSP7d4v9/1pdRD9yh+GMwfIGSxiwf3ic8p
         moIfLNSuuoEuYOfV6Co3GAMT55NVErQGfLMFCZ6MjmF/M0i5VpaL9XFyiPGvVAI/DxVp
         8Ke8wh5Lubuh98rl2T6BlfsR20vmKUd7wK2N9Ovx08ZZEMDUQZdcwIj6UIdIjgEdQNeI
         y/q/IoxqyIEN4UrKjuT9MwDJuAnUWou3+JRWBNykYEOB5HAR1h5LIDcrs3oSYFCYkr7o
         hpJg==
X-Forwarded-Encrypted: i=1; AJvYcCU9OdWUeA4SfZHb+wfCodIaRZt1tUjTEohsD+eiGU+3WJ7JWNKK1Z7MLyy6+AC6xrE1/kSRO7hEYicmAXaNzERJmlypsON5Yy9sDUrVFWg=
X-Gm-Message-State: AOJu0YxLvQU6dyjVD4HPaNBJSIwbsUYEgdMiOklV1dtG2wGn7ctmO2wM
	HFZUnXMWYOZoSOmThToEvjlw31eVwrKGVf+JNMQmcZhfkgDwhzH86eDuNhmk+Q==
X-Google-Smtp-Source: AGHT+IH0kheLRJErklJaJgVykhVGrbQIdujwZOwUq/+KL+wnwNUFEWCbglvzqGF9VO774F5RHeS0zw==
X-Received: by 2002:a17:906:4083:b0:a62:c5f:e34a with SMTP id a640c23a62f3a-a620c5fe404mr103671766b.39.1716272225195;
        Mon, 20 May 2024 23:17:05 -0700 (PDT)
Message-ID: <3cfee629-b9bc-4b3d-9e4e-ff7e54e701d1@suse.com>
Date: Tue, 21 May 2024 08:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com>
 <alpine.DEB.2.22.394.2405161806560.2544314@ubuntu-linux-20-04-desktop>
 <e75ca24e-12fe-44ac-9c67-bcc222ac8752@suse.com>
 <alpine.DEB.2.22.394.2405171328250.1052252@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405171328250.1052252@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 22:28, Stefano Stabellini wrote:
> On Fri, 17 May 2024, Jan Beulich wrote:
>> On 17.05.2024 03:21, Stefano Stabellini wrote:
>>> On Thu, 16 May 2024, Jan Beulich wrote:
>>>> 1) In the discussion George claimed that exposing status information in
>>>> an uncontrolled manner is okay. I'm afraid I have to disagree, seeing
>>>> how a similar assumption by CPU designers has led to a flood of
>>>> vulnerabilities over the last 6+ years. Information exposure imo is never
>>>> okay, unless it can be _proven_ that absolutely nothing "useful" can be
>>>> inferred from it. (I'm having difficulty seeing how such a proof might
>>>> look like.)
>>>
>>> Many would agree that it is better not to expose status information in
>>> an uncontrolled manner. Anyway, let's focus on the actionable.
>>>
>>>
>>>> 2) Me pointing out that the XSM hook might similarly get in the way of
>>>> debugging, Andrew suggested that this is not an issue because any sensible
>>>> XSM policy used in such an environment would grant sufficient privilege to
>>>> Dom0. Yet that then still doesn't cover why DomU-s also can obtain status
>>>> for Xen-internal event channels. The debugging argument then becomes weak,
>>>> as in that case the XSM hook is possibly going to get in the way.
>>>>
>>>> 3) In the discussion Andrew further gave the impression that evtchn_send()
>>>> had no XSM check. Yet it has; the difference to evtchn_status() is that
>>>> the latter uses XSM_TARGET while the former uses XSM_HOOK. (Much like
>>>> evtchn_status() may indeed be useful for debugging, evtchn_send() may be
>>>> similarly useful to allow getting a stuck channel unstuck.)
>>>>
>>>> In summary I continue to think that an outright revert was inappropriate.
>>>> DomU-s should continue to be denied status information on Xen-internal
>>>> event channels, unconditionally and independent of whether dummy, silo, or
>>>> Flask is in use.
>>>
>>> I think DomU-s should continue to be denied status information on
>>> Xen-internal event channels *based on the default dummy, silo, or Flask
>>> policy*. It is not up to us to decide the security policy, only to
>>> enforce it and provide sensible defaults.
>>>
>>> In any case, the XSM_TARGET check in evtchn_status seems to do what we
>>> want?
>>
>> No. XSM_TARGET permits the "owning" (not really, but it's its table) domain
>> access. See xsm_default_action() in xsm/dummy.h.
> 
> Sorry I still don't understand. Why is that a problem? It looks like the
> wanted default behavior?

For ordinary event channels - yes. But not for Xen-internal ones, at least
from my pov.

Jan

