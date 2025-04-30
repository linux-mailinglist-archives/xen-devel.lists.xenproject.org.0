Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C25AA4FF6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973679.1361748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9BI-00068w-HV; Wed, 30 Apr 2025 15:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973679.1361748; Wed, 30 Apr 2025 15:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9BI-00066x-Ch; Wed, 30 Apr 2025 15:17:04 +0000
Received: by outflank-mailman (input) for mailman id 973679;
 Wed, 30 Apr 2025 15:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9BG-00066r-PM
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:17:02 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29c7818e-25d6-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:17:00 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac25520a289so1182143166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:17:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e58623fsm931994166b.78.2025.04.30.08.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:16:59 -0700 (PDT)
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
X-Inumbo-ID: 29c7818e-25d6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746026220; x=1746631020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S4jAUdUAzjnrqQFCW197Cj/IsxpypH/rX2sQMuB9+d8=;
        b=a1YNEIYvA8AwKSlhUXxeJTUQHkCwmdZ0VRJyQFDhsPCxTpHviUe1n6vQWO22NG79Vl
         033xqLRiVCJU2aaJCwPliCwv5oorRQK4zqihxja5U6MWAWHBF+NfIyWMpTk2lVECHl1W
         n8gXfbtoNKYAp4G877nUQ8ZNr/YQF9pYM5YpYqtURxCxY7p+3cLjQ2A8QGAzBPsZ7Yvg
         KjHKbKOgdSwrKlM28TOHE9d1tvNqpiiCvQ0GM1SOa1yKmCe1rn3hWg2eV30IkTPO33Ok
         agSy1WeYuB0roB0bMLisl0OL1+gXQN8nfKNFr69NVvVMCv1gNa9cO+WB4cnHL+VhwIXb
         o3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026220; x=1746631020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4jAUdUAzjnrqQFCW197Cj/IsxpypH/rX2sQMuB9+d8=;
        b=wC2FiGuNZE05lxNdq/2ujdN/ibmtwZu19JmiHhpPZxOhrq4C1WMmxE1JBMULzG0Esd
         nnmp+c/LaGfBoxd+kbEYqVk1ty0yFg5vsO/M2HNX/xqxAOV10s55HiNA26o/RleUj2SC
         6C3GGR5A+B6yW+1taDsYUmguyfmLWSrWsZCG3HP9jWVKwRbVCZYDJC7B+76yjTSpfqaK
         ZJZyOdDb+HewXHTb/IgQq1sXng7s3OncyrkP6xDslz9KHj/V1494onfRzYR5Ulomf3qC
         maTAOch1ahZ2rI2Tn8xEzsarB79Api2gtFqk+HehQ3vEg3a5kk3ET8NAjV5Ee9gu/Nyn
         vNlA==
X-Forwarded-Encrypted: i=1; AJvYcCVj5uyF2U6gpIL2bH1uRMBNx5jJztPWJaS0hTYjoHO/8f6Owe1LrEwws8XEW3mh3/TWEuRsge9DehI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycFQtB2Q2bpN0q/rPN2tDpvv8CrdwHo6L0A8sGjp0SQjVPEOlx
	Xux2jbx8t3GaICUeRUM6XIK+DzayTUm7p9yr2pggGNtmmML4iiLMgtDc5L2shQ==
X-Gm-Gg: ASbGncu5FxQoU8sPNBjG8LLzw631IaPLoPQTwTlZqUi0G3W0TqrjZ5/HoV+F2yaC6zL
	A3kHlJDxeGEQyDAygoqa1puw13cKog3UBuiZuGgejGUJL2Lx0jEHu82sJuPY5bO3QGpYEVP/WM7
	ho3V8EyBJ7T2/PbR2H1YcxcIX3ImZa6nVLJX0ei3MGsoovsENShyxA0vq9b+E5Hdk0cDAp9MVlH
	jpO2mW8G+W4RPt4B6DTof9dkX/KuZx7YgOLbYho/pMQsTfGlLOnU0i9Bli/Y2PAyLCndkJn2BXU
	2+51HNrCaj/FQF90JofeqP2lMsyL548GJlXklkJpFrFcBKQyJOaYvpkR3vm3n8J8nY3jgZ93VuN
	DsjEAmgPNj/5oNTGdCTPPI8IccA==
X-Google-Smtp-Source: AGHT+IHyhYqg3/ssGzcATKtsVGK7ejEoF7gOjF5eHR0uuoTyeslGe1m7dUIQwgiQPjMvBMSd8Dnwew==
X-Received: by 2002:a17:907:1c13:b0:ace:c2d4:bf85 with SMTP id a640c23a62f3a-acedc6ffb39mr434906666b.43.1746026219859;
        Wed, 30 Apr 2025 08:16:59 -0700 (PDT)
Message-ID: <7e16adfb-21d7-48e1-ab71-b66efa9553df@suse.com>
Date: Wed, 30 Apr 2025 17:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250421073723.3863060-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 09:37, Penny Zheng wrote:
> Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
> equivalent "if !...") in Kconfig file, since negative dependancy will badly
> affect allyesconfig.
> This commit is based on "x86: provide an inverted Kconfig control for
> shim-exclusive mode"[1]

Recall me asking to avoid wording like "This commit" in commit messages?
Also personally I consider "is based on" ambiguous: It could also mean the
one here needs to go on top of that other one. It's not entirely clear to
me what kind of (relevant) information you're trying to convey with this
sentence. Surely you didn't really need to even look at that patch of mine
to find all the !PV_SHIM_EXCLUSIVE; that's a matter of a simply grep.

> ---
>  xen/arch/x86/Kconfig      | 4 ----
>  xen/arch/x86/hvm/Kconfig  | 1 -
>  xen/drivers/video/Kconfig | 4 ++--
>  3 files changed, 2 insertions(+), 7 deletions(-)

With the changes here, what does this mean for the in-tree shim build, or
any others using xen/arch/x86/configs/pvshim_defconfig as the basis? You
aren't altering that file, so I expect the binary produced will change
significantly (when it shouldn't, unless explicitly stated otherwise in
the description, which may be warranted for SHADOW_PAGING).

Jan

