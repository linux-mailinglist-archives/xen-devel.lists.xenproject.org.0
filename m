Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A966B07392
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 12:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045071.1415132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubzVE-00078T-6T; Wed, 16 Jul 2025 10:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045071.1415132; Wed, 16 Jul 2025 10:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubzVE-00076A-3S; Wed, 16 Jul 2025 10:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1045071;
 Wed, 16 Jul 2025 10:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubzVC-000763-DB
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 10:36:42 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1a4a726-6230-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 12:36:39 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so500657f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 03:36:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de43352b5sm124081195ad.165.2025.07.16.03.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 03:36:38 -0700 (PDT)
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
X-Inumbo-ID: c1a4a726-6230-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752662199; x=1753266999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jEh+lvp+8WZMFkkSjylUrpAEMmLN46a46gHMVRFyGzg=;
        b=W+kz5he1R5G3jPkHOoTFggBwCungP+X1c4FqlatPA1SAJ3J8iLrkPI622ahs1pzSmE
         LEiPSMG4gzemp8p9RYo8fVByJfctkzjIDj4wIOPp6zWsKXGPuoiBqcBa25b23h0VpM3E
         PjELNdxLzskIFBc+dZ2Ouc0dEsckB1GwoyzotHTiiSLzUO5D3u+N1NhjHKpkxi6Bi6Nb
         TXQ4E+LnxXmm+BPJxeI8NRSwoAvcYQCJFWnl7eaVrFLn24A9IforhKXCLFswVcek0qfB
         MK3OJp0D76TWyrxU8BOjQOc0XEr9PLatOeHW9W4ZN9Dgxoaj/zze12blioX7r+Qkd6xW
         E+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662199; x=1753266999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEh+lvp+8WZMFkkSjylUrpAEMmLN46a46gHMVRFyGzg=;
        b=pnAqAzdEVTy2W3+Ub7jDk4ylci4P9elkPBgGDAYGi7BrQgb0W+tJQZVNSZC7WpDjcr
         FeT1489bdX7LKlnwPcCOfmT15rSdpPzTo2MOJ+AMlYCBh+VrdfDJZdpq87xwY5/21AYS
         Yyow+oNVMAH/oPGcJPljvHVOk008xVOCADUc6IiRtFmj08ChkI4gnHzSCL6GfgR4wOqu
         hN/+uVKS35tg3WCSHq3nL9AjLoh3mSf0Df9Fr0wXorlMmphtsaR7+faqVCCIllVvl8Po
         eKE6h/5mIML0/C025ZmR4/4b75DHWE3eA51+Gkb5jZq7COOBiHEDQjMdfl9HN8lBOK6c
         xSHw==
X-Forwarded-Encrypted: i=1; AJvYcCWe0gyf1MdsOnNdQGFt3XC01z1GBxZ6mi62UAsDqrL7mIkEXc8Gvr3ine6UawTsDgjWe8F9NmXjnKs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVIDzgfwKZBqqgm/T5g/joGzXQA6fw+Rsi5aRxJuZGKuczFBdt
	rcdoM2G3hBeP0Jw+Mjg0TP+ogJIhzmefBNhvlQ4y/lligyf17/vUMT5RoQih9acQoQ==
X-Gm-Gg: ASbGncszDvWxB3hS02RCHjg1FTosxEyJzXvG3yQ9gS2TZBlxqt8SXIKn1+267TtYCFr
	blP1vgN1XBe5Y3no7kGRL5D5dY9CarOBF1izUnFbKeGU783SSs7O09rDYyrvg97wzrpKuQ+Y2e6
	MEl99cjOsugWowrcm2E/AVEX2lhia95hp8+4Rc0nE35tXJowN6q+MExNKaA2VBvJ9Sv1OdJQWjF
	4OTaIx04q3W2qa3wvIKDVndxoi4YRwBNKfQiKDNdk2RaxTCrzUKRkd9NqtrXs4zY0ioG2M2O9tT
	z7JxDZI6syUqfi6tDxztTzr2D/mO34JvIpVBK807PDSEnQKk03pUv9144s3KD9mhrj+D5kCaSOY
	73lLqUhUek9LGCzWJqwjhorQ8sBdtUzELolBB+rYDSQkaRm7sUUgduv4NkwdI75w0nrdTooYqF4
	VGD4qACA4=
X-Google-Smtp-Source: AGHT+IFilChow4OolAP4OkA7TQsKmGOtYngHKOrccKVMJXjXzuQKBln1FERV0YLtbBN8Iq/7dR6xDw==
X-Received: by 2002:a05:6000:250d:b0:3b5:e07f:9442 with SMTP id ffacd0b85a97d-3b60953f674mr5791694f8f.19.1752662199335;
        Wed, 16 Jul 2025 03:36:39 -0700 (PDT)
Message-ID: <117dea4d-b872-4ba4-9acd-aa0de0edd7f3@suse.com>
Date: Wed, 16 Jul 2025 12:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27,
 28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Anton Belousov <blsvntn@outlook.com>, xen-devel@lists.xenproject.org
References: <cover.1752533080.git.w1benny@gmail.com>
 <07aedca58d88ed741e13e073f39fdc20f29292cc.1752533080.git.w1benny@gmail.com>
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
In-Reply-To: <07aedca58d88ed741e13e073f39fdc20f29292cc.1752533080.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 00:49, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Some SMBIOS tables are used by certain malware families to detect virtualized
> environments via WMI queries.
> 
> To improve stealth for sandboxing purposes, this patch adds support
> for populating these SMBIOS tables from an external binary specified
> via the "smbios_firmware" domain config option:
> 
> * 7 - Cache Info
> * 8 - Port Connector
> * 9 - System Slots
> * 26 - Voltage Probe
> * 27 - Cooling Device
> * 28 - Temperature Probe
> 
> If particular table is absent in binary file, then it will not be mapped to
> memory. This method works for Windows domains as tables 7,8,9,26,27,28 are not
> critical for OS boot and runtime. Also if "smbios_firmware" parameter is not
> provided, these tables will be skipped in write_smbios_tables function.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Signed-off-by: Anton Belousov <blsvntn@outlook.com>

Once again - who's the original author of this patch? Anton, aiui. Hence his S-o-b
wants to be first (chronological order), and he wants to be tagged as the author
of the patch via From:.

The patch itself looks okay to me now. Yet I think we want a SUPPORT.md addition,
clarifying that passing in any such overrides is unsupported. After all a guest
can easily be presented bad information this way.

Jan

