Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88468A306F4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885216.1295005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmWy-0006rF-Mq; Tue, 11 Feb 2025 09:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885216.1295005; Tue, 11 Feb 2025 09:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmWy-0006o7-JM; Tue, 11 Feb 2025 09:26:12 +0000
Received: by outflank-mailman (input) for mailman id 885216;
 Tue, 11 Feb 2025 09:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thmWx-0006o1-Lz
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:26:11 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39d07ecb-e85a-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 10:26:08 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab7d3bcf1ceso214037266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:26:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7aab8d8fasm596534466b.58.2025.02.11.01.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:26:07 -0800 (PST)
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
X-Inumbo-ID: 39d07ecb-e85a-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739265968; x=1739870768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4AZeMkRTaveX1bjvzLdk0/DeV0XkoW1qKLdYVOG4HdU=;
        b=LOBmTlGoHsUoW7J99jFU9SMVxHaWjq2jpA/NhNF6OTXl7Mdy76lkzR0nyk246qK4ao
         epVxCOdi7/M4XLBzvq6jFLHsVuBja6ZAGl+jbAE8mqkkp5P0H2XReggRmihf1jRug8G/
         IXrz/iv5us7XijRkulB503UdNP8S6So6+yrD4LdEWDegVeltX8u/zdtq5ArJA6c+esPy
         6BWnitOtZkbCqxqEPdEPQFd/3H0nIEx02HMselQwbV24ci/sbWabInwoH2JIqqnnGmD2
         MNnsnkY18yydspvfinZ87lNdjKnqInTWlbMdfVdp0CiLm6+OXJS+l5G2i0TM9BEJjd4I
         g+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265968; x=1739870768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AZeMkRTaveX1bjvzLdk0/DeV0XkoW1qKLdYVOG4HdU=;
        b=bQ3neznIXpu5SG5fAHv2KfRJkZWXhWo+4AYZPMjVp+o6Jn0wWaH1bX8FgGbhC5ClQ7
         LiU5/IyYjsM0VONghH0fwdUqabmthM5XdvAWKKJPDBGWscxLghq3jmpjGT6onZXQl5XT
         IzNV7wQEZLZCx6q40+EIowBqQNHmmcNe35Ht3ocW/Ja2sm4iGyYh7dKtcsOyerHAwEpk
         r7ezCsmqlloiGOK7fgwNnUtp/pk1yvAWPxMh1tVGNgQa6cawhxUledTh5QZ4oFSJAc7P
         R1EPHT43N+jrYC5awuWV4Hez1YRkq8DfBBU5KqwO89xTSkT4zJPsc0KdcsmI06qHQc/X
         1Jkg==
X-Gm-Message-State: AOJu0Yw9WdZCag8Pn0KynavIVufmZxZNNcYBYABoa5BNzpGBmVFrfj1g
	1DsE7A6BGTIyje4xfWfNxrGI629OpLGARCyHG8NusJS5X6peOaESqAqnEukMtw==
X-Gm-Gg: ASbGnctVIuKj9EYC70y9E6YG5bdHJTQIRwFfnFqw3ihkfqA/BQ0Hfz0knu+ti5lLMho
	W/Lq+9IQpEAWyN01yX9m+Zw1dtFc7zcMA4aT+7U578LxpF2aM6IxyYWtACM9zqpMW8JD3uo4Ybo
	SCBq5v+UFSBeEuxYpcURQIDUudICc7sE6xPopLYNE2dOCHUVh1JOFTfkdPZqNLZ6HfeY3TK84xy
	ksY3ioZ4z4WTl39CEUOpGGmV1yLQcVc+l3bco3IZdEAEFc431E5ZjhY5iuO//9hmV2GYVQnkHDy
	x2VkBRGbKJKKnbjGkNbf1BID4rLTTC7L3f/KVE3CCDzk4QZ31bVF1omNOSelRf6SLVNUm1X7VBv
	J
X-Google-Smtp-Source: AGHT+IFun8VcfFw3WiYIog+8xNuvcpYTan6HoVIxm6psQEBllBZhqbFBtgnsL4AmhjoBFgBVxqxJ6g==
X-Received: by 2002:a17:907:c718:b0:aa6:6885:e2fa with SMTP id a640c23a62f3a-ab7da36eaeamr224735366b.14.1739265968259;
        Tue, 11 Feb 2025 01:26:08 -0800 (PST)
Message-ID: <70c3456f-7c89-4105-969f-e50cec5b4917@suse.com>
Date: Tue, 11 Feb 2025 10:26:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? v2 0/5] xen/x86: prevent local APIC errors at
 shutdown
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <Z6nOmwdp8iRNmkzh@macbook.local>
 <9f6240b2-009d-46a7-af9f-4944cd9439b1@gmail.com>
 <Z6sMbvBS4yB2le7U@macbook.local>
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
In-Reply-To: <Z6sMbvBS4yB2le7U@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2025 09:38, Roger Pau Monné wrote:
> On Mon, Feb 10, 2025 at 07:29:35PM +0100, Oleksii Kurochko wrote:
>> On 2/10/25 11:02 AM, Roger Pau Monné wrote:
>>> This should have had a 'for-4.20?' tag in the subject name, as
>>> otherwise we will need to add an errata to the release notes to notice
>>> that reboot can sometimes fail on AMD boxes.
>>>
>>> Also adding Oleksii.
>>>
>>> Thanks, Roger.
>>>
>>> On Thu, Feb 06, 2025 at 04:06:10PM +0100, Roger Pau Monne wrote:
>>>> Hello,
>>>>
>>>> The following series aims to prevent local APIC errors from stalling the
>>>> shtudown process.  On XenServer testing we have seen reports of AMD
>>>> boxes sporadically getting stuck in a spam of:
>>
>> How often this issue happen?
> 
> Hard to tell, we have certainly hit it more than once on XenRT, but
> I don't have figures about its probability.  I have at least 14
> reports from XenRT from the last 6 months, but there's possibly a lot
> more that could have been classified as a different kind of issue.

Our QA tells me that this is severely hindering their work.

Jan

