Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD618C8431
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 11:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723967.1129136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uEF-00057t-8T; Fri, 17 May 2024 09:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723967.1129136; Fri, 17 May 2024 09:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uEF-00055m-4R; Fri, 17 May 2024 09:50:19 +0000
Received: by outflank-mailman (input) for mailman id 723967;
 Fri, 17 May 2024 09:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7uED-00055g-QK
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 09:50:17 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc9c1e96-1432-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 11:50:15 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso577774866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 02:50:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1789242csm1100467866b.66.2024.05.17.02.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 02:50:14 -0700 (PDT)
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
X-Inumbo-ID: dc9c1e96-1432-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715939415; x=1716544215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oU72KYFlP0ia66lxCFd6gMiS9BxhVCy5XYqXbNsxaQ=;
        b=MRl+Q6CyoPBZnMsWGwgz8g7JGgXZcSj83h9CkF0HCYlrh9JEj0KCysz4vEsZiLlIxx
         f2yg13IKGphpQGc8c8E0omn3HCCIK8FzW6K7tobdicgTBB/UpWBPuCihQsxYpsGYiUMT
         C4xQvQQkuZnLGgjCKS1JIG33+IFt+RSHntMiES0QVqe2OtrGijcymbdV7TB0eTYBszDm
         KTIk7oBygbiYkYaFDdIm5lYLoypNuL0j33361xYl7Y5+frIDeOAabGx3x3zO4BD0IoV4
         WJXWn4DuIE+ODdCny/ipHXQUVAv6eETloU2ChVYzNv7rhZztu8AQjtPO8kayge0n+0yd
         EQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715939415; x=1716544215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oU72KYFlP0ia66lxCFd6gMiS9BxhVCy5XYqXbNsxaQ=;
        b=unEj63c4XSoCG4Xq81B/IrccJ866jBTU5Tk90mzIF+FVGd+pJlRbRbe7s/a8vrMYII
         xWSPC3A9EykxC1XtRSTUYK2JxyZjl9IP6iWZOshKiJ/B36WTJ9VYgAhFebK5dUbSZPww
         qHRwbH2CAYrgTAc4o0IMCNtU5yHZ/z5qJ0PVmoUDcdJhQre4TyrJD/amw86ShNPi/jia
         FwtLqL7hrmlR7y+ZxHuiqTUet9mgzmaZPVjrl+uAZKND/jhG8mgIAiRU6slJhp3WiUbL
         JRX5utNKicDDZjlcCSXOBYVoCQhvEQRSe0q4AZJIyFAHji9y5wq/1mBDm2LCIi8Whiqs
         6RkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2OeOT6kS17gKD6ConQQkmxyJMwg1S0BslNHIa5nGQO3ki2DkfPj8DlK3XVfP4XL3t6zknqzP4lSTX6OVFhpW6X3tGo4Zu0yyG6gMTspk=
X-Gm-Message-State: AOJu0YxbO9QvKEKRPiRZkroQ2NidsSoeeuCjUHQMxxSzVmKZIwDh6/k1
	W29fXdD4oWSgXGCNqWWOLjDGQeXwqkLa6rwR2uBqwO5i2OQHqMWI68ScAmoFZg==
X-Google-Smtp-Source: AGHT+IH0lMkyWRlMcw2xg+WhPBOig0azlmgGfNZNdA5+hh3yf7dYnRNyGITnSAWx9OgcQxJacslFHg==
X-Received: by 2002:a17:906:3558:b0:a59:c345:17fb with SMTP id a640c23a62f3a-a5a11557164mr2111160166b.5.1715939415154;
        Fri, 17 May 2024 02:50:15 -0700 (PDT)
Message-ID: <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
Date: Fri, 17 May 2024 11:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 11:28, Chen, Jiqian wrote:
> On 2024/5/17 16:20, Jan Beulich wrote:
>> On 17.05.2024 10:08, Chen, Jiqian wrote:
>>> On 2024/5/16 21:08, Jan Beulich wrote:
>>>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>>>>  struct physdev_pci_device {
>>>>>      /* IN */
>>>>>      uint16_t seg;
>>>>
>>>> Is re-using this struct for this new sub-op sufficient? IOW are all
>>>> possible resets equal, and hence it doesn't need specifying what kind of
>>>> reset was done? For example, other than FLR most reset variants reset all
>>>> functions in one go aiui. Imo that would better require only a single
>>>> hypercall, just to avoid possible confusion. It also reads as if FLR would
>>>> not reset as many registers as other reset variants would.
>>> If I understood correctly that you mean in this hypercall it needs to support resetting both one function and all functions of a slot(dev)?
>>> But it can be done for caller to use a cycle to call this reset hypercall for each slot function.
>>
>> It could, yes, but since (aiui) there needs to be an indication of the
>> kind of reset anyway, we can as well avoid relying on the caller doing
>> so (and at the same time simplify what the caller needs to do).
> Since the corresponding kernel patch has been merged into linux_next branch
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240515&id=b272722511d5e8ae580f01830687b8a6b2717f01,
> if it's not very mandatory and necessary, just let the caller handle it temporarily.

As also mentioned for the other patch having a corresponding kernel one:
The kernel patch would imo better not be merged until the new sub-op is
actually finalized.

> Or it can add a new hypercall to reset all functions in one go in future potential requirement, like PHYSDEVOP_pci_device_state_reset_all_func.

I disagree. We shouldn't introduce incomplete sub-ops. At the very least,
if you want to stick to the present form, I'd expect you to supply reasons
why distinguishing different reset forms is not necessary (now or later).

Jan

