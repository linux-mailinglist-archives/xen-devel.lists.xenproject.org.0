Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451D908C9C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 15:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740705.1147792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI792-0007Xj-K2; Fri, 14 Jun 2024 13:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740705.1147792; Fri, 14 Jun 2024 13:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI792-0007VQ-HP; Fri, 14 Jun 2024 13:39:08 +0000
Received: by outflank-mailman (input) for mailman id 740705;
 Fri, 14 Jun 2024 13:39:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI790-0007VK-SV
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 13:39:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77edd372-2a53-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 15:39:05 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so313959066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 06:39:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f6a1f2cb9sm49174166b.17.2024.06.14.06.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 06:39:04 -0700 (PDT)
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
X-Inumbo-ID: 77edd372-2a53-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718372345; x=1718977145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pyC+ifg+PK0asFFx28j34au92Zo5AJ40YDNHpmuSqBs=;
        b=OMOVUIdn0Q0R2dFRgmE5xCPWNZxLy8KNlSugdcdqTitxqV5hXYbbnJWgL7gIujSCNj
         HUrz6h9kILQU7avyvc7fOYJDzls69J6bOCBp4Mz3dH4RQnUaelrL3u1HbamiRrASQgGX
         irn9EJIxwYoiHrrZicrFiiZNwJrU7KgBvocol1E8WYra+UXU1CmUQ3YHTuQshbFSEemd
         vqmbcYfu5f47DLofnjZhCzStG7CofNx0zwVGI9APsWULpgoLDFMk6ejZXh5sJYcrhrXl
         P3lrYdwcoo4E3HQj+sYPGYQuY0BwRz8ln+S70b6V6HopWI7OAI+C+Kf5YOZvxDGjOLxi
         Jm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718372345; x=1718977145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyC+ifg+PK0asFFx28j34au92Zo5AJ40YDNHpmuSqBs=;
        b=DhbTEcwWdgDcEPf5XkyBx0O2bR4zYJamainOmznn2TNzAQvJe2AtedYbaUPYQSceyj
         P0v5xRacowekEzTBNNRihpb9sOrazZ0UlNHPH8O3+gd2JS8uG9GQWfuG0BHBf8U7ayKr
         W49YeXbKR1Q0/GmnCDXasz8Sko4wNZEDMNacAlFl6CP0WPvyOQX2AD7NUOLFrArTfH3S
         Eg1xcf/qLtupHny1bVei+RRs5+TjJ/hLzO7NyAhVmY9Kz2DyhBQWI0kYJA+3G3Pj7Nin
         cggEQhyjHCEeVm0WD5a5grrSki0fYhx344oGc986OHPzhQwua1vu8ajy0qD0me8EOOVl
         7QtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpTmlLQi99NHeC6BOsPkNQNAEVZorT6kPXqYV8yX+R435XjlauIevWbdWRRktJbctfnzJBRF2yNw316GE3/cB4KAXaSo/MrP6ib85A05s=
X-Gm-Message-State: AOJu0Ywe8zExFBSLqW9UixttinvsvPxkBoqA3ehCnhvChnQvMQsXUGQR
	IWVFZqbVCAElILmEYvbJOsRojWS19HozqdcAnAnUgLkzNMkQLeMVScd9ELfCVQ==
X-Google-Smtp-Source: AGHT+IFIzVdqwwmK4lxQiTjjf4jPfajmGHrhqOHg3ce8G3EEWYRC3rl/fPzzUnaqFGrqmWd+YQU67w==
X-Received: by 2002:a17:906:2885:b0:a6e:f6a1:324d with SMTP id a640c23a62f3a-a6f60de1c6fmr150137266b.69.1718372345011;
        Fri, 14 Jun 2024 06:39:05 -0700 (PDT)
Message-ID: <0d7bcd4b-b09a-4ce1-9042-2e8b916f5fcb@suse.com>
Date: Fri, 14 Jun 2024 15:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arch: Centralise __read_mostly and
 __ro_after_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.06.2024 14:49, Andrew Cooper wrote:
> These being in cache.h is inherited from Linux, but is an inappropriate
> location to live.
> 
> __read_mostly is an optimisation related to data placement in order to avoid
> having shared data in cachelines that are likely to be written to, but it
> really is just a section of the linked image separating data by usage
> patterns; it has nothing to do with cache sizes or flushing logic.
> 
> Worse, __ro_after_init was only in xen/cache.h because __read_mostly was in
> arch/cache.h, and has literally nothing whatsoever to do with caches.
> 
> Move the definitions into xen/sections.h, which in paritcular means that
> RISC-V doesn't need to repeat the problematic pattern.  Take the opportunity
> to provide a short descriptions of what these are used for.
> 
> For now, leave TODO comments next to the other identical definitions.  It
> turns out that unpicking cache.h is more complicated than it appears because a
> number of files use it for transitive dependencies.

I don't particularly mind this approach, so ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Yet this (or variants thereof) is precisely what I wouldn't have wanted to do
myself, for leaving garbled state and, if I'm not mistaken, introducing new
Misra violations because of the redundant #define-s.

Jan

