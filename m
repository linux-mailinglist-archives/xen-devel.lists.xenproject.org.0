Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27588C366
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 14:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698088.1089415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp6sT-0005Qj-JL; Tue, 26 Mar 2024 13:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698088.1089415; Tue, 26 Mar 2024 13:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp6sT-0005OS-Go; Tue, 26 Mar 2024 13:30:09 +0000
Received: by outflank-mailman (input) for mailman id 698088;
 Tue, 26 Mar 2024 13:30:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp6sS-0005Mm-6t
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 13:30:08 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f54e563b-eb74-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 14:30:06 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56b8e4f38a2so7105285a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 06:30:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k18-20020a1709060cb200b00a455d78be5bsm4222735ejh.9.2024.03.26.06.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 06:30:05 -0700 (PDT)
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
X-Inumbo-ID: f54e563b-eb74-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711459805; x=1712064605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwgQQBmfLrCnvgHbA6SDQOn+05jz7V40LGNuVpzMnMI=;
        b=cRILbYiAMVGWkxoijHiRSV2kI/vjeklghBlFzzLxRKxID1j6YttSVKJylNZuIBnDPg
         mvVMx8JQl9XIpyny4Wue0B8nATBzHiXZNhNQ51tCZqrzYB0xj5Mw9EuQusjbTO8G41DS
         z57IcPvRzAW5N6s9DbipanOnWPnliLfre77uZGl4WZjYU2VaSOzNPM8IW8FpG6Rn7WlM
         7ESTsnha5oSfVvcVKZ/w5UdOfiyskswwS12nLfKrs8BZQmuwiLkHGX+bw4Nm/IHA4xUe
         UZhOMkTmKawOIjyimQS8uMNaHPGOtY+u5cd1ud6o05RZ23VLdikedh1TGUje07HqO2hs
         qg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711459805; x=1712064605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fwgQQBmfLrCnvgHbA6SDQOn+05jz7V40LGNuVpzMnMI=;
        b=dqvLR4YG0iW4SLzJ6v7mv/WIL9v2xTj1f+DffYjOMAfshAjD8G0sN5aHspdOfFv51y
         5w6mhDiO2UgnWG7kRH6pgSS2NSME4TQfPMKuwj0lK5rVc/XIFRxCs258Abq4+6kH83DY
         qisA43DMVzJ5BPdxn+AXHPugngNa5i7KNaP0JOQ38Ow2HHjfZuxr+/ThSWzGTkH70Paf
         a3azYfsAR7UnnSRsqdQYQ3nByfyQeh41baOF9hvZf/uE5hgP2L4lIGdBCBlpDlLEmvyZ
         DpRnZF4FQxYP9iADtTET1ZYy/6F7CPs6EaKOCVPXXxOgObLYvSzpq84nmV5SQ3nYlirz
         Tz3w==
X-Forwarded-Encrypted: i=1; AJvYcCWnNmGHkI2/YLdiAi3scTduO2IEUmGWVRYVTQtwtGgiLOR05vLGdYTRan9QatzqTMB2qPOSDLzUcqo/0WAUosbQ6WbxRE2CoNmTsnnB8qM=
X-Gm-Message-State: AOJu0Yw92xMHfY10M4ek2DOqoxU1WIqslurCFJ7dQg2PC7opQMv1GLjq
	aH3PXXbzIiUG5R4cdt4A+jbkr8HwIF32o20tF7RC/jsrJT1A2qn+y2dDiqGUOg==
X-Google-Smtp-Source: AGHT+IEenydUmc1YwkZ8vVOJ+pdqij8XdTV8qTJI0OUe+kQXldFjEeeUQ2hftFj6B/DTp5KgKLdQ/g==
X-Received: by 2002:a17:906:e296:b0:a47:355f:6dd1 with SMTP id gg22-20020a170906e29600b00a47355f6dd1mr915615ejb.6.1711459805618;
        Tue, 26 Mar 2024 06:30:05 -0700 (PDT)
Message-ID: <5b9d07ad-159d-4384-924e-e772e6ec4ede@suse.com>
Date: Tue, 26 Mar 2024 14:30:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240325204515.250203-1-jason.andryuk@amd.com>
 <20240325204515.250203-6-jason.andryuk@amd.com>
 <770d3292-34cf-4e21-acb6-bd1f9caf5fef@suse.com>
 <efc5ea8f-d087-4fe0-a5f3-6d1b0a8b48dc@amd.com>
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
In-Reply-To: <efc5ea8f-d087-4fe0-a5f3-6d1b0a8b48dc@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 14:24, Jason Andryuk wrote:
> On 2024-03-26 03:50, Jan Beulich wrote:
>> On 25.03.2024 21:45, Jason Andryuk wrote:
>>> + *  - a minimum address for the start of the image (default 0)
>>> + *  - a required start alignment (default 0x200000)
>>> + *
>>> + *  This note is only valid for x86 binaries.
>>
>> Maybe s/valid/recognized/ (or honored or some such)?
> 
> Would a comment at the top of the file saying Notes are only used with 
> x86 be better instead of this one-off comment?  Roger already said that, 
> and elf_xen_note_check() has a successful early exit with "ELF: Not 
> bothering with notes on ARM\n"

If truly none of the notes are of interest for Arm, then yes, such a more
general comment would likely make sense.

Jan

