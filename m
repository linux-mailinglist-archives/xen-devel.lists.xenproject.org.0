Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C94D23E5B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204690.1519293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKQI-0006up-PE; Thu, 15 Jan 2026 10:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204690.1519293; Thu, 15 Jan 2026 10:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKQI-0006s0-LZ; Thu, 15 Jan 2026 10:17:50 +0000
Received: by outflank-mailman (input) for mailman id 1204690;
 Thu, 15 Jan 2026 10:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgKQH-0006ru-8S
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:17:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70157981-f1fb-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 11:17:47 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so437123f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:17:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6fca57sm4753210f8f.42.2026.01.15.02.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:17:46 -0800 (PST)
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
X-Inumbo-ID: 70157981-f1fb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472266; x=1769077066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VSpE9caEEZbUY5/RPFYcJU6rRkRT43oaDHagzRcqq/Q=;
        b=LP4L7N4cglmw40zPqoehEFqQMDmS6+Bn/m+0csvKcrLS9arK6DjUO6wMWgcEs4U9r3
         IHex3r9VTNy1+yOLleSBLjt572VvY892I+js/RGy4B3mQPUdVeNXsyUsjR7ny2+L05Ec
         20fNl5mLyfkx9+fZq8tGvypwOzTajxwEFk3mfDp5NzHNlH2WZJ/RyBrSbXRlsxPLXUn5
         Kae2KDpVpfBvfYxunyYUUMA7YtqfUB/k6awJznIlWLKfs1ZGZ1M0kigEeRbMw9NTP9gf
         jmLc7oo5P7pO8cch9DLypLduS2k89b0c0sK0DsZrj5jd0xjXUVjar0Vg/jcA2yKm/cnS
         yLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472266; x=1769077066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSpE9caEEZbUY5/RPFYcJU6rRkRT43oaDHagzRcqq/Q=;
        b=O2oYsQs1hbRW5oiB2hp2v53ewViV7cbqY4lmVlMEd/gOhKY0/TCwQDksnXYsGVSAvZ
         zvmH16rxj6xvaKTicL9+uqFHdnN984Pq78j6b/lI5Qlc7KusRhiEvrvho8wwm6rEG5Ck
         S8xzJ/bB9PjZSSRSRXQHhKSULv5LhgfEo7NOqNZrTKexwrkx+mJdi4PDOwhpKbjA2wA+
         HxPjMEdxicEIMSarUSD1Py0L9qjw7HvLENU5N/wSf2AbWLSu2fHRIO3YtGhtbkHidSJK
         xQjhmyK549cSNWNMKjU4RMazQ+sU08zcSRsgKUqT0qxmu/Lhu036Fq3A0q+MP/f5utY5
         XVCw==
X-Gm-Message-State: AOJu0Yytbv7HWS4MYNJ6QvqHtS9u5hy1ZwElKEpX/OmjNO/cdI1Xo01s
	d41QSUHwSnrm+GPXNW8odN/pwEO2R3Jl/b8tn/l8a1shl2KqEeyB8bE1mIg9cCrnE37EvtmuRSV
	EJmI=
X-Gm-Gg: AY/fxX57AZDtKAZvpq17tsgtcKAWGrykz+fh+9OM10eg2lOwXGAJy7Tfa8MTEz+GONB
	YUV6HufAkC/f9eCfuSEWNfnrf9xErQgw9M0I6YDfduIxbopwbPTWqkSh2vOcP7Hz4KkUKKGNHxi
	Hm83WnI9JbtBLD5B60HOZ+UOhPI1W5+DIvrrp1J1JRLQ7CsLkMZpTUDjkIhb1ABv+rsI5faDSdV
	BLx1ylK95S4bcmmTS97Hxqi7tUpl8ITpjeRB37GUelGjALv6aAihbMLg1ITVC6uTnVUmIG7J6qt
	KvGfDOjhTvFj+AZWptaXgoWSjRi0VSxIK5ulL+X1/A/JWzjfsLOhitpzDjDEM9QAJAxy80Odf8v
	d+OFg43D1bzlubJJfxUZQ5b5BnKiLBsuolBFtRBlL18Y7sQ9WD9quVvucrOYApYqSeGzpWDmEXI
	cpA6RdzJP6yQolqtlSHf14UCe3+GvIYPSu6X/GjFwvaB3ZAUgbNaHHxDhMhjwq6nypPw5w/uBMW
	Zw=
X-Received: by 2002:a05:6000:2511:b0:430:f1d3:f96 with SMTP id ffacd0b85a97d-4342c4f4cb4mr6329137f8f.6.1768472266364;
        Thu, 15 Jan 2026 02:17:46 -0800 (PST)
Message-ID: <2012453e-d09f-4da0-bdfc-8487cef278ef@suse.com>
Date: Thu, 15 Jan 2026 11:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/mce: use offsetof to determine section offset
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <350bd19ec4b0b190911d748df6ec92c626e7151a.1768415160.git.nicola.vetrini@bugseng.com>
 <87de17df-0aed-4ce1-b556-f93a381b66d3@amd.com>
 <a351802f6e1dff22f79cc7dbfd848aac@bugseng.com>
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
In-Reply-To: <a351802f6e1dff22f79cc7dbfd848aac@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 21:56, Nicola Vetrini wrote:
> On 2026-01-14 21:40, Jason Andryuk wrote:
>> On 2026-01-14 13:27, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/cpu/mcheck/mce-apei.c
>>> +++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
>>> @@ -74,7 +74,8 @@ int apei_write_mce(struct mce *m)
>>>   	rcd.hdr.record_id = cper_next_record_id();
>>>   	rcd.hdr.flags = CPER_HW_ERROR_FLAGS_PREVERR;
>>>   -	rcd.sec_hdr.section_offset = (void *)&rcd.mce - (void *)&rcd;
>>> +	rcd.sec_hdr.section_offset = offsetof(struct cper_mce_record, mce) -
>>> +		                     offsetof(struct cper_mce_record, hdr);
>>
>> "= offsetof(struct cper_mce_record, mce);" should be sufficient since 
>> the offset of hdr is 0?
> 
> Yeah, makes sense. Given that the struct layout is coming from the UEFI 
> spec it's not likely to change either.

It's okay either way, but I'm happy to adjust to the simpler form while
committing (I'd slightly prefer that, precisely for being simpler, and it
being close to what was there originally):
Acked-by: Jan Beulich <jbeulich@suse.com>
(ftaod: either way).

Jan

