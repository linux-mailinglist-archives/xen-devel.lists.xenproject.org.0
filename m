Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE10B15A38
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 10:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063508.1429216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1vw-0002pJ-ER; Wed, 30 Jul 2025 08:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063508.1429216; Wed, 30 Jul 2025 08:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1vw-0002mq-Ab; Wed, 30 Jul 2025 08:13:08 +0000
Received: by outflank-mailman (input) for mailman id 1063508;
 Wed, 30 Jul 2025 08:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh1vu-0002mk-LH
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 08:13:06 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04b81508-6d1d-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 10:13:05 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so353133f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 01:13:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe513163sm96377365ad.133.2025.07.30.01.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 01:13:03 -0700 (PDT)
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
X-Inumbo-ID: 04b81508-6d1d-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753863184; x=1754467984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ENrZ5r9vZ1rvZ+7tiGHqtGi7bCeXcP4Hr83ywPNXiJo=;
        b=PQF2uhSVAft6HEWXkZyEB9+eJ8S6nh0TI8d+1fr4lmu+oZbwZB4kX/kekjRz5xEeJ6
         kNgyKMdWQIsC7qfCNPljwWJIIIrKjriwg+pbJTNRFN9K1L5bg9g8iWGZ22x6JrBZ703n
         0U8zOszNFpYi7orfsznFj9uiQDLU2xBtwTqTUPAhu/3pluJlDFAkYe4OipFfZ9plBU4q
         2q0eWK2QIym5BAj0YtNjv33UqkCgHX0N28HiuRG4n7eIEnFa/3H4405tPWd/d//ijeWS
         1Rsh0J9uGXcAfFyV4VSN2SiXvuzMlJNrUUIEZLMmGqB+PEPFVdLbg54ki/TtVl89XzlG
         evgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753863184; x=1754467984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENrZ5r9vZ1rvZ+7tiGHqtGi7bCeXcP4Hr83ywPNXiJo=;
        b=vqkzdlbeHH0Np44N9or4dyl93871LshSaq0wO3kW32ta6903c2XwmUka6LqGV1vO8q
         W8RPEoQj49y1seL/ngxp03fOOMBaBS7dYvXZG2NLE+nzSRzqqjhddeyh/IQ5NoEieW47
         D5Qw5bgmBhLBuIal7XWvMm9AAWIgssRAlAfIwG/+myn8KHZHHcfKqU3JtrXxHgastSdq
         9+LRhw2kUHS6v/zNEzoMj1g5aj4WPxB+NLIQfBLaTbnQCCdloqkn0EYMwCgiVK+c0+Y5
         oR35ryMewfDu1ewhOmAo7oJV1vSMrJcHeK/hEEhZhYxmHAK+65DPfk6uqea620sVEBcB
         TDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhZox5RxVvRTflflplVjIOGPxLQQifI/70HobhslAb8nZq4I5PXtn4f3s1naPN4vbi56sEn1+ZLUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1tkryUc5PKi2c4rNDgqMP7vm1iXPeMxyPCTtzVGHt7UXMLLT5
	8uq2a8JhfG9PcTBMvYOxYePggVtljBs19wjpKC1C6IenejA+7PiBnmbp+Uq4vY4QfA==
X-Gm-Gg: ASbGncsxS7G/DfI9/lzWpWOvbHZIbJrbsJ8lZE6/NNHjNCwbwByR1qzJDBfhhFQLDUb
	7m6BlDchB3u9OJngK30i+6bprvNryx7SQL7xieCYVxmB5jjL9SC/U+bnbFlw8mpW0fua6C7aXTU
	5wO66XjW9Isq3nqgs2SOXXTvfbcVYVnumDOzquLBMVJYucD6Ro51x+1Ku/+CLT6XEF3V9u1FKIm
	eJJvH12989cSWezSe9Y4F860ewgJ+TJDlrGK32hw/5L++4kxGMBxO7jhsKm1EZ5+4/lRlnthYjf
	HiN2YFJW3HbchCqNPiFMDjmKQEeeFjL7AfJRAUhDAgzCdJiScQZXSN6SGi3LUae6P45oZPyDW4b
	jSOc09GYqyrDatUGIhXPasEU2SypLuS4jfpSxVak/FiU5IW+0DEAXVq0E0Q7JilsaZGrxJ1VkE1
	DMLqNG9EI=
X-Google-Smtp-Source: AGHT+IEbLPVagT8DBgRdmMEzq0r1bc4AMBY3jOex8QRXycn0w1dSx0fbeXk6pq5J6uFjHxWORV0oSA==
X-Received: by 2002:a05:6000:22c5:b0:3b5:def6:4f7 with SMTP id ffacd0b85a97d-3b79501e523mr1732939f8f.30.1753863184326;
        Wed, 30 Jul 2025 01:13:04 -0700 (PDT)
Message-ID: <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com>
Date: Wed, 30 Jul 2025 10:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250730031249.1613142-1-dmukhin@ford.com>
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
In-Reply-To: <20250730031249.1613142-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 05:13, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> As it stands, polling timer is kept in the list of timers even after the
> interrupts have been enabled / polling disabled on ns16550-compatible UART.
> 
> Ensure polling timer is removed from the timer list once UART interrupts are
> enabled.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Wasn't it Andrew(?) who suggested something along these lines? That would
want reflecting by a tag then.

Also, what's the real problem you want to solve here? The timer function
would be run one more time after ->intr_works is set, and then the timer
will be permanently inactive (up to a possible S3 resume). Is it being on
an inactive list an actual problem? (IOW I'd like to understand if the
change is merely cosmetic, or if there is some actual benefit.)

Jan

