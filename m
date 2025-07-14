Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D73B03D7A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 13:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042783.1412854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubHUL-0007Gm-Q4; Mon, 14 Jul 2025 11:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042783.1412854; Mon, 14 Jul 2025 11:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubHUL-0007FE-MR; Mon, 14 Jul 2025 11:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1042783;
 Mon, 14 Jul 2025 11:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubHUJ-0007F7-MY
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 11:36:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d324c2fe-60a6-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 13:36:47 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2312734f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 04:36:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4e156sm10759937b3a.140.2025.07.14.04.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 04:36:46 -0700 (PDT)
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
X-Inumbo-ID: d324c2fe-60a6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752493007; x=1753097807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PvOljKke0llDRrRS2u2YXGFdnwl3WXlftZ62i36BUBg=;
        b=IWr5WR0izM+I85fFjZGppwLGLNFSNjsKqbtw1hCSvH2wfnKaRyYf8AAMija5cEvN3h
         hsldp151zNySteeVM8WQxe/50DQ+G1+dLGCDoViPBlROjPkketi9CIPsfyt+dLpzH0D1
         oEoKrcF3cyt5AsY/qKgz87MvYSevjlR25Jt6hu67tpR3b2JaJsNHBEqXCLbD1UHaCb0f
         clAjuAUXqmGAM/vdvWFvAQEGjfr8fRk5QSLz5XlPp9HdBRFTfOCf9onaDoHujHZzwOlq
         iB/e0nuvGwyJOhknA8YtyEybkcsppI4lQRzytrNdPQsMn5kyKz+F5Gt/LhQc/XIC4r8n
         aa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752493007; x=1753097807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvOljKke0llDRrRS2u2YXGFdnwl3WXlftZ62i36BUBg=;
        b=qRm4K85B9okSLaM7J8xVumayOC10W5xwCu8xhw69HTnzkKdKAZxIf0QENepRnmulJY
         0VhOP071XnuHW9u3UKBAV5MyDMA42Btrt9LxOTTpsgyeArtqZZv+qzl2K+T3fKwh86X+
         KEm9yKUzCW7GVpIPkryv3NQi+cMCdJi9b9uWZv2H/SaNyCD7pSaFIeEmloA+xsO0LGSX
         574b6G7oMpMiDgM+PSSZuG2Fy1FsQTjeOLqxzFAnACo6iFji0QbmhgZN307FoyuwAoXB
         DMStb6j6v0YYUh7/nG2Nnw0QBUBa6JseA3spq1yk6wSLmjULVN1mqXa2gzDdYmMYD1bX
         HvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrpQuQWo81PUdK0IdIfzT48RxXYvPp60n+3/8iDcfAl1NsvNM4I1kM+6P0QGQVNJyLy477iTffKBU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2999HC+sUTf/YUp1yArqXQZnhLtUrEoWtjsZf4Mb6KkLFlDBb
	ghtwIiEckGiR0p0HrSjxdpjhKoEqaoWGFJWZVLz5DbuprjtBo/m8JLwxzoEiHR1JxjrSIgSGSpn
	FJXY=
X-Gm-Gg: ASbGncsH4fNhXIaMZ5M+9jUC5efip/OJoLrF+oANSmBHFAxu4Hkkg/IR/eFc4Qmrtem
	J90vzRRbq1lhlQnzbTLE1L5OVZweA8BaYjw0QaAhwr9GkcsmIXXhyzlrOO+5VBPM2FM2AvZAMIn
	Kn/ulxpkOGIhg4khvgSYkAY1aSI+x8PpV5FdebGqggkz7+fK1bGUWK/E88iAbKt1ECpssjEzirb
	SVHrRMrWKHtj1emPamVhiu4fRm9T4eu7hIGM0CcECbCgRn+E1+cPWT+aGrXcz4pUploSKY3FcDR
	5vsTKVWMs3cpJc9mGQ8F6XELRdPvfktjfET+r0PlDjIZhfvL08OIsOF3Bqv4/NTJi5C0AmRtp1f
	PosPh+tkF946BgNdWWW+BJ8evwNc2VENIn065vjOyNvNUVs9+0hkHvbDuA/y68hSGigD3yXPqXr
	3YVdSdcgvPEDU0YEoWMA==
X-Google-Smtp-Source: AGHT+IG0sTqzKO9EFWnmoIwixp9i603o2cw2Mg/2x7Ze4g9DjE8jnvq2KTsumPe2iLuVjvQMzmH4WQ==
X-Received: by 2002:a05:6000:4408:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3b5e7f35328mr10007094f8f.24.1752493006610;
        Mon, 14 Jul 2025 04:36:46 -0700 (PDT)
Message-ID: <5c8b81d3-c46b-4ab1-9f02-c809670d0ac6@suse.com>
Date: Mon, 14 Jul 2025 13:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviation of Rule 10.1 for unary minus
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e6263a15c71aafc41fe72cecd1f15c3ce8846f2.1752492180.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <7e6263a15c71aafc41fe72cecd1f15c3ce8846f2.1752492180.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2025 13:24, Dmytro Prokopchuk1 wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> MISRA C Rule 10.1 states:
> "Operands shall not be of an inappropriate essential type"
> 
> The unary minus operator applied to an unsigned type(s) has
> a semantics (wrap around) that is well-defined by the toolchains.
> Thus, this operation is deemed safe.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


