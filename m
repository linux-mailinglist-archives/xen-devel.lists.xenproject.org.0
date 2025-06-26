Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E526AEA26B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026683.1401874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoTi-0007ld-7A; Thu, 26 Jun 2025 15:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026683.1401874; Thu, 26 Jun 2025 15:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoTi-0007jC-4Q; Thu, 26 Jun 2025 15:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1026683;
 Thu, 26 Jun 2025 15:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUoTg-0007j6-3y
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:25:28 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a7e827-52a1-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 17:25:26 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so636857f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 08:25:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23abe442a40sm589525ad.249.2025.06.26.08.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 08:25:24 -0700 (PDT)
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
X-Inumbo-ID: c8a7e827-52a1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750951525; x=1751556325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YKQ6Gh73dlwtNUwQq11DNaPFzHPmUBkXRAJ2x86egh8=;
        b=U4HvG/R+oe+WSEJTO6eSsTedOz6jTf4R0vvMkzz8hDrjhRPqQw0YC2NliAFfMmld1p
         ND7hMzC9LQ6CdYtqUOQlHy83JEs5cuEo/LkAt2jpGWzfjVgrznaXW+JT5qZ8/Y1BR1Mp
         0hHUHvpP5LupelMNK5VaLPF7eitlCI2RmlIJbq4d+YU/dbfYkLaVJMZfaUqp7HFr7MOK
         TLAK2/9n1gd9yONgE9i3FY40CWwBy+YcZKOtLXglpvqS3rXC5OPEP7hcqTpfbauGMw3Z
         ulnpYPO7+AIAf4eY0rZ4QXowFF7jbHNi9or/x/lu/JWCnzuvqcigbZ7m2ylGrcSCPiM2
         3Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951525; x=1751556325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKQ6Gh73dlwtNUwQq11DNaPFzHPmUBkXRAJ2x86egh8=;
        b=MAfsOcZFyCFJoIP/tKj6urAVXol+BZ87hD9/3GXYxCWv9NZLXp/+Wg4fWcLhFzMjMw
         137JYUj14xXapeO3yGEE1bk3JB5BJpJ+H6TTo9MfyYG3m1LvQ6xFDxudzu6s4StfSx21
         aEniIr5ml3f+ZNRLcwdUlzz7YaQeOOKZLcxo8ub4lDqC2jicQL2ofnEP9G6/8i/bd+pg
         J9wUpXcqwnks3P5Q9aJ4lxJC6Sn+pMiIDQWqW1bez6vJ2x+hHQXIb93wNv5pTuYz4UZI
         45cxer+HD5hJ5jUFJjyrAiAOHmHKtQp0qVEi1lYiu/zaU5VjWBQ94b/heV5/bjQpdpSZ
         u8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVNkHW5fak3Ok1HobqDLStMd1ZKsm4vDEpvw7GP6IbLN1H0Gr8x213om/keXxw8QPMgkGw0GhKC3Pk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF5kSzrIGF5TvX02KRVA9zuGv7EgjuPfosfcDuTlJzbUDlSvbN
	LzlWAwHsVXK5j4tCZmdkYygODB42lHXa4uEYvMcMWldOVBxju8Z+QJzjCKzrPr3wGQ==
X-Gm-Gg: ASbGncsJQJWO0KW2V3t4BHdJx7f2mL/bVHy7NqApq2ligqv313v+YoEHgNrQ5NXDV0a
	ry/wdoTViqTogCWaNw3dZDJTcxpwU5WmrLy550saRIjd9x7c6/HeEegkEHTPeFjt8HHDLoihvKs
	rxopGHa3CXQePUqsUBckezr9VyoX/iJrFK3bw8sucbFNruff4GT/YnlFKkwJ2o+rPL7z9oF19nk
	YxyYFZdwWxcC9fECLtJJv/nI4SChjzkkii2ogpxg3x661lQYm0790mOYLkAj2PGtWI/AFKdG2rz
	T5kfgiPWEJIoJ4ZJ+q5JpWm0cF20fm1whtu7nbznQAxkcxhqL5MGnXDPGLsiDeRnmxpiTIkQQRU
	JYtZ9JFp66h6qxUr5KqxC5Fp3KKZ96rq8MSOdJj8XnQKCEhc=
X-Google-Smtp-Source: AGHT+IE4ND3cyfwCJChr6Hn/EHoH7uuBTyxSHJur+XkAcZrgadTv3YoZ0NbX/1Rpqdow7+QL5py0Vg==
X-Received: by 2002:a5d:5f55:0:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a6ed65ce01mr5745113f8f.49.1750951525285;
        Thu, 26 Jun 2025 08:25:25 -0700 (PDT)
Message-ID: <99ccbf92-2673-4b09-a6fe-4cf5d2f7cbda@suse.com>
Date: Thu, 26 Jun 2025 17:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Config: update Mini-OS commit id
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250626151344.6971-1-jgross@suse.com>
 <20250626151344.6971-3-jgross@suse.com>
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
In-Reply-To: <20250626151344.6971-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 17:13, Juergen Gross wrote:
> Use the newest Mini-OS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


