Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900C6A81F70
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 10:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943603.1342294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QX8-0002Cc-8H; Wed, 09 Apr 2025 08:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943603.1342294; Wed, 09 Apr 2025 08:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QX8-00029h-4N; Wed, 09 Apr 2025 08:11:42 +0000
Received: by outflank-mailman (input) for mailman id 943603;
 Wed, 09 Apr 2025 08:11:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2QX6-00029b-MB
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 08:11:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4081c2d3-151a-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 10:11:34 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so58245895e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 01:11:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0ba0sm882009f8f.64.2025.04.09.01.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 01:11:33 -0700 (PDT)
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
X-Inumbo-ID: 4081c2d3-151a-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744186294; x=1744791094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f3/bACEeHbPBEiNZHDVeNPQYoGbCfAKE8jLbl/6Ek1Y=;
        b=CCN8jfNsdSAAxAhUi4VV3uub7Q/X2jvGECtXmmx/banLYh6awshUTZLkmoNEUPYPoq
         3VPFv3cXGusuUJKS+QRgYn8zarvQVs8ks6ExxITvZJZf9RVqJ/PzPG5Mh9loMqAaZAtJ
         K5HUL76EPb/NKcei8VP3ptprIShLApV+49ci373NI8SZB0GMfs3q35PFBfpqOkVEQ4sW
         qhu7z9CSVhuI5u2lKuFIa+/oPFJIomj8HtSKaD5fZKD9qyjlt7GSedgi7wvGQj9b9IQq
         YZsCI+83iLq//SfDKxmr2ennzl8A5fzEune1GNy3pLGDzpw40kfHhDa2ZQk4uIIqihlf
         uLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744186294; x=1744791094;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3/bACEeHbPBEiNZHDVeNPQYoGbCfAKE8jLbl/6Ek1Y=;
        b=avhV5kNnVtNVsf/FT7tpX29y06qaT1AlOKjLPo/w0u1NnUN5teLj1mPOjwVwv4J5VZ
         nrSx2zQy2yY71IKT0lPoDl2/x/LU8Blcx5Vmy6PG8cmpLtZ2msLNbVlRom5ND521NaMl
         mJ7X+KzvF/1Z8pq7fVKFdo2na6tumpEitDZRE4ifzEwmO/Sw9Sce4Hactg+ZqEYMfnm8
         V/z3Q7nMEgpwdapdhQNzVRO/FaD+gq6/Y9pypMsPR9ZUsNXLITgkH/Cyqhn0yWE4KcFF
         9HKZ3plmcDBy1XIdXyIMU3Pyq2Lljo423NREbf7VjPTwdRqJ8YxXOPRiGcJdcbfYeLRW
         dzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6UfTwNPlNeWfwbX0SNDbig4I9XSPDPDCNC5Pw0YwPI0x13VMhG8hKB/F+GZ2Ntnb6KbDs1PbfxC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3r/gjLSicUREo/VZ2y8EZCFbAYQWwp15//uF2PJqKwsMLHU35
	p5ZAxCaze0u/r4oUALumjbLaAfj/MSQmL5mJXY0AL8ongW5b+PkEHzGfL4IenQ==
X-Gm-Gg: ASbGncslHJyHT1OyUNOO4aaxCbJ/6JCmU7lKhZI8KuTp3HnnmTSzco6TJgR0lZytd5v
	zgvdiyVMDb6PE2XQDwLfX9R4B1ybyR++6GyoiRVHWlCrDXg2A7lH3+n8h3VuMry3065sc7WFg8c
	ZGDRW7XQHLMeOZG0n4TbuvrQG31LRnrreZv61zGS5XsaKO5ZyRxZjLoSDk/zhLnaC35FWHgiG7K
	xiUPmOfkkPvqvagTLvzA/aBBFHwarRPtOJW8N+0sNziLkc2Yah8KPdd7zmZmIKTlVqFlfwicxqk
	xJPS5+IMPRgulhxveIqAx4sWOBva6sBHhA6XW3oRzFRYbaRPJFoC5pZImaz9TE4RAG2D5wJzBmi
	hiUxNZDZp1g9tlDXer1AEb8RcrA==
X-Google-Smtp-Source: AGHT+IEObVlXIrBjk2z5fbJElPCx+qkw3LZwRk0Al6/g5aSpUTRrAUgiFemBvMu97RXLAQlotyhoLg==
X-Received: by 2002:a05:600c:3b18:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43f1fe7f6famr16419905e9.15.1744186293933;
        Wed, 09 Apr 2025 01:11:33 -0700 (PDT)
Message-ID: <0ee42612-7f3e-451b-9844-7e61aaf0ba38@suse.com>
Date: Wed, 9 Apr 2025 10:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1 2/2] x86/amd: Enable TCE in Xen
From: Jan Beulich <jbeulich@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
 <79b08632b74dc13b8c399003eb76d198cb73ac32.1743771654.git.teddy.astie@vates.tech>
 <699022cf-ca2a-4500-92b9-914fbbc2c12d@suse.com>
Content-Language: en-US
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
In-Reply-To: <699022cf-ca2a-4500-92b9-914fbbc2c12d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 09:11, Jan Beulich wrote:
> On 07.04.2025 11:10, Teddy Astie wrote:
>> Aside exposing this flag to guests, Xen can also make use of it to reduce the cost of
>> some TLB flushes. Enable this flag if supported by hardware.
> 
> As said before: This needs to come with (perhaps a lot of) justification as
> to it being safe for Xen to use without any adjustments anywhere else. This
> exercise may not be left to the reviewer(s).

One case to consider in particular is a shadow guest (EFER.TCE clear as per
patch 1) running with host EFER.TCE set. The TLB flushes we do may then simply
be insufficient for the guest's expectations.

Jan

