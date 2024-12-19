Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A5B9F7E33
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 16:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861291.1273226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOIag-0004fJ-7L; Thu, 19 Dec 2024 15:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861291.1273226; Thu, 19 Dec 2024 15:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOIag-0004dq-3S; Thu, 19 Dec 2024 15:37:30 +0000
Received: by outflank-mailman (input) for mailman id 861291;
 Thu, 19 Dec 2024 15:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOIae-0004dk-QD
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 15:37:28 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2633e2c2-be1f-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 16:37:26 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so485792f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 07:37:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acafesm1794280f8f.98.2024.12.19.07.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 07:37:26 -0800 (PST)
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
X-Inumbo-ID: 2633e2c2-be1f-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734622646; x=1735227446; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WMTQ04gHAClsP3haFtxaUU6utsH1v3ss5HoocB+3fuI=;
        b=FN13dd7hzr5Nfwb5VXZUbP/4N77j0Mdl1xyjVQPj119vFDVSIDw24ZIbqD0ivDqrK+
         tj/8jPii49MYwAShEBw4Srl5UnJkyiFzcDsH4HdKmY8hULTpkNy8I/a5OXbXHdxd/Kyc
         5/WSsC8gC48NPP50c7BOVpDFA5EwcN/tp+V9iDld6CvnbRjHMP1P/hNvGpPHqolcsKkl
         0GzRoeDc2gL69G0IDHxtYHlT/nzQcIvNz6giQU1T8L8lKFcr5KwnbpSIVhweRXj+0ALU
         CeS18Jawn3IqJLPLhynbb2T7gBpnluX+S7k/CRqfgj3GeynUxPnj60njfH5YWg24Pv0R
         Rp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734622646; x=1735227446;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMTQ04gHAClsP3haFtxaUU6utsH1v3ss5HoocB+3fuI=;
        b=v0BRm66XKhXcsmY7h2TvgI3RfcLnP3G+10CWhGRSrPHYAoBaof+ao03Vf1kO8Bc72Q
         uWuM1/Rng6/aNq3cLv8069hQSj+g9ovS7Io5M3ELHHcEoZVbVKWCRgswrzDkxULWR12/
         SGUmjm5+wDEula06VUZRdK08J4VXFY38Lu7b2RpbajgQubktfWxp7LkJaWhla5DSQoOw
         BTaqAB+IsHx0073HHr43sCBSMotjBhjVoQmIwkBLFSnYGUUqBH6Le2vf2t0QjwLN0tLk
         hr3EUwopz09lqRgjo/ODxNYkzFtDNUBHpddS4gtK1r/O+JuUaRr8mwKw8Lgji4vhH02V
         vsSw==
X-Gm-Message-State: AOJu0Yx4UGY/jZnZvU5WBqdWQs5So7Zps8ZT7udivIkgjjgyF2RY4y/U
	hdk7XLiRi43fKAAG+1Qf8nhN2hModJkoNwpVgT79JmsRPYbQS/PD8H+Jk6ENqzUmZl/7+ovvytA
	=
X-Gm-Gg: ASbGncuO0iC2bcN7115DqA1u901CSdEFwPeBfHOaMoP37lIpQcHUmppytyBA9zgFqkT
	ROTvSOiRwq2i1q+ZNEUnG2wbq/HdWFv4eUVOCZzOTvqcI2dq3A+xhOVBRuQp1kt8EjWQGIxI3IG
	miWgCAZEqbReLxRGg0+q99sg8Zo5ZabqyLqPP8WS6hYeBJOEkfqvbZCIIY/Ll+6lZRrMCMgY4dx
	MztrD2Tj9u4ao1Yxy6aaexbcssRyZZFoezO+9ikfd4jgoF4Bo5GWdKKS+Wy6Az9avJcVHieuroY
	GLYWVe/3S5afDU5QYoud4J6be7jsvgf7hcB4cRCa5g==
X-Google-Smtp-Source: AGHT+IHDeS9QZhu7pwcY7zwGyEnH5+gTgZ2/Fxt6Y3e0LhBdIOzMNwR1Ksva8eclwZo+WNPEK1qADw==
X-Received: by 2002:a05:6000:4b10:b0:388:da10:ea7e with SMTP id ffacd0b85a97d-388e4d4466cmr6433490f8f.24.1734622646463;
        Thu, 19 Dec 2024 07:37:26 -0800 (PST)
Message-ID: <fa373eb6-038e-4c3f-a9f9-6397fdd4e5b3@suse.com>
Date: Thu, 19 Dec 2024 16:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.18.4 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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

we're pleased to announce the release of another bug fixing Xen version.

Xen 4.18.4 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.18
(tag RELEASE-4.18.4) or from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.18 stable series to update to this
final full-support point release. The branch is moving into security-only
maintenance mode now.

Regards, Jan

