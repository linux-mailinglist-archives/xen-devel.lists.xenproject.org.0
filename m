Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1085BBFC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683500.1063051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcPBL-000524-Bj; Tue, 20 Feb 2024 12:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683500.1063051; Tue, 20 Feb 2024 12:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcPBL-00050K-91; Tue, 20 Feb 2024 12:25:07 +0000
Received: by outflank-mailman (input) for mailman id 683500;
 Tue, 20 Feb 2024 12:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcPBJ-00050E-Rf
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:25:05 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d960cb-cfeb-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 13:25:03 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4126f48411dso3126465e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 04:25:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1c4c03000000b004120675e057sm7044964wmf.0.2024.02.20.04.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:25:02 -0800 (PST)
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
X-Inumbo-ID: 12d960cb-cfeb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708431903; x=1709036703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kE3Vbeq3mNcgQGuLeKzL4FwS7l8YmoQTCMH5OEiHNzI=;
        b=GgHcvDU+MOi9V+YZxSd5eM77B418DNHnxODU5TBOd8pYqyNuBOLcZ9/Yj2YCWwatO+
         1mgsnsXHNzeD2wflrjyxf2NxEQQDKJLiumQpjgKyCAwuF9Siz9sUiUj/ld70ObGMhe1K
         hIdeMewbT1//B8cA+lA/sP9ztEc5N0NWb2Rfa+/Qb9A31syCIUkMVgcKQC+hIhFHh+Tk
         yWohDn1N0cqOhS7HWW5v73Vfjr59tXz0BLL2R/4ewGGi2r2hZIJvTwEn1Tp54KQ/h6o2
         q7WDkv3lJE5qMlMGjNvqh2CDlmbrgLADXlBewg5qHlRhINhf3FOMf6s1296RNEjjggdK
         A+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708431903; x=1709036703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kE3Vbeq3mNcgQGuLeKzL4FwS7l8YmoQTCMH5OEiHNzI=;
        b=miHNZ7QQqwa+hKvYBB21vPNkmLfxFhUKp3c/B3U7Wc8WWWgEVZ0MW8vi+9/D9vbrNO
         Z84GnNv6afeokriMYZPcmNkr9lfg0TU0QLUFB8sQtv5TEKpcIIfAE0e32HIGsW6NVdCg
         9vmB4x3B/2KanfOdZQH5CykUcWsLGTk09TNuOhzEX6RaWMj2HbCWLmYx9QVC1XDXVQz0
         2E4DuR4hptHCluiGHehPVZg193GFY5wDTdBGqOetUFZ9jhOxFO32TWg552+1LKdwFsst
         DM642kp2VENo/FwDLmA9WwdnT2lrQQspmBQFnEvfe3lwvxjLinK6rcxVR3XqlWX8It8r
         4uwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiR0LCoqnQ5o8e7aieegCKs6ZaAu/ZvcG1oz9H9FBVI9y/4hADLfr0Ta/k4zu5PATi+pqxHEvZwlxu2eEOubw3PQoGyWHe7rbm4ZLsgFk=
X-Gm-Message-State: AOJu0YyN+3q5hnRmrv/WK1KIQceEK0ppduxppEntwOwGZQx9oam6Xq0S
	vB1IsXedfxpv6F/dmlTdKX7DVQ3+jqonLVq3dd4qdMxrdkVnmWkMosoypu/bJQ==
X-Google-Smtp-Source: AGHT+IF1DKRZCgdB4ZuJfx7XTV6jtnBi3OKyPYlX9Ye7ndXpCrK9PsIiu1cBrmL4iCT5gf9hgIkfAg==
X-Received: by 2002:a05:600c:358b:b0:412:6e83:b89d with SMTP id p11-20020a05600c358b00b004126e83b89dmr1527115wmq.8.1708431903199;
        Tue, 20 Feb 2024 04:25:03 -0800 (PST)
Message-ID: <d0090122-c013-4dbf-97a2-3003352433a1@suse.com>
Date: Tue, 20 Feb 2024 13:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
 <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
 <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
 <a2348c5f-39ce-42f3-ad2a-a5edf88352e9@xen.org>
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
In-Reply-To: <a2348c5f-39ce-42f3-ad2a-a5edf88352e9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 12:52, Julien Grall wrote:
> Hi Jan,
> 
> On 20/02/2024 08:26, Jan Beulich wrote:
>> On 19.02.2024 23:22, Julien Grall wrote:
>>> Title: I would add 'gnttab:' to clarify which subsystem you are modifying.
>>
>> That's how I actually have it here; it's not clear to me why I lost the
>> prefix when sending.
>>
>>> On 05/02/2024 11:03, Jan Beulich wrote:
>>>> Along the line with observations in the context of XSA-448, besides
>>>> "op" no field is relevant when the range to be flushed is empty, much
>>>> like e.g. the pointers passed to memcpy() are irrelevant (and would
>>>> never be "validated") when the passed length is zero. Split the existing
>>>> condition validating "op", "offset", and "length", leaving only the "op"
>>>> part ahead of the check for length being zero (or no flushing to be
>>>> performed).
>>>
>>> I am probably missing something here. I understand the theory behind
>>> reducing the number of checks when len == 0. But an OS cannot rely on it:
>>>     1) older hypervisor would still return an error if the check doesn't
>>> pass)
>>
>> Right, but that's no reason to keep the bogus earlier behavior.
> 
> Hmmm... I am not sure why you say the behavior is bogus. From the commit 
> message, it seems this is just an optimization that have side effect 
> (ignoring the other fields).

I don't view this as primarily an optimization; I'm in particular after
not raising errors for cases where there is no error to be raised.
Hence the comparison to memcpy(), which you can pass "bogus" pointers
so long as you pass zero size.

>>>     2) it does feel odd to allow "invalid" offset when len == 0 (at least.
>>
>> I'm puzzled: You've given R-b for patch 1 (thanks), where exactly the
>> same reasoning is used, i.e. similarly referring to memcpy() to
>> justify the (new / supposed) behavior.
> 
> I realize it. But I viewed it slightly different as you are adding the 
> check. I think it is a good idea to add the check and ideally it should 
> be after.
> 
> Here you don't seem to add any check and only re-order it. Hence why I 
> treated it differently.

Right, there already was a zero-length check here. Just that zero
length requests still could have an error returned for no reason. So
the "optimization" part that you're talking about above was already
there, but as said, that's secondary to me.

Jan

