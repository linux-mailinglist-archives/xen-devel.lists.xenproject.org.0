Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE88D37C3
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 15:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731921.1137690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJSP-0003P9-Pw; Wed, 29 May 2024 13:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731921.1137690; Wed, 29 May 2024 13:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJSP-0003MM-Ma; Wed, 29 May 2024 13:35:09 +0000
Received: by outflank-mailman (input) for mailman id 731921;
 Wed, 29 May 2024 13:35:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCJSN-0003MG-Lu
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 13:35:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42c81c58-1dc0-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 15:35:06 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a630ff4ac84so235989166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 06:35:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8b980sm715700266b.154.2024.05.29.06.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:35:05 -0700 (PDT)
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
X-Inumbo-ID: 42c81c58-1dc0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716989706; x=1717594506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EV46/AZY/HKbhP5b1+XxO0OUC3ytXActtv4A1/6Stek=;
        b=TiHmx3MtSpgndvIiIHzQkRLqDovHm+f44qAOLxkLebcXN3CRl3Vu6Zx0i3Ow1uxDfY
         kPZTbBg+Uv27lGYUGaYcjA4TXihdNoxAacPV9ebJuUl0s3DLjG4/W2bGsKkrkd9GLKWU
         R6PepH8IEUkbsb6SmyguaTa0vQMwAtsYCD5A2E9f3VPM1eCVKhqBSD6sTOvhzFC6BBdf
         UlcwQUYRrX1M5ybG/ywtKUfNyW0ppSNTmHm/9h7X4/xcOO/LVZVSrJIgseNwaBMAV1LY
         XMohvrC4m6ia4xd+unRAm7KhYWiBO/q8e/Kdp8tO7q5TJ1S3VwCJQPtmSe8z+26Ox7co
         o8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989706; x=1717594506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EV46/AZY/HKbhP5b1+XxO0OUC3ytXActtv4A1/6Stek=;
        b=bRva5MXpBAwkN+lUntIbVSmR2H5JRTc0bVxEkiIbbrop+AHZWPjCFL61MNR2+BY+G/
         PcuWU84SIdXX0dJzaIEE0PF0X34NQY5+ih8VatIolfihLQ5baDWn3px7mCqX8zx8PA5L
         GOBP0nOU1j0ubmnU9HzkceymwLCH++GRDgDiAArfc3+08sG+2uILWtH1ADVYzSmh0Ahw
         mtyDNqFQeVlBJ5qj6AAfR1TiUaBRbgkguW2WvBbVC4cziu/+E/XAFPGw41OUEvN+GJVh
         86BhbRgtuPvPsqAV/QYBNoSXukUvBlpbMSANAY2wGzSNsv/xEx4klS4vjom5qTGC8fQ4
         G5Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXGigg2kXdm/bfkFOUroVWo06cx0k1y41gdvdf+g4rtMF3KyJV3Nj6PPJu49tHrYfBUnJ/W9SSOLTfIo0bw1LQAAWb/vTd0piEFxG/fmJE=
X-Gm-Message-State: AOJu0Yxmdcy9PSrV+6MvjN7+0xMGFyxQQNmKxLzfBR383qySxX66z4Zi
	/oAsneNlRDg6AOetrGrG8B8ZyLk0KENVDNG/XqssH4EJO2lmooxiKOQEbyZciA==
X-Google-Smtp-Source: AGHT+IHy4uAKWHKXXq+m7FmTz1cT01vmXB4tmbtDy1RvjWBXyhq0hdfVR9gs4tr+6wQX6D4+UKzVNw==
X-Received: by 2002:a17:906:1c12:b0:a63:359b:e5bf with SMTP id a640c23a62f3a-a63359be69cmr324786666b.42.1716989705772;
        Wed, 29 May 2024 06:35:05 -0700 (PDT)
Message-ID: <597b0bf9-8949-41f3-a630-18937c219d8b@suse.com>
Date: Wed, 29 May 2024 15:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 3/9] xen/cpu: ensure get_cpu_maps() returns false
 if CPU operations are underway
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-4-roger.pau@citrix.com>
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
In-Reply-To: <20240529090132.59434-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 11:01, Roger Pau Monne wrote:
> Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
> a cpu_hotplug_{begin,done}() region the function will still return success,
> because a CPU taking the rwlock in read mode after having taken it in write
> mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
> as it should always return false when called with a CPU hot{,un}plug operation
> is in progress.

I'm not sure I can agree with this. The CPU doing said operation ought to be
aware of what it is itself doing. And all other CPUs will get back false from
get_cpu_maps().

>  Otherwise the logic in send_IPI_mask() for example is wrong,
> as it could decide to use the shorthand even when a CPU operation is in
> progress.

It's also not becoming clear what's wrong there: As long as a CPU isn't
offline enough to not be in cpu_online_map anymore, it may well need to still
be the target of IPIs, and targeting it with a shorthand then is still fine.

In any event this would again affect only the CPU leading the CPU operation,
which should clearly know at which point(s) it is okay to send IPIs. Are we
actually sending any IPIs from within CPU-online or CPU-offline paths?
Together with the earlier paragraph the critical window would be between the
CPU being taken off of cpu_online_map and the CPU actually going "dead" (i.e.
on x86: its LAPIC becoming unresponsive to other than INIT/SIPI). And even
then the question would be what bad, if any, would happen to that CPU if an
IPI was still targeted at it by way of using the shorthand. I'm pretty sure
it runs with IRQs off at that time, so no ordinary IRQ could be delivered.

> Adjust the logic in get_cpu_maps() to return false when the CPUs lock is
> already hold in write mode by the current CPU, as read_trylock() would
> otherwise return true.
> 
> Fixes: 868a01021c6f ('rwlock: allow recursive read locking when already locked in write mode')

I'm puzzled by this as well: Prior to that and the change referenced by its
Fixes: tag, recursive spin locks were used. For the purposes here that's the
same as permitting read locking even when the write lock is already held by
the local CPU.

Jan

