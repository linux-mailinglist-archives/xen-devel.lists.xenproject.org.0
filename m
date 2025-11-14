Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE5C5BA72
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 08:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162288.1489987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJnmZ-00074X-8h; Fri, 14 Nov 2025 06:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162288.1489987; Fri, 14 Nov 2025 06:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJnmZ-000736-5r; Fri, 14 Nov 2025 06:59:43 +0000
Received: by outflank-mailman (input) for mailman id 1162288;
 Fri, 14 Nov 2025 06:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJnmY-000730-Aw
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 06:59:42 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df408a3-c127-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 07:59:41 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b73545723ebso258814466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 22:59:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed90c0sm323456966b.65.2025.11.13.22.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 22:59:40 -0800 (PST)
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
X-Inumbo-ID: 7df408a3-c127-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763103580; x=1763708380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YUJJ+xa0sGTQFOrlO6Vlfi9dZfXhp+5ABnjAmn+IZS8=;
        b=O11/wbChSsQzWGEl7dTHCFecjQfs/HaVGUNHI1WxY2JvxOZ/byPitCUAg6OD6JqODi
         pIcLnZcpXE0pqmxxMuSyjugNVts7kk3iVSBWiJcnJksHEQ8T3F+UZrsdpQZ3z299KQ1e
         KIFlWLKiE/80JnPkv1OQADg5kHdiU69j5pskuu3u7e674N6l8VrLOZ1kk8PiN9NzI2Ny
         E+b2qO25mE1r8vaOEVKSQeKaQY+CHXM5cEFlD2VKsE83RV8ybRN25RSKUPmj7+ue7CIQ
         2SMwLHAw0vIuWICoA0dR6GnLves8XO5/AZPOAUbmAnvn9jHdB3LxcMPqwiARl1Hrf89X
         ij/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763103580; x=1763708380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUJJ+xa0sGTQFOrlO6Vlfi9dZfXhp+5ABnjAmn+IZS8=;
        b=mAs0oZkFg/R3T2jNiOuLVlUVlggabA+Fg/Q1bqJWPAEeZi1Ys4jPF69qjnAMoko0sw
         Mv/ogSfYEyypcpTQED7xzgSkijErvDYou1V9cEN+nut9Skqtn8XHSU1YxFDuGq4Vb9ia
         4uzc4eUnM45jkp8Y5W4+zkHw0Kq+Y1NCR5ieDzaQs+y3zPkBmH4uBsW1NQYr0O8F5BfP
         c/dRuDWrkeARm4A8rFHSYVRKthoHcXvXzH4Bt4lpzW/ERGOK2lczLk4enPoRhDlWs6O4
         y5Zun+h62ei6UTKBIL421x//TLNSiJi7fOFcAMvWAEuErmczebhsMMfFSk1Fpq0l8uTv
         9zhg==
X-Forwarded-Encrypted: i=1; AJvYcCWi0OQyYSXSBzPmXezMZlT8yKfQhEnmQNOJz0pi1cJk3ryFec8X9+yCM2O80m+1cbZja8qaZ8UQfV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfvYn7F3T9cVJ9J8QfoGvCAiEYvNpihhkYBUU7SfYkaiSnl4b+
	OF77KthSdMr2i42RH3SjPH89YchlZTp/wK212CBCAF/YsegU/rtJTyi9J7884fYfPg==
X-Gm-Gg: ASbGncumGaWug3jcFXF5NZgZbEnvnFfFecvHCFgupl9B/ThK9WjMhyC8QUcwgUUVv4Z
	6VwlCjeXaPP5JetFDcGVHY8endX6VENc1hpngdWPY1szeDaEyHmn7Y+D7Eps7AkOAcnVAWijUt8
	6c7XZBaD+Im3S+m4ow4LQ+ZFAk9q8L9HvXWID949Huh71pXgqpcLM/9m47iJAEfZ/ZBOZk3pLKy
	2zooiHEYpOirT/bKpxQTAoTXtWWLSSBpDPFOyOn8ZLQ0pHl3KOeAjeVQmhPFYmxkHqoMpV12SYX
	FHyVIgxWGIAnDN5pbEfescox5zYc1+T6S1vYyvLNrjP475BKqal3hFKu/JszEFhUHjF6rpcbPel
	Yrx+PxUdC/QTOj1WYRqu050u6CaCeT1cUhgwG0Xx9ZirRDzJZ4Ayg2q0cdAHRL5pZqJUExHXd40
	f5c2b/YZH5y1/I7Rnco0mccvV6sCu8fWFn48nG0UxppdXCwVGVX+zOXB8o0Wbke13s1OmQiZS+E
	X+e0m9wGp9o0fO+fQF9FVhR
X-Google-Smtp-Source: AGHT+IHqI21Ig8fZIC6I8uTx6uOUbqxIgnNd7NhIebn2U5FaAkFre3m96MPojxN8tY89suwFi016Ow==
X-Received: by 2002:a17:906:fd88:b0:b72:9d0b:def4 with SMTP id a640c23a62f3a-b736788f991mr207274866b.18.1763103580519;
        Thu, 13 Nov 2025 22:59:40 -0800 (PST)
Message-ID: <6cdf4053-6547-44a1-aea6-ac1ae337e6e6@suse.com>
Date: Fri, 14 Nov 2025 07:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] build: add new make pattern for making file from
 file.src
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-3-jgross@suse.com>
 <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
 <6cc9926e-ec22-40b9-9711-e89f1d8f3087@suse.com>
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
In-Reply-To: <6cc9926e-ec22-40b9-9711-e89f1d8f3087@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2025 07:18, Jürgen Groß wrote:
> On 13.11.25 17:49, Jan Beulich wrote:
>> On 11.11.2025 17:19, Juergen Gross wrote:
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -159,6 +159,20 @@ define move-if-changed
>>>   	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>   endef
>>>   
>>> +PATH_FILES := Paths
>>> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>> +
>>> +include $(INC_FILES)
>>> +
>>> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>> +
>>> +define apply-build-vars
>>> +	sed $(foreach v, $(BUILD_MAKE_VARS), -e 's#@$(v)@#$($(v))#g') <$< >$@
>>> +endef
>>> +
>>> +%:: %.src
>>> +	$(apply-build-vars)
>>
>> I'm not convinced of having this here, rather than in less central places (say
>> under tools/ and docs/). I'm also not sure I really understand why it needs to
>> be .src - can't we stick to .in, enumerating the specific files that want
>> generating this way (thus avoiding accidental attempts to re-generate files
>> which need generating a different way)?
> 
> With enumerating the files to generate we could probably stick to *.in.
> 
> I'm fine with moving the rule to the tools and docs makefiles, but I'd
> like to keep the apply-build-vars definition here in order to avoid
> duplicating it.

Oh, sure, I indeed meant only the rule to move.

Jan

