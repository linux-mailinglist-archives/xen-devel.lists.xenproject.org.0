Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA69C5876
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 14:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834616.1250242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAqVm-0006Bp-UK; Tue, 12 Nov 2024 13:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834616.1250242; Tue, 12 Nov 2024 13:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAqVm-00069r-RX; Tue, 12 Nov 2024 13:00:50 +0000
Received: by outflank-mailman (input) for mailman id 834616;
 Tue, 12 Nov 2024 13:00:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAqVm-00069d-9I
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 13:00:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21ec7ce8-a0f6-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 14:00:46 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4314c452180so37496465e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 05:00:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa70a226sm250772395e9.28.2024.11.12.05.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 05:00:44 -0800 (PST)
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
X-Inumbo-ID: 21ec7ce8-a0f6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIxZWM3Y2U4LWEwZjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDE2NDQ2LjU0ODU2LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731416446; x=1732021246; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K1zeAmAx5HIq9zm/0VfPfddci7gmumWHqQoGlY32Y48=;
        b=ef1blegd3WFsDo7CjGlAWlrtmIpmBzGo2IOHFdNdZznGmNM3X43AVmS6a+18Bu7NuE
         vkX+rbRS0yp41a1X33FVlzXqbW0WRKMRvw+fstUqfmSP4b5eSYGAOscfm6HrxD5zms8v
         6f9x+TElVUb/OZE3flT1AnMaTW8+54ouS+lbta8RwWBsgLMSY95ee2/Q3Q6UI/lxzvh6
         5/XVsaSs/nneMZooXr2wFMCo9occHlDqHkv1OOprrvtitZFRjo4aVFexWJMsoMgIopgr
         8sH4B89hqZlg7d0D8rRuMONksyIItAhlv5Hhty77Na/K56ZelP6dLDmjBbbbpLwy/DB6
         2gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731416446; x=1732021246;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1zeAmAx5HIq9zm/0VfPfddci7gmumWHqQoGlY32Y48=;
        b=oRBfySis952ZEH5NIF3Q5j7YCnmda37ra3BXbh5mONxRnB6hsNEiJi5xYawz+qN1Fp
         exmqvyJI4EOa46soCnzqoyip09lKY6QQyH26VmkyHr0d33DNUr97W/mCCvHVXR7a7k+s
         /iAJphfnpk+33KST+25NdQ/ME4ivCeJpsLEyNQBXVIClglUboFqBkmf/4XLyeqzW/0Jn
         utAW4z2nggUd7RbIARrluqK/i65p5p6P8mEPHZTOM1/+G1ORctVW0wkYLZNTGajiWdco
         osyy/iuhzRNdwi6mZtEkGoN7uJZdOMhvL5uh7+kgs8y+i37HzTWMR4SPofqMU/+3FodP
         C8IQ==
X-Gm-Message-State: AOJu0YybfRQ7OPWidR42mONGOASP5Y7+7RGpfWHOaTe2CjnzP0VFQLeU
	yn16Q3X/7k5backkM9QdaMO1HGgUzGZIFn7yqJxBJjf9vpETkYx7Rjh2LKwj0cRs1ftktW1/N8A
	=
X-Google-Smtp-Source: AGHT+IGoJ+nXxrc4xn4OLCyFZoneJLsZ5RDVTEQBHNHzaHJDleLnpGYlePwjSMlxXtr81hwFXstrew==
X-Received: by 2002:a5d:5e0b:0:b0:37d:3b31:7a9d with SMTP id ffacd0b85a97d-381f0f7f221mr10928590f8f.23.1731416444365;
        Tue, 12 Nov 2024 05:00:44 -0800 (PST)
Message-ID: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
Date: Tue, 12 Nov 2024 14:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.19.1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
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

the release is due by the end of the month. Please point out backports you find
missing from the respective staging branch, but which you consider relevant.

Advance notice: 4.18.4 ought to follow about two weeks later.

Jan

