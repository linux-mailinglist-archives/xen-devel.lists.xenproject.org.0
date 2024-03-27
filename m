Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CCE88DF63
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 13:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698504.1090221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSJW-0000Jv-Fj; Wed, 27 Mar 2024 12:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698504.1090221; Wed, 27 Mar 2024 12:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSJW-0000Hp-Bw; Wed, 27 Mar 2024 12:23:30 +0000
Received: by outflank-mailman (input) for mailman id 698504;
 Wed, 27 Mar 2024 12:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpSJU-0000Hg-G4
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 12:23:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d065724d-ec34-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 13:23:27 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso7072380a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 05:23:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b4-20020a170906708400b00a46da83f7fdsm5402289ejk.145.2024.03.27.05.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 05:23:26 -0700 (PDT)
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
X-Inumbo-ID: d065724d-ec34-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711542207; x=1712147007; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XbDiofXKsgUOJ3QRwntMggYbGvn7MzAkK+BbvwXgxQY=;
        b=IymYu4urze9FDdePyAAkVYwS1bEsQloHdj7+Z8F8mkwDNw2SSU23CA081vYCgWcb05
         GHCdQpkIzOhTWr9GXjhqmARfD8YKLGFchFwqG2qtaHP0zRLxX+0LOvQaYxMeG/CUdRNa
         ezLE6x8yc3hdx92OmQJ/kACal8A94F5FjHLD8YCko6F+ESDk6W4+xFgutMmxz2Bup/bt
         dwRqTbiQwtkHh5AZ7ooB804SAGtyzbz+a//Q0sayJKITlCuF59ZfxeFl7cLVhYccZOd5
         9TZmHN0shvm0dbuN+mL1a2J7hekU1ZrX4mVWRMEcPX+kLM/49IqEHZsf2+xU32bmkPcB
         QH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711542207; x=1712147007;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbDiofXKsgUOJ3QRwntMggYbGvn7MzAkK+BbvwXgxQY=;
        b=VsMUDsJiPDKlHiVEbHx12YUl6dthuKtOeWWL7/zJSc1v7++7JGhQL5PB0wTMUwiAfG
         oPus4kGKTq1V1wViVaDw+nus/zGl8ad/QmIXDBBwEkP8vvQ22zE+0hbsp+vZtcrXdpOF
         R0q0EwFANKQ/XpcejlR2eIG65fSzDLwY5zUtavlZImuCEIJpdTnnXnrhJS25jQFyHmoz
         5sp61d1kIC+uD4wv1ULIRKvAPbjhLF8Rcgg2eRyF2+dOBbRf/oC5PwdmhExBh2vGhZ4s
         67Bq96oUlqb/O50naD8eOu6jxjKjdm5jdnycP589G/sJxw90VInxTG/ljfd9XMdnsLkO
         cyZA==
X-Gm-Message-State: AOJu0YzQ1pmCUQ2KWpZYMqZTdaSIxcGSSiP04hvZ295PVAj+ZdnnC4pi
	n5VKWSf6PxHbH+V7kICPtzCiGmYv2ll+Y5r7/1lVRWX1a9u56qfO3DFuGsHyyf7ejomMkQQqLAI
	=
X-Google-Smtp-Source: AGHT+IHiV1L9t+2F8KhjOtx7V2MPZxqy0FYpfaQoqHpw1PtiQd4p2gBVErG8JHo2cnfT5z1K5yNotg==
X-Received: by 2002:a17:906:5918:b0:a4d:f927:f747 with SMTP id h24-20020a170906591800b00a4df927f747mr2511928ejq.4.1711542206853;
        Wed, 27 Mar 2024 05:23:26 -0700 (PDT)
Message-ID: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
Date: Wed, 27 Mar 2024 13:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.17.4
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>
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

the release is due in two to three weeks. Please point out backports you find
missing from the respective staging branch, but which you consider relevant.

Note that this is going to be the last Xen Project coordinated ordinary stable
release from this branch; the branch will move into security-only support mode
afterwards.

Jan

