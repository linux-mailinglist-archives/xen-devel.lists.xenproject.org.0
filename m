Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD46DC64340
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163797.1490861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKykn-00048H-D6; Mon, 17 Nov 2025 12:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163797.1490861; Mon, 17 Nov 2025 12:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKykn-00046L-9t; Mon, 17 Nov 2025 12:54:45 +0000
Received: by outflank-mailman (input) for mailman id 1163797;
 Mon, 17 Nov 2025 12:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKykl-00046F-M3
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:54:43 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9564fb9c-c3b4-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:54:41 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-641677916b5so7690117a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:54:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad44b4sm1087418266b.28.2025.11.17.04.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:54:40 -0800 (PST)
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
X-Inumbo-ID: 9564fb9c-c3b4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763384081; x=1763988881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=azUTTkjuzK6vEtrEgi2Y+qwm5iUB8cdU6DE096wgHNI=;
        b=RBjfU3q/wWIzorKf0zQb+RM/L1PEqX5Bn80MicJh2IQsPq7349QMvzW9yvK0BfEYu4
         bgpJvYubOtyTjE61WNVVmPWHxhTcUuo8OkWuUvv+gfyqZnajlXcP0rQCy20uSQCHluQH
         fTIzOcSS6IhnoAiO/z7vUv5wsv+jbckobWv76qfvHqjGIgQBKtjAb/CAWEotaNphXtqD
         igjGv3HkVfIG6+XXq3gN8TLn/yhmD0ZF3biC2b5GJZYATRxIeuOaGjTK9F8KFW6MNSvO
         avr6bbL4CWwE9QEkKH784X7+zEkuVcC8krTzjWyrsGyDzXKyMTFPV0/ULfqTmnsY1PlH
         PrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384081; x=1763988881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azUTTkjuzK6vEtrEgi2Y+qwm5iUB8cdU6DE096wgHNI=;
        b=Ubg2heoMm9Mcs1ZKxFb/qFKKI5nHW3h3i+CaX0Vcb1EVIczVdEq6CEl9DXJUe3q9Q9
         BT/pkLJSE5q6K9bUfI2Xwg8BLRmqOOh/Wy8tttb0N12xwbBCv0lrCyZVFHo/plMKS1im
         GFj3/pyNS7ahGDcH1AD2c3L2JGoLfqyZI63ul5jaL9sxxhU9RPCyhZAJkW9sREwWbTAx
         H90rcf4W103AQjq74jxwSaSmTrm+HaXseHXMfiYKNzrQSB/k7kUp2fg5lSdrk9KYaOeN
         Qkk4/tDM8Fkxftg5SAYefDz3GVn2wYn5qMZEObTVFaVWpZ77Os2cFhkcAZZOQ+SMiLit
         Yxpw==
X-Forwarded-Encrypted: i=1; AJvYcCXLnnNL74DI2EQzz3ReHfnWdqGY4lSd5FYFIm6PC//OxHhM1mkaCrsP480rYq7r7yLYysiOvHI5rkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXd25z47n7j1EQl/SvWEv9lZuxjP9l9GJ9ax+Kwj+qhuNWAf9k
	vll5qIfbrPKabQ7F4e7GdJ8IGqC00U7KESQ1JALD2kp+9L0nHMIm/uB4/zKWkRLjtw==
X-Gm-Gg: ASbGncs6UFUUfhLQWKH4b+cyabikCIQskdWnEMTNPie3jdxPsNv2KnB0L9EEknkyvaj
	+dgKH4bpVXfQ7P4FNOoO8pcS/LVKCpkOciXaoptOaRCJgsNTzsto5Drua+0BNAPm1wlSVCn/IZE
	AzGOt0luLA64iFO+oFpgbFLULrM31HpOrvs1VqDBkoh4uwhWiH+pWAFScuV4r8LVKiajtwp9lgJ
	brpCEY04FuvomMhvkySo1LDNqxodl8V9rKbM1BhdrAKeA7jyCw649O4VVCUirH+Bl1kO3EuBu+k
	WQNDGWVJpRXKX4+Kue7P+WcnjICfvEmfyRoAn8qsbqARpLTTg9jRJHNAwEtdZQL2xk6mI89nyXV
	i+OWWbs+JeFoQMxMB6PrC4Vd1XBz2YtD3NGOQi7c1C0yGbhFC96S0dPnFGOLKTeqJcLrC5Yf151
	bvTBVcONNCIY+m88b7iPrwPA3CDRME4wMzU+W6dBxrRZfKGVxnIEjExWkg86z5P9ICm9oV+GTbx
	eE=
X-Google-Smtp-Source: AGHT+IFg/jUYp6o1TZzpZKDFNuZ+/CiT0VXtLdtvAM6y6c7slxW00gG1zn6XcStFsAMaprdl1kaZWQ==
X-Received: by 2002:a17:907:2d1e:b0:b73:7964:10ca with SMTP id a640c23a62f3a-b73796417ffmr852671666b.61.1763384081149;
        Mon, 17 Nov 2025 04:54:41 -0800 (PST)
Message-ID: <f42863be-aef8-4a7b-915b-235bd89a8341@suse.com>
Date: Mon, 17 Nov 2025 13:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <936632a3-d713-4183-b1db-5a554b617b74@suse.com>
 <7577ceec-1271-4569-91f1-fd7197a33991@suse.com>
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
In-Reply-To: <7577ceec-1271-4569-91f1-fd7197a33991@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 13:48, Jürgen Groß wrote:
> On 17.11.25 13:29, Jan Beulich wrote:
>> On 14.11.2025 12:32, Juergen Gross wrote:
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>   	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>   endef
>>>   
>>> +PATH_FILES := Paths
>>> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>> +
>>> +include $(INC_FILES)
>>
>> Is any of the above part of introducing the macro? "Paths" is already a
>> specific case of holding patterns that want replacing. In turn ...
>>
>>> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>
>> ... it's not quite clear to me how it can be $(PATH_FILES) here.
> 
> See patch 4.
> 
> PATH_FILES is specifying the .mk files containing the marker definitions.
> I need the ability to have multiple such files in order to be able to let
> tools/configure build its own definitions.

That's a good example - why would that affect the stubdom/ part of the tree?
Imo what pattern file(s) to use wants leaving to the invokee of the macro,
not pinning down globally for everyone.

Jan

