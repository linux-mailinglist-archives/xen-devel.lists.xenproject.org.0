Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E918C7356
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 10:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722900.1127299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Wva-0001qv-JJ; Thu, 16 May 2024 08:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722900.1127299; Thu, 16 May 2024 08:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Wva-0001od-GK; Thu, 16 May 2024 08:57:30 +0000
Received: by outflank-mailman (input) for mailman id 722900;
 Thu, 16 May 2024 08:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7WvZ-0001oX-An
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 08:57:29 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 523d398f-1362-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 10:57:28 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59cdd185b9so398758566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 01:57:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cdc72d31fsm121865766b.169.2024.05.16.01.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 01:57:27 -0700 (PDT)
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
X-Inumbo-ID: 523d398f-1362-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715849847; x=1716454647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNC6vf8/COs9uc/pu94tL09PzkEQMKSrQx7KSdEb/UY=;
        b=a6T1kS8vyvbHm02NHUTUJsTsfJQfKJHFfWAClraRk1k458SIPZ7RQAJHJUjRi89PqO
         hooXi5QJ6yXCopEC9OCFo9ycOVxDA6zQVkEd19Z4V1GGQK6KR0HzmVdhpG4T0jR5XLfZ
         /SGKYzjzP2+d0CYUtoO9VLKyy192Kk/+NOt9lS3Xg1JU5N2HKgiXHd/m/bMCbaluAvIo
         4GKOWz4TfjSDHtecqg8EScIWaxygr0fPyGjSW0E4LAi25k18ofBy1R+cgPYH55ZfUl9G
         6ILMruRIoKIi2riudIha3Vgc7bfkTp3ixxwYymFzZ3ZimCOKRDVN5ylkq5APGNyvX74Q
         7dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715849847; x=1716454647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNC6vf8/COs9uc/pu94tL09PzkEQMKSrQx7KSdEb/UY=;
        b=TkzlD8Ud7Sde/cNNAed213ihww28I3/mq50I0/jg6F3xVPT6b0p5Elr8/g/i2DDfZm
         vi+t/2Rz6J+PBDjdgdQ9YIzVp0dy/t+LbivhVzI40kq4JEIexNNk7781911qCY7uvXSb
         ublpfur5/4PvCUNqjCsF0dutHxDS1wGKpywnRolJasjQb3TqYd5HAmMbdOhBWoeEoAhk
         MXBep+TDie3WIH2IlfBlhXbqo6o7iKFYiPretpsFsVYhe++rRIO0f2MVvDW1La0qawqP
         7MD/aQVwen1dr30rIVzVvYPpqLoi6dZHQn9bHoU4Sj1GTKxk2ZsD+JQKBfH9+cVLCaFW
         SPsw==
X-Forwarded-Encrypted: i=1; AJvYcCWO9so7Npzg2BvWCMvwV0jASnOVKBwto5812BU9ysvKagXf44vs2O4VbWZhXSoswVdMqtTKvY7XJW6ceiZ6kn8KktKRpxl3w5T+prEVMXA=
X-Gm-Message-State: AOJu0Yz0U5eurJMTWyBZDZA6w3F15v3Niyq+ushHA4CRw30kj/bdjFVG
	+jPRwo4zZOTTJYfbn36xGabqIIyIu5TUg3seEHJg6QIA1ACt33EHGe53MGCvng==
X-Google-Smtp-Source: AGHT+IHRRwrb/eV6oZLMV0JUaLV6T1X6kq2vUwY5KGCfwr38ahJB1Kv7n4lvfMWKyI7im0WGrXivOw==
X-Received: by 2002:a17:906:2845:b0:a59:f2d2:49b1 with SMTP id a640c23a62f3a-a5a2d1b0df0mr1536495066b.9.1715849847518;
        Thu, 16 May 2024 01:57:27 -0700 (PDT)
Message-ID: <06db6010-3d70-4caa-ae34-3e35418fa835@suse.com>
Date: Thu, 16 May 2024 10:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 14/19] Rename mfn_to_virt() calls
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-15-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-15-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> Until directmap gets completely removed, we'd still need to
> keep some calls to mfn_to_virt() for xenheap pages or when the
> directmap is enabled.
> 
> Rename the macro to mfn_to_directmap_virt() to flag them and
> prevent further use of mfn_to_virt().

What I'm missing here is mentioning of criteria by which it is okay to
continue to use the (renamed) macro in the specific cases where they're
simply renamed. That might then also serve as a reference for people
needing to update their code. This may also mean the patch actually may
want splitting, grouping changes for similar reasons together and
dropping the old macro only as a last, final step.

Furthermore, also taking the next patch into account, it's not clear to
me why e.g. page_to_virt() is okay to survive.

Jan

