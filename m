Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB9BCCAB8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 13:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141169.1475764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7ArT-00052j-4g; Fri, 10 Oct 2025 11:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141169.1475764; Fri, 10 Oct 2025 11:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7ArT-0004zz-1c; Fri, 10 Oct 2025 11:00:35 +0000
Received: by outflank-mailman (input) for mailman id 1141169;
 Fri, 10 Oct 2025 11:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v7ArR-0004zt-CB
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 11:00:33 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56a500d5-a5c8-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 13:00:31 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso1144629f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Oct 2025 04:00:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d447sm3685535f8f.9.2025.10.10.04.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 04:00:30 -0700 (PDT)
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
X-Inumbo-ID: 56a500d5-a5c8-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760094031; x=1760698831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7V3HCKtMFFp/bXzj0XBMuNcCVpAqGXRLdDvCyr66Jz8=;
        b=HsNeAT9ROxWk9zCkU/kZFPqWOMp4qMLCLD3GvicMwhwydgIMkij6SMilJP3hw36mUo
         WWdOofu5rEAT3emnTJNO/vkNy4djC8BH1w/iTON/CiBTyTq3Pr7NlbcpCLj/KW+gXHYE
         bFXNuFeHPrD2babQbIjcSKEE+xcOCmdty37EQ828GBSHYl3Erg16M9UnfIYe22vnC6Tv
         nMIm//YlP2JmtTmoexzOmAq7XSxpGE4coNJbK0N6n/dGpm17kbVAub7kGaNIHt/5rBYw
         UQGm5UB6uedyKJU5lCzJR52SCBUu3CxZbhE4Xm3HHEOr+8coJejDUGQ0kUfhTYqFUIB2
         D6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760094031; x=1760698831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V3HCKtMFFp/bXzj0XBMuNcCVpAqGXRLdDvCyr66Jz8=;
        b=PwrSdmPObKV7SEZHpjZIsJMf5Q/BGtLj30UpfeD83O8hg2p1f4+q5iOwucQuO1k5TO
         c4LoBrXy7RLG2zjcvBosOsuisarlC2S4l0uvRO99MSGEWcV+F9MMUTFERxE0xA7Nnr0p
         GvQm8duveGi/KxvQtcuGJzPhQRlfogd/WTqGsC4b3ylYPHqbsZjlNCJifXLycuJxdzLu
         M0yB7sDEUU3iusxGIiO4nKmVxV8fVAjQ8b7eUbVUABB/4GVgh9C684KL7a2LOG7Q9rRn
         7y6ryqIXDuzNY7X8IC9+dPWn24jf6ZF/RH0vEcuQanstZQgq5rq/jZFQBkLTLkhT8Dr+
         fRZA==
X-Forwarded-Encrypted: i=1; AJvYcCXjitSKAPRNrD21RlJ0NknRhWNjJRgSl1NM0BYQ7Et0Df+wKSpao0P1XPXOhztWMqQy37WUqoci0H4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznLyV1W7xGxh8ULd02fMLxsdjWGJDqok79Hv51zjZD+jmYSaC2
	ySbwU/JBJPvmkoXCHg1R8hRI8WXMn1dXPqlZw+3Ysmpb6V+A1WSisXvgRaBBZxpj1Q==
X-Gm-Gg: ASbGnctC4s/wlj6vHZ8+1C8g3XyqTJEff5huNeVgVhEAvTpteIxPyFkVPSj3U6g/N0c
	TENn6vzw7h9TVyBTAvbPyt48cXUbYNtX6tiWQn03TuznqA2oYktEF6BzymEVtRkJuKBn5guSYnT
	r9SFInJJIpYbDCVAoWVmSe4pG+3g3HOePxJEUS5d5zLnuOyHjV/RGfHlVIWr9sN9aUXU59FDSgR
	bM/BNiQRtepMU+/MorzEW40Z3aWjgnPOYNonaq8Jrt5ginat11692QEv5SuSBssG0RBQ32GYbMn
	cJw/3Pq5rS09k/WVN48giNRDq8FBOp1RmMj5gNOfP9eF6i0bifPT8rd+O/ZFN7oxA5vQUO8nOfD
	VDfvwcZZkeXZ9U3xldidCMliUite7YcO7iOALV8SfCnAm35MW99Z6q+r4kg2ZpocEvHabxWgXgX
	SiNv1KpwakqsIXQtRFDnk041ZwYQ==
X-Google-Smtp-Source: AGHT+IEOLPNvQPRDgttAo8YR9+dgEVpTCla8JrPFv+DeHazhggps6vGngzvjL6Fh35Lb1Z+Nuu4fKQ==
X-Received: by 2002:a5d:5c8a:0:b0:415:7a6c:6a38 with SMTP id ffacd0b85a97d-4266e8e6ebemr6878314f8f.59.1760094030939;
        Fri, 10 Oct 2025 04:00:30 -0700 (PDT)
Message-ID: <3c6ccc37-371b-4457-8d55-8eeeb356c740@suse.com>
Date: Fri, 10 Oct 2025 13:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
 <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>
 <5142b7c4-ab2e-4f73-a60d-3d23fe255ca7@gmail.com>
 <4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com>
 <e875ffa9-28c5-4733-b079-babad3734a9c@gmail.com>
 <fb6debfa-cdc2-491c-a488-6a4bf64ca7ad@suse.com>
 <a4c674cf-045d-4bf1-b66f-96b6be933bca@gmail.com>
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
In-Reply-To: <a4c674cf-045d-4bf1-b66f-96b6be933bca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.10.2025 10:42, Oleksii Kurochko wrote:
> Anyway, if|domain_crash()| is called, I’m not really sure we need to set
> PTE type afterward. We could simply add a|return;| right after the
> |domain_crash()| call and so we won't have NULL pointer deference.

That's indeed preferable, so long as it won't cause other issues in the
caller.

Jan

