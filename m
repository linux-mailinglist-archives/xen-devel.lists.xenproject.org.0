Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD6969FCC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789238.1198790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slU8a-0002Di-Ve; Tue, 03 Sep 2024 14:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789238.1198790; Tue, 03 Sep 2024 14:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slU8a-0002Bq-T4; Tue, 03 Sep 2024 14:04:04 +0000
Received: by outflank-mailman (input) for mailman id 789238;
 Tue, 03 Sep 2024 14:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slU8Z-0002Bj-Td
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:04:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f43135a-69fd-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 16:04:01 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c263118780so1603109a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:04:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226cd18a3sm6434980a12.66.2024.09.03.07.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:03:58 -0700 (PDT)
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
X-Inumbo-ID: 5f43135a-69fd-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725372241; x=1725977041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/+h+dew1kVwMShOWZYQ8EoE4EFghlVxdQElcSUFx0Ho=;
        b=e1KDtubgtW0WrCnr0D2J07CRnJswlGKTccQCD+afEbidapOy93IJA5kz84GNaWxSbL
         MuIym4NFvHyW9yD1c5MKYbltfVPb8SgWCAfgYu5wZiEPuYOXIDDta7UJvCwkj0B/Cq8T
         e2Ksziqhhyttnjvxx5inK35c41PXjwu2bv7k5oj6QNNUvxOKpJKu0qGIYqAhgdTDbqIX
         Lws+9nkp1bBeI0V4yHB4/iu0xTlAsDhIGTlGeuPAAAfzLdISS7mdkqZjN2SOgeLYtSuz
         FiYNEKsSP4TAJAPpn6eqfpJEU409cYrkI6AvPR2Amferd9ArXyKOQ5wwHRnyy3vjYbFX
         CXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372241; x=1725977041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+h+dew1kVwMShOWZYQ8EoE4EFghlVxdQElcSUFx0Ho=;
        b=kxZ59S9bbA9OvO1Bl83fvnxRyuIHhLIa3R+QwIDZ8TJ3gCNOAQIC0jxfTriYPGhY3Y
         yxdp/h4kmNK+9Q/iKBxXaylm9vcZk3KVeMBvXFaf/CTYpwgZExUGMw6mJSFUmweAbYJI
         y55tPQEaHnJfEmEMZzvQzPjDkkXhcvvvFV2ppFX4WRIybbekCQzekdTyi/4ulf2lLByb
         tFvC53DxQFlA9C4qlrPCGimaLI6j5obgSfmQALGiwdb9EnN6zmnWmQJGv0sejz438fcN
         U++EaVnyxhAxDHxsm7dRxiSq43hbXzei3e7YbLRuzMFyKXtgg8p/0DUw/hkiSBYbxIbl
         uD3g==
X-Forwarded-Encrypted: i=1; AJvYcCWjBjXhXim+VoAX8qo8MmLT4nZ+w3EDjbMQNt/qRfo8iFQvk703UfKGhg8YYn0lq/d13kOTD6z/wAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMuNDHLt0v6htj77dqXRKbYtPUXlNnpZKUlN6GGl3hRCS09764
	XKHvFKgdXBVZzPQhpurn22JmWxDM7CEfmWrph3qGquZG6EkAZZi6geehpZikaOTUiFACp643n4Q
	=
X-Google-Smtp-Source: AGHT+IG4C9tFaGEZlW6TzDecqb7YMhS86jvD/AL+OV6icbxUN2zZzoJsJ8Y3CnjM2IAcg61O1fsUXA==
X-Received: by 2002:a05:6402:27cd:b0:5c2:4dcc:b90a with SMTP id 4fb4d7f45d1cf-5c25f274c50mr3507749a12.34.1725372239076;
        Tue, 03 Sep 2024 07:03:59 -0700 (PDT)
Message-ID: <9a20ad80-adb4-43bf-85f9-04f7f7742599@suse.com>
Date: Tue, 3 Sep 2024 16:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] CHANGELOG: Update after fixing dm_restrict
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20240903085311.49818-1-anthony.perard@vates.tech>
 <d4ed5e07-c938-4d38-a49c-5c451c0c3a89@suse.com> <ZtbfFlXZVfiMA8Zg@l14>
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
In-Reply-To: <ZtbfFlXZVfiMA8Zg@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 12:04, Anthony PERARD wrote:
> On Tue, Sep 03, 2024 at 11:20:37AM +0200, Jan Beulich wrote:
>> On 03.09.2024 10:54, Anthony PERARD wrote:
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -16,6 +16,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   - On x86:
>>>     - Support for running on Xeon Phi processors.
>>>  
>>> +### Fixed
>>> + - Fixed xl/libxl dm\_restrict feature with QEMU 9.0.
>>> +
>>> +
>>>  ## [4.19.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.19.0) - 2024-07-29
>>>  
>>>  ### Changed
>>
>> We had no "### Fixed" so far, and I think we also shouldn't gain any. Imo
>> this wants expressing in term of "### Changed", also wording the text
>> accordingly (needing to adapt to qemu changes isn't a bug fix, strictly
>> speaking, but more an enhancement in my view).
> 
> From our CHANGELOG.md:
>> The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> 
> following the link, there is:
> 
>> Types of changes
>>
>> - `Added` for new features.
>> - `Changed` for changes in existing functionality.
>> - `Deprecated` for soon-to-be removed features.
>> - `Removed` for now removed features.
>> - `Fixed` for any bug fixes.
>> - `Security` in case of vulnerabilities.
> 
> So, are we not following keepachangelog.com format? Is there another
> document/email/discussion describing which category are allowed?

Hmm, the absence of an Fixes section made me assume such isn't supposed to
there; I'm sorry.

> Been compatible with newer version of dependencies doesn't feels like an
> existing functionality have changed. It feels more like a fix to the bug
> "can't start guest with newer QEMU".

We clearly disagree here. FTAOD I don't mean to NAK such a change though,
it's just that I also wouldn't ACK it.

Jan

