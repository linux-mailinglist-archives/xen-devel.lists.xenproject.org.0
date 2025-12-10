Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A1CB22FB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 08:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182560.1505425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEay-0007Qf-KC; Wed, 10 Dec 2025 07:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182560.1505425; Wed, 10 Dec 2025 07:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEay-0007Or-Gj; Wed, 10 Dec 2025 07:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1182560;
 Wed, 10 Dec 2025 07:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTEax-00079l-FW
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 07:26:43 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 932e465c-d599-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 08:26:42 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so9383305e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 23:26:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d7efdbsm28772775e9.9.2025.12.09.23.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:26:41 -0800 (PST)
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
X-Inumbo-ID: 932e465c-d599-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765351602; x=1765956402; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zqywqUdy3YN7phaZJxe9UjAwAUx8vUcjAfTfGIKB1/U=;
        b=NLGT/uWAJ0YGMyv+aEZoW5mQvOmaQFtMAxAxZJLmY3YhDM1K/XE7EWC2nNYKiTWaf0
         K28mcAF2KoAftANEhxPFp6zDgoqnF9L/YjHu8giyNKWppj3y9XCr12bCYmI5EBL65bmu
         k/D0eY5eG7mzj50NEkalQt2QqK373joiO0UWU32u5YPTI8Ka4By41h2ZQeiHDRflsEGv
         d79y+Kf7zELxXPg6HzPrYED+jxffQz3nxk3zTDrwjses3XsRcKOhk9f1qx7dln0pe4oV
         5DlMKTqT8LDLY1oqyrHrl92z12lk9AHQvbSaEoayOkkA7etKzcK6qB5i2Hr375G8KzjM
         54Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765351602; x=1765956402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqywqUdy3YN7phaZJxe9UjAwAUx8vUcjAfTfGIKB1/U=;
        b=mfTt9noaTfH6hDNQfMz4naQEZtw5icGz9N2fRyRtwGp8wS+iur45H8RAk3XslilPgB
         bxS6m5s4/P4WxYBNdHjJZU/b6KuEg9dG3mg0aZzdZtRHhUnTu+wGqLec3R+ScOthe8h0
         a1oWHsou9vLgS6w1DQpURZwmVGYMmBqMYUfigXDHlw+32aCN+0cf0JdKWq/H3ZFZ6E6j
         vfB+M6pa6gn0vXOj0ulo60YT/Kz3ADdRZFxvPX56+slgbzwnSvheVp1NtV+w9Seddmc9
         4hLMhs12bQ7NqSNgvgq9TRctCrX3vVZmb6r02I710tgIcwoOEywDkuZTsbdYCp499tHa
         sUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+1mSCSnsCIjaUdCIcsZ5ye1IkAPxlBq5OXuY6qzsEI4eX76k9+tFun+Q+OmV2jBZDsM1dPjYsdQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZLEf7h0hctOT97oQ2l616/7Dgsiy+WcJlu4vexP3KN71VCQFx
	cPhjTYxDKB7W2nlpsBsxcI0yOdY/wlkcyMyGo0NwEvPHL7993opx10+62bIGKIGYnA==
X-Gm-Gg: ASbGncunzAbZ4AXLPoy9Oonk2KzdeGFTavyXrN4gOUmCg4ZJLSjYqUexhiCzgIF/JnW
	oxevakPN6W0PiGQE6lF8Dvs/KBpDyO0CKSmuuVasUsFiYn9BZbu0Kgzi4+QGi1PHzBSW3nQeEsg
	sqfwM/Um9ma08gIR9Fyy8KMk3zvzDNaDYhWd3r0kMSyAoyIVs3Su+JlrYOAGgZPOCWfXux7nZ0t
	wtSR7Z/O8CK9DHIR4bTrE53njxm3j06tW6ZSeGZk5qSdlAPWNkLN8yQSvZKUhwSIlyuOTGgawQW
	aiM4wQKNmO4rglljpYezdKW6QpJXGWw3eCi905KZNatP22AyV85/ydUeylOp/LKW6fGUtovBMUB
	2R1/1AC/3WWe0xSb182fx7LPCr+j4mqrXQNEEp0P58l6cn3dzDeV82UAW3yCH8YLyCr9hmEUwqH
	nYkpXrroAcL+Mkse2BxVxYjV5YrJRmIJnV6F4BliXWJkMRu7RcIr65Bb4+0LUYlHibHrSx2WopI
	5EFhMBUEhzfVg==
X-Google-Smtp-Source: AGHT+IFQFFTyL20QkZFqlq25pfjYnhMTqBFSZq0HrYtE5kF6svVVxT7sZafJKAUxjkaWPZwt+K0Ikg==
X-Received: by 2002:a05:600c:1392:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47a8384c54bmr12083685e9.26.1765351602038;
        Tue, 09 Dec 2025 23:26:42 -0800 (PST)
Message-ID: <c6ab6537-4166-438c-8c08-948d5c0f96a8@suse.com>
Date: Wed, 10 Dec 2025 08:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Unhide writes to d->arch.hv_compat_vstart
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
 <79fd0f6a-8fbb-433e-9c74-3da339301b96@suse.com>
 <2a9292dc-0903-43db-9646-437c6c2ed9eb@citrix.com>
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
In-Reply-To: <2a9292dc-0903-43db-9646-437c6c2ed9eb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 18:11, Andrew Cooper wrote:
> On 09/12/2025 4:41 pm, Jan Beulich wrote:
>> On 09.12.2025 16:57, Andrew Cooper wrote:
>>> The variable is never 0, but because the writes into it are hidden behind the
>>> HYPERVISOR_COMPAT_VIRT_START() macro, it does a good impression of appearing
>>> to be 0.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I don't kind it being this way or the original one, so
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Do you mean s/kind/mind/ ?

Of course, sorry; must have hit the neighboring key.

Jan

