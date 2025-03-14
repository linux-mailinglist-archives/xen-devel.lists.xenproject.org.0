Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D9A60951
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 07:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913785.1319672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsyr1-0008Rm-Lh; Fri, 14 Mar 2025 06:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913785.1319672; Fri, 14 Mar 2025 06:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsyr1-0008Pc-Ib; Fri, 14 Mar 2025 06:49:11 +0000
Received: by outflank-mailman (input) for mailman id 913785;
 Fri, 14 Mar 2025 06:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsyr0-0008PW-6x
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 06:49:10 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c85e59e-00a0-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 07:49:06 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so1004461f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 23:49:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb62ccsm7127315e9.7.2025.03.13.23.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 23:49:05 -0700 (PDT)
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
X-Inumbo-ID: 6c85e59e-00a0-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741934946; x=1742539746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aDYBP5s0KcIGVf4+3ZAh1FmuEIkAwb5QIXmwhO4kw5U=;
        b=dopPaTQ7PeqU+Q1oJQx/42jGhmkQ5il/l0Q5KH3Tz6aZc1dxNl1DFPBVtKGxs3xYzf
         auw97uRhf3WTwFYAxnzdPHAVXw6JQ6p6HRF6epo5RrVusYWUPlIK92mzbH69nd3egOGU
         j++97J06XAf/lm70TQLXKXWpJx2GEMkHIea+EzTkmlfUyrjtqKK3XBjMXWqfm4plPW8r
         GtTQFmAM2YElK+q6SUSQDFTmZrovNGDoawen9qq4kbJ7gUH3FfdsnjxgbRFlkPm1Uxln
         lqWsdNqxodc6nP8opZVxCUVKWlvFc2GMVaxXe5viQdwJfMzDjY1A0CD10z9mZ8lknhSn
         q7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741934946; x=1742539746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDYBP5s0KcIGVf4+3ZAh1FmuEIkAwb5QIXmwhO4kw5U=;
        b=esBXZZdd1lFB6d4WWyOgKHGpaXB6emu9nmNWaDj/AxpaVuQWy9xpBsuxHWcCgpfEE4
         c51RV/6OM/8q3OfC9WVuzCyYUqIq97LlMWT4zPxz/Mn9JI/E+fFbEwRByQ2dTdyjKW7O
         kCgeth5WT5CN59rywskSnZdh0OkUqug96kdcyXojtpYz+rakfUBkjgb2VcjlbKLt+1i1
         Ry/klFR5CF2/JS2MLVZRUUmdJ9/uOHcmrDScHzl++iFTqQ3HKA0uxGaNkQ2UfkwLYOfU
         1YjoOC3w33arMKg44djZFD5qaMwTpqdgakZe9ajRkoH4nMeUL6e55+C0GavB3XMcIOIR
         iSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB/ztrFRREHq3vwwFgVwi7Fl1oEna0WhlqChQW9L6cS7uwiY05pO5G1xSSRrg3pXJwHYUDh1/GdNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvxJbiDXllWJQ46GfZ+RfyMo3Jyvbd+vnT+CQ7REHf7HOyvrKW
	cqyajPZA3t7YjJg3nP3Z2wO0F+iafoX4d2kJUbhGt+eMQTX1lmEgINTbIu4xKQ==
X-Gm-Gg: ASbGncv8N68/BPuY3Apgd5SkvdEpW0HMi7UJVZqd/I//JUHP5zaiWeV4gWW0RmMhnhp
	DzFNrDMBn1GKocjeQ2NDTBfFIr5hxtVbPMy0lMy2XkYTZdWmjr4YicEiZtihvt8Z6bEN1vDMVYZ
	Tz4EEOH+0fvifidg/SozWdcljRi3kkOt7suHrBfl1Tu2vZnubtH03Sw9SHP+2XRjuDLJI1Nwre3
	kl+9xo2+cGYSv9CKKPOn7K5pLVmsV7wlSDWktzyjs4E4f3h58ncZUj5wBBXvDDOovg8NiACK8+/
	t0ca7bZ+9kQVDUn9LXIuAFCle2Cltg5Mm1fQqw64y/pbb5kw5+gcVC49aTt+mCA3NNx5nxX6v7t
	9aPLk5vwDH58XtJMNUK/Rv0g3RQ1maQ==
X-Google-Smtp-Source: AGHT+IGawQTziwRyAOZXzvM0W5SIL9IAgh+HhfC4Mwk730PVfjhr9WBV5VT/l8NliyLOeFnA5dnEMA==
X-Received: by 2002:a05:6000:178d:b0:38f:2a53:1d78 with SMTP id ffacd0b85a97d-3971ddd8d44mr1595078f8f.10.1741934945875;
        Thu, 13 Mar 2025 23:49:05 -0700 (PDT)
Message-ID: <e016d8e7-e662-419f-a181-5bbfdc71764b@suse.com>
Date: Fri, 14 Mar 2025 07:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
 <b59ea14e-0bce-4c3e-b1fb-021b53af1780@suse.com>
 <d597523c-aa3a-4682-824f-e6e2f8ce753a@citrix.com>
 <61b762d0-d513-4d02-80ac-50fa12a725f3@suse.com>
 <b13543a1-4d43-4e2d-8fcd-08ec60be9dd3@citrix.com>
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
In-Reply-To: <b13543a1-4d43-4e2d-8fcd-08ec60be9dd3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 18:03, Andrew Cooper wrote:
> On 13/03/2025 4:37 pm, Jan Beulich wrote:
>> On 13.03.2025 17:28, Andrew Cooper wrote:
>>> On 13/03/2025 2:19 pm, Jan Beulich wrote:
>>>> On 13.03.2025 14:58, Andrew Cooper wrote:
>>>>> On 13/03/2025 1:38 pm, Jan Beulich wrote:
>>>>> I'm tempted to ack this on the basis that it is an improvement, but a /*
>>>>> TODO this is all mad, please fix */ wouldn't go amiss either.
>>>> I understand you like adding such comments; I, however, at least
>>>> sometimes (e.g.) don't. Especially without at least outlining what
>>>> would need doing. Just saying "this is all mad" doesn't really help
>>>> very much.
>>> I was being somewhat flippant.  But a /* TODO, try and make this a
>>> presmp_initcall() to improve alloc_trace_bufs() */ would be fine.
>> Okay, added (to the existing comment).
> 
> RISC-V and PPC were both green in the pipeline, so they seem happy.

As alluded to, not surprising at all, as the tests surely don't supply
a "tbuf_size=" command line option. Without which init_trace_bufs() does
close to nothing. Still - thanks for double checking. May I imply an ack
from this (formally I'll need a separate Arm one then still anyway)?

Jan

