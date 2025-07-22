Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8FB0D424
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 10:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052092.1420609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue81k-0008LN-To; Tue, 22 Jul 2025 08:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052092.1420609; Tue, 22 Jul 2025 08:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue81k-0008JJ-R9; Tue, 22 Jul 2025 08:07:08 +0000
Received: by outflank-mailman (input) for mailman id 1052092;
 Tue, 22 Jul 2025 08:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue81j-0008JD-4p
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 08:07:07 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6185309-66d2-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 10:06:57 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so52823015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 01:06:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6eef8esm70396865ad.188.2025.07.22.01.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 01:06:56 -0700 (PDT)
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
X-Inumbo-ID: d6185309-66d2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753171616; x=1753776416; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D7csirH8r9exFgDqbrM5fPhaPW1BSyRc/Vk/yFaQxG0=;
        b=Q4OE8KJYFWtcETrl3YPnntvhoIuJw6BxBbs4Oyv1KBEHWFHvoa8FP22ABNiXwmz7og
         /6haWZcvKVscbig+Eriu5/uSGjXgfBxba/ucNtQf2c7uDDLthPevOGvYC5FNRg561p2F
         Rr2MUdIGjScRuyzMTbpmEKfxZRNxwmdZXpR0ifsOTo2B0cAVkzdl605TKb7+aoMCly6r
         Ej4JJC26ETmzI28BBz+YFFcVfeZEvOB4J2fXvt9dI/NX4N4C7olLznfMRoY0kA0scsGZ
         pKYRUIBPPCBRjNpC4yBLQ9Hxr6LhTBxi9ugHGNvEiaLSuSzQAAfOCVUf7/I533HTijxi
         H/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171616; x=1753776416;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7csirH8r9exFgDqbrM5fPhaPW1BSyRc/Vk/yFaQxG0=;
        b=HgapnDjZh0qVCJdH8kc1syDJEWpOQ+AOwor9SFdfNYWql7KhdAoboKcKYZVCUAGE8w
         VMzLbTgewka42lr87tpQE/7rxMXoKu5pOcwtPizdxbNc8FAjPGymV5lDYHuhDIE/Ej60
         4DrIrOdj3tskHhrpi/MySUm6axPeYKEY8k24waKh6tHEgWIZeaMiFtcCJGN/Ry7CnQWI
         9d++tdadQgilhHHf3q37K9OrsefxZPSsHJddqHG/VeiwEJ5z1rgDHRRDLURAGXVwHqfe
         GIDdVHrAYErKOgXPpl920VcXX+0CCO40Y2zndSvVTj1BeZBuv2D60sCDI0COmJOJfrr2
         SPdg==
X-Gm-Message-State: AOJu0YzV5r5Ak1/HliWtq5jar3yhMyO1/HnGmaaceN5kjxxG98TE8ZIn
	oRcX4/gKTaq6lqGhT6/K091DMViQ5hmO8I/JdK5Vq4xInE85zktX9U8HzrP4p12SMUiONcky4kX
	v85s=
X-Gm-Gg: ASbGncvbxklocBDuGuJy2Fk6CGy1jw2USHm97/LsfLeyFfOyzylZnjuPTINra0SUFtu
	nmQga7OVnXl9tprq/DugiHD9nocMxu52SbUkJqXpPTuHEKcwbyNOU8dG1L+msOCPB9nvEcHJkjE
	8ADanJbDh1rHvFO8zhEtMPuPbSw53yuy0sq480S/i2XddMtHkkSh4MrbUeHbduF6anDssSloI5W
	6WuMlExkQmrlYZPj/5NSUriHC68SjNfXr/wQb2H49B3qArLOrMlILS+prwjTop5GvL61gG4bRvr
	rc81q5M79wsljgB3/d29QE3a7PGaHHiq6waGDs8pacXMGC9p6kntXKvTOxpXAItuY8I8/0qMhkX
	0isKcll/B0ZcSl4NM2oaBeIzyvBnFUmPRPAvyWxJmE06mVPj8+EwMAvpCia+G+3F9iUUTvxCNst
	0WB1uz8rDYl1K/Zy3QeA==
X-Google-Smtp-Source: AGHT+IERStN+s6mWJr6FgrfP/mzsC/Dxd24Q799BBjKg5FFs8c4Vp46X9Y+dg33Hinnkc+vQfWQ0NQ==
X-Received: by 2002:a05:6000:2084:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3b60e4be952mr16020837f8f.6.1753171616455;
        Tue, 22 Jul 2025 01:06:56 -0700 (PDT)
Message-ID: <c908ce03-57f4-40ac-9cfb-b677d299692f@suse.com>
Date: Tue, 22 Jul 2025 10:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.19.3
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All,

the release is due in the 1st week of August. Please point out backports you find
missing from the respective staging branch, but which you consider relevant.

Jan

