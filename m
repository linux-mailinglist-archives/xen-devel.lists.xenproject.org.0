Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03731915ECE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747205.1154547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzWe-00075P-MV; Tue, 25 Jun 2024 06:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747205.1154547; Tue, 25 Jun 2024 06:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzWe-00073v-JP; Tue, 25 Jun 2024 06:19:32 +0000
Received: by outflank-mailman (input) for mailman id 747205;
 Tue, 25 Jun 2024 06:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLzWd-00073p-Ac
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:19:31 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0f28c03-32ba-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 08:19:29 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so55613791fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 23:19:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f02cdsm73133085ad.4.2024.06.24.23.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:19:28 -0700 (PDT)
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
X-Inumbo-ID: e0f28c03-32ba-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719296368; x=1719901168; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a+U644J+OlsI2Sj/9Id2DhqJCpOpqmaT7Dfv7XoFEVo=;
        b=VcnV9NlSeSQe0uTznzgck0ilzRy/XBmzmgwkSp8NNXvGTnKrP5awutCtNGUh3ZIT7+
         uAY0eiv9VVqZgTFms28TYJfxCVBzMd7BF/Bkq4CpW6WA8fkvDq9u3HCIwWDgGYsP64PJ
         ncTCFrFguh86xTEmPgkNq/bezn5jvbVPxypC5yBKkE1gcPuixpJn+A+pADsUCVj4ZreA
         Bl1fgda4RC9Dw/3wPJ17RNKehlb6K+xpacXgkEEsuqqd8P1D4COnPgpg/+nqW1zmuwyX
         kL1coGa4ba2f2PQcIeoLv0WcnTjMeDdzQbc0AXQHFqbPnfJthWfsJj8Btn9kFOlAs3G+
         XmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719296368; x=1719901168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+U644J+OlsI2Sj/9Id2DhqJCpOpqmaT7Dfv7XoFEVo=;
        b=PhLe7wnQ0QNGJi8ap4gb7Ln7PX22YGHXjKXt26wYPq+IvGojKkClfcYKqxnnuHhc1r
         O1YDDCDJ57bRGTeZ7k22PsVc3i8MHz7tud3vbQc9Lj/NdL9yrIfac2rka+z2vb05NK9q
         Pr5NhyLj8SqFB2wA0j51RungAp4KvIhDySyDZWmDnWe67kueVNhzwkBaU97pf0nHc/Iv
         G77JPk19qBmm7bsZp63dbfeDTKDfa7RhQcSHNmqRn5tzb59TDjxVSBecBDafs4mCPDw8
         f2Q70svrEguj61+Sx77nFJgaIM1zTLAW6v96J2lIYvW1SdCngiqOYlDsJmx4p5eNDv0G
         zdiw==
X-Gm-Message-State: AOJu0YyMgkfzjBPlR8+k2F7i9WqdNbESXLw5SMhGJmGEwH/roNobyvkd
	c5ZxX32mUuo2b4Pb17FdHA9FwUYNVmh2ziqx7Tp59XB4bVj8zX361wL5i7VyYQ==
X-Google-Smtp-Source: AGHT+IGKzcj2ZDoELShQ4lJBfuCotbrFbJ78g2WrODw6jBO7EHOI461qEFAac6+lJKAvP9xpn83cgw==
X-Received: by 2002:a2e:98c8:0:b0:2ec:5abf:f3ae with SMTP id 38308e7fff4ca-2ec5b338aa1mr36758931fa.19.1719296368565;
        Mon, 24 Jun 2024 23:19:28 -0700 (PDT)
Message-ID: <f402157c-0dc2-4e30-820f-ecd319e9ce86@suse.com>
Date: Tue, 25 Jun 2024 08:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] MAINTAINERS: Update my email address again
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksii <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20240624094030.41692-1-anthony.perard@vates.tech>
 <alpine.DEB.2.22.394.2406240927390.3870429@ubuntu-linux-20-04-desktop>
 <5238d3a6-c47f-4951-b839-a92c5ee4e571@xen.org>
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
In-Reply-To: <5238d3a6-c47f-4951-b839-a92c5ee4e571@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 23:40, Julien Grall wrote:
> On 24/06/2024 17:27, Stefano Stabellini wrote:
>> On Mon, 24 Jun 2024, Anthony PERARD wrote:
>>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I guess this technically need an ack from the release manager. So CC 
> Oleksii.

Hmm, that's on the edge, I think. Imo an ack shouldn't be needed here,
as requiring one would mean that it could also be refused. Yet such
updates would better go in quickly, so people use up-to-date information.
I'm sure committers would apply common sense as to avoiding to commit at
truly "critical" times; typically at such time a commit moratorium is in
place anyway.

Jan

