Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9495D894EDA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 11:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700067.1092630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrab8-0005iV-5b; Tue, 02 Apr 2024 09:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700067.1092630; Tue, 02 Apr 2024 09:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrab8-0005hB-2F; Tue, 02 Apr 2024 09:38:30 +0000
Received: by outflank-mailman (input) for mailman id 700067;
 Tue, 02 Apr 2024 09:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrab6-0005h5-OY
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 09:38:28 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f02979-f0d4-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 11:38:27 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4156e0cffdaso9052945e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 02:38:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hn33-20020a05600ca3a100b004156b689edfsm3925992wmb.33.2024.04.02.02.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 02:38:26 -0700 (PDT)
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
X-Inumbo-ID: c1f02979-f0d4-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712050707; x=1712655507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIv0GwAQSyBoaaYFzlJT6ICHsfdb8BP9zHmCS5l5+zg=;
        b=SaNmprxls3BlnVd1R98QQUH7SJ69s/osUJbTr9FRufvz0HE+Xd9NFwM5IHmv9N+R1m
         +SNNWXs1QELGCazf6DK6hyNxrma18LGHBY0U5XS2Ku/FzkJ2MY7WMszrIrcaSTPYZqWx
         mBu7rKJrGk3owy1U7jhVQXbAMxwzzXSWNeHlEM/sRonfBIYRN1z8zPRvY7o8YScdwGid
         mKM39hhPF+wGWF6bhrOYLTwaDBXOR/wYDcAmi5qUMXRpcP8sNZTB7SkeJssffQdvLFn9
         N/1Ucccr7sdzFmQrb7NypbK5nl0Tmba38N8tzlBxiafFe1VdHDVKPOnvC4unqDSyD+ZA
         boFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712050707; x=1712655507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIv0GwAQSyBoaaYFzlJT6ICHsfdb8BP9zHmCS5l5+zg=;
        b=GROGTcJfTFnHXcEIWRWE5b6bJdibCYQH1S1IqVfRN1lxoUrtc9xrXepYDyBoPhf3dP
         KRh+JLF3oORAyjcVq7VAxymNrWMVsAR4lRJrRCnt01UORogh1ttCXisz9mbxBotPDFJ8
         vU9Mth9mRH6lbUXn9xJuOactf9FCTZ5eKqrJpAXMBPcq+wJS3fim/MLLasHMMNLV6e3C
         rub6Oz1Pqh/O3r128DFLOlZuhWVmaY6NYKdhAOtzFC4BZqbMLqaNTfKdw6oTzqOPqkA1
         Hd3Rv0rQZM8AZ46QyCyWnWlmVith+rexdhPhU9osJ0JFtTEHbv0BIZvjLq9iD6+8g9GI
         Wv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxU0b0MUXvDgcAEhUjuuQjZzH39VKQiiHwurk7XEPnBvmZuZYAQ0e0EumeidO8gJHQE1+9Vvu3/yU01LIi7NpjcKUsCUl4OX5zXz2if0I=
X-Gm-Message-State: AOJu0YxQfi3e5WsN/ChxHvChszONFRjbXFG9thTdqna4ogLUF/AzzZGN
	OYDHJBO499k76oZy1prdfAtXWxZRCwpZSrQ9EipzaaGBw6FZNbgTrlrx2Saysg==
X-Google-Smtp-Source: AGHT+IHw4YFymErY9MDyoEtQmjh5By+kf1PC1gp22J3N/Fu3wKqMjDOFzW+qB1MGFP6tE8ZyTvfp5g==
X-Received: by 2002:a05:600c:4f05:b0:416:1ad6:e184 with SMTP id l5-20020a05600c4f0500b004161ad6e184mr1348145wmq.21.1712050706862;
        Tue, 02 Apr 2024 02:38:26 -0700 (PDT)
Message-ID: <473870c9-1134-4f17-b063-68ac93ad28e0@suse.com>
Date: Tue, 2 Apr 2024 11:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/video: add boot_video_info offset generation to
 asm-offsets
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-2-roger.pau@citrix.com>
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
In-Reply-To: <20240328153523.4155-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 16:35, Roger Pau Monne wrote:
> Currently the offsets into the boot_video_info struct are manually encoded in
> video.S, which is fragile.  Generate them in asm-offsets.c and switch the
> current code to use those instead.

Just to mention it (without asking for immediate action): Defining boot_vid_info
in assembly code then is as fragile. Moving to C would likely be problematic
because it needs to be in the trampoline range. But at least its size should (at
some point) perhaps better be tied to the C struct's sizeof(). The fields, with
some effort, could also be converted using the new BVI_* constants. That would
still leave the field sizes; maybe those could at least be cross-checked by some
BUILD_BUG_ONs.

Jan

