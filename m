Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3355B2EF46
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 09:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087862.1445664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozZ8-0006Tl-Rh; Thu, 21 Aug 2025 07:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087862.1445664; Thu, 21 Aug 2025 07:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozZ8-0006S8-Od; Thu, 21 Aug 2025 07:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1087862;
 Thu, 21 Aug 2025 07:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uozZ6-0006S1-Ly
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 07:18:28 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 086457f3-7e5f-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 09:18:27 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134609so887484a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 00:18:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a758ba909sm4664987a12.54.2025.08.21.00.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 00:18:26 -0700 (PDT)
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
X-Inumbo-ID: 086457f3-7e5f-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755760707; x=1756365507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kz+RuHL5NbWZDZeLRhEolggsKwd2SDrW5HcEjJlmTtk=;
        b=c44ad2wbTARMGeOWIOr6CwpvFsd6gofwLdh++BE/jn3JFfSTeuXGEaw64/2jH8MPQ1
         iJ5bc1Wdx3I7hi31VFci9bqR91jueOPMh5tO9eRfSDceo3VLkhK/pwaMQTdnOuzkRBVj
         6D+73TK6HRZxxVhnP4xhuvDmYkeDdYKKgjsv2XbDYGNpEIe2eBzjxXVVhe7lpm+YVnmj
         sPYW15n4xwmYNw32xj3vLh3IjpUTIwNa8RJyUE9hGpfoAB9BvXIcxIwMAsP57dJXqvYE
         9i9NBH9TrfP+X1LwfnNmzJyDuKiY030zYDgWFRJKz9ZyMRIErOkbXrbtkvKAkJ3Po+kE
         T2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760707; x=1756365507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz+RuHL5NbWZDZeLRhEolggsKwd2SDrW5HcEjJlmTtk=;
        b=cCYGPG/0htvbmPTXKEk8ztK596pngm1ql4jIkB384Bx0q1F0oSu5RbT0PlWPU+lU6q
         1AWdMM9eNRS/8OYUmnkKcYMlBf/EtrPzNt8lgLlEJSFBXZhwT+fwHNYo7rRjrgRiAgi5
         OXeBjODUMVw3tjIWL6xjIjsbsTjnI8Ig0LhN0CzaUo2dboF98+q8wSO7UKoHHYAQ/1l5
         ypBsvvLkEQrGgRjAHvzUY0Xz6UJOZJxVtJ36BavjOqQnRbQXgf6yGU9QLXlJF+TafGfs
         sHXWmPC67YAmRh9TYjY8iWHhqi1HGC3MQmWsrq7Vk0L8K3u/ueaeoQA9cZZW/4LRUY+o
         eNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjrl9Cg9YH0JigLN0NDOA3AoDJq2FIES5WwQ496Eaw8CVesFzPomHmSIuvlnuYag5998ZpVbapYNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIV5yYNLcTOGNZsIE8XvQp3bct4Yd0OeZy8PdgYNTDGX6VQLmn
	UeanSMlDiHklxVi2FJyo6VqoLnFWOkY0TjR1RfDi/qPbL22xWBF5NidyTYUXMqosEw==
X-Gm-Gg: ASbGncuHhcE75noQcOp3sApWxdifVChb1QSWfArWDqKiTf8S3KLBEnN+3QllDz3SAxH
	MIyFKby2SK+HPGJ9mRdi0J+oEWuwCVcnxfOFK/xUzmGhsGdaBWXf/3sKbXzxxbfV/JidI+03cev
	z7bRzDS3Fe/VBqVZ3se6D59slgsKbPKLAlTjTDFJ6Yoe3zS/QVBJ8qxZzjGZyBG9YMw/5LSgwvC
	kruq/aug1gMB1NieDHld5CwOj46fk6SdE0CLv1v8nPUjvW2AslrQz4nAD7VJoNxgTScaApjstXM
	d0xDBBh+T7GNaqvtbHDEPAC9zzmYmfWZEEtwzYMBjeQHHNp2mILPSox4BmAOjgwvdjnTTRsQm1n
	+hEPBLyBERginpDC5t+LaRtUOudR1Spj77aakD7A8hXB8uY01EVZg8ozOnXmlmDULvJ0eo0iKGm
	vfr78r4z4wX4PVApnkfA==
X-Google-Smtp-Source: AGHT+IFnhY6ipdZRyLg/W/m8tWp5tJc4E8cddE4qFes2yss5vL8xaq0O66xCBS7EtGaMtS022eQzkA==
X-Received: by 2002:a17:907:3f8f:b0:afd:d94b:830f with SMTP id a640c23a62f3a-afe07d482d8mr113051366b.64.1755760707085;
        Thu, 21 Aug 2025 00:18:27 -0700 (PDT)
Message-ID: <43f0c9a6-a4f3-44e0-959f-a021ae3b0466@suse.com>
Date: Thu, 21 Aug 2025 09:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
 <DM4PR12MB84519FE74D66604440827EA9E133A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84519FE74D66604440827EA9E133A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2025 05:12, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, August 18, 2025 4:31 PM
>> To: Penny, Zheng <penny.zheng@amd.com>; Oleksii Kurochko
>> <oleksii.kurochko@gmail.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
>>
>> On 15.08.2025 12:27, Penny Zheng wrote:
>>> In order to fix CI error of a randconfig picking both
>>> PV_SHIM_EXCLUSIVE=y and HVM=y results in hvm.c being built, but
>>> domctl.c not being built, which leaves a few functions, like
>>> domctl_lock_acquire/release() undefined, causing linking to fail.
>>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE
>>> Makefile /hypercall-defs section, with this adjustment, we also need
>>> to release redundant vnuma_destroy() stub definition from
>>> PV_SHIM_EXCLUSIVE guardian, to not break compilation Above change will
>>> leave dead code in the shim binary temporarily and will be fixed with
>>> the introduction of domctl-op wrapping.
>>
>> Well, "temporarily" is now getting interesting. While v1 of "Introduce
>> CONFIG_DOMCTL" was submitted in time to still be eligible for taking into 4.21,
>> that - as indicated elsewhere - is moving us further in an unwanted direction. Hence
>> I'm not sure this can even be counted as an in-time submission. Plus it looks to be
>> pretty extensive re-work in some areas.
>> Hence I'm somewhat weary as to 4.21 here. IOW question, mainly to Oleksii, is
>> whether to
>> 1) strive to complete that work in time (and hence take the patch here),
>> 2) take the patch here, accepting the size regression for the shim, or
>> 3) revert what has caused the randconfig issues, and retry the effort in
>>    4.22.
>>
>>> Fixes: 568f806cba4c ("xen/x86: remove "depends on
>>> !PV_SHIM_EXCLUSIVE"")
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>
>> My earlier question (when the patch still was part of a series) sadly has remained
>> unanswered: You've run this through a full round of testing this time?
> 
> Sorry, missed that, yes, it has been tested with both default defconfig and allyesconfig.

I'm sorry if my request was unclear, but with "full round of testing" I in particular
meant a full CI pipeline, plus (given the issue that's being fixed) some extra
randconfig testing.

Jan

