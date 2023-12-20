Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF9819B20
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657468.1026314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsZo-0006nD-No; Wed, 20 Dec 2023 09:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657468.1026314; Wed, 20 Dec 2023 09:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsZo-0006kX-Kj; Wed, 20 Dec 2023 09:09:16 +0000
Received: by outflank-mailman (input) for mailman id 657468;
 Wed, 20 Dec 2023 09:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFsZm-0006g4-VA
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:09:14 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71f43dc9-9f17-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:09:14 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33621d443a7so5600825f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:09:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b18-20020adfee92000000b003367b7a5581sm972668wro.28.2023.12.20.01.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 01:09:13 -0800 (PST)
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
X-Inumbo-ID: 71f43dc9-9f17-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703063353; x=1703668153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fsfGXH05XhN0MsOyTIC7XkedC1qMWuTISrgLmFdKjw=;
        b=SLKdgMJ5asP07Nuihw3hADPBFb0EHf+LgpP/gVC8ABA/EIOs5HhFr5n/Zlynmgo+EG
         znFKfbzvzi/YWAgadDijJMR21PY3ffn5dtogB08lR7seS9fFFmh4G8yoUDKHPfTPlwnF
         uRkDrSfqoFp38dy7l0BwwpeSlxpB8LfZTRL3i6YJ+yP7Ndnz3G3rEMQjvYnNuFhCiYG+
         XqnXWj68+T265n4bzHXikzvSD0OiY2UPBcRlQXFzCOjBu1n0xqhiHUCajM7YCpLvOUP3
         owkkgYNl8kiy11fK/bWDkW05Jchaq9ItL4ww2uwhq7zLuz7BSVFO7q4KkltBxIopkwfY
         aZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703063353; x=1703668153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fsfGXH05XhN0MsOyTIC7XkedC1qMWuTISrgLmFdKjw=;
        b=mDbf3FOvK5zxis98Mf8Pdn16Vn+ogXYYOUH0Q/xkm1EWWzpOBSz9bneiIwZUTInHwK
         T24csX4exLVnQoWyqALvZ1Reew7bxCrl9BDR9CGNV+p5asxAWR/EyBZsxMrX56V/sRfh
         dFcOB4mGuC2Y16Zo3JUjV+sVXQ+AQ/6T+iIbo6KsXD9I6PGfQVFHllrBassOsa8bJlCF
         NPZ9N1dUh+5shPWFDsx1TGXrIcTZaw4aYeNFfWAdJG5ilKgjHk+yvEOXypC6onzV57XF
         w8ooPpjNgNEEzrD1jnhh4CRXIs08QIIr7HlU7/bvAeZk/Wv2SZwJ/ou7ImP0FwtDRFO2
         +DTQ==
X-Gm-Message-State: AOJu0YzrR6PDemX60yeNi65TvkXH216uLQXKzOKaQqiaSs/djLkk7Q3j
	UI3RQf0kSh2OPfaG711uYzwj
X-Google-Smtp-Source: AGHT+IHddzYxE6S168oT3Spmr7CPML3O/nr3jhsDVw3J/heIFTWUFfSVaUGQNGVVjw1QNPTaCaiHpQ==
X-Received: by 2002:a5d:6e89:0:b0:333:2fd2:2f05 with SMTP id k9-20020a5d6e89000000b003332fd22f05mr8321549wrz.126.1703063353640;
        Wed, 20 Dec 2023 01:09:13 -0800 (PST)
Message-ID: <3957ab63-9f77-4342-a470-62a0c077bb55@suse.com>
Date: Wed, 20 Dec 2023 10:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
 <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com>
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
In-Reply-To: <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2023 21:31, Andrew Cooper wrote:
> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
>> +        if ( system_state < SYS_STATE_active )
>> +            printk(XENLOG_ERR "%s test failed\n", tests[i].name);
> 
> This is a test hypercall, for the purpose of running testing, in
> combination with test livepatches.  Eliding the diagnostics isn't ok.
> 
> Logspam concerns aren't an issue.  If the user runs `while :; do
> xen-test-smc; done` in dom0 then they get to have a full dmesg ring.
> 
> Don't let that get in the way of having a sensible time figuring out
> what went wrong.

Since it was me who asked to suppress this when invoked through sysctl:
I can live with an unconditional printk() here, but I think this goes
against the "what can be done in user space should be done there"
principle: If enough information is propagated back, user space should
be able to provide all necessary output without even a need for the
observer to run "xl dmesg".

Jan

