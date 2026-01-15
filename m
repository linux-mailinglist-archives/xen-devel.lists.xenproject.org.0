Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42FD25937
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 17:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205471.1519717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPoV-0004wM-7Q; Thu, 15 Jan 2026 16:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205471.1519717; Thu, 15 Jan 2026 16:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPoV-0004tg-4k; Thu, 15 Jan 2026 16:03:11 +0000
Received: by outflank-mailman (input) for mailman id 1205471;
 Thu, 15 Jan 2026 16:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgPoT-0004tX-NE
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 16:03:09 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa243f87-f22b-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 17:03:00 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so8813515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 08:03:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee11c64b6sm47155645e9.7.2026.01.15.08.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 08:02:59 -0800 (PST)
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
X-Inumbo-ID: aa243f87-f22b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768492980; x=1769097780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aNMDB5rheHSEk4abqk8B8eFHAGbHqb4XKzIlVPSXS6Q=;
        b=S8lEEiVF9vH5JIBWsRlaTXgnfnTwmnUNkgKZJ0FUqn6DP4iVh+tjGPjssfr7FLyV8h
         WsyV5iVf1hFcxYBH7YYBPye1O7AOd4XjsJ0VuOWhivCHC9lG2iNvjRp+giuhu6qNt8nZ
         2Bbb1Ki8MEbv126lH8DGYzjlvMdThpPQ5gYX7vzw1l/Q6T0/83SdScAsYgZE9t8HkeLW
         g/U4qlHzr3BvNckDDL5WLr1GDDn+xe5DxU6pqq4591ZKK5krM6HgFZIPgSZyEd9PMfdp
         5y5eFP4XE9q27oCKjbTFH/8qVg7x2+wF1bApUR/lnQbSclUGyUEG6A1+P6+RoxyIzZkb
         q5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768492980; x=1769097780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNMDB5rheHSEk4abqk8B8eFHAGbHqb4XKzIlVPSXS6Q=;
        b=m0oyvTC8mg8t9kiZX8lFpN5QTJ33QN/F2chcG9ZoJxA1R1ia69HQSi/OeIN3lUlryK
         EpzVjzUQe4kC2mbhpf7IGPmgTQzHxYaSCJR8c7mIklkB4QA0wyBvZSPXimBYGfk34EQs
         QreI8M/mnixwmC0VhW6PRsNdydF1cGxYPgo5Rx9z+CnZHbAhXlixofng74RaZFHe+uVr
         9YKV8nZ+nJ2/3jgx4uXsP5yD5VHbr9LtZogp2jim+TcKJ3Q/lx41rEXTrVSPUnIF4FP4
         VTuscuci8PXkDfO3l2bQIybeGn8d5bciMEhDwvRydacG6IB2nVrZv+qKqftHZz+14LBh
         v3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWYijDMQZwqqi7cOEjR1vuMaUbsSEe6h5/wqCQavDFLXJ7mSjDbYJ5GSeoskUzEMKk/Xik0KrCfbMs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtmQnUeckoykUXQt2OPAxli2PIonAk641asFufO6Rkr6Mm4Cr4
	SPqJh2R8OllIf0qEUjar9yi+XUifXZ4wfTVEJCwP7Soq9HbqlLt4eyzhsuFyuf9uoA==
X-Gm-Gg: AY/fxX4NZoFh/htqbQZ84HPTQwEIRkZ/ob4Zke4STIW6fj0xGrNfMADJTEWlyBILv8d
	pnfelPentKdzP3vTFuQaBKxHr+B803N/8wvor2l844CfoRnjU2ZZoWPmPeytOIijkv+uxVONbZs
	4cANbvJq24Y1Fgi8kiHR21dsWZf+4Sx8LQpj7BN8UpTJk2XeI3hIjVVYGtUA63d+QC6ziIGdQ/T
	ViajOSOr5guc8XkQdC43UJ1dUYHrtK4ByPmwwj9LcTEIKGSUrxhUniigG7nkoSk++glCL9RQYql
	gpTEFWSM6eWWhxh6/vcdZX1OQnParjJEdaf/+lYeiZZRIYvdpE+CS/4sPQwbqllBZlcZfAKsztn
	w83JvhQX1nYsTHgn0KkO57NMhZU8QFhd90BOCGLnf5ZbWzKlrJEAE5/28YSYniarblYsxwC8sFn
	eQDjB+SaVxsJK2OnA/G3GSjeU+OhmXuP59GHY3+sb7Rk5qu2AeeEagNAUNcKjqtygkqoccqdNrb
	90=
X-Received: by 2002:a05:600c:3e08:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-4801e53c069mr122115e9.6.1768492979583;
        Thu, 15 Jan 2026 08:02:59 -0800 (PST)
Message-ID: <e1490601-f75e-42c3-ad21-95535da6699e@suse.com>
Date: Thu, 15 Jan 2026 17:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: dump CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115125601.70834-1-oleksii.kurochko@gmail.com>
 <8377bdc2-d92d-4c3f-893b-19c842cad3a7@suse.com>
 <a1d750dd-a13f-4f0c-86bb-b2d6edcb1f8d@gmail.com>
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
In-Reply-To: <a1d750dd-a13f-4f0c-86bb-b2d6edcb1f8d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2026 16:41, Oleksii Kurochko wrote:
> On 1/15/26 2:12 PM, Jan Beulich wrote:
>>>   static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>>   {
>>>       unsigned long cause = csr_read(CSR_SCAUSE);
>>>   
>>>       printk("Unhandled exception: %s\n", decode_cause(cause));
>>>   
>>> +    dump_csrs(cause);
>>> +
>>>       die();
>>>   }
>> Apart from CSRs, how about also dumping GPRs?
> 
> Just to double-check, do you mean GPRs which are stired in
> regs argument of do_unexpected_trap?

Sure, those are the ones pertaining to the trap.

Jan

