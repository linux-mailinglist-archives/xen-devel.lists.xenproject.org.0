Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AC6B22041
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078366.1439349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulk1Z-0000MP-KU; Tue, 12 Aug 2025 08:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078366.1439349; Tue, 12 Aug 2025 08:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulk1Z-0000KF-Gu; Tue, 12 Aug 2025 08:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1078366;
 Tue, 12 Aug 2025 08:06:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulk1Y-0000K9-B8
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:06:24 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c834fe7-7753-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 10:06:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af968aa2de4so939039166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 01:06:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af99604e648sm1166011566b.6.2025.08.12.01.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:06:21 -0700 (PDT)
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
X-Inumbo-ID: 3c834fe7-7753-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754985982; x=1755590782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A9aBB6lecwzo1fq4Qf6xjEh90CLTo+xgCO7eVuN4nRA=;
        b=TQ8/JjHL11SfZP5SYFiad/sqheJlrZ0NDIArosJBcPSggZYbzmaTpcjMUZCH/F3p2J
         KaBCwQPEei0iBvAdGwG+wEhSAIDG2GT58avLRh58sROs7yLbGfcSJWTZNTPCQMamY1jd
         w+dThshaxQmeu/csOLWJ7QyCiJVloA0ATY1XyKtg1oP0W/JJduQkVkLklO91QHpXJUpp
         ZkoGdRh7bBHo784Jluj9e615/1DG4PlbUS+79YkoOpZ97icenuTtZO8jRJzRGZwrK+wW
         t6KbHHl1nmVOoZhpI3/ECp20hPimJKYvISwhoGplQkNCaFT8A4cP5rDOtZKQWtAdEeXA
         Rzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754985982; x=1755590782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9aBB6lecwzo1fq4Qf6xjEh90CLTo+xgCO7eVuN4nRA=;
        b=aZfq8/3ya+NBBzJMbybx+n7dgAzkXG6f1KyM8Nco7Sow6PQ7D6xhu2Mh1kZNYu+3H1
         QUGMXICFZ0QSKJSTOk7XXa0SBYbLtw5YA4fhJ0yN5ouK0mnqGmAJzm95nDwGbQujznRT
         GmnqVPxsQjOuS86h3KGxh3Qmb53AZjV7aUp60FXskHFtLOqEEalNiM7MK5Ik787IGngu
         fqjTj4gMVDYf4R34VCzvDspwUUwcbx8LYRcVwoyqZC69Env9F3RiWOVFw0yp/tGhnwGL
         FJd16ZZoZ6i2b/IsAfvHBijDK7iIk4/N+p52s3QRpXR4tUy6GCErtvj8Hg8Z9NINQigh
         89og==
X-Forwarded-Encrypted: i=1; AJvYcCUbk3VL0Rmq4DAVn9kxKyH5OHtGY63l2Ptl05NJj3T1Mv9nH0aNuxqlSaTXGRc3UNokLSNP1Zqq74Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMGwVYS7Cka5zDN0F7sTp/Qc7F2p0cam12PPZxdXwZAzkLPNfw
	9pcqG5lYRcrNObf7CozvNFSVdX6RHXd59iHPrsEY6+rrGmKB8BLnMxnzEi8J3gfNtg==
X-Gm-Gg: ASbGncvW/yNo3esGiUHxef5SBMneOMO4fhaEOtBsJbqtQb7p+5Y8grsjG60h1wYHjIb
	p598k+V98fgAhpC2/L5p9me0MpaoYDGg8AXq+qXUD6RwbH1KA0dnqurIPViQ9Xsi2KW1iM3ZKjV
	oZm84olbxHyCich64jsmsFjdOpV0If74+6OFQvjA8GJvmgrucA7KZCduBbpAuDBRtXqoqhV2Mg0
	3Az9UFoQUWnFCwzOUZrdUdRbtutPwDd5SRIuXyJnD8M2ugiZH9NldJY78kq3TyKPJnBgZ5sk/Ws
	1sm/ZR/mgSIo3ReTtmUOtuZuwZnyuDRtqakYh4glKrho4Qdz5r8JTvh6kSR2ltEJcvfznbfVVBa
	cNw0qy7gUOoCjd+gPN6JuPges1+AvgpA4gCxF8gRLFKZcOXjRd9fMKX7EI9eyY4U1/cJ3Dxrrb2
	Q4TzXs/rM=
X-Google-Smtp-Source: AGHT+IEgRO/PYnFkRw9te58B5COpsTHplJJYbSRFJs2RDYWnqRj5wXpyRTYHV1xod1fBIvBPLlNkGw==
X-Received: by 2002:a17:907:741:b0:af9:467d:abc0 with SMTP id a640c23a62f3a-af9c65587e2mr1438392166b.50.1754985982279;
        Tue, 12 Aug 2025 01:06:22 -0700 (PDT)
Message-ID: <9f13d1c5-8f92-4a73-8a67-f4b44b72fa50@suse.com>
Date: Tue, 12 Aug 2025 10:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] x86/msr: Rename MSR_INTERRUPT_SSP_TABLE to MSR_ISST
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:22, Andrew Cooper wrote:
> The name AMD chose is rather more concise.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm okay with the (much) shorter name, so:
Acked-by: Jan Beulich <jbeulich@suse.com>

But I can't make the connection to AMD: It's INTERRUPT_SST_TABLE (figure)
or INTERRUPT_SSP_TABLE (text) there, afaics. And ISST_ADDR in yet further
places.

Jan

