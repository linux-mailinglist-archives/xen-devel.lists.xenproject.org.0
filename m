Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ICdKYDD12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:19:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196B33CC84E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277881.1562981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wArA9-0001YV-5F; Thu, 09 Apr 2026 15:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277881.1562981; Thu, 09 Apr 2026 15:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wArA9-0001WY-2Q; Thu, 09 Apr 2026 15:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1277881;
 Thu, 09 Apr 2026 15:19:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wArA7-0001WS-P3
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:19:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wArA7-00EEaz-57
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:19:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c368-e002-0a2a0a5209dd-0a2a4502b46a-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:19:19 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c376-42fa-0a2a45020019-d1558035d8b2-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:19:18 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so7055535e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:19:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d532f337sm3249385e9.9.2026.04.09.08.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:19:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775747958; x=1776352758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EoVZJ7Kn6OMlJgGXPSTMvawFoLI6MM2TlG7qRZOTJwo=;
        b=aBw5oqrXBZOx2fnAp3lOhRw/VvOsIC29QOtnaL3TiCyc1QmoKX1JNU/KZLwDK6pqWl
         Gb2QOTO6v2bsWeQn7+dUuT3ukEIjm5EbC52FY4GbSC9LO3zqN4/z+2eJw0vR8PFq8IzI
         2b9myGCy7dJKIcDh+vyIfFzcAklSxFVhRGhAO3n8vKOCcvWlSszsCTJG7DGoSMh/GEcd
         M2deEQZMakaAvKvZn6+UGJf27Tykk9PgB9HkYg0BoDKUdbhjXmf3Ddg2CzLafK4KGTSO
         h1stVGzLmJelpd+ViHtWDJaQ3L7OjMeaZ/xJ1eSwmyPPphiBIyi3nMW4OEM/bRaSJaTp
         ei0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747958; x=1776352758;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoVZJ7Kn6OMlJgGXPSTMvawFoLI6MM2TlG7qRZOTJwo=;
        b=q6MY2cqO3o2Mu7sl7B+gePhN3XAfn8dWfHIW+5TWEJtjATf7xm8ywkpjpK+6t67d8r
         RPIbP7k2CXQdUZDQbp2/RFFHDgVVvm3/Yz33ZQXVd7kiILvCmWsUOs67PppcC4egYGEQ
         1rgdjeVpLj5jhqzt2tKd1y3GwA3cj0JjP5MQLHNZVe6wbomuAkILmPEklZ9/WIhTWC2o
         Lf3jv5uzQ6R4NXNSh1P4TgSXDFZ2TAS7xmqhXwIi0cCRt3WfOj2GRa/oCFVkslXohh2+
         2bxOW7tqG9rIQiCDAnBisXXdf40FOMB8q66uVH5kAn5Qdo7qaFwSFsy/20X866vJmqnE
         fl0w==
X-Gm-Message-State: AOJu0Yx0JMtdBcuZwfviq50Mb8Bntzn1diBLml3TEqELlsaDh7GA0+s0
	pFdzAE7VzYSKOUMVyESGRTljqo+6SCVW47EUMWEe1j5Hk4WfCdUhVYa6+2xYZJkJJx0GE+Vhsjh
	nzRgMnA==
X-Gm-Gg: AeBDiesKJ6B4OH7bfTrnUaUH/uttYwKR7Wzr0l4QPap+RSN2NuwME2Ko2zZ4MKfcIlC
	cmRo1E66rJWheG8Wi+JpCVCe9YLuNz1CShmdL4YkmLpU0Uz4m4dl21qwv1AkxgHTDUz5bGA/4aF
	ufMXky9hIB6KfKnFMOxpxl1M1u/ldw7HGmUTTfnWudIhGs43jYNxWXXBQopTlKXQji8sRbPKA45
	xyqzDqLKWAwWEyzdmBuye7IZpapUvHBEcwPsSLGTCkSpUtDNwYnvZiWcXkkOQu0EZIJ4AGGCd7T
	10GPscvGPKmFoMm8yHJX0q8ACl051nRhbdfmjUCja5K+bNt/tpad8AxCvt+O8m7sOznnMluSRTl
	yHq2b/YRLqM2d9VoTd3a+VZKs5eSrZJ6DuE9KlZBQBQyQ1rAR/9GgM2WqJzkOX8X4D/84ODiJM3
	Ty+f2qZMi7589+SK9er/wr2f1+cRiJL6SFlraS6ItvLW8dTLMUhOCXBz9UNfEXU2K6FQmllm3kn
	GaAo9QbptznViY=
X-Received: by 2002:a05:600c:4751:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488ccf3e8c2mr54835705e9.5.1775747958419;
        Thu, 09 Apr 2026 08:19:18 -0700 (PDT)
Message-ID: <03942243-c825-4846-9043-997bffc7daea@suse.com>
Date: Thu, 9 Apr 2026 17:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/16] x86: support AVX10
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
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
In-Reply-To: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775747959-AE725CD1-7A628FE9/0/0
X-purgate-type: clean
X-purgate-size: 1886
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 196B33CC84E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 16:59, Jan Beulich wrote:
> AVX10.1 is just a re-branding of certain AVX512 (sub)features, i.e.
> adds no new instructions. Therefore it's mostly relaxation that needs
> doing. Luckily the 256-bit-only case and an unnecessary restriction on
> the mask register insns was taken out again, simplifying the actual
> emulator adjustments quite a bit.
> 
> AVX10.2 is adding quite a few new insns, support for which is roughly
> added chapter-wise as the spec has them (perhaps not in the order of
> the chapters there).
> 
> While it probably could be re-based ahead, the series in this form
> depends on the previously submitted "[PATCH v5 0/3] x86/CPUID: leaf
> pruning" and parts of whatever is left of "[PATCH v9 00/10] x86emul:
> misc additions".
> 
> I've tried to be very careful in rebasing ahead of other emulator
> patches I've been carrying, but almost all testing I've done is with
> all of those collectively in place.

As you may have noticed, I screwed up the numbering. Hence ...

> 01: x86/CPUID: enable AVX10 leaf

... this is 00.9, and everything else is off-by-1 (and there's no 16/16).
I'm sorry for that.

Jan

> 02: x86emul: support SIMD MOVRS
> 03: x86emul: support AVX10.2 forms of SM4 insns
> 04: x86emul: support AVX10.1
> 05: x86emul/test: use simd_check_avx512*() in main()
> 06: x86emul/test: drop cpu_has_avx512vl
> 07: x86emul: AVX10.1 testing
> 08: x86emul/test: engage AVX512VL via command line option
> 09: x86/CPUID: enable AVX10.2 sub-leaf
> 10: x86emul: support AVX10.2 scalar compare insns
> 11: x86emul: support AVX10.2 partial copy insns
> 12: x86emul: support AVX10.2 media insns
> 13: x86emul: support AVX10.2 minmax insns
> 14: x86emul: support AVX10.2 BFloat16 insns
> 15: x86emul: support AVX10.2 saturating convert insns
> 16: x86emul: support other AVX10.2 convert insns
> 
> Jan


