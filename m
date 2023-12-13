Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C1810DE2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653823.1020454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDM8j-0001EO-9H; Wed, 13 Dec 2023 10:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653823.1020454; Wed, 13 Dec 2023 10:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDM8j-0001Cj-6S; Wed, 13 Dec 2023 10:06:53 +0000
Received: by outflank-mailman (input) for mailman id 653823;
 Wed, 13 Dec 2023 10:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDM8h-0001Ca-Kc
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:06:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54a208a7-999f-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 11:06:49 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54f5469c211so6750938a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 02:06:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l12-20020a50cbcc000000b0054b53aacd86sm5408243edi.65.2023.12.13.02.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 02:06:48 -0800 (PST)
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
X-Inumbo-ID: 54a208a7-999f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702462009; x=1703066809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwTk6pkMdES9cresee7XintXj2enaIyyrvoCFuQaZmU=;
        b=aS0tgA6193wYcB2NAivkwMp5+O9nO2R6jWarcjlCQwW57/dR4Hk1ZMUj9sm5y9wiTf
         aIveWW7pgEPi4BGQQ2WOljMNVQFjCRGXI0AoM1tbLkTmKjlNZX3XQvGLHnDUTLs0BeHt
         eUHZPVICzswMNcJm3VkJ5Vizdy34BYUAZbGY5kCHCFbAczXtF1RZj0ydAkAfhLhwVkGL
         TqZ6BPkcV+Ma7+me6Bga5Wna4NcMhk43e/QS0E7ow4TT0pYNhTIZuU1Kk1VfFtpFhdPt
         geSc8tk+Y1/ctoekaaEm7j/YAQAOstHGSFU5lhK8Nl8yKSH9oFt2kQjmxXzNk9k/vHOJ
         RoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702462009; x=1703066809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwTk6pkMdES9cresee7XintXj2enaIyyrvoCFuQaZmU=;
        b=DarI+SI/1/AEE4r5c0V5or4m8L8ITCuvGLCBja1eUBU7R8a1MjPAwhVfE+1oj8rJe4
         GUB9h7mTNOUA8nuXwcJjzMQRtFQaxWiKLIqMIjcQNi2F6AOdlkxh6AZiXmIojpAQPknv
         5NK4++j7/4HIeF5pmne8D4AAZcrmiVwIIIJK3gGYoeB4ccJbJidZHH2Q5sXvqCHgM9MX
         EWr2MKI7hsmjCslthfzmmSBsYeXF5fBAp7M5f6+CDxzShu/8DGoSGV72LJ076CN1IblU
         mjXN0hb9qTdw6Fuiqvpaxrs2Hgp14QTxcO2lu4H50hkajdHw2eg1kxAKpMXFRqN54ivm
         4iBg==
X-Gm-Message-State: AOJu0Yz4AiXvYgXYOOGEoruFVoUt9l9AthNLbX6NArkoGHepi5E0kZyN
	LoA+r7+weEuYsDBJxYRTzo0F
X-Google-Smtp-Source: AGHT+IGaNRrNbp0hPDGUR/JntY8gYuIkY5QgF+4E7T/3tW3knVyt8HYFTsDvcPjWEsUceD+eDv8RRg==
X-Received: by 2002:a50:d75d:0:b0:551:d340:a59d with SMTP id i29-20020a50d75d000000b00551d340a59dmr997857edj.43.1702462009015;
        Wed, 13 Dec 2023 02:06:49 -0800 (PST)
Message-ID: <557e5082-01ba-407f-9815-317f9de18c0d@suse.com>
Date: Wed, 13 Dec 2023 11:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
 <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
 <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
 <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
 <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>
 <6156d11d-3421-42c1-9368-b9de5708030f@suse.com>
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
In-Reply-To: <6156d11d-3421-42c1-9368-b9de5708030f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2023 10:55, Juergen Gross wrote:
> On 13.12.23 10:48, Julien Grall wrote:
>> I note this was a preference and weight against code duplication. It is not 
>> clear to me whether Jan agrees with this extra work now.
>>
>> Anyway, I am not against this approach and if this is what Jan much prefers then 
>> so be it. But I thought I would point out the additional complexity which 
>> doesn't seem to be worth it.
> 
> Thanks for the clarification.
> 
> Jan?

Just to clarify: While I have replied to Julien's mail just a minute ago,
I didn't get around yet to look at the actual patch. That reply of mine
was purely based on what I said earlier on.

Jan

