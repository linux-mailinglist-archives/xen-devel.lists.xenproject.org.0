Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9A84B22E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676758.1053022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIRy-0006Km-GH; Tue, 06 Feb 2024 10:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676758.1053022; Tue, 06 Feb 2024 10:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIRy-0006I6-D4; Tue, 06 Feb 2024 10:13:10 +0000
Received: by outflank-mailman (input) for mailman id 676758;
 Tue, 06 Feb 2024 10:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXIRx-0006I0-Ba
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:13:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 523c2879-c4d8-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 11:13:06 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40ff13d2628so259235e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:13:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b0040fdb17e66csm1519236wmn.4.2024.02.06.02.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 02:13:06 -0800 (PST)
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
X-Inumbo-ID: 523c2879-c4d8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707214387; x=1707819187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFQ2fZ7ptp0gQ3lQ8/JqAFd2cGFa29Kt/kIlBhW3Oyk=;
        b=CzmiVk9dIVepnAS0DcgQZ76E9JPs7XyvXesmQq5UksOvbJlFcXf7R2l025JjW9sR5i
         x8XDn4tN5ir7Mg+Z8G+fZjAk1PBcU8/taM0UQ9cpHfb7gPbaxxxxvnXkYeh/UjvHCzSI
         1uobyiu7CrBkUWEX29n7jdt4wvYo/csEa4y/EBHO9BIWulwct+5aF+y11/VltFZpjnzW
         KNflHyIDnUFKdOa7Z02sdYqncMSwHQJSsAZo5XV2NOd+7uD0DIZBAPp1hKevehBzrvJK
         ULNMlVc2h/KT0Q9eTpknE8vCYPTToIC5u4QCZlD5orc4M7CSVX938EV/xx9kHdgXx9Uj
         4eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214387; x=1707819187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFQ2fZ7ptp0gQ3lQ8/JqAFd2cGFa29Kt/kIlBhW3Oyk=;
        b=WMK+47efdQMbIQouqUCoK8OLJD9pQP1zAU3dtNXngxVDBpck4Cxp/izCl9KukCBZFt
         8SSbG0p6foe4uPfKoV3s8s3Rqq4Fn7glKac6AKxmAuFH7k+39sadT9kJN/2IJhB2JwzX
         O0hkjvtddA8ud5btJK8a7aN15FHCltS3POqevI1YUbzo73ND+Z1UwpnnhSI/AURhVC2N
         qy0S7DIGq/clIHoddUUwl4lJZzV/zOlyDyqtXUxfZLRM/ShWTEPa899/OBT0MwhN5M2W
         Fb7b8lHTjc2n/KovS0qfpJA8aYfIppgnQk7DYcmy7cWyDHPuzTEIeDA/yQNBIhZY9Hy5
         5RnQ==
X-Gm-Message-State: AOJu0YzZjggOhFBhWtsovaEgEfj7qSfATTJbtHXkJwJrb3Dz/nSyOayx
	Wi17cIUN9Pw5WkhgdMQKPWWzrem65H7ldjUdDOauKPYf9qC5tGvLl0jXcVfU2w==
X-Google-Smtp-Source: AGHT+IGFA4d1LwA5BvGuFvtIE9j9bcX0iLYJG/Yc3Vsxb0jTk5VQA/Yp8s3rGvtuU1SwD9wI2dvdFA==
X-Received: by 2002:a05:600c:4f42:b0:40f:e40:b53d with SMTP id m2-20020a05600c4f4200b0040f0e40b53dmr1241079wmq.1.1707214386845;
        Tue, 06 Feb 2024 02:13:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXTk3k9DuB4qzAjWmHHU24kUl5q5jXaK/snrN9CwD4bLpe2fBSllYQAkN0zCHsCRnIYA8yk3VpnOCLKHOIAVeJSuM0e2WAjVpEOAdCvDaTxCjvbuXnFjsP4N4aK9vkZaMy0addCHs/mc7NeZQ==
Message-ID: <2a30ce41-7802-4e22-bccb-101ec5b0cace@suse.com>
Date: Tue, 6 Feb 2024 11:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Reduce assembly instruction size
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20240205104919.14983-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240205104919.14983-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 11:49, Frediano Ziglio wrote:
> Use 32 bit versions in all cases, not only for registers till 8th.
> This reduces the encoding from (example with r14):
> 
>      49 c7 c6 ff 7f 00 00    mov    $0x7fff,%r14
> 
> to
> 
>      41 be ff 7f 00 00       mov    $0x7fff,%r14d
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


