Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6682C80276
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170330.1495401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUXw-0004hb-VP; Mon, 24 Nov 2025 11:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170330.1495401; Mon, 24 Nov 2025 11:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUXw-0004ev-S5; Mon, 24 Nov 2025 11:15:52 +0000
Received: by outflank-mailman (input) for mailman id 1170330;
 Mon, 24 Nov 2025 11:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNUXv-0004QV-GB
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:15:51 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef0e42ee-c926-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 12:15:50 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so39945045e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 03:15:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f363e4sm28250572f8f.12.2025.11.24.03.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:15:49 -0800 (PST)
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
X-Inumbo-ID: ef0e42ee-c926-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763982950; x=1764587750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioMhFoif+5O6C4qx7tKzp9zUSf7aRv74IUW+1tkebE=;
        b=Brt09NvC2jecIdEzC7BA4pqsdIgbDmTyEmeZB4sMe5ZxYuJQzlVoZK1gwCFGxcQFyf
         3eHGowwLdb9ino9bRbXyhaAJ2PrwwF8fQclZ/YDyuotDJ8senteOqFOghOKlaD7R0EfM
         apvYBTz/NCrAdMzPNS1LiDxs5bPkYVwSNjyN9FtdVTV1wLuxKSm7O2YjFecOvjvQrfLu
         Fl1GmNiTfUT86wipxJ8hNpWJjF5idGBBGTBP27WWM7zsPh/GL4ZGpzA5qVEf7x73E7Lz
         BPQXFR1Q80ev4eJV2bXbW5emWbuGgkm5OdjM/dUM8pTTKyUBBGr9OIvkoMaMDGhtNxZs
         AjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982950; x=1764587750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ioMhFoif+5O6C4qx7tKzp9zUSf7aRv74IUW+1tkebE=;
        b=gXSZnkeYvGj47kPHSDXwcRnsLNYsty7dNRscVSgDugjemPht586uWLTRRo2Y22elXp
         3rCtKK+FHL6mTZSPKVy2sw/+WSmUeTdGdlESEmHJB+rW7Y4YldgSrZnIg+IFPEVuY/D5
         j7TiLOS00dw4Q7U8VkBb3YqMwVkwcWOt2+ZYykgCHw0nPfVrD6fLZiE5EFMmLdEpOnSr
         7T+yk/SjEaZ0iy9Iuyxq9CjeReRa0gRDU/IbrwSMPTeXMHKxL80rY3pANLx4oGAqPYfv
         bo3U4pTqVdiiXskfVxSKdO+y7i62iU4rC8UxeyMVR3f50YM7PqKfT3gX7bJbL0W4PRZZ
         19GA==
X-Forwarded-Encrypted: i=1; AJvYcCUI5mcdts6T39FebvOQD0QStTIKbihfaIwrqyxtA4JtfWdw1MZsS0l3zubwxjmvAGe75XvnsYeISsc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg/b9pthMkeffJ1iZrARy+PhAZP91uRkVrHXuZWEU5Avm4FEkx
	G61hYbFUY+jrEi6jSohwh+USQaMTF9DoURjlLrrgYrJSpfItyuXPDAzFIbYlvJSXrQ==
X-Gm-Gg: ASbGncsNjG5C/IcNFr4Gx9BIEztPICacZtv+bXauUm0z1J62GZ1BE5SQODZRcvNEYCD
	v5QOTuyULN08GxqAhYOJDj2qvoCk1TM9JtZjvmifKyfRN5yrnzfCtOPZcmBGE53BRtN2Wb6arBK
	55vQZVQC7gerhlE5hLKK2iXNQ6JekQqncTlGX2kSy2QdBHFiszrGVA1SVxRIo842ZQAe1xRa0SK
	+CTDrmowkOQa8T7k+EhGI0AqY/aWVSOVfgehJkNXtRPmezzPARAAPGIDsMlq0lLuSZanyvP9ldj
	c8q7VZgb1POrRAh7P564/rSFrwcOcIoDoniutdSmoA+/oMDkGwK8JFq2lZ0trWFDpUV2d/uVsTf
	IBDPE00etVpRBcnY5oEpUBlsUJVmV2vLr33IyCkyVJH0j6tuj2ldkI0zw1aVhD9z9549aesls06
	Kv2ZViE6JyRTa64SE1Q+OzfZPsezlQ2EPp9dyqaqFJ7/ijDoL7XW6hTCS9IuXiIOyi9lbvDEiog
	kjNYxFUB0vhow==
X-Google-Smtp-Source: AGHT+IF26AafMTxf51I4M/afjpLjU2ZKXHfBUvYQT9kiUq5C0gZlzX3PZSQboVyvESvP/hE1fU4X/Q==
X-Received: by 2002:a05:600c:8b35:b0:477:832c:86ae with SMTP id 5b1f17b1804b1-477c111b94fmr133538805e9.12.1763982949923;
        Mon, 24 Nov 2025 03:15:49 -0800 (PST)
Message-ID: <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
Date: Mon, 24 Nov 2025 12:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
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
In-Reply-To: <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.11.2025 12:05, Jürgen Groß wrote:
> On 24.11.25 11:41, Jan Beulich wrote:
>> On 21.11.2025 14:23, Juergen Gross wrote:
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>   	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>   endef
>>>   
>>> +PATH_FILES := Paths
>>> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>> +
>>> +include $(INC_FILES)
>>> +
>>> +BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>
>> Feels like my prior comments weren't really addressed. I continue to think that
>> none of the above is part of what the subject says.
> 
> I really don't understand your concern here.
> 
> For replacing the @markers@ make needs to know what should be replaced.
> So it needs to scan the files containing the markers and gather them.
> This is what is done above.
> 
> In the final macro below the replacements are done then. How would you
> handle that?

By passing (another) argument to the macro, for example. As indicated
earlier, different sub-trees may have different places where these
definitions live, and they would want to be able to pass that in
(ideally without needing to put this in a common part of the tree).

Jan

