Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27479320F6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759340.1169021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcIQ-0007Xx-0I; Tue, 16 Jul 2024 07:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759340.1169021; Tue, 16 Jul 2024 07:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcIP-0007VM-TL; Tue, 16 Jul 2024 07:08:21 +0000
Received: by outflank-mailman (input) for mailman id 759340;
 Tue, 16 Jul 2024 07:08:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTcIO-0007VG-O6
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:08:20 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e411d77-4342-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 09:08:19 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so58742851fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 00:08:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc273efsm51648805ad.170.2024.07.16.00.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 00:08:18 -0700 (PDT)
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
X-Inumbo-ID: 2e411d77-4342-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721113699; x=1721718499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UNEwdLA1S9/fi0MPSf5MVNLCfZ/A4FeSjCwn4TKGNtU=;
        b=cjaiWGerA52vXPnflUAcJYro6azhtWBnhS0r9FY2AMGPM+nGkTloX9i9qfaGBKkDZy
         8oV/Io7GY9Rw6OvBB6rm4bSHIGXxF/xa/Cj+misQYnl/aIH/uqdwwFM8dkrT8S6FO2ns
         Xvpqf9Y6HYD7/3rxQtBr3ADQ2vB+YiWieLKLPV+v+dZ7dznVDnpqcqbM4Emr4URHaknq
         DIeu8x0GqOGQCzMIXC/3JTRVFwfhqk2p/01EcLC74bPvEcSUISgimgLHqvSAyGBPzrsR
         0HmMKo8ATRvpurNq52IvOR/fw4SP+4c+oxEvKToK0prnckRGngRP7fZ9mouRQmc3R9Yp
         F8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721113699; x=1721718499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNEwdLA1S9/fi0MPSf5MVNLCfZ/A4FeSjCwn4TKGNtU=;
        b=lUvsQ0IYdr5ZqnHz0iV6Y1dlRkAVLetOjQ+E3xgRfhfIsnowxnQmsMgMCnEc5XUj5S
         g04646FfVw64SvQ93nA4E/o1lCW0QlS2uPPK9LtXbr7mTaJlhAIYmhLUpj+rYlJXS35m
         uwH5jpqJ3KIWw0qUiGnwiZjJguW21SVab47dVyOMc3ZItMasgaWgOPWnUTzEfIFtdNoP
         4g/xZsbJq+nXh8riIt7URsOP+FI2G5Acg6WN8f0w4E7ABOqwRlHNn2b5YdsuKcNKJ+K9
         Vecu6yAnDnEcEJGw+kc8wVmwW3qyJ//MVx9TnqH78z9xPBBIb3TIBfoCVQa6SJnKIG48
         ezEw==
X-Forwarded-Encrypted: i=1; AJvYcCX+UwOrATA1nuIPOLzAbAk6jAY9xGzUyOUM+C0mKUd3q6RP70qmrQP9vyd4uipUDt5htJtBvdpSN7x8/7SNZMZLntMORIRR6bvXfG1e3FI=
X-Gm-Message-State: AOJu0Yx3xexJPUjqc2CgeImUiWAMRJEnCYhVAOgAKMq+njqIhHPnjsfh
	XUPpIVCodqqbAPAEzffAPziL3J6DUWRVKHJBrb0FnjwFv63WjGQGCn1+DqS0FA==
X-Google-Smtp-Source: AGHT+IH1Ebqk/WIl0+58L9MR5yLgNlqU0dMG5NcVH91mA3R5RaGAySBfgkinyb3BmPXN1ESYqENzHg==
X-Received: by 2002:a2e:9d85:0:b0:2ec:18e5:e68f with SMTP id 38308e7fff4ca-2eef41d8d0amr9000531fa.33.1721113699066;
        Tue, 16 Jul 2024 00:08:19 -0700 (PDT)
Message-ID: <5b3c9818-9ac5-49ae-9ae6-fb96a0410297@suse.com>
Date: Tue, 16 Jul 2024 09:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 5/9] x86/traps: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <d16e294e1cbd74001c1ca276023d13f66f4ec0d3.1721050709.git.federico.serafini@bugseng.com>
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
In-Reply-To: <d16e294e1cbd74001c1ca276023d13f66f4ec0d3.1721050709.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 18:48, Federico Serafini wrote:
> Add break or pseudo keyword fallthrough to address violations of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

And my A-b was lost? Please can you be more diligent in collecting tags,
helping committers?

Jan


